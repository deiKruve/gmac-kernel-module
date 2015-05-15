
//#include <stdint.h>
//#include "globals.h"
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/string.h>
#include <linux/slab.h>
#include <linux/delay.h>
#include <linux/device.h>
#include <linux/version.h>
#include <linux/hrtimer.h>

#include "ecrt.h"
#include "master.h"


/*****************************************************************************/

/** Set to 1 to enable external datagram injection debugging.
 */
#define DEBUG_INJECT 0

/** Always output corrupted frames.
 */
#define FORCE_OUTPUT_CORRUPTED 0



/**
   \file
   EtherCAT master methods.
*/

/*****************************************************************************/

/** List of intervals for statistics [s].
 */
const unsigned int rate_intervals[] = {
    1, 10, 60
};

/*****************************************************************************/


/*****************************************************************************/

/** Output master statistics.
 *
 * This function outputs statistical data on demand, but not more often than
 * necessary. The output happens at most once a second.
 */
void ec_master_output_stats(ec_master_t *master /**< EtherCAT master */)
{
    if (unlikely(jiffies - master->stats.output_jiffies >= HZ)) {
        master->stats.output_jiffies = jiffies;

        if (master->stats.timeouts) {
            EC_MASTER_WARN(master, "%u datagram%s TIMED OUT!\n",
                    master->stats.timeouts,
                    master->stats.timeouts == 1 ? "" : "s");
            master->stats.timeouts = 0;
        }
        if (master->stats.corrupted) {
            EC_MASTER_WARN(master, "%u frame%s CORRUPTED!\n",
                    master->stats.corrupted,
                    master->stats.corrupted == 1 ? "" : "s");
            master->stats.corrupted = 0;
        }
        if (master->stats.unmatched) {
            EC_MASTER_WARN(master, "%u datagram%s UNMATCHED!\n",
                    master->stats.unmatched,
                    master->stats.unmatched == 1 ? "" : "s");
            master->stats.unmatched = 0;
        }
    }
}

/*****************************************************************************/

/** Clears the common device statistics.
 */
void ec_master_clear_device_stats(
        ec_master_t *master /**< EtherCAT master */
        )
{
    unsigned int i;

    // zero frame statistics
    master->device_stats.tx_count = 0;
    master->device_stats.last_tx_count = 0;
    master->device_stats.rx_count = 0;
    master->device_stats.last_rx_count = 0;
    master->device_stats.tx_bytes = 0;
    master->device_stats.last_tx_bytes = 0;
    master->device_stats.rx_bytes = 0;
    master->device_stats.last_rx_bytes = 0;
    master->device_stats.last_loss = 0;

    for (i = 0; i < EC_RATE_COUNT; i++) {
        master->device_stats.tx_frame_rates[i] = 0;
        master->device_stats.tx_byte_rates[i] = 0;
        master->device_stats.loss_rates[i] = 0;
    }
}

/*****************************************************************************/

/** Updates the common device statistics.
 */
void ec_master_update_device_stats(
        ec_master_t *master /**< EtherCAT master */
        )
{
    ec_device_stats_t *s = &master->device_stats;
    s32 tx_frame_rate, rx_frame_rate, tx_byte_rate, rx_byte_rate, loss_rate;
    u64 loss;
    unsigned int i, dev_idx;

    // frame statistics
    if (likely(jiffies - s->jiffies < HZ)) {
        return;
    }

    tx_frame_rate = (s->tx_count - s->last_tx_count) * 1000;
    rx_frame_rate = (s->rx_count - s->last_rx_count) * 1000;
    tx_byte_rate = s->tx_bytes - s->last_tx_bytes;
    rx_byte_rate = s->rx_bytes - s->last_rx_bytes;
    loss = s->tx_count - s->rx_count;
    loss_rate = (loss - s->last_loss) * 1000;

    /* Low-pass filter:
     *      Y_n = y_(n - 1) + T / tau * (x - y_(n - 1))   | T = 1
     *   -> Y_n += (x - y_(n - 1)) / tau
     */
    for (i = 0; i < EC_RATE_COUNT; i++) {
        s32 n = rate_intervals[i];
        s->tx_frame_rates[i] += (tx_frame_rate - s->tx_frame_rates[i]) / n;
        s->rx_frame_rates[i] += (rx_frame_rate - s->rx_frame_rates[i]) / n;
        s->tx_byte_rates[i] += (tx_byte_rate - s->tx_byte_rates[i]) / n;
        s->rx_byte_rates[i] += (rx_byte_rate - s->rx_byte_rates[i]) / n;
        s->loss_rates[i] += (loss_rate - s->loss_rates[i]) / n;
    }

    s->last_tx_count = s->tx_count;
    s->last_rx_count = s->rx_count;
    s->last_tx_bytes = s->tx_bytes;
    s->last_rx_bytes = s->rx_bytes;
    s->last_loss = loss;

    for (dev_idx = EC_DEVICE_MAIN; dev_idx < ec_master_num_devices(master);
            dev_idx++) {
        ec_device_update_stats(&master->devices[dev_idx]);
    }

    s->jiffies = jiffies;
}

/*****************************************************************************/

#ifdef EC_USE_HRTIMER

/*
 * Sleep related functions:
 */
static enum hrtimer_restart ec_master_nanosleep_wakeup(struct hrtimer *timer)
{
    struct hrtimer_sleeper *t =
        container_of(timer, struct hrtimer_sleeper, timer);
    struct task_struct *task = t->task;

    t->task = NULL;
    if (task)
        wake_up_process(task);

    return HRTIMER_NORESTART;
}

/*****************************************************************************/

#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,28)

/* compatibility with new hrtimer interface */
static inline ktime_t hrtimer_get_expires(const struct hrtimer *timer)
{
    return timer->expires;
}

/*****************************************************************************/

static inline void hrtimer_set_expires(struct hrtimer *timer, ktime_t time)
{
    timer->expires = time;
}

#endif

/*****************************************************************************/

void ec_master_nanosleep(const unsigned long nsecs)
{
    struct hrtimer_sleeper t;
    enum hrtimer_mode mode = HRTIMER_MODE_REL;

    hrtimer_init(&t.timer, CLOCK_MONOTONIC, mode);
    t.timer.function = ec_master_nanosleep_wakeup;
    t.task = current;
#ifdef CONFIG_HIGH_RES_TIMERS
#if LINUX_VERSION_CODE <= KERNEL_VERSION(2, 6, 24)
    t.timer.cb_mode = HRTIMER_CB_IRQSAFE_NO_RESTART;
#elif LINUX_VERSION_CODE <= KERNEL_VERSION(2, 6, 26)
    t.timer.cb_mode = HRTIMER_CB_IRQSAFE_NO_SOFTIRQ;
#elif LINUX_VERSION_CODE <= KERNEL_VERSION(2, 6, 28)
    t.timer.cb_mode = HRTIMER_CB_IRQSAFE_UNLOCKED;
#endif
#endif
    hrtimer_set_expires(&t.timer, ktime_set(0, nsecs));

    do {
        set_current_state(TASK_INTERRUPTIBLE);
        hrtimer_start(&t.timer, hrtimer_get_expires(&t.timer), mode);

        if (likely(t.task))
            schedule();

        hrtimer_cancel(&t.timer);
        mode = HRTIMER_MODE_ABS;

    } while (t.task && !signal_pending(current));
}

#endif // EC_USE_HRTIMER

/*****************************************************************************/
/*****************************************************************************/


// static funtions
void ec_master_init_static(void)
{ ;
}

// master creation/deletion
int ec_master_init(ec_master_t *master, /**< EtherCAT master */
        unsigned int index, /**< master index */
        const uint8_t *main_mac, /**< MAC address of main device */
        const uint8_t *backup_mac, /**< MAC address of backup device */
        dev_t device_number, /**< Character device number. */
        struct class *class, /**< Device class. */
        unsigned int debug_level /**< Debug level (module parameter). */
        )
{
  return 1;
}

void ec_master_clear(
        ec_master_t *master /**< EtherCAT master */
        )
{ ;
}

// phase transitions
int ec_master_enter_idle_phase(
        ec_master_t *master /**< EtherCAT master */
        )
{
  return 1;
}

void ec_master_leave_idle_phase(
        ec_master_t *master /**< EtherCAT master */
        )
{
}

int ec_master_enter_operation_phase(
        ec_master_t *master /**< EtherCAT master */
        )
{
  return 1;
}


void ec_master_leave_operation_phase(
        ec_master_t *master /**< EtherCAT master */
        )
{
}



// datagram IO
/*****************************************************************************/

/** Processes a received frame.
 *
 * This function is called by the network driver for every received frame.
 *
 * \return 0 in case of success, else < 0
 */
void ec_master_receive_datagrams(
        ec_master_t *master, /**< EtherCAT master */
        ec_device_t *device, /**< EtherCAT device */
        const uint8_t *frame_data, /**< frame data */
        size_t size /**< size of the received data */
        )
{
    size_t frame_size, data_size;
    uint8_t datagram_type, datagram_index;
    unsigned int cmd_follows, matched;
    const uint8_t *cur_data;
  
    if (unlikely(size < EC_FRAME_HEADER_SIZE)) {
        if (master->debug_level || FORCE_OUTPUT_CORRUPTED) {
            EC_MASTER_DBG(master, 0, "Corrupted frame received"
                    " on %s (size %zu < %u byte):\n",
                    device->dev->name, size, EC_FRAME_HEADER_SIZE);
            ec_print_data(frame_data, size);
        }
        master->stats.corrupted++;
#ifdef EC_RT_SYSLOG
        ec_master_output_stats(master);
#endif
        return;
    }

    cur_data = frame_data;

    // check length of entire frame
    frame_size = EC_READ_U16(cur_data) & 0x07FF;
    cur_data += EC_FRAME_HEADER_SIZE;

}

//jdk
/* void ec_master_queue_datagram( */
/*         ec_master_t *master, /\**< EtherCAT master *\/ */
/*         ec_datagram_t *datagram /\**< datagram *\/ */
/*         ) */
/* { */
/* } */


/* void ec_master_queue_datagram_ext( */
/*         ec_master_t *master, /\**< EtherCAT master *\/ */
/*         ec_datagram_t *datagram /\**< datagram *\/ */
/*         ) */
/* { */
/* } */



// misc.

/*****************************************************************************/

/** Sets the expected interval between calls to ecrt_master_send
 * and calculates the maximum amount of data to queue.
 */
void ec_master_set_send_interval(
        ec_master_t *master, /**< EtherCAT master */
        unsigned int send_interval /**< Send interval */
        )
{
    master->send_interval = send_interval;
    master->max_queue_size =
        (send_interval * 1000) / EC_BYTE_TRANSMISSION_TIME_NS;
    master->max_queue_size -= master->max_queue_size / 10;
}


/*****************************************************************************/

/** Set the debug level.
 *
 * \retval       0 Success.
 * \retval -EINVAL Invalid debug level.
 */
int ec_master_debug_level(
        ec_master_t *master, /**< EtherCAT master. */
        unsigned int level /**< Debug level. May be 0, 1 or 2. */
        )
{
    if (level > 2) {
        EC_MASTER_ERR(master, "Invalid debug level %u!\n", level);
        return -EINVAL;
    }

    if (level != master->debug_level) {
        master->debug_level = level;
        EC_MASTER_INFO(master, "Master debug level set to %u.\n",
                master->debug_level);
    }

    return 0;
}

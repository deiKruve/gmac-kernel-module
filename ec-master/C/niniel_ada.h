
#ifndef __NINIEL_ADA_H__
#define __NINIEL_ADA_H__

extern const unsigned int rate_intervals[EC_RATE_COUNT]; // see master.ads

extern void adainit (void);
extern void niniel_init(void);
extern void niniel_exit(void);

// static funtions
extern void ec_master_init_static(void);

// master creation/deletion
extern int ec_master_init(ec_master_t *, unsigned int, const uint8_t *,
        const uint8_t *, dev_t, struct class *, unsigned int);
extern void ec_master_clear(ec_master_t *);

// phase transitions
extern int ec_master_enter_idle_phase (ec_master_t *);
extern void ec_master_leave_idle_phase (ec_master_t *);
extern int ec_master_enter_operation_phase(ec_master_t *);
extern void ec_master_leave_operation_phase(ec_master_t *);

// datagram IO
extern void ec_master_receive_datagrams(ec_master_t *, ec_device_t *,
        const uint8_t *, size_t);

// io control
extern long ec_ioctl(ec_master_t *, ec_ioctl_context_t *, unsigned int,
        void __user *);

#endif

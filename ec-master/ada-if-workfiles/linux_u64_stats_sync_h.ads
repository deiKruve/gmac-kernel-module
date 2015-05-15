pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package linux_u64_stats_sync_h is

   --  arg-macro: procedure u64_stats_init do { } while (0)
   --    do { } while (0)
  -- * To properly implement 64bits network statistics on 32bit and 64bit hosts,
  -- * we provide a synchronization point, that is a noop on 64bit or UP kernels.
  -- *
  -- * Key points :
  -- * 1) Use a seqcount on SMP 32bits, with low overhead.
  -- * 2) Whole thing is a noop on 64bit arches or UP kernels.
  -- * 3) Write side must ensure mutual exclusion or one seqcount update could
  -- *    be lost, thus blocking readers forever.
  -- *    If this synchronization point is not a mutex, but a spinlock or
  -- *    spinlock_bh() or disable_bh() :
  -- * 3.1) Write side should not sleep.
  -- * 3.2) Write side should not allow preemption.
  -- * 3.3) If applicable, interrupts should be disabled.
  -- *
  -- * 4) If reader fetches several counters, there is no guarantee the whole values
  -- *    are consistent (remember point 1) : this is a noop on 64bit arches anyway)
  -- *
  -- * 5) readers are allowed to sleep or be preempted/interrupted : They perform
  -- *    pure reads. But if they have to fetch many values, it's better to not allow
  -- *    preemptions/interruptions to avoid many retries.
  -- *
  -- * 6) If counter might be written by an interrupt, readers should block interrupts.
  -- *    (On UP, there is no seqcount_t protection, a reader allowing interrupts could
  -- *     read partial values)
  -- *
  -- * 7) For irq and softirq uses, readers can use u64_stats_fetch_begin_irq() and
  -- *    u64_stats_fetch_retry_irq() helpers
  -- *
  -- * Usage :
  -- *
  -- * Stats producer (writer) should use following template granted it already got
  -- * an exclusive access to counters (a lock is already taken, or per cpu
  -- * data is used [in a non preemptable context])
  -- *
  -- *   spin_lock_bh(...) or other synchronization to get exclusive access
  -- *   ...
  -- *   u64_stats_update_begin(&stats->syncp);
  -- *   stats->bytes64 += len; // non atomic operation
  -- *   stats->packets64++;    // non atomic operation
  -- *   u64_stats_update_end(&stats->syncp);
  -- *
  -- * While a consumer (reader) should use following template to get consistent
  -- * snapshot for each variable (but no guarantee on several ones)
  -- *
  -- * u64 tbytes, tpackets;
  -- * unsigned int start;
  -- *
  -- * do {
  -- *         start = u64_stats_fetch_begin(&stats->syncp);
  -- *         tbytes = stats->bytes64; // non atomic operation
  -- *         tpackets = stats->packets64; // non atomic operation
  -- * } while (u64_stats_fetch_retry(&stats->syncp, start));
  -- *
  -- *
  -- * Example of use in drivers/net/loopback.c, using per_cpu containers,
  -- * in BH disabled context.
  --  

   type u64_stats_sync is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, u64_stats_sync);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/u64_stats_sync.h:64

   procedure u64_stats_update_begin (syncp : access u64_stats_sync);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/u64_stats_sync.h:77
   pragma Import (CPP, u64_stats_update_begin, "_ZL22u64_stats_update_beginP14u64_stats_sync");

   procedure u64_stats_update_end (syncp : access u64_stats_sync);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/u64_stats_sync.h:84
   pragma Import (CPP, u64_stats_update_end, "_ZL20u64_stats_update_endP14u64_stats_sync");

   function u64_stats_fetch_begin (syncp : access constant u64_stats_sync) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/u64_stats_sync.h:91
   pragma Import (CPP, u64_stats_fetch_begin, "_ZL21u64_stats_fetch_beginPK14u64_stats_sync");

   function u64_stats_fetch_retry (syncp : access constant u64_stats_sync; start : unsigned) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/u64_stats_sync.h:103
   pragma Import (CPP, u64_stats_fetch_retry, "_ZL21u64_stats_fetch_retryPK14u64_stats_syncj");

  -- * In case irq handlers can update u64 counters, readers can use following helpers
  -- * - SMP 32bit arches use seqcount protection, irq safe.
  -- * - UP 32bit must disable irqs.
  -- * - 64bit have no problem atomically reading u64 values, irq safe.
  --  

   function u64_stats_fetch_begin_irq (syncp : access constant u64_stats_sync) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/u64_stats_sync.h:122
   pragma Import (CPP, u64_stats_fetch_begin_irq, "_ZL25u64_stats_fetch_begin_irqPK14u64_stats_sync");

   function u64_stats_fetch_retry_irq (syncp : access constant u64_stats_sync; start : unsigned) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/u64_stats_sync.h:134
   pragma Import (CPP, u64_stats_fetch_retry_irq, "_ZL25u64_stats_fetch_retry_irqPK14u64_stats_syncj");

end linux_u64_stats_sync_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_spinlock_types_h;

package linux_seqlock_h is

   --  arg-macro: procedure seqcount_init __seqcount_init(s, NULL, NULL)
   --    __seqcount_init(s, NULL, NULL)
   --  arg-macro: procedure SEQCNT_ZERO { .sequence := 0, SEQCOUNT_DEP_MAP_INIT(lockname)}
   --    { .sequence := 0, SEQCOUNT_DEP_MAP_INIT(lockname)}
   --  arg-macro: procedure seqlock_init do { seqcount_init(and(x).seqcount); spin_lock_init(and(x).lock); } while (0)
   --    do { seqcount_init(and(x).seqcount); spin_lock_init(and(x).lock); } while (0)
   --  arg-macro: procedure DEFINE_SEQLOCK seqlock_t x := __SEQLOCK_UNLOCKED(x)
   --    seqlock_t x := __SEQLOCK_UNLOCKED(x)
   --  arg-macro: procedure write_seqlock_irqsave do { flags := __write_seqlock_irqsave(lock); } while (0)
   --    do { flags := __write_seqlock_irqsave(lock); } while (0)
   --  arg-macro: procedure read_seqlock_excl_irqsave do { flags := __read_seqlock_excl_irqsave(lock); } while (0)
   --    do { flags := __read_seqlock_excl_irqsave(lock); } while (0)
  -- * Reader/writer consistent mechanism without starving writers. This type of
  -- * lock for data where the reader wants a consistent set of information
  -- * and is willing to retry if the information changes. There are two types
  -- * of readers:
  -- * 1. Sequence readers which never block a writer but they may have to retry
  -- *    if a writer is in progress by detecting change in sequence number.
  -- *    Writers do not wait for a sequence reader.
  -- * 2. Locking readers which will wait if a writer or another locking reader
  -- *    is in progress. A locking reader in progress will also block a writer
  -- *    from going forward. Unlike the regular rwlock, the read lock here is
  -- *    exclusive so that only one locking reader can get it.
  -- *
  -- * This is not as cache friendly as brlock. Also, this may not work well
  -- * for data that contains pointers, because any writer could
  -- * invalidate a pointer that a reader was following.
  -- *
  -- * Expected non-blocking reader usage:
  -- * 	do {
  -- *	    seq = read_seqbegin(&foo);
  -- * 	...
  -- *      } while (read_seqretry(&foo, seq));
  -- *
  -- *
  -- * On non-SMP the spin locks disappear but the writer still needs
  -- * to increment the sequence variables because an interrupt routine could
  -- * change the state of the data.
  -- *
  -- * Based on x86_64 vsyscall gettimeofday 
  -- * by Keith Owens and Andrea Arcangeli
  --  

  -- * Version using sequence counter only.
  -- * This can be used when code has its own mutex protecting the
  -- * updating starting before the write_seqcountbeqin() and ending
  -- * after the write_seqcount_end().
  --  

   type seqcount is record
      sequence : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:47
   end record;
   pragma Convention (C_Pass_By_Copy, seqcount);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:46

   subtype seqcount_t is seqcount;

   --  skipped func __seqcount_init

  --	 * Make sure we are not reinitializing a held lock:
  --	  

  --*
  -- * __read_seqcount_begin - begin a seq-read critical section (without barrier)
  -- * @s: pointer to seqcount_t
  -- * Returns: count to be passed to read_seqcount_retry
  -- *
  -- * __read_seqcount_begin is like read_seqcount_begin, but has no smp_rmb()
  -- * barrier. Callers should ensure that smp_rmb() or equivalent ordering is
  -- * provided before actually loading any of the variables that are to be
  -- * protected in this critical section.
  -- *
  -- * Use carefully, only in critical code, and comment how the barrier is
  -- * provided.
  --  

   --  skipped func __read_seqcount_begin

  --*
  -- * raw_read_seqcount_begin - start seq-read critical section w/o lockdep
  -- * @s: pointer to seqcount_t
  -- * Returns: count to be passed to read_seqcount_retry
  -- *
  -- * raw_read_seqcount_begin opens a read critical section of the given
  -- * seqcount, but without any lockdep checking. Validity of the critical
  -- * section is tested by checking read_seqcount_retry function.
  --  

   function raw_read_seqcount_begin (s : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:128
   pragma Import (CPP, raw_read_seqcount_begin, "_ZL23raw_read_seqcount_beginPK8seqcount");

  --*
  -- * read_seqcount_begin - begin a seq-read critical section
  -- * @s: pointer to seqcount_t
  -- * Returns: count to be passed to read_seqcount_retry
  -- *
  -- * read_seqcount_begin opens a read critical section of the given seqcount.
  -- * Validity of the critical section is tested by checking read_seqcount_retry
  -- * function.
  --  

   function read_seqcount_begin (s : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:144
   pragma Import (CPP, read_seqcount_begin, "_ZL19read_seqcount_beginPK8seqcount");

  --*
  -- * raw_seqcount_begin - begin a seq-read critical section
  -- * @s: pointer to seqcount_t
  -- * Returns: count to be passed to read_seqcount_retry
  -- *
  -- * raw_seqcount_begin opens a read critical section of the given seqcount.
  -- * Validity of the critical section is tested by checking read_seqcount_retry
  -- * function.
  -- *
  -- * Unlike read_seqcount_begin(), this function will not wait for the count
  -- * to stabilize. If a writer is active when we begin, we will fail the
  -- * read_seqcount_retry() instead of stabilizing at the beginning of the
  -- * critical section.
  --  

   function raw_seqcount_begin (s : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:164
   pragma Import (CPP, raw_seqcount_begin, "_ZL18raw_seqcount_beginPK8seqcount");

  --*
  -- * __read_seqcount_retry - end a seq-read critical section (without barrier)
  -- * @s: pointer to seqcount_t
  -- * @start: count, from read_seqcount_begin
  -- * Returns: 1 if retry is required, else 0
  -- *
  -- * __read_seqcount_retry is like read_seqcount_retry, but has no smp_rmb()
  -- * barrier. Callers should ensure that smp_rmb() or equivalent ordering is
  -- * provided before actually loading any of the variables that are to be
  -- * protected in this critical section.
  -- *
  -- * Use carefully, only in critical code, and comment how the barrier is
  -- * provided.
  --  

   --  skipped func __read_seqcount_retry

  --*
  -- * read_seqcount_retry - end a seq-read critical section
  -- * @s: pointer to seqcount_t
  -- * @start: count, from read_seqcount_begin
  -- * Returns: 1 if retry is required, else 0
  -- *
  -- * read_seqcount_retry closes a read critical section of the given seqcount.
  -- * If the critical section was invalid, it must be ignored (and typically
  -- * retried).
  --  

   function read_seqcount_retry (s : System.Address; start : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:200
   pragma Import (CPP, read_seqcount_retry, "_ZL19read_seqcount_retryPK8seqcountj");

   procedure raw_write_seqcount_begin (s : access seqcount_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:208
   pragma Import (CPP, raw_write_seqcount_begin, "_ZL24raw_write_seqcount_beginP8seqcount");

   procedure raw_write_seqcount_end (s : access seqcount_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:214
   pragma Import (CPP, raw_write_seqcount_end, "_ZL22raw_write_seqcount_endP8seqcount");

  -- * Sequence counter only version assumes that callers are using their
  -- * own mutexing.
  --  

   procedure write_seqcount_begin_nested (s : access seqcount_t; subclass : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:224
   pragma Import (CPP, write_seqcount_begin_nested, "_ZL27write_seqcount_begin_nestedP8seqcounti");

   procedure write_seqcount_begin (s : access seqcount_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:230
   pragma Import (CPP, write_seqcount_begin, "_ZL20write_seqcount_beginP8seqcount");

   procedure write_seqcount_end (s : access seqcount_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:235
   pragma Import (CPP, write_seqcount_end, "_ZL18write_seqcount_endP8seqcount");

  --*
  -- * write_seqcount_barrier - invalidate in-progress read-side seq operations
  -- * @s: pointer to seqcount_t
  -- *
  -- * After write_seqcount_barrier, no read-side seq operations will complete
  -- * successfully and see data older than this.
  --  

   procedure write_seqcount_barrier (s : access seqcount_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:248
   pragma Import (CPP, write_seqcount_barrier, "_ZL22write_seqcount_barrierP8seqcount");

   type seqlock_t is record
      the_seqcount : aliased seqcount;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:255
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:256
   end record;
   pragma Convention (C_Pass_By_Copy, seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:257

   --  skipped anonymous struct anon_37

  -- * These macros triggered gcc-3.x compile-time problems.  We think these are
  -- * OK now.  Be cautious.
  --  

  -- * Read side functions for starting and finalizing a read side section.
  --  

   function read_seqbegin (sl : access constant seqlock_t) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:281
   pragma Import (CPP, read_seqbegin, "_ZL13read_seqbeginPK9seqlock_t");

   function read_seqretry (sl : access constant seqlock_t; start : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:286
   pragma Import (CPP, read_seqretry, "_ZL13read_seqretryPK9seqlock_tj");

  -- * Lock out other writers and update the count.
  -- * Acts like a normal spin_lock/unlock.
  -- * Don't need preempt_disable() because that is in the spin_lock already.
  --  

   procedure write_seqlock (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:296
   pragma Import (CPP, write_seqlock, "_ZL13write_seqlockP9seqlock_t");

   procedure write_sequnlock (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:302
   pragma Import (CPP, write_sequnlock, "_ZL15write_sequnlockP9seqlock_t");

   procedure write_seqlock_bh (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:308
   pragma Import (CPP, write_seqlock_bh, "_ZL16write_seqlock_bhP9seqlock_t");

   procedure write_sequnlock_bh (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:314
   pragma Import (CPP, write_sequnlock_bh, "_ZL18write_sequnlock_bhP9seqlock_t");

   procedure write_seqlock_irq (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:320
   pragma Import (CPP, write_seqlock_irq, "_ZL17write_seqlock_irqP9seqlock_t");

   procedure write_sequnlock_irq (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:326
   pragma Import (CPP, write_sequnlock_irq, "_ZL19write_sequnlock_irqP9seqlock_t");

   --  skipped func __write_seqlock_irqsave

   procedure write_sequnlock_irqrestore (sl : access seqlock_t; flags : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:345
   pragma Import (CPP, write_sequnlock_irqrestore, "_ZL26write_sequnlock_irqrestoreP9seqlock_tm");

  -- * A locking reader exclusively locks out other writers and locking readers,
  -- * but doesn't update the sequence number. Acts like a normal spin_lock/unlock.
  -- * Don't need preempt_disable() because that is in the spin_lock already.
  --  

   procedure read_seqlock_excl (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:356
   pragma Import (CPP, read_seqlock_excl, "_ZL17read_seqlock_exclP9seqlock_t");

   procedure read_sequnlock_excl (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:361
   pragma Import (CPP, read_sequnlock_excl, "_ZL19read_sequnlock_exclP9seqlock_t");

  --*
  -- * read_seqbegin_or_lock - begin a sequence number check or locking block
  -- * @lock: sequence lock
  -- * @seq : sequence number to be checked
  -- *
  -- * First try it once optimistically without taking the lock. If that fails,
  -- * take the lock. The sequence number is also used as a marker for deciding
  -- * whether to be a reader (even) or writer (odd).
  -- * N.B. seq must be initialized to an even number to begin with.
  --  

   procedure read_seqbegin_or_lock (lock : access seqlock_t; seq : access int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:376
   pragma Import (CPP, read_seqbegin_or_lock, "_ZL21read_seqbegin_or_lockP9seqlock_tPi");

  -- Even  
  -- Odd  
   function need_seqretry (lock : access seqlock_t; seq : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:384
   pragma Import (CPP, need_seqretry, "_ZL13need_seqretryP9seqlock_ti");

   procedure done_seqretry (lock : access seqlock_t; seq : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:389
   pragma Import (CPP, done_seqretry, "_ZL13done_seqretryP9seqlock_ti");

   procedure read_seqlock_excl_bh (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:395
   pragma Import (CPP, read_seqlock_excl_bh, "_ZL20read_seqlock_excl_bhP9seqlock_t");

   procedure read_sequnlock_excl_bh (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:400
   pragma Import (CPP, read_sequnlock_excl_bh, "_ZL22read_sequnlock_excl_bhP9seqlock_t");

   procedure read_seqlock_excl_irq (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:405
   pragma Import (CPP, read_seqlock_excl_irq, "_ZL21read_seqlock_excl_irqP9seqlock_t");

   procedure read_sequnlock_excl_irq (sl : access seqlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:410
   pragma Import (CPP, read_sequnlock_excl_irq, "_ZL23read_sequnlock_excl_irqP9seqlock_t");

   --  skipped func __read_seqlock_excl_irqsave

   procedure read_sequnlock_excl_irqrestore (sl : access seqlock_t; flags : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seqlock.h:427
   pragma Import (CPP, read_sequnlock_excl_irqrestore, "_ZL30read_sequnlock_excl_irqrestoreP9seqlock_tm");

end linux_seqlock_h;

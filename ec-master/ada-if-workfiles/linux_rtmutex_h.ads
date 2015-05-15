pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_spinlock_types_h;
with linux_rbtree_h;
limited with linux_sched_h;
with System;
limited with linux_hrtimer_h;

package linux_rtmutex_h is

   --  arg-macro: procedure rt_mutex_debug_check_no_locks_held do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure rt_mutex_init __rt_mutex_init(mutex, NULL)
   --    __rt_mutex_init(mutex, NULL)
   --  arg-macro: procedure rt_mutex_debug_task_free do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure DEFINE_RT_MUTEX struct rt_mutex mutexname := __RT_MUTEX_INITIALIZER(mutexname)
   --    struct rt_mutex mutexname := __RT_MUTEX_INITIALIZER(mutexname)
  -- * RT Mutexes: blocking mutual exclusion locks with PI support
  -- *
  -- * started by Ingo Molnar and Thomas Gleixner:
  -- *
  -- *  Copyright (C) 2004-2006 Red Hat, Inc., Ingo Molnar <mingo@redhat.com>
  -- *  Copyright (C) 2006, Timesys Corp., Thomas Gleixner <tglx@timesys.com>
  -- *
  -- * This file contains the public data structure and API definitions.
  --  

  -- for sysctl  
   max_lock_depth : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:19
   pragma Import (C, max_lock_depth, "max_lock_depth");

  --*
  -- * The rt_mutex structure
  -- *
  -- * @wait_lock:	spinlock to protect the structure
  -- * @waiters:	rbtree root to enqueue waiters in priority order
  -- * @waiters_leftmost: top waiter
  -- * @owner:	the mutex owner
  --  

   type rt_mutex is record
      wait_lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:30
      waiters : aliased linux_rbtree_h.rb_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:31
      waiters_leftmost : access linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:32
      owner : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, rt_mutex);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:29

   --  skipped empty struct rt_mutex_waiter

   function rt_mutex_debug_check_no_locks_freed (from : System.Address; len : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:50
   pragma Import (CPP, rt_mutex_debug_check_no_locks_freed, "_ZL35rt_mutex_debug_check_no_locks_freedPKvm");

  --*
  -- * rt_mutex_is_locked - is the mutex locked
  -- * @lock: the mutex to be queried
  -- *
  -- * Returns 1 if the mutex is locked, 0 if unlocked.
  --  

   function rt_mutex_is_locked (lock : access rt_mutex) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:84
   pragma Import (CPP, rt_mutex_is_locked, "_ZL18rt_mutex_is_lockedP8rt_mutex");

   --  skipped func __rt_mutex_init

   procedure rt_mutex_destroy (lock : access rt_mutex);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:90
   pragma Import (CPP, rt_mutex_destroy, "_Z16rt_mutex_destroyP8rt_mutex");

   procedure rt_mutex_lock (lock : access rt_mutex);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:92
   pragma Import (CPP, rt_mutex_lock, "_Z13rt_mutex_lockP8rt_mutex");

   function rt_mutex_lock_interruptible (lock : access rt_mutex; detect_deadlock : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:93
   pragma Import (CPP, rt_mutex_lock_interruptible, "_Z27rt_mutex_lock_interruptibleP8rt_mutexi");

   function rt_mutex_timed_lock
     (lock : access rt_mutex;
      timeout : access linux_hrtimer_h.hrtimer_sleeper;
      detect_deadlock : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:95
   pragma Import (CPP, rt_mutex_timed_lock, "_Z19rt_mutex_timed_lockP8rt_mutexP15hrtimer_sleeperi");

   function rt_mutex_trylock (lock : access rt_mutex) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:99
   pragma Import (CPP, rt_mutex_trylock, "_Z16rt_mutex_trylockP8rt_mutex");

   procedure rt_mutex_unlock (lock : access rt_mutex);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rtmutex.h:101
   pragma Import (CPP, rt_mutex_unlock, "_Z15rt_mutex_unlockP8rt_mutex");

end linux_rtmutex_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with linux_spinlock_types_h;
limited with linux_sched_h;
with linux_osq_lock_h;

package linux_mutex_h is

   --  unsupported macro: mutex_init(mutex) do { static struct lock_class_key __key; __mutex_init((mutex), #mutex, &__key); } while (0)
   --  arg-macro: procedure DEFINE_MUTEX struct mutex mutexname := __MUTEX_INITIALIZER(mutexname)
   --    struct mutex mutexname := __MUTEX_INITIALIZER(mutexname)
   --  arg-macro: procedure mutex_lock_nested mutex_lock(lock)
   --    mutex_lock(lock)
   --  arg-macro: procedure mutex_lock_interruptible_nested mutex_lock_interruptible(lock)
   --    mutex_lock_interruptible(lock)
   --  arg-macro: procedure mutex_lock_killable_nested mutex_lock_killable(lock)
   --    mutex_lock_killable(lock)
   --  arg-macro: procedure mutex_lock_nest_lock mutex_lock(lock)
   --    mutex_lock(lock)
   --  arg-macro: procedure arch_mutex_cpu_relax cpu_relax()
   --    cpu_relax()
  -- * Mutexes: blocking mutual exclusion locks
  -- *
  -- * started by Ingo Molnar:
  -- *
  -- *  Copyright (C) 2004, 2005, 2006 Red Hat, Inc., Ingo Molnar <mingo@redhat.com>
  -- *
  -- * This file contains the main data structure and API definitions.
  --  

  -- * Simple, straightforward mutexes with strict semantics:
  -- *
  -- * - only one task can hold the mutex at a time
  -- * - only the owner can unlock the mutex
  -- * - multiple unlocks are not permitted
  -- * - recursive locking is not permitted
  -- * - a mutex object must be initialized via the API
  -- * - a mutex object must not be initialized via memset or copying
  -- * - task may not exit with mutex held
  -- * - memory areas where held locks reside must not be freed
  -- * - held mutexes must not be reinitialized
  -- * - mutexes may not be used in hardware or software interrupt
  -- *   contexts such as tasklets and timers
  -- *
  -- * These semantics are fully enforced when DEBUG_MUTEXES is
  -- * enabled. Furthermore, besides enforcing the above rules, the mutex
  -- * debugging code also implements a number of additional features
  -- * that make lock debugging easier and faster:
  -- *
  -- * - uses symbolic names of mutexes, whenever they are printed in debug output
  -- * - point-of-acquire tracking, symbolic lookup of function names
  -- * - list of all locks held in the system, printout of them
  -- * - owner tracking
  -- * - detects self-recursing locks and prints out all relevant info
  -- * - detects multi-task circular deadlocks and prints out all affected
  -- *   locks and tasks (and only those tasks)
  --  

  -- 1: unlocked, 0: locked, negative: locked, possible waiters  
   type mutex is record
      count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:52
      wait_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:53
      wait_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:54
      owner : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:56
      osq : aliased linux_osq_lock_h.optimistic_spin_queue;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:59
   end record;
   pragma Convention (C_Pass_By_Copy, mutex);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:50

  -- Spinner MCS lock  
  -- * This is the control structure for tasks blocked on mutex,
  -- * which resides on the blocked task's kernel stack:
  --  

   type mutex_waiter is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:75
      c_task : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:76
   end record;
   pragma Convention (C_Pass_By_Copy, mutex_waiter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:74

  --*
  -- * mutex_init - initialize the mutex
  -- * @mutex: the mutex to be initialized
  -- *
  -- * Initialize the mutex to unlocked state.
  -- *
  -- * It is not allowed to initialize an already locked mutex.
  --  

   procedure mutex_destroy (lock : access mutex);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:100
   pragma Import (CPP, mutex_destroy, "_ZL13mutex_destroyP5mutex");

   --  skipped func __mutex_init

  --*
  -- * mutex_is_locked - is the mutex locked
  -- * @lock: the mutex to be queried
  -- *
  -- * Returns 1 if the mutex is locked, 0 if unlocked.
  --  

   function mutex_is_locked (lock : access mutex) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:129
   pragma Import (CPP, mutex_is_locked, "_ZL15mutex_is_lockedP5mutex");

  -- * See kernel/locking/mutex.c for detailed documentation of these APIs.
  -- * Also see Documentation/mutex-design.txt.
  --  

   procedure mutex_lock (lock : access mutex);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:158
   pragma Import (CPP, mutex_lock, "_Z10mutex_lockP5mutex");

   function mutex_lock_interruptible (lock : access mutex) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:159
   pragma Import (CPP, mutex_lock_interruptible, "_Z24mutex_lock_interruptibleP5mutex");

   function mutex_lock_killable (lock : access mutex) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:160
   pragma Import (CPP, mutex_lock_killable, "_Z19mutex_lock_killableP5mutex");

  -- * NOTE: mutex_trylock() follows the spin_trylock() convention,
  -- *       not the down_trylock() convention!
  -- *
  -- * Returns 1 if the mutex has been acquired successfully, and 0 on contention.
  --  

   function mutex_trylock (lock : access mutex) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:174
   pragma Import (CPP, mutex_trylock, "_Z13mutex_trylockP5mutex");

   procedure mutex_unlock (lock : access mutex);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:175
   pragma Import (CPP, mutex_unlock, "_Z12mutex_unlockP5mutex");

   function atomic_dec_and_mutex_lock (cnt : access linux_types_h.atomic_t; lock : access mutex) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mutex.h:177
   pragma Import (CPP, atomic_dec_and_mutex_lock, "_Z25atomic_dec_and_mutex_lockP8atomic_tP5mutex");

end linux_mutex_h;

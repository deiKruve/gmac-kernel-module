pragma Ada_2005;
pragma Style_Checks (Off);

with System;
with Interfaces.C; use Interfaces.C;
with linux_types;
with linux_spinlock_types;
--limited with linux_sched_h;
with linux_osq_lock;

package linux_mutex is
   
   subtype Task_Struct_Ptr is System.Address; 
   -- access linux_sched_h.task_struct;
   
   
   -- Simple, straightforward mutexes with strict semantics:
   --
   -- - only one task can hold the mutex at a time
   -- - only the owner can unlock the mutex
   -- - multiple unlocks are not permitted
   -- - recursive locking is not permitted
   -- - a mutex object must be initialized via the API
   -- - a mutex object must not be initialized via memset or copying
   -- - task may not exit with mutex held
   -- - memory areas where held locks reside must not be freed
   -- - held mutexes must not be reinitialized
   -- - mutexes may not be used in hardware or software interrupt
   --   contexts such as tasklets and timers
   --   
   -- These semantics are fully enforced when DEBUG_MUTEXES is
   -- enabled. Furthermore, besides enforcing the above rules, the mutex
   -- debugging code also implements a number of additional features
   -- that make lock debugging easier and faster:
   --
   -- - uses symbolic names of mutexes, whenever they are printed in 
   --     debug output.
   -- - point-of-acquire tracking, symbolic lookup of function names
   -- - list of all locks held in the system, printout of them
   -- - owner tracking
   -- - detects self-recursing locks and prints out all relevant info
   -- - detects multi-task circular deadlocks and prints out all affected
   --   locks and tasks (and only those tasks)
   --  
   
   type mutex is record
      count : aliased linux_types.atomic_t;
      -- 1: unlocked, 0: locked, negative: locked, possible waiters
      wait_lock : aliased linux_spinlock_types.spinlock_t;
      wait_list : aliased linux_types.list_head;
      owner : Task_Struct_Ptr;
      osq : aliased linux_osq_lock.optimistic_spin_queue;
   end record;
   pragma Convention (C_Pass_By_Copy, mutex);
   
   
   type mutex_waiter is record
      -- Spinner MCS lock  
      --  This is the control structure for tasks blocked on mutex,
      --  which resides on the blocked task's kernel stack
      list : aliased linux_types.list_head;
      c_task : Task_Struct_Ptr;
   end record;
   pragma Convention (C_Pass_By_Copy, mutex_waiter);
   
   procedure mutex_lock (lock : access mutex);
   pragma Import (C, mutex_lock, "mutex_lock");
   
   function mutex_lock_interruptible (lock : access mutex) return int;
   pragma Import (C, mutex_lock_interruptible, "mutex_lock_interruptible");
   
   function mutex_lock_killable (lock : access mutex) return int;
   pragma Import (C, mutex_lock_killable, "mutex_lock_killable");
   
   function mutex_trylock (lock : access mutex) return int;
   -- NOTE: mutex_trylock() follows the spin_trylock() convention,
   --       not the down_trylock() convention!
   --   
   -- Returns 1 if the mutex has been acquired successfully, 
   --  and 0 on contention.
   pragma Import (C, mutex_trylock, "mutex_trylock");
   
   procedure mutex_unlock (lock : access mutex);
   pragma Import (C, mutex_unlock, "mutex_unlock");
   
   function atomic_dec_and_mutex_lock (cnt : access linux_types.atomic_t; 
				       lock : access mutex) 
				      return int;
   pragma Import (C, atomic_dec_and_mutex_lock, "atomic_dec_and_mutex_lock");
   
   
end Linux_Mutex;

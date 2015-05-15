pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with linux_spinlock_types_h;
with linux_osq_lock_h;
limited with linux_sched_h;

package linux_rwsem_h is

   --  arg-macro: procedure DECLARE_RWSEM struct rw_semaphore name := __RWSEM_INITIALIZER(name)
   --    struct rw_semaphore name := __RWSEM_INITIALIZER(name)
   --  unsupported macro: init_rwsem(sem) do { static struct lock_class_key __key; __init_rwsem((sem), #sem, &__key); } while (0)
   --  arg-macro: procedure down_read_nested down_read(sem)
   --    down_read(sem)
   --  arg-macro: procedure down_write_nest_lock down_write(sem)
   --    down_write(sem)
   --  arg-macro: procedure down_write_nested down_write(sem)
   --    down_write(sem)
   --  arg-macro: procedure down_read_non_owner down_read(sem)
   --    down_read(sem)
   --  arg-macro: procedure up_read_non_owner up_read(sem)
   --    up_read(sem)
  -- rwsem.h: R/W semaphores, public interface
  -- *
  -- * Written by David Howells (dhowells@redhat.com).
  -- * Derived from asm-i386/semaphore.h
  --  

  -- All arch specific implementations share the same struct  
   type rw_semaphore is record
      count : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:28
      wait_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:29
      wait_lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:30
      osq : aliased linux_osq_lock_h.optimistic_spin_queue;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:32
      owner : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:27

  -- spinner MCS lock  
  --	 * Write owner. Used as a speculative check to see
  --	 * if the owner is running on the cpu.
  --	  

   function rwsem_down_read_failed (sem : access rw_semaphore) return access rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:44
   pragma Import (CPP, rwsem_down_read_failed, "_Z22rwsem_down_read_failedP12rw_semaphore");

   function rwsem_down_write_failed (sem : access rw_semaphore) return access rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:45
   pragma Import (CPP, rwsem_down_write_failed, "_Z23rwsem_down_write_failedP12rw_semaphore");

   function rwsem_wake (arg1 : access rw_semaphore) return access rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:46
   pragma Import (CPP, rwsem_wake, "_Z10rwsem_wakeP12rw_semaphore");

   function rwsem_downgrade_wake (sem : access rw_semaphore) return access rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:47
   pragma Import (CPP, rwsem_downgrade_wake, "_Z20rwsem_downgrade_wakeP12rw_semaphore");

  -- Include the arch specific part  
  -- In all implementations count != 0 means locked  
   function rwsem_is_locked (sem : access rw_semaphore) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:53
   pragma Import (CPP, rwsem_is_locked, "_ZL15rwsem_is_lockedP12rw_semaphore");

  -- Common initializer macros and functions  
   --  skipped func __init_rwsem

  -- * This is the same regardless of which rwsem implementation that is being used.
  -- * It is just a heuristic meant to be called by somebody alreadying holding the
  -- * rwsem to see if somebody from an incompatible type is wanting access to the
  -- * lock.
  --  

   function rwsem_is_contended (sem : access rw_semaphore) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:100
   pragma Import (CPP, rwsem_is_contended, "_ZL18rwsem_is_contendedP12rw_semaphore");

  -- * lock for reading
  --  

   procedure down_read (sem : access rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:108
   pragma Import (CPP, down_read, "_Z9down_readP12rw_semaphore");

  -- * trylock for reading -- returns 1 if successful, 0 if contention
  --  

   function down_read_trylock (sem : access rw_semaphore) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:113
   pragma Import (CPP, down_read_trylock, "_Z17down_read_trylockP12rw_semaphore");

  -- * lock for writing
  --  

   procedure down_write (sem : access rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:118
   pragma Import (CPP, down_write, "_Z10down_writeP12rw_semaphore");

  -- * trylock for writing -- returns 1 if successful, 0 if contention
  --  

   function down_write_trylock (sem : access rw_semaphore) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:123
   pragma Import (CPP, down_write_trylock, "_Z18down_write_trylockP12rw_semaphore");

  -- * release a read lock
  --  

   procedure up_read (sem : access rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:128
   pragma Import (CPP, up_read, "_Z7up_readP12rw_semaphore");

  -- * release a write lock
  --  

   procedure up_write (sem : access rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:133
   pragma Import (CPP, up_write, "_Z8up_writeP12rw_semaphore");

  -- * downgrade write lock to read lock
  --  

   procedure downgrade_write (sem : access rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwsem.h:138
   pragma Import (CPP, downgrade_write, "_Z15downgrade_writeP12rw_semaphore");

  -- * nested locking. NOTE: rwsems are not allowed to recurse
  -- * (which occurs if the same task tries to acquire the same
  -- * lock instance multiple times), but multiple locks of the
  -- * same lock class might be taken, if the order of the locks
  -- * is always the same. This ordering rule can be expressed
  -- * to lockdep via the _nested() APIs, but enumerating the
  -- * subclasses that are used. (If the nesting relationship is
  -- * static then another method for expressing nested locking is
  -- * the explicit definition of lock class keys and the use of
  -- * lockdep_set_class() at lock initialization time.
  -- * See Documentation/lockdep-design.txt for more details.)
  --  

  -- * Take/release a lock when not the owner will release it.
  -- *
  -- * [ This API should be avoided as much as possible - the
  -- *   proper abstraction for this case is completions. ]
  --  

end linux_rwsem_h;

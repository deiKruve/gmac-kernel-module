pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sched_h;
with System;

package linux_debug_locks_h is

   --  unsupported macro: DEBUG_LOCKS_WARN_ON(c) ({ int __ret = 0; if (!oops_in_progress && unlikely(c)) { if (debug_locks_off() && !debug_locks_silent) WARN(1, "DEBUG_LOCKS_WARN_ON(%s)", #c); __ret = 1; } __ret; })
   --  arg-macro: procedure SMP_DEBUG_LOCKS_WARN_ON DEBUG_LOCKS_WARN_ON(c)
   --    DEBUG_LOCKS_WARN_ON(c)
   --  arg-macro: procedure locking_selftest do { } while (0)
   --    do { } while (0)
   debug_locks : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debug_locks.h:10
   pragma Import (C, debug_locks, "debug_locks");

   debug_locks_silent : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debug_locks.h:11
   pragma Import (C, debug_locks_silent, "debug_locks_silent");

   --  skipped func __debug_locks_off

  -- * Generic 'turn off all lock debugging' function:
  --  

   function debug_locks_off return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debug_locks.h:22
   pragma Import (CPP, debug_locks_off, "_Z15debug_locks_offv");

   procedure debug_show_all_locks;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debug_locks.h:56
   pragma Import (CPP, debug_show_all_locks, "_ZL20debug_show_all_locksv");

   procedure debug_show_held_locks (c_task : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debug_locks.h:60
   pragma Import (CPP, debug_show_held_locks, "_ZL21debug_show_held_locksP11task_struct");

   procedure debug_check_no_locks_freed (from : System.Address; len : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debug_locks.h:65
   pragma Import (CPP, debug_check_no_locks_freed, "_ZL26debug_check_no_locks_freedPKvm");

   procedure debug_check_no_locks_held;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debug_locks.h:70
   pragma Import (CPP, debug_check_no_locks_held, "_ZL25debug_check_no_locks_heldv");

end linux_debug_locks_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Linux_Types;
with System;
-- with Interfaces.C.Strings;

package linux_timer is
   package L renames Linux_Types;

   -- HZ : constant unsigned := 100; -- on most systems these days.
   -- in linux_sched.ads

   subtype timer_list_start_comm_array is Interfaces.C.char_array (0 .. 15);
   type timer_list is record
      c_entry    : aliased L.list_head;
      expires    : aliased unsigned_long;
      base       : System.Address;
      c_function : access procedure (arg1 : unsigned_long);
      data       : aliased unsigned_long;
      slack      : aliased int;
      start_pid  : aliased int;
      start_site : System.Address;
      start_comm : aliased timer_list_start_comm_array;
   end record;
   pragma Convention (C_Pass_By_Copy, timer_list);

   function timer_pending (timer : access constant timer_list) return int;
   pragma Import (C, timer_pending, "timer_pending");

   procedure add_timer_on (timer : access timer_list; cpu : int);
   pragma Import (C, add_timer_on, "add_timer_on");

   function del_timer (timer : access timer_list) return int;
   pragma Import (C, del_timer, "del_timer");

   function mod_timer
     (timer   : access timer_list;
      expires : unsigned_long) return int;
   pragma Import (C, mod_timer, "mod_timer");

   function mod_timer_pending
     (timer   : access timer_list;
      expires : unsigned_long) return int;
   pragma Import (C, mod_timer_pending, "mod_timer_pending");

   function mod_timer_pinned
     (timer   : access timer_list;
      expires : unsigned_long) return int;
   pragma Import (C, mod_timer_pinned, "mod_timer_pinned");

   procedure set_timer_slack (time : access timer_list; slack_hz : int);
   pragma Import (C, set_timer_slack, "set_timer_slack");

   function get_next_timer_interrupt
     (now : unsigned_long) return unsigned_long;
   pragma Import (C, get_next_timer_interrupt, "get_next_timer_interrupt");

   procedure add_timer (timer : access timer_list);
   pragma Import (C, add_timer, "add_timer");

   function try_to_del_timer_sync (timer : access timer_list) return int;
   pragma Import (C, try_to_del_timer_sync, "try_to_del_timer_sync");

   function del_timer_sync (timer : access timer_list) return int;
   pragma Import (C, del_timer_sync, "del_timer_sync");

   procedure init_timers;
   pragma Import (C, init_timers, "init_timers");

end linux_timer;

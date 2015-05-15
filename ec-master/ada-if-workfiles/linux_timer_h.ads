pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with System;
with Interfaces.C.Strings;
limited with linux_lockdep_h;
limited with linux_hrtimer_h;

package linux_timer_h is

   --  unsupported macro: TIMER_DEFERRABLE 0x1LU
   --  unsupported macro: TIMER_IRQSAFE 0x2LU
   --  unsupported macro: TIMER_FLAG_MASK 0x3LU
   --  arg-macro: procedure TIMER_INITIALIZER __TIMER_INITIALIZER((_function), (_expires), (_data), 0)
   --    __TIMER_INITIALIZER((_function), (_expires), (_data), 0)
   --  arg-macro: procedure TIMER_DEFERRED_INITIALIZER __TIMER_INITIALIZER((_function), (_expires), (_data), TIMER_DEFERRABLE)
   --    __TIMER_INITIALIZER((_function), (_expires), (_data), TIMER_DEFERRABLE)
   --  arg-macro: procedure DEFINE_TIMER struct timer_list _name := TIMER_INITIALIZER(_function, _expires, _data)
   --    struct timer_list _name := TIMER_INITIALIZER(_function, _expires, _data)
   --  arg-macro: procedure init_timer __init_timer((timer), 0)
   --    __init_timer((timer), 0)
   --  arg-macro: procedure init_timer_deferrable __init_timer((timer), TIMER_DEFERRABLE)
   --    __init_timer((timer), TIMER_DEFERRABLE)
   --  arg-macro: procedure init_timer_on_stack __init_timer_on_stack((timer), 0)
   --    __init_timer_on_stack((timer), 0)
   --  arg-macro: procedure setup_timer __setup_timer((timer), (fn), (data), 0)
   --    __setup_timer((timer), (fn), (data), 0)
   --  arg-macro: procedure setup_timer_on_stack __setup_timer_on_stack((timer), (fn), (data), 0)
   --    __setup_timer_on_stack((timer), (fn), (data), 0)
   --  arg-macro: procedure setup_deferrable_timer_on_stack __setup_timer_on_stack((timer), (fn), (data), TIMER_DEFERRABLE)
   --    __setup_timer_on_stack((timer), (fn), (data), TIMER_DEFERRABLE)
   --  unsupported macro: TIMER_NOT_PINNED 0
   --  unsupported macro: TIMER_PINNED 1
   --  unsupported macro: NEXT_TIMER_MAX_DELTA ((1UL << 30) - 1)
   --  unsupported macro: TIMER_STATS_FLAG_DEFERRABLE 0x1
   --  arg-macro: procedure del_singleshot_timer_sync del_timer_sync(t)
   --    del_timer_sync(t)
   --  skipped empty struct tvec_base

  --	 * All fields that change during normal runtime grouped to the
  --	 * same cacheline
  --	  

   subtype timer_list_start_comm_array is Interfaces.C.char_array (0 .. 15);
   type timer_list is record
      c_entry : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:17
      expires : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:18
      base : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:19
      c_function : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:21
      data : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:22
      slack : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:24
      start_pid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:27
      start_site : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:28
      start_comm : aliased timer_list_start_comm_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, timer_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:12

   boot_tvec_bases : aliased tvec_base;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:36
   pragma Import (C, boot_tvec_bases, "boot_tvec_bases");

  -- * NB: because we have to copy the lockdep_map, setting the lockdep_map key
  -- * (second argument) here is required, otherwise it could be initialised to
  -- * the copy of the lockdep_map later! We use the pointer to and the string
  -- * "<file>:<line>" as the key resp. the name of the lockdep_map.
  --  

  -- * Note that all tvec_bases are at least 4 byte aligned and lower two bits
  -- * of base in timer_list is guaranteed to be zero. Use them for flags.
  -- *
  -- * A deferrable timer will work normally when the system is busy, but
  -- * will not cause a CPU to come out of idle just to service it; instead,
  -- * the timer will be serviced when the CPU eventually wakes up with a
  -- * subsequent non-deferrable timer.
  -- *
  -- * An irqsafe timer is executed with IRQ disabled and it's safe to wait for
  -- * the completion of the running instance from IRQ handlers, for example,
  -- * by calling del_timer_sync().
  -- *
  -- * Note: The irq disabled callback execution is a special case for
  -- * workqueue locking issues. It's not meant for executing random crap
  -- * with interrupts disabled. Abuse is monitored!
  --  

   procedure init_timer_key
     (timer : access timer_list;
      flags : unsigned;
      name : Interfaces.C.Strings.chars_ptr;
      key : access linux_lockdep_h.lock_class_key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:94
   pragma Import (CPP, init_timer_key, "_Z14init_timer_keyP10timer_listjPKcP14lock_class_key");

   procedure destroy_timer_on_stack (timer : access timer_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:103
   pragma Import (CPP, destroy_timer_on_stack, "_ZL22destroy_timer_on_stackP10timer_list");

   procedure init_timer_on_stack_key
     (timer : access timer_list;
      flags : unsigned;
      name : Interfaces.C.Strings.chars_ptr;
      key : access linux_lockdep_h.lock_class_key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:104
   pragma Import (CPP, init_timer_on_stack_key, "_ZL23init_timer_on_stack_keyP10timer_listjPKcP14lock_class_key");

  --*
  -- * timer_pending - is a timer pending?
  -- * @timer: the timer in question
  -- *
  -- * timer_pending will tell whether a given timer is currently pending,
  -- * or not. Callers must ensure serialization wrt. other operations done
  -- * to this timer, eg. interrupt contexts, or other CPUs on SMP.
  -- *
  -- * return value: 1 if the timer is pending, 0 if not.
  --  

   function timer_pending (timer : access constant timer_list) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:169
   pragma Import (CPP, timer_pending, "_ZL13timer_pendingPK10timer_list");

   procedure add_timer_on (timer : access timer_list; cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:174
   pragma Import (CPP, add_timer_on, "_Z12add_timer_onP10timer_listi");

   function del_timer (timer : access timer_list) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:175
   pragma Import (CPP, del_timer, "_Z9del_timerP10timer_list");

   function mod_timer (timer : access timer_list; expires : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:176
   pragma Import (CPP, mod_timer, "_Z9mod_timerP10timer_listm");

   function mod_timer_pending (timer : access timer_list; expires : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:177
   pragma Import (CPP, mod_timer_pending, "_Z17mod_timer_pendingP10timer_listm");

   function mod_timer_pinned (timer : access timer_list; expires : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:178
   pragma Import (CPP, mod_timer_pinned, "_Z16mod_timer_pinnedP10timer_listm");

   procedure set_timer_slack (time : access timer_list; slack_hz : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:180
   pragma Import (CPP, set_timer_slack, "_Z15set_timer_slackP10timer_listi");

  -- * The jiffies value which is added to now, when there is no timer
  -- * in the timer wheel:
  --  

  -- * Return when the next timer-wheel timeout occurs (in absolute jiffies),
  -- * locks the timer base and does the comparison against the given
  -- * jiffie.
  --  

   function get_next_timer_interrupt (now : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:195
   pragma Import (CPP, get_next_timer_interrupt, "_Z24get_next_timer_interruptm");

  -- * Timer-statistics info:
  --  

   timer_stats_active : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:202
   pragma Import (C, timer_stats_active, "timer_stats_active");

   procedure init_timer_stats;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:206
   pragma Import (CPP, init_timer_stats, "_Z16init_timer_statsv");

   procedure timer_stats_update_stats
     (timer : System.Address;
      pid : linux_types_h.pid_t;
      startf : System.Address;
      timerf : System.Address;
      comm : Interfaces.C.Strings.chars_ptr;
      timer_flag : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:208
   pragma Import (CPP, timer_stats_update_stats, "_Z24timer_stats_update_statsPviS_S_Pcj");

   --  skipped func __timer_stats_timer_set_start_info

   procedure timer_stats_timer_set_start_info (timer : access timer_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:215
   pragma Import (CPP, timer_stats_timer_set_start_info, "_ZL32timer_stats_timer_set_start_infoP10timer_list");

   procedure timer_stats_timer_clear_start_info (timer : access timer_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:222
   pragma Import (CPP, timer_stats_timer_clear_start_info, "_ZL34timer_stats_timer_clear_start_infoP10timer_list");

   procedure add_timer (timer : access timer_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:240
   pragma Import (CPP, add_timer, "_Z9add_timerP10timer_list");

   function try_to_del_timer_sync (timer : access timer_list) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:242
   pragma Import (CPP, try_to_del_timer_sync, "_Z21try_to_del_timer_syncP10timer_list");

   function del_timer_sync (timer : access timer_list) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:245
   pragma Import (CPP, del_timer_sync, "_Z14del_timer_syncP10timer_list");

   procedure init_timers;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:252
   pragma Import (CPP, init_timers, "_Z11init_timersv");

   procedure run_local_timers;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:253
   pragma Import (CPP, run_local_timers, "_Z16run_local_timersv");

   function it_real_fn (arg1 : access linux_hrtimer_h.hrtimer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:255
   pragma Import (CPP, it_real_fn, "_Z10it_real_fnP7hrtimer");

   --  skipped func __round_jiffies

   --  skipped func __round_jiffies_relative

   function round_jiffies (j : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:259
   pragma Import (CPP, round_jiffies, "_Z13round_jiffiesm");

   function round_jiffies_relative (j : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:260
   pragma Import (CPP, round_jiffies_relative, "_Z22round_jiffies_relativem");

   --  skipped func __round_jiffies_up

   --  skipped func __round_jiffies_up_relative

   function round_jiffies_up (j : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:264
   pragma Import (CPP, round_jiffies_up, "_Z16round_jiffies_upm");

   function round_jiffies_up_relative (j : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timer.h:265
   pragma Import (CPP, round_jiffies_up_relative, "_Z25round_jiffies_up_relativem");

end linux_timer_h;

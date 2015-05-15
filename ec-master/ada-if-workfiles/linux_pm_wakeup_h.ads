pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with linux_types_h;
with linux_spinlock_types_h;
with linux_timer_h;
with linux_ktime_h;
with Interfaces.C.Extensions;
limited with linux_device_h;

package linux_pm_wakeup_h is

  -- *  pm_wakeup.h - Power management wakeup interface
  -- *
  -- *  Copyright (C) 2008 Alan Stern
  -- *  Copyright (C) 2010 Rafael J. Wysocki, Novell Inc.
  -- *
  -- *  This program is free software; you can redistribute it and/or modify
  -- *  it under the terms of the GNU General Public License as published by
  -- *  the Free Software Foundation; either version 2 of the License, or
  -- *  (at your option) any later version.
  -- *
  -- *  This program is distributed in the hope that it will be useful,
  -- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- *  GNU General Public License for more details.
  -- *
  -- *  You should have received a copy of the GNU General Public License
  -- *  along with this program; if not, write to the Free Software
  -- *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  --  

  --*
  -- * struct wakeup_source - Representation of wakeup sources
  -- *
  -- * @total_time: Total time this wakeup source has been active.
  -- * @max_time: Maximum time this wakeup source has been continuously active.
  -- * @last_time: Monotonic clock when the wakeup source's was touched last time.
  -- * @prevent_sleep_time: Total time this source has been preventing autosleep.
  -- * @event_count: Number of signaled wakeup events.
  -- * @active_count: Number of times the wakeup source was activated.
  -- * @relax_count: Number of times the wakeup source was deactivated.
  -- * @expire_count: Number of times the wakeup source's timeout has expired.
  -- * @wakeup_count: Number of times the wakeup source might abort suspend.
  -- * @active: Status of the wakeup source.
  -- * @has_timeout: The wakeup source has been activated with a timeout.
  --  

   type wakeup_source is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:47
      c_entry : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:48
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:49
      timer : aliased linux_timer_h.timer_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:50
      timer_expires : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:51
      total_time : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:52
      max_time : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:53
      last_time : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:54
      start_prevent_time : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:55
      prevent_sleep_time : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:56
      event_count : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:57
      active_count : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:58
      relax_count : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:59
      expire_count : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:60
      wakeup_count : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:61
      active : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:62
      autosleep_enabled : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:63
   end record;
   pragma Convention (C_Pass_By_Copy, wakeup_source);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:46

  -- * Changes to device_may_wakeup take effect on the next pm state change.
  --  

   function device_can_wakeup (dev : access linux_device_h.device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:72
   pragma Import (CPP, device_can_wakeup, "_ZL17device_can_wakeupP6device");

   function device_may_wakeup (dev : access linux_device_h.device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:77
   pragma Import (CPP, device_may_wakeup, "_ZL17device_may_wakeupP6device");

  -- drivers/base/power/wakeup.c  
   procedure wakeup_source_prepare (ws : access wakeup_source; name : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:83
   pragma Import (CPP, wakeup_source_prepare, "_Z21wakeup_source_prepareP13wakeup_sourcePKc");

   function wakeup_source_create (name : Interfaces.C.Strings.chars_ptr) return access wakeup_source;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:84
   pragma Import (CPP, wakeup_source_create, "_Z20wakeup_source_createPKc");

   procedure wakeup_source_drop (ws : access wakeup_source);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:85
   pragma Import (CPP, wakeup_source_drop, "_Z18wakeup_source_dropP13wakeup_source");

   procedure wakeup_source_destroy (ws : access wakeup_source);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:86
   pragma Import (CPP, wakeup_source_destroy, "_Z21wakeup_source_destroyP13wakeup_source");

   procedure wakeup_source_add (ws : access wakeup_source);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:87
   pragma Import (CPP, wakeup_source_add, "_Z17wakeup_source_addP13wakeup_source");

   procedure wakeup_source_remove (ws : access wakeup_source);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:88
   pragma Import (CPP, wakeup_source_remove, "_Z20wakeup_source_removeP13wakeup_source");

   function wakeup_source_register (name : Interfaces.C.Strings.chars_ptr) return access wakeup_source;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:89
   pragma Import (CPP, wakeup_source_register, "_Z22wakeup_source_registerPKc");

   procedure wakeup_source_unregister (ws : access wakeup_source);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:90
   pragma Import (CPP, wakeup_source_unregister, "_Z24wakeup_source_unregisterP13wakeup_source");

   function device_wakeup_enable (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:91
   pragma Import (CPP, device_wakeup_enable, "_Z20device_wakeup_enableP6device");

   function device_wakeup_disable (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:92
   pragma Import (CPP, device_wakeup_disable, "_Z21device_wakeup_disableP6device");

   procedure device_set_wakeup_capable (dev : access linux_device_h.device; capable : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:93
   pragma Import (CPP, device_set_wakeup_capable, "_Z25device_set_wakeup_capableP6deviceb");

   function device_init_wakeup (dev : access linux_device_h.device; val : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:94
   pragma Import (CPP, device_init_wakeup, "_Z18device_init_wakeupP6deviceb");

   function device_set_wakeup_enable (dev : access linux_device_h.device; enable : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:95
   pragma Import (CPP, device_set_wakeup_enable, "_Z24device_set_wakeup_enableP6deviceb");

   --  skipped func __pm_stay_awake

   procedure pm_stay_awake (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:97
   pragma Import (CPP, pm_stay_awake, "_Z13pm_stay_awakeP6device");

   --  skipped func __pm_relax

   procedure pm_relax (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:99
   pragma Import (CPP, pm_relax, "_Z8pm_relaxP6device");

   --  skipped func __pm_wakeup_event

   procedure pm_wakeup_event (dev : access linux_device_h.device; msec : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:101
   pragma Import (CPP, pm_wakeup_event, "_Z15pm_wakeup_eventP6devicej");

   procedure wakeup_source_init (ws : access wakeup_source; name : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:182
   pragma Import (CPP, wakeup_source_init, "_ZL18wakeup_source_initP13wakeup_sourcePKc");

   procedure wakeup_source_trash (ws : access wakeup_source);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_wakeup.h:189
   pragma Import (CPP, wakeup_source_trash, "_ZL19wakeup_source_trashP13wakeup_source");

end linux_pm_wakeup_h;

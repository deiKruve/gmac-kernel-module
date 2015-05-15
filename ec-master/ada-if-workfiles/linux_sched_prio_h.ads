pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_sched_prio_h is

   --  unsupported macro: MAX_NICE 19
   --  unsupported macro: MIN_NICE -20
   --  unsupported macro: NICE_WIDTH (MAX_NICE - MIN_NICE + 1)
   --  unsupported macro: MAX_USER_RT_PRIO 100
   --  unsupported macro: MAX_RT_PRIO MAX_USER_RT_PRIO
   --  unsupported macro: MAX_PRIO (MAX_RT_PRIO + NICE_WIDTH)
   --  unsupported macro: DEFAULT_PRIO (MAX_RT_PRIO + NICE_WIDTH / 2)
   --  arg-macro: function NICE_TO_PRIO ((nice) + DEFAULT_PRIO
   --    return (nice) + DEFAULT_PRIO;
   --  arg-macro: function PRIO_TO_NICE ((prio) - DEFAULT_PRIO
   --    return (prio) - DEFAULT_PRIO;
   --  arg-macro: function USER_PRIO ((p)-MAX_RT_PRIO
   --    return (p)-MAX_RT_PRIO;
   --  arg-macro: procedure TASK_USER_PRIO USER_PRIO((p).static_prio)
   --    USER_PRIO((p).static_prio)
   --  unsupported macro: MAX_USER_PRIO (USER_PRIO(MAX_PRIO))
  -- * Priority of a process goes from 0..MAX_PRIO-1, valid RT
  -- * priority is 0..MAX_RT_PRIO-1, and SCHED_NORMAL/SCHED_BATCH
  -- * tasks are in the range MAX_RT_PRIO..MAX_PRIO-1. Priority
  -- * values are inverted: lower p->prio value means higher priority.
  -- *
  -- * The MAX_USER_RT_PRIO value allows the actual maximum
  -- * RT priority to be separate from the value exported to
  -- * user-space.  This allows kernel threads to set their
  -- * priority to a value higher than any user task. Note:
  -- * MAX_RT_PRIO must not be smaller than MAX_USER_RT_PRIO.
  --  

  -- * Convert user-nice values [ -20 ... 0 ... 19 ]
  -- * to static priority [ MAX_RT_PRIO..MAX_PRIO-1 ],
  -- * and back.
  --  

  -- * 'User priority' is the nice value converted to something we
  -- * can work with better when scaling various scheduler parameters,
  -- * it's a [ 0 ... 39 ] range.
  --  

  -- * Convert nice value [19,-20] to rlimit style value [1,40].
  --  

   function nice_to_rlimit (nice : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched/prio.h:47
   pragma Import (CPP, nice_to_rlimit, "_ZL14nice_to_rlimitl");

  -- * Convert rlimit style value [1,40] to nice value [-20, 19].
  --  

   function rlimit_to_nice (prio : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched/prio.h:55
   pragma Import (CPP, rlimit_to_nice, "_ZL14rlimit_to_nicel");

end linux_sched_prio_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
limited with linux_sched_h;
limited with linux_notifier_h;

package linux_profile_h is

   --  unsupported macro: CPU_PROFILING 1
   --  unsupported macro: SCHED_PROFILING 2
   --  unsupported macro: SLEEP_PROFILING 3
   --  unsupported macro: KVM_PROFILING 4
   procedure create_prof_cpu_mask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:21
   pragma Import (CPP, create_prof_cpu_mask, "_Z20create_prof_cpu_maskv");

   function create_proc_profile return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:22
   pragma Import (CPP, create_proc_profile, "_Z19create_proc_profilev");

   type profile_type is 
     (PROFILE_TASK_EXIT,
      PROFILE_MUNMAP);
   pragma Convention (C, profile_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:34

   prof_on : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:41
   pragma Import (C, prof_on, "prof_on");

  -- init basic kernel profiler  
   function profile_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:44
   pragma Import (CPP, profile_init, "_Z12profile_initv");

   function profile_setup (str : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:45
   pragma Import (CPP, profile_setup, "_Z13profile_setupPc");

   procedure profile_tick (c_type : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:46
   pragma Import (CPP, profile_tick, "_Z12profile_ticki");

   function setup_profiling_timer (arg1 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:47
   pragma Import (CPP, setup_profiling_timer, "_Z21setup_profiling_timerj");

  -- * Add multiple profiler hits to a given address:
  --  

   procedure profile_hits
     (c_type : int;
      ip : System.Address;
      nr_hits : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:52
   pragma Import (CPP, profile_hits, "_Z12profile_hitsiPvj");

  -- * Single profiler hit:
  --  

   procedure profile_hit (c_type : int; ip : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:57
   pragma Import (CPP, profile_hit, "_ZL11profile_hitiPv");

  --	 * Speedup for the common (no profiling enabled) case:
  --	  

  -- task is in do_exit()  
   procedure profile_task_exit (c_task : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:70
   pragma Import (CPP, profile_task_exit, "_Z17profile_task_exitP11task_struct");

  -- task is dead, free task struct ? Returns 1 if
  -- * the task was taken, 0 if the task should be freed.
  --  

   function profile_handoff_task (c_task : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:75
   pragma Import (CPP, profile_handoff_task, "_Z20profile_handoff_taskP11task_struct");

  -- sys_munmap  
   procedure profile_munmap (addr : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:78
   pragma Import (CPP, profile_munmap, "_Z14profile_munmapm");

   function task_handoff_register (n : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:80
   pragma Import (CPP, task_handoff_register, "_Z21task_handoff_registerP14notifier_block");

   function task_handoff_unregister (n : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:81
   pragma Import (CPP, task_handoff_unregister, "_Z23task_handoff_unregisterP14notifier_block");

   function profile_event_register (arg1 : profile_type; n : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:83
   pragma Import (CPP, profile_event_register, "_Z22profile_event_register12profile_typeP14notifier_block");

   function profile_event_unregister (arg1 : profile_type; n : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/profile.h:84
   pragma Import (CPP, profile_event_unregister, "_Z24profile_event_unregister12profile_typeP14notifier_block");

end linux_profile_h;

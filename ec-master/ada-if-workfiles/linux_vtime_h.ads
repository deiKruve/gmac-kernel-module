pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
limited with linux_sched_h;

package linux_vtime_h is

  -- * vtime_accounting_enabled() definitions/declarations
  --  

   function vtime_accounting_enabled return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:32
   pragma Import (CPP, vtime_accounting_enabled, "_ZL24vtime_accounting_enabledv");

  -- * Common vtime APIs
  --  

   procedure vtime_task_switch (prev : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:69
   pragma Import (CPP, vtime_task_switch, "_ZL17vtime_task_switchP11task_struct");

   procedure vtime_account_system (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:70
   pragma Import (CPP, vtime_account_system, "_ZL20vtime_account_systemP11task_struct");

   procedure vtime_account_user (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:71
   pragma Import (CPP, vtime_account_user, "_ZL18vtime_account_userP11task_struct");

   procedure vtime_account_irq_enter (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:72
   pragma Import (CPP, vtime_account_irq_enter, "_ZL23vtime_account_irq_enterP11task_struct");

   procedure vtime_account_irq_exit (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:95
   pragma Import (CPP, vtime_account_irq_exit, "_ZL22vtime_account_irq_exitP11task_struct");

  -- On hard|softirq exit we always account to hard|softirq cputime  
   procedure vtime_user_enter (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:100
   pragma Import (CPP, vtime_user_enter, "_ZL16vtime_user_enterP11task_struct");

   procedure vtime_user_exit (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:101
   pragma Import (CPP, vtime_user_exit, "_ZL15vtime_user_exitP11task_struct");

   procedure vtime_guest_enter (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:102
   pragma Import (CPP, vtime_guest_enter, "_ZL17vtime_guest_enterP11task_struct");

   procedure vtime_guest_exit (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:103
   pragma Import (CPP, vtime_guest_exit, "_ZL16vtime_guest_exitP11task_struct");

   procedure vtime_init_idle (tsk : access linux_sched_h.task_struct; cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:104
   pragma Import (CPP, vtime_init_idle, "_ZL15vtime_init_idleP11task_structi");

   procedure irqtime_account_irq (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:110
   pragma Import (CPP, irqtime_account_irq, "_ZL19irqtime_account_irqP11task_struct");

   procedure account_irq_enter_time (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:113
   pragma Import (CPP, account_irq_enter_time, "_ZL22account_irq_enter_timeP11task_struct");

   procedure account_irq_exit_time (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vtime.h:119
   pragma Import (CPP, account_irq_exit_time, "_ZL21account_irq_exit_timeP11task_struct");

end linux_vtime_h;

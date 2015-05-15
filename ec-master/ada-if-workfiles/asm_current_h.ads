pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sched_h;

package asm_current_h is

   --  unsupported macro: current get_current()
   current_task : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/current.h:10
   pragma Import (C, current_task, "current_task");

   function get_current return access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/current.h:12
   pragma Import (CPP, get_current, "_ZL11get_currentv");

end asm_current_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_notifier_h;

package asm_idle_h is

   --  unsupported macro: IDLE_START 1
   --  unsupported macro: IDLE_END 2
   procedure idle_notifier_register (n : access linux_notifier_h.notifier_block);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/idle.h:8
   pragma Import (CPP, idle_notifier_register, "_Z22idle_notifier_registerP14notifier_block");

   procedure idle_notifier_unregister (n : access linux_notifier_h.notifier_block);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/idle.h:9
   pragma Import (CPP, idle_notifier_unregister, "_Z24idle_notifier_unregisterP14notifier_block");

   procedure enter_idle;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/idle.h:12
   pragma Import (CPP, enter_idle, "_Z10enter_idlev");

   procedure exit_idle;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/idle.h:13
   pragma Import (CPP, exit_idle, "_Z9exit_idlev");

   procedure amd_e400_remove_cpu (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/idle.h:20
   pragma Import (CPP, amd_e400_remove_cpu, "_Z19amd_e400_remove_cpui");

end asm_idle_h;

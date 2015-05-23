pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package asm_current_h is

   --  unsupported macro: current get_current()
   current_task : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/current.h:10
   pragma Import (C, current_task, "current_task");

   function get_current return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/current.h:12
   pragma Import (CPP, get_current, "_ZL11get_currentv");

end asm_current_h;

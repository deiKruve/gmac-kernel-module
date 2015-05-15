pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_clocksource_h is

   --  unsupported macro: VCLOCK_NONE 0
   --  unsupported macro: VCLOCK_TSC 1
   --  unsupported macro: VCLOCK_HPET 2
   --  unsupported macro: VCLOCK_PVCLOCK 3
  -- x86-specific clocksource additions  
   type arch_clocksource_data is record
      vclock_mode : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/clocksource.h:12
   end record;
   pragma Convention (C_Pass_By_Copy, arch_clocksource_data);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/clocksource.h:11

end asm_clocksource_h;

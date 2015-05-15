pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_delay_h is

   procedure use_tsc_delay;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/delay.h:6
   pragma Import (CPP, use_tsc_delay, "_Z13use_tsc_delayv");

end asm_delay_h;

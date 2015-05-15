pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_generic_bitops_sched_h is

  -- unlikely()  
  -- * Every architecture must define this function. It's the fastest
  -- * way of searching a 100-bit bitmap.  It's guaranteed that at least
  -- * one of the 100 bits is cleared.
  --  

   function sched_find_first_bit (b : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/sched.h:12
   pragma Import (CPP, sched_find_first_bit, "_ZL20sched_find_first_bitPKm");

end asm_generic_bitops_sched_h;

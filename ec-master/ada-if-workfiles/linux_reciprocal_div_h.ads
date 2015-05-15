pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package linux_reciprocal_div_h is

  -- * This algorithm is based on the paper "Division by Invariant
  -- * Integers Using Multiplication" by Torbjörn Granlund and Peter
  -- * L. Montgomery.
  -- *
  -- * The assembler implementation from Agner Fog, which this code is
  -- * based on, can be found here:
  -- * http://www.agner.org/optimize/asmlib.zip
  -- *
  -- * This optimization for A/B is helpful if the divisor B is mostly
  -- * runtime invariant. The reciprocal of B is calculated in the
  -- * slow-path with reciprocal_value(). The fast-path can then just use
  -- * a much faster multiplication operation with a variable dividend A
  -- * to calculate the division A/B.
  --  

   type reciprocal_value is record
      m : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/reciprocal_div.h:23
      sh1 : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/reciprocal_div.h:24
      sh2 : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/reciprocal_div.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, reciprocal_value);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/reciprocal_div.h:22

   function reciprocal_value (d : asm_generic_int_ll64_h.u32) return reciprocal_value;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/reciprocal_div.h:27
   pragma Import (CPP, reciprocal_value, "_Z16reciprocal_valuej");

   function reciprocal_divide (a : asm_generic_int_ll64_h.u32; R : reciprocal_value) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/reciprocal_div.h:29
   pragma Import (CPP, reciprocal_divide, "_ZL17reciprocal_dividej16reciprocal_value");

end linux_reciprocal_div_h;

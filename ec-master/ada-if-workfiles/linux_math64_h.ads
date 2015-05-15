pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package linux_math64_h is

   --  arg-macro: procedure div64_long div64_s64((x), (y))
   --    div64_s64((x), (y))
   --  arg-macro: procedure div64_ul div64_u64((x), (y))
   --    div64_u64((x), (y))
  --*
  -- * div_u64_rem - unsigned 64bit divide with 32bit divisor with remainder
  -- *
  -- * This is commonly provided by 32bit archs to provide an optimized 64bit
  -- * divide.
  --  

   function div_u64_rem
     (dividend : asm_generic_int_ll64_h.u64;
      divisor : asm_generic_int_ll64_h.u32;
      remainder : access asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/math64.h:18
   pragma Import (CPP, div_u64_rem, "_ZL11div_u64_remyjPj");

  --*
  -- * div_s64_rem - signed 64bit divide with 32bit divisor with remainder
  --  

   function div_s64_rem
     (dividend : asm_generic_int_ll64_h.s64;
      divisor : asm_generic_int_ll64_h.s32;
      remainder : access asm_generic_int_ll64_h.s32) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/math64.h:27
   pragma Import (CPP, div_s64_rem, "_ZL11div_s64_remxiPi");

  --*
  -- * div64_u64_rem - unsigned 64bit divide with 64bit divisor and remainder
  --  

   function div64_u64_rem
     (dividend : asm_generic_int_ll64_h.u64;
      divisor : asm_generic_int_ll64_h.u64;
      remainder : access asm_generic_int_ll64_h.u64) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/math64.h:36
   pragma Import (CPP, div64_u64_rem, "_ZL13div64_u64_remyyPy");

  --*
  -- * div64_u64 - unsigned 64bit divide with 64bit divisor
  --  

   function div64_u64 (dividend : asm_generic_int_ll64_h.u64; divisor : asm_generic_int_ll64_h.u64) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/math64.h:45
   pragma Import (CPP, div64_u64, "_ZL9div64_u64yy");

  --*
  -- * div64_s64 - signed 64bit divide with 64bit divisor
  --  

   function div64_s64 (dividend : asm_generic_int_ll64_h.s64; divisor : asm_generic_int_ll64_h.s64) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/math64.h:53
   pragma Import (CPP, div64_s64, "_ZL9div64_s64xx");

  --*
  -- * div_u64 - unsigned 64bit divide with 32bit divisor
  -- *
  -- * This is the most common 64bit divide and should be used if possible,
  -- * as many 32bit archs can optimize this variant better than a full 64bit
  -- * divide.
  --  

   function div_u64 (dividend : asm_generic_int_ll64_h.u64; divisor : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/math64.h:97
   pragma Import (CPP, div_u64, "_ZL7div_u64yj");

  --*
  -- * div_s64 - signed 64bit divide with 32bit divisor
  --  

   function div_s64 (dividend : asm_generic_int_ll64_h.s64; divisor : asm_generic_int_ll64_h.s32) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/math64.h:108
   pragma Import (CPP, div_s64, "_ZL7div_s64xi");

   function iter_div_u64_rem
     (dividend : asm_generic_int_ll64_h.u64;
      divisor : asm_generic_int_ll64_h.u32;
      remainder : access asm_generic_int_ll64_h.u64) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/math64.h:115
   pragma Import (CPP, iter_div_u64_rem, "_Z16iter_div_u64_remyjPy");

   --  skipped func __iter_div_u64_rem

  -- The following asm() prevents the compiler from
  --		   optimising this loop into a modulo operation.   

   function mul_u64_u32_shr
     (a : asm_generic_int_ll64_h.u64;
      mul : asm_generic_int_ll64_h.u32;
      shift : unsigned) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/math64.h:139
   pragma Import (CPP, mul_u64_u32_shr, "_ZL15mul_u64_u32_shryjj");

end linux_math64_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_generic_delay_h is

   --  arg-macro: function udelay ({ if (__builtin_constant_p(n)) { if ((n) / 20000 >= 1) __bad_udelay(); else __const_udelay((n) * 0x10c7ul); } else { __udelay(n); } }
   --    return { if (__builtin_constant_p(n)) { if ((n) / 20000 >= 1) __bad_udelay(); else __const_udelay((n) * 0x10c7ul); } else { __udelay(n); } };
   --  arg-macro: function ndelay ({ if (__builtin_constant_p(n)) { if ((n) / 20000 >= 1) __bad_ndelay(); else __const_udelay((n) * 5ul); } else { __ndelay(n); } }
   --    return { if (__builtin_constant_p(n)) { if ((n) / 20000 >= 1) __bad_ndelay(); else __const_udelay((n) * 5ul); } else { __ndelay(n); } };
  -- Undefined functions to get compile-time errors  
   --  skipped func __bad_udelay

   --  skipped func __bad_ndelay

   --  skipped func __udelay

   --  skipped func __ndelay

   --  skipped func __const_udelay

   --  skipped func __delay

  -- * The weird n/20000 thing suppresses a "comparison is always false due to
  -- * limited range of data type" warning with non-const 8-bit arguments.
  --  

  -- 0x10c7 is 2**32 / 1000000 (rounded up)  
  -- 0x5 is 2**32 / 1000000000 (rounded up)  
end asm_generic_delay_h;

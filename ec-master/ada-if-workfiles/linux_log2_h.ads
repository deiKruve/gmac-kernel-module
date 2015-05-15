pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package linux_log2_h is

   --  arg-macro: function ilog2 ( __builtin_constant_p(n) ? ( (n) < 1 ? ____ilog2_NaN() : (n) and (1ULL << 63) ? 63 : (n) and (1ULL << 62) ? 62 : (n) and (1ULL << 61) ? 61 : (n) and (1ULL << 60) ? 60 : (n) and (1ULL << 59) ? 59 : (n) and (1ULL << 58) ? 58 : (n) and (1ULL << 57) ? 57 : (n) and (1ULL << 56) ? 56 : (n) and (1ULL << 55) ? 55 : (n) and (1ULL << 54) ? 54 : (n) and (1ULL << 53) ? 53 : (n) and (1ULL << 52) ? 52 : (n) and (1ULL << 51) ? 51 : (n) and (1ULL << 50) ? 50 : (n) and (1ULL << 49) ? 49 : (n) and (1ULL << 48) ? 48 : (n) and (1ULL << 47) ? 47 : (n) and (1ULL << 46) ? 46 : (n) and (1ULL << 45) ? 45 : (n) and (1ULL << 44) ? 44 : (n) and (1ULL << 43) ? 43 : (n) and (1ULL << 42) ? 42 : (n) and (1ULL << 41) ? 41 : (n) and (1ULL << 40) ? 40 : (n) and (1ULL << 39) ? 39 : (n) and (1ULL << 38) ? 38 : (n) and (1ULL << 37) ? 37 : (n) and (1ULL << 36) ? 36 : (n) and (1ULL << 35) ? 35 : (n) and (1ULL << 34) ? 34 : (n) and (1ULL << 33) ? 33 : (n) and (1ULL << 32) ? 32 : (n) and (1ULL << 31) ? 31 : (n) and (1ULL << 30) ? 30 : (n) and (1ULL << 29) ? 29 : (n) and (1ULL << 28) ? 28 : (n) and (1ULL << 27) ? 27 : (n) and (1ULL << 26) ? 26 : (n) and (1ULL << 25) ? 25 : (n) and (1ULL << 24) ? 24 : (n) and (1ULL << 23) ? 23 : (n) and (1ULL << 22) ? 22 : (n) and (1ULL << 21) ? 21 : (n) and (1ULL << 20) ? 20 : (n) and (1ULL << 19) ? 19 : (n) and (1ULL << 18) ? 18 : (n) and (1ULL << 17) ? 17 : (n) and (1ULL << 16) ? 16 : (n) and (1ULL << 15) ? 15 : (n) and (1ULL << 14) ? 14 : (n) and (1ULL << 13) ? 13 : (n) and (1ULL << 12) ? 12 : (n) and (1ULL << 11) ? 11 : (n) and (1ULL << 10) ? 10 : (n) and (1ULL << 9) ? 9 : (n) and (1ULL << 8) ? 8 : (n) and (1ULL << 7) ? 7 : (n) and (1ULL << 6) ? 6 : (n) and (1ULL << 5) ? 5 : (n) and (1ULL << 4) ? 4 : (n) and (1ULL << 3) ? 3 : (n) and (1ULL << 2) ? 2 : (n) and (1ULL << 1) ? 1 : (n) and (1ULL << 0) ? 0 : ____ilog2_NaN() ) : (sizeof(n) <= 4) ? __ilog2_u32(n) : __ilog2_u64(n) 
   --    return  __builtin_constant_p(n) ? ( (n) < 1 ? ____ilog2_NaN() : (n) and (1ULL << 63) ? 63 : (n) and (1ULL << 62) ? 62 : (n) and (1ULL << 61) ? 61 : (n) and (1ULL << 60) ? 60 : (n) and (1ULL << 59) ? 59 : (n) and (1ULL << 58) ? 58 : (n) and (1ULL << 57) ? 57 : (n) and (1ULL << 56) ? 56 : (n) and (1ULL << 55) ? 55 : (n) and (1ULL << 54) ? 54 : (n) and (1ULL << 53) ? 53 : (n) and (1ULL << 52) ? 52 : (n) and (1ULL << 51) ? 51 : (n) and (1ULL << 50) ? 50 : (n) and (1ULL << 49) ? 49 : (n) and (1ULL << 48) ? 48 : (n) and (1ULL << 47) ? 47 : (n) and (1ULL << 46) ? 46 : (n) and (1ULL << 45) ? 45 : (n) and (1ULL << 44) ? 44 : (n) and (1ULL << 43) ? 43 : (n) and (1ULL << 42) ? 42 : (n) and (1ULL << 41) ? 41 : (n) and (1ULL << 40) ? 40 : (n) and (1ULL << 39) ? 39 : (n) and (1ULL << 38) ? 38 : (n) and (1ULL << 37) ? 37 : (n) and (1ULL << 36) ? 36 : (n) and (1ULL << 35) ? 35 : (n) and (1ULL << 34) ? 34 : (n) and (1ULL << 33) ? 33 : (n) and (1ULL << 32) ? 32 : (n) and (1ULL << 31) ? 31 : (n) and (1ULL << 30) ? 30 : (n) and (1ULL << 29) ? 29 : (n) and (1ULL << 28) ? 28 : (n) and (1ULL << 27) ? 27 : (n) and (1ULL << 26) ? 26 : (n) and (1ULL << 25) ? 25 : (n) and (1ULL << 24) ? 24 : (n) and (1ULL << 23) ? 23 : (n) and (1ULL << 22) ? 22 : (n) and (1ULL << 21) ? 21 : (n) and (1ULL << 20) ? 20 : (n) and (1ULL << 19) ? 19 : (n) and (1ULL << 18) ? 18 : (n) and (1ULL << 17) ? 17 : (n) and (1ULL << 16) ? 16 : (n) and (1ULL << 15) ? 15 : (n) and (1ULL << 14) ? 14 : (n) and (1ULL << 13) ? 13 : (n) and (1ULL << 12) ? 12 : (n) and (1ULL << 11) ? 11 : (n) and (1ULL << 10) ? 10 : (n) and (1ULL << 9) ? 9 : (n) and (1ULL << 8) ? 8 : (n) and (1ULL << 7) ? 7 : (n) and (1ULL << 6) ? 6 : (n) and (1ULL << 5) ? 5 : (n) and (1ULL << 4) ? 4 : (n) and (1ULL << 3) ? 3 : (n) and (1ULL << 2) ? 2 : (n) and (1ULL << 1) ? 1 : (n) and (1ULL << 0) ? 0 : ____ilog2_NaN() ) : (sizeof(n) <= 4) ? __ilog2_u32(n) : __ilog2_u64(n) ;
   --  arg-macro: function roundup_pow_of_two ( __builtin_constant_p(n) ? ( (n = 1) ? 1 : (1UL << (ilog2((n) - 1) + 1)) ) : __roundup_pow_of_two(n) 
   --    return  __builtin_constant_p(n) ? ( (n = 1) ? 1 : (1UL << (ilog2((n) - 1) + 1)) ) : __roundup_pow_of_two(n) ;
   --  arg-macro: function rounddown_pow_of_two ( __builtin_constant_p(n) ? ( (1UL << ilog2(n))) : __rounddown_pow_of_two(n) 
   --    return  __builtin_constant_p(n) ? ( (1UL << ilog2(n))) : __rounddown_pow_of_two(n) ;
   --  arg-macro: procedure order_base_2 ilog2(roundup_pow_of_two(n))
   --    ilog2(roundup_pow_of_two(n))
  -- Integer base 2 logarithm calculation
  -- *
  -- * Copyright (C) 2006 Red Hat, Inc. All Rights Reserved.
  -- * Written by David Howells (dhowells@redhat.com)
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public License
  -- * as published by the Free Software Foundation; either version
  -- * 2 of the License, or (at your option) any later version.
  --  

  -- * deal with unrepresentable constant logarithms
  --  

   --  skipped func ____ilog2_NaN

  -- * non-constant log of base 2 calculators
  -- * - the arch may override these in asm/bitops.h if they can be implemented
  -- *   more efficiently than using fls() and fls64()
  -- * - the arch is not required to handle n==0 if implementing the fallback
  --  

   --  skipped func __ilog2_u32

   --  skipped func __ilog2_u64

  -- *  Determine whether some value is a power of two, where zero is
  -- * *not* considered a power of two.
  --  

   function is_power_of_2 (n : unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/log2.h:52
   pragma Import (CPP, is_power_of_2, "_ZL13is_power_of_2m");

  -- * round up to nearest power of two
  --  

   --  skipped func __roundup_pow_of_two

  -- * round down to nearest power of two
  --  

   --  skipped func __rounddown_pow_of_two

  --*
  -- * ilog2 - log of base 2 of 32-bit or a 64-bit unsigned value
  -- * @n - parameter
  -- *
  -- * constant-capable log of base 2 calculation
  -- * - this can be used to initialise global variables from constant data, hence
  -- *   the massive ternary operator construction
  -- *
  -- * selects the appropriately-sized optimised version depending on sizeof(n)
  --  

  --*
  -- * roundup_pow_of_two - round the given value up to nearest power of two
  -- * @n - parameter
  -- *
  -- * round the given value up to the nearest power of two
  -- * - the result is undefined when n == 0
  -- * - this can be used to initialise global variables from constant data
  --  

  --*
  -- * rounddown_pow_of_two - round the given value down to nearest power of two
  -- * @n - parameter
  -- *
  -- * round the given value down to the nearest power of two
  -- * - the result is undefined when n == 0
  -- * - this can be used to initialise global variables from constant data
  --  

  --*
  -- * order_base_2 - calculate the (rounded up) base 2 order of the argument
  -- * @n: parameter
  -- *
  -- * The first few values calculated by this routine:
  -- *  ob2(0) = 0
  -- *  ob2(1) = 0
  -- *  ob2(2) = 1
  -- *  ob2(3) = 2
  -- *  ob2(4) = 2
  -- *  ob2(5) = 3
  -- *  ... and so on.
  --  

end linux_log2_h;

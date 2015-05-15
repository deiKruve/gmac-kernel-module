pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package linux_bitops_h is

   --  arg-macro: function BIT (1UL << (nr)
   --    return 1UL << (nr);
   --  arg-macro: function BIT_ULL (1ULL << (nr)
   --    return 1ULL << (nr);
   --  arg-macro: function BIT_MASK (1UL << ((nr) mod BITS_PER_LONG)
   --    return 1UL << ((nr) mod BITS_PER_LONG);
   --  arg-macro: function BIT_WORD ((nr) / BITS_PER_LONG
   --    return (nr) / BITS_PER_LONG;
   --  arg-macro: function BIT_ULL_MASK (1ULL << ((nr) mod BITS_PER_LONG_LONG)
   --    return 1ULL << ((nr) mod BITS_PER_LONG_LONG);
   --  arg-macro: function BIT_ULL_WORD ((nr) / BITS_PER_LONG_LONG
   --    return (nr) / BITS_PER_LONG_LONG;
   --  unsupported macro: BITS_PER_BYTE 8
   --  arg-macro: procedure BITS_TO_LONGS DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(long))
   --    DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(long))
   --  arg-macro: function GENMASK (((~0UL) << (l)) and (~0UL >> (BITS_PER_LONG - 1 - (h)))
   --    return ((~0UL) << (l)) and (~0UL >> (BITS_PER_LONG - 1 - (h)));
   --  arg-macro: function GENMASK_ULL (((~0ULL) << (l)) and (~0ULL >> (BITS_PER_LONG_LONG - 1 - (h)))
   --    return ((~0ULL) << (l)) and (~0ULL >> (BITS_PER_LONG_LONG - 1 - (h)));
   --  arg-macro: procedure for_each_set_bit for ((bit) := find_first_bit((addr), (size)); (bit) < (size); (bit) := find_next_bit((addr), (size), (bit) + 1))
   --    for ((bit) := find_first_bit((addr), (size)); (bit) < (size); (bit) := find_next_bit((addr), (size), (bit) + 1))
   --  arg-macro: procedure for_each_set_bit_from for ((bit) := find_next_bit((addr), (size), (bit)); (bit) < (size); (bit) := find_next_bit((addr), (size), (bit) + 1))
   --    for ((bit) := find_next_bit((addr), (size), (bit)); (bit) < (size); (bit) := find_next_bit((addr), (size), (bit) + 1))
   --  arg-macro: procedure for_each_clear_bit for ((bit) := find_first_zero_bit((addr), (size)); (bit) < (size); (bit) := find_next_zero_bit((addr), (size), (bit) + 1))
   --    for ((bit) := find_first_zero_bit((addr), (size)); (bit) < (size); (bit) := find_next_zero_bit((addr), (size), (bit) + 1))
   --  arg-macro: procedure for_each_clear_bit_from for ((bit) := find_next_zero_bit((addr), (size), (bit)); (bit) < (size); (bit) := find_next_zero_bit((addr), (size), (bit) + 1))
   --    for ((bit) := find_next_zero_bit((addr), (size), (bit)); (bit) < (size); (bit) := find_next_zero_bit((addr), (size), (bit) + 1))
   --  arg-macro: function set_mask_bits ({ const typeof(*ptr) mask := (_mask), bits := (_bits); typeof(*ptr) old, new; do { old := ACCESS_ONCE(*ptr); new := (old and ~mask) or bits; } while (cmpxchg(ptr, old, new) /= old); new; }
   --    return { const typeof(*ptr) mask := (_mask), bits := (_bits); typeof(*ptr) old, new; do { old := ACCESS_ONCE(*ptr); new := (old and ~mask) or bits; } while (cmpxchg(ptr, old, new) /= old); new; };
  -- * Create a contiguous bitmask starting at bit position @l and ending at
  -- * position @h. For example
  -- * GENMASK_ULL(39, 21) gives us the 64bit vector 0x000000ffffe00000.
  --  

   --  skipped func __sw_hweight8

   --  skipped func __sw_hweight16

   --  skipped func __sw_hweight32

   --  skipped func __sw_hweight64

  -- * Include this here because some architectures need generic_ffs/fls in
  -- * scope
  --  

  -- * Provide __deprecated wrappers for the new interface, avoid flag day changes.
  -- * We need the ugly external functions to break header recursion hell.
  --  

   procedure smp_mb_u_before_clear_bit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:43
   pragma Import (CPP, smp_mb_u_before_clear_bit, "_ZL24smp_mb__before_clear_bitv");

   procedure smp_mb_u_after_clear_bit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:51
   pragma Import (CPP, smp_mb_u_after_clear_bit, "_ZL23smp_mb__after_clear_bitv");

  -- same as for_each_set_bit() but use bit as value to start with  
  -- same as for_each_clear_bit() but use bit as value to start with  
   function get_bitmask_order (count : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:80
   pragma Import (CPP, get_bitmask_order, "_ZL17get_bitmask_orderj");

  -- We could be slightly more clever with -1 here...  
   function get_count_order (count : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:88
   pragma Import (CPP, get_count_order, "_ZL15get_count_orderj");

   function hweight_long (w : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:98
   pragma Import (CPP, hweight_long, "_ZL12hweight_longm");

  --*
  -- * rol64 - rotate a 64-bit value left
  -- * @word: value to rotate
  -- * @shift: bits to roll
  --  

   function rol64 (word : uapi_asm_generic_int_ll64_h.uu_u64; shift : unsigned) return uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:108
   pragma Import (CPP, rol64, "_ZL5rol64yj");

  --*
  -- * ror64 - rotate a 64-bit value right
  -- * @word: value to rotate
  -- * @shift: bits to roll
  --  

   function ror64 (word : uapi_asm_generic_int_ll64_h.uu_u64; shift : unsigned) return uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:118
   pragma Import (CPP, ror64, "_ZL5ror64yj");

  --*
  -- * rol32 - rotate a 32-bit value left
  -- * @word: value to rotate
  -- * @shift: bits to roll
  --  

   function rol32 (word : uapi_asm_generic_int_ll64_h.uu_u32; shift : unsigned) return uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:128
   pragma Import (CPP, rol32, "_ZL5rol32jj");

  --*
  -- * ror32 - rotate a 32-bit value right
  -- * @word: value to rotate
  -- * @shift: bits to roll
  --  

   function ror32 (word : uapi_asm_generic_int_ll64_h.uu_u32; shift : unsigned) return uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:138
   pragma Import (CPP, ror32, "_ZL5ror32jj");

  --*
  -- * rol16 - rotate a 16-bit value left
  -- * @word: value to rotate
  -- * @shift: bits to roll
  --  

   function rol16 (word : uapi_asm_generic_int_ll64_h.uu_u16; shift : unsigned) return uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:148
   pragma Import (CPP, rol16, "_ZL5rol16tj");

  --*
  -- * ror16 - rotate a 16-bit value right
  -- * @word: value to rotate
  -- * @shift: bits to roll
  --  

   function ror16 (word : uapi_asm_generic_int_ll64_h.uu_u16; shift : unsigned) return uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:158
   pragma Import (CPP, ror16, "_ZL5ror16tj");

  --*
  -- * rol8 - rotate an 8-bit value left
  -- * @word: value to rotate
  -- * @shift: bits to roll
  --  

   function rol8 (word : uapi_asm_generic_int_ll64_h.uu_u8; shift : unsigned) return uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:168
   pragma Import (CPP, rol8, "_ZL4rol8hj");

  --*
  -- * ror8 - rotate an 8-bit value right
  -- * @word: value to rotate
  -- * @shift: bits to roll
  --  

   function ror8 (word : uapi_asm_generic_int_ll64_h.uu_u8; shift : unsigned) return uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:178
   pragma Import (CPP, ror8, "_ZL4ror8hj");

  --*
  -- * sign_extend32 - sign extend a 32-bit value using specified bit as sign-bit
  -- * @value: value to sign extend
  -- * @index: 0 based bit index (0<=index<32) to sign bit
  --  

   function sign_extend32 (value : uapi_asm_generic_int_ll64_h.uu_u32; index : int) return uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:188
   pragma Import (CPP, sign_extend32, "_ZL13sign_extend32ji");

   function fls_long (l : unsigned_long) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:194
   pragma Import (CPP, fls_long, "_ZL8fls_longm");

  --*
  -- * __ffs64 - find first set bit in a 64 bit word
  -- * @word: The 64 bit word
  -- *
  -- * On 64 bit arches this is a synomyn for __ffs
  -- * The result is not defined if no bits are set, so check that @word
  -- * is non-zero before calling this.
  --  

   --  skipped func __ffs64

  --*
  -- * find_last_bit - find the last set bit in a memory region
  -- * @addr: The address to start the search at
  -- * @size: The maximum size to search
  -- *
  -- * Returns the bit number of the first set bit, or size.
  --  

   function find_last_bit (addr : access unsigned_long; size : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitops.h:245
   pragma Import (CPP, find_last_bit, "_Z13find_last_bitPKmm");

end linux_bitops_h;

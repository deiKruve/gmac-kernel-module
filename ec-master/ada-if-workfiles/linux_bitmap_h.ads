pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

package linux_bitmap_h is

   --  arg-macro: function BITMAP_FIRST_WORD_MASK (~0UL << ((start) mod BITS_PER_LONG)
   --    return ~0UL << ((start) mod BITS_PER_LONG);
   --  arg-macro: function BITMAP_LAST_WORD_MASK ( ((nbits) mod BITS_PER_LONG) ? (1UL<<((nbits) mod BITS_PER_LONG))-1 : ~0UL 
   --    return  ((nbits) mod BITS_PER_LONG) ? (1UL<<((nbits) mod BITS_PER_LONG))-1 : ~0UL ;
   --  arg-macro: function small_const_nbits (__builtin_constant_p(nbits)  and then  (nbits) <= BITS_PER_LONG
   --    return __builtin_constant_p(nbits)  and then  (nbits) <= BITS_PER_LONG;
  -- * bitmaps provide bit arrays that consume one or more unsigned
  -- * longs.  The bitmap interface and available operations are listed
  -- * here, in bitmap.h
  -- *
  -- * Function implementations generic to all architectures are in
  -- * lib/bitmap.c.  Functions implementations that are architecture
  -- * specific are in various include/asm-<arch>/bitops.h headers
  -- * and other arch/<arch> specific files.
  -- *
  -- * See lib/bitmap.c for more details.
  --  

  -- * The available bitmap operations and their rough meaning in the
  -- * case that the bitmap is a single unsigned long are thus:
  -- *
  -- * Note that nbits should be always a compile time evaluable constant.
  -- * Otherwise many inlines will generate horrible code.
  -- *
  -- * bitmap_zero(dst, nbits)			*dst = 0UL
  -- * bitmap_fill(dst, nbits)			*dst = ~0UL
  -- * bitmap_copy(dst, src, nbits)			*dst = *src
  -- * bitmap_and(dst, src1, src2, nbits)		*dst = *src1 & *src2
  -- * bitmap_or(dst, src1, src2, nbits)		*dst = *src1 | *src2
  -- * bitmap_xor(dst, src1, src2, nbits)		*dst = *src1 ^ *src2
  -- * bitmap_andnot(dst, src1, src2, nbits)	*dst = *src1 & ~(*src2)
  -- * bitmap_complement(dst, src, nbits)		*dst = ~(*src)
  -- * bitmap_equal(src1, src2, nbits)		Are *src1 and *src2 equal?
  -- * bitmap_intersects(src1, src2, nbits) 	Do *src1 and *src2 overlap?
  -- * bitmap_subset(src1, src2, nbits)		Is *src1 a subset of *src2?
  -- * bitmap_empty(src, nbits)			Are all bits zero in *src?
  -- * bitmap_full(src, nbits)			Are all bits set in *src?
  -- * bitmap_weight(src, nbits)			Hamming Weight: number set bits
  -- * bitmap_set(dst, pos, nbits)			Set specified bit area
  -- * bitmap_clear(dst, pos, nbits)		Clear specified bit area
  -- * bitmap_find_next_zero_area(buf, len, pos, n, mask)	Find bit free area
  -- * bitmap_shift_right(dst, src, n, nbits)	*dst = *src >> n
  -- * bitmap_shift_left(dst, src, n, nbits)	*dst = *src << n
  -- * bitmap_remap(dst, src, old, new, nbits)	*dst = map(old, new)(src)
  -- * bitmap_bitremap(oldbit, old, new, nbits)	newbit = map(old, new)(oldbit)
  -- * bitmap_onto(dst, orig, relmap, nbits)	*dst = orig relative to relmap
  -- * bitmap_fold(dst, orig, sz, nbits)		dst bits = orig bits mod sz
  -- * bitmap_scnprintf(buf, len, src, nbits)	Print bitmap src to buf
  -- * bitmap_parse(buf, buflen, dst, nbits)	Parse bitmap dst from kernel buf
  -- * bitmap_parse_user(ubuf, ulen, dst, nbits)	Parse bitmap dst from user buf
  -- * bitmap_scnlistprintf(buf, len, src, nbits)	Print bitmap src as list to buf
  -- * bitmap_parselist(buf, dst, nbits)		Parse bitmap dst from kernel buf
  -- * bitmap_parselist_user(buf, dst, nbits)	Parse bitmap dst from user buf
  -- * bitmap_find_free_region(bitmap, bits, order)	Find and allocate bit region
  -- * bitmap_release_region(bitmap, pos, order)	Free specified bit region
  -- * bitmap_allocate_region(bitmap, pos, order)	Allocate specified bit region
  --  

  -- * Also the following operations in asm/bitops.h apply to bitmaps.
  -- *
  -- * set_bit(bit, addr)			*addr |= bit
  -- * clear_bit(bit, addr)			*addr &= ~bit
  -- * change_bit(bit, addr)		*addr ^= bit
  -- * test_bit(bit, addr)			Is bit set in *addr?
  -- * test_and_set_bit(bit, addr)		Set bit and return old value
  -- * test_and_clear_bit(bit, addr)	Clear bit and return old value
  -- * test_and_change_bit(bit, addr)	Change bit and return old value
  -- * find_first_zero_bit(addr, nbits)	Position first zero bit in *addr
  -- * find_first_bit(addr, nbits)		Position first set bit in *addr
  -- * find_next_zero_bit(addr, nbits, bit)	Position next zero bit in *addr >= bit
  -- * find_next_bit(addr, nbits, bit)	Position next set bit in *addr >= bit
  --  

  -- * The DECLARE_BITMAP(name,bits) macro, in linux/types.h, can be used
  -- * to declare an array named 'name' of just enough unsigned longs to
  -- * contain all bit positions from 0 to 'bits' - 1.
  --  

  -- * lib/bitmap.c provides these functions:
  --  

   --  skipped func __bitmap_empty

   --  skipped func __bitmap_full

   --  skipped func __bitmap_equal

   --  skipped func __bitmap_complement

   --  skipped func __bitmap_shift_right

   --  skipped func __bitmap_shift_left

   --  skipped func __bitmap_and

   --  skipped func __bitmap_or

   --  skipped func __bitmap_xor

   --  skipped func __bitmap_andnot

   --  skipped func __bitmap_intersects

   --  skipped func __bitmap_subset

   --  skipped func __bitmap_weight

   procedure bitmap_set
     (map : access unsigned_long;
      i : int;
      len : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:115
   pragma Import (CPP, bitmap_set, "_Z10bitmap_setPmii");

   procedure bitmap_clear
     (map : access unsigned_long;
      start : int;
      nr : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:116
   pragma Import (CPP, bitmap_clear, "_Z12bitmap_clearPmii");

   function bitmap_find_next_zero_area
     (map : access unsigned_long;
      size : unsigned_long;
      start : unsigned_long;
      nr : unsigned;
      align_mask : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:117
   pragma Import (CPP, bitmap_find_next_zero_area, "_Z26bitmap_find_next_zero_areaPmmmjm");

   function bitmap_scnprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      len : unsigned;
      src : access unsigned_long;
      nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:123
   pragma Import (CPP, bitmap_scnprintf, "_Z16bitmap_scnprintfPcjPKmi");

   --  skipped func __bitmap_parse

   function bitmap_parse_user
     (ubuf : Interfaces.C.Strings.chars_ptr;
      ulen : unsigned;
      dst : access unsigned_long;
      nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:127
   pragma Import (CPP, bitmap_parse_user, "_Z17bitmap_parse_userPKcjPmi");

   function bitmap_scnlistprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      len : unsigned;
      src : access unsigned_long;
      nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:129
   pragma Import (CPP, bitmap_scnlistprintf, "_Z20bitmap_scnlistprintfPcjPKmi");

   function bitmap_parselist
     (buf : Interfaces.C.Strings.chars_ptr;
      maskp : access unsigned_long;
      nmaskbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:131
   pragma Import (CPP, bitmap_parselist, "_Z16bitmap_parselistPKcPmi");

   function bitmap_parselist_user
     (ubuf : Interfaces.C.Strings.chars_ptr;
      ulen : unsigned;
      dst : access unsigned_long;
      nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:133
   pragma Import (CPP, bitmap_parselist_user, "_Z21bitmap_parselist_userPKcjPmi");

   procedure bitmap_remap
     (dst : access unsigned_long;
      src : access unsigned_long;
      old : access unsigned_long;
      arg4 : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:135
   pragma Import (CPP, bitmap_remap, "_Z12bitmap_remapPmPKmS1_S1_");

   function bitmap_bitremap
     (oldbit : int;
      old : access unsigned_long;
      arg3 : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:137
   pragma Import (CPP, bitmap_bitremap, "_Z15bitmap_bitremapiPKmS0_");

   procedure bitmap_onto
     (dst : access unsigned_long;
      orig : access unsigned_long;
      relmap : access unsigned_long;
      bits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:139
   pragma Import (CPP, bitmap_onto, "_Z11bitmap_ontoPmPKmS1_i");

   procedure bitmap_fold
     (dst : access unsigned_long;
      orig : access unsigned_long;
      sz : int;
      bits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:141
   pragma Import (CPP, bitmap_fold, "_Z11bitmap_foldPmPKmii");

   function bitmap_find_free_region
     (bitmap : access unsigned_long;
      bits : int;
      order : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:143
   pragma Import (CPP, bitmap_find_free_region, "_Z23bitmap_find_free_regionPmii");

   procedure bitmap_release_region
     (bitmap : access unsigned_long;
      pos : int;
      order : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:144
   pragma Import (CPP, bitmap_release_region, "_Z21bitmap_release_regionPmii");

   function bitmap_allocate_region
     (bitmap : access unsigned_long;
      pos : int;
      order : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:145
   pragma Import (CPP, bitmap_allocate_region, "_Z22bitmap_allocate_regionPmii");

   procedure bitmap_copy_le
     (dst : System.Address;
      src : access unsigned_long;
      nbits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:146
   pragma Import (CPP, bitmap_copy_le, "_Z14bitmap_copy_lePvPKmi");

   function bitmap_ord_to_pos
     (bitmap : access unsigned_long;
      n : int;
      bits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:147
   pragma Import (CPP, bitmap_ord_to_pos, "_Z17bitmap_ord_to_posPKmii");

   procedure bitmap_zero (dst : access unsigned_long; nbits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:159
   pragma Import (CPP, bitmap_zero, "_ZL11bitmap_zeroPmi");

   procedure bitmap_fill (dst : access unsigned_long; nbits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:169
   pragma Import (CPP, bitmap_fill, "_ZL11bitmap_fillPmi");

   procedure bitmap_copy
     (dst : access unsigned_long;
      src : access unsigned_long;
      nbits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:179
   pragma Import (CPP, bitmap_copy, "_ZL11bitmap_copyPmPKmi");

   function bitmap_and
     (dst : access unsigned_long;
      src1 : access unsigned_long;
      src2 : access unsigned_long;
      nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:190
   pragma Import (CPP, bitmap_and, "_ZL10bitmap_andPmPKmS1_i");

   procedure bitmap_or
     (dst : access unsigned_long;
      src1 : access unsigned_long;
      src2 : access unsigned_long;
      nbits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:198
   pragma Import (CPP, bitmap_or, "_ZL9bitmap_orPmPKmS1_i");

   procedure bitmap_xor
     (dst : access unsigned_long;
      src1 : access unsigned_long;
      src2 : access unsigned_long;
      nbits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:207
   pragma Import (CPP, bitmap_xor, "_ZL10bitmap_xorPmPKmS1_i");

   function bitmap_andnot
     (dst : access unsigned_long;
      src1 : access unsigned_long;
      src2 : access unsigned_long;
      nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:216
   pragma Import (CPP, bitmap_andnot, "_ZL13bitmap_andnotPmPKmS1_i");

   procedure bitmap_complement
     (dst : access unsigned_long;
      src : access unsigned_long;
      nbits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:224
   pragma Import (CPP, bitmap_complement, "_ZL17bitmap_complementPmPKmi");

   function bitmap_equal
     (src1 : access unsigned_long;
      src2 : access unsigned_long;
      nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:233
   pragma Import (CPP, bitmap_equal, "_ZL12bitmap_equalPKmS0_i");

   function bitmap_intersects
     (src1 : access unsigned_long;
      src2 : access unsigned_long;
      nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:242
   pragma Import (CPP, bitmap_intersects, "_ZL17bitmap_intersectsPKmS0_i");

   function bitmap_subset
     (src1 : access unsigned_long;
      src2 : access unsigned_long;
      nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:251
   pragma Import (CPP, bitmap_subset, "_ZL13bitmap_subsetPKmS0_i");

   function bitmap_empty (src : access unsigned_long; nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:260
   pragma Import (CPP, bitmap_empty, "_ZL12bitmap_emptyPKmi");

   function bitmap_full (src : access unsigned_long; nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:268
   pragma Import (CPP, bitmap_full, "_ZL11bitmap_fullPKmi");

   function bitmap_weight (src : access unsigned_long; nbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:276
   pragma Import (CPP, bitmap_weight, "_ZL13bitmap_weightPKmi");

   procedure bitmap_shift_right
     (dst : access unsigned_long;
      src : access unsigned_long;
      n : int;
      nbits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:283
   pragma Import (CPP, bitmap_shift_right, "_ZL18bitmap_shift_rightPmPKmii");

   procedure bitmap_shift_left
     (dst : access unsigned_long;
      src : access unsigned_long;
      n : int;
      nbits : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:292
   pragma Import (CPP, bitmap_shift_left, "_ZL17bitmap_shift_leftPmPKmii");

   function bitmap_parse
     (buf : Interfaces.C.Strings.chars_ptr;
      buflen : unsigned;
      maskp : access unsigned_long;
      nmaskbits : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bitmap.h:301
   pragma Import (CPP, bitmap_parse, "_ZL12bitmap_parsePKcjPmi");

end linux_bitmap_h;

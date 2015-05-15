pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uapi_linux_swab_h is

  -- * casts are necessary for constants, because we never know how for sure
  -- * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
  --  

  -- * Implement the following as inlines, but define the interface using
  -- * macros to allow constant folding when possible:
  -- * ___swab16, ___swab32, ___swab64, ___swahw32, ___swahb32
  --  

   --  skipped func __fswab16

   --  skipped func __fswab32

   --  skipped func __fswab64

   --  skipped func __fswahw32

   --  skipped func __fswahb32

  --*
  -- * __swab16 - return a byteswapped 16-bit value
  -- * @x: value to byteswap
  --  

  --*
  -- * __swab32 - return a byteswapped 32-bit value
  -- * @x: value to byteswap
  --  

  --*
  -- * __swab64 - return a byteswapped 64-bit value
  -- * @x: value to byteswap
  --  

  --*
  -- * __swahw32 - return a word-swapped 32-bit value
  -- * @x: value to wordswap
  -- *
  -- * __swahw32(0x12340000) is 0x00001234
  --  

  --*
  -- * __swahb32 - return a high and low byte-swapped 32-bit value
  -- * @x: value to byteswap
  -- *
  -- * __swahb32(0x12345678) is 0x34127856
  --  

  --*
  -- * __swab16p - return a byteswapped 16-bit value from a pointer
  -- * @p: pointer to a naturally-aligned 16-bit value
  --  

   --  skipped func __swab16p

  --*
  -- * __swab32p - return a byteswapped 32-bit value from a pointer
  -- * @p: pointer to a naturally-aligned 32-bit value
  --  

   --  skipped func __swab32p

  --*
  -- * __swab64p - return a byteswapped 64-bit value from a pointer
  -- * @p: pointer to a naturally-aligned 64-bit value
  --  

   --  skipped func __swab64p

  --*
  -- * __swahw32p - return a wordswapped 32-bit value from a pointer
  -- * @p: pointer to a naturally-aligned 32-bit value
  -- *
  -- * See __swahw32() for details of wordswapping.
  --  

   --  skipped func __swahw32p

  --*
  -- * __swahb32p - return a high and low byteswapped 32-bit value from a pointer
  -- * @p: pointer to a naturally-aligned 32-bit value
  -- *
  -- * See __swahb32() for details of high/low byteswapping.
  --  

   --  skipped func __swahb32p

  --*
  -- * __swab16s - byteswap a 16-bit value in-place
  -- * @p: pointer to a naturally-aligned 16-bit value
  --  

   --  skipped func __swab16s

  --*
  -- * __swab32s - byteswap a 32-bit value in-place
  -- * @p: pointer to a naturally-aligned 32-bit value
  --  

   --  skipped func __swab32s

  --*
  -- * __swab64s - byteswap a 64-bit value in-place
  -- * @p: pointer to a naturally-aligned 64-bit value
  --  

   --  skipped func __swab64s

  --*
  -- * __swahw32s - wordswap a 32-bit value in-place
  -- * @p: pointer to a naturally-aligned 32-bit value
  -- *
  -- * See __swahw32() for details of wordswapping
  --  

   --  skipped func __swahw32s

  --*
  -- * __swahb32s - high and low byteswap a 32-bit value in-place
  -- * @p: pointer to a naturally-aligned 32-bit value
  -- *
  -- * See __swahb32() for details of high and low byte swapping
  --  

   --  skipped func __swahb32s

end uapi_linux_swab_h;

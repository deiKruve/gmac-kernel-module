pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package asm_generic_int_ll64_h is

   --  arg-macro: procedure S8_C x
   --    x
   --  unsupported macro: U8_C(x) x ## U
   --  arg-macro: procedure S16_C x
   --    x
   --  unsupported macro: U16_C(x) x ## U
   --  arg-macro: procedure S32_C x
   --    x
   --  unsupported macro: U32_C(x) x ## U
   --  unsupported macro: S64_C(x) x ## LL
   --  unsupported macro: U64_C(x) x ## ULL
  -- * asm-generic/int-ll64.h
  -- *
  -- * Integer declarations for architectures which use "long long"
  -- * for 64-bit types.
  --  

   subtype s8 is signed_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/int-ll64.h:15

   subtype u8 is unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/int-ll64.h:16

   subtype s16 is short;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/int-ll64.h:18

   subtype u16 is unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/int-ll64.h:19

   subtype s32 is int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/int-ll64.h:21

   subtype u32 is unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/int-ll64.h:22

   subtype s64 is Long_Long_Integer;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/int-ll64.h:24

   subtype u64 is Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/int-ll64.h:25

end asm_generic_int_ll64_h;

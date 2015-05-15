pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package uapi_asm_generic_int_ll64_h is

  -- * asm-generic/int-ll64.h
  -- *
  -- * Integer declarations for architectures which use "long long"
  -- * for 64-bit types.
  --  

  -- * __xx is ok: it doesn't pollute the POSIX namespace. Use these in the
  -- * header files exported to user space
  --  

   subtype uu_s8 is signed_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/int-ll64.h:19

   subtype uu_u8 is unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/int-ll64.h:20

   subtype uu_s16 is short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/int-ll64.h:22

   subtype uu_u16 is unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/int-ll64.h:23

   subtype uu_s32 is int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/int-ll64.h:25

   subtype uu_u32 is unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/int-ll64.h:26

   subtype uu_s64 is Long_Long_Integer;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/int-ll64.h:29

   subtype uu_u64 is Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/int-ll64.h:30

end uapi_asm_generic_int_ll64_h;

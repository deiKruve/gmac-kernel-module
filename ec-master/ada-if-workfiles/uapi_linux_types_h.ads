pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_types_h is

  -- * Below are truly Linux-specific types that should never collide with
  -- * any application/library that wants linux/types.h.
  --  

   subtype uu_le16 is uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/types.h:32

   subtype uu_be16 is uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/types.h:33

   subtype uu_le32 is uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/types.h:34

   subtype uu_be32 is uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/types.h:35

   subtype uu_le64 is uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/types.h:36

   subtype uu_be64 is uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/types.h:37

   subtype uu_sum16 is uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/types.h:39

   subtype uu_wsum is uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/types.h:40

  -- * aligned_u64 should be used in defining kernel<->userspace ABIs to avoid
  -- * common 32/64-bit compat problems.
  -- * 64-bit values align to 4-byte boundaries on x86_32 (and possibly other
  -- * architectures) and to 8-byte boundaries on 64-bit architectures.  The new
  -- * aligned_64 type enforces 8-byte alignment so that structs containing
  -- * aligned_64 values have the same alignment on 32-bit and 64-bit architectures.
  -- * No conversions are necessary between 32-bit user-space and a 64-bit kernel.
  --  

end uapi_linux_types_h;

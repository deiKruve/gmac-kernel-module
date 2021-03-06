pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uapi_asm_posix_types_64_h is

  -- * This file is generally used by user-level software, so you need to
  -- * be a little careful about namespace pollution etc.  Also, we cannot
  -- * assume GCC is being used.
  --  

   subtype uu_kernel_old_uid_t is unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/posix_types_64.h:10

   subtype uu_kernel_old_gid_t is unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/posix_types_64.h:11

   subtype uu_kernel_old_dev_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/posix_types_64.h:14

end uapi_asm_posix_types_64_h;

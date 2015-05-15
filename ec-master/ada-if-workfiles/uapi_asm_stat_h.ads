pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_posix_types_h;

package uapi_asm_stat_h is

   --  unsupported macro: STAT_HAVE_NSEC 1
   --  arg-macro: procedure INIT_STRUCT_STAT_PADDING do { st.__pad0 := 0; st.__unused(0) := 0; st.__unused(1) := 0; st.__unused(2) := 0; } while (0)
   --    do { st.__pad0 := 0; st.__unused(0) := 0; st.__unused(1) := 0; st.__unused(2) := 0; } while (0)
  -- We don't need to memset the whole thing just to initialize the padding  
  -- This matches struct stat64 in glibc2.1, hence the absolutely
  -- * insane amounts of padding around dev_t's.
  --  

  -- Number 512-byte blocks allocated.  
  -- We don't need to memset the whole thing just to initialize the padding  
   type stat_uu_unused_array is array (0 .. 2) of aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;
   type stat is record
      st_dev : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:83
      st_ino : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:84
      st_nlink : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:85
      st_mode : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:87
      st_uid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:88
      st_gid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:89
      uu_pad0 : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:90
      st_rdev : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:91
      st_size : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:92
      st_blksize : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:93
      st_blocks : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:94
      st_atime : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:96
      st_atime_nsec : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:97
      st_mtime : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:98
      st_mtime_nsec : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:99
      st_ctime : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:100
      st_ctime_nsec : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:101
      uu_unused : aliased stat_uu_unused_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:102
   end record;
   pragma Convention (C_Pass_By_Copy, stat);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:82

  -- Number 512-byte blocks allocated.  
  -- We don't need to memset the whole thing just to initialize the padding  
  -- for 32bit emulation and 32 bit kernels  
   type uu_old_kernel_stat is record
      st_dev : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:117
      st_ino : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:118
      st_mode : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:119
      st_nlink : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:120
      st_uid : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:121
      st_gid : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:122
      st_rdev : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:123
      st_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:130
      st_atime : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:131
      st_mtime : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:132
      st_ctime : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:133
   end record;
   pragma Convention (C_Pass_By_Copy, uu_old_kernel_stat);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/stat.h:116

end uapi_asm_stat_h;

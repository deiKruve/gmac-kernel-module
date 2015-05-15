pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_posix_types_h;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_sysinfo_h is

   --  unsupported macro: SI_LOAD_SHIFT 16
  -- Seconds since boot  
   type sysinfo_loads_array is array (0 .. 2) of aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;
   subtype sysinfo_u_f_array is Interfaces.C.char_array (0 .. -1);
   type sysinfo is record
      uptime : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:8
      loads : aliased sysinfo_loads_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:9
      totalram : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:10
      freeram : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:11
      sharedram : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:12
      bufferram : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:13
      totalswap : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:14
      freeswap : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:15
      procs : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:16
      pad : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:17
      totalhigh : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:18
      freehigh : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:19
      mem_unit : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:20
      u_f : aliased sysinfo_u_f_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:21
   end record;
   pragma Convention (C_Pass_By_Copy, sysinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sysinfo.h:7

  -- 1, 5, and 15 minute load averages  
  -- Total usable main memory size  
  -- Available memory size  
  -- Amount of shared memory  
  -- Memory used by buffers  
  -- Total swap space size  
  -- swap space still available  
  -- Number of current processes  
  -- Explicit padding for m68k  
  -- Total high memory size  
  -- Available high memory size  
  -- Memory unit size in bytes  
  -- Padding: libc5 uses this..  
end uapi_linux_sysinfo_h;

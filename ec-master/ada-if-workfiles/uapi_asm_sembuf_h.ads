pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_ipcbuf_h;
with uapi_asm_generic_posix_types_h;

package uapi_asm_sembuf_h is

  -- * The semid64_ds structure for x86 architecture.
  -- * Note extra padding because this structure is passed back and forth
  -- * between kernel and user space.
  -- *
  -- * Pad space is left for:
  -- * - 64-bit time_t to solve y2038 problem
  -- * - 2 miscellaneous 32-bit values
  --  

  -- permissions .. see ipc.h  
   type semid64_ds is record
      sem_perm : aliased uapi_asm_generic_ipcbuf_h.ipc64_perm;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sembuf.h:14
      sem_otime : aliased uapi_asm_generic_posix_types_h.uu_kernel_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sembuf.h:15
      uu_unused1 : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sembuf.h:16
      sem_ctime : aliased uapi_asm_generic_posix_types_h.uu_kernel_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sembuf.h:17
      uu_unused2 : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sembuf.h:18
      sem_nsems : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sembuf.h:19
      uu_unused3 : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sembuf.h:20
      uu_unused4 : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sembuf.h:21
   end record;
   pragma Convention (C_Pass_By_Copy, semid64_ds);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sembuf.h:13

  -- last semop time  
  -- last change time  
  -- no. of semaphores in array  
end uapi_asm_sembuf_h;

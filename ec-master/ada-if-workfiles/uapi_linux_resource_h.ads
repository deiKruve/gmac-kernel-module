pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_time_h;
with uapi_asm_generic_posix_types_h;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_resource_h is

   --  unsupported macro: RUSAGE_SELF 0
   --  unsupported macro: RUSAGE_CHILDREN (-1)
   --  unsupported macro: RUSAGE_BOTH (-2)
   --  unsupported macro: RUSAGE_THREAD 1
   --  unsupported macro: RLIM64_INFINITY (~0ULL)
   --  unsupported macro: PRIO_MIN (-20)
   --  unsupported macro: PRIO_MAX 20
   --  unsupported macro: PRIO_PROCESS 0
   --  unsupported macro: PRIO_PGRP 1
   --  unsupported macro: PRIO_USER 2
   --  unsupported macro: MLOCK_LIMIT ((PAGE_SIZE > 64*1024) ? PAGE_SIZE : 64*1024)
  -- * Resource control/accounting header file for linux
  --  

  -- * Definition of struct rusage taken from BSD 4.3 Reno
  -- * 
  -- * We don't support all of these yet, but we might as well have them....
  -- * Otherwise, each time we add new items, programs which depend on this
  -- * structure will lose.  This reduces the chances of that happening.
  --  

  -- user time used  
   type rusage is record
      ru_utime : aliased uapi_linux_time_h.timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:24
      ru_stime : aliased uapi_linux_time_h.timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:25
      ru_maxrss : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:26
      ru_ixrss : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:27
      ru_idrss : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:28
      ru_isrss : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:29
      ru_minflt : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:30
      ru_majflt : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:31
      ru_nswap : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:32
      ru_inblock : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:33
      ru_oublock : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:34
      ru_msgsnd : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:35
      ru_msgrcv : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:36
      ru_nsignals : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:37
      ru_nvcsw : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:38
      ru_nivcsw : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:39
   end record;
   pragma Convention (C_Pass_By_Copy, rusage);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:23

  -- system time used  
  -- maximum resident set size  
  -- integral shared memory size  
  -- integral unshared data size  
  -- integral unshared stack size  
  -- page reclaims  
  -- page faults  
  -- swaps  
  -- block input operations  
  -- block output operations  
  -- messages sent  
  -- messages received  
  -- signals received  
  -- voluntary context switches  
  -- involuntary "  
   type rlimit is record
      rlim_cur : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:43
      rlim_max : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:44
   end record;
   pragma Convention (C_Pass_By_Copy, rlimit);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:42

   type rlimit64 is record
      rlim_cur : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:50
      rlim_max : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:51
   end record;
   pragma Convention (C_Pass_By_Copy, rlimit64);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/resource.h:49

  -- * Limit the stack by to some sane default: root can always
  -- * increase this limit if needed..  8MB seems reasonable.
  --  

  -- * GPG2 wants 64kB of mlocked memory, to make sure pass phrases
  -- * and other sensitive information are never written to disk.
  --  

  -- * Due to binary compatibility, the actual resource numbers
  -- * may be different for different linux versions..
  --  

end uapi_linux_resource_h;

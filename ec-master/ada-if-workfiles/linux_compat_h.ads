pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_compat_h;
limited with uapi_linux_time_h;
with System;
limited with uapi_linux_resource_h;
with asm_generic_int_ll64_h;
with linux_socket_h;
limited with linux_sched_h;
limited with uapi_linux_sem_h;
with linux_types_h;
with Interfaces.C.Strings;
limited with uapi_asm_generic_siginfo_h;
limited with asm_signal_h;
with uapi_asm_generic_int_ll64_h;
limited with uapi_linux_aio_abi_h;
limited with linux_fs_h;
limited with uapi_linux_uio_h;

package linux_compat_h is

   --  unsupported macro: COMPAT_SYSCALL_DEFINE0(name) asmlinkage long compat_sys_ ##name(void)
   --  unsupported macro: COMPAT_SYSCALL_DEFINE1(name,...) COMPAT_SYSCALL_DEFINEx(1, _ ##name, __VA_ARGS__)
   --  unsupported macro: COMPAT_SYSCALL_DEFINE2(name,...) COMPAT_SYSCALL_DEFINEx(2, _ ##name, __VA_ARGS__)
   --  unsupported macro: COMPAT_SYSCALL_DEFINE3(name,...) COMPAT_SYSCALL_DEFINEx(3, _ ##name, __VA_ARGS__)
   --  unsupported macro: COMPAT_SYSCALL_DEFINE4(name,...) COMPAT_SYSCALL_DEFINEx(4, _ ##name, __VA_ARGS__)
   --  unsupported macro: COMPAT_SYSCALL_DEFINE5(name,...) COMPAT_SYSCALL_DEFINEx(5, _ ##name, __VA_ARGS__)
   --  unsupported macro: COMPAT_SYSCALL_DEFINE6(name,...) COMPAT_SYSCALL_DEFINEx(6, _ ##name, __VA_ARGS__)
   --  unsupported macro: COMPAT_SYSCALL_DEFINEx(x,name,...) asmlinkage long compat_sys ##name(__MAP(x,__SC_DECL,__VA_ARGS__)) __attribute__((alias(__stringify(compat_SyS ##name)))); static inline long C_SYSC ##name(__MAP(x,__SC_DECL,__VA_ARGS__)); asmlinkage long compat_SyS ##name(__MAP(x,__SC_LONG,__VA_ARGS__)); asmlinkage long compat_SyS ##name(__MAP(x,__SC_LONG,__VA_ARGS__)) { return C_SYSC ##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__)); } static inline long C_SYSC ##name(__MAP(x,__SC_DECL,__VA_ARGS__))
   --  arg-macro: function compat_jiffies_to_clock_t (((unsigned long)(x) * COMPAT_USER_HZ) / HZ
   --    return ((unsigned long)(x) * COMPAT_USER_HZ) / HZ;
   --  unsupported macro: COMPAT_SIGEV_PAD_SIZE ((SIGEV_MAX_SIZE/sizeof(int)) - 3)
   --  unsupported macro: BITS_PER_COMPAT_LONG (8*sizeof(compat_long_t))
   --  arg-macro: function BITS_TO_COMPAT_LONGS (((bits)+BITS_PER_COMPAT_LONG-1)/BITS_PER_COMPAT_LONG
   --    return ((bits)+BITS_PER_COMPAT_LONG-1)/BITS_PER_COMPAT_LONG;
   --  arg-macro: procedure compat_save_altstack_ex do { compat_stack_t __user *__uss := uss; struct task_struct *t := current; put_user_ex(ptr_to_compat((void __user *)t.sas_ss_sp), and__uss.ss_sp); put_user_ex(sas_ss_flags(sp), and__uss.ss_flags); put_user_ex(t.sas_ss_size, and__uss.ss_size); } while (0);
   --    do { compat_stack_t __user *__uss := uss; struct task_struct *t := current; put_user_ex(ptr_to_compat((void __user *)t.sas_ss_sp), and__uss.ss_sp); put_user_ex(sas_ss_flags(sp), and__uss.ss_flags); put_user_ex(t.sas_ss_size, and__uss.ss_size); } while (0);
  -- * These are the type definitions for the architecture specific
  -- * syscall compatibility layer.
  --  

  -- for HZ  
  -- for aio_context_t  
   type compat_sigaltstack is record
      ss_sp : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:63
      ss_flags : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:64
      ss_size : aliased asm_compat_h.compat_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:65
   end record;
   pragma Convention (C_Pass_By_Copy, compat_sigaltstack);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:62

   subtype compat_stack_t is compat_sigaltstack;

   subtype compat_uid_t is asm_compat_h.uu_compat_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:72

   subtype compat_gid_t is asm_compat_h.uu_compat_gid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:73

   subtype compat_aio_context_t is asm_compat_h.compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:75

   --  skipped empty struct compat_sel_arg_struct

   type compat_itimerspec is record
      it_interval : aliased asm_compat_h.compat_timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:81
      it_value : aliased asm_compat_h.compat_timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:82
   end record;
   pragma Convention (C_Pass_By_Copy, compat_itimerspec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:80

   type compat_utimbuf is record
      actime : aliased asm_compat_h.compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:86
      modtime : aliased asm_compat_h.compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:87
   end record;
   pragma Convention (C_Pass_By_Copy, compat_utimbuf);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:85

   type compat_itimerval is record
      it_interval : aliased asm_compat_h.compat_timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:91
      it_value : aliased asm_compat_h.compat_timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:92
   end record;
   pragma Convention (C_Pass_By_Copy, compat_itimerval);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:90

   type compat_tms is record
      tms_utime : aliased asm_compat_h.compat_clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:96
      tms_stime : aliased asm_compat_h.compat_clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:97
      tms_cutime : aliased asm_compat_h.compat_clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:98
      tms_cstime : aliased asm_compat_h.compat_clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:99
   end record;
   pragma Convention (C_Pass_By_Copy, compat_tms);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:95

   type compat_timex is record
      modes : aliased asm_compat_h.compat_uint_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:103
      offset : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:104
      freq : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:105
      maxerror : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:106
      esterror : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:107
      status : aliased asm_compat_h.compat_int_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:108
      c_constant : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:109
      precision : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:110
      tolerance : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:111
      time : aliased asm_compat_h.compat_timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:112
      tick : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:113
      ppsfreq : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:114
      jitter : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:115
      shift : aliased asm_compat_h.compat_int_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:116
      stabil : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:117
      jitcnt : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:118
      calcnt : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:119
      errcnt : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:120
      stbcnt : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:121
      tai : aliased asm_compat_h.compat_int_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:122
      field_21 : aliased asm_compat_h.compat_int_t;
      field_22 : aliased asm_compat_h.compat_int_t;
      field_23 : aliased asm_compat_h.compat_int_t;
      field_24 : aliased asm_compat_h.compat_int_t;
      field_25 : aliased asm_compat_h.compat_int_t;
      field_26 : aliased asm_compat_h.compat_int_t;
      field_27 : aliased asm_compat_h.compat_int_t;
      field_28 : aliased asm_compat_h.compat_int_t;
      field_29 : aliased asm_compat_h.compat_int_t;
      field_30 : aliased asm_compat_h.compat_int_t;
      field_31 : aliased asm_compat_h.compat_int_t;
   end record;
   pragma Convention (C_Pass_By_Copy, compat_timex);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:102

   type compat_sigset_t_sig_array is array (0 .. 1) of aliased asm_compat_h.compat_sigset_word;
   type compat_sigset_t is record
      sig : aliased compat_sigset_t_sig_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:132
   end record;
   pragma Convention (C_Pass_By_Copy, compat_sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:133

   --  skipped anonymous struct anon_291

   type compat_sigaction is record
      sa_handler : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:137
      sa_flags : aliased asm_compat_h.compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:138
      sa_restorer : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:144
      sa_mask : aliased compat_sigset_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:146
   end record;
   pragma Convention (C_Pass_By_Copy, compat_sigaction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:135

  -- * These functions operate on 32- or 64-bit specs depending on
  -- * COMPAT_USE_64BIT_TIME, hence the void user pointer arguments.
  --  

   function compat_get_timespec (arg1 : access uapi_linux_time_h.timespec; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:153
   pragma Import (CPP, compat_get_timespec, "_Z19compat_get_timespecP8timespecPKv");

   function compat_put_timespec (arg1 : access constant uapi_linux_time_h.timespec; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:154
   pragma Import (CPP, compat_put_timespec, "_Z19compat_put_timespecPK8timespecPv");

   function compat_get_timeval (arg1 : access uapi_linux_time_h.timeval; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:155
   pragma Import (CPP, compat_get_timeval, "_Z18compat_get_timevalP7timevalPKv");

   function compat_put_timeval (arg1 : access constant uapi_linux_time_h.timeval; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:156
   pragma Import (CPP, compat_put_timeval, "_Z18compat_put_timevalPK7timevalPv");

  -- * This function convert a timespec if necessary and returns a *user
  -- * space* pointer.  If no conversion is necessary, it returns the
  -- * initial pointer.  NULL is a legitimate argument and will always
  -- * output NULL.
  --  

   function compat_convert_timespec (arg1 : System.Address; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:164
   pragma Import (CPP, compat_convert_timespec, "_Z23compat_convert_timespecPP8timespecPKv");

   type compat_iovec is record
      iov_base : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:168
      iov_len : aliased asm_compat_h.compat_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:169
   end record;
   pragma Convention (C_Pass_By_Copy, compat_iovec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:167

   type compat_rlimit is record
      rlim_cur : aliased asm_compat_h.compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:173
      rlim_max : aliased asm_compat_h.compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:174
   end record;
   pragma Convention (C_Pass_By_Copy, compat_rlimit);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:172

   type compat_rusage is record
      ru_utime : aliased asm_compat_h.compat_timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:178
      ru_stime : aliased asm_compat_h.compat_timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:179
      ru_maxrss : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:180
      ru_ixrss : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:181
      ru_idrss : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:182
      ru_isrss : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:183
      ru_minflt : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:184
      ru_majflt : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:185
      ru_nswap : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:186
      ru_inblock : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:187
      ru_oublock : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:188
      ru_msgsnd : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:189
      ru_msgrcv : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:190
      ru_nsignals : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:191
      ru_nvcsw : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:192
      ru_nivcsw : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:193
   end record;
   pragma Convention (C_Pass_By_Copy, compat_rusage);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:177

   function put_compat_rusage (arg1 : access constant uapi_linux_resource_h.rusage; arg2 : access compat_rusage) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:196
   pragma Import (CPP, put_compat_rusage, "_Z17put_compat_rusagePK6rusageP13compat_rusage");

   subtype compat_dirent_d_name_array is Interfaces.C.char_array (0 .. 255);
   type compat_dirent is record
      d_ino : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:206
      d_off : aliased asm_compat_h.compat_off_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:207
      d_reclen : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:208
      d_name : aliased compat_dirent_d_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:209
   end record;
   pragma Convention (C_Pass_By_Copy, compat_dirent);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:205

   subtype compat_ustat_f_fname_array is Interfaces.C.char_array (0 .. 5);
   subtype compat_ustat_f_fpack_array is Interfaces.C.char_array (0 .. 5);
   type compat_ustat is record
      f_tfree : aliased asm_compat_h.compat_daddr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:213
      f_tinode : aliased asm_compat_h.compat_ino_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:214
      f_fname : aliased compat_ustat_f_fname_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:215
      f_fpack : aliased compat_ustat_f_fpack_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:216
   end record;
   pragma Convention (C_Pass_By_Copy, compat_ustat);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:212

   type compat_sigevent_u_pad_array is array (0 .. 12) of aliased asm_compat_h.compat_int_t;
   type anon_292;
   type anon_293 is record
      u_function : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:230
      u_attribute : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:231
   end record;
   pragma Convention (C_Pass_By_Copy, anon_293);
   type anon_292 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            u_pad : aliased compat_sigevent_u_pad_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:226
         when 1 =>
            u_tid : aliased asm_compat_h.compat_int_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:227
         when others =>
            u_sigev_thread : aliased anon_293;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:232
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_292);
   pragma Unchecked_Union (anon_292);
   type compat_sigevent is record
      sigev_value : asm_compat_h.compat_sigval_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:222
      sigev_signo : aliased asm_compat_h.compat_int_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:223
      sigev_notify : aliased asm_compat_h.compat_int_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:224
      u_sigev_un : anon_292;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:233
   end record;
   pragma Convention (C_Pass_By_Copy, compat_sigevent);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:221

   subtype compat_sigevent_t is compat_sigevent;

   type compat_ifmap is record
      mem_start : aliased asm_compat_h.compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:237
      mem_end : aliased asm_compat_h.compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:238
      base_addr : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:239
      irq : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:240
      dma : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:241
      port : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:242
   end record;
   pragma Convention (C_Pass_By_Copy, compat_ifmap);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:236

  -- Type of physical device or protocol  
   type compat_if_settings is record
      c_type : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:246
      size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:247
      ifs_ifsu : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:248
   end record;
   pragma Convention (C_Pass_By_Copy, compat_if_settings);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:245

  -- Size of the data allocated by the caller  
  -- union of pointers  
  -- if name, e.g. "en0"  
   subtype compat_ifreq_ifrn_name_array is Interfaces.C.char_array (0 .. 15);
   type anon_294 (discr : unsigned := 0) is record
      case discr is
         when others =>
            ifrn_name : aliased compat_ifreq_ifrn_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:253
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_294);
   pragma Unchecked_Union (anon_294);
   subtype compat_ifreq_ifru_slave_array is Interfaces.C.char_array (0 .. 15);
   subtype compat_ifreq_ifru_newname_array is Interfaces.C.char_array (0 .. 15);
   type anon_295 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ifru_addr : aliased linux_socket_h.sockaddr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:256
         when 1 =>
            ifru_dstaddr : aliased linux_socket_h.sockaddr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:257
         when 2 =>
            ifru_broadaddr : aliased linux_socket_h.sockaddr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:258
         when 3 =>
            ifru_netmask : aliased linux_socket_h.sockaddr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:259
         when 4 =>
            ifru_hwaddr : aliased linux_socket_h.sockaddr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:260
         when 5 =>
            ifru_flags : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:261
         when 6 =>
            ifru_ivalue : aliased asm_compat_h.compat_int_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:262
         when 7 =>
            ifru_mtu : aliased asm_compat_h.compat_int_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:263
         when 8 =>
            ifru_map : aliased compat_ifmap;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:264
         when 9 =>
            ifru_slave : aliased compat_ifreq_ifru_slave_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:265
         when 10 =>
            ifru_newname : aliased compat_ifreq_ifru_newname_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:266
         when 11 =>
            ifru_data : aliased asm_compat_h.compat_caddr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:267
         when others =>
            ifru_settings : aliased compat_if_settings;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:268
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_295);
   pragma Unchecked_Union (anon_295);
   type compat_ifreq is record
      ifr_ifrn : anon_294;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:254
      ifr_ifru : anon_295;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:269
   end record;
   pragma Convention (C_Pass_By_Copy, compat_ifreq);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:251

  -- Just fits the size  
  -- size of buffer  
   type compat_ifconf is record
      ifc_len : aliased asm_compat_h.compat_int_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:273
      ifcbuf : aliased asm_compat_h.compat_caddr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:274
   end record;
   pragma Convention (C_Pass_By_Copy, compat_ifconf);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:272

   type compat_robust_list is record
      next : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:278
   end record;
   pragma Convention (C_Pass_By_Copy, compat_robust_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:277

   type compat_robust_list_head is record
      list : aliased compat_robust_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:282
      futex_offset : aliased asm_compat_h.compat_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:283
      list_op_pending : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:284
   end record;
   pragma Convention (C_Pass_By_Copy, compat_robust_list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:281

   type compat_old_sigaction is record
      sa_handler : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:289
      sa_mask : aliased asm_compat_h.compat_old_sigset_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:290
      sa_flags : aliased asm_compat_h.compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:291
      sa_restorer : aliased asm_compat_h.compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:292
   end record;
   pragma Convention (C_Pass_By_Copy, compat_old_sigaction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:288

   --  skipped empty struct compat_statfs64

   --  skipped empty struct compat_old_linux_dirent

   --  skipped empty struct compat_linux_dirent

   --  skipped empty struct linux_dirent64

   --  skipped empty struct compat_msghdr

   --  skipped empty struct compat_mmsghdr

   --  skipped empty struct compat_sysinfo

   --  skipped empty struct compat_sysctl_args

   --  skipped empty struct compat_kexec_segment

   --  skipped empty struct compat_mq_attr

   --  skipped empty struct compat_msgbuf

   procedure compat_exit_robust_list (curr : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:309
   pragma Import (CPP, compat_exit_robust_list, "_Z23compat_exit_robust_listP11task_struct");

   function compat_sys_set_robust_list (head : access compat_robust_list_head; len : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:312
   pragma Import (C, compat_sys_set_robust_list, "compat_sys_set_robust_list");

   function compat_sys_get_robust_list
     (pid : int;
      head_ptr : access asm_compat_h.compat_uptr_t;
      len_ptr : access asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:315
   pragma Import (C, compat_sys_get_robust_list, "compat_sys_get_robust_list");

   function compat_sys_ipc
     (arg1 : asm_generic_int_ll64_h.u32;
      arg2 : int;
      arg3 : int;
      arg4 : asm_generic_int_ll64_h.u32;
      arg5 : asm_compat_h.compat_uptr_t;
      arg6 : asm_generic_int_ll64_h.u32) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:318
   pragma Import (C, compat_sys_ipc, "compat_sys_ipc");

   function compat_sys_shmat
     (shmid : int;
      shmaddr : asm_compat_h.compat_uptr_t;
      shmflg : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:319
   pragma Import (C, compat_sys_shmat, "compat_sys_shmat");

   function compat_sys_semctl
     (semid : int;
      semnum : int;
      cmd : int;
      arg : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:320
   pragma Import (C, compat_sys_semctl, "compat_sys_semctl");

   function compat_sys_msgsnd
     (msqid : int;
      msgp : asm_compat_h.compat_uptr_t;
      msgsz : asm_compat_h.compat_ssize_t;
      msgflg : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:321
   pragma Import (C, compat_sys_msgsnd, "compat_sys_msgsnd");

   function compat_sys_msgrcv
     (msqid : int;
      msgp : asm_compat_h.compat_uptr_t;
      msgsz : asm_compat_h.compat_ssize_t;
      msgtyp : asm_compat_h.compat_long_t;
      msgflg : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:323
   pragma Import (C, compat_sys_msgrcv, "compat_sys_msgrcv");

   function compat_sys_msgctl
     (first : int;
      second : int;
      uptr : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:325
   pragma Import (CPP, compat_sys_msgctl, "_Z17compat_sys_msgctliiPv");

   function compat_sys_shmctl
     (first : int;
      second : int;
      uptr : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:326
   pragma Import (CPP, compat_sys_shmctl, "_Z17compat_sys_shmctliiPv");

   function compat_sys_semtimedop
     (semid : int;
      tsems : access uapi_linux_sem_h.sembuf;
      nsems : unsigned;
      timeout : access constant asm_compat_h.compat_timespec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:327
   pragma Import (CPP, compat_sys_semtimedop, "_Z21compat_sys_semtimedopiP6sembufjPK15compat_timespec");

   function compat_sys_keyctl
     (option : asm_generic_int_ll64_h.u32;
      arg2 : asm_generic_int_ll64_h.u32;
      arg3 : asm_generic_int_ll64_h.u32;
      arg4 : asm_generic_int_ll64_h.u32;
      arg5 : asm_generic_int_ll64_h.u32) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:329
   pragma Import (C, compat_sys_keyctl, "compat_sys_keyctl");

   function compat_sys_ustat (dev : unsigned; u32 : access compat_ustat) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:331
   pragma Import (C, compat_sys_ustat, "compat_sys_ustat");

   function compat_sys_readv
     (fd : asm_compat_h.compat_ulong_t;
      vec : access constant compat_iovec;
      vlen : asm_compat_h.compat_ulong_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:333
   pragma Import (C, compat_sys_readv, "compat_sys_readv");

   function compat_sys_writev
     (fd : asm_compat_h.compat_ulong_t;
      vec : access constant compat_iovec;
      vlen : asm_compat_h.compat_ulong_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:335
   pragma Import (C, compat_sys_writev, "compat_sys_writev");

   function compat_sys_preadv
     (fd : asm_compat_h.compat_ulong_t;
      vec : access constant compat_iovec;
      vlen : asm_compat_h.compat_ulong_t;
      pos_low : asm_generic_int_ll64_h.u32;
      pos_high : asm_generic_int_ll64_h.u32) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:337
   pragma Import (C, compat_sys_preadv, "compat_sys_preadv");

   function compat_sys_pwritev
     (fd : asm_compat_h.compat_ulong_t;
      vec : access constant compat_iovec;
      vlen : asm_compat_h.compat_ulong_t;
      pos_low : asm_generic_int_ll64_h.u32;
      pos_high : asm_generic_int_ll64_h.u32) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:340
   pragma Import (C, compat_sys_pwritev, "compat_sys_pwritev");

   function compat_sys_preadv64
     (fd : unsigned_long;
      vec : access constant compat_iovec;
      vlen : unsigned_long;
      pos : linux_types_h.loff_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:345
   pragma Import (C, compat_sys_preadv64, "compat_sys_preadv64");

   function compat_sys_pwritev64
     (fd : unsigned_long;
      vec : access constant compat_iovec;
      vlen : unsigned_long;
      pos : linux_types_h.loff_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:351
   pragma Import (C, compat_sys_pwritev64, "compat_sys_pwritev64");

   function compat_sys_lseek
     (arg1 : unsigned;
      arg2 : asm_compat_h.compat_off_t;
      arg3 : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:356
   pragma Import (C, compat_sys_lseek, "compat_sys_lseek");

   function compat_sys_execve
     (filename : Interfaces.C.Strings.chars_ptr;
      argv : access asm_compat_h.compat_uptr_t;
      envp : access asm_compat_h.compat_uptr_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:358
   pragma Import (C, compat_sys_execve, "compat_sys_execve");

   function compat_sys_select
     (n : int;
      inp : access asm_compat_h.compat_ulong_t;
      outp : access asm_compat_h.compat_ulong_t;
      exp : access asm_compat_h.compat_ulong_t;
      tvp : access asm_compat_h.compat_timeval) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:361
   pragma Import (C, compat_sys_select, "compat_sys_select");

   function compat_sys_old_select (arg : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:365
   pragma Import (C, compat_sys_old_select, "compat_sys_old_select");

   function compat_sys_wait4
     (pid : asm_compat_h.compat_pid_t;
      stat_addr : access asm_compat_h.compat_uint_t;
      options : int;
      ru : access compat_rusage) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:367
   pragma Import (C, compat_sys_wait4, "compat_sys_wait4");

   function compat_get_bitmap
     (mask : access unsigned_long;
      umask : access asm_compat_h.compat_ulong_t;
      bitmap_size : unsigned_long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:376
   pragma Import (CPP, compat_get_bitmap, "_Z17compat_get_bitmapPmPKjm");

   function compat_put_bitmap
     (umask : access asm_compat_h.compat_ulong_t;
      mask : access unsigned_long;
      bitmap_size : unsigned_long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:378
   pragma Import (CPP, compat_put_bitmap, "_Z17compat_put_bitmapPjPmm");

   function copy_siginfo_from_user32 (to : access uapi_asm_generic_siginfo_h.siginfo_t; from : access asm_compat_h.compat_siginfo) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:380
   pragma Import (CPP, copy_siginfo_from_user32, "_Z24copy_siginfo_from_user32P7siginfoP14compat_siginfo");

   function copy_siginfo_to_user32 (to : access asm_compat_h.compat_siginfo; from : access constant uapi_asm_generic_siginfo_h.siginfo_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:381
   pragma Import (CPP, copy_siginfo_to_user32, "_Z22copy_siginfo_to_user32P14compat_siginfoPK7siginfo");

   function get_compat_sigevent (event : access uapi_asm_generic_siginfo_h.sigevent; u_event : access constant compat_sigevent) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:382
   pragma Import (CPP, get_compat_sigevent, "_Z19get_compat_sigeventP8sigeventPK15compat_sigevent");

   function compat_sys_rt_tgsigqueueinfo
     (tgid : asm_compat_h.compat_pid_t;
      pid : asm_compat_h.compat_pid_t;
      sig : int;
      uinfo : access asm_compat_h.compat_siginfo) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:384
   pragma Import (CPP, compat_sys_rt_tgsigqueueinfo, "_Z28compat_sys_rt_tgsigqueueinfoiiiP14compat_siginfo");

   function compat_sys_sigaction
     (sig : int;
      act : access constant compat_old_sigaction;
      oact : access compat_old_sigaction) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:387
   pragma Import (C, compat_sys_sigaction, "compat_sys_sigaction");

   function compat_timeval_compare (lhs : access asm_compat_h.compat_timeval; rhs : access asm_compat_h.compat_timeval) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:392
   pragma Import (CPP, compat_timeval_compare, "_ZL22compat_timeval_compareP14compat_timevalS0_");

   function compat_timespec_compare (lhs : access asm_compat_h.compat_timespec; rhs : access asm_compat_h.compat_timespec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:402
   pragma Import (CPP, compat_timespec_compare, "_ZL23compat_timespec_compareP15compat_timespecS0_");

   function get_compat_itimerspec (dst : access uapi_linux_time_h.itimerspec; src : access constant compat_itimerspec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:412
   pragma Import (CPP, get_compat_itimerspec, "_Z21get_compat_itimerspecP10itimerspecPK17compat_itimerspec");

   function put_compat_itimerspec (dst : access compat_itimerspec; src : access constant uapi_linux_time_h.itimerspec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:414
   pragma Import (CPP, put_compat_itimerspec, "_Z21put_compat_itimerspecP17compat_itimerspecPK10itimerspec");

   function compat_sys_gettimeofday (tv : access asm_compat_h.compat_timeval; tz : access uapi_linux_time_h.timezone) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:417
   pragma Import (C, compat_sys_gettimeofday, "compat_sys_gettimeofday");

   function compat_sys_settimeofday (tv : access asm_compat_h.compat_timeval; tz : access uapi_linux_time_h.timezone) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:419
   pragma Import (C, compat_sys_settimeofday, "compat_sys_settimeofday");

   function compat_sys_adjtimex (utp : access compat_timex) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:422
   pragma Import (C, compat_sys_adjtimex, "compat_sys_adjtimex");

   function compat_printk (fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:424
   pragma Import (CPP, compat_printk, "_Z13compat_printkPKcz");

   procedure sigset_from_compat (set : access asm_signal_h.sigset_t; compat : access constant compat_sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:425
   pragma Import (CPP, sigset_from_compat, "_Z18sigset_from_compatP8sigset_tPK15compat_sigset_t");

   procedure sigset_to_compat (compat : access compat_sigset_t; set : access constant asm_signal_h.sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:426
   pragma Import (CPP, sigset_to_compat, "_Z16sigset_to_compatP15compat_sigset_tPK8sigset_t");

   function compat_sys_migrate_pages
     (pid : asm_compat_h.compat_pid_t;
      maxnode : asm_compat_h.compat_ulong_t;
      old_nodes : access asm_compat_h.compat_ulong_t;
      new_nodes : access asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:428
   pragma Import (C, compat_sys_migrate_pages, "compat_sys_migrate_pages");

   function compat_ptrace_request
     (child : access linux_sched_h.task_struct;
      request : asm_compat_h.compat_long_t;
      addr : asm_compat_h.compat_ulong_t;
      data : asm_compat_h.compat_ulong_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:432
   pragma Import (CPP, compat_ptrace_request, "_Z21compat_ptrace_requestP11task_structijj");

   function compat_arch_ptrace
     (child : access linux_sched_h.task_struct;
      request : asm_compat_h.compat_long_t;
      addr : asm_compat_h.compat_ulong_t;
      data : asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:436
   pragma Import (CPP, compat_arch_ptrace, "_Z18compat_arch_ptraceP11task_structijj");

   function compat_sys_ptrace
     (request : asm_compat_h.compat_long_t;
      pid : asm_compat_h.compat_long_t;
      addr : asm_compat_h.compat_long_t;
      data : asm_compat_h.compat_long_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:438
   pragma Import (C, compat_sys_ptrace, "compat_sys_ptrace");

   function compat_sys_lookup_dcookie
     (arg1 : asm_generic_int_ll64_h.u32;
      arg2 : asm_generic_int_ll64_h.u32;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:441
   pragma Import (C, compat_sys_lookup_dcookie, "compat_sys_lookup_dcookie");

  -- * epoll (fs/eventpoll.c) compat bits follow ...
  --  

  -- fortunately, this one is fixed-layout  
   --  skipped empty struct epoll_event

   function compat_sys_epoll_pwait
     (epfd : int;
      events : System.Address;
      maxevents : int;
      timeout : int;
      sigmask : access constant compat_sigset_t;
      sigsetsize : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:446
   pragma Import (C, compat_sys_epoll_pwait, "compat_sys_epoll_pwait");

   function compat_sys_utime (filename : Interfaces.C.Strings.chars_ptr; t : access compat_utimbuf) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:452
   pragma Import (C, compat_sys_utime, "compat_sys_utime");

   function compat_sys_utimensat
     (dfd : unsigned;
      filename : Interfaces.C.Strings.chars_ptr;
      t : access asm_compat_h.compat_timespec;
      flags : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:454
   pragma Import (C, compat_sys_utimensat, "compat_sys_utimensat");

   function compat_sys_time (tloc : access asm_compat_h.compat_time_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:459
   pragma Import (C, compat_sys_time, "compat_sys_time");

   function compat_sys_stime (tptr : access asm_compat_h.compat_time_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:460
   pragma Import (C, compat_sys_stime, "compat_sys_stime");

   function compat_sys_signalfd
     (ufd : int;
      sigmask : access constant compat_sigset_t;
      sigsetsize : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:461
   pragma Import (C, compat_sys_signalfd, "compat_sys_signalfd");

   function compat_sys_timerfd_settime
     (ufd : int;
      flags : int;
      utmr : access constant compat_itimerspec;
      otmr : access compat_itimerspec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:464
   pragma Import (C, compat_sys_timerfd_settime, "compat_sys_timerfd_settime");

   function compat_sys_timerfd_gettime (ufd : int; otmr : access compat_itimerspec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:467
   pragma Import (C, compat_sys_timerfd_gettime, "compat_sys_timerfd_gettime");

   function compat_sys_move_pages
     (pid : linux_types_h.pid_t;
      nr_pages : asm_compat_h.compat_ulong_t;
      pages : access uapi_asm_generic_int_ll64_h.uu_u32;
      nodes : access int;
      status : access int;
      flags : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:470
   pragma Import (C, compat_sys_move_pages, "compat_sys_move_pages");

   function compat_sys_futimesat
     (dfd : unsigned;
      filename : Interfaces.C.Strings.chars_ptr;
      t : access asm_compat_h.compat_timeval) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:475
   pragma Import (C, compat_sys_futimesat, "compat_sys_futimesat");

   function compat_sys_utimes (filename : Interfaces.C.Strings.chars_ptr; t : access asm_compat_h.compat_timeval) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:478
   pragma Import (C, compat_sys_utimes, "compat_sys_utimes");

   function compat_sys_newstat (filename : Interfaces.C.Strings.chars_ptr; statbuf : access asm_compat_h.compat_stat) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:480
   pragma Import (C, compat_sys_newstat, "compat_sys_newstat");

   function compat_sys_newlstat (filename : Interfaces.C.Strings.chars_ptr; statbuf : access asm_compat_h.compat_stat) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:482
   pragma Import (C, compat_sys_newlstat, "compat_sys_newlstat");

   function compat_sys_newfstatat
     (dfd : unsigned;
      filename : Interfaces.C.Strings.chars_ptr;
      statbuf : access asm_compat_h.compat_stat;
      flag : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:484
   pragma Import (C, compat_sys_newfstatat, "compat_sys_newfstatat");

   function compat_sys_newfstat (fd : unsigned; statbuf : access asm_compat_h.compat_stat) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:488
   pragma Import (C, compat_sys_newfstat, "compat_sys_newfstat");

   function compat_sys_statfs (pathname : Interfaces.C.Strings.chars_ptr; buf : access asm_compat_h.compat_statfs) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:490
   pragma Import (C, compat_sys_statfs, "compat_sys_statfs");

   function compat_sys_fstatfs (fd : unsigned; buf : access asm_compat_h.compat_statfs) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:492
   pragma Import (C, compat_sys_fstatfs, "compat_sys_fstatfs");

   function compat_sys_statfs64
     (pathname : Interfaces.C.Strings.chars_ptr;
      sz : asm_compat_h.compat_size_t;
      buf : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:494
   pragma Import (C, compat_sys_statfs64, "compat_sys_statfs64");

   function compat_sys_fstatfs64
     (fd : unsigned;
      sz : asm_compat_h.compat_size_t;
      buf : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:497
   pragma Import (C, compat_sys_fstatfs64, "compat_sys_fstatfs64");

   function compat_sys_fcntl64
     (fd : unsigned;
      cmd : unsigned;
      arg : asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:499
   pragma Import (C, compat_sys_fcntl64, "compat_sys_fcntl64");

   function compat_sys_fcntl
     (fd : unsigned;
      cmd : unsigned;
      arg : asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:501
   pragma Import (C, compat_sys_fcntl, "compat_sys_fcntl");

   function compat_sys_io_setup (nr_reqs : unsigned; ctx32p : access asm_generic_int_ll64_h.u32) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:503
   pragma Import (C, compat_sys_io_setup, "compat_sys_io_setup");

   function compat_sys_io_getevents
     (ctx_id : compat_aio_context_t;
      min_nr : asm_compat_h.compat_long_t;
      nr : asm_compat_h.compat_long_t;
      events : access uapi_linux_aio_abi_h.io_event;
      timeout : access asm_compat_h.compat_timespec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:504
   pragma Import (C, compat_sys_io_getevents, "compat_sys_io_getevents");

   function compat_sys_io_submit
     (ctx_id : compat_aio_context_t;
      nr : int;
      iocb : access asm_generic_int_ll64_h.u32) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:509
   pragma Import (C, compat_sys_io_submit, "compat_sys_io_submit");

   function compat_sys_mount
     (dev_name : Interfaces.C.Strings.chars_ptr;
      dir_name : Interfaces.C.Strings.chars_ptr;
      c_type : Interfaces.C.Strings.chars_ptr;
      flags : asm_compat_h.compat_ulong_t;
      data : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:511
   pragma Import (C, compat_sys_mount, "compat_sys_mount");

   function compat_sys_old_readdir
     (fd : unsigned;
      arg2 : System.Address;
      count : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:515
   pragma Import (C, compat_sys_old_readdir, "compat_sys_old_readdir");

   function compat_sys_getdents
     (fd : unsigned;
      dirent : System.Address;
      count : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:518
   pragma Import (C, compat_sys_getdents, "compat_sys_getdents");

   function compat_sys_getdents64
     (fd : unsigned;
      dirent : System.Address;
      count : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:522
   pragma Import (C, compat_sys_getdents64, "compat_sys_getdents64");

   function compat_sys_vmsplice
     (fd : int;
      arg2 : access constant compat_iovec;
      nr_segs : unsigned;
      flags : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:526
   pragma Import (C, compat_sys_vmsplice, "compat_sys_vmsplice");

   function compat_sys_open
     (filename : Interfaces.C.Strings.chars_ptr;
      flags : int;
      mode : linux_types_h.umode_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:528
   pragma Import (C, compat_sys_open, "compat_sys_open");

   function compat_sys_openat
     (dfd : int;
      filename : Interfaces.C.Strings.chars_ptr;
      flags : int;
      mode : linux_types_h.umode_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:530
   pragma Import (C, compat_sys_openat, "compat_sys_openat");

   function compat_sys_open_by_handle_at
     (mountdirfd : int;
      handle : access linux_fs_h.file_handle;
      flags : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:532
   pragma Import (C, compat_sys_open_by_handle_at, "compat_sys_open_by_handle_at");

   function compat_sys_truncate (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : asm_compat_h.compat_off_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:535
   pragma Import (C, compat_sys_truncate, "compat_sys_truncate");

   function compat_sys_ftruncate (arg1 : unsigned; arg2 : asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:536
   pragma Import (C, compat_sys_ftruncate, "compat_sys_ftruncate");

   function compat_sys_pselect6
     (n : int;
      inp : access asm_compat_h.compat_ulong_t;
      outp : access asm_compat_h.compat_ulong_t;
      exp : access asm_compat_h.compat_ulong_t;
      tsp : access asm_compat_h.compat_timespec;
      sig : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:537
   pragma Import (C, compat_sys_pselect6, "compat_sys_pselect6");

   function compat_sys_ppoll
     (ufds : System.Address;
      nfds : unsigned;
      tsp : access asm_compat_h.compat_timespec;
      sigmask : access constant compat_sigset_t;
      sigsetsize : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:542
   pragma Import (C, compat_sys_ppoll, "compat_sys_ppoll");

   function compat_sys_signalfd4
     (ufd : int;
      sigmask : access constant compat_sigset_t;
      sigsetsize : asm_compat_h.compat_size_t;
      flags : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:547
   pragma Import (C, compat_sys_signalfd4, "compat_sys_signalfd4");

   function compat_sys_get_mempolicy
     (policy : access int;
      nmask : access asm_compat_h.compat_ulong_t;
      maxnode : asm_compat_h.compat_ulong_t;
      addr : asm_compat_h.compat_ulong_t;
      flags : asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:550
   pragma Import (C, compat_sys_get_mempolicy, "compat_sys_get_mempolicy");

   function compat_sys_set_mempolicy
     (mode : int;
      nmask : access asm_compat_h.compat_ulong_t;
      maxnode : asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:555
   pragma Import (C, compat_sys_set_mempolicy, "compat_sys_set_mempolicy");

   function compat_sys_mbind
     (start : asm_compat_h.compat_ulong_t;
      len : asm_compat_h.compat_ulong_t;
      mode : asm_compat_h.compat_ulong_t;
      nmask : access asm_compat_h.compat_ulong_t;
      maxnode : asm_compat_h.compat_ulong_t;
      flags : asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:557
   pragma Import (C, compat_sys_mbind, "compat_sys_mbind");

   function compat_sys_setsockopt
     (fd : int;
      level : int;
      optname : int;
      optval : Interfaces.C.Strings.chars_ptr;
      optlen : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:562
   pragma Import (C, compat_sys_setsockopt, "compat_sys_setsockopt");

   function compat_sys_sendmsg
     (fd : int;
      msg : System.Address;
      flags : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:564
   pragma Import (C, compat_sys_sendmsg, "compat_sys_sendmsg");

   function compat_sys_sendmmsg
     (fd : int;
      mmsg : System.Address;
      vlen : unsigned;
      flags : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:566
   pragma Import (C, compat_sys_sendmmsg, "compat_sys_sendmmsg");

   function compat_sys_recvmsg
     (fd : int;
      msg : System.Address;
      flags : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:568
   pragma Import (C, compat_sys_recvmsg, "compat_sys_recvmsg");

   function compat_sys_recv
     (fd : int;
      buf : System.Address;
      len : asm_compat_h.compat_size_t;
      flags : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:570
   pragma Import (C, compat_sys_recv, "compat_sys_recv");

   function compat_sys_recvfrom
     (fd : int;
      buf : System.Address;
      len : asm_compat_h.compat_size_t;
      flags : unsigned;
      addr : access linux_socket_h.sockaddr;
      addrlen : access int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:572
   pragma Import (C, compat_sys_recvfrom, "compat_sys_recvfrom");

   function compat_sys_recvmmsg
     (fd : int;
      mmsg : System.Address;
      vlen : unsigned;
      flags : unsigned;
      timeout : access asm_compat_h.compat_timespec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:575
   pragma Import (C, compat_sys_recvmmsg, "compat_sys_recvmmsg");

   function compat_sys_nanosleep (rqtp : access asm_compat_h.compat_timespec; rmtp : access asm_compat_h.compat_timespec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:578
   pragma Import (C, compat_sys_nanosleep, "compat_sys_nanosleep");

   function compat_sys_getitimer (which : int; it : access compat_itimerval) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:580
   pragma Import (C, compat_sys_getitimer, "compat_sys_getitimer");

   function compat_sys_setitimer
     (which : int;
      c_in : access compat_itimerval;
      c_out : access compat_itimerval) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:582
   pragma Import (C, compat_sys_setitimer, "compat_sys_setitimer");

   function compat_sys_times (tbuf : access compat_tms) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:585
   pragma Import (C, compat_sys_times, "compat_sys_times");

   function compat_sys_setrlimit (resource : unsigned; rlim : access compat_rlimit) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:586
   pragma Import (C, compat_sys_setrlimit, "compat_sys_setrlimit");

   function compat_sys_getrlimit (resource : unsigned; rlim : access compat_rlimit) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:588
   pragma Import (C, compat_sys_getrlimit, "compat_sys_getrlimit");

   function compat_sys_getrusage (who : int; ru : access compat_rusage) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:590
   pragma Import (C, compat_sys_getrusage, "compat_sys_getrusage");

   function compat_sys_sched_setaffinity
     (pid : asm_compat_h.compat_pid_t;
      len : unsigned;
      user_mask_ptr : access asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:591
   pragma Import (C, compat_sys_sched_setaffinity, "compat_sys_sched_setaffinity");

   function compat_sys_sched_getaffinity
     (pid : asm_compat_h.compat_pid_t;
      len : unsigned;
      user_mask_ptr : access asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:594
   pragma Import (C, compat_sys_sched_getaffinity, "compat_sys_sched_getaffinity");

   function compat_sys_timer_create
     (which_clock : linux_types_h.clockid_t;
      timer_event_spec : access compat_sigevent;
      created_timer_id : access linux_types_h.timer_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:597
   pragma Import (C, compat_sys_timer_create, "compat_sys_timer_create");

   function compat_sys_timer_settime
     (timer_id : linux_types_h.timer_t;
      flags : int;
      arg3 : access compat_itimerspec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:600
   pragma Import (C, compat_sys_timer_settime, "compat_sys_timer_settime");

   function compat_sys_timer_gettime (timer_id : linux_types_h.timer_t; setting : access compat_itimerspec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:603
   pragma Import (C, compat_sys_timer_gettime, "compat_sys_timer_gettime");

   function compat_sys_clock_settime (which_clock : linux_types_h.clockid_t; tp : access asm_compat_h.compat_timespec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:605
   pragma Import (C, compat_sys_clock_settime, "compat_sys_clock_settime");

   function compat_sys_clock_gettime (which_clock : linux_types_h.clockid_t; tp : access asm_compat_h.compat_timespec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:607
   pragma Import (C, compat_sys_clock_gettime, "compat_sys_clock_gettime");

   function compat_sys_clock_adjtime (which_clock : linux_types_h.clockid_t; tp : access compat_timex) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:609
   pragma Import (C, compat_sys_clock_adjtime, "compat_sys_clock_adjtime");

   function compat_sys_clock_getres (which_clock : linux_types_h.clockid_t; tp : access asm_compat_h.compat_timespec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:611
   pragma Import (C, compat_sys_clock_getres, "compat_sys_clock_getres");

   function compat_sys_clock_nanosleep
     (which_clock : linux_types_h.clockid_t;
      flags : int;
      rqtp : access asm_compat_h.compat_timespec;
      rmtp : access asm_compat_h.compat_timespec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:613
   pragma Import (C, compat_sys_clock_nanosleep, "compat_sys_clock_nanosleep");

   function compat_sys_rt_sigtimedwait
     (uthese : access compat_sigset_t;
      uinfo : access asm_compat_h.compat_siginfo;
      uts : access asm_compat_h.compat_timespec;
      sigsetsize : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:616
   pragma Import (C, compat_sys_rt_sigtimedwait, "compat_sys_rt_sigtimedwait");

   function compat_sys_rt_sigsuspend (unewset : access compat_sigset_t; sigsetsize : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:619
   pragma Import (C, compat_sys_rt_sigsuspend, "compat_sys_rt_sigsuspend");

   function compat_sys_rt_sigprocmask
     (how : int;
      set : access compat_sigset_t;
      oset : access compat_sigset_t;
      sigsetsize : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:621
   pragma Import (C, compat_sys_rt_sigprocmask, "compat_sys_rt_sigprocmask");

   function compat_sys_rt_sigpending (uset : access compat_sigset_t; sigsetsize : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:624
   pragma Import (C, compat_sys_rt_sigpending, "compat_sys_rt_sigpending");

   function compat_sys_rt_sigaction
     (arg1 : int;
      arg2 : access constant compat_sigaction;
      arg3 : access compat_sigaction;
      arg4 : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:627
   pragma Import (C, compat_sys_rt_sigaction, "compat_sys_rt_sigaction");

   function compat_sys_rt_sigqueueinfo
     (pid : asm_compat_h.compat_pid_t;
      sig : int;
      uinfo : access asm_compat_h.compat_siginfo) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:632
   pragma Import (C, compat_sys_rt_sigqueueinfo, "compat_sys_rt_sigqueueinfo");

   function compat_sys_sysinfo (info : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:634
   pragma Import (C, compat_sys_sysinfo, "compat_sys_sysinfo");

   function compat_sys_ioctl
     (fd : unsigned;
      cmd : unsigned;
      arg : asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:635
   pragma Import (C, compat_sys_ioctl, "compat_sys_ioctl");

   function compat_sys_futex
     (uaddr : access asm_generic_int_ll64_h.u32;
      op : int;
      val : asm_generic_int_ll64_h.u32;
      utime : access asm_compat_h.compat_timespec;
      uaddr2 : access asm_generic_int_ll64_h.u32;
      val3 : asm_generic_int_ll64_h.u32) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:637
   pragma Import (C, compat_sys_futex, "compat_sys_futex");

   function compat_sys_getsockopt
     (fd : int;
      level : int;
      optname : int;
      optval : Interfaces.C.Strings.chars_ptr;
      optlen : access int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:640
   pragma Import (C, compat_sys_getsockopt, "compat_sys_getsockopt");

   function compat_sys_kexec_load
     (c_entry : asm_compat_h.compat_ulong_t;
      nr_segments : asm_compat_h.compat_ulong_t;
      arg3 : System.Address;
      flags : asm_compat_h.compat_ulong_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:642
   pragma Import (C, compat_sys_kexec_load, "compat_sys_kexec_load");

   function compat_sys_mq_getsetattr
     (mqdes : linux_types_h.mqd_t;
      u_mqstat : System.Address;
      u_omqstat : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:646
   pragma Import (C, compat_sys_mq_getsetattr, "compat_sys_mq_getsetattr");

   function compat_sys_mq_notify (mqdes : linux_types_h.mqd_t; u_notification : access constant compat_sigevent) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:649
   pragma Import (C, compat_sys_mq_notify, "compat_sys_mq_notify");

   function compat_sys_mq_open
     (u_name : Interfaces.C.Strings.chars_ptr;
      oflag : int;
      mode : asm_compat_h.compat_mode_t;
      u_attr : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:651
   pragma Import (C, compat_sys_mq_open, "compat_sys_mq_open");

   function compat_sys_mq_timedsend
     (mqdes : linux_types_h.mqd_t;
      u_msg_ptr : Interfaces.C.Strings.chars_ptr;
      msg_len : asm_compat_h.compat_size_t;
      msg_prio : unsigned;
      u_abs_timeout : access constant asm_compat_h.compat_timespec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:654
   pragma Import (C, compat_sys_mq_timedsend, "compat_sys_mq_timedsend");

   function compat_sys_mq_timedreceive
     (mqdes : linux_types_h.mqd_t;
      u_msg_ptr : Interfaces.C.Strings.chars_ptr;
      msg_len : asm_compat_h.compat_size_t;
      u_msg_prio : access unsigned;
      u_abs_timeout : access constant asm_compat_h.compat_timespec) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:658
   pragma Import (C, compat_sys_mq_timedreceive, "compat_sys_mq_timedreceive");

   function compat_sys_socketcall (call : int; args : access asm_generic_int_ll64_h.u32) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:662
   pragma Import (C, compat_sys_socketcall, "compat_sys_socketcall");

   function compat_sys_sysctl (args : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:663
   pragma Import (C, compat_sys_sysctl, "compat_sys_sysctl");

   function compat_rw_copy_check_uvector
     (c_type : int;
      uvector : access constant compat_iovec;
      nr_segs : unsigned_long;
      fast_segs : unsigned_long;
      fast_pointer : access uapi_linux_uio_h.iovec;
      ret_pointer : System.Address) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:665
   pragma Import (CPP, compat_rw_copy_check_uvector, "_Z28compat_rw_copy_check_uvectoriPK12compat_iovecmmP5iovecPS3_");

   function compat_alloc_user_space (len : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:671
   pragma Import (CPP, compat_alloc_user_space, "_Z23compat_alloc_user_spacem");

   function compat_sys_process_vm_readv
     (pid : asm_compat_h.compat_pid_t;
      lvec : access constant compat_iovec;
      liovcnt : asm_compat_h.compat_ulong_t;
      rvec : access constant compat_iovec;
      riovcnt : asm_compat_h.compat_ulong_t;
      flags : asm_compat_h.compat_ulong_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:673
   pragma Import (C, compat_sys_process_vm_readv, "compat_sys_process_vm_readv");

   function compat_sys_process_vm_writev
     (pid : asm_compat_h.compat_pid_t;
      lvec : access constant compat_iovec;
      liovcnt : asm_compat_h.compat_ulong_t;
      rvec : access constant compat_iovec;
      riovcnt : asm_compat_h.compat_ulong_t;
      flags : asm_compat_h.compat_ulong_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:677
   pragma Import (C, compat_sys_process_vm_writev, "compat_sys_process_vm_writev");

   function compat_sys_sendfile
     (out_fd : int;
      in_fd : int;
      offset : access asm_compat_h.compat_off_t;
      count : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:682
   pragma Import (C, compat_sys_sendfile, "compat_sys_sendfile");

   function compat_sys_sendfile64
     (out_fd : int;
      in_fd : int;
      offset : access asm_compat_h.compat_loff_t;
      count : asm_compat_h.compat_size_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:684
   pragma Import (C, compat_sys_sendfile64, "compat_sys_sendfile64");

   function compat_sys_sigaltstack (uss_ptr : System.Address; uoss_ptr : access compat_stack_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:686
   pragma Import (C, compat_sys_sigaltstack, "compat_sys_sigaltstack");

   function compat_restore_altstack (uss : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:689
   pragma Import (CPP, compat_restore_altstack, "_Z23compat_restore_altstackPK18compat_sigaltstack");

   --  skipped func __compat_save_altstack

   function compat_sys_sched_rr_get_interval (pid : asm_compat_h.compat_pid_t; interval : access asm_compat_h.compat_timespec) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:699
   pragma Import (C, compat_sys_sched_rr_get_interval, "compat_sys_sched_rr_get_interval");

   function compat_sys_fanotify_mark
     (arg1 : int;
      arg2 : unsigned;
      arg3 : uapi_asm_generic_int_ll64_h.uu_u32;
      arg4 : uapi_asm_generic_int_ll64_h.uu_u32;
      arg5 : int;
      arg6 : Interfaces.C.Strings.chars_ptr) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compat.h:702
   pragma Import (C, compat_sys_fanotify_mark, "compat_sys_fanotify_mark");

end linux_compat_h;

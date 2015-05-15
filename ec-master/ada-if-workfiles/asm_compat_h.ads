pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with uapi_asm_generic_posix_types_h;
with System;
with Interfaces.C.Extensions;

package asm_compat_h is

   --  unsupported macro: COMPAT_USER_HZ 100
   --  unsupported macro: COMPAT_UTS_MACHINE "i686\0\0"
   --  unsupported macro: F_GETLK64 12
   --  unsupported macro: F_SETLK64 13
   --  unsupported macro: F_SETLKW64 14
   --  unsupported macro: COMPAT_RLIM_OLD_INFINITY 0x7fffffff
   --  unsupported macro: COMPAT_RLIM_INFINITY 0xffffffff
   --  unsupported macro: COMPAT_OFF_T_MAX 0x7fffffff
   --  unsupported macro: COMPAT_LOFF_T_MAX 0x7fffffffffffffffL
   --  arg-macro: function PR_REG_SIZE (test_thread_flag(TIF_IA32) ? 68 : 216
   --    return test_thread_flag(TIF_IA32) ? 68 : 216;
   --  arg-macro: function PRSTATUS_SIZE (test_thread_flag(TIF_IA32) ? 144 : 296
   --    return test_thread_flag(TIF_IA32) ? 144 : 296;
   --  arg-macro: procedure SET_PR_FPVALID do { *(int *) (((void *) and((S).pr_reg)) + PR_REG_SIZE(0)) := (V); } while (0)
   --    do { *(int *) (((void *) and((S).pr_reg)) + PR_REG_SIZE(0)) := (V); } while (0)
   --  unsupported macro: COMPAT_USE_64BIT_TIME (!!(task_pt_regs(current)->orig_ax & __X32_SYSCALL_BIT))
  -- * Architecture specific compatibility types
  --  

   subtype compat_size_t is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:16

   subtype compat_ssize_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:17

   subtype compat_time_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:18

   subtype compat_clock_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:19

   subtype compat_pid_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:20

   subtype uu_compat_uid_t is asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:21

   subtype uu_compat_gid_t is asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:22

   subtype uu_compat_uid32_t is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:23

   subtype uu_compat_gid32_t is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:24

   subtype compat_mode_t is asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:25

   subtype compat_ino_t is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:26

   subtype compat_dev_t is asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:27

   subtype compat_off_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:28

   subtype compat_loff_t is asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:29

   subtype compat_nlink_t is asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:30

   subtype compat_ipc_pid_t is asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:31

   subtype compat_daddr_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:32

   subtype compat_caddr_t is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:33

   subtype compat_fsid_t is uapi_asm_generic_posix_types_h.uu_kernel_fsid_t;

   subtype compat_timer_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:35

   subtype compat_key_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:36

   subtype compat_int_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:38

   subtype compat_long_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:39

   subtype compat_s64 is asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:40

   subtype compat_uint_t is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:41

   subtype compat_ulong_t is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:42

   subtype compat_u64 is asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:43

   subtype compat_uptr_t is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:44

   type compat_timespec is record
      tv_sec : aliased compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:47
      tv_nsec : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:48
   end record;
   pragma Convention (C_Pass_By_Copy, compat_timespec);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:46

   type compat_timeval is record
      tv_sec : aliased compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:52
      tv_usec : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:53
   end record;
   pragma Convention (C_Pass_By_Copy, compat_timeval);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:51

   type compat_stat is record
      st_dev : aliased compat_dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:57
      uu_pad1 : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:58
      st_ino : aliased compat_ino_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:59
      st_mode : aliased compat_mode_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:60
      st_nlink : aliased compat_nlink_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:61
      st_uid : aliased uu_compat_uid_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:62
      st_gid : aliased uu_compat_gid_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:63
      st_rdev : aliased compat_dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:64
      uu_pad2 : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:65
      st_size : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:66
      st_blksize : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:67
      st_blocks : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:68
      st_atime : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:69
      st_atime_nsec : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:70
      st_mtime : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:71
      st_mtime_nsec : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:72
      st_ctime : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:73
      st_ctime_nsec : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:74
      uu_unused4 : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:75
      uu_unused5 : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:76
   end record;
   pragma Convention (C_Pass_By_Copy, compat_stat);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:56

   type compat_flock is record
      l_type : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:80
      l_whence : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:81
      l_start : aliased compat_off_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:82
      l_len : aliased compat_off_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:83
      l_pid : aliased compat_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:84
   end record;
   pragma Convention (C_Pass_By_Copy, compat_flock);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:79

  -- * IA32 uses 4 byte alignment for 64 bit quantities,
  -- * so we need to pack this structure.
  --  

   type compat_flock64 is record
      l_type : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:96
      l_whence : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:97
      l_start : aliased compat_loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:98
      l_len : aliased compat_loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:99
      l_pid : aliased compat_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:100
   end record;
   pragma Convention (C_Pass_By_Copy, compat_flock64);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:95

   type compat_statfs_f_spare_array is array (0 .. 3) of aliased int;
   type compat_statfs is record
      f_type : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:104
      f_bsize : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:105
      f_blocks : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:106
      f_bfree : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:107
      f_bavail : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:108
      f_files : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:109
      f_ffree : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:110
      f_fsid : aliased compat_fsid_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:111
      f_namelen : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:112
      f_frsize : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:113
      f_flags : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:114
      f_spare : aliased compat_statfs_f_spare_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:115
   end record;
   pragma Convention (C_Pass_By_Copy, compat_statfs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:103

  -- SunOS ignores this field.  
  -- at least 32 bits  
   subtype compat_old_sigset_t is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:121

   subtype compat_sigset_word is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:126

   type compat_sigval (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            sival_int : aliased compat_int_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:129
         when others =>
            sival_ptr : aliased compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:130
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, compat_sigval);
   pragma Unchecked_Union (compat_sigval);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:128

   subtype compat_sigval_t is compat_sigval;

   type compat_siginfo_u_pad_array is array (0 .. 28) of aliased int;
   type anon_282;
   type anon_283 is record
      u_pid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:143
      u_uid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:144
   end record;
   pragma Convention (C_Pass_By_Copy, anon_283);
   type anon_284 is record
      u_tid : aliased compat_timer_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:149
      u_overrun : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:150
      u_sigval : compat_sigval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:151
      u_sys_private : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:152
      u_overrun_incr : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:153
   end record;
   pragma Convention (C_Pass_By_Copy, anon_284);
   type anon_285 is record
      u_pid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:158
      u_uid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:159
      u_sigval : compat_sigval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:160
   end record;
   pragma Convention (C_Pass_By_Copy, anon_285);
   type anon_286 is record
      u_pid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:165
      u_uid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:166
      u_status : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:167
      u_utime : aliased compat_clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:168
      u_stime : aliased compat_clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:169
   end record;
   pragma Convention (C_Pass_By_Copy, anon_286);
   type anon_287 is record
      u_pid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:174
      u_uid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:175
      u_status : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:176
      u_utime : aliased compat_s64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:177
      u_stime : aliased compat_s64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:178
   end record;
   pragma Convention (C_Pass_By_Copy, anon_287);
   type anon_288 is record
      u_addr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:183
   end record;
   pragma Convention (C_Pass_By_Copy, anon_288);
   type anon_289 is record
      u_band : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:188
      u_fd : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:189
   end record;
   pragma Convention (C_Pass_By_Copy, anon_289);
   type anon_290 is record
      u_call_addr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:193
      u_syscall : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:194
      u_arch : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:195
   end record;
   pragma Convention (C_Pass_By_Copy, anon_290);
   type anon_282 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            u_pad : aliased compat_siginfo_u_pad_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:139
         when 1 =>
            u_kill : aliased anon_283;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:145
         when 2 =>
            u_timer : aliased anon_284;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:154
         when 3 =>
            u_rt : aliased anon_285;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:161
         when 4 =>
            u_sigchld : aliased anon_286;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:170
         when 5 =>
            u_sigchld_x32 : aliased anon_287;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:179
         when 6 =>
            u_sigfault : aliased anon_288;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:184
         when 7 =>
            u_sigpoll : aliased anon_289;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:190
         when others =>
            u_sigsys : aliased anon_290;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:196
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_282);
   pragma Unchecked_Union (anon_282);
   type compat_siginfo is record
      si_signo : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:134
      si_errno : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:135
      si_code : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:136
      u_sifields : anon_282;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:197
   end record;
   pragma Convention (C_Pass_By_Copy, compat_siginfo);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:133

  -- kill()  
  -- sender's pid  
  -- sender's uid  
  -- POSIX.1b timers  
  -- timer id  
  -- overrun count  
  -- same as below  
  -- not to be passed to user  
  -- amount to add to overrun  
  -- POSIX.1b signals  
  -- sender's pid  
  -- sender's uid  
  -- SIGCHLD  
  -- which child  
  -- sender's uid  
  -- exit code  
  -- SIGCHLD (x32 version)  
  -- which child  
  -- sender's uid  
  -- exit code  
  -- SIGILL, SIGFPE, SIGSEGV, SIGBUS  
  -- faulting insn/memory ref.  
  -- SIGPOLL  
  -- POLL_IN, POLL_OUT, POLL_MSG  
  -- calling insn  
  -- triggering system call number  
  -- AUDIT_ARCH_* of syscall  
   subtype compat_siginfo_t is compat_siginfo;

   type compat_ipc64_perm is record
      key : aliased compat_key_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:204
      uid : aliased uu_compat_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:205
      gid : aliased uu_compat_gid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:206
      cuid : aliased uu_compat_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:207
      cgid : aliased uu_compat_gid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:208
      mode : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:209
      uu_pad1 : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:210
      seq : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:211
      uu_pad2 : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:212
      unused1 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:213
      unused2 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:214
   end record;
   pragma Convention (C_Pass_By_Copy, compat_ipc64_perm);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:203

   type compat_semid64_ds is record
      sem_perm : aliased compat_ipc64_perm;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:218
      sem_otime : aliased compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:219
      uu_unused1 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:220
      sem_ctime : aliased compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:221
      uu_unused2 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:222
      sem_nsems : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:223
      uu_unused3 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:224
      uu_unused4 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:225
   end record;
   pragma Convention (C_Pass_By_Copy, compat_semid64_ds);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:217

   type compat_msqid64_ds is record
      msg_perm : aliased compat_ipc64_perm;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:229
      msg_stime : aliased compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:230
      uu_unused1 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:231
      msg_rtime : aliased compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:232
      uu_unused2 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:233
      msg_ctime : aliased compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:234
      uu_unused3 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:235
      msg_cbytes : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:236
      msg_qnum : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:237
      msg_qbytes : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:238
      msg_lspid : aliased compat_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:239
      msg_lrpid : aliased compat_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:240
      uu_unused4 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:241
      uu_unused5 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:242
   end record;
   pragma Convention (C_Pass_By_Copy, compat_msqid64_ds);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:228

   type compat_shmid64_ds is record
      shm_perm : aliased compat_ipc64_perm;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:246
      shm_segsz : aliased compat_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:247
      shm_atime : aliased compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:248
      uu_unused1 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:249
      shm_dtime : aliased compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:250
      uu_unused2 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:251
      shm_ctime : aliased compat_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:252
      uu_unused3 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:253
      shm_cpid : aliased compat_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:254
      shm_lpid : aliased compat_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:255
      shm_nattch : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:256
      uu_unused4 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:257
      uu_unused5 : aliased compat_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:258
   end record;
   pragma Convention (C_Pass_By_Copy, compat_shmid64_ds);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:245

  -- * The type of struct elf_prstatus.pr_reg in compatible core dumps.
  --  

   --  skipped empty struct user_regs_struct

   --  skipped empty struct compat_elf_gregset_t

  -- * A pointer passed in from user mode. This should not
  -- * be used for syscall parameters, just declare them
  -- * as pointers because the syscall entry code will have
  -- * appropriately converted them already.
  --  

   function compat_ptr (uptr : compat_uptr_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:286
   pragma Import (CPP, compat_ptr, "_ZL10compat_ptrj");

   function ptr_to_compat (uptr : System.Address) return compat_uptr_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:291
   pragma Import (CPP, ptr_to_compat, "_ZL13ptr_to_compatPv");

   function arch_compat_alloc_user_space (len : long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:296
   pragma Import (CPP, arch_compat_alloc_user_space, "_ZL28arch_compat_alloc_user_spacel");

  -- -128 for the x32 ABI redzone  
   function is_x32_task return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:310
   pragma Import (CPP, is_x32_task, "_ZL11is_x32_taskv");

   function is_compat_task return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/compat.h:319
   pragma Import (CPP, is_compat_task, "_ZL14is_compat_taskv");

end asm_compat_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with uapi_asm_generic_posix_types_h;

package uapi_asm_generic_siginfo_h is

   --  unsupported macro: SI_MAX_SIZE 128
   --  unsupported macro: SI_PAD_SIZE ((SI_MAX_SIZE - __ARCH_SI_PREAMBLE_SIZE) / sizeof(int))
   --  unsupported macro: si_pid _sifields._kill._pid
   --  unsupported macro: si_uid _sifields._kill._uid
   --  unsupported macro: si_tid _sifields._timer._tid
   --  unsupported macro: si_overrun _sifields._timer._overrun
   --  unsupported macro: si_sys_private _sifields._timer._sys_private
   --  unsupported macro: si_status _sifields._sigchld._status
   --  unsupported macro: si_utime _sifields._sigchld._utime
   --  unsupported macro: si_stime _sifields._sigchld._stime
   --  unsupported macro: si_value _sifields._rt._sigval
   --  unsupported macro: si_int _sifields._rt._sigval.sival_int
   --  unsupported macro: si_ptr _sifields._rt._sigval.sival_ptr
   --  unsupported macro: si_addr _sifields._sigfault._addr
   --  unsupported macro: si_addr_lsb _sifields._sigfault._addr_lsb
   --  unsupported macro: si_band _sifields._sigpoll._band
   --  unsupported macro: si_fd _sifields._sigpoll._fd
   --  unsupported macro: si_call_addr _sifields._sigsys._call_addr
   --  unsupported macro: si_syscall _sifields._sigsys._syscall
   --  unsupported macro: si_arch _sifields._sigsys._arch
   --  unsupported macro: SI_USER 0
   --  unsupported macro: SI_KERNEL 0x80
   --  unsupported macro: SI_QUEUE -1
   --  unsupported macro: SI_TIMER __SI_CODE(__SI_TIMER,-2)
   --  unsupported macro: SI_MESGQ __SI_CODE(__SI_MESGQ,-3)
   --  unsupported macro: SI_ASYNCIO -4
   --  unsupported macro: SI_SIGIO -5
   --  unsupported macro: SI_TKILL -6
   --  unsupported macro: SI_DETHREAD -7
   --  arg-macro: function SI_FROMUSER ((siptr).si_code <= 0
   --    return (siptr).si_code <= 0;
   --  arg-macro: function SI_FROMKERNEL ((siptr).si_code > 0
   --    return (siptr).si_code > 0;
   --  unsupported macro: ILL_ILLOPC (__SI_FAULT|1)
   --  unsupported macro: ILL_ILLOPN (__SI_FAULT|2)
   --  unsupported macro: ILL_ILLADR (__SI_FAULT|3)
   --  unsupported macro: ILL_ILLTRP (__SI_FAULT|4)
   --  unsupported macro: ILL_PRVOPC (__SI_FAULT|5)
   --  unsupported macro: ILL_PRVREG (__SI_FAULT|6)
   --  unsupported macro: ILL_COPROC (__SI_FAULT|7)
   --  unsupported macro: ILL_BADSTK (__SI_FAULT|8)
   --  unsupported macro: NSIGILL 8
   --  unsupported macro: FPE_INTDIV (__SI_FAULT|1)
   --  unsupported macro: FPE_INTOVF (__SI_FAULT|2)
   --  unsupported macro: FPE_FLTDIV (__SI_FAULT|3)
   --  unsupported macro: FPE_FLTOVF (__SI_FAULT|4)
   --  unsupported macro: FPE_FLTUND (__SI_FAULT|5)
   --  unsupported macro: FPE_FLTRES (__SI_FAULT|6)
   --  unsupported macro: FPE_FLTINV (__SI_FAULT|7)
   --  unsupported macro: FPE_FLTSUB (__SI_FAULT|8)
   --  unsupported macro: NSIGFPE 8
   --  unsupported macro: SEGV_MAPERR (__SI_FAULT|1)
   --  unsupported macro: SEGV_ACCERR (__SI_FAULT|2)
   --  unsupported macro: NSIGSEGV 2
   --  unsupported macro: BUS_ADRALN (__SI_FAULT|1)
   --  unsupported macro: BUS_ADRERR (__SI_FAULT|2)
   --  unsupported macro: BUS_OBJERR (__SI_FAULT|3)
   --  unsupported macro: BUS_MCEERR_AR (__SI_FAULT|4)
   --  unsupported macro: BUS_MCEERR_AO (__SI_FAULT|5)
   --  unsupported macro: NSIGBUS 5
   --  unsupported macro: TRAP_BRKPT (__SI_FAULT|1)
   --  unsupported macro: TRAP_TRACE (__SI_FAULT|2)
   --  unsupported macro: TRAP_BRANCH (__SI_FAULT|3)
   --  unsupported macro: TRAP_HWBKPT (__SI_FAULT|4)
   --  unsupported macro: NSIGTRAP 4
   --  unsupported macro: CLD_EXITED (__SI_CHLD|1)
   --  unsupported macro: CLD_KILLED (__SI_CHLD|2)
   --  unsupported macro: CLD_DUMPED (__SI_CHLD|3)
   --  unsupported macro: CLD_TRAPPED (__SI_CHLD|4)
   --  unsupported macro: CLD_STOPPED (__SI_CHLD|5)
   --  unsupported macro: CLD_CONTINUED (__SI_CHLD|6)
   --  unsupported macro: NSIGCHLD 6
   --  unsupported macro: POLL_IN (__SI_POLL|1)
   --  unsupported macro: POLL_OUT (__SI_POLL|2)
   --  unsupported macro: POLL_MSG (__SI_POLL|3)
   --  unsupported macro: POLL_ERR (__SI_POLL|4)
   --  unsupported macro: POLL_PRI (__SI_POLL|5)
   --  unsupported macro: POLL_HUP (__SI_POLL|6)
   --  unsupported macro: NSIGPOLL 6
   --  unsupported macro: SYS_SECCOMP (__SI_SYS|1)
   --  unsupported macro: NSIGSYS 1
   --  unsupported macro: SIGEV_SIGNAL 0
   --  unsupported macro: SIGEV_NONE 1
   --  unsupported macro: SIGEV_THREAD 2
   --  unsupported macro: SIGEV_THREAD_ID 4
   --  unsupported macro: SIGEV_MAX_SIZE 64
   --  unsupported macro: SIGEV_PAD_SIZE ((SIGEV_MAX_SIZE - __ARCH_SIGEV_PREAMBLE_SIZE) / sizeof(int))
   --  unsupported macro: sigev_notify_function _sigev_un._sigev_thread._function
   --  unsupported macro: sigev_notify_attributes _sigev_un._sigev_thread._attribute
   --  unsupported macro: sigev_notify_thread_id _sigev_un._tid
   type sigval (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            sival_int : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:8
         when others =>
            sival_ptr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:9
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, sigval);
   pragma Unchecked_Union (sigval);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:7

   subtype sigval_t is sigval;

  -- * This is the size (including padding) of the part of the
  -- * struct siginfo that is before the union.
  --  

  -- * The default "si_band" type is "long", as specified by POSIX.
  -- * However, some architectures want to override this to "int"
  -- * for historical compatibility reasons, so we allow that.
  --  

   type siginfo_u_pad_array is array (0 .. 27) of aliased int;
   type anon_208;
   type anon_209 is record
      u_pid : aliased uapi_asm_generic_posix_types_h.uu_kernel_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:58
      u_uid : aliased uapi_asm_generic_posix_types_h.uu_kernel_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:59
   end record;
   pragma Convention (C_Pass_By_Copy, anon_209);
   subtype anon_208_u_pad_array is Interfaces.C.char_array (0 .. -1);
   type anon_210 is record
      u_tid : aliased uapi_asm_generic_posix_types_h.uu_kernel_timer_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:64
      u_overrun : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:65
      u_pad : aliased anon_208_u_pad_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:66
      u_sigval : sigval_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:67
      u_sys_private : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:68
   end record;
   pragma Convention (C_Pass_By_Copy, anon_210);
   type anon_211 is record
      u_pid : aliased uapi_asm_generic_posix_types_h.uu_kernel_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:73
      u_uid : aliased uapi_asm_generic_posix_types_h.uu_kernel_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:74
      u_sigval : sigval_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:75
   end record;
   pragma Convention (C_Pass_By_Copy, anon_211);
   type anon_212 is record
      u_pid : aliased uapi_asm_generic_posix_types_h.uu_kernel_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:80
      u_uid : aliased uapi_asm_generic_posix_types_h.uu_kernel_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:81
      u_status : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:82
      u_utime : aliased uapi_asm_generic_posix_types_h.uu_kernel_clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:83
      u_stime : aliased uapi_asm_generic_posix_types_h.uu_kernel_clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:84
   end record;
   pragma Convention (C_Pass_By_Copy, anon_212);
   type anon_213 is record
      u_addr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:89
      u_addr_lsb : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:93
   end record;
   pragma Convention (C_Pass_By_Copy, anon_213);
   type anon_214 is record
      u_band : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:98
      u_fd : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:99
   end record;
   pragma Convention (C_Pass_By_Copy, anon_214);
   type anon_215 is record
      u_call_addr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:104
      u_syscall : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:105
      u_arch : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:106
   end record;
   pragma Convention (C_Pass_By_Copy, anon_215);
   type anon_208 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            u_pad : aliased siginfo_u_pad_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:54
         when 1 =>
            u_kill : aliased anon_209;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:60
         when 2 =>
            u_timer : aliased anon_210;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:69
         when 3 =>
            u_rt : aliased anon_211;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:76
         when 4 =>
            u_sigchld : aliased anon_212;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:85
         when 5 =>
            u_sigfault : aliased anon_213;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:94
         when 6 =>
            u_sigpoll : aliased anon_214;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:100
         when others =>
            u_sigsys : aliased anon_215;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:107
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_208);
   pragma Unchecked_Union (anon_208);
   type siginfo is record
      si_signo : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:49
      si_errno : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:50
      si_code : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:51
      u_sifields : anon_208;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:108
   end record;
   pragma Convention (C_Pass_By_Copy, siginfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:48

  -- kill()  
  -- sender's pid  
  -- sender's uid  
  -- POSIX.1b timers  
  -- timer id  
  -- overrun count  
  -- same as below  
  -- not to be passed to user  
  -- POSIX.1b signals  
  -- sender's pid  
  -- sender's uid  
  -- SIGCHLD  
  -- which child  
  -- sender's uid  
  -- exit code  
  -- SIGILL, SIGFPE, SIGSEGV, SIGBUS  
  -- faulting insn/memory ref.  
  -- TRAP # which caused the signal  
  -- LSB of the reported address  
  -- SIGPOLL  
  -- POLL_IN, POLL_OUT, POLL_MSG  
  -- SIGSYS  
  -- calling user insn  
  -- triggering system call number  
  -- AUDIT_ARCH_* of syscall  
   subtype siginfo_t is siginfo;

  -- If the arch shares siginfo, then it has SIGSYS.  
  -- * How these fields are to be accessed.
  --  

  -- * si_code values
  -- * Digital reserves positive values for kernel-generated signals.
  --  

  -- * SIGILL si_codes
  --  

  -- * SIGFPE si_codes
  --  

  -- * SIGSEGV si_codes
  --  

  -- * SIGBUS si_codes
  --  

  -- hardware memory error consumed on a machine check: action required  
  -- hardware memory error detected in process but not consumed: action optional 
  -- * SIGTRAP si_codes
  --  

  -- * SIGCHLD si_codes
  --  

  -- * SIGPOLL si_codes
  --  

  -- * SIGSYS si_codes
  --  

  -- * sigevent definitions
  -- * 
  -- * It seems likely that SIGEV_THREAD will have to be handled from 
  -- * userspace, libpthread transmuting it to SIGEV_SIGNAL, which the
  -- * thread manager then catches and does the appropriate nonsense.
  -- * However, everything is written out here so as to not get lost.
  --  

  -- * This works because the alignment is ok on all current architectures
  -- * but we leave open this being overridden in the future
  --  

   type sigevent_u_pad_array is array (0 .. 11) of aliased int;
   type anon_216;
   type anon_217 is record
      u_function : access procedure (arg1 : sigval_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:287
      u_attribute : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:288
   end record;
   pragma Convention (C_Pass_By_Copy, anon_217);
   type anon_216 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            u_pad : aliased sigevent_u_pad_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:283
         when 1 =>
            u_tid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:284
         when others =>
            u_sigev_thread : aliased anon_217;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:289
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_216);
   pragma Unchecked_Union (anon_216);
   type sigevent is record
      sigev_value : sigval_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:279
      sigev_signo : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:280
      sigev_notify : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:281
      u_sigev_un : anon_216;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:290
   end record;
   pragma Convention (C_Pass_By_Copy, sigevent);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/siginfo.h:278

  -- really pthread_attr_t  
   subtype sigevent_t is sigevent;

end uapi_asm_generic_siginfo_h;

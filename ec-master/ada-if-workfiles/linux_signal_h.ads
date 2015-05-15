pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with uapi_asm_generic_siginfo_h;
limited with linux_sched_h;
with asm_signal_h;
with Interfaces.C.Extensions;
limited with uapi_linux_time_h;
with uapi_asm_generic_signal_defs_h;
limited with asm_ptrace_h;
with System;
limited with linux_slab_def_h;
limited with uapi_asm_signal_h;
limited with linux_seq_file_h;
with Interfaces.C.Strings;

package linux_signal_h is

   --  unsupported macro: SIGQUEUE_PREALLOC 1
   --  arg-macro: function sigmask (1UL << ((sig) - 1)
   --    return 1UL << ((sig) - 1);
   --  arg-macro: function get_signal ({ struct ksignal *p := (ksig); p.sig := get_signal_to_deliver(andp.info, andp.ka, signal_pt_regs(), NULL); p.sig > 0; }
   --    return { struct ksignal *p := (ksig); p.sig := get_signal_to_deliver(andp.info, andp.ka, signal_pt_regs(), NULL); p.sig > 0; };
   --  unsupported macro: SIGEMT_MASK 0
   --  arg-macro: procedure rt_sigmask sigmask(sig)
   --    sigmask(sig)
   --  arg-macro: function siginmask (rt_sigmask(sig) and (mask)
   --    return rt_sigmask(sig) and (mask);
   --  unsupported macro: SIG_KERNEL_ONLY_MASK ( rt_sigmask(SIGKILL) | rt_sigmask(SIGSTOP))
   --  unsupported macro: SIG_KERNEL_STOP_MASK ( rt_sigmask(SIGSTOP) | rt_sigmask(SIGTSTP) | rt_sigmask(SIGTTIN) | rt_sigmask(SIGTTOU) )
   --  unsupported macro: SIG_KERNEL_COREDUMP_MASK ( rt_sigmask(SIGQUIT) | rt_sigmask(SIGILL) | rt_sigmask(SIGTRAP) | rt_sigmask(SIGABRT) | rt_sigmask(SIGFPE) | rt_sigmask(SIGSEGV) | rt_sigmask(SIGBUS) | rt_sigmask(SIGSYS) | rt_sigmask(SIGXCPU) | rt_sigmask(SIGXFSZ) | SIGEMT_MASK )
   --  unsupported macro: SIG_KERNEL_IGNORE_MASK ( rt_sigmask(SIGCONT) | rt_sigmask(SIGCHLD) | rt_sigmask(SIGWINCH) | rt_sigmask(SIGURG) )
   --  arg-macro: function sig_kernel_only (((sig) < SIGRTMIN)  and then  siginmask(sig, SIG_KERNEL_ONLY_MASK)
   --    return ((sig) < SIGRTMIN)  and then  siginmask(sig, SIG_KERNEL_ONLY_MASK);
   --  arg-macro: function sig_kernel_coredump (((sig) < SIGRTMIN)  and then  siginmask(sig, SIG_KERNEL_COREDUMP_MASK)
   --    return ((sig) < SIGRTMIN)  and then  siginmask(sig, SIG_KERNEL_COREDUMP_MASK);
   --  arg-macro: function sig_kernel_ignore (((sig) < SIGRTMIN)  and then  siginmask(sig, SIG_KERNEL_IGNORE_MASK)
   --    return ((sig) < SIGRTMIN)  and then  siginmask(sig, SIG_KERNEL_IGNORE_MASK);
   --  arg-macro: function sig_kernel_stop (((sig) < SIGRTMIN)  and then  siginmask(sig, SIG_KERNEL_STOP_MASK)
   --    return ((sig) < SIGRTMIN)  and then  siginmask(sig, SIG_KERNEL_STOP_MASK);
   --  arg-macro: function sig_user_defined (((t).sighand.action((signr)-1).sa.sa_handler /= SIG_DFL)  and then  ((t).sighand.action((signr)-1).sa.sa_handler /= SIG_IGN)
   --    return ((t).sighand.action((signr)-1).sa.sa_handler /= SIG_DFL)  and then  ((t).sighand.action((signr)-1).sa.sa_handler /= SIG_IGN);
   --  arg-macro: function sig_fatal (notsiginmask(signr, SIG_KERNEL_IGNORE_MASKorSIG_KERNEL_STOP_MASK)  and then  (t).sighand.action((signr)-1).sa.sa_handler = SIG_DFL
   --    return notsiginmask(signr, SIG_KERNEL_IGNORE_MASKorSIG_KERNEL_STOP_MASK)  and then  (t).sighand.action((signr)-1).sa.sa_handler = SIG_DFL;
   --  arg-macro: procedure save_altstack_ex do { stack_t __user *__uss := uss; struct task_struct *t := current; put_user_ex((void __user *)t.sas_ss_sp, and__uss.ss_sp); put_user_ex(sas_ss_flags(sp), and__uss.ss_flags); put_user_ex(t.sas_ss_size, and__uss.ss_size); } while (0);
   --    do { stack_t __user *__uss := uss; struct task_struct *t := current; put_user_ex((void __user *)t.sas_ss_sp, and__uss.ss_sp); put_user_ex(sas_ss_flags(sp), and__uss.ss_flags); put_user_ex(t.sas_ss_size, and__uss.ss_size); } while (0);
  -- for sysctl  
   print_fatal_signals : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:10
   pragma Import (C, print_fatal_signals, "print_fatal_signals");

  -- * Real Time signals may be queued.
  --  

   type sigqueue is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:16
      flags : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:17
      info : aliased uapi_asm_generic_siginfo_h.siginfo_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:18
      user : access linux_sched_h.user_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:19
   end record;
   pragma Convention (C_Pass_By_Copy, sigqueue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:15

  -- flags values.  
   type sigpending is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:26
      signal : aliased asm_signal_h.sigset_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:27
   end record;
   pragma Convention (C_Pass_By_Copy, sigpending);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:25

  -- * Define some primitives to manipulate sigset_t.
  --  

  -- We don't use <linux/bitops.h> for these because there is no need to
  --   be atomic.   

   procedure sigaddset (set : access asm_signal_h.sigset_t; u_sig : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:39
   pragma Import (CPP, sigaddset, "_ZL9sigaddsetP8sigset_ti");

   procedure sigdelset (set : access asm_signal_h.sigset_t; u_sig : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:48
   pragma Import (CPP, sigdelset, "_ZL9sigdelsetP8sigset_ti");

   function sigismember (set : access asm_signal_h.sigset_t; u_sig : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:57
   pragma Import (CPP, sigismember, "_ZL11sigismemberP8sigset_ti");

   function sigisemptyset (set : access asm_signal_h.sigset_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:68
   pragma Import (CPP, sigisemptyset, "_ZL13sigisemptysetP8sigset_t");

   procedure sigorsets
     (r : access asm_signal_h.sigset_t;
      a : access constant asm_signal_h.sigset_t;
      b : access constant asm_signal_h.sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:115
   pragma Import (CPP, sigorsets, "_ZL9sigorsetsP8sigset_tPKS_S2_");

   procedure sigandsets
     (r : access asm_signal_h.sigset_t;
      a : access constant asm_signal_h.sigset_t;
      b : access constant asm_signal_h.sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:118
   pragma Import (CPP, sigandsets, "_ZL10sigandsetsP8sigset_tPKS_S2_");

   procedure sigandnsets
     (r : access asm_signal_h.sigset_t;
      a : access constant asm_signal_h.sigset_t;
      b : access constant asm_signal_h.sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:121
   pragma Import (CPP, sigandnsets, "_ZL11sigandnsetsP8sigset_tPKS_S2_");

   procedure signotset (set : access asm_signal_h.sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:145
   pragma Import (CPP, signotset, "_ZL9signotsetP8sigset_t");

   procedure sigemptyset (set : access asm_signal_h.sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:150
   pragma Import (CPP, sigemptyset, "_ZL11sigemptysetP8sigset_t");

   procedure sigfillset (set : access asm_signal_h.sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:162
   pragma Import (CPP, sigfillset, "_ZL10sigfillsetP8sigset_t");

  -- Some extensions for manipulating the low 32 signals in particular.   
   procedure sigaddsetmask (set : access asm_signal_h.sigset_t; mask : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:176
   pragma Import (CPP, sigaddsetmask, "_ZL13sigaddsetmaskP8sigset_tm");

   procedure sigdelsetmask (set : access asm_signal_h.sigset_t; mask : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:181
   pragma Import (CPP, sigdelsetmask, "_ZL13sigdelsetmaskP8sigset_tm");

   function sigtestsetmask (set : access asm_signal_h.sigset_t; mask : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:186
   pragma Import (CPP, sigtestsetmask, "_ZL14sigtestsetmaskP8sigset_tm");

   procedure siginitset (set : access asm_signal_h.sigset_t; mask : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:191
   pragma Import (CPP, siginitset, "_ZL10siginitsetP8sigset_tm");

   procedure siginitsetinv (set : access asm_signal_h.sigset_t; mask : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:203
   pragma Import (CPP, siginitsetinv, "_ZL13siginitsetinvP8sigset_tm");

   procedure init_sigpending (sig : access sigpending);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:217
   pragma Import (CPP, init_sigpending, "_ZL15init_sigpendingP10sigpending");

   procedure flush_sigqueue (queue : access sigpending);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:223
   pragma Import (CPP, flush_sigqueue, "_Z14flush_sigqueueP10sigpending");

  -- Test if 'sig' is valid signal. Use this instead of testing _NSIG directly  
   function valid_signal (sig : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:226
   pragma Import (CPP, valid_signal, "_ZL12valid_signalm");

   function next_signal (pending : access sigpending; mask : access asm_signal_h.sigset_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:234
   pragma Import (CPP, next_signal, "_Z11next_signalP10sigpendingP8sigset_t");

   function do_send_sig_info
     (sig : int;
      info : access uapi_asm_generic_siginfo_h.siginfo;
      p : access linux_sched_h.task_struct;
      group : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:235
   pragma Import (CPP, do_send_sig_info, "_Z16do_send_sig_infoiP7siginfoP11task_structb");

   function group_send_sig_info
     (sig : int;
      info : access uapi_asm_generic_siginfo_h.siginfo;
      p : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:237
   pragma Import (CPP, group_send_sig_info, "_Z19group_send_sig_infoiP7siginfoP11task_struct");

   --  skipped func __group_send_sig_info

   function do_sigtimedwait
     (arg1 : access constant asm_signal_h.sigset_t;
      arg2 : access uapi_asm_generic_siginfo_h.siginfo_t;
      arg3 : access constant uapi_linux_time_h.timespec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:239
   pragma Import (CPP, do_sigtimedwait, "_Z15do_sigtimedwaitPK8sigset_tP7siginfoPK8timespec");

   function sigprocmask
     (arg1 : int;
      arg2 : access asm_signal_h.sigset_t;
      arg3 : access asm_signal_h.sigset_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:241
   pragma Import (CPP, sigprocmask, "_Z11sigprocmaskiP8sigset_tS0_");

   procedure set_current_blocked (arg1 : access asm_signal_h.sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:242
   pragma Import (CPP, set_current_blocked, "_Z19set_current_blockedP8sigset_t");

   --  skipped func __set_current_blocked

   show_unhandled_signals : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:244
   pragma Import (C, show_unhandled_signals, "show_unhandled_signals");

   function sigsuspend (arg1 : access asm_signal_h.sigset_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:245
   pragma Import (CPP, sigsuspend, "_Z10sigsuspendP8sigset_t");

   type sigaction is record
      sa_handler : uapi_asm_generic_signal_defs_h.uu_sighandler_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:249
      sa_flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:250
      sa_restorer : uapi_asm_generic_signal_defs_h.uu_sigrestore_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:256
      sa_mask : aliased asm_signal_h.sigset_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:258
   end record;
   pragma Convention (C_Pass_By_Copy, sigaction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:247

  -- mask last for extensibility  
   type k_sigaction is record
      sa : aliased sigaction;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:262
   end record;
   pragma Convention (C_Pass_By_Copy, k_sigaction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:261

   type ksignal is record
      ka : aliased k_sigaction;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:278
      info : aliased uapi_asm_generic_siginfo_h.siginfo_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:279
      sig : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:280
   end record;
   pragma Convention (C_Pass_By_Copy, ksignal);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:277

   function get_signal_to_deliver
     (info : access uapi_asm_generic_siginfo_h.siginfo_t;
      return_ka : access k_sigaction;
      regs : access asm_ptrace_h.pt_regs;
      cookie : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:283
   pragma Import (CPP, get_signal_to_deliver, "_Z21get_signal_to_deliverP7siginfoP11k_sigactionP7pt_regsPv");

   procedure signal_setup_done
     (failed : int;
      ksig : access ksignal;
      stepping : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:284
   pragma Import (CPP, signal_setup_done, "_Z17signal_setup_doneiP7ksignali");

   procedure signal_delivered
     (sig : int;
      info : access uapi_asm_generic_siginfo_h.siginfo_t;
      ka : access k_sigaction;
      regs : access asm_ptrace_h.pt_regs;
      stepping : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:285
   pragma Import (CPP, signal_delivered, "_Z16signal_deliverediP7siginfoP11k_sigactionP7pt_regsi");

   procedure exit_signals (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:286
   pragma Import (CPP, exit_signals, "_Z12exit_signalsP11task_struct");

   procedure kernel_sigaction (arg1 : int; arg2 : uapi_asm_generic_signal_defs_h.uu_sighandler_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:287
   pragma Import (CPP, kernel_sigaction, "_Z16kernel_sigactioniPFviE");

   procedure allow_signal (sig : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:289
   pragma Import (CPP, allow_signal, "_ZL12allow_signali");

  --	 * Kernel threads handle their own signals. Let the signal code
  --	 * know it'll be handled, so that they don't get converted to
  --	 * SIGKILL or just silently dropped.
  --	  

   procedure disallow_signal (sig : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:299
   pragma Import (CPP, disallow_signal, "_ZL15disallow_signali");

  -- * Eventually that'll replace get_signal_to_deliver(); macro for now,
  -- * to avoid nastiness with include order.
  --  

   sighand_cachep : access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:316
   pragma Import (C, sighand_cachep, "sighand_cachep");

   function unhandled_signal (tsk : access linux_sched_h.task_struct; sig : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:318
   pragma Import (CPP, unhandled_signal, "_Z16unhandled_signalP11task_structi");

  -- * In POSIX a signal is sent either to a specific thread (Linux task)
  -- * or to the process as a whole (Linux thread group).  How the signal
  -- * is sent determines whether it's to one thread or the whole group,
  -- * which determines which signal mask(s) are involved in blocking it
  -- * from being delivered until later.  When the signal is delivered,
  -- * either it's caught or ignored by a user handler or it has a default
  -- * effect that applies to the whole thread group (POSIX process).
  -- *
  -- * The possible effects an unblocked signal set to SIG_DFL can have are:
  -- *   ignore	- Nothing Happens
  -- *   terminate	- kill the process, i.e. all threads in the group,
  -- * 		  similar to exit_group.  The group leader (only) reports
  -- *		  WIFSIGNALED status to its parent.
  -- *   coredump	- write a core dump file describing all threads using
  -- *		  the same mm and then kill all those threads
  -- *   stop 	- stop all the threads in the group, i.e. TASK_STOPPED state
  -- *
  -- * SIGKILL and SIGSTOP cannot be caught, blocked, or ignored.
  -- * Other signals when not blocked and set to SIG_DFL behaves as follows.
  -- * The job control signals also have other special effects.
  -- *
  -- *	+--------------------+------------------+
  -- *	|  POSIX signal      |  default action  |
  -- *	+--------------------+------------------+
  -- *	|  SIGHUP            |  terminate	|
  -- *	|  SIGINT            |	terminate	|
  -- *	|  SIGQUIT           |	coredump 	|
  -- *	|  SIGILL            |	coredump 	|
  -- *	|  SIGTRAP           |	coredump 	|
  -- *	|  SIGABRT/SIGIOT    |	coredump 	|
  -- *	|  SIGBUS            |	coredump 	|
  -- *	|  SIGFPE            |	coredump 	|
  -- *	|  SIGKILL           |	terminate(+)	|
  -- *	|  SIGUSR1           |	terminate	|
  -- *	|  SIGSEGV           |	coredump 	|
  -- *	|  SIGUSR2           |	terminate	|
  -- *	|  SIGPIPE           |	terminate	|
  -- *	|  SIGALRM           |	terminate	|
  -- *	|  SIGTERM           |	terminate	|
  -- *	|  SIGCHLD           |	ignore   	|
  -- *	|  SIGCONT           |	ignore(*)	|
  -- *	|  SIGSTOP           |	stop(*)(+)  	|
  -- *	|  SIGTSTP           |	stop(*)  	|
  -- *	|  SIGTTIN           |	stop(*)  	|
  -- *	|  SIGTTOU           |	stop(*)  	|
  -- *	|  SIGURG            |	ignore   	|
  -- *	|  SIGXCPU           |	coredump 	|
  -- *	|  SIGXFSZ           |	coredump 	|
  -- *	|  SIGVTALRM         |	terminate	|
  -- *	|  SIGPROF           |	terminate	|
  -- *	|  SIGPOLL/SIGIO     |	terminate	|
  -- *	|  SIGSYS/SIGUNUSED  |	coredump 	|
  -- *	|  SIGSTKFLT         |	terminate	|
  -- *	|  SIGWINCH          |	ignore   	|
  -- *	|  SIGPWR            |	terminate	|
  -- *	|  SIGRTMIN-SIGRTMAX |	terminate       |
  -- *	+--------------------+------------------+
  -- *	|  non-POSIX signal  |  default action  |
  -- *	+--------------------+------------------+
  -- *	|  SIGEMT            |  coredump	|
  -- *	+--------------------+------------------+
  -- *
  -- * (+) For SIGKILL and SIGSTOP the action is "always", not just "default".
  -- * (*) Special job control effects:
  -- * When SIGCONT is sent, it resumes the process (all threads in the group)
  -- * from TASK_STOPPED state and also clears any pending/queued stop signals
  -- * (any of those marked with "stop(*)").  This happens regardless of blocking,
  -- * catching, or ignoring SIGCONT.  When any stop signal is sent, it clears
  -- * any pending/queued SIGCONT signals; this happens regardless of blocking,
  -- * catching, or ignored the stop signal, though (except for SIGSTOP) the
  -- * default action of stopping the process may happen later or never.
  --  

   procedure signals_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:443
   pragma Import (CPP, signals_init, "_Z12signals_initv");

   function restore_altstack (arg1 : access constant uapi_asm_signal_h.stack_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:445
   pragma Import (CPP, restore_altstack, "_Z16restore_altstackPK11sigaltstack");

   --  skipped func __save_altstack

   procedure render_sigset_t
     (arg1 : access linux_seq_file_h.seq_file;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access asm_signal_h.sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/signal.h:458
   pragma Import (CPP, render_sigset_t, "_Z15render_sigset_tP8seq_filePKcP8sigset_t");

end linux_signal_h;

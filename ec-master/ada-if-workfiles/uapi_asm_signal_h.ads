pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;

package uapi_asm_signal_h is

   --  unsupported macro: SIGHUP 1
   --  unsupported macro: SIGINT 2
   --  unsupported macro: SIGQUIT 3
   --  unsupported macro: SIGILL 4
   --  unsupported macro: SIGTRAP 5
   --  unsupported macro: SIGABRT 6
   --  unsupported macro: SIGIOT 6
   --  unsupported macro: SIGBUS 7
   --  unsupported macro: SIGFPE 8
   --  unsupported macro: SIGKILL 9
   --  unsupported macro: SIGUSR1 10
   --  unsupported macro: SIGSEGV 11
   --  unsupported macro: SIGUSR2 12
   --  unsupported macro: SIGPIPE 13
   --  unsupported macro: SIGALRM 14
   --  unsupported macro: SIGTERM 15
   --  unsupported macro: SIGSTKFLT 16
   --  unsupported macro: SIGCHLD 17
   --  unsupported macro: SIGCONT 18
   --  unsupported macro: SIGSTOP 19
   --  unsupported macro: SIGTSTP 20
   --  unsupported macro: SIGTTIN 21
   --  unsupported macro: SIGTTOU 22
   --  unsupported macro: SIGURG 23
   --  unsupported macro: SIGXCPU 24
   --  unsupported macro: SIGXFSZ 25
   --  unsupported macro: SIGVTALRM 26
   --  unsupported macro: SIGPROF 27
   --  unsupported macro: SIGWINCH 28
   --  unsupported macro: SIGIO 29
   --  unsupported macro: SIGPOLL SIGIO
   --  unsupported macro: SIGPWR 30
   --  unsupported macro: SIGSYS 31
   --  unsupported macro: SIGUNUSED 31
   --  unsupported macro: SIGRTMIN 32
   --  unsupported macro: SIGRTMAX _NSIG
   --  unsupported macro: SA_NOCLDSTOP 0x00000001u
   --  unsupported macro: SA_NOCLDWAIT 0x00000002u
   --  unsupported macro: SA_SIGINFO 0x00000004u
   --  unsupported macro: SA_ONSTACK 0x08000000u
   --  unsupported macro: SA_RESTART 0x10000000u
   --  unsupported macro: SA_NODEFER 0x40000000u
   --  unsupported macro: SA_RESETHAND 0x80000000u
   --  unsupported macro: SA_NOMASK SA_NODEFER
   --  unsupported macro: SA_ONESHOT SA_RESETHAND
   --  unsupported macro: SA_RESTORER 0x04000000
   --  unsupported macro: MINSIGSTKSZ 2048
   --  unsupported macro: SIGSTKSZ 8192
  -- Avoid too many header ordering problems.   
  -- Here we must cater to libcs that poke about in kernel headers.   
  --#define SIGLOST		29
  -- 

  -- These should not be considered constants from userland.   
  -- * SA_FLAGS values:
  -- *
  -- * SA_ONSTACK indicates that a registered stack_t will be used.
  -- * SA_RESTART flag to get restarting signals (which were the default long ago)
  -- * SA_NOCLDSTOP flag to turn off SIGCHLD when children stop.
  -- * SA_RESETHAND clears the handler when the signal is delivered.
  -- * SA_NOCLDWAIT flag on SIGCHLD to inhibit zombies.
  -- * SA_NODEFER prevents the current signal from being masked in the handler.
  -- *
  -- * SA_ONESHOT and SA_NOMASK are the historical Linux names for the Single
  -- * Unix names RESETHAND and NODEFER respectively.
  --  

  -- Here we must cater to libcs that poke about in kernel headers.   
  -- mask last for extensibility  
   type sigaltstack is record
      ss_sp : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/signal.h:128
      ss_flags : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/signal.h:129
      ss_size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/signal.h:130
   end record;
   pragma Convention (C_Pass_By_Copy, sigaltstack);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/signal.h:127

   subtype stack_t is sigaltstack;

end uapi_asm_signal_h;

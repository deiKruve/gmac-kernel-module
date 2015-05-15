pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with uapi_asm_generic_siginfo_h;

package asm_generic_siginfo_h is

   procedure do_schedule_next_timer (info : access uapi_asm_generic_siginfo_h.siginfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/siginfo.h:18
   pragma Import (CPP, do_schedule_next_timer, "_Z22do_schedule_next_timerP7siginfo");

   procedure copy_siginfo (to : access uapi_asm_generic_siginfo_h.siginfo; from : access uapi_asm_generic_siginfo_h.siginfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/siginfo.h:24
   pragma Import (CPP, copy_siginfo, "_ZL12copy_siginfoP7siginfoS0_");

  -- _sigchld is currently the largest know union member  
   function copy_siginfo_to_user (to : access uapi_asm_generic_siginfo_h.siginfo; from : access constant uapi_asm_generic_siginfo_h.siginfo) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/siginfo.h:35
   pragma Import (CPP, copy_siginfo_to_user, "_Z20copy_siginfo_to_userP7siginfoPKS_");

end asm_generic_siginfo_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_ptrace_h;
with System;
with uapi_asm_generic_int_ll64_h;

package asm_signal_h is

  -- Most things should be clean enough to redefine this at will, if care
  --   is taken to make libc match.   

  -- at least 32 bits  
   subtype old_sigset_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/signal.h:20

   type sigset_t_sig_array is array (0 .. 0) of aliased unsigned_long;
   type sigset_t is record
      sig : aliased sigset_t_sig_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/signal.h:23
   end record;
   pragma Convention (C_Pass_By_Copy, sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/signal.h:24

   --  skipped anonymous struct anon_207

   procedure do_notify_resume
     (arg1 : access asm_ptrace_h.pt_regs;
      arg2 : System.Address;
      arg3 : uapi_asm_generic_int_ll64_h.uu_u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/signal.h:33
   pragma Import (CPP, do_notify_resume, "_Z16do_notify_resumeP7pt_regsPvj");

end asm_signal_h;

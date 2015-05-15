pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package asm_sigcontext_h is

  --	 * fpstate is really (struct _fpstate *) or (struct _xstate *)
  --	 * depending on the FP_XSTATE_MAGIC1 encoded in the SW reserved
  --	 * bytes of (struct _fpstate) and FP_XSTATE_MAGIC2 present at the end
  --	 * of extended memory layout. See comments at the definition of
  --	 * (struct _fpx_sw_bytes)
  --	  

  -- zero when no FPU/extended context  
   type sigcontext_reserved1_array is array (0 .. 7) of aliased unsigned_long;
   type sigcontext is record
      r8 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:41
      r9 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:42
      r10 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:43
      r11 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:44
      r12 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:45
      r13 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:46
      r14 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:47
      r15 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:48
      di : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:49
      si : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:50
      bp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:51
      bx : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:52
      dx : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:53
      ax : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:54
      cx : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:55
      sp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:56
      ip : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:57
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:58
      cs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:59
      gs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:60
      fs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:61
      uu_pad0 : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:62
      err : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:63
      trapno : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:64
      oldmask : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:65
      cr2 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:66
      fpstate : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:75
      reserved1 : aliased sigcontext_reserved1_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:76
   end record;
   pragma Convention (C_Pass_By_Copy, sigcontext);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/sigcontext.h:40

  --	 * fpstate is really (struct _fpstate *) or (struct _xstate *)
  --	 * depending on the FP_XSTATE_MAGIC1 encoded in the SW reserved
  --	 * bytes of (struct _fpstate) and FP_XSTATE_MAGIC2 present at the end
  --	 * of extended memory layout. See comments at the definition of
  --	 * (struct _fpx_sw_bytes)
  --	  

  -- zero when no FPU/extended context  
end asm_sigcontext_h;

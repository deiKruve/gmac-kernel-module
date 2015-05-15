pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with uapi_asm_generic_int_ll64_h;

package asm_user32_h is

  -- IA32 compatible user structures for ptrace.
  -- * These should be used for 32bit coredumps too.  

   type user_i387_ia32_struct_st_space_array is array (0 .. 19) of aliased asm_generic_int_ll64_h.u32;
   type user_i387_ia32_struct is record
      cwd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:8
      swd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:9
      twd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:10
      fip : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:11
      fcs : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:12
      foo : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:13
      fos : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:14
      st_space : aliased user_i387_ia32_struct_st_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:15
   end record;
   pragma Convention (C_Pass_By_Copy, user_i387_ia32_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:7

  -- 8*10 bytes for each FP-reg = 80 bytes  
  -- FSAVE frame with extensions  
   type user32_fxsr_struct_st_space_array is array (0 .. 31) of aliased int;
   type user32_fxsr_struct_xmm_space_array is array (0 .. 31) of aliased int;
   type user32_fxsr_struct_padding_array is array (0 .. 55) of aliased int;
   type user32_fxsr_struct is record
      cwd : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:20
      swd : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:21
      twd : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:22
      fop : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:23
      fip : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:24
      fcs : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:25
      foo : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:26
      fos : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:27
      mxcsr : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:28
      reserved : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:29
      st_space : aliased user32_fxsr_struct_st_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:30
      xmm_space : aliased user32_fxsr_struct_xmm_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:31
      padding : aliased user32_fxsr_struct_padding_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, user32_fxsr_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:19

  -- not compatible to 64bit twd  
  -- 8*16 bytes for each FP-reg = 128 bytes  
  -- 8*16 bytes for each XMM-reg = 128 bytes  
   type user_regs_struct32 is record
      ebx : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:36
      ecx : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:36
      edx : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:36
      esi : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:36
      edi : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:36
      ebp : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:36
      eax : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:36
      ds : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:37
      uu_ds : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:37
      es : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:37
      uu_es : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:37
      fs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:38
      uu_fs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:38
      gs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:38
      uu_gs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:38
      orig_eax : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:39
      eip : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:39
      cs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:40
      uu_cs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:40
      eflags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:41
      esp : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:41
      ss : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:42
      uu_ss : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:42
   end record;
   pragma Convention (C_Pass_By_Copy, user_regs_struct32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:35

  -- Where the registers are actually stored  
   subtype user32_u_comm_array is Interfaces.C.char_array (0 .. 31);
   type user32_u_debugreg_array is array (0 .. 7) of aliased int;
   type user32 is record
      regs : aliased user_regs_struct32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:46
      u_fpvalid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:47
      i387 : aliased user_i387_ia32_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:49
      u_tsize : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:51
      u_dsize : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:52
      u_ssize : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:53
      start_code : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:54
      start_stack : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:55
      signal : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:59
      reserved : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:60
      u_ar0 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:61
      u_fpstate : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:63
      magic : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:64
      u_comm : aliased user32_u_comm_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:65
      u_debugreg : aliased user32_u_debugreg_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:66
   end record;
   pragma Convention (C_Pass_By_Copy, user32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/user32.h:45

  -- True if math co-processor being used.  
  -- for this mess. Not yet used.  
  -- Math Co-processor registers.  
  -- The rest of this junk is to help gdb figure out what goes where  
  -- Text segment size (pages).  
  -- Data segment size (pages).  
  -- Stack segment size (pages).  
  -- Starting virtual address of text.  
  -- Starting virtual address of stack area.
  --				   This is actually the bottom of the stack,
  --				   the top of the stack is always found in the
  --				   esp register.   

  -- Signal that caused the core dump.  
  -- No __u32er used  
  -- Used by gdb to help find the values for  
  -- the registers.  
  -- Math Co-processor pointer.  
  -- To uniquely identify a core file  
  -- User command that was responsible  
end asm_user32_h;

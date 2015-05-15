pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package uapi_asm_vm86_h is

   --  unsupported macro: BIOSSEG 0x0f000
   --  unsupported macro: CPU_086 0
   --  unsupported macro: CPU_186 1
   --  unsupported macro: CPU_286 2
   --  unsupported macro: CPU_386 3
   --  unsupported macro: CPU_486 4
   --  unsupported macro: CPU_586 5
   --  arg-macro: function VM86_TYPE ((retval) and 0xff
   --    return (retval) and 0xff;
   --  arg-macro: function VM86_ARG ((retval) >> 8
   --    return (retval) >> 8;
   --  unsupported macro: VM86_SIGNAL 0
   --  unsupported macro: VM86_UNKNOWN 1
   --  unsupported macro: VM86_INTx 2
   --  unsupported macro: VM86_STI 3
   --  unsupported macro: VM86_PICRETURN 4
   --  unsupported macro: VM86_TRAP 6
   --  unsupported macro: VM86_PLUS_INSTALL_CHECK 0
   --  unsupported macro: VM86_ENTER 1
   --  unsupported macro: VM86_ENTER_NO_BYPASS 2
   --  unsupported macro: VM86_REQUEST_IRQ 3
   --  unsupported macro: VM86_FREE_IRQ 4
   --  unsupported macro: VM86_GET_IRQ_BITS 5
   --  unsupported macro: VM86_GET_AND_RESET_IRQ 6
   --  unsupported macro: VM86_SCREEN_BITMAP 0x0001
  -- * I'm guessing at the VIF/VIP flag usage, but hope that this is how
  -- * the Pentium uses them. Linux will return from vm86 mode when both
  -- * VIF and VIP is set.
  -- *
  -- * On a Pentium, we could probably optimize the virtual flags directly
  -- * in the eflags register instead of doing it "by hand" in vflags...
  -- *
  -- * Linus
  --  

  -- * Return values for the 'vm86()' system call
  --  

  -- * Additional return values when invoking new vm86()
  --  

  -- * function codes when invoking new vm86()
  --  

  -- * This is the stack-layout seen by the user space program when we have
  -- * done a translation of "SAVE_ALL" from vm86 mode. The real kernel layout
  -- * is 'kernel_vm86_regs' (see below).
  --  

  -- * normal regs, with special meaning for the segment descriptors..
  --  

   type vm86_regs is record
      ebx : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:66
      ecx : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:67
      edx : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:68
      esi : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:69
      edi : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:70
      ebp : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:71
      eax : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:72
      uu_null_ds : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:73
      uu_null_es : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:74
      uu_null_fs : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:75
      uu_null_gs : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:76
      orig_eax : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:77
      eip : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:78
      cs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:79
      uu_csh : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:79
      eflags : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:80
      esp : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:81
      ss : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:82
      uu_ssh : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:82
      es : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:86
      uu_esh : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:86
      ds : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:87
      uu_dsh : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:87
      fs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:88
      uu_fsh : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:88
      gs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:89
      uu_gsh : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:89
   end record;
   pragma Convention (C_Pass_By_Copy, vm86_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:62

  -- * these are specific to v86 mode:
  --  

  -- 256 bits  
   type revectored_struct_uu_map_array is array (0 .. 7) of aliased unsigned_long;
   type revectored_struct is record
      uu_map : aliased revectored_struct_uu_map_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:93
   end record;
   pragma Convention (C_Pass_By_Copy, revectored_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:92

   type vm86_struct is record
      regs : aliased vm86_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:97
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:98
      screen_bitmap : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:99
      cpu_type : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:100
      int_revectored : aliased revectored_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:101
      int21_revectored : aliased revectored_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:102
   end record;
   pragma Convention (C_Pass_By_Copy, vm86_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:96

  -- * flags masks
  --  

   type vm86plus_info_struct_vm86dbg_intxxtab_array is array (0 .. 31) of aliased unsigned_char;
   type vm86plus_info_struct is record
      force_return_for_pic : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:111
      vm86dbg_active : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:112
      vm86dbg_TFpendig : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:113
      unused : Extensions.Unsigned_28;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:114
      is_vm86pus : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:115
      vm86dbg_intxxtab : aliased vm86plus_info_struct_vm86dbg_intxxtab_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:116
   end record;
   pragma Convention (C_Pass_By_Copy, vm86plus_info_struct);
   pragma Pack (vm86plus_info_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:110

  -- for debugger  
  -- for debugger  
  -- for vm86 internal use  
  -- for debugger  
   type vm86plus_struct is record
      regs : aliased vm86_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:119
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:120
      screen_bitmap : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:121
      cpu_type : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:122
      int_revectored : aliased revectored_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:123
      int21_revectored : aliased revectored_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:124
      vm86plus : aliased vm86plus_info_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:125
   end record;
   pragma Convention (C_Pass_By_Copy, vm86plus_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vm86.h:118

end uapi_asm_vm86_h;

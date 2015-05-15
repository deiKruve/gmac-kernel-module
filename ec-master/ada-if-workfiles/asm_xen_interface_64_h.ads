pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with System;

package asm_xen_interface_64_h is

   --  unsupported macro: FLAT_RING3_CS32 0xe023
   --  unsupported macro: FLAT_RING3_CS64 0xe033
   --  unsupported macro: FLAT_RING3_DS32 0xe02b
   --  unsupported macro: FLAT_RING3_DS64 0x0000
   --  unsupported macro: FLAT_RING3_SS32 0xe02b
   --  unsupported macro: FLAT_RING3_SS64 0xe02b
   --  unsupported macro: FLAT_KERNEL_DS64 FLAT_RING3_DS64
   --  unsupported macro: FLAT_KERNEL_DS32 FLAT_RING3_DS32
   --  unsupported macro: FLAT_KERNEL_DS FLAT_KERNEL_DS64
   --  unsupported macro: FLAT_KERNEL_CS64 FLAT_RING3_CS64
   --  unsupported macro: FLAT_KERNEL_CS32 FLAT_RING3_CS32
   --  unsupported macro: FLAT_KERNEL_CS FLAT_KERNEL_CS64
   --  unsupported macro: FLAT_KERNEL_SS64 FLAT_RING3_SS64
   --  unsupported macro: FLAT_KERNEL_SS32 FLAT_RING3_SS32
   --  unsupported macro: FLAT_KERNEL_SS FLAT_KERNEL_SS64
   --  unsupported macro: FLAT_USER_DS64 FLAT_RING3_DS64
   --  unsupported macro: FLAT_USER_DS32 FLAT_RING3_DS32
   --  unsupported macro: FLAT_USER_DS FLAT_USER_DS64
   --  unsupported macro: FLAT_USER_CS64 FLAT_RING3_CS64
   --  unsupported macro: FLAT_USER_CS32 FLAT_RING3_CS32
   --  unsupported macro: FLAT_USER_CS FLAT_USER_CS64
   --  unsupported macro: FLAT_USER_SS64 FLAT_RING3_SS64
   --  unsupported macro: FLAT_USER_SS32 FLAT_RING3_SS32
   --  unsupported macro: FLAT_USER_SS FLAT_USER_SS64
   --  unsupported macro: SEGBASE_FS 0
   --  unsupported macro: SEGBASE_GS_USER 1
   --  unsupported macro: SEGBASE_GS_KERNEL 2
   --  unsupported macro: SEGBASE_GS_USER_SEL 3
   --  unsupported macro: VGCF_in_syscall (1<<_VGCF_in_syscall)
   --  unsupported macro: VGCF_IN_SYSCALL VGCF_in_syscall
   --  arg-macro: function xen_pfn_to_cr3 ((unsigned long)(pfn) << 12
   --    return (unsigned long)(pfn) << 12;
   --  arg-macro: function xen_cr3_to_pfn ((unsigned long)(cr3) >> 12
   --    return (unsigned long)(cr3) >> 12;
   --  arg-macro: function XEN_CALLBACK ((unsigned long)(__rip)
   --    return (unsigned long)(__rip);
  -- * 64-bit segment selectors
  -- * These flat segments are in the Xen-private section of every GDT. Since these
  -- * are also present in the initial GDT, many OSes will be able to avoid
  -- * installing their own GDT.
  --  

  -- * int HYPERVISOR_set_segment_base(unsigned int which, unsigned long base)
  -- *  @which == SEGBASE_*  ;  @base == 64-bit base address
  -- * Returns 0 on success.
  --  

  -- * int HYPERVISOR_iret(void)
  -- * All arguments are on the kernel stack, in the following format.
  -- * Never returns if successful. Current kernel context is lost.
  -- * The saved CS is mapped as follows:
  -- *   RING0 -> RING3 kernel mode.
  -- *   RING1 -> RING3 kernel mode.
  -- *   RING2 -> RING3 kernel mode.
  -- *   RING3 -> RING3 user mode.
  -- * However RING0 indicates that the guest kernel should return to iteself
  -- * directly with
  -- *      orb   $3,1*8(%rsp)
  -- *      iretq
  -- * If flags contains VGCF_in_syscall:
  -- *   Restore RAX, RIP, RFLAGS, RSP.
  -- *   Discard R11, RCX, CS, SS.
  -- * Otherwise:
  -- *   Restore RAX, R11, RCX, CS:RIP, RFLAGS, SS:RSP.
  -- * All other registers are saved on hypercall entry and restored to user.
  --  

  -- Guest exited in SYSCALL context? Return to guest with SYSRET?  
  -- Top of stack (%rsp at point of hypercall).  
   type iret_context is record
      rax : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:83
      r11 : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:83
      rcx : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:83
      flags : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:83
      rip : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:83
      cs : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:83
      rflags : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:83
      rsp : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:83
      ss : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:83
   end record;
   pragma Convention (C_Pass_By_Copy, iret_context);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:81

  -- Bottom of iret stack frame.  
  -- Anonymous union includes both 32- and 64-bit names (e.g., eax/rax).  
  -- Non-gcc sources must always use the proper 64-bit name (e.g., rax).  
   type cpu_user_regs_u_pad0_array is array (0 .. 0) of aliased linux_types_h.uint16_t;
   type cpu_user_regs_u_pad1_array is array (0 .. 2) of aliased linux_types_h.uint8_t;
   type cpu_user_regs_u_pad2_array is array (0 .. 2) of aliased linux_types_h.uint16_t;
   type cpu_user_regs_u_pad3_array is array (0 .. 2) of aliased linux_types_h.uint16_t;
   type cpu_user_regs_u_pad4_array is array (0 .. 2) of aliased linux_types_h.uint16_t;
   type cpu_user_regs_u_pad5_array is array (0 .. 2) of aliased linux_types_h.uint16_t;
   type cpu_user_regs_u_pad6_array is array (0 .. 2) of aliased linux_types_h.uint16_t;
   type anon_115 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rbp : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:103
         when 1 =>
            ebp : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:103
         when others =>
            u_ebp : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:103
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_115);
   pragma Unchecked_Union (anon_115);
   type anon_116 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rbx : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:104
         when 1 =>
            ebx : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:104
         when others =>
            u_ebx : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:104
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_116);
   pragma Unchecked_Union (anon_116);
   type anon_117 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rax : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:109
         when 1 =>
            eax : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:109
         when others =>
            u_eax : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:109
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_117);
   pragma Unchecked_Union (anon_117);
   type anon_118 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rcx : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:110
         when 1 =>
            ecx : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:110
         when others =>
            u_ecx : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:110
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_118);
   pragma Unchecked_Union (anon_118);
   type anon_119 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rdx : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:111
         when 1 =>
            edx : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:111
         when others =>
            u_edx : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:111
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_119);
   pragma Unchecked_Union (anon_119);
   type anon_120 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rsi : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:112
         when 1 =>
            esi : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:112
         when others =>
            u_esi : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:112
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_120);
   pragma Unchecked_Union (anon_120);
   type anon_121 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rdi : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:113
         when 1 =>
            edi : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:113
         when others =>
            u_edi : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:113
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_121);
   pragma Unchecked_Union (anon_121);
   type anon_122 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rip : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:116
         when 1 =>
            eip : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:116
         when others =>
            u_eip : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:116
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_122);
   pragma Unchecked_Union (anon_122);
   type anon_123 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rflags : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:120
         when 1 =>
            eflags : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:120
         when others =>
            u_eflags : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:120
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_123);
   pragma Unchecked_Union (anon_123);
   type anon_124 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rsp : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:121
         when 1 =>
            esp : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:121
         when others =>
            u_esp : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:121
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_124);
   pragma Unchecked_Union (anon_124);
   type cpu_user_regs is record
      r15 : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:99
      r14 : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:100
      r13 : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:101
      r12 : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:102
      field_5 : aliased anon_115;
      field_6 : aliased anon_116;
      r11 : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:105
      r10 : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:106
      r9 : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:107
      r8 : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:108
      field_11 : aliased anon_117;
      field_12 : aliased anon_118;
      field_13 : aliased anon_119;
      field_14 : aliased anon_120;
      field_15 : aliased anon_121;
      error_code : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:114
      entry_vector : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:115
      field_18 : aliased anon_122;
      cs : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:117
      u_pad0 : aliased cpu_user_regs_u_pad0_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:117
      saved_upcall_mask : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:118
      u_pad1 : aliased cpu_user_regs_u_pad1_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:119
      field_23 : aliased anon_123;
      field_24 : aliased anon_124;
      ss : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:122
      u_pad2 : aliased cpu_user_regs_u_pad2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:122
      es : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:123
      u_pad3 : aliased cpu_user_regs_u_pad3_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:123
      ds : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:124
      u_pad4 : aliased cpu_user_regs_u_pad4_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:124
      fs : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:125
      u_pad5 : aliased cpu_user_regs_u_pad5_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:125
      gs : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:126
      u_pad6 : aliased cpu_user_regs_u_pad6_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:126
   end record;
   pragma Convention (C_Pass_By_Copy, cpu_user_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:98

  -- private  
  -- private  
  -- rflags.IF == !saved_upcall_mask  
  -- Non-zero => takes precedence over fs_base.      
  -- Non-zero => takes precedence over gs_base_usr.  
   type uu_guest_handle_cpu_user_regs is new System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:128

   type arch_vcpu_info is record
      cr2 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:136
      pad : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:137
   end record;
   pragma Convention (C_Pass_By_Copy, arch_vcpu_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:135

  -- sizeof(vcpu_info_t) == 64  
   subtype xen_callback_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface_64.h:140

end asm_xen_interface_64_h;

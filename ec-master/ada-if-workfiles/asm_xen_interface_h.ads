pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with linux_types_h;
with asm_xen_interface_64_h;

package asm_xen_interface_h is

   --  arg-macro: procedure DEFINE_GUEST_HANDLE_STRUCT __DEFINE_GUEST_HANDLE(name, struct name)
   --    __DEFINE_GUEST_HANDLE(name, struct name)
   --  arg-macro: procedure DEFINE_GUEST_HANDLE __DEFINE_GUEST_HANDLE(name, name)
   --    __DEFINE_GUEST_HANDLE(name, name)
   --  unsupported macro: GUEST_HANDLE(name) __guest_handle_ ## name
   --  arg-macro: procedure set_xen_guest_handle do { (hnd) := val; } while (0)
   --    do { (hnd) := val; } while (0)
   --  unsupported macro: PRI_xen_pfn "lx"
   --  unsupported macro: PRI_xen_ulong "lx"
   --  unsupported macro: PRI_xen_long "lx"
   --  unsupported macro: HYPERVISOR_VIRT_START mk_unsigned_long(__HYPERVISOR_VIRT_START)
   --  unsupported macro: MACH2PHYS_VIRT_START mk_unsigned_long(__MACH2PHYS_VIRT_START)
   --  unsupported macro: MACH2PHYS_VIRT_END mk_unsigned_long(__MACH2PHYS_VIRT_END)
   --  unsupported macro: MACH2PHYS_NR_ENTRIES ((MACH2PHYS_VIRT_END-MACH2PHYS_VIRT_START)>>__MACH2PHYS_SHIFT)
   --  unsupported macro: MAX_VIRT_CPUS 32
   --  unsupported macro: FIRST_RESERVED_GDT_PAGE 14
   --  unsupported macro: FIRST_RESERVED_GDT_BYTE (FIRST_RESERVED_GDT_PAGE * 4096)
   --  unsupported macro: FIRST_RESERVED_GDT_ENTRY (FIRST_RESERVED_GDT_BYTE / 8)
   --  arg-macro: function TI_GET_DPL ((_ti).flags and 3
   --    return (_ti).flags and 3;
   --  arg-macro: function TI_GET_IF ((_ti).flags and 4
   --    return (_ti).flags and 4;
   --  arg-macro: function TI_SET_DPL ((_ti).flags |= (_dpl)
   --    return (_ti).flags |= (_dpl);
   --  arg-macro: function TI_SET_IF ((_ti).flags |= ((notnot(_if))<<2)
   --    return (_ti).flags |= ((notnot(_if))<<2);
   --  unsupported macro: VGCF_I387_VALID (1<<0)
   --  unsupported macro: VGCF_HVM_GUEST (1<<1)
   --  unsupported macro: VGCF_IN_KERNEL (1<<2)
   --  unsupported macro: XEN_EMULATE_PREFIX ".byte 0x0f,0x0b,0x78,0x65,0x6e ; "
   --  unsupported macro: XEN_CPUID XEN_EMULATE_PREFIX "cpuid"
  --*****************************************************************************
  -- * arch-x86_32.h
  -- *
  -- * Guest OS interface to x86 Xen.
  -- *
  -- * Copyright (c) 2004, K A Fraser
  --  

  -- Explicitly size integers that represent pfns in the public interface
  -- * with Xen so that on ARM we can have one ABI that works for 32 and 64
  -- * bit guests.  

   subtype xen_pfn_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:53

   subtype xen_ulong_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:55

   subtype xen_long_t is long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:57

  -- Guest handles for primitive C types.  
   type uu_guest_handle_uchar is access all unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:61

   type uu_guest_handle_uint is access all unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:62

   type uu_guest_handle_char is new Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:63

   type uu_guest_handle_int is access all int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:64

   type uu_guest_handle_void is new System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:65

   type uu_guest_handle_uint64_t is access all linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:66

   type uu_guest_handle_uint32_t is access all linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:67

   type uu_guest_handle_xen_pfn_t is access all xen_pfn_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:68

   type uu_guest_handle_xen_ulong_t is access all xen_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:69

  -- Maximum number of virtual CPUs in multi-processor guests.  
  -- * SEGMENT DESCRIPTOR TABLES
  --  

  -- * A number of GDT entries are reserved by Xen. These are not situated at the
  -- * start of the GDT because some stupid OSes export hard-coded selector values
  -- * in their ABI. These hard-coded values are always near the start of the GDT,
  -- * so Xen places itself out of the way, at the far end of the GDT.
  --  

  -- * Send an array of these to HYPERVISOR_set_trap_table()
  -- * The privilege level specifies which modes may enter a trap via a software
  -- * interrupt. On x86/64, since rings 1 and 2 are unavailable, we allocate
  -- * privilege levels as follows:
  -- *  Level == 0: No one may enter
  -- *  Level == 1: Kernel may enter
  -- *  Level == 2: Kernel may enter
  -- *  Level == 3: Everyone may enter
  --  

  -- exception vector                               
   type trap_info is record
      vector : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:113
      flags : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:114
      cs : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:115
      address : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:116
   end record;
   pragma Convention (C_Pass_By_Copy, trap_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:112

  -- 0-3: privilege level; 4: clear event enable?   
  -- code selector                                  
  -- code offset                                    
   type uu_guest_handle_trap_info is access all trap_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:118

  -- max pfn that appears in table  
   type arch_shared_info is record
      max_pfn : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:121
      pfn_to_mfn_frame_list_list : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:123
      nmi_reason : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:124
   end record;
   pragma Convention (C_Pass_By_Copy, arch_shared_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:120

  -- Frame containing list of mfns containing list of mfns containing p2m.  
  -- * The following is all CPU context. Note that the fpu_ctxt block is filled
  -- * in by FXSAVE if the CPU has feature FXSR; otherwise FSAVE is used.
  --  

  -- FPU registers come first so they can be aligned for FXSAVE/FXRSTOR.  
  -- User-level FPU registers      
   type vcpu_guest_context_trap_ctxt_array is array (0 .. 255) of aliased trap_info;
   type vcpu_guest_context_gdt_frames_array is array (0 .. 15) of aliased unsigned_long;
   type vcpu_guest_context_ctrlreg_array is array (0 .. 7) of aliased unsigned_long;
   type vcpu_guest_context_debugreg_array is array (0 .. 7) of aliased unsigned_long;
   type vcpu_guest_context;
   subtype vcpu_guest_context_x_array is Interfaces.C.char_array (0 .. 511);
   type anon_125 is record
      x : aliased vcpu_guest_context_x_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:143
   end record;
   pragma Convention (C_Pass_By_Copy, anon_125);
   type vcpu_guest_context is record
      fpu_ctxt : aliased anon_125;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:143
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:147
      user_regs : aliased asm_xen_interface_64_h.cpu_user_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:148
      trap_ctxt : aliased vcpu_guest_context_trap_ctxt_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:149
      ldt_base : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:150
      ldt_ents : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:150
      gdt_frames : aliased vcpu_guest_context_gdt_frames_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:151
      gdt_ents : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:151
      kernel_ss : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:152
      kernel_sp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:152
      ctrlreg : aliased vcpu_guest_context_ctrlreg_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:154
      debugreg : aliased vcpu_guest_context_debugreg_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:155
      event_callback_eip : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:162
      failsafe_callback_eip : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:163
      syscall_callback_eip : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:164
      vm_assist : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:166
      fs_base : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:169
      gs_base_kernel : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:170
      gs_base_user : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:171
   end record;
   pragma Convention (C_Pass_By_Copy, vcpu_guest_context);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:141

  -- VGCF_* flags                  
  -- User-level CPU registers      
  -- Virtual IDT                   
  -- LDT (linear address, # ents)  
  -- GDT (machine frames, # ents)  
  -- Virtual TSS (only SS1/SP1)    
  -- NB. User pagetable on x86/64 is placed in ctrlreg[1].  
  -- CR0-CR7 (control registers)   
  -- DB0-DB7 (debug registers)     
  -- CS:EIP of event callback      
  -- CS:EIP of failsafe callback   
  -- VMASST_TYPE_* bitmap  
  -- Segment base addresses.  
   type uu_guest_handle_vcpu_guest_context is access all vcpu_guest_context;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/interface.h:174

  -- * Prefix forces emulation of some non-trapping instructions.
  -- * Currently only CPUID.
  --  

end asm_xen_interface_h;

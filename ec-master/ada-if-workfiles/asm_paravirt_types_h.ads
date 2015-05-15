pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with asm_generic_int_ll64_h;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
limited with asm_desc_defs_h;
limited with asm_processor_h;
limited with linux_sched_h;
limited with linux_mm_types_h;
limited with linux_cpumask_h;
with asm_pgtable_types_h;
with asm_pgtable_64_types_h;
with linux_types_h;
with asm_spinlock_types_h;

package asm_paravirt_types_h is

   --  unsupported macro: CLBR_NONE 0
   --  unsupported macro: CLBR_EAX (1 << 0)
   --  unsupported macro: CLBR_ECX (1 << 1)
   --  unsupported macro: CLBR_EDX (1 << 2)
   --  unsupported macro: CLBR_EDI (1 << 3)
   --  unsupported macro: CLBR_RAX CLBR_EAX
   --  unsupported macro: CLBR_RCX CLBR_ECX
   --  unsupported macro: CLBR_RDX CLBR_EDX
   --  unsupported macro: CLBR_RDI CLBR_EDI
   --  unsupported macro: CLBR_RSI (1 << 4)
   --  unsupported macro: CLBR_R8 (1 << 5)
   --  unsupported macro: CLBR_R9 (1 << 6)
   --  unsupported macro: CLBR_R10 (1 << 7)
   --  unsupported macro: CLBR_R11 (1 << 8)
   --  unsupported macro: CLBR_ANY ((1 << 9) - 1)
   --  unsupported macro: CLBR_ARG_REGS (CLBR_RDI | CLBR_RSI | CLBR_RDX | CLBR_RCX | CLBR_R8 | CLBR_R9)
   --  unsupported macro: CLBR_RET_REG (CLBR_RAX)
   --  unsupported macro: CLBR_SCRATCH (CLBR_R10 | CLBR_R11)
   --  unsupported macro: CLBR_CALLEE_SAVE ((CLBR_ARG_REGS | CLBR_SCRATCH) & ~CLBR_RET_REG)
   --  arg-macro: function PARAVIRT_PATCH (offsetof(struct paravirt_patch_template, x) / sizeof(void *)
   --    return offsetof(struct paravirt_patch_template, x) / sizeof(void *);
   --  arg-macro: function paravirt_type (paravirt_typenum) "i" (PARAVIRT_PATCH(op)), (paravirt_opptr) "i" (and(op)
   --    return paravirt_typenum) "i" (PARAVIRT_PATCH(op)), (paravirt_opptr) "i" (and(op);
   --  arg-macro: function paravirt_clobber (paravirt_clobber) "i" (clobber
   --    return paravirt_clobber) "i" (clobber;
   --  arg-macro: procedure paravirt_alt _paravirt_alt(insn_string, "%c[paravirt_typenum]", "%c[paravirt_clobber]")
   --    _paravirt_alt(insn_string, "%c[paravirt_typenum]", "%c[paravirt_clobber]")
   --  unsupported macro: NATIVE_LABEL(a,x,b) "\n\t.globl " a #x "_" #b "\n" a #x "_" #b ":\n\t"
   --  unsupported macro: DEF_NATIVE(ops,name,code) __visible extern const char start_ ##ops ##_ ##name[], end_ ##ops ##_ ##name[]; asm(NATIVE_LABEL("start_", ops, name) code NATIVE_LABEL("end_", ops, name))
   --  unsupported macro: PVOP_VCALL_ARGS unsigned long __edi = __edi, __esi = __esi, __edx = __edx, __ecx = __ecx, __eax = __eax
   --  unsupported macro: PVOP_CALL_ARGS PVOP_VCALL_ARGS
   --  arg-macro: procedure PVOP_CALL_ARG1 "D" ((unsigned long)(x))
   --    "D" ((unsigned long)(x))
   --  arg-macro: procedure PVOP_CALL_ARG2 "S" ((unsigned long)(x))
   --    "S" ((unsigned long)(x))
   --  arg-macro: procedure PVOP_CALL_ARG3 "d" ((unsigned long)(x))
   --    "d" ((unsigned long)(x))
   --  arg-macro: procedure PVOP_CALL_ARG4 "c" ((unsigned long)(x))
   --    "c" ((unsigned long)(x))
   --  unsupported macro: PVOP_VCALL_CLOBBERS "=D" (__edi), "=S" (__esi), "=d" (__edx), "=c" (__ecx)
   --  unsupported macro: PVOP_CALL_CLOBBERS PVOP_VCALL_CLOBBERS, "=a" (__eax)
   --  unsupported macro: PVOP_VCALLEE_CLOBBERS "=a" (__eax)
   --  unsupported macro: PVOP_CALLEE_CLOBBERS PVOP_VCALLEE_CLOBBERS
   --  unsupported macro: EXTRA_CLOBBERS , "r8", "r9", "r10", "r11"
   --  unsupported macro: VEXTRA_CLOBBERS , "rax", "r8", "r9", "r10", "r11"
   --  arg-macro: function PVOP_TEST_NULL ((void)op
   --    return (void)op;
   --  arg-macro: procedure PVOP_CALLEE0 __PVOP_CALLEESAVE(rettype, op, "", "")
   --    __PVOP_CALLEESAVE(rettype, op, "", "")
   --  arg-macro: procedure PVOP_VCALLEE0 __PVOP_VCALLEESAVE(op, "", "")
   --    __PVOP_VCALLEESAVE(op, "", "")
   --  arg-macro: procedure PVOP_CALLEE1 __PVOP_CALLEESAVE(rettype, op, "", "", PVOP_CALL_ARG1(arg1))
   --    __PVOP_CALLEESAVE(rettype, op, "", "", PVOP_CALL_ARG1(arg1))
   --  arg-macro: procedure PVOP_VCALLEE1 __PVOP_VCALLEESAVE(op, "", "", PVOP_CALL_ARG1(arg1))
   --    __PVOP_VCALLEESAVE(op, "", "", PVOP_CALL_ARG1(arg1))
   --  arg-macro: procedure PVOP_CALLEE2 __PVOP_CALLEESAVE(rettype, op, "", "", PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
   --    __PVOP_CALLEESAVE(rettype, op, "", "", PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
   --  arg-macro: procedure PVOP_VCALLEE2 __PVOP_VCALLEESAVE(op, "", "", PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
   --    __PVOP_VCALLEESAVE(op, "", "", PVOP_CALL_ARG1(arg1), PVOP_CALL_ARG2(arg2))
   --  unsupported macro: paravirt_nop ((void *)_paravirt_nop)
  -- Bitmask of what can be clobbered: usually at least eax.  
  -- CLBR_ANY should match all regs platform has. For i386, that's just it  
  -- * Wrapper type for pointers to code which uses the non-standard
  -- * calling convention.  See PV_CALL_SAVE_REGS_THUNK below.
  --  

   type paravirt_callee_save is record
      func : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:60
   end record;
   pragma Convention (C_Pass_By_Copy, paravirt_callee_save);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:59

  -- general info  
   type pv_info is record
      kernel_rpl : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:65
      shared_kernel_pmd : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:66
      extra_user_64bit_cs : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:69
      paravirt_enabled : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:72
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:73
   end record;
   pragma Convention (C_Pass_By_Copy, pv_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:64

  -- __USER_CS if none  
  --	 * Patch may replace one of the defined code sequences with
  --	 * arbitrary code, subject to the same register constraints.
  --	 * This generally means the code is not free to clobber any
  --	 * registers other than EAX.  The patch function should return
  --	 * the number of bytes of code generated, as we nop pad the
  --	 * rest in generic code.
  --	  

   type pv_init_ops is record
      patch : access function
           (arg1 : asm_generic_int_ll64_h.u8;
            arg2 : asm_generic_int_ll64_h.u16;
            arg3 : System.Address;
            arg4 : unsigned_long;
            arg5 : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:86
   end record;
   pragma Convention (C_Pass_By_Copy, pv_init_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:76

  -- Set deferred update mode, used for batching operations.  
   type pv_lazy_ops is record
      enter : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:92
      leave : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:93
      flush : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:94
   end record;
   pragma Convention (C_Pass_By_Copy, pv_lazy_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:90

   type pv_time_ops is record
      sched_clock : access function return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:98
      steal_clock : access function (arg1 : int) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:99
      get_tsc_khz : access function return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:100
   end record;
   pragma Convention (C_Pass_By_Copy, pv_time_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:97

  -- hooks for various privileged instructions  
   type pv_cpu_ops is record
      get_debugreg : access function (arg1 : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:105
      set_debugreg : access procedure (arg1 : int; arg2 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:106
      clts : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:108
      read_cr0 : access function return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:110
      write_cr0 : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:111
      read_cr4_safe : access function return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:113
      read_cr4 : access function return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:114
      write_cr4 : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:115
      read_cr8 : access function return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:118
      write_cr8 : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:119
      load_tr_desc : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:123
      load_gdt : access procedure (arg1 : access constant asm_desc_defs_h.desc_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:124
      load_idt : access procedure (arg1 : access constant asm_desc_defs_h.desc_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:125
      store_idt : access procedure (arg1 : access asm_desc_defs_h.desc_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:127
      set_ldt : access procedure (arg1 : System.Address; arg2 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:128
      store_tr : access function return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:129
      load_tls : access procedure (arg1 : access asm_processor_h.thread_struct; arg2 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:130
      load_gs_index : access procedure (arg1 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:132
      write_ldt_entry : access procedure
           (arg1 : access asm_desc_defs_h.desc_struct;
            arg2 : int;
            arg3 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:135
      write_gdt_entry : access procedure
           (arg1 : access asm_desc_defs_h.desc_struct;
            arg2 : int;
            arg3 : System.Address;
            arg4 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:137
      write_idt_entry : access procedure
           (arg1 : access asm_desc_defs_h.gate_desc;
            arg2 : int;
            arg3 : access constant asm_desc_defs_h.gate_desc);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:139
      alloc_ldt : access procedure (arg1 : access asm_desc_defs_h.desc_struct; arg2 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:140
      free_ldt : access procedure (arg1 : access asm_desc_defs_h.desc_struct; arg2 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:141
      load_sp0 : access procedure (arg1 : access asm_processor_h.tss_struct; arg2 : access asm_processor_h.thread_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:143
      set_iopl_mask : access procedure (arg1 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:145
      wbinvd : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:147
      io_delay : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:148
      cpuid : access procedure
           (arg1 : access unsigned;
            arg2 : access unsigned;
            arg3 : access unsigned;
            arg4 : access unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:152
      read_msr : access function (arg1 : unsigned; arg2 : access int) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:156
      write_msr : access function
           (arg1 : unsigned;
            arg2 : unsigned;
            arg3 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:157
      read_tsc : access function return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:159
      read_pmc : access function (arg1 : int) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:160
      read_tscp : access function (arg1 : access unsigned) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:161
      irq_enable_sysexit : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:169
      usergs_sysret64 : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:177
      usergs_sysret32 : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:185
      iret : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:189
      swapgs : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:191
      start_context_switch : access procedure (arg1 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:193
      end_context_switch : access procedure (arg1 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:194
   end record;
   pragma Convention (C_Pass_By_Copy, pv_cpu_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:103

  -- Segment descriptor handling  
  -- store_gdt has been removed.  
  -- cpuid emulation, mostly so that caps bits can be disabled  
  -- MSR, PMC and TSR operations.
  --	   err = 0/-EFAULT.  wrmsr returns 0/-EFAULT.  

  --	 * Atomically enable interrupts and return to userspace.  This
  --	 * is only ever used to return to 32-bit processes; in a
  --	 * 64-bit kernel, it's used for 32-on-64 compat processes, but
  --	 * never native 64-bit processes.  (Jump, not call.)
  --	  

  --	 * Switch to usermode gs and return to 64-bit usermode using
  --	 * sysret.  Only used in 64-bit kernels to return to 64-bit
  --	 * processes.  Usermode register state, including %rsp, must
  --	 * already be restored.
  --	  

  --	 * Switch to usermode gs and return to 32-bit usermode using
  --	 * sysret.  Used to return to 32-on-64 compat processes.
  --	 * Other usermode register state, including %esp, must already
  --	 * be restored.
  --	  

  -- Normal iret.  Jump to this with the standard iret stack
  --	   frame set up.  

  --	 * Get/set interrupt state.  save_fl and restore_fl are only
  --	 * expected to use X86_EFLAGS_IF; all other bits
  --	 * returned from save_fl are undefined, and may be ignored by
  --	 * restore_fl.
  --	 *
  --	 * NOTE: These functions callers expect the callee to preserve
  --	 * more registers than the standard C calling convention.
  --	  

   type pv_irq_ops is record
      save_fl : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:207
      restore_fl : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:208
      irq_disable : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:209
      irq_enable : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:210
      safe_halt : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:212
      halt : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:213
      adjust_exception_frame : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:216
   end record;
   pragma Convention (C_Pass_By_Copy, pv_irq_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:197

   type pv_apic_ops is record
      startup_ipi_hook : access procedure
           (arg1 : int;
            arg2 : unsigned_long;
            arg3 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:224
   end record;
   pragma Convention (C_Pass_By_Copy, pv_apic_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:220

   type pv_mmu_ops is record
      read_cr2 : access function return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:229
      write_cr2 : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:230
      read_cr3 : access function return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:232
      write_cr3 : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:233
      activate_mm : access procedure (arg1 : access linux_mm_types_h.mm_struct; arg2 : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:240
      dup_mmap : access procedure (arg1 : access linux_mm_types_h.mm_struct; arg2 : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:242
      exit_mmap : access procedure (arg1 : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:243
      flush_tlb_user : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:247
      flush_tlb_kernel : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:248
      flush_tlb_single : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:249
      flush_tlb_others : access procedure
           (arg1 : access constant linux_cpumask_h.cpumask;
            arg2 : access linux_mm_types_h.mm_struct;
            arg3 : unsigned_long;
            arg4 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:253
      pgd_alloc : access function (arg1 : access linux_mm_types_h.mm_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:256
      pgd_free : access procedure (arg1 : access linux_mm_types_h.mm_struct; arg2 : access asm_pgtable_types_h.pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:257
      alloc_pte : access procedure (arg1 : access linux_mm_types_h.mm_struct; arg2 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:263
      alloc_pmd : access procedure (arg1 : access linux_mm_types_h.mm_struct; arg2 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:264
      alloc_pud : access procedure (arg1 : access linux_mm_types_h.mm_struct; arg2 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:265
      release_pte : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:266
      release_pmd : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:267
      release_pud : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:268
      set_pte : access procedure (arg1 : access asm_pgtable_64_types_h.pte_t; arg2 : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:271
      set_pte_at : access procedure
           (arg1 : access linux_mm_types_h.mm_struct;
            arg2 : unsigned_long;
            arg3 : access asm_pgtable_64_types_h.pte_t;
            arg4 : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:273
      set_pmd : access procedure (arg1 : access asm_pgtable_types_h.pmd_t; arg2 : asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:274
      set_pmd_at : access procedure
           (arg1 : access linux_mm_types_h.mm_struct;
            arg2 : unsigned_long;
            arg3 : access asm_pgtable_types_h.pmd_t;
            arg4 : asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:276
      pte_update : access procedure
           (arg1 : access linux_mm_types_h.mm_struct;
            arg2 : unsigned_long;
            arg3 : access asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:278
      pte_update_defer : access procedure
           (arg1 : access linux_mm_types_h.mm_struct;
            arg2 : unsigned_long;
            arg3 : access asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:280
      pmd_update : access procedure
           (arg1 : access linux_mm_types_h.mm_struct;
            arg2 : unsigned_long;
            arg3 : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:282
      pmd_update_defer : access procedure
           (arg1 : access linux_mm_types_h.mm_struct;
            arg2 : unsigned_long;
            arg3 : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:284
      ptep_modify_prot_start : access function
           (arg1 : access linux_mm_types_h.mm_struct;
            arg2 : unsigned_long;
            arg3 : access asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:287
      ptep_modify_prot_commit : access procedure
           (arg1 : access linux_mm_types_h.mm_struct;
            arg2 : unsigned_long;
            arg3 : access asm_pgtable_64_types_h.pte_t;
            arg4 : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:289
      pte_val : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:291
      make_pte : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:292
      pgd_val : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:294
      make_pgd : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:295
      set_pud : access procedure (arg1 : access asm_pgtable_types_h.pud_t; arg2 : asm_pgtable_types_h.pud_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:306
      pmd_val : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:308
      make_pmd : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:309
      pud_val : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:312
      make_pud : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:313
      set_pgd : access procedure (arg1 : access asm_pgtable_types_h.pgd_t; arg2 : asm_pgtable_types_h.pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:315
      lazy_mode : aliased pv_lazy_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:319
      set_fixmap : access procedure
           (arg1 : unsigned;
            arg2 : linux_types_h.phys_addr_t;
            arg3 : asm_pgtable_types_h.pgprot_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:326
   end record;
   pragma Convention (C_Pass_By_Copy, pv_mmu_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:228

  --	 * Hooks for intercepting the creation/use/destruction of an
  --	 * mm_struct.
  --	  

  -- TLB operations  
  -- Hooks for allocating and freeing a pagetable top-level  
  --	 * Hooks for allocating/releasing pagetable pages when they're
  --	 * attached to a pagetable
  --	  

  -- Pagetable manipulation functions  
  -- dom0 ops  
  -- Sometimes the physical address is a pfn, and sometimes its
  --	   an mfn.  We can tell which is which from the index.  

  -- enum fixed_addresses  
   type pv_lock_ops is record
      lock_spinning : aliased paravirt_callee_save;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:337
      unlock_kick : access procedure (arg1 : access asm_spinlock_types_h.arch_spinlock; arg2 : asm_spinlock_types_h.uu_ticket_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:338
   end record;
   pragma Convention (C_Pass_By_Copy, pv_lock_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:336

  -- This contains all the paravirt structures: we get a convenient
  -- * number for each function using the offset which we use to indicate
  -- * what to patch.  

   type paravirt_patch_template is record
      the_pv_init_ops : aliased pv_init_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:345
      the_pv_time_ops : aliased pv_time_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:346
      the_pv_cpu_ops : aliased pv_cpu_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:347
      the_pv_irq_ops : aliased pv_irq_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:348
      the_pv_apic_ops : aliased pv_apic_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:349
      the_pv_mmu_ops : aliased pv_mmu_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:350
      the_pv_lock_ops : aliased pv_lock_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:351
   end record;
   pragma Convention (C_Pass_By_Copy, paravirt_patch_template);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:344

   pv_info : aliased pv_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:354
   pragma Import (C, pv_info, "pv_info");

   pv_init_ops : aliased pv_init_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:355
   pragma Import (C, pv_init_ops, "pv_init_ops");

   pv_time_ops : aliased pv_time_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:356
   pragma Import (C, pv_time_ops, "pv_time_ops");

   pv_cpu_ops : aliased pv_cpu_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:357
   pragma Import (C, pv_cpu_ops, "pv_cpu_ops");

   pv_irq_ops : aliased pv_irq_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:358
   pragma Import (C, pv_irq_ops, "pv_irq_ops");

   pv_apic_ops : aliased pv_apic_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:359
   pragma Import (C, pv_apic_ops, "pv_apic_ops");

   pv_mmu_ops : aliased pv_mmu_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:360
   pragma Import (C, pv_mmu_ops, "pv_mmu_ops");

   pv_lock_ops : aliased pv_lock_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:361
   pragma Import (C, pv_lock_ops, "pv_lock_ops");

  -- * Generate some code, and mark it as patchable by the
  -- * apply_paravirt() alternate instruction patcher.
  --  

  -- Generate patchable code, with the default asm parameters.  
  -- Simple instruction patching code.  
   function paravirt_patch_nop return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:397
   pragma Import (CPP, paravirt_patch_nop, "_Z18paravirt_patch_nopv");

   function paravirt_patch_ident_32 (insnbuf : System.Address; len : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:398
   pragma Import (CPP, paravirt_patch_ident_32, "_Z23paravirt_patch_ident_32Pvj");

   function paravirt_patch_ident_64 (insnbuf : System.Address; len : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:399
   pragma Import (CPP, paravirt_patch_ident_64, "_Z23paravirt_patch_ident_64Pvj");

   function paravirt_patch_ignore (len : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:400
   pragma Import (CPP, paravirt_patch_ignore, "_Z21paravirt_patch_ignorej");

   function paravirt_patch_call
     (insnbuf : System.Address;
      target : System.Address;
      tgt_clobbers : asm_generic_int_ll64_h.u16;
      addr : unsigned_long;
      site_clobbers : asm_generic_int_ll64_h.u16;
      len : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:401
   pragma Import (CPP, paravirt_patch_call, "_Z19paravirt_patch_callPvPKvtmtj");

   function paravirt_patch_jmp
     (insnbuf : System.Address;
      target : System.Address;
      addr : unsigned_long;
      len : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:405
   pragma Import (CPP, paravirt_patch_jmp, "_Z18paravirt_patch_jmpPvPKvmj");

   function paravirt_patch_default
     (c_type : asm_generic_int_ll64_h.u8;
      clobbers : asm_generic_int_ll64_h.u16;
      insnbuf : System.Address;
      addr : unsigned_long;
      len : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:407
   pragma Import (CPP, paravirt_patch_default, "_Z22paravirt_patch_defaulthtPvmj");

   function paravirt_patch_insns
     (insnbuf : System.Address;
      len : unsigned;
      start : Interfaces.C.Strings.chars_ptr;
      c_end : Interfaces.C.Strings.chars_ptr) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:410
   pragma Import (CPP, paravirt_patch_insns, "_Z20paravirt_patch_insnsPvjPKcS1_");

   function native_patch
     (c_type : asm_generic_int_ll64_h.u8;
      clobbers : asm_generic_int_ll64_h.u16;
      ibuf : System.Address;
      addr : unsigned_long;
      len : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:413
   pragma Import (CPP, native_patch, "_Z12native_patchhtPvmj");

   function paravirt_disable_iospace return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:416
   pragma Import (CPP, paravirt_disable_iospace, "_Z24paravirt_disable_iospacev");

  -- * This generates an indirect call based on the operation type number.
  -- * The type number, computed in PARAVIRT_PATCH, is derived from the
  -- * offset into the paravirt_patch_template structure, and can therefore be
  -- * freely converted back into a structure offset.
  --  

  -- * These macros are intended to wrap calls through one of the paravirt
  -- * ops structs, so that they can be later identified and patched at
  -- * runtime.
  -- *
  -- * Normally, a call to a pv_op function is a simple indirect call:
  -- * (pv_op_struct.operations)(args...).
  -- *
  -- * Unfortunately, this is a relatively slow operation for modern CPUs,
  -- * because it cannot necessarily determine what the destination
  -- * address is.  In this case, the address is a runtime constant, so at
  -- * the very least we can patch the call to e a simple direct call, or
  -- * ideally, patch an inline implementation into the callsite.  (Direct
  -- * calls are essentially free, because the call and return addresses
  -- * are completely predictable.)
  -- *
  -- * For i386, these macros rely on the standard gcc "regparm(3)" calling
  -- * convention, in which the first three arguments are placed in %eax,
  -- * %edx, %ecx (in that order), and the remaining arguments are placed
  -- * on the stack.  All caller-save registers (eax,edx,ecx) are expected
  -- * to be modified (either clobbered or used for return values).
  -- * X86_64, on the other hand, already specifies a register-based calling
  -- * conventions, returning at %rax, with parameteres going on %rdi, %rsi,
  -- * %rdx, and %rcx. Note that for this reason, x86_64 does not need any
  -- * special handling for dealing with 4 arguments, unlike i386.
  -- * However, x86_64 also have to clobber all caller saved registers, which
  -- * unfortunately, are quite a bit (r8 - r11)
  -- *
  -- * The call instruction itself is marked by placing its start address
  -- * and size into the .parainstructions section, so that
  -- * apply_paravirt() in arch/i386/kernel/alternative.c can do the
  -- * appropriate patching under the control of the backend pv_init_ops
  -- * implementation.
  -- *
  -- * Unfortunately there's no way to get gcc to generate the args setup
  -- * for the call, and then allow the call itself to be generated by an
  -- * inline asm.  Because of this, we must do the complete arg setup and
  -- * return value handling from within these macros.  This is fairly
  -- * cumbersome.
  -- *
  -- * There are 5 sets of PVOP_* macros for dealing with 0-4 arguments.
  -- * It could be extended to more arguments, but there would be little
  -- * to be gained from that.  For each number of arguments, there are
  -- * the two VCALL and CALL variants for void and non-void functions.
  -- *
  -- * When there is a return value, the invoker of the macro must specify
  -- * the return type.  The macro then uses sizeof() on that type to
  -- * determine whether its a 32 or 64 bit value, and places the return
  -- * in the right register(s) (just %eax for 32-bit, and %edx:%eax for
  -- * 64-bit). For x86_64 machines, it just returns at %rax regardless of
  -- * the return value size.
  -- *
  -- * 64-bit arguments are passed as a pair of adjacent 32-bit arguments
  -- * i386 also passes 64-bit arguments as a pair of adjacent 32-bit arguments
  -- * in low,high order
  -- *
  -- * Small structures are passed and returned in registers.  The macro
  -- * calling convention can't directly deal with this, so the wrapper
  -- * functions must do this.
  -- *
  -- * These PVOP_* macros are only defined within this header.  This
  -- * means that all uses must be wrapped in inline functions.  This also
  -- * makes sure the incoming and outgoing types are always correct.
  --  

  -- [re]ax isn't an arg, but the return val  
  -- void functions are still allowed [re]ax for scratch  
  -- This is the only difference in x86_64. We can make it much simpler  
  -- Lazy mode for batching updates / context switch  
   type paravirt_lazy_mode is 
     (PARAVIRT_LAZY_NONE,
      PARAVIRT_LAZY_MMU,
      PARAVIRT_LAZY_CPU);
   pragma Convention (C, paravirt_lazy_mode);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:675

   function paravirt_get_lazy_mode return paravirt_lazy_mode;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:681
   pragma Import (CPP, paravirt_get_lazy_mode, "_Z22paravirt_get_lazy_modev");

   procedure paravirt_start_context_switch (prev : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:682
   pragma Import (CPP, paravirt_start_context_switch, "_Z29paravirt_start_context_switchP11task_struct");

   procedure paravirt_end_context_switch (next : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:683
   pragma Import (CPP, paravirt_end_context_switch, "_Z27paravirt_end_context_switchP11task_struct");

   procedure paravirt_enter_lazy_mmu;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:685
   pragma Import (CPP, paravirt_enter_lazy_mmu, "_Z23paravirt_enter_lazy_mmuv");

   procedure paravirt_leave_lazy_mmu;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:686
   pragma Import (CPP, paravirt_leave_lazy_mmu, "_Z23paravirt_leave_lazy_mmuv");

   procedure paravirt_flush_lazy_mmu;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:687
   pragma Import (CPP, paravirt_flush_lazy_mmu, "_Z23paravirt_flush_lazy_mmuv");

   --  skipped func _paravirt_nop

   --  skipped func _paravirt_ident_32

   --  skipped func _paravirt_ident_64

  -- These all sit in the .parainstructions section to tell us what to patch.  
  -- original instructions  
   type paravirt_patch_site is record
      instr : access asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:697
      instrtype : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:698
      len : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:699
      clobbers : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:700
   end record;
   pragma Convention (C_Pass_By_Copy, paravirt_patch_site);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt_types.h:696

  -- type of this instruction  
  -- length of original instruction  
  -- what registers you may clobber  
end asm_paravirt_types_h;

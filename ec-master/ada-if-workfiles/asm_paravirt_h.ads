pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_processor_h;
with asm_generic_int_ll64_h;
with Interfaces.C.Extensions;
with linux_jump_label_h;
limited with asm_desc_defs_h;
with System;
limited with linux_mm_types_h;
limited with linux_cpumask_h;
with asm_pgtable_types_h;
with asm_pgtable_64_types_h;
limited with linux_sched_h;

package asm_paravirt_h is

   --  arg-macro: procedure get_debugreg var := paravirt_get_debugreg(reg)
   --    var := paravirt_get_debugreg(reg)
   --  arg-macro: function get_kernel_rpl (pv_info.kernel_rpl
   --    return pv_info.kernel_rpl;
   --  arg-macro: procedure rdmsr do { int _err; u64 _l := paravirt_read_msr(msr, and_err); val1 := (u32)_l; val2 := _l >> 32; } while (0)
   --    do { int _err; u64 _l := paravirt_read_msr(msr, and_err); val1 := (u32)_l; val2 := _l >> 32; } while (0)
   --  arg-macro: procedure wrmsr do { paravirt_write_msr(msr, val1, val2); } while (0)
   --    do { paravirt_write_msr(msr, val1, val2); } while (0)
   --  arg-macro: procedure rdmsrl do { int _err; val := paravirt_read_msr(msr, and_err); } while (0)
   --    do { int _err; val := paravirt_read_msr(msr, and_err); } while (0)
   --  arg-macro: procedure wrmsrl wrmsr(msr, (u32)((u64)(val)), ((u64)(val))>>32)
   --    wrmsr(msr, (u32)((u64)(val)), ((u64)(val))>>32)
   --  arg-macro: procedure wrmsr_safe paravirt_write_msr(msr, a, b)
   --    paravirt_write_msr(msr, a, b)
   --  arg-macro: function rdmsr_safe ({ int _err; u64 _l := paravirt_read_msr(msr, and_err); (*a) := (u32)_l; (*b) := _l >> 32; _err; }
   --    return { int _err; u64 _l := paravirt_read_msr(msr, and_err); (*a) := (u32)_l; (*b) := _l >> 32; _err; };
   --  arg-macro: procedure rdtscl do { u64 _l := paravirt_read_tsc(); low := (int)_l; } while (0)
   --    do { u64 _l := paravirt_read_tsc(); low := (int)_l; } while (0)
   --  arg-macro: function rdtscll (val := paravirt_read_tsc()
   --    return val := paravirt_read_tsc();
   --  arg-macro: procedure rdpmc do { u64 _l := paravirt_read_pmc(counter); low := (u32)_l; high := _l >> 32; } while (0)
   --    do { u64 _l := paravirt_read_pmc(counter); low := (u32)_l; high := _l >> 32; } while (0)
   --  arg-macro: function rdpmcl ((val) := paravirt_read_pmc(counter)
   --    return (val) := paravirt_read_pmc(counter);
   --  arg-macro: procedure rdtscp do { int __aux; unsigned long __val := paravirt_rdtscp(and__aux); (low) := (u32)__val; (high) := (u32)(__val >> 32); (aux) := __aux; } while (0)
   --    do { int __aux; unsigned long __val := paravirt_rdtscp(and__aux); (low) := (u32)__val; (high) := (u32)(__val >> 32); (aux) := __aux; } while (0)
   --  arg-macro: procedure rdtscpll do { unsigned long __aux; val := paravirt_rdtscp(and__aux); (aux) := __aux; } while (0)
   --    do { unsigned long __aux; val := paravirt_rdtscp(and__aux); (aux) := __aux; } while (0)
   --  arg-macro: function store_tr ((tr) := paravirt_store_tr()
   --    return (tr) := paravirt_store_tr();
   --  unsupported macro: PV_SAVE_ALL_CALLER_REGS "push %rcx;" "push %rdx;" "push %rsi;" "push %rdi;" "push %r8;" "push %r9;" "push %r10;" "push %r11;"
   --  unsupported macro: PV_RESTORE_ALL_CALLER_REGS "pop %r11;" "pop %r10;" "pop %r9;" "pop %r8;" "pop %rdi;" "pop %rsi;" "pop %rdx;" "pop %rcx;"
   --  unsupported macro: PV_SAVE_REGS "pushq %%rdi;"
   --  unsupported macro: PV_RESTORE_REGS "popq %%rdi;"
   --  unsupported macro: PV_EXTRA_CLOBBERS EXTRA_CLOBBERS, "rcx" , "rdx", "rsi"
   --  unsupported macro: PV_VEXTRA_CLOBBERS EXTRA_CLOBBERS, "rdi", "rcx" , "rdx", "rsi"
   --  unsupported macro: PV_FLAGS_ARG "D"
   --  unsupported macro: PV_CALLEE_SAVE_REGS_THUNK(func) extern typeof(func) __raw_callee_save_ ##func; asm(".pushsection .text;" ".globl __raw_callee_save_" #func " ; " "__raw_callee_save_" #func ": " PV_SAVE_ALL_CALLER_REGS "call " #func ";" PV_RESTORE_ALL_CALLER_REGS "ret;" ".popsection")
   --  unsupported macro: PV_CALLEE_SAVE(func) ((struct paravirt_callee_save) { __raw_callee_save_ ##func })
  -- Various instructions on x86 need to be replaced for
  -- * para-virtualization: those hooks are defined here.  

   function paravirt_enabled return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:17
   pragma Import (CPP, paravirt_enabled, "_ZL16paravirt_enabledv");

   procedure load_sp0 (tss : access asm_processor_h.tss_struct; thread : access asm_processor_h.thread_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:22
   pragma Import (CPP, load_sp0, "_ZL8load_sp0P10tss_structP13thread_struct");

  -- The paravirtualized CPUID instruction.  
   --  skipped func __cpuid

  -- * These special macros can be used to get or set a debugging register
  --  

   function paravirt_get_debugreg (reg : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:38
   pragma Import (CPP, paravirt_get_debugreg, "_ZL21paravirt_get_debugregi");

   procedure set_debugreg (val : unsigned_long; reg : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:43
   pragma Import (CPP, set_debugreg, "_ZL12set_debugregmi");

   procedure clts;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:48
   pragma Import (CPP, clts, "_ZL4cltsv");

   function read_cr0 return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:53
   pragma Import (CPP, read_cr0, "_ZL8read_cr0v");

   procedure write_cr0 (x : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:58
   pragma Import (CPP, write_cr0, "_ZL9write_cr0m");

   function read_cr2 return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:63
   pragma Import (CPP, read_cr2, "_ZL8read_cr2v");

   procedure write_cr2 (x : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:68
   pragma Import (CPP, write_cr2, "_ZL9write_cr2m");

   function read_cr3 return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:73
   pragma Import (CPP, read_cr3, "_ZL8read_cr3v");

   procedure write_cr3 (x : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:78
   pragma Import (CPP, write_cr3, "_ZL9write_cr3m");

   function read_cr4 return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:83
   pragma Import (CPP, read_cr4, "_ZL8read_cr4v");

   function read_cr4_safe return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:87
   pragma Import (CPP, read_cr4_safe, "_ZL13read_cr4_safev");

   procedure write_cr4 (x : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:92
   pragma Import (CPP, write_cr4, "_ZL9write_cr4m");

   function read_cr8 return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:98
   pragma Import (CPP, read_cr8, "_ZL8read_cr8v");

   procedure write_cr8 (x : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:103
   pragma Import (CPP, write_cr8, "_ZL9write_cr8m");

   procedure arch_safe_halt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:109
   pragma Import (CPP, arch_safe_halt, "_ZL14arch_safe_haltv");

   procedure halt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:114
   pragma Import (CPP, halt, "_ZL4haltv");

   procedure wbinvd;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:119
   pragma Import (CPP, wbinvd, "_ZL6wbinvdv");

   function paravirt_read_msr (msr : unsigned; err : access int) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:126
   pragma Import (CPP, paravirt_read_msr, "_ZL17paravirt_read_msrjPi");

   function paravirt_write_msr
     (msr : unsigned;
      low : unsigned;
      high : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:131
   pragma Import (CPP, paravirt_write_msr, "_ZL18paravirt_write_msrjjj");

  -- These should all do BUG_ON(_err), but our headers are too tangled.  
  -- rdmsr with exception handling  
   function rdmsrl_safe (msr : unsigned; p : access Extensions.unsigned_long_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:169
   pragma Import (CPP, rdmsrl_safe, "_ZL11rdmsrl_safejPy");

   function paravirt_read_tsc return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:177
   pragma Import (CPP, paravirt_read_tsc, "_ZL17paravirt_read_tscv");

   function paravirt_sched_clock return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:190
   pragma Import (CPP, paravirt_sched_clock, "_ZL20paravirt_sched_clockv");

   paravirt_steal_enabled : aliased linux_jump_label_h.static_key;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:196
   pragma Import (C, paravirt_steal_enabled, "paravirt_steal_enabled");

   paravirt_steal_rq_enabled : aliased linux_jump_label_h.static_key;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:197
   pragma Import (C, paravirt_steal_rq_enabled, "paravirt_steal_rq_enabled");

   function paravirt_steal_clock (cpu : int) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:199
   pragma Import (CPP, paravirt_steal_clock, "_ZL20paravirt_steal_clocki");

   function paravirt_read_pmc (counter : int) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:204
   pragma Import (CPP, paravirt_read_pmc, "_ZL17paravirt_read_pmci");

   function paravirt_rdtscp (aux : access unsigned) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:218
   pragma Import (CPP, paravirt_rdtscp, "_ZL15paravirt_rdtscpPj");

   procedure paravirt_alloc_ldt (ldt : access asm_desc_defs_h.desc_struct; entries : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:239
   pragma Import (CPP, paravirt_alloc_ldt, "_ZL18paravirt_alloc_ldtP11desc_structj");

   procedure paravirt_free_ldt (ldt : access asm_desc_defs_h.desc_struct; entries : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:244
   pragma Import (CPP, paravirt_free_ldt, "_ZL17paravirt_free_ldtP11desc_structj");

   procedure load_TR_desc;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:249
   pragma Import (CPP, load_TR_desc, "_ZL12load_TR_descv");

   procedure load_gdt (dtr : access constant asm_desc_defs_h.desc_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:253
   pragma Import (CPP, load_gdt, "_ZL8load_gdtPK8desc_ptr");

   procedure load_idt (dtr : access constant asm_desc_defs_h.desc_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:257
   pragma Import (CPP, load_idt, "_ZL8load_idtPK8desc_ptr");

   procedure set_ldt (addr : System.Address; entries : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:261
   pragma Import (CPP, set_ldt, "_ZL7set_ldtPKvj");

   procedure store_idt (dtr : access asm_desc_defs_h.desc_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:265
   pragma Import (CPP, store_idt, "_ZL9store_idtP8desc_ptr");

   function paravirt_store_tr return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:269
   pragma Import (CPP, paravirt_store_tr, "_ZL17paravirt_store_trv");

   procedure load_TLS (t : access asm_processor_h.thread_struct; cpu : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:274
   pragma Import (CPP, load_TLS, "_ZL8load_TLSP13thread_structj");

   procedure load_gs_index (gs : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:280
   pragma Import (CPP, load_gs_index, "_ZL13load_gs_indexj");

   procedure write_ldt_entry
     (dt : access asm_desc_defs_h.desc_struct;
      c_entry : int;
      desc : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:286
   pragma Import (CPP, write_ldt_entry, "_ZL15write_ldt_entryP11desc_structiPKv");

   procedure write_gdt_entry
     (dt : access asm_desc_defs_h.desc_struct;
      c_entry : int;
      desc : System.Address;
      c_type : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:292
   pragma Import (CPP, write_gdt_entry, "_ZL15write_gdt_entryP11desc_structiPvi");

   procedure write_idt_entry
     (dt : access asm_desc_defs_h.gate_desc;
      c_entry : int;
      g : access constant asm_desc_defs_h.gate_desc);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:298
   pragma Import (CPP, write_idt_entry, "_ZL15write_idt_entryP13gate_struct64iPKS_");

   procedure set_iopl_mask (mask : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:302
   pragma Import (CPP, set_iopl_mask, "_ZL13set_iopl_maskj");

  -- The paravirtualized I/O functions  
   procedure slow_down_io;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:308
   pragma Import (CPP, slow_down_io, "_ZL12slow_down_iov");

   procedure startup_ipi_hook
     (phys_apicid : int;
      start_eip : unsigned_long;
      start_esp : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:319
   pragma Import (CPP, startup_ipi_hook, "_ZL16startup_ipi_hookimm");

   procedure paravirt_activate_mm (prev : access linux_mm_types_h.mm_struct; next : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:327
   pragma Import (CPP, paravirt_activate_mm, "_ZL20paravirt_activate_mmP9mm_structS0_");

   procedure arch_dup_mmap (oldmm : access linux_mm_types_h.mm_struct; mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:333
   pragma Import (CPP, arch_dup_mmap, "_ZL13arch_dup_mmapP9mm_structS0_");

   procedure arch_exit_mmap (mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:339
   pragma Import (CPP, arch_exit_mmap, "_ZL14arch_exit_mmapP9mm_struct");

   --  skipped func __flush_tlb

   --  skipped func __flush_tlb_global

   --  skipped func __flush_tlb_single

   procedure flush_tlb_others
     (the_cpumask : access constant linux_cpumask_h.cpumask;
      mm : access linux_mm_types_h.mm_struct;
      start : unsigned_long;
      c_end : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:357
   pragma Import (CPP, flush_tlb_others, "_ZL16flush_tlb_othersPK7cpumaskP9mm_structmm");

   function paravirt_pgd_alloc (mm : access linux_mm_types_h.mm_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:365
   pragma Import (CPP, paravirt_pgd_alloc, "_ZL18paravirt_pgd_allocP9mm_struct");

   procedure paravirt_pgd_free (mm : access linux_mm_types_h.mm_struct; pgd : access asm_pgtable_types_h.pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:370
   pragma Import (CPP, paravirt_pgd_free, "_ZL17paravirt_pgd_freeP9mm_structP5pgd_t");

   procedure paravirt_alloc_pte (mm : access linux_mm_types_h.mm_struct; pfn : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:375
   pragma Import (CPP, paravirt_alloc_pte, "_ZL18paravirt_alloc_pteP9mm_structm");

   procedure paravirt_release_pte (pfn : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:379
   pragma Import (CPP, paravirt_release_pte, "_ZL20paravirt_release_ptem");

   procedure paravirt_alloc_pmd (mm : access linux_mm_types_h.mm_struct; pfn : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:384
   pragma Import (CPP, paravirt_alloc_pmd, "_ZL18paravirt_alloc_pmdP9mm_structm");

   procedure paravirt_release_pmd (pfn : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:389
   pragma Import (CPP, paravirt_release_pmd, "_ZL20paravirt_release_pmdm");

   procedure paravirt_alloc_pud (mm : access linux_mm_types_h.mm_struct; pfn : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:394
   pragma Import (CPP, paravirt_alloc_pud, "_ZL18paravirt_alloc_pudP9mm_structm");

   procedure paravirt_release_pud (pfn : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:398
   pragma Import (CPP, paravirt_release_pud, "_ZL20paravirt_release_pudm");

   procedure pte_update
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:403
   pragma Import (CPP, pte_update, "_ZL10pte_updateP9mm_structmP5pte_t");

   procedure pmd_update
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:408
   pragma Import (CPP, pmd_update, "_ZL10pmd_updateP9mm_structmP5pmd_t");

   procedure pte_update_defer
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:414
   pragma Import (CPP, pte_update_defer, "_ZL16pte_update_deferP9mm_structmP5pte_t");

   procedure pmd_update_defer
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:420
   pragma Import (CPP, pmd_update_defer, "_ZL16pmd_update_deferP9mm_structmP5pmd_t");

   --  skipped func __pte

   function pte_val (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pteval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:442
   pragma Import (CPP, pte_val, "_ZL7pte_val5pte_t");

   --  skipped func __pgd

   function pgd_val (pgd : asm_pgtable_types_h.pgd_t) return asm_pgtable_64_types_h.pgdval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:470
   pragma Import (CPP, pgd_val, "_ZL7pgd_val5pgd_t");

   function ptep_modify_prot_start
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:485
   pragma Import (CPP, ptep_modify_prot_start, "_ZL22ptep_modify_prot_startP9mm_structmP5pte_t");

   procedure ptep_modify_prot_commit
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t;
      pte : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:496
   pragma Import (CPP, ptep_modify_prot_commit, "_ZL23ptep_modify_prot_commitP9mm_structmP5pte_tS1_");

  -- 5 arg words  
   procedure set_pte (ptep : access asm_pgtable_64_types_h.pte_t; pte : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:507
   pragma Import (CPP, set_pte, "_ZL7set_pteP5pte_tS_");

   procedure set_pte_at
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t;
      pte : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:517
   pragma Import (CPP, set_pte_at, "_ZL10set_pte_atP9mm_structmP5pte_tS1_");

  -- 5 arg words  
   procedure set_pmd_at
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t;
      pmd : asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:527
   pragma Import (CPP, set_pmd_at, "_ZL10set_pmd_atP9mm_structmP5pmd_tS1_");

  -- 5 arg words  
   procedure set_pmd (pmdp : access asm_pgtable_types_h.pmd_t; pmd : asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:538
   pragma Import (CPP, set_pmd, "_ZL7set_pmdP5pmd_tS_");

   --  skipped func __pmd

   function pmd_val (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_64_types_h.pmdval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:563
   pragma Import (CPP, pmd_val, "_ZL7pmd_val5pmd_t");

   procedure set_pud (pudp : access asm_pgtable_types_h.pud_t; pud : asm_pgtable_types_h.pud_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:577
   pragma Import (CPP, set_pud, "_ZL7set_pudP5pud_tS_");

   --  skipped func __pud

   function pud_val (pud : asm_pgtable_types_h.pud_t) return asm_pgtable_64_types_h.pudval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:603
   pragma Import (CPP, pud_val, "_ZL7pud_val5pud_t");

   procedure set_pgd (pgdp : access asm_pgtable_types_h.pgd_t; pgd : asm_pgtable_types_h.pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:617
   pragma Import (CPP, set_pgd, "_ZL7set_pgdP5pgd_tS_");

   procedure pgd_clear (pgdp : access asm_pgtable_types_h.pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:629
   pragma Import (CPP, pgd_clear, "_ZL9pgd_clearP5pgd_t");

   procedure pud_clear (pudp : access asm_pgtable_types_h.pud_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:634
   pragma Import (CPP, pud_clear, "_ZL9pud_clearP5pud_t");

  -- Special-case pte-setting operations for PAE, which can't update a
  --   64-bit pte atomically  

   procedure set_pte_atomic (ptep : access asm_pgtable_64_types_h.pte_t; pte : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:663
   pragma Import (CPP, set_pte_atomic, "_ZL14set_pte_atomicP5pte_tS_");

   procedure pte_clear
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:668
   pragma Import (CPP, pte_clear, "_ZL9pte_clearP9mm_structmP5pte_t");

   procedure pmd_clear (pmdp : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:674
   pragma Import (CPP, pmd_clear, "_ZL9pmd_clearP5pmd_t");

   procedure arch_start_context_switch (prev : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:681
   pragma Import (CPP, arch_start_context_switch, "_ZL25arch_start_context_switchP11task_struct");

   procedure arch_end_context_switch (next : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:686
   pragma Import (CPP, arch_end_context_switch, "_ZL23arch_end_context_switchP11task_struct");

   procedure arch_enter_lazy_mmu_mode;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:692
   pragma Import (CPP, arch_enter_lazy_mmu_mode, "_ZL24arch_enter_lazy_mmu_modev");

   procedure arch_leave_lazy_mmu_mode;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:697
   pragma Import (CPP, arch_leave_lazy_mmu_mode, "_ZL24arch_leave_lazy_mmu_modev");

   procedure arch_flush_lazy_mmu_mode;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:702
   pragma Import (CPP, arch_flush_lazy_mmu_mode, "_ZL24arch_flush_lazy_mmu_modev");

  -- enum fixed_addresses  
   --  skipped func __set_fixmap

  -- save and restore all caller-save registers, except return value  
  -- save and restore all caller-save registers, except return value  
  -- We save some registers, but all of them, that's too much. We clobber all
  -- * caller saved registers but the argument parameter  

  -- * Generate a thunk around a function which saves all caller-save
  -- * registers except for the return value.  This allows C functions to
  -- * be called from assembler code where fewer than normal registers are
  -- * available.  It may also help code generation around calls from C
  -- * code if the common case doesn't use many registers.
  -- *
  -- * When a callee is wrapped in a thunk, the caller can assume that all
  -- * arg regs and all scratch registers are preserved across the
  -- * call. The return value in rax/eax will not be saved, even for void
  -- * functions.
  --  

  -- Get a reference to a callee-save function  
  -- Promise that "func" already uses the right calling convention  
   function arch_local_save_flags return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:802
   pragma Import (CPP, arch_local_save_flags, "_ZL21arch_local_save_flagsv");

   procedure arch_local_irq_restore (f : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:807
   pragma Import (CPP, arch_local_irq_restore, "_ZL22arch_local_irq_restorem");

   procedure arch_local_irq_disable;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:812
   pragma Import (CPP, arch_local_irq_disable, "_ZL22arch_local_irq_disablev");

   procedure arch_local_irq_enable;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:817
   pragma Import (CPP, arch_local_irq_enable, "_ZL21arch_local_irq_enablev");

   function arch_local_irq_save return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:822
   pragma Import (CPP, arch_local_irq_save, "_ZL19arch_local_irq_savev");

  -- Make sure as little as possible of this mess escapes.  
   procedure default_banner;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/paravirt.h:847
   pragma Import (CPP, default_banner, "_Z14default_bannerv");

  -- * If swapgs is used while the userspace stack is still current,
  -- * there's no way to call a pvop.  The PV replacement *must* be
  -- * inlined, or the swapgs instruction must be trapped and emulated.
  --  

  -- * Note: swapgs is very special, and in practise is either going to be
  -- * implemented with a single "swapgs" instruction or something very
  -- * special.  Either way, we don't need to save any registers for
  -- * it.
  --  

end asm_paravirt_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with asm_generic_int_ll64_h;
with uapi_asm_generic_int_ll64_h;
with linux_seq_file_h;
limited with asm_pgtable_types_h;
limited with asm_math_emu_h;
with Interfaces.C.Strings;
limited with linux_sched_h;
limited with linux_slab_def_h;
with asm_desc_defs_h;
with Interfaces.C.Extensions;
limited with asm_ptrace_h;
with linux_types_h;

package asm_processor_h is

   --  unsupported macro: NET_IP_ALIGN 0
   --  unsupported macro: HBP_NUM 4
   --  unsupported macro: ARCH_MIN_TASKALIGN 16
   --  unsupported macro: ARCH_MIN_MMSTRUCT_ALIGN 0
   --  unsupported macro: X86_VENDOR_INTEL 0
   --  unsupported macro: X86_VENDOR_CYRIX 1
   --  unsupported macro: X86_VENDOR_AMD 2
   --  unsupported macro: X86_VENDOR_UMC 3
   --  unsupported macro: X86_VENDOR_CENTAUR 5
   --  unsupported macro: X86_VENDOR_TRANSMETA 7
   --  unsupported macro: X86_VENDOR_NSC 8
   --  unsupported macro: X86_VENDOR_NUM 9
   --  unsupported macro: X86_VENDOR_UNKNOWN 0xff
   --  arg-macro: procedure cpu_data per_cpu(cpu_info, cpu)
   --    per_cpu(cpu_info, cpu)
   --  arg-macro: function cache_line_size (boot_cpu_data.x86_cache_alignment
   --    return boot_cpu_data.x86_cache_alignment;
   --  unsupported macro: IO_BITMAP_BITS 65536
   --  unsupported macro: IO_BITMAP_BYTES (IO_BITMAP_BITS/8)
   --  unsupported macro: IO_BITMAP_LONGS (IO_BITMAP_BYTES/sizeof(long))
   --  unsupported macro: IO_BITMAP_OFFSET offsetof(struct tss_struct, io_bitmap)
   --  unsupported macro: INVALID_IO_BITMAP_OFFSET 0x8000
   --  unsupported macro: MXCSR_DEFAULT 0x1f80
   --  unsupported macro: HAVE_ARCH_PICK_MMAP_LAYOUT 1
   --  unsupported macro: BASE_PREFETCH "prefetcht0 (%1)"
   --  unsupported macro: TASK_SIZE_MAX ((1UL << 47) - PAGE_SIZE)
   --  unsupported macro: IA32_PAGE_OFFSET ((current->personality & ADDR_LIMIT_3GB) ? 0xc0000000 : 0xFFFFe000)
   --  unsupported macro: TASK_SIZE (test_thread_flag(TIF_ADDR32) ? IA32_PAGE_OFFSET : TASK_SIZE_MAX)
   --  arg-macro: function TASK_SIZE_OF ((test_tsk_thread_flag(child, TIF_ADDR32)) ? IA32_PAGE_OFFSET : TASK_SIZE_MAX
   --    return (test_tsk_thread_flag(child, TIF_ADDR32)) ? IA32_PAGE_OFFSET : TASK_SIZE_MAX;
   --  unsupported macro: STACK_TOP TASK_SIZE
   --  unsupported macro: STACK_TOP_MAX TASK_SIZE_MAX
   --  unsupported macro: INIT_THREAD { .sp0 = (unsigned long)&init_stack + sizeof(init_stack) }
   --  unsupported macro: INIT_TSS { .x86_tss.sp0 = (unsigned long)&init_stack + sizeof(init_stack) }
   --  arg-macro: function thread_saved_pc (*(unsigned long *)((t).thread.sp - 8)
   --    return *(unsigned long *)((t).thread.sp - 8);
   --  arg-macro: function task_pt_regs ((struct pt_regs *)(tsk).thread.sp0 - 1
   --    return (struct pt_regs *)(tsk).thread.sp0 - 1;
   --  unsupported macro: TASK_UNMAPPED_BASE (PAGE_ALIGN(TASK_SIZE / 3))
   --  arg-macro: function KSTK_EIP (task_pt_regs(task).ip
   --    return task_pt_regs(task).ip;
   --  arg-macro: procedure GET_TSC_CTL get_tsc_mode((adr))
   --    get_tsc_mode((adr))
   --  arg-macro: procedure SET_TSC_CTL set_tsc_mode((val))
   --    set_tsc_mode((val))
  -- Forward declaration, a strange C thing  
  -- * We handle most unaligned accesses in hardware.  On the other hand
  -- * unaligned DMA can be quite expensive on some Nehalem processors.
  -- *
  -- * Based on this we disable the IP header alignment in network drivers.
  --  

  -- * Default implementation of macro that returns current
  -- * instruction pointer ("program counter").
  --  

   function current_text_addr return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:46
   pragma Import (CPP, current_text_addr, "_ZL17current_text_addrv");

   type tlb_infos is 
     (ENTRIES,
      NR_INFO);
   pragma Convention (C, tlb_infos);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:63

   tlb_lli_4k : aliased array (0 .. 0) of aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:68
   pragma Import (C, tlb_lli_4k, "tlb_lli_4k");

   tlb_lli_2m : aliased array (0 .. 0) of aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:69
   pragma Import (C, tlb_lli_2m, "tlb_lli_2m");

   tlb_lli_4m : aliased array (0 .. 0) of aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:70
   pragma Import (C, tlb_lli_4m, "tlb_lli_4m");

   tlb_lld_4k : aliased array (0 .. 0) of aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:71
   pragma Import (C, tlb_lld_4k, "tlb_lld_4k");

   tlb_lld_2m : aliased array (0 .. 0) of aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:72
   pragma Import (C, tlb_lld_2m, "tlb_lld_2m");

   tlb_lld_4m : aliased array (0 .. 0) of aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:73
   pragma Import (C, tlb_lld_4m, "tlb_lld_4m");

   tlb_lld_1g : aliased array (0 .. 0) of aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:74
   pragma Import (C, tlb_lld_1g, "tlb_lld_1g");

   tlb_flushall_shift : aliased asm_generic_int_ll64_h.s8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:75
   pragma Import (C, tlb_flushall_shift, "tlb_flushall_shift");

  -- *  CPU type and hardware bug flags. Kept separately for each CPU.
  -- *  Members of this structure are referenced in head.S, so think twice
  -- *  before touching them. [mj]
  --  

  -- CPU family  
   type cpuinfo_x86_x86_capability_array is array (0 .. 10) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   subtype cpuinfo_x86_x86_vendor_id_array is Interfaces.C.char_array (0 .. 15);
   subtype cpuinfo_x86_x86_model_id_array is Interfaces.C.char_array (0 .. 63);
   type cpuinfo_x86 is record
      x86 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:84
      x86_vendor : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:85
      x86_model : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:86
      x86_mask : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:87
      x86_tlbsize : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:97
      x86_virt_bits : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:99
      x86_phys_bits : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:100
      x86_coreid_bits : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:102
      extended_cpuid_level : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:104
      cpuid_level : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:106
      x86_capability : aliased cpuinfo_x86_x86_capability_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:107
      x86_vendor_id : aliased cpuinfo_x86_x86_vendor_id_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:108
      x86_model_id : aliased cpuinfo_x86_x86_model_id_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:109
      x86_cache_size : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:111
      x86_cache_alignment : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:112
      x86_power : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:113
      loops_per_jiffy : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:114
      x86_max_cores : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:116
      apicid : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:117
      initial_apicid : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:118
      x86_clflush_size : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:119
      booted_cores : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:121
      phys_proc_id : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:123
      cpu_core_id : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:125
      compute_unit_id : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:127
      cpu_index : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:129
      microcode : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:130
   end record;
   pragma Convention (C_Pass_By_Copy, cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:83

  -- CPU vendor  
  -- It doesn't on 386's  
  -- Problems on some 486Dx4's and old 386's:  
  -- Number of 4K pages in DTLB/ITLB combined(in pages):  
  -- CPUID returned core id bits:  
  -- Max extended CPUID function supported:  
  -- Maximum supported CPUID level, -1=no CPUID:  
  -- in KB - valid for CPUS which support this call:  
  -- In bytes  
  -- cpuid returned max cores value:  
  -- number of cores as seen by the OS:  
  -- Physical processor id:  
  -- Core id:  
  -- Compute unit id  
  -- Index into per_cpu list:  
  -- * capabilities of CPUs
  --  

   boot_cpu_data : aliased cpuinfo_x86;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:147
   pragma Import (C, boot_cpu_data, "boot_cpu_data");

   new_cpu_data : aliased cpuinfo_x86;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:148
   pragma Import (C, new_cpu_data, "new_cpu_data");

   doublefault_tss : aliased tss_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:150
   pragma Import (C, doublefault_tss, "doublefault_tss");

   cpu_caps_cleared : aliased array (0 .. 9) of aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:151
   pragma Import (C, cpu_caps_cleared, "cpu_caps_cleared");

   cpu_caps_set : aliased array (0 .. 9) of aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:152
   pragma Import (C, cpu_caps_set, "cpu_caps_set");

   cpu_info : aliased cpuinfo_x86;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:155
   pragma Import (C, cpu_info, "cpu_info");

   cpuinfo_op : aliased linux_seq_file_h.seq_operations;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:162
   pragma Import (C, cpuinfo_op, "cpuinfo_op");

   procedure cpu_detect (c : access cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:166
   pragma Import (CPP, cpu_detect, "_Z10cpu_detectP11cpuinfo_x86");

   procedure fpu_detect (c : access cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:167
   pragma Import (CPP, fpu_detect, "_Z10fpu_detectP11cpuinfo_x86");

   procedure early_cpu_init;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:169
   pragma Import (CPP, early_cpu_init, "_Z14early_cpu_initv");

   procedure identify_boot_cpu;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:170
   pragma Import (CPP, identify_boot_cpu, "_Z17identify_boot_cpuv");

   procedure identify_secondary_cpu (arg1 : access cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:171
   pragma Import (CPP, identify_secondary_cpu, "_Z22identify_secondary_cpuP11cpuinfo_x86");

   procedure print_cpu_info (arg1 : access cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:172
   pragma Import (CPP, print_cpu_info, "_Z14print_cpu_infoP11cpuinfo_x86");

   procedure print_cpu_msr (arg1 : access cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:173
   pragma Import (CPP, print_cpu_msr, "_Z13print_cpu_msrP11cpuinfo_x86");

   procedure init_scattered_cpuid_features (c : access cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:174
   pragma Import (CPP, init_scattered_cpuid_features, "_Z29init_scattered_cpuid_featuresP11cpuinfo_x86");

   function init_intel_cacheinfo (c : access cpuinfo_x86) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:175
   pragma Import (CPP, init_intel_cacheinfo, "_Z20init_intel_cacheinfoP11cpuinfo_x86");

   procedure init_amd_cacheinfo (c : access cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:176
   pragma Import (CPP, init_amd_cacheinfo, "_Z18init_amd_cacheinfoP11cpuinfo_x86");

   procedure detect_extended_topology (c : access cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:178
   pragma Import (CPP, detect_extended_topology, "_Z24detect_extended_topologyP11cpuinfo_x86");

   procedure detect_ht (c : access cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:179
   pragma Import (CPP, detect_ht, "_Z9detect_htP11cpuinfo_x86");

   function have_cpuid_p return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:184
   pragma Import (CPP, have_cpuid_p, "_ZL12have_cpuid_pv");

   procedure native_cpuid
     (eax : access unsigned;
      ebx : access unsigned;
      ecx : access unsigned;
      edx : access unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:189
   pragma Import (CPP, native_cpuid, "_ZL12native_cpuidPjS_S_S_");

  -- ecx is often an input as well as an output.  
   procedure load_cr3 (pgdir : access asm_pgtable_types_h.pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:202
   pragma Import (CPP, load_cr3, "_ZL8load_cr3P5pgd_t");

  -- This is the TSS defined by the hardware.  
  -- ss1 caches MSR_IA32_SYSENTER_CS:  
   type x86_hw_tss_ist_array is array (0 .. 6) of aliased asm_generic_int_ll64_h.u64;
   type x86_hw_tss is record
      reserved1 : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:242
      sp0 : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:243
      sp1 : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:244
      sp2 : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:245
      reserved2 : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:246
      ist : aliased x86_hw_tss_ist_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:247
      reserved3 : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:248
      reserved4 : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:249
      reserved5 : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:250
      io_bitmap_base : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:251
   end record;
   pragma Convention (C_Pass_By_Copy, x86_hw_tss);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:241

  -- * IO-bitmap sizes:
  --  

  --	 * The hardware state:
  --	  

   type tss_struct_io_bitmap_array is array (0 .. 1024) of aliased unsigned_long;
   type tss_struct_stack_array is array (0 .. 63) of aliased unsigned_long;
   type tss_struct is record
      x86_tss : aliased x86_hw_tss;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:269
      io_bitmap : aliased tss_struct_io_bitmap_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:277
      stack : aliased tss_struct_stack_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:282
   end record;
   pragma Convention (C_Pass_By_Copy, tss_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:265

  --	 * The extra 1 is there because the CPU will access an
  --	 * additional byte beyond the end of the IO permission
  --	 * bitmap. The extra byte must be all 1 bits, and must
  --	 * be within the limit.
  --	  

  --	 * .. and then another 0x100 bytes for the emergency kernel stack:
  --	  

   init_tss : aliased tss_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:286
   pragma Import (C, init_tss, "init_tss");

  -- * Save the original ist values for checking stack pointers during debugging
  --  

   type orig_ist_ist_array is array (0 .. 6) of aliased unsigned_long;
   type orig_ist is record
      ist : aliased orig_ist_ist_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:292
   end record;
   pragma Convention (C_Pass_By_Copy, orig_ist);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:291

  -- FPU Control Word		 
   type i387_fsave_struct_st_space_array is array (0 .. 19) of aliased asm_generic_int_ll64_h.u32;
   type i387_fsave_struct is record
      cwd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:298
      swd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:299
      twd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:300
      fip : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:301
      fcs : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:302
      foo : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:303
      fos : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:304
      st_space : aliased i387_fsave_struct_st_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:307
      status : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:310
   end record;
   pragma Convention (C_Pass_By_Copy, i387_fsave_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:297

  -- FPU Status Word		 
  -- FPU Tag Word			 
  -- FPU IP Offset		 
  -- FPU IP Selector		 
  -- FPU Operand Pointer Offset	 
  -- FPU Operand Pointer Selector	 
  -- 8*10 bytes for each FP-reg = 80 bytes:			 
  -- Software status information [not touched by FSAVE ]:		 
  -- Control Word			 
   type i387_fxsave_struct_st_space_array is array (0 .. 31) of aliased asm_generic_int_ll64_h.u32;
   type i387_fxsave_struct_xmm_space_array is array (0 .. 63) of aliased asm_generic_int_ll64_h.u32;
   type i387_fxsave_struct_padding_array is array (0 .. 11) of aliased asm_generic_int_ll64_h.u32;
   type anon_27;
   type anon_28 is record
      rip : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:320
      rdp : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:321
   end record;
   pragma Convention (C_Pass_By_Copy, anon_28);
   type anon_29 is record
      fip : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:324
      fcs : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:325
      foo : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:326
      fos : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:327
   end record;
   pragma Convention (C_Pass_By_Copy, anon_29);
   type anon_27 (discr : unsigned := 0) is record
      case discr is
            parent : aliased anon_28;
            field_2 : aliased anon_29;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_27);
   pragma Unchecked_Union (anon_27);
   type i387_fxsave_struct_padding1_array is array (0 .. 11) of aliased asm_generic_int_ll64_h.u32;
   type i387_fxsave_struct_sw_reserved_array is array (0 .. 11) of aliased asm_generic_int_ll64_h.u32;
   type anon_30 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            padding1 : aliased i387_fxsave_struct_padding1_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:342
         when others =>
            sw_reserved : aliased i387_fxsave_struct_sw_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:343
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_30);
   pragma Unchecked_Union (anon_30);
   type i387_fxsave_struct is record
      cwd : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:314
      swd : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:315
      twd : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:316
      fop : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:317
      field_5 : aliased anon_27;
      mxcsr : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:330
      mxcsr_mask : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:331
      st_space : aliased i387_fxsave_struct_st_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:334
      xmm_space : aliased i387_fxsave_struct_xmm_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:337
      padding : aliased i387_fxsave_struct_padding_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:339
      field_11 : aliased anon_30;
   end record;
   pragma Convention (C_Pass_By_Copy, i387_fxsave_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:313

  -- Status Word			 
  -- Tag Word			 
  -- Last Instruction Opcode		 
  -- Instruction Pointer		 
  -- Data Pointer			 
  -- FPU IP Offset			 
  -- FPU IP Selector			 
  -- FPU Operand Offset		 
  -- FPU Operand Selector		 
  -- MXCSR Register State  
  -- MXCSR Mask		 
  -- 8*16 bytes for each FP-reg = 128 bytes:			 
  -- 16*16 bytes for each XMM-reg = 256 bytes:			 
   type i387_soft_struct_st_space_array is array (0 .. 19) of aliased asm_generic_int_ll64_h.u32;
   type i387_soft_struct is record
      cwd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:349
      swd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:350
      twd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:351
      fip : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:352
      fcs : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:353
      foo : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:354
      fos : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:355
      st_space : aliased i387_soft_struct_st_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:357
      ftop : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:358
      changed : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:359
      lookahead : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:360
      no_update : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:361
      rm : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:362
      alimit : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:363
      info : access asm_math_emu_h.math_emu_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:364
      entry_eip : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:365
   end record;
   pragma Convention (C_Pass_By_Copy, i387_soft_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:348

  -- 8*10 bytes for each FP-reg = 80 bytes:  
  -- 16 * 16 bytes for each YMMH-reg = 256 bytes  
   type ymmh_struct_ymmh_space_array is array (0 .. 63) of aliased asm_generic_int_ll64_h.u32;
   type ymmh_struct is record
      ymmh_space : aliased ymmh_struct_ymmh_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:370
   end record;
   pragma Convention (C_Pass_By_Copy, ymmh_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:368

  -- We don't support LWP yet:  
   type lwp_struct_reserved_array is array (0 .. 127) of aliased asm_generic_int_ll64_h.u8;
   type lwp_struct is record
      reserved : aliased lwp_struct_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:375
   end record;
   pragma Convention (C_Pass_By_Copy, lwp_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:374

   type bndregs_struct_bndregs_array is array (0 .. 7) of aliased asm_generic_int_ll64_h.u64;
   type bndregs_struct is record
      bndregs : aliased bndregs_struct_bndregs_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:379
   end record;
   pragma Convention (C_Pass_By_Copy, bndregs_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:378

   type bndcsr_struct is record
      cfg_reg_u : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:383
      status_reg : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:384
   end record;
   pragma Convention (C_Pass_By_Copy, bndcsr_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:382

   type xsave_hdr_struct_reserved1_array is array (0 .. 1) of aliased asm_generic_int_ll64_h.u64;
   type xsave_hdr_struct_reserved2_array is array (0 .. 4) of aliased asm_generic_int_ll64_h.u64;
   type xsave_hdr_struct is record
      xstate_bv : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:388
      reserved1 : aliased xsave_hdr_struct_reserved1_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:389
      reserved2 : aliased xsave_hdr_struct_reserved2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:390
   end record;
   pragma Convention (C_Pass_By_Copy, xsave_hdr_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:387

   type xsave_struct is record
      i387 : aliased i387_fxsave_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:394
      xsave_hdr : aliased xsave_hdr_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:395
      ymmh : aliased ymmh_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:396
      lwp : aliased lwp_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:397
      bndregs : aliased bndregs_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:398
      bndcsr : aliased bndcsr_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:399
   end record;
   pragma Convention (C_Pass_By_Copy, xsave_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:393

  -- new processor state extensions will go here  
   type thread_xstate (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            fsave : aliased i387_fsave_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:404
         when 1 =>
            fxsave : aliased i387_fxsave_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:405
         when 2 =>
            soft : aliased i387_soft_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:406
         when others =>
            xsave : aliased xsave_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:407
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, thread_xstate);
   pragma Unchecked_Union (thread_xstate);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:403

   type fpu is record
      last_cpu : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:411
      has_fpu : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:412
      state : access thread_xstate;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:413
   end record;
   pragma Convention (C_Pass_By_Copy, fpu);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:410

   orig_ist : aliased orig_ist;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:417
   pragma Import (C, orig_ist, "orig_ist");

   subtype irq_stack_union_irq_stack_array is Interfaces.C.char_array (0 .. 16383);
   type irq_stack_union;
   subtype irq_stack_union_gs_base_array is Interfaces.C.char_array (0 .. 39);
   type anon_31 is record
      gs_base : aliased irq_stack_union_gs_base_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:427
      stack_canary : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:428
   end record;
   pragma Convention (C_Pass_By_Copy, anon_31);
   type irq_stack_union (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            irq_stack : aliased irq_stack_union_irq_stack_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:420
            field_2 : aliased anon_31;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, irq_stack_union);
   pragma Unchecked_Union (irq_stack_union);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:419

  --	 * GCC hardcodes the stack canary as %gs:40.  Since the
  --	 * irq_stack is the object at %gs:0, we reserve the bottom
  --	 * 48 bytes of the irq stack for the canary.
  --	  

   irq_stack_union : irq_stack_union;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:432
   pragma Import (C, irq_stack_union, "irq_stack_union");

   init_per_cpu_u_irq_stack_union : irq_stack_union;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:433
   pragma Import (C, init_per_cpu_u_irq_stack_union, "init_per_cpu__irq_stack_union");

   irq_stack_ptr : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:435
   pragma Import (C, irq_stack_ptr, "irq_stack_ptr");

   irq_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:436
   pragma Import (C, irq_count, "irq_count");

  -- * Make sure stack canary segment base is cached-aligned:
  -- *   "For Intel Atom processors, avoid non zero segment base address
  -- *    that is not aligned to cache line boundary at all cost."
  -- * (Optim Ref Manual Assembly/Compiler Coding Rule 15.)
  --  

  -- canary at %gs:20  
  -- * per-CPU IRQ handling stacks
  --  

   xstate_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:463
   pragma Import (C, xstate_size, "xstate_size");

   procedure free_thread_xstate (arg1 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:464
   pragma Import (CPP, free_thread_xstate, "_Z18free_thread_xstateP11task_struct");

   task_xstate_cachep : access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:465
   pragma Import (C, task_xstate_cachep, "task_xstate_cachep");

   --  skipped empty struct perf_event

  -- Cached TLS descriptors:  
   type thread_struct_tls_array_array is array (0 .. 2) of aliased asm_desc_defs_h.desc_struct;
   type thread_struct_ptrace_bps_array is array (0 .. 3) of System.Address;
   type thread_struct is record
      tls_array : aliased thread_struct_tls_array_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:471
      sp0 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:472
      sp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:473
      usersp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:477
      es : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:478
      ds : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:479
      fsindex : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:480
      gsindex : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:481
      fs : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:487
      gs : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:489
      ptrace_bps : aliased thread_struct_ptrace_bps_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:491
      debugreg6 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:493
      ptrace_dr7 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:495
      cr2 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:497
      trap_nr : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:498
      error_code : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:499
      the_fpu : aliased fpu;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:501
      io_bitmap_ptr : access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:513
      iopl : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:514
      io_bitmap_max : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:516
      fpu_counter : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:525
   end record;
   pragma Convention (C_Pass_By_Copy, thread_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:469

  -- Copy from PDA  
  -- Save middle states of ptrace breakpoints  
  -- Debug status used for traps, single steps, etc...  
  -- Keep track of the exact dr7 value set by the user  
  -- Fault info:  
  -- floating point and extended processor state  
  -- Virtual 86 mode info  
  -- IO permissions:  
  -- Max allowed port in the bitmap, in bytes:  
  --	 * fpu_counter contains the number of consecutive context switches
  --	 * that the FPU is used. If this is over a threshold, the lazy fpu
  --	 * saving becomes unlazy to save the trap. This is an unsigned char
  --	 * so that after 256 times the counter wraps and the behavior turns
  --	 * lazy again; this to deal with bursty apps that only use FPU for
  --	 * a short time
  --	  

  -- * Set IOPL bits in EFLAGS from given mask
  --  

   procedure native_set_iopl_mask (mask : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:531
   pragma Import (CPP, native_set_iopl_mask, "_ZL20native_set_iopl_maskj");

   procedure native_load_sp0 (tss : access tss_struct; thread : access thread_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:548
   pragma Import (CPP, native_load_sp0, "_ZL15native_load_sp0P10tss_structP13thread_struct");

  -- Only happens when SEP is enabled, no need to test "SEP"arately:  
   procedure native_swapgs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:560
   pragma Import (CPP, native_swapgs, "_ZL13native_swapgsv");

  -- * Save the cr4 feature set we're using (ie
  -- * Pentium 4MB enable and PPro Global page
  -- * enable), so that any CPU's that boot up
  -- * after us can get the correct flags.
  --  

   mmu_cr4_features : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:588
   pragma Import (C, mmu_cr4_features, "mmu_cr4_features");

   trampoline_cr4_features : access asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:589
   pragma Import (C, trampoline_cr4_features, "trampoline_cr4_features");

   procedure set_in_cr4 (mask : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:591
   pragma Import (CPP, set_in_cr4, "_ZL10set_in_cr4m");

   procedure clear_in_cr4 (mask : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:603
   pragma Import (CPP, clear_in_cr4, "_ZL12clear_in_cr4m");

   type mm_segment_t is record
      seg : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:616
   end record;
   pragma Convention (C_Pass_By_Copy, mm_segment_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:617

   --  skipped anonymous struct anon_32

  -- Free all resources held by a thread.  
   procedure release_thread (arg1 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:621
   pragma Import (CPP, release_thread, "_Z14release_threadP11task_struct");

   function get_wchan (p : access linux_sched_h.task_struct) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:623
   pragma Import (CPP, get_wchan, "_Z9get_wchanP11task_struct");

  -- * Generic CPUID function
  -- * clear %ecx since some cpus (Cyrix MII) do not set or clear %ecx
  -- * resulting in stale register contents being returned.
  --  

   procedure cpuid
     (op : unsigned;
      eax : access unsigned;
      ebx : access unsigned;
      ecx : access unsigned;
      edx : access unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:630
   pragma Import (CPP, cpuid, "_ZL5cpuidjPjS_S_S_");

  -- Some CPUID calls want 'count' to be placed in ecx  
   procedure cpuid_count
     (op : unsigned;
      count : int;
      eax : access unsigned;
      ebx : access unsigned;
      ecx : access unsigned;
      edx : access unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:640
   pragma Import (CPP, cpuid_count, "_ZL11cpuid_countjiPjS_S_S_");

  -- * CPUID functions returning a single datum
  --  

   function cpuid_eax (op : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:652
   pragma Import (CPP, cpuid_eax, "_ZL9cpuid_eaxj");

   function cpuid_ebx (op : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:661
   pragma Import (CPP, cpuid_ebx, "_ZL9cpuid_ebxj");

   function cpuid_ecx (op : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:670
   pragma Import (CPP, cpuid_ecx, "_ZL9cpuid_ecxj");

   function cpuid_edx (op : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:679
   pragma Import (CPP, cpuid_edx, "_ZL9cpuid_edxj");

  -- REP NOP (PAUSE) is a good thing to insert into busy-wait loops.  
   procedure rep_nop;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:689
   pragma Import (CPP, rep_nop, "_ZL7rep_nopv");

   procedure cpu_relax;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:694
   pragma Import (CPP, cpu_relax, "_ZL9cpu_relaxv");

  -- Stop speculative execution and prefetching of modified code.  
   procedure sync_core;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:700
   pragma Import (CPP, sync_core, "_ZL9sync_corev");

  --	 * Do a CPUID if available, otherwise do a jump.  The jump
  --	 * can conveniently enough be the jump around CPUID.
  --	  

  --	 * CPUID is a barrier to speculative execution.
  --	 * Prefetched instructions are automatically
  --	 * invalidated when modified.
  --	  

   procedure select_idle_routine (c : access constant cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:729
   pragma Import (CPP, select_idle_routine, "_Z19select_idle_routinePK11cpuinfo_x86");

   procedure init_amd_e400_c1e_mask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:730
   pragma Import (CPP, init_amd_e400_c1e_mask, "_Z22init_amd_e400_c1e_maskv");

   boot_option_idle_override : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:732
   pragma Import (C, boot_option_idle_override, "boot_option_idle_override");

   amd_e400_c1e_detected : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:733
   pragma Import (C, amd_e400_c1e_detected, "amd_e400_c1e_detected");

   type idle_boot_override is 
     (IDLE_NO_OVERRIDE,
      IDLE_HALT,
      IDLE_NOMWAIT,
      IDLE_POLL);
   pragma Convention (C, idle_boot_override);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:735

   procedure enable_sep_cpu;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:738
   pragma Import (CPP, enable_sep_cpu, "_Z14enable_sep_cpuv");

   function sysenter_setup return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:739
   pragma Import (CPP, sysenter_setup, "_Z14sysenter_setupv");

   procedure early_trap_init;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:741
   pragma Import (CPP, early_trap_init, "_Z15early_trap_initv");

   procedure early_trap_pf_init;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:742
   pragma Import (CPP, early_trap_pf_init, "_Z18early_trap_pf_initv");

  -- Defined in head.S  
   early_gdt_descr : aliased asm_desc_defs_h.desc_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:745
   pragma Import (C, early_gdt_descr, "early_gdt_descr");

   procedure cpu_set_gdt (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:747
   pragma Import (CPP, cpu_set_gdt, "_Z11cpu_set_gdti");

   procedure switch_to_new_gdt (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:748
   pragma Import (CPP, switch_to_new_gdt, "_Z17switch_to_new_gdti");

   procedure load_percpu_segment (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:749
   pragma Import (CPP, load_percpu_segment, "_Z19load_percpu_segmenti");

   function get_debugctlmsr return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:752
   pragma Import (CPP, get_debugctlmsr, "_ZL15get_debugctlmsrv");

   procedure update_debugctlmsr (debugctlmsr : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:765
   pragma Import (CPP, update_debugctlmsr, "_ZL18update_debugctlmsrm");

   procedure set_task_blockstep (c_task : access linux_sched_h.task_struct; on : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:774
   pragma Import (CPP, set_task_blockstep, "_Z18set_task_blockstepP11task_structb");

  -- * from system description table in BIOS. Mostly for MCA use, but
  -- * others may find it useful:
  --  

   machine_id : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:780
   pragma Import (C, machine_id, "machine_id");

   machine_submodel_id : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:781
   pragma Import (C, machine_submodel_id, "machine_submodel_id");

   BIOS_revision : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:782
   pragma Import (C, BIOS_revision, "BIOS_revision");

  -- Boot loader type from the setup header:  
   bootloader_type : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:785
   pragma Import (C, bootloader_type, "bootloader_type");

   bootloader_version : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:786
   pragma Import (C, bootloader_version, "bootloader_version");

   ignore_fpu_irq : aliased char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:788
   pragma Import (C, ignore_fpu_irq, "ignore_fpu_irq");

  -- * Prefetch instructions for Pentium III (+) and AMD Athlon (+)
  -- *
  -- * It's not worth to care about 3dnow prefetches for the K6
  -- * because they are microcoded there and very slow.
  --  

   procedure prefetch (x : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:807
   pragma Import (CPP, prefetch, "_ZL8prefetchPKv");

  -- * 3dnow prefetch to get an exclusive cache line.
  -- * Useful for spinlocks to avoid one state transition in the
  -- * cache coherency protocol:
  --  

   procedure prefetchw (x : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:820
   pragma Import (CPP, prefetchw, "_ZL9prefetchwPKv");

   procedure spin_lock_prefetch (x : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:828
   pragma Import (CPP, spin_lock_prefetch, "_ZL18spin_lock_prefetchPKv");

  -- * User space process size: 3GB (default).
  --  

  -- * Note that the .io_bitmap member must be extra-big. This is because
  -- * the CPU will access an additional byte beyond the end of the IO
  -- * permission bitmap. The extra byte must be all 1 bits, and must
  -- * be within the limit.
  --  

  -- * The below -8 is to reserve 8 bytes on top of the ring0 stack.
  -- * This is necessary to guarantee that the entire "struct pt_regs"
  -- * is accessible even if the CPU haven't stored the SS/ESP registers
  -- * on the stack (interrupt gate does not save these registers
  -- * when switching to the same priv ring).
  -- * Therefore beware: accessing the ss/esp fields of the
  -- * "struct pt_regs" is possible, but they may contain the
  -- * completely wrong values.
  --  

  -- * User space process size. 47bits minus one guard page.
  --  

  -- This decides where the kernel will search for a free chunk of vm
  -- * space during mmap's.
  --  

  -- * Return saved PC of a blocked thread.
  -- * What is this good for? it will be always the scheduler or ret_from_fork.
  --  

   function KSTK_ESP (c_task : access linux_sched_h.task_struct) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:928
   pragma Import (CPP, KSTK_ESP, "_Z8KSTK_ESPP11task_struct");

  -- * User space RSP while inside the SYSCALL fast path
  --  

   old_rsp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:933
   pragma Import (C, old_rsp, "old_rsp");

   procedure start_thread
     (regs : access asm_ptrace_h.pt_regs;
      new_ip : unsigned_long;
      new_sp : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:937
   pragma Import (CPP, start_thread, "_Z12start_threadP7pt_regsmm");

  -- * This decides where the kernel will search for a free chunk of vm
  -- * space during mmap's.
  --  

  -- Get/set a process' ability to use the timestamp counter instruction  
   function get_tsc_mode (adr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:952
   pragma Import (CPP, get_tsc_mode, "_Z12get_tsc_modem");

   function set_tsc_mode (val : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:953
   pragma Import (CPP, set_tsc_mode, "_Z12set_tsc_modej");

   function amd_get_nb_id (cpu : int) return asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:955
   pragma Import (CPP, amd_get_nb_id, "_Z13amd_get_nb_idi");

   function hypervisor_cpuid_base (sig : Interfaces.C.Strings.chars_ptr; leaves : linux_types_h.uint32_t) return linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:957
   pragma Import (CPP, hypervisor_cpuid_base, "_ZL21hypervisor_cpuid_basePKcj");

   function arch_align_stack (sp : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:972
   pragma Import (CPP, arch_align_stack, "_Z16arch_align_stackm");

   procedure free_init_pages
     (what : Interfaces.C.Strings.chars_ptr;
      c_begin : unsigned_long;
      c_end : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:973
   pragma Import (CPP, free_init_pages, "_Z15free_init_pagesPcmm");

   procedure default_idle;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:975
   pragma Import (CPP, default_idle, "_Z12default_idlev");

   function xen_set_default_idle return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:977
   pragma Import (CPP, xen_set_default_idle, "_Z20xen_set_default_idlev");

   procedure stop_this_cpu (dummy : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:982
   pragma Import (CPP, stop_this_cpu, "_Z13stop_this_cpuPv");

   procedure df_debug (regs : access asm_ptrace_h.pt_regs; error_code : long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/processor.h:983
   pragma Import (CPP, df_debug, "_Z8df_debugP7pt_regsl");

end asm_processor_h;

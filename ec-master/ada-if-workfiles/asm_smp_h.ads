pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with linux_cpumask_h;
with asm_generic_int_ll64_h;
limited with linux_sched_h;

package asm_smp_h is

   --  arg-macro: procedure cpu_physical_id per_cpu(x86_cpu_to_apicid, cpu)
   --    per_cpu(x86_cpu_to_apicid, cpu)
   --  arg-macro: function raw_smp_processor_id (this_cpu_read(cpu_number)
   --    return this_cpu_read(cpu_number);
   --  arg-macro: function stack_smp_processor_id ({ struct thread_info *ti; __asm__("andq %%rsp,%0; ":"=r" (ti) : "0" (CURRENT_MASK)); ti.cpu; }
   --    return { struct thread_info *ti; __asm__("andq %%rsp,%0; ":"=r" (ti) : "0" (CURRENT_MASK)); ti.cpu; };
   --  arg-macro: procedure safe_smp_processor_id smp_processor_id()
   --    smp_processor_id()
   --  arg-macro: procedure nmi_selftest do { } while (0)
   --    do { } while (0)
  -- * We need the APIC definitions automatically as part of 'smp.h'
  --  

   smp_num_siblings : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:21
   pragma Import (C, smp_num_siblings, "smp_num_siblings");

   num_processors : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:22
   pragma Import (C, num_processors, "num_processors");

   function cpu_has_ht_siblings return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:24
   pragma Import (CPP, cpu_has_ht_siblings, "_ZL19cpu_has_ht_siblingsv");

   cpu_sibling_map : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:33
   pragma Import (C, cpu_sibling_map, "cpu_sibling_map");

   cpu_core_map : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:34
   pragma Import (C, cpu_core_map, "cpu_core_map");

  -- cpus sharing the last level cache:  
   cpu_llc_shared_map : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:36
   pragma Import (C, cpu_llc_shared_map, "cpu_llc_shared_map");

   cpu_llc_id : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:37
   pragma Import (C, cpu_llc_id, "cpu_llc_id");

   cpu_number : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:38
   pragma Import (C, cpu_number, "cpu_number");

   function cpu_sibling_mask (cpu : int) return access linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:40
   pragma Import (CPP, cpu_sibling_mask, "_ZL16cpu_sibling_maski");

   function cpu_core_mask (cpu : int) return access linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:45
   pragma Import (CPP, cpu_core_mask, "_ZL13cpu_core_maski");

   function cpu_llc_shared_mask (cpu : int) return access linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:50
   pragma Import (CPP, cpu_llc_shared_mask, "_ZL19cpu_llc_shared_maski");

   x86_cpu_to_apicid_early_map : aliased array (size_t) of aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:55
   pragma Import (C, x86_cpu_to_apicid_early_map, "x86_cpu_to_apicid_early_map");

   x86_cpu_to_apicid_early_ptr : access asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:55
   pragma Import (C, x86_cpu_to_apicid_early_ptr, "x86_cpu_to_apicid_early_ptr");

   x86_cpu_to_apicid : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:55
   pragma Import (C, x86_cpu_to_apicid, "x86_cpu_to_apicid");

   x86_bios_cpu_apicid_early_map : aliased array (size_t) of aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:56
   pragma Import (C, x86_bios_cpu_apicid_early_map, "x86_bios_cpu_apicid_early_map");

   x86_bios_cpu_apicid_early_ptr : access asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:56
   pragma Import (C, x86_bios_cpu_apicid_early_ptr, "x86_bios_cpu_apicid_early_ptr");

   x86_bios_cpu_apicid : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:56
   pragma Import (C, x86_bios_cpu_apicid, "x86_bios_cpu_apicid");

  -- Static state in head.S used to set up a CPU  
  -- Initial stack pointer address  
   stack_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:62
   pragma Import (C, stack_start, "stack_start");

   type smp_ops is record
      smp_prepare_boot_cpu : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:67
      smp_prepare_cpus : access procedure (arg1 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:68
      smp_cpus_done : access procedure (arg1 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:69
      stop_other_cpus : access procedure (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:71
      smp_send_reschedule : access procedure (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:72
      cpu_up : access function (arg1 : unsigned; arg2 : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:74
      cpu_disable : access function return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:75
      cpu_die : access procedure (arg1 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:76
      play_dead : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:77
      send_call_func_ipi : access procedure (arg1 : access constant linux_cpumask_h.cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:79
      send_call_func_single_ipi : access procedure (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:80
   end record;
   pragma Convention (C_Pass_By_Copy, smp_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:66

  -- Globals due to paravirt  
   procedure set_cpu_sibling_map (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:84
   pragma Import (CPP, set_cpu_sibling_map, "_Z19set_cpu_sibling_mapi");

   smp_ops : aliased smp_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:90
   pragma Import (C, smp_ops, "smp_ops");

   procedure smp_send_stop;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:92
   pragma Import (CPP, smp_send_stop, "_ZL13smp_send_stopv");

   procedure stop_other_cpus;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:97
   pragma Import (CPP, stop_other_cpus, "_ZL15stop_other_cpusv");

   procedure smp_prepare_boot_cpu;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:102
   pragma Import (CPP, smp_prepare_boot_cpu, "_ZL20smp_prepare_boot_cpuv");

   procedure smp_prepare_cpus (max_cpus : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:107
   pragma Import (CPP, smp_prepare_cpus, "_ZL16smp_prepare_cpusj");

   procedure smp_cpus_done (max_cpus : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:112
   pragma Import (CPP, smp_cpus_done, "_ZL13smp_cpus_donej");

   --  skipped func __cpu_up

   --  skipped func __cpu_disable

   --  skipped func __cpu_die

   procedure play_dead;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:132
   pragma Import (CPP, play_dead, "_ZL9play_deadv");

   procedure smp_send_reschedule (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:137
   pragma Import (CPP, smp_send_reschedule, "_ZL19smp_send_reschedulei");

   procedure arch_send_call_function_single_ipi (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:142
   pragma Import (CPP, arch_send_call_function_single_ipi, "_ZL34arch_send_call_function_single_ipii");

   procedure arch_send_call_function_ipi_mask (mask : access constant linux_cpumask_h.cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:147
   pragma Import (CPP, arch_send_call_function_ipi_mask, "_ZL32arch_send_call_function_ipi_maskPK7cpumask");

   procedure cpu_disable_common;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:152
   pragma Import (CPP, cpu_disable_common, "_Z18cpu_disable_commonv");

   procedure native_smp_prepare_boot_cpu;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:153
   pragma Import (CPP, native_smp_prepare_boot_cpu, "_Z27native_smp_prepare_boot_cpuv");

   procedure native_smp_prepare_cpus (max_cpus : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:154
   pragma Import (CPP, native_smp_prepare_cpus, "_Z23native_smp_prepare_cpusj");

   procedure native_smp_cpus_done (max_cpus : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:155
   pragma Import (CPP, native_smp_cpus_done, "_Z20native_smp_cpus_donej");

   function native_cpu_up (cpunum : unsigned; tidle : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:156
   pragma Import (CPP, native_cpu_up, "_Z13native_cpu_upjP11task_struct");

   function native_cpu_disable return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:157
   pragma Import (CPP, native_cpu_disable, "_Z18native_cpu_disablev");

   procedure native_cpu_die (cpu : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:158
   pragma Import (CPP, native_cpu_die, "_Z14native_cpu_diej");

   procedure native_play_dead;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:159
   pragma Import (CPP, native_play_dead, "_Z16native_play_deadv");

   procedure play_dead_common;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:160
   pragma Import (CPP, play_dead_common, "_Z16play_dead_commonv");

   procedure wbinvd_on_cpu (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:161
   pragma Import (CPP, wbinvd_on_cpu, "_Z13wbinvd_on_cpui");

   function wbinvd_on_all_cpus return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:162
   pragma Import (CPP, wbinvd_on_all_cpus, "_Z18wbinvd_on_all_cpusv");

   procedure native_send_call_func_ipi (mask : access constant linux_cpumask_h.cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:164
   pragma Import (CPP, native_send_call_func_ipi, "_Z25native_send_call_func_ipiPK7cpumask");

   procedure native_send_call_func_single_ipi (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:165
   pragma Import (CPP, native_send_call_func_single_ipi, "_Z32native_send_call_func_single_ipii");

   procedure x86_idle_thread_init (cpu : unsigned; idle : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:166
   pragma Import (CPP, x86_idle_thread_init, "_Z20x86_idle_thread_initjP11task_struct");

   procedure smp_store_boot_cpu_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:168
   pragma Import (CPP, smp_store_boot_cpu_info, "_Z23smp_store_boot_cpu_infov");

   procedure smp_store_cpu_info (id : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:169
   pragma Import (CPP, smp_store_cpu_info, "_Z18smp_store_cpu_infoi");

   disabled_cpus : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:181
   pragma Import (C, disabled_cpus, "disabled_cpus");

  -- * This function is needed by all SMP systems. It must _always_ be valid
  -- * from the initial startup. We map APIC_BASE very early in page_setup(),
  -- * so this is correct in the x86 case.
  --  

  -- we don't want to mark this access volatile - bad code generation  
   function hard_smp_processor_id return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smp.h:216
   pragma Import (CPP, hard_smp_processor_id, "_Z21hard_smp_processor_idv");

end asm_smp_h;

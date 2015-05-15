pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_llist_h;
with asm_generic_int_ll64_h;
limited with linux_cpumask_h;
with Interfaces.C.Extensions;
with linux_types_h;

package linux_smp_h is

   --  unsupported macro: generic_smp_call_function_interrupt generic_smp_call_function_single_interrupt
   --  arg-macro: procedure smp_processor_id raw_smp_processor_id()
   --    raw_smp_processor_id()
   --  arg-macro: function get_cpu ({ preempt_disable(); smp_processor_id(); }
   --    return { preempt_disable(); smp_processor_id(); };
   --  arg-macro: procedure put_cpu preempt_enable()
   --    preempt_enable()
  -- *	Generic SMP support
  -- *		Alan Cox. <alan@redhat.com>
  --  

   type smp_call_func_t is access procedure (arg1 : System.Address);
   pragma Convention (C, smp_call_func_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:16

   type call_single_data is record
      llist : aliased linux_llist_h.llist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:18
      func : smp_call_func_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:19
      info : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:20
      flags : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:21
   end record;
   pragma Convention (C_Pass_By_Copy, call_single_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:17

  -- total number of cpus in this system (may exceed NR_CPUS)  
   total_cpus : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:25
   pragma Import (C, total_cpus, "total_cpus");

   function smp_call_function_single
     (cpuid : int;
      func : smp_call_func_t;
      info : System.Address;
      wait : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:27
   pragma Import (CPP, smp_call_function_single, "_Z24smp_call_function_singleiPFvPvES_i");

  -- * Call a function on all processors
  --  

   function on_each_cpu
     (func : smp_call_func_t;
      info : System.Address;
      wait : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:33
   pragma Import (CPP, on_each_cpu, "_Z11on_each_cpuPFvPvES_i");

  -- * Call a function on processors specified by mask, which might include
  -- * the local one.
  --  

   procedure on_each_cpu_mask
     (mask : access constant linux_cpumask_h.cpumask;
      func : smp_call_func_t;
      info : System.Address;
      wait : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:39
   pragma Import (CPP, on_each_cpu_mask, "_Z16on_each_cpu_maskPK7cpumaskPFvPvES2_b");

  -- * Call a function on each processor for which the supplied function
  -- * cond_func returns a positive value. This may include the local
  -- * processor.
  --  

   procedure on_each_cpu_cond
     (cond_func : access function (arg1 : int; arg2 : System.Address) return Extensions.bool;
      func : smp_call_func_t;
      info : System.Address;
      wait : Extensions.bool;
      gfp_flags : linux_types_h.gfp_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:47
   pragma Import (CPP, on_each_cpu_cond, "_Z16on_each_cpu_condPFbiPvEPFvS_ES_bj");

   function smp_call_function_single_async (cpu : int; csd : access call_single_data) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:51
   pragma Import (CPP, smp_call_function_single_async, "_Z30smp_call_function_single_asynciP16call_single_data");

  -- * main cross-CPU interfaces, handles INIT, TLB flush, STOP, etc.
  -- * (defined in asm header):
  --  

  -- * stops all CPUs but the current one:
  --  

  -- * sends a 'reschedule' event to another CPU:
  --  

  -- * Prepare machine for booting other CPUs.
  --  

  -- * Bring a CPU up
  --  

  -- * Final polishing of CPUs
  --  

  -- * Call a function on all other processors
  --  

   function smp_call_function
     (func : smp_call_func_t;
      info : System.Address;
      wait : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:95
   pragma Import (CPP, smp_call_function, "_Z17smp_call_functionPFvPvES_i");

   procedure smp_call_function_many
     (mask : access constant linux_cpumask_h.cpumask;
      func : smp_call_func_t;
      info : System.Address;
      wait : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:96
   pragma Import (CPP, smp_call_function_many, "_Z22smp_call_function_manyPK7cpumaskPFvPvES2_b");

   function smp_call_function_any
     (mask : access constant linux_cpumask_h.cpumask;
      func : smp_call_func_t;
      info : System.Address;
      wait : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:99
   pragma Import (CPP, smp_call_function_any, "_Z21smp_call_function_anyPK7cpumaskPFvPvES2_i");

   procedure kick_all_cpus_sync;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:102
   pragma Import (CPP, kick_all_cpus_sync, "_Z18kick_all_cpus_syncv");

  -- * Generic and arch helpers
  --  

   procedure call_function_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:107
   pragma Import (CPP, call_function_init, "_Z18call_function_initv");

   procedure generic_smp_call_function_single_interrupt;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:108
   pragma Import (CPP, generic_smp_call_function_single_interrupt, "_Z42generic_smp_call_function_single_interruptv");

  -- * Mark the boot cpu "online" so that it can call console drivers in
  -- * printk() and can access its per-cpu storage.
  --  

   setup_max_cpus : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:118
   pragma Import (C, setup_max_cpus, "setup_max_cpus");

   procedure setup_nr_cpu_ids;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:119
   pragma Import (CPP, setup_nr_cpu_ids, "_Z16setup_nr_cpu_idsv");

   procedure smp_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:120
   pragma Import (CPP, smp_init, "_Z8smp_initv");

  -- *	These macros fold the SMP functionality into a single CPU system
  --  

  -- * smp_processor_id(): get the current CPU ID.
  -- *
  -- * if DEBUG_PREEMPT is enabled then we check whether it is
  -- * used in a preemption-safe way. (smp_processor_id() is safe
  -- * if it's used in a preemption-off critical section, or in
  -- * a thread that is bound to the current CPU.)
  -- *
  -- * NOTE: raw_smp_processor_id() is for internal use only
  -- * (smp_processor_id() is the preferred variant), but in rare
  -- * instances it might also be used to turn off false positives
  -- * (i.e. smp_processor_id() use that the debugging code reports but
  -- * which use for some reason is legal). Don't use this to hack around
  -- * the warning message, as your code might not work under PREEMPT.
  --  

  -- * Callback to arch code if there's nosmp or maxcpus=0 on the
  -- * boot command line:
  --  

   procedure arch_disable_smp_support;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:183
   pragma Import (CPP, arch_disable_smp_support, "_Z24arch_disable_smp_supportv");

   procedure arch_enable_nonboot_cpus_begin;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:185
   pragma Import (CPP, arch_enable_nonboot_cpus_begin, "_Z30arch_enable_nonboot_cpus_beginv");

   procedure arch_enable_nonboot_cpus_end;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:186
   pragma Import (CPP, arch_enable_nonboot_cpus_end, "_Z28arch_enable_nonboot_cpus_endv");

   procedure smp_setup_processor_id;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/smp.h:188
   pragma Import (CPP, smp_setup_processor_id, "_Z22smp_setup_processor_idv");

end linux_smp_h;

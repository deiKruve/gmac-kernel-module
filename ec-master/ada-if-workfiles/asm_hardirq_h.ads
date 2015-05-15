pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package asm_hardirq_h is

   --  unsupported macro: MAX_HARDIRQS_PER_CPU NR_VECTORS
   --  arg-macro: procedure inc_irq_stat this_cpu_inc(irq_stat.member)
   --    this_cpu_inc(irq_stat.member)
   --  arg-macro: procedure local_softirq_pending this_cpu_read(irq_stat.__softirq_pending)
   --    this_cpu_read(irq_stat.__softirq_pending)
   --  arg-macro: procedure set_softirq_pending this_cpu_write(irq_stat.__softirq_pending, (x))
   --    this_cpu_write(irq_stat.__softirq_pending, (x))
   --  arg-macro: procedure or_softirq_pending this_cpu_or(irq_stat.__softirq_pending, (x))
   --    this_cpu_or(irq_stat.__softirq_pending, (x))
   --  unsupported macro: arch_irq_stat_cpu arch_irq_stat_cpu
   --  unsupported macro: arch_irq_stat arch_irq_stat
   type irq_cpustat_t is record
      uu_softirq_pending : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:8
      uu_nmi_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:9
      apic_timer_irqs : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:11
      irq_spurious_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:12
      icr_read_retry_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:13
      kvm_posted_intr_ipis : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:16
      x86_platform_ipis : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:18
      apic_perf_irqs : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:19
      apic_irq_work_irqs : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:20
      irq_resched_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:22
      irq_call_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:23
      irq_tlb_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:28
      irq_thermal_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:31
      irq_threshold_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:34
      irq_hv_callback_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, irq_cpustat_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:39

   --  skipped anonymous struct anon_340

  -- arch dependent  
  -- arch dependent  
  -- arch dependent  
  --	 * irq_tlb_count is double-counted in irq_call_count, so it must be
  --	 * subtracted from irq_call_count when displaying irq_call_count
  --	  

   irq_stat : aliased irq_cpustat_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:41
   pragma Import (C, irq_stat, "irq_stat");

  -- We can have at most NR_VECTORS irqs routed to a cpu at a time  
   procedure ack_bad_irq (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:58
   pragma Import (CPP, ack_bad_irq, "_Z11ack_bad_irqj");

   function arch_irq_stat_cpu (cpu : unsigned) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:60
   pragma Import (CPP, arch_irq_stat_cpu, "_Z17arch_irq_stat_cpuj");

   function arch_irq_stat return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hardirq.h:63
   pragma Import (CPP, arch_irq_stat, "_Z13arch_irq_statv");

end asm_hardirq_h;

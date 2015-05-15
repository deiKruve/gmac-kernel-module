pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with asm_generic_int_ll64_h;
with linux_cpumask_h;
with Interfaces.C.Extensions;
with linux_types_h;
limited with asm_ptrace_h;

package asm_hw_irq_h is

   --  unsupported macro: trace_irq_move_cleanup_interrupt irq_move_cleanup_interrupt
   --  unsupported macro: trace_reboot_interrupt reboot_interrupt
   --  unsupported macro: trace_kvm_posted_intr_ipi kvm_posted_intr_ipi
   --  arg-macro: function IO_APIC_IRQ (((x) >= NR_IRQS_LEGACY)  or else  ((1<<(x)) and io_apic_irqs)
   --    return ((x) >= NR_IRQS_LEGACY)  or else  ((1<<(x)) and io_apic_irqs);
   --  unsupported macro: trace_interrupt interrupt
   --  unsupported macro: VECTOR_UNDEFINED (-1)
   --  unsupported macro: VECTOR_RETRIGGERED (-2)
  -- * (C) 1992, 1993 Linus Torvalds, (C) 1997 Ingo Molnar
  -- *
  -- * moved some of the old arch/i386/kernel/irq.h to here. VY
  -- *
  -- * IRQ/IPI changes taken from work by Thomas Radke
  -- * <tomsoft@informatik.tu-chemnitz.de>
  -- *
  -- * hacked by Andi Kleen for x86-64.
  -- * unified by tglx
  --  

  -- Interrupt handlers registered during init_IRQ  
  -- Interrupt handlers registered during init_IRQ  
   procedure trace_apic_timer_interrupt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:82
   pragma Import (CPP, trace_apic_timer_interrupt, "_Z26trace_apic_timer_interruptv");

   procedure trace_x86_platform_ipi;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:83
   pragma Import (CPP, trace_x86_platform_ipi, "_Z22trace_x86_platform_ipiv");

   procedure trace_error_interrupt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:84
   pragma Import (CPP, trace_error_interrupt, "_Z21trace_error_interruptv");

   procedure trace_irq_work_interrupt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:85
   pragma Import (CPP, trace_irq_work_interrupt, "_Z24trace_irq_work_interruptv");

   procedure trace_spurious_interrupt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:86
   pragma Import (CPP, trace_spurious_interrupt, "_Z24trace_spurious_interruptv");

   procedure trace_thermal_interrupt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:87
   pragma Import (CPP, trace_thermal_interrupt, "_Z23trace_thermal_interruptv");

   procedure trace_reschedule_interrupt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:88
   pragma Import (CPP, trace_reschedule_interrupt, "_Z26trace_reschedule_interruptv");

   procedure trace_threshold_interrupt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:89
   pragma Import (CPP, trace_threshold_interrupt, "_Z25trace_threshold_interruptv");

   procedure trace_call_function_interrupt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:90
   pragma Import (CPP, trace_call_function_interrupt, "_Z29trace_call_function_interruptv");

   procedure trace_call_function_single_interrupt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:91
   pragma Import (CPP, trace_call_function_single_interrupt, "_Z36trace_call_function_single_interruptv");

  -- IOAPIC  
   io_apic_irqs : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:99
   pragma Import (C, io_apic_irqs, "io_apic_irqs");

   procedure setup_IO_APIC;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:101
   pragma Import (CPP, setup_IO_APIC, "_Z13setup_IO_APICv");

   procedure disable_IO_APIC;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:102
   pragma Import (CPP, disable_IO_APIC, "_Z15disable_IO_APICv");

   type io_apic_irq_attr is record
      ioapic : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:105
      ioapic_pin : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:106
      trigger : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:107
      polarity : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:108
   end record;
   pragma Convention (C_Pass_By_Copy, io_apic_irq_attr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:104

   procedure set_io_apic_irq_attr
     (irq_attr : access io_apic_irq_attr;
      ioapic : int;
      ioapic_pin : int;
      trigger : int;
      polarity : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:111
   pragma Import (CPP, set_io_apic_irq_attr, "_ZL20set_io_apic_irq_attrP16io_apic_irq_attriiii");

  -- Intel specific interrupt remapping information  
   type irq_2_iommu is record
      iommu : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:123
      irte_index : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:124
      sub_handle : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:125
      irte_mask : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:126
   end record;
   pragma Convention (C_Pass_By_Copy, irq_2_iommu);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:122

   --  skipped empty struct intel_iommu

  -- AMD specific interrupt remapping information  
  -- Device ID for IRTE table  
   type irq_2_irte is record
      devid : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:131
      index : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:132
   end record;
   pragma Convention (C_Pass_By_Copy, irq_2_irte);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:130

  -- Index into IRTE table 
  -- * This is performance-critical, we want to do it O(1)
  -- *
  -- * Most irqs are mapped 1:1 with pins.
  --  

   --  skipped empty struct irq_pin_list

   type anon_339 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            the_irq_2_iommu : aliased irq_2_iommu;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:149
         when others =>
            the_irq_2_irte : aliased irq_2_irte;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:150
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_339);
   pragma Unchecked_Union (anon_339);
   type irq_cfg is record
      irq_2_pin : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:141
      domain : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:142
      old_domain : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:143
      vector : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:144
      move_in_progress : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:145
      remapped : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:147
      field_7 : aliased anon_339;
   end record;
   pragma Convention (C_Pass_By_Copy, irq_cfg);
   pragma Pack (irq_cfg);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:140

   function assign_irq_vector
     (arg1 : int;
      arg2 : access irq_cfg;
      arg3 : access constant linux_cpumask_h.cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:155
   pragma Import (CPP, assign_irq_vector, "_Z17assign_irq_vectoriP7irq_cfgPK7cpumask");

   procedure send_cleanup_vector (arg1 : access irq_cfg);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:156
   pragma Import (CPP, send_cleanup_vector, "_Z19send_cleanup_vectorP7irq_cfg");

   --  skipped func __ioapic_set_affinity

   function IO_APIC_get_PCI_irq_vector
     (bus : int;
      devfn : int;
      pin : int;
      irq_attr : access io_apic_irq_attr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:161
   pragma Import (CPP, IO_APIC_get_PCI_irq_vector, "_Z26IO_APIC_get_PCI_irq_vectoriiiP16io_apic_irq_attr");

   procedure setup_ioapic_dest;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:162
   pragma Import (CPP, setup_ioapic_dest, "_Z17setup_ioapic_destv");

   procedure enable_IO_APIC;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:164
   pragma Import (CPP, enable_IO_APIC, "_Z14enable_IO_APICv");

  -- Statistics  
   irq_err_count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:167
   pragma Import (C, irq_err_count, "irq_err_count");

   irq_mis_count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:168
   pragma Import (C, irq_mis_count, "irq_mis_count");

  -- EISA  
   procedure eisa_set_level_irq (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:171
   pragma Import (CPP, eisa_set_level_irq, "_Z18eisa_set_level_irqj");

  -- SMP  
   procedure smp_apic_timer_interrupt (arg1 : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:174
   pragma Import (CPP, smp_apic_timer_interrupt, "_Z24smp_apic_timer_interruptP7pt_regs");

   procedure smp_spurious_interrupt (arg1 : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:175
   pragma Import (CPP, smp_spurious_interrupt, "_Z22smp_spurious_interruptP7pt_regs");

   procedure smp_x86_platform_ipi (arg1 : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:176
   pragma Import (CPP, smp_x86_platform_ipi, "_Z20smp_x86_platform_ipiP7pt_regs");

   procedure smp_error_interrupt (arg1 : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:177
   pragma Import (CPP, smp_error_interrupt, "_Z19smp_error_interruptP7pt_regs");

   procedure smp_reschedule_interrupt (arg1 : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:182
   pragma Import (CPP, smp_reschedule_interrupt, "_Z24smp_reschedule_interruptP7pt_regs");

   procedure smp_call_function_interrupt (arg1 : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:183
   pragma Import (CPP, smp_call_function_interrupt, "_Z27smp_call_function_interruptP7pt_regs");

   procedure smp_call_function_single_interrupt (arg1 : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:184
   pragma Import (CPP, smp_call_function_single_interrupt, "_Z34smp_call_function_single_interruptP7pt_regs");

   procedure smp_invalidate_interrupt (arg1 : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:185
   pragma Import (CPP, smp_invalidate_interrupt, "_Z24smp_invalidate_interruptP7pt_regs");

   interrupt : aliased array (0 .. 223) of access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:188
   pragma Import (C, interrupt, "interrupt");

   type vector_irq_t is array (0 .. 255) of aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:196

   vector_irq : aliased vector_irq_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:197
   pragma Import (C, vector_irq, "vector_irq");

   procedure setup_vector_irq (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:198
   pragma Import (CPP, setup_vector_irq, "_Z16setup_vector_irqi");

   procedure lock_vector_lock;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:201
   pragma Import (CPP, lock_vector_lock, "_Z16lock_vector_lockv");

   procedure unlock_vector_lock;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/hw_irq.h:202
   pragma Import (CPP, unlock_vector_lock, "_Z18unlock_vector_lockv");

   --  skipped func __setup_vector_irq

end asm_hw_irq_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_ptrace_h;
with Interfaces.C.Extensions;

package asm_irq_h is

   --  arg-macro: procedure irq_ctx_init do { } while (0)
   --    do { } while (0)
   --  unsupported macro: arch_trigger_all_cpu_backtrace arch_trigger_all_cpu_backtrace
  -- *	(C) 1992, 1993 Linus Torvalds, (C) 1997 Ingo Molnar
  -- *
  -- *	IRQ/IPI changes taken from work by Thomas Radke
  -- *	<tomsoft@informatik.tu-chemnitz.de>
  --  

   function irq_canonicalize (irq : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:13
   pragma Import (CPP, irq_canonicalize, "_ZL16irq_canonicalizei");

   function check_irq_vectors_for_cpu_disable return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:28
   pragma Import (CPP, check_irq_vectors_for_cpu_disable, "_Z33check_irq_vectors_for_cpu_disablev");

   procedure fixup_irqs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:29
   pragma Import (CPP, fixup_irqs, "_Z10fixup_irqsv");

   procedure irq_force_complete_move (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:30
   pragma Import (CPP, irq_force_complete_move, "_Z23irq_force_complete_movei");

   x86_platform_ipi_callback : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:33
   pragma Import (C, x86_platform_ipi_callback, "x86_platform_ipi_callback");

   procedure native_init_IRQ;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:34
   pragma Import (CPP, native_init_IRQ, "_Z15native_init_IRQv");

   function handle_irq (irq : unsigned; regs : access asm_ptrace_h.pt_regs) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:35
   pragma Import (CPP, handle_irq, "_Z10handle_irqjP7pt_regs");

   function do_IRQ (regs : access asm_ptrace_h.pt_regs) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:37
   pragma Import (CPP, do_IRQ, "_Z6do_IRQP7pt_regs");

  -- Interrupt vector management  
   used_vectors : aliased array (0 .. 3) of aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:40
   pragma Import (C, used_vectors, "used_vectors");

   function vector_used_by_percpu_irq (vector : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:41
   pragma Import (CPP, vector_used_by_percpu_irq, "_Z25vector_used_by_percpu_irqj");

   procedure init_ISA_irqs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:43
   pragma Import (CPP, init_ISA_irqs, "_Z13init_ISA_irqsv");

   procedure arch_trigger_all_cpu_backtrace (arg1 : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq.h:46
   pragma Import (CPP, arch_trigger_all_cpu_backtrace, "_Z30arch_trigger_all_cpu_backtraceb");

end asm_irq_h;

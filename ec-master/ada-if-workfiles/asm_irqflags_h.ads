pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_irqflags_h is

  -- * Interrupt control:
  --  

   function native_save_fl return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irqflags.h:11
   pragma Import (CPP, native_save_fl, "_ZL14native_save_flv");

  --	 * "=rm" is safe here, because "pop" adjusts the stack before
  --	 * it evaluates its effective address -- this is part of the
  --	 * documented behavior of the "pop" instruction.
  --	  

  -- no input  
   procedure native_restore_fl (flags : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irqflags.h:29
   pragma Import (CPP, native_restore_fl, "_ZL17native_restore_flm");

  -- no output  
   procedure native_irq_disable;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irqflags.h:37
   pragma Import (CPP, native_irq_disable, "_ZL18native_irq_disablev");

   procedure native_irq_enable;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irqflags.h:42
   pragma Import (CPP, native_irq_enable, "_ZL17native_irq_enablev");

   procedure native_safe_halt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irqflags.h:47
   pragma Import (CPP, native_safe_halt, "_ZL16native_safe_haltv");

   procedure native_halt;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irqflags.h:52
   pragma Import (CPP, native_halt, "_ZL11native_haltv");

  -- * Used in the idle loop; sti takes one instruction cycle
  -- * to complete:
  --  

  -- * Used when interrupts are already enabled or to
  -- * shutdown the processor:
  --  

  -- * For spinlocks, etc:
  --  

  -- * Currently paravirt can't handle swapgs nicely when we
  -- * don't have a stack we can rely on (such as a user space
  -- * stack).  So we either find a way around these or just fault
  -- * and emulate if a guest tries to call swapgs directly.
  -- *
  -- * Either way, this is a good way to document that we don't
  -- * have a reliable stack. x86_64 only.
  --  

   function arch_irqs_disabled_flags (flags : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irqflags.h:155
   pragma Import (CPP, arch_irqs_disabled_flags, "_ZL24arch_irqs_disabled_flagsm");

   function arch_irqs_disabled return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irqflags.h:160
   pragma Import (CPP, arch_irqs_disabled, "_ZL18arch_irqs_disabledv");

end asm_irqflags_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_ptrace_h;

package asm_irq_regs_h is

  -- * Per-cpu current frame pointer - the location of the last exception frame on
  -- * the stack, stored in the per-cpu area.
  -- *
  -- * Jeremy Fitzhardinge <jeremy@goop.org>
  --  

   irq_regs : access asm_ptrace_h.pt_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq_regs.h:14
   pragma Import (C, irq_regs, "irq_regs");

   function get_irq_regs return access asm_ptrace_h.pt_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq_regs.h:16
   pragma Import (CPP, get_irq_regs, "_ZL12get_irq_regsv");

   function set_irq_regs (new_regs : access asm_ptrace_h.pt_regs) return access asm_ptrace_h.pt_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq_regs.h:21
   pragma Import (CPP, set_irq_regs, "_ZL12set_irq_regsP7pt_regs");

end asm_irq_regs_h;

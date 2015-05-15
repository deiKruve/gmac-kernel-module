pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with Interfaces.C.Extensions;

package asm_acpi_h is

   --  unsupported macro: acpi_wakeup_address ((unsigned long)(real_mode_header->wakeup_start))
   --  unsupported macro: ARCH_HAS_POWER_INIT 1
   --  arg-macro: procedure acpi_unlazy_tlb leave_mm(x)
   --    leave_mm(x)
  -- *  Copyright (C) 2001 Paul Diefenbaugh <paul.s.diefenbaugh@intel.com>
  -- *  Copyright (C) 2001 Patrick Mochel <mochel@osdl.org>
  -- *
  -- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  -- *
  -- *  This program is free software; you can redistribute it and/or modify
  -- *  it under the terms of the GNU General Public License as published by
  -- *  the Free Software Foundation; either version 2 of the License, or
  -- *  (at your option) any later version.
  -- *
  -- *  This program is distributed in the hope that it will be useful,
  -- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- *  GNU General Public License for more details.
  -- *
  -- *  You should have received a copy of the GNU General Public License
  -- *  along with this program; if not, write to the Free Software
  -- *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  -- *
  -- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  --  

   acpi_lapic : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:36
   pragma Import (C, acpi_lapic, "acpi_lapic");

   acpi_ioapic : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:37
   pragma Import (C, acpi_ioapic, "acpi_ioapic");

   acpi_noirq : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:38
   pragma Import (C, acpi_noirq, "acpi_noirq");

   acpi_strict : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:39
   pragma Import (C, acpi_strict, "acpi_strict");

   acpi_disabled : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:40
   pragma Import (C, acpi_disabled, "acpi_disabled");

   acpi_pci_disabled : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:41
   pragma Import (C, acpi_pci_disabled, "acpi_pci_disabled");

   acpi_skip_timer_override : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:42
   pragma Import (C, acpi_skip_timer_override, "acpi_skip_timer_override");

   acpi_use_timer_override : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:43
   pragma Import (C, acpi_use_timer_override, "acpi_use_timer_override");

   acpi_fix_pin2_polarity : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:44
   pragma Import (C, acpi_fix_pin2_polarity, "acpi_fix_pin2_polarity");

   acpi_disable_cmcff : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:45
   pragma Import (C, acpi_disable_cmcff, "acpi_disable_cmcff");

   acpi_sci_flags : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:47
   pragma Import (C, acpi_sci_flags, "acpi_sci_flags");

   acpi_sci_override_gsi : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:48
   pragma Import (C, acpi_sci_override_gsi, "acpi_sci_override_gsi");

   procedure acpi_pic_sci_set_trigger (arg1 : unsigned; arg2 : asm_generic_int_ll64_h.u16);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:49
   pragma Import (CPP, acpi_pic_sci_set_trigger, "_Z24acpi_pic_sci_set_triggerjt");

   procedure disable_acpi;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:54
   pragma Import (CPP, disable_acpi, "_ZL12disable_acpiv");

   function acpi_gsi_to_irq (gsi : asm_generic_int_ll64_h.u32; irq : access unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:61
   pragma Import (CPP, acpi_gsi_to_irq, "_Z15acpi_gsi_to_irqjPj");

   procedure acpi_noirq_set;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:63
   pragma Import (CPP, acpi_noirq_set, "_ZL14acpi_noirq_setv");

   procedure acpi_disable_pci;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:64
   pragma Import (CPP, acpi_disable_pci, "_ZL16acpi_disable_pciv");

  -- Low-level suspend routine.  
   acpi_suspend_lowlevel : access function return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:71
   pragma Import (C, acpi_suspend_lowlevel, "acpi_suspend_lowlevel");

  -- Physical address to resume after wakeup  
  -- * Check if the CPU can handle C2 and deeper
  --  

   function acpi_processor_cstate_check (max_cstate : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:79
   pragma Import (CPP, acpi_processor_cstate_check, "_ZL27acpi_processor_cstate_checkj");

  --	 * Early models (<=5) of AMD Opterons are not supposed to go into
  --	 * C2 state.
  --	 *
  --	 * Steppings 0x0A and later are good
  --	  

   function arch_has_acpi_pdc return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:98
   pragma Import (CPP, arch_has_acpi_pdc, "_ZL17arch_has_acpi_pdcv");

   procedure arch_acpi_set_pdc_bits (buf : access asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:105
   pragma Import (CPP, arch_acpi_set_pdc_bits, "_ZL22arch_acpi_set_pdc_bitsPj");

  --	 * If mwait/monitor is unsupported, C2/C3_FFH will be disabled
  --	  

   acpi_numa : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:138
   pragma Import (C, acpi_numa, "acpi_numa");

   function x86_acpi_numa_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/acpi.h:139
   pragma Import (CPP, x86_acpi_numa_init, "_Z18x86_acpi_numa_initv");

end asm_acpi_h;

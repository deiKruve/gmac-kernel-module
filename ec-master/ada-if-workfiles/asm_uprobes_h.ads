pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with System;

package asm_uprobes_h is

   --  unsupported macro: MAX_UINSN_BYTES 16
   --  unsupported macro: UPROBE_XOL_SLOT_BYTES 128
   --  unsupported macro: UPROBE_SWBP_INSN 0xcc
   --  unsupported macro: UPROBE_SWBP_INSN_SIZE 1
  -- * User-space Probes (UProbes) for x86
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License as published by
  -- * the Free Software Foundation; either version 2 of the License, or
  -- * (at your option) any later version.
  -- *
  -- * This program is distributed in the hope that it will be useful,
  -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- * GNU General Public License for more details.
  -- *
  -- * You should have received a copy of the GNU General Public License
  -- * along with this program; if not, write to the Free Software
  -- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
  -- *
  -- * Copyright (C) IBM Corporation, 2008-2011
  -- * Authors:
  -- *	Srikar Dronamraju
  -- *	Jim Keniston
  --  

   subtype uprobe_opcode_t is asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:28

   --  skipped empty struct uprobe_xol_ops

   type arch_uprobe_insn_array is array (0 .. 15) of aliased asm_generic_int_ll64_h.u8;
   type arch_uprobe_ixol_array is array (0 .. 15) of aliased asm_generic_int_ll64_h.u8;
   type anon_146 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            insn : aliased arch_uprobe_insn_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:40
         when others =>
            ixol : aliased arch_uprobe_ixol_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:41
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_146);
   pragma Unchecked_Union (anon_146);
   type anon_147;
   type anon_148 is record
      offs : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:48
      ilen : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:49
      opc1 : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:50
   end record;
   pragma Convention (C_Pass_By_Copy, anon_148);
   type anon_149 is record
      fixups : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:53
      ilen : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:54
   end record;
   pragma Convention (C_Pass_By_Copy, anon_149);
   type anon_147 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            branch : aliased anon_148;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:51
         when others =>
            defparam : aliased anon_149;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:55
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_147);
   pragma Unchecked_Union (anon_147);
   type arch_uprobe is record
      parent : aliased anon_146;
      ops : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:44
      field_3 : aliased anon_147;
   end record;
   pragma Convention (C_Pass_By_Copy, arch_uprobe);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:38

   type arch_uprobe_task is record
      saved_scratch_register : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:61
      saved_trap_nr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:63
      saved_tf : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:64
   end record;
   pragma Convention (C_Pass_By_Copy, arch_uprobe_task);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uprobes.h:59

end asm_uprobes_h;

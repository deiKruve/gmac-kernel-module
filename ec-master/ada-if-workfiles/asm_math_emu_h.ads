pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_ptrace_h;
limited with asm_vm86_h;

package asm_math_emu_h is

  -- This structure matches the layout of the data saved to the stack
  --   following a device-not-present interrupt, part of it saved
  --   automatically by the 80386/80486.
  --    

   type anon_21 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            regs : access asm_ptrace_h.pt_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/math_emu.h:14
         when others =>
            vm86 : access asm_vm86_h.kernel_vm86_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/math_emu.h:15
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_21);
   pragma Unchecked_Union (anon_21);
   type math_emu_info is record
      uuu_orig_eip : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/math_emu.h:12
      field_2 : aliased anon_21;
   end record;
   pragma Convention (C_Pass_By_Copy, math_emu_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/math_emu.h:11

end asm_math_emu_h;

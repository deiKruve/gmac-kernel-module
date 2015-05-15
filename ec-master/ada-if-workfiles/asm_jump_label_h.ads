pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_jump_label_h;
with Interfaces.C.Extensions;
with asm_generic_int_ll64_h;

package asm_jump_label_h is

   --  unsupported macro: JUMP_LABEL_NOP_SIZE 5
   --  unsupported macro: STATIC_KEY_INIT_NOP P6_NOP5_ATOMIC
   function arch_static_branch (key : access linux_jump_label_h.static_key) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/jump_label.h:19
   pragma Import (CPP, arch_static_branch, "_ZL18arch_static_branchP10static_key");

   subtype jump_label_t is asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/jump_label.h:36

   type jump_entry is record
      code : aliased jump_label_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/jump_label.h:42
      target : aliased jump_label_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/jump_label.h:43
      key : aliased jump_label_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/jump_label.h:44
   end record;
   pragma Convention (C_Pass_By_Copy, jump_entry);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/jump_label.h:41

end asm_jump_label_h;

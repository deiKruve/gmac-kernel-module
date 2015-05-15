pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package asm_cmpxchg_64_h is

   --  arg-macro: function cmpxchg64 ({ BUILD_BUG_ON(sizeof(*(ptr)) /= 8); cmpxchg((ptr), (o), (n)); }
   --    return { BUILD_BUG_ON(sizeof(*(ptr)) /= 8); cmpxchg((ptr), (o), (n)); };
   --  arg-macro: function cmpxchg64_local ({ BUILD_BUG_ON(sizeof(*(ptr)) /= 8); cmpxchg_local((ptr), (o), (n)); }
   --    return { BUILD_BUG_ON(sizeof(*(ptr)) /= 8); cmpxchg_local((ptr), (o), (n)); };
   --  arg-macro: procedure system_has_cmpxchg_double cpu_has_cx16
   --    cpu_has_cx16
   procedure set_64bit (ptr : access asm_generic_int_ll64_h.u64; val : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/cmpxchg_64.h:4
   pragma Import (CPP, set_64bit, "_ZL9set_64bitPVyy");

end asm_cmpxchg_64_h;

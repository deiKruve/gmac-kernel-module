pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package asm_spinlock_types_h is

   --  unsupported macro: TICKET_SLOWPATH_FLAG ((__ticket_t)0)
   --  unsupported macro: TICKET_LOCK_INC ((__ticket_t)__TICKET_LOCK_INC)
   --  unsupported macro: TICKET_SHIFT (sizeof(__ticket_t) * 8)
   subtype uu_ticket_t is asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock_types.h:18

   subtype uu_ticketpair_t is asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock_types.h:19

   type anon_17;
   type uu_raw_tickets is record
      head : aliased uu_ticket_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock_types.h:30
      tail : aliased uu_ticket_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock_types.h:30
   end record;
   pragma Convention (C_Pass_By_Copy, uu_raw_tickets);
   type anon_17 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            head_tail : aliased uu_ticketpair_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock_types.h:28
         when others =>
            tickets : aliased uu_raw_tickets;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock_types.h:31
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_17);
   pragma Unchecked_Union (anon_17);
   type arch_spinlock is record
      parent : aliased anon_17;
   end record;
   pragma Convention (C_Pass_By_Copy, arch_spinlock);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock_types.h:26

   subtype arch_spinlock_t is arch_spinlock;

end asm_spinlock_types_h;

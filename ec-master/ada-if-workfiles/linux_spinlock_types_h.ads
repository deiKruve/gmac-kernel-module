pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_spinlock_types_h;

package linux_spinlock_types_h is

   --  unsupported macro: SPINLOCK_MAGIC 0xdead4ead
   --  unsupported macro: SPINLOCK_OWNER_INIT ((void *)-1L)
   --  arg-macro: procedure DEFINE_RAW_SPINLOCK raw_spinlock_t x := __RAW_SPIN_LOCK_UNLOCKED(x)
   --    raw_spinlock_t x := __RAW_SPIN_LOCK_UNLOCKED(x)
   --  arg-macro: procedure DEFINE_SPINLOCK spinlock_t x := __SPIN_LOCK_UNLOCKED(x)
   --    spinlock_t x := __SPIN_LOCK_UNLOCKED(x)
  -- * include/linux/spinlock_types.h - generic spinlock type definitions
  -- *                                  and initializers
  -- *
  -- * portions Copyright 2005, Red Hat, Inc., Ingo Molnar
  -- * Released under the General Public License (GPL).
  --  

   type raw_spinlock is record
      raw_lock : aliased asm_spinlock_types_h.arch_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock_types.h:21
   end record;
   pragma Convention (C_Pass_By_Copy, raw_spinlock);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock_types.h:20

   subtype raw_spinlock_t is raw_spinlock;

   type anon_19 (discr : unsigned := 0) is record
      case discr is
         when others =>
            rlock : aliased raw_spinlock;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock_types.h:66
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_19);
   pragma Unchecked_Union (anon_19);
   type spinlock is record
      parent : aliased anon_19;
   end record;
   pragma Convention (C_Pass_By_Copy, spinlock);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock_types.h:64

   subtype spinlock_t is spinlock;

end linux_spinlock_types_h;

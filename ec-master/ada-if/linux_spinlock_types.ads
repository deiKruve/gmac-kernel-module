pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_spinlock_types;

package linux_spinlock_types is

   type raw_spinlock is record
      raw_lock : aliased asm_spinlock_types.arch_spinlock_t;
   end record;
   pragma Convention (C_Pass_By_Copy, raw_spinlock);

   subtype raw_spinlock_t is raw_spinlock;
   
   type anon_35 (discr : unsigned := 0) is record
      case discr is
         when others =>
            rlock : aliased raw_spinlock;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_35);
   pragma Unchecked_Union (anon_35);
   
   type spinlock is record
      parent : aliased anon_35;
   end record;
   pragma Convention (C_Pass_By_Copy, spinlock);

   subtype spinlock_t is spinlock;
   
end linux_spinlock_types;

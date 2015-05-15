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

end linux_spinlock_types;

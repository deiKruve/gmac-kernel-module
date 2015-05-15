pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with asm_spinlock_types_h;

package asm_generic_qrwlock_types_h is

  -- * The queue read/write lock data structure
  --  

   type qrwlock is record
      cnts : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock_types.h:12
      lock : aliased asm_spinlock_types_h.arch_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock_types.h:13
   end record;
   pragma Convention (C_Pass_By_Copy, qrwlock);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock_types.h:11

   subtype arch_rwlock_t is qrwlock;

end asm_generic_qrwlock_types_h;

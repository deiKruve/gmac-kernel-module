pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_qrwlock_types_h;

package linux_rwlock_types_h is

   --  unsupported macro: RWLOCK_MAGIC 0xdeaf1eed
   --  arg-macro: procedure DEFINE_RWLOCK rwlock_t x := __RW_LOCK_UNLOCKED(x)
   --    rwlock_t x := __RW_LOCK_UNLOCKED(x)
  -- * include/linux/rwlock_types.h - generic rwlock type definitions
  -- *				  and initializers
  -- *
  -- * portions Copyright 2005, Red Hat, Inc., Ingo Molnar
  -- * Released under the General Public License (GPL).
  --  

   type rwlock_t is record
      raw_lock : aliased asm_generic_qrwlock_types_h.arch_rwlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwlock_types.h:12
   end record;
   pragma Convention (C_Pass_By_Copy, rwlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rwlock_types.h:23

   --  skipped anonymous struct anon_20

end linux_rwlock_types_h;

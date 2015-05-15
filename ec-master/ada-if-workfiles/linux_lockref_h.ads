pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_spinlock_types_h;
with uapi_asm_generic_int_ll64_h;

package linux_lockref_h is

   --  unsupported macro: USE_CMPXCHG_LOCKREF (IS_ENABLED(CONFIG_ARCH_USE_CMPXCHG_LOCKREF) && IS_ENABLED(CONFIG_SMP) && SPINLOCK_SIZE <= 4)
  -- * Locked reference counts.
  -- *
  -- * These are different from just plain atomic refcounts in that they
  -- * are atomic with respect to the spinlock that goes with them.  In
  -- * particular, there can be implementations that don't actually get
  -- * the spinlock for the common decrement/increment operations, but they
  -- * still have to check that the operation is done semantically as if
  -- * the spinlock had been taken (using a cmpxchg operation that covers
  -- * both the lock and the count word, or using memory transactions, for
  -- * example).
  --  

   type anon_180;
   type anon_181 is record
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockref.h:30
      count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockref.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, anon_181);
   type anon_180 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            lock_count : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockref.h:27
            field_2 : aliased anon_181;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_180);
   pragma Unchecked_Union (anon_180);
   type lockref is record
      parent : aliased anon_180;
   end record;
   pragma Convention (C_Pass_By_Copy, lockref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockref.h:24

   procedure lockref_get (arg1 : access lockref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockref.h:36
   pragma Import (CPP, lockref_get, "_Z11lockref_getP7lockref");

   function lockref_get_not_zero (arg1 : access lockref) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockref.h:37
   pragma Import (CPP, lockref_get_not_zero, "_Z20lockref_get_not_zeroP7lockref");

   function lockref_get_or_lock (arg1 : access lockref) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockref.h:38
   pragma Import (CPP, lockref_get_or_lock, "_Z19lockref_get_or_lockP7lockref");

   function lockref_put_or_lock (arg1 : access lockref) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockref.h:39
   pragma Import (CPP, lockref_put_or_lock, "_Z19lockref_put_or_lockP7lockref");

   procedure lockref_mark_dead (arg1 : access lockref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockref.h:41
   pragma Import (CPP, lockref_mark_dead, "_Z17lockref_mark_deadP7lockref");

   function lockref_get_not_dead (arg1 : access lockref) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockref.h:42
   pragma Import (CPP, lockref_get_not_dead, "_Z20lockref_get_not_deadP7lockref");

  -- Must be called under spinlock for reliable results  
   --  skipped func __lockref_is_dead

end linux_lockref_h;

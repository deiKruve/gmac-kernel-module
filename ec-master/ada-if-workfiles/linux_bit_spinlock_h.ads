pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_bit_spinlock_h is

  -- *  bit-based spin_lock()
  -- *
  -- * Don't use this unless you really need to: spin_lock() and spin_unlock()
  -- * are significantly faster.
  --  

   procedure bit_spin_lock (bitnum : int; addr : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bit_spinlock.h:15
   pragma Import (CPP, bit_spin_lock, "_ZL13bit_spin_lockiPm");

  --	 * Assuming the lock is uncontended, this never enters
  --	 * the body of the outer loop. If it is contended, then
  --	 * within the inner loop a non-atomic test is used to
  --	 * busywait with less bus contention for a good time to
  --	 * attempt to acquire the lock bit.
  --	  

  -- * Return true if it was acquired
  --  

   function bit_spin_trylock (bitnum : int; addr : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bit_spinlock.h:40
   pragma Import (CPP, bit_spin_trylock, "_ZL16bit_spin_trylockiPm");

  -- *  bit-based spin_unlock()
  --  

   procedure bit_spin_unlock (bitnum : int; addr : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bit_spinlock.h:56
   pragma Import (CPP, bit_spin_unlock, "_ZL15bit_spin_unlockiPm");

  -- *  bit-based spin_unlock()
  -- *  non-atomic version, which can be used eg. if the bit lock itself is
  -- *  protecting the rest of the flags in the word.
  --  

   --  skipped func __bit_spin_unlock

  -- * Return true if the lock is held.
  --  

   function bit_spin_is_locked (bitnum : int; addr : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bit_spinlock.h:88
   pragma Import (CPP, bit_spin_is_locked, "_ZL18bit_spin_is_lockediPm");

end linux_bit_spinlock_h;

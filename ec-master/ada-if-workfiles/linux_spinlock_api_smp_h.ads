pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_spinlock_api_smp_h is

   --  arg-macro: procedure assert_raw_spin_locked BUG_ON(notraw_spin_is_locked(x))
   --    BUG_ON(notraw_spin_is_locked(x))
  -- * include/linux/spinlock_api_smp.h
  -- *
  -- * spinlock API declarations on SMP (and debug)
  -- * (implemented in kernel/spinlock.c)
  -- *
  -- * portions Copyright 2005, Red Hat, Inc., Ingo Molnar
  -- * Released under the General Public License (GPL).
  --  

   function in_lock_functions (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock_api_smp.h:18
   pragma Import (CPP, in_lock_functions, "_Z17in_lock_functionsm");

   --  skipped func _raw_spin_lock

   --  skipped func _raw_spin_lock_nested

   --  skipped func _raw_spin_lock_nest_lock

   --  skipped func _raw_spin_lock_bh

   --  skipped func _raw_spin_lock_irq

   --  skipped func _raw_spin_lock_irqsave

   --  skipped func _raw_spin_lock_irqsave_nested

   --  skipped func _raw_spin_trylock

   --  skipped func _raw_spin_trylock_bh

   --  skipped func _raw_spin_unlock

   --  skipped func _raw_spin_unlock_bh

   --  skipped func _raw_spin_unlock_irq

   --  skipped func _raw_spin_unlock_irqrestore

   --  skipped func __raw_spin_trylock

  -- * If lockdep is enabled then we use the non-preemption spin-ops
  -- * even on CONFIG_PREEMPT, because lockdep assumes that interrupts are
  -- * not re-enabled during lock-acquire (which the preempt-spin-ops do):
  --  

   --  skipped func __raw_spin_lock_irqsave

  --	 * On lockdep we dont want the hand-coded irq-enable of
  --	 * do_raw_spin_lock_flags() code, because lockdep assumes
  --	 * that interrupts are not re-enabled during lock-acquire:
  --	  

   --  skipped func __raw_spin_lock_irq

   --  skipped func __raw_spin_lock_bh

   --  skipped func __raw_spin_lock

   --  skipped func __raw_spin_unlock

   --  skipped func __raw_spin_unlock_irqrestore

   --  skipped func __raw_spin_unlock_irq

   --  skipped func __raw_spin_unlock_bh

   --  skipped func __raw_spin_trylock_bh

end linux_spinlock_api_smp_h;

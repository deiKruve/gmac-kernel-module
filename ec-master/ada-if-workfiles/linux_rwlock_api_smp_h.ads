pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_rwlock_api_smp_h is

  -- * include/linux/rwlock_api_smp.h
  -- *
  -- * spinlock API declarations on SMP (and debug)
  -- * (implemented in kernel/spinlock.c)
  -- *
  -- * portions Copyright 2005, Red Hat, Inc., Ingo Molnar
  -- * Released under the General Public License (GPL).
  --  

   --  skipped func _raw_read_lock

   --  skipped func _raw_write_lock

   --  skipped func _raw_read_lock_bh

   --  skipped func _raw_write_lock_bh

   --  skipped func _raw_read_lock_irq

   --  skipped func _raw_write_lock_irq

   --  skipped func _raw_read_lock_irqsave

   --  skipped func _raw_write_lock_irqsave

   --  skipped func _raw_read_trylock

   --  skipped func _raw_write_trylock

   --  skipped func _raw_read_unlock

   --  skipped func _raw_write_unlock

   --  skipped func _raw_read_unlock_bh

   --  skipped func _raw_write_unlock_bh

   --  skipped func _raw_read_unlock_irq

   --  skipped func _raw_write_unlock_irq

   --  skipped func _raw_read_unlock_irqrestore

   --  skipped func _raw_write_unlock_irqrestore

   --  skipped func __raw_read_trylock

   --  skipped func __raw_write_trylock

  -- * If lockdep is enabled then we use the non-preemption spin-ops
  -- * even on CONFIG_PREEMPT, because lockdep assumes that interrupts are
  -- * not re-enabled during lock-acquire (which the preempt-spin-ops do):
  --  

   --  skipped func __raw_read_lock

   --  skipped func __raw_read_lock_irqsave

   --  skipped func __raw_read_lock_irq

   --  skipped func __raw_read_lock_bh

   --  skipped func __raw_write_lock_irqsave

   --  skipped func __raw_write_lock_irq

   --  skipped func __raw_write_lock_bh

   --  skipped func __raw_write_lock

   --  skipped func __raw_write_unlock

   --  skipped func __raw_read_unlock

   --  skipped func __raw_read_unlock_irqrestore

   --  skipped func __raw_read_unlock_irq

   --  skipped func __raw_read_unlock_bh

   --  skipped func __raw_write_unlock_irqrestore

   --  skipped func __raw_write_unlock_irq

   --  skipped func __raw_write_unlock_bh

end linux_rwlock_api_smp_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_jump_label_h;
with asm_spinlock_types_h;

package asm_spinlock_h is

   --  unsupported macro: LOCK_PTR_REG "D"
   --  unsupported macro: SPIN_THRESHOLD (1 << 15)
   --  unsupported macro: arch_spin_is_contended arch_spin_is_contended
   --  arg-macro: procedure arch_read_lock_flags arch_read_lock(lock)
   --    arch_read_lock(lock)
   --  arg-macro: procedure arch_write_lock_flags arch_write_lock(lock)
   --    arch_write_lock(lock)
   --  arg-macro: procedure arch_spin_relax cpu_relax()
   --    cpu_relax()
   --  arg-macro: procedure arch_read_relax cpu_relax()
   --    cpu_relax()
   --  arg-macro: procedure arch_write_relax cpu_relax()
   --    cpu_relax()
  -- * Your basic SMP spinlocks, allowing only a single CPU anywhere
  -- *
  -- * Simple spin lock operations.  There are two variants, one clears IRQ's
  -- * on the local processor, one does not.
  -- *
  -- * These are fair FIFO ticket locks, which support up to 2^16 CPUs.
  -- *
  -- * (the type definitions are in asm/spinlock_types.h)
  --  

  -- * On PPro SMP, we use a locked operation to unlock
  -- * (PPro errata 66, 92)
  --  

  -- How long a lock should spin before we consider blocking  
   paravirt_ticketlocks_enabled : aliased linux_jump_label_h.static_key;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock.h:42
   pragma Import (C, paravirt_ticketlocks_enabled, "paravirt_ticketlocks_enabled");

   --  skipped func __ticket_lock_spinning

   --  skipped func __ticket_unlock_kick

   function arch_spin_value_unlocked (lock : asm_spinlock_types_h.arch_spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock.h:64
   pragma Import (CPP, arch_spin_value_unlocked, "_ZL24arch_spin_value_unlocked13arch_spinlock");

  -- * Ticket locks are conceptually two parts, one indicating the current head of
  -- * the queue, and the other indicating the current tail. The lock is acquired
  -- * by atomically noting the tail and incrementing it by one (thus adding
  -- * ourself to the queue and noting our position), then waiting until the head
  -- * becomes equal to the the initial value of the tail.
  -- *
  -- * We use an xadd covering *both* parts of the lock, to increment the tail and
  -- * also load the position of the head, which takes care of memory ordering
  -- * issues and should be optimal for the uncontended case. Note the tail must be
  -- * in the high part, because a wide xadd increment of the low part would carry
  -- * up and contaminate the high part.
  --  

   procedure arch_spin_lock (lock : access asm_spinlock_types_h.arch_spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock.h:82
   pragma Import (CPP, arch_spin_lock, "_ZL14arch_spin_lockP13arch_spinlock");

  -- make sure nothing creeps before the lock is taken  
   function arch_spin_trylock (lock : access asm_spinlock_types_h.arch_spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock.h:104
   pragma Import (CPP, arch_spin_trylock, "_ZL17arch_spin_trylockP13arch_spinlock");

  -- cmpxchg is a full barrier, so nothing can move before it  
   --  skipped func __ticket_unlock_slowpath

  -- Perform the unlock on the "before" copy  
  -- Clear the slowpath flag  
  --	 * If the lock is uncontended, clear the flag - use cmpxchg in
  --	 * case it changes behind our back though.
  --	  

  --		 * Lock still has someone queued for it, so wake up an
  --		 * appropriate waiter.
  --		  

   procedure arch_spin_unlock (lock : access asm_spinlock_types_h.arch_spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock.h:146
   pragma Import (CPP, arch_spin_unlock, "_ZL16arch_spin_unlockP13arch_spinlock");

  -- add_smp() is a full mb()  
   function arch_spin_is_locked (lock : access asm_spinlock_types_h.arch_spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock.h:163
   pragma Import (CPP, arch_spin_is_locked, "_ZL19arch_spin_is_lockedP13arch_spinlock");

   function arch_spin_is_contended (lock : access asm_spinlock_types_h.arch_spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock.h:170
   pragma Import (CPP, arch_spin_is_contended, "_ZL22arch_spin_is_contendedP13arch_spinlock");

   procedure arch_spin_lock_flags (lock : access asm_spinlock_types_h.arch_spinlock_t; flags : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock.h:178
   pragma Import (CPP, arch_spin_lock_flags, "_ZL20arch_spin_lock_flagsP13arch_spinlockm");

   procedure arch_spin_unlock_wait (lock : access asm_spinlock_types_h.arch_spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/spinlock.h:184
   pragma Import (CPP, arch_spin_unlock_wait, "_ZL21arch_spin_unlock_waitP13arch_spinlock");

  -- * Read-write spinlocks, allowing multiple readers
  -- * but only one writer.
  -- *
  -- * NOTE! it is quite common to have readers in interrupts
  -- * but no interrupt writers. For those circumstances we
  -- * can "mix" irq-safe locks - any writer needs to get a
  -- * irq-safe write-lock, but readers can get non-irqsafe
  -- * read-locks.
  -- *
  -- * On x86, we implement read-write locks as a 32-bit counter
  -- * with the high bit (sign) being the "contended" bit.
  --  

  --*
  -- * read_can_lock - would read_trylock() succeed?
  -- * @lock: the rwlock in question.
  --  

  --*
  -- * write_can_lock - would write_trylock() succeed?
  -- * @lock: the rwlock in question.
  --  

end asm_spinlock_h;

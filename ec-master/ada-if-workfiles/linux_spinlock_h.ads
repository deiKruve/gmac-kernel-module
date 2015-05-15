pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_spinlock_types_h;

package linux_spinlock_h is

   --  unsupported macro: LOCK_SECTION_NAME ".text..lock."KBUILD_BASENAME
   --  arg-macro: procedure LOCK_SECTION_START ".subsection 1\n\t" extra ".ifndef " LOCK_SECTION_NAME "\n\t" LOCK_SECTION_NAME ":\n\t" ".endif\n"
   --    ".subsection 1\n\t" extra ".ifndef " LOCK_SECTION_NAME "\n\t" LOCK_SECTION_NAME ":\n\t" ".endif\n"
   --  unsupported macro: LOCK_SECTION_END ".previous\n\t"
   --  arg-macro: procedure raw_spin_lock_init do { *(lock) := __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
   --    do { *(lock) := __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
   --  arg-macro: procedure raw_spin_is_locked arch_spin_is_locked(and(lock).raw_lock)
   --    arch_spin_is_locked(and(lock).raw_lock)
   --  arg-macro: procedure raw_spin_is_contended arch_spin_is_contended(and(lock).raw_lock)
   --    arch_spin_is_contended(and(lock).raw_lock)
   --  arg-macro: procedure smp_mb__before_spinlock smp_wmb()
   --    smp_wmb()
   --  arg-macro: procedure smp_mb__after_unlock_lock do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure raw_spin_unlock_wait arch_spin_unlock_wait(and(lock).raw_lock)
   --    arch_spin_unlock_wait(and(lock).raw_lock)
   --  arg-macro: procedure raw_spin_trylock __cond_lock(lock, _raw_spin_trylock(lock))
   --    __cond_lock(lock, _raw_spin_trylock(lock))
   --  arg-macro: procedure raw_spin_lock _raw_spin_lock(lock)
   --    _raw_spin_lock(lock)
   --  arg-macro: procedure raw_spin_lock_nested _raw_spin_lock(lock)
   --    _raw_spin_lock(lock)
   --  arg-macro: procedure raw_spin_lock_nest_lock _raw_spin_lock(lock)
   --    _raw_spin_lock(lock)
   --  arg-macro: procedure raw_spin_lock_irqsave do { typecheck(unsigned long, flags); flags := _raw_spin_lock_irqsave(lock); } while (0)
   --    do { typecheck(unsigned long, flags); flags := _raw_spin_lock_irqsave(lock); } while (0)
   --  arg-macro: procedure raw_spin_lock_irqsave_nested do { typecheck(unsigned long, flags); flags := _raw_spin_lock_irqsave(lock); } while (0)
   --    do { typecheck(unsigned long, flags); flags := _raw_spin_lock_irqsave(lock); } while (0)
   --  arg-macro: procedure raw_spin_lock_irq _raw_spin_lock_irq(lock)
   --    _raw_spin_lock_irq(lock)
   --  arg-macro: procedure raw_spin_lock_bh _raw_spin_lock_bh(lock)
   --    _raw_spin_lock_bh(lock)
   --  arg-macro: procedure raw_spin_unlock _raw_spin_unlock(lock)
   --    _raw_spin_unlock(lock)
   --  arg-macro: procedure raw_spin_unlock_irq _raw_spin_unlock_irq(lock)
   --    _raw_spin_unlock_irq(lock)
   --  arg-macro: procedure raw_spin_unlock_irqrestore do { typecheck(unsigned long, flags); _raw_spin_unlock_irqrestore(lock, flags); } while (0)
   --    do { typecheck(unsigned long, flags); _raw_spin_unlock_irqrestore(lock, flags); } while (0)
   --  arg-macro: procedure raw_spin_unlock_bh _raw_spin_unlock_bh(lock)
   --    _raw_spin_unlock_bh(lock)
   --  arg-macro: procedure raw_spin_trylock_bh __cond_lock(lock, _raw_spin_trylock_bh(lock))
   --    __cond_lock(lock, _raw_spin_trylock_bh(lock))
   --  arg-macro: function raw_spin_trylock_irq ({ local_irq_disable(); raw_spin_trylock(lock) ? 1 : ({ local_irq_enable(); 0; }); }
   --    return { local_irq_disable(); raw_spin_trylock(lock) ? 1 : ({ local_irq_enable(); 0; }); };
   --  arg-macro: function raw_spin_trylock_irqsave ({ local_irq_save(flags); raw_spin_trylock(lock) ? 1 : ({ local_irq_restore(flags); 0; }); }
   --    return { local_irq_save(flags); raw_spin_trylock(lock) ? 1 : ({ local_irq_restore(flags); 0; }); };
   --  arg-macro: function raw_spin_can_lock (notraw_spin_is_locked(lock)
   --    return notraw_spin_is_locked(lock);
   --  arg-macro: procedure spin_lock_init do { spinlock_check(_lock); raw_spin_lock_init(and(_lock).rlock); } while (0)
   --    do { spinlock_check(_lock); raw_spin_lock_init(and(_lock).rlock); } while (0)
   --  arg-macro: procedure spin_lock_nested do { raw_spin_lock_nested(spinlock_check(lock), subclass); } while (0)
   --    do { raw_spin_lock_nested(spinlock_check(lock), subclass); } while (0)
   --  arg-macro: procedure spin_lock_nest_lock do { raw_spin_lock_nest_lock(spinlock_check(lock), nest_lock); } while (0)
   --    do { raw_spin_lock_nest_lock(spinlock_check(lock), nest_lock); } while (0)
   --  arg-macro: procedure spin_lock_irqsave do { raw_spin_lock_irqsave(spinlock_check(lock), flags); } while (0)
   --    do { raw_spin_lock_irqsave(spinlock_check(lock), flags); } while (0)
   --  arg-macro: procedure spin_lock_irqsave_nested do { raw_spin_lock_irqsave_nested(spinlock_check(lock), flags, subclass); } while (0)
   --    do { raw_spin_lock_irqsave_nested(spinlock_check(lock), flags, subclass); } while (0)
   --  arg-macro: function spin_trylock_irqsave ({ raw_spin_trylock_irqsave(spinlock_check(lock), flags); }
   --    return { raw_spin_trylock_irqsave(spinlock_check(lock), flags); };
   --  arg-macro: procedure assert_spin_locked assert_raw_spin_locked(and(lock).rlock)
   --    assert_raw_spin_locked(and(lock).rlock)
   --  arg-macro: procedure atomic_dec_and_lock __cond_lock(lock, _atomic_dec_and_lock(atomic, lock))
   --    __cond_lock(lock, _atomic_dec_and_lock(atomic, lock))
  -- * include/linux/spinlock.h - generic spinlock/rwlock declarations
  -- *
  -- * here's the role of the various spinlock/rwlock related include files:
  -- *
  -- * on SMP builds:
  -- *
  -- *  asm/spinlock_types.h: contains the arch_spinlock_t/arch_rwlock_t and the
  -- *                        initializers
  -- *
  -- *  linux/spinlock_types.h:
  -- *                        defines the generic type and initializers
  -- *
  -- *  asm/spinlock.h:       contains the arch_spin_*()/etc. lowlevel
  -- *                        implementations, mostly inline assembly code
  -- *
  -- *   (also included on UP-debug builds:)
  -- *
  -- *  linux/spinlock_api_smp.h:
  -- *                        contains the prototypes for the _spin_*() APIs.
  -- *
  -- *  linux/spinlock.h:     builds the final spin_*() APIs.
  -- *
  -- * on UP builds:
  -- *
  -- *  linux/spinlock_type_up.h:
  -- *                        contains the generic, simplified UP spinlock type.
  -- *                        (which is an empty structure on non-debug builds)
  -- *
  -- *  linux/spinlock_types.h:
  -- *                        defines the generic type and initializers
  -- *
  -- *  linux/spinlock_up.h:
  -- *                        contains the arch_spin_*()/etc. version of UP
  -- *                        builds. (which are NOPs on non-debug, non-preempt
  -- *                        builds)
  -- *
  -- *   (included on UP-non-debug builds:)
  -- *
  -- *  linux/spinlock_api_up.h:
  -- *                        builds the _spin_*() APIs.
  -- *
  -- *  linux/spinlock.h:     builds the final spin_*() APIs.
  --  

  -- * Must define these before including other files, inline functions need them
  --  

  -- * Pull the arch_spinlock_t and arch_rwlock_t definitions:
  --  

  -- * Pull the arch_spin*() functions/declarations (UP-nondebug doesn't need them):
  --  

  -- * Despite its name it doesn't necessarily has to be a full barrier.
  -- * It should only guarantee that a STORE before the critical section
  -- * can not be reordered with a LOAD inside this section.
  -- * spin_lock() is the one-way barrier, this LOAD can not escape out
  -- * of the region. So the default implementation simply ensures that
  -- * a STORE can not move into the critical section, smp_wmb() should
  -- * serialize it with another STORE done by spin_lock().
  --  

  -- * Place this after a lock-acquisition primitive to guarantee that
  -- * an UNLOCK+LOCK pair act as a full barrier.  This guarantee applies
  -- * if the UNLOCK and LOCK are executed by the same CPU or if the
  -- * UNLOCK and LOCK operate on the same lock variable.
  --  

  --*
  -- * raw_spin_unlock_wait - wait until the spinlock gets unlocked
  -- * @lock: the spinlock in question.
  --  

   procedure do_raw_spin_lock (lock : access linux_spinlock_types_h.raw_spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:155
   pragma Import (CPP, do_raw_spin_lock, "_ZL16do_raw_spin_lockP12raw_spinlock");

   procedure do_raw_spin_lock_flags (lock : access linux_spinlock_types_h.raw_spinlock_t; flags : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:162
   pragma Import (CPP, do_raw_spin_lock_flags, "_ZL22do_raw_spin_lock_flagsP12raw_spinlockPm");

   function do_raw_spin_trylock (lock : access linux_spinlock_types_h.raw_spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:168
   pragma Import (CPP, do_raw_spin_trylock, "_ZL19do_raw_spin_trylockP12raw_spinlock");

   procedure do_raw_spin_unlock (lock : access linux_spinlock_types_h.raw_spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:173
   pragma Import (CPP, do_raw_spin_unlock, "_ZL18do_raw_spin_unlockP12raw_spinlock");

  -- * Define the various spin_lock methods.  Note we define these
  -- * regardless of whether CONFIG_SMP or CONFIG_PREEMPT are set. The
  -- * various methods are defined as nops in the case they are not
  -- * required.
  --  

  --*
  -- * raw_spin_can_lock - would raw_spin_trylock() succeed?
  -- * @lock: the spinlock in question.
  --  

  -- Include rwlock functions  
  -- * Pull the _spin_*()/_read_*()/_write_*() functions/declarations:
  --  

  -- * Map the spin_lock functions to the raw variants for PREEMPT_RT=n
  --  

   function spinlock_check (lock : access linux_spinlock_types_h.spinlock_t) return access linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:290
   pragma Import (CPP, spinlock_check, "_ZL14spinlock_checkP8spinlock");

   procedure spin_lock (lock : access linux_spinlock_types_h.spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:301
   pragma Import (CPP, spin_lock, "_ZL9spin_lockP8spinlock");

   procedure spin_lock_bh (lock : access linux_spinlock_types_h.spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:306
   pragma Import (CPP, spin_lock_bh, "_ZL12spin_lock_bhP8spinlock");

   function spin_trylock (lock : access linux_spinlock_types_h.spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:311
   pragma Import (CPP, spin_trylock, "_ZL12spin_trylockP8spinlock");

   procedure spin_lock_irq (lock : access linux_spinlock_types_h.spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:326
   pragma Import (CPP, spin_lock_irq, "_ZL13spin_lock_irqP8spinlock");

   procedure spin_unlock (lock : access linux_spinlock_types_h.spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:341
   pragma Import (CPP, spin_unlock, "_ZL11spin_unlockP8spinlock");

   procedure spin_unlock_bh (lock : access linux_spinlock_types_h.spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:346
   pragma Import (CPP, spin_unlock_bh, "_ZL14spin_unlock_bhP8spinlock");

   procedure spin_unlock_irq (lock : access linux_spinlock_types_h.spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:351
   pragma Import (CPP, spin_unlock_irq, "_ZL15spin_unlock_irqP8spinlock");

   procedure spin_unlock_irqrestore (lock : access linux_spinlock_types_h.spinlock_t; flags : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:356
   pragma Import (CPP, spin_unlock_irqrestore, "_ZL22spin_unlock_irqrestoreP8spinlockm");

   function spin_trylock_bh (lock : access linux_spinlock_types_h.spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:361
   pragma Import (CPP, spin_trylock_bh, "_ZL15spin_trylock_bhP8spinlock");

   function spin_trylock_irq (lock : access linux_spinlock_types_h.spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:366
   pragma Import (CPP, spin_trylock_irq, "_ZL16spin_trylock_irqP8spinlock");

   procedure spin_unlock_wait (lock : access linux_spinlock_types_h.spinlock_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:376
   pragma Import (CPP, spin_unlock_wait, "_ZL16spin_unlock_waitP8spinlock");

   function spin_is_locked (lock : access linux_spinlock_types_h.spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:381
   pragma Import (CPP, spin_is_locked, "_ZL14spin_is_lockedP8spinlock");

   function spin_is_contended (lock : access linux_spinlock_types_h.spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:386
   pragma Import (CPP, spin_is_contended, "_ZL17spin_is_contendedP8spinlock");

   function spin_can_lock (lock : access linux_spinlock_types_h.spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/spinlock.h:391
   pragma Import (CPP, spin_can_lock, "_ZL13spin_can_lockP8spinlock");

  -- * Pull the atomic_t declaration:
  -- * (asm-mips/atomic.h needs above definitions)
  --  

  --*
  -- * atomic_dec_and_lock - lock on reaching reference count zero
  -- * @atomic: the atomic counter
  -- * @lock: the spinlock in question
  -- *
  -- * Decrements @atomic by 1.  If the result is 0, returns true and locks
  -- * @lock.  Returns false for all other cases.
  --  

   --  skipped func _atomic_dec_and_lock

end linux_spinlock_h;

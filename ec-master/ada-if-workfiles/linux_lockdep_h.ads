pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package linux_lockdep_h is

   --  arg-macro: procedure lock_acquire do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lock_release do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lock_set_class do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lock_set_subclass do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lockdep_set_current_reclaim_state do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lockdep_clear_current_reclaim_state do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lockdep_trace_alloc do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lockdep_init do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lockdep_info do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lockdep_init_map do { (void)(name); (void)(key); } while (0)
   --    do { (void)(name); (void)(key); } while (0)
   --  arg-macro: procedure lockdep_set_class do { (void)(key); } while (0)
   --    do { (void)(key); } while (0)
   --  arg-macro: procedure lockdep_set_class_and_name do { (void)(key); (void)(name); } while (0)
   --    do { (void)(key); (void)(name); } while (0)
   --  arg-macro: procedure lockdep_set_class_and_subclass do { (void)(key); } while (0)
   --    do { (void)(key); } while (0)
   --  arg-macro: procedure lockdep_set_subclass do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lockdep_set_novalidate_class do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lockdep_reset do { debug_locks := 1; } while (0)
   --    do { debug_locks := 1; } while (0)
   --  arg-macro: procedure lockdep_free_key_range do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure lockdep_sys_exit do { } while (0)
   --    do { } while (0)
   --  arg-macro: function lockdep_depth (0
   --    return 0;
   --  arg-macro: procedure lockdep_assert_held do { (void)(l); } while (0)
   --    do { (void)(l); } while (0)
   --  arg-macro: function lockdep_recursing (0
   --    return 0;
   --  arg-macro: procedure lock_contended do {} while (0)
   --    do {} while (0)
   --  arg-macro: procedure lock_acquired do {} while (0)
   --    do {} while (0)
   --  arg-macro: procedure LOCK_CONTENDED lock(_lock)
   --    lock(_lock)
   --  arg-macro: procedure LOCK_CONTENDED_FLAGS lockfl((_lock), (flags))
   --    lockfl((_lock), (flags))
   --  unsupported macro: SINGLE_DEPTH_NESTING 1
   --  arg-macro: procedure lock_acquire_exclusive lock_acquire(l, s, t, 0, 1, n, i)
   --    lock_acquire(l, s, t, 0, 1, n, i)
   --  arg-macro: procedure lock_acquire_shared lock_acquire(l, s, t, 1, 1, n, i)
   --    lock_acquire(l, s, t, 1, 1, n, i)
   --  arg-macro: procedure lock_acquire_shared_recursive lock_acquire(l, s, t, 2, 1, n, i)
   --    lock_acquire(l, s, t, 2, 1, n, i)
   --  arg-macro: procedure spin_acquire lock_acquire_exclusive(l, s, t, NULL, i)
   --    lock_acquire_exclusive(l, s, t, NULL, i)
   --  arg-macro: procedure spin_acquire_nest lock_acquire_exclusive(l, s, t, n, i)
   --    lock_acquire_exclusive(l, s, t, n, i)
   --  arg-macro: procedure spin_release lock_release(l, n, i)
   --    lock_release(l, n, i)
   --  arg-macro: procedure rwlock_acquire lock_acquire_exclusive(l, s, t, NULL, i)
   --    lock_acquire_exclusive(l, s, t, NULL, i)
   --  arg-macro: procedure rwlock_acquire_read lock_acquire_shared_recursive(l, s, t, NULL, i)
   --    lock_acquire_shared_recursive(l, s, t, NULL, i)
   --  arg-macro: procedure rwlock_release lock_release(l, n, i)
   --    lock_release(l, n, i)
   --  arg-macro: procedure seqcount_acquire lock_acquire_exclusive(l, s, t, NULL, i)
   --    lock_acquire_exclusive(l, s, t, NULL, i)
   --  arg-macro: procedure seqcount_acquire_read lock_acquire_shared_recursive(l, s, t, NULL, i)
   --    lock_acquire_shared_recursive(l, s, t, NULL, i)
   --  arg-macro: procedure seqcount_release lock_release(l, n, i)
   --    lock_release(l, n, i)
   --  arg-macro: procedure mutex_acquire lock_acquire_exclusive(l, s, t, NULL, i)
   --    lock_acquire_exclusive(l, s, t, NULL, i)
   --  arg-macro: procedure mutex_acquire_nest lock_acquire_exclusive(l, s, t, n, i)
   --    lock_acquire_exclusive(l, s, t, n, i)
   --  arg-macro: procedure mutex_release lock_release(l, n, i)
   --    lock_release(l, n, i)
   --  arg-macro: procedure rwsem_acquire lock_acquire_exclusive(l, s, t, NULL, i)
   --    lock_acquire_exclusive(l, s, t, NULL, i)
   --  arg-macro: procedure rwsem_acquire_nest lock_acquire_exclusive(l, s, t, n, i)
   --    lock_acquire_exclusive(l, s, t, n, i)
   --  arg-macro: procedure rwsem_acquire_read lock_acquire_shared(l, s, t, NULL, i)
   --    lock_acquire_shared(l, s, t, NULL, i)
   --  arg-macro: procedure rwsem_release lock_release(l, n, i)
   --    lock_release(l, n, i)
   --  arg-macro: procedure lock_map_acquire lock_acquire_exclusive(l, 0, 0, NULL, _THIS_IP_)
   --    lock_acquire_exclusive(l, 0, 0, NULL, _THIS_IP_)
   --  arg-macro: procedure lock_map_acquire_read lock_acquire_shared_recursive(l, 0, 0, NULL, _THIS_IP_)
   --    lock_acquire_shared_recursive(l, 0, 0, NULL, _THIS_IP_)
   --  arg-macro: procedure lock_map_release lock_release(l, 1, _THIS_IP_)
   --    lock_release(l, 1, _THIS_IP_)
   --  arg-macro: procedure might_lock do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure might_lock_read do { } while (0)
   --    do { } while (0)
  -- * Runtime locking correctness validator
  -- *
  -- *  Copyright (C) 2006,2007 Red Hat, Inc., Ingo Molnar <mingo@redhat.com>
  -- *  Copyright (C) 2007 Red Hat, Inc., Peter Zijlstra <pzijlstr@redhat.com>
  -- *
  -- * see Documentation/lockdep-design.txt for more details.
  --  

   --  skipped empty struct lockdep_map

  -- for sysctl  
   prove_locking : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockdep.h:16
   pragma Import (C, prove_locking, "prove_locking");

   lock_stat : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockdep.h:17
   pragma Import (C, lock_stat, "lock_stat");

  -- * We'd rather not expose kernel/lockdep_states.h this wide, but we do need
  -- * the total number of states... :-(
  --  

  -- * NR_LOCKDEP_CACHING_CLASSES ... Number of classes
  -- * cached in the instance of lockdep_map
  -- *
  -- * Currently main class (subclass == 0) and signle depth subclass
  -- * are cached in lockdep_map. This optimization is mainly targeting
  -- * on rq->lock. double_rq_lock() acquires this highly competitive with
  -- * single depth.
  --  

  -- * Lock-classes are keyed via unique addresses, by embedding the
  -- * lockclass-key into the kernel (or module) .data section. (For
  -- * static locks we use the lock address itself as the key.)
  --  

  -- * The lock-class itself:
  --  

  --	 * class-hash:
  --	  

  --	 * global list of all lock-classes:
  --	  

  --	 * IRQ/softirq usage tracking bits:
  --	  

  --	 * These fields represent a directed graph of lock dependencies,
  --	 * to every node we attach a list of "forward" and a list of
  --	 * "backward" graph nodes.
  --	  

  --	 * Generation counter, when doing certain classes of graph walking,
  --	 * to ensure that we check one node only once:
  --	  

  --	 * Statistics counter:
  --	  

  -- * Map the lock object (the lock instance) to the lock-class object.
  -- * This is embedded into specific lock instances:
  --  

  --	 * Since the class cache can be modified concurrently we could observe
  --	 * half pointers (64bit arch using 32bit copy insns). Therefore clear
  --	 * the caches and take the performance hit.
  --	 *
  --	 * XXX it doesn't work well with lockdep_set_class_and_subclass(), since
  --	 *     that relies on cache abuse.
  --	  

  -- * Every lock has a list of other locks that were taken after it.
  -- * We only grow the list, never remove from it:
  --  

  --	 * The parent field is used to implement breadth-first search, and the
  --	 * bit 0 is reused to indicate if the lock has been accessed in BFS.
  --	  

  -- * We record lock dependency chains, so that we can cache them:
  --  

  -- * Subtract one because we offset hlock->class_idx by 1 in order
  -- * to make 0 mean no class. This avoids overflowing the class_idx
  -- * bitfield and hitting the BUG in hlock_class().
  --  

  --	 * One-way hash of the dependency chain up to this point. We
  --	 * hash the hashes step by step as the dependency chain grows.
  --	 *
  --	 * We use it for dependency-caching and we skip detection
  --	 * passes and dependency-updates if there is a cache-hit, so
  --	 * it is absolutely critical for 100% coverage of the validator
  --	 * to have a unique key value for every unique dependency path
  --	 * that can occur in the system, to make a unique hash value
  --	 * as likely as possible - hence the 64-bit width.
  --	 *
  --	 * The task struct holds the current hash value (initialized
  --	 * with zero), here we store the previous hash value:
  --	  

  --	 * The lock-stack is unified in that the lock chains of interrupt
  --	 * contexts nest ontop of process context chains, but we 'separate'
  --	 * the hashes by starting with 0 if we cross into an interrupt
  --	 * context, and we also keep do not add cross-context lock
  --	 * dependencies - the lock usage graph walking covers that area
  --	 * anyway, and we'd just unnecessarily increase the number of
  --	 * dependencies otherwise. [Note: hardirq and softirq contexts
  --	 * are separated from each other too.]
  --	 *
  --	 * The following field is used to detect when we cross into an
  --	 * interrupt context:
  --	  

  -- bit 0 - soft, bit 1 - hard  
  -- 16 bits  
  -- see lock_acquire() comment  
  -- see lock_acquire() comment  
  -- 32 bits  
  -- * Initialization, self-test and debugging-output methods:
  --  

  -- * These methods are used by specific locking variants (spinlocks,
  -- * rwlocks, mutexes and rwsems) to pass init/acquire/release events
  -- * to lockdep:
  --  

  -- * To initialize a lockdep_map statically use this macro.
  -- * Note that _name must not be NULL.
  --  

  -- * Reinitialize a lock key - for cases where there is special locking or
  -- * special initialization of locks so that the validator gets the scope
  -- * of dependencies wrong: they are either too broad (they need a class-split)
  -- * or they are too narrow (they suffer from a false class-split):
  --  

  -- * Compare locking classes
  --  

  -- * Acquire a lock.
  -- *
  -- * Values for "read":
  -- *
  -- *   0: exclusive (write) acquire
  -- *   1: read-acquire (no recursion allowed)
  -- *   2: read-acquire with same-instance recursion allowed
  -- *
  -- * Values for check:
  -- *
  -- *   0: simple checks (freeing, held-at-exit-time, etc.)
  -- *   1: full validation
  --  

   procedure lockdep_off;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockdep.h:369
   pragma Import (CPP, lockdep_off, "_ZL11lockdep_offv");

   procedure lockdep_on;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockdep.h:373
   pragma Import (CPP, lockdep_on, "_ZL10lockdep_onv");

  -- * We don't define lockdep_match_class() and lockdep_match_key() for !LOCKDEP
  -- * case since the result is not well defined and the caller should rather
  -- * #ifdef the call himself.
  --  

  -- * The class key takes no space if lockdep is disabled:
  --  

   type lock_class_key is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, lock_class_key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockdep.h:410

  -- * On lockdep we dont want the hand-coded irq-enable of
  -- * _raw_*_lock_flags() code, because lockdep assumes
  -- * that interrupts are not re-enabled during lock-acquire:
  --  

   procedure print_irqtrace_events (curr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/lockdep.h:464
   pragma Import (CPP, print_irqtrace_events, "_ZL21print_irqtrace_eventsP11task_struct");

  -- * For trivial one-depth nesting of a lock-class, the following
  -- * global define can be used. (Subsystems with multiple levels
  -- * of nesting should define their own lock-nesting subclasses.)
  --  

  -- * Map the dependency ops to NOP or to real lockdep ops, depending
  -- * on the per lock-class debug mode:
  --  

end linux_lockdep_h;

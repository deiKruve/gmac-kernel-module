pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_types_h;
with System;
with linux_spinlock_types_h;
with Interfaces.C.Extensions;
with linux_workqueue_h;

package linux_srcu_h is

   --  arg-macro: procedure RCU_BATCH_INIT { NULL, and(name.head) }
   --    { NULL, and(name.head) }
   --  unsupported macro: DEFINE_SRCU(name) static DEFINE_PER_CPU(struct srcu_struct_array, name ##_srcu_array); struct srcu_struct name = __SRCU_STRUCT_INIT(name);
   --  unsupported macro: DEFINE_STATIC_SRCU(name) static DEFINE_PER_CPU(struct srcu_struct_array, name ##_srcu_array); static struct srcu_struct name = __SRCU_STRUCT_INIT(name);
   --  arg-macro: procedure srcu_dereference_check __rcu_dereference_check((p), srcu_read_lock_held(sp)  or else  (c), __rcu)
   --    __rcu_dereference_check((p), srcu_read_lock_held(sp)  or else  (c), __rcu)
   --  arg-macro: procedure srcu_dereference srcu_dereference_check((p), (sp), 0)
   --    srcu_dereference_check((p), (sp), 0)
  -- * Sleepable Read-Copy Update mechanism for mutual exclusion
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License as published by
  -- * the Free Software Foundation; either version 2 of the License, or
  -- * (at your option) any later version.
  -- *
  -- * This program is distributed in the hope that it will be useful,
  -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- * GNU General Public License for more details.
  -- *
  -- * You should have received a copy of the GNU General Public License
  -- * along with this program; if not, you can access it online at
  -- * http://www.gnu.org/licenses/gpl-2.0.html.
  -- *
  -- * Copyright (C) IBM Corporation, 2006
  -- * Copyright (C) Fujitsu, 2012
  -- *
  -- * Author: Paul McKenney <paulmck@us.ibm.com>
  -- *	   Lai Jiangshan <laijs@cn.fujitsu.com>
  -- *
  -- * For detailed explanation of Read-Copy Update mechanism see -
  -- * 		Documentation/RCU/ *.txt
  -- *
  --  

   type srcu_struct_array_c_array is array (0 .. 1) of aliased unsigned_long;
   type srcu_struct_array_seq_array is array (0 .. 1) of aliased unsigned_long;
   type srcu_struct_array is record
      c : aliased srcu_struct_array_c_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:37
      seq : aliased srcu_struct_array_seq_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, srcu_struct_array);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:36

   type rcu_batch is record
      head : access linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:42
      tail : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:42
   end record;
   pragma Convention (C_Pass_By_Copy, rcu_batch);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:41

   type srcu_struct is record
      completed : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:48
      per_cpu_ref : access srcu_struct_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:49
      queue_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:50
      running : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:51
      batch_queue : aliased rcu_batch;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:53
      batch_check0 : aliased rcu_batch;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:55
      batch_check1 : aliased rcu_batch;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:57
      batch_done : aliased rcu_batch;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:58
      work : aliased linux_workqueue_h.delayed_work;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:59
   end record;
   pragma Convention (C_Pass_By_Copy, srcu_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:47

  -- protect ->batch_queue, ->running  
  -- callbacks just queued  
  -- callbacks try to do the first check_zero  
  -- callbacks done with the first check_zero and the flip  
   function init_srcu_struct (sp : access srcu_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:80
   pragma Import (CPP, init_srcu_struct, "_Z16init_srcu_structP11srcu_struct");

   procedure process_srcu (work : access linux_workqueue_h.work_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:85
   pragma Import (CPP, process_srcu, "_Z12process_srcuP11work_struct");

  -- * define and init a srcu struct at build time.
  -- * dont't call init_srcu_struct() nor cleanup_srcu_struct() on it.
  --  

  --*
  -- * call_srcu() - Queue a callback for invocation after an SRCU grace period
  -- * @sp: srcu_struct in queue the callback
  -- * @head: structure to be used for queueing the SRCU callback.
  -- * @func: function to be invoked after the SRCU grace period
  -- *
  -- * The callback function will be invoked some time after a full SRCU
  -- * grace period elapses, in other words after all pre-existing SRCU
  -- * read-side critical sections have completed.  However, the callback
  -- * function might well execute concurrently with other SRCU read-side
  -- * critical sections that started after call_srcu() was invoked.  SRCU
  -- * read-side critical sections are delimited by srcu_read_lock() and
  -- * srcu_read_unlock(), and may be nested.
  -- *
  -- * The callback will be invoked from process context, but must nevertheless
  -- * be fast and must not block.
  --  

   procedure call_srcu
     (sp : access srcu_struct;
      head : access linux_types_h.callback_head;
      func : access procedure (arg1 : access linux_types_h.callback_head));  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:130
   pragma Import (CPP, call_srcu, "_Z9call_srcuP11srcu_structP13callback_headPFvS2_E");

   procedure cleanup_srcu_struct (sp : access srcu_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:133
   pragma Import (CPP, cleanup_srcu_struct, "_Z19cleanup_srcu_structP11srcu_struct");

   --  skipped func __srcu_read_lock

   --  skipped func __srcu_read_unlock

   procedure synchronize_srcu (sp : access srcu_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:136
   pragma Import (CPP, synchronize_srcu, "_Z16synchronize_srcuP11srcu_struct");

   procedure synchronize_srcu_expedited (sp : access srcu_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:137
   pragma Import (CPP, synchronize_srcu_expedited, "_Z26synchronize_srcu_expeditedP11srcu_struct");

   function srcu_batches_completed (sp : access srcu_struct) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:138
   pragma Import (CPP, srcu_batches_completed, "_Z22srcu_batches_completedP11srcu_struct");

   procedure srcu_barrier (sp : access srcu_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:139
   pragma Import (CPP, srcu_barrier, "_Z12srcu_barrierP11srcu_struct");

  --*
  -- * srcu_read_lock_held - might we be in SRCU read-side critical section?
  -- *
  -- * If CONFIG_DEBUG_LOCK_ALLOC is selected, returns nonzero iff in an SRCU
  -- * read-side critical section.  In absence of CONFIG_DEBUG_LOCK_ALLOC,
  -- * this assumes we are in an SRCU read-side critical section unless it can
  -- * prove otherwise.
  -- *
  -- * Checks debug_lockdep_rcu_enabled() to prevent false positives during boot
  -- * and while lockdep is disabled.
  -- *
  -- * Note that SRCU is based on its own statemachine and it doesn't
  -- * relies on normal RCU, it can be called from the CPU which
  -- * is in the idle loop from an RCU point of view or offline.
  --  

   function srcu_read_lock_held (sp : access srcu_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:167
   pragma Import (CPP, srcu_read_lock_held, "_ZL19srcu_read_lock_heldP11srcu_struct");

  --*
  -- * srcu_dereference_check - fetch SRCU-protected pointer for later dereferencing
  -- * @p: the pointer to fetch and protect for later dereferencing
  -- * @sp: pointer to the srcu_struct, which is used to check that we
  -- *	really are in an SRCU read-side critical section.
  -- * @c: condition to check for update-side use
  -- *
  -- * If PROVE_RCU is enabled, invoking this outside of an RCU read-side
  -- * critical section will result in an RCU-lockdep splat, unless @c evaluates
  -- * to 1.  The @c argument will normally be a logical expression containing
  -- * lockdep_is_held() calls.
  --  

  --*
  -- * srcu_dereference - fetch SRCU-protected pointer for later dereferencing
  -- * @p: the pointer to fetch and protect for later dereferencing
  -- * @sp: pointer to the srcu_struct, which is used to check that we
  -- *	really are in an SRCU read-side critical section.
  -- *
  -- * Makes rcu_dereference_check() do the dirty work.  If PROVE_RCU
  -- * is enabled, invoking this outside of an RCU read-side critical
  -- * section will result in an RCU-lockdep splat.
  --  

  --*
  -- * srcu_read_lock - register a new reader for an SRCU-protected structure.
  -- * @sp: srcu_struct in which to register the new reader.
  -- *
  -- * Enter an SRCU read-side critical section.  Note that SRCU read-side
  -- * critical sections may be nested.  However, it is illegal to
  -- * call anything that waits on an SRCU grace period for the same
  -- * srcu_struct, whether directly or indirectly.  Please note that
  -- * one way to indirectly wait on an SRCU grace period is to acquire
  -- * a mutex that is held elsewhere while calling synchronize_srcu() or
  -- * synchronize_srcu_expedited().
  -- *
  -- * Note that srcu_read_lock() and the matching srcu_read_unlock() must
  -- * occur in the same context, for example, it is illegal to invoke
  -- * srcu_read_unlock() in an irq handler if the matching srcu_read_lock()
  -- * was invoked in process context.
  --  

   function srcu_read_lock (sp : access srcu_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:218
   pragma Import (CPP, srcu_read_lock, "_ZL14srcu_read_lockP11srcu_struct");

  --*
  -- * srcu_read_unlock - unregister a old reader from an SRCU-protected structure.
  -- * @sp: srcu_struct in which to unregister the old reader.
  -- * @idx: return value from corresponding srcu_read_lock().
  -- *
  -- * Exit an SRCU read-side critical section.
  --  

   procedure srcu_read_unlock (sp : access srcu_struct; idx : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:233
   pragma Import (CPP, srcu_read_unlock, "_ZL16srcu_read_unlockP11srcu_structi");

  --*
  -- * smp_mb__after_srcu_read_unlock - ensure full ordering after srcu_read_unlock
  -- *
  -- * Converts the preceding srcu_read_unlock into a two-way memory barrier.
  -- *
  -- * Call this after srcu_read_unlock, to guarantee that all memory operations
  -- * that occur after smp_mb__after_srcu_read_unlock will appear to happen after
  -- * the preceding srcu_read_unlock.
  --  

   procedure smp_mb_u_after_srcu_read_unlock;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/srcu.h:249
   pragma Import (CPP, smp_mb_u_after_srcu_read_unlock, "_ZL30smp_mb__after_srcu_read_unlockv");

  -- __srcu_read_unlock has smp_mb() internally so nothing to do here.  
end linux_srcu_h;

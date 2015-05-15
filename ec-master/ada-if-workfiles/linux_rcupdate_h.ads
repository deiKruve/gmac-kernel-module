pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with linux_types_h;
limited with linux_sched_h;
with Interfaces.C.Extensions;

package linux_rcupdate_h is

   --  arg-macro: function UINT_CMP_GE (UINT_MAX / 2 >= (a) - (b)
   --    return UINT_MAX / 2 >= (a) - (b);
   --  arg-macro: function UINT_CMP_LT (UINT_MAX / 2 < (a) - (b)
   --    return UINT_MAX / 2 < (a) - (b);
   --  arg-macro: function ULONG_CMP_GE (ULONG_MAX / 2 >= (a) - (b)
   --    return ULONG_MAX / 2 >= (a) - (b);
   --  arg-macro: function ULONG_CMP_LT (ULONG_MAX / 2 < (a) - (b)
   --    return ULONG_MAX / 2 < (a) - (b);
   --  arg-macro: function ulong2long (*(long *)(and(a))
   --    return *(long *)(and(a));
   --  unsupported macro: call_rcu call_rcu_sched
   --  arg-macro: procedure RCU_NONIDLE do { rcu_irq_enter(); do { a; } while (0); rcu_irq_exit(); } while (0)
   --    do { rcu_irq_enter(); do { a; } while (0); rcu_irq_exit(); } while (0)
   --  arg-macro: procedure rcu_lock_acquire do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure rcu_lock_release do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure rcu_lockdep_assert do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure rcu_sleep_check do { } while (0)
   --    do { } while (0)
   --  arg-macro: function RCU_INITIALIZER (typeof(*(v)) __force __rcu *)(v
   --    return typeof(*(v)) __force __rcu *)(v;
   --  arg-macro: procedure rcu_assign_pointer smp_store_release(andp, RCU_INITIALIZER(v))
   --    smp_store_release(andp, RCU_INITIALIZER(v))
   --  arg-macro: procedure rcu_access_pointer __rcu_access_pointer((p), __rcu)
   --    __rcu_access_pointer((p), __rcu)
   --  arg-macro: procedure rcu_dereference_check __rcu_dereference_check((p), rcu_read_lock_held()  or else  (c), __rcu)
   --    __rcu_dereference_check((p), rcu_read_lock_held()  or else  (c), __rcu)
   --  arg-macro: procedure rcu_dereference_bh_check __rcu_dereference_check((p), rcu_read_lock_bh_held()  or else  (c), __rcu)
   --    __rcu_dereference_check((p), rcu_read_lock_bh_held()  or else  (c), __rcu)
   --  arg-macro: procedure rcu_dereference_sched_check __rcu_dereference_check((p), rcu_read_lock_sched_held()  or else  (c), __rcu)
   --    __rcu_dereference_check((p), rcu_read_lock_sched_held()  or else  (c), __rcu)
   --  arg-macro: procedure rcu_dereference_raw rcu_dereference_check(p, 1)
   --    rcu_dereference_check(p, 1)
   --  arg-macro: procedure rcu_dereference_raw_notrace __rcu_dereference_check((p), 1, __rcu)
   --    __rcu_dereference_check((p), 1, __rcu)
   --  arg-macro: procedure rcu_access_index __rcu_access_index((p), __rcu)
   --    __rcu_access_index((p), __rcu)
   --  arg-macro: procedure rcu_dereference_index_check __rcu_dereference_index_check((p), (c))
   --    __rcu_dereference_index_check((p), (c))
   --  arg-macro: procedure rcu_dereference_protected __rcu_dereference_protected((p), (c), __rcu)
   --    __rcu_dereference_protected((p), (c), __rcu)
   --  arg-macro: procedure rcu_dereference rcu_dereference_check(p, 0)
   --    rcu_dereference_check(p, 0)
   --  arg-macro: procedure rcu_dereference_bh rcu_dereference_bh_check(p, 0)
   --    rcu_dereference_bh_check(p, 0)
   --  arg-macro: procedure rcu_dereference_sched rcu_dereference_sched_check(p, 0)
   --    rcu_dereference_sched_check(p, 0)
   --  arg-macro: procedure RCU_INIT_POINTER do { p := RCU_INITIALIZER(v); } while (0)
   --    do { p := RCU_INITIALIZER(v); } while (0)
   --  arg-macro: procedure RCU_POINTER_INITIALIZER .p := RCU_INITIALIZER(v)
   --    .p := RCU_INITIALIZER(v)
   --  arg-macro: procedure kfree_rcu __kfree_rcu(and((ptr).rcu_head), offsetof(typeof(*(ptr)), rcu_head))
   --    __kfree_rcu(and((ptr).rcu_head), offsetof(typeof(*(ptr)), rcu_head))
  -- * Read-Copy Update mechanism for mutual exclusion
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
  -- * Copyright IBM Corporation, 2001
  -- *
  -- * Author: Dipankar Sarma <dipankar@in.ibm.com>
  -- *
  -- * Based on the original work by Paul McKenney <paulmck@us.ibm.com>
  -- * and inputs from Rusty Russell, Andrea Arcangeli and Andi Kleen.
  -- * Papers:
  -- * http://www.rdrop.com/users/paulmck/paper/rclockpdcsproof.pdf
  -- * http://lse.sourceforge.net/locking/rclock_OLS.2001.05.01c.sc.pdf (OLS2001)
  -- *
  -- * For detailed explanation of Read-Copy Update mechanism see -
  -- *		http://lse.sourceforge.net/locking/rcupdate.html
  -- *
  --  

  -- for sysctl  
   rcu_expedited : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:49
   pragma Import (C, rcu_expedited, "rcu_expedited");

  -- for sysctl  
   type rcutorture_type is 
     (RCU_FLAVOR,
      RCU_BH_FLAVOR,
      RCU_SCHED_FLAVOR,
      SRCU_FLAVOR,
      INVALID_RCU_FLAVOR);
   pragma Convention (C, rcutorture_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:54

   procedure rcutorture_get_gp_data
     (test_type : rcutorture_type;
      flags : access int;
      gpnum : access unsigned_long;
      completed : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:63
   pragma Import (CPP, rcutorture_get_gp_data, "_Z22rcutorture_get_gp_data15rcutorture_typePiPmS1_");

   procedure rcutorture_record_test_transition;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:65
   pragma Import (CPP, rcutorture_record_test_transition, "_Z33rcutorture_record_test_transitionv");

   procedure rcutorture_record_progress (vernum : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:66
   pragma Import (CPP, rcutorture_record_progress, "_Z26rcutorture_record_progressm");

   procedure do_trace_rcu_torture_read
     (rcutorturename : Interfaces.C.Strings.chars_ptr;
      rhp : access linux_types_h.callback_head;
      secs : unsigned_long;
      c_old : unsigned_long;
      c : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:67
   pragma Import (CPP, do_trace_rcu_torture_read, "_Z25do_trace_rcu_torture_readPKcP13callback_headmmm");

  -- Exported common interfaces  
  --*
  -- * call_rcu() - Queue an RCU callback for invocation after a grace period.
  -- * @head: structure to be used for queueing the RCU updates.
  -- * @func: actual callback function to be invoked after the grace period
  -- *
  -- * The callback function will be invoked some time after a full grace
  -- * period elapses, in other words after all pre-existing RCU read-side
  -- * critical sections have completed.  However, the callback function
  -- * might well execute concurrently with RCU read-side critical sections
  -- * that started after call_rcu() was invoked.  RCU read-side critical
  -- * sections are delimited by rcu_read_lock() and rcu_read_unlock(),
  -- * and may be nested.
  -- *
  -- * Note that all CPUs must agree that the grace period extended beyond
  -- * all pre-existing RCU read-side critical section.  On systems with more
  -- * than one CPU, this means that when "func()" is invoked, each CPU is
  -- * guaranteed to have executed a full memory barrier since the end of its
  -- * last RCU read-side critical section whose beginning preceded the call
  -- * to call_rcu().  It also means that each CPU executing an RCU read-side
  -- * critical section that continues beyond the start of "func()" must have
  -- * executed a memory barrier after the call_rcu() but before the beginning
  -- * of that RCU read-side critical section.  Note that these guarantees
  -- * include CPUs that are offline, idle, or executing in user mode, as
  -- * well as CPUs that are executing in the kernel.
  -- *
  -- * Furthermore, if CPU A invoked call_rcu() and CPU B invoked the
  -- * resulting RCU callback function "func()", then both CPU A and CPU B are
  -- * guaranteed to execute a full memory barrier during the time interval
  -- * between the call to call_rcu() and the invocation of "func()" -- even
  -- * if CPU A and CPU B are the same CPU (but again only if the system has
  -- * more than one CPU).
  --  

  -- In classic RCU, call_rcu() is just call_rcu_sched().  
  --*
  -- * call_rcu_bh() - Queue an RCU for invocation after a quicker grace period.
  -- * @head: structure to be used for queueing the RCU updates.
  -- * @func: actual callback function to be invoked after the grace period
  -- *
  -- * The callback function will be invoked some time after a full grace
  -- * period elapses, in other words after all currently executing RCU
  -- * read-side critical sections have completed. call_rcu_bh() assumes
  -- * that the read-side critical sections end on completion of a softirq
  -- * handler. This means that read-side critical sections in process
  -- * context must not be interrupted by softirqs. This interface is to be
  -- * used when most of the read-side critical sections are in softirq context.
  -- * RCU read-side critical sections are delimited by :
  -- *  - rcu_read_lock() and  rcu_read_unlock(), if in interrupt context.
  -- *  OR
  -- *  - rcu_read_lock_bh() and rcu_read_unlock_bh(), if in process context.
  -- *  These may be nested.
  -- *
  -- * See the description of call_rcu() for more detailed information on
  -- * memory ordering guarantees.
  --  

   procedure call_rcu_bh (head : access linux_types_h.callback_head; func : access procedure (arg1 : access linux_types_h.callback_head));  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:173
   pragma Import (CPP, call_rcu_bh, "_Z11call_rcu_bhP13callback_headPFvS0_E");

  --*
  -- * call_rcu_sched() - Queue an RCU for invocation after sched grace period.
  -- * @head: structure to be used for queueing the RCU updates.
  -- * @func: actual callback function to be invoked after the grace period
  -- *
  -- * The callback function will be invoked some time after a full grace
  -- * period elapses, in other words after all currently executing RCU
  -- * read-side critical sections have completed. call_rcu_sched() assumes
  -- * that the read-side critical sections end on enabling of preemption
  -- * or on voluntary preemption.
  -- * RCU read-side critical sections are delimited by :
  -- *  - rcu_read_lock_sched() and  rcu_read_unlock_sched(),
  -- *  OR
  -- *  anything that disables preemption.
  -- *  These may be nested.
  -- *
  -- * See the description of call_rcu() for more detailed information on
  -- * memory ordering guarantees.
  --  

   procedure call_rcu_sched (head : access linux_types_h.callback_head; func : access procedure (arg1 : access linux_types_h.callback_head));  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:195
   pragma Import (CPP, call_rcu_sched, "_Z14call_rcu_schedP13callback_headPFvS0_E");

   procedure synchronize_sched;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:198
   pragma Import (CPP, synchronize_sched, "_Z17synchronize_schedv");

  -- * Defined as a macro as it is a very low level header included from
  -- * areas that don't even know about current.  This gives the rcu_read_lock()
  -- * nesting depth, but makes sense only if CONFIG_PREEMPT_RCU -- in other
  -- * types of kernel builds, the rcu_read_lock() nesting depth is unknowable.
  --  

   --  skipped func __rcu_read_lock

   --  skipped func __rcu_read_unlock

   procedure synchronize_rcu;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:227
   pragma Import (CPP, synchronize_rcu, "_ZL15synchronize_rcuv");

   function rcu_preempt_depth return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:232
   pragma Import (CPP, rcu_preempt_depth, "_ZL17rcu_preempt_depthv");

  -- Internal to kernel  
   procedure rcu_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:240
   pragma Import (CPP, rcu_init, "_Z8rcu_initv");

   procedure rcu_sched_qs (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:241
   pragma Import (CPP, rcu_sched_qs, "_Z12rcu_sched_qsi");

   procedure rcu_bh_qs (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:242
   pragma Import (CPP, rcu_bh_qs, "_Z9rcu_bh_qsi");

   procedure rcu_check_callbacks (cpu : int; user : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:243
   pragma Import (CPP, rcu_check_callbacks, "_Z19rcu_check_callbacksii");

   procedure rcu_idle_enter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:245
   pragma Import (CPP, rcu_idle_enter, "_Z14rcu_idle_enterv");

   procedure rcu_idle_exit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:246
   pragma Import (CPP, rcu_idle_exit, "_Z13rcu_idle_exitv");

   procedure rcu_irq_enter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:247
   pragma Import (CPP, rcu_irq_enter, "_Z13rcu_irq_enterv");

   procedure rcu_irq_exit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:248
   pragma Import (CPP, rcu_irq_exit, "_Z12rcu_irq_exitv");

   procedure rcu_sysrq_start;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:251
   pragma Import (CPP, rcu_sysrq_start, "_Z15rcu_sysrq_startv");

   procedure rcu_sysrq_end;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:252
   pragma Import (CPP, rcu_sysrq_end, "_Z13rcu_sysrq_endv");

   procedure rcu_user_enter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:266
   pragma Import (CPP, rcu_user_enter, "_ZL14rcu_user_enterv");

   procedure rcu_user_exit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:267
   pragma Import (CPP, rcu_user_exit, "_ZL13rcu_user_exitv");

   procedure rcu_user_hooks_switch (prev : access linux_sched_h.task_struct; next : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:268
   pragma Import (CPP, rcu_user_hooks_switch, "_ZL21rcu_user_hooks_switchP11task_structS0_");

  --*
  -- * RCU_NONIDLE - Indicate idle-loop code that needs RCU readers
  -- * @a: Code that RCU needs to pay attention to.
  -- *
  -- * RCU, RCU-bh, and RCU-sched read-side critical sections are forbidden
  -- * in the inner idle loop, that is, between the rcu_idle_enter() and
  -- * the rcu_idle_exit() -- RCU will happily ignore any such read-side
  -- * critical sections.  However, things like powertop need tracepoints
  -- * in the inner idle loop.
  -- *
  -- * This macro provides the way out:  RCU_NONIDLE(do_something_with_RCU())
  -- * will tell RCU that it needs to pay attending, invoke its argument
  -- * (in this example, a call to the do_something_with_RCU() function),
  -- * and then tell RCU to go back to ignoring this CPU.  It is permissible
  -- * to nest RCU_NONIDLE() wrappers, but the nesting level is currently
  -- * quite limited.  If deeper nesting is required, it will be necessary
  -- * to adjust DYNTICK_TASK_NESTING_VALUE accordingly.
  --  

   --  skipped func __rcu_is_watching

  -- * Infrastructure to implement the synchronize_() primitives in
  -- * TREE_RCU and rcu_barrier_() primitives in TINY_RCU.
  --  

   --  skipped function type call_rcu_func_t

   procedure wait_rcu_gp (crf : access procedure (arg1 : access linux_types_h.callback_head; arg2 : access procedure (arg1 : access linux_types_h.callback_head)));  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:308
   pragma Import (CPP, wait_rcu_gp, "_Z11wait_rcu_gpPFvP13callback_headPFvS0_EE");

  -- * init_rcu_head_on_stack()/destroy_rcu_head_on_stack() are needed for dynamic
  -- * initialization and destruction of rcu_head on the stack. rcu_head structures
  -- * allocated dynamically in the heap or defined statically don't need any
  -- * initialization.
  --  

   procedure init_rcu_head (head : access linux_types_h.callback_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:330
   pragma Import (CPP, init_rcu_head, "_ZL13init_rcu_headP13callback_head");

   procedure destroy_rcu_head (head : access linux_types_h.callback_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:334
   pragma Import (CPP, destroy_rcu_head, "_ZL16destroy_rcu_headP13callback_head");

   procedure init_rcu_head_on_stack (head : access linux_types_h.callback_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:338
   pragma Import (CPP, init_rcu_head_on_stack, "_ZL22init_rcu_head_on_stackP13callback_head");

   procedure destroy_rcu_head_on_stack (head : access linux_types_h.callback_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:342
   pragma Import (CPP, destroy_rcu_head_on_stack, "_ZL25destroy_rcu_head_on_stackP13callback_head");

   function rcu_lockdep_current_cpu_online return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:350
   pragma Import (CPP, rcu_lockdep_current_cpu_online, "_ZL30rcu_lockdep_current_cpu_onlinev");

  --*
  -- * rcu_read_lock_held() - might we be in RCU read-side critical section?
  -- *
  -- * If CONFIG_DEBUG_LOCK_ALLOC is selected, returns nonzero iff in an RCU
  -- * read-side critical section.  In absence of CONFIG_DEBUG_LOCK_ALLOC,
  -- * this assumes we are in an RCU read-side critical section unless it can
  -- * prove otherwise.  This is useful for debug checks in functions that
  -- * require that they be called within an RCU read-side critical section.
  -- *
  -- * Checks debug_lockdep_rcu_enabled() to prevent false positives during boot
  -- * and while lockdep is disabled.
  -- *
  -- * Note that rcu_read_lock() and the matching rcu_read_unlock() must
  -- * occur in the same context, for example, it is illegal to invoke
  -- * rcu_read_unlock() in process context if the matching rcu_read_lock()
  -- * was invoked from within an irq handler.
  -- *
  -- * Note that rcu_read_lock() is disallowed if the CPU is either idle or
  -- * offline from an RCU perspective, so check for those as well.
  --  

  -- * rcu_read_lock_bh_held() is defined out of line to avoid #include-file
  -- * hell.
  --  

  --*
  -- * rcu_read_lock_sched_held() - might we be in RCU-sched read-side critical section?
  -- *
  -- * If CONFIG_DEBUG_LOCK_ALLOC is selected, returns nonzero iff in an
  -- * RCU-sched read-side critical section.  In absence of
  -- * CONFIG_DEBUG_LOCK_ALLOC, this assumes we are in an RCU-sched read-side
  -- * critical section unless it can prove otherwise.  Note that disabling
  -- * of preemption (including disabling irqs) counts as an RCU-sched
  -- * read-side critical section.  This is useful for debug checks in functions
  -- * that required that they be called within an RCU-sched read-side
  -- * critical section.
  -- *
  -- * Check debug_lockdep_rcu_enabled() to prevent false positives during boot
  -- * and while lockdep is disabled.
  -- *
  -- * Note that if the CPU is in the idle loop from an RCU point of
  -- * view (ie: that we are in the section between rcu_idle_enter() and
  -- * rcu_idle_exit()) then rcu_read_lock_held() returns false even if the CPU
  -- * did an rcu_read_lock().  The reason for this is that RCU ignores CPUs
  -- * that are in such a section, considering these as in extended quiescent
  -- * state, so such a CPU is effectively never in an RCU read-side critical
  -- * section regardless of what RCU primitives it invokes.  This state of
  -- * affairs is required --- we need to keep an RCU-free window in idle
  -- * where the CPU may possibly enter into low power mode. This way we can
  -- * notice an extended quiescent state to other CPUs that started a grace
  -- * period. Otherwise we would delay any grace period as long as we run in
  -- * the idle task.
  -- *
  -- * Similarly, we avoid claiming an SRCU read lock held if the current
  -- * CPU is offline.
  --  

   function rcu_read_lock_held return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:469
   pragma Import (CPP, rcu_read_lock_held, "_ZL18rcu_read_lock_heldv");

   function rcu_read_lock_bh_held return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:474
   pragma Import (CPP, rcu_read_lock_bh_held, "_ZL21rcu_read_lock_bh_heldv");

   function rcu_read_lock_sched_held return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:485
   pragma Import (CPP, rcu_read_lock_sched_held, "_ZL24rcu_read_lock_sched_heldv");

  --*
  -- * rcu_lockdep_assert - emit lockdep splat if specified condition not met
  -- * @c: condition to check
  -- * @s: informative message
  --  

  -- * Helper functions for rcu_dereference_check(), rcu_dereference_protected()
  -- * and rcu_assign_pointer().  Some of these could be folded into their
  -- * callers, but they are left separate in order to ease introduction of
  -- * multiple flavors of pointers to match the multiple flavors of RCU
  -- * (e.g., __rcu_bh, * __rcu_sched, and __srcu), should this make sense in
  -- * the future.
  --  

  --*
  -- * RCU_INITIALIZER() - statically initialize an RCU-protected global variable
  -- * @v: The value to statically initialize with.
  --  

  --*
  -- * rcu_assign_pointer() - assign to RCU-protected pointer
  -- * @p: pointer to assign to
  -- * @v: value to assign (publish)
  -- *
  -- * Assigns the specified value to the specified RCU-protected
  -- * pointer, ensuring that any concurrent RCU readers will see
  -- * any prior initialization.
  -- *
  -- * Inserts memory barriers on architectures that require them
  -- * (which is most of them), and also prevents the compiler from
  -- * reordering the code that initializes the structure after the pointer
  -- * assignment.  More importantly, this call documents which pointers
  -- * will be dereferenced by RCU read-side code.
  -- *
  -- * In some special cases, you may use RCU_INIT_POINTER() instead
  -- * of rcu_assign_pointer().  RCU_INIT_POINTER() is a bit faster due
  -- * to the fact that it does not constrain either the CPU or the compiler.
  -- * That said, using RCU_INIT_POINTER() when you should have used
  -- * rcu_assign_pointer() is a very bad thing that results in
  -- * impossible-to-diagnose memory corruption.  So please be careful.
  -- * See the RCU_INIT_POINTER() comment header for details.
  -- *
  -- * Note that rcu_assign_pointer() evaluates each of its arguments only
  -- * once, appearances notwithstanding.  One of the "extra" evaluations
  -- * is in typeof() and the other visible only to sparse (__CHECKER__),
  -- * neither of which actually execute the argument.  As with most cpp
  -- * macros, this execute-arguments-only-once property is important, so
  -- * please be careful when making changes to rcu_assign_pointer() and the
  -- * other macros that it invokes.
  --  

  --*
  -- * rcu_access_pointer() - fetch RCU pointer with no dereferencing
  -- * @p: The pointer to read
  -- *
  -- * Return the value of the specified RCU-protected pointer, but omit the
  -- * smp_read_barrier_depends() and keep the ACCESS_ONCE().  This is useful
  -- * when the value of this pointer is accessed, but the pointer is not
  -- * dereferenced, for example, when testing an RCU-protected pointer against
  -- * NULL.  Although rcu_access_pointer() may also be used in cases where
  -- * update-side locks prevent the value of the pointer from changing, you
  -- * should instead use rcu_dereference_protected() for this use case.
  -- *
  -- * It is also permissible to use rcu_access_pointer() when read-side
  -- * access to the pointer was removed at least one grace period ago, as
  -- * is the case in the context of the RCU callback that is freeing up
  -- * the data, or after a synchronize_rcu() returns.  This can be useful
  -- * when tearing down multi-linked structures after a grace period
  -- * has elapsed.
  --  

  --*
  -- * rcu_dereference_check() - rcu_dereference with debug checking
  -- * @p: The pointer to read, prior to dereferencing
  -- * @c: The conditions under which the dereference will take place
  -- *
  -- * Do an rcu_dereference(), but check that the conditions under which the
  -- * dereference will take place are correct.  Typically the conditions
  -- * indicate the various locking conditions that should be held at that
  -- * point.  The check should return true if the conditions are satisfied.
  -- * An implicit check for being in an RCU read-side critical section
  -- * (rcu_read_lock()) is included.
  -- *
  -- * For example:
  -- *
  -- *	bar = rcu_dereference_check(foo->bar, lockdep_is_held(&foo->lock));
  -- *
  -- * could be used to indicate to lockdep that foo->bar may only be dereferenced
  -- * if either rcu_read_lock() is held, or that the lock required to replace
  -- * the bar struct at foo->bar is held.
  -- *
  -- * Note that the list of conditions may also include indications of when a lock
  -- * need not be held, for example during initialisation or destruction of the
  -- * target struct:
  -- *
  -- *	bar = rcu_dereference_check(foo->bar, lockdep_is_held(&foo->lock) ||
  -- *					      atomic_read(&foo->usage) == 0);
  -- *
  -- * Inserts memory barriers on architectures that require them
  -- * (currently only the Alpha), prevents the compiler from refetching
  -- * (and from merging fetches), and, more importantly, documents exactly
  -- * which pointers are protected by RCU and checks that the pointer is
  -- * annotated as __rcu.
  --  

  --*
  -- * rcu_dereference_bh_check() - rcu_dereference_bh with debug checking
  -- * @p: The pointer to read, prior to dereferencing
  -- * @c: The conditions under which the dereference will take place
  -- *
  -- * This is the RCU-bh counterpart to rcu_dereference_check().
  --  

  --*
  -- * rcu_dereference_sched_check() - rcu_dereference_sched with debug checking
  -- * @p: The pointer to read, prior to dereferencing
  -- * @c: The conditions under which the dereference will take place
  -- *
  -- * This is the RCU-sched counterpart to rcu_dereference_check().
  --  

  -- * The tracing infrastructure traces RCU (we want that), but unfortunately
  -- * some of the RCU checks causes tracing to lock up the system.
  -- *
  -- * The tracing version of rcu_dereference_raw() must not call
  -- * rcu_read_lock_held().
  --  

  --*
  -- * rcu_access_index() - fetch RCU index with no dereferencing
  -- * @p: The index to read
  -- *
  -- * Return the value of the specified RCU-protected index, but omit the
  -- * smp_read_barrier_depends() and keep the ACCESS_ONCE().  This is useful
  -- * when the value of this index is accessed, but the index is not
  -- * dereferenced, for example, when testing an RCU-protected index against
  -- * -1.  Although rcu_access_index() may also be used in cases where
  -- * update-side locks prevent the value of the index from changing, you
  -- * should instead use rcu_dereference_index_protected() for this use case.
  --  

  --*
  -- * rcu_dereference_index_check() - rcu_dereference for indices with debug checking
  -- * @p: The pointer to read, prior to dereferencing
  -- * @c: The conditions under which the dereference will take place
  -- *
  -- * Similar to rcu_dereference_check(), but omits the sparse checking.
  -- * This allows rcu_dereference_index_check() to be used on integers,
  -- * which can then be used as array indices.  Attempting to use
  -- * rcu_dereference_check() on an integer will give compiler warnings
  -- * because the sparse address-space mechanism relies on dereferencing
  -- * the RCU-protected pointer.  Dereferencing integers is not something
  -- * that even gcc will put up with.
  -- *
  -- * Note that this function does not implicitly check for RCU read-side
  -- * critical sections.  If this function gains lots of uses, it might
  -- * make sense to provide versions for each flavor of RCU, but it does
  -- * not make sense as of early 2010.
  --  

  --*
  -- * rcu_dereference_protected() - fetch RCU pointer when updates prevented
  -- * @p: The pointer to read, prior to dereferencing
  -- * @c: The conditions under which the dereference will take place
  -- *
  -- * Return the value of the specified RCU-protected pointer, but omit
  -- * both the smp_read_barrier_depends() and the ACCESS_ONCE().  This
  -- * is useful in cases where update-side locks prevent the value of the
  -- * pointer from changing.  Please note that this primitive does -not-
  -- * prevent the compiler from repeating this reference or combining it
  -- * with other references, so it should not be used without protection
  -- * of appropriate locks.
  -- *
  -- * This function is only for update-side use.  Using this function
  -- * when protected only by rcu_read_lock() will result in infrequent
  -- * but very ugly failures.
  --  

  --*
  -- * rcu_dereference() - fetch RCU-protected pointer for dereferencing
  -- * @p: The pointer to read, prior to dereferencing
  -- *
  -- * This is a simple wrapper around rcu_dereference_check().
  --  

  --*
  -- * rcu_dereference_bh() - fetch an RCU-bh-protected pointer for dereferencing
  -- * @p: The pointer to read, prior to dereferencing
  -- *
  -- * Makes rcu_dereference_check() do the dirty work.
  --  

  --*
  -- * rcu_dereference_sched() - fetch RCU-sched-protected pointer for dereferencing
  -- * @p: The pointer to read, prior to dereferencing
  -- *
  -- * Makes rcu_dereference_check() do the dirty work.
  --  

  --*
  -- * rcu_read_lock() - mark the beginning of an RCU read-side critical section
  -- *
  -- * When synchronize_rcu() is invoked on one CPU while other CPUs
  -- * are within RCU read-side critical sections, then the
  -- * synchronize_rcu() is guaranteed to block until after all the other
  -- * CPUs exit their critical sections.  Similarly, if call_rcu() is invoked
  -- * on one CPU while other CPUs are within RCU read-side critical
  -- * sections, invocation of the corresponding RCU callback is deferred
  -- * until after the all the other CPUs exit their critical sections.
  -- *
  -- * Note, however, that RCU callbacks are permitted to run concurrently
  -- * with new RCU read-side critical sections.  One way that this can happen
  -- * is via the following sequence of events: (1) CPU 0 enters an RCU
  -- * read-side critical section, (2) CPU 1 invokes call_rcu() to register
  -- * an RCU callback, (3) CPU 0 exits the RCU read-side critical section,
  -- * (4) CPU 2 enters a RCU read-side critical section, (5) the RCU
  -- * callback is invoked.  This is legal, because the RCU read-side critical
  -- * section that was running concurrently with the call_rcu() (and which
  -- * therefore might be referencing something that the corresponding RCU
  -- * callback would free up) has completed before the corresponding
  -- * RCU callback is invoked.
  -- *
  -- * RCU read-side critical sections may be nested.  Any deferred actions
  -- * will be deferred until the outermost RCU read-side critical section
  -- * completes.
  -- *
  -- * You can avoid reading and understanding the next paragraph by
  -- * following this rule: don't put anything in an rcu_read_lock() RCU
  -- * read-side critical section that would block in a !PREEMPT kernel.
  -- * But if you want the full story, read on!
  -- *
  -- * In non-preemptible RCU implementations (TREE_RCU and TINY_RCU), it
  -- * is illegal to block while in an RCU read-side critical section.  In
  -- * preemptible RCU implementations (TREE_PREEMPT_RCU and TINY_PREEMPT_RCU)
  -- * in CONFIG_PREEMPT kernel builds, RCU read-side critical sections may
  -- * be preempted, but explicit blocking is illegal.  Finally, in preemptible
  -- * RCU implementations in real-time (with -rt patchset) kernel builds,
  -- * RCU read-side critical sections may be preempted and they may also
  -- * block, but only when acquiring spinlocks that are subject to priority
  -- * inheritance.
  --  

   procedure rcu_read_lock;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:839
   pragma Import (CPP, rcu_read_lock, "_ZL13rcu_read_lockv");

  -- * So where is rcu_write_lock()?  It does not exist, as there is no
  -- * way for writers to lock out RCU readers.  This is a feature, not
  -- * a bug -- this property is what provides RCU's performance benefits.
  -- * Of course, writers must coordinate with each other.  The normal
  -- * spinlock primitives work well for this, but any other technique may be
  -- * used as well.  RCU does not care how the writers keep out of each
  -- * others' way, as long as they do so.
  --  

  --*
  -- * rcu_read_unlock() - marks the end of an RCU read-side critical section.
  -- *
  -- * See rcu_read_lock() for more information.
  --  

   procedure rcu_read_unlock;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:863
   pragma Import (CPP, rcu_read_unlock, "_ZL15rcu_read_unlockv");

  --*
  -- * rcu_read_lock_bh() - mark the beginning of an RCU-bh critical section
  -- *
  -- * This is equivalent of rcu_read_lock(), but to be used when updates
  -- * are being done using call_rcu_bh() or synchronize_rcu_bh(). Since
  -- * both call_rcu_bh() and synchronize_rcu_bh() consider completion of a
  -- * softirq handler to be a quiescent state, a process in RCU read-side
  -- * critical section must be protected by disabling softirqs. Read-side
  -- * critical sections in interrupt context can use just rcu_read_lock(),
  -- * though this should at least be commented to avoid confusing people
  -- * reading the code.
  -- *
  -- * Note that rcu_read_lock_bh() and the matching rcu_read_unlock_bh()
  -- * must occur in the same context, for example, it is illegal to invoke
  -- * rcu_read_unlock_bh() from one task if the matching rcu_read_lock_bh()
  -- * was invoked from some other task.
  --  

   procedure rcu_read_lock_bh;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:889
   pragma Import (CPP, rcu_read_lock_bh, "_ZL16rcu_read_lock_bhv");

  -- * rcu_read_unlock_bh - marks the end of a softirq-only RCU critical section
  -- *
  -- * See rcu_read_lock_bh() for more information.
  --  

   procedure rcu_read_unlock_bh;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:903
   pragma Import (CPP, rcu_read_unlock_bh, "_ZL18rcu_read_unlock_bhv");

  --*
  -- * rcu_read_lock_sched() - mark the beginning of a RCU-sched critical section
  -- *
  -- * This is equivalent of rcu_read_lock(), but to be used when updates
  -- * are being done using call_rcu_sched() or synchronize_rcu_sched().
  -- * Read-side critical sections can also be introduced by anything that
  -- * disables preemption, including local_irq_disable() and friends.
  -- *
  -- * Note that rcu_read_lock_sched() and the matching rcu_read_unlock_sched()
  -- * must occur in the same context, for example, it is illegal to invoke
  -- * rcu_read_unlock_sched() from process context if the matching
  -- * rcu_read_lock_sched() was invoked from an NMI handler.
  --  

   procedure rcu_read_lock_sched;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:925
   pragma Import (CPP, rcu_read_lock_sched, "_ZL19rcu_read_lock_schedv");

  -- Used by lockdep and tracing: cannot be traced, cannot call lockdep.  
   procedure rcu_read_lock_sched_notrace;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:935
   pragma Import (CPP, rcu_read_lock_sched_notrace, "_ZL27rcu_read_lock_sched_notracev");

  -- * rcu_read_unlock_sched - marks the end of a RCU-classic critical section
  -- *
  -- * See rcu_read_lock_sched for more information.
  --  

   procedure rcu_read_unlock_sched;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:946
   pragma Import (CPP, rcu_read_unlock_sched, "_ZL21rcu_read_unlock_schedv");

  -- Used by lockdep and tracing: cannot be traced, cannot call lockdep.  
   procedure rcu_read_unlock_sched_notrace;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:956
   pragma Import (CPP, rcu_read_unlock_sched_notrace, "_ZL29rcu_read_unlock_sched_notracev");

  --*
  -- * RCU_INIT_POINTER() - initialize an RCU protected pointer
  -- *
  -- * Initialize an RCU-protected pointer in special cases where readers
  -- * do not need ordering constraints on the CPU or the compiler.  These
  -- * special cases are:
  -- *
  -- * 1.	This use of RCU_INIT_POINTER() is NULLing out the pointer -or-
  -- * 2.	The caller has taken whatever steps are required to prevent
  -- *	RCU readers from concurrently accessing this pointer -or-
  -- * 3.	The referenced data structure has already been exposed to
  -- *	readers either at compile time or via rcu_assign_pointer() -and-
  -- *	a.	You have not made -any- reader-visible changes to
  -- *		this structure since then -or-
  -- *	b.	It is OK for readers accessing this structure from its
  -- *		new location to see the old state of the structure.  (For
  -- *		example, the changes were to statistical counters or to
  -- *		other state where exact synchronization is not required.)
  -- *
  -- * Failure to follow these rules governing use of RCU_INIT_POINTER() will
  -- * result in impossible-to-diagnose memory corruption.  As in the structures
  -- * will look OK in crash dumps, but any concurrent RCU readers might
  -- * see pre-initialized values of the referenced data structure.  So
  -- * please be very careful how you use RCU_INIT_POINTER()!!!
  -- *
  -- * If you are creating an RCU-protected linked structure that is accessed
  -- * by a single external-to-structure RCU-protected pointer, then you may
  -- * use RCU_INIT_POINTER() to initialize the internal RCU-protected
  -- * pointers, but you must use rcu_assign_pointer() to initialize the
  -- * external-to-structure pointer -after- you have completely initialized
  -- * the reader-accessible portions of the linked structure.
  -- *
  -- * Note that unlike rcu_assign_pointer(), RCU_INIT_POINTER() provides no
  -- * ordering guarantees for either the CPU or the compiler.
  --  

  --*
  -- * RCU_POINTER_INITIALIZER() - statically initialize an RCU protected pointer
  -- *
  -- * GCC-style initialization for an RCU-protected pointer in a structure field.
  --  

  -- * Does the specified offset indicate that the corresponding rcu_head
  -- * structure can be handled by kfree_rcu()?
  --  

  -- * Helper macro for kfree_rcu() to prevent argument-expansion eyestrain.
  --  

  --*
  -- * kfree_rcu() - kfree an object after a grace period.
  -- * @ptr:	pointer to kfree
  -- * @rcu_head:	the name of the struct rcu_head within the type of @ptr.
  -- *
  -- * Many rcu callbacks functions just call kfree() on the base structure.
  -- * These functions are trivial, but their size adds up, and furthermore
  -- * when they are used in a kernel module, that module must invoke the
  -- * high-latency rcu_barrier() function at module-unload time.
  -- *
  -- * The kfree_rcu() function handles this issue.  Rather than encoding a
  -- * function address in the embedded rcu_head structure, kfree_rcu() instead
  -- * encodes the offset of the rcu_head structure within the base structure.
  -- * Because the functions are not allowed in the low-order 4096 bytes of
  -- * kernel virtual memory, offsets up to 4095 bytes can be accommodated.
  -- * If the offset is larger than 4095 bytes, a compile-time error will
  -- * be generated in __kfree_rcu().  If this error is triggered, you can
  -- * either fall back to use of call_rcu() or rearrange the structure to
  -- * position the rcu_head structure into the first 4096 bytes.
  -- *
  -- * Note that the allowable offset might decrease in the future, for example,
  -- * to allow something like kmem_cache_free_rcu().
  -- *
  -- * The BUILD_BUG_ON check must not involve any function calls, hence the
  -- * checks are done in macros here.
  --  

   function rcu_is_nocb_cpu (cpu : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:1067
   pragma Import (CPP, rcu_is_nocb_cpu, "_ZL15rcu_is_nocb_cpui");

  -- Only for use by adaptive-ticks code.  
   function rcu_sys_is_idle return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:1077
   pragma Import (CPP, rcu_sys_is_idle, "_ZL15rcu_sys_is_idlev");

   procedure rcu_sysidle_force_exit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcupdate.h:1082
   pragma Import (CPP, rcu_sysidle_force_exit, "_ZL22rcu_sysidle_force_exitv");

end linux_rcupdate_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_types_h;
with Interfaces.C.Extensions;

package linux_rcutree_h is

  -- * Read-Copy Update mechanism for mutual exclusion (tree-based version)
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
  -- * Copyright IBM Corporation, 2008
  -- *
  -- * Author: Dipankar Sarma <dipankar@in.ibm.com>
  -- *	   Paul E. McKenney <paulmck@linux.vnet.ibm.com> Hierarchical algorithm
  -- *
  -- * Based on the original work by Paul McKenney <paulmck@us.ibm.com>
  -- * and inputs from Rusty Russell, Andrea Arcangeli and Andi Kleen.
  -- *
  -- * For detailed explanation of Read-Copy Update mechanism see -
  -- *	Documentation/RCU
  --  

   procedure rcu_note_context_switch (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:33
   pragma Import (CPP, rcu_note_context_switch, "_Z23rcu_note_context_switchi");

   function rcu_needs_cpu (cpu : int; delta_jiffies : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:35
   pragma Import (CPP, rcu_needs_cpu, "_Z13rcu_needs_cpuiPm");

   procedure rcu_cpu_stall_reset;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:37
   pragma Import (CPP, rcu_cpu_stall_reset, "_Z19rcu_cpu_stall_resetv");

  -- * Note a virtualization-based context switch.  This is simply a
  -- * wrapper around rcu_note_context_switch(), which allows TINY_RCU
  -- * to save a few bytes.
  --  

   procedure rcu_virt_note_context_switch (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:44
   pragma Import (CPP, rcu_virt_note_context_switch, "_ZL28rcu_virt_note_context_switchi");

   procedure synchronize_rcu_bh;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:49
   pragma Import (CPP, synchronize_rcu_bh, "_Z18synchronize_rcu_bhv");

   procedure synchronize_sched_expedited;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:50
   pragma Import (CPP, synchronize_sched_expedited, "_Z27synchronize_sched_expeditedv");

   procedure synchronize_rcu_expedited;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:51
   pragma Import (CPP, synchronize_rcu_expedited, "_Z25synchronize_rcu_expeditedv");

   procedure kfree_call_rcu (head : access linux_types_h.callback_head; func : access procedure (arg1 : access linux_types_h.callback_head));  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:53
   pragma Import (CPP, kfree_call_rcu, "_Z14kfree_call_rcuP13callback_headPFvS0_E");

  --*
  -- * synchronize_rcu_bh_expedited - Brute-force RCU-bh grace period
  -- *
  -- * Wait for an RCU-bh grace period to elapse, but use a "big hammer"
  -- * approach to force the grace period to end quickly.  This consumes
  -- * significant time on all CPUs and is unfriendly to real-time workloads,
  -- * so is thus not recommended for any sort of common-case code.  In fact,
  -- * if you are using synchronize_rcu_bh_expedited() in a loop, please
  -- * restructure your code to batch your updates, and then use a single
  -- * synchronize_rcu_bh() instead.
  -- *
  -- * Note that it is illegal to call this function while holding any lock
  -- * that is acquired by a CPU-hotplug notifier.  And yes, it is also illegal
  -- * to call this function from a CPU-hotplug notifier.  Failing to observe
  -- * these restriction will result in deadlock.
  --  

   procedure synchronize_rcu_bh_expedited;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:71
   pragma Import (CPP, synchronize_rcu_bh_expedited, "_ZL28synchronize_rcu_bh_expeditedv");

   procedure rcu_barrier;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:76
   pragma Import (CPP, rcu_barrier, "_Z11rcu_barrierv");

   procedure rcu_barrier_bh;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:77
   pragma Import (CPP, rcu_barrier_bh, "_Z14rcu_barrier_bhv");

   procedure rcu_barrier_sched;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:78
   pragma Import (CPP, rcu_barrier_sched, "_Z17rcu_barrier_schedv");

   function get_state_synchronize_rcu return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:79
   pragma Import (CPP, get_state_synchronize_rcu, "_Z25get_state_synchronize_rcuv");

   procedure cond_synchronize_rcu (oldstate : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:80
   pragma Import (CPP, cond_synchronize_rcu, "_Z20cond_synchronize_rcum");

   rcutorture_testseq : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:82
   pragma Import (C, rcutorture_testseq, "rcutorture_testseq");

   rcutorture_vernum : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:83
   pragma Import (C, rcutorture_vernum, "rcutorture_vernum");

   function rcu_batches_completed return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:84
   pragma Import (CPP, rcu_batches_completed, "_Z21rcu_batches_completedv");

   function rcu_batches_completed_bh return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:85
   pragma Import (CPP, rcu_batches_completed_bh, "_Z24rcu_batches_completed_bhv");

   function rcu_batches_completed_sched return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:86
   pragma Import (CPP, rcu_batches_completed_sched, "_Z27rcu_batches_completed_schedv");

   procedure show_rcu_gp_kthreads;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:87
   pragma Import (CPP, show_rcu_gp_kthreads, "_Z20show_rcu_gp_kthreadsv");

   procedure rcu_force_quiescent_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:89
   pragma Import (CPP, rcu_force_quiescent_state, "_Z25rcu_force_quiescent_statev");

   procedure rcu_bh_force_quiescent_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:90
   pragma Import (CPP, rcu_bh_force_quiescent_state, "_Z28rcu_bh_force_quiescent_statev");

   procedure rcu_sched_force_quiescent_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:91
   pragma Import (CPP, rcu_sched_force_quiescent_state, "_Z31rcu_sched_force_quiescent_statev");

   procedure exit_rcu;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:93
   pragma Import (CPP, exit_rcu, "_Z8exit_rcuv");

   procedure rcu_scheduler_starting;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:95
   pragma Import (CPP, rcu_scheduler_starting, "_Z22rcu_scheduler_startingv");

   rcu_scheduler_active : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:96
   pragma Import (C, rcu_scheduler_active, "rcu_scheduler_active");

   function rcu_is_watching return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rcutree.h:98
   pragma Import (CPP, rcu_is_watching, "_Z15rcu_is_watchingv");

end linux_rcutree_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with System;
limited with linux_seq_file_h;
with linux_rwlock_types_h;
with linux_spinlock_types_h;
limited with asm_ptrace_h;
limited with linux_sysctl_h;
with linux_types_h;
with linux_mm_types_h;
limited with linux_fs_h;
with linux_signal_h;
with linux_wait_h;
with asm_generic_cputime_jiffies_h;
with Interfaces.C.Extensions;
with uapi_linux_resource_h;
with linux_hrtimer_h;
with linux_pid_h;
with linux_ktime_h;
with linux_task_io_accounting_h;
limited with uapi_linux_taskstats_h;
with linux_rwsem_h;
with linux_mutex_h;
with asm_generic_atomic_long_h;
limited with linux_key_h;
with linux_uidgid_h;
with uapi_linux_time_h;
with Interfaces.C.Strings;
with linux_cpumask_h;
with linux_rbtree_h;
with linux_llist_h;
with linux_plist_h;
limited with linux_completion_h;
limited with linux_cred_h;
with linux_sem_h;
with asm_processor_h;
limited with linux_nsproxy_h;
with asm_signal_h;
with linux_seccomp_h;
limited with uapi_asm_generic_siginfo_h;
with linux_nodemask_h;
with linux_seqlock_h;
limited with linux_cgroup_h;
limited with linux_compat_h;
limited with linux_uprobes_h;
with linux_personality_h;
with asm_thread_info_h;

package linux_sched_h is

   --  unsupported macro: SCHED_ATTR_SIZE_VER0 48
   --  unsupported macro: VMACACHE_BITS 2
   --  unsupported macro: VMACACHE_SIZE (1U << VMACACHE_BITS)
   --  unsupported macro: VMACACHE_MASK (VMACACHE_SIZE - 1)
   --  unsupported macro: FSHIFT 11
   --  unsupported macro: FIXED_1 (1<<FSHIFT)
   --  unsupported macro: LOAD_FREQ (5*HZ+1)
   --  unsupported macro: EXP_1 1884
   --  unsupported macro: EXP_5 2014
   --  unsupported macro: EXP_15 2037
   --  arg-macro: procedure CALC_LOAD load *= exp; load += n*(FIXED_1-exp); load >>= FSHIFT;
   --    load *= exp; load += n*(FIXED_1-exp); load >>= FSHIFT;
   --  unsupported macro: TASK_RUNNING 0
   --  unsupported macro: TASK_INTERRUPTIBLE 1
   --  unsupported macro: TASK_UNINTERRUPTIBLE 2
   --  unsupported macro: EXIT_DEAD 16
   --  unsupported macro: EXIT_ZOMBIE 32
   --  unsupported macro: EXIT_TRACE (EXIT_ZOMBIE | EXIT_DEAD)
   --  unsupported macro: TASK_DEAD 64
   --  unsupported macro: TASK_WAKEKILL 128
   --  unsupported macro: TASK_WAKING 256
   --  unsupported macro: TASK_PARKED 512
   --  unsupported macro: TASK_STATE_MAX 1024
   --  unsupported macro: TASK_STATE_TO_CHAR_STR "RSDTtXZxKWP"
   --  unsupported macro: TASK_KILLABLE (TASK_WAKEKILL | TASK_UNINTERRUPTIBLE)
   --  unsupported macro: TASK_STOPPED (TASK_WAKEKILL | __TASK_STOPPED)
   --  unsupported macro: TASK_TRACED (TASK_WAKEKILL | __TASK_TRACED)
   --  unsupported macro: TASK_NORMAL (TASK_INTERRUPTIBLE | TASK_UNINTERRUPTIBLE)
   --  unsupported macro: TASK_ALL (TASK_NORMAL | __TASK_STOPPED | __TASK_TRACED)
   --  unsupported macro: TASK_REPORT (TASK_RUNNING | TASK_INTERRUPTIBLE | TASK_UNINTERRUPTIBLE | __TASK_STOPPED | __TASK_TRACED | EXIT_ZOMBIE | EXIT_DEAD)
   --  arg-macro: function task_is_traced ((task.state and __TASK_TRACED) /= 0
   --    return (task.state and __TASK_TRACED) /= 0;
   --  arg-macro: function task_is_stopped ((task.state and __TASK_STOPPED) /= 0
   --    return (task.state and __TASK_STOPPED) /= 0;
   --  arg-macro: function task_is_stopped_or_traced ((task.state and (__TASK_STOPPED or __TASK_TRACED)) /= 0
   --    return (task.state and (__TASK_STOPPED or __TASK_TRACED)) /= 0;
   --  arg-macro: function task_contributes_to_load ((task.state and TASK_UNINTERRUPTIBLE) /= 0  and then  (task.flags and PF_FROZEN) = 0
   --    return (task.state and TASK_UNINTERRUPTIBLE) /= 0  and then  (task.flags and PF_FROZEN) = 0;
   --  arg-macro: procedure set_task_state set_mb((tsk).state, (state_value))
   --    set_mb((tsk).state, (state_value))
   --  arg-macro: procedure set_current_state set_mb(current.state, (state_value))
   --    set_mb(current.state, (state_value))
   --  unsupported macro: TASK_COMM_LEN 16
   --  unsupported macro: MAX_SCHEDULE_TIMEOUT LONG_MAX
   --  unsupported macro: SUID_DUMP_DISABLE 0
   --  unsupported macro: SUID_DUMP_USER 1
   --  unsupported macro: SUID_DUMP_ROOT 2
   --  unsupported macro: MMF_DUMPABLE_BITS 2
   --  unsupported macro: MMF_DUMPABLE_MASK ((1 << MMF_DUMPABLE_BITS) - 1)
   --  unsupported macro: MMF_DUMP_ANON_PRIVATE 2
   --  unsupported macro: MMF_DUMP_ANON_SHARED 3
   --  unsupported macro: MMF_DUMP_MAPPED_PRIVATE 4
   --  unsupported macro: MMF_DUMP_MAPPED_SHARED 5
   --  unsupported macro: MMF_DUMP_ELF_HEADERS 6
   --  unsupported macro: MMF_DUMP_HUGETLB_PRIVATE 7
   --  unsupported macro: MMF_DUMP_HUGETLB_SHARED 8
   --  unsupported macro: MMF_DUMP_FILTER_SHIFT MMF_DUMPABLE_BITS
   --  unsupported macro: MMF_DUMP_FILTER_BITS 7
   --  unsupported macro: MMF_DUMP_FILTER_MASK (((1 << MMF_DUMP_FILTER_BITS) - 1) << MMF_DUMP_FILTER_SHIFT)
   --  unsupported macro: MMF_DUMP_FILTER_DEFAULT ((1 << MMF_DUMP_ANON_PRIVATE) | (1 << MMF_DUMP_ANON_SHARED) | (1 << MMF_DUMP_HUGETLB_PRIVATE) | MMF_DUMP_MASK_DEFAULT_ELF)
   --  unsupported macro: MMF_DUMP_MASK_DEFAULT_ELF (1 << MMF_DUMP_ELF_HEADERS)
   --  unsupported macro: MMF_VM_MERGEABLE 16
   --  unsupported macro: MMF_VM_HUGEPAGE 17
   --  unsupported macro: MMF_EXE_FILE_CHANGED 18
   --  unsupported macro: MMF_HAS_UPROBES 19
   --  unsupported macro: MMF_RECALC_UPROBES 20
   --  unsupported macro: MMF_INIT_MASK (MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK)
   --  unsupported macro: prof_exp stime
   --  unsupported macro: virt_exp utime
   --  unsupported macro: sched_exp sum_exec_runtime
   --  unsupported macro: INIT_CPUTIME (struct task_cputime) { .utime = 0, .stime = 0, .sum_exec_runtime = 0, }
   --  unsupported macro: PREEMPT_DISABLED PREEMPT_ENABLED
   --  unsupported macro: INIT_PREEMPT_COUNT (PREEMPT_DISABLED + PREEMPT_ACTIVE)
   --  unsupported macro: SIGNAL_STOP_STOPPED 0x00000001
   --  unsupported macro: SIGNAL_STOP_CONTINUED 0x00000002
   --  unsupported macro: SIGNAL_GROUP_EXIT 0x00000004
   --  unsupported macro: SIGNAL_GROUP_COREDUMP 0x00000008
   --  unsupported macro: SIGNAL_CLD_STOPPED 0x00000010
   --  unsupported macro: SIGNAL_CLD_CONTINUED 0x00000020
   --  unsupported macro: SIGNAL_CLD_MASK (SIGNAL_CLD_STOPPED|SIGNAL_CLD_CONTINUED)
   --  unsupported macro: SIGNAL_UNKILLABLE 0x00000040
   --  unsupported macro: INIT_USER (&root_user)
   --  unsupported macro: SCHED_CAPACITY_SHIFT 10
   --  unsupported macro: SCHED_CAPACITY_SCALE (1L << SCHED_CAPACITY_SHIFT)
   --  unsupported macro: SD_LOAD_BALANCE 0x0001
   --  unsupported macro: SD_BALANCE_NEWIDLE 0x0002
   --  unsupported macro: SD_BALANCE_EXEC 0x0004
   --  unsupported macro: SD_BALANCE_FORK 0x0008
   --  unsupported macro: SD_BALANCE_WAKE 0x0010
   --  unsupported macro: SD_WAKE_AFFINE 0x0020
   --  unsupported macro: SD_SHARE_CPUCAPACITY 0x0080
   --  unsupported macro: SD_SHARE_POWERDOMAIN 0x0100
   --  unsupported macro: SD_SHARE_PKG_RESOURCES 0x0200
   --  unsupported macro: SD_SERIALIZE 0x0400
   --  unsupported macro: SD_ASYM_PACKING 0x0800
   --  unsupported macro: SD_PREFER_SIBLING 0x1000
   --  unsupported macro: SD_OVERLAP 0x2000
   --  unsupported macro: SD_NUMA 0x4000
   --  unsupported macro: SD_ATTR_INIT (struct sched_domain_attr) { .relax_domain_level = -1, }
   --  unsupported macro: SDTL_OVERLAP 0x01
   --  unsupported macro: SD_INIT_NAME(type) .name = #type
   --  arg-macro: function tsk_cpus_allowed (and(tsk).cpus_allowed
   --    return and(tsk).cpus_allowed;
   --  unsupported macro: TNF_MIGRATED 0x01
   --  unsupported macro: TNF_NO_GROUP 0x02
   --  unsupported macro: TNF_SHARED 0x04
   --  unsupported macro: TNF_FAULT_LOCAL 0x08
   --  arg-macro: procedure get_task_struct do { atomic_inc(and(tsk).usage); } while(0)
   --    do { atomic_inc(and(tsk).usage); } while(0)
   --  unsupported macro: PF_EXITING 0x00000004
   --  unsupported macro: PF_EXITPIDONE 0x00000008
   --  unsupported macro: PF_VCPU 0x00000010
   --  unsupported macro: PF_WQ_WORKER 0x00000020
   --  unsupported macro: PF_FORKNOEXEC 0x00000040
   --  unsupported macro: PF_MCE_PROCESS 0x00000080
   --  unsupported macro: PF_SUPERPRIV 0x00000100
   --  unsupported macro: PF_DUMPCORE 0x00000200
   --  unsupported macro: PF_SIGNALED 0x00000400
   --  unsupported macro: PF_MEMALLOC 0x00000800
   --  unsupported macro: PF_NPROC_EXCEEDED 0x00001000
   --  unsupported macro: PF_USED_MATH 0x00002000
   --  unsupported macro: PF_USED_ASYNC 0x00004000
   --  unsupported macro: PF_NOFREEZE 0x00008000
   --  unsupported macro: PF_FROZEN 0x00010000
   --  unsupported macro: PF_FSTRANS 0x00020000
   --  unsupported macro: PF_KSWAPD 0x00040000
   --  unsupported macro: PF_MEMALLOC_NOIO 0x00080000
   --  unsupported macro: PF_LESS_THROTTLE 0x00100000
   --  unsupported macro: PF_KTHREAD 0x00200000
   --  unsupported macro: PF_RANDOMIZE 0x00400000
   --  unsupported macro: PF_SWAPWRITE 0x00800000
   --  unsupported macro: PF_SPREAD_PAGE 0x01000000
   --  unsupported macro: PF_SPREAD_SLAB 0x02000000
   --  unsupported macro: PF_NO_SETAFFINITY 0x04000000
   --  unsupported macro: PF_MCE_EARLY 0x08000000
   --  unsupported macro: PF_MUTEX_TESTER 0x20000000
   --  unsupported macro: PF_FREEZER_SKIP 0x40000000
   --  unsupported macro: PF_SUSPEND_TASK 0x80000000
   --  arg-macro: procedure clear_stopped_child_used_math do { (child).flags &= ~PF_USED_MATH; } while (0)
   --    do { (child).flags &= ~PF_USED_MATH; } while (0)
   --  arg-macro: procedure set_stopped_child_used_math do { (child).flags |= PF_USED_MATH; } while (0)
   --    do { (child).flags |= PF_USED_MATH; } while (0)
   --  arg-macro: procedure clear_used_math clear_stopped_child_used_math(current)
   --    clear_stopped_child_used_math(current)
   --  arg-macro: procedure set_used_math set_stopped_child_used_math(current)
   --    set_stopped_child_used_math(current)
   --  arg-macro: procedure conditional_stopped_child_used_math do { (child).flags &= ~PF_USED_MATH, (child).flags |= (condition) ? PF_USED_MATH : 0; } while (0)
   --    do { (child).flags &= ~PF_USED_MATH, (child).flags |= (condition) ? PF_USED_MATH : 0; } while (0)
   --  arg-macro: procedure conditional_used_math conditional_stopped_child_used_math(condition, current)
   --    conditional_stopped_child_used_math(condition, current)
   --  arg-macro: procedure copy_to_stopped_child_used_math do { (child).flags &= ~PF_USED_MATH, (child).flags |= current.flags and PF_USED_MATH; } while (0)
   --    do { (child).flags &= ~PF_USED_MATH, (child).flags |= current.flags and PF_USED_MATH; } while (0)
   --  arg-macro: function tsk_used_math ((p).flags and PF_USED_MATH
   --    return (p).flags and PF_USED_MATH;
   --  arg-macro: procedure used_math tsk_used_math(current)
   --    tsk_used_math(current)
   --  unsupported macro: JOBCTL_STOP_SIGMASK 0xffff
   --  unsupported macro: JOBCTL_STOP_DEQUEUED_BIT 16
   --  unsupported macro: JOBCTL_STOP_PENDING_BIT 17
   --  unsupported macro: JOBCTL_STOP_CONSUME_BIT 18
   --  unsupported macro: JOBCTL_TRAP_STOP_BIT 19
   --  unsupported macro: JOBCTL_TRAP_NOTIFY_BIT 20
   --  unsupported macro: JOBCTL_TRAPPING_BIT 21
   --  unsupported macro: JOBCTL_LISTENING_BIT 22
   --  unsupported macro: JOBCTL_STOP_DEQUEUED (1 << JOBCTL_STOP_DEQUEUED_BIT)
   --  unsupported macro: JOBCTL_STOP_PENDING (1 << JOBCTL_STOP_PENDING_BIT)
   --  unsupported macro: JOBCTL_STOP_CONSUME (1 << JOBCTL_STOP_CONSUME_BIT)
   --  unsupported macro: JOBCTL_TRAP_STOP (1 << JOBCTL_TRAP_STOP_BIT)
   --  unsupported macro: JOBCTL_TRAP_NOTIFY (1 << JOBCTL_TRAP_NOTIFY_BIT)
   --  unsupported macro: JOBCTL_TRAPPING (1 << JOBCTL_TRAPPING_BIT)
   --  unsupported macro: JOBCTL_LISTENING (1 << JOBCTL_LISTENING_BIT)
   --  unsupported macro: JOBCTL_TRAP_MASK (JOBCTL_TRAP_STOP | JOBCTL_TRAP_NOTIFY)
   --  unsupported macro: JOBCTL_PENDING_MASK (JOBCTL_STOP_PENDING | JOBCTL_TRAP_MASK)
   --  unsupported macro: SEND_SIG_NOINFO ((struct siginfo *) 0)
   --  unsupported macro: SEND_SIG_PRIV ((struct siginfo *) 1)
   --  unsupported macro: SEND_SIG_FORCED ((struct siginfo *) 2)
   --  arg-macro: procedure next_task list_entry_rcu((p).tasks.next, struct task_struct, tasks)
   --    list_entry_rcu((p).tasks.next, struct task_struct, tasks)
   --  arg-macro: procedure for_each_process for (p := andinit_task ; (p := next_task(p)) /= andinit_task ; )
   --    for (p := andinit_task ; (p := next_task(p)) /= andinit_task ; )
   --  arg-macro: procedure do_each_thread for (g := t := andinit_task ; (g := t := next_task(g)) /= andinit_task ; ) do
   --    for (g := t := andinit_task ; (g := t := next_task(g)) /= andinit_task ; ) do
   --  arg-macro: procedure while_each_thread while ((t := next_thread(t)) /= g)
   --    while ((t := next_thread(t)) /= g)
   --  arg-macro: procedure for_each_thread __for_each_thread((p).signal, t)
   --    __for_each_thread((p).signal, t)
   --  arg-macro: procedure for_each_process_thread for_each_process(p) for_each_thread(p, t)
   --    for_each_process(p) for_each_thread(p, t)
   --  arg-macro: function delay_group_leader (thread_group_leader(p)  and then  notthread_group_empty(p)
   --    return thread_group_leader(p)  and then  notthread_group_empty(p);
   --  arg-macro: function task_thread_info ((struct thread_info *)(task).stack
   --    return (struct thread_info *)(task).stack;
   --  arg-macro: function task_stack_page ((task).stack
   --    return (task).stack;
   --  arg-macro: function cond_resched ({ __might_sleep(__FILE__, __LINE__, 0); _cond_resched(); }
   --    return { __might_sleep(__FILE__, __LINE__, 0); _cond_resched(); };
   --  unsupported macro: PREEMPT_LOCK_OFFSET 0
   --  arg-macro: function cond_resched_lock ({ __might_sleep(__FILE__, __LINE__, PREEMPT_LOCK_OFFSET); __cond_resched_lock(lock); }
   --    return { __might_sleep(__FILE__, __LINE__, PREEMPT_LOCK_OFFSET); __cond_resched_lock(lock); };
   --  arg-macro: function cond_resched_softirq ({ __might_sleep(__FILE__, __LINE__, SOFTIRQ_DISABLE_OFFSET); __cond_resched_softirq(); }
   --    return { __might_sleep(__FILE__, __LINE__, SOFTIRQ_DISABLE_OFFSET); __cond_resched_softirq(); };
   type sched_param is record
      sched_priority : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:10
   end record;
   pragma Convention (C_Pass_By_Copy, sched_param);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:9

  -- for HZ  
  -- * Extended scheduling parameters data structure.
  -- *
  -- * This is needed because the original struct sched_param can not be
  -- * altered without introducing ABI issues with legacy applications
  -- * (e.g., in sched_getparam()).
  -- *
  -- * However, the possibility of specifying more than just a priority for
  -- * the tasks may be useful for a wide variety of application fields, e.g.,
  -- * multimedia, streaming, automation and control, and many others.
  -- *
  -- * This variant (sched_attr) is meant at describing a so-called
  -- * sporadic time-constrained task. In such model a task is specified by:
  -- *  - the activation period or minimum instance inter-arrival time;
  -- *  - the maximum (or average, depending on the actual scheduling
  -- *    discipline) computation time of all instances, a.k.a. runtime;
  -- *  - the deadline (relative to the actual activation time) of each
  -- *    instance.
  -- * Very briefly, a periodic (sporadic) task asks for the execution of
  -- * some specific computation --which is typically called an instance--
  -- * (at most) every period. Moreover, each instance typically lasts no more
  -- * than the runtime and must be completed by time instant t equal to
  -- * the instance activation time + the deadline.
  -- *
  -- * This is reflected by the actual fields of the sched_attr structure:
  -- *
  -- *  @size		size of the structure, for fwd/bwd compat.
  -- *
  -- *  @sched_policy	task's scheduling policy
  -- *  @sched_flags	for customizing the scheduler behaviour
  -- *  @sched_nice		task's nice value      (SCHED_NORMAL/BATCH)
  -- *  @sched_priority	task's static priority (SCHED_FIFO/RR)
  -- *  @sched_deadline	representative of the task's deadline
  -- *  @sched_runtime	representative of the task's runtime
  -- *  @sched_period	representative of the task's period
  -- *
  -- * Given this task model, there are a multiplicity of scheduling algorithms
  -- * and policies, that can be used to ensure all the tasks will make their
  -- * timing constraints.
  -- *
  -- * As of now, the SCHED_DEADLINE policy (sched_dl scheduling class) is the
  -- * only user of this new interface. More information about the algorithm
  -- * available in the scheduling class file or in Documentation/.
  --  

   type sched_attr is record
      size : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:109
      sched_policy : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:111
      sched_flags : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:112
      sched_nice : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:115
      sched_priority : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:118
      sched_runtime : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:121
      sched_deadline : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:122
      sched_period : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:123
   end record;
   pragma Convention (C_Pass_By_Copy, sched_attr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:108

  -- SCHED_NORMAL, SCHED_BATCH  
  -- SCHED_FIFO, SCHED_RR  
  -- SCHED_DEADLINE  
   --  skipped empty struct futex_pi_state

   --  skipped empty struct robust_list_head

   --  skipped empty struct bio_list

   --  skipped empty struct fs_struct

   --  skipped empty struct perf_event_context

   --  skipped empty struct blk_plug

  -- * These are the constant used to fake the fixed-point load-average
  -- * counting. Some notes:
  -- *  - 11 bit fractions expand to 22 bits by the multiplies: this gives
  -- *    a load-average precision of 10 bits integer + 11 bits fractional
  -- *  - if you want to count load-averages more often, you need more
  -- *    precision, or rounding will get you. With 2-second counting freq,
  -- *    the EXP_n values would be 1981, 2034 and 2043 if still using only
  -- *    11 bit fractions.
  --  

  -- Load averages  
   avenrun : aliased array (size_t) of aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:149
   pragma Import (C, avenrun, "avenrun");

   procedure get_avenrun
     (loads : access unsigned_long;
      offset : unsigned_long;
      shift : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:150
   pragma Import (CPP, get_avenrun, "_Z11get_avenrunPmmi");

   total_forks : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:164
   pragma Import (C, total_forks, "total_forks");

   nr_threads : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:165
   pragma Import (C, nr_threads, "nr_threads");

   process_counts : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:166
   pragma Import (C, process_counts, "process_counts");

   function nr_processes return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:167
   pragma Import (CPP, nr_processes, "_Z12nr_processesv");

   function nr_running return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:168
   pragma Import (CPP, nr_running, "_Z10nr_runningv");

   function nr_iowait return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:169
   pragma Import (CPP, nr_iowait, "_Z9nr_iowaitv");

   function nr_iowait_cpu (cpu : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:170
   pragma Import (CPP, nr_iowait_cpu, "_Z13nr_iowait_cpui");

   function this_cpu_load return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:171
   pragma Import (CPP, this_cpu_load, "_Z13this_cpu_loadv");

   procedure calc_global_load (ticks : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:174
   pragma Import (CPP, calc_global_load, "_Z16calc_global_loadm");

   procedure update_cpu_load_nohz;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:175
   pragma Import (CPP, update_cpu_load_nohz, "_Z20update_cpu_load_nohzv");

   function get_parent_ip (addr : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:177
   pragma Import (CPP, get_parent_ip, "_Z13get_parent_ipm");

   procedure dump_cpu_task (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:179
   pragma Import (CPP, dump_cpu_task, "_Z13dump_cpu_taski");

   --  skipped empty struct cfs_rq

   --  skipped empty struct task_group

   procedure proc_sched_show_task (p : System.Address; m : access linux_seq_file_h.seq_file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:185
   pragma Import (CPP, proc_sched_show_task, "_Z20proc_sched_show_taskP11task_structP8seq_file");

   procedure proc_sched_set_task (p : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:186
   pragma Import (CPP, proc_sched_set_task, "_Z19proc_sched_set_taskP11task_struct");

   procedure print_cfs_rq
     (m : access linux_seq_file_h.seq_file;
      cpu : int;
      the_cfs_rq : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:188
   pragma Import (CPP, print_cfs_rq, "_Z12print_cfs_rqP8seq_fileiP6cfs_rq");

  -- * Task state bitmask. NOTE! These bits are also
  -- * encoded in fs/proc/array.c: get_task_state().
  -- *
  -- * We have two separate sets of flags: task->state
  -- * is about runnability, while task->exit_state are
  -- * about the task exiting. Confusing, but this way
  -- * modifying one set can't modify the other one by
  -- * mistake.
  --  

  -- in tsk->exit_state  
  -- in tsk->state again  
  -- Convenience macros for the sake of set_task_state  
  -- Convenience macros for the sake of wake_up  
  -- get_task_state()  
  -- * set_current_state() includes a barrier so that the write of current->state
  -- * is correctly serialised wrt the caller's subsequent test of whether to
  -- * actually sleep:
  -- *
  -- *	set_current_state(TASK_UNINTERRUPTIBLE);
  -- *	if (do_i_need_to_sleep())
  -- *		schedule();
  -- *
  -- * If the caller does not need such serialisation then use __set_current_state()
  --  

  -- Task command name length  
  -- * This serializes "schedule()" and also protects
  -- * the run-queue from deletions/modifications (but
  -- * _adding_ to the beginning of the run-queue has
  -- * a separate lock).
  --  

   tasklist_lock : aliased linux_rwlock_types_h.rwlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:276
   pragma Import (C, tasklist_lock, "tasklist_lock");

   mmlist_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:277
   pragma Import (C, mmlist_lock, "mmlist_lock");

   procedure sched_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:285
   pragma Import (CPP, sched_init, "_Z10sched_initv");

   procedure sched_init_smp;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:286
   pragma Import (CPP, sched_init_smp, "_Z14sched_init_smpv");

   procedure init_idle (idle : System.Address; cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:288
   pragma Import (CPP, init_idle, "_Z9init_idleP11task_structi");

   procedure init_idle_bootup_task (idle : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:289
   pragma Import (CPP, init_idle_bootup_task, "_Z21init_idle_bootup_taskP11task_struct");

   function runqueue_is_locked (cpu : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:291
   pragma Import (CPP, runqueue_is_locked, "_Z18runqueue_is_lockedi");

   procedure nohz_balance_enter_idle (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:294
   pragma Import (CPP, nohz_balance_enter_idle, "_Z23nohz_balance_enter_idlei");

   procedure set_cpu_sd_state_idle;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:295
   pragma Import (CPP, set_cpu_sd_state_idle, "_Z21set_cpu_sd_state_idlev");

   function get_nohz_timer_target (pinned : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:296
   pragma Import (CPP, get_nohz_timer_target, "_Z21get_nohz_timer_targeti");

  -- * Only dump TASK_* tasks. (0 for all tasks)
  --  

   procedure show_state_filter (state_filter : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:309
   pragma Import (CPP, show_state_filter, "_Z17show_state_filterm");

   procedure show_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:311
   pragma Import (CPP, show_state, "_ZL10show_statev");

   procedure show_regs (arg1 : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:316
   pragma Import (CPP, show_regs, "_Z9show_regsP7pt_regs");

  -- * TASK is a pointer to the task whose backtrace we want to see (or NULL for current
  -- * task), SP is the stack pointer of the first frame that should be shown in the back
  -- * trace (or NULL if the entire call-chain of the task should be shown).
  --  

   procedure show_stack (c_task : System.Address; sp : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:323
   pragma Import (CPP, show_stack, "_Z10show_stackP11task_structPm");

   procedure io_schedule;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:325
   pragma Import (CPP, io_schedule, "_Z11io_schedulev");

   function io_schedule_timeout (timeout : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:326
   pragma Import (CPP, io_schedule_timeout, "_Z19io_schedule_timeoutl");

   procedure cpu_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:328
   pragma Import (CPP, cpu_init, "_Z8cpu_initv");

   procedure trap_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:329
   pragma Import (CPP, trap_init, "_Z9trap_initv");

   procedure update_process_times (user : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:330
   pragma Import (CPP, update_process_times, "_Z20update_process_timesi");

   procedure scheduler_tick;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:331
   pragma Import (CPP, scheduler_tick, "_Z14scheduler_tickv");

   procedure sched_show_task (p : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:333
   pragma Import (CPP, sched_show_task, "_Z15sched_show_taskP11task_struct");

   procedure touch_softlockup_watchdog;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:336
   pragma Import (CPP, touch_softlockup_watchdog, "_Z25touch_softlockup_watchdogv");

   procedure touch_softlockup_watchdog_sync;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:337
   pragma Import (CPP, touch_softlockup_watchdog_sync, "_Z30touch_softlockup_watchdog_syncv");

   procedure touch_all_softlockup_watchdogs;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:338
   pragma Import (CPP, touch_all_softlockup_watchdogs, "_Z30touch_all_softlockup_watchdogsv");

   function proc_dowatchdog_thresh
     (table : access linux_sysctl_h.ctl_table;
      write : int;
      buffer : System.Address;
      lenp : access linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:339
   pragma Import (CPP, proc_dowatchdog_thresh, "_Z22proc_dowatchdog_threshP9ctl_tableiPvPmPx");

   softlockup_panic : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:342
   pragma Import (C, softlockup_panic, "softlockup_panic");

   procedure lockup_detector_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:343
   pragma Import (CPP, lockup_detector_init, "_Z20lockup_detector_initv");

   procedure reset_hung_task_detector;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:360
   pragma Import (CPP, reset_hung_task_detector, "_Z24reset_hung_task_detectorv");

  -- Attach to any functions which should be ignored in wchan output.  
  -- Linker adds these: start and end of __sched functions  
  -- Is this address in the __sched functions?  
   function in_sched_functions (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:374
   pragma Import (CPP, in_sched_functions, "_Z18in_sched_functionsm");

   function schedule_timeout (timeout : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:377
   pragma Import (CPP, schedule_timeout, "_Z16schedule_timeoutl");

   function schedule_timeout_interruptible (timeout : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:378
   pragma Import (CPP, schedule_timeout_interruptible, "_Z30schedule_timeout_interruptiblel");

   function schedule_timeout_killable (timeout : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:379
   pragma Import (CPP, schedule_timeout_killable, "_Z25schedule_timeout_killablel");

   function schedule_timeout_uninterruptible (timeout : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:380
   pragma Import (CPP, schedule_timeout_uninterruptible, "_Z32schedule_timeout_uninterruptiblel");

   procedure schedule;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:381
   pragma Import (C, schedule, "schedule");

   procedure schedule_preempt_disabled;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:382
   pragma Import (CPP, schedule_preempt_disabled, "_Z25schedule_preempt_disabledv");

   procedure arch_pick_mmap_layout (mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:388
   pragma Import (CPP, arch_pick_mmap_layout, "_Z21arch_pick_mmap_layoutP9mm_struct");

   function arch_get_unmapped_area
     (arg1 : access linux_fs_h.file;
      arg2 : unsigned_long;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:390
   pragma Import (CPP, arch_get_unmapped_area, "_Z22arch_get_unmapped_areaP4filemmmm");

   function arch_get_unmapped_area_topdown
     (filp : access linux_fs_h.file;
      addr : unsigned_long;
      len : unsigned_long;
      pgoff : unsigned_long;
      flags : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:393
   pragma Import (CPP, arch_get_unmapped_area_topdown, "_Z30arch_get_unmapped_area_topdownP4filemmmm");

  -- mm flags  
  -- for SUID_DUMP_* above  
   procedure set_dumpable (mm : access linux_mm_types_h.mm_struct; value : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:410
   pragma Import (CPP, set_dumpable, "_Z12set_dumpableP9mm_structi");

  -- * This returns the actual value of the suid_dumpable flag. For things
  -- * that are using this for checking for privilege transitions, it must
  -- * test against SUID_DUMP_USER rather than treating it as a boolean
  -- * value.
  --  

   --  skipped func __get_dumpable

   function get_dumpable (mm : access linux_mm_types_h.mm_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:422
   pragma Import (CPP, get_dumpable, "_ZL12get_dumpableP9mm_struct");

  -- coredump filter bits  
  -- leave room for more dump flags  
   type sighand_struct_action_array is array (0 .. 63) of aliased linux_signal_h.k_sigaction;
   type sighand_struct is record
      count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:460
      action : aliased sighand_struct_action_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:461
      siglock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:462
      signalfd_wqh : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:463
   end record;
   pragma Convention (C_Pass_By_Copy, sighand_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:459

   type pacct_struct is record
      ac_flag : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:467
      ac_exitcode : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:468
      ac_mem : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:469
      ac_utime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:470
      ac_stime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:470
      ac_minflt : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:471
      ac_majflt : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:471
   end record;
   pragma Convention (C_Pass_By_Copy, pacct_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:466

   type cpu_itimer is record
      expires : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:475
      incr : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:476
      error : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:477
      incr_error : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:478
   end record;
   pragma Convention (C_Pass_By_Copy, cpu_itimer);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:474

  --*
  -- * struct cputime - snaphsot of system and user cputime
  -- * @utime: time spent in user mode
  -- * @stime: time spent in system mode
  -- *
  -- * Gathers a generic snapshot of user and system time.
  --  

   type cputime is record
      utime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:489
      stime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:490
   end record;
   pragma Convention (C_Pass_By_Copy, cputime);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:488

  --*
  -- * struct task_cputime - collected CPU time counts
  -- * @utime:		time spent in user mode, in &cputime_t units
  -- * @stime:		time spent in kernel mode, in &cputime_t units
  -- * @sum_exec_runtime:	total time spent on the CPU, in nanoseconds
  -- *
  -- * This is an extension of struct cputime that includes the total runtime
  -- * spent by the task from the scheduler point of view.
  -- *
  -- * As a result, this structure groups together three kinds of CPU time
  -- * that are tracked for threads and thread groups.  Most things considering
  -- * CPU time want to group these counts together and treat all three
  -- * of them in parallel.
  --  

   type task_cputime is record
      utime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:508
      stime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:509
      sum_exec_runtime : aliased Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:510
   end record;
   pragma Convention (C_Pass_By_Copy, task_cputime);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:507

  -- Alternate field names when used to cache expirations.  
  -- * Disable preemption until the scheduler is running.
  -- * Reset by start_kernel()->sched_init()->init_idle().
  -- *
  -- * We include PREEMPT_ACTIVE to avoid cond_resched() from working
  -- * before the scheduler is active -- see should_resched().
  --  

  --*
  -- * struct thread_group_cputimer - thread group interval timer counts
  -- * @cputime:		thread group interval timers.
  -- * @running:		non-zero when there are timers running and
  -- * 			@cputime receives updates.
  -- * @lock:		lock for fields in this struct.
  -- *
  -- * This structure contains the version of task_cputime, above, that is
  -- * used for thread group CPU timer calculations.
  --  

   type thread_group_cputimer is record
      cputime : aliased task_cputime;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:550
      running : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:551
      lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:552
   end record;
   pragma Convention (C_Pass_By_Copy, thread_group_cputimer);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:549

   --  skipped empty struct autogroup

  -- * NOTE! "signal_struct" does not have its own
  -- * locking, because a shared signal_struct always
  -- * implies a shared sighand_struct, so locking
  -- * sighand_struct is always a proper superset of
  -- * the locking of signal_struct.
  --  

   type task_struct;
   type signal_struct_it_array is array (0 .. 1) of aliased cpu_itimer;
   type signal_struct_cpu_timers_array is array (0 .. 2) of aliased linux_types_h.list_head;
   type signal_struct_rlim_array is array (0 .. 15) of aliased uapi_linux_resource_h.rlimit;
   type signal_struct is record
      sigcnt : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:566
      live : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:567
      nr_threads : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:568
      thread_head : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:569
      wait_chldexit : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:571
      curr_target : access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:574
      shared_pending : aliased linux_signal_h.sigpending;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:577
      group_exit_code : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:580
      notify_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:586
      group_exit_task : access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:587
      group_stop_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:590
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:591
      is_child_subreaper : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:602
      has_child_subreaper : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:603
      posix_timer_id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:606
      posix_timers : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:607
      real_timer : aliased linux_hrtimer_h.hrtimer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:610
      leader_pid : access linux_pid_h.pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:611
      it_real_incr : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:612
      it : aliased signal_struct_it_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:619
      cputimer : aliased thread_group_cputimer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:625
      cputime_expires : aliased task_cputime;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:628
      cpu_timers : aliased signal_struct_cpu_timers_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:630
      tty_old_pgrp : access linux_pid_h.pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:632
      leader : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:635
      tty : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:637
      the_autogroup : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:640
      utime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:648
      stime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:648
      cutime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:648
      cstime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:648
      gtime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:649
      cgtime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:650
      prev_cputime : aliased cputime;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:652
      nvcsw : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:654
      nivcsw : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:654
      cnvcsw : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:654
      cnivcsw : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:654
      min_flt : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:655
      maj_flt : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:655
      cmin_flt : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:655
      cmaj_flt : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:655
      inblock : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:656
      oublock : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:656
      cinblock : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:656
      coublock : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:656
      maxrss : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:657
      cmaxrss : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:657
      ioac : aliased linux_task_io_accounting_h.task_io_accounting;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:658
      sum_sched_runtime : aliased Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:666
      rlim : aliased signal_struct_rlim_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:677
      pacct : aliased pacct_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:680
      stats : access uapi_linux_taskstats_h.taskstats;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:683
      audit_tty : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:686
      audit_tty_log_passwd : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:687
      the_tty_audit_buf : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:688
      group_rwsem : aliased linux_rwsem_h.rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:700
      oom_flags : aliased linux_types_h.oom_flags_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:703
      oom_score_adj : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:704
      oom_score_adj_min : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:705
      cred_guard_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:708
   end record;
   pragma Convention (C_Pass_By_Copy, signal_struct);
   pragma Pack (signal_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:565

  -- for wait4()  
  -- current thread group signal load-balancing target:  
  -- shared signal handling:  
  -- thread group exit support  
  -- overloaded:
  --	 * - notify group_exit_task when ->count is equal to notify_count
  --	 * - everyone except group_exit_task is stopped during signal delivery
  --	 *   of fatal signals, group_exit_task processes the signal.
  --	  

  -- thread group stop support, overloads group_exit_code too  
  -- see SIGNAL_* flags below  
  --	 * PR_SET_CHILD_SUBREAPER marks a process, like a service
  --	 * manager, to re-parent orphan (double-forking) child processes
  --	 * to this process instead of 'init'. The service manager is
  --	 * able to receive SIGCHLD signals and is able to investigate
  --	 * the process until it calls wait(). All children of this
  --	 * process will inherit a flag if they should look for a
  --	 * child_subreaper process at exit.
  --	  

  -- POSIX.1b Interval Timers  
  -- ITIMER_REAL timer for the process  
  --	 * ITIMER_PROF and ITIMER_VIRTUAL timers for the process, we use
  --	 * CPUCLOCK_PROF and CPUCLOCK_VIRT for indexing array as these
  --	 * values are defined to 0 and 1 respectively
  --	  

  --	 * Thread group totals for process CPU timers.
  --	 * See thread_group_cputimer(), et al, for details.
  --	  

  -- Earliest-expiration cache.  
  -- boolean value for session group leader  
  -- NULL if no tty  
   --  skipped empty struct tty_struct

  --	 * Cumulative resource counters for dead threads in the group,
  --	 * and for reaped dead child processes forked by this group.
  --	 * Live threads maintain their own counters and add to these
  --	 * in __exit_signal, except for the group leader.
  --	  

  --	 * Cumulative ns of schedule CPU time fo dead threads in the
  --	 * group, not including a zombie group leader, (This only differs
  --	 * from jiffies_to_ns(utime + stime) if sched_clock uses something
  --	 * other than jiffies.)
  --	  

  --	 * We don't bother to synchronize most readers of this at all,
  --	 * because there is no reader checking a limit that actually needs
  --	 * to get both rlim_cur and rlim_max atomically, and either one
  --	 * alone is a single word that can safely be read normally.
  --	 * getrlimit/setrlimit use task_lock(current->group_leader) to
  --	 * protect this instead of the siglock, because they really
  --	 * have no need to disable irqs.
  --	  

  -- per-process accounting information  
   --  skipped empty struct tty_audit_buf

  --	 * group_rwsem prevents new tasks from entering the threadgroup and
  --	 * member tasks from exiting,a more specifically, setting of
  --	 * PF_EXITING.  fork and exit paths are protected with this rwsem
  --	 * using threadgroup_change_begin/end().  Users which require
  --	 * threadgroup to remain stable should use threadgroup_[un]lock()
  --	 * which also takes care of exec path.  Currently, cgroup is the
  --	 * only user.
  --	  

  -- OOM kill score adjustment  
  -- OOM kill score adjustment min value.
  --					 * Only settable by CAP_SYS_RESOURCE.  

  -- guard against foreign influences on
  --					 * credential calculations
  --					 * (notably. ptrace)  

  -- * Bits in flags field of signal_struct.
  --  

  -- * Pending notifications to parent.
  --  

  -- If true, all threads except ->group_exit_task have pending SIGKILL  
   function signal_group_exit (sig : access constant signal_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:730
   pragma Import (CPP, signal_group_exit, "_ZL17signal_group_exitPK13signal_struct");

  -- * Some day this will be a full-fledged user tracking system..
  --  

  -- reference count  
   type user_struct is record
      uu_count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:740
      processes : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:741
      sigpending : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:742
      inotify_watches : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:744
      inotify_devs : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:745
      fanotify_listeners : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:748
      epoll_watches : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:751
      mq_bytes : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:755
      locked_shm : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:757
      uid_keyring : access linux_key_h.key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:760
      session_keyring : access linux_key_h.key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:761
      uidhash_node : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:765
      uid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:766
      locked_vm : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:769
   end record;
   pragma Convention (C_Pass_By_Copy, user_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:739

  -- How many processes does this user have?  
  -- How many pending signals does this user have?  
  -- How many inotify watches does this user have?  
  -- How many inotify devs does this user have opened?  
  -- The number of file descriptors currently watched  
  -- protected by mq_lock	 
  -- How many bytes can be allocated to mqueue?  
  -- How many pages of mlocked shm ?  
  -- UID specific keyring  
  -- UID's default session keyring  
  -- Hash table maintenance information  
   function uids_sysfs_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:773
   pragma Import (CPP, uids_sysfs_init, "_Z15uids_sysfs_initv");

   function find_user (arg1 : linux_uidgid_h.kuid_t) return access user_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:775
   pragma Import (CPP, find_user, "_Z9find_user6kuid_t");

   root_user : aliased user_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:777
   pragma Import (C, root_user, "root_user");

   --  skipped empty struct reclaim_state

  -- cumulative counters  
  -- # of times run on this cpu  
   type sched_info is record
      pcount : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:787
      run_delay : aliased Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:788
      last_arrival : aliased Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:791
      last_queued : aliased Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:792
   end record;
   pragma Convention (C_Pass_By_Copy, sched_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:785

  -- time spent waiting on a runqueue  
  -- timestamps  
  -- when we last ran on a cpu  
  -- when we were last queued to run  
   type task_delay_info is record
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:798
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:799
      blkio_start : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:816
      blkio_end : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:816
      blkio_delay : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:817
      swapin_delay : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:818
      blkio_count : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:819
      swapin_count : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:821
      freepages_start : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:824
      freepages_end : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:824
      freepages_delay : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:825
      freepages_count : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:826
   end record;
   pragma Convention (C_Pass_By_Copy, task_delay_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:797

  -- Private per-task flags  
  -- For each stat XXX, add following, aligned appropriately
  --	 *
  --	 * struct timespec XXX_start, XXX_end;
  --	 * u64 XXX_delay;
  --	 * u32 XXX_count;
  --	 *
  --	 * Atomicity of updates to XXX_delay, XXX_count protected by
  --	 * single lock above (split into XXX_lock if contention is an issue).
  --	  

  --	 * XXX_count is incremented on every XXX operation, the delay
  --	 * associated with the operation is added to XXX_delay.
  --	 * XXX_delay contains the accumulated delay time in nanoseconds.
  --	  

  -- Shared by blkio, swapin  
  -- wait for sync block io completion  
  -- wait for swapin block io completion  
  -- total count of the number of sync block  
  -- io operations performed  
  -- total count of the number of swapin block  
  -- io operations performed  
  -- wait for memory reclaim  
  -- total count of memory reclaim  
   function sched_info_on return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:830
   pragma Import (CPP, sched_info_on, "_ZL13sched_info_onv");

   type cpu_idle_type is 
     (CPU_IDLE,
      CPU_NOT_IDLE,
      CPU_NEWLY_IDLE,
      CPU_MAX_IDLE_TYPES);
   pragma Convention (C, cpu_idle_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:842

  -- * Increase resolution of cpu_capacity calculations
  --  

  -- * sched-domains (multiprocessor balancing) declarations:
  --  

   function cpu_smt_flags return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:875
   pragma Import (CPP, cpu_smt_flags, "_ZL13cpu_smt_flagsv");

   function cpu_core_flags return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:882
   pragma Import (CPP, cpu_core_flags, "_ZL14cpu_core_flagsv");

   function cpu_numa_flags return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:889
   pragma Import (CPP, cpu_numa_flags, "_ZL14cpu_numa_flagsv");

   type sched_domain_attr is record
      relax_domain_level : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:896
   end record;
   pragma Convention (C_Pass_By_Copy, sched_domain_attr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:895

   sched_domain_level_max : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:903
   pragma Import (C, sched_domain_level_max, "sched_domain_level_max");

   --  skipped empty struct sched_group

  -- These fields must be setup  
  -- top domain must be null terminated  
   type sched_domain_span_array is array (0 .. -1) of aliased unsigned_long;
   type anon_281 (discr : unsigned := 0) is record
      case discr is
         when others =>
            rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:973
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_281);
   pragma Unchecked_Union (anon_281);
   type sched_domain is record
      parent : access sched_domain;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:909
      child : access sched_domain;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:910
      groups : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:911
      min_interval : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:912
      max_interval : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:913
      busy_factor : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:914
      imbalance_pct : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:915
      cache_nice_tries : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:916
      busy_idx : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:917
      idle_idx : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:918
      newidle_idx : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:919
      wake_idx : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:920
      forkexec_idx : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:921
      smt_gain : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:922
      nohz_idle : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:924
      flags : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:925
      level : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:926
      last_balance : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:929
      balance_interval : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:930
      nr_balance_failed : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:931
      max_newidle_lb_cost : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:934
      next_decay_max_lb_cost : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:935
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:969
      field_24 : aliased anon_281;
      span_weight : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:976
      span : aliased sched_domain_span_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:984
   end record;
   pragma Convention (C_Pass_By_Copy, sched_domain);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:907

  -- bottom domain must be null terminated  
  -- the balancing groups of the domain  
  -- Minimum balance interval ms  
  -- Maximum balance interval ms  
  -- less balancing by factor if busy  
  -- No balance until over watermark  
  -- Leave cache hot tasks for # tries  
  -- NOHZ IDLE status  
  -- See SD_*  
  -- Runtime fields.  
  -- init to jiffies. units in jiffies  
  -- initialise to 1. units in ms.  
  -- initialise to 0  
  -- idle_balance() stats  
  -- load_balance() stats  
  -- Active load balancing  
  -- SD_BALANCE_EXEC stats  
  -- SD_BALANCE_FORK stats  
  -- try_to_wake_up() stats  
  -- used during construction  
  -- used during destruction  
  --	 * Span of all CPUs in this domain.
  --	 *
  --	 * NOTE: this field is variable length. (Allocated dynamically
  --	 * by attaching extra space to the end of the structure,
  --	 * depending on how many CPUs the kernel has booted up with)
  --	  

   function sched_domain_span (sd : access sched_domain) return access linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:987
   pragma Import (CPP, sched_domain_span, "_ZL17sched_domain_spanP12sched_domain");

   procedure partition_sched_domains
     (ndoms_new : int;
      doms_new : access linux_cpumask_h.cpumask_var_t;
      dattr_new : access sched_domain_attr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:992
   pragma Import (CPP, partition_sched_domains, "_Z23partition_sched_domainsiPA1_7cpumaskP17sched_domain_attr");

  -- Allocate an array of sched domains, for partition_sched_domains().  
   function alloc_sched_domains (ndoms : unsigned) return access linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:996
   pragma Import (CPP, alloc_sched_domains, "_Z19alloc_sched_domainsj");

   procedure free_sched_domains (doms : access linux_cpumask_h.cpumask_var_t; ndoms : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:997
   pragma Import (CPP, free_sched_domains, "_Z18free_sched_domainsPA1_7cpumaskj");

   function cpus_share_cache (this_cpu : int; that_cpu : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:999
   pragma Import (CPP, cpus_share_cache, "_Z16cpus_share_cacheii");

   type sched_domain_mask_f is access function (arg1 : int) return access constant linux_cpumask_h.cpumask;
   pragma Convention (C, sched_domain_mask_f);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1001

   type sched_domain_flags_f is access function return int;
   pragma Convention (C, sched_domain_flags_f);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1002

   type sd_data is record
      sd : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1007
      sg : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1008
      sgc : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1009
   end record;
   pragma Convention (C_Pass_By_Copy, sd_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1006

   --  skipped empty struct sched_group_capacity

   type sched_domain_topology_level is record
      mask : sched_domain_mask_f;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1013
      sd_flags : sched_domain_flags_f;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1014
      flags : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1015
      numa_level : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1016
      data : aliased sd_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1017
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1019
   end record;
   pragma Convention (C_Pass_By_Copy, sched_domain_topology_level);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1012

   sched_domain_topology : access sched_domain_topology_level;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1023
   pragma Import (C, sched_domain_topology, "sched_domain_topology");

   procedure set_sched_topology (tl : access sched_domain_topology_level);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1025
   pragma Import (CPP, set_sched_topology, "_Z18set_sched_topologyP27sched_domain_topology_level");

  -- See blkdev.h  
   procedure prefetch_stack (t : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1057
   pragma Import (CPP, prefetch_stack, "_ZL14prefetch_stackP11task_struct");

  -- See audit.c  
   --  skipped empty struct uts_namespace

   type load_weight is record
      weight : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1066
      inv_weight : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1067
   end record;
   pragma Convention (C_Pass_By_Copy, load_weight);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1065

  --	 * These sums represent an infinite geometric series and so are bound
  --	 * above by 1024/(1-y).  Thus we only need a u32 to store them for all
  --	 * choices of y < 1-2^(-32)*1024.
  --	  

   type sched_avg is record
      runnable_avg_sum : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1076
      runnable_avg_period : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1076
      last_runnable_update : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1077
      decay_count : aliased asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1078
      load_avg_contrib : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1079
   end record;
   pragma Convention (C_Pass_By_Copy, sched_avg);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1070

  -- for load-balancing  
   type sched_entity is record
      load : aliased load_weight;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1119
      run_node : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1120
      group_node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1121
      on_rq : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1122
      exec_start : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1124
      sum_exec_runtime : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1125
      vruntime : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1126
      prev_sum_exec_runtime : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1127
      nr_migrations : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1129
      depth : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1136
      parent : access sched_entity;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1137
      the_cfs_rq : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1139
      my_q : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1141
      avg : aliased sched_avg;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1146
   end record;
   pragma Convention (C_Pass_By_Copy, sched_entity);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1118

  -- rq on which this entity is (to be) queued:  
  -- rq "owned" by this entity/group:  
  -- Per-entity load-tracking  
   type sched_rt_entity is record
      run_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1151
      timeout : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1152
      watchdog_stamp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1153
      time_slice : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1154
      back : access sched_rt_entity;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1156
   end record;
   pragma Convention (C_Pass_By_Copy, sched_rt_entity);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1150

  -- rq on which this entity is (to be) queued:  
  -- rq "owned" by this entity/group:  
   type sched_dl_entity is record
      the_rb_node : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1167
      dl_runtime : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1174
      dl_deadline : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1175
      dl_period : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1176
      dl_bw : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1177
      runtime : aliased asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1184
      deadline : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1185
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1186
      dl_throttled : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1206
      dl_new : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1206
      dl_boosted : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1206
      dl_yielded : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1206
      dl_timer : aliased linux_hrtimer_h.hrtimer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1212
   end record;
   pragma Convention (C_Pass_By_Copy, sched_dl_entity);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1166

  --	 * Original scheduling parameters. Copied here from sched_attr
  --	 * during sched_setattr(), they will remain the same until
  --	 * the next sched_setattr().
  --	  

  -- maximum runtime for each instance	 
  -- relative deadline of each instance	 
  -- separation of two instances (period)  
  -- dl_runtime / dl_deadline		 
  --	 * Actual scheduling parameters. Initialized with the values above,
  --	 * they are continously updated during task execution. Note that
  --	 * the remaining runtime could be < 0 in case we are in overrun.
  --	  

  -- remaining runtime for this instance	 
  -- absolute deadline for this instance	 
  -- specifying the scheduler behaviour	 
  --	 * Some bool flags:
  --	 *
  --	 * @dl_throttled tells if we exhausted the runtime. If so, the
  --	 * task has to wait for a replenishment to be performed at the
  --	 * next firing of dl_timer.
  --	 *
  --	 * @dl_new tells if a new instance arrived. If so we must
  --	 * start executing it with full runtime and reset its absolute
  --	 * deadline;
  --	 *
  --	 * @dl_boosted tells if we are boosted due to DI. If so we are
  --	 * outside bandwidth enforcement mechanism (but only until we
  --	 * exit the critical section);
  --	 *
  --	 * @dl_yielded tells if task gave up the cpu before consuming
  --	 * all its available runtime during the last job.
  --	  

  --	 * Bandwidth enforcement timer. Each -deadline task has its
  --	 * own bandwidth to be enforced, thus we need one timer per task.
  --	  

   --  skipped empty struct rcu_node

   subtype perf_event_task_context is unsigned;
   perf_invalid_context : constant perf_event_task_context := -1;
   perf_hw_context : constant perf_event_task_context := 0;
   perf_sw_context : constant perf_event_task_context := 1;
   perf_nr_task_contexts : constant perf_event_task_context := 2;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1217

  -- -1 unrunnable, 0 runnable, >0 stopped  
  -- per process flags, defined below  
   --  skipped empty struct sched_class

  -- list of struct preempt_notifier:  
  -- per-thread vma caching  
  -- task state  
  --  The signal sent when the parent dies   
  -- JOBCTL_*, siglock protected  
  -- Used for emulating ABI behavior of previous Linux versions  
  -- Tell the LSMs that the process is doing an
  --				 * execve  

  -- task may not gain privileges  
  -- Revert to default priority/policy when forking  
  -- Canary value for the -fstack-protector gcc feature  
  --	 * pointers to (original) parent process, youngest child, younger sibling,
  --	 * older sibling, respectively.  (p->father can be replaced with
  --	 * p->real_parent->pid)
  --	  

  -- real parent process  
  -- recipient of SIGCHLD, wait4() reports  
  --	 * children/sibling forms the list of my natural children
  --	  

  -- list of my children  
  -- linkage in my parent's children list  
  -- threadgroup leader  
  --	 * ptraced is the list of tasks this task is using ptrace on.
  --	 * This includes both natural children and PTRACE_ATTACH targets.
  --	 * p->ptrace_entry is p's link on the p->parent->ptraced list.
  --	  

  -- PID/PID hash table linkage.  
  -- for vfork()  
  -- CLONE_CHILD_SETTID  
  -- CLONE_CHILD_CLEARTID  
  -- context switch counts  
  -- monotonic time  
  -- boot based time  
  -- mm fault and swap info: this can arguably be seen as either mm-specific or thread-specific  
  -- process credentials  
  -- objective and real subjective task
  --					 * credentials (COW)  

  -- effective (overridable) subjective task
  --					 * credentials (COW)  

  -- executable name excluding path
  --				     - access with [gs]et_task_comm (which lock
  --				       it with task_lock())
  --				     - initialized normally by setup_new_exec  

  -- file system info  
  -- ipc stuff  
  -- hung task detection  
  -- CPU-specific state of this task  
  -- filesystem information  
  -- open file information  
  -- namespaces  
  -- signal handlers  
  -- restored if set_restore_sigmask() was used  
  -- Thread group tracking  
  -- Protection of (de-)allocation: mm, files, fs, tty, keyrings, mems_allowed,
  -- * mempolicy  

  -- Protection of the PI data structures:  
  -- PI waiters blocked on a rt_mutex held by this task  
  -- Deadlock detection and priority inheritance handling  
  -- Top pi_waiters task  
  -- mutex deadlock detection  
  -- journalling filesystem info  
  -- stacked block device info  
  -- stack plugging  
  -- VM state  
  -- For ptrace use.   
  -- accumulated rss usage  
  -- accumulated virtual memory usage  
  -- stime + utime since last update  
  -- Protected by alloc_lock  
  -- Seqence no to catch updates  
  -- Control Group info protected by css_set_lock  
  -- cg_list protected by css_set_lock and tsk->alloc_lock  
  -- Protected by alloc_lock  
  -- migration stamp   
   --  skipped empty struct numa_group

  --	 * Exponential decaying average of faults on a per-node basis.
  --	 * Scheduling placement decisions are made based on the these counts.
  --	 * The values remain static for the duration of a PTE scan
  --	  

  --	 * numa_faults_buffer records faults per node during the current
  --	 * scan window. When the scan completes, the counts in
  --	 * numa_faults_memory decay and these values are copied.
  --	  

  --	 * Track the nodes the process was running on when a NUMA hinting
  --	 * fault was incurred.
  --	  

  --	 * numa_faults_locality tracks if faults recorded during the last
  --	 * scan window were remote/local. The task scan period is adapted
  --	 * based on the locality of the faults with different weights
  --	 * depending on whether they were shared or private faults
  --	  

  --	 * cache last used pipe for splice
  --	  

  --	 * when (nr_dirtied >= nr_dirtied_pause), it's time to call
  --	 * balance_dirty_pages() for some dirty throttling pause
  --	  

  -- start of a write-and-pause period  
  --	 * time slack values; these are used to round up poll() and
  --	 * select() etc timeout values. These are in nanoseconds.
  --	  

  -- Index of current stored address in ret_stack  
  -- Stack of return addresses for return function tracing  
   --  skipped empty struct ftrace_ret_stack

  -- time stamp for last schedule  
  --	 * Number of functions that haven't been traced
  --	 * because of depth overrun.
  --	  

  -- Pause for the tracing  
  -- state flags for use by tracers  
  -- bitmask and counter of trace recursion  
  -- incremented when batch uncharge started  
  -- target memcg of uncharge  
   --  skipped empty struct mem_cgroup

   type task_struct is record
      state : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1225
      stack : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1226
      usage : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1227
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1228
      ptrace : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1229
      wake_entry : aliased linux_llist_h.llist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1232
      on_cpu : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1233
      last_wakee : access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1234
      wakee_flips : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1235
      wakee_flip_decay_ts : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1236
      wake_cpu : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1238
      on_rq : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1240
      prio : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1242
      static_prio : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1242
      normal_prio : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1242
      rt_priority : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1243
      the_sched_class : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1244
      se : aliased sched_entity;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1245
      rt : aliased sched_rt_entity;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1246
      sched_task_group : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1248
      dl : aliased sched_dl_entity;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1250
      preempt_notifiers : aliased linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1254
      btrace_seq : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1258
      policy : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1261
      nr_cpus_allowed : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1262
      cpus_allowed : aliased linux_cpumask_h.cpumask_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1263
      the_sched_info : aliased sched_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1278
      tasks : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1281
      pushable_tasks : aliased linux_plist_h.plist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1283
      pushable_dl_tasks : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1284
      mm : access linux_mm_types_h.mm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1287
      active_mm : access linux_mm_types_h.mm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1287
      vmacache_seqnum : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1292
      vmacache : aliased task_struct_vmacache_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1293
      rss_stat : aliased linux_mm_types_h.task_rss_stat;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1295
      exit_state : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1298
      exit_code : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1299
      exit_signal : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1299
      pdeath_signal : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1300
      jobctl : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1301
      personality : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1304
      in_execve : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1306
      in_iowait : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1308
      no_new_privs : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1311
      sched_reset_on_fork : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1314
      sched_contributes_to_load : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1315
      pid : aliased linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1317
      tgid : aliased linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1318
      stack_canary : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1322
      real_parent : access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1329
      parent : access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1330
      children : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1334
      sibling : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1335
      group_leader : access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1336
      ptraced : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1343
      ptrace_entry : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1344
      pids : aliased task_struct_pids_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1347
      thread_group : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1348
      thread_node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1349
      vfork_done : access linux_completion_h.completion;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1351
      set_child_tid : access int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1352
      clear_child_tid : access int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1353
      utime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1355
      stime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1355
      utimescaled : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1355
      stimescaled : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1355
      gtime : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1356
      prev_cputime : aliased cputime;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1358
      nvcsw : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1369
      nivcsw : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1369
      start_time : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1370
      real_start_time : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1371
      min_flt : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1373
      maj_flt : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1373
      cputime_expires : aliased task_cputime;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1375
      cpu_timers : aliased task_struct_cpu_timers_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1376
      real_cred : access constant linux_cred_h.cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1379
      the_cred : access constant linux_cred_h.cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1381
      comm : aliased task_struct_comm_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1383
      link_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1388
      total_link_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1388
      sysvsem : aliased linux_sem_h.sysv_sem;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1391
      last_switch_count : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1395
      thread : aliased asm_processor_h.thread_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1398
      fs : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1400
      files : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1402
      the_nsproxy : access linux_nsproxy_h.nsproxy;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1404
      signal : access signal_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1406
      sighand : access sighand_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1407
      blocked : aliased asm_signal_h.sigset_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1409
      real_blocked : aliased asm_signal_h.sigset_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1409
      saved_sigmask : aliased asm_signal_h.sigset_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1410
      pending : aliased linux_signal_h.sigpending;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1411
      sas_ss_sp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1413
      sas_ss_size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1414
      notifier : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1415
      notifier_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1416
      notifier_mask : access asm_signal_h.sigset_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1417
      task_works : access linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1418
      the_audit_context : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1420
      loginuid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1422
      sessionid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1423
      the_seccomp : aliased linux_seccomp_h.seccomp;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1425
      parent_exec_id : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1428
      self_exec_id : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1429
      alloc_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1432
      pi_lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1435
      pi_waiters : aliased linux_rbtree_h.rb_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1439
      pi_waiters_leftmost : access linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1440
      pi_blocked_on : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1442
      pi_top_task : access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1444
      journal_info : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1476
      the_bio_list : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1479
      plug : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1483
      the_reclaim_state : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1487
      the_backing_dev_info : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1489
      the_io_context : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1491
      ptrace_message : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1493
      last_siginfo : access uapi_asm_generic_siginfo_h.siginfo_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1494
      ioac : aliased linux_task_io_accounting_h.task_io_accounting;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1495
      acct_rss_mem1 : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1497
      acct_vm_mem1 : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1498
      acct_timexpd : aliased asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1499
      mems_allowed : aliased linux_nodemask_h.nodemask_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1502
      mems_allowed_seq : aliased linux_seqlock_h.seqcount_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1503
      cpuset_mem_spread_rotor : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1504
      cpuset_slab_spread_rotor : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1505
      cgroups : access linux_cgroup_h.css_set;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1509
      cg_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1511
      robust_list : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1514
      compat_robust_list : access linux_compat_h.compat_robust_list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1516
      pi_state_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1518
      pi_state_cache : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1519
      perf_event_ctxp : aliased task_struct_perf_event_ctxp_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1522
      perf_event_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1523
      perf_event_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1524
      the_mempolicy : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1530
      il_next : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1531
      pref_node_fork : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1532
      numa_scan_seq : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1535
      numa_scan_period : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1536
      numa_scan_period_max : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1537
      numa_preferred_nid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1538
      numa_migrate_retry : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1539
      node_stamp : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1540
      last_task_numa_placement : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1541
      last_sum_exec_runtime : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1542
      numa_work : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1543
      numa_entry : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1545
      the_numa_group : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1546
      numa_faults_memory : access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1553
      total_numa_faults : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1554
      numa_faults_buffer_memory : access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1561
      numa_faults_cpu : access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1567
      numa_faults_buffer_cpu : access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1568
      numa_faults_locality : aliased task_struct_numa_faults_locality_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1576
      numa_pages_migrated : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1578
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1581
      splice_pipe : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1586
      task_frag : aliased linux_mm_types_h.page_frag;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1588
      delays : access task_delay_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1591
      nr_dirtied : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1600
      nr_dirtied_pause : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1601
      dirty_paused_when : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1602
      timer_slack_ns : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1612
      default_timer_slack_ns : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1613
      curr_ret_stack : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1617
      ret_stack : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1619
      ftrace_timestamp : aliased Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1621
      trace_overrun : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1626
      tracing_graph_pause : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1628
      trace : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1632
      trace_recursion : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1634
      memcg_batch : aliased memcg_batch_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1642
      memcg_kmem_skip_account : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1643
      memcg_oom : aliased memcg_oom_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1649
      utask : access linux_uprobes_h.uprobe_task;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1652
      sequential_io : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1655
      sequential_io_avg : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1656
   end record;
   pragma Convention (C_Pass_By_Copy, task_struct);
   pragma Pack (task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1224

  -- uncharged usage  
  -- uncharged mem+swap usage  
  -- Future-safe accessor for struct task_struct's cpus_allowed.  
   procedure task_numa_fault
     (last_node : int;
      node : int;
      pages : int;
      flags : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1669
   pragma Import (CPP, task_numa_fault, "_Z15task_numa_faultiiii");

   function task_numa_group_id (p : access task_struct) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1670
   pragma Import (CPP, task_numa_group_id, "_Z18task_numa_group_idP11task_struct");

   procedure set_numabalancing_state (enabled : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1671
   pragma Import (CPP, set_numabalancing_state, "_Z23set_numabalancing_stateb");

   procedure task_numa_free (p : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1672
   pragma Import (CPP, task_numa_free, "_Z14task_numa_freeP11task_struct");

   function should_numa_migrate_memory
     (p : access task_struct;
      the_page : access linux_mm_types_h.page;
      src_nid : int;
      dst_cpu : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1673
   pragma Import (CPP, should_numa_migrate_memory, "_Z26should_numa_migrate_memoryP11task_structP4pageii");

   function task_pid (c_task : access task_struct) return access linux_pid_h.pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1697
   pragma Import (CPP, task_pid, "_ZL8task_pidP11task_struct");

   function task_tgid (c_task : access task_struct) return access linux_pid_h.pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1702
   pragma Import (CPP, task_tgid, "_ZL9task_tgidP11task_struct");

  -- * Without tasklist or rcu lock it is not safe to dereference
  -- * the result of task_pgrp/task_session even if task == current,
  -- * we can race with another thread doing sys_setsid/sys_setpgid.
  --  

   function task_pgrp (c_task : access task_struct) return access linux_pid_h.pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1712
   pragma Import (CPP, task_pgrp, "_ZL9task_pgrpP11task_struct");

   function task_session (c_task : access task_struct) return access linux_pid_h.pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1717
   pragma Import (CPP, task_session, "_ZL12task_sessionP11task_struct");

  -- * the helpers to get the task's different pids as they are seen
  -- * from various namespaces
  -- *
  -- * task_xid_nr()     : global id, i.e. the id seen from the init namespace;
  -- * task_xid_vnr()    : virtual id, i.e. the id seen from the pid namespace of
  -- *                     current.
  -- * task_xid_nr_ns()  : id seen from the ns specified;
  -- *
  -- * set_task_vxid()   : assigns a virtual id to a task;
  -- *
  -- * see also pid_nr() etc in include/linux/pid.h
  --  

   --  skipped func __task_pid_nr_ns

   function task_pid_nr (tsk : access task_struct) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1740
   pragma Import (CPP, task_pid_nr, "_ZL11task_pid_nrP11task_struct");

   function task_pid_nr_ns (tsk : access task_struct; ns : System.Address) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1745
   pragma Import (CPP, task_pid_nr_ns, "_ZL14task_pid_nr_nsP11task_structP13pid_namespace");

   function task_pid_vnr (tsk : access task_struct) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1751
   pragma Import (CPP, task_pid_vnr, "_ZL12task_pid_vnrP11task_struct");

   function task_tgid_nr (tsk : access task_struct) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1757
   pragma Import (CPP, task_tgid_nr, "_ZL12task_tgid_nrP11task_struct");

   function task_tgid_nr_ns (tsk : access task_struct; ns : System.Address) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1762
   pragma Import (CPP, task_tgid_nr_ns, "_Z15task_tgid_nr_nsP11task_structP13pid_namespace");

   function task_tgid_vnr (tsk : access task_struct) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1764
   pragma Import (CPP, task_tgid_vnr, "_ZL13task_tgid_vnrP11task_struct");

   function task_ppid_nr_ns (tsk : access constant task_struct; ns : System.Address) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1771
   pragma Import (CPP, task_ppid_nr_ns, "_ZL15task_ppid_nr_nsPK11task_structP13pid_namespace");

   function task_ppid_nr (tsk : access constant task_struct) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1783
   pragma Import (CPP, task_ppid_nr, "_ZL12task_ppid_nrPK11task_struct");

   function task_pgrp_nr_ns (tsk : access task_struct; ns : System.Address) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1788
   pragma Import (CPP, task_pgrp_nr_ns, "_ZL15task_pgrp_nr_nsP11task_structP13pid_namespace");

   function task_pgrp_vnr (tsk : access task_struct) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1794
   pragma Import (CPP, task_pgrp_vnr, "_ZL13task_pgrp_vnrP11task_struct");

   function task_session_nr_ns (tsk : access task_struct; ns : System.Address) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1800
   pragma Import (CPP, task_session_nr_ns, "_ZL18task_session_nr_nsP11task_structP13pid_namespace");

   function task_session_vnr (tsk : access task_struct) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1806
   pragma Import (CPP, task_session_vnr, "_ZL16task_session_vnrP11task_struct");

  -- obsolete, do not use  
   function task_pgrp_nr (tsk : access task_struct) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1812
   pragma Import (CPP, task_pgrp_nr, "_ZL12task_pgrp_nrP11task_struct");

  --*
  -- * pid_alive - check that a task structure is not stale
  -- * @p: Task structure to be checked.
  -- *
  -- * Test if a process is not yet dead (at most zombie state)
  -- * If pid_alive fails, then pointers within the task structure
  -- * can be stale and must not be dereferenced.
  -- *
  -- * Return: 1 if the process is alive. 0 otherwise.
  --  

   function pid_alive (p : access constant task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1827
   pragma Import (CPP, pid_alive, "_ZL9pid_alivePK11task_struct");

  --*
  -- * is_global_init - check if a task structure is init
  -- * @tsk: Task structure to be checked.
  -- *
  -- * Check if a task structure is the first user space task the kernel created.
  -- *
  -- * Return: 1 if the task structure is init. 0 otherwise.
  --  

   function is_global_init (tsk : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1840
   pragma Import (CPP, is_global_init, "_ZL14is_global_initP11task_struct");

   cad_pid : access linux_pid_h.pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1845
   pragma Import (C, cad_pid, "cad_pid");

   procedure free_task (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1847
   pragma Import (CPP, free_task, "_Z9free_taskP11task_struct");

   --  skipped func __put_task_struct

   procedure put_task_struct (t : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1852
   pragma Import (CPP, put_task_struct, "_ZL15put_task_structP11task_struct");

   procedure task_cputime
     (t : access task_struct;
      utime : access asm_generic_cputime_jiffies_h.cputime_t;
      stime : access asm_generic_cputime_jiffies_h.cputime_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1865
   pragma Import (CPP, task_cputime, "_ZL12task_cputimeP11task_structPmS1_");

   procedure task_cputime_scaled
     (t : access task_struct;
      utimescaled : access asm_generic_cputime_jiffies_h.cputime_t;
      stimescaled : access asm_generic_cputime_jiffies_h.cputime_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1874
   pragma Import (CPP, task_cputime_scaled, "_ZL19task_cputime_scaledP11task_structPmS1_");

   function task_gtime (t : access task_struct) return asm_generic_cputime_jiffies_h.cputime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1884
   pragma Import (CPP, task_gtime, "_ZL10task_gtimeP11task_struct");

   procedure task_cputime_adjusted
     (p : access task_struct;
      ut : access asm_generic_cputime_jiffies_h.cputime_t;
      st : access asm_generic_cputime_jiffies_h.cputime_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1889
   pragma Import (CPP, task_cputime_adjusted, "_Z21task_cputime_adjustedP11task_structPmS1_");

   procedure thread_group_cputime_adjusted
     (p : access task_struct;
      ut : access asm_generic_cputime_jiffies_h.cputime_t;
      st : access asm_generic_cputime_jiffies_h.cputime_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1890
   pragma Import (CPP, thread_group_cputime_adjusted, "_Z29thread_group_cputime_adjustedP11task_structPmS1_");

  -- * Per process flags
  --  

  -- * Only the _current_ task can read/write to tsk->flags, but other
  -- * tasks can access tsk->flags in readonly mode for example
  -- * with tsk_used_math (like during threaded core dumping).
  -- * There is however an exception to this rule during ptrace
  -- * or during fork: the ptracer task is allowed to write to the
  -- * child->flags of its traced child (same goes for fork, the parent
  -- * can write to the child->flags), because we're guaranteed the
  -- * child is not running and in turn not changing child->flags
  -- * at the same time the parent does it.
  --  

  -- NOTE: this will return 0 or PF_USED_MATH, it will never return 1  
  -- __GFP_IO isn't allowed if PF_MEMALLOC_NOIO is set in current->flags
  -- * __GFP_FS is also cleared as it implies __GFP_IO.
  --  

   function memalloc_noio_flags (flags : linux_types_h.gfp_t) return linux_types_h.gfp_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1953
   pragma Import (CPP, memalloc_noio_flags, "_ZL19memalloc_noio_flagsj");

   function memalloc_noio_save return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1960
   pragma Import (CPP, memalloc_noio_save, "_ZL18memalloc_noio_savev");

   procedure memalloc_noio_restore (flags : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1967
   pragma Import (CPP, memalloc_noio_restore, "_ZL21memalloc_noio_restorej");

  -- * task->jobctl flags
  --  

   function task_set_jobctl_pending (c_task : access task_struct; mask : unsigned) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1996
   pragma Import (CPP, task_set_jobctl_pending, "_Z23task_set_jobctl_pendingP11task_structj");

   procedure task_clear_jobctl_trapping (c_task : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1998
   pragma Import (CPP, task_clear_jobctl_trapping, "_Z26task_clear_jobctl_trappingP11task_struct");

   procedure task_clear_jobctl_pending (c_task : access task_struct; mask : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:1999
   pragma Import (CPP, task_clear_jobctl_pending, "_Z25task_clear_jobctl_pendingP11task_structj");

   procedure rcu_copy_process (p : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2022
   pragma Import (CPP, rcu_copy_process, "_ZL16rcu_copy_processP11task_struct");

   procedure tsk_restore_flags
     (c_task : access task_struct;
      orig_flags : unsigned_long;
      flags : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2028
   pragma Import (CPP, tsk_restore_flags, "_ZL17tsk_restore_flagsP11task_structmm");

   procedure do_set_cpus_allowed (p : access task_struct; new_mask : access constant linux_cpumask_h.cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2036
   pragma Import (CPP, do_set_cpus_allowed, "_Z19do_set_cpus_allowedP11task_structPK7cpumask");

   function set_cpus_allowed_ptr (p : access task_struct; new_mask : access constant linux_cpumask_h.cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2039
   pragma Import (CPP, set_cpus_allowed_ptr, "_Z20set_cpus_allowed_ptrP11task_structPK7cpumask");

   procedure calc_load_enter_idle;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2056
   pragma Import (CPP, calc_load_enter_idle, "_Z20calc_load_enter_idlev");

   procedure calc_load_exit_idle;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2057
   pragma Import (CPP, calc_load_exit_idle, "_Z19calc_load_exit_idlev");

   function set_cpus_allowed (p : access task_struct; new_mask : linux_cpumask_h.cpumask_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2064
   pragma Import (CPP, set_cpus_allowed, "_ZL16set_cpus_allowedP11task_struct7cpumask");

  -- * Do not use outside of architecture code which knows its limitations.
  -- *
  -- * sched_clock() has no promise of monotonicity or bounded drift between
  -- * CPUs, use (which you should not) requires disabling IRQs.
  -- *
  -- * Please use one of the three interfaces below.
  --  

   function sched_clock return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2078
   pragma Import (CPP, sched_clock, "_Z11sched_clockv");

  -- * See the comment in kernel/sched/clock.c
  --  

   function cpu_clock (cpu : int) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2082
   pragma Import (CPP, cpu_clock, "_Z9cpu_clocki");

   function local_clock return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2083
   pragma Import (CPP, local_clock, "_Z11local_clockv");

   function sched_clock_cpu (cpu : int) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2084
   pragma Import (CPP, sched_clock_cpu, "_Z15sched_clock_cpui");

   procedure sched_clock_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2087
   pragma Import (CPP, sched_clock_init, "_Z16sched_clock_initv");

  -- * Architectures can set this to 1 if they have specified
  -- * CONFIG_HAVE_UNSTABLE_SCHED_CLOCK in their arch Kconfig,
  -- * but then during bootup it turns out that sched_clock()
  -- * is reliable after all:
  --  

   function sched_clock_stable return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2108
   pragma Import (CPP, sched_clock_stable, "_Z18sched_clock_stablev");

   procedure set_sched_clock_stable;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2109
   pragma Import (CPP, set_sched_clock_stable, "_Z22set_sched_clock_stablev");

   procedure clear_sched_clock_stable;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2110
   pragma Import (CPP, clear_sched_clock_stable, "_Z24clear_sched_clock_stablev");

   procedure sched_clock_tick;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2112
   pragma Import (CPP, sched_clock_tick, "_Z16sched_clock_tickv");

  -- * An i/f to runtime opt-in for irq time accounting based off of sched_clock.
  -- * The reason for this explicit opt-in is not to have perf penalty with
  -- * slow sched_clocks.
  --  

   procedure enable_sched_clock_irqtime;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2126
   pragma Import (CPP, enable_sched_clock_irqtime, "_ZL26enable_sched_clock_irqtimev");

   procedure disable_sched_clock_irqtime;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2127
   pragma Import (CPP, disable_sched_clock_irqtime, "_ZL27disable_sched_clock_irqtimev");

   function task_sched_runtime (c_task : access task_struct) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2131
   pragma Import (CPP, task_sched_runtime, "_Z18task_sched_runtimeP11task_struct");

  -- sched_exec is called by processes performing an exec  
   procedure sched_exec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2135
   pragma Import (CPP, sched_exec, "_Z10sched_execv");

   procedure sched_clock_idle_sleep_event;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2140
   pragma Import (CPP, sched_clock_idle_sleep_event, "_Z28sched_clock_idle_sleep_eventv");

   procedure sched_clock_idle_wakeup_event (delta_ns : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2141
   pragma Import (CPP, sched_clock_idle_wakeup_event, "_Z29sched_clock_idle_wakeup_eventy");

   procedure idle_task_exit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2144
   pragma Import (CPP, idle_task_exit, "_Z14idle_task_exitv");

   procedure wake_up_nohz_cpu (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2150
   pragma Import (CPP, wake_up_nohz_cpu, "_Z16wake_up_nohz_cpui");

   function sched_can_stop_tick return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2159
   pragma Import (CPP, sched_can_stop_tick, "_ZL19sched_can_stop_tickv");

   procedure sched_autogroup_create_attach (p : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2163
   pragma Import (CPP, sched_autogroup_create_attach, "_Z29sched_autogroup_create_attachP11task_struct");

   procedure sched_autogroup_detach (p : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2164
   pragma Import (CPP, sched_autogroup_detach, "_Z22sched_autogroup_detachP11task_struct");

   procedure sched_autogroup_fork (sig : access signal_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2165
   pragma Import (CPP, sched_autogroup_fork, "_Z20sched_autogroup_forkP13signal_struct");

   procedure sched_autogroup_exit (sig : access signal_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2166
   pragma Import (CPP, sched_autogroup_exit, "_Z20sched_autogroup_exitP13signal_struct");

   procedure proc_sched_autogroup_show_task (p : access task_struct; m : access linux_seq_file_h.seq_file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2168
   pragma Import (CPP, proc_sched_autogroup_show_task, "_Z30proc_sched_autogroup_show_taskP11task_structP8seq_file");

   function proc_sched_autogroup_set_nice (p : access task_struct; nice : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2169
   pragma Import (CPP, proc_sched_autogroup_set_nice, "_Z29proc_sched_autogroup_set_niceP11task_structi");

   function yield_to (p : access task_struct; preempt : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2178
   pragma Import (CPP, yield_to, "_Z8yield_toP11task_structb");

   procedure set_user_nice (p : access task_struct; nice : long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2179
   pragma Import (CPP, set_user_nice, "_Z13set_user_niceP11task_structl");

   function task_prio (p : access constant task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2180
   pragma Import (CPP, task_prio, "_Z9task_prioPK11task_struct");

  --*
  -- * task_nice - return the nice value of a given task.
  -- * @p: the task in question.
  -- *
  -- * Return: The nice value [ -20 ... 0 ... 19 ].
  --  

   function task_nice (p : access constant task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2187
   pragma Import (CPP, task_nice, "_ZL9task_nicePK11task_struct");

   function can_nice (p : access constant task_struct; nice : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2191
   pragma Import (CPP, can_nice, "_Z8can_nicePK11task_structi");

   function task_curr (p : access constant task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2192
   pragma Import (CPP, task_curr, "_Z9task_currPK11task_struct");

   function idle_cpu (cpu : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2193
   pragma Import (CPP, idle_cpu, "_Z8idle_cpui");

   function sched_setscheduler
     (arg1 : access task_struct;
      arg2 : int;
      arg3 : access constant sched_param) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2194
   pragma Import (CPP, sched_setscheduler, "_Z18sched_setschedulerP11task_structiPK11sched_param");

   function sched_setscheduler_nocheck
     (arg1 : access task_struct;
      arg2 : int;
      arg3 : access constant sched_param) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2196
   pragma Import (CPP, sched_setscheduler_nocheck, "_Z26sched_setscheduler_nocheckP11task_structiPK11sched_param");

   function sched_setattr (arg1 : access task_struct; arg2 : access constant sched_attr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2198
   pragma Import (CPP, sched_setattr, "_Z13sched_setattrP11task_structPK10sched_attr");

   function idle_task (cpu : int) return access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2200
   pragma Import (CPP, idle_task, "_Z9idle_taski");

  --*
  -- * is_idle_task - is the specified task an idle task?
  -- * @p: the task in question.
  -- *
  -- * Return: 1 if @p is an idle task. 0 otherwise.
  --  

   function is_idle_task (p : access constant task_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2207
   pragma Import (CPP, is_idle_task, "_ZL12is_idle_taskPK11task_struct");

   function curr_task (cpu : int) return access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2211
   pragma Import (CPP, curr_task, "_Z9curr_taski");

   procedure set_curr_task (cpu : int; p : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2212
   pragma Import (CPP, set_curr_task, "_Z13set_curr_taskiP11task_struct");

   procedure yield;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2214
   pragma Import (CPP, yield, "_Z5yieldv");

  -- * The default (Linux) execution domain.
  --  

   default_exec_domain : aliased linux_personality_h.exec_domain;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2219
   pragma Import (C, default_exec_domain, "default_exec_domain");

   type thread_union_stack_array is array (0 .. 2047) of aliased unsigned_long;
   type thread_union (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            the_thread_info : aliased asm_thread_info_h.thread_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2222
         when others =>
            stack : aliased thread_union_stack_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2223
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, thread_union);
   pragma Unchecked_Union (thread_union);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2221

   function kstack_end (addr : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2227
   pragma Import (CPP, kstack_end, "_ZL10kstack_endPv");

  -- Reliable end of stack detection:
  --	 * Some APM bios versions misalign the stack
  --	  

   init_thread_union : thread_union;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2236
   pragma Import (C, init_thread_union, "init_thread_union");

   init_task : aliased task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2237
   pragma Import (C, init_task, "init_task");

   init_mm : aliased linux_mm_types_h.mm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2239
   pragma Import (C, init_mm, "init_mm");

   init_pid_ns : aliased linux_pid_h.Class_pid_namespace.pid_namespace;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2241
   pragma Import (C, init_pid_ns, "init_pid_ns");

  -- * find a task by one of its numerical ids
  -- *
  -- * find_task_by_pid_ns():
  -- *      finds a task by its pid in the specified namespace
  -- * find_task_by_vpid():
  -- *      finds a task by its virtual pid
  -- *
  -- * see also find_vpid() etc in include/linux/pid.h
  --  

   function find_task_by_vpid (nr : linux_types_h.pid_t) return access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2254
   pragma Import (CPP, find_task_by_vpid, "_Z17find_task_by_vpidi");

   function find_task_by_pid_ns (nr : linux_types_h.pid_t; ns : System.Address) return access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2255
   pragma Import (CPP, find_task_by_pid_ns, "_Z19find_task_by_pid_nsiP13pid_namespace");

  -- per-UID process charging.  
   function alloc_uid (arg1 : linux_uidgid_h.kuid_t) return access user_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2259
   pragma Import (CPP, alloc_uid, "_Z9alloc_uid6kuid_t");

   function get_uid (u : access user_struct) return access user_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2260
   pragma Import (CPP, get_uid, "_ZL7get_uidP11user_struct");

   procedure free_uid (arg1 : access user_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2265
   pragma Import (CPP, free_uid, "_Z8free_uidP11user_struct");

   procedure xtime_update (ticks : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2269
   pragma Import (CPP, xtime_update, "_Z12xtime_updatem");

   function wake_up_state (tsk : access task_struct; state : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2271
   pragma Import (CPP, wake_up_state, "_Z13wake_up_stateP11task_structj");

   function wake_up_process (tsk : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2272
   pragma Import (CPP, wake_up_process, "_Z15wake_up_processP11task_struct");

   procedure wake_up_new_task (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2273
   pragma Import (CPP, wake_up_new_task, "_Z16wake_up_new_taskP11task_struct");

   procedure kick_process (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2275
   pragma Import (CPP, kick_process, "_Z12kick_processP11task_struct");

   function sched_fork (clone_flags : unsigned_long; p : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2279
   pragma Import (CPP, sched_fork, "_Z10sched_forkmP11task_struct");

   procedure sched_dead (p : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2280
   pragma Import (CPP, sched_dead, "_Z10sched_deadP11task_struct");

   procedure proc_caches_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2282
   pragma Import (CPP, proc_caches_init, "_Z16proc_caches_initv");

   procedure flush_signals (arg1 : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2283
   pragma Import (CPP, flush_signals, "_Z13flush_signalsP11task_struct");

   --  skipped func __flush_signals

   procedure ignore_signals (arg1 : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2285
   pragma Import (CPP, ignore_signals, "_Z14ignore_signalsP11task_struct");

   procedure flush_signal_handlers (arg1 : access task_struct; force_default : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2286
   pragma Import (CPP, flush_signal_handlers, "_Z21flush_signal_handlersP11task_structi");

   function dequeue_signal
     (tsk : access task_struct;
      mask : access asm_signal_h.sigset_t;
      info : access uapi_asm_generic_siginfo_h.siginfo_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2287
   pragma Import (CPP, dequeue_signal, "_Z14dequeue_signalP11task_structP8sigset_tP7siginfo");

   function dequeue_signal_lock
     (tsk : access task_struct;
      mask : access asm_signal_h.sigset_t;
      info : access uapi_asm_generic_siginfo_h.siginfo_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2289
   pragma Import (CPP, dequeue_signal_lock, "_ZL19dequeue_signal_lockP11task_structP8sigset_tP7siginfo");

   procedure block_all_signals
     (notifier : access function (arg1 : System.Address) return int;
      priv : System.Address;
      mask : access asm_signal_h.sigset_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2301
   pragma Import (CPP, block_all_signals, "_Z17block_all_signalsPFiPvES_P8sigset_t");

   procedure unblock_all_signals;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2303
   pragma Import (CPP, unblock_all_signals, "_Z19unblock_all_signalsv");

   procedure release_task (p : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2304
   pragma Import (CPP, release_task, "_Z12release_taskP11task_struct");

   function send_sig_info
     (arg1 : int;
      arg2 : access uapi_asm_generic_siginfo_h.siginfo;
      arg3 : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2305
   pragma Import (CPP, send_sig_info, "_Z13send_sig_infoiP7siginfoP11task_struct");

   function force_sigsegv (arg1 : int; arg2 : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2306
   pragma Import (CPP, force_sigsegv, "_Z13force_sigsegviP11task_struct");

   function force_sig_info
     (arg1 : int;
      arg2 : access uapi_asm_generic_siginfo_h.siginfo;
      arg3 : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2307
   pragma Import (CPP, force_sig_info, "_Z14force_sig_infoiP7siginfoP11task_struct");

   --  skipped func __kill_pgrp_info

   function kill_pid_info
     (sig : int;
      info : access uapi_asm_generic_siginfo_h.siginfo;
      the_pid : access linux_pid_h.pid) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2309
   pragma Import (CPP, kill_pid_info, "_Z13kill_pid_infoiP7siginfoP3pid");

   function kill_pid_info_as_cred
     (arg1 : int;
      arg2 : access uapi_asm_generic_siginfo_h.siginfo;
      arg3 : access linux_pid_h.pid;
      arg4 : access constant linux_cred_h.cred;
      arg5 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2310
   pragma Import (CPP, kill_pid_info_as_cred, "_Z21kill_pid_info_as_crediP7siginfoP3pidPK4credj");

   function kill_pgrp
     (the_pid : access linux_pid_h.pid;
      sig : int;
      priv : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2312
   pragma Import (CPP, kill_pgrp, "_Z9kill_pgrpP3pidii");

   function kill_pid
     (the_pid : access linux_pid_h.pid;
      sig : int;
      priv : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2313
   pragma Import (CPP, kill_pid, "_Z8kill_pidP3pidii");

   function kill_proc_info
     (arg1 : int;
      arg2 : access uapi_asm_generic_siginfo_h.siginfo;
      arg3 : linux_types_h.pid_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2314
   pragma Import (CPP, kill_proc_info, "_Z14kill_proc_infoiP7siginfoi");

   function do_notify_parent (arg1 : access task_struct; arg2 : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2315
   pragma Import (CPP, do_notify_parent, "_Z16do_notify_parentP11task_structi");

   --  skipped func __wake_up_parent

   procedure force_sig (arg1 : int; arg2 : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2317
   pragma Import (CPP, force_sig, "_Z9force_sigiP11task_struct");

   function send_sig
     (arg1 : int;
      arg2 : access task_struct;
      arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2318
   pragma Import (CPP, send_sig, "_Z8send_sigiP11task_structi");

   function zap_other_threads (p : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2319
   pragma Import (CPP, zap_other_threads, "_Z17zap_other_threadsP11task_struct");

   function sigqueue_alloc return access linux_signal_h.sigqueue;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2320
   pragma Import (CPP, sigqueue_alloc, "_Z14sigqueue_allocv");

   procedure sigqueue_free (arg1 : access linux_signal_h.sigqueue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2321
   pragma Import (CPP, sigqueue_free, "_Z13sigqueue_freeP8sigqueue");

   function send_sigqueue
     (arg1 : access linux_signal_h.sigqueue;
      arg2 : access task_struct;
      group : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2322
   pragma Import (CPP, send_sigqueue, "_Z13send_sigqueueP8sigqueueP11task_structi");

   function do_sigaction
     (arg1 : int;
      arg2 : access linux_signal_h.k_sigaction;
      arg3 : access linux_signal_h.k_sigaction) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2323
   pragma Import (CPP, do_sigaction, "_Z12do_sigactioniP11k_sigactionS0_");

   procedure restore_saved_sigmask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2325
   pragma Import (CPP, restore_saved_sigmask, "_ZL21restore_saved_sigmaskv");

   function sigmask_to_save return access asm_signal_h.sigset_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2331
   pragma Import (CPP, sigmask_to_save, "_ZL15sigmask_to_savev");

   function kill_cad_pid (sig : int; priv : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2339
   pragma Import (CPP, kill_cad_pid, "_ZL12kill_cad_pidii");

  -- These can be the second arg to send_sig_info/send_group_sig_info.   
  -- * True if we are on the alternate signal stack.
  --  

   function on_sig_stack (sp : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2352
   pragma Import (CPP, on_sig_stack, "_ZL12on_sig_stackm");

   function sas_ss_flags (sp : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2363
   pragma Import (CPP, sas_ss_flags, "_ZL12sas_ss_flagsm");

   function sigsp (sp : unsigned_long; ksig : access linux_signal_h.ksignal) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2369
   pragma Import (CPP, sigsp, "_ZL5sigspmP7ksignal");

  -- * Routines for handling mm_structs
  --  

   function mm_alloc return access linux_mm_types_h.mm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2383
   pragma Import (CPP, mm_alloc, "_Z8mm_allocv");

  -- mmdrop drops the mm and the page tables  
   --  skipped func __mmdrop

   procedure mmdrop (mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2387
   pragma Import (CPP, mmdrop, "_ZL6mmdropP9mm_struct");

  -- mmput gets rid of the mappings and all user-space  
   procedure mmput (arg1 : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2394
   pragma Import (CPP, mmput, "_Z5mmputP9mm_struct");

  -- Grab a reference to a task's mm, if it is not already going away  
   function get_task_mm (c_task : access task_struct) return access linux_mm_types_h.mm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2396
   pragma Import (CPP, get_task_mm, "_Z11get_task_mmP11task_struct");

  -- * Grab a reference to a task's mm, if it is not already going away
  -- * and ptrace_may_access with the mode parameter passed to it
  -- * succeeds.
  --  

   function mm_access (c_task : access task_struct; mode : unsigned) return access linux_mm_types_h.mm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2402
   pragma Import (CPP, mm_access, "_Z9mm_accessP11task_structj");

  -- Remove the current tasks stale references to the old mm_struct  
   procedure mm_release (arg1 : access task_struct; arg2 : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2404
   pragma Import (CPP, mm_release, "_Z10mm_releaseP11task_structP9mm_struct");

   function copy_thread
     (arg1 : unsigned_long;
      arg2 : unsigned_long;
      arg3 : unsigned_long;
      arg4 : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2406
   pragma Import (CPP, copy_thread, "_Z11copy_threadmmmP11task_struct");

   procedure flush_thread;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2408
   pragma Import (CPP, flush_thread, "_Z12flush_threadv");

   procedure exit_thread;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2409
   pragma Import (CPP, exit_thread, "_Z11exit_threadv");

   procedure exit_files (arg1 : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2411
   pragma Import (CPP, exit_files, "_Z10exit_filesP11task_struct");

   --  skipped func __cleanup_sighand

   procedure exit_itimers (arg1 : access signal_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2414
   pragma Import (CPP, exit_itimers, "_Z12exit_itimersP13signal_struct");

   procedure flush_itimer_signals;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2415
   pragma Import (CPP, flush_itimer_signals, "_Z20flush_itimer_signalsv");

   procedure do_group_exit (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2417
   pragma Import (CPP, do_group_exit, "_Z13do_group_exiti");

   function do_execve
     (arg1 : access linux_fs_h.filename;
      arg2 : System.Address;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2419
   pragma Import (CPP, do_execve, "_Z9do_execveP8filenamePKPKcS4_");

   function do_fork
     (arg1 : unsigned_long;
      arg2 : unsigned_long;
      arg3 : unsigned_long;
      arg4 : access int;
      arg5 : access int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2422
   pragma Import (CPP, do_fork, "_Z7do_forkmmmPiS_");

   function fork_idle (arg1 : int) return access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2423
   pragma Import (CPP, fork_idle, "_Z9fork_idlei");

   function kernel_thread
     (fn : access function (arg1 : System.Address) return int;
      arg : System.Address;
      flags : unsigned_long) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2424
   pragma Import (CPP, kernel_thread, "_Z13kernel_threadPFiPvES_m");

   --  skipped func __set_task_comm

   procedure set_task_comm (tsk : access task_struct; from : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2427
   pragma Import (CPP, set_task_comm, "_ZL13set_task_commP11task_structPKc");

   function get_task_comm (to : Interfaces.C.Strings.chars_ptr; tsk : access task_struct) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2431
   pragma Import (CPP, get_task_comm, "_Z13get_task_commPcP11task_struct");

   procedure scheduler_ipi;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2434
   pragma Import (CPP, scheduler_ipi, "_Z13scheduler_ipiv");

   function wait_task_inactive (arg1 : access task_struct; match_state : long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2435
   pragma Import (CPP, wait_task_inactive, "_Z18wait_task_inactiveP11task_structl");

   function current_is_single_threaded return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2451
   pragma Import (CPP, current_is_single_threaded, "_Z26current_is_single_threadedv");

  -- * Careful: do_each_thread/while_each_thread is a double loop so
  -- *          'break' will not work as expected - use goto instead.
  --  

  -- Careful: this is a double loop, 'break' won't work as expected.  
   function get_nr_threads (tsk : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2473
   pragma Import (CPP, get_nr_threads, "_ZL14get_nr_threadsP11task_struct");

   function thread_group_leader (p : access task_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2478
   pragma Import (CPP, thread_group_leader, "_ZL19thread_group_leaderP11task_struct");

  -- Do to the insanities of de_thread it is possible for a process
  -- * to have the pid of the thread group leader without actually being
  -- * the thread group leader.  For iteration through the pids in proc
  -- * all we care about is that we have a task with the appropriate
  -- * pid, we don't actually care if we have the right task.
  --  

   function has_group_leader_pid (p : access task_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2489
   pragma Import (CPP, has_group_leader_pid, "_ZL20has_group_leader_pidP11task_struct");

   function same_thread_group (p1 : access task_struct; p2 : access task_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2495
   pragma Import (CPP, same_thread_group, "_ZL17same_thread_groupP11task_structS0_");

   function next_thread (p : access constant task_struct) return access task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2500
   pragma Import (CPP, next_thread, "_ZL11next_threadPK11task_struct");

   function thread_group_empty (p : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2506
   pragma Import (CPP, thread_group_empty, "_ZL18thread_group_emptyP11task_struct");

  -- * Protects ->fs, ->files, ->mm, ->group_info, ->comm, keyring
  -- * subscriptions and synchronises with wait4().  Also used in procfs.  Also
  -- * pins the final release of task.io_context.  Also protects ->cpuset and
  -- * ->cgroup.subsys[]. And ->vfork_done.
  -- *
  -- * Nests both inside and outside of read_lock(&tasklist_lock).
  -- * It must not be nested with write_lock_irq(&tasklist_lock),
  -- * neither inside nor outside.
  --  

   procedure task_lock (p : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2524
   pragma Import (CPP, task_lock, "_ZL9task_lockP11task_struct");

   procedure task_unlock (p : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2529
   pragma Import (CPP, task_unlock, "_ZL11task_unlockP11task_struct");

   --  skipped func __lock_task_sighand

   function lock_task_sighand (tsk : access task_struct; flags : access unsigned_long) return access sighand_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2537
   pragma Import (CPP, lock_task_sighand, "_ZL17lock_task_sighandP11task_structPm");

   procedure unlock_task_sighand (tsk : access task_struct; flags : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2547
   pragma Import (CPP, unlock_task_sighand, "_ZL19unlock_task_sighandP11task_structPm");

   procedure threadgroup_change_begin (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2554
   pragma Import (CPP, threadgroup_change_begin, "_ZL24threadgroup_change_beginP11task_struct");

   procedure threadgroup_change_end (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2558
   pragma Import (CPP, threadgroup_change_end, "_ZL22threadgroup_change_endP11task_struct");

  --*
  -- * threadgroup_lock - lock threadgroup
  -- * @tsk: member task of the threadgroup to lock
  -- *
  -- * Lock the threadgroup @tsk belongs to.  No new task is allowed to enter
  -- * and member tasks aren't allowed to exit (as indicated by PF_EXITING) or
  -- * change ->group_leader/pid.  This is useful for cases where the threadgroup
  -- * needs to stay stable across blockable operations.
  -- *
  -- * fork and exit paths explicitly call threadgroup_change_{begin|end}() for
  -- * synchronization.  While held, no new task will be added to threadgroup
  -- * and no existing live task will have its PF_EXITING set.
  -- *
  -- * de_thread() does threadgroup_change_{begin|end}() when a non-leader
  -- * sub-thread becomes a new leader.
  --  

   procedure threadgroup_lock (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2579
   pragma Import (CPP, threadgroup_lock, "_ZL16threadgroup_lockP11task_struct");

  --*
  -- * threadgroup_unlock - unlock threadgroup
  -- * @tsk: member task of the threadgroup to unlock
  -- *
  -- * Reverse threadgroup_lock().
  --  

   procedure threadgroup_unlock (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2590
   pragma Import (CPP, threadgroup_unlock, "_ZL18threadgroup_unlockP11task_struct");

   procedure setup_thread_stack (p : access task_struct; org : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2606
   pragma Import (CPP, setup_thread_stack, "_ZL18setup_thread_stackP11task_structS0_");

   function end_of_stack (p : access task_struct) return access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2612
   pragma Import (CPP, end_of_stack, "_ZL12end_of_stackP11task_struct");

   function object_is_on_stack (obj : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2619
   pragma Import (CPP, object_is_on_stack, "_ZL18object_is_on_stackPv");

   procedure thread_info_cache_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2626
   pragma Import (CPP, thread_info_cache_init, "_Z22thread_info_cache_initv");

  -- Skip over canary  
  -- set thread flags in other task's structures
  -- * - see asm/thread_info.h for TIF_xxxx flags available
  --  

   procedure set_tsk_thread_flag (tsk : access task_struct; flag : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2644
   pragma Import (CPP, set_tsk_thread_flag, "_ZL19set_tsk_thread_flagP11task_structi");

   procedure clear_tsk_thread_flag (tsk : access task_struct; flag : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2649
   pragma Import (CPP, clear_tsk_thread_flag, "_ZL21clear_tsk_thread_flagP11task_structi");

   function test_and_set_tsk_thread_flag (tsk : access task_struct; flag : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2654
   pragma Import (CPP, test_and_set_tsk_thread_flag, "_ZL28test_and_set_tsk_thread_flagP11task_structi");

   function test_and_clear_tsk_thread_flag (tsk : access task_struct; flag : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2659
   pragma Import (CPP, test_and_clear_tsk_thread_flag, "_ZL30test_and_clear_tsk_thread_flagP11task_structi");

   function test_tsk_thread_flag (tsk : access task_struct; flag : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2664
   pragma Import (CPP, test_tsk_thread_flag, "_ZL20test_tsk_thread_flagP11task_structi");

   procedure set_tsk_need_resched (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2669
   pragma Import (CPP, set_tsk_need_resched, "_ZL20set_tsk_need_reschedP11task_struct");

   procedure clear_tsk_need_resched (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2674
   pragma Import (CPP, clear_tsk_need_resched, "_ZL22clear_tsk_need_reschedP11task_struct");

   function test_tsk_need_resched (tsk : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2679
   pragma Import (CPP, test_tsk_need_resched, "_ZL21test_tsk_need_reschedP11task_struct");

   function restart_syscall return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2684
   pragma Import (CPP, restart_syscall, "_ZL15restart_syscallv");

   function signal_pending (p : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2690
   pragma Import (CPP, signal_pending, "_ZL14signal_pendingP11task_struct");

   --  skipped func __fatal_signal_pending

   function fatal_signal_pending (p : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2700
   pragma Import (CPP, fatal_signal_pending, "_ZL20fatal_signal_pendingP11task_struct");

   function signal_pending_state (state : long; p : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2705
   pragma Import (CPP, signal_pending_state, "_ZL20signal_pending_statelP11task_struct");

  -- * cond_resched() and cond_resched_lock(): latency reduction via
  -- * explicit rescheduling in places that are safe. The return
  -- * value indicates whether a reschedule was done in fact.
  -- * cond_resched_lock() will drop the spinlock before scheduling,
  -- * cond_resched_softirq() will enable bhs before scheduling.
  --  

   --  skipped func _cond_resched

   --  skipped func __cond_resched_lock

   --  skipped func __cond_resched_softirq

   procedure cond_resched_rcu;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2749
   pragma Import (CPP, cond_resched_rcu, "_ZL16cond_resched_rcuv");

  -- * Does a critical section need to be broken due to another
  -- * task waiting?: (technically does not depend on CONFIG_PREEMPT,
  -- * but a general need for low latency)
  --  

   function spin_needbreak (lock : access linux_spinlock_types_h.spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2763
   pragma Import (CPP, spin_needbreak, "_ZL14spin_needbreakP8spinlock");

  -- * Idle thread specific functions to determine the need_resched
  -- * polling state.
  --  

   function tsk_is_polling (p : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2777
   pragma Import (CPP, tsk_is_polling, "_ZL14tsk_is_pollingP11task_struct");

   --  skipped func __current_set_polling

   function current_set_polling_and_test return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2787
   pragma Import (CPP, current_set_polling_and_test, "_ZL28current_set_polling_and_testv");

  --	 * Polling state must be visible before we test NEED_RESCHED,
  --	 * paired by resched_task()
  --	  

   --  skipped func __current_clr_polling

   function current_clr_polling_and_test return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2805
   pragma Import (CPP, current_clr_polling_and_test, "_ZL28current_clr_polling_and_testv");

  --	 * Polling state must be visible before we test NEED_RESCHED,
  --	 * paired by resched_task()
  --	  

   procedure current_clr_polling;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2833
   pragma Import (CPP, current_clr_polling, "_ZL19current_clr_pollingv");

  --	 * Ensure we check TIF_NEED_RESCHED after we clear the polling bit.
  --	 * Once the bit is cleared, we'll get IPIs with every new
  --	 * TIF_NEED_RESCHED and the IPI handler, scheduler_ipi(), will also
  --	 * fold.
  --	  

  -- paired with resched_task()  
   function need_resched return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2848
   pragma Import (CPP, need_resched, "_ZL12need_reschedv");

  -- * Thread group CPU time accounting.
  --  

   procedure thread_group_cputime (tsk : access task_struct; times : access task_cputime);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2856
   pragma Import (CPP, thread_group_cputime, "_Z20thread_group_cputimeP11task_structP12task_cputime");

   procedure thread_group_cputimer (tsk : access task_struct; times : access task_cputime);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2857
   pragma Import (CPP, thread_group_cputimer, "_Z21thread_group_cputimerP11task_structP12task_cputime");

   procedure thread_group_cputime_init (sig : access signal_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2859
   pragma Import (CPP, thread_group_cputime_init, "_ZL25thread_group_cputime_initP13signal_struct");

  -- * Reevaluate whether the task has signals pending delivery.
  -- * Wake the task if so.
  -- * This is required every time the blocked sigset_t changes.
  -- * callers must hold sighand->siglock.
  --  

   procedure recalc_sigpending_and_wake (t : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2870
   pragma Import (CPP, recalc_sigpending_and_wake, "_Z26recalc_sigpending_and_wakeP11task_struct");

   procedure recalc_sigpending;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2871
   pragma Import (CPP, recalc_sigpending, "_Z17recalc_sigpendingv");

   procedure signal_wake_up_state (t : access task_struct; state : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2873
   pragma Import (CPP, signal_wake_up_state, "_Z20signal_wake_up_stateP11task_structj");

   procedure signal_wake_up (t : access task_struct; resume : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2875
   pragma Import (CPP, signal_wake_up, "_ZL14signal_wake_upP11task_structb");

   procedure ptrace_signal_wake_up (t : access task_struct; resume : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2879
   pragma Import (CPP, ptrace_signal_wake_up, "_ZL21ptrace_signal_wake_upP11task_structb");

  -- * Wrappers for p->thread_info->cpu access. No-op on UP.
  --  

   function task_cpu (p : access constant task_struct) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2889
   pragma Import (CPP, task_cpu, "_ZL8task_cpuPK11task_struct");

   function task_node (p : access constant task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2894
   pragma Import (CPP, task_node, "_ZL9task_nodePK11task_struct");

   procedure set_task_cpu (p : access task_struct; cpu : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2899
   pragma Import (CPP, set_task_cpu, "_Z12set_task_cpuP11task_structj");

   function sched_setaffinity (pid : linux_types_h.pid_t; new_mask : access constant linux_cpumask_h.cpumask) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2914
   pragma Import (CPP, sched_setaffinity, "_Z17sched_setaffinityiPK7cpumask");

   function sched_getaffinity (pid : linux_types_h.pid_t; mask : access linux_cpumask_h.cpumask) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2915
   pragma Import (CPP, sched_getaffinity, "_Z17sched_getaffinityiP7cpumask");

   root_task_group : aliased task_group;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2918
   pragma Import (C, root_task_group, "root_task_group");

   function task_can_switch_user (up : access user_struct; tsk : access task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2921
   pragma Import (CPP, task_can_switch_user, "_Z20task_can_switch_userP11user_structP11task_struct");

   procedure add_rchar (tsk : access task_struct; amt : linux_types_h.ssize_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2925
   pragma Import (CPP, add_rchar, "_ZL9add_rcharP11task_structl");

   procedure add_wchar (tsk : access task_struct; amt : linux_types_h.ssize_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2930
   pragma Import (CPP, add_wchar, "_ZL9add_wcharP11task_structl");

   procedure inc_syscr (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2935
   pragma Import (CPP, inc_syscr, "_ZL9inc_syscrP11task_struct");

   procedure inc_syscw (tsk : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2940
   pragma Import (CPP, inc_syscw, "_ZL9inc_syscwP11task_struct");

   procedure mm_update_next_owner (mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2967
   pragma Import (CPP, mm_update_next_owner, "_Z20mm_update_next_ownerP9mm_struct");

   procedure mm_init_owner (mm : access linux_mm_types_h.mm_struct; p : access task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2968
   pragma Import (CPP, mm_init_owner, "_Z13mm_init_ownerP9mm_structP11task_struct");

   function task_rlimit (tsk : access constant task_struct; limit : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2979
   pragma Import (CPP, task_rlimit, "_ZL11task_rlimitPK11task_structj");

   function task_rlimit_max (tsk : access constant task_struct; limit : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2985
   pragma Import (CPP, task_rlimit_max, "_ZL15task_rlimit_maxPK11task_structj");

   function rlimit (limit : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2991
   pragma Import (CPP, rlimit, "_ZL6rlimitj");

   function rlimit_max (limit : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sched.h:2996
   pragma Import (CPP, rlimit_max, "_ZL10rlimit_maxj");

end linux_sched_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with asm_generic_atomic_long_h;
with linux_types_h;
with linux_timer_h;
with linux_cpumask_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
limited with linux_sched_h;

package linux_workqueue_h is

   --  arg-macro: function work_data_bits ((unsigned long *)(and(work).data)
   --    return (unsigned long *)(and(work).data);
   --  arg-macro: procedure WORK_DATA_INIT ATOMIC_LONG_INIT(WORK_STRUCT_NO_POOL)
   --    ATOMIC_LONG_INIT(WORK_STRUCT_NO_POOL)
   --  arg-macro: procedure WORK_DATA_STATIC_INIT ATOMIC_LONG_INIT(WORK_STRUCT_NO_POOL or WORK_STRUCT_STATIC)
   --    ATOMIC_LONG_INIT(WORK_STRUCT_NO_POOL or WORK_STRUCT_STATIC)
   --  arg-macro: procedure DECLARE_WORK struct work_struct n := __WORK_INITIALIZER(n, f)
   --    struct work_struct n := __WORK_INITIALIZER(n, f)
   --  arg-macro: procedure DECLARE_DELAYED_WORK struct delayed_work n := __DELAYED_WORK_INITIALIZER(n, f, 0)
   --    struct delayed_work n := __DELAYED_WORK_INITIALIZER(n, f, 0)
   --  arg-macro: procedure DECLARE_DEFERRABLE_WORK struct delayed_work n := __DELAYED_WORK_INITIALIZER(n, f, TIMER_DEFERRABLE)
   --    struct delayed_work n := __DELAYED_WORK_INITIALIZER(n, f, TIMER_DEFERRABLE)
   --  arg-macro: procedure INIT_WORK do { __INIT_WORK((_work), (_func), 0); } while (0)
   --    do { __INIT_WORK((_work), (_func), 0); } while (0)
   --  arg-macro: procedure INIT_WORK_ONSTACK do { __INIT_WORK((_work), (_func), 1); } while (0)
   --    do { __INIT_WORK((_work), (_func), 1); } while (0)
   --  arg-macro: procedure INIT_DELAYED_WORK __INIT_DELAYED_WORK(_work, _func, 0)
   --    __INIT_DELAYED_WORK(_work, _func, 0)
   --  arg-macro: procedure INIT_DELAYED_WORK_ONSTACK __INIT_DELAYED_WORK_ONSTACK(_work, _func, 0)
   --    __INIT_DELAYED_WORK_ONSTACK(_work, _func, 0)
   --  arg-macro: procedure INIT_DEFERRABLE_WORK __INIT_DELAYED_WORK(_work, _func, TIMER_DEFERRABLE)
   --    __INIT_DELAYED_WORK(_work, _func, TIMER_DEFERRABLE)
   --  arg-macro: procedure INIT_DEFERRABLE_WORK_ONSTACK __INIT_DELAYED_WORK_ONSTACK(_work, _func, TIMER_DEFERRABLE)
   --    __INIT_DELAYED_WORK_ONSTACK(_work, _func, TIMER_DEFERRABLE)
   --  arg-macro: procedure work_pending test_bit(WORK_STRUCT_PENDING_BIT, work_data_bits(work))
   --    test_bit(WORK_STRUCT_PENDING_BIT, work_data_bits(work))
   --  arg-macro: procedure delayed_work_pending work_pending(and(w).work)
   --    work_pending(and(w).work)
   --  unsupported macro: WQ_UNBOUND_MAX_ACTIVE max_t(int, WQ_MAX_ACTIVE, num_possible_cpus() * WQ_MAX_UNBOUND_PER_CPU)
   --  unsupported macro: alloc_workqueue(fmt,flags,max_active,args...) __alloc_workqueue_key((fmt), (flags), (max_active), NULL, NULL, ##args)
   --  unsupported macro: alloc_ordered_workqueue(fmt,flags,args...) alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
   --  arg-macro: procedure create_workqueue alloc_workqueue("%s", WQ_MEM_RECLAIM, 1, (name))
   --    alloc_workqueue("%s", WQ_MEM_RECLAIM, 1, (name))
   --  arg-macro: procedure create_freezable_workqueue alloc_workqueue("%s", WQ_FREEZABLE or WQ_UNBOUND or WQ_MEM_RECLAIM, 1, (name))
   --    alloc_workqueue("%s", WQ_FREEZABLE or WQ_UNBOUND or WQ_MEM_RECLAIM, 1, (name))
   --  arg-macro: procedure create_singlethread_workqueue alloc_ordered_workqueue("%s", WQ_MEM_RECLAIM, name)
   --    alloc_ordered_workqueue("%s", WQ_MEM_RECLAIM, name)
  -- * workqueue.h --- work queue handling for Linux.
  --  

   --  skipped empty struct workqueue_struct

   type work_func_t is access procedure (arg1 : System.Address);
   pragma Convention (C, work_func_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:19

   procedure delayed_work_timer_fn (uu_data : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:20
   pragma Import (CPP, delayed_work_timer_fn, "_Z21delayed_work_timer_fnm");

  -- * The first word is the work queue pointer and the flags rolled into
  -- * one
  --  

  -- work item is pending execution  
  -- work item is delayed  
  -- data points to pwq  
  -- next work is linked to this one  
  -- static initializer (debugobjects)  
  -- color for workqueue flushing  
  -- color for workqueue flushing  
  --	 * The last color is no color used for works which don't
  --	 * participate in workqueue flushing.
  --	  

  -- not bound to any CPU, prefer the local CPU  
  --	 * Reserve 7 bits off of pwq pointer w/ debugobjects turned off.
  --	 * This makes pwqs aligned to 256 bytes and allows 15 workqueue
  --	 * flush colors.
  --	  

  -- data contains off-queue information when !WORK_STRUCT_PWQ  
  --	 * When a work item is off queue, its high bits point to the last
  --	 * pool it was on.  Cap at 31 bits and use the highest number to
  --	 * indicate that no pool is associated.
  --	  

  -- convenience constants  
  -- bit mask for work_busy() return values  
  -- maximum string length for set_worker_desc()  
   type work_struct is record
      data : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:101
      c_entry : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:102
      func : work_func_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:103
   end record;
   pragma Convention (C_Pass_By_Copy, work_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:100

   type delayed_work is record
      work : aliased work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:114
      timer : aliased linux_timer_h.timer_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:115
      wq : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:118
      cpu : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:119
   end record;
   pragma Convention (C_Pass_By_Copy, delayed_work);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:113

  -- target workqueue and CPU ->timer uses to queue ->work  
  -- * A struct for workqueue attributes.  This can be used to change
  -- * attributes of an unbound workqueue.
  -- *
  -- * Unlike other fields, ->no_numa isn't a property of a worker_pool.  It
  -- * only modifies how apply_workqueue_attrs() select pools and thus doesn't
  -- * participate in pool hash calculations or equality comparisons.
  --  

  -- nice level  
   type workqueue_attrs is record
      nice : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:131
      cpumask : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:132
      no_numa : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:133
   end record;
   pragma Convention (C_Pass_By_Copy, workqueue_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:130

  -- allowed CPUs  
  -- disable NUMA affinity  
   function to_delayed_work (work : access work_struct) return access delayed_work;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:136
   pragma Import (CPP, to_delayed_work, "_ZL15to_delayed_workP11work_struct");

   type execute_work is record
      work : aliased work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:142
   end record;
   pragma Convention (C_Pass_By_Copy, execute_work);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:141

  -- * NB: because we have to copy the lockdep_map, setting _key
  -- * here is required, otherwise it could get initialised to the
  -- * copy of the lockdep_map!
  --  

   --  skipped func __init_work

   procedure destroy_work_on_stack (work : access work_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:190
   pragma Import (CPP, destroy_work_on_stack, "_ZL21destroy_work_on_stackP11work_struct");

   procedure destroy_delayed_work_on_stack (work : access delayed_work);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:191
   pragma Import (CPP, destroy_delayed_work_on_stack, "_ZL29destroy_delayed_work_on_stackP12delayed_work");

   function work_static (work : access work_struct) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:192
   pragma Import (CPP, work_static, "_ZL11work_staticP11work_struct");

  -- * initialize all of a work item in one go
  -- *
  -- * NOTE! No point in using "atomic_long_set()": using a direct
  -- * assignment of the work data initializer allows the compiler
  -- * to generate better code.
  --  

  --*
  -- * work_pending - Find out whether a work item is currently pending
  -- * @work: The work item in question
  --  

  --*
  -- * delayed_work_pending - Find out whether a delayable work item is currently
  -- * pending
  -- * @work: The work item in question
  --  

  -- * Workqueue flags and constants.  For details, please refer to
  -- * Documentation/workqueue.txt.
  --  

  -- not bound to any cpu  
  -- freeze during suspend  
  -- may be used for memory reclaim  
  -- high priority  
  -- cpu intensive workqueue  
  -- visible in sysfs, see wq_sysfs_register()  
  --	 * Per-cpu workqueues are generally preferred because they tend to
  --	 * show better performance thanks to cache locality.  Per-cpu
  --	 * workqueues exclude the scheduler from choosing the CPU to
  --	 * execute the worker threads, which has an unfortunate side effect
  --	 * of increasing power consumption.
  --	 *
  --	 * The scheduler considers a CPU idle if it doesn't have any task
  --	 * to execute and tries to keep idle cores idle to conserve power;
  --	 * however, for example, a per-cpu work item scheduled from an
  --	 * interrupt handler on an idle CPU will force the scheduler to
  --	 * excute the work item on that CPU breaking the idleness, which in
  --	 * turn may lead to more scheduling choices which are sub-optimal
  --	 * in terms of power consumption.
  --	 *
  --	 * Workqueues marked with WQ_POWER_EFFICIENT are per-cpu by default
  --	 * but become unbound if workqueue.power_efficient kernel param is
  --	 * specified.  Per-cpu workqueues which are identified to
  --	 * contribute significantly to power-consumption are identified and
  --	 * marked with this flag and enabling the power_efficient mode
  --	 * leads to noticeable power saving at the cost of small
  --	 * performance disadvantage.
  --	 *
  --	 * http://thread.gmane.org/gmane.linux.kernel/1480396
  --	  

  -- internal: workqueue is draining  
  -- internal: workqueue is ordered  
  -- I like 512, better ideas?  
  -- 4 * #cpus for unbound wq  
  -- unbound wq's aren't per-cpu, scale max_active according to #cpus  
  -- * System-wide workqueues which are always present.
  -- *
  -- * system_wq is the one used by schedule[_delayed]_work[_on]().
  -- * Multi-CPU multi-threaded.  There are users which expect relatively
  -- * short queue flush time.  Don't queue works which can run for too
  -- * long.
  -- *
  -- * system_highpri_wq is similar to system_wq but for work items which
  -- * require WQ_HIGHPRI.
  -- *
  -- * system_long_wq is similar to system_wq but may host long running
  -- * works.  Queue flushing might take relatively long.
  -- *
  -- * system_unbound_wq is unbound workqueue.  Workers are not bound to
  -- * any specific CPU, not concurrency managed, and all queued works are
  -- * executed immediately as long as max_active limit is not reached and
  -- * resources are available.
  -- *
  -- * system_freezable_wq is equivalent to system_wq except that it's
  -- * freezable.
  -- *
  -- * *_power_efficient_wq are inclined towards saving power and converted
  -- * into WQ_UNBOUND variants if 'wq_power_efficient' is enabled; otherwise,
  -- * they are same as their non-power-efficient counterparts - e.g.
  -- * system_power_efficient_wq is identical to system_wq if
  -- * 'wq_power_efficient' is disabled.  See WQ_POWER_EFFICIENT for more info.
  --  

   system_wq : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:356
   pragma Import (C, system_wq, "system_wq");

   system_highpri_wq : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:357
   pragma Import (C, system_highpri_wq, "system_highpri_wq");

   system_long_wq : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:358
   pragma Import (C, system_long_wq, "system_long_wq");

   system_unbound_wq : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:359
   pragma Import (C, system_unbound_wq, "system_unbound_wq");

   system_freezable_wq : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:360
   pragma Import (C, system_freezable_wq, "system_freezable_wq");

   system_power_efficient_wq : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:361
   pragma Import (C, system_power_efficient_wq, "system_power_efficient_wq");

   system_freezable_power_efficient_wq : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:362
   pragma Import (C, system_freezable_power_efficient_wq, "system_freezable_power_efficient_wq");

   --  skipped func __alloc_workqueue_key

  --*
  -- * alloc_workqueue - allocate a workqueue
  -- * @fmt: printf format for the name of the workqueue
  -- * @flags: WQ_* flags
  -- * @max_active: max in-flight work items, 0 for default
  -- * @args: args for @fmt
  -- *
  -- * Allocate a workqueue with the specified parameters.  For detailed
  -- * information on WQ_* flags, please refer to Documentation/workqueue.txt.
  -- *
  -- * The __lock_name macro dance is to guarantee that single lock_class_key
  -- * doesn't end up with different namesm, which isn't allowed by lockdep.
  -- *
  -- * RETURNS:
  -- * Pointer to the allocated workqueue on success, %NULL on failure.
  --  

  --*
  -- * alloc_ordered_workqueue - allocate an ordered workqueue
  -- * @fmt: printf format for the name of the workqueue
  -- * @flags: WQ_* flags (only WQ_FREEZABLE and WQ_MEM_RECLAIM are meaningful)
  -- * @args: args for @fmt
  -- *
  -- * Allocate an ordered workqueue.  An ordered workqueue executes at
  -- * most one work item at any given time in the queued order.  They are
  -- * implemented as unbound workqueues with @max_active of one.
  -- *
  -- * RETURNS:
  -- * Pointer to the allocated workqueue on success, %NULL on failure.
  --  

   procedure destroy_workqueue (wq : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:425
   pragma Import (CPP, destroy_workqueue, "_Z17destroy_workqueueP16workqueue_struct");

   function alloc_workqueue_attrs (gfp_mask : linux_types_h.gfp_t) return access workqueue_attrs;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:427
   pragma Import (CPP, alloc_workqueue_attrs, "_Z21alloc_workqueue_attrsj");

   procedure free_workqueue_attrs (attrs : access workqueue_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:428
   pragma Import (CPP, free_workqueue_attrs, "_Z20free_workqueue_attrsP15workqueue_attrs");

   function apply_workqueue_attrs (wq : System.Address; attrs : access constant workqueue_attrs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:429
   pragma Import (CPP, apply_workqueue_attrs, "_Z21apply_workqueue_attrsP16workqueue_structPK15workqueue_attrs");

   function queue_work_on
     (cpu : int;
      wq : System.Address;
      work : access work_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:432
   pragma Import (CPP, queue_work_on, "_Z13queue_work_oniP16workqueue_structP11work_struct");

   function queue_delayed_work_on
     (cpu : int;
      wq : System.Address;
      work : access delayed_work;
      c_delay : unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:434
   pragma Import (CPP, queue_delayed_work_on, "_Z21queue_delayed_work_oniP16workqueue_structP12delayed_workm");

   function mod_delayed_work_on
     (cpu : int;
      wq : System.Address;
      dwork : access delayed_work;
      c_delay : unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:436
   pragma Import (CPP, mod_delayed_work_on, "_Z19mod_delayed_work_oniP16workqueue_structP12delayed_workm");

   procedure flush_workqueue (wq : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:439
   pragma Import (CPP, flush_workqueue, "_Z15flush_workqueueP16workqueue_struct");

   procedure drain_workqueue (wq : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:440
   pragma Import (CPP, drain_workqueue, "_Z15drain_workqueueP16workqueue_struct");

   procedure flush_scheduled_work;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:441
   pragma Import (CPP, flush_scheduled_work, "_Z20flush_scheduled_workv");

   function schedule_on_each_cpu (func : work_func_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:443
   pragma Import (CPP, schedule_on_each_cpu, "_Z20schedule_on_each_cpuPFvP11work_structE");

   function execute_in_process_context (fn : work_func_t; arg2 : access execute_work) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:445
   pragma Import (CPP, execute_in_process_context, "_Z26execute_in_process_contextPFvP11work_structEP12execute_work");

   function flush_work (work : access work_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:447
   pragma Import (CPP, flush_work, "_Z10flush_workP11work_struct");

   function cancel_work_sync (work : access work_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:448
   pragma Import (CPP, cancel_work_sync, "_Z16cancel_work_syncP11work_struct");

   function flush_delayed_work (dwork : access delayed_work) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:450
   pragma Import (CPP, flush_delayed_work, "_Z18flush_delayed_workP12delayed_work");

   function cancel_delayed_work (dwork : access delayed_work) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:451
   pragma Import (CPP, cancel_delayed_work, "_Z19cancel_delayed_workP12delayed_work");

   function cancel_delayed_work_sync (dwork : access delayed_work) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:452
   pragma Import (CPP, cancel_delayed_work_sync, "_Z24cancel_delayed_work_syncP12delayed_work");

   procedure workqueue_set_max_active (wq : System.Address; max_active : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:454
   pragma Import (CPP, workqueue_set_max_active, "_Z24workqueue_set_max_activeP16workqueue_structi");

   function current_is_workqueue_rescuer return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:456
   pragma Import (CPP, current_is_workqueue_rescuer, "_Z28current_is_workqueue_rescuerv");

   function workqueue_congested (cpu : int; wq : System.Address) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:457
   pragma Import (CPP, workqueue_congested, "_Z19workqueue_congestediP16workqueue_struct");

   function work_busy (work : access work_struct) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:458
   pragma Import (CPP, work_busy, "_Z9work_busyP11work_struct");

   procedure set_worker_desc (fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      );  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:459
   pragma Import (CPP, set_worker_desc, "_Z15set_worker_descPKcz");

   procedure print_worker_info (log_lvl : Interfaces.C.Strings.chars_ptr; c_task : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:460
   pragma Import (CPP, print_worker_info, "_Z17print_worker_infoPKcP11task_struct");

  --*
  -- * queue_work - queue work on a workqueue
  -- * @wq: workqueue to use
  -- * @work: work to queue
  -- *
  -- * Returns %false if @work was already on a queue, %true otherwise.
  -- *
  -- * We queue the work to the CPU on which it was submitted, but if the CPU dies
  -- * it can be processed by another CPU.
  --  

   function queue_work (wq : System.Address; work : access work_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:472
   pragma Import (CPP, queue_work, "_ZL10queue_workP16workqueue_structP11work_struct");

  --*
  -- * queue_delayed_work - queue work on a workqueue after delay
  -- * @wq: workqueue to use
  -- * @dwork: delayable work to queue
  -- * @delay: number of jiffies to wait before queueing
  -- *
  -- * Equivalent to queue_delayed_work_on() but tries to use the local CPU.
  --  

   function queue_delayed_work
     (wq : System.Address;
      dwork : access delayed_work;
      c_delay : unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:486
   pragma Import (CPP, queue_delayed_work, "_ZL18queue_delayed_workP16workqueue_structP12delayed_workm");

  --*
  -- * mod_delayed_work - modify delay of or queue a delayed work
  -- * @wq: workqueue to use
  -- * @dwork: work to queue
  -- * @delay: number of jiffies to wait before queueing
  -- *
  -- * mod_delayed_work_on() on local CPU.
  --  

   function mod_delayed_work
     (wq : System.Address;
      dwork : access delayed_work;
      c_delay : unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:501
   pragma Import (CPP, mod_delayed_work, "_ZL16mod_delayed_workP16workqueue_structP12delayed_workm");

  --*
  -- * schedule_work_on - put work task on a specific cpu
  -- * @cpu: cpu to put the work task on
  -- * @work: job to be done
  -- *
  -- * This puts a job on a specific cpu
  --  

   function schedule_work_on (cpu : int; work : access work_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:515
   pragma Import (CPP, schedule_work_on, "_ZL16schedule_work_oniP11work_struct");

  --*
  -- * schedule_work - put work task in global workqueue
  -- * @work: job to be done
  -- *
  -- * Returns %false if @work was already on the kernel-global workqueue and
  -- * %true otherwise.
  -- *
  -- * This puts a job in the kernel-global workqueue if it was not already
  -- * queued and leaves it in the same position on the kernel-global
  -- * workqueue otherwise.
  --  

   function schedule_work (work : access work_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:531
   pragma Import (CPP, schedule_work, "_ZL13schedule_workP11work_struct");

  --*
  -- * schedule_delayed_work_on - queue work in global workqueue on CPU after delay
  -- * @cpu: cpu to use
  -- * @dwork: job to be done
  -- * @delay: number of jiffies to wait
  -- *
  -- * After waiting for a given time this puts a job in the kernel-global
  -- * workqueue on the specified CPU.
  --  

   function schedule_delayed_work_on
     (cpu : int;
      dwork : access delayed_work;
      c_delay : unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:545
   pragma Import (CPP, schedule_delayed_work_on, "_ZL24schedule_delayed_work_oniP12delayed_workm");

  --*
  -- * schedule_delayed_work - put work task in global workqueue after delay
  -- * @dwork: job to be done
  -- * @delay: number of jiffies to wait or 0 for immediate execution
  -- *
  -- * After waiting for a given time this puts a job in the kernel-global
  -- * workqueue.
  --  

   function schedule_delayed_work (dwork : access delayed_work; c_delay : unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:559
   pragma Import (CPP, schedule_delayed_work, "_ZL21schedule_delayed_workP12delayed_workm");

  --*
  -- * keventd_up - is workqueue initialized yet?
  --  

   function keventd_up return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:568
   pragma Import (CPP, keventd_up, "_ZL10keventd_upv");

   function work_on_cpu
     (cpu : int;
      fn : access function (arg1 : System.Address) return long;
      arg : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:579
   pragma Import (CPP, work_on_cpu, "_Z11work_on_cpuiPFlPvES_");

   procedure freeze_workqueues_begin;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:583
   pragma Import (CPP, freeze_workqueues_begin, "_Z23freeze_workqueues_beginv");

   function freeze_workqueues_busy return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:584
   pragma Import (CPP, freeze_workqueues_busy, "_Z22freeze_workqueues_busyv");

   procedure thaw_workqueues;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:585
   pragma Import (CPP, thaw_workqueues, "_Z15thaw_workqueuesv");

   function workqueue_sysfs_register (wq : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/workqueue.h:589
   pragma Import (CPP, workqueue_sysfs_register, "_Z24workqueue_sysfs_registerP16workqueue_struct");

end linux_workqueue_h;

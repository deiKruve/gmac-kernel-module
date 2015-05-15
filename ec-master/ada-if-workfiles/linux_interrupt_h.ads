pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_irqreturn_h;
limited with linux_sched_h;
with Interfaces.C.Strings;
limited with linux_device_h;
with linux_kref_h;
with linux_workqueue_h;
with linux_cpumask_h;
with Interfaces.C.Extensions;
with linux_types_h;
with linux_hrtimer_h;
with linux_ktime_h;
limited with linux_seq_file_h;

package linux_interrupt_h is

   --  unsupported macro: IRQF_TRIGGER_NONE 0x00000000
   --  unsupported macro: IRQF_TRIGGER_RISING 0x00000001
   --  unsupported macro: IRQF_TRIGGER_FALLING 0x00000002
   --  unsupported macro: IRQF_TRIGGER_HIGH 0x00000004
   --  unsupported macro: IRQF_TRIGGER_LOW 0x00000008
   --  unsupported macro: IRQF_TRIGGER_MASK (IRQF_TRIGGER_HIGH | IRQF_TRIGGER_LOW | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)
   --  unsupported macro: IRQF_TRIGGER_PROBE 0x00000010
   --  unsupported macro: IRQF_DISABLED 0x00000020
   --  unsupported macro: IRQF_SHARED 0x00000080
   --  unsupported macro: IRQF_PROBE_SHARED 0x00000100
   --  unsupported macro: IRQF_PERCPU 0x00000400
   --  unsupported macro: IRQF_NOBALANCING 0x00000800
   --  unsupported macro: IRQF_IRQPOLL 0x00001000
   --  unsupported macro: IRQF_ONESHOT 0x00002000
   --  unsupported macro: IRQF_NO_SUSPEND 0x00004000
   --  unsupported macro: IRQF_FORCE_RESUME 0x00008000
   --  unsupported macro: IRQF_NO_THREAD 0x00010000
   --  unsupported macro: IRQF_EARLY_RESUME 0x00020000
   --  unsupported macro: IRQF_TIMER (__IRQF_TIMER | IRQF_NO_SUSPEND | IRQF_NO_THREAD)
   --  arg-macro: procedure local_irq_enable_in_hardirq local_irq_enable()
   --    local_irq_enable()
   --  arg-macro: procedure hard_irq_disable do { } while(0)
   --    do { } while(0)
   --  unsupported macro: SOFTIRQ_STOP_IDLE_MASK (~(1 << RCU_SOFTIRQ))
   --  arg-macro: procedure DECLARE_TASKLET struct tasklet_struct name := { NULL, 0, ATOMIC_INIT(0), func, data }
   --    struct tasklet_struct name := { NULL, 0, ATOMIC_INIT(0), func, data }
   --  arg-macro: procedure DECLARE_TASKLET_DISABLED struct tasklet_struct name := { NULL, 0, ATOMIC_INIT(1), func, data }
   --    struct tasklet_struct name := { NULL, 0, ATOMIC_INIT(1), func, data }
  -- interrupt.h  
  -- * These correspond to the IORESOURCE_IRQ_* defines in
  -- * linux/ioport.h to select the interrupt line behaviour.  When
  -- * requesting an interrupt without specifying a IRQF_TRIGGER, the
  -- * setting should be assumed to be "as already configured", which
  -- * may be as per machine or firmware initialisation.
  --  

  -- * These flags used only by the kernel as part of the
  -- * irq handling routines.
  -- *
  -- * IRQF_DISABLED - keep irqs disabled when calling the action handler.
  -- *                 DEPRECATED. This flag is a NOOP and scheduled to be removed
  -- * IRQF_SHARED - allow sharing the irq among several devices
  -- * IRQF_PROBE_SHARED - set by callers when they expect sharing mismatches to occur
  -- * IRQF_TIMER - Flag to mark this interrupt as timer interrupt
  -- * IRQF_PERCPU - Interrupt is per cpu
  -- * IRQF_NOBALANCING - Flag to exclude this interrupt from irq balancing
  -- * IRQF_IRQPOLL - Interrupt is used for polling (only the interrupt that is
  -- *                registered first in an shared interrupt is considered for
  -- *                performance reasons)
  -- * IRQF_ONESHOT - Interrupt is not reenabled after the hardirq handler finished.
  -- *                Used by threaded interrupts which need to keep the
  -- *                irq line disabled until the threaded handler has been run.
  -- * IRQF_NO_SUSPEND - Do not disable this IRQ during suspend
  -- * IRQF_FORCE_RESUME - Force enable it on resume even if IRQF_NO_SUSPEND is set
  -- * IRQF_NO_THREAD - Interrupt cannot be threaded
  -- * IRQF_EARLY_RESUME - Resume IRQ early during syscore instead of at device
  -- *                resume time.
  --  

  -- * These values can be returned by request_any_context_irq() and
  -- * describe the context the interrupt will be run in.
  -- *
  -- * IRQC_IS_HARDIRQ - interrupt runs in hardirq context
  -- * IRQC_IS_NESTED - interrupt runs in a nested threaded context
  --  

   type irq_handler_t is access function (arg1 : int; arg2 : System.Address) return linux_irqreturn_h.irqreturn_t;
   pragma Convention (C, irq_handler_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:88

  --*
  -- * struct irqaction - per interrupt action descriptor
  -- * @handler:	interrupt handler function
  -- * @name:	name of the device
  -- * @dev_id:	cookie to identify the device
  -- * @percpu_dev_id:	cookie to identify the device
  -- * @next:	pointer to the next irqaction for shared interrupts
  -- * @irq:	interrupt number
  -- * @flags:	flags (see IRQF_* above)
  -- * @thread_fn:	interrupt handler function for threaded interrupts
  -- * @thread:	thread pointer for threaded interrupts
  -- * @thread_flags:	flags related to @thread
  -- * @thread_mask:	bitmask for keeping track of @thread activity
  -- * @dir:	pointer to the proc/irq/NN/name entry
  --  

   type irqaction is record
      handler : irq_handler_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:106
      dev_id : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:107
      percpu_dev_id : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:108
      next : access irqaction;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:109
      thread_fn : irq_handler_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:110
      thread : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:111
      irq : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:112
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:113
      thread_flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:114
      thread_mask : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:115
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:116
      dir : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:117
   end record;
   pragma Convention (C_Pass_By_Copy, irqaction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:105

   function no_action (cpl : int; dev_id : System.Address) return linux_irqreturn_h.irqreturn_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:120
   pragma Import (CPP, no_action, "_Z9no_actioniPv");

   function request_threaded_irq
     (irq : unsigned;
      handler : irq_handler_t;
      thread_fn : irq_handler_t;
      flags : unsigned_long;
      name : Interfaces.C.Strings.chars_ptr;
      dev : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:123
   pragma Import (CPP, request_threaded_irq, "_Z20request_threaded_irqjPF9irqreturniPvES2_mPKcS0_");

   function request_irq
     (irq : unsigned;
      handler : irq_handler_t;
      flags : unsigned_long;
      name : Interfaces.C.Strings.chars_ptr;
      dev : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:128
   pragma Import (CPP, request_irq, "_ZL11request_irqjPF9irqreturniPvEmPKcS0_");

   function request_any_context_irq
     (irq : unsigned;
      handler : irq_handler_t;
      flags : unsigned_long;
      name : Interfaces.C.Strings.chars_ptr;
      dev_id : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:135
   pragma Import (CPP, request_any_context_irq, "_Z23request_any_context_irqjPF9irqreturniPvEmPKcS0_");

   function request_percpu_irq
     (irq : unsigned;
      handler : irq_handler_t;
      devname : Interfaces.C.Strings.chars_ptr;
      percpu_dev_id : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:139
   pragma Import (CPP, request_percpu_irq, "_Z18request_percpu_irqjPF9irqreturniPvEPKcS0_");

   procedure free_irq (arg1 : unsigned; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:142
   pragma Import (CPP, free_irq, "_Z8free_irqjPv");

   procedure free_percpu_irq (arg1 : unsigned; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:143
   pragma Import (CPP, free_percpu_irq, "_Z15free_percpu_irqjPv");

   function devm_request_threaded_irq
     (dev : access linux_device_h.device;
      irq : unsigned;
      handler : irq_handler_t;
      thread_fn : irq_handler_t;
      irqflags : unsigned_long;
      devname : Interfaces.C.Strings.chars_ptr;
      dev_id : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:148
   pragma Import (CPP, devm_request_threaded_irq, "_Z25devm_request_threaded_irqP6devicejPF9irqreturniPvES4_mPKcS2_");

   function devm_request_irq
     (dev : access linux_device_h.device;
      irq : unsigned;
      handler : irq_handler_t;
      irqflags : unsigned_long;
      devname : Interfaces.C.Strings.chars_ptr;
      dev_id : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:154
   pragma Import (CPP, devm_request_irq, "_ZL16devm_request_irqP6devicejPF9irqreturniPvEmPKcS2_");

   function devm_request_any_context_irq
     (dev : access linux_device_h.device;
      irq : unsigned;
      handler : irq_handler_t;
      irqflags : unsigned_long;
      devname : Interfaces.C.Strings.chars_ptr;
      dev_id : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:162
   pragma Import (CPP, devm_request_any_context_irq, "_Z28devm_request_any_context_irqP6devicejPF9irqreturniPvEmPKcS2_");

   procedure devm_free_irq
     (dev : access linux_device_h.device;
      irq : unsigned;
      dev_id : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:166
   pragma Import (CPP, devm_free_irq, "_Z13devm_free_irqP6devicejPv");

  -- * On lockdep we dont want to enable hardirqs in hardirq
  -- * context. Use local_irq_enable_in_hardirq() to annotate
  -- * kernel code that has to do this nevertheless (pretty much
  -- * the only valid case is for old/broken hardware that is
  -- * insanely slow).
  -- *
  -- * NOTE: in theory this might break fragile code that relies
  -- * on hardirq delivery - in practice we dont seem to have such
  -- * places left. So the only effect should be slightly increased
  -- * irqs-off latencies.
  --  

   procedure disable_irq_nosync (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:186
   pragma Import (CPP, disable_irq_nosync, "_Z18disable_irq_nosyncj");

   procedure disable_irq (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:187
   pragma Import (CPP, disable_irq, "_Z11disable_irqj");

   procedure disable_percpu_irq (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:188
   pragma Import (CPP, disable_percpu_irq, "_Z18disable_percpu_irqj");

   procedure enable_irq (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:189
   pragma Import (CPP, enable_irq, "_Z10enable_irqj");

   procedure enable_percpu_irq (irq : unsigned; c_type : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:190
   pragma Import (CPP, enable_percpu_irq, "_Z17enable_percpu_irqjj");

   procedure irq_wake_thread (irq : unsigned; dev_id : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:191
   pragma Import (CPP, irq_wake_thread, "_Z15irq_wake_threadjPv");

  -- The following three functions are for the core kernel use only.  
   procedure suspend_device_irqs;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:194
   pragma Import (CPP, suspend_device_irqs, "_Z19suspend_device_irqsv");

   procedure resume_device_irqs;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:195
   pragma Import (CPP, resume_device_irqs, "_Z18resume_device_irqsv");

   function check_wakeup_irqs return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:197
   pragma Import (CPP, check_wakeup_irqs, "_Z17check_wakeup_irqsv");

  --*
  -- * struct irq_affinity_notify - context for notification of IRQ affinity changes
  -- * @irq:		Interrupt to which notification applies
  -- * @kref:		Reference count, for internal use
  -- * @work:		Work item, for internal use
  -- * @notify:		Function to be called on change.  This will be
  -- *			called in process context.
  -- * @release:		Function to be called on release.  This will be
  -- *			called in process context.  Once registered, the
  -- *			structure must only be freed when this function is
  -- *			called or later.
  --  

   type irq_affinity_notify is record
      irq : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:215
      the_kref : aliased linux_kref_h.kref;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:216
      work : aliased linux_workqueue_h.work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:217
      notify : access procedure (arg1 : access irq_affinity_notify; arg2 : access constant linux_cpumask_h.cpumask_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:218
      release : access procedure (arg1 : access linux_kref_h.kref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:219
   end record;
   pragma Convention (C_Pass_By_Copy, irq_affinity_notify);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:214

   irq_default_affinity : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:224
   pragma Import (C, irq_default_affinity, "irq_default_affinity");

  -- Internal implementation. Use the helpers below  
   --  skipped func __irq_set_affinity

  --*
  -- * irq_set_affinity - Set the irq affinity of a given irq
  -- * @irq:	Interrupt to set affinity
  -- * @cpumask:	cpumask
  -- *
  -- * Fails if cpumask does not contain an online CPU
  --  

   function irq_set_affinity (irq : unsigned; the_cpumask : access constant linux_cpumask_h.cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:238
   pragma Import (CPP, irq_set_affinity, "_ZL16irq_set_affinityjPK7cpumask");

  --*
  -- * irq_force_affinity - Force the irq affinity of a given irq
  -- * @irq:	Interrupt to set affinity
  -- * @cpumask:	cpumask
  -- *
  -- * Same as irq_set_affinity, but without checking the mask against
  -- * online cpus.
  -- *
  -- * Solely for low level cpu hotplug code, where we need to make per
  -- * cpu interrupts affine before the cpu becomes online.
  --  

   function irq_force_affinity (irq : unsigned; the_cpumask : access constant linux_cpumask_h.cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:255
   pragma Import (CPP, irq_force_affinity, "_ZL18irq_force_affinityjPK7cpumask");

   function irq_can_set_affinity (irq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:260
   pragma Import (CPP, irq_can_set_affinity, "_Z20irq_can_set_affinityj");

   function irq_select_affinity (irq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:261
   pragma Import (CPP, irq_select_affinity, "_Z19irq_select_affinityj");

   function irq_set_affinity_hint (irq : unsigned; m : access constant linux_cpumask_h.cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:263
   pragma Import (CPP, irq_set_affinity_hint, "_Z21irq_set_affinity_hintjPK7cpumask");

   function irq_set_affinity_notifier (irq : unsigned; notify : access irq_affinity_notify) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:266
   pragma Import (CPP, irq_set_affinity_notifier, "_Z25irq_set_affinity_notifierjP19irq_affinity_notify");

  -- * Special lockdep variants of irq disabling/enabling.
  -- * These should be used for locking constructs that
  -- * know that a particular irq context which is disabled,
  -- * and which is the only irq-context user of a lock,
  -- * that it's safe to take the lock in the irq-disabled
  -- * section without disabling hardirqs.
  -- *
  -- * On !CONFIG_LOCKDEP they are equivalent to the normal
  -- * irq disable/enable methods.
  --  

   procedure disable_irq_nosync_lockdep (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:311
   pragma Import (CPP, disable_irq_nosync_lockdep, "_ZL26disable_irq_nosync_lockdepj");

   procedure disable_irq_nosync_lockdep_irqsave (irq : unsigned; flags : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:319
   pragma Import (CPP, disable_irq_nosync_lockdep_irqsave, "_ZL34disable_irq_nosync_lockdep_irqsavejPm");

   procedure disable_irq_lockdep (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:327
   pragma Import (CPP, disable_irq_lockdep, "_ZL19disable_irq_lockdepj");

   procedure enable_irq_lockdep (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:335
   pragma Import (CPP, enable_irq_lockdep, "_ZL18enable_irq_lockdepj");

   procedure enable_irq_lockdep_irqrestore (irq : unsigned; flags : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:343
   pragma Import (CPP, enable_irq_lockdep_irqrestore, "_ZL29enable_irq_lockdep_irqrestorejPm");

  -- IRQ wakeup (PM) control:  
   function irq_set_irq_wake (irq : unsigned; on : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:352
   pragma Import (CPP, irq_set_irq_wake, "_Z16irq_set_irq_wakejj");

   function enable_irq_wake (irq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:354
   pragma Import (CPP, enable_irq_wake, "_ZL15enable_irq_wakej");

   function disable_irq_wake (irq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:359
   pragma Import (CPP, disable_irq_wake, "_ZL16disable_irq_wakej");

   force_irqthreads : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:366
   pragma Import (C, force_irqthreads, "force_irqthreads");

  -- Some architectures might implement lazy enabling/disabling of
  -- * interrupts. In some cases, such as stop_machine, we might want
  -- * to ensure that after a local_irq_disable(), interrupts have
  -- * really been disabled in hardware. Such architectures need to
  -- * implement the following hook.
  --  

  -- PLEASE, avoid to allocate new softirqs, if you need not _really_ high
  --   frequency threaded job scheduling. For almost all the purposes
  --   tasklets are more than enough. F.e. all serial device BHs et
  --   al. should be converted to tasklets, not to softirqs.
  --  

  -- Preferable RCU should always be the last softirq  
  -- map softirq index to softirq name. update 'softirq_to_name' in
  -- * kernel/softirq.c when adding a new softirq.
  --  

   softirq_to_name : aliased array (0 .. 9) of Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:413
   pragma Import (C, softirq_to_name, "softirq_to_name");

  -- softirq mask and active fields moved to irq_cpustat_t in
  -- * asm/hardirq.h to get better cache usage.  KAO
  --  

   type softirq_action is record
      action : access procedure (arg1 : access softirq_action);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:421
   end record;
   pragma Convention (C_Pass_By_Copy, softirq_action);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:419

   procedure do_softirq;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:424
   pragma Import (C, do_softirq, "do_softirq");

   --  skipped func __do_softirq

   procedure do_softirq_own_stack;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:428
   pragma Import (CPP, do_softirq_own_stack, "_Z20do_softirq_own_stackv");

   procedure open_softirq (nr : int; action : access procedure (arg1 : access softirq_action));  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:436
   pragma Import (CPP, open_softirq, "_Z12open_softirqiPFvP14softirq_actionE");

   procedure softirq_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:437
   pragma Import (CPP, softirq_init, "_Z12softirq_initv");

   --  skipped func __raise_softirq_irqoff

   procedure raise_softirq_irqoff (nr : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:440
   pragma Import (CPP, raise_softirq_irqoff, "_Z20raise_softirq_irqoffj");

   procedure raise_softirq (nr : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:441
   pragma Import (CPP, raise_softirq, "_Z13raise_softirqj");

   ksoftirqd : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:443
   pragma Import (C, ksoftirqd, "ksoftirqd");

   function this_cpu_ksoftirqd return access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:445
   pragma Import (CPP, this_cpu_ksoftirqd, "_ZL18this_cpu_ksoftirqdv");

  -- Tasklets --- multithreaded analogue of BHs.
  --   Main feature differing them of generic softirqs: tasklet
  --   is running only on one CPU simultaneously.
  --   Main feature differing them of BHs: different tasklets
  --   may be run simultaneously on different CPUs.
  --   Properties:
  --   * If tasklet_schedule() is called, then tasklet is guaranteed
  --     to be executed on some cpu at least once after this.
  --   * If the tasklet is already scheduled, but its execution is still not
  --     started, it will be executed only once.
  --   * If this tasklet is already running on another CPU (or schedule is called
  --     from tasklet itself), it is rescheduled for later.
  --   * Tasklet is strictly serialized wrt itself, but not
  --     wrt another tasklets. If client needs some intertask synchronization,
  --     he makes it with spinlocks.
  --  

   type tasklet_struct is record
      next : access tasklet_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:472
      state : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:473
      count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:474
      func : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:475
      data : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:476
   end record;
   pragma Convention (C_Pass_By_Copy, tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:470

  -- Tasklet is scheduled for execution  
  -- Tasklet is running (SMP only)  
   function tasklet_trylock (t : access tasklet_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:493
   pragma Import (CPP, tasklet_trylock, "_ZL15tasklet_trylockP14tasklet_struct");

   procedure tasklet_unlock (t : access tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:498
   pragma Import (CPP, tasklet_unlock, "_ZL14tasklet_unlockP14tasklet_struct");

   procedure tasklet_unlock_wait (t : access tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:504
   pragma Import (CPP, tasklet_unlock_wait, "_ZL19tasklet_unlock_waitP14tasklet_struct");

   --  skipped func __tasklet_schedule

   procedure tasklet_schedule (t : access tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:516
   pragma Import (CPP, tasklet_schedule, "_ZL16tasklet_scheduleP14tasklet_struct");

   --  skipped func __tasklet_hi_schedule

   procedure tasklet_hi_schedule (t : access tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:524
   pragma Import (CPP, tasklet_hi_schedule, "_ZL19tasklet_hi_scheduleP14tasklet_struct");

   --  skipped func __tasklet_hi_schedule_first

  -- * This version avoids touching any other tasklets. Needed for kmemcheck
  -- * in order not to take any page faults while enqueueing this tasklet;
  -- * consider VERY carefully whether you really need this or
  -- * tasklet_hi_schedule()...
  --  

   procedure tasklet_hi_schedule_first (t : access tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:538
   pragma Import (CPP, tasklet_hi_schedule_first, "_ZL25tasklet_hi_schedule_firstP14tasklet_struct");

   procedure tasklet_disable_nosync (t : access tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:545
   pragma Import (CPP, tasklet_disable_nosync, "_ZL22tasklet_disable_nosyncP14tasklet_struct");

   procedure tasklet_disable (t : access tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:551
   pragma Import (CPP, tasklet_disable, "_ZL15tasklet_disableP14tasklet_struct");

   procedure tasklet_enable (t : access tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:558
   pragma Import (CPP, tasklet_enable, "_ZL14tasklet_enableP14tasklet_struct");

   procedure tasklet_hi_enable (t : access tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:564
   pragma Import (CPP, tasklet_hi_enable, "_ZL17tasklet_hi_enableP14tasklet_struct");

   procedure tasklet_kill (t : access tasklet_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:570
   pragma Import (CPP, tasklet_kill, "_Z12tasklet_killP14tasklet_struct");

   procedure tasklet_kill_immediate (t : access tasklet_struct; cpu : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:571
   pragma Import (CPP, tasklet_kill_immediate, "_Z22tasklet_kill_immediateP14tasklet_structj");

   procedure tasklet_init
     (t : access tasklet_struct;
      func : access procedure (arg1 : unsigned_long);
      data : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:572
   pragma Import (CPP, tasklet_init, "_Z12tasklet_initP14tasklet_structPFvmEm");

   type tasklet_hrtimer is record
      timer : aliased linux_hrtimer_h.hrtimer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:576
      tasklet : aliased tasklet_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:577
      c_function : access function (arg1 : access linux_hrtimer_h.hrtimer) return linux_hrtimer_h.hrtimer_restart;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:578
   end record;
   pragma Convention (C_Pass_By_Copy, tasklet_hrtimer);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:575

   procedure tasklet_hrtimer_init
     (ttimer : access tasklet_hrtimer;
      c_function : access function (arg1 : access linux_hrtimer_h.hrtimer) return linux_hrtimer_h.hrtimer_restart;
      which_clock : linux_types_h.clockid_t;
      mode : linux_hrtimer_h.hrtimer_mode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:582
   pragma Import (CPP, tasklet_hrtimer_init, "_Z20tasklet_hrtimer_initP15tasklet_hrtimerPF15hrtimer_restartP7hrtimerEi12hrtimer_mode");

   function tasklet_hrtimer_start
     (ttimer : access tasklet_hrtimer;
      time : linux_ktime_h.ktime_t;
      mode : linux_hrtimer_h.hrtimer_mode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:587
   pragma Import (CPP, tasklet_hrtimer_start, "_ZL21tasklet_hrtimer_startP15tasklet_hrtimer5ktime12hrtimer_mode");

   procedure tasklet_hrtimer_cancel (ttimer : access tasklet_hrtimer);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:594
   pragma Import (CPP, tasklet_hrtimer_cancel, "_ZL22tasklet_hrtimer_cancelP15tasklet_hrtimer");

  -- * Autoprobing for irqs:
  -- *
  -- * probe_irq_on() and probe_irq_off() provide robust primitives
  -- * for accurate IRQ probing during kernel initialization.  They are
  -- * reasonably simple to use, are not "fooled" by spurious interrupts,
  -- * and, unlike other attempts at IRQ probing, they do not get hung on
  -- * stuck interrupts (such as unused PS2 mouse interfaces on ASUS boards).
  -- *
  -- * For reasonably foolproof probing, use them as follows:
  -- *
  -- * 1. clear and/or mask the device's internal interrupt.
  -- * 2. sti();
  -- * 3. irqs = probe_irq_on();      // "take over" all unassigned idle IRQs
  -- * 4. enable the device and cause it to trigger an interrupt.
  -- * 5. wait for the device to interrupt, using non-intrusive polling or a delay.
  -- * 6. irq = probe_irq_off(irqs);  // get IRQ number, 0=none, negative=multiple
  -- * 7. service the device to clear its pending interrupt.
  -- * 8. loop again if paranoia is required.
  -- *
  -- * probe_irq_on() returns a mask of allocated irq's.
  -- *
  -- * probe_irq_off() takes the mask as a parameter,
  -- * and returns the irq number which occurred,
  -- * or zero if none occurred, or a negative irq number
  -- * if more than one irq occurred.
  --  

  -- returns 0 on failure  
   function probe_irq_on return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:642
   pragma Import (CPP, probe_irq_on, "_Z12probe_irq_onv");

  -- returns 0 or negative on failure  
   function probe_irq_off (arg1 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:643
   pragma Import (CPP, probe_irq_off, "_Z13probe_irq_offm");

  -- returns mask of ISA interrupts  
   function probe_irq_mask (arg1 : unsigned_long) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:644
   pragma Import (CPP, probe_irq_mask, "_Z14probe_irq_maskm");

  -- Initialize /proc/irq/  
   procedure init_irq_proc;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:649
   pragma Import (CPP, init_irq_proc, "_Z13init_irq_procv");

   function show_interrupts (p : access linux_seq_file_h.seq_file; v : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:657
   pragma Import (CPP, show_interrupts, "_Z15show_interruptsP8seq_filePv");

   function arch_show_interrupts (p : access linux_seq_file_h.seq_file; prec : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:658
   pragma Import (CPP, arch_show_interrupts, "_Z20arch_show_interruptsP8seq_filei");

   function early_irq_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:660
   pragma Import (CPP, early_irq_init, "_Z14early_irq_initv");

   function arch_probe_nr_irqs return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:661
   pragma Import (CPP, arch_probe_nr_irqs, "_Z18arch_probe_nr_irqsv");

   function arch_early_irq_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/interrupt.h:662
   pragma Import (CPP, arch_early_irq_init, "_Z19arch_early_irq_initv");

end linux_interrupt_h;

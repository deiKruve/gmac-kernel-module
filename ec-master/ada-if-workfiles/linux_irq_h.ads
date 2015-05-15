pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_irqdesc_h;
with System;
with asm_generic_int_ll64_h;
with linux_cpumask_h;
with Interfaces.C.Extensions;
with linux_types_h;
with Interfaces.C.Strings;
limited with linux_seq_file_h;
limited with linux_interrupt_h;
with linux_irqreturn_h;
with linux_spinlock_types_h;

package linux_irq_h is

   --  unsupported macro: IRQF_MODIFY_MASK (IRQ_TYPE_SENSE_MASK | IRQ_NOPROBE | IRQ_NOREQUEST | IRQ_NOAUTOEN | IRQ_MOVE_PCNTXT | IRQ_LEVEL | IRQ_NO_BALANCING | IRQ_PER_CPU | IRQ_NESTED_THREAD | IRQ_NOTHREAD | IRQ_PER_CPU_DEVID | IRQ_IS_POLLED)
   --  unsupported macro: IRQ_NO_BALANCING_MASK (IRQ_PER_CPU | IRQ_NO_BALANCING)
   --  unsupported macro: ARCH_IRQ_INIT_FLAGS 0
   --  unsupported macro: IRQ_DEFAULT_INIT_FLAGS ARCH_IRQ_INIT_FLAGS
   --  arg-macro: procedure irq_alloc_descs __irq_alloc_descs(irq, from, cnt, node, THIS_MODULE)
   --    __irq_alloc_descs(irq, from, cnt, node, THIS_MODULE)
   --  arg-macro: procedure irq_alloc_desc irq_alloc_descs(-1, 0, 1, node)
   --    irq_alloc_descs(-1, 0, 1, node)
   --  arg-macro: procedure irq_alloc_desc_at irq_alloc_descs(at, at, 1, node)
   --    irq_alloc_descs(at, at, 1, node)
   --  arg-macro: procedure irq_alloc_desc_from irq_alloc_descs(-1, from, 1, node)
   --    irq_alloc_descs(-1, from, 1, node)
   --  arg-macro: procedure irq_alloc_descs_from irq_alloc_descs(-1, from, cnt, node)
   --    irq_alloc_descs(-1, from, cnt, node)
   --  arg-macro: procedure irq_reg_writel writel(val, addr)
   --    writel(val, addr)
   --  arg-macro: procedure irq_reg_readl readl(addr)
   --    readl(addr)
   --  arg-macro: function IRQ_MSK (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX
   --    return u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX;
  -- * Please do not include this file in generic code.  There is currently
  -- * no requirement for any architecture to implement anything held
  -- * within this file.
  -- *
  -- * Thanks. --rmk
  --  

   type irq_flow_handler_t is access procedure (arg1 : unsigned; arg2 : access linux_irqdesc_h.irq_desc);
   pragma Convention (C, irq_flow_handler_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:32

   type irq_preflow_handler_t is access procedure (arg1 : System.Address);
   pragma Convention (C, irq_preflow_handler_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:34

  -- * IRQ line status.
  -- *
  -- * Bits 0-7 are the same as the IRQF_* bits in linux/interrupt.h
  -- *
  -- * IRQ_TYPE_NONE		- default, unspecified type
  -- * IRQ_TYPE_EDGE_RISING		- rising edge triggered
  -- * IRQ_TYPE_EDGE_FALLING	- falling edge triggered
  -- * IRQ_TYPE_EDGE_BOTH		- rising and falling edge triggered
  -- * IRQ_TYPE_LEVEL_HIGH		- high level triggered
  -- * IRQ_TYPE_LEVEL_LOW		- low level triggered
  -- * IRQ_TYPE_LEVEL_MASK		- Mask to filter out the level bits
  -- * IRQ_TYPE_SENSE_MASK		- Mask for all the above bits
  -- * IRQ_TYPE_DEFAULT		- For use by some PICs to ask irq_set_type
  -- *				  to setup the HW to a sane default (used
  -- *                                by irqdomain map() callbacks to synchronize
  -- *                                the HW state and SW flags for a newly
  -- *                                allocated descriptor).
  -- *
  -- * IRQ_TYPE_PROBE		- Special flag for probing in progress
  -- *
  -- * Bits which can be modified via irq_set/clear/modify_status_flags()
  -- * IRQ_LEVEL			- Interrupt is level type. Will be also
  -- *				  updated in the code when the above trigger
  -- *				  bits are modified via irq_set_irq_type()
  -- * IRQ_PER_CPU			- Mark an interrupt PER_CPU. Will protect
  -- *				  it from affinity setting
  -- * IRQ_NOPROBE			- Interrupt cannot be probed by autoprobing
  -- * IRQ_NOREQUEST		- Interrupt cannot be requested via
  -- *				  request_irq()
  -- * IRQ_NOTHREAD			- Interrupt cannot be threaded
  -- * IRQ_NOAUTOEN			- Interrupt is not automatically enabled in
  -- *				  request/setup_irq()
  -- * IRQ_NO_BALANCING		- Interrupt cannot be balanced (affinity set)
  -- * IRQ_MOVE_PCNTXT		- Interrupt can be migrated from process context
  -- * IRQ_NESTED_TRHEAD		- Interrupt nests into another thread
  -- * IRQ_PER_CPU_DEVID		- Dev_id is a per-cpu variable
  -- * IRQ_IS_POLLED		- Always polled by another interrupt. Exclude
  -- *				  it from the spurious interrupt detection
  -- *				  mechanism and from core side polling.
  --  

  -- * Return value for chip->irq_set_affinity()
  -- *
  -- * IRQ_SET_MASK_OK	- OK, core updates irq_data.affinity
  -- * IRQ_SET_MASK_NOCPY	- OK, chip did update irq_data.affinity
  --  

   --  skipped empty struct irq_domain

  --*
  -- * struct irq_data - per irq and irq chip data passed down to chip functions
  -- * @mask:		precomputed bitmask for accessing the chip registers
  -- * @irq:		interrupt number
  -- * @hwirq:		hardware interrupt number, local to the interrupt domain
  -- * @node:		node index useful for balancing
  -- * @state_use_accessors: status information for irq chip functions.
  -- *			Use accessor functions to deal with it
  -- * @chip:		low level interrupt hardware access
  -- * @domain:		Interrupt translation domain; responsible for mapping
  -- *			between hwirq number and linux irq number.
  -- * @handler_data:	per-IRQ data for the irq_chip methods
  -- * @chip_data:		platform-specific per-chip private data for the chip
  -- *			methods, to allow shared chip implementations
  -- * @msi_desc:		MSI descriptor
  -- * @affinity:		IRQ affinity on SMP
  -- *
  -- * The fields here need to overlay the ones in irq_desc until we
  -- * cleaned up the direct references and switched everything over to
  -- * irq_data.
  --  

   type irq_chip;
   type irq_data is record
      mask : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:147
      irq : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:148
      hwirq : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:149
      node : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:150
      state_use_accessors : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:151
      chip : access irq_chip;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:152
      domain : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:153
      handler_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:154
      chip_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:155
      the_msi_desc : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:156
      affinity : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:157
   end record;
   pragma Convention (C_Pass_By_Copy, irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:146

  -- * Bit masks for irq_data.state
  -- *
  -- * IRQD_TRIGGER_MASK		- Mask for the trigger type bits
  -- * IRQD_SETAFFINITY_PENDING	- Affinity setting is pending
  -- * IRQD_NO_BALANCING		- Balancing disabled for this IRQ
  -- * IRQD_PER_CPU			- Interrupt is per cpu
  -- * IRQD_AFFINITY_SET		- Interrupt affinity was set
  -- * IRQD_LEVEL			- Interrupt is level triggered
  -- * IRQD_WAKEUP_STATE		- Interrupt is configured for wakeup
  -- *				  from suspend
  -- * IRDQ_MOVE_PCNTXT		- Interrupt can be moved in process
  -- *				  context
  -- * IRQD_IRQ_DISABLED		- Disabled state of the interrupt
  -- * IRQD_IRQ_MASKED		- Masked state of the interrupt
  -- * IRQD_IRQ_INPROGRESS		- In progress state of the interrupt
  --  

   function irqd_is_setaffinity_pending (d : access irq_data) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:191
   pragma Import (CPP, irqd_is_setaffinity_pending, "_ZL27irqd_is_setaffinity_pendingP8irq_data");

   function irqd_is_per_cpu (d : access irq_data) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:196
   pragma Import (CPP, irqd_is_per_cpu, "_ZL15irqd_is_per_cpuP8irq_data");

   function irqd_can_balance (d : access irq_data) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:201
   pragma Import (CPP, irqd_can_balance, "_ZL16irqd_can_balanceP8irq_data");

   function irqd_affinity_was_set (d : access irq_data) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:206
   pragma Import (CPP, irqd_affinity_was_set, "_ZL21irqd_affinity_was_setP8irq_data");

   procedure irqd_mark_affinity_was_set (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:211
   pragma Import (CPP, irqd_mark_affinity_was_set, "_ZL26irqd_mark_affinity_was_setP8irq_data");

   function irqd_get_trigger_type (d : access irq_data) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:216
   pragma Import (CPP, irqd_get_trigger_type, "_ZL21irqd_get_trigger_typeP8irq_data");

  -- * Must only be called inside irq_chip.irq_set_type() functions.
  --  

   procedure irqd_set_trigger_type (d : access irq_data; c_type : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:224
   pragma Import (CPP, irqd_set_trigger_type, "_ZL21irqd_set_trigger_typeP8irq_dataj");

   function irqd_is_level_type (d : access irq_data) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:230
   pragma Import (CPP, irqd_is_level_type, "_ZL18irqd_is_level_typeP8irq_data");

   function irqd_is_wakeup_set (d : access irq_data) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:235
   pragma Import (CPP, irqd_is_wakeup_set, "_ZL18irqd_is_wakeup_setP8irq_data");

   function irqd_can_move_in_process_context (d : access irq_data) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:240
   pragma Import (CPP, irqd_can_move_in_process_context, "_ZL32irqd_can_move_in_process_contextP8irq_data");

   function irqd_irq_disabled (d : access irq_data) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:245
   pragma Import (CPP, irqd_irq_disabled, "_ZL17irqd_irq_disabledP8irq_data");

   function irqd_irq_masked (d : access irq_data) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:250
   pragma Import (CPP, irqd_irq_masked, "_ZL15irqd_irq_maskedP8irq_data");

   function irqd_irq_inprogress (d : access irq_data) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:255
   pragma Import (CPP, irqd_irq_inprogress, "_ZL19irqd_irq_inprogressP8irq_data");

  -- * Functions for chained handlers which can be enabled/disabled by the
  -- * standard disable_irq/enable_irq calls. Must be called with
  -- * irq_desc->lock held.
  --  

   procedure irqd_set_chained_irq_inprogress (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:265
   pragma Import (CPP, irqd_set_chained_irq_inprogress, "_ZL31irqd_set_chained_irq_inprogressP8irq_data");

   procedure irqd_clr_chained_irq_inprogress (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:270
   pragma Import (CPP, irqd_clr_chained_irq_inprogress, "_ZL31irqd_clr_chained_irq_inprogressP8irq_data");

   function irqd_to_hwirq (d : access irq_data) return linux_types_h.irq_hw_number_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:275
   pragma Import (CPP, irqd_to_hwirq, "_ZL13irqd_to_hwirqP8irq_data");

  --*
  -- * struct irq_chip - hardware interrupt chip descriptor
  -- *
  -- * @name:		name for /proc/interrupts
  -- * @irq_startup:	start up the interrupt (defaults to ->enable if NULL)
  -- * @irq_shutdown:	shut down the interrupt (defaults to ->disable if NULL)
  -- * @irq_enable:		enable the interrupt (defaults to chip->unmask if NULL)
  -- * @irq_disable:	disable the interrupt
  -- * @irq_ack:		start of a new interrupt
  -- * @irq_mask:		mask an interrupt source
  -- * @irq_mask_ack:	ack and mask an interrupt source
  -- * @irq_unmask:		unmask an interrupt source
  -- * @irq_eoi:		end of interrupt
  -- * @irq_set_affinity:	set the CPU affinity on SMP machines
  -- * @irq_retrigger:	resend an IRQ to the CPU
  -- * @irq_set_type:	set the flow type (IRQ_TYPE_LEVEL/etc.) of an IRQ
  -- * @irq_set_wake:	enable/disable power-management wake-on of an IRQ
  -- * @irq_bus_lock:	function to lock access to slow bus (i2c) chips
  -- * @irq_bus_sync_unlock:function to sync and unlock slow bus (i2c) chips
  -- * @irq_cpu_online:	configure an interrupt source for a secondary CPU
  -- * @irq_cpu_offline:	un-configure an interrupt source for a secondary CPU
  -- * @irq_suspend:	function called from core code on suspend once per chip
  -- * @irq_resume:		function called from core code on resume once per chip
  -- * @irq_pm_shutdown:	function called from core code on shutdown once per chip
  -- * @irq_calc_mask:	Optional function to set irq_data.mask for special cases
  -- * @irq_print_chip:	optional to print special chip info in show_interrupts
  -- * @irq_request_resources:	optional to request resources before calling
  -- *				any other callback related to this irq
  -- * @irq_release_resources:	optional to release resources acquired with
  -- *				irq_request_resources
  -- * @flags:		chip specific flags
  --  

   type irq_chip is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:313
      irq_startup : access function (arg1 : access irq_data) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:314
      irq_shutdown : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:315
      irq_enable : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:316
      irq_disable : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:317
      irq_ack : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:319
      irq_mask : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:320
      irq_mask_ack : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:321
      irq_unmask : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:322
      irq_eoi : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:323
      irq_set_affinity : access function
           (arg1 : access irq_data;
            arg2 : access constant linux_cpumask_h.cpumask;
            arg3 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:325
      irq_retrigger : access function (arg1 : access irq_data) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:326
      irq_set_type : access function (arg1 : access irq_data; arg2 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:327
      irq_set_wake : access function (arg1 : access irq_data; arg2 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:328
      irq_bus_lock : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:330
      irq_bus_sync_unlock : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:331
      irq_cpu_online : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:333
      irq_cpu_offline : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:334
      irq_suspend : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:336
      irq_resume : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:337
      irq_pm_shutdown : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:338
      irq_calc_mask : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:340
      irq_print_chip : access procedure (arg1 : access irq_data; arg2 : access linux_seq_file_h.seq_file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:342
      irq_request_resources : access function (arg1 : access irq_data) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:343
      irq_release_resources : access procedure (arg1 : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:344
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:346
   end record;
   pragma Convention (C_Pass_By_Copy, irq_chip);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:312

  -- * irq_chip specific flags
  -- *
  -- * IRQCHIP_SET_TYPE_MASKED:	Mask before calling chip.irq_set_type()
  -- * IRQCHIP_EOI_IF_HANDLED:	Only issue irq_eoi() when irq was handled
  -- * IRQCHIP_MASK_ON_SUSPEND:	Mask non wake irqs in the suspend path
  -- * IRQCHIP_ONOFFLINE_ENABLED:	Only call irq_on/off_line callbacks
  -- *				when irq enabled
  -- * IRQCHIP_SKIP_SET_WAKE:	Skip chip.irq_set_wake(), for this irq chip
  -- * IRQCHIP_ONESHOT_SAFE:	One shot does not require mask/unmask
  -- * IRQCHIP_EOI_THREADED:	Chip requires eoi() on unmask in threaded mode
  --  

  -- This include will go away once we isolated irq_desc usage to core code  
  -- * Pick up the arch-dependent methods:
  --  

   function setup_irq (irq : unsigned; arg2 : access linux_interrupt_h.irqaction) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:390
   pragma Import (CPP, setup_irq, "_Z9setup_irqjP9irqaction");

   procedure remove_irq (irq : unsigned; act : access linux_interrupt_h.irqaction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:391
   pragma Import (CPP, remove_irq, "_Z10remove_irqjP9irqaction");

   function setup_percpu_irq (irq : unsigned; arg2 : access linux_interrupt_h.irqaction) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:392
   pragma Import (CPP, setup_percpu_irq, "_Z16setup_percpu_irqjP9irqaction");

   procedure remove_percpu_irq (irq : unsigned; act : access linux_interrupt_h.irqaction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:393
   pragma Import (CPP, remove_percpu_irq, "_Z17remove_percpu_irqjP9irqaction");

   procedure irq_cpu_online;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:395
   pragma Import (CPP, irq_cpu_online, "_Z14irq_cpu_onlinev");

   procedure irq_cpu_offline;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:396
   pragma Import (CPP, irq_cpu_offline, "_Z15irq_cpu_offlinev");

   function irq_set_affinity_locked
     (data : access irq_data;
      the_cpumask : access constant linux_cpumask_h.cpumask;
      force : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:397
   pragma Import (CPP, irq_set_affinity_locked, "_Z23irq_set_affinity_lockedP8irq_dataPK7cpumaskb");

   procedure irq_move_irq (data : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:401
   pragma Import (CPP, irq_move_irq, "_Z12irq_move_irqP8irq_data");

   procedure irq_move_masked_irq (data : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:402
   pragma Import (CPP, irq_move_masked_irq, "_Z19irq_move_masked_irqP8irq_data");

   no_irq_affinity : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:408
   pragma Import (C, no_irq_affinity, "no_irq_affinity");

   function irq_set_parent (irq : int; parent_irq : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:413
   pragma Import (CPP, irq_set_parent, "_ZL14irq_set_parentii");

  -- * Built-in IRQ handlers for various IRQ types,
  -- * callable via desc->handle_irq()
  --  

   procedure handle_level_irq (irq : unsigned; desc : access linux_irqdesc_h.irq_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:423
   pragma Import (CPP, handle_level_irq, "_Z16handle_level_irqjP8irq_desc");

   procedure handle_fasteoi_irq (irq : unsigned; desc : access linux_irqdesc_h.irq_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:424
   pragma Import (CPP, handle_fasteoi_irq, "_Z18handle_fasteoi_irqjP8irq_desc");

   procedure handle_edge_irq (irq : unsigned; desc : access linux_irqdesc_h.irq_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:425
   pragma Import (CPP, handle_edge_irq, "_Z15handle_edge_irqjP8irq_desc");

   procedure handle_edge_eoi_irq (irq : unsigned; desc : access linux_irqdesc_h.irq_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:426
   pragma Import (CPP, handle_edge_eoi_irq, "_Z19handle_edge_eoi_irqjP8irq_desc");

   procedure handle_simple_irq (irq : unsigned; desc : access linux_irqdesc_h.irq_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:427
   pragma Import (CPP, handle_simple_irq, "_Z17handle_simple_irqjP8irq_desc");

   procedure handle_percpu_irq (irq : unsigned; desc : access linux_irqdesc_h.irq_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:428
   pragma Import (CPP, handle_percpu_irq, "_Z17handle_percpu_irqjP8irq_desc");

   procedure handle_percpu_devid_irq (irq : unsigned; desc : access linux_irqdesc_h.irq_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:429
   pragma Import (CPP, handle_percpu_devid_irq, "_Z23handle_percpu_devid_irqjP8irq_desc");

   procedure handle_bad_irq (irq : unsigned; desc : access linux_irqdesc_h.irq_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:430
   pragma Import (CPP, handle_bad_irq, "_Z14handle_bad_irqjP8irq_desc");

   procedure handle_nested_irq (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:431
   pragma Import (CPP, handle_nested_irq, "_Z17handle_nested_irqj");

  -- Handling of unhandled and spurious interrupts:  
   procedure note_interrupt
     (irq : unsigned;
      desc : access linux_irqdesc_h.irq_desc;
      action_ret : linux_irqreturn_h.irqreturn_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:434
   pragma Import (CPP, note_interrupt, "_Z14note_interruptjP8irq_desc9irqreturn");

  -- Enable/disable irq debugging output:  
   function noirqdebug_setup (str : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:439
   pragma Import (CPP, noirqdebug_setup, "_Z16noirqdebug_setupPc");

  -- Checks whether the interrupt can be requested by request_irq():  
   function can_request_irq (irq : unsigned; irqflags : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:442
   pragma Import (CPP, can_request_irq, "_Z15can_request_irqjm");

  -- Dummy irq-chip implementations:  
   no_irq_chip : aliased irq_chip;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:445
   pragma Import (C, no_irq_chip, "no_irq_chip");

   dummy_irq_chip : aliased irq_chip;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:446
   pragma Import (C, dummy_irq_chip, "dummy_irq_chip");

   procedure irq_set_chip_and_handler_name
     (irq : unsigned;
      chip : access irq_chip;
      handle : irq_flow_handler_t;
      name : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:449
   pragma Import (CPP, irq_set_chip_and_handler_name, "_Z29irq_set_chip_and_handler_namejP8irq_chipPFvjP8irq_descEPKc");

   procedure irq_set_chip_and_handler
     (irq : unsigned;
      chip : access irq_chip;
      handle : irq_flow_handler_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:452
   pragma Import (CPP, irq_set_chip_and_handler, "_ZL24irq_set_chip_and_handlerjP8irq_chipPFvjP8irq_descE");

   function irq_set_percpu_devid (irq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:458
   pragma Import (CPP, irq_set_percpu_devid, "_Z20irq_set_percpu_devidj");

   --  skipped func __irq_set_handler

   procedure irq_set_handler (irq : unsigned; handle : irq_flow_handler_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:465
   pragma Import (CPP, irq_set_handler, "_ZL15irq_set_handlerjPFvjP8irq_descE");

  -- * Set a highlevel chained flow handler for a given IRQ.
  -- * (a chained handler is automatically enabled and set to
  -- *  IRQ_NOREQUEST, IRQ_NOPROBE, and IRQ_NOTHREAD)
  --  

   procedure irq_set_chained_handler (irq : unsigned; handle : irq_flow_handler_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:476
   pragma Import (CPP, irq_set_chained_handler, "_ZL23irq_set_chained_handlerjPFvjP8irq_descE");

   procedure irq_modify_status
     (irq : unsigned;
      clr : unsigned_long;
      set : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:481
   pragma Import (CPP, irq_modify_status, "_Z17irq_modify_statusjmm");

   procedure irq_set_status_flags (irq : unsigned; set : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:483
   pragma Import (CPP, irq_set_status_flags, "_ZL20irq_set_status_flagsjm");

   procedure irq_clear_status_flags (irq : unsigned; clr : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:488
   pragma Import (CPP, irq_clear_status_flags, "_ZL22irq_clear_status_flagsjm");

   procedure irq_set_noprobe (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:493
   pragma Import (CPP, irq_set_noprobe, "_ZL15irq_set_noprobej");

   procedure irq_set_probe (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:498
   pragma Import (CPP, irq_set_probe, "_ZL13irq_set_probej");

   procedure irq_set_nothread (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:503
   pragma Import (CPP, irq_set_nothread, "_ZL16irq_set_nothreadj");

   procedure irq_set_thread (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:508
   pragma Import (CPP, irq_set_thread, "_ZL14irq_set_threadj");

   procedure irq_set_nested_thread (irq : unsigned; nest : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:513
   pragma Import (CPP, irq_set_nested_thread, "_ZL21irq_set_nested_threadjb");

   procedure irq_set_percpu_devid_flags (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:521
   pragma Import (CPP, irq_set_percpu_devid_flags, "_ZL26irq_set_percpu_devid_flagsj");

  -- Set/get chip/data for an IRQ:  
   function irq_set_chip (irq : unsigned; chip : access irq_chip) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:529
   pragma Import (CPP, irq_set_chip, "_Z12irq_set_chipjP8irq_chip");

   function irq_set_handler_data (irq : unsigned; data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:530
   pragma Import (CPP, irq_set_handler_data, "_Z20irq_set_handler_datajPv");

   function irq_set_chip_data (irq : unsigned; data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:531
   pragma Import (CPP, irq_set_chip_data, "_Z17irq_set_chip_datajPv");

   function irq_set_irq_type (irq : unsigned; c_type : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:532
   pragma Import (CPP, irq_set_irq_type, "_Z16irq_set_irq_typejj");

   function irq_set_msi_desc (irq : unsigned; c_entry : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:533
   pragma Import (CPP, irq_set_msi_desc, "_Z16irq_set_msi_descjP8msi_desc");

   function irq_set_msi_desc_off
     (irq_base : unsigned;
      irq_offset : unsigned;
      c_entry : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:534
   pragma Import (CPP, irq_set_msi_desc_off, "_Z20irq_set_msi_desc_offjjP8msi_desc");

   function irq_get_irq_data (irq : unsigned) return access irq_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:536
   pragma Import (CPP, irq_get_irq_data, "_Z16irq_get_irq_dataj");

   function irq_get_chip (irq : unsigned) return access irq_chip;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:538
   pragma Import (CPP, irq_get_chip, "_ZL12irq_get_chipj");

   function irq_data_get_irq_chip (d : access irq_data) return access irq_chip;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:544
   pragma Import (CPP, irq_data_get_irq_chip, "_ZL21irq_data_get_irq_chipP8irq_data");

   function irq_get_chip_data (irq : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:549
   pragma Import (CPP, irq_get_chip_data, "_ZL17irq_get_chip_dataj");

   function irq_data_get_irq_chip_data (d : access irq_data) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:555
   pragma Import (CPP, irq_data_get_irq_chip_data, "_ZL26irq_data_get_irq_chip_dataP8irq_data");

   function irq_get_handler_data (irq : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:560
   pragma Import (CPP, irq_get_handler_data, "_ZL20irq_get_handler_dataj");

   function irq_data_get_irq_handler_data (d : access irq_data) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:566
   pragma Import (CPP, irq_data_get_irq_handler_data, "_ZL29irq_data_get_irq_handler_dataP8irq_data");

   function irq_get_msi_desc (irq : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:571
   pragma Import (CPP, irq_get_msi_desc, "_ZL16irq_get_msi_descj");

   function irq_data_get_msi (d : access irq_data) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:577
   pragma Import (CPP, irq_data_get_msi, "_ZL16irq_data_get_msiP8irq_data");

   function irq_get_trigger_type (irq : unsigned) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:582
   pragma Import (CPP, irq_get_trigger_type, "_ZL20irq_get_trigger_typej");

   function arch_dynirq_lower_bound (from : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:588
   pragma Import (CPP, arch_dynirq_lower_bound, "_Z23arch_dynirq_lower_boundj");

   --  skipped func __irq_alloc_descs

  -- use macros to avoid needing export.h for THIS_MODULE  
   procedure irq_free_descs (irq : unsigned; cnt : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:609
   pragma Import (CPP, irq_free_descs, "_Z14irq_free_descsjj");

   procedure irq_free_desc (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:610
   pragma Import (CPP, irq_free_desc, "_ZL13irq_free_descj");

   function irq_alloc_hwirqs (cnt : int; node : int) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:616
   pragma Import (CPP, irq_alloc_hwirqs, "_Z16irq_alloc_hwirqsii");

   function irq_alloc_hwirq (node : int) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:617
   pragma Import (CPP, irq_alloc_hwirq, "_ZL15irq_alloc_hwirqi");

   procedure irq_free_hwirqs (from : unsigned; cnt : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:621
   pragma Import (CPP, irq_free_hwirqs, "_Z15irq_free_hwirqsji");

   procedure irq_free_hwirq (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:622
   pragma Import (CPP, irq_free_hwirq, "_ZL14irq_free_hwirqj");

   function arch_setup_hwirq (irq : unsigned; node : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:626
   pragma Import (CPP, arch_setup_hwirq, "_Z16arch_setup_hwirqji");

   procedure arch_teardown_hwirq (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:627
   pragma Import (CPP, arch_teardown_hwirq, "_Z19arch_teardown_hwirqj");

  --*
  -- * struct irq_chip_regs - register offsets for struct irq_gci
  -- * @enable:	Enable register offset to reg_base
  -- * @disable:	Disable register offset to reg_base
  -- * @mask:	Mask register offset to reg_base
  -- * @ack:	Ack register offset to reg_base
  -- * @eoi:	Eoi register offset to reg_base
  -- * @type:	Type configuration register offset to reg_base
  -- * @polarity:	Polarity configuration register offset to reg_base
  --  

   type irq_chip_regs is record
      enable : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:652
      disable : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:653
      mask : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:654
      ack : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:655
      eoi : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:656
      c_type : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:657
      polarity : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:658
   end record;
   pragma Convention (C_Pass_By_Copy, irq_chip_regs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:651

  --*
  -- * struct irq_chip_type - Generic interrupt chip instance for a flow type
  -- * @chip:		The real interrupt chip which provides the callbacks
  -- * @regs:		Register offsets for this chip
  -- * @handler:		Flow handler associated with this chip
  -- * @type:		Chip can handle these flow types
  -- * @mask_cache_priv:	Cached mask register private to the chip type
  -- * @mask_cache:		Pointer to cached mask register
  -- *
  -- * A irq_generic_chip can have several instances of irq_chip_type when
  -- * it requires different functions and register offsets for different
  -- * flow types.
  --  

   type irq_chip_type is record
      chip : aliased irq_chip;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:675
      regs : aliased irq_chip_regs;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:676
      handler : irq_flow_handler_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:677
      c_type : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:678
      mask_cache_priv : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:679
      mask_cache : access asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:680
   end record;
   pragma Convention (C_Pass_By_Copy, irq_chip_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:674

  --*
  -- * struct irq_chip_generic - Generic irq chip data structure
  -- * @lock:		Lock to protect register and cache data access
  -- * @reg_base:		Register base address (virtual)
  -- * @irq_base:		Interrupt base nr for this chip
  -- * @irq_cnt:		Number of interrupts handled by this chip
  -- * @mask_cache:		Cached mask register shared between all chip types
  -- * @type_cache:		Cached type register
  -- * @polarity_cache:	Cached polarity register
  -- * @wake_enabled:	Interrupt can wakeup from suspend
  -- * @wake_active:	Interrupt is marked as an wakeup from suspend source
  -- * @num_ct:		Number of available irq_chip_type instances (usually 1)
  -- * @private:		Private data for non generic chip callbacks
  -- * @installed:		bitfield to denote installed interrupts
  -- * @unused:		bitfield to denote unused interrupts
  -- * @domain:		irq domain pointer
  -- * @list:		List head for keeping track of instances
  -- * @chip_types:		Array of interrupt irq_chip_types
  -- *
  -- * Note, that irq_chip_generic can have multiple irq_chip_type
  -- * implementations which can be associated to a particular irq line of
  -- * an irq_chip_generic instance. That allows to share and protect
  -- * state in an irq_chip_generic instance when we need to implement
  -- * different flow mechanisms (level/edge) for it.
  --  

   type irq_chip_generic_chip_types_array is array (0 .. -1) of aliased irq_chip_type;
   type irq_chip_generic is record
      lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:709
      reg_base : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:710
      irq_base : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:711
      irq_cnt : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:712
      mask_cache : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:713
      type_cache : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:714
      polarity_cache : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:715
      wake_enabled : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:716
      wake_active : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:717
      num_ct : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:718
      installed : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:720
      unused : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:721
      domain : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:722
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:723
      chip_types : aliased irq_chip_generic_chip_types_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:724
   end record;
   pragma Convention (C_Pass_By_Copy, irq_chip_generic);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:708

  --*
  -- * enum irq_gc_flags - Initialization flags for generic irq chips
  -- * @IRQ_GC_INIT_MASK_CACHE:	Initialize the mask_cache by reading mask reg
  -- * @IRQ_GC_INIT_NESTED_LOCK:	Set the lock class of the irqs to nested for
  -- *				irq chips which need to call irq_set_wake() on
  -- *				the parent irq. Usually GPIO implementations
  -- * @IRQ_GC_MASK_CACHE_PER_TYPE:	Mask cache is chip type private
  -- * @IRQ_GC_NO_MASK:		Do not calculate irq_data->mask
  --  

   subtype irq_gc_flags is unsigned;
   IRQ_GC_INIT_MASK_CACHE : constant irq_gc_flags := 1;
   IRQ_GC_INIT_NESTED_LOCK : constant irq_gc_flags := 2;
   IRQ_GC_MASK_CACHE_PER_TYPE : constant irq_gc_flags := 4;
   IRQ_GC_NO_MASK : constant irq_gc_flags := 8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:736

  -- * struct irq_domain_chip_generic - Generic irq chip data structure for irq domains
  -- * @irqs_per_chip:	Number of interrupts per chip
  -- * @num_chips:		Number of chips
  -- * @irq_flags_to_set:	IRQ* flags to set on irq setup
  -- * @irq_flags_to_clear:	IRQ* flags to clear on irq setup
  -- * @gc_flags:		Generic chip specific setup flags
  -- * @gc:			Array of pointers to generic interrupt chips
  --  

   type irq_domain_chip_generic_gc_array is array (0 .. -1) of access irq_chip_generic;
   type irq_domain_chip_generic is record
      irqs_per_chip : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:753
      num_chips : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:754
      irq_flags_to_clear : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:755
      irq_flags_to_set : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:756
      gc_flags : aliased irq_gc_flags;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:757
      gc : aliased irq_domain_chip_generic_gc_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:758
   end record;
   pragma Convention (C_Pass_By_Copy, irq_domain_chip_generic);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:752

  -- Generic chip callback functions  
   procedure irq_gc_noop (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:762
   pragma Import (CPP, irq_gc_noop, "_Z11irq_gc_noopP8irq_data");

   procedure irq_gc_mask_disable_reg (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:763
   pragma Import (CPP, irq_gc_mask_disable_reg, "_Z23irq_gc_mask_disable_regP8irq_data");

   procedure irq_gc_mask_set_bit (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:764
   pragma Import (CPP, irq_gc_mask_set_bit, "_Z19irq_gc_mask_set_bitP8irq_data");

   procedure irq_gc_mask_clr_bit (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:765
   pragma Import (CPP, irq_gc_mask_clr_bit, "_Z19irq_gc_mask_clr_bitP8irq_data");

   procedure irq_gc_unmask_enable_reg (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:766
   pragma Import (CPP, irq_gc_unmask_enable_reg, "_Z24irq_gc_unmask_enable_regP8irq_data");

   procedure irq_gc_ack_set_bit (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:767
   pragma Import (CPP, irq_gc_ack_set_bit, "_Z18irq_gc_ack_set_bitP8irq_data");

   procedure irq_gc_ack_clr_bit (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:768
   pragma Import (CPP, irq_gc_ack_clr_bit, "_Z18irq_gc_ack_clr_bitP8irq_data");

   procedure irq_gc_mask_disable_reg_and_ack (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:769
   pragma Import (CPP, irq_gc_mask_disable_reg_and_ack, "_Z31irq_gc_mask_disable_reg_and_ackP8irq_data");

   procedure irq_gc_eoi (d : access irq_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:770
   pragma Import (CPP, irq_gc_eoi, "_Z10irq_gc_eoiP8irq_data");

   function irq_gc_set_wake (d : access irq_data; on : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:771
   pragma Import (CPP, irq_gc_set_wake, "_Z15irq_gc_set_wakeP8irq_dataj");

  -- Setup functions for irq_chip_generic  
   function irq_alloc_generic_chip
     (name : Interfaces.C.Strings.chars_ptr;
      nr_ct : int;
      irq_base : unsigned;
      reg_base : System.Address;
      handler : irq_flow_handler_t) return access irq_chip_generic;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:775
   pragma Import (CPP, irq_alloc_generic_chip, "_Z22irq_alloc_generic_chipPKcijPvPFvjP8irq_descE");

   procedure irq_setup_generic_chip
     (gc : access irq_chip_generic;
      msk : asm_generic_int_ll64_h.u32;
      flags : irq_gc_flags;
      clr : unsigned;
      set : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:777
   pragma Import (CPP, irq_setup_generic_chip, "_Z22irq_setup_generic_chipP16irq_chip_genericj12irq_gc_flagsjj");

   function irq_setup_alt_chip (d : access irq_data; c_type : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:780
   pragma Import (CPP, irq_setup_alt_chip, "_Z18irq_setup_alt_chipP8irq_dataj");

   procedure irq_remove_generic_chip
     (gc : access irq_chip_generic;
      msk : asm_generic_int_ll64_h.u32;
      clr : unsigned;
      set : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:781
   pragma Import (CPP, irq_remove_generic_chip, "_Z23irq_remove_generic_chipP16irq_chip_genericjjj");

   function irq_get_domain_generic_chip (d : System.Address; hw_irq : unsigned) return access irq_chip_generic;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:784
   pragma Import (CPP, irq_get_domain_generic_chip, "_Z27irq_get_domain_generic_chipP10irq_domainj");

   function irq_alloc_domain_generic_chips
     (d : System.Address;
      irqs_per_chip : int;
      num_ct : int;
      name : Interfaces.C.Strings.chars_ptr;
      handler : irq_flow_handler_t;
      clr : unsigned;
      set : unsigned;
      flags : irq_gc_flags) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:785
   pragma Import (CPP, irq_alloc_domain_generic_chips, "_Z30irq_alloc_domain_generic_chipsP10irq_domainiiPKcPFvjP8irq_descEjj12irq_gc_flags");

   function irq_data_get_chip_type (d : access irq_data) return access irq_chip_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:792
   pragma Import (CPP, irq_data_get_chip_type, "_ZL22irq_data_get_chip_typeP8irq_data");

   procedure irq_gc_lock (gc : access irq_chip_generic);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:800
   pragma Import (CPP, irq_gc_lock, "_ZL11irq_gc_lockP16irq_chip_generic");

   procedure irq_gc_unlock (gc : access irq_chip_generic);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irq.h:805
   pragma Import (CPP, irq_gc_unlock, "_ZL13irq_gc_unlockP16irq_chip_generic");

end linux_irq_h;

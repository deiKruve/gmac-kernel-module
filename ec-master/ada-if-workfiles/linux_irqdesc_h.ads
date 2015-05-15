pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_irq_h;
limited with linux_interrupt_h;
with linux_types_h;
with linux_spinlock_types_h;
with linux_cpumask_h;
with linux_wait_h;
with System;
with Interfaces.C.Strings;
limited with linux_lockdep_h;

package linux_irqdesc_h is

  -- * Core internal functions to deal with irq descriptors
  -- *
  -- * This include will move to kernel/irq once we cleaned up the tree.
  -- * For now it's included from <linux/irq.h>
  --  

  --*
  -- * struct irq_desc - interrupt descriptor
  -- * @irq_data:		per irq and chip data passed down to chip functions
  -- * @kstat_irqs:		irq stats per cpu
  -- * @handle_irq:		highlevel irq-events handler
  -- * @preflow_handler:	handler called before the flow handler (currently used by sparc)
  -- * @action:		the irq action chain
  -- * @status:		status information
  -- * @core_internal_state__do_not_mess_with_it: core internal status information
  -- * @depth:		disable-depth, for nested irq_disable() calls
  -- * @wake_depth:		enable depth, for multiple irq_set_irq_wake() callers
  -- * @irq_count:		stats field to detect stalled irqs
  -- * @last_unhandled:	aging timer for unhandled count
  -- * @irqs_unhandled:	stats field for spurious unhandled interrupts
  -- * @threads_handled:	stats field for deferred spurious detection of threaded handlers
  -- * @threads_handled_last: comparator field for deferred spurious detection of theraded handlers
  -- * @lock:		locking for SMP
  -- * @affinity_hint:	hint to user space for preferred irq affinity
  -- * @affinity_notify:	context for notification of affinity changes
  -- * @pending_mask:	pending rebalanced interrupts
  -- * @threads_oneshot:	bitfield to handle shared oneshot threads
  -- * @threads_active:	number of irqaction threads currently running
  -- * @wait_for_threads:	wait queue for sync_irq to wait for threaded handlers
  -- * @dir:		/proc/irq/ procfs entry
  -- * @name:		flow handler name for /proc/interrupts output
  --  

   type irq_desc is record
      the_irq_data : aliased linux_irq_h.irq_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:43
      kstat_irqs : access unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:44
      handle_irq : linux_irq_h.irq_flow_handler_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:45
      action : access linux_interrupt_h.irqaction;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:49
      status_use_accessors : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:50
      core_internal_state_u_do_not_mess_with_it : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:51
      depth : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:52
      wake_depth : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:53
      irq_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:54
      last_unhandled : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:55
      irqs_unhandled : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:56
      threads_handled : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:57
      threads_handled_last : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:58
      lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:59
      percpu_enabled : access linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:60
      affinity_hint : access constant linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:62
      affinity_notify : access linux_interrupt_h.irq_affinity_notify;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:63
      pending_mask : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:65
      threads_oneshot : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:68
      threads_active : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:69
      wait_for_threads : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:70
      dir : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:72
      parent_irq : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:74
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:75
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:76
   end record;
   pragma Convention (C_Pass_By_Copy, irq_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:42

  -- IRQ action list  
  -- nested irq disables  
  -- nested wake enables  
  -- For detecting broken IRQs  
  -- Aging timer for unhandled count  
   function irq_desc_get_irq_data (desc : access irq_desc) return access linux_irq_h.irq_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:83
   pragma Import (CPP, irq_desc_get_irq_data, "_ZL21irq_desc_get_irq_dataP8irq_desc");

   function irq_desc_get_chip (desc : access irq_desc) return access linux_irq_h.irq_chip;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:88
   pragma Import (CPP, irq_desc_get_chip, "_ZL17irq_desc_get_chipP8irq_desc");

   function irq_desc_get_chip_data (desc : access irq_desc) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:93
   pragma Import (CPP, irq_desc_get_chip_data, "_ZL22irq_desc_get_chip_dataP8irq_desc");

   function irq_desc_get_handler_data (desc : access irq_desc) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:98
   pragma Import (CPP, irq_desc_get_handler_data, "_ZL25irq_desc_get_handler_dataP8irq_desc");

   function irq_desc_get_msi_desc (desc : access irq_desc) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:103
   pragma Import (CPP, irq_desc_get_msi_desc, "_ZL21irq_desc_get_msi_descP8irq_desc");

  -- * Architectures call this to let the generic IRQ layer
  -- * handle an interrupt. If the descriptor is attached to an
  -- * irqchip-style controller then we call the ->handle_irq() handler,
  -- * and it calls __do_IRQ() if it's attached to an irqtype-style controller.
  --  

   procedure generic_handle_irq_desc (irq : unsigned; desc : access irq_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:114
   pragma Import (CPP, generic_handle_irq_desc, "_ZL23generic_handle_irq_descjP8irq_desc");

   function generic_handle_irq (irq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:119
   pragma Import (CPP, generic_handle_irq, "_Z18generic_handle_irqj");

  -- Test to see if a driver has successfully requested an irq  
   function irq_has_action (irq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:122
   pragma Import (CPP, irq_has_action, "_ZL14irq_has_actionj");

  -- caller has locked the irq_desc and both params are valid  
   --  skipped func __irq_set_handler_locked

  -- caller has locked the irq_desc and both params are valid  
   --  skipped func __irq_set_chip_handler_name_locked

   function irq_balancing_disabled (irq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:151
   pragma Import (CPP, irq_balancing_disabled, "_ZL22irq_balancing_disabledj");

   function irq_is_percpu (irq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:159
   pragma Import (CPP, irq_is_percpu, "_ZL13irq_is_percpuj");

   procedure irq_set_lockdep_class (irq : unsigned; arg2 : access linux_lockdep_h.lock_class_key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqdesc.h:168
   pragma Import (CPP, irq_set_lockdep_class, "_ZL21irq_set_lockdep_classjP14lock_class_key");

end linux_irqdesc_h;

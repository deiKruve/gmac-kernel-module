pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_device_h;
with Interfaces.C.Extensions;
with linux_types_h;
with linux_spinlock_types_h;
with linux_completion_h;
limited with linux_pm_wakeup_h;
with linux_timer_h;
with linux_workqueue_h;
with linux_wait_h;
with asm_generic_int_ll64_h;
limited with linux_pm_qos_h;
with System;

package linux_pm_h is

   --  arg-macro: procedure SET_SYSTEM_SLEEP_PM_OPS .suspend := suspend_fn, .resume := resume_fn, .freeze := suspend_fn, .thaw := resume_fn, .poweroff := suspend_fn, .restore := resume_fn,
   --    .suspend := suspend_fn, .resume := resume_fn, .freeze := suspend_fn, .thaw := resume_fn, .poweroff := suspend_fn, .restore := resume_fn,
   --  arg-macro: procedure SET_LATE_SYSTEM_SLEEP_PM_OPS .suspend_late := suspend_fn, .resume_early := resume_fn, .freeze_late := suspend_fn, .thaw_early := resume_fn, .poweroff_late := suspend_fn, .restore_early := resume_fn,
   --    .suspend_late := suspend_fn, .resume_early := resume_fn, .freeze_late := suspend_fn, .thaw_early := resume_fn, .poweroff_late := suspend_fn, .restore_early := resume_fn,
   --  arg-macro: procedure SET_RUNTIME_PM_OPS .runtime_suspend := suspend_fn, .runtime_resume := resume_fn, .runtime_idle := idle_fn,
   --    .runtime_suspend := suspend_fn, .runtime_resume := resume_fn, .runtime_idle := idle_fn,
   --  arg-macro: procedure SET_PM_RUNTIME_PM_OPS .runtime_suspend := suspend_fn, .runtime_resume := resume_fn, .runtime_idle := idle_fn,
   --    .runtime_suspend := suspend_fn, .runtime_resume := resume_fn, .runtime_idle := idle_fn,
   --  arg-macro: procedure SIMPLE_DEV_PM_OPS const struct dev_pm_ops name := { SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) }
   --    const struct dev_pm_ops name := { SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) }
   --  arg-macro: procedure UNIVERSAL_DEV_PM_OPS const struct dev_pm_ops name := { SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) SET_RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn) }
   --    const struct dev_pm_ops name := { SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) SET_RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn) }
   --  unsupported macro: PM_EVENT_INVALID (-1)
   --  unsupported macro: PM_EVENT_ON 0x0000
   --  unsupported macro: PM_EVENT_FREEZE 0x0001
   --  unsupported macro: PM_EVENT_SUSPEND 0x0002
   --  unsupported macro: PM_EVENT_HIBERNATE 0x0004
   --  unsupported macro: PM_EVENT_QUIESCE 0x0008
   --  unsupported macro: PM_EVENT_RESUME 0x0010
   --  unsupported macro: PM_EVENT_THAW 0x0020
   --  unsupported macro: PM_EVENT_RESTORE 0x0040
   --  unsupported macro: PM_EVENT_RECOVER 0x0080
   --  unsupported macro: PM_EVENT_USER 0x0100
   --  unsupported macro: PM_EVENT_REMOTE 0x0200
   --  unsupported macro: PM_EVENT_AUTO 0x0400
   --  unsupported macro: PM_EVENT_SLEEP (PM_EVENT_SUSPEND | PM_EVENT_HIBERNATE)
   --  unsupported macro: PM_EVENT_USER_SUSPEND (PM_EVENT_USER | PM_EVENT_SUSPEND)
   --  unsupported macro: PM_EVENT_USER_RESUME (PM_EVENT_USER | PM_EVENT_RESUME)
   --  unsupported macro: PM_EVENT_REMOTE_RESUME (PM_EVENT_REMOTE | PM_EVENT_RESUME)
   --  unsupported macro: PM_EVENT_AUTO_SUSPEND (PM_EVENT_AUTO | PM_EVENT_SUSPEND)
   --  unsupported macro: PM_EVENT_AUTO_RESUME (PM_EVENT_AUTO | PM_EVENT_RESUME)
   --  unsupported macro: PMSG_INVALID ((struct pm_message){ .event = PM_EVENT_INVALID, })
   --  unsupported macro: PMSG_ON ((struct pm_message){ .event = PM_EVENT_ON, })
   --  unsupported macro: PMSG_FREEZE ((struct pm_message){ .event = PM_EVENT_FREEZE, })
   --  unsupported macro: PMSG_QUIESCE ((struct pm_message){ .event = PM_EVENT_QUIESCE, })
   --  unsupported macro: PMSG_SUSPEND ((struct pm_message){ .event = PM_EVENT_SUSPEND, })
   --  unsupported macro: PMSG_HIBERNATE ((struct pm_message){ .event = PM_EVENT_HIBERNATE, })
   --  unsupported macro: PMSG_RESUME ((struct pm_message){ .event = PM_EVENT_RESUME, })
   --  unsupported macro: PMSG_THAW ((struct pm_message){ .event = PM_EVENT_THAW, })
   --  unsupported macro: PMSG_RESTORE ((struct pm_message){ .event = PM_EVENT_RESTORE, })
   --  unsupported macro: PMSG_RECOVER ((struct pm_message){ .event = PM_EVENT_RECOVER, })
   --  unsupported macro: PMSG_USER_SUSPEND ((struct pm_message) { .event = PM_EVENT_USER_SUSPEND, })
   --  unsupported macro: PMSG_USER_RESUME ((struct pm_message) { .event = PM_EVENT_USER_RESUME, })
   --  unsupported macro: PMSG_REMOTE_RESUME ((struct pm_message) { .event = PM_EVENT_REMOTE_RESUME, })
   --  unsupported macro: PMSG_AUTO_SUSPEND ((struct pm_message) { .event = PM_EVENT_AUTO_SUSPEND, })
   --  unsupported macro: PMSG_AUTO_RESUME ((struct pm_message) { .event = PM_EVENT_AUTO_RESUME, })
   --  arg-macro: function PMSG_IS_AUTO (((msg).event and PM_EVENT_AUTO) /= 0
   --    return ((msg).event and PM_EVENT_AUTO) /= 0;
   --  unsupported macro: PM_EVENT_PRETHAW PM_EVENT_QUIESCE
   --  arg-macro: procedure suspend_report_result do { __suspend_report_result(__func__, fn, ret); } while (0)
   --    do { __suspend_report_result(__func__, fn, ret); } while (0)
  -- *  pm.h - Power management interface
  -- *
  -- *  Copyright (C) 2000 Andrew Henroid
  -- *
  -- *  This program is free software; you can redistribute it and/or modify
  -- *  it under the terms of the GNU General Public License as published by
  -- *  the Free Software Foundation; either version 2 of the License, or
  -- *  (at your option) any later version.
  -- *
  -- *  This program is distributed in the hope that it will be useful,
  -- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- *  GNU General Public License for more details.
  -- *
  -- *  You should have received a copy of the GNU General Public License
  -- *  along with this program; if not, write to the Free Software
  -- *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  --  

  -- * Callbacks for platform drivers to implement.
  --  

   pm_power_off : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:34
   pragma Import (C, pm_power_off, "pm_power_off");

   pm_power_off_prepare : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:35
   pragma Import (C, pm_power_off_prepare, "pm_power_off_prepare");

  -- we have a circular dep with device.h  
   procedure pm_vt_switch_required (dev : access linux_device_h.device; required : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:39
   pragma Import (CPP, pm_vt_switch_required, "_Z21pm_vt_switch_requiredP6deviceb");

   procedure pm_vt_switch_unregister (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:40
   pragma Import (CPP, pm_vt_switch_unregister, "_Z23pm_vt_switch_unregisterP6device");

  -- * Device power management
  --  

  -- = "power"  
   power_group_name : aliased Interfaces.C.char_array (size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:57
   pragma Import (C, power_group_name, "power_group_name");

   type pm_message is record
      event : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:63
   end record;
   pragma Convention (C_Pass_By_Copy, pm_message);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:62

   subtype pm_message_t is pm_message;

  --*
  -- * struct dev_pm_ops - device PM callbacks
  -- *
  -- * Several device power state transitions are externally visible, affecting
  -- * the state of pending I/O queues and (for drivers that touch hardware)
  -- * interrupts, wakeups, DMA, and other hardware state.  There may also be
  -- * internal transitions to various low-power modes which are transparent
  -- * to the rest of the driver stack (such as a driver that's ON gating off
  -- * clocks which are not in active use).
  -- *
  -- * The externally visible transitions are handled with the help of callbacks
  -- * included in this structure in such a way that two levels of callbacks are
  -- * involved.  First, the PM core executes callbacks provided by PM domains,
  -- * device types, classes and bus types.  They are the subsystem-level callbacks
  -- * supposed to execute callbacks provided by device drivers, although they may
  -- * choose not to do that.  If the driver callbacks are executed, they have to
  -- * collaborate with the subsystem-level callbacks to achieve the goals
  -- * appropriate for the given system transition, given transition phase and the
  -- * subsystem the device belongs to.
  -- *
  -- * @prepare: The principal role of this callback is to prevent new children of
  -- *	the device from being registered after it has returned (the driver's
  -- *	subsystem and generally the rest of the kernel is supposed to prevent
  -- *	new calls to the probe method from being made too once @prepare() has
  -- *	succeeded).  If @prepare() detects a situation it cannot handle (e.g.
  -- *	registration of a child already in progress), it may return -EAGAIN, so
  -- *	that the PM core can execute it once again (e.g. after a new child has
  -- *	been registered) to recover from the race condition.
  -- *	This method is executed for all kinds of suspend transitions and is
  -- *	followed by one of the suspend callbacks: @suspend(), @freeze(), or
  -- *	@poweroff().  If the transition is a suspend to memory or standby (that
  -- *	is, not related to hibernation), the return value of @prepare() may be
  -- *	used to indicate to the PM core to leave the device in runtime suspend
  -- *	if applicable.  Namely, if @prepare() returns a positive number, the PM
  -- *	core will understand that as a declaration that the device appears to be
  -- *	runtime-suspended and it may be left in that state during the entire
  -- *	transition and during the subsequent resume if all of its descendants
  -- *	are left in runtime suspend too.  If that happens, @complete() will be
  -- *	executed directly after @prepare() and it must ensure the proper
  -- *	functioning of the device after the system resume.
  -- *	The PM core executes subsystem-level @prepare() for all devices before
  -- *	starting to invoke suspend callbacks for any of them, so generally
  -- *	devices may be assumed to be functional or to respond to runtime resume
  -- *	requests while @prepare() is being executed.  However, device drivers
  -- *	may NOT assume anything about the availability of user space at that
  -- *	time and it is NOT valid to request firmware from within @prepare()
  -- *	(it's too late to do that).  It also is NOT valid to allocate
  -- *	substantial amounts of memory from @prepare() in the GFP_KERNEL mode.
  -- *	[To work around these limitations, drivers may register suspend and
  -- *	hibernation notifiers to be executed before the freezing of tasks.]
  -- *
  -- * @complete: Undo the changes made by @prepare().  This method is executed for
  -- *	all kinds of resume transitions, following one of the resume callbacks:
  -- *	@resume(), @thaw(), @restore().  Also called if the state transition
  -- *	fails before the driver's suspend callback: @suspend(), @freeze() or
  -- *	@poweroff(), can be executed (e.g. if the suspend callback fails for one
  -- *	of the other devices that the PM core has unsuccessfully attempted to
  -- *	suspend earlier).
  -- *	The PM core executes subsystem-level @complete() after it has executed
  -- *	the appropriate resume callbacks for all devices.  If the corresponding
  -- *	@prepare() at the beginning of the suspend transition returned a
  -- *	positive number and the device was left in runtime suspend (without
  -- *	executing any suspend and resume callbacks for it), @complete() will be
  -- *	the only callback executed for the device during resume.  In that case,
  -- *	@complete() must be prepared to do whatever is necessary to ensure the
  -- *	proper functioning of the device after the system resume.  To this end,
  -- *	@complete() can check the power.direct_complete flag of the device to
  -- *	learn whether (unset) or not (set) the previous suspend and resume
  -- *	callbacks have been executed for it.
  -- *
  -- * @suspend: Executed before putting the system into a sleep state in which the
  -- *	contents of main memory are preserved.  The exact action to perform
  -- *	depends on the device's subsystem (PM domain, device type, class or bus
  -- *	type), but generally the device must be quiescent after subsystem-level
  -- *	@suspend() has returned, so that it doesn't do any I/O or DMA.
  -- *	Subsystem-level @suspend() is executed for all devices after invoking
  -- *	subsystem-level @prepare() for all of them.
  -- *
  -- * @suspend_late: Continue operations started by @suspend().  For a number of
  -- *	devices @suspend_late() may point to the same callback routine as the
  -- *	runtime suspend callback.
  -- *
  -- * @resume: Executed after waking the system up from a sleep state in which the
  -- *	contents of main memory were preserved.  The exact action to perform
  -- *	depends on the device's subsystem, but generally the driver is expected
  -- *	to start working again, responding to hardware events and software
  -- *	requests (the device itself may be left in a low-power state, waiting
  -- *	for a runtime resume to occur).  The state of the device at the time its
  -- *	driver's @resume() callback is run depends on the platform and subsystem
  -- *	the device belongs to.  On most platforms, there are no restrictions on
  -- *	availability of resources like clocks during @resume().
  -- *	Subsystem-level @resume() is executed for all devices after invoking
  -- *	subsystem-level @resume_noirq() for all of them.
  -- *
  -- * @resume_early: Prepare to execute @resume().  For a number of devices
  -- *	@resume_early() may point to the same callback routine as the runtime
  -- *	resume callback.
  -- *
  -- * @freeze: Hibernation-specific, executed before creating a hibernation image.
  -- *	Analogous to @suspend(), but it should not enable the device to signal
  -- *	wakeup events or change its power state.  The majority of subsystems
  -- *	(with the notable exception of the PCI bus type) expect the driver-level
  -- *	@freeze() to save the device settings in memory to be used by @restore()
  -- *	during the subsequent resume from hibernation.
  -- *	Subsystem-level @freeze() is executed for all devices after invoking
  -- *	subsystem-level @prepare() for all of them.
  -- *
  -- * @freeze_late: Continue operations started by @freeze().  Analogous to
  -- *	@suspend_late(), but it should not enable the device to signal wakeup
  -- *	events or change its power state.
  -- *
  -- * @thaw: Hibernation-specific, executed after creating a hibernation image OR
  -- *	if the creation of an image has failed.  Also executed after a failing
  -- *	attempt to restore the contents of main memory from such an image.
  -- *	Undo the changes made by the preceding @freeze(), so the device can be
  -- *	operated in the same way as immediately before the call to @freeze().
  -- *	Subsystem-level @thaw() is executed for all devices after invoking
  -- *	subsystem-level @thaw_noirq() for all of them.  It also may be executed
  -- *	directly after @freeze() in case of a transition error.
  -- *
  -- * @thaw_early: Prepare to execute @thaw().  Undo the changes made by the
  -- *	preceding @freeze_late().
  -- *
  -- * @poweroff: Hibernation-specific, executed after saving a hibernation image.
  -- *	Analogous to @suspend(), but it need not save the device's settings in
  -- *	memory.
  -- *	Subsystem-level @poweroff() is executed for all devices after invoking
  -- *	subsystem-level @prepare() for all of them.
  -- *
  -- * @poweroff_late: Continue operations started by @poweroff().  Analogous to
  -- *	@suspend_late(), but it need not save the device's settings in memory.
  -- *
  -- * @restore: Hibernation-specific, executed after restoring the contents of main
  -- *	memory from a hibernation image, analogous to @resume().
  -- *
  -- * @restore_early: Prepare to execute @restore(), analogous to @resume_early().
  -- *
  -- * @suspend_noirq: Complete the actions started by @suspend().  Carry out any
  -- *	additional operations required for suspending the device that might be
  -- *	racing with its driver's interrupt handler, which is guaranteed not to
  -- *	run while @suspend_noirq() is being executed.
  -- *	It generally is expected that the device will be in a low-power state
  -- *	(appropriate for the target system sleep state) after subsystem-level
  -- *	@suspend_noirq() has returned successfully.  If the device can generate
  -- *	system wakeup signals and is enabled to wake up the system, it should be
  -- *	configured to do so at that time.  However, depending on the platform
  -- *	and device's subsystem, @suspend() or @suspend_late() may be allowed to
  -- *	put the device into the low-power state and configure it to generate
  -- *	wakeup signals, in which case it generally is not necessary to define
  -- *	@suspend_noirq().
  -- *
  -- * @resume_noirq: Prepare for the execution of @resume() by carrying out any
  -- *	operations required for resuming the device that might be racing with
  -- *	its driver's interrupt handler, which is guaranteed not to run while
  -- *	@resume_noirq() is being executed.
  -- *
  -- * @freeze_noirq: Complete the actions started by @freeze().  Carry out any
  -- *	additional operations required for freezing the device that might be
  -- *	racing with its driver's interrupt handler, which is guaranteed not to
  -- *	run while @freeze_noirq() is being executed.
  -- *	The power state of the device should not be changed by either @freeze(),
  -- *	or @freeze_late(), or @freeze_noirq() and it should not be configured to
  -- *	signal system wakeup by any of these callbacks.
  -- *
  -- * @thaw_noirq: Prepare for the execution of @thaw() by carrying out any
  -- *	operations required for thawing the device that might be racing with its
  -- *	driver's interrupt handler, which is guaranteed not to run while
  -- *	@thaw_noirq() is being executed.
  -- *
  -- * @poweroff_noirq: Complete the actions started by @poweroff().  Analogous to
  -- *	@suspend_noirq(), but it need not save the device's settings in memory.
  -- *
  -- * @restore_noirq: Prepare for the execution of @restore() by carrying out any
  -- *	operations required for thawing the device that might be racing with its
  -- *	driver's interrupt handler, which is guaranteed not to run while
  -- *	@restore_noirq() is being executed.  Analogous to @resume_noirq().
  -- *
  -- * All of the above callbacks, except for @complete(), return error codes.
  -- * However, the error codes returned by the resume operations, @resume(),
  -- * @thaw(), @restore(), @resume_noirq(), @thaw_noirq(), and @restore_noirq(), do
  -- * not cause the PM core to abort the resume transition during which they are
  -- * returned.  The error codes returned in those cases are only printed by the PM
  -- * core to the system logs for debugging purposes.  Still, it is recommended
  -- * that drivers only return error codes from their resume methods in case of an
  -- * unrecoverable failure (i.e. when the device being handled refuses to resume
  -- * and becomes unusable) to allow us to modify the PM core in the future, so
  -- * that it can avoid attempting to handle devices that failed to resume and
  -- * their children.
  -- *
  -- * It is allowed to unregister devices while the above callbacks are being
  -- * executed.  However, a callback routine must NOT try to unregister the device
  -- * it was called for, although it may unregister children of that device (for
  -- * example, if it detects that a child was unplugged while the system was
  -- * asleep).
  -- *
  -- * Refer to Documentation/power/devices.txt for more information about the role
  -- * of the above callbacks in the system suspend process.
  -- *
  -- * There also are callbacks related to runtime power management of devices.
  -- * Again, these callbacks are executed by the PM core only for subsystems
  -- * (PM domains, device types, classes and bus types) and the subsystem-level
  -- * callbacks are supposed to invoke the driver callbacks.  Moreover, the exact
  -- * actions to be performed by a device driver's callbacks generally depend on
  -- * the platform and subsystem the device belongs to.
  -- *
  -- * @runtime_suspend: Prepare the device for a condition in which it won't be
  -- *	able to communicate with the CPU(s) and RAM due to power management.
  -- *	This need not mean that the device should be put into a low-power state.
  -- *	For example, if the device is behind a link which is about to be turned
  -- *	off, the device may remain at full power.  If the device does go to low
  -- *	power and is capable of generating runtime wakeup events, remote wakeup
  -- *	(i.e., a hardware mechanism allowing the device to request a change of
  -- *	its power state via an interrupt) should be enabled for it.
  -- *
  -- * @runtime_resume: Put the device into the fully active state in response to a
  -- *	wakeup event generated by hardware or at the request of software.  If
  -- *	necessary, put the device into the full-power state and restore its
  -- *	registers, so that it is fully operational.
  -- *
  -- * @runtime_idle: Device appears to be inactive and it might be put into a
  -- *	low-power state if all of the necessary conditions are satisfied.
  -- *	Check these conditions, and return 0 if it's appropriate to let the PM
  -- *	core queue a suspend request for the device.
  -- *
  -- * Refer to Documentation/power/runtime_pm.txt for more information about the
  -- * role of the above callbacks in device runtime power management.
  -- *
  --  

   type dev_pm_ops is record
      prepare : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:296
      complete : access procedure (arg1 : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:297
      suspend : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:298
      resume : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:299
      freeze : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:300
      thaw : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:301
      poweroff : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:302
      restore : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:303
      suspend_late : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:304
      resume_early : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:305
      freeze_late : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:306
      thaw_early : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:307
      poweroff_late : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:308
      restore_early : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:309
      suspend_noirq : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:310
      resume_noirq : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:311
      freeze_noirq : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:312
      thaw_noirq : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:313
      poweroff_noirq : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:314
      restore_noirq : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:315
      runtime_suspend : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:316
      runtime_resume : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:317
      runtime_idle : access function (arg1 : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:318
   end record;
   pragma Convention (C_Pass_By_Copy, dev_pm_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:295

  -- * Use this if you want to use the same suspend and resume callbacks for suspend
  -- * to RAM and hibernation.
  --  

  -- * Use this for defining a set of PM operations to be used in all situations
  -- * (system suspend, hibernation or runtime PM).
  -- * NOTE: In general, system suspend callbacks, .suspend() and .resume(), should
  -- * be different from the corresponding runtime PM callbacks, .runtime_suspend(),
  -- * and .runtime_resume(), because .runtime_suspend() always works on an already
  -- * quiescent device, while .suspend() should assume that the device may be doing
  -- * something when it is called (it should ensure that the device will be
  -- * quiescent after it has returned).  Therefore it's better to point the "late"
  -- * suspend and "early" resume callback pointers, .suspend_late() and
  -- * .resume_early(), to the same routines as .runtime_suspend() and
  -- * .runtime_resume(), respectively (and analogously for hibernation).
  --  

  --*
  -- * PM_EVENT_ messages
  -- *
  -- * The following PM_EVENT_ messages are defined for the internal use of the PM
  -- * core, in order to provide a mechanism allowing the high level suspend and
  -- * hibernation code to convey the necessary information to the device PM core
  -- * code:
  -- *
  -- * ON		No transition.
  -- *
  -- * FREEZE	System is going to hibernate, call ->prepare() and ->freeze()
  -- *		for all devices.
  -- *
  -- * SUSPEND	System is going to suspend, call ->prepare() and ->suspend()
  -- *		for all devices.
  -- *
  -- * HIBERNATE	Hibernation image has been saved, call ->prepare() and
  -- *		->poweroff() for all devices.
  -- *
  -- * QUIESCE	Contents of main memory are going to be restored from a (loaded)
  -- *		hibernation image, call ->prepare() and ->freeze() for all
  -- *		devices.
  -- *
  -- * RESUME	System is resuming, call ->resume() and ->complete() for all
  -- *		devices.
  -- *
  -- * THAW		Hibernation image has been created, call ->thaw() and
  -- *		->complete() for all devices.
  -- *
  -- * RESTORE	Contents of main memory have been restored from a hibernation
  -- *		image, call ->restore() and ->complete() for all devices.
  -- *
  -- * RECOVER	Creation of a hibernation image or restoration of the main
  -- *		memory contents from a hibernation image has failed, call
  -- *		->thaw() and ->complete() for all devices.
  -- *
  -- * The following PM_EVENT_ messages are defined for internal use by
  -- * kernel subsystems.  They are never issued by the PM core.
  -- *
  -- * USER_SUSPEND		Manual selective suspend was issued by userspace.
  -- *
  -- * USER_RESUME		Manual selective resume was issued by userspace.
  -- *
  -- * REMOTE_WAKEUP	Remote-wakeup request was received from the device.
  -- *
  -- * AUTO_SUSPEND		Automatic (device idle) runtime suspend was
  -- *			initiated by the subsystem.
  -- *
  -- * AUTO_RESUME		Automatic (device needed) runtime resume was
  -- *			requested by a driver.
  --  

  --*
  -- * Device run-time power management status.
  -- *
  -- * These status labels are used internally by the PM core to indicate the
  -- * current status of a device with respect to the PM core operations.  They do
  -- * not reflect the actual power state of the device or its status as seen by the
  -- * driver.
  -- *
  -- * RPM_ACTIVE		Device is fully operational.  Indicates that the device
  -- *			bus type's ->runtime_resume() callback has completed
  -- *			successfully.
  -- *
  -- * RPM_SUSPENDED	Device bus type's ->runtime_suspend() callback has
  -- *			completed successfully.  The device is regarded as
  -- *			suspended.
  -- *
  -- * RPM_RESUMING		Device bus type's ->runtime_resume() callback is being
  -- *			executed.
  -- *
  -- * RPM_SUSPENDING	Device bus type's ->runtime_suspend() callback is being
  -- *			executed.
  --  

   type rpm_status is 
     (RPM_ACTIVE,
      RPM_RESUMING,
      RPM_SUSPENDED,
      RPM_SUSPENDING);
   pragma Convention (C, rpm_status);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:510

  --*
  -- * Device run-time power management request types.
  -- *
  -- * RPM_REQ_NONE		Do nothing.
  -- *
  -- * RPM_REQ_IDLE		Run the device bus type's ->runtime_idle() callback
  -- *
  -- * RPM_REQ_SUSPEND	Run the device bus type's ->runtime_suspend() callback
  -- *
  -- * RPM_REQ_AUTOSUSPEND	Same as RPM_REQ_SUSPEND, but not until the device has
  -- *			been inactive for as long as power.autosuspend_delay
  -- *
  -- * RPM_REQ_RESUME	Run the device bus type's ->runtime_resume() callback
  --  

   type rpm_request is 
     (RPM_REQ_NONE,
      RPM_REQ_IDLE,
      RPM_REQ_SUSPEND,
      RPM_REQ_AUTOSUSPEND,
      RPM_REQ_RESUME);
   pragma Convention (C, rpm_request);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:532

   type pm_domain_data is record
      list_node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:543
      dev : access linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:544
   end record;
   pragma Convention (C_Pass_By_Copy, pm_domain_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:542

   type pm_subsys_data is record
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:548
      refcount : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:549
      clock_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:551
   end record;
   pragma Convention (C_Pass_By_Copy, pm_subsys_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:547

   type dev_pm_info is record
      power_state : aliased pm_message_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:559
      can_wakeup : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:560
      async_suspend : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:561
      is_prepared : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:562
      is_suspended : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:563
      is_noirq_suspended : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:564
      is_late_suspended : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:565
      ignore_children : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:566
      early_init : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:567
      direct_complete : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:568
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:569
      c_entry : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:571
      the_completion : aliased linux_completion_h.completion;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:572
      wakeup : access linux_pm_wakeup_h.wakeup_source;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:573
      wakeup_path : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:574
      syscore : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:575
      suspend_timer : aliased linux_timer_h.timer_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:580
      timer_expires : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:581
      work : aliased linux_workqueue_h.work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:582
      wait_queue : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:583
      usage_count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:584
      child_count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:585
      disable_depth : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:586
      idle_notification : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:587
      request_pending : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:588
      deferred_resume : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:589
      run_wake : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:590
      runtime_auto : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:591
      no_callbacks : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:592
      irq_safe : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:593
      use_autosuspend : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:594
      timer_autosuspends : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:595
      memalloc_noio : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:596
      request : aliased rpm_request;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:597
      runtime_status : aliased rpm_status;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:598
      runtime_error : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:599
      autosuspend_delay : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:600
      last_busy : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:601
      active_jiffies : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:602
      suspended_jiffies : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:603
      accounting_timestamp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:604
      subsys_data : access pm_subsys_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:606
      set_latency_tolerance : access procedure (arg1 : access linux_device_h.device; arg2 : asm_generic_int_ll64_h.s32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:607
      qos : access linux_pm_qos_h.dev_pm_qos;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:608
   end record;
   pragma Convention (C_Pass_By_Copy, dev_pm_info);
   pragma Pack (dev_pm_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:558

  -- Owned by the PM core  
  -- Ditto  
  -- Owned by the PM core  
  -- Owned by the PM core  
  -- Owned by the subsystem.  
   procedure update_pm_runtime_accounting (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:611
   pragma Import (CPP, update_pm_runtime_accounting, "_Z28update_pm_runtime_accountingP6device");

   function dev_pm_get_subsys_data (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:612
   pragma Import (CPP, dev_pm_get_subsys_data, "_Z22dev_pm_get_subsys_dataP6device");

   function dev_pm_put_subsys_data (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:613
   pragma Import (CPP, dev_pm_put_subsys_data, "_Z22dev_pm_put_subsys_dataP6device");

  -- * Power domains provide callbacks that are executed during system suspend,
  -- * hibernation, system resume and during runtime PM transitions along with
  -- * subsystem-level and driver-level callbacks.
  --  

   type dev_pm_domain is record
      ops : aliased dev_pm_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:621
   end record;
   pragma Convention (C_Pass_By_Copy, dev_pm_domain);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:620

  -- * The PM_EVENT_ messages are also used by drivers implementing the legacy
  -- * suspend framework, based on the ->suspend() and ->resume() callbacks common
  -- * for suspend and hibernation transitions, according to the rules below.
  --  

  -- Necessary, because several drivers use PM_EVENT_PRETHAW  
  -- * One transition is triggered by resume(), after a suspend() call; the
  -- * message is implicit:
  -- *
  -- * ON		Driver starts working again, responding to hardware events
  -- *		and software requests.  The hardware may have gone through
  -- *		a power-off reset, or it may have maintained state from the
  -- *		previous suspend() which the driver will rely on while
  -- *		resuming.  On most platforms, there are no restrictions on
  -- *		availability of resources like clocks during resume().
  -- *
  -- * Other transitions are triggered by messages sent using suspend().  All
  -- * these transitions quiesce the driver, so that I/O queues are inactive.
  -- * That commonly entails turning off IRQs and DMA; there may be rules
  -- * about how to quiesce that are specific to the bus or the device's type.
  -- * (For example, network drivers mark the link state.)  Other details may
  -- * differ according to the message:
  -- *
  -- * SUSPEND	Quiesce, enter a low power device state appropriate for
  -- *		the upcoming system state (such as PCI_D3hot), and enable
  -- *		wakeup events as appropriate.
  -- *
  -- * HIBERNATE	Enter a low power device state appropriate for the hibernation
  -- *		state (eg. ACPI S4) and enable wakeup events as appropriate.
  -- *
  -- * FREEZE	Quiesce operations so that a consistent image can be saved;
  -- *		but do NOT otherwise enter a low power device state, and do
  -- *		NOT emit system wakeup events.
  -- *
  -- * PRETHAW	Quiesce as if for FREEZE; additionally, prepare for restoring
  -- *		the system from a snapshot taken after an earlier FREEZE.
  -- *		Some drivers will need to reset their hardware state instead
  -- *		of preserving it, to ensure that it's never mistaken for the
  -- *		state which that earlier snapshot had set up.
  -- *
  -- * A minimally power-aware driver treats all messages as SUSPEND, fully
  -- * reinitializes its device during resume() -- whether or not it was reset
  -- * during the suspend/resume cycle -- and can't issue wakeup events.
  -- *
  -- * More power-aware drivers may also use low power states at runtime as
  -- * well as during system sleep states like PM_SUSPEND_STANDBY.  They may
  -- * be able to use wakeup events to exit from runtime low-power states,
  -- * or from system low-power states such as standby or suspend-to-RAM.
  --  

   procedure device_pm_lock;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:679
   pragma Import (CPP, device_pm_lock, "_Z14device_pm_lockv");

   procedure dpm_resume_start (state : pm_message_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:680
   pragma Import (CPP, dpm_resume_start, "_Z16dpm_resume_start10pm_message");

   procedure dpm_resume_end (state : pm_message_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:681
   pragma Import (CPP, dpm_resume_end, "_Z14dpm_resume_end10pm_message");

   procedure dpm_resume (state : pm_message_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:682
   pragma Import (CPP, dpm_resume, "_Z10dpm_resume10pm_message");

   procedure dpm_complete (state : pm_message_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:683
   pragma Import (CPP, dpm_complete, "_Z12dpm_complete10pm_message");

   procedure device_pm_unlock;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:685
   pragma Import (CPP, device_pm_unlock, "_Z16device_pm_unlockv");

   function dpm_suspend_end (state : pm_message_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:686
   pragma Import (CPP, dpm_suspend_end, "_Z15dpm_suspend_end10pm_message");

   function dpm_suspend_start (state : pm_message_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:687
   pragma Import (CPP, dpm_suspend_start, "_Z17dpm_suspend_start10pm_message");

   function dpm_suspend (state : pm_message_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:688
   pragma Import (CPP, dpm_suspend, "_Z11dpm_suspend10pm_message");

   function dpm_prepare (state : pm_message_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:689
   pragma Import (CPP, dpm_prepare, "_Z11dpm_prepare10pm_message");

   --  skipped func __suspend_report_result

   function device_pm_wait_for_dev (sub : access linux_device_h.device; dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:698
   pragma Import (CPP, device_pm_wait_for_dev, "_Z22device_pm_wait_for_devP6deviceS0_");

   procedure dpm_for_each_dev (data : System.Address; fn : access procedure (arg1 : access linux_device_h.device; arg2 : System.Address));  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:699
   pragma Import (CPP, dpm_for_each_dev, "_Z16dpm_for_each_devPvPFvP6deviceS_E");

   function pm_generic_prepare (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:701
   pragma Import (CPP, pm_generic_prepare, "_Z18pm_generic_prepareP6device");

   function pm_generic_suspend_late (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:702
   pragma Import (CPP, pm_generic_suspend_late, "_Z23pm_generic_suspend_lateP6device");

   function pm_generic_suspend_noirq (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:703
   pragma Import (CPP, pm_generic_suspend_noirq, "_Z24pm_generic_suspend_noirqP6device");

   function pm_generic_suspend (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:704
   pragma Import (CPP, pm_generic_suspend, "_Z18pm_generic_suspendP6device");

   function pm_generic_resume_early (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:705
   pragma Import (CPP, pm_generic_resume_early, "_Z23pm_generic_resume_earlyP6device");

   function pm_generic_resume_noirq (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:706
   pragma Import (CPP, pm_generic_resume_noirq, "_Z23pm_generic_resume_noirqP6device");

   function pm_generic_resume (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:707
   pragma Import (CPP, pm_generic_resume, "_Z17pm_generic_resumeP6device");

   function pm_generic_freeze_noirq (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:708
   pragma Import (CPP, pm_generic_freeze_noirq, "_Z23pm_generic_freeze_noirqP6device");

   function pm_generic_freeze_late (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:709
   pragma Import (CPP, pm_generic_freeze_late, "_Z22pm_generic_freeze_lateP6device");

   function pm_generic_freeze (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:710
   pragma Import (CPP, pm_generic_freeze, "_Z17pm_generic_freezeP6device");

   function pm_generic_thaw_noirq (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:711
   pragma Import (CPP, pm_generic_thaw_noirq, "_Z21pm_generic_thaw_noirqP6device");

   function pm_generic_thaw_early (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:712
   pragma Import (CPP, pm_generic_thaw_early, "_Z21pm_generic_thaw_earlyP6device");

   function pm_generic_thaw (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:713
   pragma Import (CPP, pm_generic_thaw, "_Z15pm_generic_thawP6device");

   function pm_generic_restore_noirq (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:714
   pragma Import (CPP, pm_generic_restore_noirq, "_Z24pm_generic_restore_noirqP6device");

   function pm_generic_restore_early (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:715
   pragma Import (CPP, pm_generic_restore_early, "_Z24pm_generic_restore_earlyP6device");

   function pm_generic_restore (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:716
   pragma Import (CPP, pm_generic_restore, "_Z18pm_generic_restoreP6device");

   function pm_generic_poweroff_noirq (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:717
   pragma Import (CPP, pm_generic_poweroff_noirq, "_Z25pm_generic_poweroff_noirqP6device");

   function pm_generic_poweroff_late (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:718
   pragma Import (CPP, pm_generic_poweroff_late, "_Z24pm_generic_poweroff_lateP6device");

   function pm_generic_poweroff (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:719
   pragma Import (CPP, pm_generic_poweroff, "_Z19pm_generic_poweroffP6device");

   procedure pm_generic_complete (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:720
   pragma Import (CPP, pm_generic_complete, "_Z19pm_generic_completeP6device");

  -- How to reorder dpm_list after device_move()  
   type dpm_order is 
     (DPM_ORDER_NONE,
      DPM_ORDER_DEV_AFTER_PARENT,
      DPM_ORDER_PARENT_BEFORE_DEV,
      DPM_ORDER_DEV_LAST);
   pragma Convention (C, dpm_order);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm.h:766

end linux_pm_h;

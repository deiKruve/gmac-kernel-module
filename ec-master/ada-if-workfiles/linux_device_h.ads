pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_sysfs_h;
with System;
with Interfaces.C.Strings;
with linux_types_h;
with linux_kobject_h;
with linux_pm_h;
with linux_lockdep_h;
with linux_klist_h;
limited with linux_notifier_h;
with Interfaces.C.Extensions;
limited with linux_uidgid_h;
limited with linux_ioport_h;
with linux_mutex_h;
limited with linux_pinctrl_devinfo_h;
with asm_generic_int_ll64_h;
with asm_device_h;
with linux_spinlock_types_h;

package linux_device_h is

   --  unsupported macro: BUS_ATTR(_name,_mode,_show,_store) struct bus_attribute bus_attr_ ##_name = __ATTR(_name, _mode, _show, _store)
   --  unsupported macro: BUS_ATTR_RW(_name) struct bus_attribute bus_attr_ ##_name = __ATTR_RW(_name)
   --  unsupported macro: BUS_ATTR_RO(_name) struct bus_attribute bus_attr_ ##_name = __ATTR_RO(_name)
   --  unsupported macro: BUS_NOTIFY_ADD_DEVICE 0x00000001
   --  unsupported macro: BUS_NOTIFY_DEL_DEVICE 0x00000002
   --  unsupported macro: BUS_NOTIFY_BIND_DRIVER 0x00000003
   --  unsupported macro: BUS_NOTIFY_BOUND_DRIVER 0x00000004
   --  unsupported macro: BUS_NOTIFY_UNBIND_DRIVER 0x00000005
   --  unsupported macro: BUS_NOTIFY_UNBOUND_DRIVER 0x00000006
   --  unsupported macro: DRIVER_ATTR(_name,_mode,_show,_store) struct driver_attribute driver_attr_ ##_name = __ATTR(_name, _mode, _show, _store)
   --  unsupported macro: DRIVER_ATTR_RW(_name) struct driver_attribute driver_attr_ ##_name = __ATTR_RW(_name)
   --  unsupported macro: DRIVER_ATTR_RO(_name) struct driver_attribute driver_attr_ ##_name = __ATTR_RO(_name)
   --  unsupported macro: DRIVER_ATTR_WO(_name) struct driver_attribute driver_attr_ ##_name = __ATTR_WO(_name)
   --  arg-macro: function class_register ({ static struct lock_class_key __key; __class_register(class, and__key); }
   --    return { static struct lock_class_key __key; __class_register(class, and__key); };
   --  unsupported macro: CLASS_ATTR(_name,_mode,_show,_store) struct class_attribute class_attr_ ##_name = __ATTR(_name, _mode, _show, _store)
   --  unsupported macro: CLASS_ATTR_RW(_name) struct class_attribute class_attr_ ##_name = __ATTR_RW(_name)
   --  unsupported macro: CLASS_ATTR_RO(_name) struct class_attribute class_attr_ ##_name = __ATTR_RO(_name)
   --  unsupported macro: CLASS_ATTR_STRING(_name,_mode,_str) struct class_attribute_string class_attr_ ##_name = _CLASS_ATTR_STRING(_name, _mode, _str)
   --  arg-macro: function class_create ({ static struct lock_class_key __key; __class_create(owner, name, and__key); }
   --    return { static struct lock_class_key __key; __class_create(owner, name, and__key); };
   --  unsupported macro: DEVICE_ATTR(_name,_mode,_show,_store) struct device_attribute dev_attr_ ##_name = __ATTR(_name, _mode, _show, _store)
   --  unsupported macro: DEVICE_ATTR_RW(_name) struct device_attribute dev_attr_ ##_name = __ATTR_RW(_name)
   --  unsupported macro: DEVICE_ATTR_RO(_name) struct device_attribute dev_attr_ ##_name = __ATTR_RO(_name)
   --  unsupported macro: DEVICE_ATTR_WO(_name) struct device_attribute dev_attr_ ##_name = __ATTR_WO(_name)
   --  unsupported macro: DEVICE_ULONG_ATTR(_name,_mode,_var) struct dev_ext_attribute dev_attr_ ##_name = { __ATTR(_name, _mode, device_show_ulong, device_store_ulong), &(_var) }
   --  unsupported macro: DEVICE_INT_ATTR(_name,_mode,_var) struct dev_ext_attribute dev_attr_ ##_name = { __ATTR(_name, _mode, device_show_int, device_store_int), &(_var) }
   --  unsupported macro: DEVICE_BOOL_ATTR(_name,_mode,_var) struct dev_ext_attribute dev_attr_ ##_name = { __ATTR(_name, _mode, device_show_bool, device_store_bool), &(_var) }
   --  unsupported macro: DEVICE_ATTR_IGNORE_LOCKDEP(_name,_mode,_show,_store) struct device_attribute dev_attr_ ##_name = __ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)
   --  arg-macro: procedure root_device_register __root_device_register(name, THIS_MODULE)
   --    __root_device_register(name, THIS_MODULE)
   --  unsupported macro: dev_info(dev,fmt,arg...) _dev_info(dev, fmt, ##arg)
   --  unsupported macro: dev_dbg(dev,format,...) do { dynamic_dev_dbg(dev, format, ##__VA_ARGS__); } while (0)
   --  unsupported macro: dev_level_ratelimited(dev_level,dev,fmt,...) do { static DEFINE_RATELIMIT_STATE(_rs, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST); if (__ratelimit(&_rs)) dev_level(dev, fmt, ##__VA_ARGS__); } while (0)
   --  unsupported macro: dev_emerg_ratelimited(dev,fmt,...) dev_level_ratelimited(dev_emerg, dev, fmt, ##__VA_ARGS__)
   --  unsupported macro: dev_alert_ratelimited(dev,fmt,...) dev_level_ratelimited(dev_alert, dev, fmt, ##__VA_ARGS__)
   --  unsupported macro: dev_crit_ratelimited(dev,fmt,...) dev_level_ratelimited(dev_crit, dev, fmt, ##__VA_ARGS__)
   --  unsupported macro: dev_err_ratelimited(dev,fmt,...) dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
   --  unsupported macro: dev_warn_ratelimited(dev,fmt,...) dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
   --  unsupported macro: dev_notice_ratelimited(dev,fmt,...) dev_level_ratelimited(dev_notice, dev, fmt, ##__VA_ARGS__)
   --  unsupported macro: dev_info_ratelimited(dev,fmt,...) dev_level_ratelimited(dev_info, dev, fmt, ##__VA_ARGS__)
   --  unsupported macro: dev_dbg_ratelimited(dev,fmt,...) do { static DEFINE_RATELIMIT_STATE(_rs, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST); DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt); if (unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT) && __ratelimit(&_rs)) __dynamic_dev_dbg(&descriptor, dev, fmt, ##__VA_ARGS__); } while (0)
   --  unsupported macro: dev_vdbg(dev,format,arg...) ({ if (0) dev_printk(KERN_DEBUG, dev, format, ##arg); 0; })
   --  unsupported macro: dev_WARN(dev,format,arg...) WARN(1, "%s %s: " format, dev_driver_string(dev), dev_name(dev), ## arg);
   --  unsupported macro: dev_WARN_ONCE(dev,condition,format,arg...) WARN_ONCE(condition, "%s %s: " format, dev_driver_string(dev), dev_name(dev), ## arg)
   --  arg-macro: procedure MODULE_ALIAS_CHARDEV MODULE_ALIAS("char-major-" __stringify(major) "-" __stringify(minor))
   --    MODULE_ALIAS("char-major-" __stringify(major) "-" __stringify(minor))
   --  arg-macro: procedure MODULE_ALIAS_CHARDEV_MAJOR MODULE_ALIAS("char-major-" __stringify(major) "-*")
   --    MODULE_ALIAS("char-major-" __stringify(major) "-*")
   --  unsupported macro: sysfs_deprecated 0
   --  unsupported macro: module_driver(__driver,__register,__unregister,...) static int __init __driver ##_init(void) { return __register(&(__driver) , ##__VA_ARGS__); } module_init(__driver ##_init); static void __exit __driver ##_exit(void) { __unregister(&(__driver) , ##__VA_ARGS__); } module_exit(__driver ##_exit);
  -- * device.h - generic, centralized driver model
  -- *
  -- * Copyright (c) 2001-2003 Patrick Mochel <mochel@osdl.org>
  -- * Copyright (c) 2004-2009 Greg Kroah-Hartman <gregkh@suse.de>
  -- * Copyright (c) 2008-2009 Novell Inc.
  -- *
  -- * This file is released under the GPLv2
  -- *
  -- * See Documentation/driver-model/ for more information.
  --  

   --  skipped empty struct device_private

   --  skipped empty struct driver_private

   --  skipped empty struct subsys_private

   --  skipped empty struct device_node

   --  skipped empty struct iommu_ops

   --  skipped empty struct iommu_group

   type bus_attribute is record
      attr : aliased linux_sysfs_h.attribute;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:45
      show : access function (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:46
      store : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:47
   end record;
   pragma Convention (C_Pass_By_Copy, bus_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:44

   function bus_create_file (arg1 : System.Address; arg2 : access bus_attribute) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:57
   pragma Import (CPP, bus_create_file, "_Z15bus_create_fileP8bus_typeP13bus_attribute");

   procedure bus_remove_file (arg1 : System.Address; arg2 : access bus_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:59
   pragma Import (CPP, bus_remove_file, "_Z15bus_remove_fileP8bus_typeP13bus_attribute");

  --*
  -- * struct bus_type - The bus type of the device
  -- *
  -- * @name:	The name of the bus.
  -- * @dev_name:	Used for subsystems to enumerate devices like ("foo%u", dev->id).
  -- * @dev_root:	Default device to use as the parent.
  -- * @dev_attrs:	Default attributes of the devices on the bus.
  -- * @bus_groups:	Default attributes of the bus.
  -- * @dev_groups:	Default attributes of the devices on the bus.
  -- * @drv_groups: Default attributes of the device drivers on the bus.
  -- * @match:	Called, perhaps multiple times, whenever a new device or driver
  -- *		is added for this bus. It should return a nonzero value if the
  -- *		given device can be handled by the given driver.
  -- * @uevent:	Called when a device is added, removed, or a few other things
  -- *		that generate uevents to add the environment variables.
  -- * @probe:	Called when a new device or driver add to this bus, and callback
  -- *		the specific driver's probe to initial the matched device.
  -- * @remove:	Called when a device removed from this bus.
  -- * @shutdown:	Called at shut-down time to quiesce the device.
  -- *
  -- * @online:	Called to put the device back online (after offlining it).
  -- * @offline:	Called to put the device offline for hot-removal. May fail.
  -- *
  -- * @suspend:	Called when a device on this bus wants to go to sleep mode.
  -- * @resume:	Called to bring a device on this bus out of sleep mode.
  -- * @pm:		Power management operations of this bus, callback the specific
  -- *		device driver's pm-ops.
  -- * @iommu_ops:  IOMMU specific operations for this bus, used to attach IOMMU
  -- *              driver implementations to a bus and allow the driver to do
  -- *              bus-specific setup
  -- * @p:		The private data of the driver core, only the driver core can
  -- *		touch this.
  -- * @lock_key:	Lock class key for use by the lock validator
  -- *
  -- * A bus is a channel between the processor and one or more devices. For the
  -- * purposes of the device model, all devices are connected via a bus, even if
  -- * it is an internal, virtual, "platform" bus. Buses can plug into each other.
  -- * A USB controller is usually a PCI device, for example. The device model
  -- * represents the actual connections between buses and the devices they control.
  -- * A bus is represented by the bus_type structure. It contains the name, the
  -- * default attributes, the bus' methods, PM operations, and the driver core's
  -- * private data.
  --  

   type device;
   type device_attribute;
   type bus_type is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:105
      dev_name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:106
      dev_root : access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:107
      dev_attrs : access device_attribute;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:108
      bus_groups : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:109
      dev_groups : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:110
      drv_groups : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:111
      match : access function (arg1 : access device; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:113
      uevent : access function (arg1 : access device; arg2 : access linux_kobject_h.kobj_uevent_env) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:114
      probe : access function (arg1 : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:115
      remove : access function (arg1 : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:116
      shutdown : access procedure (arg1 : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:117
      online : access function (arg1 : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:119
      offline : access function (arg1 : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:120
      suspend : access function (arg1 : access device; arg2 : linux_pm_h.pm_message_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:122
      resume : access function (arg1 : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:123
      pm : access constant linux_pm_h.dev_pm_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:125
      the_iommu_ops : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:127
      p : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:129
      lock_key : aliased linux_lockdep_h.lock_class_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:130
   end record;
   pragma Convention (C_Pass_By_Copy, bus_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:104

  -- use dev_groups instead  
   function bus_register (bus : access bus_type) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:133
   pragma Import (CPP, bus_register, "_Z12bus_registerP8bus_type");

   procedure bus_unregister (bus : access bus_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:135
   pragma Import (CPP, bus_unregister, "_Z14bus_unregisterP8bus_type");

   function bus_rescan_devices (bus : access bus_type) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:137
   pragma Import (CPP, bus_rescan_devices, "_Z18bus_rescan_devicesP8bus_type");

  -- iterator helpers for buses  
   type device_type;
   type subsys_dev_iter is record
      ki : aliased linux_klist_h.klist_iter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:141
      c_type : access constant device_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:142
   end record;
   pragma Convention (C_Pass_By_Copy, subsys_dev_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:140

   procedure subsys_dev_iter_init
     (iter : access subsys_dev_iter;
      subsys : access bus_type;
      start : access device;
      c_type : access constant device_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:144
   pragma Import (CPP, subsys_dev_iter_init, "_Z20subsys_dev_iter_initP15subsys_dev_iterP8bus_typeP6devicePK11device_type");

   function subsys_dev_iter_next (iter : access subsys_dev_iter) return access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:148
   pragma Import (CPP, subsys_dev_iter_next, "_Z20subsys_dev_iter_nextP15subsys_dev_iter");

   procedure subsys_dev_iter_exit (iter : access subsys_dev_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:149
   pragma Import (CPP, subsys_dev_iter_exit, "_Z20subsys_dev_iter_exitP15subsys_dev_iter");

   function bus_for_each_dev
     (bus : access bus_type;
      start : access device;
      data : System.Address;
      fn : access function (arg1 : access device; arg2 : System.Address) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:151
   pragma Import (CPP, bus_for_each_dev, "_Z16bus_for_each_devP8bus_typeP6devicePvPFiS2_S3_E");

   function bus_find_device
     (bus : access bus_type;
      start : access device;
      data : System.Address;
      match : access function (arg1 : access device; arg2 : System.Address) return int) return access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:153
   pragma Import (CPP, bus_find_device, "_Z15bus_find_deviceP8bus_typeP6devicePvPFiS2_S3_E");

   function bus_find_device_by_name
     (bus : access bus_type;
      start : access device;
      name : Interfaces.C.Strings.chars_ptr) return access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:156
   pragma Import (CPP, bus_find_device_by_name, "_Z23bus_find_device_by_nameP8bus_typeP6devicePKc");

   function subsys_find_device_by_id
     (bus : access bus_type;
      id : unsigned;
      hint : access device) return access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:159
   pragma Import (CPP, subsys_find_device_by_id, "_Z24subsys_find_device_by_idP8bus_typejP6device");

   function bus_for_each_drv
     (bus : access bus_type;
      start : System.Address;
      data : System.Address;
      fn : access function (arg1 : System.Address; arg2 : System.Address) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:161
   pragma Import (CPP, bus_for_each_drv, "_Z16bus_for_each_drvP8bus_typeP13device_driverPvPFiS2_S3_E");

   procedure bus_sort_breadthfirst (bus : access bus_type; compare : access function (arg1 : access constant device; arg2 : access constant device) return int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:163
   pragma Import (CPP, bus_sort_breadthfirst, "_Z21bus_sort_breadthfirstP8bus_typePFiPK6deviceS3_E");

  -- * Bus notifiers: Get notified of addition/removal of devices
  -- * and binding/unbinding of drivers to devices.
  -- * In the long run, it should be a replacement for the platform
  -- * notify hooks.
  --  

   function bus_register_notifier (bus : access bus_type; nb : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:174
   pragma Import (CPP, bus_register_notifier, "_Z21bus_register_notifierP8bus_typeP14notifier_block");

   function bus_unregister_notifier (bus : access bus_type; nb : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:176
   pragma Import (CPP, bus_unregister_notifier, "_Z23bus_unregister_notifierP8bus_typeP14notifier_block");

  -- All 4 notifers below get called with the target struct device *
  -- * as an argument. Note that those functions are likely to be called
  -- * with the device lock held in the core, so be careful.
  --  

   function bus_get_kset (bus : access bus_type) return access linux_kobject_h.kset;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:193
   pragma Import (CPP, bus_get_kset, "_Z12bus_get_ksetP8bus_type");

   function bus_get_device_klist (bus : access bus_type) return access linux_klist_h.klist;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:194
   pragma Import (CPP, bus_get_device_klist, "_Z20bus_get_device_klistP8bus_type");

  --*
  -- * struct device_driver - The basic device driver structure
  -- * @name:	Name of the device driver.
  -- * @bus:	The bus which the device of this driver belongs to.
  -- * @owner:	The module owner.
  -- * @mod_name:	Used for built-in modules.
  -- * @suppress_bind_attrs: Disables bind/unbind via sysfs.
  -- * @of_match_table: The open firmware table.
  -- * @acpi_match_table: The ACPI match table.
  -- * @probe:	Called to query the existence of a specific device,
  -- *		whether this driver can work with it, and bind the driver
  -- *		to a specific device.
  -- * @remove:	Called when the device is removed from the system to
  -- *		unbind a device from this driver.
  -- * @shutdown:	Called at shut-down time to quiesce the device.
  -- * @suspend:	Called to put the device to sleep mode. Usually to a
  -- *		low power state.
  -- * @resume:	Called to bring a device from sleep mode.
  -- * @groups:	Default attributes that get created by the driver core
  -- *		automatically.
  -- * @pm:		Power management operations of the device which matched
  -- *		this driver.
  -- * @p:		Driver core's private data, no one other than the driver
  -- *		core can touch this.
  -- *
  -- * The device driver-model tracks all of the drivers known to the system.
  -- * The main reason for this tracking is to enable the driver core to match
  -- * up drivers with new devices. Once drivers are known objects within the
  -- * system, however, a number of other things become possible. Device drivers
  -- * can export information and configuration variables that are independent
  -- * of any specific device.
  --  

   type device_driver is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:229
      bus : access bus_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:230
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:232
      mod_name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:233
      suppress_bind_attrs : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:235
      of_match_table : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:237
      acpi_match_table : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:238
      probe : access function (arg1 : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:240
      remove : access function (arg1 : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:241
      shutdown : access procedure (arg1 : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:242
      suspend : access function (arg1 : access device; arg2 : linux_pm_h.pm_message_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:243
      resume : access function (arg1 : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:244
      groups : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:245
      pm : access constant linux_pm_h.dev_pm_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:247
      p : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:249
   end record;
   pragma Convention (C_Pass_By_Copy, device_driver);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:228

  -- used for built-in modules  
  -- disables bind/unbind via sysfs  
   --  skipped empty struct of_device_id

   --  skipped empty struct acpi_device_id

   function driver_register (drv : access device_driver) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:253
   pragma Import (CPP, driver_register, "_Z15driver_registerP13device_driver");

   procedure driver_unregister (drv : access device_driver);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:254
   pragma Import (CPP, driver_unregister, "_Z17driver_unregisterP13device_driver");

   function driver_find (name : Interfaces.C.Strings.chars_ptr; bus : access bus_type) return access device_driver;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:256
   pragma Import (CPP, driver_find, "_Z11driver_findPKcP8bus_type");

   function driver_probe_done return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:258
   pragma Import (CPP, driver_probe_done, "_Z17driver_probe_donev");

   procedure wait_for_device_probe;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:259
   pragma Import (CPP, wait_for_device_probe, "_Z21wait_for_device_probev");

  -- sysfs interface for exporting driver attributes  
   type driver_attribute is record
      attr : aliased linux_sysfs_h.attribute;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:265
      show : access function (arg1 : access device_driver; arg2 : Interfaces.C.Strings.chars_ptr) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:266
      store : access function
           (arg1 : access device_driver;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:268
   end record;
   pragma Convention (C_Pass_By_Copy, driver_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:264

   function driver_create_file (driver : access device_driver; attr : access constant driver_attribute) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:280
   pragma Import (CPP, driver_create_file, "_Z18driver_create_fileP13device_driverPK16driver_attribute");

   procedure driver_remove_file (driver : access device_driver; attr : access constant driver_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:282
   pragma Import (CPP, driver_remove_file, "_Z18driver_remove_fileP13device_driverPK16driver_attribute");

   function driver_for_each_device
     (drv : access device_driver;
      start : access device;
      data : System.Address;
      fn : access function (arg1 : access device; arg2 : System.Address) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:285
   pragma Import (CPP, driver_for_each_device, "_Z22driver_for_each_deviceP13device_driverP6devicePvPFiS2_S3_E");

   function driver_find_device
     (drv : access device_driver;
      start : access device;
      data : System.Address;
      match : access function (arg1 : access device; arg2 : System.Address) return int) return access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:290
   pragma Import (CPP, driver_find_device, "_Z18driver_find_deviceP13device_driverP6devicePvPFiS2_S3_E");

  --*
  -- * struct subsys_interface - interfaces to device functions
  -- * @name:       name of the device function
  -- * @subsys:     subsytem of the devices to attach to
  -- * @node:       the list of functions registered at the subsystem
  -- * @add_dev:    device hookup to device function handler
  -- * @remove_dev: device hookup to device function handler
  -- *
  -- * Simple interfaces attached to a subsystem. Multiple interfaces can
  -- * attach to a subsystem and its devices. Unlike drivers, they do not
  -- * exclusively claim or control devices. Interfaces usually represent
  -- * a specific functionality of a subsystem/class of devices.
  --  

   type subsys_interface is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:308
      subsys : access bus_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:309
      node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:310
      add_dev : access function (arg1 : access device; arg2 : access subsys_interface) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:311
      remove_dev : access function (arg1 : access device; arg2 : access subsys_interface) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:312
   end record;
   pragma Convention (C_Pass_By_Copy, subsys_interface);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:307

   function subsys_interface_register (sif : access subsys_interface) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:315
   pragma Import (CPP, subsys_interface_register, "_Z25subsys_interface_registerP16subsys_interface");

   procedure subsys_interface_unregister (sif : access subsys_interface);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:316
   pragma Import (CPP, subsys_interface_unregister, "_Z27subsys_interface_unregisterP16subsys_interface");

   function subsys_system_register (subsys : access bus_type; groups : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:318
   pragma Import (CPP, subsys_system_register, "_Z22subsys_system_registerP8bus_typePPK15attribute_group");

   function subsys_virtual_register (subsys : access bus_type; groups : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:320
   pragma Import (CPP, subsys_virtual_register, "_Z23subsys_virtual_registerP8bus_typePPK15attribute_group");

  --*
  -- * struct class - device classes
  -- * @name:	Name of the class.
  -- * @owner:	The module owner.
  -- * @class_attrs: Default attributes of this class.
  -- * @dev_groups:	Default attributes of the devices that belong to the class.
  -- * @dev_kobj:	The kobject that represents this class and links it into the hierarchy.
  -- * @dev_uevent:	Called when a device is added, removed from this class, or a
  -- *		few other things that generate uevents to add the environment
  -- *		variables.
  -- * @devnode:	Callback to provide the devtmpfs.
  -- * @class_release: Called to release this class.
  -- * @dev_release: Called to release the device.
  -- * @suspend:	Used to put the device to sleep mode, usually to a low power
  -- *		state.
  -- * @resume:	Used to bring the device from the sleep mode.
  -- * @ns_type:	Callbacks so sysfs can detemine namespaces.
  -- * @namespace:	Namespace of the device belongs to this class.
  -- * @pm:		The default device power management operations of this class.
  -- * @p:		The private data of the driver core, no one other than the
  -- *		driver core can touch this.
  -- *
  -- * A class is a higher-level view of a device that abstracts out low-level
  -- * implementation details. Drivers may see a SCSI disk or an ATA disk, but,
  -- * at the class level, they are all simply disks. Classes allow user space
  -- * to work with devices based on what they do, rather than how they are
  -- * connected or how they work.
  --  

   --  skipped anonymous struct anon_141

   type class_dev_iter is record
      ki : aliased linux_klist_h.klist_iter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:377
      c_type : access constant device_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:378
   end record;
   pragma Convention (C_Pass_By_Copy, class_dev_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:376

   sysfs_dev_block_kobj : access linux_kobject_h.kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:381
   pragma Import (C, sysfs_dev_block_kobj, "sysfs_dev_block_kobj");

   sysfs_dev_char_kobj : access linux_kobject_h.kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:382
   pragma Import (C, sysfs_dev_char_kobj, "sysfs_dev_char_kobj");

  -- This is a #define to keep the compiler from merging different
  -- * instances of the __key variable  

   --  skipped empty struct class_compat

   function class_compat_register (name : Interfaces.C.Strings.chars_ptr) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:396
   pragma Import (CPP, class_compat_register, "_Z21class_compat_registerPKc");

   procedure class_compat_unregister (cls : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:397
   pragma Import (CPP, class_compat_unregister, "_Z23class_compat_unregisterP12class_compat");

   function class_compat_create_link
     (cls : System.Address;
      dev : access device;
      device_link : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:398
   pragma Import (CPP, class_compat_create_link, "_Z24class_compat_create_linkP12class_compatP6deviceS2_");

   procedure class_compat_remove_link
     (cls : System.Address;
      dev : access device;
      device_link : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:400
   pragma Import (CPP, class_compat_remove_link, "_Z24class_compat_remove_linkP12class_compatP6deviceS2_");

   function class_dev_iter_next (iter : access class_dev_iter) return access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:407
   pragma Import (CPP, class_dev_iter_next, "_Z19class_dev_iter_nextP14class_dev_iter");

   procedure class_dev_iter_exit (iter : access class_dev_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:408
   pragma Import (CPP, class_dev_iter_exit, "_Z19class_dev_iter_exitP14class_dev_iter");

   class_for_each_device : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:410
   pragma Import (C, class_for_each_device, "class_for_each_device");

   class_find_device : access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:413
   pragma Import (C, class_find_device, "class_find_device");

   type class_attribute is record
      attr : aliased linux_sysfs_h.attribute;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:418
      show : access function return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:419
      store : access function return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:421
   end record;
   pragma Convention (C_Pass_By_Copy, class_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:417

   class_create_file_ns : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:432
   pragma Import (C, class_create_file_ns, "class_create_file_ns");

   class_create_file : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:439
   pragma Import (CPP, class_create_file, "_ZL17class_create_file");

  -- Simple class attribute that is just a static string  
   type class_attribute_string is record
      attr : aliased class_attribute;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:453
      str : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:454
   end record;
   pragma Convention (C_Pass_By_Copy, class_attribute_string);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:452

  -- Currently read-only only  
   show_class_attr_string : aliased linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:464
   pragma Import (C, show_class_attr_string, "show_class_attr_string");

   type class_interface is record
      node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:468
      add_dev : access function (arg1 : access device; arg2 : access class_interface) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:471
      remove_dev : access procedure (arg1 : access device; arg2 : access class_interface);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:472
   end record;
   pragma Convention (C_Pass_By_Copy, class_interface);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:467

   function class_interface_register (arg1 : access class_interface) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:475
   pragma Import (CPP, class_interface_register, "_Z24class_interface_registerP15class_interface");

   procedure class_interface_unregister (arg1 : access class_interface);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:476
   pragma Import (CPP, class_interface_unregister, "_Z26class_interface_unregisterP15class_interface");

  -- This is a #define to keep the compiler from merging different
  -- * instances of the __key variable  

  -- * The type of device, "struct device" is embedded in. A class
  -- * or bus can contain devices of different types
  -- * like "partitions" and "disks", "mouse" and "event".
  -- * This identifies the device type and carries type-specific
  -- * information, equivalent to the kobj_type of a kobject.
  -- * If "name" is specified, the uevent will contain it in
  -- * the DEVTYPE variable.
  --  

   type device_type is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:501
      groups : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:502
      uevent : access function (arg1 : access device; arg2 : access linux_kobject_h.kobj_uevent_env) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:503
      devnode : access function
           (arg1 : access device;
            arg2 : access linux_types_h.umode_t;
            arg3 : access linux_uidgid_h.kuid_t;
            arg4 : access linux_uidgid_h.kgid_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:505
      release : access procedure (arg1 : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:506
      pm : access constant linux_pm_h.dev_pm_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:508
   end record;
   pragma Convention (C_Pass_By_Copy, device_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:500

  -- interface for exporting device attributes  
   type device_attribute is record
      attr : aliased linux_sysfs_h.attribute;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:513
      show : access function
           (arg1 : access device;
            arg2 : access device_attribute;
            arg3 : Interfaces.C.Strings.chars_ptr) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:515
      store : access function
           (arg1 : access device;
            arg2 : access device_attribute;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:517
   end record;
   pragma Convention (C_Pass_By_Copy, device_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:512

   type dev_ext_attribute is record
      attr : aliased device_attribute;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:521
      var : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:522
   end record;
   pragma Convention (C_Pass_By_Copy, dev_ext_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:520

   function device_show_ulong
     (dev : access device;
      attr : access device_attribute;
      buf : Interfaces.C.Strings.chars_ptr) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:525
   pragma Import (CPP, device_show_ulong, "_Z17device_show_ulongP6deviceP16device_attributePc");

   function device_store_ulong
     (dev : access device;
      attr : access device_attribute;
      buf : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:527
   pragma Import (CPP, device_store_ulong, "_Z18device_store_ulongP6deviceP16device_attributePKcm");

   function device_show_int
     (dev : access device;
      attr : access device_attribute;
      buf : Interfaces.C.Strings.chars_ptr) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:529
   pragma Import (CPP, device_show_int, "_Z15device_show_intP6deviceP16device_attributePc");

   function device_store_int
     (dev : access device;
      attr : access device_attribute;
      buf : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:531
   pragma Import (CPP, device_store_int, "_Z16device_store_intP6deviceP16device_attributePKcm");

   function device_show_bool
     (dev : access device;
      attr : access device_attribute;
      buf : Interfaces.C.Strings.chars_ptr) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:533
   pragma Import (CPP, device_show_bool, "_Z16device_show_boolP6deviceP16device_attributePc");

   function device_store_bool
     (dev : access device;
      attr : access device_attribute;
      buf : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:535
   pragma Import (CPP, device_store_bool, "_Z17device_store_boolP6deviceP16device_attributePKcm");

   function device_create_file (the_device : access device; c_entry : access constant device_attribute) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:559
   pragma Import (CPP, device_create_file, "_Z18device_create_fileP6devicePK16device_attribute");

   procedure device_remove_file (dev : access device; attr : access constant device_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:561
   pragma Import (CPP, device_remove_file, "_Z18device_remove_fileP6devicePK16device_attribute");

   function device_remove_file_self (dev : access device; attr : access constant device_attribute) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:563
   pragma Import (CPP, device_remove_file_self, "_Z23device_remove_file_selfP6devicePK16device_attribute");

   function device_create_bin_file (dev : access device; attr : access constant linux_sysfs_h.bin_attribute) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:565
   pragma Import (CPP, device_create_bin_file, "_Z22device_create_bin_fileP6devicePK13bin_attribute");

   procedure device_remove_bin_file (dev : access device; attr : access constant linux_sysfs_h.bin_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:567
   pragma Import (CPP, device_remove_bin_file, "_Z22device_remove_bin_fileP6devicePK13bin_attribute");

  -- device resource management  
   type dr_release_t is access procedure (arg1 : access device; arg2 : System.Address);
   pragma Convention (C, dr_release_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:571

   type dr_match_t is access function
        (arg1 : access device;
         arg2 : System.Address;
         arg3 : System.Address) return int;
   pragma Convention (C, dr_match_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:572

   function devres_alloc
     (release : dr_release_t;
      size : linux_types_h.size_t;
      gfp : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:580
   pragma Import (CPP, devres_alloc, "_Z12devres_allocPFvP6devicePvEmj");

   procedure devres_for_each_res
     (dev : access device;
      release : dr_release_t;
      match : dr_match_t;
      match_data : System.Address;
      fn : access procedure
        (arg1 : access device;
         arg2 : System.Address;
         arg3 : System.Address);
      data : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:582
   pragma Import (CPP, devres_for_each_res, "_Z19devres_for_each_resP6devicePFvS0_PvEPFiS0_S1_S1_ES1_PFvS0_S1_S1_ES1_");

   procedure devres_free (res : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:586
   pragma Import (CPP, devres_free, "_Z11devres_freePv");

   procedure devres_add (dev : access device; res : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:587
   pragma Import (CPP, devres_add, "_Z10devres_addP6devicePv");

   function devres_find
     (dev : access device;
      release : dr_release_t;
      match : dr_match_t;
      match_data : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:588
   pragma Import (CPP, devres_find, "_Z11devres_findP6devicePFvS0_PvEPFiS0_S1_S1_ES1_");

   function devres_get
     (dev : access device;
      new_res : System.Address;
      match : dr_match_t;
      match_data : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:590
   pragma Import (CPP, devres_get, "_Z10devres_getP6devicePvPFiS0_S1_S1_ES1_");

   function devres_remove
     (dev : access device;
      release : dr_release_t;
      match : dr_match_t;
      match_data : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:592
   pragma Import (CPP, devres_remove, "_Z13devres_removeP6devicePFvS0_PvEPFiS0_S1_S1_ES1_");

   function devres_destroy
     (dev : access device;
      release : dr_release_t;
      match : dr_match_t;
      match_data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:594
   pragma Import (CPP, devres_destroy, "_Z14devres_destroyP6devicePFvS0_PvEPFiS0_S1_S1_ES1_");

   function devres_release
     (dev : access device;
      release : dr_release_t;
      match : dr_match_t;
      match_data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:596
   pragma Import (CPP, devres_release, "_Z14devres_releaseP6devicePFvS0_PvEPFiS0_S1_S1_ES1_");

  -- devres group  
   function devres_open_group
     (dev : access device;
      id : System.Address;
      gfp : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:600
   pragma Import (CPP, devres_open_group, "_Z17devres_open_groupP6devicePvj");

   procedure devres_close_group (dev : access device; id : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:602
   pragma Import (CPP, devres_close_group, "_Z18devres_close_groupP6devicePv");

   procedure devres_remove_group (dev : access device; id : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:603
   pragma Import (CPP, devres_remove_group, "_Z19devres_remove_groupP6devicePv");

   function devres_release_group (dev : access device; id : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:604
   pragma Import (CPP, devres_release_group, "_Z20devres_release_groupP6devicePv");

  -- managed devm_k.alloc/kfree for device drivers  
   function devm_kmalloc
     (dev : access device;
      size : linux_types_h.size_t;
      gfp : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:607
   pragma Import (CPP, devm_kmalloc, "_Z12devm_kmallocP6devicemj");

   function devm_kzalloc
     (dev : access device;
      size : linux_types_h.size_t;
      gfp : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:608
   pragma Import (CPP, devm_kzalloc, "_ZL12devm_kzallocP6devicemj");

   function devm_kmalloc_array
     (dev : access device;
      n : linux_types_h.size_t;
      size : linux_types_h.size_t;
      flags : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:612
   pragma Import (CPP, devm_kmalloc_array, "_ZL18devm_kmalloc_arrayP6devicemmj");

   function devm_kcalloc
     (dev : access device;
      n : linux_types_h.size_t;
      size : linux_types_h.size_t;
      flags : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:619
   pragma Import (CPP, devm_kcalloc, "_ZL12devm_kcallocP6devicemmj");

   procedure devm_kfree (dev : access device; p : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:624
   pragma Import (CPP, devm_kfree, "_Z10devm_kfreeP6devicePv");

   function devm_kstrdup
     (dev : access device;
      s : Interfaces.C.Strings.chars_ptr;
      gfp : linux_types_h.gfp_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:625
   pragma Import (CPP, devm_kstrdup, "_Z12devm_kstrdupP6devicePKcj");

   function devm_kmemdup
     (dev : access device;
      src : System.Address;
      len : linux_types_h.size_t;
      gfp : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:626
   pragma Import (CPP, devm_kmemdup, "_Z12devm_kmemdupP6devicePKvmj");

   function devm_get_free_pages
     (dev : access device;
      gfp_mask : linux_types_h.gfp_t;
      order : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:629
   pragma Import (CPP, devm_get_free_pages, "_Z19devm_get_free_pagesP6devicejj");

   procedure devm_free_pages (dev : access device; addr : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:631
   pragma Import (CPP, devm_free_pages, "_Z15devm_free_pagesP6devicem");

   function devm_ioremap_resource (dev : access device; res : access linux_ioport_h.resource) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:633
   pragma Import (CPP, devm_ioremap_resource, "_Z21devm_ioremap_resourceP6deviceP8resource");

   function devm_request_and_ioremap (dev : access device; res : access linux_ioport_h.resource) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:634
   pragma Import (CPP, devm_request_and_ioremap, "_Z24devm_request_and_ioremapP6deviceP8resource");

  -- allows to add/remove a custom action to devres stack  
   function devm_add_action
     (dev : access device;
      action : access procedure (arg1 : System.Address);
      data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:638
   pragma Import (CPP, devm_add_action, "_Z15devm_add_actionP6devicePFvPvES1_");

   procedure devm_remove_action
     (dev : access device;
      action : access procedure (arg1 : System.Address);
      data : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:639
   pragma Import (CPP, devm_remove_action, "_Z18devm_remove_actionP6devicePFvPvES1_");

  --	 * a low level driver may set these to teach IOMMU code about
  --	 * sg limitations.
  --	  

   type device_dma_parameters is record
      max_segment_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:646
      segment_boundary_mask : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:647
   end record;
   pragma Convention (C_Pass_By_Copy, device_dma_parameters);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:641

   --  skipped empty struct acpi_device

   type acpi_dev_node is record
      companion : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:654
   end record;
   pragma Convention (C_Pass_By_Copy, acpi_dev_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:652

  --*
  -- * struct device - The basic device structure
  -- * @parent:	The device's "parent" device, the device to which it is attached.
  -- * 		In most cases, a parent device is some sort of bus or host
  -- * 		controller. If parent is NULL, the device, is a top-level device,
  -- * 		which is not usually what you want.
  -- * @p:		Holds the private data of the driver core portions of the device.
  -- * 		See the comment of the struct device_private for detail.
  -- * @kobj:	A top-level, abstract class from which other classes are derived.
  -- * @init_name:	Initial name of the device.
  -- * @type:	The type of device.
  -- * 		This identifies the device type and carries type-specific
  -- * 		information.
  -- * @mutex:	Mutex to synchronize calls to its driver.
  -- * @bus:	Type of bus device is on.
  -- * @driver:	Which driver has allocated this
  -- * @platform_data: Platform data specific to the device.
  -- * 		Example: For devices on custom boards, as typical of embedded
  -- * 		and SOC based hardware, Linux often uses platform_data to point
  -- * 		to board-specific structures describing devices and how they
  -- * 		are wired.  That can include what ports are available, chip
  -- * 		variants, which GPIO pins act in what additional roles, and so
  -- * 		on.  This shrinks the "Board Support Packages" (BSPs) and
  -- * 		minimizes board-specific #ifdefs in drivers.
  -- * @driver_data: Private pointer for driver specific info.
  -- * @power:	For device power management.
  -- * 		See Documentation/power/devices.txt for details.
  -- * @pm_domain:	Provide callbacks that are executed during system suspend,
  -- * 		hibernation, system resume and during runtime PM transitions
  -- * 		along with subsystem-level and driver-level callbacks.
  -- * @pins:	For device pin management.
  -- *		See Documentation/pinctrl.txt for details.
  -- * @numa_node:	NUMA node this device is close to.
  -- * @dma_mask:	Dma mask (if dma'ble device).
  -- * @coherent_dma_mask: Like dma_mask, but for alloc_coherent mapping as not all
  -- * 		hardware supports 64-bit addresses for consistent allocations
  -- * 		such descriptors.
  -- * @dma_pfn_offset: offset of DMA memory range relatively of RAM
  -- * @dma_parms:	A low level driver may set these to teach IOMMU code about
  -- * 		segment limitations.
  -- * @dma_pools:	Dma pools (if dma'ble device).
  -- * @dma_mem:	Internal for coherent mem override.
  -- * @cma_area:	Contiguous memory area for dma allocations
  -- * @archdata:	For arch-specific additions.
  -- * @of_node:	Associated device tree node.
  -- * @acpi_node:	Associated ACPI device node.
  -- * @devt:	For creating the sysfs "dev".
  -- * @id:		device instance
  -- * @devres_lock: Spinlock to protect the resource of the device.
  -- * @devres_head: The resources list of the device.
  -- * @knode_class: The node used to add the device to the class list.
  -- * @class:	The class of the device.
  -- * @groups:	Optional attribute groups.
  -- * @release:	Callback to free the device after all references have
  -- * 		gone away. This should be set by the allocator of the
  -- * 		device (i.e. the bus driver that discovered the device).
  -- * @iommu_group: IOMMU group the device belongs to.
  -- *
  -- * @offline_disabled: If set, the device is permanently online.
  -- * @offline:	Set after successful invocation of bus type's .offline().
  -- *
  -- * At the lowest level, every device in a Linux system is represented by an
  -- * instance of struct device. The device structure contains the information
  -- * that the device model core needs to model the system. Most subsystems,
  -- * however, track additional information about the devices they host. As a
  -- * result, it is rare for devices to be represented by bare device structures;
  -- * instead, that structure, like kobject structures, is usually embedded within
  -- * a higher-level representation of the device.
  --  

   type device is record
      parent : access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:728
      p : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:730
      kobj : aliased linux_kobject_h.kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:732
      init_name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:733
      c_type : access constant device_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:734
      the_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:736
      bus : access bus_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:740
      driver : access device_driver;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:741
      platform_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:743
      driver_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:745
      power : aliased linux_pm_h.dev_pm_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:747
      pm_domain : access linux_pm_h.dev_pm_domain;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:748
      pins : access linux_pinctrl_devinfo_h.dev_pin_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:751
      numa_node : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:755
      dma_mask : access asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:757
      coherent_dma_mask : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:758
      dma_pfn_offset : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:763
      dma_parms : access device_dma_parameters;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:765
      dma_pools : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:767
      dma_mem : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:769
      archdata : aliased asm_device_h.dev_archdata;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:776
      of_node : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:778
      acpi_node : aliased acpi_dev_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:779
      devt : aliased linux_types_h.dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:781
      id : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:782
      devres_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:784
      devres_head : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:785
      knode_class : aliased linux_klist_h.klist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:787
      groups : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:789
      release : access procedure (arg1 : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:791
      the_iommu_group : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:792
      offline_disabled : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:794
      offline : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:795
   end record;
   pragma Convention (C_Pass_By_Copy, device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:727

  -- initial name of the device  
  -- mutex to synchronize calls to
  --					 * its driver.
  --					  

  -- type of bus device is on  
  -- which driver has allocated this
  --					   device  

  -- Platform specific data, device
  --					   core doesn't touch it  

  -- Driver data, set and get with
  --					   dev_set/get_drvdata  

  -- NUMA node this device is close to  
  -- dma mask (if dma'able device)  
  -- Like dma_mask, but for
  --					     alloc_coherent mappings as
  --					     not all hardware supports
  --					     64 bit addresses for consistent
  --					     allocations such descriptors.  

  -- dma pools (if dma'ble)  
  -- internal for coherent mem
  --					     override  

   --  skipped empty struct dma_coherent_mem

  -- contiguous memory area for dma
  --					   allocations  

  -- arch specific additions  
  -- associated device tree node  
  -- associated ACPI device node  
  -- dev_t, creates the sysfs "dev"  
  -- device instance  
  -- optional groups  
   function kobj_to_dev (kobj : access linux_kobject_h.kobject) return access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:798
   pragma Import (CPP, kobj_to_dev, "_ZL11kobj_to_devP7kobject");

  -- Get the wakeup routines, which depend on struct device  
   function dev_name (dev : access constant device) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:806
   pragma Import (CPP, dev_name, "_ZL8dev_namePK6device");

  -- Use the init name until the kobject becomes available  
   function dev_set_name (dev : access device; name : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:816
   pragma Import (CPP, dev_set_name, "_Z12dev_set_nameP6devicePKcz");

   function dev_to_node (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:819
   pragma Import (CPP, dev_to_node, "_ZL11dev_to_nodeP6device");

   procedure set_dev_node (dev : access device; node : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:823
   pragma Import (CPP, set_dev_node, "_ZL12set_dev_nodeP6devicei");

   function dev_get_drvdata (dev : access constant device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:837
   pragma Import (CPP, dev_get_drvdata, "_ZL15dev_get_drvdataPK6device");

   procedure dev_set_drvdata (dev : access device; data : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:842
   pragma Import (CPP, dev_set_drvdata, "_ZL15dev_set_drvdataP6devicePv");

   function dev_to_psd (dev : access device) return access linux_pm_h.pm_subsys_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:847
   pragma Import (CPP, dev_to_psd, "_ZL10dev_to_psdP6device");

   function dev_get_uevent_suppress (dev : access constant device) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:852
   pragma Import (CPP, dev_get_uevent_suppress, "_ZL23dev_get_uevent_suppressPK6device");

   procedure dev_set_uevent_suppress (dev : access device; val : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:857
   pragma Import (CPP, dev_set_uevent_suppress, "_ZL23dev_set_uevent_suppressP6devicei");

   function device_is_registered (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:862
   pragma Import (CPP, device_is_registered, "_ZL20device_is_registeredP6device");

   procedure device_enable_async_suspend (dev : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:867
   pragma Import (CPP, device_enable_async_suspend, "_ZL27device_enable_async_suspendP6device");

   procedure device_disable_async_suspend (dev : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:873
   pragma Import (CPP, device_disable_async_suspend, "_ZL28device_disable_async_suspendP6device");

   function device_async_suspend_enabled (dev : access device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:879
   pragma Import (CPP, device_async_suspend_enabled, "_ZL28device_async_suspend_enabledP6device");

   procedure pm_suspend_ignore_children (dev : access device; enable : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:884
   pragma Import (CPP, pm_suspend_ignore_children, "_ZL26pm_suspend_ignore_childrenP6deviceb");

   procedure dev_pm_syscore_device (dev : access device; val : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:889
   pragma Import (CPP, dev_pm_syscore_device, "_ZL21dev_pm_syscore_deviceP6deviceb");

   procedure device_lock (dev : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:896
   pragma Import (CPP, device_lock, "_ZL11device_lockP6device");

   function device_trylock (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:901
   pragma Import (CPP, device_trylock, "_ZL14device_trylockP6device");

   procedure device_unlock (dev : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:906
   pragma Import (CPP, device_unlock, "_ZL13device_unlockP6device");

   procedure driver_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:911
   pragma Import (CPP, driver_init, "_Z11driver_initv");

  -- * High level routines for use by the bus drivers
  --  

   function device_register (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:916
   pragma Import (CPP, device_register, "_Z15device_registerP6device");

   procedure device_unregister (dev : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:917
   pragma Import (CPP, device_unregister, "_Z17device_unregisterP6device");

   procedure device_initialize (dev : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:918
   pragma Import (CPP, device_initialize, "_Z17device_initializeP6device");

   function device_add (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:919
   pragma Import (CPP, device_add, "_Z10device_addP6device");

   procedure device_del (dev : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:920
   pragma Import (CPP, device_del, "_Z10device_delP6device");

   function device_for_each_child
     (dev : access device;
      data : System.Address;
      fn : access function (arg1 : access device; arg2 : System.Address) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:921
   pragma Import (CPP, device_for_each_child, "_Z21device_for_each_childP6devicePvPFiS0_S1_E");

   function device_find_child
     (dev : access device;
      data : System.Address;
      match : access function (arg1 : access device; arg2 : System.Address) return int) return access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:923
   pragma Import (CPP, device_find_child, "_Z17device_find_childP6devicePvPFiS0_S1_E");

   function device_rename (dev : access device; new_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:925
   pragma Import (CPP, device_rename, "_Z13device_renameP6devicePKc");

   function device_move
     (dev : access device;
      new_parent : access device;
      the_dpm_order : linux_pm_h.dpm_order) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:926
   pragma Import (CPP, device_move, "_Z11device_moveP6deviceS0_9dpm_order");

   function device_get_devnode
     (dev : access device;
      mode : access linux_types_h.umode_t;
      uid : access linux_uidgid_h.kuid_t;
      gid : access linux_uidgid_h.kgid_t;
      tmp : System.Address) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:928
   pragma Import (CPP, device_get_devnode, "_Z18device_get_devnodeP6devicePtP6kuid_tP6kgid_tPPKc");

   function device_supports_offline (dev : access device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:932
   pragma Import (CPP, device_supports_offline, "_ZL23device_supports_offlineP6device");

   procedure lock_device_hotplug;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:937
   pragma Import (CPP, lock_device_hotplug, "_Z19lock_device_hotplugv");

   procedure unlock_device_hotplug;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:938
   pragma Import (CPP, unlock_device_hotplug, "_Z21unlock_device_hotplugv");

   function lock_device_hotplug_sysfs return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:939
   pragma Import (CPP, lock_device_hotplug_sysfs, "_Z25lock_device_hotplug_sysfsv");

   function device_offline (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:940
   pragma Import (CPP, device_offline, "_Z14device_offlineP6device");

   function device_online (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:941
   pragma Import (CPP, device_online, "_Z13device_onlineP6device");

  -- * Root device objects for grouping under /sys/devices
  --  

   --  skipped func __root_device_register

  -- This is a macro to avoid include problems with THIS_MODULE  
   procedure root_device_unregister (root : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:952
   pragma Import (CPP, root_device_unregister, "_Z22root_device_unregisterP6device");

   function dev_get_platdata (dev : access constant device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:954
   pragma Import (CPP, dev_get_platdata, "_ZL16dev_get_platdataPK6device");

  -- * Manual binding of a device to driver. See drivers/base/bus.c
  -- * for information on use.
  --  

   function device_bind_driver (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:963
   pragma Import (CPP, device_bind_driver, "_Z18device_bind_driverP6device");

   procedure device_release_driver (dev : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:964
   pragma Import (CPP, device_release_driver, "_Z21device_release_driverP6device");

   function device_attach (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:965
   pragma Import (CPP, device_attach, "_Z13device_attachP6device");

   function driver_attach (drv : access device_driver) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:966
   pragma Import (CPP, driver_attach, "_Z13driver_attachP13device_driver");

   function device_reprobe (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:967
   pragma Import (CPP, device_reprobe, "_Z14device_reprobeP6device");

  -- * Easy functions for dynamically creating devices on the fly
  --  

   device_create_vargs : access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:972
   pragma Import (C, device_create_vargs, "device_create_vargs");

   device_create : access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:979
   pragma Import (C, device_create, "device_create");

   device_create_with_groups : access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:983
   pragma Import (C, device_create_with_groups, "device_create_with_groups");

  -- * Platform "fixup" functions - allow the platform to have their say
  -- * about devices and actions that the general device layer doesn't
  -- * know about.
  --  

  -- Notify platform of device discovery  
   platform_notify : access function (arg1 : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:995
   pragma Import (C, platform_notify, "platform_notify");

   platform_notify_remove : access function (arg1 : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:997
   pragma Import (C, platform_notify_remove, "platform_notify_remove");

  -- * get_device - atomically increment the reference count for the device.
  -- *
  --  

   function get_device (dev : access device) return access device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1004
   pragma Import (CPP, get_device, "_Z10get_deviceP6device");

   procedure put_device (dev : access device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1005
   pragma Import (CPP, put_device, "_Z10put_deviceP6device");

   function devtmpfs_create_node (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1008
   pragma Import (CPP, devtmpfs_create_node, "_Z20devtmpfs_create_nodeP6device");

   function devtmpfs_delete_node (dev : access device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1009
   pragma Import (CPP, devtmpfs_delete_node, "_Z20devtmpfs_delete_nodeP6device");

   function devtmpfs_mount (mntdir : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1010
   pragma Import (CPP, devtmpfs_mount, "_Z14devtmpfs_mountPKc");

  -- drivers/base/power/shutdown.c  
   procedure device_shutdown;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1018
   pragma Import (CPP, device_shutdown, "_Z15device_shutdownv");

  -- debugging and troubleshooting/diagnostic helpers.  
   function dev_driver_string (dev : access constant device) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1021
   pragma Import (CPP, dev_driver_string, "_Z17dev_driver_stringPK6device");

   function dev_vprintk_emit
     (level : int;
      dev : access constant device;
      fmt : Interfaces.C.Strings.chars_ptr;
      args : access System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1027
   pragma Import (CPP, dev_vprintk_emit, "_Z16dev_vprintk_emitiPK6devicePKcP13__va_list_tag");

   function dev_printk_emit
     (level : int;
      dev : access constant device;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1030
   pragma Import (CPP, dev_printk_emit, "_Z15dev_printk_emitiPK6devicePKcz");

   function dev_printk
     (level : Interfaces.C.Strings.chars_ptr;
      dev : access constant device;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1033
   pragma Import (CPP, dev_printk, "_Z10dev_printkPKcPK6deviceS0_z");

   function dev_emerg (dev : access constant device; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1036
   pragma Import (CPP, dev_emerg, "_Z9dev_emergPK6devicePKcz");

   function dev_alert (dev : access constant device; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1038
   pragma Import (CPP, dev_alert, "_Z9dev_alertPK6devicePKcz");

   function dev_crit (dev : access constant device; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1040
   pragma Import (CPP, dev_crit, "_Z8dev_critPK6devicePKcz");

   function dev_err (dev : access constant device; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1042
   pragma Import (CPP, dev_err, "_Z7dev_errPK6devicePKcz");

   function dev_warn (dev : access constant device; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1044
   pragma Import (CPP, dev_warn, "_Z8dev_warnPK6devicePKcz");

   function dev_notice (dev : access constant device; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/device.h:1046
   pragma Import (CPP, dev_notice, "_Z10dev_noticePK6devicePKcz");

   --  skipped func _dev_info

  -- * Stupid hackaround for existing uses of non-printk uses dev_info
  -- *
  -- * Note that the definition of dev_info below is actually _dev_info
  -- * and a macro is used to avoid redefining dev_info
  --  

  -- descriptor check is first to prevent flooding with "callbacks suppressed"  
  -- * dev_WARN*() acts like dev_printk(), but with the key difference of
  -- * using WARN/WARN_ONCE to include file/line information and a backtrace.
  --  

  -- Create alias, so I can be autoloaded.  
  --*
  -- * module_driver() - Helper macro for drivers that don't do anything
  -- * special in module init/exit. This eliminates a lot of boilerplate.
  -- * Each module may only use this macro once, and calling it replaces
  -- * module_init() and module_exit().
  -- *
  -- * @__driver: driver name
  -- * @__register: register function for this driver type
  -- * @__unregister: unregister function for this driver type
  -- * @...: Additional arguments to be passed to __register and __unregister.
  -- *
  -- * Use this macro to construct bus specific macros for registering
  -- * drivers, and do not use it on its own.
  --  

end linux_device_h;

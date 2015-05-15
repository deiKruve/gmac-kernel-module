pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with System;
limited with linux_kobject_h;

package linux_kobject_ns_h is

  -- Kernel object name space definitions
  -- *
  -- * Copyright (c) 2002-2003 Patrick Mochel
  -- * Copyright (c) 2002-2003 Open Source Development Labs
  -- * Copyright (c) 2006-2008 Greg Kroah-Hartman <greg@kroah.com>
  -- * Copyright (c) 2006-2008 Novell Inc.
  -- *
  -- * Split from kobject.h by David Howells (dhowells@redhat.com)
  -- *
  -- * This file is released under the GPLv2.
  -- *
  -- * Please read Documentation/kobject.txt before using the kobject
  -- * interface, ESPECIALLY the parts about reference counts and object
  -- * destructors.
  --  

   --  skipped empty struct sock

  -- * Namespace types which are used to tag kobjects and sysfs entries.
  -- * Network namespace will likely be the first.
  --  

   type kobj_ns_type is 
     (KOBJ_NS_TYPE_NONE,
      KOBJ_NS_TYPE_NET,
      KOBJ_NS_TYPES);
   pragma Convention (C, kobj_ns_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:27

  -- * Callbacks so sysfs can determine namespaces
  -- *   @grab_current_ns: return a new reference to calling task's namespace
  -- *   @netlink_ns: return namespace to which a sock belongs (right?)
  -- *   @initial_ns: return the initial namespace (i.e. init_net_ns)
  -- *   @drop_ns: drops a reference to namespace
  --  

   type kobj_ns_type_operations is record
      c_type : aliased kobj_ns_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:41
      current_may_mount : access function return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:42
      grab_current_ns : access function return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:43
      netlink_ns : access function (arg1 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:44
      initial_ns : access function return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:45
      drop_ns : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:46
   end record;
   pragma Convention (C_Pass_By_Copy, kobj_ns_type_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:40

   function kobj_ns_type_register (ops : access constant kobj_ns_type_operations) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:49
   pragma Import (CPP, kobj_ns_type_register, "_Z21kobj_ns_type_registerPK23kobj_ns_type_operations");

   function kobj_ns_type_registered (c_type : kobj_ns_type) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:50
   pragma Import (CPP, kobj_ns_type_registered, "_Z23kobj_ns_type_registered12kobj_ns_type");

   function kobj_child_ns_ops (parent : access linux_kobject_h.kobject) return access constant kobj_ns_type_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:51
   pragma Import (CPP, kobj_child_ns_ops, "_Z17kobj_child_ns_opsP7kobject");

   function kobj_ns_ops (kobj : access linux_kobject_h.kobject) return access constant kobj_ns_type_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:52
   pragma Import (CPP, kobj_ns_ops, "_Z11kobj_ns_opsP7kobject");

   function kobj_ns_current_may_mount (c_type : kobj_ns_type) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:54
   pragma Import (CPP, kobj_ns_current_may_mount, "_Z25kobj_ns_current_may_mount12kobj_ns_type");

   function kobj_ns_grab_current (c_type : kobj_ns_type) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:55
   pragma Import (CPP, kobj_ns_grab_current, "_Z20kobj_ns_grab_current12kobj_ns_type");

   function kobj_ns_netlink (c_type : kobj_ns_type; sk : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:56
   pragma Import (CPP, kobj_ns_netlink, "_Z15kobj_ns_netlink12kobj_ns_typeP4sock");

   function kobj_ns_initial (c_type : kobj_ns_type) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:57
   pragma Import (CPP, kobj_ns_initial, "_Z15kobj_ns_initial12kobj_ns_type");

   procedure kobj_ns_drop (c_type : kobj_ns_type; ns : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject_ns.h:58
   pragma Import (CPP, kobj_ns_drop, "_Z12kobj_ns_drop12kobj_ns_typePv");

end linux_kobject_ns_h;

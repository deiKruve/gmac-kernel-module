pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with Interfaces.C.Strings;
with linux_types_h;
limited with linux_kernfs_h;
with linux_kref_h;
with Interfaces.C.Extensions;
with System;
with linux_sysfs_h;
limited with linux_kobject_ns_h;
with linux_spinlock_types_h;

package linux_kobject_h is

   --  unsupported macro: UEVENT_HELPER_PATH_LEN 256
   --  unsupported macro: UEVENT_NUM_ENVP 32
   --  unsupported macro: UEVENT_BUFFER_SIZE 2048
  -- * kobject.h - generic kernel object infrastructure.
  -- *
  -- * Copyright (c) 2002-2003 Patrick Mochel
  -- * Copyright (c) 2002-2003 Open Source Development Labs
  -- * Copyright (c) 2006-2008 Greg Kroah-Hartman <greg@kroah.com>
  -- * Copyright (c) 2006-2008 Novell Inc.
  -- *
  -- * This file is released under the GPLv2.
  -- *
  -- * Please read Documentation/kobject.txt before using the kobject
  -- * interface, ESPECIALLY the parts about reference counts and object
  -- * destructors.
  --  

  -- path to the userspace helper executed on an event  
   uevent_helper : aliased Interfaces.C.char_array (size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:37
   pragma Import (C, uevent_helper, "uevent_helper");

  -- counter to tag the uevent, read only except for the kobject core  
   uevent_seqnum : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:41
   pragma Import (C, uevent_seqnum, "uevent_seqnum");

  -- * The actions here must match the index to the string array
  -- * in lib/kobject_uevent.c
  -- *
  -- * Do not add new actions here without checking with the driver-core
  -- * maintainers. Action strings are not meant to express subsystem
  -- * or device specific properties. In most cases you want to send a
  -- * kobject_uevent_env(kobj, KOBJ_CHANGE, env) with additional event
  -- * specific variables added to the event environment.
  --  

   type kobject_action is 
     (KOBJ_ADD,
      KOBJ_REMOVE,
      KOBJ_CHANGE,
      KOBJ_MOVE,
      KOBJ_ONLINE,
      KOBJ_OFFLINE,
      KOBJ_MAX);
   pragma Convention (C, kobject_action);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:53

   type kset;
   type kobj_type;
   type kobject is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:64
      c_entry : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:65
      parent : access kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:66
      the_kset : access kset;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:67
      ktype : access kobj_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:68
      sd : access linux_kernfs_h.kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:69
      the_kref : aliased linux_kref_h.kref;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:70
      state_initialized : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:74
      state_in_sysfs : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:75
      state_add_uevent_sent : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:76
      state_remove_uevent_sent : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:77
      uevent_suppress : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, kobject);
   pragma Pack (kobject);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:63

   function kobject_set_name (kobj : access kobject; name : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:82
   pragma Import (CPP, kobject_set_name, "_Z16kobject_set_nameP7kobjectPKcz");

   function kobject_set_name_vargs
     (kobj : access kobject;
      fmt : Interfaces.C.Strings.chars_ptr;
      vargs : access System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:83
   pragma Import (CPP, kobject_set_name_vargs, "_Z22kobject_set_name_vargsP7kobjectPKcP13__va_list_tag");

   function kobject_name (kobj : access constant kobject) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:86
   pragma Import (CPP, kobject_name, "_ZL12kobject_namePK7kobject");

   procedure kobject_init (kobj : access kobject; ktype : access kobj_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:91
   pragma Import (CPP, kobject_init, "_Z12kobject_initP7kobjectP9kobj_type");

   function kobject_add
     (kobj : access kobject;
      parent : access kobject;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:93
   pragma Import (CPP, kobject_add, "_Z11kobject_addP7kobjectS0_PKcz");

   function kobject_init_and_add
     (kobj : access kobject;
      ktype : access kobj_type;
      parent : access kobject;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:96
   pragma Import (CPP, kobject_init_and_add, "_Z20kobject_init_and_addP7kobjectP9kobj_typeS0_PKcz");

   procedure kobject_del (kobj : access kobject);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:100
   pragma Import (CPP, kobject_del, "_Z11kobject_delP7kobject");

   function kobject_create return access kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:102
   pragma Import (CPP, kobject_create, "_Z14kobject_createv");

   function kobject_create_and_add (name : Interfaces.C.Strings.chars_ptr; parent : access kobject) return access kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:103
   pragma Import (CPP, kobject_create_and_add, "_Z22kobject_create_and_addPKcP7kobject");

   function kobject_rename (arg1 : access kobject; new_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:106
   pragma Import (CPP, kobject_rename, "_Z14kobject_renameP7kobjectPKc");

   function kobject_move (arg1 : access kobject; arg2 : access kobject) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:107
   pragma Import (CPP, kobject_move, "_Z12kobject_moveP7kobjectS0_");

   function kobject_get (kobj : access kobject) return access kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:109
   pragma Import (CPP, kobject_get, "_Z11kobject_getP7kobject");

   procedure kobject_put (kobj : access kobject);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:110
   pragma Import (CPP, kobject_put, "_Z11kobject_putP7kobject");

   function kobject_namespace (kobj : access kobject) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:112
   pragma Import (CPP, kobject_namespace, "_Z17kobject_namespaceP7kobject");

   function kobject_get_path (kobj : access kobject; flag : linux_types_h.gfp_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:113
   pragma Import (CPP, kobject_get_path, "_Z16kobject_get_pathP7kobjectj");

   type kobj_type is record
      release : access procedure (arg1 : access kobject);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:116
      the_sysfs_ops : access constant linux_sysfs_h.sysfs_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:117
      default_attrs : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:118
      child_ns_type : access function (arg1 : access kobject) return access constant linux_kobject_ns_h.kobj_ns_type_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:119
   end record;
   pragma Convention (C_Pass_By_Copy, kobj_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:115

   type kobj_uevent_env_argv_array is array (0 .. 2) of Interfaces.C.Strings.chars_ptr;
   type kobj_uevent_env_envp_array is array (0 .. 31) of Interfaces.C.Strings.chars_ptr;
   subtype kobj_uevent_env_buf_array is Interfaces.C.char_array (0 .. 2047);
   type kobj_uevent_env is record
      argv : aliased kobj_uevent_env_argv_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:124
      envp : aliased kobj_uevent_env_envp_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:125
      envp_idx : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:126
      buf : aliased kobj_uevent_env_buf_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:127
      buflen : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:128
   end record;
   pragma Convention (C_Pass_By_Copy, kobj_uevent_env);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:123

   package Class_kset_uevent_ops is
      type kset_uevent_ops is limited record
         filter : access function (arg1 : access kset; arg2 : access kobject) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:132
         name : access function (arg1 : access kset; arg2 : access kobject) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:133
         uevent : access function
              (arg1 : access kset;
               arg2 : access kobject;
               arg3 : access kobj_uevent_env) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:135
      end record;
      pragma Import (CPP, kset_uevent_ops);
   end;
   use Class_kset_uevent_ops;
   type kobj_attribute is record
      attr : aliased linux_sysfs_h.attribute;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:139
      show : access function
           (arg1 : access kobject;
            arg2 : access kobj_attribute;
            arg3 : Interfaces.C.Strings.chars_ptr) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:141
      store : access function
           (arg1 : access kobject;
            arg2 : access kobj_attribute;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:143
   end record;
   pragma Convention (C_Pass_By_Copy, kobj_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:138

   kobj_sysfs_ops : aliased linux_sysfs_h.sysfs_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:146
   pragma Import (C, kobj_sysfs_ops, "kobj_sysfs_ops");

  --*
  -- * struct kset - a set of kobjects of a specific type, belonging to a specific subsystem.
  -- *
  -- * A kset defines a group of kobjects.  They can be individually
  -- * different "types" but overall these kobjects all want to be grouped
  -- * together and operated on in the same manner.  ksets are used to
  -- * define the attribute callbacks and other common events that happen to
  -- * a kobject.
  -- *
  -- * @list: the list of all kobjects for this kset
  -- * @list_lock: a lock for iterating over the kobjects
  -- * @kobj: the embedded kobject for this kset (recursion, isn't it fun...)
  -- * @uevent_ops: the set of uevent operations for this kset.  These are
  -- * called whenever a kobject has something happen to it so that the kset
  -- * can add new environment variables, or filter out the uevents if so
  -- * desired.
  --  

   type kset is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:168
      list_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:169
      kobj : aliased kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:170
      uevent_ops : access constant kset_uevent_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:171
   end record;
   pragma Convention (C_Pass_By_Copy, kset);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:167

   procedure kset_init (the_kset : access kset);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:174
   pragma Import (CPP, kset_init, "_Z9kset_initP4kset");

   function kset_register (the_kset : access kset) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:175
   pragma Import (CPP, kset_register, "_Z13kset_registerP4kset");

   procedure kset_unregister (the_kset : access kset);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:176
   pragma Import (CPP, kset_unregister, "_Z15kset_unregisterP4kset");

   function kset_create_and_add
     (name : Interfaces.C.Strings.chars_ptr;
      u : access constant kset_uevent_ops;
      parent_kobj : access kobject) return access kset;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:177
   pragma Import (CPP, kset_create_and_add, "_Z19kset_create_and_addPKcPK15kset_uevent_opsP7kobject");

   function to_kset (kobj : access kobject) return access kset;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:181
   pragma Import (CPP, to_kset, "_ZL7to_ksetP7kobject");

   function kset_get (k : access kset) return access kset;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:186
   pragma Import (CPP, kset_get, "_ZL8kset_getP4kset");

   procedure kset_put (k : access kset);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:191
   pragma Import (CPP, kset_put, "_ZL8kset_putP4kset");

   function get_ktype (kobj : access kobject) return access kobj_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:196
   pragma Import (CPP, get_ktype, "_ZL9get_ktypeP7kobject");

   function kset_find_obj (arg1 : access kset; arg2 : Interfaces.C.Strings.chars_ptr) return access kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:201
   pragma Import (CPP, kset_find_obj, "_Z13kset_find_objP4ksetPKc");

  -- The global /sys/kernel/ kobject for people to chain off of  
   kernel_kobj : access kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:204
   pragma Import (C, kernel_kobj, "kernel_kobj");

  -- The global /sys/kernel/mm/ kobject for people to chain off of  
   mm_kobj : access kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:206
   pragma Import (C, mm_kobj, "mm_kobj");

  -- The global /sys/hypervisor/ kobject for people to chain off of  
   hypervisor_kobj : access kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:208
   pragma Import (C, hypervisor_kobj, "hypervisor_kobj");

  -- The global /sys/power/ kobject for people to chain off of  
   power_kobj : access kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:210
   pragma Import (C, power_kobj, "power_kobj");

  -- The global /sys/firmware/ kobject for people to chain off of  
   firmware_kobj : access kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:212
   pragma Import (C, firmware_kobj, "firmware_kobj");

   function kobject_uevent (kobj : access kobject; action : kobject_action) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:214
   pragma Import (CPP, kobject_uevent, "_Z14kobject_ueventP7kobject14kobject_action");

   function kobject_uevent_env
     (kobj : access kobject;
      action : kobject_action;
      envp : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:215
   pragma Import (CPP, kobject_uevent_env, "_Z18kobject_uevent_envP7kobject14kobject_actionPPc");

   function add_uevent_var (env : access kobj_uevent_env; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:219
   pragma Import (CPP, add_uevent_var, "_Z14add_uevent_varP15kobj_uevent_envPKcz");

   function kobject_action_type
     (buf : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      c_type : access kobject_action) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kobject.h:221
   pragma Import (CPP, kobject_action_type, "_Z19kobject_action_typePKcmP14kobject_action");

end linux_kobject_h;

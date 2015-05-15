pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with linux_types_h;
limited with linux_kobject_h;
with System;
limited with linux_fs_h;
limited with linux_mm_types_h;
with Interfaces.C.Extensions;
limited with linux_kernfs_h;

package linux_sysfs_h is

   --  arg-macro: procedure sysfs_attr_init do {} while (0)
   --    do {} while (0)
   --  unsupported macro: ATTRIBUTE_GROUPS(_name) static const struct attribute_group _name ##_group = { .attrs = _name ##_attrs, }; __ATTRIBUTE_GROUPS(_name)
   --  arg-macro: procedure sysfs_bin_attr_init sysfs_attr_init(and(bin_attr).attr)
   --    sysfs_attr_init(and(bin_attr).attr)
   --  unsupported macro: BIN_ATTR(_name,_mode,_read,_write,_size) struct bin_attribute bin_attr_ ##_name = __BIN_ATTR(_name, _mode, _read, _write, _size)
   --  unsupported macro: BIN_ATTR_RO(_name,_size) struct bin_attribute bin_attr_ ##_name = __BIN_ATTR_RO(_name, _size)
   --  unsupported macro: BIN_ATTR_RW(_name,_size) struct bin_attribute bin_attr_ ##_name = __BIN_ATTR_RW(_name, _size)
  -- * sysfs.h - definitions for the device driver filesystem
  -- *
  -- * Copyright (c) 2001,2002 Patrick Mochel
  -- * Copyright (c) 2004 Silicon Graphics, Inc.
  -- * Copyright (c) 2007 SUSE Linux Products GmbH
  -- * Copyright (c) 2007 Tejun Heo <teheo@suse.de>
  -- *
  -- * Please see Documentation/filesystems/sysfs.txt for more information.
  --  

   type attribute is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:30
      mode : aliased linux_types_h.umode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:29

  --*
  -- *	sysfs_attr_init - initialize a dynamically allocated sysfs attribute
  -- *	@attr: struct attribute to initialize
  -- *
  -- *	Initialize a dynamically allocated struct attribute so we can
  -- *	make lockdep happy.  This is a new requirement for attributes
  -- *	and initially this is only needed when lockdep is enabled.
  -- *	Lockdep gives a nice error when your attribute is added to
  -- *	sysfs if you don't have this.
  --  

   type attribute_group is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:61
      is_visible : access function
           (arg1 : access linux_kobject_h.kobject;
            arg2 : access attribute;
            arg3 : int) return linux_types_h.umode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:63
      attrs : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:64
      bin_attrs : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:65
   end record;
   pragma Convention (C_Pass_By_Copy, attribute_group);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:60

  --*
  -- * Use these macros to make defining attributes easier. See include/linux/device.h
  -- * for examples..
  --  

   type bin_attribute is record
      attr : aliased attribute;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:122
      size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:123
      read : access function
           (arg1 : access linux_fs_h.file;
            arg2 : access linux_kobject_h.kobject;
            arg3 : access bin_attribute;
            arg4 : Interfaces.C.Strings.chars_ptr;
            arg5 : linux_types_h.loff_t;
            arg6 : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:126
      write : access function
           (arg1 : access linux_fs_h.file;
            arg2 : access linux_kobject_h.kobject;
            arg3 : access bin_attribute;
            arg4 : Interfaces.C.Strings.chars_ptr;
            arg5 : linux_types_h.loff_t;
            arg6 : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:128
      mmap : access function
           (arg1 : access linux_fs_h.file;
            arg2 : access linux_kobject_h.kobject;
            arg3 : access bin_attribute;
            arg4 : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:130
   end record;
   pragma Convention (C_Pass_By_Copy, bin_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:121

  --*
  -- *	sysfs_bin_attr_init - initialize a dynamically allocated bin_attribute
  -- *	@attr: struct bin_attribute to initialize
  -- *
  -- *	Initialize a dynamically allocated struct bin_attribute so we
  -- *	can make lockdep happy.  This is a new requirement for
  -- *	attributes and initially this is only needed when lockdep is
  -- *	enabled.  Lockdep gives a nice error when your attribute is
  -- *	added to sysfs if you don't have this.
  --  

  -- macros to create static binary attributes easier  
   type sysfs_ops is record
      show : access function
           (arg1 : access linux_kobject_h.kobject;
            arg2 : access attribute;
            arg3 : Interfaces.C.Strings.chars_ptr) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:176
      store : access function
           (arg1 : access linux_kobject_h.kobject;
            arg2 : access attribute;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:177
   end record;
   pragma Convention (C_Pass_By_Copy, sysfs_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:175

   function sysfs_create_dir_ns (kobj : access linux_kobject_h.kobject; ns : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:182
   pragma Import (CPP, sysfs_create_dir_ns, "_Z19sysfs_create_dir_nsP7kobjectPKv");

   procedure sysfs_remove_dir (kobj : access linux_kobject_h.kobject);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:183
   pragma Import (CPP, sysfs_remove_dir, "_Z16sysfs_remove_dirP7kobject");

   function sysfs_rename_dir_ns
     (kobj : access linux_kobject_h.kobject;
      new_name : Interfaces.C.Strings.chars_ptr;
      new_ns : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:184
   pragma Import (CPP, sysfs_rename_dir_ns, "_Z19sysfs_rename_dir_nsP7kobjectPKcPKv");

   function sysfs_move_dir_ns
     (kobj : access linux_kobject_h.kobject;
      new_parent_kobj : access linux_kobject_h.kobject;
      new_ns : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:186
   pragma Import (CPP, sysfs_move_dir_ns, "_Z17sysfs_move_dir_nsP7kobjectS0_PKv");

   function sysfs_create_file_ns
     (kobj : access linux_kobject_h.kobject;
      attr : access constant attribute;
      ns : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:190
   pragma Import (CPP, sysfs_create_file_ns, "_Z20sysfs_create_file_nsP7kobjectPK9attributePKv");

   function sysfs_create_files (kobj : access linux_kobject_h.kobject; attr : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:193
   pragma Import (CPP, sysfs_create_files, "_Z18sysfs_create_filesP7kobjectPPK9attribute");

   function sysfs_chmod_file
     (kobj : access linux_kobject_h.kobject;
      attr : access constant attribute;
      mode : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:195
   pragma Import (CPP, sysfs_chmod_file, "_Z16sysfs_chmod_fileP7kobjectPK9attributet");

   procedure sysfs_remove_file_ns
     (kobj : access linux_kobject_h.kobject;
      attr : access constant attribute;
      ns : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:197
   pragma Import (CPP, sysfs_remove_file_ns, "_Z20sysfs_remove_file_nsP7kobjectPK9attributePKv");

   function sysfs_remove_file_self (kobj : access linux_kobject_h.kobject; attr : access constant attribute) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:199
   pragma Import (CPP, sysfs_remove_file_self, "_Z22sysfs_remove_file_selfP7kobjectPK9attribute");

   procedure sysfs_remove_files (kobj : access linux_kobject_h.kobject; attr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:200
   pragma Import (CPP, sysfs_remove_files, "_Z18sysfs_remove_filesP7kobjectPPK9attribute");

   function sysfs_create_bin_file (kobj : access linux_kobject_h.kobject; attr : access constant bin_attribute) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:202
   pragma Import (CPP, sysfs_create_bin_file, "_Z21sysfs_create_bin_fileP7kobjectPK13bin_attribute");

   procedure sysfs_remove_bin_file (kobj : access linux_kobject_h.kobject; attr : access constant bin_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:204
   pragma Import (CPP, sysfs_remove_bin_file, "_Z21sysfs_remove_bin_fileP7kobjectPK13bin_attribute");

   function sysfs_create_link
     (kobj : access linux_kobject_h.kobject;
      target : access linux_kobject_h.kobject;
      name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:207
   pragma Import (CPP, sysfs_create_link, "_Z17sysfs_create_linkP7kobjectS0_PKc");

   function sysfs_create_link_nowarn
     (kobj : access linux_kobject_h.kobject;
      target : access linux_kobject_h.kobject;
      name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:209
   pragma Import (CPP, sysfs_create_link_nowarn, "_Z24sysfs_create_link_nowarnP7kobjectS0_PKc");

   procedure sysfs_remove_link (kobj : access linux_kobject_h.kobject; name : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:212
   pragma Import (CPP, sysfs_remove_link, "_Z17sysfs_remove_linkP7kobjectPKc");

   function sysfs_rename_link_ns
     (kobj : access linux_kobject_h.kobject;
      target : access linux_kobject_h.kobject;
      old_name : Interfaces.C.Strings.chars_ptr;
      new_name : Interfaces.C.Strings.chars_ptr;
      new_ns : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:214
   pragma Import (CPP, sysfs_rename_link_ns, "_Z20sysfs_rename_link_nsP7kobjectS0_PKcS2_PKv");

   procedure sysfs_delete_link
     (dir : access linux_kobject_h.kobject;
      targ : access linux_kobject_h.kobject;
      name : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:218
   pragma Import (CPP, sysfs_delete_link, "_Z17sysfs_delete_linkP7kobjectS0_PKc");

   function sysfs_create_group (kobj : access linux_kobject_h.kobject; grp : access constant attribute_group) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:221
   pragma Import (CPP, sysfs_create_group, "_Z18sysfs_create_groupP7kobjectPK15attribute_group");

   function sysfs_create_groups (kobj : access linux_kobject_h.kobject; groups : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:223
   pragma Import (CPP, sysfs_create_groups, "_Z19sysfs_create_groupsP7kobjectPPK15attribute_group");

   function sysfs_update_group (kobj : access linux_kobject_h.kobject; grp : access constant attribute_group) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:225
   pragma Import (CPP, sysfs_update_group, "_Z18sysfs_update_groupP7kobjectPK15attribute_group");

   procedure sysfs_remove_group (kobj : access linux_kobject_h.kobject; grp : access constant attribute_group);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:227
   pragma Import (CPP, sysfs_remove_group, "_Z18sysfs_remove_groupP7kobjectPK15attribute_group");

   procedure sysfs_remove_groups (kobj : access linux_kobject_h.kobject; groups : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:229
   pragma Import (CPP, sysfs_remove_groups, "_Z19sysfs_remove_groupsP7kobjectPPK15attribute_group");

   function sysfs_add_file_to_group
     (kobj : access linux_kobject_h.kobject;
      attr : access constant attribute;
      group : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:231
   pragma Import (CPP, sysfs_add_file_to_group, "_Z23sysfs_add_file_to_groupP7kobjectPK9attributePKc");

   procedure sysfs_remove_file_from_group
     (kobj : access linux_kobject_h.kobject;
      attr : access constant attribute;
      group : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:233
   pragma Import (CPP, sysfs_remove_file_from_group, "_Z28sysfs_remove_file_from_groupP7kobjectPK9attributePKc");

   function sysfs_merge_group (kobj : access linux_kobject_h.kobject; grp : access constant attribute_group) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:235
   pragma Import (CPP, sysfs_merge_group, "_Z17sysfs_merge_groupP7kobjectPK15attribute_group");

   procedure sysfs_unmerge_group (kobj : access linux_kobject_h.kobject; grp : access constant attribute_group);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:237
   pragma Import (CPP, sysfs_unmerge_group, "_Z19sysfs_unmerge_groupP7kobjectPK15attribute_group");

   function sysfs_add_link_to_group
     (kobj : access linux_kobject_h.kobject;
      group_name : Interfaces.C.Strings.chars_ptr;
      target : access linux_kobject_h.kobject;
      link_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:239
   pragma Import (CPP, sysfs_add_link_to_group, "_Z23sysfs_add_link_to_groupP7kobjectPKcS0_S2_");

   procedure sysfs_remove_link_from_group
     (kobj : access linux_kobject_h.kobject;
      group_name : Interfaces.C.Strings.chars_ptr;
      link_name : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:241
   pragma Import (CPP, sysfs_remove_link_from_group, "_Z28sysfs_remove_link_from_groupP7kobjectPKcS2_");

   procedure sysfs_notify
     (kobj : access linux_kobject_h.kobject;
      dir : Interfaces.C.Strings.chars_ptr;
      attr : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:244
   pragma Import (CPP, sysfs_notify, "_Z12sysfs_notifyP7kobjectPKcS2_");

   function sysfs_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:246
   pragma Import (CPP, sysfs_init, "_Z10sysfs_initv");

   procedure sysfs_enable_ns (kn : access linux_kernfs_h.kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:248
   pragma Import (CPP, sysfs_enable_ns, "_ZL15sysfs_enable_nsP11kernfs_node");

   function sysfs_create_file (kobj : access linux_kobject_h.kobject; attr : access constant attribute) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:431
   pragma Import (CPP, sysfs_create_file, "_ZL17sysfs_create_fileP7kobjectPK9attribute");

   procedure sysfs_remove_file (kobj : access linux_kobject_h.kobject; attr : access constant attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:437
   pragma Import (CPP, sysfs_remove_file, "_ZL17sysfs_remove_fileP7kobjectPK9attribute");

   function sysfs_rename_link
     (kobj : access linux_kobject_h.kobject;
      target : access linux_kobject_h.kobject;
      old_name : Interfaces.C.Strings.chars_ptr;
      new_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:443
   pragma Import (CPP, sysfs_rename_link, "_ZL17sysfs_rename_linkP7kobjectS0_PKcS2_");

   procedure sysfs_notify_dirent (kn : access linux_kernfs_h.kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:449
   pragma Import (CPP, sysfs_notify_dirent, "_ZL19sysfs_notify_direntP11kernfs_node");

   function sysfs_get_dirent (parent : access linux_kernfs_h.kernfs_node; name : access unsigned_char) return access linux_kernfs_h.kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:454
   pragma Import (CPP, sysfs_get_dirent, "_ZL16sysfs_get_direntP11kernfs_nodePKh");

   function sysfs_get (kn : access linux_kernfs_h.kernfs_node) return access linux_kernfs_h.kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:460
   pragma Import (CPP, sysfs_get, "_ZL9sysfs_getP11kernfs_node");

   procedure sysfs_put (kn : access linux_kernfs_h.kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysfs.h:466
   pragma Import (CPP, sysfs_put, "_ZL9sysfs_putP11kernfs_node");

end linux_sysfs_h;

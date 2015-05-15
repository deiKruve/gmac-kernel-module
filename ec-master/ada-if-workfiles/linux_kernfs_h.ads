pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_rbtree_h;
with System;
with linux_types_h;
with Interfaces.C.Strings;
limited with linux_seq_file_h;
with linux_idr_h;
with linux_wait_h;
limited with linux_fs_h;
with linux_mutex_h;
with Interfaces.C.Extensions;
limited with linux_mm_h;
limited with linux_mm_types_h;
limited with linux_dcache_h;

package linux_kernfs_h is

   --  unsupported macro: KERNFS_TYPE_MASK 0x000f
   --  unsupported macro: KERNFS_FLAG_MASK ~KERNFS_TYPE_MASK
  -- * kernfs.h - pseudo filesystem decoupled from vfs locking
  -- *
  -- * This file is released under the GPLv2.
  --  

   --  skipped empty struct kernfs_open_node

   --  skipped empty struct kernfs_iattrs

   subtype kernfs_node_type is unsigned;
   KERNFS_DIR : constant kernfs_node_type := 1;
   KERNFS_FILE : constant kernfs_node_type := 2;
   KERNFS_LINK : constant kernfs_node_type := 4;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:31

   subtype kernfs_node_flag is unsigned;
   KERNFS_ACTIVATED : constant kernfs_node_flag := 16;
   KERNFS_NS : constant kernfs_node_flag := 32;
   KERNFS_HAS_SEQ_SHOW : constant kernfs_node_flag := 64;
   KERNFS_HAS_MMAP : constant kernfs_node_flag := 128;
   KERNFS_LOCKDEP : constant kernfs_node_flag := 256;
   KERNFS_STATIC_NAME : constant kernfs_node_flag := 512;
   KERNFS_SUICIDAL : constant kernfs_node_flag := 1024;
   KERNFS_SUICIDED : constant kernfs_node_flag := 2048;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:40

  -- @flags for kernfs_create_root()  
   subtype kernfs_root_flag is unsigned;
   KERNFS_ROOT_CREATE_DEACTIVATED : constant kernfs_root_flag := 1;
   KERNFS_ROOT_EXTRA_OPEN_PERM_CHECK : constant kernfs_root_flag := 2;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:52

  --	 * kernfs_nodes are created in the deactivated state and invisible.
  --	 * They require explicit kernfs_activate() to become visible.  This
  --	 * can be used to make related nodes become visible atomically
  --	 * after all nodes are created successfully.
  --	  

  --	 * For regular flies, if the opener has CAP_DAC_OVERRIDE, open(2)
  --	 * succeeds regardless of the RW permissions.  sysfs had an extra
  --	 * layer of enforcement where open(2) fails with -EACCES regardless
  --	 * of CAP_DAC_OVERRIDE if the permission doesn't have the
  --	 * respective read or write access at all (none of S_IRUGO or
  --	 * S_IWUGO) or the respective operation isn't implemented.  The
  --	 * following flag enables that behavior.
  --	  

  -- type-specific structures for kernfs_node union members  
   type kernfs_root;
   type kernfs_elem_dir is record
      subdirs : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:75
      children : aliased linux_rbtree_h.rb_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:77
      root : access kernfs_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:83
   end record;
   pragma Convention (C_Pass_By_Copy, kernfs_elem_dir);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:74

  -- children rbtree starts here and goes through kn->rb  
  --	 * The kernfs hierarchy this directory belongs to.  This fits
  --	 * better directly in kernfs_node but is here to save space.
  --	  

   type kernfs_node;
   type kernfs_elem_symlink is record
      target_kn : access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:87
   end record;
   pragma Convention (C_Pass_By_Copy, kernfs_elem_symlink);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:86

   type kernfs_ops;
   type kernfs_elem_attr is record
      ops : access constant kernfs_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:91
      open : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:92
      size : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:93
      notify_next : access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:94
   end record;
   pragma Convention (C_Pass_By_Copy, kernfs_elem_attr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:90

  -- for kernfs_notify()  
  -- * kernfs_node - the building block of kernfs hierarchy.  Each and every
  -- * kernfs node is represented by single kernfs_node.  Most fields are
  -- * private to kernfs and shouldn't be accessed directly by kernfs users.
  -- *
  -- * As long as s_count reference is held, the kernfs_node itself is
  -- * accessible.  Dereferencing elem or any other outer entity requires
  -- * active reference.
  --  

   type kernfs_node is record
      count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:107
      active : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:108
      parent : access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:118
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:119
      rb : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:121
      ns : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:123
      hash : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:124
      field_8 : aliased anon_41;
      priv : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:131
      flags : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:133
      mode : aliased linux_types_h.umode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:134
      ino : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:135
      iattr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:136
   end record;
   pragma Convention (C_Pass_By_Copy, kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:106

  --	 * Use kernfs_get_parent() and kernfs_name/path() instead of
  --	 * accessing the following two fields directly.  If the node is
  --	 * never moved to a different parent, it is safe to access the
  --	 * parent directly.
  --	  

  -- namespace tag  
  -- ns + name hash  
  -- * kernfs_syscall_ops may be specified on kernfs_create_root() to support
  -- * syscalls.  These optional callbacks are invoked on the matching syscalls
  -- * and can perform any kernfs operations which don't necessarily have to be
  -- * the exact operation requested.  An active reference is held for each
  -- * kernfs_node parameter.
  --  

   type kernfs_syscall_ops is record
      remount_fs : access function
           (arg1 : access kernfs_root;
            arg2 : access int;
            arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:147
      show_options : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : access kernfs_root) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:148
      mkdir : access function
           (arg1 : access kernfs_node;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:151
      rmdir : access function (arg1 : access kernfs_node) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:152
      rename : access function
           (arg1 : access kernfs_node;
            arg2 : access kernfs_node;
            arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:154
   end record;
   pragma Convention (C_Pass_By_Copy, kernfs_syscall_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:146

  -- published fields  
   type kernfs_root is record
      kn : access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:159
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:160
      ino_ida : aliased linux_idr_h.ida;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:163
      syscall_ops : access kernfs_syscall_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:164
      supers : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:167
      deactivate_waitq : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:169
   end record;
   pragma Convention (C_Pass_By_Copy, kernfs_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:157

  -- KERNFS_ROOT_* flags  
  -- private fields, do not use outside kernfs proper  
  -- list of kernfs_super_info of this root, protected by kernfs_mutex  
  -- published fields  
   type kernfs_open_file is record
      kn : access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:174
      the_file : access linux_fs_h.file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:175
      priv : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:176
      the_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:179
      event : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:180
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:181
      atomic_write_len : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:183
      mmapped : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:184
      vm_ops : access constant linux_mm_h.vm_operations_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:185
   end record;
   pragma Convention (C_Pass_By_Copy, kernfs_open_file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:172

  -- private fields, do not use outside kernfs proper  
  --	 * Read is handled by either seq_file or raw_read().
  --	 *
  --	 * If seq_show() is present, seq_file path is active.  Other seq
  --	 * operations are optional and if not implemented, the behavior is
  --	 * equivalent to single_open().  @sf->private points to the
  --	 * associated kernfs_open_file.
  --	 *
  --	 * read() is bounced through kernel buffer and a read larger than
  --	 * PAGE_SIZE results in partial operation of PAGE_SIZE.
  --	  

   type kernfs_ops is record
      seq_show : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:200
      seq_start : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : access linux_types_h.loff_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:202
      seq_next : access function
           (arg1 : access linux_seq_file_h.seq_file;
            arg2 : System.Address;
            arg3 : access linux_types_h.loff_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:203
      seq_stop : access procedure (arg1 : access linux_seq_file_h.seq_file; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:204
      read : access function
           (arg1 : access kernfs_open_file;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : linux_types_h.size_t;
            arg4 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:207
      atomic_write_len : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:216
      write : access function
           (arg1 : access kernfs_open_file;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : linux_types_h.size_t;
            arg4 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:218
      mmap : access function (arg1 : access kernfs_open_file; arg2 : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:220
   end record;
   pragma Convention (C_Pass_By_Copy, kernfs_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:188

  --	 * write() is bounced through kernel buffer.  If atomic_write_len
  --	 * is not set, a write larger than PAGE_SIZE results in partial
  --	 * operations of PAGE_SIZE chunks.  If atomic_write_len is set,
  --	 * writes upto the specified size are executed atomically but
  --	 * larger ones are rejected with -E2BIG.
  --	  

   function kernfs_type (kn : access kernfs_node) return kernfs_node_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:229
   pragma Import (CPP, kernfs_type, "_ZL11kernfs_typeP11kernfs_node");

  --*
  -- * kernfs_enable_ns - enable namespace under a directory
  -- * @kn: directory of interest, should be empty
  -- *
  -- * This is to be called right after @kn is created to enable namespace
  -- * under it.  All children of @kn must have non-NULL namespace tags and
  -- * only the ones which match the super_block's tag will be visible.
  --  

   procedure kernfs_enable_ns (kn : access kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:242
   pragma Import (CPP, kernfs_enable_ns, "_ZL16kernfs_enable_nsP11kernfs_node");

  --*
  -- * kernfs_ns_enabled - test whether namespace is enabled
  -- * @kn: the node to test
  -- *
  -- * Test whether namespace filtering is enabled for the children of @ns.
  --  

   function kernfs_ns_enabled (kn : access kernfs_node) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:255
   pragma Import (CPP, kernfs_ns_enabled, "_ZL17kernfs_ns_enabledP11kernfs_node");

   function kernfs_name
     (kn : access kernfs_node;
      buf : Interfaces.C.Strings.chars_ptr;
      buflen : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:260
   pragma Import (CPP, kernfs_name, "_Z11kernfs_nameP11kernfs_nodePcm");

   function kernfs_path
     (kn : access kernfs_node;
      buf : Interfaces.C.Strings.chars_ptr;
      buflen : linux_types_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:261
   pragma Import (CPP, kernfs_path, "_Z11kernfs_pathP11kernfs_nodePcm");

   procedure pr_cont_kernfs_name (kn : access kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:263
   pragma Import (CPP, pr_cont_kernfs_name, "_Z19pr_cont_kernfs_nameP11kernfs_node");

   procedure pr_cont_kernfs_path (kn : access kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:264
   pragma Import (CPP, pr_cont_kernfs_path, "_Z19pr_cont_kernfs_pathP11kernfs_node");

   function kernfs_get_parent (kn : access kernfs_node) return access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:265
   pragma Import (CPP, kernfs_get_parent, "_Z17kernfs_get_parentP11kernfs_node");

   function kernfs_find_and_get_ns
     (parent : access kernfs_node;
      name : Interfaces.C.Strings.chars_ptr;
      ns : System.Address) return access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:266
   pragma Import (CPP, kernfs_find_and_get_ns, "_Z22kernfs_find_and_get_nsP11kernfs_nodePKcPKv");

   procedure kernfs_get (kn : access kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:268
   pragma Import (CPP, kernfs_get, "_Z10kernfs_getP11kernfs_node");

   procedure kernfs_put (kn : access kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:269
   pragma Import (CPP, kernfs_put, "_Z10kernfs_putP11kernfs_node");

   function kernfs_node_from_dentry (the_dentry : access linux_dcache_h.dentry) return access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:271
   pragma Import (CPP, kernfs_node_from_dentry, "_Z23kernfs_node_from_dentryP6dentry");

   function kernfs_root_from_sb (sb : access linux_fs_h.super_block) return access kernfs_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:272
   pragma Import (CPP, kernfs_root_from_sb, "_Z19kernfs_root_from_sbP11super_block");

   function kernfs_create_root
     (scops : access kernfs_syscall_ops;
      flags : unsigned;
      priv : System.Address) return access kernfs_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:274
   pragma Import (CPP, kernfs_create_root, "_Z18kernfs_create_rootP18kernfs_syscall_opsjPv");

   procedure kernfs_destroy_root (root : access kernfs_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:276
   pragma Import (CPP, kernfs_destroy_root, "_Z19kernfs_destroy_rootP11kernfs_root");

   function kernfs_create_dir_ns
     (parent : access kernfs_node;
      name : Interfaces.C.Strings.chars_ptr;
      mode : linux_types_h.umode_t;
      priv : System.Address;
      ns : System.Address) return access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:278
   pragma Import (CPP, kernfs_create_dir_ns, "_Z20kernfs_create_dir_nsP11kernfs_nodePKctPvPKv");

   --  skipped func __kernfs_create_file

   function kernfs_create_link
     (parent : access kernfs_node;
      name : Interfaces.C.Strings.chars_ptr;
      target : access kernfs_node) return access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:288
   pragma Import (CPP, kernfs_create_link, "_Z18kernfs_create_linkP11kernfs_nodePKcS0_");

   procedure kernfs_activate (kn : access kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:291
   pragma Import (CPP, kernfs_activate, "_Z15kernfs_activateP11kernfs_node");

   procedure kernfs_remove (kn : access kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:292
   pragma Import (CPP, kernfs_remove, "_Z13kernfs_removeP11kernfs_node");

   procedure kernfs_break_active_protection (kn : access kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:293
   pragma Import (CPP, kernfs_break_active_protection, "_Z30kernfs_break_active_protectionP11kernfs_node");

   procedure kernfs_unbreak_active_protection (kn : access kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:294
   pragma Import (CPP, kernfs_unbreak_active_protection, "_Z32kernfs_unbreak_active_protectionP11kernfs_node");

   function kernfs_remove_self (kn : access kernfs_node) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:295
   pragma Import (CPP, kernfs_remove_self, "_Z18kernfs_remove_selfP11kernfs_node");

   function kernfs_remove_by_name_ns
     (parent : access kernfs_node;
      name : Interfaces.C.Strings.chars_ptr;
      ns : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:296
   pragma Import (CPP, kernfs_remove_by_name_ns, "_Z24kernfs_remove_by_name_nsP11kernfs_nodePKcPKv");

   function kernfs_rename_ns
     (kn : access kernfs_node;
      new_parent : access kernfs_node;
      new_name : Interfaces.C.Strings.chars_ptr;
      new_ns : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:298
   pragma Import (CPP, kernfs_rename_ns, "_Z16kernfs_rename_nsP11kernfs_nodeS0_PKcPKv");

   function kernfs_setattr (kn : access kernfs_node; the_iattr : access constant linux_fs_h.iattr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:300
   pragma Import (CPP, kernfs_setattr, "_Z14kernfs_setattrP11kernfs_nodePK5iattr");

   procedure kernfs_notify (kn : access kernfs_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:301
   pragma Import (CPP, kernfs_notify, "_Z13kernfs_notifyP11kernfs_node");

   function kernfs_super_ns (sb : access linux_fs_h.super_block) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:303
   pragma Import (CPP, kernfs_super_ns, "_Z15kernfs_super_nsP11super_block");

   function kernfs_mount_ns
     (fs_type : access linux_fs_h.file_system_type;
      flags : int;
      root : access kernfs_root;
      magic : unsigned_long;
      new_sb_created : access Extensions.bool;
      ns : System.Address) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:304
   pragma Import (CPP, kernfs_mount_ns, "_Z15kernfs_mount_nsP16file_system_typeiP11kernfs_rootmPbPKv");

   procedure kernfs_kill_sb (sb : access linux_fs_h.super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:307
   pragma Import (CPP, kernfs_kill_sb, "_Z14kernfs_kill_sbP11super_block");

   function kernfs_pin_sb (root : access kernfs_root; ns : System.Address) return access linux_fs_h.super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:308
   pragma Import (CPP, kernfs_pin_sb, "_Z13kernfs_pin_sbP11kernfs_rootPKv");

   procedure kernfs_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:310
   pragma Import (CPP, kernfs_init, "_Z11kernfs_initv");

  -- whatever  
   function kernfs_find_and_get (kn : access kernfs_node; name : Interfaces.C.Strings.chars_ptr) return access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:411
   pragma Import (CPP, kernfs_find_and_get, "_ZL19kernfs_find_and_getP11kernfs_nodePKc");

   function kernfs_create_dir
     (parent : access kernfs_node;
      name : Interfaces.C.Strings.chars_ptr;
      mode : linux_types_h.umode_t;
      priv : System.Address) return access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:417
   pragma Import (CPP, kernfs_create_dir, "_ZL17kernfs_create_dirP11kernfs_nodePKctPv");

   function kernfs_create_file_ns
     (parent : access kernfs_node;
      name : Interfaces.C.Strings.chars_ptr;
      mode : linux_types_h.umode_t;
      size : linux_types_h.loff_t;
      ops : access constant kernfs_ops;
      priv : System.Address;
      ns : System.Address) return access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:424
   pragma Import (CPP, kernfs_create_file_ns, "_ZL21kernfs_create_file_nsP11kernfs_nodePKctxPK10kernfs_opsPvPKv");

   function kernfs_create_file
     (parent : access kernfs_node;
      name : Interfaces.C.Strings.chars_ptr;
      mode : linux_types_h.umode_t;
      size : linux_types_h.loff_t;
      ops : access constant kernfs_ops;
      priv : System.Address) return access kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:438
   pragma Import (CPP, kernfs_create_file, "_ZL18kernfs_create_fileP11kernfs_nodePKctxPK10kernfs_opsPv");

   function kernfs_remove_by_name (parent : access kernfs_node; name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:444
   pragma Import (CPP, kernfs_remove_by_name, "_ZL21kernfs_remove_by_nameP11kernfs_nodePKc");

   function kernfs_rename
     (kn : access kernfs_node;
      new_parent : access kernfs_node;
      new_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:450
   pragma Import (CPP, kernfs_rename, "_ZL13kernfs_renameP11kernfs_nodeS0_PKc");

   function kernfs_mount
     (fs_type : access linux_fs_h.file_system_type;
      flags : int;
      root : access kernfs_root;
      magic : unsigned_long;
      new_sb_created : access Extensions.bool) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernfs.h:458
   pragma Import (CPP, kernfs_mount, "_ZL12kernfs_mountP16file_system_typeiP11kernfs_rootmPb");

end linux_kernfs_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sched_h;
with Interfaces.C.Strings;
with System;
with linux_types_h;
limited with linux_fs_h;
with linux_uidgid_h;
limited with net_net_namespace_h;

package linux_proc_fs_h is

  -- * The proc filesystem constants/structures
  --  

   procedure proc_root_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:14
   pragma Import (CPP, proc_root_init, "_Z14proc_root_initv");

   procedure proc_flush_task (arg1 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:15
   pragma Import (CPP, proc_flush_task, "_Z15proc_flush_taskP11task_struct");

   function proc_symlink
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : Interfaces.C.Strings.chars_ptr) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:17
   pragma Import (CPP, proc_symlink, "_Z12proc_symlinkPKcP14proc_dir_entryS0_");

   function proc_mkdir (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:19
   pragma Import (CPP, proc_mkdir, "_Z10proc_mkdirPKcP14proc_dir_entry");

   function proc_mkdir_data
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : linux_types_h.umode_t;
      arg3 : System.Address;
      arg4 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:20
   pragma Import (CPP, proc_mkdir_data, "_Z15proc_mkdir_dataPKctP14proc_dir_entryPv");

   function proc_mkdir_mode
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : linux_types_h.umode_t;
      arg3 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:22
   pragma Import (CPP, proc_mkdir_mode, "_Z15proc_mkdir_modePKctP14proc_dir_entry");

   function proc_create_data
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : linux_types_h.umode_t;
      arg3 : System.Address;
      arg4 : access constant linux_fs_h.file_operations;
      arg5 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:25
   pragma Import (CPP, proc_create_data, "_Z16proc_create_dataPKctP14proc_dir_entryPK15file_operationsPv");

   function proc_create
     (name : Interfaces.C.Strings.chars_ptr;
      mode : linux_types_h.umode_t;
      parent : System.Address;
      proc_fops : access constant linux_fs_h.file_operations) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:30
   pragma Import (CPP, proc_create, "_ZL11proc_createPKctP14proc_dir_entryPK15file_operations");

   procedure proc_set_size (arg1 : System.Address; arg2 : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:37
   pragma Import (CPP, proc_set_size, "_Z13proc_set_sizeP14proc_dir_entryx");

   procedure proc_set_user
     (arg1 : System.Address;
      arg2 : linux_uidgid_h.kuid_t;
      arg3 : linux_uidgid_h.kgid_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:38
   pragma Import (CPP, proc_set_user, "_Z13proc_set_userP14proc_dir_entry6kuid_t6kgid_t");

   function PDE_DATA (arg1 : access constant linux_fs_h.inode) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:39
   pragma Import (CPP, PDE_DATA, "_Z8PDE_DATAPK5inode");

   function proc_get_parent_data (arg1 : access constant linux_fs_h.inode) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:40
   pragma Import (CPP, proc_get_parent_data, "_Z20proc_get_parent_dataPK5inode");

   procedure proc_remove (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:41
   pragma Import (CPP, proc_remove, "_Z11proc_removeP14proc_dir_entry");

   procedure remove_proc_entry (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:42
   pragma Import (CPP, remove_proc_entry, "_Z17remove_proc_entryPKcP14proc_dir_entry");

   function remove_proc_subtree (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:43
   pragma Import (CPP, remove_proc_subtree, "_Z19remove_proc_subtreePKcP14proc_dir_entry");

   function proc_net_mkdir
     (the_net : access net_net_namespace_h.net;
      name : Interfaces.C.Strings.chars_ptr;
      parent : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proc_fs.h:77
   pragma Import (CPP, proc_net_mkdir, "_ZL14proc_net_mkdirP3netPKcP14proc_dir_entry");

end linux_proc_fs_h;

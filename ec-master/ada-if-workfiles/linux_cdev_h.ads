pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_kobject_h;
with System;
with linux_fs_h;
with linux_types_h;

package linux_cdev_h is

   type cdev is record
      kobj : aliased linux_kobject_h.kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:13
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:14
      ops : access constant linux_fs_h.file_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:15
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:16
      dev : aliased linux_types_h.dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:17
      count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:18
   end record;
   pragma Convention (C_Pass_By_Copy, cdev);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:12

   procedure cdev_init (arg1 : access cdev; arg2 : access constant linux_fs_h.file_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:21
   pragma Import (CPP, cdev_init, "_Z9cdev_initP4cdevPK15file_operations");

   function cdev_alloc return access cdev;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:23
   pragma Import (CPP, cdev_alloc, "_Z10cdev_allocv");

   procedure cdev_put (p : access cdev);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:25
   pragma Import (CPP, cdev_put, "_Z8cdev_putP4cdev");

   function cdev_add
     (arg1 : access cdev;
      arg2 : linux_types_h.dev_t;
      arg3 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:27
   pragma Import (CPP, cdev_add, "_Z8cdev_addP4cdevjj");

   procedure cdev_del (arg1 : access cdev);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:29
   pragma Import (CPP, cdev_del, "_Z8cdev_delP4cdev");

   procedure cd_forget (arg1 : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:31
   pragma Import (CPP, cd_forget, "_Z9cd_forgetP5inode");

   directly_mappable_cdev_bdi : aliased linux_fs_h.Class_backing_dev_info.backing_dev_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cdev.h:33
   pragma Import (C, directly_mappable_cdev_bdi, "directly_mappable_cdev_bdi");

end linux_cdev_h;

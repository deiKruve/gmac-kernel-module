pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;
with System;
limited with linux_sched_h;
with Interfaces.C.Extensions;
limited with linux_fs_h;
limited with linux_dcache_h;

package linux_capability_h is

   --  arg-macro: procedure CAP_FOR_EACH_U32 for (__capi := 0; __capi < _KERNEL_CAPABILITY_U32S; ++__capi)
   --    for (__capi := 0; __capi < _KERNEL_CAPABILITY_U32S; ++__capi)
   --  unsupported macro: CAP_FS_MASK_B0 (CAP_TO_MASK(CAP_CHOWN) | CAP_TO_MASK(CAP_MKNOD) | CAP_TO_MASK(CAP_DAC_OVERRIDE) | CAP_TO_MASK(CAP_DAC_READ_SEARCH) | CAP_TO_MASK(CAP_FOWNER) | CAP_TO_MASK(CAP_FSETID))
   --  unsupported macro: CAP_FS_MASK_B1 (CAP_TO_MASK(CAP_MAC_OVERRIDE))
   --  unsupported macro: CAP_LAST_U32 ((_KERNEL_CAPABILITY_U32S) - 1)
   --  unsupported macro: CAP_LAST_U32_VALID_MASK (CAP_TO_MASK(CAP_LAST_CAP + 1) -1)
   --  unsupported macro: CAP_EMPTY_SET ((kernel_cap_t){{ 0, 0 }})
   --  unsupported macro: CAP_FULL_SET ((kernel_cap_t){{ ~0, CAP_LAST_U32_VALID_MASK }})
   --  unsupported macro: CAP_FS_SET ((kernel_cap_t){{ CAP_FS_MASK_B0 | CAP_TO_MASK(CAP_LINUX_IMMUTABLE), CAP_FS_MASK_B1 } })
   --  unsupported macro: CAP_NFSD_SET ((kernel_cap_t){{ CAP_FS_MASK_B0 | CAP_TO_MASK(CAP_SYS_RESOURCE), CAP_FS_MASK_B1 } })
   --  arg-macro: procedure cap_clear do { (c) := __cap_empty_set; } while (0)
   --    do { (c) := __cap_empty_set; } while (0)
   --  arg-macro: function cap_raise ((c).cap(CAP_TO_INDEX(flag)) |= CAP_TO_MASK(flag)
   --    return (c).cap(CAP_TO_INDEX(flag)) |= CAP_TO_MASK(flag);
   --  arg-macro: function cap_lower ((c).cap(CAP_TO_INDEX(flag)) &= ~CAP_TO_MASK(flag)
   --    return (c).cap(CAP_TO_INDEX(flag)) &= ~CAP_TO_MASK(flag);
   --  arg-macro: function cap_raised ((c).cap(CAP_TO_INDEX(flag)) and CAP_TO_MASK(flag)
   --    return (c).cap(CAP_TO_INDEX(flag)) and CAP_TO_MASK(flag);
   --  arg-macro: procedure CAP_BOP_ALL do { unsigned __capi; CAP_FOR_EACH_U32(__capi) { c.cap(__capi) := a.cap(__capi) OP b.cap(__capi); } } while (0)
   --    do { unsigned __capi; CAP_FOR_EACH_U32(__capi) { c.cap(__capi) := a.cap(__capi) OP b.cap(__capi); } } while (0)
   --  arg-macro: procedure CAP_UOP_ALL do { unsigned __capi; CAP_FOR_EACH_U32(__capi) { c.cap(__capi) := OP a.cap(__capi); } } while (0)
   --    do { unsigned __capi; CAP_FOR_EACH_U32(__capi) { c.cap(__capi) := OP a.cap(__capi); } } while (0)
  -- * This is <linux/capability.h>
  -- *
  -- * Andrew G. Morgan <morgan@kernel.org>
  -- * Alexander Kjeldaas <astor@guardian.no>
  -- * with help from Aleph1, Roland Buresund and Andrew Main.
  -- *
  -- * See here for the libcap library ("POSIX draft" compliance):
  -- *
  -- * ftp://www.kernel.org/pub/linux/libs/security/linux-privs/kernel-2.6/
  --  

   file_caps_enabled : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:21
   pragma Import (C, file_caps_enabled, "file_caps_enabled");

   type kernel_cap_struct_cap_array is array (0 .. 1) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type kernel_cap_struct is record
      cap : aliased kernel_cap_struct_cap_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, kernel_cap_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:23

   subtype kernel_cap_t is kernel_cap_struct;

  -- exact same as vfs_cap_data but in cpu endian and always filled completely  
   type cpu_vfs_cap_data is record
      magic_etc : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:29
      permitted : aliased kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:30
      inheritable : aliased kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, cpu_vfs_cap_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:28

   function current_user_ns return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:43
   pragma Import (CPP, current_user_ns, "_Z15current_user_nsv");

  -- * Internal kernel functions only
  --  

  -- * CAP_FS_MASK and CAP_NFSD_MASKS:
  -- *
  -- * The fs mask is all the privileges that fsuid==0 historically meant.
  -- * At one time in the past, that included CAP_MKNOD and CAP_LINUX_IMMUTABLE.
  -- *
  -- * It has never meant setting security.* and trusted.* xattrs.
  -- *
  -- * We could also define fsmask as follows:
  -- *   1. CAP_FS_MASK is the privilege to bypass all fs-related DAC permissions
  -- *   2. The security.* and trusted.* xattrs are fs-related MAC permissions
  --  

   function cap_combine (a : kernel_cap_t; b : kernel_cap_t) return kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:117
   pragma Import (CPP, cap_combine, "_ZL11cap_combine17kernel_cap_structS_");

   function cap_intersect (a : kernel_cap_t; b : kernel_cap_t) return kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:125
   pragma Import (CPP, cap_intersect, "_ZL13cap_intersect17kernel_cap_structS_");

   function cap_drop (a : kernel_cap_t; drop : kernel_cap_t) return kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:133
   pragma Import (CPP, cap_drop, "_ZL8cap_drop17kernel_cap_structS_");

   function cap_invert (c : kernel_cap_t) return kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:141
   pragma Import (CPP, cap_invert, "_ZL10cap_invert17kernel_cap_struct");

   function cap_isclear (a : kernel_cap_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:148
   pragma Import (CPP, cap_isclear, "_ZL11cap_isclear17kernel_cap_struct");

  -- * Check if "a" is a subset of "set".
  -- * return 1 if ALL of the capabilities in "a" are also in "set"
  -- *	cap_issubset(0101, 1111) will return 1
  -- * return 0 if ANY of the capabilities in "a" are not in "set"
  -- *	cap_issubset(1111, 0101) will return 0
  --  

   function cap_issubset (a : kernel_cap_t; set : kernel_cap_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:165
   pragma Import (CPP, cap_issubset, "_ZL12cap_issubset17kernel_cap_structS_");

  -- Used to decide between falling back on the old suser() or fsuser().  
   function cap_is_fs_cap (cap : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:174
   pragma Import (CPP, cap_is_fs_cap, "_ZL13cap_is_fs_capi");

   function cap_drop_fs_set (a : kernel_cap_t) return kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:180
   pragma Import (CPP, cap_drop_fs_set, "_ZL15cap_drop_fs_set17kernel_cap_struct");

   function cap_raise_fs_set (a : kernel_cap_t; permitted : kernel_cap_t) return kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:186
   pragma Import (CPP, cap_raise_fs_set, "_ZL16cap_raise_fs_set17kernel_cap_structS_");

   function cap_drop_nfsd_set (a : kernel_cap_t) return kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:194
   pragma Import (CPP, cap_drop_nfsd_set, "_ZL17cap_drop_nfsd_set17kernel_cap_struct");

   function cap_raise_nfsd_set (a : kernel_cap_t; permitted : kernel_cap_t) return kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:200
   pragma Import (CPP, cap_raise_nfsd_set, "_ZL18cap_raise_nfsd_set17kernel_cap_structS_");

   function has_capability (t : access linux_sched_h.task_struct; cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:208
   pragma Import (CPP, has_capability, "_Z14has_capabilityP11task_structi");

   function has_ns_capability
     (t : access linux_sched_h.task_struct;
      ns : System.Address;
      cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:209
   pragma Import (CPP, has_ns_capability, "_Z17has_ns_capabilityP11task_structP14user_namespacei");

   function has_capability_noaudit (t : access linux_sched_h.task_struct; cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:211
   pragma Import (CPP, has_capability_noaudit, "_Z22has_capability_noauditP11task_structi");

   function has_ns_capability_noaudit
     (t : access linux_sched_h.task_struct;
      ns : System.Address;
      cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:212
   pragma Import (CPP, has_ns_capability_noaudit, "_Z25has_ns_capability_noauditP11task_structP14user_namespacei");

   function capable (cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:214
   pragma Import (CPP, capable, "_Z7capablei");

   function ns_capable (ns : System.Address; cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:215
   pragma Import (CPP, ns_capable, "_Z10ns_capableP14user_namespacei");

   function capable_wrt_inode_uidgid (the_inode : access constant linux_fs_h.inode; cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:216
   pragma Import (CPP, capable_wrt_inode_uidgid, "_Z24capable_wrt_inode_uidgidPK5inodei");

   function file_ns_capable
     (the_file : access constant linux_fs_h.file;
      ns : System.Address;
      cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:217
   pragma Import (CPP, file_ns_capable, "_Z15file_ns_capablePK4fileP14user_namespacei");

  -- audit system wants to get cap info from files as well  
   function get_vfs_caps_from_disk (the_dentry : access constant linux_dcache_h.dentry; cpu_caps : access cpu_vfs_cap_data) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/capability.h:220
   pragma Import (CPP, get_vfs_caps_from_disk, "_Z22get_vfs_caps_from_diskPK6dentryP16cpu_vfs_cap_data");

end linux_capability_h;

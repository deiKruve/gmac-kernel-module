pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_cred_h;
with System;
limited with uapi_linux_time_h;
limited with linux_sched_h;
limited with linux_capability_h;
limited with linux_dcache_h;
with Interfaces.C.Strings;
with linux_types_h;
limited with linux_fs_h;
limited with linux_mm_types_h;
limited with linux_skbuff_h;
limited with linux_sysctl_h;
limited with linux_seq_file_h;
limited with linux_path_h;
with asm_generic_int_ll64_h;
with linux_uidgid_h;
with Interfaces.C.Extensions;
limited with uapi_linux_resource_h;
limited with uapi_asm_generic_siginfo_h;
limited with linux_ipc_h;
limited with linux_sem_h;
limited with uapi_linux_sem_h;
limited with linux_net_h;
limited with linux_socket_h;
limited with net_flow_h;
limited with uapi_linux_xfrm_h;
with linux_key_h;

package linux_security_h is

   --  unsupported macro: SECURITY_NAME_MAX 10
   --  unsupported macro: SECURITY_CAP_NOAUDIT 0
   --  unsupported macro: SECURITY_CAP_AUDIT 1
   --  unsupported macro: SECURITY_LSM_NATIVE_LABELS 1
   --  unsupported macro: LSM_SETID_ID 1
   --  unsupported macro: LSM_SETID_RE 2
   --  unsupported macro: LSM_SETID_RES 4
   --  unsupported macro: LSM_SETID_FS 8
   --  unsupported macro: LSM_UNSAFE_SHARE 1
   --  unsupported macro: LSM_UNSAFE_PTRACE 2
   --  unsupported macro: LSM_UNSAFE_PTRACE_CAP 4
   --  unsupported macro: LSM_UNSAFE_NO_NEW_PRIVS 8
  -- * Linux Security plug
  -- *
  -- * Copyright (C) 2001 WireX Communications, Inc <chris@wirex.com>
  -- * Copyright (C) 2001 Greg Kroah-Hartman <greg@kroah.com>
  -- * Copyright (C) 2001 Networks Associates Technology, Inc <ssmalley@nai.com>
  -- * Copyright (C) 2001 James Morris <jmorris@intercode.com.au>
  -- * Copyright (C) 2001 Silicon Graphics, Inc. (Trust Technology Group)
  -- *
  -- *	This program is free software; you can redistribute it and/or modify
  -- *	it under the terms of the GNU General Public License as published by
  -- *	the Free Software Foundation; either version 2 of the License, or
  -- *	(at your option) any later version.
  -- *
  -- *	Due to this file being licensed under the GPL there is controversy over
  -- *	whether this permits you to write a module that #includes this file
  -- *	without placing your module under the GPL.  Please consult a lawyer for
  -- *	advice before doing this.
  -- *
  --  

   --  skipped empty struct linux_binprm

   --  skipped empty struct shmid_kernel

   --  skipped empty struct msg_msg

   --  skipped empty struct msg_queue

   --  skipped empty struct xattr

  -- Maximum number of letters for an LSM name string  
  -- If capable should audit the security request  
  -- LSM Agnostic defines for sb_set_mnt_opts  
   --  skipped empty struct audit_krule

  -- * These functions are in security/capability.c and are used
  -- * as the default capabilities functions
  --  

   function cap_capable
     (the_cred : access constant linux_cred_h.cred;
      ns : System.Address;
      cap : int;
      audit : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:76
   pragma Import (CPP, cap_capable, "_Z11cap_capablePK4credP14user_namespaceii");

   function cap_settime (ts : access constant uapi_linux_time_h.timespec; tz : access constant uapi_linux_time_h.timezone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:78
   pragma Import (CPP, cap_settime, "_Z11cap_settimePK8timespecPK8timezone");

   function cap_ptrace_access_check (child : access linux_sched_h.task_struct; mode : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:79
   pragma Import (CPP, cap_ptrace_access_check, "_Z23cap_ptrace_access_checkP11task_structj");

   function cap_ptrace_traceme (parent : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:80
   pragma Import (CPP, cap_ptrace_traceme, "_Z18cap_ptrace_tracemeP11task_struct");

   function cap_capget
     (target : access linux_sched_h.task_struct;
      effective : access linux_capability_h.kernel_cap_t;
      inheritable : access linux_capability_h.kernel_cap_t;
      permitted : access linux_capability_h.kernel_cap_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:81
   pragma Import (CPP, cap_capget, "_Z10cap_capgetP11task_structP17kernel_cap_structS2_S2_");

   function cap_capset (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:82
   pragma Import (CPP, cap_capset, "_Z10cap_capsetP4cred");

   function cap_bprm_set_creds (bprm : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:86
   pragma Import (CPP, cap_bprm_set_creds, "_Z18cap_bprm_set_credsP12linux_binprm");

   function cap_bprm_secureexec (bprm : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:87
   pragma Import (CPP, cap_bprm_secureexec, "_Z19cap_bprm_secureexecP12linux_binprm");

   function cap_inode_setxattr
     (the_dentry : access linux_dcache_h.dentry;
      name : Interfaces.C.Strings.chars_ptr;
      value : System.Address;
      size : linux_types_h.size_t;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:88
   pragma Import (CPP, cap_inode_setxattr, "_Z18cap_inode_setxattrP6dentryPKcPKvmi");

   function cap_inode_removexattr (the_dentry : access linux_dcache_h.dentry; name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:90
   pragma Import (CPP, cap_inode_removexattr, "_Z21cap_inode_removexattrP6dentryPKc");

   function cap_inode_need_killpriv (the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:91
   pragma Import (CPP, cap_inode_need_killpriv, "_Z23cap_inode_need_killprivP6dentry");

   function cap_inode_killpriv (the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:92
   pragma Import (CPP, cap_inode_killpriv, "_Z18cap_inode_killprivP6dentry");

   function cap_mmap_addr (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:93
   pragma Import (CPP, cap_mmap_addr, "_Z13cap_mmap_addrm");

   function cap_mmap_file
     (the_file : access linux_fs_h.file;
      reqprot : unsigned_long;
      prot : unsigned_long;
      flags : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:94
   pragma Import (CPP, cap_mmap_file, "_Z13cap_mmap_fileP4filemmm");

   function cap_task_fix_setuid (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:96
   pragma Import (CPP, cap_task_fix_setuid, "_Z19cap_task_fix_setuidP4cred");

   function cap_task_prctl
     (option : int;
      arg2 : unsigned_long;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:97
   pragma Import (CPP, cap_task_prctl, "_Z14cap_task_prctlimmmm");

   function cap_task_setscheduler (p : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:99
   pragma Import (CPP, cap_task_setscheduler, "_Z21cap_task_setschedulerP11task_struct");

   function cap_task_setioprio (p : access linux_sched_h.task_struct; ioprio : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:100
   pragma Import (CPP, cap_task_setioprio, "_Z18cap_task_setioprioP11task_structi");

   function cap_task_setnice (p : access linux_sched_h.task_struct; nice : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:101
   pragma Import (CPP, cap_task_setnice, "_Z16cap_task_setniceP11task_structi");

   function cap_vm_enough_memory (mm : access linux_mm_types_h.mm_struct; pages : long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:102
   pragma Import (CPP, cap_vm_enough_memory, "_Z20cap_vm_enough_memoryP9mm_structl");

   --  skipped empty struct xfrm_policy

   --  skipped empty struct xfrm_state

   function cap_netlink_send (sk : System.Address; skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:117
   pragma Import (CPP, cap_netlink_send, "_Z16cap_netlink_sendP4sockP7sk_buff");

   procedure reset_security_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:119
   pragma Import (CPP, reset_security_ops, "_Z18reset_security_opsv");

   mmap_min_addr : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:122
   pragma Import (C, mmap_min_addr, "mmap_min_addr");

   dac_mmap_min_addr : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:123
   pragma Import (C, dac_mmap_min_addr, "dac_mmap_min_addr");

  -- * Values used in the task_security_ops calls
  --  

  -- setuid or setgid, id0 == uid or gid  
  -- setreuid or setregid, id0 == real, id1 == eff  
  -- setresuid or setresgid, id0 == real, id1 == eff, uid2 == saved  
  -- setfsuid or setfsgid, id0 == fsuid or fsgid  
  -- forward declares to avoid warnings  
   --  skipped empty struct request_sock

  -- bprm->unsafe reasons  
   function mmap_min_addr_handler
     (table : access linux_sysctl_h.ctl_table;
      write : int;
      buffer : System.Address;
      lenp : access linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:155
   pragma Import (CPP, mmap_min_addr_handler, "_Z21mmap_min_addr_handlerP9ctl_tableiPvPmPx");

  -- security_inode_init_security callback function to write xattrs  
   type initxattrs is access function
        (arg1 : access linux_fs_h.inode;
         arg2 : System.Address;
         arg3 : System.Address) return int;
   pragma Convention (C, initxattrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:160

   type security_mnt_opts is record
      mnt_opts : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:166
      mnt_opts_flags : access int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:167
      num_mnt_opts : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:168
   end record;
   pragma Convention (C_Pass_By_Copy, security_mnt_opts);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:165

   procedure security_init_mnt_opts (opts : access security_mnt_opts);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:171
   pragma Import (CPP, security_init_mnt_opts, "_ZL22security_init_mnt_optsP17security_mnt_opts");

   procedure security_free_mnt_opts (opts : access security_mnt_opts);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:178
   pragma Import (CPP, security_free_mnt_opts, "_ZL22security_free_mnt_optsP17security_mnt_opts");

  --*
  -- * struct security_operations - main security structure
  -- *
  -- * Security module identifier.
  -- *
  -- * @name:
  -- *	A string that acts as a unique identifier for the LSM with max number
  -- *	of characters = SECURITY_NAME_MAX.
  -- *
  -- * Security hooks for program execution operations.
  -- *
  -- * @bprm_set_creds:
  -- *	Save security information in the bprm->security field, typically based
  -- *	on information about the bprm->file, for later use by the apply_creds
  -- *	hook.  This hook may also optionally check permissions (e.g. for
  -- *	transitions between security domains).
  -- *	This hook may be called multiple times during a single execve, e.g. for
  -- *	interpreters.  The hook can tell whether it has already been called by
  -- *	checking to see if @bprm->security is non-NULL.  If so, then the hook
  -- *	may decide either to retain the security information saved earlier or
  -- *	to replace it.
  -- *	@bprm contains the linux_binprm structure.
  -- *	Return 0 if the hook is successful and permission is granted.
  -- * @bprm_check_security:
  -- *	This hook mediates the point when a search for a binary handler will
  -- *	begin.  It allows a check the @bprm->security value which is set in the
  -- *	preceding set_creds call.  The primary difference from set_creds is
  -- *	that the argv list and envp list are reliably available in @bprm.  This
  -- *	hook may be called multiple times during a single execve; and in each
  -- *	pass set_creds is called first.
  -- *	@bprm contains the linux_binprm structure.
  -- *	Return 0 if the hook is successful and permission is granted.
  -- * @bprm_committing_creds:
  -- *	Prepare to install the new security attributes of a process being
  -- *	transformed by an execve operation, based on the old credentials
  -- *	pointed to by @current->cred and the information set in @bprm->cred by
  -- *	the bprm_set_creds hook.  @bprm points to the linux_binprm structure.
  -- *	This hook is a good place to perform state changes on the process such
  -- *	as closing open file descriptors to which access will no longer be
  -- *	granted when the attributes are changed.  This is called immediately
  -- *	before commit_creds().
  -- * @bprm_committed_creds:
  -- *	Tidy up after the installation of the new security attributes of a
  -- *	process being transformed by an execve operation.  The new credentials
  -- *	have, by this point, been set to @current->cred.  @bprm points to the
  -- *	linux_binprm structure.  This hook is a good place to perform state
  -- *	changes on the process such as clearing out non-inheritable signal
  -- *	state.  This is called immediately after commit_creds().
  -- * @bprm_secureexec:
  -- *	Return a boolean value (0 or 1) indicating whether a "secure exec"
  -- *	is required.  The flag is passed in the auxiliary table
  -- *	on the initial stack to the ELF interpreter to indicate whether libc
  -- *	should enable secure mode.
  -- *	@bprm contains the linux_binprm structure.
  -- *
  -- * Security hooks for filesystem operations.
  -- *
  -- * @sb_alloc_security:
  -- *	Allocate and attach a security structure to the sb->s_security field.
  -- *	The s_security field is initialized to NULL when the structure is
  -- *	allocated.
  -- *	@sb contains the super_block structure to be modified.
  -- *	Return 0 if operation was successful.
  -- * @sb_free_security:
  -- *	Deallocate and clear the sb->s_security field.
  -- *	@sb contains the super_block structure to be modified.
  -- * @sb_statfs:
  -- *	Check permission before obtaining filesystem statistics for the @mnt
  -- *	mountpoint.
  -- *	@dentry is a handle on the superblock for the filesystem.
  -- *	Return 0 if permission is granted.
  -- * @sb_mount:
  -- *	Check permission before an object specified by @dev_name is mounted on
  -- *	the mount point named by @nd.  For an ordinary mount, @dev_name
  -- *	identifies a device if the file system type requires a device.  For a
  -- *	remount (@flags & MS_REMOUNT), @dev_name is irrelevant.  For a
  -- *	loopback/bind mount (@flags & MS_BIND), @dev_name identifies the
  -- *	pathname of the object being mounted.
  -- *	@dev_name contains the name for object being mounted.
  -- *	@path contains the path for mount point object.
  -- *	@type contains the filesystem type.
  -- *	@flags contains the mount flags.
  -- *	@data contains the filesystem-specific data.
  -- *	Return 0 if permission is granted.
  -- * @sb_copy_data:
  -- *	Allow mount option data to be copied prior to parsing by the filesystem,
  -- *	so that the security module can extract security-specific mount
  -- *	options cleanly (a filesystem may modify the data e.g. with strsep()).
  -- *	This also allows the original mount data to be stripped of security-
  -- *	specific options to avoid having to make filesystems aware of them.
  -- *	@type the type of filesystem being mounted.
  -- *	@orig the original mount data copied from userspace.
  -- *	@copy copied data which will be passed to the security module.
  -- *	Returns 0 if the copy was successful.
  -- * @sb_remount:
  -- *	Extracts security system specific mount options and verifies no changes
  -- *	are being made to those options.
  -- *	@sb superblock being remounted
  -- *	@data contains the filesystem-specific data.
  -- *	Return 0 if permission is granted.
  -- * @sb_umount:
  -- *	Check permission before the @mnt file system is unmounted.
  -- *	@mnt contains the mounted file system.
  -- *	@flags contains the unmount flags, e.g. MNT_FORCE.
  -- *	Return 0 if permission is granted.
  -- * @sb_pivotroot:
  -- *	Check permission before pivoting the root filesystem.
  -- *	@old_path contains the path for the new location of the current root (put_old).
  -- *	@new_path contains the path for the new root (new_root).
  -- *	Return 0 if permission is granted.
  -- * @sb_set_mnt_opts:
  -- *	Set the security relevant mount options used for a superblock
  -- *	@sb the superblock to set security mount options for
  -- *	@opts binary data structure containing all lsm mount data
  -- * @sb_clone_mnt_opts:
  -- *	Copy all security options from a given superblock to another
  -- *	@oldsb old superblock which contain information to clone
  -- *	@newsb new superblock which needs filled in
  -- * @sb_parse_opts_str:
  -- *	Parse a string of security data filling in the opts structure
  -- *	@options string containing all mount options known by the LSM
  -- *	@opts binary data structure usable by the LSM
  -- * @dentry_init_security:
  -- *	Compute a context for a dentry as the inode is not yet available
  -- *	since NFSv4 has no label backed by an EA anyway.
  -- *	@dentry dentry to use in calculating the context.
  -- *	@mode mode used to determine resource type.
  -- *	@name name of the last path component used to create file
  -- *	@ctx pointer to place the pointer to the resulting context in.
  -- *	@ctxlen point to place the length of the resulting context.
  -- *
  -- *
  -- * Security hooks for inode operations.
  -- *
  -- * @inode_alloc_security:
  -- *	Allocate and attach a security structure to @inode->i_security.  The
  -- *	i_security field is initialized to NULL when the inode structure is
  -- *	allocated.
  -- *	@inode contains the inode structure.
  -- *	Return 0 if operation was successful.
  -- * @inode_free_security:
  -- *	@inode contains the inode structure.
  -- *	Deallocate the inode security structure and set @inode->i_security to
  -- *	NULL.
  -- * @inode_init_security:
  -- *	Obtain the security attribute name suffix and value to set on a newly
  -- *	created inode and set up the incore security field for the new inode.
  -- *	This hook is called by the fs code as part of the inode creation
  -- *	transaction and provides for atomic labeling of the inode, unlike
  -- *	the post_create/mkdir/... hooks called by the VFS.  The hook function
  -- *	is expected to allocate the name and value via kmalloc, with the caller
  -- *	being responsible for calling kfree after using them.
  -- *	If the security module does not use security attributes or does
  -- *	not wish to put a security attribute on this particular inode,
  -- *	then it should return -EOPNOTSUPP to skip this processing.
  -- *	@inode contains the inode structure of the newly created inode.
  -- *	@dir contains the inode structure of the parent directory.
  -- *	@qstr contains the last path component of the new object
  -- *	@name will be set to the allocated name suffix (e.g. selinux).
  -- *	@value will be set to the allocated attribute value.
  -- *	@len will be set to the length of the value.
  -- *	Returns 0 if @name and @value have been successfully set,
  -- *		-EOPNOTSUPP if no security attribute is needed, or
  -- *		-ENOMEM on memory allocation failure.
  -- * @inode_create:
  -- *	Check permission to create a regular file.
  -- *	@dir contains inode structure of the parent of the new file.
  -- *	@dentry contains the dentry structure for the file to be created.
  -- *	@mode contains the file mode of the file to be created.
  -- *	Return 0 if permission is granted.
  -- * @inode_link:
  -- *	Check permission before creating a new hard link to a file.
  -- *	@old_dentry contains the dentry structure for an existing link to the file.
  -- *	@dir contains the inode structure of the parent directory of the new link.
  -- *	@new_dentry contains the dentry structure for the new link.
  -- *	Return 0 if permission is granted.
  -- * @path_link:
  -- *	Check permission before creating a new hard link to a file.
  -- *	@old_dentry contains the dentry structure for an existing link
  -- *	to the file.
  -- *	@new_dir contains the path structure of the parent directory of
  -- *	the new link.
  -- *	@new_dentry contains the dentry structure for the new link.
  -- *	Return 0 if permission is granted.
  -- * @inode_unlink:
  -- *	Check the permission to remove a hard link to a file.
  -- *	@dir contains the inode structure of parent directory of the file.
  -- *	@dentry contains the dentry structure for file to be unlinked.
  -- *	Return 0 if permission is granted.
  -- * @path_unlink:
  -- *	Check the permission to remove a hard link to a file.
  -- *	@dir contains the path structure of parent directory of the file.
  -- *	@dentry contains the dentry structure for file to be unlinked.
  -- *	Return 0 if permission is granted.
  -- * @inode_symlink:
  -- *	Check the permission to create a symbolic link to a file.
  -- *	@dir contains the inode structure of parent directory of the symbolic link.
  -- *	@dentry contains the dentry structure of the symbolic link.
  -- *	@old_name contains the pathname of file.
  -- *	Return 0 if permission is granted.
  -- * @path_symlink:
  -- *	Check the permission to create a symbolic link to a file.
  -- *	@dir contains the path structure of parent directory of
  -- *	the symbolic link.
  -- *	@dentry contains the dentry structure of the symbolic link.
  -- *	@old_name contains the pathname of file.
  -- *	Return 0 if permission is granted.
  -- * @inode_mkdir:
  -- *	Check permissions to create a new directory in the existing directory
  -- *	associated with inode structure @dir.
  -- *	@dir contains the inode structure of parent of the directory to be created.
  -- *	@dentry contains the dentry structure of new directory.
  -- *	@mode contains the mode of new directory.
  -- *	Return 0 if permission is granted.
  -- * @path_mkdir:
  -- *	Check permissions to create a new directory in the existing directory
  -- *	associated with path structure @path.
  -- *	@dir contains the path structure of parent of the directory
  -- *	to be created.
  -- *	@dentry contains the dentry structure of new directory.
  -- *	@mode contains the mode of new directory.
  -- *	Return 0 if permission is granted.
  -- * @inode_rmdir:
  -- *	Check the permission to remove a directory.
  -- *	@dir contains the inode structure of parent of the directory to be removed.
  -- *	@dentry contains the dentry structure of directory to be removed.
  -- *	Return 0 if permission is granted.
  -- * @path_rmdir:
  -- *	Check the permission to remove a directory.
  -- *	@dir contains the path structure of parent of the directory to be
  -- *	removed.
  -- *	@dentry contains the dentry structure of directory to be removed.
  -- *	Return 0 if permission is granted.
  -- * @inode_mknod:
  -- *	Check permissions when creating a special file (or a socket or a fifo
  -- *	file created via the mknod system call).  Note that if mknod operation
  -- *	is being done for a regular file, then the create hook will be called
  -- *	and not this hook.
  -- *	@dir contains the inode structure of parent of the new file.
  -- *	@dentry contains the dentry structure of the new file.
  -- *	@mode contains the mode of the new file.
  -- *	@dev contains the device number.
  -- *	Return 0 if permission is granted.
  -- * @path_mknod:
  -- *	Check permissions when creating a file. Note that this hook is called
  -- *	even if mknod operation is being done for a regular file.
  -- *	@dir contains the path structure of parent of the new file.
  -- *	@dentry contains the dentry structure of the new file.
  -- *	@mode contains the mode of the new file.
  -- *	@dev contains the undecoded device number. Use new_decode_dev() to get
  -- *	the decoded device number.
  -- *	Return 0 if permission is granted.
  -- * @inode_rename:
  -- *	Check for permission to rename a file or directory.
  -- *	@old_dir contains the inode structure for parent of the old link.
  -- *	@old_dentry contains the dentry structure of the old link.
  -- *	@new_dir contains the inode structure for parent of the new link.
  -- *	@new_dentry contains the dentry structure of the new link.
  -- *	Return 0 if permission is granted.
  -- * @path_rename:
  -- *	Check for permission to rename a file or directory.
  -- *	@old_dir contains the path structure for parent of the old link.
  -- *	@old_dentry contains the dentry structure of the old link.
  -- *	@new_dir contains the path structure for parent of the new link.
  -- *	@new_dentry contains the dentry structure of the new link.
  -- *	Return 0 if permission is granted.
  -- * @path_chmod:
  -- *	Check for permission to change DAC's permission of a file or directory.
  -- *	@dentry contains the dentry structure.
  -- *	@mnt contains the vfsmnt structure.
  -- *	@mode contains DAC's mode.
  -- *	Return 0 if permission is granted.
  -- * @path_chown:
  -- *	Check for permission to change owner/group of a file or directory.
  -- *	@path contains the path structure.
  -- *	@uid contains new owner's ID.
  -- *	@gid contains new group's ID.
  -- *	Return 0 if permission is granted.
  -- * @path_chroot:
  -- *	Check for permission to change root directory.
  -- *	@path contains the path structure.
  -- *	Return 0 if permission is granted.
  -- * @inode_readlink:
  -- *	Check the permission to read the symbolic link.
  -- *	@dentry contains the dentry structure for the file link.
  -- *	Return 0 if permission is granted.
  -- * @inode_follow_link:
  -- *	Check permission to follow a symbolic link when looking up a pathname.
  -- *	@dentry contains the dentry structure for the link.
  -- *	@nd contains the nameidata structure for the parent directory.
  -- *	Return 0 if permission is granted.
  -- * @inode_permission:
  -- *	Check permission before accessing an inode.  This hook is called by the
  -- *	existing Linux permission function, so a security module can use it to
  -- *	provide additional checking for existing Linux permission checks.
  -- *	Notice that this hook is called when a file is opened (as well as many
  -- *	other operations), whereas the file_security_ops permission hook is
  -- *	called when the actual read/write operations are performed.
  -- *	@inode contains the inode structure to check.
  -- *	@mask contains the permission mask.
  -- *	Return 0 if permission is granted.
  -- * @inode_setattr:
  -- *	Check permission before setting file attributes.  Note that the kernel
  -- *	call to notify_change is performed from several locations, whenever
  -- *	file attributes change (such as when a file is truncated, chown/chmod
  -- *	operations, transferring disk quotas, etc).
  -- *	@dentry contains the dentry structure for the file.
  -- *	@attr is the iattr structure containing the new file attributes.
  -- *	Return 0 if permission is granted.
  -- * @path_truncate:
  -- *	Check permission before truncating a file.
  -- *	@path contains the path structure for the file.
  -- *	Return 0 if permission is granted.
  -- * @inode_getattr:
  -- *	Check permission before obtaining file attributes.
  -- *	@mnt is the vfsmount where the dentry was looked up
  -- *	@dentry contains the dentry structure for the file.
  -- *	Return 0 if permission is granted.
  -- * @inode_setxattr:
  -- *	Check permission before setting the extended attributes
  -- *	@value identified by @name for @dentry.
  -- *	Return 0 if permission is granted.
  -- * @inode_post_setxattr:
  -- *	Update inode security field after successful setxattr operation.
  -- *	@value identified by @name for @dentry.
  -- * @inode_getxattr:
  -- *	Check permission before obtaining the extended attributes
  -- *	identified by @name for @dentry.
  -- *	Return 0 if permission is granted.
  -- * @inode_listxattr:
  -- *	Check permission before obtaining the list of extended attribute
  -- *	names for @dentry.
  -- *	Return 0 if permission is granted.
  -- * @inode_removexattr:
  -- *	Check permission before removing the extended attribute
  -- *	identified by @name for @dentry.
  -- *	Return 0 if permission is granted.
  -- * @inode_getsecurity:
  -- *	Retrieve a copy of the extended attribute representation of the
  -- *	security label associated with @name for @inode via @buffer.  Note that
  -- *	@name is the remainder of the attribute name after the security prefix
  -- *	has been removed. @alloc is used to specify of the call should return a
  -- *	value via the buffer or just the value length Return size of buffer on
  -- *	success.
  -- * @inode_setsecurity:
  -- *	Set the security label associated with @name for @inode from the
  -- *	extended attribute value @value.  @size indicates the size of the
  -- *	@value in bytes.  @flags may be XATTR_CREATE, XATTR_REPLACE, or 0.
  -- *	Note that @name is the remainder of the attribute name after the
  -- *	security. prefix has been removed.
  -- *	Return 0 on success.
  -- * @inode_listsecurity:
  -- *	Copy the extended attribute names for the security labels
  -- *	associated with @inode into @buffer.  The maximum size of @buffer
  -- *	is specified by @buffer_size.  @buffer may be NULL to request
  -- *	the size of the buffer required.
  -- *	Returns number of bytes used/required on success.
  -- * @inode_need_killpriv:
  -- *	Called when an inode has been changed.
  -- *	@dentry is the dentry being changed.
  -- *	Return <0 on error to abort the inode change operation.
  -- *	Return 0 if inode_killpriv does not need to be called.
  -- *	Return >0 if inode_killpriv does need to be called.
  -- * @inode_killpriv:
  -- *	The setuid bit is being removed.  Remove similar security labels.
  -- *	Called with the dentry->d_inode->i_mutex held.
  -- *	@dentry is the dentry being changed.
  -- *	Return 0 on success.  If error is returned, then the operation
  -- *	causing setuid bit removal is failed.
  -- * @inode_getsecid:
  -- *	Get the secid associated with the node.
  -- *	@inode contains a pointer to the inode.
  -- *	@secid contains a pointer to the location where result will be saved.
  -- *	In case of failure, @secid will be set to zero.
  -- *
  -- * Security hooks for file operations
  -- *
  -- * @file_permission:
  -- *	Check file permissions before accessing an open file.  This hook is
  -- *	called by various operations that read or write files.  A security
  -- *	module can use this hook to perform additional checking on these
  -- *	operations, e.g.  to revalidate permissions on use to support privilege
  -- *	bracketing or policy changes.  Notice that this hook is used when the
  -- *	actual read/write operations are performed, whereas the
  -- *	inode_security_ops hook is called when a file is opened (as well as
  -- *	many other operations).
  -- *	Caveat:  Although this hook can be used to revalidate permissions for
  -- *	various system call operations that read or write files, it does not
  -- *	address the revalidation of permissions for memory-mapped files.
  -- *	Security modules must handle this separately if they need such
  -- *	revalidation.
  -- *	@file contains the file structure being accessed.
  -- *	@mask contains the requested permissions.
  -- *	Return 0 if permission is granted.
  -- * @file_alloc_security:
  -- *	Allocate and attach a security structure to the file->f_security field.
  -- *	The security field is initialized to NULL when the structure is first
  -- *	created.
  -- *	@file contains the file structure to secure.
  -- *	Return 0 if the hook is successful and permission is granted.
  -- * @file_free_security:
  -- *	Deallocate and free any security structures stored in file->f_security.
  -- *	@file contains the file structure being modified.
  -- * @file_ioctl:
  -- *	@file contains the file structure.
  -- *	@cmd contains the operation to perform.
  -- *	@arg contains the operational arguments.
  -- *	Check permission for an ioctl operation on @file.  Note that @arg
  -- *	sometimes represents a user space pointer; in other cases, it may be a
  -- *	simple integer value.  When @arg represents a user space pointer, it
  -- *	should never be used by the security module.
  -- *	Return 0 if permission is granted.
  -- * @mmap_addr :
  -- *	Check permissions for a mmap operation at @addr.
  -- *	@addr contains virtual address that will be used for the operation.
  -- *	Return 0 if permission is granted.
  -- * @mmap_file :
  -- *	Check permissions for a mmap operation.  The @file may be NULL, e.g.
  -- *	if mapping anonymous memory.
  -- *	@file contains the file structure for file to map (may be NULL).
  -- *	@reqprot contains the protection requested by the application.
  -- *	@prot contains the protection that will be applied by the kernel.
  -- *	@flags contains the operational flags.
  -- *	Return 0 if permission is granted.
  -- * @file_mprotect:
  -- *	Check permissions before changing memory access permissions.
  -- *	@vma contains the memory region to modify.
  -- *	@reqprot contains the protection requested by the application.
  -- *	@prot contains the protection that will be applied by the kernel.
  -- *	Return 0 if permission is granted.
  -- * @file_lock:
  -- *	Check permission before performing file locking operations.
  -- *	Note: this hook mediates both flock and fcntl style locks.
  -- *	@file contains the file structure.
  -- *	@cmd contains the posix-translated lock operation to perform
  -- *	(e.g. F_RDLCK, F_WRLCK).
  -- *	Return 0 if permission is granted.
  -- * @file_fcntl:
  -- *	Check permission before allowing the file operation specified by @cmd
  -- *	from being performed on the file @file.  Note that @arg sometimes
  -- *	represents a user space pointer; in other cases, it may be a simple
  -- *	integer value.  When @arg represents a user space pointer, it should
  -- *	never be used by the security module.
  -- *	@file contains the file structure.
  -- *	@cmd contains the operation to be performed.
  -- *	@arg contains the operational arguments.
  -- *	Return 0 if permission is granted.
  -- * @file_set_fowner:
  -- *	Save owner security information (typically from current->security) in
  -- *	file->f_security for later use by the send_sigiotask hook.
  -- *	@file contains the file structure to update.
  -- *	Return 0 on success.
  -- * @file_send_sigiotask:
  -- *	Check permission for the file owner @fown to send SIGIO or SIGURG to the
  -- *	process @tsk.  Note that this hook is sometimes called from interrupt.
  -- *	Note that the fown_struct, @fown, is never outside the context of a
  -- *	struct file, so the file structure (and associated security information)
  -- *	can always be obtained:
  -- *		container_of(fown, struct file, f_owner)
  -- *	@tsk contains the structure of task receiving signal.
  -- *	@fown contains the file owner information.
  -- *	@sig is the signal that will be sent.  When 0, kernel sends SIGIO.
  -- *	Return 0 if permission is granted.
  -- * @file_receive:
  -- *	This hook allows security modules to control the ability of a process
  -- *	to receive an open file descriptor via socket IPC.
  -- *	@file contains the file structure being received.
  -- *	Return 0 if permission is granted.
  -- * @file_open
  -- *	Save open-time permission checking state for later use upon
  -- *	file_permission, and recheck access if anything has changed
  -- *	since inode_permission.
  -- *
  -- * Security hooks for task operations.
  -- *
  -- * @task_create:
  -- *	Check permission before creating a child process.  See the clone(2)
  -- *	manual page for definitions of the @clone_flags.
  -- *	@clone_flags contains the flags indicating what should be shared.
  -- *	Return 0 if permission is granted.
  -- * @task_free:
  -- *	@task task being freed
  -- *	Handle release of task-related resources. (Note that this can be called
  -- *	from interrupt context.)
  -- * @cred_alloc_blank:
  -- *	@cred points to the credentials.
  -- *	@gfp indicates the atomicity of any memory allocations.
  -- *	Only allocate sufficient memory and attach to @cred such that
  -- *	cred_transfer() will not get ENOMEM.
  -- * @cred_free:
  -- *	@cred points to the credentials.
  -- *	Deallocate and clear the cred->security field in a set of credentials.
  -- * @cred_prepare:
  -- *	@new points to the new credentials.
  -- *	@old points to the original credentials.
  -- *	@gfp indicates the atomicity of any memory allocations.
  -- *	Prepare a new set of credentials by copying the data from the old set.
  -- * @cred_transfer:
  -- *	@new points to the new credentials.
  -- *	@old points to the original credentials.
  -- *	Transfer data from original creds to new creds
  -- * @kernel_act_as:
  -- *	Set the credentials for a kernel service to act as (subjective context).
  -- *	@new points to the credentials to be modified.
  -- *	@secid specifies the security ID to be set
  -- *	The current task must be the one that nominated @secid.
  -- *	Return 0 if successful.
  -- * @kernel_create_files_as:
  -- *	Set the file creation context in a set of credentials to be the same as
  -- *	the objective context of the specified inode.
  -- *	@new points to the credentials to be modified.
  -- *	@inode points to the inode to use as a reference.
  -- *	The current task must be the one that nominated @inode.
  -- *	Return 0 if successful.
  -- * @kernel_module_request:
  -- *	Ability to trigger the kernel to automatically upcall to userspace for
  -- *	userspace to load a kernel module with the given name.
  -- *	@kmod_name name of the module requested by the kernel
  -- *	Return 0 if successful.
  -- * @kernel_module_from_file:
  -- *	Load a kernel module from userspace.
  -- *	@file contains the file structure pointing to the file containing
  -- *	the kernel module to load. If the module is being loaded from a blob,
  -- *	this argument will be NULL.
  -- *	Return 0 if permission is granted.
  -- * @task_fix_setuid:
  -- *	Update the module's state after setting one or more of the user
  -- *	identity attributes of the current process.  The @flags parameter
  -- *	indicates which of the set*uid system calls invoked this hook.  If
  -- *	@new is the set of credentials that will be installed.  Modifications
  -- *	should be made to this rather than to @current->cred.
  -- *	@old is the set of credentials that are being replaces
  -- *	@flags contains one of the LSM_SETID_* values.
  -- *	Return 0 on success.
  -- * @task_setpgid:
  -- *	Check permission before setting the process group identifier of the
  -- *	process @p to @pgid.
  -- *	@p contains the task_struct for process being modified.
  -- *	@pgid contains the new pgid.
  -- *	Return 0 if permission is granted.
  -- * @task_getpgid:
  -- *	Check permission before getting the process group identifier of the
  -- *	process @p.
  -- *	@p contains the task_struct for the process.
  -- *	Return 0 if permission is granted.
  -- * @task_getsid:
  -- *	Check permission before getting the session identifier of the process
  -- *	@p.
  -- *	@p contains the task_struct for the process.
  -- *	Return 0 if permission is granted.
  -- * @task_getsecid:
  -- *	Retrieve the security identifier of the process @p.
  -- *	@p contains the task_struct for the process and place is into @secid.
  -- *	In case of failure, @secid will be set to zero.
  -- *
  -- * @task_setnice:
  -- *	Check permission before setting the nice value of @p to @nice.
  -- *	@p contains the task_struct of process.
  -- *	@nice contains the new nice value.
  -- *	Return 0 if permission is granted.
  -- * @task_setioprio
  -- *	Check permission before setting the ioprio value of @p to @ioprio.
  -- *	@p contains the task_struct of process.
  -- *	@ioprio contains the new ioprio value
  -- *	Return 0 if permission is granted.
  -- * @task_getioprio
  -- *	Check permission before getting the ioprio value of @p.
  -- *	@p contains the task_struct of process.
  -- *	Return 0 if permission is granted.
  -- * @task_setrlimit:
  -- *	Check permission before setting the resource limits of the current
  -- *	process for @resource to @new_rlim.  The old resource limit values can
  -- *	be examined by dereferencing (current->signal->rlim + resource).
  -- *	@resource contains the resource whose limit is being set.
  -- *	@new_rlim contains the new limits for @resource.
  -- *	Return 0 if permission is granted.
  -- * @task_setscheduler:
  -- *	Check permission before setting scheduling policy and/or parameters of
  -- *	process @p based on @policy and @lp.
  -- *	@p contains the task_struct for process.
  -- *	@policy contains the scheduling policy.
  -- *	@lp contains the scheduling parameters.
  -- *	Return 0 if permission is granted.
  -- * @task_getscheduler:
  -- *	Check permission before obtaining scheduling information for process
  -- *	@p.
  -- *	@p contains the task_struct for process.
  -- *	Return 0 if permission is granted.
  -- * @task_movememory
  -- *	Check permission before moving memory owned by process @p.
  -- *	@p contains the task_struct for process.
  -- *	Return 0 if permission is granted.
  -- * @task_kill:
  -- *	Check permission before sending signal @sig to @p.  @info can be NULL,
  -- *	the constant 1, or a pointer to a siginfo structure.  If @info is 1 or
  -- *	SI_FROMKERNEL(info) is true, then the signal should be viewed as coming
  -- *	from the kernel and should typically be permitted.
  -- *	SIGIO signals are handled separately by the send_sigiotask hook in
  -- *	file_security_ops.
  -- *	@p contains the task_struct for process.
  -- *	@info contains the signal information.
  -- *	@sig contains the signal value.
  -- *	@secid contains the sid of the process where the signal originated
  -- *	Return 0 if permission is granted.
  -- * @task_wait:
  -- *	Check permission before allowing a process to reap a child process @p
  -- *	and collect its status information.
  -- *	@p contains the task_struct for process.
  -- *	Return 0 if permission is granted.
  -- * @task_prctl:
  -- *	Check permission before performing a process control operation on the
  -- *	current process.
  -- *	@option contains the operation.
  -- *	@arg2 contains a argument.
  -- *	@arg3 contains a argument.
  -- *	@arg4 contains a argument.
  -- *	@arg5 contains a argument.
  -- *	Return -ENOSYS if no-one wanted to handle this op, any other value to
  -- *	cause prctl() to return immediately with that value.
  -- * @task_to_inode:
  -- *	Set the security attributes for an inode based on an associated task's
  -- *	security attributes, e.g. for /proc/pid inodes.
  -- *	@p contains the task_struct for the task.
  -- *	@inode contains the inode structure for the inode.
  -- *
  -- * Security hooks for Netlink messaging.
  -- *
  -- * @netlink_send:
  -- *	Save security information for a netlink message so that permission
  -- *	checking can be performed when the message is processed.  The security
  -- *	information can be saved using the eff_cap field of the
  -- *	netlink_skb_parms structure.  Also may be used to provide fine
  -- *	grained control over message transmission.
  -- *	@sk associated sock of task sending the message.
  -- *	@skb contains the sk_buff structure for the netlink message.
  -- *	Return 0 if the information was successfully saved and message
  -- *	is allowed to be transmitted.
  -- *
  -- * Security hooks for Unix domain networking.
  -- *
  -- * @unix_stream_connect:
  -- *	Check permissions before establishing a Unix domain stream connection
  -- *	between @sock and @other.
  -- *	@sock contains the sock structure.
  -- *	@other contains the peer sock structure.
  -- *	@newsk contains the new sock structure.
  -- *	Return 0 if permission is granted.
  -- * @unix_may_send:
  -- *	Check permissions before connecting or sending datagrams from @sock to
  -- *	@other.
  -- *	@sock contains the socket structure.
  -- *	@other contains the peer socket structure.
  -- *	Return 0 if permission is granted.
  -- *
  -- * The @unix_stream_connect and @unix_may_send hooks were necessary because
  -- * Linux provides an alternative to the conventional file name space for Unix
  -- * domain sockets.  Whereas binding and connecting to sockets in the file name
  -- * space is mediated by the typical file permissions (and caught by the mknod
  -- * and permission hooks in inode_security_ops), binding and connecting to
  -- * sockets in the abstract name space is completely unmediated.  Sufficient
  -- * control of Unix domain sockets in the abstract name space isn't possible
  -- * using only the socket layer hooks, since we need to know the actual target
  -- * socket, which is not looked up until we are inside the af_unix code.
  -- *
  -- * Security hooks for socket operations.
  -- *
  -- * @socket_create:
  -- *	Check permissions prior to creating a new socket.
  -- *	@family contains the requested protocol family.
  -- *	@type contains the requested communications type.
  -- *	@protocol contains the requested protocol.
  -- *	@kern set to 1 if a kernel socket.
  -- *	Return 0 if permission is granted.
  -- * @socket_post_create:
  -- *	This hook allows a module to update or allocate a per-socket security
  -- *	structure. Note that the security field was not added directly to the
  -- *	socket structure, but rather, the socket security information is stored
  -- *	in the associated inode.  Typically, the inode alloc_security hook will
  -- *	allocate and and attach security information to
  -- *	sock->inode->i_security.  This hook may be used to update the
  -- *	sock->inode->i_security field with additional information that wasn't
  -- *	available when the inode was allocated.
  -- *	@sock contains the newly created socket structure.
  -- *	@family contains the requested protocol family.
  -- *	@type contains the requested communications type.
  -- *	@protocol contains the requested protocol.
  -- *	@kern set to 1 if a kernel socket.
  -- * @socket_bind:
  -- *	Check permission before socket protocol layer bind operation is
  -- *	performed and the socket @sock is bound to the address specified in the
  -- *	@address parameter.
  -- *	@sock contains the socket structure.
  -- *	@address contains the address to bind to.
  -- *	@addrlen contains the length of address.
  -- *	Return 0 if permission is granted.
  -- * @socket_connect:
  -- *	Check permission before socket protocol layer connect operation
  -- *	attempts to connect socket @sock to a remote address, @address.
  -- *	@sock contains the socket structure.
  -- *	@address contains the address of remote endpoint.
  -- *	@addrlen contains the length of address.
  -- *	Return 0 if permission is granted.
  -- * @socket_listen:
  -- *	Check permission before socket protocol layer listen operation.
  -- *	@sock contains the socket structure.
  -- *	@backlog contains the maximum length for the pending connection queue.
  -- *	Return 0 if permission is granted.
  -- * @socket_accept:
  -- *	Check permission before accepting a new connection.  Note that the new
  -- *	socket, @newsock, has been created and some information copied to it,
  -- *	but the accept operation has not actually been performed.
  -- *	@sock contains the listening socket structure.
  -- *	@newsock contains the newly created server socket for connection.
  -- *	Return 0 if permission is granted.
  -- * @socket_sendmsg:
  -- *	Check permission before transmitting a message to another socket.
  -- *	@sock contains the socket structure.
  -- *	@msg contains the message to be transmitted.
  -- *	@size contains the size of message.
  -- *	Return 0 if permission is granted.
  -- * @socket_recvmsg:
  -- *	Check permission before receiving a message from a socket.
  -- *	@sock contains the socket structure.
  -- *	@msg contains the message structure.
  -- *	@size contains the size of message structure.
  -- *	@flags contains the operational flags.
  -- *	Return 0 if permission is granted.
  -- * @socket_getsockname:
  -- *	Check permission before the local address (name) of the socket object
  -- *	@sock is retrieved.
  -- *	@sock contains the socket structure.
  -- *	Return 0 if permission is granted.
  -- * @socket_getpeername:
  -- *	Check permission before the remote address (name) of a socket object
  -- *	@sock is retrieved.
  -- *	@sock contains the socket structure.
  -- *	Return 0 if permission is granted.
  -- * @socket_getsockopt:
  -- *	Check permissions before retrieving the options associated with socket
  -- *	@sock.
  -- *	@sock contains the socket structure.
  -- *	@level contains the protocol level to retrieve option from.
  -- *	@optname contains the name of option to retrieve.
  -- *	Return 0 if permission is granted.
  -- * @socket_setsockopt:
  -- *	Check permissions before setting the options associated with socket
  -- *	@sock.
  -- *	@sock contains the socket structure.
  -- *	@level contains the protocol level to set options for.
  -- *	@optname contains the name of the option to set.
  -- *	Return 0 if permission is granted.
  -- * @socket_shutdown:
  -- *	Checks permission before all or part of a connection on the socket
  -- *	@sock is shut down.
  -- *	@sock contains the socket structure.
  -- *	@how contains the flag indicating how future sends and receives are handled.
  -- *	Return 0 if permission is granted.
  -- * @socket_sock_rcv_skb:
  -- *	Check permissions on incoming network packets.  This hook is distinct
  -- *	from Netfilter's IP input hooks since it is the first time that the
  -- *	incoming sk_buff @skb has been associated with a particular socket, @sk.
  -- *	Must not sleep inside this hook because some callers hold spinlocks.
  -- *	@sk contains the sock (not socket) associated with the incoming sk_buff.
  -- *	@skb contains the incoming network data.
  -- * @socket_getpeersec_stream:
  -- *	This hook allows the security module to provide peer socket security
  -- *	state for unix or connected tcp sockets to userspace via getsockopt
  -- *	SO_GETPEERSEC.  For tcp sockets this can be meaningful if the
  -- *	socket is associated with an ipsec SA.
  -- *	@sock is the local socket.
  -- *	@optval userspace memory where the security state is to be copied.
  -- *	@optlen userspace int where the module should copy the actual length
  -- *	of the security state.
  -- *	@len as input is the maximum length to copy to userspace provided
  -- *	by the caller.
  -- *	Return 0 if all is well, otherwise, typical getsockopt return
  -- *	values.
  -- * @socket_getpeersec_dgram:
  -- *	This hook allows the security module to provide peer socket security
  -- *	state for udp sockets on a per-packet basis to userspace via
  -- *	getsockopt SO_GETPEERSEC.  The application must first have indicated
  -- *	the IP_PASSSEC option via getsockopt.  It can then retrieve the
  -- *	security state returned by this hook for a packet via the SCM_SECURITY
  -- *	ancillary message type.
  -- *	@skb is the skbuff for the packet being queried
  -- *	@secdata is a pointer to a buffer in which to copy the security data
  -- *	@seclen is the maximum length for @secdata
  -- *	Return 0 on success, error on failure.
  -- * @sk_alloc_security:
  -- *	Allocate and attach a security structure to the sk->sk_security field,
  -- *	which is used to copy security attributes between local stream sockets.
  -- * @sk_free_security:
  -- *	Deallocate security structure.
  -- * @sk_clone_security:
  -- *	Clone/copy security structure.
  -- * @sk_getsecid:
  -- *	Retrieve the LSM-specific secid for the sock to enable caching of network
  -- *	authorizations.
  -- * @sock_graft:
  -- *	Sets the socket's isec sid to the sock's sid.
  -- * @inet_conn_request:
  -- *	Sets the openreq's sid to socket's sid with MLS portion taken from peer sid.
  -- * @inet_csk_clone:
  -- *	Sets the new child socket's sid to the openreq sid.
  -- * @inet_conn_established:
  -- *	Sets the connection's peersid to the secmark on skb.
  -- * @secmark_relabel_packet:
  -- *	check if the process should be allowed to relabel packets to the given secid
  -- * @security_secmark_refcount_inc
  -- *	tells the LSM to increment the number of secmark labeling rules loaded
  -- * @security_secmark_refcount_dec
  -- *	tells the LSM to decrement the number of secmark labeling rules loaded
  -- * @req_classify_flow:
  -- *	Sets the flow's sid to the openreq sid.
  -- * @tun_dev_alloc_security:
  -- *	This hook allows a module to allocate a security structure for a TUN
  -- *	device.
  -- *	@security pointer to a security structure pointer.
  -- *	Returns a zero on success, negative values on failure.
  -- * @tun_dev_free_security:
  -- *	This hook allows a module to free the security structure for a TUN
  -- *	device.
  -- *	@security pointer to the TUN device's security structure
  -- * @tun_dev_create:
  -- *	Check permissions prior to creating a new TUN device.
  -- * @tun_dev_attach_queue:
  -- *	Check permissions prior to attaching to a TUN device queue.
  -- *	@security pointer to the TUN device's security structure.
  -- * @tun_dev_attach:
  -- *	This hook can be used by the module to update any security state
  -- *	associated with the TUN device's sock structure.
  -- *	@sk contains the existing sock structure.
  -- *	@security pointer to the TUN device's security structure.
  -- * @tun_dev_open:
  -- *	This hook can be used by the module to update any security state
  -- *	associated with the TUN device's security structure.
  -- *	@security pointer to the TUN devices's security structure.
  -- * @skb_owned_by:
  -- *	This hook sets the packet's owning sock.
  -- *	@skb is the packet.
  -- *	@sk the sock which owns the packet.
  -- *
  -- * Security hooks for XFRM operations.
  -- *
  -- * @xfrm_policy_alloc_security:
  -- *	@ctxp is a pointer to the xfrm_sec_ctx being added to Security Policy
  -- *	Database used by the XFRM system.
  -- *	@sec_ctx contains the security context information being provided by
  -- *	the user-level policy update program (e.g., setkey).
  -- *	Allocate a security structure to the xp->security field; the security
  -- *	field is initialized to NULL when the xfrm_policy is allocated.
  -- *	Return 0 if operation was successful (memory to allocate, legal context)
  -- *	@gfp is to specify the context for the allocation
  -- * @xfrm_policy_clone_security:
  -- *	@old_ctx contains an existing xfrm_sec_ctx.
  -- *	@new_ctxp contains a new xfrm_sec_ctx being cloned from old.
  -- *	Allocate a security structure in new_ctxp that contains the
  -- *	information from the old_ctx structure.
  -- *	Return 0 if operation was successful (memory to allocate).
  -- * @xfrm_policy_free_security:
  -- *	@ctx contains the xfrm_sec_ctx
  -- *	Deallocate xp->security.
  -- * @xfrm_policy_delete_security:
  -- *	@ctx contains the xfrm_sec_ctx.
  -- *	Authorize deletion of xp->security.
  -- * @xfrm_state_alloc:
  -- *	@x contains the xfrm_state being added to the Security Association
  -- *	Database by the XFRM system.
  -- *	@sec_ctx contains the security context information being provided by
  -- *	the user-level SA generation program (e.g., setkey or racoon).
  -- *	Allocate a security structure to the x->security field; the security
  -- *	field is initialized to NULL when the xfrm_state is allocated. Set the
  -- *	context to correspond to sec_ctx. Return 0 if operation was successful
  -- *	(memory to allocate, legal context).
  -- * @xfrm_state_alloc_acquire:
  -- *	@x contains the xfrm_state being added to the Security Association
  -- *	Database by the XFRM system.
  -- *	@polsec contains the policy's security context.
  -- *	@secid contains the secid from which to take the mls portion of the
  -- *	context.
  -- *	Allocate a security structure to the x->security field; the security
  -- *	field is initialized to NULL when the xfrm_state is allocated. Set the
  -- *	context to correspond to secid. Return 0 if operation was successful
  -- *	(memory to allocate, legal context).
  -- * @xfrm_state_free_security:
  -- *	@x contains the xfrm_state.
  -- *	Deallocate x->security.
  -- * @xfrm_state_delete_security:
  -- *	@x contains the xfrm_state.
  -- *	Authorize deletion of x->security.
  -- * @xfrm_policy_lookup:
  -- *	@ctx contains the xfrm_sec_ctx for which the access control is being
  -- *	checked.
  -- *	@fl_secid contains the flow security label that is used to authorize
  -- *	access to the policy xp.
  -- *	@dir contains the direction of the flow (input or output).
  -- *	Check permission when a flow selects a xfrm_policy for processing
  -- *	XFRMs on a packet.  The hook is called when selecting either a
  -- *	per-socket policy or a generic xfrm policy.
  -- *	Return 0 if permission is granted, -ESRCH otherwise, or -errno
  -- *	on other errors.
  -- * @xfrm_state_pol_flow_match:
  -- *	@x contains the state to match.
  -- *	@xp contains the policy to check for a match.
  -- *	@fl contains the flow to check for a match.
  -- *	Return 1 if there is a match.
  -- * @xfrm_decode_session:
  -- *	@skb points to skb to decode.
  -- *	@secid points to the flow key secid to set.
  -- *	@ckall says if all xfrms used should be checked for same secid.
  -- *	Return 0 if ckall is zero or all xfrms used have the same secid.
  -- *
  -- * Security hooks affecting all Key Management operations
  -- *
  -- * @key_alloc:
  -- *	Permit allocation of a key and assign security data. Note that key does
  -- *	not have a serial number assigned at this point.
  -- *	@key points to the key.
  -- *	@flags is the allocation flags
  -- *	Return 0 if permission is granted, -ve error otherwise.
  -- * @key_free:
  -- *	Notification of destruction; free security data.
  -- *	@key points to the key.
  -- *	No return value.
  -- * @key_permission:
  -- *	See whether a specific operational right is granted to a process on a
  -- *	key.
  -- *	@key_ref refers to the key (key pointer + possession attribute bit).
  -- *	@cred points to the credentials to provide the context against which to
  -- *	evaluate the security data on the key.
  -- *	@perm describes the combination of permissions required of this key.
  -- *	Return 0 if permission is granted, -ve error otherwise.
  -- * @key_getsecurity:
  -- *	Get a textual representation of the security context attached to a key
  -- *	for the purposes of honouring KEYCTL_GETSECURITY.  This function
  -- *	allocates the storage for the NUL-terminated string and the caller
  -- *	should free it.
  -- *	@key points to the key to be queried.
  -- *	@_buffer points to a pointer that should be set to point to the
  -- *	resulting string (if no label or an error occurs).
  -- *	Return the length of the string (including terminating NUL) or -ve if
  -- *	an error.
  -- *	May also return 0 (and a NULL buffer pointer) if there is no label.
  -- *
  -- * Security hooks affecting all System V IPC operations.
  -- *
  -- * @ipc_permission:
  -- *	Check permissions for access to IPC
  -- *	@ipcp contains the kernel IPC permission structure
  -- *	@flag contains the desired (requested) permission set
  -- *	Return 0 if permission is granted.
  -- * @ipc_getsecid:
  -- *	Get the secid associated with the ipc object.
  -- *	@ipcp contains the kernel IPC permission structure.
  -- *	@secid contains a pointer to the location where result will be saved.
  -- *	In case of failure, @secid will be set to zero.
  -- *
  -- * Security hooks for individual messages held in System V IPC message queues
  -- * @msg_msg_alloc_security:
  -- *	Allocate and attach a security structure to the msg->security field.
  -- *	The security field is initialized to NULL when the structure is first
  -- *	created.
  -- *	@msg contains the message structure to be modified.
  -- *	Return 0 if operation was successful and permission is granted.
  -- * @msg_msg_free_security:
  -- *	Deallocate the security structure for this message.
  -- *	@msg contains the message structure to be modified.
  -- *
  -- * Security hooks for System V IPC Message Queues
  -- *
  -- * @msg_queue_alloc_security:
  -- *	Allocate and attach a security structure to the
  -- *	msq->q_perm.security field. The security field is initialized to
  -- *	NULL when the structure is first created.
  -- *	@msq contains the message queue structure to be modified.
  -- *	Return 0 if operation was successful and permission is granted.
  -- * @msg_queue_free_security:
  -- *	Deallocate security structure for this message queue.
  -- *	@msq contains the message queue structure to be modified.
  -- * @msg_queue_associate:
  -- *	Check permission when a message queue is requested through the
  -- *	msgget system call.  This hook is only called when returning the
  -- *	message queue identifier for an existing message queue, not when a
  -- *	new message queue is created.
  -- *	@msq contains the message queue to act upon.
  -- *	@msqflg contains the operation control flags.
  -- *	Return 0 if permission is granted.
  -- * @msg_queue_msgctl:
  -- *	Check permission when a message control operation specified by @cmd
  -- *	is to be performed on the message queue @msq.
  -- *	The @msq may be NULL, e.g. for IPC_INFO or MSG_INFO.
  -- *	@msq contains the message queue to act upon.  May be NULL.
  -- *	@cmd contains the operation to be performed.
  -- *	Return 0 if permission is granted.
  -- * @msg_queue_msgsnd:
  -- *	Check permission before a message, @msg, is enqueued on the message
  -- *	queue, @msq.
  -- *	@msq contains the message queue to send message to.
  -- *	@msg contains the message to be enqueued.
  -- *	@msqflg contains operational flags.
  -- *	Return 0 if permission is granted.
  -- * @msg_queue_msgrcv:
  -- *	Check permission before a message, @msg, is removed from the message
  -- *	queue, @msq.  The @target task structure contains a pointer to the
  -- *	process that will be receiving the message (not equal to the current
  -- *	process when inline receives are being performed).
  -- *	@msq contains the message queue to retrieve message from.
  -- *	@msg contains the message destination.
  -- *	@target contains the task structure for recipient process.
  -- *	@type contains the type of message requested.
  -- *	@mode contains the operational flags.
  -- *	Return 0 if permission is granted.
  -- *
  -- * Security hooks for System V Shared Memory Segments
  -- *
  -- * @shm_alloc_security:
  -- *	Allocate and attach a security structure to the shp->shm_perm.security
  -- *	field.  The security field is initialized to NULL when the structure is
  -- *	first created.
  -- *	@shp contains the shared memory structure to be modified.
  -- *	Return 0 if operation was successful and permission is granted.
  -- * @shm_free_security:
  -- *	Deallocate the security struct for this memory segment.
  -- *	@shp contains the shared memory structure to be modified.
  -- * @shm_associate:
  -- *	Check permission when a shared memory region is requested through the
  -- *	shmget system call.  This hook is only called when returning the shared
  -- *	memory region identifier for an existing region, not when a new shared
  -- *	memory region is created.
  -- *	@shp contains the shared memory structure to be modified.
  -- *	@shmflg contains the operation control flags.
  -- *	Return 0 if permission is granted.
  -- * @shm_shmctl:
  -- *	Check permission when a shared memory control operation specified by
  -- *	@cmd is to be performed on the shared memory region @shp.
  -- *	The @shp may be NULL, e.g. for IPC_INFO or SHM_INFO.
  -- *	@shp contains shared memory structure to be modified.
  -- *	@cmd contains the operation to be performed.
  -- *	Return 0 if permission is granted.
  -- * @shm_shmat:
  -- *	Check permissions prior to allowing the shmat system call to attach the
  -- *	shared memory segment @shp to the data segment of the calling process.
  -- *	The attaching address is specified by @shmaddr.
  -- *	@shp contains the shared memory structure to be modified.
  -- *	@shmaddr contains the address to attach memory region to.
  -- *	@shmflg contains the operational flags.
  -- *	Return 0 if permission is granted.
  -- *
  -- * Security hooks for System V Semaphores
  -- *
  -- * @sem_alloc_security:
  -- *	Allocate and attach a security structure to the sma->sem_perm.security
  -- *	field.  The security field is initialized to NULL when the structure is
  -- *	first created.
  -- *	@sma contains the semaphore structure
  -- *	Return 0 if operation was successful and permission is granted.
  -- * @sem_free_security:
  -- *	deallocate security struct for this semaphore
  -- *	@sma contains the semaphore structure.
  -- * @sem_associate:
  -- *	Check permission when a semaphore is requested through the semget
  -- *	system call.  This hook is only called when returning the semaphore
  -- *	identifier for an existing semaphore, not when a new one must be
  -- *	created.
  -- *	@sma contains the semaphore structure.
  -- *	@semflg contains the operation control flags.
  -- *	Return 0 if permission is granted.
  -- * @sem_semctl:
  -- *	Check permission when a semaphore operation specified by @cmd is to be
  -- *	performed on the semaphore @sma.  The @sma may be NULL, e.g. for
  -- *	IPC_INFO or SEM_INFO.
  -- *	@sma contains the semaphore structure.  May be NULL.
  -- *	@cmd contains the operation to be performed.
  -- *	Return 0 if permission is granted.
  -- * @sem_semop
  -- *	Check permissions before performing operations on members of the
  -- *	semaphore set @sma.  If the @alter flag is nonzero, the semaphore set
  -- *	may be modified.
  -- *	@sma contains the semaphore structure.
  -- *	@sops contains the operations to perform.
  -- *	@nsops contains the number of operations to perform.
  -- *	@alter contains the flag indicating whether changes are to be made.
  -- *	Return 0 if permission is granted.
  -- *
  -- * @ptrace_access_check:
  -- *	Check permission before allowing the current process to trace the
  -- *	@child process.
  -- *	Security modules may also want to perform a process tracing check
  -- *	during an execve in the set_security or apply_creds hooks of
  -- *	tracing check during an execve in the bprm_set_creds hook of
  -- *	binprm_security_ops if the process is being traced and its security
  -- *	attributes would be changed by the execve.
  -- *	@child contains the task_struct structure for the target process.
  -- *	@mode contains the PTRACE_MODE flags indicating the form of access.
  -- *	Return 0 if permission is granted.
  -- * @ptrace_traceme:
  -- *	Check that the @parent process has sufficient permission to trace the
  -- *	current process before allowing the current process to present itself
  -- *	to the @parent process for tracing.
  -- *	@parent contains the task_struct structure for debugger process.
  -- *	Return 0 if permission is granted.
  -- * @capget:
  -- *	Get the @effective, @inheritable, and @permitted capability sets for
  -- *	the @target process.  The hook may also perform permission checking to
  -- *	determine if the current process is allowed to see the capability sets
  -- *	of the @target process.
  -- *	@target contains the task_struct structure for target process.
  -- *	@effective contains the effective capability set.
  -- *	@inheritable contains the inheritable capability set.
  -- *	@permitted contains the permitted capability set.
  -- *	Return 0 if the capability sets were successfully obtained.
  -- * @capset:
  -- *	Set the @effective, @inheritable, and @permitted capability sets for
  -- *	the current process.
  -- *	@new contains the new credentials structure for target process.
  -- *	@old contains the current credentials structure for target process.
  -- *	@effective contains the effective capability set.
  -- *	@inheritable contains the inheritable capability set.
  -- *	@permitted contains the permitted capability set.
  -- *	Return 0 and update @new if permission is granted.
  -- * @capable:
  -- *	Check whether the @tsk process has the @cap capability in the indicated
  -- *	credentials.
  -- *	@cred contains the credentials to use.
  -- *	@ns contains the user namespace we want the capability in
  -- *	@cap contains the capability <include/linux/capability.h>.
  -- *	@audit: Whether to write an audit message or not
  -- *	Return 0 if the capability is granted for @tsk.
  -- * @syslog:
  -- *	Check permission before accessing the kernel message ring or changing
  -- *	logging to the console.
  -- *	See the syslog(2) manual page for an explanation of the @type values.
  -- *	@type contains the type of action.
  -- *	@from_file indicates the context of action (if it came from /proc).
  -- *	Return 0 if permission is granted.
  -- * @settime:
  -- *	Check permission to change the system time.
  -- *	struct timespec and timezone are defined in include/linux/time.h
  -- *	@ts contains new time
  -- *	@tz contains new timezone
  -- *	Return 0 if permission is granted.
  -- * @vm_enough_memory:
  -- *	Check permissions for allocating a new virtual mapping.
  -- *	@mm contains the mm struct it is being added to.
  -- *	@pages contains the number of pages.
  -- *	Return 0 if permission is granted.
  -- *
  -- * @ismaclabel:
  -- *	Check if the extended attribute specified by @name
  -- *	represents a MAC label. Returns 1 if name is a MAC
  -- *	attribute otherwise returns 0.
  -- *	@name full extended attribute name to check against
  -- *	LSM as a MAC label.
  -- *
  -- * @secid_to_secctx:
  -- *	Convert secid to security context.  If secdata is NULL the length of
  -- *	the result will be returned in seclen, but no secdata will be returned.
  -- *	This does mean that the length could change between calls to check the
  -- *	length and the next call which actually allocates and returns the secdata.
  -- *	@secid contains the security ID.
  -- *	@secdata contains the pointer that stores the converted security context.
  -- *	@seclen pointer which contains the length of the data
  -- * @secctx_to_secid:
  -- *	Convert security context to secid.
  -- *	@secid contains the pointer to the generated security ID.
  -- *	@secdata contains the security context.
  -- *
  -- * @release_secctx:
  -- *	Release the security context.
  -- *	@secdata contains the security context.
  -- *	@seclen contains the length of the security context.
  -- *
  -- * Security hooks for Audit
  -- *
  -- * @audit_rule_init:
  -- *	Allocate and initialize an LSM audit rule structure.
  -- *	@field contains the required Audit action. Fields flags are defined in include/linux/audit.h
  -- *	@op contains the operator the rule uses.
  -- *	@rulestr contains the context where the rule will be applied to.
  -- *	@lsmrule contains a pointer to receive the result.
  -- *	Return 0 if @lsmrule has been successfully set,
  -- *	-EINVAL in case of an invalid rule.
  -- *
  -- * @audit_rule_known:
  -- *	Specifies whether given @rule contains any fields related to current LSM.
  -- *	@rule contains the audit rule of interest.
  -- *	Return 1 in case of relation found, 0 otherwise.
  -- *
  -- * @audit_rule_match:
  -- *	Determine if given @secid matches a rule previously approved
  -- *	by @audit_rule_known.
  -- *	@secid contains the security id in question.
  -- *	@field contains the field which relates to current LSM.
  -- *	@op contains the operator that will be used for matching.
  -- *	@rule points to the audit rule that will be checked against.
  -- *	@actx points to the audit context associated with the check.
  -- *	Return 1 if secid matches the rule, 0 if it does not, -ERRNO on failure.
  -- *
  -- * @audit_rule_free:
  -- *	Deallocate the LSM audit rule structure previously allocated by
  -- *	audit_rule_init.
  -- *	@rule contains the allocated rule
  -- *
  -- * @inode_notifysecctx:
  -- *	Notify the security module of what the security context of an inode
  -- *	should be.  Initializes the incore security context managed by the
  -- *	security module for this inode.  Example usage:  NFS client invokes
  -- *	this hook to initialize the security context in its incore inode to the
  -- *	value provided by the server for the file when the server returned the
  -- *	file's attributes to the client.
  -- *
  -- * 	Must be called with inode->i_mutex locked.
  -- *
  -- * 	@inode we wish to set the security context of.
  -- * 	@ctx contains the string which we wish to set in the inode.
  -- * 	@ctxlen contains the length of @ctx.
  -- *
  -- * @inode_setsecctx:
  -- * 	Change the security context of an inode.  Updates the
  -- * 	incore security context managed by the security module and invokes the
  -- * 	fs code as needed (via __vfs_setxattr_noperm) to update any backing
  -- * 	xattrs that represent the context.  Example usage:  NFS server invokes
  -- * 	this hook to change the security context in its incore inode and on the
  -- * 	backing filesystem to a value provided by the client on a SETATTR
  -- * 	operation.
  -- *
  -- * 	Must be called with inode->i_mutex locked.
  -- *
  -- * 	@dentry contains the inode we wish to set the security context of.
  -- * 	@ctx contains the string which we wish to set in the inode.
  -- * 	@ctxlen contains the length of @ctx.
  -- *
  -- * @inode_getsecctx:
  -- *	On success, returns 0 and fills out @ctx and @ctxlen with the security
  -- *	context for the given @inode.
  -- *
  -- * 	@inode we wish to get the security context of.
  -- *	@ctx is a pointer in which to place the allocated security context.
  -- *	@ctxlen points to the place to put the length of @ctx.
  -- * This is the main security structure.
  --  

   subtype security_operations_name_array is Interfaces.C.char_array (0 .. 10);
   type security_operations is record
      name : aliased security_operations_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1433
      ptrace_access_check : access function (arg1 : access linux_sched_h.task_struct; arg2 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1435
      ptrace_traceme : access function (arg1 : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1436
      capget : access function
           (arg1 : access linux_sched_h.task_struct;
            arg2 : access linux_capability_h.kernel_cap_t;
            arg3 : access linux_capability_h.kernel_cap_t;
            arg4 : access linux_capability_h.kernel_cap_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1439
      capset : access function (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1444
      capable : access function
           (arg1 : access constant linux_cred_h.cred;
            arg2 : System.Address;
            arg3 : int;
            arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1446
      quotactl : access function
           (arg1 : int;
            arg2 : int;
            arg3 : int;
            arg4 : access linux_fs_h.super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1447
      quota_on : access function (arg1 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1448
      syslog : access function (arg1 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1449
      settime : access function (arg1 : access constant uapi_linux_time_h.timespec; arg2 : access constant uapi_linux_time_h.timezone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1450
      vm_enough_memory : access function (arg1 : access linux_mm_types_h.mm_struct; arg2 : long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1451
      bprm_set_creds : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1453
      bprm_check_security : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1454
      bprm_secureexec : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1455
      bprm_committing_creds : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1456
      bprm_committed_creds : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1457
      sb_alloc_security : access function (arg1 : access linux_fs_h.super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1459
      sb_free_security : access procedure (arg1 : access linux_fs_h.super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1460
      sb_copy_data : access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1461
      sb_remount : access function (arg1 : access linux_fs_h.super_block; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1462
      sb_kern_mount : access function
           (arg1 : access linux_fs_h.super_block;
            arg2 : int;
            arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1463
      sb_show_options : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : access linux_fs_h.super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1464
      sb_statfs : access function (arg1 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1465
      sb_mount : access function
           (arg1 : Interfaces.C.Strings.chars_ptr;
            arg2 : access linux_path_h.path;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : unsigned_long;
            arg5 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1467
      sb_umount : access function (arg1 : System.Address; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1468
      sb_pivotroot : access function (arg1 : access linux_path_h.path; arg2 : access linux_path_h.path) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1470
      sb_set_mnt_opts : access function
           (arg1 : access linux_fs_h.super_block;
            arg2 : access security_mnt_opts;
            arg3 : unsigned_long;
            arg4 : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1474
      sb_clone_mnt_opts : access function (arg1 : access constant linux_fs_h.super_block; arg2 : access linux_fs_h.super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1476
      sb_parse_opts_str : access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access security_mnt_opts) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1477
      dentry_init_security : access function
           (arg1 : access linux_dcache_h.dentry;
            arg2 : int;
            arg3 : access linux_dcache_h.qstr;
            arg4 : System.Address;
            arg5 : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1480
      path_unlink : access function (arg1 : access linux_path_h.path; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1484
      path_mkdir : access function
           (arg1 : access linux_path_h.path;
            arg2 : access linux_dcache_h.dentry;
            arg3 : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1485
      path_rmdir : access function (arg1 : access linux_path_h.path; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1486
      path_mknod : access function
           (arg1 : access linux_path_h.path;
            arg2 : access linux_dcache_h.dentry;
            arg3 : linux_types_h.umode_t;
            arg4 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1488
      path_truncate : access function (arg1 : access linux_path_h.path) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1489
      path_symlink : access function
           (arg1 : access linux_path_h.path;
            arg2 : access linux_dcache_h.dentry;
            arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1491
      path_link : access function
           (arg1 : access linux_dcache_h.dentry;
            arg2 : access linux_path_h.path;
            arg3 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1493
      path_rename : access function
           (arg1 : access linux_path_h.path;
            arg2 : access linux_dcache_h.dentry;
            arg3 : access linux_path_h.path;
            arg4 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1495
      path_chmod : access function (arg1 : access linux_path_h.path; arg2 : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1496
      path_chown : access function
           (arg1 : access linux_path_h.path;
            arg2 : linux_uidgid_h.kuid_t;
            arg3 : linux_uidgid_h.kgid_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1497
      path_chroot : access function (arg1 : access linux_path_h.path) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1498
      inode_alloc_security : access function (arg1 : access linux_fs_h.inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1501
      inode_free_security : access procedure (arg1 : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1502
      inode_init_security : access function
           (arg1 : access linux_fs_h.inode;
            arg2 : access linux_fs_h.inode;
            arg3 : access constant linux_dcache_h.qstr;
            arg4 : System.Address;
            arg5 : System.Address;
            arg6 : access linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1505
      inode_create : access function
           (arg1 : access linux_fs_h.inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1507
      inode_link : access function
           (arg1 : access linux_dcache_h.dentry;
            arg2 : access linux_fs_h.inode;
            arg3 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1509
      inode_unlink : access function (arg1 : access linux_fs_h.inode; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1510
      inode_symlink : access function
           (arg1 : access linux_fs_h.inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1512
      inode_mkdir : access function
           (arg1 : access linux_fs_h.inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1513
      inode_rmdir : access function (arg1 : access linux_fs_h.inode; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1514
      inode_mknod : access function
           (arg1 : access linux_fs_h.inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : linux_types_h.umode_t;
            arg4 : linux_types_h.dev_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1516
      inode_rename : access function
           (arg1 : access linux_fs_h.inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : access linux_fs_h.inode;
            arg4 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1518
      inode_readlink : access function (arg1 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1519
      inode_follow_link : access function (arg1 : access linux_dcache_h.dentry; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1520
      inode_permission : access function (arg1 : access linux_fs_h.inode; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1521
      inode_setattr : access function (arg1 : access linux_dcache_h.dentry; arg2 : access linux_fs_h.iattr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1522
      inode_getattr : access function (arg1 : System.Address; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1523
      inode_setxattr : access function
           (arg1 : access linux_dcache_h.dentry;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : System.Address;
            arg4 : linux_types_h.size_t;
            arg5 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1525
      inode_post_setxattr : access procedure
           (arg1 : access linux_dcache_h.dentry;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : System.Address;
            arg4 : linux_types_h.size_t;
            arg5 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1527
      inode_getxattr : access function (arg1 : access linux_dcache_h.dentry; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1528
      inode_listxattr : access function (arg1 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1529
      inode_removexattr : access function (arg1 : access linux_dcache_h.dentry; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1530
      inode_need_killpriv : access function (arg1 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1531
      inode_killpriv : access function (arg1 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1532
      inode_getsecurity : access function
           (arg1 : access constant linux_fs_h.inode;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : System.Address;
            arg4 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1533
      inode_setsecurity : access function
           (arg1 : access linux_fs_h.inode;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : System.Address;
            arg4 : linux_types_h.size_t;
            arg5 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1534
      inode_listsecurity : access function
           (arg1 : access linux_fs_h.inode;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1535
      inode_getsecid : access procedure (arg1 : access constant linux_fs_h.inode; arg2 : access asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1536
      file_permission : access function (arg1 : access linux_fs_h.file; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1538
      file_alloc_security : access function (arg1 : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1539
      file_free_security : access procedure (arg1 : access linux_fs_h.file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1540
      file_ioctl : access function
           (arg1 : access linux_fs_h.file;
            arg2 : unsigned;
            arg3 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1542
      mmap_addr : access function (arg1 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1543
      mmap_file : access function
           (arg1 : access linux_fs_h.file;
            arg2 : unsigned_long;
            arg3 : unsigned_long;
            arg4 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1546
      file_mprotect : access function
           (arg1 : access linux_mm_types_h.vm_area_struct;
            arg2 : unsigned_long;
            arg3 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1549
      file_lock : access function (arg1 : access linux_fs_h.file; arg2 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1550
      file_fcntl : access function
           (arg1 : access linux_fs_h.file;
            arg2 : unsigned;
            arg3 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1552
      file_set_fowner : access function (arg1 : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1553
      file_send_sigiotask : access function
           (arg1 : access linux_sched_h.task_struct;
            arg2 : access linux_fs_h.fown_struct;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1555
      file_receive : access function (arg1 : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1556
      file_open : access function (arg1 : access linux_fs_h.file; arg2 : access constant linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1557
      task_create : access function (arg1 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1559
      task_free : access procedure (arg1 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1560
      cred_alloc_blank : access function (arg1 : access linux_cred_h.cred; arg2 : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1561
      cred_free : access procedure (arg1 : access linux_cred_h.cred);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1562
      cred_prepare : access function (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1564
      cred_transfer : access procedure (arg1 : access linux_cred_h.cred);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1565
      kernel_act_as : access function (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1566
      kernel_create_files_as : access function (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1567
      kernel_module_request : access function (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1568
      kernel_module_from_file : access function (arg1 : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1569
      task_fix_setuid : access function (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1571
      task_setpgid : access function (arg1 : access linux_sched_h.task_struct; arg2 : linux_types_h.pid_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1572
      task_getpgid : access function (arg1 : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1573
      task_getsid : access function (arg1 : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1574
      task_getsecid : access procedure (arg1 : access linux_sched_h.task_struct; arg2 : access asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1575
      task_setnice : access function (arg1 : access linux_sched_h.task_struct; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1576
      task_setioprio : access function (arg1 : access linux_sched_h.task_struct; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1577
      task_getioprio : access function (arg1 : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1578
      task_setrlimit : access function
           (arg1 : access linux_sched_h.task_struct;
            arg2 : unsigned;
            arg3 : access uapi_linux_resource_h.rlimit) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1580
      task_setscheduler : access function (arg1 : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1581
      task_getscheduler : access function (arg1 : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1582
      task_movememory : access function (arg1 : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1583
      task_kill : access function
           (arg1 : access linux_sched_h.task_struct;
            arg2 : access uapi_asm_generic_siginfo_h.siginfo;
            arg3 : int;
            arg4 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1585
      task_wait : access function (arg1 : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1586
      task_prctl : access function
           (arg1 : int;
            arg2 : unsigned_long;
            arg3 : unsigned_long;
            arg4 : unsigned_long;
            arg5 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1589
      task_to_inode : access procedure (arg1 : access linux_sched_h.task_struct; arg2 : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1590
      ipc_permission : access function (arg1 : access linux_ipc_h.kern_ipc_perm; arg2 : short) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1592
      ipc_getsecid : access procedure (arg1 : access linux_ipc_h.kern_ipc_perm; arg2 : access asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1593
      msg_msg_alloc_security : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1595
      msg_msg_free_security : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1596
      msg_queue_alloc_security : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1598
      msg_queue_free_security : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1599
      msg_queue_associate : access function (arg1 : System.Address; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1600
      msg_queue_msgctl : access function (arg1 : System.Address; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1601
      msg_queue_msgsnd : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1603
      msg_queue_msgrcv : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : access linux_sched_h.task_struct;
            arg4 : long;
            arg5 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1607
      shm_alloc_security : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1609
      shm_free_security : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1610
      shm_associate : access function (arg1 : System.Address; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1611
      shm_shmctl : access function (arg1 : System.Address; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1612
      shm_shmat : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1614
      sem_alloc_security : access function (arg1 : access linux_sem_h.sem_array) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1616
      sem_free_security : access procedure (arg1 : access linux_sem_h.sem_array);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1617
      sem_associate : access function (arg1 : access linux_sem_h.sem_array; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1618
      sem_semctl : access function (arg1 : access linux_sem_h.sem_array; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1619
      sem_semop : access function
           (arg1 : access linux_sem_h.sem_array;
            arg2 : access uapi_linux_sem_h.sembuf;
            arg3 : unsigned;
            arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1621
      netlink_send : access function (arg1 : System.Address; arg2 : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1623
      d_instantiate : access procedure (arg1 : access linux_dcache_h.dentry; arg2 : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1625
      getprocattr : access function
           (arg1 : access linux_sched_h.task_struct;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1627
      setprocattr : access function
           (arg1 : access linux_sched_h.task_struct;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : System.Address;
            arg4 : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1628
      ismaclabel : access function (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1629
      secid_to_secctx : access function
           (arg1 : asm_generic_int_ll64_h.u32;
            arg2 : System.Address;
            arg3 : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1630
      secctx_to_secid : access function
           (arg1 : Interfaces.C.Strings.chars_ptr;
            arg2 : asm_generic_int_ll64_h.u32;
            arg3 : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1631
      release_secctx : access procedure (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1632
      inode_notifysecctx : access function
           (arg1 : access linux_fs_h.inode;
            arg2 : System.Address;
            arg3 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1634
      inode_setsecctx : access function
           (arg1 : access linux_dcache_h.dentry;
            arg2 : System.Address;
            arg3 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1635
      inode_getsecctx : access function
           (arg1 : access linux_fs_h.inode;
            arg2 : System.Address;
            arg3 : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1636
      unix_stream_connect : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1639
      unix_may_send : access function (arg1 : access linux_net_h.socket; arg2 : access linux_net_h.socket) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1640
      socket_create : access function
           (arg1 : int;
            arg2 : int;
            arg3 : int;
            arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1642
      socket_post_create : access function
           (arg1 : access linux_net_h.socket;
            arg2 : int;
            arg3 : int;
            arg4 : int;
            arg5 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1644
      socket_bind : access function
           (arg1 : access linux_net_h.socket;
            arg2 : access linux_socket_h.sockaddr;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1646
      socket_connect : access function
           (arg1 : access linux_net_h.socket;
            arg2 : access linux_socket_h.sockaddr;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1648
      socket_listen : access function (arg1 : access linux_net_h.socket; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1649
      socket_accept : access function (arg1 : access linux_net_h.socket; arg2 : access linux_net_h.socket) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1650
      socket_sendmsg : access function
           (arg1 : access linux_net_h.socket;
            arg2 : access linux_socket_h.msghdr;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1652
      socket_recvmsg : access function
           (arg1 : access linux_net_h.socket;
            arg2 : access linux_socket_h.msghdr;
            arg3 : int;
            arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1654
      socket_getsockname : access function (arg1 : access linux_net_h.socket) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1655
      socket_getpeername : access function (arg1 : access linux_net_h.socket) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1656
      socket_getsockopt : access function
           (arg1 : access linux_net_h.socket;
            arg2 : int;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1657
      socket_setsockopt : access function
           (arg1 : access linux_net_h.socket;
            arg2 : int;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1658
      socket_shutdown : access function (arg1 : access linux_net_h.socket; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1659
      socket_sock_rcv_skb : access function (arg1 : System.Address; arg2 : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1660
      socket_getpeersec_stream : access function
           (arg1 : access linux_net_h.socket;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : access int;
            arg4 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1661
      socket_getpeersec_dgram : access function
           (arg1 : access linux_net_h.socket;
            arg2 : access linux_skbuff_h.sk_buff;
            arg3 : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1662
      sk_alloc_security : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1663
      sk_free_security : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1664
      sk_clone_security : access procedure (arg1 : System.Address; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1665
      sk_getsecid : access procedure (arg1 : System.Address; arg2 : access asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1666
      sock_graft : access procedure (arg1 : System.Address; arg2 : access linux_net_h.socket);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1667
      inet_conn_request : access function
           (arg1 : System.Address;
            arg2 : access linux_skbuff_h.sk_buff;
            arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1669
      inet_csk_clone : access procedure (arg1 : System.Address; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1670
      inet_conn_established : access procedure (arg1 : System.Address; arg2 : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1671
      secmark_relabel_packet : access function (arg1 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1672
      secmark_refcount_inc : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1673
      secmark_refcount_dec : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1674
      req_classify_flow : access procedure (arg1 : System.Address; arg2 : access net_flow_h.flowi);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1675
      tun_dev_alloc_security : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1676
      tun_dev_free_security : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1677
      tun_dev_create : access function return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1678
      tun_dev_attach_queue : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1679
      tun_dev_attach : access function (arg1 : System.Address; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1680
      tun_dev_open : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1681
      skb_owned_by : access procedure (arg1 : access linux_skbuff_h.sk_buff; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1682
      xfrm_policy_alloc_security : access function
           (arg1 : System.Address;
            arg2 : access uapi_linux_xfrm_h.xfrm_user_sec_ctx;
            arg3 : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1687
      xfrm_policy_clone_security : access function (arg1 : access uapi_linux_xfrm_h.xfrm_sec_ctx; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1688
      xfrm_policy_free_security : access procedure (arg1 : access uapi_linux_xfrm_h.xfrm_sec_ctx);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1689
      xfrm_policy_delete_security : access function (arg1 : access uapi_linux_xfrm_h.xfrm_sec_ctx) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1690
      xfrm_state_alloc : access function (arg1 : System.Address; arg2 : access uapi_linux_xfrm_h.xfrm_user_sec_ctx) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1692
      xfrm_state_alloc_acquire : access function
           (arg1 : System.Address;
            arg2 : access uapi_linux_xfrm_h.xfrm_sec_ctx;
            arg3 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1695
      xfrm_state_free_security : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1696
      xfrm_state_delete_security : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1697
      xfrm_policy_lookup : access function
           (arg1 : access uapi_linux_xfrm_h.xfrm_sec_ctx;
            arg2 : asm_generic_int_ll64_h.u32;
            arg3 : asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1698
      xfrm_state_pol_flow_match : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : access constant net_flow_h.flowi) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1701
      xfrm_decode_session : access function
           (arg1 : access linux_skbuff_h.sk_buff;
            arg2 : access asm_generic_int_ll64_h.u32;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1702
      key_alloc : access function
           (arg1 : access linux_key_h.key;
            arg2 : access constant linux_cred_h.cred;
            arg3 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1707
      key_free : access procedure (arg1 : access linux_key_h.key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1708
      key_permission : access function
           (arg1 : linux_key_h.key_ref_t;
            arg2 : access constant linux_cred_h.cred;
            arg3 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1711
      key_getsecurity : access function (arg1 : access linux_key_h.key; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1712
      audit_rule_init : access function
           (arg1 : asm_generic_int_ll64_h.u32;
            arg2 : asm_generic_int_ll64_h.u32;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1716
      audit_rule_known : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1717
      audit_rule_match : access function
           (arg1 : asm_generic_int_ll64_h.u32;
            arg2 : asm_generic_int_ll64_h.u32;
            arg3 : asm_generic_int_ll64_h.u32;
            arg4 : System.Address;
            arg5 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1719
      audit_rule_free : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1720
   end record;
   pragma Convention (C_Pass_By_Copy, security_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1432

  -- key management security hooks  
  -- prototypes  
   function security_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1725
   pragma Import (CPP, security_init, "_Z13security_initv");

   function security_module_enable (ops : access security_operations) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1726
   pragma Import (CPP, security_module_enable, "_Z22security_module_enableP19security_operations");

   function register_security (ops : access security_operations) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1727
   pragma Import (CPP, register_security, "_Z17register_securityP19security_operations");

   procedure security_fixup_ops (ops : access security_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1728
   pragma Import (CPP, security_fixup_ops, "_Z18security_fixup_opsP19security_operations");

  -- Security operations  
   function security_ptrace_access_check (child : access linux_sched_h.task_struct; mode : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1732
   pragma Import (CPP, security_ptrace_access_check, "_Z28security_ptrace_access_checkP11task_structj");

   function security_ptrace_traceme (parent : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1733
   pragma Import (CPP, security_ptrace_traceme, "_Z23security_ptrace_tracemeP11task_struct");

   function security_capget
     (target : access linux_sched_h.task_struct;
      effective : access linux_capability_h.kernel_cap_t;
      inheritable : access linux_capability_h.kernel_cap_t;
      permitted : access linux_capability_h.kernel_cap_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1734
   pragma Import (CPP, security_capget, "_Z15security_capgetP11task_structP17kernel_cap_structS2_S2_");

   function security_capset (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1738
   pragma Import (CPP, security_capset, "_Z15security_capsetP4cred");

   function security_capable
     (the_cred : access constant linux_cred_h.cred;
      ns : System.Address;
      cap : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1742
   pragma Import (CPP, security_capable, "_Z16security_capablePK4credP14user_namespacei");

   function security_capable_noaudit
     (the_cred : access constant linux_cred_h.cred;
      ns : System.Address;
      cap : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1744
   pragma Import (CPP, security_capable_noaudit, "_Z24security_capable_noauditPK4credP14user_namespacei");

   function security_quotactl
     (cmds : int;
      c_type : int;
      id : int;
      sb : access linux_fs_h.super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1746
   pragma Import (CPP, security_quotactl, "_Z17security_quotactliiiP11super_block");

   function security_quota_on (the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1747
   pragma Import (CPP, security_quota_on, "_Z17security_quota_onP6dentry");

   function security_syslog (c_type : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1748
   pragma Import (CPP, security_syslog, "_Z15security_syslogi");

   function security_settime (ts : access constant uapi_linux_time_h.timespec; tz : access constant uapi_linux_time_h.timezone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1749
   pragma Import (CPP, security_settime, "_Z16security_settimePK8timespecPK8timezone");

   function security_vm_enough_memory_mm (mm : access linux_mm_types_h.mm_struct; pages : long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1750
   pragma Import (CPP, security_vm_enough_memory_mm, "_Z28security_vm_enough_memory_mmP9mm_structl");

   function security_bprm_set_creds (bprm : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1751
   pragma Import (CPP, security_bprm_set_creds, "_Z23security_bprm_set_credsP12linux_binprm");

   function security_bprm_check (bprm : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1752
   pragma Import (CPP, security_bprm_check, "_Z19security_bprm_checkP12linux_binprm");

   procedure security_bprm_committing_creds (bprm : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1753
   pragma Import (CPP, security_bprm_committing_creds, "_Z30security_bprm_committing_credsP12linux_binprm");

   procedure security_bprm_committed_creds (bprm : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1754
   pragma Import (CPP, security_bprm_committed_creds, "_Z29security_bprm_committed_credsP12linux_binprm");

   function security_bprm_secureexec (bprm : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1755
   pragma Import (CPP, security_bprm_secureexec, "_Z24security_bprm_secureexecP12linux_binprm");

   function security_sb_alloc (sb : access linux_fs_h.super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1756
   pragma Import (CPP, security_sb_alloc, "_Z17security_sb_allocP11super_block");

   procedure security_sb_free (sb : access linux_fs_h.super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1757
   pragma Import (CPP, security_sb_free, "_Z16security_sb_freeP11super_block");

   function security_sb_copy_data (orig : Interfaces.C.Strings.chars_ptr; copy : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1758
   pragma Import (CPP, security_sb_copy_data, "_Z21security_sb_copy_dataPcS_");

   function security_sb_remount (sb : access linux_fs_h.super_block; data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1759
   pragma Import (CPP, security_sb_remount, "_Z19security_sb_remountP11super_blockPv");

   function security_sb_kern_mount
     (sb : access linux_fs_h.super_block;
      flags : int;
      data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1760
   pragma Import (CPP, security_sb_kern_mount, "_Z22security_sb_kern_mountP11super_blockiPv");

   function security_sb_show_options (m : access linux_seq_file_h.seq_file; sb : access linux_fs_h.super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1761
   pragma Import (CPP, security_sb_show_options, "_Z24security_sb_show_optionsP8seq_fileP11super_block");

   function security_sb_statfs (the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1762
   pragma Import (CPP, security_sb_statfs, "_Z18security_sb_statfsP6dentry");

   function security_sb_mount
     (dev_name : Interfaces.C.Strings.chars_ptr;
      the_path : access linux_path_h.path;
      c_type : Interfaces.C.Strings.chars_ptr;
      flags : unsigned_long;
      data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1763
   pragma Import (CPP, security_sb_mount, "_Z17security_sb_mountPKcP4pathS0_mPv");

   function security_sb_umount (mnt : System.Address; flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1765
   pragma Import (CPP, security_sb_umount, "_Z18security_sb_umountP8vfsmounti");

   function security_sb_pivotroot (old_path : access linux_path_h.path; new_path : access linux_path_h.path) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1766
   pragma Import (CPP, security_sb_pivotroot, "_Z21security_sb_pivotrootP4pathS0_");

   function security_sb_set_mnt_opts
     (sb : access linux_fs_h.super_block;
      opts : access security_mnt_opts;
      kern_flags : unsigned_long;
      set_kern_flags : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1767
   pragma Import (CPP, security_sb_set_mnt_opts, "_Z24security_sb_set_mnt_optsP11super_blockP17security_mnt_optsmPm");

   function security_sb_clone_mnt_opts (oldsb : access constant linux_fs_h.super_block; newsb : access linux_fs_h.super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1771
   pragma Import (CPP, security_sb_clone_mnt_opts, "_Z26security_sb_clone_mnt_optsPK11super_blockPS_");

   function security_sb_parse_opts_str (options : Interfaces.C.Strings.chars_ptr; opts : access security_mnt_opts) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1773
   pragma Import (CPP, security_sb_parse_opts_str, "_Z26security_sb_parse_opts_strPcP17security_mnt_opts");

   function security_dentry_init_security
     (the_dentry : access linux_dcache_h.dentry;
      mode : int;
      name : access linux_dcache_h.qstr;
      ctx : System.Address;
      ctxlen : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1774
   pragma Import (CPP, security_dentry_init_security, "_Z29security_dentry_init_securityP6dentryiP4qstrPPvPj");

   function security_inode_alloc (the_inode : access linux_fs_h.inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1778
   pragma Import (CPP, security_inode_alloc, "_Z20security_inode_allocP5inode");

   procedure security_inode_free (the_inode : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1779
   pragma Import (CPP, security_inode_free, "_Z19security_inode_freeP5inode");

   function security_inode_init_security
     (the_inode : access linux_fs_h.inode;
      dir : access linux_fs_h.inode;
      the_qstr : access constant linux_dcache_h.qstr;
      the_initxattrs : initxattrs;
      fs_data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1780
   pragma Import (CPP, security_inode_init_security, "_Z28security_inode_init_securityP5inodeS0_PK4qstrPFiS0_PK5xattrPvES7_");

   function security_old_inode_init_security
     (the_inode : access linux_fs_h.inode;
      dir : access linux_fs_h.inode;
      the_qstr : access constant linux_dcache_h.qstr;
      name : System.Address;
      value : System.Address;
      len : access linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1783
   pragma Import (CPP, security_old_inode_init_security, "_Z32security_old_inode_init_securityP5inodeS0_PK4qstrPPKcPPvPm");

   function security_inode_create
     (dir : access linux_fs_h.inode;
      the_dentry : access linux_dcache_h.dentry;
      mode : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1786
   pragma Import (CPP, security_inode_create, "_Z21security_inode_createP5inodeP6dentryt");

   function security_inode_link
     (old_dentry : access linux_dcache_h.dentry;
      dir : access linux_fs_h.inode;
      new_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1787
   pragma Import (CPP, security_inode_link, "_Z19security_inode_linkP6dentryP5inodeS0_");

   function security_inode_unlink (dir : access linux_fs_h.inode; the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1789
   pragma Import (CPP, security_inode_unlink, "_Z21security_inode_unlinkP5inodeP6dentry");

   function security_inode_symlink
     (dir : access linux_fs_h.inode;
      the_dentry : access linux_dcache_h.dentry;
      old_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1790
   pragma Import (CPP, security_inode_symlink, "_Z22security_inode_symlinkP5inodeP6dentryPKc");

   function security_inode_mkdir
     (dir : access linux_fs_h.inode;
      the_dentry : access linux_dcache_h.dentry;
      mode : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1792
   pragma Import (CPP, security_inode_mkdir, "_Z20security_inode_mkdirP5inodeP6dentryt");

   function security_inode_rmdir (dir : access linux_fs_h.inode; the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1793
   pragma Import (CPP, security_inode_rmdir, "_Z20security_inode_rmdirP5inodeP6dentry");

   function security_inode_mknod
     (dir : access linux_fs_h.inode;
      the_dentry : access linux_dcache_h.dentry;
      mode : linux_types_h.umode_t;
      dev : linux_types_h.dev_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1794
   pragma Import (CPP, security_inode_mknod, "_Z20security_inode_mknodP5inodeP6dentrytj");

   function security_inode_rename
     (old_dir : access linux_fs_h.inode;
      old_dentry : access linux_dcache_h.dentry;
      new_dir : access linux_fs_h.inode;
      new_dentry : access linux_dcache_h.dentry;
      flags : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1795
   pragma Import (CPP, security_inode_rename, "_Z21security_inode_renameP5inodeP6dentryS0_S2_j");

   function security_inode_readlink (the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1798
   pragma Import (CPP, security_inode_readlink, "_Z23security_inode_readlinkP6dentry");

   function security_inode_follow_link (the_dentry : access linux_dcache_h.dentry; nd : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1799
   pragma Import (CPP, security_inode_follow_link, "_Z26security_inode_follow_linkP6dentryP9nameidata");

   function security_inode_permission (the_inode : access linux_fs_h.inode; mask : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1800
   pragma Import (CPP, security_inode_permission, "_Z25security_inode_permissionP5inodei");

   function security_inode_setattr (the_dentry : access linux_dcache_h.dentry; attr : access linux_fs_h.iattr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1801
   pragma Import (CPP, security_inode_setattr, "_Z22security_inode_setattrP6dentryP5iattr");

   function security_inode_getattr (mnt : System.Address; the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1802
   pragma Import (CPP, security_inode_getattr, "_Z22security_inode_getattrP8vfsmountP6dentry");

   function security_inode_setxattr
     (the_dentry : access linux_dcache_h.dentry;
      name : Interfaces.C.Strings.chars_ptr;
      value : System.Address;
      size : linux_types_h.size_t;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1803
   pragma Import (CPP, security_inode_setxattr, "_Z23security_inode_setxattrP6dentryPKcPKvmi");

   procedure security_inode_post_setxattr
     (the_dentry : access linux_dcache_h.dentry;
      name : Interfaces.C.Strings.chars_ptr;
      value : System.Address;
      size : linux_types_h.size_t;
      flags : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1805
   pragma Import (CPP, security_inode_post_setxattr, "_Z28security_inode_post_setxattrP6dentryPKcPKvmi");

   function security_inode_getxattr (the_dentry : access linux_dcache_h.dentry; name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1807
   pragma Import (CPP, security_inode_getxattr, "_Z23security_inode_getxattrP6dentryPKc");

   function security_inode_listxattr (the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1808
   pragma Import (CPP, security_inode_listxattr, "_Z24security_inode_listxattrP6dentry");

   function security_inode_removexattr (the_dentry : access linux_dcache_h.dentry; name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1809
   pragma Import (CPP, security_inode_removexattr, "_Z26security_inode_removexattrP6dentryPKc");

   function security_inode_need_killpriv (the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1810
   pragma Import (CPP, security_inode_need_killpriv, "_Z28security_inode_need_killprivP6dentry");

   function security_inode_killpriv (the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1811
   pragma Import (CPP, security_inode_killpriv, "_Z23security_inode_killprivP6dentry");

   function security_inode_getsecurity
     (the_inode : access constant linux_fs_h.inode;
      name : Interfaces.C.Strings.chars_ptr;
      buffer : System.Address;
      alloc : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1812
   pragma Import (CPP, security_inode_getsecurity, "_Z26security_inode_getsecurityPK5inodePKcPPvb");

   function security_inode_setsecurity
     (the_inode : access linux_fs_h.inode;
      name : Interfaces.C.Strings.chars_ptr;
      value : System.Address;
      size : linux_types_h.size_t;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1813
   pragma Import (CPP, security_inode_setsecurity, "_Z26security_inode_setsecurityP5inodePKcPKvmi");

   function security_inode_listsecurity
     (the_inode : access linux_fs_h.inode;
      buffer : Interfaces.C.Strings.chars_ptr;
      buffer_size : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1814
   pragma Import (CPP, security_inode_listsecurity, "_Z27security_inode_listsecurityP5inodePcm");

   procedure security_inode_getsecid (the_inode : access constant linux_fs_h.inode; secid : access asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1815
   pragma Import (CPP, security_inode_getsecid, "_Z23security_inode_getsecidPK5inodePj");

   function security_file_permission (the_file : access linux_fs_h.file; mask : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1816
   pragma Import (CPP, security_file_permission, "_Z24security_file_permissionP4filei");

   function security_file_alloc (the_file : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1817
   pragma Import (CPP, security_file_alloc, "_Z19security_file_allocP4file");

   procedure security_file_free (the_file : access linux_fs_h.file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1818
   pragma Import (CPP, security_file_free, "_Z18security_file_freeP4file");

   function security_file_ioctl
     (the_file : access linux_fs_h.file;
      cmd : unsigned;
      arg : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1819
   pragma Import (CPP, security_file_ioctl, "_Z19security_file_ioctlP4filejm");

   function security_mmap_file
     (the_file : access linux_fs_h.file;
      prot : unsigned_long;
      flags : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1820
   pragma Import (CPP, security_mmap_file, "_Z18security_mmap_fileP4filemm");

   function security_mmap_addr (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1822
   pragma Import (CPP, security_mmap_addr, "_Z18security_mmap_addrm");

   function security_file_mprotect
     (vma : access linux_mm_types_h.vm_area_struct;
      reqprot : unsigned_long;
      prot : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1823
   pragma Import (CPP, security_file_mprotect, "_Z22security_file_mprotectP14vm_area_structmm");

   function security_file_lock (the_file : access linux_fs_h.file; cmd : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1825
   pragma Import (CPP, security_file_lock, "_Z18security_file_lockP4filej");

   function security_file_fcntl
     (the_file : access linux_fs_h.file;
      cmd : unsigned;
      arg : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1826
   pragma Import (CPP, security_file_fcntl, "_Z19security_file_fcntlP4filejm");

   function security_file_set_fowner (the_file : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1827
   pragma Import (CPP, security_file_set_fowner, "_Z24security_file_set_fownerP4file");

   function security_file_send_sigiotask
     (tsk : access linux_sched_h.task_struct;
      fown : access linux_fs_h.fown_struct;
      sig : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1828
   pragma Import (CPP, security_file_send_sigiotask, "_Z28security_file_send_sigiotaskP11task_structP11fown_structi");

   function security_file_receive (the_file : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1830
   pragma Import (CPP, security_file_receive, "_Z21security_file_receiveP4file");

   function security_file_open (the_file : access linux_fs_h.file; the_cred : access constant linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1831
   pragma Import (CPP, security_file_open, "_Z18security_file_openP4filePK4cred");

   function security_task_create (clone_flags : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1832
   pragma Import (CPP, security_task_create, "_Z20security_task_createm");

   procedure security_task_free (c_task : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1833
   pragma Import (CPP, security_task_free, "_Z18security_task_freeP11task_struct");

   function security_cred_alloc_blank (the_cred : access linux_cred_h.cred; gfp : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1834
   pragma Import (CPP, security_cred_alloc_blank, "_Z25security_cred_alloc_blankP4credj");

   procedure security_cred_free (the_cred : access linux_cred_h.cred);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1835
   pragma Import (CPP, security_cred_free, "_Z18security_cred_freeP4cred");

   function security_prepare_creds (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1836
   pragma Import (CPP, security_prepare_creds, "_Z22security_prepare_credsP4cred");

   procedure security_transfer_creds (arg1 : access linux_cred_h.cred);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1837
   pragma Import (CPP, security_transfer_creds, "_Z23security_transfer_credsP4cred");

   function security_kernel_act_as (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1838
   pragma Import (CPP, security_kernel_act_as, "_Z22security_kernel_act_asP4cred");

   function security_kernel_create_files_as (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1839
   pragma Import (CPP, security_kernel_create_files_as, "_Z31security_kernel_create_files_asP4cred");

   function security_kernel_module_request (kmod_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1840
   pragma Import (CPP, security_kernel_module_request, "_Z30security_kernel_module_requestPc");

   function security_kernel_module_from_file (the_file : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1841
   pragma Import (CPP, security_kernel_module_from_file, "_Z32security_kernel_module_from_fileP4file");

   function security_task_fix_setuid (arg1 : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1842
   pragma Import (CPP, security_task_fix_setuid, "_Z24security_task_fix_setuidP4cred");

   function security_task_setpgid (p : access linux_sched_h.task_struct; pgid : linux_types_h.pid_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1844
   pragma Import (CPP, security_task_setpgid, "_Z21security_task_setpgidP11task_structi");

   function security_task_getpgid (p : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1845
   pragma Import (CPP, security_task_getpgid, "_Z21security_task_getpgidP11task_struct");

   function security_task_getsid (p : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1846
   pragma Import (CPP, security_task_getsid, "_Z20security_task_getsidP11task_struct");

   procedure security_task_getsecid (p : access linux_sched_h.task_struct; secid : access asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1847
   pragma Import (CPP, security_task_getsecid, "_Z22security_task_getsecidP11task_structPj");

   function security_task_setnice (p : access linux_sched_h.task_struct; nice : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1848
   pragma Import (CPP, security_task_setnice, "_Z21security_task_setniceP11task_structi");

   function security_task_setioprio (p : access linux_sched_h.task_struct; ioprio : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1849
   pragma Import (CPP, security_task_setioprio, "_Z23security_task_setioprioP11task_structi");

   function security_task_getioprio (p : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1850
   pragma Import (CPP, security_task_getioprio, "_Z23security_task_getioprioP11task_struct");

   function security_task_setrlimit
     (p : access linux_sched_h.task_struct;
      resource : unsigned;
      new_rlim : access uapi_linux_resource_h.rlimit) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1851
   pragma Import (CPP, security_task_setrlimit, "_Z23security_task_setrlimitP11task_structjP6rlimit");

   function security_task_setscheduler (p : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1853
   pragma Import (CPP, security_task_setscheduler, "_Z26security_task_setschedulerP11task_struct");

   function security_task_getscheduler (p : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1854
   pragma Import (CPP, security_task_getscheduler, "_Z26security_task_getschedulerP11task_struct");

   function security_task_movememory (p : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1855
   pragma Import (CPP, security_task_movememory, "_Z24security_task_movememoryP11task_struct");

   function security_task_kill
     (p : access linux_sched_h.task_struct;
      info : access uapi_asm_generic_siginfo_h.siginfo;
      sig : int;
      secid : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1856
   pragma Import (CPP, security_task_kill, "_Z18security_task_killP11task_structP7siginfoij");

   function security_task_wait (p : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1858
   pragma Import (CPP, security_task_wait, "_Z18security_task_waitP11task_struct");

   function security_task_prctl
     (option : int;
      arg2 : unsigned_long;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1859
   pragma Import (CPP, security_task_prctl, "_Z19security_task_prctlimmmm");

   procedure security_task_to_inode (p : access linux_sched_h.task_struct; the_inode : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1861
   pragma Import (CPP, security_task_to_inode, "_Z22security_task_to_inodeP11task_structP5inode");

   function security_ipc_permission (ipcp : access linux_ipc_h.kern_ipc_perm; flag : short) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1862
   pragma Import (CPP, security_ipc_permission, "_Z23security_ipc_permissionP13kern_ipc_perms");

   procedure security_ipc_getsecid (ipcp : access linux_ipc_h.kern_ipc_perm; secid : access asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1863
   pragma Import (CPP, security_ipc_getsecid, "_Z21security_ipc_getsecidP13kern_ipc_permPj");

   function security_msg_msg_alloc (msg : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1864
   pragma Import (CPP, security_msg_msg_alloc, "_Z22security_msg_msg_allocP7msg_msg");

   procedure security_msg_msg_free (msg : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1865
   pragma Import (CPP, security_msg_msg_free, "_Z21security_msg_msg_freeP7msg_msg");

   function security_msg_queue_alloc (msq : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1866
   pragma Import (CPP, security_msg_queue_alloc, "_Z24security_msg_queue_allocP9msg_queue");

   procedure security_msg_queue_free (msq : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1867
   pragma Import (CPP, security_msg_queue_free, "_Z23security_msg_queue_freeP9msg_queue");

   function security_msg_queue_associate (msq : System.Address; msqflg : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1868
   pragma Import (CPP, security_msg_queue_associate, "_Z28security_msg_queue_associateP9msg_queuei");

   function security_msg_queue_msgctl (msq : System.Address; cmd : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1869
   pragma Import (CPP, security_msg_queue_msgctl, "_Z25security_msg_queue_msgctlP9msg_queuei");

   function security_msg_queue_msgsnd
     (msq : System.Address;
      msg : System.Address;
      msqflg : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1870
   pragma Import (CPP, security_msg_queue_msgsnd, "_Z25security_msg_queue_msgsndP9msg_queueP7msg_msgi");

   function security_msg_queue_msgrcv
     (msq : System.Address;
      msg : System.Address;
      target : access linux_sched_h.task_struct;
      c_type : long;
      mode : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1872
   pragma Import (CPP, security_msg_queue_msgrcv, "_Z25security_msg_queue_msgrcvP9msg_queueP7msg_msgP11task_structli");

   function security_shm_alloc (shp : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1874
   pragma Import (CPP, security_shm_alloc, "_Z18security_shm_allocP12shmid_kernel");

   procedure security_shm_free (shp : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1875
   pragma Import (CPP, security_shm_free, "_Z17security_shm_freeP12shmid_kernel");

   function security_shm_associate (shp : System.Address; shmflg : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1876
   pragma Import (CPP, security_shm_associate, "_Z22security_shm_associateP12shmid_kerneli");

   function security_shm_shmctl (shp : System.Address; cmd : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1877
   pragma Import (CPP, security_shm_shmctl, "_Z19security_shm_shmctlP12shmid_kerneli");

   function security_shm_shmat
     (shp : System.Address;
      shmaddr : Interfaces.C.Strings.chars_ptr;
      shmflg : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1878
   pragma Import (CPP, security_shm_shmat, "_Z18security_shm_shmatP12shmid_kernelPci");

   function security_sem_alloc (sma : access linux_sem_h.sem_array) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1879
   pragma Import (CPP, security_sem_alloc, "_Z18security_sem_allocP9sem_array");

   procedure security_sem_free (sma : access linux_sem_h.sem_array);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1880
   pragma Import (CPP, security_sem_free, "_Z17security_sem_freeP9sem_array");

   function security_sem_associate (sma : access linux_sem_h.sem_array; semflg : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1881
   pragma Import (CPP, security_sem_associate, "_Z22security_sem_associateP9sem_arrayi");

   function security_sem_semctl (sma : access linux_sem_h.sem_array; cmd : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1882
   pragma Import (CPP, security_sem_semctl, "_Z19security_sem_semctlP9sem_arrayi");

   function security_sem_semop
     (sma : access linux_sem_h.sem_array;
      sops : access uapi_linux_sem_h.sembuf;
      nsops : unsigned;
      alter : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1883
   pragma Import (CPP, security_sem_semop, "_Z18security_sem_semopP9sem_arrayP6sembufji");

   procedure security_d_instantiate (the_dentry : access linux_dcache_h.dentry; the_inode : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1885
   pragma Import (CPP, security_d_instantiate, "_Z22security_d_instantiateP6dentryP5inode");

   function security_getprocattr
     (p : access linux_sched_h.task_struct;
      name : Interfaces.C.Strings.chars_ptr;
      value : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1886
   pragma Import (CPP, security_getprocattr, "_Z20security_getprocattrP11task_structPcPS1_");

   function security_setprocattr
     (p : access linux_sched_h.task_struct;
      name : Interfaces.C.Strings.chars_ptr;
      value : System.Address;
      size : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1887
   pragma Import (CPP, security_setprocattr, "_Z20security_setprocattrP11task_structPcPvm");

   function security_netlink_send (sk : System.Address; skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1888
   pragma Import (CPP, security_netlink_send, "_Z21security_netlink_sendP4sockP7sk_buff");

   function security_ismaclabel (name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1889
   pragma Import (CPP, security_ismaclabel, "_Z19security_ismaclabelPKc");

   function security_secid_to_secctx
     (secid : asm_generic_int_ll64_h.u32;
      secdata : System.Address;
      seclen : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1890
   pragma Import (CPP, security_secid_to_secctx, "_Z24security_secid_to_secctxjPPcPj");

   function security_secctx_to_secid
     (secdata : Interfaces.C.Strings.chars_ptr;
      seclen : asm_generic_int_ll64_h.u32;
      secid : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1891
   pragma Import (CPP, security_secctx_to_secid, "_Z24security_secctx_to_secidPKcjPj");

   procedure security_release_secctx (secdata : Interfaces.C.Strings.chars_ptr; seclen : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1892
   pragma Import (CPP, security_release_secctx, "_Z23security_release_secctxPcj");

   function security_inode_notifysecctx
     (the_inode : access linux_fs_h.inode;
      ctx : System.Address;
      ctxlen : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1894
   pragma Import (CPP, security_inode_notifysecctx, "_Z27security_inode_notifysecctxP5inodePvj");

   function security_inode_setsecctx
     (the_dentry : access linux_dcache_h.dentry;
      ctx : System.Address;
      ctxlen : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1895
   pragma Import (CPP, security_inode_setsecctx, "_Z24security_inode_setsecctxP6dentryPvj");

   function security_inode_getsecctx
     (the_inode : access linux_fs_h.inode;
      ctx : System.Address;
      ctxlen : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:1896
   pragma Import (CPP, security_inode_getsecctx, "_Z24security_inode_getsecctxP5inodePPvPj");

  -- * This is the default capabilities functionality.  Most of these functions
  -- * are just stubbed out, but a few must call the proper capable code.
  --  

   function security_unix_stream_connect
     (the_sock : System.Address;
      other : System.Address;
      newsk : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2620
   pragma Import (CPP, security_unix_stream_connect, "_Z28security_unix_stream_connectP4sockS0_S0_");

   function security_unix_may_send (sock : access linux_net_h.socket; other : access linux_net_h.socket) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2621
   pragma Import (CPP, security_unix_may_send, "_Z22security_unix_may_sendP6socketS0_");

   function security_socket_create
     (family : int;
      c_type : int;
      protocol : int;
      kern : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2622
   pragma Import (CPP, security_socket_create, "_Z22security_socket_createiiii");

   function security_socket_post_create
     (sock : access linux_net_h.socket;
      family : int;
      c_type : int;
      protocol : int;
      kern : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2623
   pragma Import (CPP, security_socket_post_create, "_Z27security_socket_post_createP6socketiiii");

   function security_socket_bind
     (sock : access linux_net_h.socket;
      address : access linux_socket_h.sockaddr;
      addrlen : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2625
   pragma Import (CPP, security_socket_bind, "_Z20security_socket_bindP6socketP8sockaddri");

   function security_socket_connect
     (sock : access linux_net_h.socket;
      address : access linux_socket_h.sockaddr;
      addrlen : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2626
   pragma Import (CPP, security_socket_connect, "_Z23security_socket_connectP6socketP8sockaddri");

   function security_socket_listen (sock : access linux_net_h.socket; backlog : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2627
   pragma Import (CPP, security_socket_listen, "_Z22security_socket_listenP6socketi");

   function security_socket_accept (sock : access linux_net_h.socket; newsock : access linux_net_h.socket) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2628
   pragma Import (CPP, security_socket_accept, "_Z22security_socket_acceptP6socketS0_");

   function security_socket_sendmsg
     (sock : access linux_net_h.socket;
      msg : access linux_socket_h.msghdr;
      size : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2629
   pragma Import (CPP, security_socket_sendmsg, "_Z23security_socket_sendmsgP6socketP6msghdri");

   function security_socket_recvmsg
     (sock : access linux_net_h.socket;
      msg : access linux_socket_h.msghdr;
      size : int;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2630
   pragma Import (CPP, security_socket_recvmsg, "_Z23security_socket_recvmsgP6socketP6msghdrii");

   function security_socket_getsockname (sock : access linux_net_h.socket) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2632
   pragma Import (CPP, security_socket_getsockname, "_Z27security_socket_getsocknameP6socket");

   function security_socket_getpeername (sock : access linux_net_h.socket) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2633
   pragma Import (CPP, security_socket_getpeername, "_Z27security_socket_getpeernameP6socket");

   function security_socket_getsockopt
     (sock : access linux_net_h.socket;
      level : int;
      optname : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2634
   pragma Import (CPP, security_socket_getsockopt, "_Z26security_socket_getsockoptP6socketii");

   function security_socket_setsockopt
     (sock : access linux_net_h.socket;
      level : int;
      optname : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2635
   pragma Import (CPP, security_socket_setsockopt, "_Z26security_socket_setsockoptP6socketii");

   function security_socket_shutdown (sock : access linux_net_h.socket; how : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2636
   pragma Import (CPP, security_socket_shutdown, "_Z24security_socket_shutdownP6socketi");

   function security_sock_rcv_skb (sk : System.Address; skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2637
   pragma Import (CPP, security_sock_rcv_skb, "_Z21security_sock_rcv_skbP4sockP7sk_buff");

   function security_socket_getpeersec_stream
     (sock : access linux_net_h.socket;
      optval : Interfaces.C.Strings.chars_ptr;
      optlen : access int;
      len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2638
   pragma Import (CPP, security_socket_getpeersec_stream, "_Z33security_socket_getpeersec_streamP6socketPcPij");

   function security_socket_getpeersec_dgram
     (sock : access linux_net_h.socket;
      skb : access linux_skbuff_h.sk_buff;
      secid : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2640
   pragma Import (CPP, security_socket_getpeersec_dgram, "_Z32security_socket_getpeersec_dgramP6socketP7sk_buffPj");

   function security_sk_alloc
     (sk : System.Address;
      family : int;
      priority : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2641
   pragma Import (CPP, security_sk_alloc, "_Z17security_sk_allocP4sockij");

   procedure security_sk_free (sk : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2642
   pragma Import (CPP, security_sk_free, "_Z16security_sk_freeP4sock");

   procedure security_sk_clone (sk : System.Address; newsk : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2643
   pragma Import (CPP, security_sk_clone, "_Z17security_sk_clonePK4sockPS_");

   procedure security_sk_classify_flow (sk : System.Address; fl : access net_flow_h.flowi);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2644
   pragma Import (CPP, security_sk_classify_flow, "_Z25security_sk_classify_flowP4sockP5flowi");

   procedure security_req_classify_flow (req : System.Address; fl : access net_flow_h.flowi);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2645
   pragma Import (CPP, security_req_classify_flow, "_Z26security_req_classify_flowPK12request_sockP5flowi");

   procedure security_sock_graft (sk : System.Address; parent : access linux_net_h.socket);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2646
   pragma Import (CPP, security_sock_graft, "_Z19security_sock_graftP4sockP6socket");

   function security_inet_conn_request
     (sk : System.Address;
      skb : access linux_skbuff_h.sk_buff;
      req : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2647
   pragma Import (CPP, security_inet_conn_request, "_Z26security_inet_conn_requestP4sockP7sk_buffP12request_sock");

   procedure security_inet_csk_clone (newsk : System.Address; req : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2649
   pragma Import (CPP, security_inet_csk_clone, "_Z23security_inet_csk_cloneP4sockPK12request_sock");

   procedure security_inet_conn_established (sk : System.Address; skb : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2651
   pragma Import (CPP, security_inet_conn_established, "_Z30security_inet_conn_establishedP4sockP7sk_buff");

   function security_secmark_relabel_packet (secid : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2653
   pragma Import (CPP, security_secmark_relabel_packet, "_Z31security_secmark_relabel_packetj");

   procedure security_secmark_refcount_inc;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2654
   pragma Import (CPP, security_secmark_refcount_inc, "_Z29security_secmark_refcount_incv");

   procedure security_secmark_refcount_dec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2655
   pragma Import (CPP, security_secmark_refcount_dec, "_Z29security_secmark_refcount_decv");

   function security_tun_dev_alloc_security (security : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2656
   pragma Import (CPP, security_tun_dev_alloc_security, "_Z31security_tun_dev_alloc_securityPPv");

   procedure security_tun_dev_free_security (security : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2657
   pragma Import (CPP, security_tun_dev_free_security, "_Z30security_tun_dev_free_securityPv");

   function security_tun_dev_create return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2658
   pragma Import (CPP, security_tun_dev_create, "_Z23security_tun_dev_createv");

   function security_tun_dev_attach_queue (security : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2659
   pragma Import (CPP, security_tun_dev_attach_queue, "_Z29security_tun_dev_attach_queuePv");

   function security_tun_dev_attach (sk : System.Address; security : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2660
   pragma Import (CPP, security_tun_dev_attach, "_Z23security_tun_dev_attachP4sockPv");

   function security_tun_dev_open (security : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2661
   pragma Import (CPP, security_tun_dev_open, "_Z21security_tun_dev_openPv");

   procedure security_skb_owned_by (skb : access linux_skbuff_h.sk_buff; sk : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2663
   pragma Import (CPP, security_skb_owned_by, "_Z21security_skb_owned_byP7sk_buffP4sock");

   function security_xfrm_policy_alloc
     (ctxp : System.Address;
      sec_ctx : access uapi_linux_xfrm_h.xfrm_user_sec_ctx;
      gfp : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2865
   pragma Import (CPP, security_xfrm_policy_alloc, "_Z26security_xfrm_policy_allocPP12xfrm_sec_ctxP17xfrm_user_sec_ctxj");

   function security_xfrm_policy_clone (old_ctx : access uapi_linux_xfrm_h.xfrm_sec_ctx; new_ctxp : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2867
   pragma Import (CPP, security_xfrm_policy_clone, "_Z26security_xfrm_policy_cloneP12xfrm_sec_ctxPS0_");

   procedure security_xfrm_policy_free (ctx : access uapi_linux_xfrm_h.xfrm_sec_ctx);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2868
   pragma Import (CPP, security_xfrm_policy_free, "_Z25security_xfrm_policy_freeP12xfrm_sec_ctx");

   function security_xfrm_policy_delete (ctx : access uapi_linux_xfrm_h.xfrm_sec_ctx) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2869
   pragma Import (CPP, security_xfrm_policy_delete, "_Z27security_xfrm_policy_deleteP12xfrm_sec_ctx");

   function security_xfrm_state_alloc (x : System.Address; sec_ctx : access uapi_linux_xfrm_h.xfrm_user_sec_ctx) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2870
   pragma Import (CPP, security_xfrm_state_alloc, "_Z25security_xfrm_state_allocP10xfrm_stateP17xfrm_user_sec_ctx");

   function security_xfrm_state_alloc_acquire
     (x : System.Address;
      polsec : access uapi_linux_xfrm_h.xfrm_sec_ctx;
      secid : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2871
   pragma Import (CPP, security_xfrm_state_alloc_acquire, "_Z33security_xfrm_state_alloc_acquireP10xfrm_stateP12xfrm_sec_ctxj");

   function security_xfrm_state_delete (x : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2873
   pragma Import (CPP, security_xfrm_state_delete, "_Z26security_xfrm_state_deleteP10xfrm_state");

   procedure security_xfrm_state_free (x : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2874
   pragma Import (CPP, security_xfrm_state_free, "_Z24security_xfrm_state_freeP10xfrm_state");

   function security_xfrm_policy_lookup
     (ctx : access uapi_linux_xfrm_h.xfrm_sec_ctx;
      fl_secid : asm_generic_int_ll64_h.u32;
      dir : asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2875
   pragma Import (CPP, security_xfrm_policy_lookup, "_Z27security_xfrm_policy_lookupP12xfrm_sec_ctxjh");

   function security_xfrm_state_pol_flow_match
     (x : System.Address;
      xp : System.Address;
      fl : access constant net_flow_h.flowi) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2876
   pragma Import (CPP, security_xfrm_state_pol_flow_match, "_Z34security_xfrm_state_pol_flow_matchP10xfrm_stateP11xfrm_policyPK5flowi");

   function security_xfrm_decode_session (skb : access linux_skbuff_h.sk_buff; secid : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2879
   pragma Import (CPP, security_xfrm_decode_session, "_Z28security_xfrm_decode_sessionP7sk_buffPj");

   procedure security_skb_classify_flow (skb : access linux_skbuff_h.sk_buff; fl : access net_flow_h.flowi);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2880
   pragma Import (CPP, security_skb_classify_flow, "_Z26security_skb_classify_flowP7sk_buffP5flowi");

   function security_path_unlink (dir : access linux_path_h.path; the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2949
   pragma Import (CPP, security_path_unlink, "_Z20security_path_unlinkP4pathP6dentry");

   function security_path_mkdir
     (dir : access linux_path_h.path;
      the_dentry : access linux_dcache_h.dentry;
      mode : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2950
   pragma Import (CPP, security_path_mkdir, "_Z19security_path_mkdirP4pathP6dentryt");

   function security_path_rmdir (dir : access linux_path_h.path; the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2951
   pragma Import (CPP, security_path_rmdir, "_Z19security_path_rmdirP4pathP6dentry");

   function security_path_mknod
     (dir : access linux_path_h.path;
      the_dentry : access linux_dcache_h.dentry;
      mode : linux_types_h.umode_t;
      dev : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2952
   pragma Import (CPP, security_path_mknod, "_Z19security_path_mknodP4pathP6dentrytj");

   function security_path_truncate (the_path : access linux_path_h.path) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2954
   pragma Import (CPP, security_path_truncate, "_Z22security_path_truncateP4path");

   function security_path_symlink
     (dir : access linux_path_h.path;
      the_dentry : access linux_dcache_h.dentry;
      old_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2955
   pragma Import (CPP, security_path_symlink, "_Z21security_path_symlinkP4pathP6dentryPKc");

   function security_path_link
     (old_dentry : access linux_dcache_h.dentry;
      new_dir : access linux_path_h.path;
      new_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2957
   pragma Import (CPP, security_path_link, "_Z18security_path_linkP6dentryP4pathS0_");

   function security_path_rename
     (old_dir : access linux_path_h.path;
      old_dentry : access linux_dcache_h.dentry;
      new_dir : access linux_path_h.path;
      new_dentry : access linux_dcache_h.dentry;
      flags : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2959
   pragma Import (CPP, security_path_rename, "_Z20security_path_renameP4pathP6dentryS0_S2_j");

   function security_path_chmod (the_path : access linux_path_h.path; mode : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2962
   pragma Import (CPP, security_path_chmod, "_Z19security_path_chmodP4patht");

   function security_path_chown
     (the_path : access linux_path_h.path;
      uid : linux_uidgid_h.kuid_t;
      gid : linux_uidgid_h.kgid_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2963
   pragma Import (CPP, security_path_chown, "_Z19security_path_chownP4path6kuid_t6kgid_t");

   function security_path_chroot (the_path : access linux_path_h.path) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:2964
   pragma Import (CPP, security_path_chroot, "_Z20security_path_chrootP4path");

   function security_key_alloc
     (the_key : access linux_key_h.key;
      the_cred : access constant linux_cred_h.cred;
      flags : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3034
   pragma Import (CPP, security_key_alloc, "_Z18security_key_allocP3keyPK4credm");

   procedure security_key_free (the_key : access linux_key_h.key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3035
   pragma Import (CPP, security_key_free, "_Z17security_key_freeP3key");

   function security_key_permission
     (key_ref : linux_key_h.key_ref_t;
      the_cred : access constant linux_cred_h.cred;
      perm : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3036
   pragma Import (CPP, security_key_permission, "_Z23security_key_permissionP31__key_reference_with_attributesPK4credj");

   function security_key_getsecurity (the_key : access linux_key_h.key; u_buffer : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3038
   pragma Import (CPP, security_key_getsecurity, "_Z24security_key_getsecurityP3keyPPc");

   function security_audit_rule_init
     (field : asm_generic_int_ll64_h.u32;
      op : asm_generic_int_ll64_h.u32;
      rulestr : Interfaces.C.Strings.chars_ptr;
      lsmrule : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3071
   pragma Import (CPP, security_audit_rule_init, "_Z24security_audit_rule_initjjPcPPv");

   function security_audit_rule_known (krule : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3072
   pragma Import (CPP, security_audit_rule_known, "_Z25security_audit_rule_knownP11audit_krule");

   function security_audit_rule_match
     (secid : asm_generic_int_ll64_h.u32;
      field : asm_generic_int_ll64_h.u32;
      op : asm_generic_int_ll64_h.u32;
      lsmrule : System.Address;
      actx : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3073
   pragma Import (CPP, security_audit_rule_match, "_Z25security_audit_rule_matchjjjPvP13audit_context");

   procedure security_audit_rule_free (lsmrule : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3075
   pragma Import (CPP, security_audit_rule_free, "_Z24security_audit_rule_freePv");

   function securityfs_create_file
     (name : Interfaces.C.Strings.chars_ptr;
      mode : linux_types_h.umode_t;
      parent : access linux_dcache_h.dentry;
      data : System.Address;
      fops : access constant linux_fs_h.file_operations) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3104
   pragma Import (CPP, securityfs_create_file, "_Z22securityfs_create_filePKctP6dentryPvPK15file_operations");

   function securityfs_create_dir (name : Interfaces.C.Strings.chars_ptr; parent : access linux_dcache_h.dentry) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3107
   pragma Import (CPP, securityfs_create_dir, "_Z21securityfs_create_dirPKcP6dentry");

   procedure securityfs_remove (the_dentry : access linux_dcache_h.dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3108
   pragma Import (CPP, securityfs_remove, "_Z17securityfs_removeP6dentry");

   function alloc_secdata return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3134
   pragma Import (CPP, alloc_secdata, "_ZL13alloc_secdatav");

   procedure free_secdata (secdata : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3139
   pragma Import (CPP, free_secdata, "_ZL12free_secdataPv");

   function yama_ptrace_access_check (child : access linux_sched_h.task_struct; mode : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3156
   pragma Import (CPP, yama_ptrace_access_check, "_Z24yama_ptrace_access_checkP11task_structj");

   function yama_ptrace_traceme (parent : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3158
   pragma Import (CPP, yama_ptrace_traceme, "_Z19yama_ptrace_tracemeP11task_struct");

   procedure yama_task_free (c_task : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3159
   pragma Import (CPP, yama_task_free, "_Z14yama_task_freeP11task_struct");

   function yama_task_prctl
     (option : int;
      arg2 : unsigned_long;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/security.h:3160
   pragma Import (CPP, yama_task_prctl, "_Z15yama_task_prctlimmmm");

end linux_security_h;

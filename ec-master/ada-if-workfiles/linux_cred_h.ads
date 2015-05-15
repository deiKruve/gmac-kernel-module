pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_uidgid_h;
with linux_types_h;
with System;
with Interfaces.C.Extensions;
with linux_capability_h;
limited with linux_key_h;
limited with linux_sched_h;
limited with linux_fs_h;
with asm_generic_int_ll64_h;
with Interfaces.C.Strings;

package linux_cred_h is

   --  unsupported macro: NGROUPS_SMALL 32
   --  unsupported macro: NGROUPS_PER_BLOCK ((unsigned int)(PAGE_SIZE / sizeof(kgid_t)))
   --  arg-macro: procedure put_group_info do { if (atomic_dec_and_test(and(group_info).usage)) groups_free(group_info); } while (0)
   --    do { if (atomic_dec_and_test(and(group_info).usage)) groups_free(group_info); } while (0)
   --  arg-macro: function GROUP_AT ((gi).blocks((i) / NGROUPS_PER_BLOCK)((i) mod NGROUPS_PER_BLOCK)
   --    return (gi).blocks((i) / NGROUPS_PER_BLOCK)((i) mod NGROUPS_PER_BLOCK);
   --  arg-macro: procedure current_cred rcu_dereference_protected(current.cred, 1)
   --    rcu_dereference_protected(current.cred, 1)
   --  arg-macro: function get_current_cred (get_cred(current_cred())
   --    return get_cred(current_cred());
   --  arg-macro: function get_current_user ({ struct user_struct *__u; const struct cred *__cred; __cred := current_cred(); __u := get_uid(__cred.user); __u; }
   --    return { struct user_struct *__u; const struct cred *__cred; __cred := current_cred(); __u := get_uid(__cred.user); __u; };
   --  arg-macro: function get_current_groups ({ struct group_info *__groups; const struct cred *__cred; __cred := current_cred(); __groups := get_group_info(__cred.group_info); __groups; }
   --    return { struct group_info *__groups; const struct cred *__cred; __cred := current_cred(); __groups := get_group_info(__cred.group_info); __groups; };
   --  arg-macro: function task_cred_xxx ({ __typeof__(((struct cred *)NULL).xxx) ___val; rcu_read_lock(); ___val := __task_cred((task)).xxx; rcu_read_unlock(); ___val; }
   --    return { __typeof__(((struct cred *)NULL).xxx) ___val; rcu_read_lock(); ___val := __task_cred((task)).xxx; rcu_read_unlock(); ___val; };
   --  arg-macro: function task_uid (task_cred_xxx((task), uid)
   --    return task_cred_xxx((task), uid);
   --  arg-macro: function task_euid (task_cred_xxx((task), euid)
   --    return task_cred_xxx((task), euid);
   --  arg-macro: function current_cred_xxx ({ current_cred().xxx; }
   --    return { current_cred().xxx; };
   --  arg-macro: function current_uid (current_cred_xxx(uid)
   --    return current_cred_xxx(uid);
   --  arg-macro: function current_gid (current_cred_xxx(gid)
   --    return current_cred_xxx(gid);
   --  arg-macro: function current_euid (current_cred_xxx(euid)
   --    return current_cred_xxx(euid);
   --  arg-macro: function current_egid (current_cred_xxx(egid)
   --    return current_cred_xxx(egid);
   --  arg-macro: function current_suid (current_cred_xxx(suid)
   --    return current_cred_xxx(suid);
   --  arg-macro: function current_sgid (current_cred_xxx(sgid)
   --    return current_cred_xxx(sgid);
   --  arg-macro: function current_fsuid (current_cred_xxx(fsuid)
   --    return current_cred_xxx(fsuid);
   --  arg-macro: function current_fsgid (current_cred_xxx(fsgid)
   --    return current_cred_xxx(fsgid);
   --  arg-macro: function current_cap (current_cred_xxx(cap_effective)
   --    return current_cred_xxx(cap_effective);
   --  arg-macro: function current_user (current_cred_xxx(user)
   --    return current_cred_xxx(user);
   --  arg-macro: function current_security (current_cred_xxx(security)
   --    return current_cred_xxx(security);
   --  arg-macro: function current_user_ns (current_cred_xxx(user_ns)
   --    return current_cred_xxx(user_ns);
   --  arg-macro: procedure current_uid_gid do { const struct cred *__cred; __cred := current_cred(); *(_uid) := __cred.uid; *(_gid) := __cred.gid; } while(0)
   --    do { const struct cred *__cred; __cred := current_cred(); *(_uid) := __cred.uid; *(_gid) := __cred.gid; } while(0)
   --  arg-macro: procedure current_euid_egid do { const struct cred *__cred; __cred := current_cred(); *(_euid) := __cred.euid; *(_egid) := __cred.egid; } while(0)
   --    do { const struct cred *__cred; __cred := current_cred(); *(_euid) := __cred.euid; *(_egid) := __cred.egid; } while(0)
   --  arg-macro: procedure current_fsuid_fsgid do { const struct cred *__cred; __cred := current_cred(); *(_fsuid) := __cred.fsuid; *(_fsgid) := __cred.fsgid; } while(0)
   --    do { const struct cred *__cred; __cred := current_cred(); *(_fsuid) := __cred.fsuid; *(_fsgid) := __cred.fsgid; } while(0)
  -- Credentials management - see Documentation/security/credentials.txt
  -- *
  -- * Copyright (C) 2008 Red Hat, Inc. All Rights Reserved.
  -- * Written by David Howells (dhowells@redhat.com)
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public Licence
  -- * as published by the Free Software Foundation; either version
  -- * 2 of the Licence, or (at your option) any later version.
  --  

  -- * COW Supplementary groups list
  --  

   type group_info_small_block_array is array (0 .. 31) of aliased linux_uidgid_h.kgid_t;
   type group_info_blocks_array is array (0 .. -1) of access linux_uidgid_h.kgid_t;
   type group_info is record
      usage : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:33
      ngroups : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:34
      nblocks : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:35
      small_block : aliased group_info_small_block_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:36
      blocks : aliased group_info_blocks_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, group_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:32

  --*
  -- * get_group_info - Get a reference to a group info structure
  -- * @group_info: The group info to reference
  -- *
  -- * This gets a reference to a set of supplementary groups.
  -- *
  -- * If the caller is accessing a task's credentials, they must hold the RCU read
  -- * lock when reading.
  --  

   function get_group_info (gi : access group_info) return access group_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:49
   pragma Import (CPP, get_group_info, "_ZL14get_group_infoP10group_info");

  --*
  -- * put_group_info - Release a reference to a group info structure
  -- * @group_info: The group info to release
  --  

   function groups_alloc (arg1 : int) return access group_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:65
   pragma Import (CPP, groups_alloc, "_Z12groups_alloci");

   init_groups : aliased group_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:66
   pragma Import (C, init_groups, "init_groups");

   procedure groups_free (arg1 : access group_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:67
   pragma Import (CPP, groups_free, "_Z11groups_freeP10group_info");

   function set_current_groups (arg1 : access group_info) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:68
   pragma Import (CPP, set_current_groups, "_Z18set_current_groupsP10group_info");

   procedure set_groups (arg1 : System.Address; arg2 : access group_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:69
   pragma Import (CPP, set_groups, "_Z10set_groupsP4credP10group_info");

   function groups_search (arg1 : access constant group_info; arg2 : linux_uidgid_h.kgid_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:70
   pragma Import (CPP, groups_search, "_Z13groups_searchPK10group_info6kgid_t");

   function may_setgroups return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:71
   pragma Import (CPP, may_setgroups, "_Z13may_setgroupsv");

  -- access the groups "array" with this macro  
   function in_group_p (arg1 : linux_uidgid_h.kgid_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:77
   pragma Import (CPP, in_group_p, "_Z10in_group_p6kgid_t");

   function in_egroup_p (arg1 : linux_uidgid_h.kgid_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:78
   pragma Import (CPP, in_egroup_p, "_Z11in_egroup_p6kgid_t");

  -- * The security context of a task
  -- *
  -- * The parts of the context break down into two categories:
  -- *
  -- *  (1) The objective context of a task.  These parts are used when some other
  -- *	task is attempting to affect this one.
  -- *
  -- *  (2) The subjective context.  These details are used when the task is acting
  -- *	upon another object, be that a file, a task, a key or whatever.
  -- *
  -- * Note that some members of this structure belong to both categories - the
  -- * LSM security pointer for instance.
  -- *
  -- * A task has two security pointers.  task->real_cred points to the objective
  -- * context that defines that task's actual details.  The objective part of this
  -- * context is used whenever that task is acted upon.
  -- *
  -- * task->cred points to the subjective context that defines the details of how
  -- * that task is going to act upon another object.  This may be overridden
  -- * temporarily to point to another security context, but normally points to the
  -- * same context as task->real_cred.
  --  

   type cred is record
      usage : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:104
      uid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:112
      gid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:113
      suid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:114
      sgid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:115
      euid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:116
      egid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:117
      fsuid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:118
      fsgid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:119
      securebits : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:120
      cap_inheritable : aliased linux_capability_h.kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:121
      cap_permitted : aliased linux_capability_h.kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:122
      cap_effective : aliased linux_capability_h.kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:123
      cap_bset : aliased linux_capability_h.kernel_cap_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:124
      jit_keyring : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:126
      session_keyring : access linux_key_h.key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:128
      process_keyring : access linux_key_h.key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:129
      thread_keyring : access linux_key_h.key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:130
      request_key_auth : access linux_key_h.key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:131
      security : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:134
      user : access linux_sched_h.user_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:136
      user_ns : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:137
      the_group_info : access group_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:138
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:139
   end record;
   pragma Convention (C_Pass_By_Copy, cred);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:103

  -- number of processes subscribed  
  -- real UID of the task  
  -- real GID of the task  
  -- saved UID of the task  
  -- saved GID of the task  
  -- effective UID of the task  
  -- effective GID of the task  
  -- UID for VFS ops  
  -- GID for VFS ops  
  -- SUID-less security management  
  -- caps our children can inherit  
  -- caps we're permitted  
  -- caps we can actually use  
  -- capability bounding set  
  -- default keyring to attach requested
  --					 * keys to  

  -- keyring inherited over fork  
  -- keyring private to this process  
  -- keyring private to this thread  
  -- assumed request_key authority  
  -- subjective LSM security  
  -- real user ID subscription  
  -- user_ns the caps and keyrings are relative to.  
  -- supplementary groups for euid/fsgid  
  -- RCU deletion hook  
   --  skipped func __put_cred

   procedure exit_creds (arg1 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:143
   pragma Import (CPP, exit_creds, "_Z10exit_credsP11task_struct");

   function copy_creds (arg1 : access linux_sched_h.task_struct; arg2 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:144
   pragma Import (CPP, copy_creds, "_Z10copy_credsP11task_structm");

   function get_task_cred (arg1 : access linux_sched_h.task_struct) return access constant cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:145
   pragma Import (CPP, get_task_cred, "_Z13get_task_credP11task_struct");

   function cred_alloc_blank return access cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:146
   pragma Import (CPP, cred_alloc_blank, "_Z16cred_alloc_blankv");

   function prepare_creds return access cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:147
   pragma Import (CPP, prepare_creds, "_Z13prepare_credsv");

   function prepare_exec_creds return access cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:148
   pragma Import (CPP, prepare_exec_creds, "_Z18prepare_exec_credsv");

   function commit_creds (arg1 : access cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:149
   pragma Import (CPP, commit_creds, "_Z12commit_credsP4cred");

   procedure abort_creds (arg1 : access cred);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:150
   pragma Import (CPP, abort_creds, "_Z11abort_credsP4cred");

   function override_creds (arg1 : access constant cred) return access constant cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:151
   pragma Import (CPP, override_creds, "_Z14override_credsPK4cred");

   procedure revert_creds (arg1 : access constant cred);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:152
   pragma Import (CPP, revert_creds, "_Z12revert_credsPK4cred");

   function prepare_kernel_cred (arg1 : access linux_sched_h.task_struct) return access cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:153
   pragma Import (CPP, prepare_kernel_cred, "_Z19prepare_kernel_credP11task_struct");

   function change_create_files_as (arg1 : access cred; arg2 : access linux_fs_h.inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:154
   pragma Import (CPP, change_create_files_as, "_Z22change_create_files_asP4credP5inode");

   function set_security_override (arg1 : access cred; arg2 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:155
   pragma Import (CPP, set_security_override, "_Z21set_security_overrideP4credj");

   function set_security_override_from_ctx (arg1 : access cred; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:156
   pragma Import (CPP, set_security_override_from_ctx, "_Z30set_security_override_from_ctxP4credPKc");

   function set_create_files_as (arg1 : access cred; arg2 : access linux_fs_h.inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:157
   pragma Import (CPP, set_create_files_as, "_Z19set_create_files_asP4credP5inode");

   procedure cred_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:158
   pragma Import (CPP, cred_init, "_Z9cred_initv");

  -- * check for validity of credentials
  --  

   procedure validate_creds (the_cred : access constant cred);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:189
   pragma Import (CPP, validate_creds, "_ZL14validate_credsPK4cred");

   procedure validate_creds_for_do_exit (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:192
   pragma Import (CPP, validate_creds_for_do_exit, "_ZL26validate_creds_for_do_exitP11task_struct");

   procedure validate_process_creds;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:195
   pragma Import (CPP, validate_process_creds, "_ZL22validate_process_credsv");

  --*
  -- * get_new_cred - Get a reference on a new set of credentials
  -- * @cred: The new credentials to reference
  -- *
  -- * Get a reference on the specified set of new credentials.  The caller must
  -- * release the reference.
  --  

   function get_new_cred (the_cred : access cred) return access cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:207
   pragma Import (CPP, get_new_cred, "_ZL12get_new_credP4cred");

  --*
  -- * get_cred - Get a reference on a set of credentials
  -- * @cred: The credentials to reference
  -- *
  -- * Get a reference on the specified set of credentials.  The caller must
  -- * release the reference.
  -- *
  -- * This is used to deal with a committed set of credentials.  Although the
  -- * pointer is const, this will temporarily discard the const and increment the
  -- * usage count.  The purpose of this is to attempt to catch at compile time the
  -- * accidental alteration of a set of credentials that should be considered
  -- * immutable.
  --  

   function get_cred (the_cred : access constant cred) return access constant cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:226
   pragma Import (CPP, get_cred, "_ZL8get_credPK4cred");

  --*
  -- * put_cred - Release a reference to a set of credentials
  -- * @cred: The credentials to release
  -- *
  -- * Release a reference to a set of credentials, deleting them when the last ref
  -- * is released.
  -- *
  -- * This takes a const pointer to a set of credentials because the credentials
  -- * on task_struct are attached by const pointers to prevent accidental
  -- * alteration of otherwise immutable credential sets.
  --  

   procedure put_cred (u_cred : access constant cred);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:244
   pragma Import (CPP, put_cred, "_ZL8put_credPK4cred");

  --*
  -- * current_cred - Access the current task's subjective credentials
  -- *
  -- * Access the subjective credentials of the current task.  RCU-safe,
  -- * since nobody else can modify it.
  --  

  --*
  -- * __task_cred - Access a task's objective credentials
  -- * @task: The task to query
  -- *
  -- * Access the objective credentials of a task.  The caller must hold the RCU
  -- * readlock.
  -- *
  -- * The result of this function should not be passed directly to get_cred();
  -- * rather get_task_cred() should be used instead.
  --  

  --*
  -- * get_current_cred - Get the current task's subjective credentials
  -- *
  -- * Get the subjective credentials of the current task, pinning them so that
  -- * they can't go away.  Accessing the current task's credentials directly is
  -- * not permitted.
  --  

  --*
  -- * get_current_user - Get the current task's user_struct
  -- *
  -- * Get the user record of the current task, pinning it so that it can't go
  -- * away.
  --  

  --*
  -- * get_current_groups - Get the current task's supplementary group list
  -- *
  -- * Get the supplementary group list of the current task, pinning it so that it
  -- * can't go away.
  --  

   init_user_ns : aliased linux_uidgid_h.Class_user_namespace.user_namespace;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cred.h:344
   pragma Import (C, init_user_ns, "init_user_ns");

end linux_cred_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_posix_types_h;
with linux_uidgid_h;
with linux_projid_h;
with Interfaces.C.Extensions;
with System;
with linux_spinlock_types_h;
with linux_types_h;
limited with linux_fs_h;
with linux_percpu_counter_h;
with linux_mutex_h;
with linux_wait_h;
limited with linux_path_h;
limited with uapi_linux_quota_h;
limited with uapi_linux_dqblk_xfs_h;
with linux_rwsem_h;
with Interfaces.C.Strings;

package linux_quota_h is

   --  unsupported macro: DQUOT_INIT_ALLOC max(V1_INIT_ALLOC, V2_INIT_ALLOC)
   --  unsupported macro: DQUOT_INIT_REWRITE max(V1_INIT_REWRITE, V2_INIT_REWRITE)
   --  unsupported macro: DQUOT_DEL_ALLOC max(V1_DEL_ALLOC, V2_DEL_ALLOC)
   --  unsupported macro: DQUOT_DEL_REWRITE max(V1_DEL_REWRITE, V2_DEL_REWRITE)
   --  unsupported macro: DQF_MASK 0xffff
   --  unsupported macro: DQF_GETINFO_MASK 0x1ffff
   --  unsupported macro: DQF_SETINFO_MASK 0xffff
   --  unsupported macro: DQF_SYS_FILE_B 16
   --  unsupported macro: DQF_SYS_FILE (1 << DQF_SYS_FILE_B)
   --  unsupported macro: DQF_INFO_DIRTY_B 31
   --  unsupported macro: DQF_INFO_DIRTY (1 << DQF_INFO_DIRTY_B)
   --  unsupported macro: DQ_MOD_B 0
   --  unsupported macro: DQ_BLKS_B 1
   --  unsupported macro: DQ_INODES_B 2
   --  unsupported macro: DQ_FAKE_B 3
   --  unsupported macro: DQ_READ_B 4
   --  unsupported macro: DQ_ACTIVE_B 5
   --  unsupported macro: DQ_LASTSET_B 6
   --  unsupported macro: DQUOT_USAGE_ENABLED (1 << _DQUOT_USAGE_ENABLED)
   --  unsupported macro: DQUOT_LIMITS_ENABLED (1 << _DQUOT_LIMITS_ENABLED)
   --  unsupported macro: DQUOT_SUSPENDED (1 << _DQUOT_SUSPENDED)
   --  unsupported macro: DQUOT_STATE_FLAGS (DQUOT_USAGE_ENABLED | DQUOT_LIMITS_ENABLED | DQUOT_SUSPENDED)
   --  unsupported macro: DQUOT_STATE_LAST (_DQUOT_STATE_FLAGS * MAXQUOTAS)
   --  unsupported macro: DQUOT_QUOTA_SYS_FILE (1 << DQUOT_STATE_LAST)
   --  unsupported macro: DQUOT_NEGATIVE_USAGE (1 << (DQUOT_STATE_LAST + 1))
   --  unsupported macro: INIT_QUOTA_MODULE_NAMES { {QFMT_VFS_OLD, "quota_v1"}, {QFMT_VFS_V0, "quota_v2"}, {QFMT_VFS_V1, "quota_v2"}, {0, NULL}}
  -- * Copyright (c) 1982, 1986 Regents of the University of California.
  -- * All rights reserved.
  -- *
  -- * This code is derived from software contributed to Berkeley by
  -- * Robert Elz at The University of Melbourne.
  -- *
  -- * Redistribution and use in source and binary forms, with or without
  -- * modification, are permitted provided that the following conditions
  -- * are met:
  -- * 1. Redistributions of source code must retain the above copyright
  -- *    notice, this list of conditions and the following disclaimer.
  -- * 2. Redistributions in binary form must reproduce the above copyright
  -- *    notice, this list of conditions and the following disclaimer in the
  -- *    documentation and/or other materials provided with the distribution.
  -- * 3. Neither the name of the University nor the names of its contributors
  -- *    may be used to endorse or promote products derived from this software
  -- *    without specific prior written permission.
  -- *
  -- * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
  -- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  -- * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
  -- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  -- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  -- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  -- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  -- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  -- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  -- * SUCH DAMAGE.
  --  

   type quota_type is 
     (USRQUOTA,
      GRPQUOTA,
      PRJQUOTA);
   pragma Convention (C, quota_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:53

  -- element used for user quotas  
  -- element used for group quotas  
  -- element used for project quotas  
  -- Type in which we store ids in memory  
   subtype qid_t is uapi_asm_generic_posix_types_h.uu_kernel_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:59

  -- Type in which we store sizes  
   subtype qsize_t is Long_Long_Integer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:60

  -- Type in which we store the quota identifier  
   type anon_192 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:64
         when 1 =>
            gid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:65
         when others =>
            projid : aliased linux_projid_h.kprojid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:66
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_192);
   pragma Unchecked_Union (anon_192);
   type kqid is record
      parent : aliased anon_192;
      c_type : aliased quota_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:68
   end record;
   pragma Convention (C_Pass_By_Copy, kqid);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:62

  -- USRQUOTA (uid) or GRPQUOTA (gid) or PRJQUOTA (projid)  
   function qid_eq (left : kqid; right : kqid) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:71
   pragma Import (CPP, qid_eq, "_Z6qid_eq4kqidS_");

   function qid_lt (left : kqid; right : kqid) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:72
   pragma Import (CPP, qid_lt, "_Z6qid_lt4kqidS_");

   function from_kqid (to : System.Address; qid : kqid) return qid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:73
   pragma Import (CPP, from_kqid, "_Z9from_kqidP14user_namespace4kqid");

   function from_kqid_munged (to : System.Address; qid : kqid) return qid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:74
   pragma Import (CPP, from_kqid_munged, "_Z16from_kqid_mungedP14user_namespace4kqid");

   function qid_valid (qid : kqid) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:75
   pragma Import (CPP, qid_valid, "_Z9qid_valid4kqid");

  --*
  -- *	make_kqid - Map a user-namespace, type, qid tuple into a kqid.
  -- *	@from: User namespace that the qid is in
  -- *	@type: The type of quota
  -- *	@qid: Quota identifier
  -- *
  -- *	Maps a user-namespace, type qid tuple into a kernel internal
  -- *	kqid, and returns that kqid.
  -- *
  -- *	When there is no mapping defined for the user-namespace, type,
  -- *	qid tuple an invalid kqid is returned.  Callers are expected to
  -- *	test for and handle handle invalid kqids being returned.
  -- *	Invalid kqids may be tested for using qid_valid().
  --  

   function make_kqid
     (from : System.Address;
      c_type : quota_type;
      qid : qid_t) return kqid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:91
   pragma Import (CPP, make_kqid, "_ZL9make_kqidP14user_namespace10quota_typej");

  --*
  -- *	make_kqid_invalid - Explicitly make an invalid kqid
  -- *	@type: The type of quota identifier
  -- *
  -- *	Returns an invalid kqid with the specified type.
  --  

   function make_kqid_invalid (c_type : quota_type) return kqid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:119
   pragma Import (CPP, make_kqid_invalid, "_ZL17make_kqid_invalid10quota_type");

  --*
  -- *	make_kqid_uid - Make a kqid from a kuid
  -- *	@uid: The kuid to make the quota identifier from
  --  

   function make_kqid_uid (uid : linux_uidgid_h.kuid_t) return kqid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:144
   pragma Import (CPP, make_kqid_uid, "_ZL13make_kqid_uid6kuid_t");

  --*
  -- *	make_kqid_gid - Make a kqid from a kgid
  -- *	@gid: The kgid to make the quota identifier from
  --  

   function make_kqid_gid (gid : linux_uidgid_h.kgid_t) return kqid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:156
   pragma Import (CPP, make_kqid_gid, "_ZL13make_kqid_gid6kgid_t");

  --*
  -- *	make_kqid_projid - Make a kqid from a projid
  -- *	@projid: The kprojid to make the quota identifier from
  --  

   function make_kqid_projid (projid : linux_projid_h.kprojid_t) return kqid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:168
   pragma Import (CPP, make_kqid_projid, "_ZL16make_kqid_projid9kprojid_t");

   dq_data_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:177
   pragma Import (C, dq_data_lock, "dq_data_lock");

  -- Maximal numbers of writes for quota operation (insert/delete/update)
  -- * (over VFS all formats)  

  -- * Data for one user/group kept in memory
  --  

  -- absolute limit on disk blks alloc  
   type mem_dqblk is record
      dqb_bhardlimit : aliased qsize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:190
      dqb_bsoftlimit : aliased qsize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:191
      dqb_curspace : aliased qsize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:192
      dqb_rsvspace : aliased qsize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:193
      dqb_ihardlimit : aliased qsize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:194
      dqb_isoftlimit : aliased qsize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:195
      dqb_curinodes : aliased qsize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:196
      dqb_btime : aliased linux_types_h.time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:197
      dqb_itime : aliased linux_types_h.time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:198
   end record;
   pragma Convention (C_Pass_By_Copy, mem_dqblk);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:189

  -- preferred limit on disk blks  
  -- current used space  
  -- current reserved space for delalloc 
  -- absolute limit on allocated inodes  
  -- preferred inode limit  
  -- current # allocated inodes  
  -- time limit for excessive disk use  
  -- time limit for excessive inode use  
  -- * Data for one quotafile kept in memory
  --  

   type quota_format_type;
   type mem_dqinfo is record
      dqi_format : access quota_format_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:207
      dqi_fmt_id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:208
      dqi_dirty_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:210
      dqi_flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:211
      dqi_bgrace : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:212
      dqi_igrace : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:213
      dqi_maxblimit : aliased qsize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:214
      dqi_maxilimit : aliased qsize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:215
      dqi_priv : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:216
   end record;
   pragma Convention (C_Pass_By_Copy, mem_dqinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:206

  -- Id of the dqi_format - used when turning
  --				 * quotas on after remount RW  

  -- List of dirty dquots  
   procedure mark_info_dirty (sb : access linux_fs_h.super_block; c_type : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:229
   pragma Import (CPP, mark_info_dirty, "_Z15mark_info_dirtyP11super_blocki");

   function info_dirty (info : access mem_dqinfo) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:230
   pragma Import (CPP, info_dirty, "_ZL10info_dirtyP10mem_dqinfo");

   type dqstats_stat_array is array (0 .. 7) of aliased int;
   type dqstats_counter_array is array (0 .. 7) of aliased linux_percpu_counter_h.percpu_counter;
   type dqstats is record
      stat : aliased dqstats_stat_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:248
      counter : aliased dqstats_counter_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:249
   end record;
   pragma Convention (C_Pass_By_Copy, dqstats);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:247

   dqstats_pcpu : access dqstats;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:252
   pragma Import (C, dqstats_pcpu, "dqstats_pcpu");

   dqstats : aliased dqstats;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:253
   pragma Import (C, dqstats, "dqstats");

   procedure dqstats_inc (c_type : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:255
   pragma Import (CPP, dqstats_inc, "_ZL11dqstats_incj");

   procedure dqstats_dec (c_type : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:260
   pragma Import (CPP, dqstats_dec, "_ZL11dqstats_decj");

  -- Hash list in memory  
   type dquot is record
      dq_hash : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:278
      dq_inuse : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:279
      dq_free : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:280
      dq_dirty : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:281
      dq_lock : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:282
      dq_count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:283
      dq_wait_unused : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:284
      dq_sb : access linux_fs_h.super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:285
      dq_id : aliased kqid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:286
      dq_off : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:287
      dq_flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:288
      dq_dqb : aliased mem_dqblk;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:289
   end record;
   pragma Convention (C_Pass_By_Copy, dquot);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:277

  -- List of all quotas  
  -- Free list element  
  -- List of dirty dquots  
  -- dquot IO lock  
  -- Use count  
  -- Wait queue for dquot to become unused  
  -- superblock this applies to  
  -- ID this applies to (uid, gid, projid)  
  -- Offset of dquot on disk  
  -- See DQ_*  
  -- Diskquota usage  
  -- Operations which must be implemented by each quota format  
  -- Detect whether file is in our format  
   type quota_format_ops is record
      check_quota_file : access function (arg1 : access linux_fs_h.super_block; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:294
      read_file_info : access function (arg1 : access linux_fs_h.super_block; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:295
      write_file_info : access function (arg1 : access linux_fs_h.super_block; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:296
      free_file_info : access function (arg1 : access linux_fs_h.super_block; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:297
      read_dqblk : access function (arg1 : access dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:298
      commit_dqblk : access function (arg1 : access dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:299
      release_dqblk : access function (arg1 : access dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:300
   end record;
   pragma Convention (C_Pass_By_Copy, quota_format_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:293

  -- Read main info about file - called on quotaon()  
  -- Write main info about file  
  -- Called on quotaoff()  
  -- Read structure for one user  
  -- Write structure for one user  
  -- Called when last reference to dquot is being dropped  
  -- Operations working with dquots  
  -- Ordinary dquot write  
   type dquot_operations is record
      write_dquot : access function (arg1 : access dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:305
      alloc_dquot : access function (arg1 : access linux_fs_h.super_block; arg2 : int) return access dquot;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:306
      destroy_dquot : access procedure (arg1 : access dquot);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:307
      acquire_dquot : access function (arg1 : access dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:308
      release_dquot : access function (arg1 : access dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:309
      mark_dirty : access function (arg1 : access dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:310
      write_info : access function (arg1 : access linux_fs_h.super_block; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:311
      get_reserved_space : access function (arg1 : access linux_fs_h.inode) return access qsize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:314
   end record;
   pragma Convention (C_Pass_By_Copy, dquot_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:304

  -- Allocate memory for new dquot  
  -- Free memory for dquot  
  -- Quota is going to be created on disk  
  -- Quota is going to be deleted from disk  
  -- Dquot is marked dirty  
  -- Write of quota "superblock"  
  -- get reserved quota for delayed alloc, value returned is managed by
  --	 * quota code only  

  -- Operations handling requests from userspace  
   type quotactl_ops is record
      quota_on : access function
           (arg1 : access linux_fs_h.super_block;
            arg2 : int;
            arg3 : int;
            arg4 : access linux_path_h.path) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:321
      quota_on_meta : access function
           (arg1 : access linux_fs_h.super_block;
            arg2 : int;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:322
      quota_off : access function (arg1 : access linux_fs_h.super_block; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:323
      quota_sync : access function (arg1 : access linux_fs_h.super_block; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:324
      get_info : access function
           (arg1 : access linux_fs_h.super_block;
            arg2 : int;
            arg3 : access uapi_linux_quota_h.if_dqinfo) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:325
      set_info : access function
           (arg1 : access linux_fs_h.super_block;
            arg2 : int;
            arg3 : access uapi_linux_quota_h.if_dqinfo) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:326
      get_dqblk : access function
           (arg1 : access linux_fs_h.super_block;
            arg2 : kqid;
            arg3 : access uapi_linux_dqblk_xfs_h.fs_disk_quota) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:327
      set_dqblk : access function
           (arg1 : access linux_fs_h.super_block;
            arg2 : kqid;
            arg3 : access uapi_linux_dqblk_xfs_h.fs_disk_quota) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:328
      get_xstate : access function (arg1 : access linux_fs_h.super_block; arg2 : access uapi_linux_dqblk_xfs_h.fs_quota_stat) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:329
      set_xstate : access function
           (arg1 : access linux_fs_h.super_block;
            arg2 : unsigned;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:330
      get_xstatev : access function (arg1 : access linux_fs_h.super_block; arg2 : access uapi_linux_dqblk_xfs_h.fs_quota_statv) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:331
      rm_xquota : access function (arg1 : access linux_fs_h.super_block; arg2 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:332
   end record;
   pragma Convention (C_Pass_By_Copy, quotactl_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:320

  -- Quota format id  
   type quota_format_type is record
      qf_fmt_id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:336
      qf_ops : access constant quota_format_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:337
      qf_owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:338
      qf_next : access quota_format_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:339
   end record;
   pragma Convention (C_Pass_By_Copy, quota_format_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:335

  -- Operations of format  
  -- Module implementing quota format  
  -- Quota state flags - they actually come in two flavors - for users and groups  
  -- Track disk usage for users  
  -- Enforce quota limits for users  
  -- User diskquotas are off, but
  --						 * we have necessary info in
  --						 * memory to turn them on  

  -- Other quota flags  
  -- Quota file is a special
  --						 * system file and user cannot
  --						 * touch it. Filesystem is
  --						 * responsible for setting
  --						 * S_NOQUOTA, S_NOATIME flags
  --						  

  -- Allow negative quota usage  
   function dquot_state_flag (flags : unsigned; c_type : int) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:368
   pragma Import (CPP, dquot_state_flag, "_ZL16dquot_state_flagji");

   function dquot_generic_flag (flags : unsigned; c_type : int) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:373
   pragma Import (CPP, dquot_generic_flag, "_ZL18dquot_generic_flagji");

   procedure quota_send_warning
     (qid : kqid;
      dev : linux_types_h.dev_t;
      warntype : char);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:379
   pragma Import (CPP, quota_send_warning, "_Z18quota_send_warning4kqidjc");

  -- Flags for diskquotas on this device  
   type quota_info_files_array is array (0 .. 1) of access linux_fs_h.inode;
   type quota_info_info_array is array (0 .. 1) of aliased mem_dqinfo;
   type quota_info_ops_array is array (0 .. 1) of access constant quota_format_ops;
   type quota_info is record
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:390
      dqio_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:391
      dqonoff_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:392
      dqptr_sem : aliased linux_rwsem_h.rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:393
      files : aliased quota_info_files_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:394
      info : aliased quota_info_info_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:395
      ops : aliased quota_info_ops_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:396
   end record;
   pragma Convention (C_Pass_By_Copy, quota_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:389

  -- lock device while I/O in progress  
  -- Serialize quotaon & quotaoff  
  -- serialize ops using quota_info struct, pointers from inode to dquots  
  -- inodes of quotafiles  
  -- Information for each quota type  
  -- Operations for each type  
   function register_quota_format (fmt : access quota_format_type) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:399
   pragma Import (CPP, register_quota_format, "_Z21register_quota_formatP17quota_format_type");

   procedure unregister_quota_format (fmt : access quota_format_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:400
   pragma Import (CPP, unregister_quota_format, "_Z23unregister_quota_formatP17quota_format_type");

   type quota_module_name is record
      qm_fmt_id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:403
      qm_mod_name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:404
   end record;
   pragma Convention (C_Pass_By_Copy, quota_module_name);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/quota.h:402

end linux_quota_h;

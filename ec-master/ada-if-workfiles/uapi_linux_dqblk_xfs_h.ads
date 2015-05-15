pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_dqblk_xfs_h is

   --  arg-macro: function XQM_CMD (('X'<<8)+(x)
   --    return ('X'<<8)+(x);
   --  arg-macro: function XQM_COMMAND (((x) and (0xff<<8)) = ('X'<<8)
   --    return ((x) and (0xff<<8)) = ('X'<<8);
   --  unsupported macro: XQM_USRQUOTA 0
   --  unsupported macro: XQM_GRPQUOTA 1
   --  unsupported macro: XQM_PRJQUOTA 2
   --  unsupported macro: XQM_MAXQUOTAS 3
   --  unsupported macro: Q_XQUOTAON XQM_CMD(1)
   --  unsupported macro: Q_XQUOTAOFF XQM_CMD(2)
   --  unsupported macro: Q_XGETQUOTA XQM_CMD(3)
   --  unsupported macro: Q_XSETQLIM XQM_CMD(4)
   --  unsupported macro: Q_XGETQSTAT XQM_CMD(5)
   --  unsupported macro: Q_XQUOTARM XQM_CMD(6)
   --  unsupported macro: Q_XQUOTASYNC XQM_CMD(7)
   --  unsupported macro: Q_XGETQSTATV XQM_CMD(8)
   --  unsupported macro: FS_DQUOT_VERSION 1
   --  unsupported macro: FS_DQ_ISOFT (1<<0)
   --  unsupported macro: FS_DQ_IHARD (1<<1)
   --  unsupported macro: FS_DQ_BSOFT (1<<2)
   --  unsupported macro: FS_DQ_BHARD (1<<3)
   --  unsupported macro: FS_DQ_RTBSOFT (1<<4)
   --  unsupported macro: FS_DQ_RTBHARD (1<<5)
   --  unsupported macro: FS_DQ_LIMIT_MASK (FS_DQ_ISOFT | FS_DQ_IHARD | FS_DQ_BSOFT | FS_DQ_BHARD | FS_DQ_RTBSOFT | FS_DQ_RTBHARD)
   --  unsupported macro: FS_DQ_BTIMER (1<<6)
   --  unsupported macro: FS_DQ_ITIMER (1<<7)
   --  unsupported macro: FS_DQ_RTBTIMER (1<<8)
   --  unsupported macro: FS_DQ_TIMER_MASK (FS_DQ_BTIMER | FS_DQ_ITIMER | FS_DQ_RTBTIMER)
   --  unsupported macro: FS_DQ_BWARNS (1<<9)
   --  unsupported macro: FS_DQ_IWARNS (1<<10)
   --  unsupported macro: FS_DQ_RTBWARNS (1<<11)
   --  unsupported macro: FS_DQ_WARNS_MASK (FS_DQ_BWARNS | FS_DQ_IWARNS | FS_DQ_RTBWARNS)
   --  unsupported macro: FS_DQ_BCOUNT (1<<12)
   --  unsupported macro: FS_DQ_ICOUNT (1<<13)
   --  unsupported macro: FS_DQ_RTBCOUNT (1<<14)
   --  unsupported macro: FS_DQ_ACCT_MASK (FS_DQ_BCOUNT | FS_DQ_ICOUNT | FS_DQ_RTBCOUNT)
   --  unsupported macro: FS_QUOTA_UDQ_ACCT (1<<0)
   --  unsupported macro: FS_QUOTA_UDQ_ENFD (1<<1)
   --  unsupported macro: FS_QUOTA_GDQ_ACCT (1<<2)
   --  unsupported macro: FS_QUOTA_GDQ_ENFD (1<<3)
   --  unsupported macro: FS_QUOTA_PDQ_ACCT (1<<4)
   --  unsupported macro: FS_QUOTA_PDQ_ENFD (1<<5)
   --  unsupported macro: FS_USER_QUOTA (1<<0)
   --  unsupported macro: FS_PROJ_QUOTA (1<<1)
   --  unsupported macro: FS_GROUP_QUOTA (1<<2)
   --  unsupported macro: FS_QSTAT_VERSION 1
   --  unsupported macro: FS_QSTATV_VERSION1 1
  -- * Copyright (c) 1995-2001,2004 Silicon Graphics, Inc.  All Rights Reserved.
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU Lesser General Public License
  -- * as published by the Free Software Foundation.
  -- *
  -- * This program is distributed in the hope that it will be useful,
  -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- * GNU Lesser General Public License for more details.
  -- *
  -- * You should have received a copy of the GNU Lesset General Public License
  -- * along with this program; if not, write to the Free Software Foundation,
  -- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  --  

  -- * Disk quota - quotactl(2) commands for the XFS Quota Manager (XQM).
  --  

  -- * fs_disk_quota structure:
  -- *
  -- * This contains the current quota information regarding a user/proj/group.
  -- * It is 64-bit aligned, and all the blk units are in BBs (Basic Blocks) of
  -- * 512 bytes.
  --  

  -- version of this structure  
   subtype fs_disk_quota_d_padding4_array is Interfaces.C.char_array (0 .. 7);
   type fs_disk_quota is record
      d_version : aliased uapi_asm_generic_int_ll64_h.uu_s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:52
      d_flags : aliased uapi_asm_generic_int_ll64_h.uu_s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:53
      d_fieldmask : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:54
      d_id : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:55
      d_blk_hardlimit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:56
      d_blk_softlimit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:57
      d_ino_hardlimit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:58
      d_ino_softlimit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:59
      d_bcount : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:60
      d_icount : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:61
      d_itimer : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:62
      d_btimer : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:64
      d_iwarns : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:65
      d_bwarns : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:66
      d_padding2 : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:67
      d_rtb_hardlimit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:68
      d_rtb_softlimit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:69
      d_rtbcount : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:70
      d_rtbtimer : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:71
      d_rtbwarns : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:72
      d_padding3 : aliased uapi_asm_generic_int_ll64_h.uu_s16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:73
      d_padding4 : aliased fs_disk_quota_d_padding4_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:74
   end record;
   pragma Convention (C_Pass_By_Copy, fs_disk_quota);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:51

  -- FS_{USER,PROJ,GROUP}_QUOTA  
  -- field specifier  
  -- user, project, or group ID  
  -- absolute limit on disk blks  
  -- preferred limit on disk blks  
  -- maximum # allocated inodes  
  -- preferred inode limit  
  -- # disk blocks owned by the user  
  -- # inodes owned by the user  
  -- zero if within inode limits  
  -- if not, we refuse service  
  -- similar to above; for disk blocks  
  -- # warnings issued wrt num inodes  
  -- # warnings issued wrt disk blocks  
  -- padding2 - for future use  
  -- absolute limit on realtime blks  
  -- preferred limit on RT disk blks  
  -- # realtime blocks owned  
  -- similar to above; for RT disk blks  
  -- # warnings issued wrt RT disk blks  
  -- padding3 - for future use  
  -- yet more padding  
   subtype fs_disk_quota_t is fs_disk_quota;

  -- * These fields are sent to Q_XSETQLIM to specify fields that need to change.
  --  

  -- * These timers can only be set in super user's dquot. For others, timers are
  -- * automatically started and stopped. Superusers timer values set the limits
  -- * for the rest.  In case these values are zero, the DQ_{F,B}TIMELIMIT values
  -- * defined below are used. 
  -- * These values also apply only to the d_fieldmask field for Q_XSETQLIM.
  --  

  -- * Warning counts are set in both super user's dquot and others. For others,
  -- * warnings are set/cleared by the administrators (or automatically by going
  -- * below the soft limit).  Superusers warning values set the warning limits
  -- * for the rest.  In case these values are zero, the DQ_{F,B}WARNLIMIT values
  -- * defined below are used. 
  -- * These values also apply only to the d_fieldmask field for Q_XSETQLIM.
  --  

  -- * Accounting values.  These can only be set for filesystem with
  -- * non-transactional quotas that require quotacheck(8) in userspace.
  --  

  -- * Various flags related to quotactl(2).
  --  

  -- * fs_quota_stat is the struct returned in Q_XGETQSTAT for a given file system.
  -- * Provides a centralized way to get meta information about the quota subsystem.
  -- * eg. space taken up for user and group quotas, number of dquots currently
  -- * incore.
  --  

  -- * Some basic information about 'quota files'.
  --  

  -- inode number  
   type fs_qfilestat is record
      qfs_ino : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:148
      qfs_nblks : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:149
      qfs_nextents : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:150
   end record;
   pragma Convention (C_Pass_By_Copy, fs_qfilestat);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:147

  -- number of BBs 512-byte-blks  
  -- number of extents  
   subtype fs_qfilestat_t is fs_qfilestat;

  -- version number for future changes  
   type fs_quota_stat is record
      qs_version : aliased uapi_asm_generic_int_ll64_h.uu_s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:154
      qs_flags : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:155
      qs_pad : aliased uapi_asm_generic_int_ll64_h.uu_s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:156
      qs_uquota : aliased fs_qfilestat_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:157
      qs_gquota : aliased fs_qfilestat_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:158
      qs_incoredqs : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:159
      qs_btimelimit : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:160
      qs_itimelimit : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:161
      qs_rtbtimelimit : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:162
      qs_bwarnlimit : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:163
      qs_iwarnlimit : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:164
   end record;
   pragma Convention (C_Pass_By_Copy, fs_quota_stat);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:153

  -- FS_QUOTA_{U,P,G}DQ_{ACCT,ENFD}  
  -- unused  
  -- user quota storage information  
  -- group quota storage information  
  -- number of dquots incore  
  -- limit for blks timer  
  -- limit for inodes timer  
  -- limit for rt blks timer  
  -- limit for num warnings  
  -- limit for num warnings  
   subtype fs_quota_stat_t is fs_quota_stat;

  -- * fs_quota_statv is used by Q_XGETQSTATV for a given file system. It provides
  -- * a centralized way to get meta information about the quota subsystem. eg.
  -- * space taken up for user, group, and project quotas, number of dquots
  -- * currently incore.
  -- *
  -- * This version has proper versioning support with appropriate padding for
  -- * future expansions, and ability to expand for future without creating any
  -- * backward compatibility issues.
  -- *
  -- * Q_XGETQSTATV uses the passed in value of the requested version via
  -- * fs_quota_statv.qs_version to determine the return data layout of
  -- * fs_quota_statv.  The kernel will fill the data fields relevant to that
  -- * version.
  -- *
  -- * If kernel does not support user space caller specified version, EINVAL will
  -- * be returned. User space caller can then reduce the version number and retry
  -- * the same command.
  --  

  -- * Some basic information about 'quota files' for Q_XGETQSTATV command
  --  

  -- inode number  
   type fs_qfilestatv is record
      qfs_ino : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:191
      qfs_nblks : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:192
      qfs_nextents : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:193
      qfs_pad : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:194
   end record;
   pragma Convention (C_Pass_By_Copy, fs_qfilestatv);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:190

  -- number of BBs 512-byte-blks  
  -- number of extents  
  -- pad for 8-byte alignment  
  -- version for future changes  
   type fs_quota_statv_qs_pad2_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u64;
   type fs_quota_statv is record
      qs_version : aliased uapi_asm_generic_int_ll64_h.uu_s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:198
      qs_pad1 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:199
      qs_flags : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:200
      qs_incoredqs : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:201
      qs_uquota : aliased fs_qfilestatv;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:202
      qs_gquota : aliased fs_qfilestatv;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:203
      qs_pquota : aliased fs_qfilestatv;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:204
      qs_btimelimit : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:205
      qs_itimelimit : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:206
      qs_rtbtimelimit : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:207
      qs_bwarnlimit : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:208
      qs_iwarnlimit : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:209
      qs_pad2 : aliased fs_quota_statv_qs_pad2_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:210
   end record;
   pragma Convention (C_Pass_By_Copy, fs_quota_statv);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dqblk_xfs.h:197

  -- pad for 16bit alignment  
  -- FS_QUOTA_.* flags  
  -- number of dquots incore  
  -- user quota information  
  -- group quota information  
  -- project quota information  
  -- limit for blks timer  
  -- limit for inodes timer  
  -- limit for rt blks timer  
  -- limit for num warnings  
  -- limit for num warnings  
  -- for future proofing  
end uapi_linux_dqblk_xfs_h;

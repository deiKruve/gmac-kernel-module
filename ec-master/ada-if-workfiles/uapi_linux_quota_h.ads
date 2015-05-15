pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_quota_h is

   --  unsupported macro: MAXQUOTAS 2
   --  unsupported macro: INITQFNAMES { "user", "group", "undefined", };
   --  unsupported macro: SUBCMDMASK 0x00ff
   --  unsupported macro: SUBCMDSHIFT 8
   --  arg-macro: function QCMD (((cmd) << SUBCMDSHIFT) or ((type) and SUBCMDMASK)
   --    return ((cmd) << SUBCMDSHIFT) or ((type) and SUBCMDMASK);
   --  unsupported macro: Q_SYNC 0x800001
   --  unsupported macro: Q_QUOTAON 0x800002
   --  unsupported macro: Q_QUOTAOFF 0x800003
   --  unsupported macro: Q_GETFMT 0x800004
   --  unsupported macro: Q_GETINFO 0x800005
   --  unsupported macro: Q_SETINFO 0x800006
   --  unsupported macro: Q_GETQUOTA 0x800007
   --  unsupported macro: Q_SETQUOTA 0x800008
   --  unsupported macro: QFMT_VFS_OLD 1
   --  unsupported macro: QFMT_VFS_V0 2
   --  unsupported macro: QFMT_OCFS2 3
   --  unsupported macro: QFMT_VFS_V1 4
   --  unsupported macro: QIF_DQBLKSIZE_BITS 10
   --  unsupported macro: QIF_DQBLKSIZE (1 << QIF_DQBLKSIZE_BITS)
   --  unsupported macro: QIF_BLIMITS (1 << QIF_BLIMITS_B)
   --  unsupported macro: QIF_SPACE (1 << QIF_SPACE_B)
   --  unsupported macro: QIF_ILIMITS (1 << QIF_ILIMITS_B)
   --  unsupported macro: QIF_INODES (1 << QIF_INODES_B)
   --  unsupported macro: QIF_BTIME (1 << QIF_BTIME_B)
   --  unsupported macro: QIF_ITIME (1 << QIF_ITIME_B)
   --  unsupported macro: QIF_LIMITS (QIF_BLIMITS | QIF_ILIMITS)
   --  unsupported macro: QIF_USAGE (QIF_SPACE | QIF_INODES)
   --  unsupported macro: QIF_TIMES (QIF_BTIME | QIF_ITIME)
   --  unsupported macro: QIF_ALL (QIF_LIMITS | QIF_USAGE | QIF_TIMES)
   --  unsupported macro: IIF_BGRACE 1
   --  unsupported macro: IIF_IGRACE 2
   --  unsupported macro: IIF_FLAGS 4
   --  unsupported macro: IIF_ALL (IIF_BGRACE | IIF_IGRACE | IIF_FLAGS)
   --  unsupported macro: QUOTA_NL_NOWARN 0
   --  unsupported macro: QUOTA_NL_IHARDWARN 1
   --  unsupported macro: QUOTA_NL_ISOFTLONGWARN 2
   --  unsupported macro: QUOTA_NL_ISOFTWARN 3
   --  unsupported macro: QUOTA_NL_BHARDWARN 4
   --  unsupported macro: QUOTA_NL_BSOFTLONGWARN 5
   --  unsupported macro: QUOTA_NL_BSOFTWARN 6
   --  unsupported macro: QUOTA_NL_IHARDBELOW 7
   --  unsupported macro: QUOTA_NL_ISOFTBELOW 8
   --  unsupported macro: QUOTA_NL_BHARDBELOW 9
   --  unsupported macro: QUOTA_NL_BSOFTBELOW 10
   --  unsupported macro: QUOTA_NL_C_MAX (__QUOTA_NL_C_MAX - 1)
   --  unsupported macro: QUOTA_NL_A_MAX (__QUOTA_NL_A_MAX - 1)
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

  -- * Definitions for the default names of the quotas files.
  --  

  -- * Command definitions for the 'quotactl' system call.
  -- * The commands are broken into a main command defined below
  -- * and a subcommand that is used to convey the type of
  -- * quota that is being manipulated (see above).
  --  

  -- Quota format type IDs  
  -- Size of block in which space limits are passed through the quota
  -- * interface  

  -- * Quota structure used for communication with userspace via quotactl
  -- * Following flags are used to specify which fields are valid
  --  

   type if_dqblk is record
      dqb_bhardlimit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:109
      dqb_bsoftlimit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:110
      dqb_curspace : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:111
      dqb_ihardlimit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:112
      dqb_isoftlimit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:113
      dqb_curinodes : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:114
      dqb_btime : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:115
      dqb_itime : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:116
      dqb_valid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:117
   end record;
   pragma Convention (C_Pass_By_Copy, if_dqblk);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:108

  -- * Structure used for setting quota information about file via quotactl
  -- * Following flags are used to specify which fields are valid
  --  

   type if_dqinfo is record
      dqi_bgrace : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:130
      dqi_igrace : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:131
      dqi_flags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:132
      dqi_valid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:133
   end record;
   pragma Convention (C_Pass_By_Copy, if_dqinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/quota.h:129

  -- * Definitions for quota netlink interface
  --  

end uapi_linux_quota_h;

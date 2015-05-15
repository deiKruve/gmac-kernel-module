pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_fs_h is

   --  unsupported macro: INR_OPEN_CUR 1024
   --  unsupported macro: INR_OPEN_MAX 4096
   --  unsupported macro: BLOCK_SIZE_BITS 10
   --  unsupported macro: BLOCK_SIZE (1<<BLOCK_SIZE_BITS)
   --  unsupported macro: SEEK_SET 0
   --  unsupported macro: SEEK_CUR 1
   --  unsupported macro: SEEK_END 2
   --  unsupported macro: SEEK_DATA 3
   --  unsupported macro: SEEK_HOLE 4
   --  unsupported macro: SEEK_MAX SEEK_HOLE
   --  unsupported macro: RENAME_NOREPLACE (1 << 0)
   --  unsupported macro: RENAME_EXCHANGE (1 << 1)
   --  unsupported macro: NR_FILE 8192
   --  unsupported macro: MS_RDONLY 1
   --  unsupported macro: MS_NOSUID 2
   --  unsupported macro: MS_NODEV 4
   --  unsupported macro: MS_NOEXEC 8
   --  unsupported macro: MS_SYNCHRONOUS 16
   --  unsupported macro: MS_REMOUNT 32
   --  unsupported macro: MS_MANDLOCK 64
   --  unsupported macro: MS_DIRSYNC 128
   --  unsupported macro: MS_NOATIME 1024
   --  unsupported macro: MS_NODIRATIME 2048
   --  unsupported macro: MS_BIND 4096
   --  unsupported macro: MS_MOVE 8192
   --  unsupported macro: MS_REC 16384
   --  unsupported macro: MS_VERBOSE 32768
   --  unsupported macro: MS_SILENT 32768
   --  unsupported macro: MS_POSIXACL (1<<16)
   --  unsupported macro: MS_UNBINDABLE (1<<17)
   --  unsupported macro: MS_PRIVATE (1<<18)
   --  unsupported macro: MS_SLAVE (1<<19)
   --  unsupported macro: MS_SHARED (1<<20)
   --  unsupported macro: MS_RELATIME (1<<21)
   --  unsupported macro: MS_KERNMOUNT (1<<22)
   --  unsupported macro: MS_I_VERSION (1<<23)
   --  unsupported macro: MS_STRICTATIME (1<<24)
   --  unsupported macro: MS_NOSEC (1<<28)
   --  unsupported macro: MS_BORN (1<<29)
   --  unsupported macro: MS_ACTIVE (1<<30)
   --  unsupported macro: MS_NOUSER (1<<31)
   --  unsupported macro: MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_I_VERSION)
   --  unsupported macro: MS_MGC_VAL 0xC0ED0000
   --  unsupported macro: MS_MGC_MSK 0xffff0000
   --  unsupported macro: BLKROSET _IO(0x12,93)
   --  unsupported macro: BLKROGET _IO(0x12,94)
   --  unsupported macro: BLKRRPART _IO(0x12,95)
   --  unsupported macro: BLKGETSIZE _IO(0x12,96)
   --  unsupported macro: BLKFLSBUF _IO(0x12,97)
   --  unsupported macro: BLKRASET _IO(0x12,98)
   --  unsupported macro: BLKRAGET _IO(0x12,99)
   --  unsupported macro: BLKFRASET _IO(0x12,100)
   --  unsupported macro: BLKFRAGET _IO(0x12,101)
   --  unsupported macro: BLKSECTSET _IO(0x12,102)
   --  unsupported macro: BLKSECTGET _IO(0x12,103)
   --  unsupported macro: BLKSSZGET _IO(0x12,104)
   --  unsupported macro: BLKBSZGET _IOR(0x12,112,size_t)
   --  unsupported macro: BLKBSZSET _IOW(0x12,113,size_t)
   --  unsupported macro: BLKGETSIZE64 _IOR(0x12,114,size_t)
   --  unsupported macro: BLKTRACESETUP _IOWR(0x12,115,struct blk_user_trace_setup)
   --  unsupported macro: BLKTRACESTART _IO(0x12,116)
   --  unsupported macro: BLKTRACESTOP _IO(0x12,117)
   --  unsupported macro: BLKTRACETEARDOWN _IO(0x12,118)
   --  unsupported macro: BLKDISCARD _IO(0x12,119)
   --  unsupported macro: BLKIOMIN _IO(0x12,120)
   --  unsupported macro: BLKIOOPT _IO(0x12,121)
   --  unsupported macro: BLKALIGNOFF _IO(0x12,122)
   --  unsupported macro: BLKPBSZGET _IO(0x12,123)
   --  unsupported macro: BLKDISCARDZEROES _IO(0x12,124)
   --  unsupported macro: BLKSECDISCARD _IO(0x12,125)
   --  unsupported macro: BLKROTATIONAL _IO(0x12,126)
   --  unsupported macro: BLKZEROOUT _IO(0x12,127)
   --  unsupported macro: BMAP_IOCTL 1
   --  unsupported macro: FIBMAP _IO(0x00,1)
   --  unsupported macro: FIGETBSZ _IO(0x00,2)
   --  unsupported macro: FIFREEZE _IOWR('X', 119, int)
   --  unsupported macro: FITHAW _IOWR('X', 120, int)
   --  unsupported macro: FITRIM _IOWR('X', 121, struct fstrim_range)
   --  unsupported macro: FS_IOC_GETFLAGS _IOR('f', 1, long)
   --  unsupported macro: FS_IOC_SETFLAGS _IOW('f', 2, long)
   --  unsupported macro: FS_IOC_GETVERSION _IOR('v', 1, long)
   --  unsupported macro: FS_IOC_SETVERSION _IOW('v', 2, long)
   --  unsupported macro: FS_IOC_FIEMAP _IOWR('f', 11, struct fiemap)
   --  unsupported macro: FS_IOC32_GETFLAGS _IOR('f', 1, int)
   --  unsupported macro: FS_IOC32_SETFLAGS _IOW('f', 2, int)
   --  unsupported macro: FS_IOC32_GETVERSION _IOR('v', 1, int)
   --  unsupported macro: FS_IOC32_SETVERSION _IOW('v', 2, int)
   --  unsupported macro: FS_SECRM_FL 0x00000001
   --  unsupported macro: FS_UNRM_FL 0x00000002
   --  unsupported macro: FS_COMPR_FL 0x00000004
   --  unsupported macro: FS_SYNC_FL 0x00000008
   --  unsupported macro: FS_IMMUTABLE_FL 0x00000010
   --  unsupported macro: FS_APPEND_FL 0x00000020
   --  unsupported macro: FS_NODUMP_FL 0x00000040
   --  unsupported macro: FS_NOATIME_FL 0x00000080
   --  unsupported macro: FS_DIRTY_FL 0x00000100
   --  unsupported macro: FS_COMPRBLK_FL 0x00000200
   --  unsupported macro: FS_NOCOMP_FL 0x00000400
   --  unsupported macro: FS_ECOMPR_FL 0x00000800
   --  unsupported macro: FS_BTREE_FL 0x00001000
   --  unsupported macro: FS_INDEX_FL 0x00001000
   --  unsupported macro: FS_IMAGIC_FL 0x00002000
   --  unsupported macro: FS_JOURNAL_DATA_FL 0x00004000
   --  unsupported macro: FS_NOTAIL_FL 0x00008000
   --  unsupported macro: FS_DIRSYNC_FL 0x00010000
   --  unsupported macro: FS_TOPDIR_FL 0x00020000
   --  unsupported macro: FS_EXTENT_FL 0x00080000
   --  unsupported macro: FS_DIRECTIO_FL 0x00100000
   --  unsupported macro: FS_NOCOW_FL 0x00800000
   --  unsupported macro: FS_RESERVED_FL 0x80000000
   --  unsupported macro: FS_FL_USER_VISIBLE 0x0003DFFF
   --  unsupported macro: FS_FL_USER_MODIFIABLE 0x000380FF
   --  unsupported macro: SYNC_FILE_RANGE_WAIT_BEFORE 1
   --  unsupported macro: SYNC_FILE_RANGE_WRITE 2
   --  unsupported macro: SYNC_FILE_RANGE_WAIT_AFTER 4
  -- * This file has definitions for some important file table
  -- * structures etc.
  --  

  -- * It's silly to have NR_OPEN bigger than NR_FILE, but you can change
  -- * the file limit at runtime and only root can increase the per-process
  -- * nr_file rlimit, so it's safe to set up a ridiculously high absolute
  -- * upper limit on files-per-process.
  -- *
  -- * Some programs (notably those using select()) may have to be 
  -- * recompiled to take full advantage of the new limits..  
  --  

  -- Fixed constants first:  
   type fstrim_range is record
      start : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:42
      len : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:43
      minlen : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:44
   end record;
   pragma Convention (C_Pass_By_Copy, fstrim_range);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:41

  -- And dynamically-tunable limits and defaults:  
  -- read only  
   type files_stat_struct is record
      nr_files : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:49
      nr_free_files : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:50
      max_files : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:51
   end record;
   pragma Convention (C_Pass_By_Copy, files_stat_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:48

  -- read only  
  -- tunable  
   type inodes_stat_t_dummy_array is array (0 .. 4) of aliased long;
   type inodes_stat_t is record
      nr_inodes : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:55
      nr_unused : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:56
      dummy : aliased inodes_stat_t_dummy_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:57
   end record;
   pragma Convention (C_Pass_By_Copy, inodes_stat_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fs.h:54

  -- padding for sysctl ABI compatibility  
  -- * These are the fs-independent mount-flags: up to 32 flags are supported
  --  

  -- These sb flags are internal to the kernel  
  -- * Superblock flags that can be altered by MS_REMOUNT
  --  

  -- * Old magic mount flag and mask
  --  

  -- the read-only stuff doesn't really belong here, but any other place is
  --   probably as bad and I don't want to create yet another include file.  

  -- Some people are morons.  Do not use sizeof!  
  -- This was here just to show that the number is taken -
  --   probably all these _IO(0x12,*) ioctls should be moved to blkpg.h.  

  -- A jump here: 108-111 have been used for various private purposes.  
  -- * Inode flags (FS_IOC_GETFLAGS / FS_IOC_SETFLAGS)
  --  

  -- Reserved for compression usage...  
  -- End compression flags --- maybe not all used  
end uapi_linux_fs_h;

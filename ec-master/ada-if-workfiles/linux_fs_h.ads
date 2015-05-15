pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_fs_h;
with linux_types_h;
with linux_uidgid_h;
with uapi_linux_time_h;
with Interfaces.C.Strings;
with System;
limited with linux_mm_types_h;
limited with linux_uio_h;
with linux_migrate_mode_h;
with Interfaces.C.Extensions;
with linux_radix_tree_h;
with linux_spinlock_types_h;
with linux_rbtree_h;
with linux_mutex_h;
with asm_generic_int_ll64_h;
with uapi_asm_generic_int_ll64_h;
with linux_rwlock_types_h;
with linux_pid_h;
with linux_path_h;
with asm_generic_atomic_long_h;
limited with linux_cred_h;
limited with net_net_namespace_h;
with linux_nfs_fs_i_h;
with linux_wait_h;
limited with uapi_asm_generic_fcntl_h;
with linux_percpu_counter_h;
with linux_quota_h;
with linux_dcache_h;
with linux_rwsem_h;
with linux_list_bl_h;
with linux_shrinker_h;
with linux_list_lru_h;
limited with uapi_linux_fiemap_h;
limited with uapi_linux_uio_h;
limited with linux_seq_file_h;
limited with linux_stat_h;
with linux_lockdep_h;
limited with linux_kobject_h;
limited with linux_slab_def_h;
limited with linux_blk_types_h;
limited with linux_sysctl_h;

package linux_fs_h is

   --  unsupported macro: MAY_EXEC 0x00000001
   --  unsupported macro: MAY_WRITE 0x00000002
   --  unsupported macro: MAY_READ 0x00000004
   --  unsupported macro: MAY_APPEND 0x00000008
   --  unsupported macro: MAY_ACCESS 0x00000010
   --  unsupported macro: MAY_OPEN 0x00000020
   --  unsupported macro: MAY_CHDIR 0x00000040
   --  unsupported macro: MAY_NOT_BLOCK 0x00000080
   --  unsupported macro: FMODE_READ ((__force fmode_t)0x1)
   --  unsupported macro: FMODE_WRITE ((__force fmode_t)0x2)
   --  unsupported macro: FMODE_LSEEK ((__force fmode_t)0x4)
   --  unsupported macro: FMODE_PREAD ((__force fmode_t)0x8)
   --  unsupported macro: FMODE_PWRITE ((__force fmode_t)0x10)
   --  unsupported macro: FMODE_EXEC ((__force fmode_t)0x20)
   --  unsupported macro: FMODE_NDELAY ((__force fmode_t)0x40)
   --  unsupported macro: FMODE_EXCL ((__force fmode_t)0x80)
   --  unsupported macro: FMODE_WRITE_IOCTL ((__force fmode_t)0x100)
   --  unsupported macro: FMODE_32BITHASH ((__force fmode_t)0x200)
   --  unsupported macro: FMODE_64BITHASH ((__force fmode_t)0x400)
   --  unsupported macro: FMODE_NOCMTIME ((__force fmode_t)0x800)
   --  unsupported macro: FMODE_RANDOM ((__force fmode_t)0x1000)
   --  unsupported macro: FMODE_UNSIGNED_OFFSET ((__force fmode_t)0x2000)
   --  unsupported macro: FMODE_PATH ((__force fmode_t)0x4000)
   --  unsupported macro: FMODE_ATOMIC_POS ((__force fmode_t)0x8000)
   --  unsupported macro: FMODE_WRITER ((__force fmode_t)0x10000)
   --  unsupported macro: FMODE_CAN_READ ((__force fmode_t)0x20000)
   --  unsupported macro: FMODE_CAN_WRITE ((__force fmode_t)0x40000)
   --  unsupported macro: FMODE_NONOTIFY ((__force fmode_t)0x1000000)
   --  unsupported macro: CHECK_IOVEC_ONLY -1
   --  unsupported macro: RW_MASK REQ_WRITE
   --  unsupported macro: RWA_MASK REQ_RAHEAD
   --  unsupported macro: READ 0
   --  unsupported macro: WRITE RW_MASK
   --  unsupported macro: READA RWA_MASK
   --  unsupported macro: KERNEL_READ (READ|REQ_KERNEL)
   --  unsupported macro: KERNEL_WRITE (WRITE|REQ_KERNEL)
   --  unsupported macro: READ_SYNC (READ | REQ_SYNC)
   --  unsupported macro: WRITE_SYNC (WRITE | REQ_SYNC | REQ_NOIDLE)
   --  unsupported macro: WRITE_ODIRECT (WRITE | REQ_SYNC)
   --  unsupported macro: WRITE_FLUSH (WRITE | REQ_SYNC | REQ_NOIDLE | REQ_FLUSH)
   --  unsupported macro: WRITE_FUA (WRITE | REQ_SYNC | REQ_NOIDLE | REQ_FUA)
   --  unsupported macro: WRITE_FLUSH_FUA (WRITE | REQ_SYNC | REQ_NOIDLE | REQ_FLUSH | REQ_FUA)
   --  unsupported macro: ATTR_MODE (1 << 0)
   --  unsupported macro: ATTR_UID (1 << 1)
   --  unsupported macro: ATTR_GID (1 << 2)
   --  unsupported macro: ATTR_SIZE (1 << 3)
   --  unsupported macro: ATTR_ATIME (1 << 4)
   --  unsupported macro: ATTR_MTIME (1 << 5)
   --  unsupported macro: ATTR_CTIME (1 << 6)
   --  unsupported macro: ATTR_ATIME_SET (1 << 7)
   --  unsupported macro: ATTR_MTIME_SET (1 << 8)
   --  unsupported macro: ATTR_FORCE (1 << 9)
   --  unsupported macro: ATTR_ATTR_FLAG (1 << 10)
   --  unsupported macro: ATTR_KILL_SUID (1 << 11)
   --  unsupported macro: ATTR_KILL_SGID (1 << 12)
   --  unsupported macro: ATTR_FILE (1 << 13)
   --  unsupported macro: ATTR_KILL_PRIV (1 << 14)
   --  unsupported macro: ATTR_OPEN (1 << 15)
   --  unsupported macro: ATTR_TIMES_SET (1 << 16)
   --  unsupported macro: AOP_FLAG_UNINTERRUPTIBLE 0x0001
   --  unsupported macro: AOP_FLAG_CONT_EXPAND 0x0002
   --  unsupported macro: AOP_FLAG_NOFS 0x0004
   --  unsupported macro: PAGECACHE_TAG_DIRTY 0
   --  unsupported macro: PAGECACHE_TAG_WRITEBACK 1
   --  unsupported macro: PAGECACHE_TAG_TOWRITE 2
   --  arg-macro: procedure i_size_ordered_init do { } while (0)
   --    do { } while (0)
   --  unsupported macro: ACL_NOT_CACHED ((void *)(-1))
   --  unsupported macro: IOP_FASTPERM 0x0001
   --  unsupported macro: IOP_LOOKUP 0x0002
   --  unsupported macro: IOP_NOFOLLOW 0x0004
   --  unsupported macro: f_dentry f_path.dentry
   --  arg-macro: procedure fput_atomic atomic_long_add_unless(and(x).f_count, -1, 1)
   --    atomic_long_add_unless(and(x).f_count, -1, 1)
   --  arg-macro: procedure file_count atomic_long_read(and(x).f_count)
   --    atomic_long_read(and(x).f_count)
   --  unsupported macro: MAX_NON_LFS ((1UL<<31) - 1)
   --  unsupported macro: MAX_LFS_FILESIZE ((loff_t)0x7fffffffffffffffLL)
   --  unsupported macro: FL_POSIX 1
   --  unsupported macro: FL_FLOCK 2
   --  unsupported macro: FL_DELEG 4
   --  unsupported macro: FL_ACCESS 8
   --  unsupported macro: FL_EXISTS 16
   --  unsupported macro: FL_LEASE 32
   --  unsupported macro: FL_CLOSE 64
   --  unsupported macro: FL_SLEEP 128
   --  unsupported macro: FL_DOWNGRADE_PENDING 256
   --  unsupported macro: FL_UNLOCK_PENDING 512
   --  unsupported macro: FL_OFDLCK 1024
   --  unsupported macro: FILE_LOCK_DEFERRED 1
   --  arg-macro: function INT_LIMIT (~((x)1 << (sizeof(x)*8 - 1))
   --    return ~((x)1 << (sizeof(x)*8 - 1));
   --  unsupported macro: OFFSET_MAX INT_LIMIT(loff_t)
   --  unsupported macro: OFFT_OFFSET_MAX INT_LIMIT(off_t)
   --  unsupported macro: FASYNC_MAGIC 0x4601
   --  unsupported macro: MNT_FORCE 0x00000001
   --  unsupported macro: MNT_DETACH 0x00000002
   --  unsupported macro: MNT_EXPIRE 0x00000004
   --  unsupported macro: UMOUNT_NOFOLLOW 0x00000008
   --  unsupported macro: UMOUNT_UNUSED 0x80000000
   --  unsupported macro: SB_FREEZE_LEVELS (SB_FREEZE_COMPLETE - 1)
   --  unsupported macro: DT_UNKNOWN 0
   --  unsupported macro: DT_FIFO 1
   --  unsupported macro: DT_CHR 2
   --  unsupported macro: DT_DIR 4
   --  unsupported macro: DT_BLK 6
   --  unsupported macro: DT_REG 8
   --  unsupported macro: DT_LNK 10
   --  unsupported macro: DT_SOCK 12
   --  unsupported macro: DT_WHT 14
   --  unsupported macro: HAVE_COMPAT_IOCTL 1
   --  unsupported macro: HAVE_UNLOCKED_IOCTL 1
   --  unsupported macro: S_SYNC 1
   --  unsupported macro: S_NOATIME 2
   --  unsupported macro: S_APPEND 4
   --  unsupported macro: S_IMMUTABLE 8
   --  unsupported macro: S_DEAD 16
   --  unsupported macro: S_NOQUOTA 32
   --  unsupported macro: S_DIRSYNC 64
   --  unsupported macro: S_NOCMTIME 128
   --  unsupported macro: S_SWAPFILE 256
   --  unsupported macro: S_PRIVATE 512
   --  unsupported macro: S_IMA 1024
   --  unsupported macro: S_AUTOMOUNT 2048
   --  unsupported macro: S_NOSEC 4096
   --  arg-macro: function IS_RDONLY ((inode).i_sb.s_flags and MS_RDONLY
   --    return (inode).i_sb.s_flags and MS_RDONLY;
   --  arg-macro: function IS_SYNC (__IS_FLG(inode, MS_SYNCHRONOUS)  or else  ((inode).i_flags and S_SYNC)
   --    return __IS_FLG(inode, MS_SYNCHRONOUS)  or else  ((inode).i_flags and S_SYNC);
   --  arg-macro: function IS_DIRSYNC (__IS_FLG(inode, MS_SYNCHRONOUSorMS_DIRSYNC)  or else  ((inode).i_flags and (S_SYNCorS_DIRSYNC))
   --    return __IS_FLG(inode, MS_SYNCHRONOUSorMS_DIRSYNC)  or else  ((inode).i_flags and (S_SYNCorS_DIRSYNC));
   --  arg-macro: procedure IS_MANDLOCK __IS_FLG(inode, MS_MANDLOCK)
   --    __IS_FLG(inode, MS_MANDLOCK)
   --  arg-macro: procedure IS_NOATIME __IS_FLG(inode, MS_RDONLYorMS_NOATIME)
   --    __IS_FLG(inode, MS_RDONLYorMS_NOATIME)
   --  arg-macro: procedure IS_I_VERSION __IS_FLG(inode, MS_I_VERSION)
   --    __IS_FLG(inode, MS_I_VERSION)
   --  arg-macro: function IS_NOQUOTA ((inode).i_flags and S_NOQUOTA
   --    return (inode).i_flags and S_NOQUOTA;
   --  arg-macro: function IS_APPEND ((inode).i_flags and S_APPEND
   --    return (inode).i_flags and S_APPEND;
   --  arg-macro: function IS_IMMUTABLE ((inode).i_flags and S_IMMUTABLE
   --    return (inode).i_flags and S_IMMUTABLE;
   --  arg-macro: procedure IS_POSIXACL __IS_FLG(inode, MS_POSIXACL)
   --    __IS_FLG(inode, MS_POSIXACL)
   --  arg-macro: function IS_DEADDIR ((inode).i_flags and S_DEAD
   --    return (inode).i_flags and S_DEAD;
   --  arg-macro: function IS_NOCMTIME ((inode).i_flags and S_NOCMTIME
   --    return (inode).i_flags and S_NOCMTIME;
   --  arg-macro: function IS_SWAPFILE ((inode).i_flags and S_SWAPFILE
   --    return (inode).i_flags and S_SWAPFILE;
   --  arg-macro: function IS_PRIVATE ((inode).i_flags and S_PRIVATE
   --    return (inode).i_flags and S_PRIVATE;
   --  arg-macro: function IS_IMA ((inode).i_flags and S_IMA
   --    return (inode).i_flags and S_IMA;
   --  arg-macro: function IS_AUTOMOUNT ((inode).i_flags and S_AUTOMOUNT
   --    return (inode).i_flags and S_AUTOMOUNT;
   --  arg-macro: function IS_NOSEC ((inode).i_flags and S_NOSEC
   --    return (inode).i_flags and S_NOSEC;
   --  unsupported macro: I_DIRTY_SYNC (1 << 0)
   --  unsupported macro: I_DIRTY_DATASYNC (1 << 1)
   --  unsupported macro: I_DIRTY_PAGES (1 << 2)
   --  unsupported macro: I_NEW (1 << __I_NEW)
   --  unsupported macro: I_WILL_FREE (1 << 4)
   --  unsupported macro: I_FREEING (1 << 5)
   --  unsupported macro: I_CLEAR (1 << 6)
   --  unsupported macro: I_SYNC (1 << __I_SYNC)
   --  unsupported macro: I_REFERENCED (1 << 8)
   --  unsupported macro: I_DIO_WAKEUP (1 << I_DIO_WAKEUP)
   --  unsupported macro: I_LINKABLE (1 << 10)
   --  unsupported macro: I_DIRTY (I_DIRTY_SYNC | I_DIRTY_DATASYNC | I_DIRTY_PAGES)
   --  unsupported macro: FS_REQUIRES_DEV 1
   --  unsupported macro: FS_BINARY_MOUNTDATA 2
   --  unsupported macro: FS_HAS_SUBTYPE 4
   --  unsupported macro: FS_USERNS_MOUNT 8
   --  unsupported macro: FS_USERNS_DEV_MOUNT 16
   --  unsupported macro: FS_RENAME_DOES_D_MOVE 32768
   --  arg-macro: procedure MODULE_ALIAS_FS MODULE_ALIAS("fs-" NAME)
   --    MODULE_ALIAS("fs-" NAME)
   --  arg-macro: function fops_get (((fops)  and then  try_module_get((fops).owner) ? (fops) : NULL)
   --    return ((fops)  and then  try_module_get((fops).owner) ? (fops) : NULL);
   --  arg-macro: procedure fops_put do { if (fops) module_put((fops).owner); } while(0)
   --    do { if (fops) module_put((fops).owner); } while(0)
   --  arg-macro: procedure replace_fops do { struct file *__file := (f); fops_put(__file.f_op); BUG_ON(not(__file.f_op := (fops))); } while(0)
   --    do { struct file *__file := (f); fops_put(__file.f_op); BUG_ON(not(__file.f_op := (fops))); } while(0)
   --  arg-macro: procedure kern_mount kern_mount_data(type, NULL)
   --    kern_mount_data(type, NULL)
   --  unsupported macro: MAX_RW_COUNT (INT_MAX & PAGE_CACHE_MASK)
   --  unsupported macro: FLOCK_VERIFY_READ 1
   --  unsupported macro: FLOCK_VERIFY_WRITE 2
   --  unsupported macro: CHRDEV_MAJOR_HASH_SIZE 255
   --  unsupported macro: BDEVNAME_SIZE 32
   --  unsupported macro: BDEVT_SIZE 10
   --  unsupported macro: BLKDEV_MAJOR_HASH_SIZE 255
   --  arg-macro: function bio_rw ((bio).bi_rw and (RW_MASK or RWA_MASK)
   --    return (bio).bi_rw and (RW_MASK or RWA_MASK);
   --  arg-macro: function bio_data_dir ((bio).bi_rw and 1
   --    return (bio).bi_rw and 1;
   --  arg-macro: function special_file (S_ISCHR(m) or else S_ISBLK(m) or else S_ISFIFO(m) or else S_ISSOCK(m)
   --    return S_ISCHR(m) or else S_ISBLK(m) or else S_ISFIFO(m) or else S_ISSOCK(m);
   --  unsupported macro: SIMPLE_TRANSACTION_LIMIT (PAGE_SIZE - sizeof(struct simple_transaction_argresp))
   --  unsupported macro: DEFINE_SIMPLE_ATTRIBUTE(__fops,__get,__set,__fmt) static int __fops ## _open(struct inode *inode, struct file *file) { __simple_attr_check_format(__fmt, 0ull); return simple_attr_open(inode, file, __get, __set, __fmt); } static const struct file_operations __fops = { .owner = THIS_MODULE, .open = __fops ## _open, .release = simple_attr_release, .read = simple_attr_read, .write = simple_attr_write, .llseek = generic_file_llseek, };
   --  arg-macro: function ACC_MODE ("\004\002\006\006"((x)andO_ACCMODE)
   --    return "\004\002\006\006"((x)andO_ACCMODE);
   --  arg-macro: function OPEN_FMODE ((__force fmode_t)(((flag + 1) and O_ACCMODE) or (flag and __FMODE_NONOTIFY))
   --    return (__force fmode_t)(((flag + 1) and O_ACCMODE) or (flag and __FMODE_NONOTIFY));
   --  skipped empty struct export_operations

   --  skipped empty struct hd_geometry

   --  skipped empty struct kiocb

   --  skipped empty struct pipe_inode_info

   --  skipped empty struct poll_table_struct

   --  skipped empty struct kstatfs

   --  skipped empty struct swap_info_struct

   procedure inode_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:53
   pragma Import (CPP, inode_init, "_Z10inode_initv");

   procedure inode_init_early;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:54
   pragma Import (CPP, inode_init_early, "_Z16inode_init_earlyv");

   procedure files_init (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:55
   pragma Import (CPP, files_init, "_Z10files_initm");

   files_stat : aliased uapi_linux_fs_h.files_stat_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:57
   pragma Import (C, files_stat, "files_stat");

   function get_max_files return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:58
   pragma Import (CPP, get_max_files, "_Z13get_max_filesv");

   sysctl_nr_open : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:59
   pragma Import (C, sysctl_nr_open, "sysctl_nr_open");

   inodes_stat : aliased uapi_linux_fs_h.inodes_stat_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:60
   pragma Import (C, inodes_stat, "inodes_stat");

   leases_enable : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:61
   pragma Import (C, leases_enable, "leases_enable");

   lease_break_time : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:61
   pragma Import (C, lease_break_time, "lease_break_time");

   sysctl_protected_symlinks : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:62
   pragma Import (C, sysctl_protected_symlinks, "sysctl_protected_symlinks");

   sysctl_protected_hardlinks : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:63
   pragma Import (C, sysctl_protected_hardlinks, "sysctl_protected_hardlinks");

   --  skipped empty struct buffer_head

   --  skipped function type get_block_t

   --  skipped function type dio_iodone_t

  -- called from RCU mode, don't block  
  -- * flags in file.f_mode.  Note that FMODE_READ and FMODE_WRITE must correspond
  -- * to O_WRONLY and O_RDWR via the strange trick in __dentry_open()
  --  

  -- file is open for reading  
  -- file is open for writing  
  -- file is seekable  
  -- file can be accessed using pread  
  -- file can be accessed using pwrite  
  -- File is opened for execution with sys_execve / sys_uselib  
  -- File is opened with O_NDELAY (only set for block devices)  
  -- File is opened with O_EXCL (only set for block devices)  
  -- File is opened using open(.., 3, ..) and is writeable only for ioctls
  --   (specialy hack for floppy.c)  

  -- 32bit hashes as llseek() offset (for directories)  
  -- 64bit hashes as llseek() offset (for directories)  
  -- * Don't update ctime and mtime.
  -- *
  -- * Currently a special hack for the XFS open_by_handle ioctl, but we'll
  -- * hopefully graduate it to a proper O_CMTIME flag supported by open(2) soon.
  --  

  -- Expect random access pattern  
  -- File is huge (eg. /dev/kmem): treat loff_t as unsigned  
  -- File is opened with O_PATH; almost nothing can be done with it  
  -- File needs atomic accesses to f_pos  
  -- Write access to underlying fs  
  -- Has read method(s)  
  -- Has write method(s)  
  -- File was opened by fanotify and shouldn't generate fanotify events  
  -- * Flag for rw_copy_check_uvector and compat_rw_copy_check_uvector
  -- * that indicates that they should check the contents of the iovec are
  -- * valid, but not check the memory that the iovec elements
  -- * points too.
  --  

  -- * The below are the various read and write types that we support. Some of
  -- * them include behavioral modifiers that send information down to the
  -- * block layer and IO scheduler. Terminology:
  -- *
  -- *	The block layer uses device plugging to defer IO a little bit, in
  -- *	the hope that we will see more IO very shortly. This increases
  -- *	coalescing of adjacent IO and thus reduces the number of IOs we
  -- *	have to send to the device. It also allows for better queuing,
  -- *	if the IO isn't mergeable. If the caller is going to be waiting
  -- *	for the IO, then he must ensure that the device is unplugged so
  -- *	that the IO is dispatched to the driver.
  -- *
  -- *	All IO is handled async in Linux. This is fine for background
  -- *	writes, but for reads or writes that someone waits for completion
  -- *	on, we want to notify the block layer and IO scheduler so that they
  -- *	know about it. That allows them to make better scheduling
  -- *	decisions. So when the below references 'sync' and 'async', it
  -- *	is referencing this priority hint.
  -- *
  -- * With that in mind, the available types are:
  -- *
  -- * READ			A normal read operation. Device will be plugged.
  -- * READ_SYNC		A synchronous read. Device is not plugged, caller can
  -- *			immediately wait on this read without caring about
  -- *			unplugging.
  -- * READA		Used for read-ahead operations. Lower priority, and the
  -- *			block layer could (in theory) choose to ignore this
  -- *			request if it runs into resource problems.
  -- * WRITE		A normal async write. Device will be plugged.
  -- * WRITE_SYNC		Synchronous write. Identical to WRITE, but passes down
  -- *			the hint that someone will be waiting on this IO
  -- *			shortly. The write equivalent of READ_SYNC.
  -- * WRITE_ODIRECT	Special case write for O_DIRECT only.
  -- * WRITE_FLUSH		Like WRITE_SYNC but with preceding cache flush.
  -- * WRITE_FUA		Like WRITE_SYNC but data is guaranteed to be on
  -- *			non-volatile media on completion.
  -- * WRITE_FLUSH_FUA	Combination of WRITE_FLUSH and FUA. The IO is preceded
  -- *			by a cache flush and data is guaranteed to be on
  -- *			non-volatile media on completion.
  -- *
  --  

  -- * Attribute flags.  These should be or-ed together to figure out what
  -- * has been changed!
  --  

  -- * This is the Inode Attributes structure, used for notify_change().  It
  -- * uses the above definitions as flags, to know which values have changed.
  -- * Also, in this manner, a Filesystem can look at only the values it cares
  -- * about.  Basically, these are the attributes that the VFS layer can
  -- * request to change from the FS layer.
  -- *
  -- * Derek Atkins <warlord@MIT.EDU> 94-10-20
  --  

   type file;
   type iattr is record
      ia_valid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:237
      ia_mode : aliased linux_types_h.umode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:238
      ia_uid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:239
      ia_gid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:240
      ia_size : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:241
      ia_atime : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:242
      ia_mtime : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:243
      ia_ctime : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:244
      ia_file : access file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:251
   end record;
   pragma Convention (C_Pass_By_Copy, iattr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:236

  --	 * Not an attribute, but an auxiliary info for filesystems wanting to
  --	 * implement an ftruncate() like method.  NOTE: filesystem should
  --	 * check for (ia_valid & ATTR_FILE), and not for (ia_file != NULL).
  --	  

  -- * Includes for diskquotas.
  --  

  --* 
  -- * enum positive_aop_returns - aop return codes with specific semantics
  -- *
  -- * @AOP_WRITEPAGE_ACTIVATE: Informs the caller that page writeback has
  -- * 			    completed, that the page is still locked, and
  -- * 			    should be considered active.  The VM uses this hint
  -- * 			    to return the page to the active list -- it won't
  -- * 			    be a candidate for writeback again in the near
  -- * 			    future.  Other callers must be careful to unlock
  -- * 			    the page if they get this return.  Returned by
  -- * 			    writepage(); 
  -- *
  -- * @AOP_TRUNCATED_PAGE: The AOP method that was handed a locked page has
  -- *  			unlocked it and the page might have been truncated.
  -- *  			The caller should back up to acquiring a new page and
  -- *  			trying again.  The aop will be taking reasonable
  -- *  			precautions not to livelock.  If the caller held a page
  -- *  			reference, it should drop it before retrying.  Returned
  -- *  			by readpage().
  -- *
  -- * address_space_operation functions return these large constants to indicate
  -- * special semantics to the caller.  These are much larger than the bytes in a
  -- * page to allow for functions that return the number of bytes operated on in a
  -- * given page.
  --  

   subtype positive_aop_returns is unsigned;
   AOP_WRITEPAGE_ACTIVATE : constant positive_aop_returns := 524288;
   AOP_TRUNCATED_PAGE : constant positive_aop_returns := 524289;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:285

  -- * oh the beauties of C type declarations.
  --  

  -- * "descriptor" for what we're up to with a read.
  -- * This allows us to use the same read code yet
  -- * have multiple different users of the data that
  -- * we read from a file.
  -- *
  -- * The simplest case just copies the data to user
  -- * mode.
  --  

   type anon_196 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            buf : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:316
         when others =>
            data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:317
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_196);
   pragma Unchecked_Union (anon_196);
   type read_descriptor_t is record
      written : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:313
      count : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:314
      arg : anon_196;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:318
      error : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:319
   end record;
   pragma Convention (C_Pass_By_Copy, read_descriptor_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:320

   --  skipped anonymous struct anon_195

   type read_actor_t is access function
        (arg1 : access read_descriptor_t;
         arg2 : access linux_mm_types_h.page;
         arg3 : unsigned_long;
         arg4 : unsigned_long) return int;
   pragma Convention (C, read_actor_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:322

   type address_space_operations is record
      writepage : access function (arg1 : access linux_mm_types_h.page; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:326
      readpage : access function (arg1 : access file; arg2 : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:327
      writepages : access function (arg1 : System.Address; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:330
      set_page_dirty : access function (arg1 : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:333
      readpages : access function
           (arg1 : access file;
            arg2 : System.Address;
            arg3 : access linux_types_h.list_head;
            arg4 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:336
      write_begin : access function
           (arg1 : access file;
            arg2 : System.Address;
            arg3 : linux_types_h.loff_t;
            arg4 : unsigned;
            arg5 : unsigned;
            arg6 : System.Address;
            arg7 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:340
      write_end : access function
           (arg1 : access file;
            arg2 : System.Address;
            arg3 : linux_types_h.loff_t;
            arg4 : unsigned;
            arg5 : unsigned;
            arg6 : access linux_mm_types_h.page;
            arg7 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:343
      bmap : access function (arg1 : System.Address; arg2 : linux_types_h.sector_t) return linux_types_h.sector_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:346
      invalidatepage : access procedure
           (arg1 : access linux_mm_types_h.page;
            arg2 : unsigned;
            arg3 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:347
      releasepage : access function (arg1 : access linux_mm_types_h.page; arg2 : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:348
      freepage : access procedure (arg1 : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:349
      direct_IO : access function
           (arg1 : int;
            arg2 : System.Address;
            arg3 : access linux_uio_h.iov_iter;
            arg4 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:350
      get_xip_mem : access function
           (arg1 : System.Address;
            arg2 : unsigned_long;
            arg3 : int;
            arg4 : System.Address;
            arg5 : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:352
      migratepage : access function
           (arg1 : System.Address;
            arg2 : access linux_mm_types_h.page;
            arg3 : access linux_mm_types_h.page;
            arg4 : linux_migrate_mode_h.migrate_mode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:358
      launder_page : access function (arg1 : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:359
      is_partially_uptodate : access function
           (arg1 : access linux_mm_types_h.page;
            arg2 : unsigned_long;
            arg3 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:361
      is_dirty_writeback : access procedure
           (arg1 : access linux_mm_types_h.page;
            arg2 : access Extensions.bool;
            arg3 : access Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:362
      error_remove_page : access function (arg1 : System.Address; arg2 : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:363
      swap_activate : access function
           (arg1 : System.Address;
            arg2 : access file;
            arg3 : access linux_types_h.sector_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:367
      swap_deactivate : access procedure (arg1 : access file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:368
   end record;
   pragma Convention (C_Pass_By_Copy, address_space_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:325

  -- Write back some dirty pages from this mapping.  
  -- Set a page dirty.  Return true if this dirtied it  
  -- Unfortunately this kludge is needed for FIBMAP. Don't use it  
  --	 * migrate the contents of a page to the specified target. If
  --	 * migrate_mode is MIGRATE_ASYNC, it must not block.
  --	  

  -- swapfile support  
   empty_aops : aliased address_space_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:371
   pragma Import (C, empty_aops, "empty_aops");

  -- * pagecache_write_begin/pagecache_write_end must be used by general code
  -- * to write into the pagecache.
  --  

   function pagecache_write_begin
     (arg1 : access file;
      mapping : System.Address;
      pos : linux_types_h.loff_t;
      len : unsigned;
      flags : unsigned;
      pagep : System.Address;
      fsdata : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:377
   pragma Import (CPP, pagecache_write_begin, "_Z21pagecache_write_beginP4fileP13address_spacexjjPP4pagePPv");

   function pagecache_write_end
     (arg1 : access file;
      mapping : System.Address;
      pos : linux_types_h.loff_t;
      len : unsigned;
      copied : unsigned;
      the_page : access linux_mm_types_h.page;
      fsdata : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:381
   pragma Import (CPP, pagecache_write_end, "_Z19pagecache_write_endP4fileP13address_spacexjjP4pagePv");

   --  skipped empty struct backing_dev_info

  -- owner: inode, block_device  
   type inode;
   type address_space is record
      host : access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:387
      page_tree : aliased linux_radix_tree_h.radix_tree_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:388
      tree_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:389
      i_mmap_writable : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:390
      i_mmap : aliased linux_rbtree_h.rb_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:391
      i_mmap_nonlinear : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:392
      i_mmap_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:393
      nrpages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:395
      nrshadows : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:396
      writeback_index : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:397
      a_ops : access constant address_space_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:398
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:399
      the_backing_dev_info : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:400
      private_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:401
      private_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:402
      private_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:403
   end record;
   pragma Convention (C_Pass_By_Copy, address_space);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:386

  -- radix tree of all pages  
  -- and lock protecting it  
  -- count VM_SHARED mappings  
  -- tree of private and shared mappings  
  --list VM_NONLINEAR mappings  
  -- protect tree, count, list  
  -- Protected by tree_lock together with the radix tree  
  -- number of total pages  
  -- number of shadow entries  
  -- writeback starts here  
  -- methods  
  -- error bits/gfp mask  
  -- device readahead, etc  
  -- for use by the address_space  
  -- ditto  
  -- ditto  
  --	 * On most architectures that alignment is already the case; but
  --	 * must be enforced here for CRIS, to let the least significant bit
  --	 * of struct page's "mapping" pointer be used for PAGE_MAPPING_ANON.
  --	  

   --  skipped empty struct request_queue

  -- not a kdev_t - it's a search key  
   type super_block;
   type block_device is record
      bd_dev : aliased linux_types_h.dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:413
      bd_openers : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:414
      bd_inode : access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:415
      bd_super : access super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:416
      bd_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:417
      bd_inodes : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:418
      bd_claiming : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:419
      bd_holder : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:420
      bd_holders : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:421
      bd_write_holder : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:422
      bd_holder_disks : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:424
      bd_contains : access block_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:426
      bd_block_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:427
      bd_part : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:428
      bd_part_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:430
      bd_invalidated : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:431
      bd_disk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:432
      bd_queue : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:433
      bd_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:434
      bd_private : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:441
      bd_fsfreeze_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:444
      bd_fsfreeze_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:446
   end record;
   pragma Convention (C_Pass_By_Copy, block_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:412

  -- will die  
  -- open/close mutex  
   --  skipped empty struct hd_struct

  -- number of times partitions within this device have been opened.  
   --  skipped empty struct gendisk

  --	 * Private data.  You must have bd_claim'ed the block_device
  --	 * to use this.  NOTE:  bd_claim allows an owner to claim
  --	 * the same device multiple times, the owner must take special
  --	 * care to not mess up bd_private for that case.
  --	  

  -- The counter of freeze processes  
  -- Mutex for freeze  
  -- * Radix-tree tags, for tagging dirty and writeback pages within the pagecache
  -- * radix trees
  --  

   function mapping_tagged (mapping : access address_space; tag : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:457
   pragma Import (CPP, mapping_tagged, "_Z14mapping_taggedP13address_spacei");

  -- * Might pages of this file be mapped into userspace?
  --  

   function mapping_mapped (mapping : access address_space) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:462
   pragma Import (CPP, mapping_mapped, "_ZL14mapping_mappedP13address_space");

  -- * Might pages of this file have been modified in userspace?
  -- * Note that i_mmap_writable counts all VM_SHARED vmas: do_mmap_pgoff
  -- * marks vma as VM_SHARED if it is shared, and the file was opened for
  -- * writing i.e. vma may be mprotected writable even if now readonly.
  -- *
  -- * If i_mmap_writable is negative, no new writable mappings are allowed. You
  -- * can only deny writable mappings, if none exists right now.
  --  

   function mapping_writably_mapped (mapping : access address_space) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:477
   pragma Import (CPP, mapping_writably_mapped, "_ZL23mapping_writably_mappedP13address_space");

   function mapping_map_writable (mapping : access address_space) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:482
   pragma Import (CPP, mapping_map_writable, "_ZL20mapping_map_writableP13address_space");

   procedure mapping_unmap_writable (mapping : access address_space);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:488
   pragma Import (CPP, mapping_unmap_writable, "_ZL22mapping_unmap_writableP13address_space");

   function mapping_deny_writable (mapping : access address_space) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:493
   pragma Import (CPP, mapping_deny_writable, "_ZL21mapping_deny_writableP13address_space");

   procedure mapping_allow_writable (mapping : access address_space);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:499
   pragma Import (CPP, mapping_allow_writable, "_ZL22mapping_allow_writableP13address_space");

  -- * Use sequence counter to get consistent i_size on 32-bit processors.
  --  

   --  skipped empty struct posix_acl

  -- * Keep mostly read-only and often accessed (especially for
  -- * the RCU path lookup and 'stat' data) fields at the beginning
  -- * of the 'struct inode'
  --  

   type inode is record
      i_mode : aliased linux_types_h.umode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:528
      i_opflags : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:529
      i_uid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:530
      i_gid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:531
      i_flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:532
      i_acl : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:535
      i_default_acl : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:536
      i_op : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:539
      i_sb : access super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:540
      i_mapping : access address_space;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:541
      i_security : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:544
      i_ino : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:548
      field_13 : aliased anon_197;
      i_rdev : aliased linux_types_h.dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:560
      i_size : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:561
      i_atime : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:562
      i_mtime : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:563
      i_ctime : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:564
      i_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:565
      i_bytes : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:566
      i_blkbits : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:567
      i_blocks : aliased linux_types_h.blkcnt_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:568
      i_state : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:575
      i_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:576
      dirtied_when : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:578
      i_hash : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:580
      i_wb_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:581
      i_lru : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:582
      i_sb_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:583
      field_30 : aliased anon_198;
      i_version : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:588
      i_count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:589
      i_dio_count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:590
      i_writecount : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:591
      i_fop : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:595
      i_flock : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:596
      i_data : aliased address_space;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:597
      i_dquot : aliased inode_i_dquot_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:599
      i_devices : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:601
      field_40 : aliased anon_199;
      i_generation : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:608
      i_fsnotify_mask : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:611
      i_fsnotify_marks : aliased linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:612
      i_private : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:615
   end record;
   pragma Convention (C_Pass_By_Copy, inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:527

  -- Stat data, not accessed from path walking  
  --	 * Filesystems may only read i_nlink directly.  They shall use the
  --	 * following functions for modification:
  --	 *
  --	 *    (set|clear|inc|drop)_nlink
  --	 *    inode_(inc|dec)_link_count
  --	  

  -- i_blocks, i_bytes, maybe i_size  
  -- Misc  
  -- jiffies of first dirtying  
  -- backing dev IO list  
  -- inode LRU list  
  -- struct files open RO  
  -- former ->i_op->default_file_ops  
  -- all events this inode cares about  
  -- fs or device private pointer  
   function inode_unhashed (the_inode : access inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:618
   pragma Import (CPP, inode_unhashed, "_ZL14inode_unhashedP5inode");

  -- * inode->i_mutex nesting subclasses for the lock validator:
  -- *
  -- * 0: the object of the current VFS operation
  -- * 1: parent
  -- * 2: child/target
  -- * 3: xattr
  -- * 4: second non-directory
  -- * The last is for certain operations (such as rename) which lock two
  -- * non-directories at once.
  -- *
  -- * The locking order between these classes is
  -- * parent -> child -> normal -> xattr -> second non-directory
  --  

   type inode_i_mutex_lock_class is 
     (I_MUTEX_NORMAL,
      I_MUTEX_PARENT,
      I_MUTEX_CHILD,
      I_MUTEX_XATTR,
      I_MUTEX_NONDIR2);
   pragma Convention (C, inode_i_mutex_lock_class);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:637

   procedure lock_two_nondirectories (arg1 : access inode; arg2 : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:646
   pragma Import (CPP, lock_two_nondirectories, "_Z23lock_two_nondirectoriesP5inodeS0_");

   procedure unlock_two_nondirectories (arg1 : access inode; arg2 : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:647
   pragma Import (CPP, unlock_two_nondirectories, "_Z25unlock_two_nondirectoriesP5inodeS0_");

  -- * NOTE: in a 32bit arch with a preemptable kernel and
  -- * an UP compile the i_size_read/write must be atomic
  -- * with respect to the local cpu (unlike with preempt disabled),
  -- * but they don't need to be atomic with respect to other cpus like in
  -- * true SMP (so they need either to either locally disable irq around
  -- * the read or for example on x86 they can be still implemented as a
  -- * cmpxchg8b without the need of the lock prefix). For SMP compiles
  -- * and 64bit archs it makes no difference if preempt is enabled or not.
  --  

   function i_size_read (the_inode : access constant inode) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:659
   pragma Import (CPP, i_size_read, "_ZL11i_size_readPK5inode");

  -- * NOTE: unlike i_size_read(), i_size_write() does need locking around it
  -- * (normally i_mutex), otherwise on 32bit/SMP an update of i_size_seqcount
  -- * can be lost, resulting in subsequent i_size_read() calls spinning forever.
  --  

   procedure i_size_write (the_inode : access inode; i_size : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:687
   pragma Import (CPP, i_size_write, "_ZL12i_size_writeP5inodex");

  -- Helper functions so that in most cases filesystems will
  -- * not need to deal directly with kuid_t and kgid_t and can
  -- * instead deal with the raw numeric values that are stored
  -- * in the filesystem.
  --  

   function i_uid_read (the_inode : access constant inode) return linux_types_h.uid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:709
   pragma Import (CPP, i_uid_read, "_ZL10i_uid_readPK5inode");

   function i_gid_read (the_inode : access constant inode) return linux_types_h.gid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:714
   pragma Import (CPP, i_gid_read, "_ZL10i_gid_readPK5inode");

   procedure i_uid_write (the_inode : access inode; uid : linux_types_h.uid_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:719
   pragma Import (CPP, i_uid_write, "_ZL11i_uid_writeP5inodej");

   procedure i_gid_write (the_inode : access inode; gid : linux_types_h.gid_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:724
   pragma Import (CPP, i_gid_write, "_ZL11i_gid_writeP5inodej");

   function iminor (the_inode : access constant inode) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:729
   pragma Import (CPP, iminor, "_ZL6iminorPK5inode");

   function imajor (the_inode : access constant inode) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:734
   pragma Import (CPP, imajor, "_ZL6imajorPK5inode");

   function I_BDEV (the_inode : access inode) return access block_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:739
   pragma Import (CPP, I_BDEV, "_Z6I_BDEVP5inode");

  -- protects pid, uid, euid fields  
   type fown_struct is record
      lock : aliased linux_rwlock_types_h.rwlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:742
      the_pid : access linux_pid_h.pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:743
      the_pid_type : aliased linux_pid_h.pid_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:744
      uid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:745
      euid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:745
      signum : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:746
   end record;
   pragma Convention (C_Pass_By_Copy, fown_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:741

  -- pid or -pgrp where SIGIO should be sent  
  -- Kind of process group SIGIO should be sent to  
  -- uid/euid of process setting the owner  
  -- posix.1b rt signal to be delivered on IO  
  -- * Track a single file's readahead state
  --  

  -- where readahead started  
   type file_ra_state is record
      start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:753
      size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:754
      async_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:755
      ra_pages : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:758
      mmap_miss : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:759
      prev_pos : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:760
   end record;
   pragma Convention (C_Pass_By_Copy, file_ra_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:752

  -- # of readahead pages  
  -- do asynchronous readahead when
  --					   there are only # of pages ahead  

  -- Maximum readahead window  
  -- Cache miss stat for mmap accesses  
  -- Cache last read() position  
  -- * Check if @index falls in the readahead windows.
  --  

   function ra_has_index (ra : access file_ra_state; index : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:766
   pragma Import (CPP, ra_has_index, "_ZL12ra_has_indexP13file_ra_statem");

   type file is record
      f_u : anon_200;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:776
      f_path : aliased linux_path_h.path;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:777
      f_inode : access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:779
      f_op : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:780
      f_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:786
      f_count : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:787
      f_flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:788
      f_mode : aliased linux_types_h.fmode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:789
      f_pos_lock : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:790
      f_pos : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:791
      f_owner : aliased fown_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:792
      f_cred : access constant linux_cred_h.cred;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:793
      f_ra : aliased file_ra_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:794
      f_version : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:796
      f_security : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:798
      private_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:801
      f_ep_links : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:805
      f_tfile_llink : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:806
      f_mapping : access address_space;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:808
   end record;
   pragma Convention (C_Pass_By_Copy, file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:772

  -- cached value  
  --	 * Protects f_ep_links, f_flags.
  --	 * Must not be taken from IRQ context.
  --	  

  -- needed for tty driver, and maybe others  
  -- Used by fs/eventpoll.c to link all the hooks to this file  
  -- lest something weird decides that 2 is OK  
   type file_handle_f_handle_array is array (0 .. -1) of aliased unsigned_char;
   type file_handle is record
      handle_bytes : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:812
      handle_type : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:813
      f_handle : aliased file_handle_f_handle_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:815
   end record;
   pragma Convention (C_Pass_By_Copy, file_handle);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:811

  -- file identifier  
   function get_file (f : access file) return access file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:818
   pragma Import (CPP, get_file, "_ZL8get_fileP4file");

  -- Page cache limit. The filesystems should put that into their s_maxbytes 
  --   limits, otherwise bad things can happen in VM.  

  -- * Special return value from posix_lock_file() and vfs_lock_file() for
  -- * asynchronous locking.
  --  

  -- * The POSIX file lock owner is determined by
  -- * the "struct files_struct" in the thread group
  -- * (or NULL for no owner - BSD locks).
  -- *
  -- * Lockd stuffs a "host" pointer into this.
  --  

   --  skipped empty struct files_struct

   type fl_owner_t is new System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:861

   type file_lock_operations is record
      fl_copy_lock : access procedure (arg1 : System.Address; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:864
      fl_release_private : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:865
   end record;
   pragma Convention (C_Pass_By_Copy, file_lock_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:863

   type lock_manager_operations is record
      lm_compare_owner : access function (arg1 : System.Address; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:869
      lm_owner_key : access function (arg1 : System.Address) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:870
      lm_notify : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:871
      lm_grant : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:872
      lm_break : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:873
      lm_change : access function (arg1 : System.Address; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:874
   end record;
   pragma Convention (C_Pass_By_Copy, lock_manager_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:868

  -- unblock callback  
   type lock_manager is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:878
   end record;
   pragma Convention (C_Pass_By_Copy, lock_manager);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:877

   procedure locks_start_grace (arg1 : access net_net_namespace_h.net; arg2 : access lock_manager);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:882
   pragma Import (CPP, locks_start_grace, "_Z17locks_start_graceP3netP12lock_manager");

   procedure locks_end_grace (arg1 : access lock_manager);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:883
   pragma Import (CPP, locks_end_grace, "_Z15locks_end_graceP12lock_manager");

   function locks_in_grace (arg1 : access net_net_namespace_h.net) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:884
   pragma Import (CPP, locks_in_grace, "_Z14locks_in_graceP3net");

  -- that will die - we need it for nfs_lock_info  
  -- * struct file_lock represents a generic "file lock". It's used to represent
  -- * POSIX byte range locks, BSD (flock) locks, and leases. It's important to
  -- * note that the same struct is used to represent both a request for a lock and
  -- * the lock itself, but the same object is never used for both.
  -- *
  -- * FIXME: should we create a separate "struct lock_request" to help distinguish
  -- * these two uses?
  -- *
  -- * The i_flock list is ordered by:
  -- *
  -- * 1) lock type -- FL_LEASEs first, then FL_FLOCK, and finally FL_POSIX
  -- * 2) lock owner
  -- * 3) lock range start
  -- * 4) lock range end
  -- *
  -- * Obviously, the last two criteria only matter for POSIX locks.
  --  

  -- singly linked list for this inode   
   type fasync_struct;
   type anon_201;
   type anon_202 is record
      link : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:933
      state : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:934
   end record;
   pragma Convention (C_Pass_By_Copy, anon_202);
   type anon_201 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            nfs_fl : aliased linux_nfs_fs_i_h.nfs_lock_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:930
         when 1 =>
            nfs4_fl : aliased linux_nfs_fs_i_h.nfs4_lock_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:931
         when others =>
            afs : aliased anon_202;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:935
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_201);
   pragma Unchecked_Union (anon_201);
   type file_lock is record
      fl_next : access file_lock;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:908
      fl_link : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:909
      fl_block : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:910
      fl_owner : fl_owner_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:911
      fl_flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:912
      fl_type : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:913
      fl_pid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:914
      fl_link_cpu : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:915
      fl_nspid : access linux_pid_h.pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:916
      fl_wait : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:917
      fl_file : access file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:918
      fl_start : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:919
      fl_end : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:920
      fl_fasync : access fasync_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:922
      fl_break_time : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:924
      fl_downgrade_time : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:925
      fl_ops : access constant file_lock_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:927
      fl_lmops : access constant lock_manager_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:928
      fl_u : anon_201;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:936
   end record;
   pragma Convention (C_Pass_By_Copy, file_lock);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:907

  -- node in global lists  
  -- circular list of blocked processes  
  -- what cpu's list is this on?  
  -- for lease break notifications  
  -- for lease breaks:  
  -- Callbacks for filesystems  
  -- Callbacks for lockmanagers  
  -- link in AFS vnode's pending_locks list  
  -- state of grant or error if -ve  
  -- The following constant reflects the upper bound of the file/locking space  
   procedure send_sigio
     (fown : access fown_struct;
      fd : int;
      band : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:948
   pragma Import (CPP, send_sigio, "_Z10send_sigioP11fown_structii");

   function fcntl_getlk
     (arg1 : access file;
      arg2 : unsigned;
      arg3 : access uapi_asm_generic_fcntl_h.flock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:951
   pragma Import (CPP, fcntl_getlk, "_Z11fcntl_getlkP4filejP5flock");

   function fcntl_setlk
     (arg1 : unsigned;
      arg2 : access file;
      arg3 : unsigned;
      arg4 : access uapi_asm_generic_fcntl_h.flock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:952
   pragma Import (CPP, fcntl_setlk, "_Z11fcntl_setlkjP4filejP5flock");

   function fcntl_setlease
     (fd : unsigned;
      filp : access file;
      arg : long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:961
   pragma Import (CPP, fcntl_setlease, "_Z14fcntl_setleasejP4filel");

   function fcntl_getlease (filp : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:962
   pragma Import (CPP, fcntl_getlease, "_Z14fcntl_getleaseP4file");

  -- fs/locks.c  
   procedure locks_free_lock (fl : access file_lock);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:965
   pragma Import (CPP, locks_free_lock, "_Z15locks_free_lockP9file_lock");

   procedure locks_init_lock (arg1 : access file_lock);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:966
   pragma Import (CPP, locks_init_lock, "_Z15locks_init_lockP9file_lock");

   function locks_alloc_lock return access file_lock;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:967
   pragma Import (CPP, locks_alloc_lock, "_Z16locks_alloc_lockv");

   procedure locks_copy_lock (arg1 : access file_lock; arg2 : access file_lock);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:968
   pragma Import (CPP, locks_copy_lock, "_Z15locks_copy_lockP9file_lockS0_");

   --  skipped func __locks_copy_lock

   procedure locks_remove_posix (arg1 : access file; arg2 : fl_owner_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:970
   pragma Import (CPP, locks_remove_posix, "_Z18locks_remove_posixP4fileP12files_struct");

   procedure locks_remove_file (arg1 : access file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:971
   pragma Import (CPP, locks_remove_file, "_Z17locks_remove_fileP4file");

   procedure locks_release_private (arg1 : access file_lock);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:972
   pragma Import (CPP, locks_release_private, "_Z21locks_release_privateP9file_lock");

   procedure posix_test_lock (arg1 : access file; arg2 : access file_lock);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:973
   pragma Import (CPP, posix_test_lock, "_Z15posix_test_lockP4fileP9file_lock");

   function posix_lock_file
     (arg1 : access file;
      arg2 : access file_lock;
      arg3 : access file_lock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:974
   pragma Import (CPP, posix_lock_file, "_Z15posix_lock_fileP4fileP9file_lockS2_");

   function posix_lock_file_wait (arg1 : access file; arg2 : access file_lock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:975
   pragma Import (CPP, posix_lock_file_wait, "_Z20posix_lock_file_waitP4fileP9file_lock");

   function posix_unblock_lock (arg1 : access file_lock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:976
   pragma Import (CPP, posix_unblock_lock, "_Z18posix_unblock_lockP9file_lock");

   function vfs_test_lock (arg1 : access file; arg2 : access file_lock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:977
   pragma Import (CPP, vfs_test_lock, "_Z13vfs_test_lockP4fileP9file_lock");

   function vfs_lock_file
     (arg1 : access file;
      arg2 : unsigned;
      arg3 : access file_lock;
      arg4 : access file_lock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:978
   pragma Import (CPP, vfs_lock_file, "_Z13vfs_lock_fileP4filejP9file_lockS2_");

   function vfs_cancel_lock (filp : access file; fl : access file_lock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:979
   pragma Import (CPP, vfs_cancel_lock, "_Z15vfs_cancel_lockP4fileP9file_lock");

   function flock_lock_file_wait (filp : access file; fl : access file_lock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:980
   pragma Import (CPP, flock_lock_file_wait, "_Z20flock_lock_file_waitP4fileP9file_lock");

   --  skipped func __break_lease

   procedure lease_get_mtime (arg1 : access inode; time : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:982
   pragma Import (CPP, lease_get_mtime, "_Z15lease_get_mtimeP5inodeP8timespec");

   function generic_setlease
     (arg1 : access file;
      arg2 : long;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:983
   pragma Import (CPP, generic_setlease, "_Z16generic_setleaseP4filelPP9file_lock");

   function vfs_setlease
     (arg1 : access file;
      arg2 : long;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:984
   pragma Import (CPP, vfs_setlease, "_Z12vfs_setleaseP4filelPP9file_lock");

   function lease_modify (arg1 : System.Address; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:985
   pragma Import (CPP, lease_modify, "_Z12lease_modifyPP9file_locki");

   function lock_may_read
     (arg1 : access inode;
      start : linux_types_h.loff_t;
      count : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:986
   pragma Import (CPP, lock_may_read, "_Z13lock_may_readP5inodexm");

   function lock_may_write
     (arg1 : access inode;
      start : linux_types_h.loff_t;
      count : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:987
   pragma Import (CPP, lock_may_write, "_Z14lock_may_writeP5inodexm");

   type fasync_struct is record
      fa_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1134
      magic : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1135
      fa_fd : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1136
      fa_next : access fasync_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1137
      fa_file : access file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1138
      fa_rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1139
   end record;
   pragma Convention (C_Pass_By_Copy, fasync_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1133

  -- singly linked list  
  -- SMP safe fasync helpers:  
   function fasync_helper
     (arg1 : int;
      arg2 : access file;
      arg3 : int;
      arg4 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1145
   pragma Import (CPP, fasync_helper, "_Z13fasync_helperiP4fileiPP13fasync_struct");

   function fasync_insert_entry
     (arg1 : int;
      arg2 : access file;
      arg3 : System.Address;
      arg4 : access fasync_struct) return access fasync_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1146
   pragma Import (CPP, fasync_insert_entry, "_Z19fasync_insert_entryiP4filePP13fasync_structS2_");

   function fasync_remove_entry (arg1 : access file; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1147
   pragma Import (CPP, fasync_remove_entry, "_Z19fasync_remove_entryP4filePP13fasync_struct");

   function fasync_alloc return access fasync_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1148
   pragma Import (CPP, fasync_alloc, "_Z12fasync_allocv");

   procedure fasync_free (arg1 : access fasync_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1149
   pragma Import (CPP, fasync_free, "_Z11fasync_freeP13fasync_struct");

  -- can be called from interrupts  
   procedure kill_fasync
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1152
   pragma Import (CPP, kill_fasync, "_Z11kill_fasyncPP13fasync_structii");

   --  skipped func __f_setown

   function f_setown
     (filp : access file;
      arg : unsigned_long;
      force : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1155
   pragma Import (CPP, f_setown, "_Z8f_setownP4filemi");

   procedure f_delown (filp : access file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1156
   pragma Import (CPP, f_delown, "_Z8f_delownP4file");

   function f_getown (filp : access file) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1157
   pragma Import (CPP, f_getown, "_Z8f_getownP4file");

   function send_sigurg (fown : access fown_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1158
   pragma Import (CPP, send_sigurg, "_Z11send_sigurgP11fown_struct");

  -- *	Umount options
  --  

   super_blocks : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1172
   pragma Import (C, super_blocks, "super_blocks");

   sb_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1173
   pragma Import (C, sb_lock, "sb_lock");

  -- Possible states of 'frozen' field  
  -- FS is unfrozen  
  -- Writes, dir ops, ioctls frozen  
  -- Page faults stopped as well  
  -- For internal FS use (e.g. to stop
  --					 * internal threads if needed)  

  -- ->freeze_fs finished successfully  
  -- Counters for counting writers at each level  
   type sb_writers_counter_array is array (0 .. 2) of aliased linux_percpu_counter_h.percpu_counter;
   type sb_writers is record
      counter : aliased sb_writers_counter_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1189
      wait : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1190
      frozen : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1192
      wait_unfrozen : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1193
   end record;
   pragma Convention (C_Pass_By_Copy, sb_writers);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1187

  -- queue for waiting for
  --						   writers / faults to finish  

  -- Is sb frozen?  
  -- queue for waiting for
  --						   sb to be thawed  

  -- Keep this first  
   type super_block is record
      s_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1201
      s_dev : aliased linux_types_h.dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1202
      s_blocksize_bits : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1203
      s_blocksize : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1204
      s_maxbytes : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1205
      s_type : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1206
      s_op : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1207
      dq_op : access constant linux_quota_h.dquot_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1208
      s_qcop : access constant linux_quota_h.quotactl_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1209
      s_export_op : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1210
      s_flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1211
      s_magic : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1212
      s_root : access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1213
      s_umount : aliased linux_rwsem_h.rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1214
      s_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1215
      s_active : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1216
      s_security : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1218
      s_xattr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1220
      s_inodes : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1222
      s_anon : aliased linux_list_bl_h.hlist_bl_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1223
      s_mounts : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1224
      s_bdev : access block_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1225
      s_bdi : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1226
      s_mtd : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1227
      s_instances : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1228
      s_dquot : aliased linux_quota_h.quota_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1229
      s_writers : aliased sb_writers;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1231
      s_id : aliased super_block_s_id_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1233
      s_uuid : aliased super_block_s_uuid_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1234
      s_fs_info : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1236
      s_max_links : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1237
      s_mode : aliased linux_types_h.fmode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1238
      s_time_gran : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1242
      s_vfs_rename_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1248
      s_subtype : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1254
      s_options : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1260
      s_d_op : access constant linux_dcache_h.dentry_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1261
      cleancache_poolid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1266
      s_shrink : aliased linux_shrinker_h.shrinker;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1268
      s_remove_count : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1271
      s_readonly_remount : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1274
      s_dio_done_wq : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1277
      s_dentry_lru : aliased linux_list_lru_h.list_lru;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1283
      s_inode_lru : aliased linux_list_lru_h.list_lru;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1284
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1285
   end record;
   pragma Convention (C_Pass_By_Copy, super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1200

  -- search index; _not_ kdev_t  
  -- Max file size  
   --  skipped empty struct xattr_handler

  -- all inodes  
  -- anonymous dentries for (nfs) exporting  
  -- list of mounts; _not_ for fs use  
   --  skipped empty struct mtd_info

  -- Diskquota specific options  
  -- Informational name  
  -- UUID  
  -- Filesystem private info  
  -- Granularity of c/m/atime in ns.
  --	   Cannot be worse than a second  

  --	 * The next field is for VFS *only*. No filesystems have any business
  --	 * even looking at it. You had been warned.
  --	  

  -- Kludge  
  --	 * Filesystem subtype.  If non-empty the filesystem type field
  --	 * in /proc/mounts will be "type.subtype"
  --	  

  --	 * Saved mount options for lazy filesystems using
  --	 * generic_show_options()
  --	  

  -- default d_op for dentries  
  --	 * Saved pool identifier for cleancache (-1 means none)
  --	  

  -- per-sb shrinker handle  
  -- Number of inodes with nlink == 0 but still referenced  
  -- Being remounted read-only  
  -- AIO completions deferred from interrupt context  
  --	 * Keep the lru lists last in the structure so they always sit on their
  --	 * own individual cachelines.
  --	  

   function current_fs_time (sb : access super_block) return uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1288
   pragma Import (CPP, current_fs_time, "_Z15current_fs_timeP11super_block");

  -- * Snapshotting support.
  --  

   --  skipped func __sb_end_write

   --  skipped func __sb_start_write

  --*
  -- * sb_end_write - drop write access to a superblock
  -- * @sb: the super we wrote to
  -- *
  -- * Decrement number of writers to the filesystem. Wake up possible waiters
  -- * wanting to freeze the filesystem.
  --  

   procedure sb_end_write (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1304
   pragma Import (CPP, sb_end_write, "_ZL12sb_end_writeP11super_block");

  --*
  -- * sb_end_pagefault - drop write access to a superblock from a page fault
  -- * @sb: the super we wrote to
  -- *
  -- * Decrement number of processes handling write page fault to the filesystem.
  -- * Wake up possible waiters wanting to freeze the filesystem.
  --  

   procedure sb_end_pagefault (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1316
   pragma Import (CPP, sb_end_pagefault, "_ZL16sb_end_pagefaultP11super_block");

  --*
  -- * sb_end_intwrite - drop write access to a superblock for internal fs purposes
  -- * @sb: the super we wrote to
  -- *
  -- * Decrement fs-internal number of writers to the filesystem.  Wake up possible
  -- * waiters wanting to freeze the filesystem.
  --  

   procedure sb_end_intwrite (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1328
   pragma Import (CPP, sb_end_intwrite, "_ZL15sb_end_intwriteP11super_block");

  --*
  -- * sb_start_write - get write access to a superblock
  -- * @sb: the super we write to
  -- *
  -- * When a process wants to write data or metadata to a file system (i.e. dirty
  -- * a page or an inode), it should embed the operation in a sb_start_write() -
  -- * sb_end_write() pair to get exclusion against file system freezing. This
  -- * function increments number of writers preventing freezing. If the file
  -- * system is already frozen, the function waits until the file system is
  -- * thawed.
  -- *
  -- * Since freeze protection behaves as a lock, users have to preserve
  -- * ordering of freeze protection and other filesystem locks. Generally,
  -- * freeze protection should be the outermost lock. In particular, we have:
  -- *
  -- * sb_start_write
  -- *   -> i_mutex			(write path, truncate, directory ops, ...)
  -- *   -> s_umount		(freeze_super, thaw_super)
  --  

   procedure sb_start_write (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1352
   pragma Import (CPP, sb_start_write, "_ZL14sb_start_writeP11super_block");

   function sb_start_write_trylock (sb : access super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1357
   pragma Import (CPP, sb_start_write_trylock, "_ZL22sb_start_write_trylockP11super_block");

  --*
  -- * sb_start_pagefault - get write access to a superblock from a page fault
  -- * @sb: the super we write to
  -- *
  -- * When a process starts handling write page fault, it should embed the
  -- * operation into sb_start_pagefault() - sb_end_pagefault() pair to get
  -- * exclusion against file system freezing. This is needed since the page fault
  -- * is going to dirty a page. This function increments number of running page
  -- * faults preventing freezing. If the file system is already frozen, the
  -- * function waits until the file system is thawed.
  -- *
  -- * Since page fault freeze protection behaves as a lock, users have to preserve
  -- * ordering of freeze protection and other filesystem locks. It is advised to
  -- * put sb_start_pagefault() close to mmap_sem in lock ordering. Page fault
  -- * handling code implies lock dependency:
  -- *
  -- * mmap_sem
  -- *   -> sb_start_pagefault
  --  

   procedure sb_start_pagefault (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1381
   pragma Import (CPP, sb_start_pagefault, "_ZL18sb_start_pagefaultP11super_block");

  -- * sb_start_intwrite - get write access to a superblock for internal fs purposes
  -- * @sb: the super we write to
  -- *
  -- * This is the third level of protection against filesystem freezing. It is
  -- * free for use by a filesystem. The only requirement is that it must rank
  -- * below sb_start_pagefault.
  -- *
  -- * For example filesystem can call sb_start_intwrite() when starting a
  -- * transaction which somewhat eases handling of freezing for internal sources
  -- * of filesystem changes (internal fs threads, discarding preallocation on file
  -- * close, etc.).
  --  

   procedure sb_start_intwrite (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1399
   pragma Import (CPP, sb_start_intwrite, "_ZL17sb_start_intwriteP11super_block");

   function inode_owner_or_capable (the_inode : access constant inode) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1405
   pragma Import (CPP, inode_owner_or_capable, "_Z22inode_owner_or_capablePK5inode");

  -- * VFS helper functions..
  --  

   function vfs_create
     (arg1 : access inode;
      arg2 : access linux_dcache_h.dentry;
      arg3 : linux_types_h.umode_t;
      arg4 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1410
   pragma Import (CPP, vfs_create, "_Z10vfs_createP5inodeP6dentrytb");

   function vfs_mkdir
     (arg1 : access inode;
      arg2 : access linux_dcache_h.dentry;
      arg3 : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1411
   pragma Import (CPP, vfs_mkdir, "_Z9vfs_mkdirP5inodeP6dentryt");

   function vfs_mknod
     (arg1 : access inode;
      arg2 : access linux_dcache_h.dentry;
      arg3 : linux_types_h.umode_t;
      arg4 : linux_types_h.dev_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1412
   pragma Import (CPP, vfs_mknod, "_Z9vfs_mknodP5inodeP6dentrytj");

   function vfs_symlink
     (arg1 : access inode;
      arg2 : access linux_dcache_h.dentry;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1413
   pragma Import (CPP, vfs_symlink, "_Z11vfs_symlinkP5inodeP6dentryPKc");

   function vfs_link
     (arg1 : access linux_dcache_h.dentry;
      arg2 : access inode;
      arg3 : access linux_dcache_h.dentry;
      arg4 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1414
   pragma Import (CPP, vfs_link, "_Z8vfs_linkP6dentryP5inodeS0_PS2_");

   function vfs_rmdir (arg1 : access inode; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1415
   pragma Import (CPP, vfs_rmdir, "_Z9vfs_rmdirP5inodeP6dentry");

   function vfs_unlink
     (arg1 : access inode;
      arg2 : access linux_dcache_h.dentry;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1416
   pragma Import (CPP, vfs_unlink, "_Z10vfs_unlinkP5inodeP6dentryPS0_");

   function vfs_rename
     (arg1 : access inode;
      arg2 : access linux_dcache_h.dentry;
      arg3 : access inode;
      arg4 : access linux_dcache_h.dentry;
      arg5 : System.Address;
      arg6 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1417
   pragma Import (CPP, vfs_rename, "_Z10vfs_renameP5inodeP6dentryS0_S2_PS0_j");

  -- * VFS dentry helper functions.
  --  

   procedure dentry_unhash (the_dentry : access linux_dcache_h.dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1422
   pragma Import (CPP, dentry_unhash, "_Z13dentry_unhashP6dentry");

  -- * VFS file helper functions.
  --  

   procedure inode_init_owner
     (the_inode : access inode;
      dir : access constant inode;
      mode : linux_types_h.umode_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1427
   pragma Import (CPP, inode_init_owner, "_Z16inode_init_ownerP5inodePKS_t");

  -- * VFS FS_IOC_FIEMAP helper definitions.
  --  

  -- Flags as passed from user  
   type fiemap_extent_info is record
      fi_flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1433
      fi_extents_mapped : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1434
      fi_extents_max : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1435
      fi_extents_start : access uapi_linux_fiemap_h.fiemap_extent;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1436
   end record;
   pragma Convention (C_Pass_By_Copy, fiemap_extent_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1432

  -- Number of mapped extents  
  -- Size of fiemap_extent array  
  -- Start of
  --							fiemap_extent array  

   function fiemap_fill_next_extent
     (info : access fiemap_extent_info;
      logical : asm_generic_int_ll64_h.u64;
      phys : asm_generic_int_ll64_h.u64;
      len : asm_generic_int_ll64_h.u64;
      flags : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1439
   pragma Import (CPP, fiemap_fill_next_extent, "_Z23fiemap_fill_next_extentP18fiemap_extent_infoyyyj");

   function fiemap_check_flags (fieinfo : access fiemap_extent_info; fs_flags : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1441
   pragma Import (CPP, fiemap_check_flags, "_Z18fiemap_check_flagsP18fiemap_extent_infoj");

  -- * File types
  -- *
  -- * NOTE! These match bits 12..15 of stat.st_mode
  -- * (ie "(i_mode >> 12) & 15").
  --  

  -- * This is the "filldir" function type, used by readdir() to let
  -- * the kernel specify what kind of dirent layout it wants to have.
  -- * This allows the kernel to read directories into kernel space or
  -- * to have different dirent layouts depending on the binary type.
  --  

   type filldir_t is access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : linux_types_h.loff_t;
         arg5 : asm_generic_int_ll64_h.u64;
         arg6 : unsigned) return int;
   pragma Convention (C, filldir_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1465

   package Class_dir_context is
      type dir_context is limited record
         actor : filldir_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1467
         pos : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1468
      end record;
      pragma Import (CPP, dir_context);
   end;
   use Class_dir_context;
   --  skipped empty struct block_device_operations

  -- These macros are for out of kernel modules to test that
  -- * the kernel supports the unlocked_ioctl and compat_ioctl
  -- * fields in struct file_operations.  

   type file_operations is record
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1482
      llseek : access function
           (arg1 : access file;
            arg2 : linux_types_h.loff_t;
            arg3 : int) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1483
      read : access function
           (arg1 : access file;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : linux_types_h.size_t;
            arg4 : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1484
      write : access function
           (arg1 : access file;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : linux_types_h.size_t;
            arg4 : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1485
      aio_read : access function
           (arg1 : System.Address;
            arg2 : access constant uapi_linux_uio_h.iovec;
            arg3 : unsigned_long;
            arg4 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1486
      aio_write : access function
           (arg1 : System.Address;
            arg2 : access constant uapi_linux_uio_h.iovec;
            arg3 : unsigned_long;
            arg4 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1487
      read_iter : access function (arg1 : System.Address; arg2 : access linux_uio_h.iov_iter) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1488
      write_iter : access function (arg1 : System.Address; arg2 : access linux_uio_h.iov_iter) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1489
      iterate : access function (arg1 : access file; arg2 : access dir_context) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1490
      poll : access function (arg1 : access file; arg2 : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1491
      unlocked_ioctl : access function
           (arg1 : access file;
            arg2 : unsigned;
            arg3 : unsigned_long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1492
      compat_ioctl : access function
           (arg1 : access file;
            arg2 : unsigned;
            arg3 : unsigned_long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1493
      mmap : access function (arg1 : access file; arg2 : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1494
      open : access function (arg1 : access inode; arg2 : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1495
      flush : access function (arg1 : access file; arg2 : fl_owner_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1496
      release : access function (arg1 : access inode; arg2 : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1497
      fsync : access function
           (arg1 : access file;
            arg2 : linux_types_h.loff_t;
            arg3 : linux_types_h.loff_t;
            arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1498
      aio_fsync : access function (arg1 : System.Address; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1499
      fasync : access function
           (arg1 : int;
            arg2 : access file;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1500
      lock : access function
           (arg1 : access file;
            arg2 : int;
            arg3 : access file_lock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1501
      sendpage : access function
           (arg1 : access file;
            arg2 : access linux_mm_types_h.page;
            arg3 : int;
            arg4 : linux_types_h.size_t;
            arg5 : access linux_types_h.loff_t;
            arg6 : int) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1502
      get_unmapped_area : access function
           (arg1 : access file;
            arg2 : unsigned_long;
            arg3 : unsigned_long;
            arg4 : unsigned_long;
            arg5 : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1503
      check_flags : access function (arg1 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1504
      flock : access function
           (arg1 : access file;
            arg2 : int;
            arg3 : access file_lock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1505
      splice_write : access function
           (arg1 : System.Address;
            arg2 : access file;
            arg3 : access linux_types_h.loff_t;
            arg4 : linux_types_h.size_t;
            arg5 : unsigned) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1506
      splice_read : access function
           (arg1 : access file;
            arg2 : access linux_types_h.loff_t;
            arg3 : System.Address;
            arg4 : linux_types_h.size_t;
            arg5 : unsigned) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1507
      setlease : access function
           (arg1 : access file;
            arg2 : long;
            arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1508
      fallocate : access function
           (arg1 : access file;
            arg2 : int;
            arg3 : linux_types_h.loff_t;
            arg4 : linux_types_h.loff_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1510
      show_fdinfo : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1511
   end record;
   pragma Convention (C_Pass_By_Copy, file_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1481

   type inode_operations is record
      lookup : access function
           (arg1 : access inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : unsigned) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1515
      follow_link : access function (arg1 : access linux_dcache_h.dentry; arg2 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1516
      permission : access function (arg1 : access inode; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1517
      get_acl : access function (arg1 : access inode; arg2 : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1518
      readlink : access function
           (arg1 : access linux_dcache_h.dentry;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1520
      put_link : access procedure
           (arg1 : access linux_dcache_h.dentry;
            arg2 : System.Address;
            arg3 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1521
      create : access function
           (arg1 : access inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : linux_types_h.umode_t;
            arg4 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1523
      link : access function
           (arg1 : access linux_dcache_h.dentry;
            arg2 : access inode;
            arg3 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1524
      unlink : access function (arg1 : access inode; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1525
      symlink : access function
           (arg1 : access inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1526
      mkdir : access function
           (arg1 : access inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1527
      rmdir : access function (arg1 : access inode; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1528
      mknod : access function
           (arg1 : access inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : linux_types_h.umode_t;
            arg4 : linux_types_h.dev_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1529
      rename : access function
           (arg1 : access inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : access inode;
            arg4 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1531
      rename2 : access function
           (arg1 : access inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : access inode;
            arg4 : access linux_dcache_h.dentry;
            arg5 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1533
      setattr : access function (arg1 : access linux_dcache_h.dentry; arg2 : access iattr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1534
      getattr : access function
           (arg1 : System.Address;
            arg2 : access linux_dcache_h.dentry;
            arg3 : access linux_stat_h.kstat) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1535
      setxattr : access function
           (arg1 : access linux_dcache_h.dentry;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : System.Address;
            arg4 : linux_types_h.size_t;
            arg5 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1536
      getxattr : access function
           (arg1 : access linux_dcache_h.dentry;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : System.Address;
            arg4 : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1537
      listxattr : access function
           (arg1 : access linux_dcache_h.dentry;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1538
      removexattr : access function (arg1 : access linux_dcache_h.dentry; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1539
      fiemap : access function
           (arg1 : access inode;
            arg2 : access fiemap_extent_info;
            arg3 : asm_generic_int_ll64_h.u64;
            arg4 : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1541
      update_time : access function
           (arg1 : access inode;
            arg2 : access uapi_linux_time_h.timespec;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1542
      atomic_open : access function
           (arg1 : access inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : access file;
            arg4 : unsigned;
            arg5 : linux_types_h.umode_t;
            arg6 : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1545
      tmpfile : access function
           (arg1 : access inode;
            arg2 : access linux_dcache_h.dentry;
            arg3 : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1546
      set_acl : access function
           (arg1 : access inode;
            arg2 : System.Address;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1547
   end record;
   pragma Convention (C_Pass_By_Copy, inode_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1514

   function rw_copy_check_uvector
     (c_type : int;
      uvector : access constant uapi_linux_uio_h.iovec;
      nr_segs : unsigned_long;
      fast_segs : unsigned_long;
      fast_pointer : access uapi_linux_uio_h.iovec;
      ret_pointer : System.Address) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1550
   pragma Import (CPP, rw_copy_check_uvector, "_Z21rw_copy_check_uvectoriPK5iovecmmPS_PS2_");

   function vfs_read
     (arg1 : access file;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : linux_types_h.size_t;
      arg4 : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1555
   pragma Import (CPP, vfs_read, "_Z8vfs_readP4filePcmPx");

   function vfs_write
     (arg1 : access file;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : linux_types_h.size_t;
      arg4 : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1556
   pragma Import (CPP, vfs_write, "_Z9vfs_writeP4filePKcmPx");

   function vfs_readv
     (arg1 : access file;
      arg2 : access constant uapi_linux_uio_h.iovec;
      arg3 : unsigned_long;
      arg4 : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1557
   pragma Import (CPP, vfs_readv, "_Z9vfs_readvP4filePK5iovecmPx");

   function vfs_writev
     (arg1 : access file;
      arg2 : access constant uapi_linux_uio_h.iovec;
      arg3 : unsigned_long;
      arg4 : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1559
   pragma Import (CPP, vfs_writev, "_Z10vfs_writevP4filePK5iovecmPx");

   type super_operations is record
      alloc_inode : access function (arg1 : access super_block) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1563
      destroy_inode : access procedure (arg1 : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1564
      dirty_inode : access procedure (arg1 : access inode; arg2 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1566
      write_inode : access function (arg1 : access inode; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1567
      drop_inode : access function (arg1 : access inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1568
      evict_inode : access procedure (arg1 : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1569
      put_super : access procedure (arg1 : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1570
      sync_fs : access function (arg1 : access super_block; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1571
      freeze_fs : access function (arg1 : access super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1572
      unfreeze_fs : access function (arg1 : access super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1573
      statfs : access function (arg1 : access linux_dcache_h.dentry; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1574
      remount_fs : access function
           (arg1 : access super_block;
            arg2 : access int;
            arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1575
      umount_begin : access procedure (arg1 : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1576
      show_options : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1578
      show_devname : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1579
      show_path : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1580
      show_stats : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1581
      quota_read : access function
           (arg1 : access super_block;
            arg2 : int;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : linux_types_h.size_t;
            arg5 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1583
      quota_write : access function
           (arg1 : access super_block;
            arg2 : int;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : linux_types_h.size_t;
            arg5 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1584
      bdev_try_to_free_page : access function
           (arg1 : access super_block;
            arg2 : access linux_mm_types_h.page;
            arg3 : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1586
      nr_cached_objects : access function (arg1 : access super_block; arg2 : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1587
      free_cached_objects : access function
           (arg1 : access super_block;
            arg2 : long;
            arg3 : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1588
   end record;
   pragma Convention (C_Pass_By_Copy, super_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1562

  -- * Inode flags - they have no relation to superblock flags now
  --  

  -- * Note that nosuid etc flags are inode-specific: setting some file-system
  -- * flags just means all the inodes inherit those flags by default. It might be
  -- * possible to override it selectively if you really wanted to with some
  -- * ioctl() that is not currently implemented.
  -- *
  -- * Exception: MS_RDONLY is always applied to the entire file system.
  -- *
  -- * Unfortunately, it is possible to change a filesystems flags with it mounted
  -- * with files in use.  This means that all of the inodes will not have their
  -- * i_flags updated.  Hence, i_flags no longer inherit the superblock mount
  -- * flags, so these have to be checked separately. -- rmk@arm.uk.linux.org
  --  

  -- * Inode state bits.  Protected by inode->i_lock
  -- *
  -- * Three bits determine the dirty state of the inode, I_DIRTY_SYNC,
  -- * I_DIRTY_DATASYNC and I_DIRTY_PAGES.
  -- *
  -- * Four bits define the lifetime of an inode.  Initially, inodes are I_NEW,
  -- * until that flag is cleared.  I_WILL_FREE, I_FREEING and I_CLEAR are set at
  -- * various stages of removing an inode.
  -- *
  -- * Two bits are used for locking and completion notification, I_NEW and I_SYNC.
  -- *
  -- * I_DIRTY_SYNC		Inode is dirty, but doesn't have to be written on
  -- *			fdatasync().  i_atime is the usual cause.
  -- * I_DIRTY_DATASYNC	Data-related inode changes pending. We keep track of
  -- *			these changes separately from I_DIRTY_SYNC so that we
  -- *			don't have to write inode on fdatasync() when only
  -- *			mtime has changed in it.
  -- * I_DIRTY_PAGES	Inode has dirty pages.  Inode itself may be clean.
  -- * I_NEW		Serves as both a mutex and completion notification.
  -- *			New inodes set I_NEW.  If two processes both create
  -- *			the same inode, one of them will release its inode and
  -- *			wait for I_NEW to be released before returning.
  -- *			Inodes in I_WILL_FREE, I_FREEING or I_CLEAR state can
  -- *			also cause waiting on I_NEW, without I_NEW actually
  -- *			being set.  find_inode() uses this to prevent returning
  -- *			nearly-dead inodes.
  -- * I_WILL_FREE		Must be set when calling write_inode_now() if i_count
  -- *			is zero.  I_FREEING must be set when I_WILL_FREE is
  -- *			cleared.
  -- * I_FREEING		Set when inode is about to be freed but still has dirty
  -- *			pages or buffers attached or the inode itself is still
  -- *			dirty.
  -- * I_CLEAR		Added by clear_inode().  In this state the inode is
  -- *			clean and can be destroyed.  Inode keeps I_FREEING.
  -- *
  -- *			Inodes that are I_WILL_FREE, I_FREEING or I_CLEAR are
  -- *			prohibited for many purposes.  iget() must wait for
  -- *			the inode to be completely released, then create it
  -- *			anew.  Other functions will just ignore such inodes,
  -- *			if appropriate.  I_NEW is used for waiting.
  -- *
  -- * I_SYNC		Writeback of inode is running. The bit is set during
  -- *			data writeback, and cleared with a wakeup on the bit
  -- *			address once it is done. The bit is also used to pin
  -- *			the inode in memory for flusher thread.
  -- *
  -- * I_REFERENCED		Marks the inode as recently references on the LRU list.
  -- *
  -- * I_DIO_WAKEUP		Never set.  Only used as a key for wait_on_bit().
  -- *
  -- * Q: What is the difference between I_WILL_FREE and I_FREEING?
  --  

   --  skipped func __mark_inode_dirty

   procedure mark_inode_dirty (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1716
   pragma Import (CPP, mark_inode_dirty, "_ZL16mark_inode_dirtyP5inode");

   procedure mark_inode_dirty_sync (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1721
   pragma Import (CPP, mark_inode_dirty_sync, "_ZL21mark_inode_dirty_syncP5inode");

   procedure inc_nlink (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1726
   pragma Import (CPP, inc_nlink, "_Z9inc_nlinkP5inode");

   procedure drop_nlink (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1727
   pragma Import (CPP, drop_nlink, "_Z10drop_nlinkP5inode");

   procedure clear_nlink (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1728
   pragma Import (CPP, clear_nlink, "_Z11clear_nlinkP5inode");

   procedure set_nlink (the_inode : access inode; nlink : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1729
   pragma Import (CPP, set_nlink, "_Z9set_nlinkP5inodej");

   procedure inode_inc_link_count (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1731
   pragma Import (CPP, inode_inc_link_count, "_ZL20inode_inc_link_countP5inode");

   procedure inode_dec_link_count (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1737
   pragma Import (CPP, inode_dec_link_count, "_ZL20inode_dec_link_countP5inode");

  --*
  -- * inode_inc_iversion - increments i_version
  -- * @inode: inode that need to be updated
  -- *
  -- * Every time the inode is modified, the i_version field will be incremented.
  -- * The filesystem has to be mounted with i_version flag
  --  

   procedure inode_inc_iversion (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1751
   pragma Import (CPP, inode_inc_iversion, "_ZL18inode_inc_iversionP5inode");

   subtype file_time_flags is unsigned;
   S_ATIME : constant file_time_flags := 1;
   S_MTIME : constant file_time_flags := 2;
   S_CTIME : constant file_time_flags := 4;
   S_VERSION : constant file_time_flags := 8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1758

   procedure touch_atime (arg1 : access constant linux_path_h.path);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1765
   pragma Import (CPP, touch_atime, "_Z11touch_atimePK4path");

   procedure file_accessed (the_file : access file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1766
   pragma Import (CPP, file_accessed, "_ZL13file_accessedP4file");

   function sync_inode (the_inode : access inode; wbc : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1772
   pragma Import (CPP, sync_inode, "_Z10sync_inodeP5inodeP17writeback_control");

   function sync_inode_metadata (the_inode : access inode; wait : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1773
   pragma Import (CPP, sync_inode_metadata, "_Z19sync_inode_metadataP5inodei");

   type file_system_type_s_writers_key_array is array (0 .. 2) of aliased linux_lockdep_h.lock_class_key;
   type file_system_type is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1776
      fs_flags : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1777
      mount : access function
           (arg1 : access file_system_type;
            arg2 : int;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : System.Address) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1785
      kill_sb : access procedure (arg1 : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1786
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1787
      next : access file_system_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1788
      fs_supers : aliased linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1789
      s_lock_key : aliased linux_lockdep_h.lock_class_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1791
      s_umount_key : aliased linux_lockdep_h.lock_class_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1792
      s_vfs_rename_key : aliased linux_lockdep_h.lock_class_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1793
      s_writers_key : aliased file_system_type_s_writers_key_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1794
      i_lock_key : aliased linux_lockdep_h.lock_class_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1796
      i_mutex_key : aliased linux_lockdep_h.lock_class_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1797
      i_mutex_dir_key : aliased linux_lockdep_h.lock_class_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1798
   end record;
   pragma Convention (C_Pass_By_Copy, file_system_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1775

   function mount_ns
     (fs_type : access file_system_type;
      flags : int;
      data : System.Address;
      fill_super : access function
        (arg1 : access super_block;
         arg2 : System.Address;
         arg3 : int) return int) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1803
   pragma Import (CPP, mount_ns, "_Z8mount_nsP16file_system_typeiPvPFiP11super_blockS1_iE");

   function mount_bdev
     (fs_type : access file_system_type;
      flags : int;
      dev_name : Interfaces.C.Strings.chars_ptr;
      data : System.Address;
      fill_super : access function
        (arg1 : access super_block;
         arg2 : System.Address;
         arg3 : int) return int) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1805
   pragma Import (CPP, mount_bdev, "_Z10mount_bdevP16file_system_typeiPKcPvPFiP11super_blockS3_iE");

   function mount_single
     (fs_type : access file_system_type;
      flags : int;
      data : System.Address;
      fill_super : access function
        (arg1 : access super_block;
         arg2 : System.Address;
         arg3 : int) return int) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1808
   pragma Import (CPP, mount_single, "_Z12mount_singleP16file_system_typeiPvPFiP11super_blockS1_iE");

   function mount_nodev
     (fs_type : access file_system_type;
      flags : int;
      data : System.Address;
      fill_super : access function
        (arg1 : access super_block;
         arg2 : System.Address;
         arg3 : int) return int) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1811
   pragma Import (CPP, mount_nodev, "_Z11mount_nodevP16file_system_typeiPvPFiP11super_blockS1_iE");

   function mount_subtree (mnt : System.Address; path : Interfaces.C.Strings.chars_ptr) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1814
   pragma Import (CPP, mount_subtree, "_Z13mount_subtreeP8vfsmountPKc");

   procedure generic_shutdown_super (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1815
   pragma Import (CPP, generic_shutdown_super, "_Z22generic_shutdown_superP11super_block");

   procedure kill_block_super (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1816
   pragma Import (CPP, kill_block_super, "_Z16kill_block_superP11super_block");

   procedure kill_anon_super (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1817
   pragma Import (CPP, kill_anon_super, "_Z15kill_anon_superP11super_block");

   procedure kill_litter_super (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1818
   pragma Import (CPP, kill_litter_super, "_Z17kill_litter_superP11super_block");

   procedure deactivate_super (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1819
   pragma Import (CPP, deactivate_super, "_Z16deactivate_superP11super_block");

   procedure deactivate_locked_super (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1820
   pragma Import (CPP, deactivate_locked_super, "_Z23deactivate_locked_superP11super_block");

   function set_anon_super (s : access super_block; data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1821
   pragma Import (CPP, set_anon_super, "_Z14set_anon_superP11super_blockPv");

   function get_anon_bdev (arg1 : access linux_types_h.dev_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1822
   pragma Import (CPP, get_anon_bdev, "_Z13get_anon_bdevPj");

   procedure free_anon_bdev (arg1 : linux_types_h.dev_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1823
   pragma Import (CPP, free_anon_bdev, "_Z14free_anon_bdevj");

   function sget
     (c_type : access file_system_type;
      test : access function (arg1 : access super_block; arg2 : System.Address) return int;
      set : access function (arg1 : access super_block; arg2 : System.Address) return int;
      flags : int;
      data : System.Address) return access super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1824
   pragma Import (CPP, sget, "_Z4sgetP16file_system_typePFiP11super_blockPvES5_iS3_");

   function mount_pseudo
     (arg1 : access file_system_type;
      arg2 : Interfaces.C.Strings.chars_ptr;
      ops : access constant super_operations;
      dops : access constant linux_dcache_h.dentry_operations;
      arg5 : unsigned_long) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1828
   pragma Import (CPP, mount_pseudo, "_Z12mount_pseudoP16file_system_typePcPK16super_operationsPK17dentry_operationsm");

  -- Alas, no aliases. Too much hassle with bringing module.h everywhere  
  -- * This one is to be used *ONLY* from ->open() instances.
  -- * fops must be non-NULL, pinned down *and* module dependencies
  -- * should be sufficient to pin the caller down as well.
  --  

   function register_filesystem (arg1 : access file_system_type) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1850
   pragma Import (CPP, register_filesystem, "_Z19register_filesystemP16file_system_type");

   function unregister_filesystem (arg1 : access file_system_type) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1851
   pragma Import (CPP, unregister_filesystem, "_Z21unregister_filesystemP16file_system_type");

   function kern_mount_data (arg1 : access file_system_type; data : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1852
   pragma Import (CPP, kern_mount_data, "_Z15kern_mount_dataP16file_system_typePv");

   procedure kern_unmount (mnt : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1854
   pragma Import (CPP, kern_unmount, "_Z12kern_unmountP8vfsmount");

   function may_umount_tree (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1855
   pragma Import (CPP, may_umount_tree, "_Z15may_umount_treeP8vfsmount");

   function may_umount (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1856
   pragma Import (CPP, may_umount, "_Z10may_umountP8vfsmount");

   function do_mount
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : unsigned_long;
      arg5 : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1857
   pragma Import (CPP, do_mount, "_Z8do_mountPKcS0_S0_mPv");

   function collect_mounts (arg1 : access linux_path_h.path) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1858
   pragma Import (CPP, collect_mounts, "_Z14collect_mountsP4path");

   procedure drop_collected_mounts (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1859
   pragma Import (CPP, drop_collected_mounts, "_Z21drop_collected_mountsP8vfsmount");

   function iterate_mounts
     (arg1 : access function (arg1 : System.Address; arg2 : System.Address) return int;
      arg2 : System.Address;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1860
   pragma Import (CPP, iterate_mounts, "_Z14iterate_mountsPFiP8vfsmountPvES1_S0_");

   function vfs_statfs (arg1 : access linux_path_h.path; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1862
   pragma Import (CPP, vfs_statfs, "_Z10vfs_statfsP4pathP7kstatfs");

   function user_statfs (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1863
   pragma Import (CPP, user_statfs, "_Z11user_statfsPKcP7kstatfs");

   function fd_statfs (arg1 : int; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1864
   pragma Import (CPP, fd_statfs, "_Z9fd_statfsiP7kstatfs");

   function vfs_ustat (arg1 : linux_types_h.dev_t; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1865
   pragma Import (CPP, vfs_ustat, "_Z9vfs_ustatjP7kstatfs");

   function freeze_super (super : access super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1866
   pragma Import (CPP, freeze_super, "_Z12freeze_superP11super_block");

   function thaw_super (super : access super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1867
   pragma Import (CPP, thaw_super, "_Z10thaw_superP11super_block");

   function our_mnt (mnt : System.Address) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1868
   pragma Import (CPP, our_mnt, "_Z7our_mntP8vfsmount");

   function fs_fully_visible (arg1 : access file_system_type) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1869
   pragma Import (CPP, fs_fully_visible, "_Z16fs_fully_visibleP16file_system_type");

   function current_umask return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1871
   pragma Import (CPP, current_umask, "_Z13current_umaskv");

   procedure ihold (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1873
   pragma Import (CPP, ihold, "_Z5iholdP5inode");

   procedure iput (arg1 : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1874
   pragma Import (CPP, iput, "_Z4iputP5inode");

   function file_inode (f : access file) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1876
   pragma Import (CPP, file_inode, "_ZL10file_inodeP4file");

  -- /sys/fs  
   fs_kobj : access linux_kobject_h.kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1882
   pragma Import (C, fs_kobj, "fs_kobj");

   function locks_mandatory_locked (arg1 : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1890
   pragma Import (CPP, locks_mandatory_locked, "_Z22locks_mandatory_lockedP4file");

   function locks_mandatory_area
     (arg1 : int;
      arg2 : access inode;
      arg3 : access file;
      arg4 : linux_types_h.loff_t;
      arg5 : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1891
   pragma Import (CPP, locks_mandatory_area, "_Z20locks_mandatory_areaiP5inodeP4filexm");

  -- * Candidates for mandatory locking have the setgid bit set
  -- * but no group execute bit -  an otherwise meaningless combination.
  --  

   --  skipped func __mandatory_lock

  -- * ... and these candidates should be on MS_MANDLOCK mounted fs,
  -- * otherwise these will be advisory locks
  --  

   function mandatory_lock (ino : access inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1908
   pragma Import (CPP, mandatory_lock, "_ZL14mandatory_lockP5inode");

   function locks_verify_locked (the_file : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1913
   pragma Import (CPP, locks_verify_locked, "_ZL19locks_verify_lockedP4file");

   function locks_verify_truncate
     (the_inode : access inode;
      filp : access file;
      size : linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1920
   pragma Import (CPP, locks_verify_truncate, "_ZL21locks_verify_truncateP5inodeP4filex");

   function break_lease (the_inode : access inode; mode : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1934
   pragma Import (CPP, break_lease, "_ZL11break_leaseP5inodej");

  --	 * Since this check is lockless, we must ensure that any refcounts
  --	 * taken are done before checking inode->i_flock. Otherwise, we could
  --	 * end up racing with tasks trying to set a new lease on this file.
  --	  

   function break_deleg (the_inode : access inode; mode : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1947
   pragma Import (CPP, break_deleg, "_ZL11break_delegP5inodej");

  --	 * Since this check is lockless, we must ensure that any refcounts
  --	 * taken are done before checking inode->i_flock. Otherwise, we could
  --	 * end up racing with tasks trying to set a new lease on this file.
  --	  

   function try_break_deleg (the_inode : access inode; delegated_inode : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1960
   pragma Import (CPP, try_break_deleg, "_ZL15try_break_delegP5inodePS0_");

   function break_deleg_wait (delegated_inode : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:1972
   pragma Import (CPP, break_deleg_wait, "_ZL16break_deleg_waitPP5inode");

  -- fs/open.c  
   --  skipped empty struct audit_names

  -- pointer to actual string  
   type filename is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2042
      uptr : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2043
      aname : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2044
      c_separate : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2045
   end record;
   pragma Convention (C_Pass_By_Copy, filename);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2041

  -- original userland pointer  
  -- should "name" be freed?  
   function vfs_truncate (arg1 : access linux_path_h.path; arg2 : linux_types_h.loff_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2048
   pragma Import (CPP, vfs_truncate, "_Z12vfs_truncateP4pathx");

   function do_truncate
     (arg1 : access linux_dcache_h.dentry;
      start : linux_types_h.loff_t;
      time_attrs : unsigned;
      filp : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2049
   pragma Import (CPP, do_truncate, "_Z11do_truncateP6dentryxjP4file");

   function do_fallocate
     (the_file : access file;
      mode : int;
      offset : linux_types_h.loff_t;
      len : linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2051
   pragma Import (CPP, do_fallocate, "_Z12do_fallocateP4fileixx");

   function do_sys_open
     (dfd : int;
      filename : Interfaces.C.Strings.chars_ptr;
      flags : int;
      mode : linux_types_h.umode_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2053
   pragma Import (CPP, do_sys_open, "_Z11do_sys_openiPKcit");

   function file_open_name
     (arg1 : access filename;
      arg2 : int;
      arg3 : linux_types_h.umode_t) return access file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2055
   pragma Import (CPP, file_open_name, "_Z14file_open_nameP8filenameit");

   function filp_open
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : linux_types_h.umode_t) return access file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2056
   pragma Import (CPP, filp_open, "_Z9filp_openPKcit");

   function file_open_root
     (arg1 : access linux_dcache_h.dentry;
      arg2 : System.Address;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int) return access file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2057
   pragma Import (CPP, file_open_root, "_Z14file_open_rootP6dentryP8vfsmountPKci");

   function dentry_open
     (arg1 : access constant linux_path_h.path;
      arg2 : int;
      arg3 : access constant linux_cred_h.cred) return access file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2059
   pragma Import (CPP, dentry_open, "_Z11dentry_openPK4pathiPK4cred");

   function filp_close (arg1 : access file; id : fl_owner_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2060
   pragma Import (CPP, filp_close, "_Z10filp_closeP4fileP12files_struct");

   function getname (arg1 : Interfaces.C.Strings.chars_ptr) return access filename;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2062
   pragma Import (CPP, getname, "_Z7getnamePKc");

   function getname_kernel (arg1 : Interfaces.C.Strings.chars_ptr) return access filename;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2063
   pragma Import (CPP, getname_kernel, "_Z14getname_kernelPKc");

   function finish_open
     (the_file : access file;
      the_dentry : access linux_dcache_h.dentry;
      open : access function (arg1 : access inode; arg2 : access file) return int;
      opened : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2069
   pragma Import (CPP, finish_open, "_Z11finish_openP4fileP6dentryPFiP5inodeS0_EPi");

   function finish_no_open (the_file : access file; the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2072
   pragma Import (CPP, finish_no_open, "_Z14finish_no_openP4fileP6dentry");

  -- fs/ioctl.c  
   function ioctl_preallocate (filp : access file; argp : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2076
   pragma Import (CPP, ioctl_preallocate, "_Z17ioctl_preallocateP4filePv");

  -- fs/dcache.c  
   procedure vfs_caches_init_early;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2079
   pragma Import (CPP, vfs_caches_init_early, "_Z21vfs_caches_init_earlyv");

   procedure vfs_caches_init (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2080
   pragma Import (CPP, vfs_caches_init, "_Z15vfs_caches_initm");

   names_cachep : access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2082
   pragma Import (C, names_cachep, "names_cachep");

   procedure final_putname (name : access filename);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2084
   pragma Import (CPP, final_putname, "_Z13final_putnameP8filename");

   procedure putname (name : access filename);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2091
   pragma Import (CPP, putname, "_Z7putnameP8filename");

   function register_blkdev (arg1 : unsigned; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2095
   pragma Import (CPP, register_blkdev, "_Z15register_blkdevjPKc");

   procedure unregister_blkdev (arg1 : unsigned; arg2 : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2096
   pragma Import (CPP, unregister_blkdev, "_Z17unregister_blkdevjPKc");

   function bdget (arg1 : linux_types_h.dev_t) return access block_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2097
   pragma Import (CPP, bdget, "_Z5bdgetj");

   function bdgrab (bdev : access block_device) return access block_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2098
   pragma Import (CPP, bdgrab, "_Z6bdgrabP12block_device");

   procedure bd_set_size (arg1 : access block_device; size : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2099
   pragma Import (CPP, bd_set_size, "_Z11bd_set_sizeP12block_devicex");

   procedure bd_forget (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2100
   pragma Import (CPP, bd_forget, "_Z9bd_forgetP5inode");

   procedure bdput (arg1 : access block_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2101
   pragma Import (CPP, bdput, "_Z5bdputP12block_device");

   procedure invalidate_bdev (arg1 : access block_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2102
   pragma Import (CPP, invalidate_bdev, "_Z15invalidate_bdevP12block_device");

   procedure iterate_bdevs (arg1 : access procedure (arg1 : access block_device; arg2 : System.Address); arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2103
   pragma Import (CPP, iterate_bdevs, "_Z13iterate_bdevsPFvP12block_devicePvES1_");

   function sync_blockdev (bdev : access block_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2104
   pragma Import (CPP, sync_blockdev, "_Z13sync_blockdevP12block_device");

   procedure kill_bdev (arg1 : access block_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2105
   pragma Import (CPP, kill_bdev, "_Z9kill_bdevP12block_device");

   function freeze_bdev (arg1 : access block_device) return access super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2106
   pragma Import (CPP, freeze_bdev, "_Z11freeze_bdevP12block_device");

   procedure emergency_thaw_all;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2107
   pragma Import (CPP, emergency_thaw_all, "_Z18emergency_thaw_allv");

   function thaw_bdev (bdev : access block_device; sb : access super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2108
   pragma Import (CPP, thaw_bdev, "_Z9thaw_bdevP12block_deviceP11super_block");

   function fsync_bdev (arg1 : access block_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2109
   pragma Import (CPP, fsync_bdev, "_Z10fsync_bdevP12block_device");

   function sb_is_blkdev_sb (sb : access super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2110
   pragma Import (CPP, sb_is_blkdev_sb, "_Z15sb_is_blkdev_sbP11super_block");

   function sync_filesystem (arg1 : access super_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2136
   pragma Import (CPP, sync_filesystem, "_Z15sync_filesystemP11super_block");

   def_blk_fops : aliased file_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2137
   pragma Import (C, def_blk_fops, "def_blk_fops");

   def_chr_fops : aliased file_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2138
   pragma Import (C, def_chr_fops, "def_chr_fops");

   bad_sock_fops : aliased file_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2139
   pragma Import (C, bad_sock_fops, "bad_sock_fops");

   function ioctl_by_bdev
     (arg1 : access block_device;
      arg2 : unsigned;
      arg3 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2141
   pragma Import (CPP, ioctl_by_bdev, "_Z13ioctl_by_bdevP12block_devicejm");

   function blkdev_ioctl
     (arg1 : access block_device;
      arg2 : linux_types_h.fmode_t;
      arg3 : unsigned;
      arg4 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2142
   pragma Import (CPP, blkdev_ioctl, "_Z12blkdev_ioctlP12block_devicejjm");

   function compat_blkdev_ioctl
     (arg1 : access file;
      arg2 : unsigned;
      arg3 : unsigned_long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2143
   pragma Import (CPP, compat_blkdev_ioctl, "_Z19compat_blkdev_ioctlP4filejm");

   function blkdev_get
     (bdev : access block_device;
      mode : linux_types_h.fmode_t;
      holder : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2144
   pragma Import (CPP, blkdev_get, "_Z10blkdev_getP12block_devicejPv");

   function blkdev_get_by_path
     (path : Interfaces.C.Strings.chars_ptr;
      mode : linux_types_h.fmode_t;
      holder : System.Address) return access block_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2145
   pragma Import (CPP, blkdev_get_by_path, "_Z18blkdev_get_by_pathPKcjPv");

   function blkdev_get_by_dev
     (dev : linux_types_h.dev_t;
      mode : linux_types_h.fmode_t;
      holder : System.Address) return access block_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2147
   pragma Import (CPP, blkdev_get_by_dev, "_Z17blkdev_get_by_devjjPv");

   procedure blkdev_put (bdev : access block_device; mode : linux_types_h.fmode_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2149
   pragma Import (CPP, blkdev_put, "_Z10blkdev_putP12block_devicej");

   function bd_link_disk_holder (bdev : access block_device; disk : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2151
   pragma Import (CPP, bd_link_disk_holder, "_Z19bd_link_disk_holderP12block_deviceP7gendisk");

   procedure bd_unlink_disk_holder (bdev : access block_device; disk : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2152
   pragma Import (CPP, bd_unlink_disk_holder, "_Z21bd_unlink_disk_holderP12block_deviceP7gendisk");

  -- fs/char_dev.c  
   function alloc_chrdev_region
     (arg1 : access linux_types_h.dev_t;
      arg2 : unsigned;
      arg3 : unsigned;
      arg4 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2169
   pragma Import (CPP, alloc_chrdev_region, "_Z19alloc_chrdev_regionPjjjPKc");

   function register_chrdev_region
     (arg1 : linux_types_h.dev_t;
      arg2 : unsigned;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2170
   pragma Import (CPP, register_chrdev_region, "_Z22register_chrdev_regionjjPKc");

   --  skipped func __register_chrdev

   --  skipped func __unregister_chrdev

   procedure unregister_chrdev_region (arg1 : linux_types_h.dev_t; arg2 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2176
   pragma Import (CPP, unregister_chrdev_region, "_Z24unregister_chrdev_regionjj");

   procedure chrdev_show (arg1 : access linux_seq_file_h.seq_file; arg2 : linux_types_h.off_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2177
   pragma Import (CPP, chrdev_show, "_Z11chrdev_showP8seq_filel");

   function register_chrdev
     (major : unsigned;
      name : Interfaces.C.Strings.chars_ptr;
      fops : access constant file_operations) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2179
   pragma Import (CPP, register_chrdev, "_ZL15register_chrdevjPKcPK15file_operations");

   procedure unregister_chrdev (major : unsigned; name : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2185
   pragma Import (CPP, unregister_chrdev, "_ZL17unregister_chrdevjPKc");

  -- fs/block_dev.c  
   --  skipped func __bdevname

   function bdevname (bdev : access block_device; buffer : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2197
   pragma Import (CPP, bdevname, "_Z8bdevnameP12block_devicePc");

   function lookup_bdev (arg1 : Interfaces.C.Strings.chars_ptr) return access block_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2198
   pragma Import (CPP, lookup_bdev, "_Z11lookup_bdevPKc");

   procedure blkdev_show (arg1 : access linux_seq_file_h.seq_file; arg2 : linux_types_h.off_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2199
   pragma Import (CPP, blkdev_show, "_Z11blkdev_showP8seq_filel");

   procedure init_special_inode
     (arg1 : access inode;
      arg2 : linux_types_h.umode_t;
      arg3 : linux_types_h.dev_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2205
   pragma Import (CPP, init_special_inode, "_Z18init_special_inodeP5inodetj");

  -- Invalid inode operations -- fs/bad_inode.c  
   procedure make_bad_inode (arg1 : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2208
   pragma Import (CPP, make_bad_inode, "_Z14make_bad_inodeP5inode");

   function is_bad_inode (arg1 : access inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2209
   pragma Import (CPP, is_bad_inode, "_Z12is_bad_inodeP5inode");

  -- * return READ, READA, or WRITE
  --  

  -- * return data direction, READ or WRITE
  --  

   procedure check_disk_size_change (disk : System.Address; bdev : access block_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2222
   pragma Import (CPP, check_disk_size_change, "_Z22check_disk_size_changeP7gendiskP12block_device");

   function revalidate_disk (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2224
   pragma Import (CPP, revalidate_disk, "_Z15revalidate_diskP7gendisk");

   function check_disk_change (arg1 : access block_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2225
   pragma Import (CPP, check_disk_change, "_Z17check_disk_changeP12block_device");

   --  skipped func __invalidate_device

   function invalidate_partition (arg1 : System.Address; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2227
   pragma Import (CPP, invalidate_partition, "_Z20invalidate_partitionP7gendiski");

   function invalidate_mapping_pages
     (mapping : access address_space;
      start : unsigned_long;
      c_end : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2229
   pragma Import (CPP, invalidate_mapping_pages, "_Z24invalidate_mapping_pagesP13address_spacemm");

   procedure invalidate_remote_inode (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2232
   pragma Import (CPP, invalidate_remote_inode, "_ZL23invalidate_remote_inodeP5inode");

   function invalidate_inode_pages2 (mapping : access address_space) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2238
   pragma Import (CPP, invalidate_inode_pages2, "_Z23invalidate_inode_pages2P13address_space");

   function invalidate_inode_pages2_range
     (mapping : access address_space;
      start : unsigned_long;
      c_end : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2239
   pragma Import (CPP, invalidate_inode_pages2_range, "_Z29invalidate_inode_pages2_rangeP13address_spacemm");

   function write_inode_now (arg1 : access inode; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2241
   pragma Import (CPP, write_inode_now, "_Z15write_inode_nowP5inodei");

   function filemap_fdatawrite (arg1 : access address_space) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2242
   pragma Import (CPP, filemap_fdatawrite, "_Z18filemap_fdatawriteP13address_space");

   function filemap_flush (arg1 : access address_space) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2243
   pragma Import (CPP, filemap_flush, "_Z13filemap_flushP13address_space");

   function filemap_fdatawait (arg1 : access address_space) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2244
   pragma Import (CPP, filemap_fdatawait, "_Z17filemap_fdatawaitP13address_space");

   function filemap_fdatawait_range
     (arg1 : access address_space;
      lstart : linux_types_h.loff_t;
      lend : linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2245
   pragma Import (CPP, filemap_fdatawait_range, "_Z23filemap_fdatawait_rangeP13address_spacexx");

   function filemap_write_and_wait (mapping : access address_space) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2247
   pragma Import (CPP, filemap_write_and_wait, "_Z22filemap_write_and_waitP13address_space");

   function filemap_write_and_wait_range
     (mapping : access address_space;
      lstart : linux_types_h.loff_t;
      lend : linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2248
   pragma Import (CPP, filemap_write_and_wait_range, "_Z28filemap_write_and_wait_rangeP13address_spacexx");

   --  skipped func __filemap_fdatawrite_range

   function filemap_fdatawrite_range
     (mapping : access address_space;
      start : linux_types_h.loff_t;
      c_end : linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2252
   pragma Import (CPP, filemap_fdatawrite_range, "_Z24filemap_fdatawrite_rangeP13address_spacexx");

   function vfs_fsync_range
     (the_file : access file;
      start : linux_types_h.loff_t;
      c_end : linux_types_h.loff_t;
      datasync : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2255
   pragma Import (CPP, vfs_fsync_range, "_Z15vfs_fsync_rangeP4filexxi");

   function vfs_fsync (the_file : access file; datasync : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2257
   pragma Import (CPP, vfs_fsync, "_Z9vfs_fsyncP4filei");

   function generic_write_sync
     (the_file : access file;
      pos : linux_types_h.loff_t;
      count : linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2258
   pragma Import (CPP, generic_write_sync, "_ZL18generic_write_syncP4filexx");

   procedure emergency_sync;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2265
   pragma Import (CPP, emergency_sync, "_Z14emergency_syncv");

   procedure emergency_remount;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2266
   pragma Import (CPP, emergency_remount, "_Z17emergency_remountv");

   function bmap (arg1 : access inode; arg2 : linux_types_h.sector_t) return linux_types_h.sector_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2268
   pragma Import (CPP, bmap, "_Z4bmapP5inodem");

   function notify_change
     (arg1 : access linux_dcache_h.dentry;
      arg2 : access iattr;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2270
   pragma Import (CPP, notify_change, "_Z13notify_changeP6dentryP5iattrPP5inode");

   function inode_permission (arg1 : access inode; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2271
   pragma Import (CPP, inode_permission, "_Z16inode_permissionP5inodei");

   function generic_permission (arg1 : access inode; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2272
   pragma Import (CPP, generic_permission, "_Z18generic_permissionP5inodei");

   function execute_ok (the_inode : access inode) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2274
   pragma Import (CPP, execute_ok, "_ZL10execute_okP5inode");

   procedure file_start_write (the_file : access file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2279
   pragma Import (CPP, file_start_write, "_ZL16file_start_writeP4file");

   function file_start_write_trylock (the_file : access file) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2286
   pragma Import (CPP, file_start_write_trylock, "_ZL24file_start_write_trylockP4file");

   procedure file_end_write (the_file : access file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2293
   pragma Import (CPP, file_end_write, "_ZL14file_end_writeP4file");

  -- * get_write_access() gets write permission for a file.
  -- * put_write_access() releases this write permission.
  -- * This is used for regular files.
  -- * We cannot support write (and maybe mmap read-write shared) accesses and
  -- * MAP_DENYWRITE mmappings simultaneously. The i_writecount field of an inode
  -- * can have the following values:
  -- * 0: no writers, no VM_DENYWRITE mappings
  -- * < 0: (-i_writecount) vm_area_structs with VM_DENYWRITE set exist
  -- * > 0: (i_writecount) users are writing to the file.
  -- *
  -- * Normally we operate on that counter with atomic_{inc,dec} and it's safe
  -- * except for the cases where we don't hold i_writecount yet. Then we need to
  -- * use {get,deny}_write_access() - these functions check the sign and refuse
  -- * to do the change if sign is wrong.
  --  

   function get_write_access (the_inode : access inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2316
   pragma Import (CPP, get_write_access, "_ZL16get_write_accessP5inode");

   function deny_write_access (the_file : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2320
   pragma Import (CPP, deny_write_access, "_ZL17deny_write_accessP4file");

   procedure put_write_access (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2325
   pragma Import (CPP, put_write_access, "_ZL16put_write_accessP5inode");

   procedure allow_write_access (the_file : access file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2329
   pragma Import (CPP, allow_write_access, "_ZL18allow_write_accessP4file");

   function inode_is_open_for_write (the_inode : access constant inode) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2334
   pragma Import (CPP, inode_is_open_for_write, "_ZL23inode_is_open_for_writePK5inode");

   procedure i_readcount_dec (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2350
   pragma Import (CPP, i_readcount_dec, "_ZL15i_readcount_decP5inode");

   procedure i_readcount_inc (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2354
   pragma Import (CPP, i_readcount_inc, "_ZL15i_readcount_incP5inode");

   function do_pipe_flags (arg1 : access int; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2359
   pragma Import (CPP, do_pipe_flags, "_Z13do_pipe_flagsPii");

   function kernel_read
     (arg1 : access file;
      arg2 : linux_types_h.loff_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2361
   pragma Import (CPP, kernel_read, "_Z11kernel_readP4filexPcm");

   function kernel_write
     (arg1 : access file;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : linux_types_h.size_t;
      arg4 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2362
   pragma Import (CPP, kernel_write, "_Z12kernel_writeP4filePKcmx");

   function open_exec (arg1 : Interfaces.C.Strings.chars_ptr) return access file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2363
   pragma Import (CPP, open_exec, "_Z9open_execPKc");

  -- fs/dcache.c -- generic fs support functions  
   function is_subdir (arg1 : access linux_dcache_h.dentry; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2366
   pragma Import (CPP, is_subdir, "_Z9is_subdirP6dentryS0_");

   function path_is_under (arg1 : access linux_path_h.path; arg2 : access linux_path_h.path) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2367
   pragma Import (CPP, path_is_under, "_Z13path_is_underP4pathS0_");

  -- needed for stackable file system support  
   function default_llseek
     (the_file : access file;
      offset : linux_types_h.loff_t;
      whence : int) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2372
   pragma Import (CPP, default_llseek, "_Z14default_llseekP4filexi");

   function vfs_llseek
     (the_file : access file;
      offset : linux_types_h.loff_t;
      whence : int) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2374
   pragma Import (CPP, vfs_llseek, "_Z10vfs_llseekP4filexi");

   function inode_init_always (arg1 : access super_block; arg2 : access inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2376
   pragma Import (CPP, inode_init_always, "_Z17inode_init_alwaysP11super_blockP5inode");

   procedure inode_init_once (arg1 : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2377
   pragma Import (CPP, inode_init_once, "_Z15inode_init_onceP5inode");

   procedure address_space_init_once (mapping : access address_space);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2378
   pragma Import (CPP, address_space_init_once, "_Z23address_space_init_onceP13address_space");

   function igrab (arg1 : access inode) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2379
   pragma Import (CPP, igrab, "_Z5igrabP5inode");

   function iunique (arg1 : access super_block; arg2 : linux_types_h.ino_t) return linux_types_h.ino_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2380
   pragma Import (CPP, iunique, "_Z7iuniqueP11super_blockm");

   function inode_needs_sync (the_inode : access inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2381
   pragma Import (CPP, inode_needs_sync, "_Z16inode_needs_syncP5inode");

   function generic_delete_inode (the_inode : access inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2382
   pragma Import (CPP, generic_delete_inode, "_Z20generic_delete_inodeP5inode");

   function generic_drop_inode (the_inode : access inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2383
   pragma Import (CPP, generic_drop_inode, "_ZL18generic_drop_inodeP5inode");

   function ilookup5_nowait
     (sb : access super_block;
      hashval : unsigned_long;
      test : access function (arg1 : access inode; arg2 : System.Address) return int;
      data : System.Address) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2388
   pragma Import (CPP, ilookup5_nowait, "_Z15ilookup5_nowaitP11super_blockmPFiP5inodePvES3_");

   function ilookup5
     (sb : access super_block;
      hashval : unsigned_long;
      test : access function (arg1 : access inode; arg2 : System.Address) return int;
      data : System.Address) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2391
   pragma Import (CPP, ilookup5, "_Z8ilookup5P11super_blockmPFiP5inodePvES3_");

   function ilookup (sb : access super_block; ino : unsigned_long) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2393
   pragma Import (CPP, ilookup, "_Z7ilookupP11super_blockm");

   function iget5_locked
     (arg1 : access super_block;
      arg2 : unsigned_long;
      test : access function (arg1 : access inode; arg2 : System.Address) return int;
      set : access function (arg1 : access inode; arg2 : System.Address) return int;
      arg5 : System.Address) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2395
   pragma Import (CPP, iget5_locked, "_Z12iget5_lockedP11super_blockmPFiP5inodePvES5_S3_");

   function iget_locked (arg1 : access super_block; arg2 : unsigned_long) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2396
   pragma Import (CPP, iget_locked, "_Z11iget_lockedP11super_blockm");

   function insert_inode_locked4
     (arg1 : access inode;
      arg2 : unsigned_long;
      test : access function (arg1 : access inode; arg2 : System.Address) return int;
      arg4 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2397
   pragma Import (CPP, insert_inode_locked4, "_Z20insert_inode_locked4P5inodemPFiS0_PvES1_");

   function insert_inode_locked (arg1 : access inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2398
   pragma Import (CPP, insert_inode_locked, "_Z19insert_inode_lockedP5inode");

   procedure lockdep_annotate_inode_mutex_key (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2402
   pragma Import (CPP, lockdep_annotate_inode_mutex_key, "_ZL32lockdep_annotate_inode_mutex_keyP5inode");

   procedure unlock_new_inode (arg1 : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2404
   pragma Import (CPP, unlock_new_inode, "_Z16unlock_new_inodeP5inode");

   function get_next_ino return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2405
   pragma Import (CPP, get_next_ino, "_Z12get_next_inov");

   --  skipped func __iget

   procedure iget_failed (arg1 : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2408
   pragma Import (CPP, iget_failed, "_Z11iget_failedP5inode");

   procedure clear_inode (arg1 : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2409
   pragma Import (CPP, clear_inode, "_Z11clear_inodeP5inode");

   --  skipped func __destroy_inode

   function new_inode_pseudo (sb : access super_block) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2411
   pragma Import (CPP, new_inode_pseudo, "_Z16new_inode_pseudoP11super_block");

   function new_inode (sb : access super_block) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2412
   pragma Import (CPP, new_inode, "_Z9new_inodeP11super_block");

   procedure free_inode_nonrcu (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2413
   pragma Import (CPP, free_inode_nonrcu, "_Z17free_inode_nonrcuP5inode");

   function should_remove_suid (arg1 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2414
   pragma Import (CPP, should_remove_suid, "_Z18should_remove_suidP6dentry");

   function file_remove_suid (arg1 : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2415
   pragma Import (CPP, file_remove_suid, "_Z16file_remove_suidP4file");

   --  skipped func __insert_inode_hash

   procedure insert_inode_hash (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2418
   pragma Import (CPP, insert_inode_hash, "_ZL17insert_inode_hashP5inode");

   --  skipped func __remove_inode_hash

   procedure remove_inode_hash (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2424
   pragma Import (CPP, remove_inode_hash, "_ZL17remove_inode_hashP5inode");

   procedure inode_sb_list_add (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2430
   pragma Import (CPP, inode_sb_list_add, "_Z17inode_sb_list_addP5inode");

   procedure submit_bio (arg1 : int; arg2 : access linux_blk_types_h.bio);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2433
   pragma Import (CPP, submit_bio, "_Z10submit_bioiP3bio");

   function bdev_read_only (arg1 : access block_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2434
   pragma Import (CPP, bdev_read_only, "_Z14bdev_read_onlyP12block_device");

   function set_blocksize (arg1 : access block_device; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2436
   pragma Import (CPP, set_blocksize, "_Z13set_blocksizeP12block_devicei");

   function sb_set_blocksize (arg1 : access super_block; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2437
   pragma Import (CPP, sb_set_blocksize, "_Z16sb_set_blocksizeP11super_blocki");

   function sb_min_blocksize (arg1 : access super_block; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2438
   pragma Import (CPP, sb_min_blocksize, "_Z16sb_min_blocksizeP11super_blocki");

   function generic_file_mmap (arg1 : access file; arg2 : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2440
   pragma Import (CPP, generic_file_mmap, "_Z17generic_file_mmapP4fileP14vm_area_struct");

   function generic_file_readonly_mmap (arg1 : access file; arg2 : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2441
   pragma Import (CPP, generic_file_readonly_mmap, "_Z26generic_file_readonly_mmapP4fileP14vm_area_struct");

   function generic_file_remap_pages
     (arg1 : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      size : unsigned_long;
      pgoff : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2442
   pragma Import (CPP, generic_file_remap_pages, "_Z24generic_file_remap_pagesP14vm_area_structmmm");

   function generic_write_checks
     (the_file : access file;
      pos : access linux_types_h.loff_t;
      count : access linux_types_h.size_t;
      isblk : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2444
   pragma Import (CPP, generic_write_checks, "_Z20generic_write_checksP4filePxPmi");

   function generic_file_read_iter (arg1 : System.Address; arg2 : access linux_uio_h.iov_iter) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2445
   pragma Import (CPP, generic_file_read_iter, "_Z22generic_file_read_iterP5kiocbP8iov_iter");

   --  skipped func __generic_file_write_iter

   function generic_file_write_iter (arg1 : System.Address; arg2 : access linux_uio_h.iov_iter) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2447
   pragma Import (CPP, generic_file_write_iter, "_Z23generic_file_write_iterP5kiocbP8iov_iter");

   function generic_file_direct_write
     (arg1 : System.Address;
      arg2 : access linux_uio_h.iov_iter;
      arg3 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2448
   pragma Import (CPP, generic_file_direct_write, "_Z25generic_file_direct_writeP5kiocbP8iov_iterx");

   function generic_perform_write
     (arg1 : access file;
      arg2 : access linux_uio_h.iov_iter;
      arg3 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2449
   pragma Import (CPP, generic_perform_write, "_Z21generic_perform_writeP4fileP8iov_iterx");

   function do_sync_read
     (filp : access file;
      buf : Interfaces.C.Strings.chars_ptr;
      len : linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2450
   pragma Import (CPP, do_sync_read, "_Z12do_sync_readP4filePcmPx");

   function do_sync_write
     (filp : access file;
      buf : Interfaces.C.Strings.chars_ptr;
      len : linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2451
   pragma Import (CPP, do_sync_write, "_Z13do_sync_writeP4filePKcmPx");

   function new_sync_read
     (filp : access file;
      buf : Interfaces.C.Strings.chars_ptr;
      len : linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2452
   pragma Import (CPP, new_sync_read, "_Z13new_sync_readP4filePcmPx");

   function new_sync_write
     (filp : access file;
      buf : Interfaces.C.Strings.chars_ptr;
      len : linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2453
   pragma Import (CPP, new_sync_write, "_Z14new_sync_writeP4filePKcmPx");

  -- fs/block_dev.c  
   function blkdev_write_iter (iocb : System.Address; from : access linux_uio_h.iov_iter) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2456
   pragma Import (CPP, blkdev_write_iter, "_Z17blkdev_write_iterP5kiocbP8iov_iter");

   function blkdev_fsync
     (filp : access file;
      start : linux_types_h.loff_t;
      c_end : linux_types_h.loff_t;
      datasync : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2457
   pragma Import (CPP, blkdev_fsync, "_Z12blkdev_fsyncP4filexxi");

   procedure block_sync_page (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2459
   pragma Import (CPP, block_sync_page, "_Z15block_sync_pageP4page");

  -- fs/splice.c  
   function generic_file_splice_read
     (arg1 : access file;
      arg2 : access linux_types_h.loff_t;
      arg3 : System.Address;
      arg4 : linux_types_h.size_t;
      arg5 : unsigned) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2462
   pragma Import (CPP, generic_file_splice_read, "_Z24generic_file_splice_readP4filePxP15pipe_inode_infomj");

   function default_file_splice_read
     (arg1 : access file;
      arg2 : access linux_types_h.loff_t;
      arg3 : System.Address;
      arg4 : linux_types_h.size_t;
      arg5 : unsigned) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2464
   pragma Import (CPP, default_file_splice_read, "_Z24default_file_splice_readP4filePxP15pipe_inode_infomj");

   function iter_file_splice_write
     (arg1 : System.Address;
      arg2 : access file;
      arg3 : access linux_types_h.loff_t;
      arg4 : linux_types_h.size_t;
      arg5 : unsigned) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2466
   pragma Import (CPP, iter_file_splice_write, "_Z22iter_file_splice_writeP15pipe_inode_infoP4filePxmj");

   function generic_splice_sendpage
     (pipe : System.Address;
      c_out : access file;
      arg3 : access linux_types_h.loff_t;
      len : linux_types_h.size_t;
      flags : unsigned) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2468
   pragma Import (CPP, generic_splice_sendpage, "_Z23generic_splice_sendpageP15pipe_inode_infoP4filePxmj");

   procedure file_ra_state_init (ra : access file_ra_state; mapping : access address_space);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2472
   pragma Import (CPP, file_ra_state_init, "_Z18file_ra_state_initP13file_ra_stateP13address_space");

   function noop_llseek
     (the_file : access file;
      offset : linux_types_h.loff_t;
      whence : int) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2473
   pragma Import (CPP, noop_llseek, "_Z11noop_llseekP4filexi");

   function no_llseek
     (the_file : access file;
      offset : linux_types_h.loff_t;
      whence : int) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2474
   pragma Import (CPP, no_llseek, "_Z9no_llseekP4filexi");

   function vfs_setpos
     (the_file : access file;
      offset : linux_types_h.loff_t;
      maxsize : linux_types_h.loff_t) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2475
   pragma Import (CPP, vfs_setpos, "_Z10vfs_setposP4filexx");

   function generic_file_llseek
     (the_file : access file;
      offset : linux_types_h.loff_t;
      whence : int) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2476
   pragma Import (CPP, generic_file_llseek, "_Z19generic_file_llseekP4filexi");

   function generic_file_llseek_size
     (the_file : access file;
      offset : linux_types_h.loff_t;
      whence : int;
      maxsize : linux_types_h.loff_t;
      eof : linux_types_h.loff_t) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2477
   pragma Import (CPP, generic_file_llseek_size, "_Z24generic_file_llseek_sizeP4filexixx");

   function fixed_size_llseek
     (the_file : access file;
      offset : linux_types_h.loff_t;
      whence : int;
      size : linux_types_h.loff_t) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2479
   pragma Import (CPP, fixed_size_llseek, "_Z17fixed_size_llseekP4filexix");

   function generic_file_open (the_inode : access inode; filp : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2481
   pragma Import (CPP, generic_file_open, "_Z17generic_file_openP5inodeP4file");

   function nonseekable_open (the_inode : access inode; filp : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2482
   pragma Import (CPP, nonseekable_open, "_Z16nonseekable_openP5inodeP4file");

   function xip_truncate_page (mapping : access address_space; from : linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2492
   pragma Import (CPP, xip_truncate_page, "_ZL17xip_truncate_pageP13address_spacex");

   --  skipped function type dio_submit_t

  -- need locking between buffered and direct access  
  -- filesystem does not support filling holes  
  -- filesystem can handle aio writes beyond i_size  
   procedure dio_end_io (the_bio : access linux_blk_types_h.bio; error : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2513
   pragma Import (CPP, dio_end_io, "_Z10dio_end_ioP3bioi");

   --  skipped func __blockdev_direct_IO

   function blockdev_direct_IO
     (rw : int;
      iocb : System.Address;
      the_inode : access inode;
      iter : access linux_uio_h.iov_iter;
      offset : linux_types_h.loff_t;
      get_block : access function
        (arg1 : System.Address;
         arg2 : linux_types_h.sector_t;
         arg3 : System.Address;
         arg4 : int) return int) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2520
   pragma Import (CPP, blockdev_direct_IO, "_ZL18blockdev_direct_IOiP5kiocbP5inodeP8iov_iterxPFiS2_mP11buffer_headiE");

   procedure inode_dio_wait (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2530
   pragma Import (CPP, inode_dio_wait, "_Z14inode_dio_waitP5inode");

   procedure inode_dio_done (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2531
   pragma Import (CPP, inode_dio_done, "_Z14inode_dio_doneP5inode");

   procedure inode_set_flags
     (the_inode : access inode;
      flags : unsigned;
      mask : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2533
   pragma Import (CPP, inode_set_flags, "_Z15inode_set_flagsP5inodejj");

   generic_ro_fops : aliased file_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2536
   pragma Import (C, generic_ro_fops, "generic_ro_fops");

   function readlink_copy
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2540
   pragma Import (CPP, readlink_copy, "_Z13readlink_copyPciPKc");

   function page_readlink
     (arg1 : access linux_dcache_h.dentry;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2541
   pragma Import (CPP, page_readlink, "_Z13page_readlinkP6dentryPci");

   function page_follow_link_light (arg1 : access linux_dcache_h.dentry; arg2 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2542
   pragma Import (CPP, page_follow_link_light, "_Z22page_follow_link_lightP6dentryP9nameidata");

   procedure page_put_link
     (arg1 : access linux_dcache_h.dentry;
      arg2 : System.Address;
      arg3 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2543
   pragma Import (CPP, page_put_link, "_Z13page_put_linkP6dentryP9nameidataPv");

   --  skipped func __page_symlink

   function page_symlink
     (the_inode : access inode;
      symname : Interfaces.C.Strings.chars_ptr;
      len : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2546
   pragma Import (CPP, page_symlink, "_Z12page_symlinkP5inodePKci");

   page_symlink_inode_operations : aliased inode_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2547
   pragma Import (C, page_symlink_inode_operations, "page_symlink_inode_operations");

   procedure kfree_put_link
     (arg1 : access linux_dcache_h.dentry;
      arg2 : System.Address;
      arg3 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2548
   pragma Import (CPP, kfree_put_link, "_Z14kfree_put_linkP6dentryP9nameidataPv");

   function generic_readlink
     (arg1 : access linux_dcache_h.dentry;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2549
   pragma Import (CPP, generic_readlink, "_Z16generic_readlinkP6dentryPci");

   procedure generic_fillattr (arg1 : access inode; arg2 : access linux_stat_h.kstat);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2550
   pragma Import (CPP, generic_fillattr, "_Z16generic_fillattrP5inodeP5kstat");

   function vfs_getattr_nosec (the_path : access linux_path_h.path; stat : access linux_stat_h.kstat) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2551
   pragma Import (CPP, vfs_getattr_nosec, "_Z17vfs_getattr_nosecP4pathP5kstat");

   function vfs_getattr (arg1 : access linux_path_h.path; arg2 : access linux_stat_h.kstat) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2552
   pragma Import (CPP, vfs_getattr, "_Z11vfs_getattrP4pathP5kstat");

   --  skipped func __inode_add_bytes

   procedure inode_add_bytes (the_inode : access inode; bytes : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2554
   pragma Import (CPP, inode_add_bytes, "_Z15inode_add_bytesP5inodex");

   --  skipped func __inode_sub_bytes

   procedure inode_sub_bytes (the_inode : access inode; bytes : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2556
   pragma Import (CPP, inode_sub_bytes, "_Z15inode_sub_bytesP5inodex");

   function inode_get_bytes (the_inode : access inode) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2557
   pragma Import (CPP, inode_get_bytes, "_Z15inode_get_bytesP5inode");

   procedure inode_set_bytes (the_inode : access inode; bytes : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2558
   pragma Import (CPP, inode_set_bytes, "_Z15inode_set_bytesP5inodex");

   function vfs_readdir
     (arg1 : access file;
      arg2 : filldir_t;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2560
   pragma Import (CPP, vfs_readdir, "_Z11vfs_readdirP4filePFiPvPKcixyjES1_");

   function iterate_dir (arg1 : access file; arg2 : access dir_context) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2561
   pragma Import (CPP, iterate_dir, "_Z11iterate_dirP4fileP11dir_context");

   function vfs_stat (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access linux_stat_h.kstat) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2563
   pragma Import (CPP, vfs_stat, "_Z8vfs_statPKcP5kstat");

   function vfs_lstat (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access linux_stat_h.kstat) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2564
   pragma Import (CPP, vfs_lstat, "_Z9vfs_lstatPKcP5kstat");

   function vfs_fstat (arg1 : unsigned; arg2 : access linux_stat_h.kstat) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2565
   pragma Import (CPP, vfs_fstat, "_Z9vfs_fstatjP5kstat");

   function vfs_fstatat
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access linux_stat_h.kstat;
      arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2566
   pragma Import (CPP, vfs_fstatat, "_Z11vfs_fstatatiPKcP5kstati");

   function do_vfs_ioctl
     (filp : access file;
      fd : unsigned;
      cmd : unsigned;
      arg : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2568
   pragma Import (CPP, do_vfs_ioctl, "_Z12do_vfs_ioctlP4filejjm");

   --  skipped func __generic_block_fiemap

   function generic_block_fiemap
     (the_inode : access inode;
      fieinfo : access fiemap_extent_info;
      start : asm_generic_int_ll64_h.u64;
      len : asm_generic_int_ll64_h.u64;
      get_block : access function
        (arg1 : System.Address;
         arg2 : linux_types_h.sector_t;
         arg3 : System.Address;
         arg4 : int) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2574
   pragma Import (CPP, generic_block_fiemap, "_Z20generic_block_fiemapP5inodeP18fiemap_extent_infoyyPFiS0_mP11buffer_headiE");

   procedure get_filesystem (fs : access file_system_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2578
   pragma Import (CPP, get_filesystem, "_Z14get_filesystemP16file_system_type");

   procedure put_filesystem (fs : access file_system_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2579
   pragma Import (CPP, put_filesystem, "_Z14put_filesystemP16file_system_type");

   function get_fs_type (name : Interfaces.C.Strings.chars_ptr) return access file_system_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2580
   pragma Import (CPP, get_fs_type, "_Z11get_fs_typePKc");

   function get_super (arg1 : access block_device) return access super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2581
   pragma Import (CPP, get_super, "_Z9get_superP12block_device");

   function get_super_thawed (arg1 : access block_device) return access super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2582
   pragma Import (CPP, get_super_thawed, "_Z16get_super_thawedP12block_device");

   function get_active_super (bdev : access block_device) return access super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2583
   pragma Import (CPP, get_active_super, "_Z16get_active_superP12block_device");

   procedure drop_super (sb : access super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2584
   pragma Import (CPP, drop_super, "_Z10drop_superP11super_block");

   procedure iterate_supers (arg1 : access procedure (arg1 : access super_block; arg2 : System.Address); arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2585
   pragma Import (CPP, iterate_supers, "_Z14iterate_supersPFvP11super_blockPvES1_");

   procedure iterate_supers_type
     (arg1 : access file_system_type;
      arg2 : access procedure (arg1 : access super_block; arg2 : System.Address);
      arg3 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2586
   pragma Import (CPP, iterate_supers_type, "_Z19iterate_supers_typeP16file_system_typePFvP11super_blockPvES3_");

   function dcache_dir_open (arg1 : access inode; arg2 : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2589
   pragma Import (CPP, dcache_dir_open, "_Z15dcache_dir_openP5inodeP4file");

   function dcache_dir_close (arg1 : access inode; arg2 : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2590
   pragma Import (CPP, dcache_dir_close, "_Z16dcache_dir_closeP5inodeP4file");

   function dcache_dir_lseek
     (arg1 : access file;
      arg2 : linux_types_h.loff_t;
      arg3 : int) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2591
   pragma Import (CPP, dcache_dir_lseek, "_Z16dcache_dir_lseekP4filexi");

   function dcache_readdir (arg1 : access file; arg2 : access dir_context) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2592
   pragma Import (CPP, dcache_readdir, "_Z14dcache_readdirP4fileP11dir_context");

   function simple_setattr (arg1 : access linux_dcache_h.dentry; arg2 : access iattr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2593
   pragma Import (CPP, simple_setattr, "_Z14simple_setattrP6dentryP5iattr");

   function simple_getattr
     (arg1 : System.Address;
      arg2 : access linux_dcache_h.dentry;
      arg3 : access linux_stat_h.kstat) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2594
   pragma Import (CPP, simple_getattr, "_Z14simple_getattrP8vfsmountP6dentryP5kstat");

   function simple_statfs (arg1 : access linux_dcache_h.dentry; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2595
   pragma Import (CPP, simple_statfs, "_Z13simple_statfsP6dentryP7kstatfs");

   function simple_open (the_inode : access inode; the_file : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2596
   pragma Import (CPP, simple_open, "_Z11simple_openP5inodeP4file");

   function simple_link
     (arg1 : access linux_dcache_h.dentry;
      arg2 : access inode;
      arg3 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2597
   pragma Import (CPP, simple_link, "_Z11simple_linkP6dentryP5inodeS0_");

   function simple_unlink (arg1 : access inode; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2598
   pragma Import (CPP, simple_unlink, "_Z13simple_unlinkP5inodeP6dentry");

   function simple_rmdir (arg1 : access inode; arg2 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2599
   pragma Import (CPP, simple_rmdir, "_Z12simple_rmdirP5inodeP6dentry");

   function simple_rename
     (arg1 : access inode;
      arg2 : access linux_dcache_h.dentry;
      arg3 : access inode;
      arg4 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2600
   pragma Import (CPP, simple_rename, "_Z13simple_renameP5inodeP6dentryS0_S2_");

   function noop_fsync
     (arg1 : access file;
      arg2 : linux_types_h.loff_t;
      arg3 : linux_types_h.loff_t;
      arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2601
   pragma Import (CPP, noop_fsync, "_Z10noop_fsyncP4filexxi");

   function simple_empty (arg1 : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2602
   pragma Import (CPP, simple_empty, "_Z12simple_emptyP6dentry");

   function simple_readpage (the_file : access file; the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2603
   pragma Import (CPP, simple_readpage, "_Z15simple_readpageP4fileP4page");

   function simple_write_begin
     (the_file : access file;
      mapping : access address_space;
      pos : linux_types_h.loff_t;
      len : unsigned;
      flags : unsigned;
      pagep : System.Address;
      fsdata : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2604
   pragma Import (CPP, simple_write_begin, "_Z18simple_write_beginP4fileP13address_spacexjjPP4pagePPv");

   function simple_write_end
     (the_file : access file;
      mapping : access address_space;
      pos : linux_types_h.loff_t;
      len : unsigned;
      copied : unsigned;
      the_page : access linux_mm_types_h.page;
      fsdata : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2607
   pragma Import (CPP, simple_write_end, "_Z16simple_write_endP4fileP13address_spacexjjP4pagePv");

   function always_delete_dentry (arg1 : access constant linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2610
   pragma Import (CPP, always_delete_dentry, "_Z20always_delete_dentryPK6dentry");

   function alloc_anon_inode (arg1 : access super_block) return access inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2611
   pragma Import (CPP, alloc_anon_inode, "_Z16alloc_anon_inodeP11super_block");

   simple_dentry_operations : aliased linux_dcache_h.dentry_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2612
   pragma Import (C, simple_dentry_operations, "simple_dentry_operations");

   function simple_lookup
     (arg1 : access inode;
      arg2 : access linux_dcache_h.dentry;
      flags : unsigned) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2614
   pragma Import (CPP, simple_lookup, "_Z13simple_lookupP5inodeP6dentryj");

   function generic_read_dir
     (arg1 : access file;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : linux_types_h.size_t;
      arg4 : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2615
   pragma Import (CPP, generic_read_dir, "_Z16generic_read_dirP4filePcmPx");

   simple_dir_operations : aliased file_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2616
   pragma Import (C, simple_dir_operations, "simple_dir_operations");

   simple_dir_inode_operations : aliased inode_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2617
   pragma Import (C, simple_dir_inode_operations, "simple_dir_inode_operations");

   type tree_descr is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2618
      ops : access constant file_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2618
      mode : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2618
   end record;
   pragma Convention (C_Pass_By_Copy, tree_descr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2618

   function d_alloc_name (arg1 : access linux_dcache_h.dentry; arg2 : Interfaces.C.Strings.chars_ptr) return access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2619
   pragma Import (CPP, d_alloc_name, "_Z12d_alloc_nameP6dentryPKc");

   function simple_fill_super
     (arg1 : access super_block;
      arg2 : unsigned_long;
      arg3 : access tree_descr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2620
   pragma Import (CPP, simple_fill_super, "_Z17simple_fill_superP11super_blockmP10tree_descr");

   function simple_pin_fs
     (arg1 : access file_system_type;
      mount : System.Address;
      count : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2621
   pragma Import (CPP, simple_pin_fs, "_Z13simple_pin_fsP16file_system_typePP8vfsmountPi");

   procedure simple_release_fs (mount : System.Address; count : access int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2622
   pragma Import (CPP, simple_release_fs, "_Z17simple_release_fsPP8vfsmountPi");

   function simple_read_from_buffer
     (to : System.Address;
      count : linux_types_h.size_t;
      ppos : access linux_types_h.loff_t;
      from : System.Address;
      available : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2624
   pragma Import (CPP, simple_read_from_buffer, "_Z23simple_read_from_bufferPvmPxPKvm");

   function simple_write_to_buffer
     (to : System.Address;
      available : linux_types_h.size_t;
      ppos : access linux_types_h.loff_t;
      from : System.Address;
      count : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2626
   pragma Import (CPP, simple_write_to_buffer, "_Z22simple_write_to_bufferPvmPxPKvm");

   --  skipped func __generic_file_fsync

   function generic_file_fsync
     (arg1 : access file;
      arg2 : linux_types_h.loff_t;
      arg3 : linux_types_h.loff_t;
      arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2630
   pragma Import (CPP, generic_file_fsync, "_Z18generic_file_fsyncP4filexxi");

   function generic_check_addressable (arg1 : unsigned; arg2 : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2632
   pragma Import (CPP, generic_check_addressable, "_Z25generic_check_addressablejy");

   function buffer_migrate_page
     (arg1 : access address_space;
      arg2 : access linux_mm_types_h.page;
      arg3 : access linux_mm_types_h.page;
      arg4 : linux_migrate_mode_h.migrate_mode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2635
   pragma Import (CPP, buffer_migrate_page, "_Z19buffer_migrate_pageP13address_spaceP4pageS2_12migrate_mode");

   function inode_change_ok (arg1 : access constant inode; arg2 : access iattr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2642
   pragma Import (CPP, inode_change_ok, "_Z15inode_change_okPK5inodeP5iattr");

   function inode_newsize_ok (arg1 : access constant inode; offset : linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2643
   pragma Import (CPP, inode_newsize_ok, "_Z16inode_newsize_okPK5inodex");

   procedure setattr_copy (the_inode : access inode; attr : access constant iattr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2644
   pragma Import (CPP, setattr_copy, "_Z12setattr_copyP5inodePK5iattr");

   function update_time
     (arg1 : access inode;
      arg2 : access uapi_linux_time_h.timespec;
      arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2646
   pragma Import (CPP, update_time, "_Z11update_timeP5inodeP8timespeci");

   function file_update_time (the_file : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2647
   pragma Import (CPP, file_update_time, "_Z16file_update_timeP4file");

   function generic_show_options (m : access linux_seq_file_h.seq_file; root : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2649
   pragma Import (CPP, generic_show_options, "_Z20generic_show_optionsP8seq_fileP6dentry");

   procedure save_mount_options (sb : access super_block; options : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2650
   pragma Import (CPP, save_mount_options, "_Z18save_mount_optionsP11super_blockPc");

   procedure replace_mount_options (sb : access super_block; options : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2651
   pragma Import (CPP, replace_mount_options, "_Z21replace_mount_optionsP11super_blockPc");

   function parent_ino (the_dentry : access linux_dcache_h.dentry) return linux_types_h.ino_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2653
   pragma Import (CPP, parent_ino, "_ZL10parent_inoP6dentry");

  --	 * Don't strictly need d_lock here? If the parent ino could change
  --	 * then surely we'd have a deeper race in the caller?
  --	  

  -- Transaction based IO helpers  
  -- * An argresp is stored in an allocated page and holds the
  -- * size of the argument or response, along with its content
  --  

   subtype simple_transaction_argresp_data_array is Interfaces.C.char_array (0 .. -1);
   type simple_transaction_argresp is record
      size : aliased linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2674
      data : aliased simple_transaction_argresp_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2675
   end record;
   pragma Convention (C_Pass_By_Copy, simple_transaction_argresp);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2673

   function simple_transaction_get
     (the_file : access file;
      buf : Interfaces.C.Strings.chars_ptr;
      size : linux_types_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2680
   pragma Import (CPP, simple_transaction_get, "_Z22simple_transaction_getP4filePKcm");

   function simple_transaction_read
     (the_file : access file;
      buf : Interfaces.C.Strings.chars_ptr;
      size : linux_types_h.size_t;
      pos : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2682
   pragma Import (CPP, simple_transaction_read, "_Z23simple_transaction_readP4filePcmPx");

   function simple_transaction_release (the_inode : access inode; the_file : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2684
   pragma Import (CPP, simple_transaction_release, "_Z26simple_transaction_releaseP5inodeP4file");

   procedure simple_transaction_set (the_file : access file; n : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2686
   pragma Import (CPP, simple_transaction_set, "_Z22simple_transaction_setP4filem");

  -- * simple attribute files
  -- *
  -- * These attributes behave similar to those in sysfs:
  -- *
  -- * Writing to an attribute immediately sets a value, an open file can be
  -- * written to multiple times.
  -- *
  -- * Reading from an attribute creates a buffer from the value that might get
  -- * read with multiple read calls. When the attribute has been read
  -- * completely, no further read calls are possible until the file is opened
  -- * again.
  -- *
  -- * All attributes contain a text representation of a numeric value
  -- * that are accessed with the get() and set() functions.
  --  

   --  skipped func __simple_attr_check_format

  -- don't do anything, just let the compiler check the arguments;  
   function simple_attr_open
     (the_inode : access inode;
      the_file : access file;
      get : access function (arg1 : System.Address; arg2 : access asm_generic_int_ll64_h.u64) return int;
      set : access function (arg1 : System.Address; arg2 : asm_generic_int_ll64_h.u64) return int;
      fmt : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2725
   pragma Import (CPP, simple_attr_open, "_Z16simple_attr_openP5inodeP4filePFiPvPyEPFiS3_yEPKc");

   function simple_attr_release (the_inode : access inode; the_file : access file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2728
   pragma Import (CPP, simple_attr_release, "_Z19simple_attr_releaseP5inodeP4file");

   function simple_attr_read
     (the_file : access file;
      buf : Interfaces.C.Strings.chars_ptr;
      len : linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2729
   pragma Import (CPP, simple_attr_read, "_Z16simple_attr_readP4filePcmPx");

   function simple_attr_write
     (the_file : access file;
      buf : Interfaces.C.Strings.chars_ptr;
      len : linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2731
   pragma Import (CPP, simple_attr_write, "_Z17simple_attr_writeP4filePKcmPx");

   function proc_nr_files
     (table : access linux_sysctl_h.ctl_table;
      write : int;
      buffer : System.Address;
      lenp : access linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2735
   pragma Import (CPP, proc_nr_files, "_Z13proc_nr_filesP9ctl_tableiPvPmPx");

   function proc_nr_dentry
     (table : access linux_sysctl_h.ctl_table;
      write : int;
      buffer : System.Address;
      lenp : access linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2737
   pragma Import (CPP, proc_nr_dentry, "_Z14proc_nr_dentryP9ctl_tableiPvPmPx");

   function proc_nr_inodes
     (table : access linux_sysctl_h.ctl_table;
      write : int;
      buffer : System.Address;
      lenp : access linux_types_h.size_t;
      ppos : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2739
   pragma Import (CPP, proc_nr_inodes, "_Z14proc_nr_inodesP9ctl_tableiPvPmPx");

   function get_filesystem_list (buf : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2741
   pragma Import (CPP, get_filesystem_list, "_Z19get_filesystem_listPc");

   function is_sxid (mode : linux_types_h.umode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2750
   pragma Import (CPP, is_sxid, "_ZL7is_sxidt");

   procedure inode_has_no_xattr (the_inode : access inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2755
   pragma Import (CPP, inode_has_no_xattr, "_ZL18inode_has_no_xattrP5inode");

   function dir_emit
     (ctx : access dir_context;
      name : Interfaces.C.Strings.chars_ptr;
      namelen : int;
      ino : asm_generic_int_ll64_h.u64;
      c_type : unsigned) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2761
   pragma Import (CPP, dir_emit, "_ZL8dir_emitP11dir_contextPKciyj");

   function dir_emit_dot (the_file : access file; ctx : access dir_context) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2767
   pragma Import (CPP, dir_emit_dot, "_ZL12dir_emit_dotP4fileP11dir_context");

   function dir_emit_dotdot (the_file : access file; ctx : access dir_context) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2772
   pragma Import (CPP, dir_emit_dotdot, "_ZL15dir_emit_dotdotP4fileP11dir_context");

   function dir_emit_dots (the_file : access file; ctx : access dir_context) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2777
   pragma Import (CPP, dir_emit_dots, "_ZL13dir_emit_dotsP4fileP11dir_context");

   function dir_relax (the_inode : access inode) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/fs.h:2791
   pragma Import (CPP, dir_relax, "_ZL9dir_relaxP5inode");

end linux_fs_h;

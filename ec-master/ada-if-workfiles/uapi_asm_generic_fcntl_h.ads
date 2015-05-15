pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_posix_types_h;

package uapi_asm_generic_fcntl_h is

   --  unsupported macro: O_ACCMODE 00000003
   --  unsupported macro: O_RDONLY 00000000
   --  unsupported macro: O_WRONLY 00000001
   --  unsupported macro: O_RDWR 00000002
   --  unsupported macro: O_CREAT 00000100
   --  unsupported macro: O_EXCL 00000200
   --  unsupported macro: O_NOCTTY 00000400
   --  unsupported macro: O_TRUNC 00001000
   --  unsupported macro: O_APPEND 00002000
   --  unsupported macro: O_NONBLOCK 00004000
   --  unsupported macro: O_DSYNC 00010000
   --  unsupported macro: FASYNC 00020000
   --  unsupported macro: O_DIRECT 00040000
   --  unsupported macro: O_LARGEFILE 00100000
   --  unsupported macro: O_DIRECTORY 00200000
   --  unsupported macro: O_NOFOLLOW 00400000
   --  unsupported macro: O_NOATIME 01000000
   --  unsupported macro: O_CLOEXEC 02000000
   --  unsupported macro: O_SYNC (__O_SYNC|O_DSYNC)
   --  unsupported macro: O_PATH 010000000
   --  unsupported macro: O_TMPFILE (__O_TMPFILE | O_DIRECTORY)
   --  unsupported macro: O_TMPFILE_MASK (__O_TMPFILE | O_DIRECTORY | O_CREAT)
   --  unsupported macro: O_NDELAY O_NONBLOCK
   --  unsupported macro: F_DUPFD 0
   --  unsupported macro: F_GETFD 1
   --  unsupported macro: F_SETFD 2
   --  unsupported macro: F_GETFL 3
   --  unsupported macro: F_SETFL 4
   --  unsupported macro: F_GETLK 5
   --  unsupported macro: F_SETLK 6
   --  unsupported macro: F_SETLKW 7
   --  unsupported macro: F_SETOWN 8
   --  unsupported macro: F_GETOWN 9
   --  unsupported macro: F_SETSIG 10
   --  unsupported macro: F_GETSIG 11
   --  unsupported macro: F_SETOWN_EX 15
   --  unsupported macro: F_GETOWN_EX 16
   --  unsupported macro: F_GETOWNER_UIDS 17
   --  unsupported macro: F_OFD_GETLK 36
   --  unsupported macro: F_OFD_SETLK 37
   --  unsupported macro: F_OFD_SETLKW 38
   --  unsupported macro: F_OWNER_TID 0
   --  unsupported macro: F_OWNER_PID 1
   --  unsupported macro: F_OWNER_PGRP 2
   --  unsupported macro: FD_CLOEXEC 1
   --  unsupported macro: F_RDLCK 0
   --  unsupported macro: F_WRLCK 1
   --  unsupported macro: F_UNLCK 2
   --  unsupported macro: F_EXLCK 4
   --  unsupported macro: F_SHLCK 8
   --  unsupported macro: LOCK_SH 1
   --  unsupported macro: LOCK_EX 2
   --  unsupported macro: LOCK_NB 4
   --  unsupported macro: LOCK_UN 8
   --  unsupported macro: LOCK_MAND 32
   --  unsupported macro: LOCK_READ 64
   --  unsupported macro: LOCK_WRITE 128
   --  unsupported macro: LOCK_RW 192
   --  unsupported macro: F_LINUX_SPECIFIC_BASE 1024
  -- * FMODE_EXEC is 0x20
  -- * FMODE_NONOTIFY is 0x1000000
  -- * These cannot be used by userspace O_* until internal and external open
  -- * flags are split.
  -- * -Eric Paris
  --  

  -- * When introducing new O_* bits, please check its uniqueness in fcntl_init().
  --  

  -- * Before Linux 2.6.33 only O_DSYNC semantics were implemented, but using
  -- * the O_SYNC flag.  We continue to use the existing numerical value
  -- * for O_DSYNC semantics now, but using the correct symbolic name for it.
  -- * This new value is used to request true Posix O_SYNC semantics.  It is
  -- * defined in this strange way to make sure applications compiled against
  -- * new headers get at least O_DSYNC semantics on older kernels.
  -- *
  -- * This has the nice side-effect that we can simply test for O_DSYNC
  -- * wherever we do not care if O_DSYNC or O_SYNC is used.
  -- *
  -- * Note: __O_SYNC must never be used directly.
  --  

  -- a horrid kludge trying to make sure that this will fail on old kernels  
  -- * Open File Description Locks
  -- *
  -- * Usually record locks held by a process are released on *any* close and are
  -- * not inherited across a fork().
  -- *
  -- * These cmd values will set locks that conflict with process-associated
  -- * record  locks, but are "owned" by the open file description, not the
  -- * process. This means that they are inherited across fork() like BSD (flock)
  -- * locks, and they are only released automatically when the last reference to
  -- * the the open file against which they were acquired is put.
  --  

   type f_owner_ex is record
      c_type : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:156
      pid : aliased uapi_asm_generic_posix_types_h.uu_kernel_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:157
   end record;
   pragma Convention (C_Pass_By_Copy, f_owner_ex);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:155

  -- for F_[GET|SET]FL  
  -- for posix fcntl() and lockf()  
  -- for old implementation of bsd flock ()  
  -- operations for bsd flock(), also used by the kernel implementation  
   type flock is record
      l_type : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:196
      l_whence : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:197
      l_start : aliased uapi_asm_generic_posix_types_h.uu_kernel_off_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:198
      l_len : aliased uapi_asm_generic_posix_types_h.uu_kernel_off_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:199
      l_pid : aliased uapi_asm_generic_posix_types_h.uu_kernel_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:200
   end record;
   pragma Convention (C_Pass_By_Copy, flock);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:195

   type flock64 is record
      l_type : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:211
      l_whence : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:212
      l_start : aliased uapi_asm_generic_posix_types_h.uu_kernel_loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:213
      l_len : aliased uapi_asm_generic_posix_types_h.uu_kernel_loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:214
      l_pid : aliased uapi_asm_generic_posix_types_h.uu_kernel_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:215
   end record;
   pragma Convention (C_Pass_By_Copy, flock64);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/fcntl.h:210

end uapi_asm_generic_fcntl_h;

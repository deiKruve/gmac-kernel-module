pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_types_h;
with stddef_h;
with x86_64_linux_gnu_sys_types_h;
limited with x86_64_linux_gnu_bits_uio_h;
with Interfaces.C.Strings;

package x86_64_linux_gnu_bits_fcntl_linux_h is

   --  unsupported macro: O_ACCMODE 0003
   --  unsupported macro: O_RDONLY 00
   --  unsupported macro: O_WRONLY 01
   --  unsupported macro: O_RDWR 02
   --  unsupported macro: O_CREAT 0100
   --  unsupported macro: O_EXCL 0200
   --  unsupported macro: O_NOCTTY 0400
   --  unsupported macro: O_TRUNC 01000
   --  unsupported macro: O_APPEND 02000
   --  unsupported macro: O_NONBLOCK 04000
   --  unsupported macro: O_NDELAY O_NONBLOCK
   --  unsupported macro: O_SYNC 04010000
   --  unsupported macro: O_FSYNC O_SYNC
   --  unsupported macro: O_ASYNC 020000
   --  unsupported macro: F_GETLK 5
   --  unsupported macro: F_SETLK 6
   --  unsupported macro: F_SETLKW 7
   --  unsupported macro: O_LARGEFILE __O_LARGEFILE
   --  unsupported macro: O_DIRECTORY __O_DIRECTORY
   --  unsupported macro: O_NOFOLLOW __O_NOFOLLOW
   --  unsupported macro: O_CLOEXEC __O_CLOEXEC
   --  unsupported macro: O_DIRECT __O_DIRECT
   --  unsupported macro: O_NOATIME __O_NOATIME
   --  unsupported macro: O_PATH __O_PATH
   --  unsupported macro: O_TMPFILE __O_TMPFILE
   --  unsupported macro: O_DSYNC __O_DSYNC
   --  unsupported macro: O_RSYNC O_SYNC
   --  unsupported macro: F_DUPFD 0
   --  unsupported macro: F_GETFD 1
   --  unsupported macro: F_SETFD 2
   --  unsupported macro: F_GETFL 3
   --  unsupported macro: F_SETFL 4
   --  unsupported macro: F_SETOWN __F_SETOWN
   --  unsupported macro: F_GETOWN __F_GETOWN
   --  unsupported macro: F_SETSIG __F_SETSIG
   --  unsupported macro: F_GETSIG __F_GETSIG
   --  unsupported macro: F_SETOWN_EX __F_SETOWN_EX
   --  unsupported macro: F_GETOWN_EX __F_GETOWN_EX
   --  unsupported macro: F_SETLEASE 1024
   --  unsupported macro: F_GETLEASE 1025
   --  unsupported macro: F_NOTIFY 1026
   --  unsupported macro: F_SETPIPE_SZ 1031
   --  unsupported macro: F_GETPIPE_SZ 1032
   --  unsupported macro: F_DUPFD_CLOEXEC 1030
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
   --  unsupported macro: DN_ACCESS 0x00000001
   --  unsupported macro: DN_MODIFY 0x00000002
   --  unsupported macro: DN_CREATE 0x00000004
   --  unsupported macro: DN_DELETE 0x00000008
   --  unsupported macro: DN_RENAME 0x00000010
   --  unsupported macro: DN_ATTRIB 0x00000020
   --  unsupported macro: DN_MULTISHOT 0x80000000
   --  unsupported macro: FAPPEND O_APPEND
   --  unsupported macro: FFSYNC O_FSYNC
   --  unsupported macro: FASYNC O_ASYNC
   --  unsupported macro: FNONBLOCK O_NONBLOCK
   --  unsupported macro: FNDELAY O_NDELAY
   --  unsupported macro: POSIX_FADV_NORMAL 0
   --  unsupported macro: POSIX_FADV_RANDOM 1
   --  unsupported macro: POSIX_FADV_SEQUENTIAL 2
   --  unsupported macro: POSIX_FADV_WILLNEED 3
   --  unsupported macro: POSIX_FADV_DONTNEED __POSIX_FADV_DONTNEED
   --  unsupported macro: POSIX_FADV_NOREUSE __POSIX_FADV_NOREUSE
   --  unsupported macro: SYNC_FILE_RANGE_WAIT_BEFORE 1
   --  unsupported macro: SYNC_FILE_RANGE_WRITE 2
   --  unsupported macro: SYNC_FILE_RANGE_WAIT_AFTER 4
   --  unsupported macro: SPLICE_F_MOVE 1
   --  unsupported macro: SPLICE_F_NONBLOCK 2
   --  unsupported macro: SPLICE_F_MORE 4
   --  unsupported macro: SPLICE_F_GIFT 8
   --  unsupported macro: FALLOC_FL_KEEP_SIZE 1
   --  unsupported macro: FALLOC_FL_PUNCH_HOLE 2
   --  unsupported macro: MAX_HANDLE_SZ 128
   --  unsupported macro: AT_FDCWD -100
   --  unsupported macro: AT_SYMLINK_NOFOLLOW 0x100
   --  unsupported macro: AT_REMOVEDIR 0x200
   --  unsupported macro: AT_SYMLINK_FOLLOW 0x400
   --  unsupported macro: AT_NO_AUTOMOUNT 0x800
   --  unsupported macro: AT_EMPTY_PATH 0x1000
   --  unsupported macro: AT_EACCESS 0x200
  -- O_*, F_*, FD_* bit values for Linux.
  --   Copyright (C) 2001-2014 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <http://www.gnu.org/licenses/>.   

  -- This file contains shared definitions between Linux architectures
  --   and is included by <bits/fcntl.h> to declare them.  The various
  --   #ifndef cases allow the architecture specific file to define those
  --   values with different values.
  --   A minimal <bits/fcntl.h> contains just:
  --   struct flock {...}
  --   #ifdef __USE_LARGEFILE64
  --   struct flock64 {...}
  --   #endif
  --   #include <bits/fcntl-linux.h>
  -- 

  -- open/fcntl.   
  -- For now, Linux has no separate synchronicitiy options for read
  --   operations.  We define O_RSYNC therefore as the same as O_SYNC
  --   since this is a superset.   

  -- Values for the second argument to `fcntl'.   
  -- For F_[GET|SET]FD.   
  -- For posix fcntl() and `l_type' field of a `struct flock' for lockf().   
  -- For old implementation of BSD flock.   
  -- Operations for BSD flock, also used by the kernel implementation.   
  -- Types of directory notifications that may be requested with F_NOTIFY.   
  -- Owner types.   
   subtype uu_pid_type is unsigned;
   F_OWNER_TID : constant uu_pid_type := 0;
   F_OWNER_PID : constant uu_pid_type := 1;
   F_OWNER_PGRP : constant uu_pid_type := 2;
   F_OWNER_GID : constant uu_pid_type := 2;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:241

  -- Kernel thread.   
  -- Process.   
  -- Process group.   
  -- Alternative, obsolete name.   
  -- Structure to use with F_GETOWN_EX and F_SETOWN_EX.   
  -- Owner type of ID.   
   type f_owner_ex is record
      c_type : aliased uu_pid_type;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:252
      pid : aliased x86_64_linux_gnu_bits_types_h.uu_pid_t;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:253
   end record;
   pragma Convention (C_Pass_By_Copy, f_owner_ex);  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:250

  -- ID of owner.   
  -- Define some more compatibility macros to be backward compatible with
  --   BSD systems which did not managed to hide these kernel macros.   

  -- Advise to `posix_fadvise'.   
  -- Flags for SYNC_FILE_RANGE.   
  -- Flags for SPLICE and VMSPLICE.   
  -- Flags for fallocate.   
  -- File handle structure.   
   type file_handle_f_handle_array is array (0 .. -1) of aliased unsigned_char;
   type file_handle is record
      handle_bytes : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:313
      handle_type : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:314
      f_handle : aliased file_handle_f_handle_array;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:316
   end record;
   pragma Convention (C_Pass_By_Copy, file_handle);  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:311

  -- File identifier.   
  -- Maximum handle size (for now).   
  -- Values for `*at' functions.   
  -- Provide kernel hint to read ahead.   
   function readahead
     (uu_fd : int;
      uu_offset : x86_64_linux_gnu_bits_types_h.uu_off64_t;
      uu_count : stddef_h.size_t) return x86_64_linux_gnu_sys_types_h.ssize_t;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:346
   pragma Import (C, readahead, "readahead");

  -- Selective file content synch'ing.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function sync_file_range
     (uu_fd : int;
      uu_offset : x86_64_linux_gnu_bits_types_h.uu_off64_t;
      uu_count : x86_64_linux_gnu_bits_types_h.uu_off64_t;
      uu_flags : unsigned) return int;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:354
   pragma Import (C, sync_file_range, "sync_file_range");

  -- Splice address range into a pipe.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function vmsplice
     (uu_fdout : int;
      uu_iov : access constant x86_64_linux_gnu_bits_uio_h.iovec;
      uu_count : stddef_h.size_t;
      uu_flags : unsigned) return x86_64_linux_gnu_sys_types_h.ssize_t;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:362
   pragma Import (C, vmsplice, "vmsplice");

  -- Splice two files together.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function splice
     (uu_fdin : int;
      uu_offin : access x86_64_linux_gnu_bits_types_h.uu_off64_t;
      uu_fdout : int;
      uu_offout : access x86_64_linux_gnu_bits_types_h.uu_off64_t;
      uu_len : stddef_h.size_t;
      uu_flags : unsigned) return x86_64_linux_gnu_sys_types_h.ssize_t;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:369
   pragma Import (C, splice, "splice");

  -- In-kernel implementation of tee for pipe buffers.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function tee
     (uu_fdin : int;
      uu_fdout : int;
      uu_len : stddef_h.size_t;
      uu_flags : unsigned) return x86_64_linux_gnu_sys_types_h.ssize_t;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:377
   pragma Import (C, tee, "tee");

  -- Reserve storage for the data of the file associated with FD.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fallocate
     (uu_fd : int;
      uu_mode : int;
      uu_offset : x86_64_linux_gnu_bits_types_h.uu_off_t;
      uu_len : x86_64_linux_gnu_bits_types_h.uu_off_t) return int;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:385
   pragma Import (C, fallocate, "fallocate");

   function fallocate64
     (uu_fd : int;
      uu_mode : int;
      uu_offset : x86_64_linux_gnu_bits_types_h.uu_off64_t;
      uu_len : x86_64_linux_gnu_bits_types_h.uu_off64_t) return int;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:396
   pragma Import (C, fallocate64, "fallocate64");

  -- Map file name to file handle.   
   function name_to_handle_at
     (uu_dfd : int;
      uu_name : Interfaces.C.Strings.chars_ptr;
      uu_handle : access file_handle;
      uu_mnt_id : access int;
      uu_flags : int) return int;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:402
   pragma Import (C, name_to_handle_at, "name_to_handle_at");

  -- Open file using the file handle.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function open_by_handle_at
     (uu_mountdirfd : int;
      uu_handle : access file_handle;
      uu_flags : int) return int;  -- /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:410
   pragma Import (C, open_by_handle_at, "open_by_handle_at");

end x86_64_linux_gnu_bits_fcntl_linux_h;

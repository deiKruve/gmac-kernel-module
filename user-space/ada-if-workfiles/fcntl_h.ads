pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with x86_64_linux_gnu_sys_types_h;

package fcntl_h is

   --  unsupported macro: S_IFMT __S_IFMT
   --  unsupported macro: S_IFDIR __S_IFDIR
   --  unsupported macro: S_IFCHR __S_IFCHR
   --  unsupported macro: S_IFBLK __S_IFBLK
   --  unsupported macro: S_IFREG __S_IFREG
   --  unsupported macro: S_IFIFO __S_IFIFO
   --  unsupported macro: S_IFLNK __S_IFLNK
   --  unsupported macro: S_IFSOCK __S_IFSOCK
   --  unsupported macro: S_ISUID __S_ISUID
   --  unsupported macro: S_ISGID __S_ISGID
   --  unsupported macro: S_ISVTX __S_ISVTX
   --  unsupported macro: S_IRUSR __S_IREAD
   --  unsupported macro: S_IWUSR __S_IWRITE
   --  unsupported macro: S_IXUSR __S_IEXEC
   --  unsupported macro: S_IRWXU (__S_IREAD|__S_IWRITE|__S_IEXEC)
   --  unsupported macro: S_IRGRP (S_IRUSR >> 3)
   --  unsupported macro: S_IWGRP (S_IWUSR >> 3)
   --  unsupported macro: S_IXGRP (S_IXUSR >> 3)
   --  unsupported macro: S_IRWXG (S_IRWXU >> 3)
   --  unsupported macro: S_IROTH (S_IRGRP >> 3)
   --  unsupported macro: S_IWOTH (S_IWGRP >> 3)
   --  unsupported macro: S_IXOTH (S_IXGRP >> 3)
   --  unsupported macro: S_IRWXO (S_IRWXG >> 3)
   --  unsupported macro: R_OK 4
   --  unsupported macro: W_OK 2
   --  unsupported macro: X_OK 1
   --  unsupported macro: F_OK 0
   --  unsupported macro: SEEK_SET 0
   --  unsupported macro: SEEK_CUR 1
   --  unsupported macro: SEEK_END 2
   --  unsupported macro: F_ULOCK 0
   --  unsupported macro: F_LOCK 1
   --  unsupported macro: F_TLOCK 2
   --  unsupported macro: F_TEST 3
  -- Copyright (C) 1991-2014 Free Software Foundation, Inc.
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

  -- *	POSIX Standard: 6.5 File Control Operations	<fcntl.h>
  --  

  -- This must be early so <bits/fcntl.h> can define types winningly.   
  -- Get __mode_t, __dev_t and __off_t  . 
  -- Get the definitions of O_*, F_*, FD_*: all the
  --   numbers and flag bits for `open', `fcntl', et al.   

  -- POSIX.1-2001 specifies that these types are defined by <fcntl.h>.
  --   Earlier POSIX standards permitted any type ending in `_t' to be defined
  --   by any POSIX header, so we don't conditionalize the definitions here.   

  -- For XPG all symbols from <sys/stat.h> should also be available.   
  -- Protection bits.   
  -- Save swapped text after use (sticky bit).  This is pretty well obsolete.   
  -- Read, write, and execute by owner.   
  -- Read, write, and execute by group.   
  -- Read, write, and execute by others.   
  -- Values for the second argument to access.
  --   These may be OR'd together.   

  -- XPG wants the following symbols.   <stdio.h> has the same definitions.   
  -- Do the file control operation described by CMD on FD.
  --   The remaining arguments are interpreted depending on CMD.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function fcntl (uu_fd : int; uu_cmd : int  -- , ...
      ) return int;  -- fcntl.h:137
   pragma Import (C, fcntl, "fcntl");

  -- Open FILE and return a new file descriptor for it, or -1 on error.
  --   OFLAG determines the type of access used.  If O_CREAT is on OFLAG,
  --   the third argument is taken as a `mode_t', the mode of the created file.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function open (uu_file : Interfaces.C.Strings.chars_ptr; uu_oflag : int  -- , ...
      ) return int;  -- fcntl.h:146
   pragma Import (C, open, "open");

   function open64 (uu_file : Interfaces.C.Strings.chars_ptr; uu_oflag : int  -- , ...
      ) return int;  -- fcntl.h:156
   pragma Import (C, open64, "open64");

  -- Similar to `open' but a relative path name is interpreted relative to
  --   the directory for which FD is a descriptor.
  --   NOTE: some other `openat' implementation support additional functionality
  --   through this interface, especially using the O_XATTR flag.  This is not
  --   yet supported here.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function openat
     (uu_fd : int;
      uu_file : Interfaces.C.Strings.chars_ptr;
      uu_oflag : int  -- , ...
      ) return int;  -- fcntl.h:170
   pragma Import (C, openat, "openat");

   function openat64
     (uu_fd : int;
      uu_file : Interfaces.C.Strings.chars_ptr;
      uu_oflag : int  -- , ...
      ) return int;  -- fcntl.h:181
   pragma Import (C, openat64, "openat64");

  -- Create and open FILE, with mode MODE.  This takes an `int' MODE
  --   argument because that is what `mode_t' will be widened to.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function creat (uu_file : Interfaces.C.Strings.chars_ptr; uu_mode : x86_64_linux_gnu_sys_types_h.mode_t) return int;  -- fcntl.h:192
   pragma Import (C, creat, "creat");

   function creat64 (uu_file : Interfaces.C.Strings.chars_ptr; uu_mode : x86_64_linux_gnu_sys_types_h.mode_t) return int;  -- fcntl.h:202
   pragma Import (C, creat64, "creat64");

  -- NOTE: These declarations also appear in <unistd.h>; be sure to keep both
  --   files consistent.  Some systems have them there and some here, and some
  --   software depends on the macros being defined without including both.   

  -- `lockf' is a simpler interface to the locking facilities of `fcntl'.
  --   LEN is always relative to the current file position.
  --   The CMD argument is one of the following.   

   function lockf
     (uu_fd : int;
      uu_cmd : int;
      uu_len : x86_64_linux_gnu_sys_types_h.off_t) return int;  -- fcntl.h:221
   pragma Import (C, lockf, "lockf");

   function lockf64
     (uu_fd : int;
      uu_cmd : int;
      uu_len : x86_64_linux_gnu_sys_types_h.off64_t) return int;  -- fcntl.h:230
   pragma Import (C, lockf64, "lockf64");

  -- Advice the system about the expected behaviour of the application with
  --   respect to the file associated with FD.   

   function posix_fadvise
     (uu_fd : int;
      uu_offset : x86_64_linux_gnu_sys_types_h.off_t;
      uu_len : x86_64_linux_gnu_sys_types_h.off_t;
      uu_advise : int) return int;  -- fcntl.h:238
   pragma Import (C, posix_fadvise, "posix_fadvise");

   function posix_fadvise64
     (uu_fd : int;
      uu_offset : x86_64_linux_gnu_sys_types_h.off64_t;
      uu_len : x86_64_linux_gnu_sys_types_h.off64_t;
      uu_advise : int) return int;  -- fcntl.h:250
   pragma Import (C, posix_fadvise64, "posix_fadvise64");

  -- Reserve storage for the data of the file associated with FD.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function posix_fallocate
     (uu_fd : int;
      uu_offset : x86_64_linux_gnu_sys_types_h.off_t;
      uu_len : x86_64_linux_gnu_sys_types_h.off_t) return int;  -- fcntl.h:260
   pragma Import (C, posix_fallocate, "posix_fallocate");

   function posix_fallocate64
     (uu_fd : int;
      uu_offset : x86_64_linux_gnu_sys_types_h.off64_t;
      uu_len : x86_64_linux_gnu_sys_types_h.off64_t) return int;  -- fcntl.h:271
   pragma Import (C, posix_fallocate64, "posix_fallocate64");

  -- Define some inlines helping to catch common problems.   
end fcntl_h;

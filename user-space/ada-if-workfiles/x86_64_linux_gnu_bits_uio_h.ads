pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;

package x86_64_linux_gnu_bits_uio_h is

   --  unsupported macro: UIO_MAXIOV 1024
  -- Copyright (C) 1996-2014 Free Software Foundation, Inc.
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

  -- We should normally use the Linux kernel header file to define this
  --   type and macros but this calls for trouble because of the header
  --   includes other kernel headers.   

  -- Size of object which can be written atomically.
  --   This macro has different values in different kernel versions.  The
  --   latest versions of the kernel use 1024 and this is good choice.  Since
  --   the C library implementation of readv/writev is able to emulate the
  --   functionality even if the currently running kernel does not support
  --   this large value the readv/writev call will not fail because of this.   

  -- Structure for scatter/gather I/O.   
  -- Pointer to data.   
   type iovec is record
      iov_base : System.Address;  -- /usr/include/x86_64-linux-gnu/bits/uio.h:45
      iov_len : aliased stddef_h.size_t;  -- /usr/include/x86_64-linux-gnu/bits/uio.h:46
   end record;
   pragma Convention (C_Pass_By_Copy, iovec);  -- /usr/include/x86_64-linux-gnu/bits/uio.h:43

  -- Length of data.   
  -- Read from another process' address space.   
  -- Write to another process' address space.   
end x86_64_linux_gnu_bits_uio_h;

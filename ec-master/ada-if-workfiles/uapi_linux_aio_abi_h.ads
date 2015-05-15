pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_posix_types_h;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_aio_abi_h is

   --  unsupported macro: IOCB_FLAG_RESFD (1 << 0)
   --  arg-macro: procedure PADDED x, y
   --    x, y
  -- include/linux/aio_abi.h
  -- *
  -- * Copyright 2000,2001,2002 Red Hat.
  -- *
  -- * Written by Benjamin LaHaise <bcrl@kvack.org>
  -- *
  -- * Distribute under the terms of the GPLv2 (see ../../COPYING) or under 
  -- * the following terms.
  -- *
  -- * Permission to use, copy, modify, and distribute this software and its
  -- * documentation is hereby granted, provided that the above copyright
  -- * notice appears in all copies.  This software is provided without any
  -- * warranty, express or implied.  Red Hat makes no representations about
  -- * the suitability of this software for any purpose.
  -- *
  -- * IN NO EVENT SHALL RED HAT BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT,
  -- * SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF
  -- * THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF RED HAT HAS BEEN ADVISED
  -- * OF THE POSSIBILITY OF SUCH DAMAGE.
  -- *
  -- * RED HAT DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  -- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  -- * PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND
  -- * RED HAT HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES,
  -- * ENHANCEMENTS, OR MODIFICATIONS.
  --  

   subtype aio_context_t is uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:33

  -- These two are experimental.
  --	 * IOCB_CMD_PREADX = 4,
  --	 * IOCB_CMD_POLL = 5,
  --	  

  -- * Valid flags for the "aio_flags" member of the "struct iocb".
  -- *
  -- * IOCB_FLAG_RESFD - Set if the "aio_resfd" member of the "struct iocb"
  -- *                   is valid.
  --  

  -- read() from /dev/aio returns these structures.  
  -- the data field from the iocb  
   type io_event is record
      data : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:59
      obj : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:60
      res : aliased uapi_asm_generic_int_ll64_h.uu_s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:61
      res2 : aliased uapi_asm_generic_int_ll64_h.uu_s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:62
   end record;
   pragma Convention (C_Pass_By_Copy, io_event);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:58

  -- what iocb this event came from  
  -- result code for this event  
  -- secondary result  
  -- * we always use a 64bit off_t when communicating
  -- * with userland.  its up to libraries to do the
  -- * proper padding and aio_error abstraction
  --  

  -- these are internal to the kernel/libc.  
  -- data to be returned in event's data  
   type iocb is record
      aio_data : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:81
      aio_key : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:82
      aio_reserved1 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:82
      aio_lio_opcode : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:86
      aio_reqprio : aliased uapi_asm_generic_int_ll64_h.uu_s16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:87
      aio_fildes : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:88
      aio_buf : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:90
      aio_nbytes : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:91
      aio_offset : aliased uapi_asm_generic_int_ll64_h.uu_s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:92
      aio_reserved2 : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:95
      aio_flags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:98
      aio_resfd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:104
   end record;
   pragma Convention (C_Pass_By_Copy, iocb);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/aio_abi.h:79

  -- the kernel sets aio_key to the req #  
  -- common fields  
  -- see IOCB_CMD_ above  
  -- extra parameters  
  -- TODO: use this for a (struct sigevent *)  
  -- flags for the "struct iocb"  
  --	 * if the IOCB_FLAG_RESFD flag of "aio_flags" is set, this is an
  --	 * eventfd to signal AIO readiness to
  --	  

  -- 64 bytes  
end uapi_linux_aio_abi_h;

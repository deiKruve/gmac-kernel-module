pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with uapi_asm_generic_posix_types_h;

package uapi_linux_uio_h is

   --  unsupported macro: UIO_FASTIOV 8
   --  unsupported macro: UIO_MAXIOV 1024
  -- *	Berkeley style UIO structures	-	Alan Cox 1994.
  -- *
  -- *		This program is free software; you can redistribute it and/or
  -- *		modify it under the terms of the GNU General Public License
  -- *		as published by the Free Software Foundation; either version
  -- *		2 of the License, or (at your option) any later version.
  --  

  -- BSD uses caddr_t (1003.1g requires void *)  
   type iovec is record
      iov_base : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/uio.h:18
      iov_len : aliased uapi_asm_generic_posix_types_h.uu_kernel_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/uio.h:19
   end record;
   pragma Convention (C_Pass_By_Copy, iovec);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/uio.h:16

  -- Must be size_t (1003.1g)  
  -- *	UIO_MAXIOV shall be at least 16 1003.1g (5.4.1.1)
  --  

end uapi_linux_uio_h;

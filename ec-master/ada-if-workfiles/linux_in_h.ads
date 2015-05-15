pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_types_h;
with Interfaces.C.Extensions;

package linux_in_h is

  -- * INET		An implementation of the TCP/IP protocol suite for the LINUX
  -- *		operating system.  INET is implemented using the  BSD Socket
  -- *		interface as the means of communication with the user level.
  -- *
  -- *		Definitions of the Internet Protocol.
  -- *
  -- * Version:	@(#)in.h	1.0.1	04/21/93
  -- *
  -- * Authors:	Original taken from the GNU Project <netinet/in.h> file.
  -- *		Fred N. van Kempen, <waltje@uWalt.NL.Mugnet.ORG>
  -- *
  -- *		This program is free software; you can redistribute it and/or
  -- *		modify it under the terms of the GNU General Public License
  -- *		as published by the Free Software Foundation; either version
  -- *		2 of the License, or (at your option) any later version.
  --  

   function proto_ports_offset (proto : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:25
   pragma Import (CPP, proto_ports_offset, "_ZL18proto_ports_offseti");

  -- SPI  
  -- SPI  
   function ipv4_is_loopback (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:42
   pragma Import (CPP, ipv4_is_loopback, "_ZL16ipv4_is_loopbackj");

   function ipv4_is_multicast (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:47
   pragma Import (CPP, ipv4_is_multicast, "_ZL17ipv4_is_multicastj");

   function ipv4_is_local_multicast (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:52
   pragma Import (CPP, ipv4_is_local_multicast, "_ZL23ipv4_is_local_multicastj");

   function ipv4_is_lbcast (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:57
   pragma Import (CPP, ipv4_is_lbcast, "_ZL14ipv4_is_lbcastj");

  -- limited broadcast  
   function ipv4_is_zeronet (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:63
   pragma Import (CPP, ipv4_is_zeronet, "_ZL15ipv4_is_zeronetj");

  -- Special-Use IPv4 Addresses (RFC3330)  
   function ipv4_is_private_10 (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:70
   pragma Import (CPP, ipv4_is_private_10, "_ZL18ipv4_is_private_10j");

   function ipv4_is_private_172 (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:75
   pragma Import (CPP, ipv4_is_private_172, "_ZL19ipv4_is_private_172j");

   function ipv4_is_private_192 (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:80
   pragma Import (CPP, ipv4_is_private_192, "_ZL19ipv4_is_private_192j");

   function ipv4_is_linklocal_169 (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:85
   pragma Import (CPP, ipv4_is_linklocal_169, "_ZL21ipv4_is_linklocal_169j");

   function ipv4_is_anycast_6to4 (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:90
   pragma Import (CPP, ipv4_is_anycast_6to4, "_ZL20ipv4_is_anycast_6to4j");

   function ipv4_is_test_192 (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:95
   pragma Import (CPP, ipv4_is_test_192, "_ZL16ipv4_is_test_192j");

   function ipv4_is_test_198 (addr : uapi_linux_types_h.uu_be32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in.h:100
   pragma Import (CPP, ipv4_is_test_198, "_ZL16ipv4_is_test_198j");

end linux_in_h;

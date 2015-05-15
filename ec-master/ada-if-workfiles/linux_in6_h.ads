pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_in6_h;

package linux_in6_h is

   --  unsupported macro: IN6ADDR_ANY_INIT { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 } } }
   --  unsupported macro: IN6ADDR_LOOPBACK_INIT { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1 } } }
   --  unsupported macro: IN6ADDR_LINKLOCAL_ALLNODES_INIT { { { 0xff,2,0,0,0,0,0,0,0,0,0,0,0,0,0,1 } } }
   --  unsupported macro: IN6ADDR_LINKLOCAL_ALLROUTERS_INIT { { { 0xff,2,0,0,0,0,0,0,0,0,0,0,0,0,0,2 } } }
   --  unsupported macro: IN6ADDR_INTERFACELOCAL_ALLNODES_INIT { { { 0xff,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1 } } }
   --  unsupported macro: IN6ADDR_INTERFACELOCAL_ALLROUTERS_INIT { { { 0xff,1,0,0,0,0,0,0,0,0,0,0,0,0,0,2 } } }
   --  unsupported macro: IN6ADDR_SITELOCAL_ALLROUTERS_INIT { { { 0xff,5,0,0,0,0,0,0,0,0,0,0,0,0,0,2 } } }
  -- *	Types and definitions for AF_INET6 
  -- *	Linux INET6 implementation 
  -- *
  -- *	Authors:
  -- *	Pedro Roque		<roque@di.fc.ul.pt>	
  -- *
  -- *	Sources:
  -- *	IPv6 Program Interfaces for BSD Systems
  -- *      <draft-ietf-ipngwg-bsd-api-05.txt>
  -- *
  -- *	Advanced Sockets API for IPv6
  -- *	<draft-stevens-advanced-api-00.txt>
  -- *
  -- *	This program is free software; you can redistribute it and/or
  -- *      modify it under the terms of the GNU General Public License
  -- *      as published by the Free Software Foundation; either version
  -- *      2 of the License, or (at your option) any later version.
  --  

  -- IPv6 Wildcard Address (::) and Loopback Address (::1) defined in RFC2553
  -- * NOTE: Be aware the IN6ADDR_* constants and in6addr_* externals are defined
  -- * in network byte order, not in host byte order as are the IPv4 equivalents
  --  

   in6addr_any : aliased uapi_linux_in6_h.in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in6.h:29
   pragma Import (C, in6addr_any, "in6addr_any");

   in6addr_loopback : aliased uapi_linux_in6_h.in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in6.h:31
   pragma Import (C, in6addr_loopback, "in6addr_loopback");

   in6addr_linklocal_allnodes : aliased uapi_linux_in6_h.in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in6.h:33
   pragma Import (C, in6addr_linklocal_allnodes, "in6addr_linklocal_allnodes");

   in6addr_linklocal_allrouters : aliased uapi_linux_in6_h.in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in6.h:36
   pragma Import (C, in6addr_linklocal_allrouters, "in6addr_linklocal_allrouters");

   in6addr_interfacelocal_allnodes : aliased uapi_linux_in6_h.in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in6.h:39
   pragma Import (C, in6addr_interfacelocal_allnodes, "in6addr_interfacelocal_allnodes");

   in6addr_interfacelocal_allrouters : aliased uapi_linux_in6_h.in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in6.h:42
   pragma Import (C, in6addr_interfacelocal_allrouters, "in6addr_interfacelocal_allrouters");

   in6addr_sitelocal_allrouters : aliased uapi_linux_in6_h.in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/in6.h:45
   pragma Import (C, in6addr_sitelocal_allrouters, "in6addr_sitelocal_allrouters");

end linux_in6_h;

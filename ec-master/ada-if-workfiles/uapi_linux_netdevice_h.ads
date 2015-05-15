pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uapi_linux_netdevice_h is

   --  unsupported macro: MAX_ADDR_LEN 32
   --  unsupported macro: INIT_NETDEV_GROUP 0
   --  unsupported macro: NET_ADDR_PERM 0
   --  unsupported macro: NET_ADDR_RANDOM 1
   --  unsupported macro: NET_ADDR_STOLEN 2
   --  unsupported macro: NET_ADDR_SET 3
  -- * INET		An implementation of the TCP/IP protocol suite for the LINUX
  -- *		operating system.  INET is implemented using the  BSD Socket
  -- *		interface as the means of communication with the user level.
  -- *
  -- *		Definitions for the Interfaces handler.
  -- *
  -- * Version:	@(#)dev.h	1.0.10	08/12/93
  -- *
  -- * Authors:	Ross Biro
  -- *		Fred N. van Kempen, <waltje@uWalt.NL.Mugnet.ORG>
  -- *		Corey Minyard <wf-rch!minyard@relay.EU.net>
  -- *		Donald J. Becker, <becker@cesdis.gsfc.nasa.gov>
  -- *		Alan Cox, <alan@lxorguk.ukuu.org.uk>
  -- *		Bjorn Ekwall. <bj0rn@blox.se>
  -- *              Pekka Riikonen <priikone@poseidon.pspt.fi>
  -- *
  -- *		This program is free software; you can redistribute it and/or
  -- *		modify it under the terms of the GNU General Public License
  -- *		as published by the Free Software Foundation; either version
  -- *		2 of the License, or (at your option) any later version.
  -- *
  -- *		Moved to /usr/include/linux for NET3
  --  

  -- Initial net device group. All devices belong to group 0 by default.  
  -- Media selection options.  
  -- hardware address assignment types  
end uapi_linux_netdevice_h;

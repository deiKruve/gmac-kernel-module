pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_skbuff_h;
limited with uapi_linux_if_ether_h;
with Interfaces.C.Strings;
with linux_types_h;

package linux_if_ether_h is

  -- * INET		An implementation of the TCP/IP protocol suite for the LINUX
  -- *		operating system.  INET is implemented using the  BSD Socket
  -- *		interface as the means of communication with the user level.
  -- *
  -- *		Global definitions for the Ethernet IEEE 802.3 interface.
  -- *
  -- * Version:	@(#)if_ether.h	1.0.1a	02/08/94
  -- *
  -- * Author:	Fred N. van Kempen, <waltje@uWalt.NL.Mugnet.ORG>
  -- *		Donald Becker, <becker@super.org>
  -- *		Alan Cox, <alan@lxorguk.ukuu.org.uk>
  -- *		Steve Whitehouse, <gw7rrm@eeshack3.swan.ac.uk>
  -- *
  -- *		This program is free software; you can redistribute it and/or
  -- *		modify it under the terms of the GNU General Public License
  -- *		as published by the Free Software Foundation; either version
  -- *		2 of the License, or (at your option) any later version.
  --  

   function eth_hdr (skb : access constant linux_skbuff_h.sk_buff) return access uapi_linux_if_ether_h.ethhdr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_ether.h:26
   pragma Import (CPP, eth_hdr, "_ZL7eth_hdrPK7sk_buff");

   function eth_header_parse (skb : access constant linux_skbuff_h.sk_buff; haddr : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_ether.h:31
   pragma Import (CPP, eth_header_parse, "_Z16eth_header_parsePK7sk_buffPh");

   function sysfs_format_mac
     (buf : Interfaces.C.Strings.chars_ptr;
      addr : access unsigned_char;
      len : int) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_ether.h:33
   pragma Import (CPP, sysfs_format_mac, "_Z16sysfs_format_macPcPKhi");

end linux_if_ether_h;

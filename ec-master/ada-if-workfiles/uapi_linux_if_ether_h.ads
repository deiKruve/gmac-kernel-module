pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_types_h;

package uapi_linux_if_ether_h is

   --  unsupported macro: ETH_ALEN 6
   --  unsupported macro: ETH_HLEN 14
   --  unsupported macro: ETH_ZLEN 60
   --  unsupported macro: ETH_DATA_LEN 1500
   --  unsupported macro: ETH_FRAME_LEN 1514
   --  unsupported macro: ETH_FCS_LEN 4
   --  unsupported macro: ETH_P_LOOP 0x0060
   --  unsupported macro: ETH_P_PUP 0x0200
   --  unsupported macro: ETH_P_PUPAT 0x0201
   --  unsupported macro: ETH_P_IP 0x0800
   --  unsupported macro: ETH_P_X25 0x0805
   --  unsupported macro: ETH_P_ARP 0x0806
   --  unsupported macro: ETH_P_BPQ 0x08FF
   --  unsupported macro: ETH_P_IEEEPUP 0x0a00
   --  unsupported macro: ETH_P_IEEEPUPAT 0x0a01
   --  unsupported macro: ETH_P_BATMAN 0x4305
   --  unsupported macro: ETH_P_DEC 0x6000
   --  unsupported macro: ETH_P_DNA_DL 0x6001
   --  unsupported macro: ETH_P_DNA_RC 0x6002
   --  unsupported macro: ETH_P_DNA_RT 0x6003
   --  unsupported macro: ETH_P_LAT 0x6004
   --  unsupported macro: ETH_P_DIAG 0x6005
   --  unsupported macro: ETH_P_CUST 0x6006
   --  unsupported macro: ETH_P_SCA 0x6007
   --  unsupported macro: ETH_P_TEB 0x6558
   --  unsupported macro: ETH_P_RARP 0x8035
   --  unsupported macro: ETH_P_ATALK 0x809B
   --  unsupported macro: ETH_P_AARP 0x80F3
   --  unsupported macro: ETH_P_8021Q 0x8100
   --  unsupported macro: ETH_P_IPX 0x8137
   --  unsupported macro: ETH_P_IPV6 0x86DD
   --  unsupported macro: ETH_P_PAUSE 0x8808
   --  unsupported macro: ETH_P_SLOW 0x8809
   --  unsupported macro: ETH_P_WCCP 0x883E
   --  unsupported macro: ETH_P_MPLS_UC 0x8847
   --  unsupported macro: ETH_P_MPLS_MC 0x8848
   --  unsupported macro: ETH_P_ATMMPOA 0x884c
   --  unsupported macro: ETH_P_PPP_DISC 0x8863
   --  unsupported macro: ETH_P_PPP_SES 0x8864
   --  unsupported macro: ETH_P_LINK_CTL 0x886c
   --  unsupported macro: ETH_P_ATMFATE 0x8884
   --  unsupported macro: ETH_P_PAE 0x888E
   --  unsupported macro: ETH_P_AOE 0x88A2
   --  unsupported macro: ETH_P_8021AD 0x88A8
   --  unsupported macro: ETH_P_802_EX1 0x88B5
   --  unsupported macro: ETH_P_TIPC 0x88CA
   --  unsupported macro: ETH_P_8021AH 0x88E7
   --  unsupported macro: ETH_P_MVRP 0x88F5
   --  unsupported macro: ETH_P_1588 0x88F7
   --  unsupported macro: ETH_P_PRP 0x88FB
   --  unsupported macro: ETH_P_FCOE 0x8906
   --  unsupported macro: ETH_P_TDLS 0x890D
   --  unsupported macro: ETH_P_FIP 0x8914
   --  unsupported macro: ETH_P_80221 0x8917
   --  unsupported macro: ETH_P_LOOPBACK 0x9000
   --  unsupported macro: ETH_P_QINQ1 0x9100
   --  unsupported macro: ETH_P_QINQ2 0x9200
   --  unsupported macro: ETH_P_QINQ3 0x9300
   --  unsupported macro: ETH_P_EDSA 0xDADA
   --  unsupported macro: ETH_P_AF_IUCV 0xFBFB
   --  unsupported macro: ETH_P_802_3_MIN 0x0600
   --  unsupported macro: ETH_P_802_3 0x0001
   --  unsupported macro: ETH_P_AX25 0x0002
   --  unsupported macro: ETH_P_ALL 0x0003
   --  unsupported macro: ETH_P_802_2 0x0004
   --  unsupported macro: ETH_P_SNAP 0x0005
   --  unsupported macro: ETH_P_DDCMP 0x0006
   --  unsupported macro: ETH_P_WAN_PPP 0x0007
   --  unsupported macro: ETH_P_PPP_MP 0x0008
   --  unsupported macro: ETH_P_LOCALTALK 0x0009
   --  unsupported macro: ETH_P_CAN 0x000C
   --  unsupported macro: ETH_P_CANFD 0x000D
   --  unsupported macro: ETH_P_PPPTALK 0x0010
   --  unsupported macro: ETH_P_TR_802_2 0x0011
   --  unsupported macro: ETH_P_MOBITEX 0x0015
   --  unsupported macro: ETH_P_CONTROL 0x0016
   --  unsupported macro: ETH_P_IRDA 0x0017
   --  unsupported macro: ETH_P_ECONET 0x0018
   --  unsupported macro: ETH_P_HDLC 0x0019
   --  unsupported macro: ETH_P_ARCNET 0x001A
   --  unsupported macro: ETH_P_DSA 0x001B
   --  unsupported macro: ETH_P_TRAILER 0x001C
   --  unsupported macro: ETH_P_PHONET 0x00F5
   --  unsupported macro: ETH_P_IEEE802154 0x00F6
   --  unsupported macro: ETH_P_CAIF 0x00F7
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

  -- *	IEEE 802.3 Ethernet magic constants.  The frame sizes omit the preamble
  -- *	and FCS/CRC (frame check sequence).
  --  

  -- *	These are the defined Ethernet Protocol ID's.
  --  

  -- *	Non DIX types. Won't clash for 1500 types.
  --  

  -- *	This is an Ethernet frame header.
  --  

  -- destination eth addr	 
   type ethhdr_h_dest_array is array (0 .. 5) of aliased unsigned_char;
   type ethhdr_h_source_array is array (0 .. 5) of aliased unsigned_char;
   type ethhdr is record
      h_dest : aliased ethhdr_h_dest_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_ether.h:137
      h_source : aliased ethhdr_h_source_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_ether.h:138
      h_proto : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_ether.h:139
   end record;
   pragma Convention (C_Pass_By_Copy, ethhdr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_ether.h:136

  -- source ether addr	 
  -- packet type ID field	 
end uapi_linux_if_ether_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;
with uapi_linux_types_h;

package uapi_linux_in6_h is

   --  unsupported macro: s6_addr in6_u.u6_addr8
   --  unsupported macro: s6_addr16 in6_u.u6_addr16
   --  unsupported macro: s6_addr32 in6_u.u6_addr32
   --  unsupported macro: ipv6mr_acaddr ipv6mr_multiaddr
   --  unsupported macro: IPV6_FL_A_GET 0
   --  unsupported macro: IPV6_FL_A_PUT 1
   --  unsupported macro: IPV6_FL_A_RENEW 2
   --  unsupported macro: IPV6_FL_F_CREATE 1
   --  unsupported macro: IPV6_FL_F_EXCL 2
   --  unsupported macro: IPV6_FL_F_REFLECT 4
   --  unsupported macro: IPV6_FL_F_REMOTE 8
   --  unsupported macro: IPV6_FL_S_NONE 0
   --  unsupported macro: IPV6_FL_S_EXCL 1
   --  unsupported macro: IPV6_FL_S_PROCESS 2
   --  unsupported macro: IPV6_FL_S_USER 3
   --  unsupported macro: IPV6_FL_S_ANY 255
   --  unsupported macro: IPV6_FLOWINFO_FLOWLABEL 0x000fffff
   --  unsupported macro: IPV6_FLOWINFO_PRIORITY 0x0ff00000
   --  unsupported macro: IPV6_PRIORITY_UNCHARACTERIZED 0x0000
   --  unsupported macro: IPV6_PRIORITY_FILLER 0x0100
   --  unsupported macro: IPV6_PRIORITY_UNATTENDED 0x0200
   --  unsupported macro: IPV6_PRIORITY_RESERVED1 0x0300
   --  unsupported macro: IPV6_PRIORITY_BULK 0x0400
   --  unsupported macro: IPV6_PRIORITY_RESERVED2 0x0500
   --  unsupported macro: IPV6_PRIORITY_INTERACTIVE 0x0600
   --  unsupported macro: IPV6_PRIORITY_CONTROL 0x0700
   --  unsupported macro: IPV6_PRIORITY_8 0x0800
   --  unsupported macro: IPV6_PRIORITY_9 0x0900
   --  unsupported macro: IPV6_PRIORITY_10 0x0a00
   --  unsupported macro: IPV6_PRIORITY_11 0x0b00
   --  unsupported macro: IPV6_PRIORITY_12 0x0c00
   --  unsupported macro: IPV6_PRIORITY_13 0x0d00
   --  unsupported macro: IPV6_PRIORITY_14 0x0e00
   --  unsupported macro: IPV6_PRIORITY_15 0x0f00
   --  unsupported macro: IPPROTO_HOPOPTS 0
   --  unsupported macro: IPPROTO_ROUTING 43
   --  unsupported macro: IPPROTO_FRAGMENT 44
   --  unsupported macro: IPPROTO_ICMPV6 58
   --  unsupported macro: IPPROTO_NONE 59
   --  unsupported macro: IPPROTO_DSTOPTS 60
   --  unsupported macro: IPPROTO_MH 135
   --  unsupported macro: IPV6_TLV_PAD1 0
   --  unsupported macro: IPV6_TLV_PADN 1
   --  unsupported macro: IPV6_TLV_ROUTERALERT 5
   --  unsupported macro: IPV6_TLV_JUMBO 194
   --  unsupported macro: IPV6_TLV_HAO 201
   --  unsupported macro: IPV6_ADDRFORM 1
   --  unsupported macro: IPV6_2292PKTINFO 2
   --  unsupported macro: IPV6_2292HOPOPTS 3
   --  unsupported macro: IPV6_2292DSTOPTS 4
   --  unsupported macro: IPV6_2292RTHDR 5
   --  unsupported macro: IPV6_2292PKTOPTIONS 6
   --  unsupported macro: IPV6_CHECKSUM 7
   --  unsupported macro: IPV6_2292HOPLIMIT 8
   --  unsupported macro: IPV6_NEXTHOP 9
   --  unsupported macro: IPV6_AUTHHDR 10
   --  unsupported macro: IPV6_FLOWINFO 11
   --  unsupported macro: IPV6_UNICAST_HOPS 16
   --  unsupported macro: IPV6_MULTICAST_IF 17
   --  unsupported macro: IPV6_MULTICAST_HOPS 18
   --  unsupported macro: IPV6_MULTICAST_LOOP 19
   --  unsupported macro: IPV6_ADD_MEMBERSHIP 20
   --  unsupported macro: IPV6_DROP_MEMBERSHIP 21
   --  unsupported macro: IPV6_ROUTER_ALERT 22
   --  unsupported macro: IPV6_MTU_DISCOVER 23
   --  unsupported macro: IPV6_MTU 24
   --  unsupported macro: IPV6_RECVERR 25
   --  unsupported macro: IPV6_V6ONLY 26
   --  unsupported macro: IPV6_JOIN_ANYCAST 27
   --  unsupported macro: IPV6_LEAVE_ANYCAST 28
   --  unsupported macro: IPV6_PMTUDISC_DONT 0
   --  unsupported macro: IPV6_PMTUDISC_WANT 1
   --  unsupported macro: IPV6_PMTUDISC_DO 2
   --  unsupported macro: IPV6_PMTUDISC_PROBE 3
   --  unsupported macro: IPV6_PMTUDISC_INTERFACE 4
   --  unsupported macro: IPV6_PMTUDISC_OMIT 5
   --  unsupported macro: IPV6_FLOWLABEL_MGR 32
   --  unsupported macro: IPV6_FLOWINFO_SEND 33
   --  unsupported macro: IPV6_IPSEC_POLICY 34
   --  unsupported macro: IPV6_XFRM_POLICY 35
   --  unsupported macro: IPV6_RECVPKTINFO 49
   --  unsupported macro: IPV6_PKTINFO 50
   --  unsupported macro: IPV6_RECVHOPLIMIT 51
   --  unsupported macro: IPV6_HOPLIMIT 52
   --  unsupported macro: IPV6_RECVHOPOPTS 53
   --  unsupported macro: IPV6_HOPOPTS 54
   --  unsupported macro: IPV6_RTHDRDSTOPTS 55
   --  unsupported macro: IPV6_RECVRTHDR 56
   --  unsupported macro: IPV6_RTHDR 57
   --  unsupported macro: IPV6_RECVDSTOPTS 58
   --  unsupported macro: IPV6_DSTOPTS 59
   --  unsupported macro: IPV6_RECVPATHMTU 60
   --  unsupported macro: IPV6_PATHMTU 61
   --  unsupported macro: IPV6_DONTFRAG 62
   --  unsupported macro: IPV6_RECVTCLASS 66
   --  unsupported macro: IPV6_TCLASS 67
   --  unsupported macro: IPV6_ADDR_PREFERENCES 72
   --  unsupported macro: IPV6_PREFER_SRC_TMP 0x0001
   --  unsupported macro: IPV6_PREFER_SRC_PUBLIC 0x0002
   --  unsupported macro: IPV6_PREFER_SRC_PUBTMP_DEFAULT 0x0100
   --  unsupported macro: IPV6_PREFER_SRC_COA 0x0004
   --  unsupported macro: IPV6_PREFER_SRC_HOME 0x0400
   --  unsupported macro: IPV6_PREFER_SRC_CGA 0x0008
   --  unsupported macro: IPV6_PREFER_SRC_NONCGA 0x0800
   --  unsupported macro: IPV6_MINHOPCOUNT 73
   --  unsupported macro: IPV6_ORIGDSTADDR 74
   --  unsupported macro: IPV6_RECVORIGDSTADDR IPV6_ORIGDSTADDR
   --  unsupported macro: IPV6_TRANSPARENT 75
   --  unsupported macro: IPV6_UNICAST_IF 76
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

  -- *	IPv6 address structure
  --  

   type in6_addr_u6_addr8_array is array (0 .. 15) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type in6_addr_u6_addr16_array is array (0 .. 7) of aliased uapi_linux_types_h.uu_be16;
   type in6_addr_u6_addr32_array is array (0 .. 3) of aliased uapi_linux_types_h.uu_be32;
   type anon_315 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            u6_addr8 : aliased in6_addr_u6_addr8_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:34
         when 1 =>
            u6_addr16 : aliased in6_addr_u6_addr16_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:36
         when others =>
            u6_addr32 : aliased in6_addr_u6_addr32_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:37
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_315);
   pragma Unchecked_Union (anon_315);
   type in6_addr is record
      in6_u : anon_315;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:39
   end record;
   pragma Convention (C_Pass_By_Copy, in6_addr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:32

  -- AF_INET6  
   type sockaddr_in6 is record
      sin6_family : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:50
      sin6_port : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:51
      sin6_flowinfo : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:52
      sin6_addr : aliased in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:53
      sin6_scope_id : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:54
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr_in6);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:49

  -- Transport layer port #  
  -- IPv6 flow information  
  -- IPv6 address  
  -- scope id (new in RFC2553)  
  -- IPv6 multicast address of group  
   type ipv6_mreq is record
      ipv6mr_multiaddr : aliased in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:61
      ipv6mr_ifindex : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:64
   end record;
   pragma Convention (C_Pass_By_Copy, ipv6_mreq);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:59

  -- local IPv6 address of interface  
   type in6_flowlabel_req is record
      flr_dst : aliased in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:71
      flr_label : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:72
      flr_action : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:73
      flr_share : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:74
      flr_flags : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:75
      flr_expires : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:76
      flr_linger : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:77
      uu_flr_pad : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, in6_flowlabel_req);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in6.h:70

  -- Options in format of IPV6_PKTOPTIONS  
  -- *	Bitmask constant declarations to help applications select out the 
  -- *	flow label and priority fields.
  -- *
  -- *	Note that this are in host byte order while the flowinfo field of
  -- *	sockaddr_in6 is in network byte order.
  --  

  -- These definitions are obsolete  
  -- *	IPV6 extension headers
  --  

  -- *	IPv6 TLV options.
  --  

  -- *	IPV6 socket options
  --  

  -- IPV6_MTU_DISCOVER values  
  -- same as IPV6_PMTUDISC_PROBE, provided for symetry with IPv4
  -- * also see comments on IP_PMTUDISC_INTERFACE
  --  

  -- weaker version of IPV6_PMTUDISC_INTERFACE, which allows packets to
  -- * get fragmented if they exceed the interface mtu
  --  

  -- Flowlabel  
  -- * Multicast:
  -- * Following socket options are shared between IPv4 and IPv6.
  -- *
  -- * MCAST_JOIN_GROUP		42
  -- * MCAST_BLOCK_SOURCE		43
  -- * MCAST_UNBLOCK_SOURCE		44
  -- * MCAST_LEAVE_GROUP		45
  -- * MCAST_JOIN_SOURCE_GROUP	46
  -- * MCAST_LEAVE_SOURCE_GROUP	47
  -- * MCAST_MSFILTER		48
  --  

  -- * Advanced API (RFC3542) (1)
  -- *
  -- * Note: IPV6_RECVRTHDRDSTOPTS does not exist. see net/ipv6/datagram.c.
  --  

  -- * Netfilter (1)
  -- *
  -- * Following socket options are used in ip6_tables;
  -- * see include/linux/netfilter_ipv6/ip6_tables.h.
  -- *
  -- * IP6T_SO_SET_REPLACE / IP6T_SO_GET_INFO		64
  -- * IP6T_SO_SET_ADD_COUNTERS / IP6T_SO_GET_ENTRIES	65
  --  

  -- * Advanced API (RFC3542) (2)
  --  

  -- * Netfilter (2)
  -- *
  -- * Following socket options are used in ip6_tables;
  -- * see include/linux/netfilter_ipv6/ip6_tables.h.
  -- *
  -- * IP6T_SO_GET_REVISION_MATCH	68
  -- * IP6T_SO_GET_REVISION_TARGET	69
  -- * IP6T_SO_ORIGINAL_DST		80
  --  

  -- RFC5014: Source address selection  
  -- RFC5082: Generalized Ttl Security Mechanism  
  -- * Multicast Routing:
  -- * see include/uapi/linux/mroute6.h.
  -- *
  -- * MRT6_BASE			200
  -- * ...
  -- * MRT6_MAX
  --  

end uapi_linux_in6_h;

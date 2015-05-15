pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_types_h;
with uapi_asm_generic_int_ll64_h;
with uapi_linux_socket_h;

package uapi_linux_in_h is

   --  unsupported macro: IPPROTO_IP IPPROTO_IP
   --  unsupported macro: IPPROTO_ICMP IPPROTO_ICMP
   --  unsupported macro: IPPROTO_IGMP IPPROTO_IGMP
   --  unsupported macro: IPPROTO_IPIP IPPROTO_IPIP
   --  unsupported macro: IPPROTO_TCP IPPROTO_TCP
   --  unsupported macro: IPPROTO_EGP IPPROTO_EGP
   --  unsupported macro: IPPROTO_PUP IPPROTO_PUP
   --  unsupported macro: IPPROTO_UDP IPPROTO_UDP
   --  unsupported macro: IPPROTO_IDP IPPROTO_IDP
   --  unsupported macro: IPPROTO_TP IPPROTO_TP
   --  unsupported macro: IPPROTO_DCCP IPPROTO_DCCP
   --  unsupported macro: IPPROTO_IPV6 IPPROTO_IPV6
   --  unsupported macro: IPPROTO_RSVP IPPROTO_RSVP
   --  unsupported macro: IPPROTO_GRE IPPROTO_GRE
   --  unsupported macro: IPPROTO_ESP IPPROTO_ESP
   --  unsupported macro: IPPROTO_AH IPPROTO_AH
   --  unsupported macro: IPPROTO_MTP IPPROTO_MTP
   --  unsupported macro: IPPROTO_BEETPH IPPROTO_BEETPH
   --  unsupported macro: IPPROTO_ENCAP IPPROTO_ENCAP
   --  unsupported macro: IPPROTO_PIM IPPROTO_PIM
   --  unsupported macro: IPPROTO_COMP IPPROTO_COMP
   --  unsupported macro: IPPROTO_SCTP IPPROTO_SCTP
   --  unsupported macro: IPPROTO_UDPLITE IPPROTO_UDPLITE
   --  unsupported macro: IPPROTO_RAW IPPROTO_RAW
   --  unsupported macro: IP_TOS 1
   --  unsupported macro: IP_TTL 2
   --  unsupported macro: IP_HDRINCL 3
   --  unsupported macro: IP_OPTIONS 4
   --  unsupported macro: IP_ROUTER_ALERT 5
   --  unsupported macro: IP_RECVOPTS 6
   --  unsupported macro: IP_RETOPTS 7
   --  unsupported macro: IP_PKTINFO 8
   --  unsupported macro: IP_PKTOPTIONS 9
   --  unsupported macro: IP_MTU_DISCOVER 10
   --  unsupported macro: IP_RECVERR 11
   --  unsupported macro: IP_RECVTTL 12
   --  unsupported macro: IP_RECVTOS 13
   --  unsupported macro: IP_MTU 14
   --  unsupported macro: IP_FREEBIND 15
   --  unsupported macro: IP_IPSEC_POLICY 16
   --  unsupported macro: IP_XFRM_POLICY 17
   --  unsupported macro: IP_PASSSEC 18
   --  unsupported macro: IP_TRANSPARENT 19
   --  unsupported macro: IP_RECVRETOPTS IP_RETOPTS
   --  unsupported macro: IP_ORIGDSTADDR 20
   --  unsupported macro: IP_RECVORIGDSTADDR IP_ORIGDSTADDR
   --  unsupported macro: IP_MINTTL 21
   --  unsupported macro: IP_NODEFRAG 22
   --  unsupported macro: IP_PMTUDISC_DONT 0
   --  unsupported macro: IP_PMTUDISC_WANT 1
   --  unsupported macro: IP_PMTUDISC_DO 2
   --  unsupported macro: IP_PMTUDISC_PROBE 3
   --  unsupported macro: IP_PMTUDISC_INTERFACE 4
   --  unsupported macro: IP_PMTUDISC_OMIT 5
   --  unsupported macro: IP_MULTICAST_IF 32
   --  unsupported macro: IP_MULTICAST_TTL 33
   --  unsupported macro: IP_MULTICAST_LOOP 34
   --  unsupported macro: IP_ADD_MEMBERSHIP 35
   --  unsupported macro: IP_DROP_MEMBERSHIP 36
   --  unsupported macro: IP_UNBLOCK_SOURCE 37
   --  unsupported macro: IP_BLOCK_SOURCE 38
   --  unsupported macro: IP_ADD_SOURCE_MEMBERSHIP 39
   --  unsupported macro: IP_DROP_SOURCE_MEMBERSHIP 40
   --  unsupported macro: IP_MSFILTER 41
   --  unsupported macro: MCAST_JOIN_GROUP 42
   --  unsupported macro: MCAST_BLOCK_SOURCE 43
   --  unsupported macro: MCAST_UNBLOCK_SOURCE 44
   --  unsupported macro: MCAST_LEAVE_GROUP 45
   --  unsupported macro: MCAST_JOIN_SOURCE_GROUP 46
   --  unsupported macro: MCAST_LEAVE_SOURCE_GROUP 47
   --  unsupported macro: MCAST_MSFILTER 48
   --  unsupported macro: IP_MULTICAST_ALL 49
   --  unsupported macro: IP_UNICAST_IF 50
   --  unsupported macro: MCAST_EXCLUDE 0
   --  unsupported macro: MCAST_INCLUDE 1
   --  unsupported macro: IP_DEFAULT_MULTICAST_TTL 1
   --  unsupported macro: IP_DEFAULT_MULTICAST_LOOP 1
   --  arg-macro: function IP_MSFILTER_SIZE (sizeof(struct ip_msfilter) - sizeof(__u32) + (numsrc) * sizeof(__u32)
   --    return sizeof(struct ip_msfilter) - sizeof(__u32) + (numsrc) * sizeof(__u32);
   --  arg-macro: function GROUP_FILTER_SIZE (sizeof(struct group_filter) - sizeof(struct __kernel_sockaddr_storage) + (numsrc) * sizeof(struct __kernel_sockaddr_storage)
   --    return sizeof(struct group_filter) - sizeof(struct __kernel_sockaddr_storage) + (numsrc) * sizeof(struct __kernel_sockaddr_storage);
   --  unsupported macro: sin_zero __pad
   --  arg-macro: function IN_CLASSA ((((long int) (a)) and 0x80000000) = 0
   --    return (((long int) (a)) and 0x80000000) = 0;
   --  unsupported macro: IN_CLASSA_NET 0xff000000
   --  unsupported macro: IN_CLASSA_NSHIFT 24
   --  unsupported macro: IN_CLASSA_HOST (0xffffffff & ~IN_CLASSA_NET)
   --  unsupported macro: IN_CLASSA_MAX 128
   --  arg-macro: function IN_CLASSB ((((long int) (a)) and 0xc0000000) = 0x80000000
   --    return (((long int) (a)) and 0xc0000000) = 0x80000000;
   --  unsupported macro: IN_CLASSB_NET 0xffff0000
   --  unsupported macro: IN_CLASSB_NSHIFT 16
   --  unsupported macro: IN_CLASSB_HOST (0xffffffff & ~IN_CLASSB_NET)
   --  unsupported macro: IN_CLASSB_MAX 65536
   --  arg-macro: function IN_CLASSC ((((long int) (a)) and 0xe0000000) = 0xc0000000
   --    return (((long int) (a)) and 0xe0000000) = 0xc0000000;
   --  unsupported macro: IN_CLASSC_NET 0xffffff00
   --  unsupported macro: IN_CLASSC_NSHIFT 8
   --  unsupported macro: IN_CLASSC_HOST (0xffffffff & ~IN_CLASSC_NET)
   --  arg-macro: function IN_CLASSD ((((long int) (a)) and 0xf0000000) = 0xe0000000
   --    return (((long int) (a)) and 0xf0000000) = 0xe0000000;
   --  arg-macro: procedure IN_MULTICAST IN_CLASSD(a)
   --    IN_CLASSD(a)
   --  unsupported macro: IN_MULTICAST_NET 0xF0000000
   --  arg-macro: function IN_EXPERIMENTAL ((((long int) (a)) and 0xf0000000) = 0xf0000000
   --    return (((long int) (a)) and 0xf0000000) = 0xf0000000;
   --  arg-macro: procedure IN_BADCLASS IN_EXPERIMENTAL((a))
   --    IN_EXPERIMENTAL((a))
   --  unsupported macro: INADDR_ANY ((unsigned long int) 0x00000000)
   --  unsupported macro: INADDR_BROADCAST ((unsigned long int) 0xffffffff)
   --  unsupported macro: INADDR_NONE ((unsigned long int) 0xffffffff)
   --  unsupported macro: IN_LOOPBACKNET 127
   --  unsupported macro: INADDR_LOOPBACK 0x7f000001
   --  arg-macro: function IN_LOOPBACK ((((long int) (a)) and 0xff000000) = 0x7f000000
   --    return (((long int) (a)) and 0xff000000) = 0x7f000000;
   --  unsupported macro: INADDR_UNSPEC_GROUP 0xe0000000U
   --  unsupported macro: INADDR_ALLHOSTS_GROUP 0xe0000001U
   --  unsupported macro: INADDR_ALLRTRS_GROUP 0xe0000002U
   --  unsupported macro: INADDR_MAX_LOCAL_GROUP 0xe00000ffU
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

  -- Standard well-defined IP protocols.   
  -- Dummy protocol for TCP		 
  -- Internet Control Message Protocol	 
  -- Internet Group Management Protocol	 
  -- IPIP tunnels (older KA9Q tunnels use 94)  
  -- Transmission Control Protocol	 
  -- Exterior Gateway Protocol		 
  -- PUP protocol				 
  -- User Datagram Protocol		 
  -- XNS IDP protocol			 
  -- SO Transport Protocol Class 4	 
  -- Datagram Congestion Control Protocol  
  -- IPv6-in-IPv4 tunnelling		 
  -- RSVP Protocol			 
  -- Cisco GRE tunnels (rfc 1701,1702)	 
  -- Encapsulation Security Payload protocol  
  -- Authentication Header protocol	 
  -- Multicast Transport Protocol		 
  -- IP option pseudo header for BEET	 
  -- Encapsulation Header			 
  -- Protocol Independent Multicast	 
  -- Compression Header Protocol		 
  -- Stream Control Transport Protocol	 
  -- UDP-Lite (RFC 3828)			 
  -- Raw IP packets			 
  -- Internet address.  
   type in_addr is record
      s_addr : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:80
   end record;
   pragma Convention (C_Pass_By_Copy, in_addr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:79

  -- BSD compatibility  
  -- TProxy original addresses  
  -- IP_MTU_DISCOVER values  
  -- Always use interface mtu (ignores dst pmtu) but don't set DF flag.
  -- * Also incoming ICMP frag_needed notifications will be ignored on
  -- * this socket to prevent accepting spoofed ones.
  --  

  -- weaker version of IP_PMTUDISC_INTERFACE, which allos packets to get
  -- * fragmented if they exeed the interface mtu
  --  

  -- These need to appear somewhere around here  
  -- Request struct for multicast socket ops  
  -- IP multicast address of group  
   type ip_mreq is record
      imr_multiaddr : aliased in_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:158
      imr_interface : aliased in_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:159
   end record;
   pragma Convention (C_Pass_By_Copy, ip_mreq);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:157

  -- local IP address of interface  
  -- IP multicast address of group  
   type ip_mreqn is record
      imr_multiaddr : aliased in_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:163
      imr_address : aliased in_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:164
      imr_ifindex : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:165
   end record;
   pragma Convention (C_Pass_By_Copy, ip_mreqn);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:162

  -- local IP address of interface  
  -- Interface index  
   type ip_mreq_source is record
      imr_multiaddr : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:169
      imr_interface : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:170
      imr_sourceaddr : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:171
   end record;
   pragma Convention (C_Pass_By_Copy, ip_mreq_source);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:168

   type ip_msfilter_imsf_slist_array is array (0 .. 0) of aliased uapi_linux_types_h.uu_be32;
   type ip_msfilter is record
      imsf_multiaddr : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:175
      imsf_interface : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:176
      imsf_fmode : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:177
      imsf_numsrc : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:178
      imsf_slist : aliased ip_msfilter_imsf_slist_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:179
   end record;
   pragma Convention (C_Pass_By_Copy, ip_msfilter);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:174

  -- interface index  
   type group_req is record
      gr_interface : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:187
      gr_group : aliased uapi_linux_socket_h.uu_kernel_sockaddr_storage;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:188
   end record;
   pragma Convention (C_Pass_By_Copy, group_req);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:186

  -- group address  
  -- interface index  
   type group_source_req is record
      gsr_interface : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:192
      gsr_group : aliased uapi_linux_socket_h.uu_kernel_sockaddr_storage;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:193
      gsr_source : aliased uapi_linux_socket_h.uu_kernel_sockaddr_storage;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:194
   end record;
   pragma Convention (C_Pass_By_Copy, group_source_req);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:191

  -- group address  
  -- source address  
  -- interface index  
   type group_filter_gf_slist_array is array (0 .. 0) of aliased uapi_linux_socket_h.uu_kernel_sockaddr_storage;
   type group_filter is record
      gf_interface : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:198
      gf_group : aliased uapi_linux_socket_h.uu_kernel_sockaddr_storage;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:199
      gf_fmode : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:200
      gf_numsrc : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:201
      gf_slist : aliased group_filter_gf_slist_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:202
   end record;
   pragma Convention (C_Pass_By_Copy, group_filter);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:197

  -- multicast address  
  -- filter mode  
  -- number of sources  
  -- interface index  
   type in_pktinfo is record
      ipi_ifindex : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:210
      ipi_spec_dst : aliased in_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:211
      ipi_addr : aliased in_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:212
   end record;
   pragma Convention (C_Pass_By_Copy, in_pktinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:209

  -- Structure describing an Internet (IP) socket address.  
  -- Address family		 
   type sockaddr_in_uu_pad_array is array (0 .. 7) of aliased unsigned_char;
   type sockaddr_in is record
      sin_family : aliased uapi_linux_socket_h.uu_kernel_sa_family_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:218
      sin_port : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:219
      sin_addr : aliased in_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:220
      uu_pad : aliased sockaddr_in_uu_pad_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:224
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr_in);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/in.h:217

  -- Port number			 
  -- Internet address		 
  -- Pad to size of `struct sockaddr'.  
  -- * Definitions of the bits in an Internet address integer.
  -- * On subnets, host and network parts are found according
  -- * to the subnet mask, not these masks.
  --  

  -- Address to accept any incoming messages.  
  -- Address to send to all hosts.  
  -- Address indicating an error return.  
  -- Network number for local host loopback.  
  -- Address to loopback in software to local host.   
  -- Defines for Multicast INADDR  
  -- <asm/byteorder.h> contains the htonl type stuff..  
end uapi_linux_in_h;

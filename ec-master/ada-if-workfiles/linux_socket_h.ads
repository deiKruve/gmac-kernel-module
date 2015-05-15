pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_seq_file_h;
with uapi_linux_socket_h;
with System;
limited with uapi_linux_uio_h;
with uapi_asm_generic_posix_types_h;
with uapi_asm_generic_int_ll64_h;
with uapi_linux_types_h;

package linux_socket_h is

   --  unsupported macro: sockaddr_storage __kernel_sockaddr_storage
   --  arg-macro: procedure CMSG_NXTHDR cmsg_nxthdr((mhdr), (cmsg))
   --    cmsg_nxthdr((mhdr), (cmsg))
   --  arg-macro: function CMSG_ALIGN ( ((len)+sizeof(long)-1) and ~(sizeof(long)-1) 
   --    return  ((len)+sizeof(long)-1) and ~(sizeof(long)-1) ;
   --  arg-macro: function CMSG_DATA ((void *)((char *)(cmsg) + CMSG_ALIGN(sizeof(struct cmsghdr)))
   --    return (void *)((char *)(cmsg) + CMSG_ALIGN(sizeof(struct cmsghdr)));
   --  arg-macro: function CMSG_SPACE (CMSG_ALIGN(sizeof(struct cmsghdr)) + CMSG_ALIGN(len)
   --    return CMSG_ALIGN(sizeof(struct cmsghdr)) + CMSG_ALIGN(len);
   --  arg-macro: function CMSG_LEN (CMSG_ALIGN(sizeof(struct cmsghdr)) + (len)
   --    return CMSG_ALIGN(sizeof(struct cmsghdr)) + (len);
   --  arg-macro: procedure CMSG_FIRSTHDR __CMSG_FIRSTHDR((msg).msg_control, (msg).msg_controllen)
   --    __CMSG_FIRSTHDR((msg).msg_control, (msg).msg_controllen)
   --  arg-macro: function CMSG_OK ((cmsg).cmsg_len >= sizeof(struct cmsghdr)  and then  (cmsg).cmsg_len <= (unsigned long) ((mhdr).msg_controllen - ((char *)(cmsg) - (char *)(mhdr).msg_control))
   --    return (cmsg).cmsg_len >= sizeof(struct cmsghdr)  and then  (cmsg).cmsg_len <= (unsigned long) ((mhdr).msg_controllen - ((char *)(cmsg) - (char *)(mhdr).msg_control));
   --  unsupported macro: SCM_RIGHTS 0x01
   --  unsupported macro: SCM_CREDENTIALS 0x02
   --  unsupported macro: SCM_SECURITY 0x03
   --  unsupported macro: AF_UNSPEC 0
   --  unsupported macro: AF_UNIX 1
   --  unsupported macro: AF_LOCAL 1
   --  unsupported macro: AF_INET 2
   --  unsupported macro: AF_AX25 3
   --  unsupported macro: AF_IPX 4
   --  unsupported macro: AF_APPLETALK 5
   --  unsupported macro: AF_NETROM 6
   --  unsupported macro: AF_BRIDGE 7
   --  unsupported macro: AF_ATMPVC 8
   --  unsupported macro: AF_X25 9
   --  unsupported macro: AF_INET6 10
   --  unsupported macro: AF_ROSE 11
   --  unsupported macro: AF_DECnet 12
   --  unsupported macro: AF_NETBEUI 13
   --  unsupported macro: AF_SECURITY 14
   --  unsupported macro: AF_KEY 15
   --  unsupported macro: AF_NETLINK 16
   --  unsupported macro: AF_ROUTE AF_NETLINK
   --  unsupported macro: AF_PACKET 17
   --  unsupported macro: AF_ASH 18
   --  unsupported macro: AF_ECONET 19
   --  unsupported macro: AF_ATMSVC 20
   --  unsupported macro: AF_RDS 21
   --  unsupported macro: AF_SNA 22
   --  unsupported macro: AF_IRDA 23
   --  unsupported macro: AF_PPPOX 24
   --  unsupported macro: AF_WANPIPE 25
   --  unsupported macro: AF_LLC 26
   --  unsupported macro: AF_IB 27
   --  unsupported macro: AF_CAN 29
   --  unsupported macro: AF_TIPC 30
   --  unsupported macro: AF_BLUETOOTH 31
   --  unsupported macro: AF_IUCV 32
   --  unsupported macro: AF_RXRPC 33
   --  unsupported macro: AF_ISDN 34
   --  unsupported macro: AF_PHONET 35
   --  unsupported macro: AF_IEEE802154 36
   --  unsupported macro: AF_CAIF 37
   --  unsupported macro: AF_ALG 38
   --  unsupported macro: AF_NFC 39
   --  unsupported macro: AF_VSOCK 40
   --  unsupported macro: AF_MAX 41
   --  unsupported macro: PF_UNSPEC AF_UNSPEC
   --  unsupported macro: PF_UNIX AF_UNIX
   --  unsupported macro: PF_LOCAL AF_LOCAL
   --  unsupported macro: PF_INET AF_INET
   --  unsupported macro: PF_AX25 AF_AX25
   --  unsupported macro: PF_IPX AF_IPX
   --  unsupported macro: PF_APPLETALK AF_APPLETALK
   --  unsupported macro: PF_NETROM AF_NETROM
   --  unsupported macro: PF_BRIDGE AF_BRIDGE
   --  unsupported macro: PF_ATMPVC AF_ATMPVC
   --  unsupported macro: PF_X25 AF_X25
   --  unsupported macro: PF_INET6 AF_INET6
   --  unsupported macro: PF_ROSE AF_ROSE
   --  unsupported macro: PF_DECnet AF_DECnet
   --  unsupported macro: PF_NETBEUI AF_NETBEUI
   --  unsupported macro: PF_SECURITY AF_SECURITY
   --  unsupported macro: PF_KEY AF_KEY
   --  unsupported macro: PF_NETLINK AF_NETLINK
   --  unsupported macro: PF_ROUTE AF_ROUTE
   --  unsupported macro: PF_PACKET AF_PACKET
   --  unsupported macro: PF_ASH AF_ASH
   --  unsupported macro: PF_ECONET AF_ECONET
   --  unsupported macro: PF_ATMSVC AF_ATMSVC
   --  unsupported macro: PF_RDS AF_RDS
   --  unsupported macro: PF_SNA AF_SNA
   --  unsupported macro: PF_IRDA AF_IRDA
   --  unsupported macro: PF_PPPOX AF_PPPOX
   --  unsupported macro: PF_WANPIPE AF_WANPIPE
   --  unsupported macro: PF_LLC AF_LLC
   --  unsupported macro: PF_IB AF_IB
   --  unsupported macro: PF_CAN AF_CAN
   --  unsupported macro: PF_TIPC AF_TIPC
   --  unsupported macro: PF_BLUETOOTH AF_BLUETOOTH
   --  unsupported macro: PF_IUCV AF_IUCV
   --  unsupported macro: PF_RXRPC AF_RXRPC
   --  unsupported macro: PF_ISDN AF_ISDN
   --  unsupported macro: PF_PHONET AF_PHONET
   --  unsupported macro: PF_IEEE802154 AF_IEEE802154
   --  unsupported macro: PF_CAIF AF_CAIF
   --  unsupported macro: PF_ALG AF_ALG
   --  unsupported macro: PF_NFC AF_NFC
   --  unsupported macro: PF_VSOCK AF_VSOCK
   --  unsupported macro: PF_MAX AF_MAX
   --  unsupported macro: SOMAXCONN 128
   --  unsupported macro: MSG_OOB 1
   --  unsupported macro: MSG_PEEK 2
   --  unsupported macro: MSG_DONTROUTE 4
   --  unsupported macro: MSG_TRYHARD 4
   --  unsupported macro: MSG_CTRUNC 8
   --  unsupported macro: MSG_PROBE 0x10
   --  unsupported macro: MSG_TRUNC 0x20
   --  unsupported macro: MSG_DONTWAIT 0x40
   --  unsupported macro: MSG_EOR 0x80
   --  unsupported macro: MSG_WAITALL 0x100
   --  unsupported macro: MSG_FIN 0x200
   --  unsupported macro: MSG_SYN 0x400
   --  unsupported macro: MSG_CONFIRM 0x800
   --  unsupported macro: MSG_RST 0x1000
   --  unsupported macro: MSG_ERRQUEUE 0x2000
   --  unsupported macro: MSG_NOSIGNAL 0x4000
   --  unsupported macro: MSG_MORE 0x8000
   --  unsupported macro: MSG_WAITFORONE 0x10000
   --  unsupported macro: MSG_SENDPAGE_NOTLAST 0x20000
   --  unsupported macro: MSG_EOF MSG_FIN
   --  unsupported macro: MSG_FASTOPEN 0x20000000
   --  unsupported macro: MSG_CMSG_CLOEXEC 0x40000000
   --  unsupported macro: MSG_CMSG_COMPAT 0x80000000
   --  unsupported macro: SOL_IP 0
   --  unsupported macro: SOL_TCP 6
   --  unsupported macro: SOL_UDP 17
   --  unsupported macro: SOL_IPV6 41
   --  unsupported macro: SOL_ICMPV6 58
   --  unsupported macro: SOL_SCTP 132
   --  unsupported macro: SOL_UDPLITE 136
   --  unsupported macro: SOL_RAW 255
   --  unsupported macro: SOL_IPX 256
   --  unsupported macro: SOL_AX25 257
   --  unsupported macro: SOL_ATALK 258
   --  unsupported macro: SOL_NETROM 259
   --  unsupported macro: SOL_ROSE 260
   --  unsupported macro: SOL_DECNET 261
   --  unsupported macro: SOL_X25 262
   --  unsupported macro: SOL_PACKET 263
   --  unsupported macro: SOL_ATM 264
   --  unsupported macro: SOL_AAL 265
   --  unsupported macro: SOL_IRDA 266
   --  unsupported macro: SOL_NETBEUI 267
   --  unsupported macro: SOL_LLC 268
   --  unsupported macro: SOL_DCCP 269
   --  unsupported macro: SOL_NETLINK 270
   --  unsupported macro: SOL_TIPC 271
   --  unsupported macro: SOL_RXRPC 272
   --  unsupported macro: SOL_PPPOL2TP 273
   --  unsupported macro: SOL_BLUETOOTH 274
   --  unsupported macro: SOL_PNPIPE 275
   --  unsupported macro: SOL_RDS 276
   --  unsupported macro: SOL_IUCV 277
   --  unsupported macro: SOL_CAIF 278
   --  unsupported macro: SOL_ALG 279
   --  unsupported macro: SOL_NFC 280
   --  unsupported macro: IPX_TYPE 1
  -- arch-dependent defines	 
  -- the SIOCxxx I/O controls	 
  -- iovec support		 
  -- pid_t			 
  -- __user			 
   procedure socket_seq_show (seq : access linux_seq_file_h.seq_file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:20
   pragma Import (CPP, socket_seq_show, "_Z15socket_seq_showP8seq_file");

   subtype sa_family_t is uapi_linux_socket_h.uu_kernel_sa_family_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:23

  -- *	1003.1g requires sa_family_t and that sa_data is char.
  --  

  -- address family, AF_xxx	 
   subtype sockaddr_sa_data_array is Interfaces.C.char_array (0 .. 13);
   type sockaddr is record
      sa_family : aliased sa_family_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:30
      sa_data : aliased sockaddr_sa_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:29

  -- 14 bytes of protocol address	 
  -- Linger active		 
   type linger is record
      l_onoff : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:35
      l_linger : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, linger);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:34

  -- How long to linger for	 
  -- *	As we do 4.4BSD message passing we use a 4.4BSD message passing
  -- *	system, not 4.3. Thus msg_accrights(len) are now missing. They
  -- *	belong in an obscure libc emulation or the bin.
  --  

  -- ptr to socket address structure  
   type msghdr is record
      msg_name : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:48
      msg_namelen : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:49
      msg_iov : access uapi_linux_uio_h.iovec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:50
      msg_iovlen : aliased uapi_asm_generic_posix_types_h.uu_kernel_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:51
      msg_control : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:52
      msg_controllen : aliased uapi_asm_generic_posix_types_h.uu_kernel_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:53
      msg_flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:54
   end record;
   pragma Convention (C_Pass_By_Copy, msghdr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:47

  -- size of socket address structure  
  -- scatter/gather array  
  -- # elements in msg_iov  
  -- ancillary data  
  -- ancillary data buffer length  
  -- flags on received message  
  -- For recvmmsg/sendmmsg  
   type mmsghdr is record
      msg_hdr : aliased msghdr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:59
      msg_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:60
   end record;
   pragma Convention (C_Pass_By_Copy, mmsghdr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:58

  -- *	POSIX 1003.1g - ancillary data object information
  -- *	Ancillary data consits of a sequence of pairs of
  -- *	(cmsghdr, cmsg_data[])
  --  

  -- data byte count, including hdr  
   type cmsghdr is record
      cmsg_len : aliased uapi_asm_generic_posix_types_h.uu_kernel_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:70
      cmsg_level : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:71
      cmsg_type : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:72
   end record;
   pragma Convention (C_Pass_By_Copy, cmsghdr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:69

  -- originating protocol  
  -- protocol-specific type  
  -- *	Ancillary data object information MACROS
  -- *	Table 5-14 of POSIX 1003.1g
  --  

  -- *	Get the next cmsg header
  -- *
  -- *	PLEASE, do not touch this function. If you think, that it is
  -- *	incorrect, grep kernel sources and think about consequences
  -- *	before trying to improve it.
  -- *
  -- *	Now it always returns valid, not truncated ancillary object
  -- *	HEADER. But caller still MUST check, that cmsg->cmsg_len is
  -- *	inside range, given by msg->msg_controllen before using
  -- *	ancillary object DATA.				--ANK (980731)
  --  

   --  skipped func __cmsg_nxthdr

   function cmsg_nxthdr (uu_msg : access msghdr; uu_cmsg : access cmsghdr) return access cmsghdr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:123
   pragma Import (CPP, cmsg_nxthdr, "_ZL11cmsg_nxthdrP6msghdrP7cmsghdr");

  -- "Socket"-level control message types:  
   type ucred is record
      pid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:135
      uid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:136
      gid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:137
   end record;
   pragma Convention (C_Pass_By_Copy, ucred);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:134

  -- Supported address families.  
  -- Protocol families, same as address families.  
  -- Maximum queue length specifiable by listen.   
  -- Flags we can use with send/ and recv. 
  --   Added those for 1003.1g not all are supported yet
  --  

  -- Setsockoptions(2) level. Thanks to BSD these must match IPPROTO_xxx  
  -- #define SOL_ICMP	1	No-no-no! Due to Linux :-) we cannot use SOL_ICMP=1  
  -- IPX options  
   function csum_partial_copy_fromiovecend
     (kdata : access unsigned_char;
      iov : access uapi_linux_uio_h.iovec;
      offset : int;
      len : unsigned;
      csump : access uapi_linux_types_h.uu_wsum) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:308
   pragma Import (CPP, csum_partial_copy_fromiovecend, "_Z30csum_partial_copy_fromiovecendPhP5iovecijPj");

   function iov_pages
     (iov : access constant uapi_linux_uio_h.iovec;
      offset : int;
      nr_segs : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:312
   pragma Import (CPP, iov_pages, "_Z9iov_pagesPK5iovecim");

   function verify_iovec
     (m : access msghdr;
      iov : access uapi_linux_uio_h.iovec;
      address : access uapi_linux_socket_h.uu_kernel_sockaddr_storage;
      mode : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:315
   pragma Import (CPP, verify_iovec, "_Z12verify_iovecP6msghdrP5iovecP25__kernel_sockaddr_storagei");

   function move_addr_to_kernel
     (uaddr : System.Address;
      ulen : int;
      kaddr : access uapi_linux_socket_h.uu_kernel_sockaddr_storage) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:316
   pragma Import (CPP, move_addr_to_kernel, "_Z19move_addr_to_kernelPviP25__kernel_sockaddr_storage");

   function put_cmsg
     (arg1 : access msghdr;
      level : int;
      c_type : int;
      len : int;
      data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/socket.h:317
   pragma Import (CPP, put_cmsg, "_Z8put_cmsgP6msghdriiiPv");

  -- The __sys_...msg variants allow MSG_CMSG_COMPAT  
   --  skipped func __sys_recvmsg

   --  skipped func __sys_sendmsg

   --  skipped func __sys_recvmmsg

   --  skipped func __sys_sendmmsg

end linux_socket_h;

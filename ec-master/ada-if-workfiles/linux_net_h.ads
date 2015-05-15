pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_wait_h;
limited with linux_fs_h;
with linux_types_h;
with uapi_linux_net_h;
with System;
limited with linux_socket_h;
with Interfaces.C.Strings;
limited with linux_mm_types_h;
limited with net_net_namespace_h;
limited with linux_uio_h;

package linux_net_h is

   --  unsupported macro: SOCK_ASYNC_NOSPACE 0
   --  unsupported macro: SOCK_ASYNC_WAITDATA 1
   --  unsupported macro: SOCK_NOSPACE 2
   --  unsupported macro: SOCK_PASSCRED 3
   --  unsupported macro: SOCK_PASSSEC 4
   --  unsupported macro: SOCK_EXTERNALLY_ALLOCATED 5
   --  unsupported macro: SOCK_MAX (SOCK_PACKET + 1)
   --  unsupported macro: SOCK_TYPE_MASK 0xf
   --  unsupported macro: SOCK_CLOEXEC O_CLOEXEC
   --  unsupported macro: SOCK_NONBLOCK O_NONBLOCK
   --  arg-macro: procedure DECLARE_SOCKADDR type dst := ({ __sockaddr_check_size(sizeof(*dst)); (type) src; })
   --    type dst := ({ __sockaddr_check_size(sizeof(*dst)); (type) src; })
   --  arg-macro: procedure sockfd_put fput(sock.file)
   --    fput(sock.file)
   --  unsupported macro: net_ratelimited_function(function,...) do { if (net_ratelimit()) function(__VA_ARGS__); } while (0)
   --  unsupported macro: net_emerg_ratelimited(fmt,...) net_ratelimited_function(pr_emerg, fmt, ##__VA_ARGS__)
   --  unsupported macro: net_alert_ratelimited(fmt,...) net_ratelimited_function(pr_alert, fmt, ##__VA_ARGS__)
   --  unsupported macro: net_crit_ratelimited(fmt,...) net_ratelimited_function(pr_crit, fmt, ##__VA_ARGS__)
   --  unsupported macro: net_err_ratelimited(fmt,...) net_ratelimited_function(pr_err, fmt, ##__VA_ARGS__)
   --  unsupported macro: net_notice_ratelimited(fmt,...) net_ratelimited_function(pr_notice, fmt, ##__VA_ARGS__)
   --  unsupported macro: net_warn_ratelimited(fmt,...) net_ratelimited_function(pr_warn, fmt, ##__VA_ARGS__)
   --  unsupported macro: net_info_ratelimited(fmt,...) net_ratelimited_function(pr_info, fmt, ##__VA_ARGS__)
   --  unsupported macro: net_dbg_ratelimited(fmt,...) net_ratelimited_function(pr_debug, fmt, ##__VA_ARGS__)
   --  arg-macro: function net_get_random_once ({ bool ___ret := false; static bool ___done := false; static struct static_key ___once_key := STATIC_KEY_INIT_TRUE; if (static_key_true(and___once_key)) ___ret := __net_get_random_once(buf, nbytes, and___done, and___once_key); ___ret; }
   --    return { bool ___ret := false; static bool ___done := false; static struct static_key ___once_key := STATIC_KEY_INIT_TRUE; if (static_key_true(and___once_key)) ___ret := __net_get_random_once(buf, nbytes, and___done, and___once_key); ___ret; };
   --  arg-macro: procedure MODULE_ALIAS_NETPROTO MODULE_ALIAS("net-pf-" __stringify(proto))
   --    MODULE_ALIAS("net-pf-" __stringify(proto))
   --  arg-macro: procedure MODULE_ALIAS_NET_PF_PROTO MODULE_ALIAS("net-pf-" __stringify(pf) "-proto-" __stringify(proto))
   --    MODULE_ALIAS("net-pf-" __stringify(pf) "-proto-" __stringify(proto))
   --  arg-macro: procedure MODULE_ALIAS_NET_PF_PROTO_TYPE MODULE_ALIAS("net-pf-" __stringify(pf) "-proto-" __stringify(proto) "-type-" __stringify(type))
   --    MODULE_ALIAS("net-pf-" __stringify(pf) "-proto-" __stringify(proto) "-type-" __stringify(type))
   --  arg-macro: procedure MODULE_ALIAS_NET_PF_PROTO_NAME MODULE_ALIAS("net-pf-" __stringify(pf) "-proto-" __stringify(proto) name)
   --    MODULE_ALIAS("net-pf-" __stringify(pf) "-proto-" __stringify(proto) name)
  -- * NET		An implementation of the SOCKET network access protocol.
  -- *		This is the master header file for the Linux NET layer,
  -- *		or, in plain English: the networking handling part of the
  -- *		kernel.
  -- *
  -- * Version:	@(#)net.h	1.0.3	05/25/93
  -- *
  -- * Authors:	Orest Zborowski, <obz@Kodak.COM>
  -- *		Ross Biro
  -- *		Fred N. van Kempen, <waltje@uWalt.NL.Mugnet.ORG>
  -- *
  -- *		This program is free software; you can redistribute it and/or
  -- *		modify it under the terms of the GNU General Public License
  -- *		as published by the Free Software Foundation; either version
  -- *		2 of the License, or (at your option) any later version.
  --  

  -- For O_CLOEXEC and O_NONBLOCK  
  --*
  -- * enum sock_type - Socket types
  -- * @SOCK_STREAM: stream (connection) socket
  -- * @SOCK_DGRAM: datagram (conn.less) socket
  -- * @SOCK_RAW: raw socket
  -- * @SOCK_RDM: reliably-delivered message
  -- * @SOCK_SEQPACKET: sequential packet socket
  -- * @SOCK_DCCP: Datagram Congestion Control Protocol socket
  -- * @SOCK_PACKET: linux specific way of getting packets at the dev level.
  -- *		  For writing rarp and other similar things on the user level.
  -- *
  -- * When adding some new socket type please
  -- * grep ARCH_HAS_SOCKET_TYPE include/asm-* /socket.h, at least MIPS
  -- * overrides this enum for binary compat reasons.
  --  

   subtype sock_type is unsigned;
   SOCK_STREAM : constant sock_type := 1;
   SOCK_DGRAM : constant sock_type := 2;
   SOCK_RAW : constant sock_type := 3;
   SOCK_RDM : constant sock_type := 4;
   SOCK_SEQPACKET : constant sock_type := 5;
   SOCK_DCCP : constant sock_type := 6;
   SOCK_PACKET : constant sock_type := 10;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:59

  -- Mask which covers at least up to SOCK_MASK-1.  The
  -- * remaining bits are used as flags.  

  -- Flags for socket, socketpair, accept4  
   type sock_shutdown_cmd is 
     (SHUT_RD,
      SHUT_WR,
      SHUT_RDWR);
   pragma Convention (C, sock_shutdown_cmd);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:82

  -- Note: wait MUST be first field of socket_wq  
   type socket_wq is record
      wait : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:90
      fasync_list : access linux_fs_h.fasync_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:91
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:92
   end record;
   pragma Convention (C_Pass_By_Copy, socket_wq);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:88

  --*
  -- *  struct socket - general BSD socket
  -- *  @state: socket state (%SS_CONNECTED, etc)
  -- *  @type: socket type (%SOCK_STREAM, etc)
  -- *  @flags: socket flags (%SOCK_ASYNC_NOSPACE, etc)
  -- *  @ops: protocol specific socket operations
  -- *  @file: File back pointer for gc
  -- *  @sk: internal networking protocol agnostic socket representation
  -- *  @wq: wait queue for several uses
  --  

   type proto_ops;
   type socket is record
      state : aliased uapi_linux_net_h.socket_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:106
      c_type : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:109
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:112
      wq : access socket_wq;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:114
      the_file : access linux_fs_h.file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:116
      sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:117
      ops : access constant proto_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:118
   end record;
   pragma Convention (C_Pass_By_Copy, socket);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:105

   type proto_ops is record
      family : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:129
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:130
      release : access function (arg1 : access socket) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:131
      bind : access function
           (arg1 : access socket;
            arg2 : access linux_socket_h.sockaddr;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:134
      connect : access function
           (arg1 : access socket;
            arg2 : access linux_socket_h.sockaddr;
            arg3 : int;
            arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:137
      socketpair : access function (arg1 : access socket; arg2 : access socket) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:139
      c_accept : access function
           (arg1 : access socket;
            arg2 : access socket;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:141
      getname : access function
           (arg1 : access socket;
            arg2 : access linux_socket_h.sockaddr;
            arg3 : access int;
            arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:144
      poll : access function
           (arg1 : access linux_fs_h.file;
            arg2 : access socket;
            arg3 : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:146
      ioctl : access function
           (arg1 : access socket;
            arg2 : unsigned;
            arg3 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:148
      compat_ioctl : access function
           (arg1 : access socket;
            arg2 : unsigned;
            arg3 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:151
      listen : access function (arg1 : access socket; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:153
      shutdown : access function (arg1 : access socket; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:154
      setsockopt : access function
           (arg1 : access socket;
            arg2 : int;
            arg3 : int;
            arg4 : Interfaces.C.Strings.chars_ptr;
            arg5 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:156
      getsockopt : access function
           (arg1 : access socket;
            arg2 : int;
            arg3 : int;
            arg4 : Interfaces.C.Strings.chars_ptr;
            arg5 : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:158
      compat_setsockopt : access function
           (arg1 : access socket;
            arg2 : int;
            arg3 : int;
            arg4 : Interfaces.C.Strings.chars_ptr;
            arg5 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:161
      compat_getsockopt : access function
           (arg1 : access socket;
            arg2 : int;
            arg3 : int;
            arg4 : Interfaces.C.Strings.chars_ptr;
            arg5 : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:163
      sendmsg : access function
           (arg1 : System.Address;
            arg2 : access socket;
            arg3 : access linux_socket_h.msghdr;
            arg4 : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:166
      recvmsg : access function
           (arg1 : System.Address;
            arg2 : access socket;
            arg3 : access linux_socket_h.msghdr;
            arg4 : linux_types_h.size_t;
            arg5 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:177
      mmap : access function
           (arg1 : access linux_fs_h.file;
            arg2 : access socket;
            arg3 : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:179
      sendpage : access function
           (arg1 : access socket;
            arg2 : access linux_mm_types_h.page;
            arg3 : int;
            arg4 : linux_types_h.size_t;
            arg5 : int) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:181
      splice_read : access function
           (arg1 : access socket;
            arg2 : access linux_types_h.loff_t;
            arg3 : System.Address;
            arg4 : linux_types_h.size_t;
            arg5 : unsigned) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:183
      set_peek_off : access function (arg1 : System.Address; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:184
   end record;
   pragma Convention (C_Pass_By_Copy, proto_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:128

  -- Notes for implementing recvmsg:
  --	 * ===============================
  --	 * msg->msg_namelen should get updated by the recvmsg handlers
  --	 * iff msg_name != NULL. It is by default 0 to prevent
  --	 * returning uninitialized memory to user space.  The recvfrom
  --	 * handlers can assume that msg.msg_name is either NULL or has
  --	 * a minimum size of sizeof(struct sockaddr_storage).
  --	  

   type net_proto_family is record
      family : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:191
      create : access function
           (arg1 : access net_net_namespace_h.net;
            arg2 : access socket;
            arg3 : int;
            arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:193
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:194
   end record;
   pragma Convention (C_Pass_By_Copy, net_proto_family);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:190

   function sock_wake_async
     (sk : access socket;
      how : int;
      band : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:207
   pragma Import (CPP, sock_wake_async, "_Z15sock_wake_asyncP6socketii");

   function sock_register (fam : access constant net_proto_family) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:208
   pragma Import (CPP, sock_register, "_Z13sock_registerPK16net_proto_family");

   procedure sock_unregister (family : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:209
   pragma Import (CPP, sock_unregister, "_Z15sock_unregisteri");

   --  skipped func __sock_create

   function sock_create
     (family : int;
      c_type : int;
      proto : int;
      res : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:212
   pragma Import (CPP, sock_create, "_Z11sock_createiiiPP6socket");

   function sock_create_kern
     (family : int;
      c_type : int;
      proto : int;
      res : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:213
   pragma Import (CPP, sock_create_kern, "_Z16sock_create_kerniiiPP6socket");

   function sock_create_lite
     (family : int;
      c_type : int;
      proto : int;
      res : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:214
   pragma Import (CPP, sock_create_lite, "_Z16sock_create_liteiiiPP6socket");

   procedure sock_release (sock : access socket);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:215
   pragma Import (CPP, sock_release, "_Z12sock_releaseP6socket");

   function sock_sendmsg
     (sock : access socket;
      msg : access linux_socket_h.msghdr;
      len : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:216
   pragma Import (CPP, sock_sendmsg, "_Z12sock_sendmsgP6socketP6msghdrm");

   function sock_recvmsg
     (sock : access socket;
      msg : access linux_socket_h.msghdr;
      size : linux_types_h.size_t;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:217
   pragma Import (CPP, sock_recvmsg, "_Z12sock_recvmsgP6socketP6msghdrmi");

   function sock_alloc_file
     (sock : access socket;
      flags : int;
      dname : Interfaces.C.Strings.chars_ptr) return access linux_fs_h.file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:219
   pragma Import (CPP, sock_alloc_file, "_Z15sock_alloc_fileP6socketiPKc");

   function sockfd_lookup (fd : int; err : access int) return access socket;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:220
   pragma Import (CPP, sockfd_lookup, "_Z13sockfd_lookupiPi");

   function sock_from_file (the_file : access linux_fs_h.file; err : access int) return access socket;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:221
   pragma Import (CPP, sock_from_file, "_Z14sock_from_fileP4filePi");

   function net_ratelimit return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:223
   pragma Import (CPP, net_ratelimit, "_Z13net_ratelimitv");

   --  skipped func __net_get_random_once

   function kernel_sendmsg
     (sock : access socket;
      msg : access linux_socket_h.msghdr;
      vec : access linux_uio_h.kvec;
      num : linux_types_h.size_t;
      len : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:265
   pragma Import (CPP, kernel_sendmsg, "_Z14kernel_sendmsgP6socketP6msghdrP4kvecmm");

   function kernel_recvmsg
     (sock : access socket;
      msg : access linux_socket_h.msghdr;
      vec : access linux_uio_h.kvec;
      num : linux_types_h.size_t;
      len : linux_types_h.size_t;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:267
   pragma Import (CPP, kernel_recvmsg, "_Z14kernel_recvmsgP6socketP6msghdrP4kvecmmi");

   function kernel_bind
     (sock : access socket;
      addr : access linux_socket_h.sockaddr;
      addrlen : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:270
   pragma Import (CPP, kernel_bind, "_Z11kernel_bindP6socketP8sockaddri");

   function kernel_listen (sock : access socket; backlog : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:271
   pragma Import (CPP, kernel_listen, "_Z13kernel_listenP6socketi");

   function kernel_accept
     (sock : access socket;
      newsock : System.Address;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:272
   pragma Import (CPP, kernel_accept, "_Z13kernel_acceptP6socketPS0_i");

   function kernel_connect
     (sock : access socket;
      addr : access linux_socket_h.sockaddr;
      addrlen : int;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:273
   pragma Import (CPP, kernel_connect, "_Z14kernel_connectP6socketP8sockaddrii");

   function kernel_getsockname
     (sock : access socket;
      addr : access linux_socket_h.sockaddr;
      addrlen : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:275
   pragma Import (CPP, kernel_getsockname, "_Z18kernel_getsocknameP6socketP8sockaddrPi");

   function kernel_getpeername
     (sock : access socket;
      addr : access linux_socket_h.sockaddr;
      addrlen : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:277
   pragma Import (CPP, kernel_getpeername, "_Z18kernel_getpeernameP6socketP8sockaddrPi");

   function kernel_getsockopt
     (sock : access socket;
      level : int;
      optname : int;
      optval : Interfaces.C.Strings.chars_ptr;
      optlen : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:279
   pragma Import (CPP, kernel_getsockopt, "_Z17kernel_getsockoptP6socketiiPcPi");

   function kernel_setsockopt
     (sock : access socket;
      level : int;
      optname : int;
      optval : Interfaces.C.Strings.chars_ptr;
      optlen : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:281
   pragma Import (CPP, kernel_setsockopt, "_Z17kernel_setsockoptP6socketiiPcj");

   function kernel_sendpage
     (sock : access socket;
      the_page : access linux_mm_types_h.page;
      offset : int;
      size : linux_types_h.size_t;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:283
   pragma Import (CPP, kernel_sendpage, "_Z15kernel_sendpageP6socketP4pageimi");

   function kernel_sock_ioctl
     (sock : access socket;
      cmd : int;
      arg : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:285
   pragma Import (CPP, kernel_sock_ioctl, "_Z17kernel_sock_ioctlP6socketim");

   function kernel_sock_shutdown (sock : access socket; how : sock_shutdown_cmd) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/net.h:286
   pragma Import (CPP, kernel_sock_shutdown, "_Z20kernel_sock_shutdownP6socket17sock_shutdown_cmd");

end linux_net_h;

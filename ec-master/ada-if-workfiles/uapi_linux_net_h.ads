pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uapi_linux_net_h is

   --  unsupported macro: NPROTO AF_MAX
   --  unsupported macro: SYS_SOCKET 1
   --  unsupported macro: SYS_BIND 2
   --  unsupported macro: SYS_CONNECT 3
   --  unsupported macro: SYS_LISTEN 4
   --  unsupported macro: SYS_ACCEPT 5
   --  unsupported macro: SYS_GETSOCKNAME 6
   --  unsupported macro: SYS_GETPEERNAME 7
   --  unsupported macro: SYS_SOCKETPAIR 8
   --  unsupported macro: SYS_SEND 9
   --  unsupported macro: SYS_RECV 10
   --  unsupported macro: SYS_SENDTO 11
   --  unsupported macro: SYS_RECVFROM 12
   --  unsupported macro: SYS_SHUTDOWN 13
   --  unsupported macro: SYS_SETSOCKOPT 14
   --  unsupported macro: SYS_GETSOCKOPT 15
   --  unsupported macro: SYS_SENDMSG 16
   --  unsupported macro: SYS_RECVMSG 17
   --  unsupported macro: SYS_ACCEPT4 18
   --  unsupported macro: SYS_RECVMMSG 19
   --  unsupported macro: SYS_SENDMMSG 20
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

  -- not allocated		 
  -- unconnected to any socket	 
  -- in process of connecting	 
  -- connected to socket		 
  -- in process of disconnecting	 
   type socket_state is 
     (SS_FREE,
      SS_UNCONNECTED,
      SS_CONNECTING,
      SS_CONNECTED,
      SS_DISCONNECTING);
   pragma Convention (C, socket_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/net.h:53

end uapi_linux_net_h;

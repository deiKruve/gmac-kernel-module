pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with uapi_linux_hdlc_ioctl_h;
with linux_socket_h;
with System;
with Interfaces.C.Strings;

package uapi_linux_if_h is

   --  unsupported macro: IFNAMSIZ 16
   --  unsupported macro: IFALIASZ 256
   --  unsupported macro: IFF_UP IFF_UP
   --  unsupported macro: IFF_BROADCAST IFF_BROADCAST
   --  unsupported macro: IFF_DEBUG IFF_DEBUG
   --  unsupported macro: IFF_LOOPBACK IFF_LOOPBACK
   --  unsupported macro: IFF_POINTOPOINT IFF_POINTOPOINT
   --  unsupported macro: IFF_NOTRAILERS IFF_NOTRAILERS
   --  unsupported macro: IFF_RUNNING IFF_RUNNING
   --  unsupported macro: IFF_NOARP IFF_NOARP
   --  unsupported macro: IFF_PROMISC IFF_PROMISC
   --  unsupported macro: IFF_ALLMULTI IFF_ALLMULTI
   --  unsupported macro: IFF_MASTER IFF_MASTER
   --  unsupported macro: IFF_SLAVE IFF_SLAVE
   --  unsupported macro: IFF_MULTICAST IFF_MULTICAST
   --  unsupported macro: IFF_PORTSEL IFF_PORTSEL
   --  unsupported macro: IFF_AUTOMEDIA IFF_AUTOMEDIA
   --  unsupported macro: IFF_DYNAMIC IFF_DYNAMIC
   --  unsupported macro: IFF_LOWER_UP IFF_LOWER_UP
   --  unsupported macro: IFF_DORMANT IFF_DORMANT
   --  unsupported macro: IFF_ECHO IFF_ECHO
   --  unsupported macro: IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO| IFF_MASTER|IFF_SLAVE|IFF_RUNNING|IFF_LOWER_UP|IFF_DORMANT)
   --  unsupported macro: IF_GET_IFACE 0x0001
   --  unsupported macro: IF_GET_PROTO 0x0002
   --  unsupported macro: IF_IFACE_V35 0x1000
   --  unsupported macro: IF_IFACE_V24 0x1001
   --  unsupported macro: IF_IFACE_X21 0x1002
   --  unsupported macro: IF_IFACE_T1 0x1003
   --  unsupported macro: IF_IFACE_E1 0x1004
   --  unsupported macro: IF_IFACE_SYNC_SERIAL 0x1005
   --  unsupported macro: IF_IFACE_X21D 0x1006
   --  unsupported macro: IF_PROTO_HDLC 0x2000
   --  unsupported macro: IF_PROTO_PPP 0x2001
   --  unsupported macro: IF_PROTO_CISCO 0x2002
   --  unsupported macro: IF_PROTO_FR 0x2003
   --  unsupported macro: IF_PROTO_FR_ADD_PVC 0x2004
   --  unsupported macro: IF_PROTO_FR_DEL_PVC 0x2005
   --  unsupported macro: IF_PROTO_X25 0x2006
   --  unsupported macro: IF_PROTO_HDLC_ETH 0x2007
   --  unsupported macro: IF_PROTO_FR_ADD_ETH_PVC 0x2008
   --  unsupported macro: IF_PROTO_FR_DEL_ETH_PVC 0x2009
   --  unsupported macro: IF_PROTO_FR_PVC 0x200A
   --  unsupported macro: IF_PROTO_FR_ETH_PVC 0x200B
   --  unsupported macro: IF_PROTO_RAW 0x200C
   --  unsupported macro: IFHWADDRLEN 6
   --  unsupported macro: ifr_name ifr_ifrn.ifrn_name
   --  unsupported macro: ifr_hwaddr ifr_ifru.ifru_hwaddr
   --  unsupported macro: ifr_addr ifr_ifru.ifru_addr
   --  unsupported macro: ifr_dstaddr ifr_ifru.ifru_dstaddr
   --  unsupported macro: ifr_broadaddr ifr_ifru.ifru_broadaddr
   --  unsupported macro: ifr_netmask ifr_ifru.ifru_netmask
   --  unsupported macro: ifr_flags ifr_ifru.ifru_flags
   --  unsupported macro: ifr_metric ifr_ifru.ifru_ivalue
   --  unsupported macro: ifr_mtu ifr_ifru.ifru_mtu
   --  unsupported macro: ifr_map ifr_ifru.ifru_map
   --  unsupported macro: ifr_slave ifr_ifru.ifru_slave
   --  unsupported macro: ifr_data ifr_ifru.ifru_data
   --  unsupported macro: ifr_ifindex ifr_ifru.ifru_ivalue
   --  unsupported macro: ifr_bandwidth ifr_ifru.ifru_ivalue
   --  unsupported macro: ifr_qlen ifr_ifru.ifru_ivalue
   --  unsupported macro: ifr_newname ifr_ifru.ifru_newname
   --  unsupported macro: ifr_settings ifr_ifru.ifru_settings
   --  unsupported macro: ifc_buf ifc_ifcu.ifcu_buf
   --  unsupported macro: ifc_req ifc_ifcu.ifcu_req
  -- * INET		An implementation of the TCP/IP protocol suite for the LINUX
  -- *		operating system.  INET is implemented using the  BSD Socket
  -- *		interface as the means of communication with the user level.
  -- *
  -- *		Global definitions for the INET interface module.
  -- *
  -- * Version:	@(#)if.h	1.0.2	04/18/93
  -- *
  -- * Authors:	Original taken from Berkeley UNIX 4.3, (c) UCB 1982-1988
  -- *		Ross Biro
  -- *		Fred N. van Kempen, <waltje@uWalt.NL.Mugnet.ORG>
  -- *
  -- *		This program is free software; you can redistribute it and/or
  -- *		modify it under the terms of the GNU General Public License
  -- *		as published by the Free Software Foundation; either version
  -- *		2 of the License, or (at your option) any later version.
  --  

  -- for "__kernel_caddr_t" et al	 
  -- for "struct sockaddr" et al	 
  -- for "__user" et al            
  --*
  -- * enum net_device_flags - &struct net_device flags
  -- *
  -- * These are the &struct net_device flags, they can be set by drivers, the
  -- * kernel and some can be triggered by userspace. Userspace can query and
  -- * set these flags using userspace utilities but there is also a sysfs
  -- * entry available for all dev flags which can be queried and set. These flags
  -- * are shared for all types of net_devices. The sysfs entries are available
  -- * via /sys/class/net/<dev>/flags. Flags which can be toggled through sysfs
  -- * are annotated below, note that only a few flags can be toggled and some
  -- * other flags are always always preserved from the original net_device flags
  -- * even if you try to set them via sysfs. Flags which are always preserved
  -- * are kept under the flag grouping @IFF_VOLATILE. Flags which are volatile
  -- * are annotated below as such.
  -- *
  -- * You should have a pretty good reason to be extending these flags.
  -- *
  -- * @IFF_UP: interface is up. Can be toggled through sysfs.
  -- * @IFF_BROADCAST: broadcast address valid. Volatile.
  -- * @IFF_DEBUG: turn on debugging. Can be toggled through sysfs.
  -- * @IFF_LOOPBACK: is a loopback net. Volatile.
  -- * @IFF_POINTOPOINT: interface is has p-p link. Volatile.
  -- * @IFF_NOTRAILERS: avoid use of trailers. Can be toggled through sysfs.
  -- *	Volatile.
  -- * @IFF_RUNNING: interface RFC2863 OPER_UP. Volatile.
  -- * @IFF_NOARP: no ARP protocol. Can be toggled through sysfs. Volatile.
  -- * @IFF_PROMISC: receive all packets. Can be toggled through sysfs.
  -- * @IFF_ALLMULTI: receive all multicast packets. Can be toggled through
  -- *	sysfs.
  -- * @IFF_MASTER: master of a load balancer. Volatile.
  -- * @IFF_SLAVE: slave of a load balancer. Volatile.
  -- * @IFF_MULTICAST: Supports multicast. Can be toggled through sysfs.
  -- * @IFF_PORTSEL: can set media type. Can be toggled through sysfs.
  -- * @IFF_AUTOMEDIA: auto media select active. Can be toggled through sysfs.
  -- * @IFF_DYNAMIC: dialup device with changing addresses. Can be toggled
  -- *	through sysfs.
  -- * @IFF_LOWER_UP: driver signals L1 up. Volatile.
  -- * @IFF_DORMANT: driver signals dormant. Volatile.
  -- * @IFF_ECHO: echo sent packets. Volatile.
  --  

   subtype net_device_flags is unsigned;
   IFF_UP : constant net_device_flags := 1;
   IFF_BROADCAST : constant net_device_flags := 2;
   IFF_DEBUG : constant net_device_flags := 4;
   IFF_LOOPBACK : constant net_device_flags := 8;
   IFF_POINTOPOINT : constant net_device_flags := 16;
   IFF_NOTRAILERS : constant net_device_flags := 32;
   IFF_RUNNING : constant net_device_flags := 64;
   IFF_NOARP : constant net_device_flags := 128;
   IFF_PROMISC : constant net_device_flags := 256;
   IFF_ALLMULTI : constant net_device_flags := 512;
   IFF_MASTER : constant net_device_flags := 1024;
   IFF_SLAVE : constant net_device_flags := 2048;
   IFF_MULTICAST : constant net_device_flags := 4096;
   IFF_PORTSEL : constant net_device_flags := 8192;
   IFF_AUTOMEDIA : constant net_device_flags := 16384;
   IFF_DYNAMIC : constant net_device_flags := 32768;
   IFF_LOWER_UP : constant net_device_flags := 65536;
   IFF_DORMANT : constant net_device_flags := 131072;
   IFF_ECHO : constant net_device_flags := 262144;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:70

  -- sysfs  
  -- volatile  
  -- sysfs  
  -- volatile  
  -- volatile  
  -- sysfs  
  -- volatile  
  -- sysfs  
  -- sysfs  
  -- sysfs  
  -- volatile  
  -- volatile  
  -- sysfs  
  -- sysfs  
  -- sysfs  
  -- sysfs  
  -- volatile  
  -- volatile  
  -- volatile  
  -- For definitions see hdlc.h  
  -- For definitions see hdlc.h  
  -- RFC 2863 operational status  
  -- link modes  
  -- limit upward transition to dormant  
  -- *	Device mapping structure. I'd just gone off and designed a 
  -- *	beautiful scheme using only loadable modules with arguments
  -- *	for driver options and along come the PCMCIA people 8)
  -- *
  -- *	Ah well. The get() side of this is good for WDSETUP, and it'll
  -- *	be handy for debugging things. The set side is fine for now and
  -- *	being very small might be worth keeping for clean configuration.
  --  

   type ifmap is record
      mem_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:170
      mem_end : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:171
      base_addr : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:172
      irq : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:173
      dma : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:174
      port : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:175
   end record;
   pragma Convention (C_Pass_By_Copy, ifmap);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:169

  -- 3 bytes spare  
  -- Type of physical device or protocol  
   type anon_176 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            raw_hdlc : access uapi_linux_hdlc_ioctl_h.raw_hdlc_proto;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:184
         when 1 =>
            cisco : access uapi_linux_hdlc_ioctl_h.cisco_proto;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:185
         when 2 =>
            fr : access uapi_linux_hdlc_ioctl_h.fr_proto;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:186
         when 3 =>
            fr_pvc : access uapi_linux_hdlc_ioctl_h.fr_proto_pvc;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:187
         when 4 =>
            fr_pvc_info : access uapi_linux_hdlc_ioctl_h.fr_proto_pvc_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:188
         when 5 =>
            sync : access uapi_linux_hdlc_ioctl_h.sync_serial_settings;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:191
         when others =>
            te1 : access uapi_linux_hdlc_ioctl_h.te1_settings;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:192
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_176);
   pragma Unchecked_Union (anon_176);
   type if_settings is record
      c_type : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:180
      size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:181
      ifs_ifsu : anon_176;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:193
   end record;
   pragma Convention (C_Pass_By_Copy, if_settings);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:179

  -- Size of the data allocated by the caller  
  -- {atm/eth/dsl}_settings anyone ?  
  -- interface settings  
  -- * Interface request structure used for socket
  -- * ioctl's.  All interface ioctl's must have parameter
  -- * definitions which begin with ifr_name.  The
  -- * remainder may be interface specific.
  --  

  -- if name, e.g. "en0"  
   subtype ifreq_ifrn_name_array is Interfaces.C.char_array (0 .. 15);
   type anon_177 (discr : unsigned := 0) is record
      case discr is
         when others =>
            ifrn_name : aliased ifreq_ifrn_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:207
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_177);
   pragma Unchecked_Union (anon_177);
   subtype ifreq_ifru_slave_array is Interfaces.C.char_array (0 .. 15);
   subtype ifreq_ifru_newname_array is Interfaces.C.char_array (0 .. 15);
   type anon_178 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ifru_addr : aliased linux_socket_h.sockaddr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:211
         when 1 =>
            ifru_dstaddr : aliased linux_socket_h.sockaddr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:212
         when 2 =>
            ifru_broadaddr : aliased linux_socket_h.sockaddr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:213
         when 3 =>
            ifru_netmask : aliased linux_socket_h.sockaddr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:214
         when 4 =>
            ifru_hwaddr : aliased linux_socket_h.sockaddr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:215
         when 5 =>
            ifru_flags : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:216
         when 6 =>
            ifru_ivalue : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:217
         when 7 =>
            ifru_mtu : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:218
         when 8 =>
            ifru_map : aliased ifmap;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:219
         when 9 =>
            ifru_slave : aliased ifreq_ifru_slave_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:220
         when 10 =>
            ifru_newname : aliased ifreq_ifru_newname_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:221
         when 11 =>
            ifru_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:222
         when others =>
            ifru_settings : aliased if_settings;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:223
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_178);
   pragma Unchecked_Union (anon_178);
   type ifreq is record
      ifr_ifrn : anon_177;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:208
      ifr_ifru : anon_178;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:224
   end record;
   pragma Convention (C_Pass_By_Copy, ifreq);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:203

  -- Just fits the size  
  -- * Structure used in SIOCGIFCONF request.
  -- * Used to retrieve interface configuration
  -- * for machine (useful for programs which
  -- * must know all networks accessible).
  --  

  -- size of buffer	 
   type anon_179 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ifcu_buf : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:255
         when others =>
            ifcu_req : access ifreq;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:256
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_179);
   pragma Unchecked_Union (anon_179);
   type ifconf is record
      ifc_len : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:253
      ifc_ifcu : anon_179;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:257
   end record;
   pragma Convention (C_Pass_By_Copy, ifconf);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if.h:252

end uapi_linux_if_h;

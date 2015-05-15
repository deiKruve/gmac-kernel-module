pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;
with uapi_linux_types_h;

package uapi_linux_if_link_h is

   --  unsupported macro: IFLA_COST IFLA_COST
   --  unsupported macro: IFLA_PRIORITY IFLA_PRIORITY
   --  unsupported macro: IFLA_MASTER IFLA_MASTER
   --  unsupported macro: IFLA_WIRELESS IFLA_WIRELESS
   --  unsupported macro: IFLA_PROTINFO IFLA_PROTINFO
   --  unsupported macro: IFLA_TXQLEN IFLA_TXQLEN
   --  unsupported macro: IFLA_MAP IFLA_MAP
   --  unsupported macro: IFLA_WEIGHT IFLA_WEIGHT
   --  unsupported macro: IFLA_LINKINFO IFLA_LINKINFO
   --  unsupported macro: IFLA_PROMISCUITY IFLA_PROMISCUITY
   --  unsupported macro: IFLA_MAX (__IFLA_MAX - 1)
   --  unsupported macro: IFLA_INET_MAX (__IFLA_INET_MAX - 1)
   --  unsupported macro: IFLA_INET6_MAX (__IFLA_INET6_MAX - 1)
   --  unsupported macro: IFLA_BRPORT_MAX (__IFLA_BRPORT_MAX - 1)
   --  unsupported macro: IFLA_INFO_MAX (__IFLA_INFO_MAX - 1)
   --  unsupported macro: IFLA_VLAN_MAX (__IFLA_VLAN_MAX - 1)
   --  unsupported macro: IFLA_VLAN_QOS_MAX (__IFLA_VLAN_QOS_MAX - 1)
   --  unsupported macro: IFLA_MACVLAN_MAX (__IFLA_MACVLAN_MAX - 1)
   --  unsupported macro: MACVLAN_FLAG_NOPROMISC 1
   --  unsupported macro: IFLA_VXLAN_MAX (__IFLA_VXLAN_MAX - 1)
   --  unsupported macro: IFLA_BOND_MAX (__IFLA_BOND_MAX - 1)
   --  unsupported macro: IFLA_BOND_AD_INFO_MAX (__IFLA_BOND_AD_INFO_MAX - 1)
   --  unsupported macro: IFLA_BOND_SLAVE_MAX (__IFLA_BOND_SLAVE_MAX - 1)
   --  unsupported macro: IFLA_VF_INFO_MAX (__IFLA_VF_INFO_MAX - 1)
   --  unsupported macro: IFLA_VF_MAX (__IFLA_VF_MAX - 1)
   --  unsupported macro: IFLA_VF_PORT_MAX (__IFLA_VF_PORT_MAX - 1)
   --  unsupported macro: IFLA_PORT_MAX (__IFLA_PORT_MAX - 1)
   --  unsupported macro: PORT_PROFILE_MAX 40
   --  unsupported macro: PORT_UUID_MAX 16
   --  unsupported macro: PORT_SELF_VF -1
   --  unsupported macro: IFLA_IPOIB_MAX (__IFLA_IPOIB_MAX - 1)
   --  unsupported macro: IFLA_HSR_MAX (__IFLA_HSR_MAX - 1)
  -- This struct should be in sync with struct rtnl_link_stats64  
  -- total packets received	 
   type rtnl_link_stats is record
      rx_packets : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:9
      tx_packets : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:10
      rx_bytes : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:11
      tx_bytes : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:12
      rx_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:13
      tx_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:14
      rx_dropped : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:15
      tx_dropped : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:16
      multicast : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:17
      collisions : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:18
      rx_length_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:21
      rx_over_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:22
      rx_crc_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:23
      rx_frame_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:24
      rx_fifo_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:25
      rx_missed_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:26
      tx_aborted_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:29
      tx_carrier_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:30
      tx_fifo_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:31
      tx_heartbeat_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:32
      tx_window_errors : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:33
      rx_compressed : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:36
      tx_compressed : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, rtnl_link_stats);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:8

  -- total packets transmitted	 
  -- total bytes received 	 
  -- total bytes transmitted	 
  -- bad packets received		 
  -- packet transmit problems	 
  -- no space in linux buffers	 
  -- no space available in linux	 
  -- multicast packets received	 
  -- detailed rx_errors:  
  -- receiver ring buff overflow	 
  -- recved pkt with crc error	 
  -- recv'd frame alignment error  
  -- recv'r fifo overrun		 
  -- receiver missed packet	 
  -- detailed tx_errors  
  -- for cslip etc  
  -- The main device statistics structure  
  -- total packets received	 
   type rtnl_link_stats64 is record
      rx_packets : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:42
      tx_packets : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:43
      rx_bytes : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:44
      tx_bytes : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:45
      rx_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:46
      tx_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:47
      rx_dropped : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:48
      tx_dropped : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:49
      multicast : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:50
      collisions : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:51
      rx_length_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:54
      rx_over_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:55
      rx_crc_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:56
      rx_frame_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:57
      rx_fifo_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:58
      rx_missed_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:59
      tx_aborted_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:62
      tx_carrier_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:63
      tx_fifo_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:64
      tx_heartbeat_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:65
      tx_window_errors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:66
      rx_compressed : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:69
      tx_compressed : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:70
   end record;
   pragma Convention (C_Pass_By_Copy, rtnl_link_stats64);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:41

  -- total packets transmitted	 
  -- total bytes received 	 
  -- total bytes transmitted	 
  -- bad packets received		 
  -- packet transmit problems	 
  -- no space in linux buffers	 
  -- no space available in linux	 
  -- multicast packets received	 
  -- detailed rx_errors:  
  -- receiver ring buff overflow	 
  -- recved pkt with crc error	 
  -- recv'd frame alignment error  
  -- recv'r fifo overrun		 
  -- receiver missed packet	 
  -- detailed tx_errors  
  -- for cslip etc  
  -- The struct should be in sync with struct ifmap  
   type rtnl_link_ifmap is record
      mem_start : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:75
      mem_end : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:76
      base_addr : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:77
      irq : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:78
      dma : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:79
      port : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:80
   end record;
   pragma Convention (C_Pass_By_Copy, rtnl_link_ifmap);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:74

  -- * IFLA_AF_SPEC
  -- *   Contains nested attributes for address family specific attributes.
  -- *   Each address family may create a attribute with the address family
  -- *   number as type and create its own attribute structure in it.
  -- *
  -- *   Example:
  -- *   [IFLA_AF_SPEC] = {
  -- *       [AF_INET] = {
  -- *           [IFLA_INET_CONF] = ...,
  -- *       },
  -- *       [AF_INET6] = {
  -- *           [IFLA_INET6_FLAGS] = ...,
  -- *           [IFLA_INET6_CONF] = ...,
  -- *       }
  -- *   }
  --  

  -- Wireless Extension event - see wireless.h  
  -- Protocol specific information for a link  
  -- Number of VFs if device is SR-IOV PF  
  -- Group the device belongs to  
  -- Extended info mask, VFs, etc  
  -- Promiscuity count: > 0 means acts PROMISC  
  -- backwards compatibility for userspace  
  -- ifi_flags.
  --   IFF_* flags.
  --   The only change is:
  --   IFF_LOOPBACK, IFF_BROADCAST and IFF_POINTOPOINT are
  --   more not changeable by user. They describe link media
  --   characteristics and set by device driver.
  --   Comments:
  --   - Combination IFF_BROADCAST|IFF_POINTOPOINT is invalid
  --   - If neither of these three flags are set;
  --     the interface is NBMA.
  --   - IFF_MULTICAST does not mean anything special:
  --   multicasts can be used on all not-NBMA links.
  --   IFF_MULTICAST means that this media uses special encapsulation
  --   for multicast frames. Apparently, all IFF_POINTOPOINT and
  --   IFF_BROADCAST devices are able to use multicasts too.
  --  

  -- IFLA_LINK.
  --   For usual devices it is equal ifi_index.
  --   If it is a "virtual interface" (f.e. tunnel), ifi_link
  --   can point to real physical interface (f.e. for bandwidth calculations),
  --   or maybe 0, what means, that real media is unknown (usual
  --   for IPIP tunnels, when route to endpoint is allowed to change)
  --  

  -- Subtype attributes for IFLA_PROTINFO  
  -- link flags			 
  -- sysctl parameters		 
  -- statistics			 
  -- MC things. What of them?	 
  -- time values and max reasm size  
  -- statistics (icmpv6)		 
  -- device token			 
  -- Spanning tree state      
  -- "             priority   
  -- "             cost       
  -- mode (hairpin)           
  -- bpdu guard               
  -- root port protection     
  -- multicast fast leave     
  -- mac learning  
  -- flood unicast traffic  
   type ifla_cacheinfo is record
      max_reasm_len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:233
      tstamp : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:234
      reachable_time : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:235
      retrans_time : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:236
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_cacheinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:232

  -- ipv6InterfaceTable updated timestamp  
  -- VLAN section  
   type ifla_vlan_flags is record
      flags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:266
      mask : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:267
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_vlan_flags);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:265

   type ifla_vlan_qos_mapping is record
      from : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:279
      to : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:280
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_vlan_qos_mapping);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:278

  -- MACVLAN section  
   subtype macvlan_mode is unsigned;
   MACVLAN_MODE_PRIVATE : constant macvlan_mode := 1;
   MACVLAN_MODE_VEPA : constant macvlan_mode := 2;
   MACVLAN_MODE_BRIDGE : constant macvlan_mode := 4;
   MACVLAN_MODE_PASSTHRU : constant macvlan_mode := 8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:293

  -- don't talk to other macvlans  
  -- talk to other ports through ext bridge  
  -- talk to bridge ports directly  
  -- take over the underlying device  
  -- VXLAN section  
  -- group or remote address  
  -- source port  
  -- destination port  
   type ifla_vxlan_port_range is record
      low : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:330
      high : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:331
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_vxlan_port_range);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:329

  -- Bonding section  
  -- SR-IOV virtual function management section  
  -- Hardware queue specific attributes  
  -- Max TX Bandwidth Allocation  
  -- Spoof Checking on/off switch  
  -- link state enable/disable/auto switch  
  -- Min and Max TX Bandwidth Allocation  
   type ifla_vf_mac_mac_array is array (0 .. 31) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ifla_vf_mac is record
      vf : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:415
      mac : aliased ifla_vf_mac_mac_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:416
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_vf_mac);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:414

  -- MAX_ADDR_LEN  
   type ifla_vf_vlan is record
      vf : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:420
      vlan : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:421
      qos : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:422
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_vf_vlan);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:419

  -- 0 - 4095, 0 disables VLAN filter  
   type ifla_vf_tx_rate is record
      vf : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:426
      rate : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:427
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_vf_tx_rate);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:425

  -- Max TX bandwidth in Mbps, 0 disables throttling  
   type ifla_vf_rate is record
      vf : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:431
      min_tx_rate : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:432
      max_tx_rate : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:433
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_vf_rate);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:430

  -- Min Bandwidth in Mbps  
  -- Max Bandwidth in Mbps  
   type ifla_vf_spoofchk is record
      vf : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:437
      setting : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:438
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_vf_spoofchk);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:436

  -- link state of the uplink  
  -- link always up  
  -- link always down  
   type ifla_vf_link_state is record
      vf : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:449
      link_state : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:450
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_vf_link_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:448

  -- VF ports management section
  -- *
  -- *	Nested layout of set/get msg is:
  -- *
  -- *		[IFLA_NUM_VF]
  -- *		[IFLA_VF_PORTS]
  -- *			[IFLA_VF_PORT]
  -- *				[IFLA_PORT_*], ...
  -- *			[IFLA_VF_PORT]
  -- *				[IFLA_PORT_*], ...
  -- *			...
  -- *		[IFLA_PORT_SELF]
  -- *			[IFLA_PORT_*], ...
  --  

  -- nest  
  -- __u32  
  -- string  
  -- 802.1Qbg (pre-)standard VDP  
  -- binary UUID  
  -- binary UUID  
  -- __u8  
  -- __u16, output only  
  -- 0x08-0xFF reserved for future VDP use  
   type ifla_port_vsi_vsi_type_id_array is array (0 .. 2) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ifla_port_vsi_pad_array is array (0 .. 2) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ifla_port_vsi is record
      vsi_mgr_id : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:519
      vsi_type_id : aliased ifla_port_vsi_vsi_type_id_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:520
      vsi_type_version : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:521
      pad : aliased ifla_port_vsi_pad_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:522
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_port_vsi);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_link.h:518

  -- IPoIB section  
  -- using unreliable datagram QPs  
  -- using connected QPs  
  -- HSR section  
  -- Last byte of supervision addr  
  -- Supervision frame multicast addr  
end uapi_linux_if_link_h;

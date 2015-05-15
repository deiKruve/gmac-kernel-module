pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with linux_device_h;
with asm_generic_int_ll64_h;
with System;
limited with linux_netdevice_h;
with uapi_linux_types_h;
with linux_workqueue_h;
with linux_timer_h;
with Interfaces.C.Extensions;
with linux_types_h;

package net_dsa_h is

   --  unsupported macro: DSA_MAX_SWITCHES 4
   --  unsupported macro: DSA_MAX_PORTS 12
  -- * include/net/dsa.h - Driver for Distributed Switch Architecture switch chips
  -- * Copyright (c) 2008-2009 Marvell Semiconductor
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License as published by
  -- * the Free Software Foundation; either version 2 of the License, or
  -- * (at your option) any later version.
  --  

  --	 * How to access the switch configuration registers.
  --	  

   type dsa_chip_data_port_names_array is array (0 .. 11) of Interfaces.C.Strings.chars_ptr;
   type dsa_chip_data is record
      mii_bus : access linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:26
      sw_addr : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:27
      port_names : aliased dsa_chip_data_port_names_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:36
      rtable : access asm_generic_int_ll64_h.s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:44
   end record;
   pragma Convention (C_Pass_By_Copy, dsa_chip_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:22

  --	 * The names of the switch's ports.  Use "cpu" to
  --	 * designate the switch port that the cpu is connected to,
  --	 * "dsa" to indicate that this port is a DSA link to
  --	 * another switch, NULL to indicate the port is unused,
  --	 * or any other string to indicate this is a physical port.
  --	  

  --	 * An array (with nr_chips elements) of which element [a]
  --	 * indicates which port on this switch should be used to
  --	 * send packets to that are destined for switch a.  Can be
  --	 * NULL if there is only one switch chip.
  --	  

  --	 * Reference to a Linux network interface that connects
  --	 * to the root switch chip of the tree.
  --	  

   type dsa_platform_data is record
      netdev : access linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:52
      nr_chips : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:58
      chip : access dsa_chip_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:59
   end record;
   pragma Convention (C_Pass_By_Copy, dsa_platform_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:47

  --	 * Info structs describing each of the switch chips
  --	 * connected via this network interface.
  --	  

  --	 * Configuration data for the platform device that owns
  --	 * this dsa switch tree instance.
  --	  

   type dsa_switch_tree_ds_array is array (0 .. 3) of System.Address;
   type dsa_switch_tree is record
      pd : access dsa_platform_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:67
      master_netdev : access linux_netdevice_h.net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:73
      tag_protocol : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:74
      cpu_switch : aliased asm_generic_int_ll64_h.s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:79
      cpu_port : aliased asm_generic_int_ll64_h.s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:80
      link_poll_needed : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:85
      link_poll_work : aliased linux_workqueue_h.work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:86
      link_poll_timer : aliased linux_timer_h.timer_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:87
      ds : aliased dsa_switch_tree_ds_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:92
   end record;
   pragma Convention (C_Pass_By_Copy, dsa_switch_tree);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:62

  --	 * Reference to network device to use, and which tagging
  --	 * protocol to use.
  --	  

  --	 * The switch and port to which the CPU is attached.
  --	  

  --	 * Link state polling.
  --	  

  --	 * Data for the individual switch chips.
  --	  

  --	 * Parent switch tree, and switch index.
  --	  

   type dsa_switch_driver;
   type dsa_switch_ports_array is array (0 .. 11) of access linux_netdevice_h.net_device;
   type dsa_switch is record
      dst : access dsa_switch_tree;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:99
      index : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:100
      pd : access dsa_chip_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:105
      drv : access dsa_switch_driver;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:110
      master_mii_bus : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:115
      dsa_port_mask : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:120
      phys_port_mask : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:121
      slave_mii_bus : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:122
      ports : aliased dsa_switch_ports_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:123
   end record;
   pragma Convention (C_Pass_By_Copy, dsa_switch);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:95

  --	 * Configuration data for this switch.
  --	  

  --	 * The used switch driver.
  --	  

  --	 * Reference to mii bus to use.
  --	  

   --  skipped empty struct mii_bus

  --	 * Slave mii_bus and devices for the individual ports.
  --	  

   function dsa_is_cpu_port (ds : access dsa_switch; p : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:126
   pragma Import (CPP, dsa_is_cpu_port, "_ZL15dsa_is_cpu_portP10dsa_switchi");

   function dsa_upstream_port (ds : access dsa_switch) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:131
   pragma Import (CPP, dsa_upstream_port, "_ZL17dsa_upstream_portP10dsa_switch");

  --	 * If this is the root switch (i.e. the switch that connects
  --	 * to the CPU), return the cpu port number on this switch.
  --	 * Else return the (DSA) port number that connects to the
  --	 * switch that is one hop closer to the cpu.
  --	  

   type dsa_switch_driver is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:148
      tag_protocol : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:150
      priv_size : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:151
      probe : access function (arg1 : System.Address; arg2 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:156
      setup : access function (arg1 : access dsa_switch) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:157
      set_addr : access function (arg1 : access dsa_switch; arg2 : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:158
      phy_read : access function
           (arg1 : access dsa_switch;
            arg2 : int;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:163
      phy_write : access function
           (arg1 : access dsa_switch;
            arg2 : int;
            arg3 : int;
            arg4 : asm_generic_int_ll64_h.u16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:165
      poll_link : access procedure (arg1 : access dsa_switch);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:170
      get_strings : access procedure
           (arg1 : access dsa_switch;
            arg2 : int;
            arg3 : access linux_types_h.uint8_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:175
      get_ethtool_stats : access procedure
           (arg1 : access dsa_switch;
            arg2 : int;
            arg3 : access linux_types_h.uint64_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:177
      get_sset_count : access function (arg1 : access dsa_switch) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:178
   end record;
   pragma Convention (C_Pass_By_Copy, dsa_switch_driver);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:147

  --	 * Probing and setup.
  --	  

  --	 * Access to the switch's PHY registers.
  --	  

  --	 * Link state polling and IRQ handling.
  --	  

  --	 * ethtool hardware statistics.
  --	  

   procedure register_switch_driver (c_type : access dsa_switch_driver);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:181
   pragma Import (CPP, register_switch_driver, "_Z22register_switch_driverP17dsa_switch_driver");

   procedure unregister_switch_driver (c_type : access dsa_switch_driver);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:182
   pragma Import (CPP, unregister_switch_driver, "_Z24unregister_switch_driverP17dsa_switch_driver");

   function ds_to_priv (ds : access dsa_switch) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:184
   pragma Import (CPP, ds_to_priv, "_ZL10ds_to_privP10dsa_switch");

  -- * The original DSA tag format and some other tag formats have no
  -- * ethertype, which means that we need to add a little hack to the
  -- * networking receive path to make sure that received frames get
  -- * the right ->protocol assigned to them when one of those tag
  -- * formats is in use.
  --  

   function dsa_uses_dsa_tags (dst : access dsa_switch_tree) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:196
   pragma Import (CPP, dsa_uses_dsa_tags, "_ZL17dsa_uses_dsa_tagsP15dsa_switch_tree");

   function dsa_uses_trailer_tags (dst : access dsa_switch_tree) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dsa.h:201
   pragma Import (CPP, dsa_uses_trailer_tags, "_ZL21dsa_uses_trailer_tagsP15dsa_switch_tree");

end net_dsa_h;

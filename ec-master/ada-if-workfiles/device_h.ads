pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_skbuff_h;
with asm_generic_int_ll64_h;
limited with ecrt_h;
limited with linux_netdevice_h;
with ecdev_h;
with System;
with linux_types_h;

package device_h is

   --  unsupported macro: EC_TX_RING_SIZE 2
  --*****************************************************************************
  -- *
  -- *  $Id$
  -- *
  -- *  Copyright (C) 2006-2008  Florian Pose, Ingenieurgemeinschaft IgH
  -- *
  -- *  This file is part of the IgH EtherCAT Master.
  -- *
  -- *  The IgH EtherCAT Master is free software; you can redistribute it and/or
  -- *  modify it under the terms of the GNU General Public License version 2, as
  -- *  published by the Free Software Foundation.
  -- *
  -- *  The IgH EtherCAT Master is distributed in the hope that it will be useful,
  -- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
  -- *  Public License for more details.
  -- *
  -- *  You should have received a copy of the GNU General Public License along
  -- *  with the IgH EtherCAT Master; if not, write to the Free Software
  -- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  -- *
  -- *  ---
  -- *
  -- *  The license mentioned above concerns the source code only. Using the
  -- *  EtherCAT technology and brand is only permitted in compliance with the
  -- *  industrial property and similar rights of Beckhoff Automation GmbH.
  -- *
  -- **************************************************************************** 

  --*
  --   \file
  --   EtherCAT device structure.
  -- 

  --*************************************************************************** 
  --#include <linux/interrupt.h>
  --#include "../devices/ecdev.h"
  --*
  -- * Size of the transmit ring.
  -- * This memory ring is used to transmit frames. It is necessary to use
  -- * different memory regions, because otherwise the network device DMA could
  -- * send the same data twice, if it is called twice.
  --  

  --*************************************************************************** 
  --*
  --   EtherCAT device.
  --   An EtherCAT device is a network interface card, that is owned by an
  --   EtherCAT master to send and receive EtherCAT frames with.
  -- 

  --*< EtherCAT master  
   type ec_device_tx_skb_array is array (0 .. 1) of access linux_skbuff_h.sk_buff;
   type ec_device_tx_frame_rates_array is array (0 .. 2) of aliased asm_generic_int_ll64_h.s32;
   type ec_device_rx_frame_rates_array is array (0 .. 2) of aliased asm_generic_int_ll64_h.s32;
   type ec_device_tx_byte_rates_array is array (0 .. 2) of aliased asm_generic_int_ll64_h.s32;
   type ec_device_rx_byte_rates_array is array (0 .. 2) of aliased asm_generic_int_ll64_h.s32;
   type ec_device is record
      master : access ecrt_h.ec_master_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:84
      dev : access linux_netdevice_h.net_device;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:85
      poll : ecdev_h.ec_pollfunc_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:86
      the_module : System.Address;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:87
      open : aliased linux_types_h.uint8_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:88
      link_state : aliased linux_types_h.uint8_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:89
      tx_skb : aliased ec_device_tx_skb_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:90
      tx_ring_index : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:91
      jiffies_poll : aliased unsigned_long;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:98
      tx_count : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:101
      last_tx_count : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:102
      rx_count : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:103
      last_rx_count : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:104
      tx_bytes : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:106
      last_tx_bytes : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:107
      rx_bytes : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:108
      last_rx_bytes : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:109
      tx_errors : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:111
      tx_frame_rates : aliased ec_device_tx_frame_rates_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:112
      rx_frame_rates : aliased ec_device_rx_frame_rates_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:115
      tx_byte_rates : aliased ec_device_tx_byte_rates_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:118
      rx_byte_rates : aliased ec_device_rx_byte_rates_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:120
   end record;
   pragma Convention (C_Pass_By_Copy, ec_device);  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:82

  --*< pointer to the assigned net_device  
  --*< pointer to the device's poll function  
  --*< pointer to the device's owning module  
  --*< true, if the net_device has been opened  
  --*< device link state  
  --*< transmit skb ring  
  --*< last ring entry used to transmit  
  --*< cycles of last poll  
  --*< jiffies of last poll  
  -- Frame statistics
  --*< Number of frames sent.  
  --*< Number of frames sent of last statistics cycle.  
  --*< Number of frames received.  
  --*< Number of frames received of last statistics
  --                         cycle.  

  --*< Number of bytes sent.  
  --*< Number of bytes sent of last statistics cycle.  
  --*< Number of bytes received.  
  --*< Number of bytes received of last statistics cycle.
  --                         

  --*< Number of transmit errors.  
  --*< Transmit rates in frames/s for
  --                                         different statistics cycle periods.
  --                                         

  --*< Receive rates in frames/s for
  --                                         different statistics cycle periods.
  --                                         

  --*< Transmit rates in byte/s for
  --                                        different statistics cycle periods.  

  --*< Receive rates in byte/s for
  --                                        different statistics cycle periods.  

  --*< debug device  
  --*************************************************************************** 
   function ec_device_init (arg1 : access ecdev_h.ec_device_t; arg2 : access ecrt_h.ec_master_t) return int;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:135
   pragma Import (CPP, ec_device_init, "_Z14ec_device_initP9ec_deviceP9ec_master");

   procedure ec_device_clear (arg1 : access ecdev_h.ec_device_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:136
   pragma Import (CPP, ec_device_clear, "_Z15ec_device_clearP9ec_device");

   procedure ec_device_attach
     (arg1 : access ecdev_h.ec_device_t;
      arg2 : access linux_netdevice_h.net_device;
      arg3 : ecdev_h.ec_pollfunc_t;
      arg4 : System.Address);  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:138
   pragma Import (CPP, ec_device_attach, "_Z16ec_device_attachP9ec_deviceP10net_devicePFvS2_EP6module");

   procedure ec_device_detach (arg1 : access ecdev_h.ec_device_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:140
   pragma Import (CPP, ec_device_detach, "_Z16ec_device_detachP9ec_device");

   function ec_device_open (arg1 : access ecdev_h.ec_device_t) return int;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:142
   pragma Import (CPP, ec_device_open, "_Z14ec_device_openP9ec_device");

   function ec_device_close (arg1 : access ecdev_h.ec_device_t) return int;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:143
   pragma Import (CPP, ec_device_close, "_Z15ec_device_closeP9ec_device");

   procedure ec_device_poll (arg1 : access ecdev_h.ec_device_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:145
   pragma Import (CPP, ec_device_poll, "_Z14ec_device_pollP9ec_device");

   function ec_device_tx_data (arg1 : access ecdev_h.ec_device_t) return access linux_types_h.uint8_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:146
   pragma Import (CPP, ec_device_tx_data, "_Z17ec_device_tx_dataP9ec_device");

   procedure ec_device_send (arg1 : access ecdev_h.ec_device_t; arg2 : linux_types_h.size_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:147
   pragma Import (CPP, ec_device_send, "_Z14ec_device_sendP9ec_devicem");

   procedure ec_device_clear_stats (arg1 : access ecdev_h.ec_device_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:148
   pragma Import (CPP, ec_device_clear_stats, "_Z21ec_device_clear_statsP9ec_device");

   procedure ec_device_update_stats (arg1 : access ecdev_h.ec_device_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/device.h:149
   pragma Import (CPP, ec_device_update_stats, "_Z22ec_device_update_statsP9ec_device");

  --*************************************************************************** 
end device_h;

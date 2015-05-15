pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with device_h;
limited with linux_netdevice_h;
with System;
with linux_types_h;

package ecdev_h is

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

  --* \file
  -- *
  -- * EtherCAT interface for EtherCAT device drivers.
  -- *
  -- * \defgroup DeviceInterface EtherCAT Device Interface
  -- *
  -- * Master interface for EtherCAT-capable network device drivers. Through the
  -- * EtherCAT device interface, EtherCAT-capable network device drivers are able
  -- * to connect their device(s) to the master, pass received frames and notify
  -- * the master about status changes. The master on his part, can send his
  -- * frames through connected devices.
  --  

  --*************************************************************************** 
  --*************************************************************************** 
  --*< \see ec_device  
   subtype ec_device_t is device_h.ec_device;

  --* Device poll function type.
  --  

   type ec_pollfunc_t is access procedure (arg1 : access linux_netdevice_h.net_device);
   pragma Convention (C, ec_pollfunc_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/ecdev.h:57

  --*****************************************************************************
  -- * Offering/withdrawal functions
  -- **************************************************************************** 

   function ecdev_offer
     (net_dev : access linux_netdevice_h.net_device;
      poll : ec_pollfunc_t;
      the_module : System.Address) return access ec_device_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/ecdev.h:63
   pragma Import (CPP, ecdev_offer, "_Z11ecdev_offerP10net_devicePFvS0_EP6module");

   procedure ecdev_withdraw (device : access ec_device_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/ecdev.h:65
   pragma Import (CPP, ecdev_withdraw, "_Z14ecdev_withdrawP9ec_device");

  --*****************************************************************************
  -- * Device methods
  -- **************************************************************************** 

   function ecdev_open (device : access ec_device_t) return int;  -- /home/jan/MMS/programs-KERNEL/ec-master/ecdev.h:71
   pragma Import (CPP, ecdev_open, "_Z10ecdev_openP9ec_device");

   procedure ecdev_close (device : access ec_device_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/ecdev.h:72
   pragma Import (CPP, ecdev_close, "_Z11ecdev_closeP9ec_device");

   procedure ecdev_receive
     (device : access ec_device_t;
      data : System.Address;
      size : linux_types_h.size_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/ecdev.h:73
   pragma Import (CPP, ecdev_receive, "_Z13ecdev_receiveP9ec_devicePKvm");

   procedure ecdev_set_link (device : access ec_device_t; state : linux_types_h.uint8_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/ecdev.h:74
   pragma Import (CPP, ecdev_set_link, "_Z14ecdev_set_linkP9ec_deviceh");

   function ecdev_get_link (device : System.Address) return linux_types_h.uint8_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/ecdev.h:75
   pragma Import (CPP, ecdev_get_link, "_Z14ecdev_get_linkPK9ec_device");

  --*************************************************************************** 
end ecdev_h;

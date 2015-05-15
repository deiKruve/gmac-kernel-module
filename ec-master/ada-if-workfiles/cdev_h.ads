pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with ecrt_h;
with linux_cdev_h;
with linux_types_h;

package cdev_h is

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
  --   EtherCAT master character device.
  -- 

  --*************************************************************************** 
  --*************************************************************************** 
  --* EtherCAT master character device.
  -- 

  --*< Master owning the device.  
   type ec_cdev_t is record
      master : access ecrt_h.ec_master_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/cdev.h:50
      the_cdev : aliased linux_cdev_h.cdev;  -- /home/jan/MMS/programs-KERNEL/ec-master/cdev.h:51
   end record;
   pragma Convention (C_Pass_By_Copy, ec_cdev_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/cdev.h:52

   --  skipped anonymous struct anon_403

  --*< Character device.  
  --*************************************************************************** 
   function ec_cdev_init
     (arg1 : access ec_cdev_t;
      arg2 : access ecrt_h.ec_master_t;
      arg3 : linux_types_h.dev_t) return int;  -- /home/jan/MMS/programs-KERNEL/ec-master/cdev.h:56
   pragma Import (CPP, ec_cdev_init, "_Z12ec_cdev_initP9ec_cdev_tP9ec_masterj");

   procedure ec_cdev_clear (arg1 : access ec_cdev_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/cdev.h:57
   pragma Import (CPP, ec_cdev_clear, "_Z13ec_cdev_clearP9ec_cdev_t");

  --*************************************************************************** 
end cdev_h;

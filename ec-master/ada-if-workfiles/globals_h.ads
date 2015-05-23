pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with linux_types_h;
with Interfaces.C.Strings;
with System;
with ecrt_h;

package globals_h is

   --  unsupported macro: EC_IO_TIMEOUT 500
   --  unsupported macro: EC_SDO_INJECTION_TIMEOUT 10000
   --  unsupported macro: EC_BYTE_TRANSMISSION_TIME_NS 80
   --  unsupported macro: EC_FSM_RETRIES 3
   --  unsupported macro: EC_WAIT_SDO_DICT 3
   --  unsupported macro: EC_STATE_STRING_SIZE 32
   --  unsupported macro: EC_MAX_SII_SIZE 4096
   --  unsupported macro: EC_RATE_COUNT 3
   --  unsupported macro: EC_FRAME_HEADER_SIZE 2
   --  unsupported macro: EC_DATAGRAM_HEADER_SIZE 10
   --  unsupported macro: EC_DATAGRAM_FOOTER_SIZE 2
   --  unsupported macro: EC_ADDR_LEN 4
   --  unsupported macro: EC_MAX_DATA_SIZE (ETH_DATA_LEN - EC_FRAME_HEADER_SIZE - EC_DATAGRAM_HEADER_SIZE - EC_DATAGRAM_FOOTER_SIZE)
   --  unsupported macro: EC_MBOX_HEADER_SIZE 6
   --  unsupported macro: EC_FIRST_SII_CATEGORY_OFFSET 0x40
   --  unsupported macro: EC_SYNC_PAGE_SIZE 8
   --  unsupported macro: EC_MAX_FMMUS 16
   --  unsupported macro: EC_FMMU_PAGE_SIZE 16
   --  unsupported macro: EC_SYNC_SIGNAL_COUNT 2
   --  unsupported macro: EC_DATAGRAM_NAME_SIZE 20
   --  unsupported macro: EC_SLAVE_STATE_MASK 0x0F
   --  unsupported macro: EC_INFO(fmt,args...) printk(KERN_INFO "EtherCAT: " fmt, ##args)
   --  unsupported macro: EC_ERR(fmt,args...) printk(KERN_ERR "EtherCAT ERROR: " fmt, ##args)
   --  unsupported macro: EC_WARN(fmt,args...) printk(KERN_WARNING "EtherCAT WARNING: " fmt, ##args)
   --  unsupported macro: EC_DBG(fmt,args...) printk(KERN_DEBUG "EtherCAT DEBUG: " fmt, ##args)
   --  arg-macro: function EC_ABS ((X) >= 0 ? (X) : -(X)
   --    return (X) >= 0 ? (X) : -(X);
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
  -- * Global definitions and macros.
  --  

  --*************************************************************************** 
  --*****************************************************************************
  -- * EtherCAT master
  -- **************************************************************************** 

  --* Datagram timeout in microseconds.  
  --* SDO injection timeout in microseconds.  
  --* Time to send a byte in nanoseconds.
  -- *
  -- * t_ns = 1 / (100 MBit/s / 8 bit/byte) = 80 ns/byte
  --  

  --* Number of state machine retries on datagram timeout.  
  --* Seconds to wait before fetching SDO dictionary
  --    after slave entered PREOP state.  

  --* Minimum size of a buffer used with ec_state_string().  
  --* Maximum SII size in words, to avoid infinite reading.  
  --* Number of statistic rate intervals to maintain.  
  --*****************************************************************************
  -- * EtherCAT protocol
  -- **************************************************************************** 

  --* Size of an EtherCAT frame header.  
  --* Size of an EtherCAT datagram header.  
  --* Size of an EtherCAT datagram footer.  
  --* Size of the EtherCAT address field.  
  --* Resulting maximum data size of a single datagram in a frame.  
  --* Mailbox header size.   
  --* Word offset of first SII category.  
  --* Size of a sync manager configuration page.  
  --* Maximum number of FMMUs per slave.  
  --* Size of an FMMU configuration page.  
  --* Number of DC sync signals.  
  --* Size of the datagram description string.
  -- *
  -- * This is also used as the maximum lenth of EoE device names.
  -- * 

  --* Slave state mask.
  -- *
  -- * Apply this mask to a slave state byte to get the slave state without
  -- * the error flag.
  --  

  --* State of an EtherCAT slave.
  --  

  --*< unknown state  
  --*< INIT state (no mailbox communication, no IO)  
  --*< PREOP state (mailbox communication, no IO)  
  --*< Bootstrap state (mailbox communication, firmware update)  
  --*< SAFEOP (mailbox communication and input update)  
  --*< OP (mailbox communication and input/output update)  
  --*< Acknowledge/Error bit (no actual state)  
   subtype ec_slave_state_t is unsigned;
   EC_SLAVE_STATE_UNKNOWN : constant ec_slave_state_t := 0;
   EC_SLAVE_STATE_INIT : constant ec_slave_state_t := 1;
   EC_SLAVE_STATE_PREOP : constant ec_slave_state_t := 2;
   EC_SLAVE_STATE_BOOT : constant ec_slave_state_t := 3;
   EC_SLAVE_STATE_SAFEOP : constant ec_slave_state_t := 4;
   EC_SLAVE_STATE_OP : constant ec_slave_state_t := 8;
   EC_SLAVE_STATE_ACK_ERR : constant ec_slave_state_t := 16;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:142

  --* Supported mailbox protocols.
  --  

  --*< ADS over EtherCAT  
  --*< Ethernet over EtherCAT  
  --*< CANopen over EtherCAT  
  --*< File-Access over EtherCAT  
  --*< Servo-Profile over EtherCAT  
  --*< Vendor specific  
  --* Slave information interface CANopen over EtherCAT details flags.
  --  

  --*< Enable SDO access.  
   type ec_sii_coe_details_t is record
      enable_sdo : Extensions.Unsigned_1;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:158
      enable_sdo_info : Extensions.Unsigned_1;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:159
      enable_pdo_assign : Extensions.Unsigned_1;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:160
      enable_pdo_configuration : Extensions.Unsigned_1;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:161
      enable_upload_at_startup : Extensions.Unsigned_1;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:162
      enable_sdo_complete_access : Extensions.Unsigned_1;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:163
   end record;
   pragma Convention (C_Pass_By_Copy, ec_sii_coe_details_t);
   pragma Pack (ec_sii_coe_details_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:164

   --  skipped anonymous struct anon_41

  --*< SDO information service available.  
  --*< PDO mapping configurable.  
  --*< PDO configuration possible.  
  --*< ?.  
  --*< Complete access possible.  
  --* Slave information interface general flags.
  --  

  --*< ?.  
   type ec_sii_general_flags_t is record
      enable_safeop : Extensions.Unsigned_1;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:169
      enable_not_lrw : Extensions.Unsigned_1;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:170
   end record;
   pragma Convention (C_Pass_By_Copy, ec_sii_general_flags_t);
   pragma Pack (ec_sii_general_flags_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:171

   --  skipped anonymous struct anon_42

  --*< Slave does not support LRW.  
  --* EtherCAT slave distributed clocks range.
  --  

  --*< 32 bit.  
  --< 64 bit for system time, system time offset and
  --               port 0 receive time.  

   type ec_slave_dc_range_t is 
     (EC_DC_32,
      EC_DC_64);
   pragma Convention (C, ec_slave_dc_range_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:179

  --* EtherCAT slave sync signal configuration.
  --  

  --*< Cycle time [ns].  
   type ec_sync_signal_t is record
      cycle_time : aliased linux_types_h.uint32_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:184
      shift_time : aliased linux_types_h.int32_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:185
   end record;
   pragma Convention (C_Pass_By_Copy, ec_sync_signal_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:186

   --  skipped anonymous struct anon_44

  --*< Shift time [ns].  
  --* Access states for SDO entries.
  -- *
  -- * The access rights are managed per AL state.
  --  

  --*< Access rights in PREOP.  
  --*< Access rights in SAFEOP.  
  --*< Access rights in OP.  
  --*< Number of states.  
  --* Master devices.
  --  

  --*< Main device.  
  --*< Backup device  
   type ec_device_index_t is 
     (EC_DEVICE_MAIN,
      EC_DEVICE_BACKUP);
   pragma Convention (C, ec_device_index_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:204

  -- only main and backup!
   ec_device_names : aliased array (0 .. 1) of Interfaces.C.Strings.chars_ptr;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:206
   pragma Import (C, ec_device_names, "ec_device_names");

  --*************************************************************************** 
  --* Convenience macro for printing EtherCAT-specific information to syslog.
  -- *
  -- * This will print the message in \a fmt with a prefixed "EtherCAT: ".
  -- *
  -- * \param fmt format string (like in printf())
  -- * \param args arguments (optional)
  --  

  --* Convenience macro for printing EtherCAT-specific errors to syslog.
  -- *
  -- * This will print the message in \a fmt with a prefixed "EtherCAT ERROR: ".
  -- *
  -- * \param fmt format string (like in printf())
  -- * \param args arguments (optional)
  --  

  --* Convenience macro for printing EtherCAT-specific warnings to syslog.
  -- *
  -- * This will print the message in \a fmt with a prefixed "EtherCAT WARNING: ".
  -- *
  -- * \param fmt format string (like in printf())
  -- * \param args arguments (optional)
  --  

  --* Convenience macro for printing EtherCAT debug messages to syslog.
  -- *
  -- * This will print the message in \a fmt with a prefixed "EtherCAT DEBUG: ".
  -- *
  -- * \param fmt format string (like in printf())
  -- * \param args arguments (optional)
  --  

  --*************************************************************************** 
  --* Absolute value.
  --  

  --*************************************************************************** 
   ec_master_version_str : Interfaces.C.Strings.chars_ptr;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:258
   pragma Import (C, ec_master_version_str, "ec_master_version_str");

  --*************************************************************************** 
   function ec_master_count return unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:262
   pragma Import (CPP, ec_master_count, "_Z15ec_master_countv");

   procedure ec_print_data (arg1 : access linux_types_h.uint8_t; arg2 : linux_types_h.size_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:263
   pragma Import (CPP, ec_print_data, "_Z13ec_print_dataPKhm");

   procedure ec_print_data_diff
     (arg1 : access linux_types_h.uint8_t;
      arg2 : access linux_types_h.uint8_t;
      arg3 : linux_types_h.size_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:264
   pragma Import (CPP, ec_print_data_diff, "_Z18ec_print_data_diffPKhS0_m");

   function ec_state_string
     (arg1 : linux_types_h.uint8_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : linux_types_h.uint8_t) return linux_types_h.size_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:265
   pragma Import (CPP, ec_state_string, "_Z15ec_state_stringhPch");

   function ec_mac_print (arg1 : access linux_types_h.uint8_t; arg2 : Interfaces.C.Strings.chars_ptr) return linux_types_h.ssize_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:266
   pragma Import (CPP, ec_mac_print, "_Z12ec_mac_printPKhPc");

   function ec_mac_is_zero (arg1 : access linux_types_h.uint8_t) return int;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:267
   pragma Import (CPP, ec_mac_is_zero, "_Z14ec_mac_is_zeroPKh");

   function ecrt_request_master_err (arg1 : unsigned) return System.Address;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:269
   pragma Import (CPP, ecrt_request_master_err, "_Z23ecrt_request_master_errj");

  --*************************************************************************** 
  --* Code/Message pair.
  -- *
  -- * Some EtherCAT datagrams support reading a status code to display a certain
  -- * message. This type allows to map a code to a message string.
  --  

  --*< Code.  
   type ec_code_msg_t is record
      code : aliased linux_types_h.uint32_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:279
      message : Interfaces.C.Strings.chars_ptr;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:280
   end record;
   pragma Convention (C_Pass_By_Copy, ec_code_msg_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:281

   --  skipped anonymous struct anon_47

  --*< Message belonging to \a code.  
  --*************************************************************************** 
  --* Generic request state.
  -- *
  -- * \attention If ever changing this, please be sure to adjust the \a
  -- * state_table in master/sdo_request.c.
  --  

   type ec_internal_request_state_t is 
     (EC_INT_REQUEST_INIT,
      EC_INT_REQUEST_QUEUED,
      EC_INT_REQUEST_BUSY,
      EC_INT_REQUEST_SUCCESS,
      EC_INT_REQUEST_FAILURE);
   pragma Convention (C, ec_internal_request_state_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:296

  --*************************************************************************** 
   ec_request_state_translation_table : aliased array (size_t) of aliased ecrt_h.ec_request_state_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:300
   pragma Import (C, ec_request_state_translation_table, "ec_request_state_translation_table");

  --*************************************************************************** 
  --* Origin type.
  --  

  --*< Internal.  
  --*< External.  
   type ec_origin_t is 
     (EC_ORIG_INTERNAL,
      EC_ORIG_EXTERNAL);
   pragma Convention (C, ec_origin_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/globals.h:309

  --*************************************************************************** 
  --*< \see ec_slave.  
   --  skipped empty struct ec_slave

   --  skipped empty struct ec_slave_t

  --*************************************************************************** 
end globals_h;

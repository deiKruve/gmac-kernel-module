pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stdint_h;
with x86_64_linux_gnu_sys_types_h;
with ecrt_h;
with globals_h;
with stddef_h;
with System;

package ioctl_h is


   EC_IOCTL_TYPE : constant := 16#a4#;  --  /home/jan/ethercat.work/master/ioctl.h:48
   --  arg-macro: procedure EC_IO (nr)
   --    _IO(EC_IOCTL_TYPE, nr)
   --  arg-macro: procedure EC_IOR (nr, type)
   --    _IOR(EC_IOCTL_TYPE, nr, type)
   --  arg-macro: procedure EC_IOW (nr, type)
   --    _IOW(EC_IOCTL_TYPE, nr, type)
   --  arg-macro: procedure EC_IOWR (nr, type)
   --    _IOWR(EC_IOCTL_TYPE, nr, type)

   EC_IOCTL_VERSION_MAGIC : constant := 28;  --  /home/jan/ethercat.work/master/ioctl.h:59
   --  unsupported macro: EC_IOCTL_MODULE EC_IOR(0x00, ec_ioctl_module_t)
   --  unsupported macro: EC_IOCTL_MASTER EC_IOR(0x01, ec_ioctl_master_t)
   --  unsupported macro: EC_IOCTL_SLAVE EC_IOWR(0x02, ec_ioctl_slave_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SYNC EC_IOWR(0x03, ec_ioctl_slave_sync_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SYNC_PDO EC_IOWR(0x04, ec_ioctl_slave_sync_pdo_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SYNC_PDO_ENTRY EC_IOWR(0x05, ec_ioctl_slave_sync_pdo_entry_t)
   --  unsupported macro: EC_IOCTL_DOMAIN EC_IOWR(0x06, ec_ioctl_domain_t)
   --  unsupported macro: EC_IOCTL_DOMAIN_FMMU EC_IOWR(0x07, ec_ioctl_domain_fmmu_t)
   --  unsupported macro: EC_IOCTL_DOMAIN_DATA EC_IOWR(0x08, ec_ioctl_domain_data_t)
   --  unsupported macro: EC_IOCTL_MASTER_DEBUG EC_IO(0x09)
   --  unsupported macro: EC_IOCTL_MASTER_RESCAN EC_IO(0x0a)
   --  unsupported macro: EC_IOCTL_SLAVE_STATE EC_IOW(0x0b, ec_ioctl_slave_state_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SDO EC_IOWR(0x0c, ec_ioctl_slave_sdo_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SDO_ENTRY EC_IOWR(0x0d, ec_ioctl_slave_sdo_entry_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SDO_UPLOAD EC_IOWR(0x0e, ec_ioctl_slave_sdo_upload_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SDO_DOWNLOAD EC_IOWR(0x0f, ec_ioctl_slave_sdo_download_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SII_READ EC_IOWR(0x10, ec_ioctl_slave_sii_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SII_WRITE EC_IOW(0x11, ec_ioctl_slave_sii_t)
   --  unsupported macro: EC_IOCTL_SLAVE_REG_READ EC_IOWR(0x12, ec_ioctl_slave_reg_t)
   --  unsupported macro: EC_IOCTL_SLAVE_REG_WRITE EC_IOW(0x13, ec_ioctl_slave_reg_t)
   --  unsupported macro: EC_IOCTL_SLAVE_FOE_READ EC_IOWR(0x14, ec_ioctl_slave_foe_t)
   --  unsupported macro: EC_IOCTL_SLAVE_FOE_WRITE EC_IOW(0x15, ec_ioctl_slave_foe_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SOE_READ EC_IOWR(0x16, ec_ioctl_slave_soe_read_t)
   --  unsupported macro: EC_IOCTL_SLAVE_SOE_WRITE EC_IOWR(0x17, ec_ioctl_slave_soe_write_t)
   --  unsupported macro: EC_IOCTL_CONFIG EC_IOWR(0x18, ec_ioctl_config_t)
   --  unsupported macro: EC_IOCTL_CONFIG_PDO EC_IOWR(0x19, ec_ioctl_config_pdo_t)
   --  unsupported macro: EC_IOCTL_CONFIG_PDO_ENTRY EC_IOWR(0x1a, ec_ioctl_config_pdo_entry_t)
   --  unsupported macro: EC_IOCTL_CONFIG_SDO EC_IOWR(0x1b, ec_ioctl_config_sdo_t)
   --  unsupported macro: EC_IOCTL_CONFIG_IDN EC_IOWR(0x1c, ec_ioctl_config_idn_t)
   --  unsupported macro: EC_IOCTL_EOE_HANDLER EC_IOWR(0x1d, ec_ioctl_eoe_handler_t)
   --  unsupported macro: EC_IOCTL_REQUEST EC_IO(0x1e)
   --  unsupported macro: EC_IOCTL_CREATE_DOMAIN EC_IO(0x1f)
   --  unsupported macro: EC_IOCTL_CREATE_SLAVE_CONFIG EC_IOWR(0x20, ec_ioctl_config_t)
   --  unsupported macro: EC_IOCTL_SELECT_REF_CLOCK EC_IOW(0x21, uint32_t)
   --  unsupported macro: EC_IOCTL_ACTIVATE EC_IOR(0x22, ec_ioctl_master_activate_t)
   --  unsupported macro: EC_IOCTL_DEACTIVATE EC_IO(0x23)
   --  unsupported macro: EC_IOCTL_SEND EC_IO(0x24)
   --  unsupported macro: EC_IOCTL_RECEIVE EC_IO(0x25)
   --  unsupported macro: EC_IOCTL_MASTER_STATE EC_IOR(0x26, ec_master_state_t)
   --  unsupported macro: EC_IOCTL_MASTER_LINK_STATE EC_IOWR(0x27, ec_ioctl_link_state_t)
   --  unsupported macro: EC_IOCTL_APP_TIME EC_IOW(0x28, ec_ioctl_app_time_t)
   --  unsupported macro: EC_IOCTL_SYNC_REF EC_IO(0x29)
   --  unsupported macro: EC_IOCTL_SYNC_SLAVES EC_IO(0x2a)
   --  unsupported macro: EC_IOCTL_REF_CLOCK_TIME EC_IOR(0x2b, uint32_t)
   --  unsupported macro: EC_IOCTL_SYNC_MON_QUEUE EC_IO(0x2c)
   --  unsupported macro: EC_IOCTL_SYNC_MON_PROCESS EC_IOR(0x2d, uint32_t)
   --  unsupported macro: EC_IOCTL_RESET EC_IO(0x2e)
   --  unsupported macro: EC_IOCTL_SC_SYNC EC_IOW(0x2f, ec_ioctl_config_t)
   --  unsupported macro: EC_IOCTL_SC_WATCHDOG EC_IOW(0x30, ec_ioctl_config_t)
   --  unsupported macro: EC_IOCTL_SC_ADD_PDO EC_IOW(0x31, ec_ioctl_config_pdo_t)
   --  unsupported macro: EC_IOCTL_SC_CLEAR_PDOS EC_IOW(0x32, ec_ioctl_config_pdo_t)
   --  unsupported macro: EC_IOCTL_SC_ADD_ENTRY EC_IOW(0x33, ec_ioctl_add_pdo_entry_t)
   --  unsupported macro: EC_IOCTL_SC_CLEAR_ENTRIES EC_IOW(0x34, ec_ioctl_config_pdo_t)
   --  unsupported macro: EC_IOCTL_SC_REG_PDO_ENTRY EC_IOWR(0x35, ec_ioctl_reg_pdo_entry_t)
   --  unsupported macro: EC_IOCTL_SC_REG_PDO_POS EC_IOWR(0x36, ec_ioctl_reg_pdo_pos_t)
   --  unsupported macro: EC_IOCTL_SC_DC EC_IOW(0x37, ec_ioctl_config_t)
   --  unsupported macro: EC_IOCTL_SC_SDO EC_IOW(0x38, ec_ioctl_sc_sdo_t)
   --  unsupported macro: EC_IOCTL_SC_EMERG_SIZE EC_IOW(0x39, ec_ioctl_sc_emerg_t)
   --  unsupported macro: EC_IOCTL_SC_EMERG_POP EC_IOWR(0x3a, ec_ioctl_sc_emerg_t)
   --  unsupported macro: EC_IOCTL_SC_EMERG_CLEAR EC_IOW(0x3b, ec_ioctl_sc_emerg_t)
   --  unsupported macro: EC_IOCTL_SC_EMERG_OVERRUNS EC_IOWR(0x3c, ec_ioctl_sc_emerg_t)
   --  unsupported macro: EC_IOCTL_SC_SDO_REQUEST EC_IOWR(0x3d, ec_ioctl_sdo_request_t)
   --  unsupported macro: EC_IOCTL_SC_REG_REQUEST EC_IOWR(0x3e, ec_ioctl_reg_request_t)
   --  unsupported macro: EC_IOCTL_SC_VOE EC_IOWR(0x3f, ec_ioctl_voe_t)
   --  unsupported macro: EC_IOCTL_SC_STATE EC_IOWR(0x40, ec_ioctl_sc_state_t)
   --  unsupported macro: EC_IOCTL_SC_IDN EC_IOW(0x41, ec_ioctl_sc_idn_t)
   --  unsupported macro: EC_IOCTL_DOMAIN_SIZE EC_IO(0x42)
   --  unsupported macro: EC_IOCTL_DOMAIN_OFFSET EC_IO(0x43)
   --  unsupported macro: EC_IOCTL_DOMAIN_PROCESS EC_IO(0x44)
   --  unsupported macro: EC_IOCTL_DOMAIN_QUEUE EC_IO(0x45)
   --  unsupported macro: EC_IOCTL_DOMAIN_STATE EC_IOWR(0x46, ec_ioctl_domain_state_t)
   --  unsupported macro: EC_IOCTL_SDO_REQUEST_INDEX EC_IOWR(0x47, ec_ioctl_sdo_request_t)
   --  unsupported macro: EC_IOCTL_SDO_REQUEST_TIMEOUT EC_IOWR(0x48, ec_ioctl_sdo_request_t)
   --  unsupported macro: EC_IOCTL_SDO_REQUEST_STATE EC_IOWR(0x49, ec_ioctl_sdo_request_t)
   --  unsupported macro: EC_IOCTL_SDO_REQUEST_READ EC_IOWR(0x4a, ec_ioctl_sdo_request_t)
   --  unsupported macro: EC_IOCTL_SDO_REQUEST_WRITE EC_IOWR(0x4b, ec_ioctl_sdo_request_t)
   --  unsupported macro: EC_IOCTL_SDO_REQUEST_DATA EC_IOWR(0x4c, ec_ioctl_sdo_request_t)
   --  unsupported macro: EC_IOCTL_REG_REQUEST_DATA EC_IOWR(0x4d, ec_ioctl_reg_request_t)
   --  unsupported macro: EC_IOCTL_REG_REQUEST_STATE EC_IOWR(0x4e, ec_ioctl_reg_request_t)
   --  unsupported macro: EC_IOCTL_REG_REQUEST_WRITE EC_IOWR(0x4f, ec_ioctl_reg_request_t)
   --  unsupported macro: EC_IOCTL_REG_REQUEST_READ EC_IOWR(0x50, ec_ioctl_reg_request_t)
   --  unsupported macro: EC_IOCTL_VOE_SEND_HEADER EC_IOW(0x51, ec_ioctl_voe_t)
   --  unsupported macro: EC_IOCTL_VOE_REC_HEADER EC_IOWR(0x52, ec_ioctl_voe_t)
   --  unsupported macro: EC_IOCTL_VOE_READ EC_IOW(0x53, ec_ioctl_voe_t)
   --  unsupported macro: EC_IOCTL_VOE_READ_NOSYNC EC_IOW(0x54, ec_ioctl_voe_t)
   --  unsupported macro: EC_IOCTL_VOE_WRITE EC_IOWR(0x55, ec_ioctl_voe_t)
   --  unsupported macro: EC_IOCTL_VOE_EXEC EC_IOWR(0x56, ec_ioctl_voe_t)
   --  unsupported macro: EC_IOCTL_VOE_DATA EC_IOWR(0x57, ec_ioctl_voe_t)
   --  unsupported macro: EC_IOCTL_SET_SEND_INTERVAL EC_IOW(0x58, size_t)

   EC_IOCTL_STRING_SIZE : constant := 64;  --  /home/jan/ethercat.work/master/ioctl.h:158

   EC_MAX_SDO_DATA_SIZE : constant := 1024;  --  /home/jan/ethercat.work/master/ioctl.h:534

   EC_MAX_IDN_DATA_SIZE : constant := 1024;  --  /home/jan/ethercat.work/master/ioctl.h:554

  --*****************************************************************************
  -- *
  -- *  $Id$
  -- *
  -- *  Copyright (C) 2006-2012  Florian Pose, Ingenieurgemeinschaft IgH
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
  --   EtherCAT master character device IOCTL commands.
  -- 

  --*************************************************************************** 
  --*************************************************************************** 
  --* \cond  
  --* EtherCAT master ioctl() version magic.
  -- *
  -- * Increment this when changing the ioctl interface!
  --  

  -- Command-line tool
  -- Application interface
  --*************************************************************************** 
  --*************************************************************************** 
   type ec_ioctl_module_t is record
      ioctl_version_magic : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:163
      master_count : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:164
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_module_t);  -- /home/jan/ethercat.work/master/ioctl.h:165

   --  skipped anonymous struct anon_48

  --*************************************************************************** 
   type ec_ioctl_master_t_devices_array is array (0 .. 0) of aliased ec_ioctl_device;
   type ec_ioctl_master_t_tx_frame_rates_array is array (0 .. 2) of aliased x86_64_linux_gnu_sys_types_h.int32_t;
   type ec_ioctl_master_t_rx_frame_rates_array is array (0 .. 2) of aliased x86_64_linux_gnu_sys_types_h.int32_t;
   type ec_ioctl_master_t_tx_byte_rates_array is array (0 .. 2) of aliased x86_64_linux_gnu_sys_types_h.int32_t;
   type ec_ioctl_master_t_rx_byte_rates_array is array (0 .. 2) of aliased x86_64_linux_gnu_sys_types_h.int32_t;
   type ec_ioctl_master_t_loss_rates_array is array (0 .. 2) of aliased x86_64_linux_gnu_sys_types_h.int32_t;
   type ec_ioctl_master_t;
   type ec_ioctl_master_t_address_array is array (0 .. 5) of aliased stdint_h.uint8_t;
   type ec_ioctl_master_t_tx_frame_rates_array is array (0 .. 2) of aliased x86_64_linux_gnu_sys_types_h.int32_t;
   type ec_ioctl_master_t_rx_frame_rates_array is array (0 .. 2) of aliased x86_64_linux_gnu_sys_types_h.int32_t;
   type ec_ioctl_master_t_tx_byte_rates_array is array (0 .. 2) of aliased x86_64_linux_gnu_sys_types_h.int32_t;
   type ec_ioctl_master_t_rx_byte_rates_array is array (0 .. 2) of aliased x86_64_linux_gnu_sys_types_h.int32_t;
   type ec_ioctl_device is record
      address : aliased ec_ioctl_master_t_address_array;  -- /home/jan/ethercat.work/master/ioctl.h:180
      attached : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:181
      link_state : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:182
      tx_count : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:183
      rx_count : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:184
      tx_bytes : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:185
      rx_bytes : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:186
      tx_errors : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:187
      tx_frame_rates : aliased ec_ioctl_master_t_tx_frame_rates_array;  -- /home/jan/ethercat.work/master/ioctl.h:188
      rx_frame_rates : aliased ec_ioctl_master_t_rx_frame_rates_array;  -- /home/jan/ethercat.work/master/ioctl.h:189
      tx_byte_rates : aliased ec_ioctl_master_t_tx_byte_rates_array;  -- /home/jan/ethercat.work/master/ioctl.h:190
      rx_byte_rates : aliased ec_ioctl_master_t_rx_byte_rates_array;  -- /home/jan/ethercat.work/master/ioctl.h:191
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_device);
   type ec_ioctl_master_t is record
      slave_count : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:170
      config_count : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:171
      domain_count : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:172
      eoe_handler_count : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:174
      phase : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:176
      active : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:177
      scan_busy : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:178
      devices : aliased ec_ioctl_master_t_devices_array;  -- /home/jan/ethercat.work/master/ioctl.h:192
      num_devices : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:193
      tx_count : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:194
      rx_count : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:195
      tx_bytes : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:196
      rx_bytes : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:197
      tx_frame_rates : aliased ec_ioctl_master_t_tx_frame_rates_array;  -- /home/jan/ethercat.work/master/ioctl.h:198
      rx_frame_rates : aliased ec_ioctl_master_t_rx_frame_rates_array;  -- /home/jan/ethercat.work/master/ioctl.h:199
      tx_byte_rates : aliased ec_ioctl_master_t_tx_byte_rates_array;  -- /home/jan/ethercat.work/master/ioctl.h:200
      rx_byte_rates : aliased ec_ioctl_master_t_rx_byte_rates_array;  -- /home/jan/ethercat.work/master/ioctl.h:201
      loss_rates : aliased ec_ioctl_master_t_loss_rates_array;  -- /home/jan/ethercat.work/master/ioctl.h:202
      app_time : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:203
      ref_clock : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:204
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_master_t);  -- /home/jan/ethercat.work/master/ioctl.h:205

   --  skipped anonymous struct anon_49

  --*************************************************************************** 
  -- input
   type ec_ioctl_slave_t_ports_array is array (0 .. 3) of aliased anon_51;
   subtype ec_ioctl_slave_t_group_array is Interfaces.C.char_array (0 .. 63);
   subtype ec_ioctl_slave_t_image_array is Interfaces.C.char_array (0 .. 63);
   subtype ec_ioctl_slave_t_order_array is Interfaces.C.char_array (0 .. 63);
   subtype ec_ioctl_slave_t_name_array is Interfaces.C.char_array (0 .. 63);
   type ec_ioctl_slave_t;
   type anon_51 is record
      desc : aliased ecrt_h.ec_slave_port_desc_t;  -- /home/jan/ethercat.work/master/ioctl.h:234
      link : aliased ecrt_h.ec_slave_port_link_t;  -- /home/jan/ethercat.work/master/ioctl.h:235
      receive_time : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:236
      next_slave : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:237
      delay_to_next_dc : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:238
   end record;
   pragma Convention (C_Pass_By_Copy, anon_51);
   type ec_ioctl_slave_t is record
      position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:211
      device_index : aliased unsigned;  -- /home/jan/ethercat.work/master/ioctl.h:214
      vendor_id : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:215
      product_code : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:216
      revision_number : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:217
      serial_number : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:218
      alias : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:219
      boot_rx_mailbox_offset : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:220
      boot_rx_mailbox_size : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:221
      boot_tx_mailbox_offset : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:222
      boot_tx_mailbox_size : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:223
      std_rx_mailbox_offset : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:224
      std_rx_mailbox_size : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:225
      std_tx_mailbox_offset : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:226
      std_tx_mailbox_size : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:227
      mailbox_protocols : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:228
      has_general_category : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:229
      coe_details : aliased globals_h.ec_sii_coe_details_t;  -- /home/jan/ethercat.work/master/ioctl.h:230
      general_flags : aliased globals_h.ec_sii_general_flags_t;  -- /home/jan/ethercat.work/master/ioctl.h:231
      current_on_ebus : aliased x86_64_linux_gnu_sys_types_h.int16_t;  -- /home/jan/ethercat.work/master/ioctl.h:232
      ports : aliased ec_ioctl_slave_t_ports_array;  -- /home/jan/ethercat.work/master/ioctl.h:239
      fmmu_bit : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:240
      dc_supported : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:241
      dc_range : aliased globals_h.ec_slave_dc_range_t;  -- /home/jan/ethercat.work/master/ioctl.h:242
      has_dc_system_time : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:243
      transmission_delay : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:244
      al_state : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:245
      error_flag : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:246
      sync_count : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:247
      sdo_count : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:248
      sii_nwords : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:249
      group : aliased ec_ioctl_slave_t_group_array;  -- /home/jan/ethercat.work/master/ioctl.h:250
      image : aliased ec_ioctl_slave_t_image_array;  -- /home/jan/ethercat.work/master/ioctl.h:251
      order : aliased ec_ioctl_slave_t_order_array;  -- /home/jan/ethercat.work/master/ioctl.h:252
      name : aliased ec_ioctl_slave_t_name_array;  -- /home/jan/ethercat.work/master/ioctl.h:253
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_t);  -- /home/jan/ethercat.work/master/ioctl.h:254

   --  skipped anonymous struct anon_50

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_sync_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:260
      sync_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:261
      physical_start_address : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:264
      default_size : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:265
      control_register : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:266
      enable : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:267
      pdo_count : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:268
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_sync_t);  -- /home/jan/ethercat.work/master/ioctl.h:269

   --  skipped anonymous struct anon_52

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_sync_pdo_t_name_array is array (0 .. 63) of aliased x86_64_linux_gnu_sys_types_h.int8_t;
   type ec_ioctl_slave_sync_pdo_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:275
      sync_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:276
      pdo_pos : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:277
      index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:280
      entry_count : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:281
      name : aliased ec_ioctl_slave_sync_pdo_t_name_array;  -- /home/jan/ethercat.work/master/ioctl.h:282
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_sync_pdo_t);  -- /home/jan/ethercat.work/master/ioctl.h:283

   --  skipped anonymous struct anon_53

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_sync_pdo_entry_t_name_array is array (0 .. 63) of aliased x86_64_linux_gnu_sys_types_h.int8_t;
   type ec_ioctl_slave_sync_pdo_entry_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:289
      sync_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:290
      pdo_pos : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:291
      entry_pos : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:292
      index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:295
      subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:296
      bit_length : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:297
      name : aliased ec_ioctl_slave_sync_pdo_entry_t_name_array;  -- /home/jan/ethercat.work/master/ioctl.h:298
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_sync_pdo_entry_t);  -- /home/jan/ethercat.work/master/ioctl.h:299

   --  skipped anonymous struct anon_54

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_domain_t_working_counter_array is array (0 .. 0) of aliased stdint_h.uint16_t;
   type ec_ioctl_domain_t is record
      index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:305
      data_size : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:308
      logical_base_address : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:309
      working_counter : aliased ec_ioctl_domain_t_working_counter_array;  -- /home/jan/ethercat.work/master/ioctl.h:310
      expected_working_counter : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:311
      fmmu_count : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:312
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_domain_t);  -- /home/jan/ethercat.work/master/ioctl.h:313

   --  skipped anonymous struct anon_55

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_domain_fmmu_t is record
      domain_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:319
      fmmu_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:320
      slave_config_alias : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:323
      slave_config_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:324
      sync_index : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:325
      dir : aliased ecrt_h.ec_direction_t;  -- /home/jan/ethercat.work/master/ioctl.h:326
      logical_address : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:327
      data_size : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:328
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_domain_fmmu_t);  -- /home/jan/ethercat.work/master/ioctl.h:329

   --  skipped anonymous struct anon_56

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_domain_data_t is record
      domain_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:335
      data_size : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:336
      target : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:337
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_domain_data_t);  -- /home/jan/ethercat.work/master/ioctl.h:338

   --  skipped anonymous struct anon_57

  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_state_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:344
      al_state : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:345
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_state_t);  -- /home/jan/ethercat.work/master/ioctl.h:346

   --  skipped anonymous struct anon_58

  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_sdo_t_name_array is array (0 .. 63) of aliased x86_64_linux_gnu_sys_types_h.int8_t;
   type ec_ioctl_slave_sdo_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:352
      sdo_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:353
      sdo_index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:356
      max_subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:357
      name : aliased ec_ioctl_slave_sdo_t_name_array;  -- /home/jan/ethercat.work/master/ioctl.h:358
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_sdo_t);  -- /home/jan/ethercat.work/master/ioctl.h:359

   --  skipped anonymous struct anon_59

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_sdo_entry_t_read_access_array is array (0 .. 2) of aliased stdint_h.uint8_t;
   type ec_ioctl_slave_sdo_entry_t_write_access_array is array (0 .. 2) of aliased stdint_h.uint8_t;
   type ec_ioctl_slave_sdo_entry_t_description_array is array (0 .. 63) of aliased x86_64_linux_gnu_sys_types_h.int8_t;
   type ec_ioctl_slave_sdo_entry_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:365
      sdo_spec : aliased int;  -- /home/jan/ethercat.work/master/ioctl.h:366
      sdo_entry_subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:367
      data_type : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:370
      bit_length : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:371
      read_access : aliased ec_ioctl_slave_sdo_entry_t_read_access_array;  -- /home/jan/ethercat.work/master/ioctl.h:372
      write_access : aliased ec_ioctl_slave_sdo_entry_t_write_access_array;  -- /home/jan/ethercat.work/master/ioctl.h:373
      description : aliased ec_ioctl_slave_sdo_entry_t_description_array;  -- /home/jan/ethercat.work/master/ioctl.h:374
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_sdo_entry_t);  -- /home/jan/ethercat.work/master/ioctl.h:375

   --  skipped anonymous struct anon_60

  -- positive: index, negative: list position
  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_sdo_upload_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:381
      sdo_index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:382
      sdo_entry_subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:383
      target_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:384
      target : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:385
      data_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:388
      abort_code : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:389
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_sdo_upload_t);  -- /home/jan/ethercat.work/master/ioctl.h:390

   --  skipped anonymous struct anon_61

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_sdo_download_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:396
      sdo_index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:397
      sdo_entry_subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:398
      complete_access : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:399
      data_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:400
      data : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:401
      abort_code : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:404
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_sdo_download_t);  -- /home/jan/ethercat.work/master/ioctl.h:405

   --  skipped anonymous struct anon_62

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_sii_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:411
      offset : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:412
      nwords : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:413
      words : access stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:414
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_sii_t);  -- /home/jan/ethercat.work/master/ioctl.h:415

   --  skipped anonymous struct anon_63

  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_reg_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:421
      emergency : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:422
      address : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:423
      size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:424
      data : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:425
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_reg_t);  -- /home/jan/ethercat.work/master/ioctl.h:426

   --  skipped anonymous struct anon_64

  --*************************************************************************** 
  -- inputs
   subtype ec_ioctl_slave_foe_t_file_name_array is Interfaces.C.char_array (0 .. 31);
   type ec_ioctl_slave_foe_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:432
      offset : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:433
      buffer_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:434
      buffer : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:435
      data_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:438
      result : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:439
      error_code : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:440
      file_name : aliased ec_ioctl_slave_foe_t_file_name_array;  -- /home/jan/ethercat.work/master/ioctl.h:441
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_foe_t);  -- /home/jan/ethercat.work/master/ioctl.h:442

   --  skipped anonymous struct anon_65

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_soe_read_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:448
      drive_no : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:449
      idn : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:450
      mem_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:451
      data : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:452
      data_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:455
      error_code : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:456
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_soe_read_t);  -- /home/jan/ethercat.work/master/ioctl.h:457

   --  skipped anonymous struct anon_66

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_slave_soe_write_t is record
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:463
      drive_no : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:464
      idn : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:465
      data_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:466
      data : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:467
      error_code : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:470
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_slave_soe_write_t);  -- /home/jan/ethercat.work/master/ioctl.h:471

   --  skipped anonymous struct anon_67

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_config_t_syncs_array is array (0 .. 15) of aliased anon_69;
   type ec_ioctl_config_t_dc_sync_array is array (0 .. 1) of aliased globals_h.ec_sync_signal_t;
   type ec_ioctl_config_t;
   type anon_69 is record
      dir : aliased ecrt_h.ec_direction_t;  -- /home/jan/ethercat.work/master/ioctl.h:485
      watchdog_mode : aliased ecrt_h.ec_watchdog_mode_t;  -- /home/jan/ethercat.work/master/ioctl.h:486
      pdo_count : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:487
      config_this : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:488
   end record;
   pragma Convention (C_Pass_By_Copy, anon_69);
   type ec_ioctl_config_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:477
      alias : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:480
      position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:481
      vendor_id : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:482
      product_code : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:483
      syncs : aliased ec_ioctl_config_t_syncs_array;  -- /home/jan/ethercat.work/master/ioctl.h:489
      watchdog_divider : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:490
      watchdog_intervals : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:491
      sdo_count : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:492
      idn_count : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:493
      slave_position : aliased x86_64_linux_gnu_sys_types_h.int32_t;  -- /home/jan/ethercat.work/master/ioctl.h:494
      dc_assign_activate : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:495
      dc_sync : aliased ec_ioctl_config_t_dc_sync_array;  -- /home/jan/ethercat.work/master/ioctl.h:496
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_config_t);  -- /home/jan/ethercat.work/master/ioctl.h:497

   --  skipped anonymous struct anon_68

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_config_pdo_t_name_array is array (0 .. 63) of aliased x86_64_linux_gnu_sys_types_h.int8_t;
   type ec_ioctl_config_pdo_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:503
      sync_index : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:504
      pdo_pos : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:505
      index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:508
      entry_count : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:509
      name : aliased ec_ioctl_config_pdo_t_name_array;  -- /home/jan/ethercat.work/master/ioctl.h:510
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_config_pdo_t);  -- /home/jan/ethercat.work/master/ioctl.h:511

   --  skipped anonymous struct anon_70

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_config_pdo_entry_t_name_array is array (0 .. 63) of aliased x86_64_linux_gnu_sys_types_h.int8_t;
   type ec_ioctl_config_pdo_entry_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:517
      sync_index : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:518
      pdo_pos : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:519
      entry_pos : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:520
      index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:523
      subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:524
      bit_length : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:525
      name : aliased ec_ioctl_config_pdo_entry_t_name_array;  -- /home/jan/ethercat.work/master/ioctl.h:526
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_config_pdo_entry_t);  -- /home/jan/ethercat.work/master/ioctl.h:527

   --  skipped anonymous struct anon_71

  -- outputs
  --*************************************************************************** 
  --* Maximum size for displayed SDO data.
  -- * \todo Make this dynamic.
  --  

  -- inputs
   type ec_ioctl_config_sdo_t_data_array is array (0 .. 1023) of aliased stdint_h.uint8_t;
   type ec_ioctl_config_sdo_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:538
      sdo_pos : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:539
      index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:542
      subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:543
      size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:544
      data : aliased ec_ioctl_config_sdo_t_data_array;  -- /home/jan/ethercat.work/master/ioctl.h:545
      complete_access : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:546
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_config_sdo_t);  -- /home/jan/ethercat.work/master/ioctl.h:547

   --  skipped anonymous struct anon_72

  -- outputs
  --*************************************************************************** 
  --* Maximum size for displayed IDN data.
  -- * \todo Make this dynamic.
  --  

  -- inputs
   type ec_ioctl_config_idn_t_data_array is array (0 .. 1023) of aliased stdint_h.uint8_t;
   type ec_ioctl_config_idn_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:558
      idn_pos : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:559
      drive_no : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:562
      idn : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:563
      state : aliased ecrt_h.ec_al_state_t;  -- /home/jan/ethercat.work/master/ioctl.h:564
      size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:565
      data : aliased ec_ioctl_config_idn_t_data_array;  -- /home/jan/ethercat.work/master/ioctl.h:566
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_config_idn_t);  -- /home/jan/ethercat.work/master/ioctl.h:567

   --  skipped anonymous struct anon_73

  -- outputs
  --*************************************************************************** 
  -- input
   subtype ec_ioctl_eoe_handler_t_name_array is Interfaces.C.char_array (0 .. 19);
   type ec_ioctl_eoe_handler_t is record
      eoe_index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:575
      name : aliased ec_ioctl_eoe_handler_t_name_array;  -- /home/jan/ethercat.work/master/ioctl.h:578
      slave_position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:579
      open : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:580
      rx_bytes : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:581
      rx_rate : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:582
      tx_bytes : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:583
      tx_rate : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:584
      tx_queued_frames : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:585
      tx_queue_size : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:586
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_eoe_handler_t);  -- /home/jan/ethercat.work/master/ioctl.h:587

   --  skipped anonymous struct anon_74

  -- outputs
  --*************************************************************************** 
  -- outputs
   type ec_ioctl_master_activate_t is record
      process_data : System.Address;  -- /home/jan/ethercat.work/master/ioctl.h:595
      process_data_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:596
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_master_activate_t);  -- /home/jan/ethercat.work/master/ioctl.h:597

   --  skipped anonymous struct anon_75

  --*************************************************************************** 
  -- inputs
   type ec_ioctl_add_pdo_entry_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:603
      pdo_index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:604
      entry_index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:605
      entry_subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:606
      entry_bit_length : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:607
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_add_pdo_entry_t);  -- /home/jan/ethercat.work/master/ioctl.h:608

   --  skipped anonymous struct anon_76

  --*************************************************************************** 
  -- inputs
   type ec_ioctl_reg_pdo_entry_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:614
      entry_index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:615
      entry_subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:616
      domain_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:617
      bit_position : aliased unsigned;  -- /home/jan/ethercat.work/master/ioctl.h:620
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_reg_pdo_entry_t);  -- /home/jan/ethercat.work/master/ioctl.h:621

   --  skipped anonymous struct anon_77

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_reg_pdo_pos_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:627
      sync_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:628
      pdo_pos : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:629
      entry_pos : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:630
      domain_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:631
      bit_position : aliased unsigned;  -- /home/jan/ethercat.work/master/ioctl.h:634
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_reg_pdo_pos_t);  -- /home/jan/ethercat.work/master/ioctl.h:635

   --  skipped anonymous struct anon_78

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_sc_sdo_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:641
      index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:642
      subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:643
      data : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:644
      size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:645
      complete_access : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:646
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_sc_sdo_t);  -- /home/jan/ethercat.work/master/ioctl.h:647

   --  skipped anonymous struct anon_79

  --*************************************************************************** 
  -- inputs
   type ec_ioctl_sc_emerg_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:653
      size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:654
      target : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:655
      overruns : aliased x86_64_linux_gnu_sys_types_h.int32_t;  -- /home/jan/ethercat.work/master/ioctl.h:658
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_sc_emerg_t);  -- /home/jan/ethercat.work/master/ioctl.h:659

   --  skipped anonymous struct anon_80

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_sc_state_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:665
      state : access ecrt_h.ec_slave_config_state_t;  -- /home/jan/ethercat.work/master/ioctl.h:668
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_sc_state_t);  -- /home/jan/ethercat.work/master/ioctl.h:669

   --  skipped anonymous struct anon_81

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_sc_idn_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:675
      drive_no : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:676
      idn : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:677
      al_state : aliased ecrt_h.ec_al_state_t;  -- /home/jan/ethercat.work/master/ioctl.h:678
      data : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:679
      size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:680
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_sc_idn_t);  -- /home/jan/ethercat.work/master/ioctl.h:681

   --  skipped anonymous struct anon_82

  --*************************************************************************** 
  -- inputs
   type ec_ioctl_domain_state_t is record
      domain_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:687
      state : access ecrt_h.ec_domain_state_t;  -- /home/jan/ethercat.work/master/ioctl.h:690
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_domain_state_t);  -- /home/jan/ethercat.work/master/ioctl.h:691

   --  skipped anonymous struct anon_83

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_sdo_request_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:697
      request_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:700
      sdo_index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:701
      sdo_subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:702
      size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:703
      data : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:704
      timeout : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:705
      state : aliased ecrt_h.ec_request_state_t;  -- /home/jan/ethercat.work/master/ioctl.h:706
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_sdo_request_t);  -- /home/jan/ethercat.work/master/ioctl.h:707

   --  skipped anonymous struct anon_84

  -- inputs/outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_reg_request_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:713
      mem_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:714
      request_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:717
      data : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:718
      state : aliased ecrt_h.ec_request_state_t;  -- /home/jan/ethercat.work/master/ioctl.h:719
      new_data : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:720
      address : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:721
      transfer_size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:722
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_reg_request_t);  -- /home/jan/ethercat.work/master/ioctl.h:723

   --  skipped anonymous struct anon_85

  -- inputs/outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_voe_t is record
      config_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:729
      voe_index : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:732
      vendor_id : access stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:733
      vendor_type : access stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/ioctl.h:734
      size : aliased stddef_h.size_t;  -- /home/jan/ethercat.work/master/ioctl.h:735
      data : access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/ioctl.h:736
      state : aliased ecrt_h.ec_request_state_t;  -- /home/jan/ethercat.work/master/ioctl.h:737
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_voe_t);  -- /home/jan/ethercat.work/master/ioctl.h:738

   --  skipped anonymous struct anon_86

  -- inputs/outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_link_state_t is record
      dev_idx : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/ioctl.h:744
      state : access ecrt_h.ec_master_link_state_t;  -- /home/jan/ethercat.work/master/ioctl.h:747
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_link_state_t);  -- /home/jan/ethercat.work/master/ioctl.h:748

   --  skipped anonymous struct anon_87

  -- outputs
  --*************************************************************************** 
  -- inputs
   type ec_ioctl_app_time_t is record
      app_time : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/ioctl.h:754
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_app_time_t);  -- /home/jan/ethercat.work/master/ioctl.h:755

   --  skipped anonymous struct anon_88

  --*************************************************************************** 
  --* Context data structure for file handles.
  --  

  --*< Device was opened with write permission.  
  --*< Master was requested via this file handle.  
  --*< Total process data area.  
  --*< Size of the \a process_data.  
  --*************************************************************************** 
  --* \endcond  
end ioctl_h;

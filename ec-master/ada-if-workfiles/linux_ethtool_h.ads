pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with uapi_linux_ethtool_h;
with asm_compat_h;
limited with linux_netdevice_h;
with System;

package linux_ethtool_h is

  -- * ethtool.h: Defines for Linux ethtool.
  -- *
  -- * Copyright (C) 1998 David S. Miller (davem@redhat.com)
  -- * Copyright 2001 Jeff Garzik <jgarzik@pobox.com>
  -- * Portions Copyright 2001 Sun Microsystems (thockin@sun.com)
  -- * Portions Copyright 2002 Intel (eli.kupermann@intel.com,
  -- *                                christopher.leech@intel.com,
  -- *                                scott.feldman@intel.com)
  -- * Portions Copyright (C) Sun Microsystems 2008
  --  

   type compat_ethtool_rx_flow_spec is record
      flow_type : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:21
      h_u : uapi_linux_ethtool_h.ethtool_flow_union;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:22
      h_ext : aliased uapi_linux_ethtool_h.ethtool_flow_ext;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:23
      m_u : uapi_linux_ethtool_h.ethtool_flow_union;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:24
      m_ext : aliased uapi_linux_ethtool_h.ethtool_flow_ext;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:25
      ring_cookie : aliased asm_compat_h.compat_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:26
      location : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:27
   end record;
   pragma Convention (C_Pass_By_Copy, compat_ethtool_rx_flow_spec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:20

   type compat_ethtool_rxnfc_rule_locs_array is array (0 .. -1) of aliased asm_generic_int_ll64_h.u32;
   type compat_ethtool_rxnfc is record
      cmd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:31
      flow_type : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:32
      data : aliased asm_compat_h.compat_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:33
      fs : aliased compat_ethtool_rx_flow_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:34
      rule_cnt : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:35
      rule_locs : aliased compat_ethtool_rxnfc_rule_locs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, compat_ethtool_rxnfc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:30

   --  skipped func __ethtool_get_settings

  --*
  -- * enum ethtool_phys_id_state - indicator state for physical identification
  -- * @ETHTOOL_ID_INACTIVE: Physical ID indicator should be deactivated
  -- * @ETHTOOL_ID_ACTIVE: Physical ID indicator should be activated
  -- * @ETHTOOL_ID_ON: LED should be turned on (used iff %ETHTOOL_ID_ACTIVE
  -- *	is not supported)
  -- * @ETHTOOL_ID_OFF: LED should be turned off (used iff %ETHTOOL_ID_ACTIVE
  -- *	is not supported)
  --  

   type ethtool_phys_id_state is 
     (ETHTOOL_ID_INACTIVE,
      ETHTOOL_ID_ACTIVE,
      ETHTOOL_ID_ON,
      ETHTOOL_ID_OFF);
   pragma Convention (C, ethtool_phys_id_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:55

  -- Some generic methods drivers may use in their ethtool_ops  
   function ethtool_op_get_link (dev : access linux_netdevice_h.net_device) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:65
   pragma Import (CPP, ethtool_op_get_link, "_Z19ethtool_op_get_linkP10net_device");

   function ethtool_op_get_ts_info (dev : access linux_netdevice_h.net_device; eti : access uapi_linux_ethtool_h.ethtool_ts_info) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:66
   pragma Import (CPP, ethtool_op_get_ts_info, "_Z22ethtool_op_get_ts_infoP10net_deviceP15ethtool_ts_info");

  --*
  -- * ethtool_rxfh_indir_default - get default value for RX flow hash indirection
  -- * @index: Index in RX flow hash indirection table
  -- * @n_rx_rings: Number of RX rings to use
  -- *
  -- * This function provides the default policy for RX flow hash indirection.
  --  

   function ethtool_rxfh_indir_default (index : asm_generic_int_ll64_h.u32; n_rx_rings : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:75
   pragma Import (CPP, ethtool_rxfh_indir_default, "_ZL26ethtool_rxfh_indir_defaultjj");

  --*
  -- * struct ethtool_ops - optional netdev operations
  -- * @get_settings: Get various device settings including Ethernet link
  -- *	settings. The @cmd parameter is expected to have been cleared
  -- *	before get_settings is called. Returns a negative error code or
  -- *	zero.
  -- * @set_settings: Set various device settings including Ethernet link
  -- *	settings.  Returns a negative error code or zero.
  -- * @get_drvinfo: Report driver/device information.  Should only set the
  -- *	@driver, @version, @fw_version and @bus_info fields.  If not
  -- *	implemented, the @driver and @bus_info fields will be filled in
  -- *	according to the netdev's parent device.
  -- * @get_regs_len: Get buffer length required for @get_regs
  -- * @get_regs: Get device registers
  -- * @get_wol: Report whether Wake-on-Lan is enabled
  -- * @set_wol: Turn Wake-on-Lan on or off.  Returns a negative error code
  -- *	or zero.
  -- * @get_msglevel: Report driver message level.  This should be the value
  -- *	of the @msg_enable field used by netif logging functions.
  -- * @set_msglevel: Set driver message level
  -- * @nway_reset: Restart autonegotiation.  Returns a negative error code
  -- *	or zero.
  -- * @get_link: Report whether physical link is up.  Will only be called if
  -- *	the netdev is up.  Should usually be set to ethtool_op_get_link(),
  -- *	which uses netif_carrier_ok().
  -- * @get_eeprom: Read data from the device EEPROM.
  -- *	Should fill in the magic field.  Don't need to check len for zero
  -- *	or wraparound.  Fill in the data argument with the eeprom values
  -- *	from offset to offset + len.  Update len to the amount read.
  -- *	Returns an error or zero.
  -- * @set_eeprom: Write data to the device EEPROM.
  -- *	Should validate the magic field.  Don't need to check len for zero
  -- *	or wraparound.  Update len to the amount written.  Returns an error
  -- *	or zero.
  -- * @get_coalesce: Get interrupt coalescing parameters.  Returns a negative
  -- *	error code or zero.
  -- * @set_coalesce: Set interrupt coalescing parameters.  Returns a negative
  -- *	error code or zero.
  -- * @get_ringparam: Report ring sizes
  -- * @set_ringparam: Set ring sizes.  Returns a negative error code or zero.
  -- * @get_pauseparam: Report pause parameters
  -- * @set_pauseparam: Set pause parameters.  Returns a negative error code
  -- *	or zero.
  -- * @self_test: Run specified self-tests
  -- * @get_strings: Return a set of strings that describe the requested objects
  -- * @set_phys_id: Identify the physical devices, e.g. by flashing an LED
  -- *	attached to it.  The implementation may update the indicator
  -- *	asynchronously or synchronously, but in either case it must return
  -- *	quickly.  It is initially called with the argument %ETHTOOL_ID_ACTIVE,
  -- *	and must either activate asynchronous updates and return zero, return
  -- *	a negative error or return a positive frequency for synchronous
  -- *	indication (e.g. 1 for one on/off cycle per second).  If it returns
  -- *	a frequency then it will be called again at intervals with the
  -- *	argument %ETHTOOL_ID_ON or %ETHTOOL_ID_OFF and should set the state of
  -- *	the indicator accordingly.  Finally, it is called with the argument
  -- *	%ETHTOOL_ID_INACTIVE and must deactivate the indicator.  Returns a
  -- *	negative error code or zero.
  -- * @get_ethtool_stats: Return extended statistics about the device.
  -- *	This is only useful if the device maintains statistics not
  -- *	included in &struct rtnl_link_stats64.
  -- * @begin: Function to be called before any other operation.  Returns a
  -- *	negative error code or zero.
  -- * @complete: Function to be called after any other operation except
  -- *	@begin.  Will be called even if the other operation failed.
  -- * @get_priv_flags: Report driver-specific feature flags.
  -- * @set_priv_flags: Set driver-specific feature flags.  Returns a negative
  -- *	error code or zero.
  -- * @get_sset_count: Get number of strings that @get_strings will write.
  -- * @get_rxnfc: Get RX flow classification rules.  Returns a negative
  -- *	error code or zero.
  -- * @set_rxnfc: Set RX flow classification rules.  Returns a negative
  -- *	error code or zero.
  -- * @flash_device: Write a firmware image to device's flash memory.
  -- *	Returns a negative error code or zero.
  -- * @reset: Reset (part of) the device, as specified by a bitmask of
  -- *	flags from &enum ethtool_reset_flags.  Returns a negative
  -- *	error code or zero.
  -- * @get_rxfh_key_size: Get the size of the RX flow hash key.
  -- *	Returns zero if not supported for this specific device.
  -- * @get_rxfh_indir_size: Get the size of the RX flow hash indirection table.
  -- *	Returns zero if not supported for this specific device.
  -- * @get_rxfh: Get the contents of the RX flow hash indirection table and hash
  -- *	key.
  -- *	Will only be called if one or both of @get_rxfh_indir_size and
  -- *	@get_rxfh_key_size are implemented and return non-zero.
  -- *	Returns a negative error code or zero.
  -- * @set_rxfh: Set the contents of the RX flow hash indirection table and/or
  -- *	hash key.  In case only the indirection table or hash key is to be
  -- *	changed, the other argument will be %NULL.
  -- *	Will only be called if one or both of @get_rxfh_indir_size and
  -- *	@get_rxfh_key_size are implemented and return non-zero.
  -- *	Returns a negative error code or zero.
  -- * @get_channels: Get number of channels.
  -- * @set_channels: Set number of channels.  Returns a negative error code or
  -- *	zero.
  -- * @get_dump_flag: Get dump flag indicating current dump length, version,
  -- * 		   and flag of the device.
  -- * @get_dump_data: Get dump data.
  -- * @set_dump: Set dump specific flags to the device.
  -- * @get_ts_info: Get the time stamping and PTP hardware clock capabilities.
  -- *	Drivers supporting transmit time stamps in software should set this to
  -- *	ethtool_op_get_ts_info().
  -- * @get_module_info: Get the size and type of the eeprom contained within
  -- *	a plug-in module.
  -- * @get_module_eeprom: Get the eeprom information from the plug-in module
  -- * @get_eee: Get Energy-Efficient (EEE) supported and status.
  -- * @set_eee: Set EEE status (enable/disable) as well as LPI timers.
  -- *
  -- * All operations are optional (i.e. the function pointer may be set
  -- * to %NULL) and callers must take this into account.  Callers must
  -- * hold the RTNL lock.
  -- *
  -- * See the structures used by these operations for further documentation.
  -- * Note that for all operations using a structure ending with a zero-
  -- * length array, the array is allocated separately in the kernel and
  -- * is passed to the driver as an additional parameter.
  -- *
  -- * See &struct net_device and &struct net_device_ops for documentation
  -- * of the generic netdev features interface.
  --  

   type ethtool_ops is record
      get_settings : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_cmd) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:201
      set_settings : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_cmd) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:202
      get_drvinfo : access procedure (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_drvinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:203
      get_regs_len : access function (arg1 : access linux_netdevice_h.net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:204
      get_regs : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access uapi_linux_ethtool_h.ethtool_regs;
            arg3 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:205
      get_wol : access procedure (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_wolinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:206
      set_wol : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_wolinfo) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:207
      get_msglevel : access function (arg1 : access linux_netdevice_h.net_device) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:208
      set_msglevel : access procedure (arg1 : access linux_netdevice_h.net_device; arg2 : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:209
      nway_reset : access function (arg1 : access linux_netdevice_h.net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:210
      get_link : access function (arg1 : access linux_netdevice_h.net_device) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:211
      get_eeprom_len : access function (arg1 : access linux_netdevice_h.net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:212
      get_eeprom : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access uapi_linux_ethtool_h.ethtool_eeprom;
            arg3 : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:214
      set_eeprom : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access uapi_linux_ethtool_h.ethtool_eeprom;
            arg3 : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:216
      get_coalesce : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_coalesce) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:217
      set_coalesce : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_coalesce) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:218
      get_ringparam : access procedure (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_ringparam);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:220
      set_ringparam : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_ringparam) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:222
      get_pauseparam : access procedure (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_pauseparam);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:224
      set_pauseparam : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_pauseparam) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:226
      self_test : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access uapi_linux_ethtool_h.ethtool_test;
            arg3 : access asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:227
      get_strings : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : asm_generic_int_ll64_h.u32;
            arg3 : access asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:228
      set_phys_id : access function (arg1 : access linux_netdevice_h.net_device; arg2 : ethtool_phys_id_state) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:229
      get_ethtool_stats : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access uapi_linux_ethtool_h.ethtool_stats;
            arg3 : access asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:231
      c_begin : access function (arg1 : access linux_netdevice_h.net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:232
      complete : access procedure (arg1 : access linux_netdevice_h.net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:233
      get_priv_flags : access function (arg1 : access linux_netdevice_h.net_device) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:234
      set_priv_flags : access function (arg1 : access linux_netdevice_h.net_device; arg2 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:235
      get_sset_count : access function (arg1 : access linux_netdevice_h.net_device; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:236
      get_rxnfc : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access uapi_linux_ethtool_h.ethtool_rxnfc;
            arg3 : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:238
      set_rxnfc : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_rxnfc) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:239
      flash_device : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_flash) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:240
      reset : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:241
      get_rxfh_key_size : access function (arg1 : access linux_netdevice_h.net_device) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:242
      get_rxfh_indir_size : access function (arg1 : access linux_netdevice_h.net_device) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:243
      get_rxfh : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access asm_generic_int_ll64_h.u32;
            arg3 : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:244
      set_rxfh : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access asm_generic_int_ll64_h.u32;
            arg3 : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:246
      get_channels : access procedure (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_channels);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:247
      set_channels : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_channels) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:248
      get_dump_flag : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_dump) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:249
      get_dump_data : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access uapi_linux_ethtool_h.ethtool_dump;
            arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:251
      set_dump : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_dump) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:252
      get_ts_info : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_ts_info) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:253
      get_module_info : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_modinfo) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:255
      get_module_eeprom : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access uapi_linux_ethtool_h.ethtool_eeprom;
            arg3 : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:257
      get_eee : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_eee) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:258
      set_eee : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_ethtool_h.ethtool_eee) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:259
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ethtool.h:200

end linux_ethtool_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with stdint_h;
with x86_64_linux_gnu_sys_types_h;
with System;
with stddef_h;

package ecrt_h is


   ECRT_VER_MAJOR : constant := 1;  --  /home/jan/ethercat.work/master/../include/ecrt.h:139

   ECRT_VER_MINOR : constant := 5;  --  /home/jan/ethercat.work/master/../include/ecrt.h:143
   --  arg-macro: function ECRT_VERSION (a, b)
   --    return ((a) << 8) + (b);
   --  unsupported macro: ECRT_VERSION_MAGIC ECRT_VERSION(ECRT_VER_MAJOR, ECRT_VER_MINOR)
   --  unsupported macro: EC_END ~0U

   EC_MAX_SYNC_MANAGERS : constant := 16;  --  /home/jan/ethercat.work/master/../include/ecrt.h:200

   EC_MAX_STRING_LENGTH : constant := 64;  --  /home/jan/ethercat.work/master/../include/ecrt.h:206

   EC_MAX_PORTS : constant := 4;  --  /home/jan/ethercat.work/master/../include/ecrt.h:209
   --  arg-macro: function EC_TIMEVAL2NANO (TV)
   --    return ((TV).tv_sec - 946684800) * 1000000000 + (TV).tv_usec * 1000;

   EC_COE_EMERGENCY_MSG_SIZE : constant := 8;  --  /home/jan/ethercat.work/master/../include/ecrt.h:226
   --  arg-macro: function EC_READ_BIT (DATA, POS)
   --    return (*((uint8_t *) (DATA)) >> (POS)) and 16#01#;
   --  arg-macro: procedure EC_WRITE_BIT (DATA, POS, VAL)do { if (VAL) *((uint8_t *) (DATA)) |= (2 ** (POS)); else *((uint8_t *) (DATA)) &= ~(2 ** (POS)); } while (0)
   --    do { if (VAL) *((uint8_t *) (DATA)) |= (2 ** (POS)); else *((uint8_t *) (DATA)) &= ~(2 ** (POS)); } while (0)
   --  arg-macro: procedure le16_to_cpu (x)
   --    x
   --  arg-macro: procedure le32_to_cpu (x)
   --    x
   --  arg-macro: procedure le64_to_cpu (x)
   --    x
   --  arg-macro: procedure cpu_to_le16 (x)
   --    x
   --  arg-macro: procedure cpu_to_le32 (x)
   --    x
   --  arg-macro: procedure cpu_to_le64 (x)
   --    x
   --  arg-macro: procedure le16_to_cpup (x)
   --    le16_to_cpu(*((uint16_t *)(x)))
   --  arg-macro: procedure le32_to_cpup (x)
   --    le32_to_cpu(*((uint32_t *)(x)))
   --  arg-macro: procedure le64_to_cpup (x)
   --    le64_to_cpu(*((uint64_t *)(x)))
   --  arg-macro: function EC_READ_U8 (DATA)
   --    return (uint8_t) *((uint8_t *) (DATA));
   --  arg-macro: function EC_READ_S8 (DATA)
   --    return (int8_t) *((uint8_t *) (DATA));
   --  arg-macro: function EC_READ_U16 (DATA)
   --    return (uint16_t) le16_to_cpup((void *) (DATA));
   --  arg-macro: function EC_READ_S16 (DATA)
   --    return (int16_t) le16_to_cpup((void *) (DATA));
   --  arg-macro: function EC_READ_U32 (DATA)
   --    return (uint32_t) le32_to_cpup((void *) (DATA));
   --  arg-macro: function EC_READ_S32 (DATA)
   --    return (int32_t) le32_to_cpup((void *) (DATA));
   --  arg-macro: function EC_READ_U64 (DATA)
   --    return (uint64_t) le64_to_cpup((void *) (DATA));
   --  arg-macro: function EC_READ_S64 (DATA)
   --    return (int64_t) le64_to_cpup((void *) (DATA));
   --  arg-macro: procedure EC_WRITE_U8 (DATA, VAL)
   --    do { *((uint8_t *)(DATA)) := ((uint8_t) (VAL)); } while (0)
   --  arg-macro: procedure EC_WRITE_S8 (DATA, VAL)
   --    EC_WRITE_U8(DATA, VAL)
   --  arg-macro: procedure EC_WRITE_U16 (DATA, VAL)
   --    do { *((uint16_t *) (DATA)) := cpu_to_le16((uint16_t) (VAL)); } while (0)
   --  arg-macro: procedure EC_WRITE_S16 (DATA, VAL)
   --    EC_WRITE_U16(DATA, VAL)
   --  arg-macro: procedure EC_WRITE_U32 (DATA, VAL)
   --    do { *((uint32_t *) (DATA)) := cpu_to_le32((uint32_t) (VAL)); } while (0)
   --  arg-macro: procedure EC_WRITE_S32 (DATA, VAL)
   --    EC_WRITE_U32(DATA, VAL)
   --  arg-macro: procedure EC_WRITE_U64 (DATA, VAL)
   --    do { *((uint64_t *) (DATA)) := cpu_to_le64((uint64_t) (VAL)); } while (0)
   --  arg-macro: procedure EC_WRITE_S64 (DATA, VAL)
   --    EC_WRITE_U64(DATA, VAL)

  --*****************************************************************************
  -- *
  -- *  $Id$
  -- *
  -- *  Copyright (C) 2006-2012  Florian Pose, Ingenieurgemeinschaft IgH
  -- *
  -- *  This file is part of the IgH EtherCAT master userspace library.
  -- *
  -- *  The IgH EtherCAT master userspace library is free software; you can
  -- *  redistribute it and/or modify it under the terms of the GNU Lesser General
  -- *  Public License as published by the Free Software Foundation; version 2.1
  -- *  of the License.
  -- *
  -- *  The IgH EtherCAT master userspace library is distributed in the hope that
  -- *  it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  -- *  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- *  GNU Lesser General Public License for more details.
  -- *
  -- *  You should have received a copy of the GNU Lesser General Public License
  -- *  along with the IgH EtherCAT master userspace library. If not, see
  -- *  <http://www.gnu.org/licenses/>.
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
  -- * EtherCAT master application interface.
  -- *
  -- * \defgroup ApplicationInterface EtherCAT Application Interface
  -- *
  -- * EtherCAT interface for realtime applications. This interface is designed
  -- * for realtime modules that want to use EtherCAT. There are functions to
  -- * request a master, to map process data, to communicate with slaves via CoE
  -- * and to configure and activate the bus.
  -- *
  -- * Changes in version 1.5.2:
  -- *
  -- * - Added redundancy_active flag to ec_domain_state_t.
  -- * - Added ecrt_master_link_state() method and ec_master_link_state_t to query
  -- *   the state of a redundant link.
  -- * - Added the EC_HAVE_REDUNDANCY define, to check, if the interface contains
  -- *   redundancy features.
  -- * - Added ecrt_sdo_request_index() to change SDO index and subindex after
  -- *   handler creation.
  -- * - Added interface for retrieving CoE emergency messages, i. e.
  -- *   ecrt_slave_config_emerg_size(), ecrt_slave_config_emerg_pop(),
  -- *   ecrt_slave_config_emerg_clear(), ecrt_slave_config_emerg_overruns() and
  -- *   the defines EC_HAVE_EMERGENCY and EC_COE_EMERGENCY_MSG_SIZE.
  -- * - Added interface for direct EtherCAT register access: Added data type
  -- *   ec_reg_request_t and methods ecrt_slave_config_create_reg_request(),
  -- *   ecrt_reg_request_data(), ecrt_reg_request_state(),
  -- *   ecrt_reg_request_write(), ecrt_reg_request_read() and the feature flag
  -- *   EC_HAVE_REG_ACCESS.
  -- * - Added method to select the reference clock,
  -- *   ecrt_master_select_reference_clock() and the feature flag
  -- *   EC_HAVE_SELECT_REF_CLOCK to check, if the method is available.
  -- * - Added method to get the reference clock time,
  -- *   ecrt_master_reference_clock_time() and the feature flag
  -- *   EC_HAVE_REF_CLOCK_TIME to have the possibility to synchronize the master
  -- *   clock to the reference clock.
  -- * - Changed the data types of the shift times in ecrt_slave_config_dc() to
  -- *   int32_t to correctly display negative shift times.
  -- * - Added ecrt_slave_config_reg_pdo_entry_pos() and the feature flag
  -- *   EC_HAVE_REG_BY_POS for registering PDO entries with non-unique indices
  -- *   via their positions in the mapping.
  -- *
  -- * Changes in version 1.5:
  -- *
  -- * - Added the distributed clocks feature and the respective method
  -- *   ecrt_slave_config_dc() to configure a slave for cyclic operation, and
  -- *   ecrt_master_application_time(), ecrt_master_sync_reference_clock() and
  -- *   ecrt_master_sync_slave_clocks() for offset and drift compensation. The
  -- *   EC_TIMEVAL2NANO() macro can be used for epoch time conversion, while the
  -- *   ecrt_master_sync_monitor_queue() and ecrt_master_sync_monitor_process()
  -- *   methods can be used to monitor the synchrony.
  -- * - Improved the callback mechanism. ecrt_master_callbacks() now takes two
  -- *   callback functions for sending and receiving datagrams.
  -- *   ecrt_master_send_ext() is used to execute the sending of non-application
  -- *   datagrams.
  -- * - Added watchdog configuration (method ecrt_slave_config_watchdog(),
  -- *   #ec_watchdog_mode_t, \a watchdog_mode parameter in ec_sync_info_t and
  -- *   ecrt_slave_config_sync_manager()).
  -- * - Added ecrt_slave_config_complete_sdo() method to download an SDO during
  -- *   configuration via CompleteAccess.
  -- * - Added ecrt_master_deactivate() to remove the bus configuration.
  -- * - Added ecrt_open_master() and ecrt_master_reserve() separation for
  -- *   userspace.
  -- * - Added bus information interface (methods ecrt_master(),
  -- *   ecrt_master_get_slave(), ecrt_master_get_sync_manager(),
  -- *   ecrt_master_get_pdo() and ecrt_master_get_pdo_entry()) to get information
  -- *   about the currently connected slaves and the PDO entries provided.
  -- * - Added ecrt_master_sdo_download(), ecrt_master_sdo_download_complete() and
  -- *   ecrt_master_sdo_upload() methods to let an application transfer SDOs
  -- *   before activating the master.
  -- * - Changed the meaning of the negative return values of
  -- *   ecrt_slave_config_reg_pdo_entry() and ecrt_slave_config_sdo*().
  -- * - Implemented the Vendor-specific over EtherCAT mailbox protocol. See
  -- *   ecrt_slave_config_create_voe_handler().
  -- * - Renamed ec_sdo_request_state_t to #ec_request_state_t, because it is also
  -- *   used by VoE handlers.
  -- * - Removed 'const' from argument of ecrt_sdo_request_state(), because the
  -- *   userspace library has to modify object internals.
  -- * - Added 64-bit data access macros.
  -- * - Added ecrt_slave_config_idn() method for storing SoE IDN configurations,
  -- *   and ecrt_master_read_idn() and ecrt_master_write_idn() to read/write IDNs
  -- *   ad-hoc via the user-space library.
  -- * - Added ecrt_master_reset() to initiate retrying to configure slaves.
  -- *
  -- * @{
  --  

  --*************************************************************************** 
  -- for size_t 
  -- for struct timeval 
  --*****************************************************************************
  -- * Global definitions
  -- **************************************************************************** 

  --* EtherCAT realtime interface major version number.
  --  

  --* EtherCAT realtime interface minor version number.
  --  

  --* EtherCAT realtime interface version word generator.
  --  

  --* EtherCAT realtime interface version word.
  --  

  --*****************************************************************************
  -- * Feature flags
  -- **************************************************************************** 

  --* Defined, if the redundancy features are available.
  -- *
  -- * I. e. if the \a redundancy_active flag in ec_domain_state_t and the
  -- * ecrt_master_link_state() method are available.
  --  

  --* Defined, if the CoE emergency ring feature is available.
  -- *
  -- * I. e. if the ecrt_slave_config_emerg_*() methods are available.
  --  

  --* Defined, if the register access interface is available.
  -- *
  -- * I. e. if the methods ecrt_slave_config_create_reg_request(),
  -- * ecrt_reg_request_data(), ecrt_reg_request_state(), ecrt_reg_request_write()
  -- * and ecrt_reg_request_read() are available.
  --  

  --* Defined if the method ecrt_master_select_reference_clock() is available.
  --  

  --* Defined if the method ecrt_master_reference_clock_time() is available.
  --  

  --* Defined if the method ecrt_slave_config_reg_pdo_entry_pos() is available.
  --  

  --*************************************************************************** 
  --* End of list marker.
  -- *
  -- * This can be used with ecrt_slave_config_pdos().
  --  

  --* Maximum number of sync managers per slave.
  --  

  --* Maximum string length.
  -- *
  -- * Used in ec_slave_info_t.
  --  

  --* Maximum number of slave ports.  
  --* Timeval to nanoseconds conversion.
  -- *
  -- * This macro converts a Unix epoch time to EtherCAT DC time.
  -- *
  -- * \see void ecrt_master_application_time()
  -- *
  -- * \param TV struct timeval containing epoch time.
  --  

  --* Size of a CoE emergency message in byte.
  -- *
  -- * \see ecrt_slave_config_emerg_pop().
  --  

  --*****************************************************************************
  -- * Data types
  -- **************************************************************************** 

   --  skipped empty struct ec_master

  --*< \see ec_master  
   --  skipped empty struct ec_master_t

   --  skipped empty struct ec_slave_config

  --*< \see ec_slave_config  
   --  skipped empty struct ec_slave_config_t

   --  skipped empty struct ec_domain

  --*< \see ec_domain  
   --  skipped empty struct ec_domain_t

   --  skipped empty struct ec_sdo_request

  --*< \see ec_sdo_request.  
   --  skipped empty struct ec_sdo_request_t

   --  skipped empty struct ec_voe_handler

  --*< \see ec_voe_handler.  
   --  skipped empty struct ec_voe_handler_t

   --  skipped empty struct ec_reg_request

  --*< \see ec_sdo_request.  
   --  skipped empty struct ec_reg_request_t

  --*************************************************************************** 
  --* Master state.
  -- *
  -- * This is used for the output parameter of ecrt_master_state().
  -- *
  -- * \see ecrt_master_state().
  --  

  --*< Sum of responding slaves on all
  --                                      Ethernet devices.  

   type ec_master_state_t is record
      slaves_responding : aliased unsigned;  -- /home/jan/ethercat.work/master/../include/ecrt.h:259
      al_states : Extensions.Unsigned_4;  -- /home/jan/ethercat.work/master/../include/ecrt.h:261
      link_up : Extensions.Unsigned_1;  -- /home/jan/ethercat.work/master/../include/ecrt.h:270
   end record;
   pragma Convention (C_Pass_By_Copy, ec_master_state_t);
   pragma Pack (ec_master_state_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:272

   --  skipped anonymous struct anon_19

  --*< Application-layer states of all slaves.
  --                                  The states are coded in the lower 4 bits.
  --                                  If a bit is set, it means that at least one
  --                                  slave in the bus is in the corresponding
  --                                  state:
  --                                  - Bit 0: \a INIT
  --                                  - Bit 1: \a PREOP
  --                                  - Bit 2: \a SAFEOP
  --                                  - Bit 3: \a OP  

  --*< \a true, if at least one Ethernet link is
  --                                up.  

  --*************************************************************************** 
  --* Redundant link state.
  -- *
  -- * This is used for the output parameter of ecrt_master_link_state().
  -- *
  -- * \see ecrt_master_link_state().
  --  

  --*< Sum of responding slaves on the given
  --                                      link.  

   type ec_master_link_state_t is record
      slaves_responding : aliased unsigned;  -- /home/jan/ethercat.work/master/../include/ecrt.h:283
      al_states : Extensions.Unsigned_4;  -- /home/jan/ethercat.work/master/../include/ecrt.h:285
      link_up : Extensions.Unsigned_1;  -- /home/jan/ethercat.work/master/../include/ecrt.h:294
   end record;
   pragma Convention (C_Pass_By_Copy, ec_master_link_state_t);
   pragma Pack (ec_master_link_state_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:296

   --  skipped anonymous struct anon_20

  --*< Application-layer states of the slaves on
  --                                  the given link.  The states are coded in the
  --                                  lower 4 bits.  If a bit is set, it means
  --                                  that at least one slave in the bus is in the
  --                                  corresponding state:
  --                                  - Bit 0: \a INIT
  --                                  - Bit 1: \a PREOP
  --                                  - Bit 2: \a SAFEOP
  --                                  - Bit 3: \a OP  

  --*< \a true, if the given Ethernet link is up.
  --                                

  --*************************************************************************** 
  --* Slave configuration state.
  -- *
  -- * This is used as an output parameter of ecrt_slave_config_state().
  -- *
  -- * \see ecrt_slave_config_state().
  --  

  --*< The slave is online.  
   type ec_slave_config_state_t is record
      online : Extensions.Unsigned_1;  -- /home/jan/ethercat.work/master/../include/ecrt.h:307
      operational : Extensions.Unsigned_1;  -- /home/jan/ethercat.work/master/../include/ecrt.h:308
      al_state : Extensions.Unsigned_4;  -- /home/jan/ethercat.work/master/../include/ecrt.h:310
   end record;
   pragma Convention (C_Pass_By_Copy, ec_slave_config_state_t);
   pragma Pack (ec_slave_config_state_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:318

   --  skipped anonymous struct anon_21

  --*< The slave was brought into \a OP state
  --                                    using the specified configuration.  

  --*< The application-layer state of the slave.
  --                                 - 1: \a INIT
  --                                 - 2: \a PREOP
  --                                 - 4: \a SAFEOP
  --                                 - 8: \a OP
  --                                 Note that each state is coded in a different
  --                                 bit!  

  --*************************************************************************** 
  --* Master information.
  -- *
  -- * This is used as an output parameter of ecrt_master().
  -- *
  -- * \see ecrt_master().
  --  

  --*< Number of slaves in the bus.  
   type ec_master_info_t is record
      slave_count : aliased unsigned;  -- /home/jan/ethercat.work/master/../include/ecrt.h:329
      link_up : Extensions.Unsigned_1;  -- /home/jan/ethercat.work/master/../include/ecrt.h:330
      scan_busy : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:331
      app_time : aliased stdint_h.uint64_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:332
   end record;
   pragma Convention (C_Pass_By_Copy, ec_master_info_t);
   pragma Pack (ec_master_info_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:333

   --  skipped anonymous struct anon_22

  --*< \a true, if the network link is up.  
  --*< \a true, while the master is scanning the bus  
  --*< Application time.  
  --*************************************************************************** 
  --* EtherCAT slave port descriptor.
  --  

  --*< Port is not implemented.  
  --*< Port is not configured.  
  --*< Port is an E-Bus.  
  --*< Port is a MII.  
   type ec_slave_port_desc_t is 
     (EC_PORT_NOT_IMPLEMENTED,
      EC_PORT_NOT_CONFIGURED,
      EC_PORT_EBUS,
      EC_PORT_MII);
   pragma Convention (C, ec_slave_port_desc_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:344

  --*************************************************************************** 
  --* EtherCAT slave port information.
  --  

  --*< Link detected.  
   type ec_slave_port_link_t is record
      link_up : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:351
      loop_closed : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:352
      signal_detected : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:353
   end record;
   pragma Convention (C_Pass_By_Copy, ec_slave_port_link_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:354

   --  skipped anonymous struct anon_24

  --*< Loop closed.  
  --*< Detected signal on RX port.  
  --*************************************************************************** 
  --* Slave information.
  -- *
  -- * This is used as an output parameter of ecrt_master_get_slave().
  -- *
  -- * \see ecrt_master_get_slave().
  --  

  --*< Offset of the slave in the ring.  
   type ec_slave_info_t_ports_array is array (0 .. 3) of aliased anon_26;
   subtype ec_slave_info_t_name_array is Interfaces.C.char_array (0 .. 63);
   type ec_slave_info_t;
   type anon_26 is record
      desc : aliased ec_slave_port_desc_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:373
      link : aliased ec_slave_port_link_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:374
      receive_time : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:375
      next_slave : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:377
      delay_to_next_dc : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:379
   end record;
   pragma Convention (C_Pass_By_Copy, anon_26);
   type ec_slave_info_t is record
      position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:365
      vendor_id : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:366
      product_code : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:367
      revision_number : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:368
      serial_number : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:369
      alias : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:370
      current_on_ebus : aliased x86_64_linux_gnu_sys_types_h.int16_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:371
      ports : aliased ec_slave_info_t_ports_array;  -- /home/jan/ethercat.work/master/../include/ecrt.h:380
      al_state : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:381
      error_flag : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:382
      sync_count : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:383
      sdo_count : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:384
      name : aliased ec_slave_info_t_name_array;  -- /home/jan/ethercat.work/master/../include/ecrt.h:385
   end record;
   pragma Convention (C_Pass_By_Copy, ec_slave_info_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:386

   --  skipped anonymous struct anon_25

  --*< Vendor-ID stored on the slave.  
  --*< Product-Code stored on the slave.  
  --*< Revision-Number stored on the slave.  
  --*< Serial-Number stored on the slave.  
  --*< The slaves alias if not equal to 0.  
  --*< Used current in mA.  
  --*< Physical port type.  
  --*< Port link state.  
  --*< Receive time on DC transmission delay
  --                                 measurement.  

  --*< Ring position of next DC slave on that
  --                               port.   

  --*< Delay [ns] to next DC slave.  
  --*< Port information.  
  --*< Current state of the slave.  
  --*< Error flag for that slave.  
  --*< Number of sync managers.  
  --*< Number of SDOs.  
  --*< Name of the slave.  
  --*************************************************************************** 
  --* Domain working counter interpretation.
  -- *
  -- * This is used in ec_domain_state_t.
  --  

  --*< No registered process data were exchanged.  
  --*< Some of the registered process data were
  --                        exchanged.  

  --*< All registered process data were exchanged.  
   type ec_wc_state_t is 
     (EC_WC_ZERO,
      EC_WC_INCOMPLETE,
      EC_WC_COMPLETE);
   pragma Convention (C, ec_wc_state_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:399

  --*************************************************************************** 
  --* Domain state.
  -- *
  -- * This is used for the output parameter of ecrt_domain_state().
  --  

  --*< Value of the last working counter.  
   type ec_domain_state_t is record
      working_counter : aliased unsigned;  -- /home/jan/ethercat.work/master/../include/ecrt.h:408
      wc_state : aliased ec_wc_state_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:409
      redundancy_active : aliased unsigned;  -- /home/jan/ethercat.work/master/../include/ecrt.h:410
   end record;
   pragma Convention (C_Pass_By_Copy, ec_domain_state_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:411

   --  skipped anonymous struct anon_28

  --*< Working counter interpretation.  
  --*< Redundant link is in use.  
  --*************************************************************************** 
  --* Direction type for PDO assignment functions.
  --  

  --*< Invalid direction. Do not use this value.  
  --*< Values written by the master.  
  --*< Values read by the master.  
  --*< Number of directions. For internal use only.  
   type ec_direction_t is 
     (EC_DIR_INVALID,
      EC_DIR_OUTPUT,
      EC_DIR_INPUT,
      EC_DIR_COUNT);
   pragma Convention (C, ec_direction_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:422

  --*************************************************************************** 
  --* Watchdog mode for sync manager configuration.
  -- *
  -- * Used to specify, if a sync manager's watchdog is to be enabled.
  --  

  --*< Use the default setting of the sync manager.  
  --*< Enable the watchdog.  
  --*< Disable the watchdog.  
   type ec_watchdog_mode_t is 
     (EC_WD_DEFAULT,
      EC_WD_ENABLE,
      EC_WD_DISABLE);
   pragma Convention (C, ec_watchdog_mode_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:434

  --*************************************************************************** 
  --* PDO entry configuration information.
  -- *
  -- * This is the data type of the \a entries field in ec_pdo_info_t.
  -- *
  -- * \see ecrt_slave_config_pdos().
  --  

  --*< PDO entry index.  
   type ec_pdo_entry_info_t is record
      index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:445
      subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:446
      bit_length : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:447
   end record;
   pragma Convention (C_Pass_By_Copy, ec_pdo_entry_info_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:448

   --  skipped anonymous struct anon_31

  --*< PDO entry subindex.  
  --*< Size of the PDO entry in bit.  
  --*************************************************************************** 
  --* PDO configuration information.
  -- *
  -- * This is the data type of the \a pdos field in ec_sync_info_t.
  -- *
  -- * \see ecrt_slave_config_pdos().
  --  

  --*< PDO index.  
   type ec_pdo_info_t is record
      index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:459
      n_entries : aliased unsigned;  -- /home/jan/ethercat.work/master/../include/ecrt.h:460
      entries : access ec_pdo_entry_info_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:464
   end record;
   pragma Convention (C_Pass_By_Copy, ec_pdo_info_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:467

   --  skipped anonymous struct anon_32

  --*< Number of PDO entries in \a entries to map.
  --                              Zero means, that the default mapping shall be
  --                              used (this can only be done if the slave is
  --                              present at bus configuration time).  

  --*< Array of PDO entries to map. Can either
  --                                    be \a NULL, or must contain at
  --                                    least \a n_entries values.  

  --*************************************************************************** 
  --* Sync manager configuration information.
  -- *
  -- * This can be use to configure multiple sync managers including the PDO
  -- * assignment and PDO mapping. It is used as an input parameter type in
  -- * ecrt_slave_config_pdos().
  --  

  --*< Sync manager index. Must be less
  --                     than #EC_MAX_SYNC_MANAGERS for a valid sync manager,
  --                     but can also be \a 0xff to mark the end of the list.  

   type ec_sync_info_t is record
      index : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:478
      dir : aliased ec_direction_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:481
      n_pdos : aliased unsigned;  -- /home/jan/ethercat.work/master/../include/ecrt.h:482
      pdos : access ec_pdo_info_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:483
      watchdog_mode : aliased ec_watchdog_mode_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:485
   end record;
   pragma Convention (C_Pass_By_Copy, ec_sync_info_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:486

   --  skipped anonymous struct anon_33

  --*< Sync manager direction.  
  --*< Number of PDOs in \a pdos.  
  --*< Array with PDOs to assign. This must contain
  --                            at least \a n_pdos PDOs.  

  --*< Watchdog mode.  
  --*************************************************************************** 
  --* List record type for PDO entry mass-registration.
  -- *
  -- * This type is used for the array parameter of the
  -- * ecrt_domain_reg_pdo_entry_list()
  --  

  --*< Slave alias address.  
   type ec_pdo_entry_reg_t is record
      alias : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:496
      position : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:497
      vendor_id : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:498
      product_code : aliased stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:499
      index : aliased stdint_h.uint16_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:500
      subindex : aliased stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:501
      offset : access unsigned;  -- /home/jan/ethercat.work/master/../include/ecrt.h:502
      bit_position : access unsigned;  -- /home/jan/ethercat.work/master/../include/ecrt.h:504
   end record;
   pragma Convention (C_Pass_By_Copy, ec_pdo_entry_reg_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:508

   --  skipped anonymous struct anon_34

  --*< Slave position.  
  --*< Slave vendor ID.  
  --*< Slave product code.  
  --*< PDO entry index.  
  --*< PDO entry subindex.  
  --*< Pointer to a variable to store the PDO entry's
  --                       (byte-)offset in the process data.  

  --*< Pointer to a variable to store a bit
  --                                  position (0-7) within the \a offset. Can be
  --                                  NULL, in which case an error is raised if the
  --                                  PDO entry does not byte-align.  

  --*************************************************************************** 
  --* Request state.
  -- *
  -- * This is used as return type for ecrt_sdo_request_state() and
  -- * ecrt_voe_handler_state().
  --  

  --*< Not requested.  
  --*< Request is being processed.  
  --*< Request was processed successfully.  
  --*< Request processing failed.  
   type ec_request_state_t is 
     (EC_REQUEST_UNUSED,
      EC_REQUEST_BUSY,
      EC_REQUEST_SUCCESS,
      EC_REQUEST_ERROR);
   pragma Convention (C, ec_request_state_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:522

  --*************************************************************************** 
  --* Application-layer state.
  --  

  --*< Init.  
  --*< Pre-operational.  
  --*< Safe-operational.  
  --*< Operational.  
   subtype ec_al_state_t is unsigned;
   EC_AL_STATE_INIT : constant ec_al_state_t := 1;
   EC_AL_STATE_PREOP : constant ec_al_state_t := 2;
   EC_AL_STATE_SAFEOP : constant ec_al_state_t := 4;
   EC_AL_STATE_OP : constant ec_al_state_t := 8;  -- /home/jan/ethercat.work/master/../include/ecrt.h:533

  --*****************************************************************************
  -- * Global functions
  -- **************************************************************************** 

  --* Returns the version magic of the realtime interface.
  -- *
  -- * \return Value of ECRT_VERSION_MAGIC() at EtherCAT master compile time.
  --  

   function ecrt_version_magic return unsigned;  -- /home/jan/ethercat.work/master/../include/ecrt.h:547
   pragma Import (C, ecrt_version_magic, "ecrt_version_magic");

  --* Requests an EtherCAT master for realtime operation.
  -- *
  -- * Before an application can access an EtherCAT master, it has to reserve one
  -- * for exclusive use.
  -- *
  -- * In userspace, this is a convenience function for ecrt_open_master() and
  -- * ecrt_master_reserve().
  -- *
  -- * This function has to be the first function an application has to call to
  -- * use EtherCAT. The function takes the index of the master as its argument.
  -- * The first master has index 0, the n-th master has index n - 1. The number
  -- * of masters has to be specified when loading the master module.
  -- *
  -- * \return Pointer to the reserved master, otherwise \a NULL.
  --  

   function ecrt_request_master (master_index : unsigned) return System.Address;  -- /home/jan/ethercat.work/master/../include/ecrt.h:564
   pragma Import (C, ecrt_request_master, "ecrt_request_master");

  --*< Index of the master to request.  
  --* Opens an EtherCAT master for userspace access.
  -- *
  -- * This function has to be the first function an application has to call to
  -- * use EtherCAT. The function takes the index of the master as its argument.
  -- * The first master has index 0, the n-th master has index n - 1. The number
  -- * of masters has to be specified when loading the master module.
  -- *
  -- * For convenience, the function ecrt_request_master() can be used.
  -- *
  -- * \return Pointer to the opened master, otherwise \a NULL.
  --  

   function ecrt_open_master (master_index : unsigned) return System.Address;  -- /home/jan/ethercat.work/master/../include/ecrt.h:581
   pragma Import (C, ecrt_open_master, "ecrt_open_master");

  --*< Index of the master to request.  
  --* Releases a requested EtherCAT master.
  -- *
  -- * After use, a master it has to be released to make it available for other
  -- * applications.
  -- *
  -- * This method frees all created data structures. It should not be called in
  -- * realtime context.
  -- *
  -- * If the master was activated, ecrt_master_deactivate() is called internally.
  --  

   procedure ecrt_release_master (master : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:597
   pragma Import (C, ecrt_release_master, "ecrt_release_master");

  --*< EtherCAT master  
  --*****************************************************************************
  -- * Master methods
  -- **************************************************************************** 

  --* Reserves an EtherCAT master for realtime operation.
  -- *
  -- * Before an application can use PDO/domain registration functions or SDO
  -- * request functions on the master, it has to reserve one for exclusive use.
  -- *
  -- * \return 0 in case of success, else < 0
  --  

   function ecrt_master_reserve (master : System.Address) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:614
   pragma Import (C, ecrt_master_reserve, "ecrt_master_reserve");

  --*< EtherCAT master  
  --* Sets the locking callbacks.
  -- *
  -- * For concurrent master access, i. e. if other instances than the application
  -- * want to send and receive datagrams on the bus, the application has to
  -- * provide a callback mechanism. This method takes two function pointers as
  -- * its parameters. Asynchronous master access (like EoE processing) is only
  -- * possible if the callbacks have been set.
  -- *
  -- * The task of the send callback (\a send_cb) is to decide, if the bus is
  -- * currently accessible and whether or not to call the ecrt_master_send_ext()
  -- * method.
  -- *
  -- * The task of the receive callback (\a receive_cb) is to decide, if a call to
  -- * ecrt_master_receive() is allowed and to execute it respectively.
  -- *
  -- * \attention This method has to be called before ecrt_master_activate().
  --  

  --*< EtherCAT master  
  --*< Datagram sending callback.  
  --*< Receive callback.  
  --*< Arbitrary pointer passed to the callback functions.
  --                        

  --* Creates a new process data domain.
  -- *
  -- * For process data exchange, at least one process data domain is needed.
  -- * This method creates a new process data domain and returns a pointer to the
  -- * new domain object. This object can be used for registering PDOs and
  -- * exchanging them in cyclic operation.
  -- *
  -- * This method allocates memory and should be called in non-realtime context
  -- * before ecrt_master_activate().
  -- *
  -- * \return Pointer to the new domain on success, else NULL.
  --  

   function ecrt_master_create_domain (master : System.Address) return System.Address;  -- /home/jan/ethercat.work/master/../include/ecrt.h:661
   pragma Import (C, ecrt_master_create_domain, "ecrt_master_create_domain");

  --*< EtherCAT master.  
  --* Obtains a slave configuration.
  -- *
  -- * Creates a slave configuration object for the given \a alias and \a position
  -- * tuple and returns it. If a configuration with the same \a alias and \a
  -- * position already exists, it will be re-used. In the latter case, the given
  -- * vendor ID and product code are compared to the stored ones. On mismatch, an
  -- * error message is raised and the function returns \a NULL.
  -- *
  -- * Slaves are addressed with the \a alias and \a position parameters.
  -- * - If \a alias is zero, \a position is interpreted as the desired slave's
  -- *   ring position.
  -- * - If \a alias is non-zero, it matches a slave with the given alias. In this
  -- *   case, \a position is interpreted as ring offset, starting from the
  -- *   aliased slave, so a position of zero means the aliased slave itself and a
  -- *   positive value matches the n-th slave behind the aliased one.
  -- *
  -- * If the slave with the given address is found during the bus configuration,
  -- * its vendor ID and product code are matched against the given value. On
  -- * mismatch, the slave is not configured and an error message is raised.
  -- *
  -- * If different slave configurations are pointing to the same slave during bus
  -- * configuration, a warning is raised and only the first configuration is
  -- * applied.
  -- *
  -- * This method allocates memory and should be called in non-realtime context
  -- * before ecrt_master_activate().
  -- *
  -- * \retval >0 Pointer to the slave configuration structure.
  -- * \retval NULL in the error case.
  --  

   function ecrt_master_slave_config
     (master : System.Address;
      alias : stdint_h.uint16_t;
      position : stdint_h.uint16_t;
      vendor_id : stdint_h.uint32_t;
      product_code : stdint_h.uint32_t) return System.Address;  -- /home/jan/ethercat.work/master/../include/ecrt.h:695
   pragma Import (C, ecrt_master_slave_config, "ecrt_master_slave_config");

  --*< EtherCAT master  
  --*< Slave alias.  
  --*< Slave position.  
  --*< Expected vendor ID.  
  --*< Expected product code.  
  --* Selects the reference clock for distributed clocks.
  -- *
  -- * If this method is not called for a certain master, or if the slave
  -- * configuration pointer is NULL, then the first slave with DC functionality
  -- * will provide the reference clock.
  -- *
  -- * \return 0 on success, otherwise negative error code.
  --  

   function ecrt_master_select_reference_clock (master : System.Address; sc : System.Address) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:711
   pragma Import (C, ecrt_master_select_reference_clock, "ecrt_master_select_reference_clock");

  --*< EtherCAT master.  
  --*< Slave config of the slave to use as the
  --                               * reference slave (or NULL).  

  --* Obtains master information.
  -- *
  -- * No memory is allocated on the heap in
  -- * this function.
  -- *
  -- * \attention The pointer to this structure must point to a valid variable.
  -- *
  -- * \return 0 in case of success, else < 0
  --  

   function ecrt_master (master : System.Address; master_info : access ec_master_info_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:726
   pragma Import (C, ecrt_master, "ecrt_master");

  --*< EtherCAT master  
  --*< Structure that will output the
  --                                        information  

  --* Obtains slave information.
  -- *
  -- * Tries to find the slave with the given ring position. The obtained
  -- * information is stored in a structure. No memory is allocated on the heap in
  -- * this function.
  -- *
  -- * \attention The pointer to this structure must point to a valid variable.
  -- *
  -- * \return 0 in case of success, else < 0
  --  

   function ecrt_master_get_slave
     (master : System.Address;
      slave_position : stdint_h.uint16_t;
      slave_info : access ec_slave_info_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:742
   pragma Import (C, ecrt_master_get_slave, "ecrt_master_get_slave");

  --*< EtherCAT master  
  --*< Slave position.  
  --*< Structure that will output the
  --                                      information  

  --* Returns the proposed configuration of a slave's sync manager.
  -- *
  -- * Fills a given ec_sync_info_t structure with the attributes of a sync
  -- * manager. The \a pdos field of the return value is left empty. Use
  -- * ecrt_master_get_pdo() to get the PDO information.
  -- *
  -- * \return zero on success, else non-zero
  --  

   function ecrt_master_get_sync_manager
     (master : System.Address;
      slave_position : stdint_h.uint16_t;
      sync_index : stdint_h.uint8_t;
      sync : access ec_sync_info_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:759
   pragma Import (C, ecrt_master_get_sync_manager, "ecrt_master_get_sync_manager");

  --*< EtherCAT master.  
  --*< Slave position.  
  --*< Sync manager index. Must be less
  --                                than #EC_MAX_SYNC_MANAGERS.  

  --*< Pointer to output structure.  
  --* Returns information about a currently assigned PDO.
  -- *
  -- * Fills a given ec_pdo_info_t structure with the attributes of a currently
  -- * assigned PDO of the given sync manager. The \a entries field of the return
  -- * value is left empty. Use ecrt_master_get_pdo_entry() to get the PDO
  -- * entry information.
  -- *
  -- * \retval zero on success, else non-zero
  --  

   function ecrt_master_get_pdo
     (master : System.Address;
      slave_position : stdint_h.uint16_t;
      sync_index : stdint_h.uint8_t;
      pos : stdint_h.uint16_t;
      pdo : access ec_pdo_info_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:776
   pragma Import (C, ecrt_master_get_pdo, "ecrt_master_get_pdo");

  --*< EtherCAT master.  
  --*< Slave position.  
  --*< Sync manager index. Must be less
  --                                 than #EC_MAX_SYNC_MANAGERS.  

  --*< Zero-based PDO position.  
  --*< Pointer to output structure.  
  --* Returns information about a currently mapped PDO entry.
  -- *
  -- * Fills a given ec_pdo_entry_info_t structure with the attributes of a
  -- * currently mapped PDO entry of the given PDO.
  -- *
  -- * \retval zero on success, else non-zero
  --  

   function ecrt_master_get_pdo_entry
     (master : System.Address;
      slave_position : stdint_h.uint16_t;
      sync_index : stdint_h.uint8_t;
      pdo_pos : stdint_h.uint16_t;
      entry_pos : stdint_h.uint16_t;
      c_entry : access ec_pdo_entry_info_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:792
   pragma Import (C, ecrt_master_get_pdo_entry, "ecrt_master_get_pdo_entry");

  --*< EtherCAT master.  
  --*< Slave position.  
  --*< Sync manager index. Must be less
  --                                 than #EC_MAX_SYNC_MANAGERS.  

  --*< Zero-based PDO position.  
  --*< Zero-based PDO entry position.  
  --*< Pointer to output structure.  
  --* Executes an SDO download request to write data to a slave.
  -- *
  -- * This request is processed by the master state machine. This method blocks,
  -- * until the request has been processed and may not be called in realtime
  -- * context.
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_master_sdo_download
     (master : System.Address;
      slave_position : stdint_h.uint16_t;
      index : stdint_h.uint16_t;
      subindex : stdint_h.uint8_t;
      data : access stdint_h.uint8_t;
      data_size : stddef_h.size_t;
      abort_code : access stdint_h.uint32_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:813
   pragma Import (C, ecrt_master_sdo_download, "ecrt_master_sdo_download");

  --*< EtherCAT master.  
  --*< Slave position.  
  --*< Index of the SDO.  
  --*< Subindex of the SDO.  
  --*< Data buffer to download.  
  --*< Size of the data buffer.  
  --*< Abort code of the SDO download.  
  --* Executes an SDO download request to write data to a slave via complete
  -- * access.
  -- *
  -- * This request is processed by the master state machine. This method blocks,
  -- * until the request has been processed and may not be called in realtime
  -- * context.
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_master_sdo_download_complete
     (master : System.Address;
      slave_position : stdint_h.uint16_t;
      index : stdint_h.uint16_t;
      data : access stdint_h.uint8_t;
      data_size : stddef_h.size_t;
      abort_code : access stdint_h.uint32_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:833
   pragma Import (C, ecrt_master_sdo_download_complete, "ecrt_master_sdo_download_complete");

  --*< EtherCAT master.  
  --*< Slave position.  
  --*< Index of the SDO.  
  --*< Data buffer to download.  
  --*< Size of the data buffer.  
  --*< Abort code of the SDO download.  
  --* Executes an SDO upload request to read data from a slave.
  -- *
  -- * This request is processed by the master state machine. This method blocks,
  -- * until the request has been processed and may not be called in realtime
  -- * context.
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_master_sdo_upload
     (master : System.Address;
      slave_position : stdint_h.uint16_t;
      index : stdint_h.uint16_t;
      subindex : stdint_h.uint8_t;
      target : access stdint_h.uint8_t;
      target_size : stddef_h.size_t;
      result_size : access stddef_h.size_t;
      abort_code : access stdint_h.uint32_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:851
   pragma Import (C, ecrt_master_sdo_upload, "ecrt_master_sdo_upload");

  --*< EtherCAT master.  
  --*< Slave position.  
  --*< Index of the SDO.  
  --*< Subindex of the SDO.  
  --*< Target buffer for the upload.  
  --*< Size of the target buffer.  
  --*< Uploaded data size.  
  --*< Abort code of the SDO upload.  
  --* Executes an SoE write request.
  -- *
  -- * Starts writing an IDN and blocks until the request was processed, or an
  -- * error occurred.
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_master_write_idn
     (master : System.Address;
      slave_position : stdint_h.uint16_t;
      drive_no : stdint_h.uint8_t;
      idn : stdint_h.uint16_t;
      data : access stdint_h.uint8_t;
      data_size : stddef_h.size_t;
      error_code : access stdint_h.uint16_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:870
   pragma Import (C, ecrt_master_write_idn, "ecrt_master_write_idn");

  --*< EtherCAT master.  
  --*< Slave position.  
  --*< Drive number.  
  --*< SoE IDN (see ecrt_slave_config_idn()).  
  --*< Pointer to data to write.  
  --*< Size of data to write.  
  --*< Pointer to variable, where an SoE error code
  --                               can be stored.  

  --* Executes an SoE read request.
  -- *
  -- * Starts reading an IDN and blocks until the request was processed, or an
  -- * error occurred.
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_master_read_idn
     (master : System.Address;
      slave_position : stdint_h.uint16_t;
      drive_no : stdint_h.uint8_t;
      idn : stdint_h.uint16_t;
      target : access stdint_h.uint8_t;
      target_size : stddef_h.size_t;
      result_size : access stddef_h.size_t;
      error_code : access stdint_h.uint16_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:889
   pragma Import (C, ecrt_master_read_idn, "ecrt_master_read_idn");

  --*< EtherCAT master.  
  --*< Slave position.  
  --*< Drive number.  
  --*< SoE IDN (see ecrt_slave_config_idn()).  
  --*< Pointer to memory where the read data can be
  --                           stored.  

  --*< Size of the memory \a target points to.  
  --*< Actual size of the received data.  
  --*< Pointer to variable, where an SoE error code
  --                               can be stored.  

  --* Finishes the configuration phase and prepares for cyclic operation.
  -- *
  -- * This function tells the master that the configuration phase is finished and
  -- * the realtime operation will begin. The function allocates internal memory
  -- * for the domains and calculates the logical FMMU addresses for domain
  -- * members. It tells the master state machine that the bus configuration is
  -- * now to be applied.
  -- *
  -- * \attention After this function has been called, the realtime application is
  -- * in charge of cyclically calling ecrt_master_send() and
  -- * ecrt_master_receive() to ensure bus communication. Before calling this
  -- * function, the master thread is responsible for that, so these functions may
  -- * not be called! The method itself allocates memory and should not be called
  -- * in realtime context.
  -- *
  -- * \return 0 in case of success, else < 0
  --  

   function ecrt_master_activate (master : System.Address) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:919
   pragma Import (C, ecrt_master_activate, "ecrt_master_activate");

  --*< EtherCAT master.  
  --* Deactivates the master.
  -- *
  -- * Removes the bus configuration. All objects created by
  -- * ecrt_master_create_domain(), ecrt_master_slave_config(), ecrt_domain_data()
  -- * ecrt_slave_config_create_sdo_request() and
  -- * ecrt_slave_config_create_voe_handler() are freed, so pointers to them
  -- * become invalid.
  -- *
  -- * This method should not be called in realtime context.
  --  

   procedure ecrt_master_deactivate (master : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:933
   pragma Import (C, ecrt_master_deactivate, "ecrt_master_deactivate");

  --*< EtherCAT master.  
  --* Set interval between calls to ecrt_master_send().
  -- *
  -- * This information helps the master to decide, how much data can be appended
  -- * to a frame by the master state machine. When the master is configured with
  -- * --enable-hrtimers, this is used to calculate the scheduling of the master
  -- * thread.
  -- *
  -- * \retval 0 on success.
  -- * \retval <0 Error code.
  --  

   function ecrt_master_set_send_interval (master : System.Address; send_interval : stddef_h.size_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:947
   pragma Import (C, ecrt_master_set_send_interval, "ecrt_master_set_send_interval");

  --*< EtherCAT master.  
  --*< Send interval in us  
  --* Sends all datagrams in the queue.
  -- *
  -- * This method takes all datagrams, that have been queued for transmission,
  -- * puts them into frames, and passes them to the Ethernet device for sending.
  -- *
  -- * Has to be called cyclically by the application after ecrt_master_activate()
  -- * has returned.
  --  

   procedure ecrt_master_send (master : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:960
   pragma Import (C, ecrt_master_send, "ecrt_master_send");

  --*< EtherCAT master.  
  --* Fetches received frames from the hardware and processes the datagrams.
  -- *
  -- * Queries the network device for received frames by calling the interrupt
  -- * service routine. Extracts received datagrams and dispatches the results to
  -- * the datagram objects in the queue. Received datagrams, and the ones that
  -- * timed out, will be marked, and dequeued.
  -- *
  -- * Has to be called cyclically by the realtime application after
  -- * ecrt_master_activate() has returned.
  --  

   procedure ecrt_master_receive (master : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:974
   pragma Import (C, ecrt_master_receive, "ecrt_master_receive");

  --*< EtherCAT master.  
  --* Sends non-application datagrams.
  -- *
  -- * This method has to be called in the send callback function passed via
  -- * ecrt_master_callbacks() to allow the sending of non-application datagrams.
  --  

   procedure ecrt_master_send_ext (master : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:983
   pragma Import (C, ecrt_master_send_ext, "ecrt_master_send_ext");

  --*< EtherCAT master.  
  --* Reads the current master state.
  -- *
  -- * Stores the master state information in the given \a state structure.
  -- *
  -- * This method returns a global state. For the link-specific states in a
  -- * redundant bus topology, use the ecrt_master_link_state() method.
  --  

   procedure ecrt_master_state (master : System.Address; state : access ec_master_state_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:994
   pragma Import (C, ecrt_master_state, "ecrt_master_state");

  --*< EtherCAT master.  
  --*< Structure to store the information.  
  --* Reads the current state of a redundant link.
  -- *
  -- * Stores the link state information in the given \a state structure.
  -- *
  -- * \return Zero on success, otherwise negative error code.
  --  

   function ecrt_master_link_state
     (master : System.Address;
      dev_idx : unsigned;
      state : access ec_master_link_state_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1005
   pragma Import (C, ecrt_master_link_state, "ecrt_master_link_state");

  --*< EtherCAT master.  
  --*< Index of the device (0 = main device, 1 =
  --                                first backup device, ...).  

  --*< Structure to store the information.
  --                                        

  --* Sets the application time.
  -- *
  -- * The master has to know the application's time when operating slaves with
  -- * distributed clocks. The time is not incremented by the master itself, so
  -- * this method has to be called cyclically.
  -- *
  -- * \attention The first call of this method is used to calculate the phase
  -- * delay for the slaves' SYNC0/1 interrupts. Either the method has to be
  -- * called during the realtime cycle *only*, or the first time submitted must
  -- * be in-phase with the realtime cycle. Otherwise synchronisation problems can
  -- * occur.
  -- *
  -- * The time is used when setting the slaves' <tt>System Time Offset</tt> and
  -- * <tt>Cyclic Operation Start Time</tt> registers and when synchronizing the
  -- * DC reference clock to the application time via
  -- * ecrt_master_sync_reference_clock().
  -- *
  -- * The time is defined as nanoseconds from 2000-01-01 00:00. Converting an
  -- * epoch time can be done with the EC_TIMEVAL2NANO() macro.
  --  

   procedure ecrt_master_application_time (master : System.Address; app_time : stdint_h.uint64_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1033
   pragma Import (C, ecrt_master_application_time, "ecrt_master_application_time");

  --*< EtherCAT master.  
  --*< Application time.  
  --* Queues the DC reference clock drift compensation datagram for sending.
  -- *
  -- * The reference clock will by synchronized to the application time provided
  -- * by the last call off ecrt_master_application_time().
  --  

   procedure ecrt_master_sync_reference_clock (master : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1043
   pragma Import (C, ecrt_master_sync_reference_clock, "ecrt_master_sync_reference_clock");

  --*< EtherCAT master.  
  --* Queues the DC clock drift compensation datagram for sending.
  -- *
  -- * All slave clocks synchronized to the reference clock.
  --  

   procedure ecrt_master_sync_slave_clocks (master : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1051
   pragma Import (C, ecrt_master_sync_slave_clocks, "ecrt_master_sync_slave_clocks");

  --*< EtherCAT master.  
  --* Get the lower 32 bit of the reference clock system time.
  -- *
  -- * This method can be used to synchronize the master to the reference clock.
  -- *
  -- * The reference clock system time is queried via the
  -- * ecrt_master_sync_slave_clocks() method, that reads the system time of the
  -- * reference clock and writes it to the slave clocks (so be sure to call it
  -- * cyclically to get valid data).
  -- *
  -- * \attention The returned time is the system time of the reference clock
  -- * minus the transmission delay of the reference clock.
  -- *
  -- * \retval 0 success, system time was written into \a time.
  -- * \retval -ENXIO No reference clock found.
  -- * \retval -EIO Slave synchronization datagram was not received.
  --  

   function ecrt_master_reference_clock_time (master : System.Address; time : access stdint_h.uint32_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1071
   pragma Import (C, ecrt_master_reference_clock_time, "ecrt_master_reference_clock_time");

  --*< EtherCAT master.  
  --*< Pointer to store the queried system time.  
  --* Queues the DC synchrony monitoring datagram for sending.
  -- *
  -- * The datagram broadcast-reads all "System time difference" registers (\a
  -- * 0x092c) to get an upper estimation of the DC synchrony. The result can be
  -- * checked with the ecrt_master_sync_monitor_process() method.
  --  

   procedure ecrt_master_sync_monitor_queue (master : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1082
   pragma Import (C, ecrt_master_sync_monitor_queue, "ecrt_master_sync_monitor_queue");

  --*< EtherCAT master.  
  --* Processes the DC synchrony monitoring datagram.
  -- *
  -- * If the sync monitoring datagram was sent before with
  -- * ecrt_master_sync_monitor_queue(), the result can be queried with this
  -- * method.
  -- *
  -- * \return Upper estimation of the maximum time difference in ns.
  --  

   function ecrt_master_sync_monitor_process (master : System.Address) return stdint_h.uint32_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1094
   pragma Import (C, ecrt_master_sync_monitor_process, "ecrt_master_sync_monitor_process");

  --*< EtherCAT master.  
  --* Retry configuring slaves.
  -- *
  -- * Via this method, the application can tell the master to bring all slaves to
  -- * OP state. In general, this is not necessary, because it is automatically
  -- * done by the master. But with special slaves, that can be reconfigured by
  -- * the vendor during runtime, it can be useful.
  --  

   procedure ecrt_master_reset (master : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1105
   pragma Import (C, ecrt_master_reset, "ecrt_master_reset");

  --*< EtherCAT master.  
  --*****************************************************************************
  -- * Slave configuration methods
  -- **************************************************************************** 

  --* Configure a sync manager.
  -- *
  -- * Sets the direction of a sync manager. This overrides the direction bits
  -- * from the default control register from SII.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \return zero on success, else non-zero
  --  

   function ecrt_slave_config_sync_manager
     (sc : System.Address;
      sync_index : stdint_h.uint8_t;
      direction : ec_direction_t;
      watchdog_mode : ec_watchdog_mode_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1123
   pragma Import (C, ecrt_slave_config_sync_manager, "ecrt_slave_config_sync_manager");

  --*< Slave configuration.  
  --*< Sync manager index. Must be less
  --                              than #EC_MAX_SYNC_MANAGERS.  

  --*< Input/Output.  
  --* Watchdog mode.  
  --* Configure a slave's watchdog times.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  --  

   procedure ecrt_slave_config_watchdog
     (sc : System.Address;
      watchdog_divider : stdint_h.uint16_t;
      watchdog_intervals : stdint_h.uint16_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1136
   pragma Import (C, ecrt_slave_config_watchdog, "ecrt_slave_config_watchdog");

  --*< Slave configuration.  
  --*< Number of 40 ns intervals. Used as a
  --                                     base unit for all slave watchdogs. If set
  --                                     to zero, the value is not written, so the
  --                                     default is used.  

  --*< Number of base intervals for process
  --                                      data watchdog. If set to zero, the value
  --                                      is not written, so the default is used.
  --                                      

  --* Add a PDO to a sync manager's PDO assignment.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \see ecrt_slave_config_pdos()
  -- * \return zero on success, else non-zero
  --  

   function ecrt_slave_config_pdo_assign_add
     (sc : System.Address;
      sync_index : stdint_h.uint8_t;
      index : stdint_h.uint16_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1156
   pragma Import (C, ecrt_slave_config_pdo_assign_add, "ecrt_slave_config_pdo_assign_add");

  --*< Slave configuration.  
  --*< Sync manager index. Must be less
  --                              than #EC_MAX_SYNC_MANAGERS.  

  --*< Index of the PDO to assign.  
  --* Clear a sync manager's PDO assignment.
  -- *
  -- * This can be called before assigning PDOs via
  -- * ecrt_slave_config_pdo_assign_add(), to clear the default assignment of a
  -- * sync manager.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \see ecrt_slave_config_pdos()
  --  

   procedure ecrt_slave_config_pdo_assign_clear (sc : System.Address; sync_index : stdint_h.uint8_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1174
   pragma Import (C, ecrt_slave_config_pdo_assign_clear, "ecrt_slave_config_pdo_assign_clear");

  --*< Slave configuration.  
  --*< Sync manager index. Must be less
  --                              than #EC_MAX_SYNC_MANAGERS.  

  --* Add a PDO entry to the given PDO's mapping.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \see ecrt_slave_config_pdos()
  -- * \return zero on success, else non-zero
  --  

   function ecrt_slave_config_pdo_mapping_add
     (sc : System.Address;
      pdo_index : stdint_h.uint16_t;
      entry_index : stdint_h.uint16_t;
      entry_subindex : stdint_h.uint8_t;
      entry_bit_length : stdint_h.uint8_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1188
   pragma Import (C, ecrt_slave_config_pdo_mapping_add, "ecrt_slave_config_pdo_mapping_add");

  --*< Slave configuration.  
  --*< Index of the PDO.  
  --*< Index of the PDO entry to add to the PDO's
  --                                mapping.  

  --*< Subindex of the PDO entry to add to the
  --                                  PDO's mapping.  

  --*< Size of the PDO entry in bit.  
  --* Clear the mapping of a given PDO.
  -- *
  -- * This can be called before mapping PDO entries via
  -- * ecrt_slave_config_pdo_mapping_add(), to clear the default mapping.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \see ecrt_slave_config_pdos()
  --  

   procedure ecrt_slave_config_pdo_mapping_clear (sc : System.Address; pdo_index : stdint_h.uint16_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1208
   pragma Import (C, ecrt_slave_config_pdo_mapping_clear, "ecrt_slave_config_pdo_mapping_clear");

  --*< Slave configuration.  
  --*< Index of the PDO.  
  --* Specify a complete PDO configuration.
  -- *
  -- * This function is a convenience wrapper for the functions
  -- * ecrt_slave_config_sync_manager(), ecrt_slave_config_pdo_assign_clear(),
  -- * ecrt_slave_config_pdo_assign_add(), ecrt_slave_config_pdo_mapping_clear()
  -- * and ecrt_slave_config_pdo_mapping_add(), that are better suitable for
  -- * automatic code generation.
  -- *
  -- * The following example shows, how to specify a complete configuration,
  -- * including the PDO mappings. With this information, the master is able to
  -- * reserve the complete process data, even if the slave is not present at
  -- * configuration time:
  -- *
  -- * \code
  -- * ec_pdo_entry_info_t el3162_channel1[] = {
  -- *     {0x3101, 1,  8}, // status
  -- *     {0x3101, 2, 16}  // value
  -- * };
  -- *
  -- * ec_pdo_entry_info_t el3162_channel2[] = {
  -- *     {0x3102, 1,  8}, // status
  -- *     {0x3102, 2, 16}  // value
  -- * };
  -- *
  -- * ec_pdo_info_t el3162_pdos[] = {
  -- *     {0x1A00, 2, el3162_channel1},
  -- *     {0x1A01, 2, el3162_channel2}
  -- * };
  -- *
  -- * ec_sync_info_t el3162_syncs[] = {
  -- *     {2, EC_DIR_OUTPUT},
  -- *     {3, EC_DIR_INPUT, 2, el3162_pdos},
  -- *     {0xff}
  -- * };
  -- *
  -- * if (ecrt_slave_config_pdos(sc_ana_in, EC_END, el3162_syncs)) {
  -- *     // handle error
  -- * }
  -- * \endcode
  -- *
  -- * The next example shows, how to configure the PDO assignment only. The
  -- * entries for each assigned PDO are taken from the PDO's default mapping.
  -- * Please note, that PDO entry registration will fail, if the PDO
  -- * configuration is left empty and the slave is offline.
  -- *
  -- * \code
  -- * ec_pdo_info_t pdos[] = {
  -- *     {0x1600}, // Channel 1
  -- *     {0x1601}  // Channel 2
  -- * };
  -- *
  -- * ec_sync_info_t syncs[] = {
  -- *     {3, EC_DIR_INPUT, 2, pdos},
  -- * };
  -- *
  -- * if (ecrt_slave_config_pdos(slave_config_ana_in, 1, syncs)) {
  -- *     // handle error
  -- * }
  -- * \endcode
  -- *
  -- * Processing of \a syncs will stop, if
  -- * - the number of processed items reaches \a n_syncs, or
  -- * - the \a index member of an ec_sync_info_t item is 0xff. In this case,
  -- *   \a n_syncs should set to a number greater than the number of list items;
  -- *   using EC_END is recommended.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \return zero on success, else non-zero
  --  

   function ecrt_slave_config_pdos
     (sc : System.Address;
      n_syncs : unsigned;
      syncs : access constant ec_sync_info_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1284
   pragma Import (C, ecrt_slave_config_pdos, "ecrt_slave_config_pdos");

  --*< Slave configuration.  
  --*< Number of sync manager configurations in
  --                                \a syncs.  

  --*< Array of sync manager
  --                                       configurations.  

  --* Registers a PDO entry for process data exchange in a domain.
  -- *
  -- * Searches the assigned PDOs for the given PDO entry. An error is raised, if
  -- * the given entry is not mapped. Otherwise, the corresponding sync manager
  -- * and FMMU configurations are provided for slave configuration and the
  -- * respective sync manager's assigned PDOs are appended to the given domain,
  -- * if not already done. The offset of the requested PDO entry's data inside
  -- * the domain's process data is returned. Optionally, the PDO entry bit
  -- * position (0-7) can be retrieved via the \a bit_position output parameter.
  -- * This pointer may be \a NULL, in this case an error is raised if the PDO
  -- * entry does not byte-align.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \retval >=0 Success: Offset of the PDO entry's process data.
  -- * \retval  <0 Error code.
  --  

   function ecrt_slave_config_reg_pdo_entry
     (sc : System.Address;
      entry_index : stdint_h.uint16_t;
      entry_subindex : stdint_h.uint8_t;
      domain : System.Address;
      bit_position : access unsigned) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1310
   pragma Import (C, ecrt_slave_config_reg_pdo_entry, "ecrt_slave_config_reg_pdo_entry");

  --*< Slave configuration.  
  --*< Index of the PDO entry to register.  
  --*< Subindex of the PDO entry to register.  
  --*< Domain.  
  --*< Optional address if bit addressing
  --                                 is desired  

  --* Registers a PDO entry using its position.
  -- *
  -- * Similar to ecrt_slave_config_reg_pdo_entry(), but not using PDO indices but
  -- * offsets in the PDO mapping, because PDO entry indices may not be unique
  -- * inside a slave's PDO mapping. An error is raised, if
  -- * one of the given positions is out of range.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \retval >=0 Success: Offset of the PDO entry's process data.
  -- * \retval  <0 Error code.
  --  

   function ecrt_slave_config_reg_pdo_entry_pos
     (sc : System.Address;
      sync_index : stdint_h.uint8_t;
      pdo_pos : unsigned;
      entry_pos : unsigned;
      domain : System.Address;
      bit_position : access unsigned) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1332
   pragma Import (C, ecrt_slave_config_reg_pdo_entry_pos, "ecrt_slave_config_reg_pdo_entry_pos");

  --*< Slave configuration.  
  --*< Sync manager index.  
  --*< Position of the PDO inside the SM.  
  --*< Position of the entry inside the PDO.  
  --*< Domain.  
  --*< Optional address if bit addressing
  --                                 is desired  

  --* Configure distributed clocks.
  -- *
  -- * Sets the AssignActivate word and the cycle and shift times for the sync
  -- * signals.
  -- *
  -- * The AssignActivate word is vendor-specific and can be taken from the XML
  -- * device description file (Device -> Dc -> AssignActivate). Set this to zero,
  -- * if the slave shall be operated without distributed clocks (default).
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \attention The \a sync1_shift time is ignored.
  --  

   procedure ecrt_slave_config_dc
     (sc : System.Address;
      assign_activate : stdint_h.uint16_t;
      sync0_cycle : stdint_h.uint32_t;
      sync0_shift : x86_64_linux_gnu_sys_types_h.int32_t;
      sync1_cycle : stdint_h.uint32_t;
      sync1_shift : x86_64_linux_gnu_sys_types_h.int32_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1356
   pragma Import (C, ecrt_slave_config_dc, "ecrt_slave_config_dc");

  --*< Slave configuration.  
  --*< AssignActivate word.  
  --*< SYNC0 cycle time [ns].  
  --*< SYNC0 shift time [ns].  
  --*< SYNC1 cycle time [ns].  
  --*< SYNC1 shift time [ns].  
  --* Add an SDO configuration.
  -- *
  -- * An SDO configuration is stored in the slave configuration object and is
  -- * downloaded to the slave whenever the slave is being configured by the
  -- * master. This usually happens once on master activation, but can be repeated
  -- * subsequently, for example after the slave's power supply failed.
  -- *
  -- * \attention The SDOs for PDO assignment (\p 0x1C10 - \p 0x1C2F) and PDO
  -- * mapping (\p 0x1600 - \p 0x17FF and \p 0x1A00 - \p 0x1BFF) should not be
  -- * configured with this function, because they are part of the slave
  -- * configuration done by the master. Please use ecrt_slave_config_pdos() and
  -- * friends instead.
  -- *
  -- * This is the generic function for adding an SDO configuration. Please note
  -- * that the this function does not do any endianness correction. If
  -- * datatype-specific functions are needed (that automatically correct the
  -- * endianness), have a look at ecrt_slave_config_sdo8(),
  -- * ecrt_slave_config_sdo16() and ecrt_slave_config_sdo32().
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_slave_config_sdo
     (sc : System.Address;
      index : stdint_h.uint16_t;
      subindex : stdint_h.uint8_t;
      data : access stdint_h.uint8_t;
      size : stddef_h.size_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1390
   pragma Import (C, ecrt_slave_config_sdo, "ecrt_slave_config_sdo");

  --*< Slave configuration.  
  --*< Index of the SDO to configure.  
  --*< Subindex of the SDO to configure.  
  --*< Pointer to the data.  
  --*< Size of the \a data.  
  --* Add a configuration value for an 8-bit SDO.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \see ecrt_slave_config_sdo().
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_slave_config_sdo8
     (sc : System.Address;
      sdo_index : stdint_h.uint16_t;
      sdo_subindex : stdint_h.uint8_t;
      value : stdint_h.uint8_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1408
   pragma Import (C, ecrt_slave_config_sdo8, "ecrt_slave_config_sdo8");

  --*< Slave configuration  
  --*< Index of the SDO to configure.  
  --*< Subindex of the SDO to configure.  
  --*< Value to set.  
  --* Add a configuration value for a 16-bit SDO.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \see ecrt_slave_config_sdo().
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_slave_config_sdo16
     (sc : System.Address;
      sdo_index : stdint_h.uint16_t;
      sdo_subindex : stdint_h.uint8_t;
      value : stdint_h.uint16_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1425
   pragma Import (C, ecrt_slave_config_sdo16, "ecrt_slave_config_sdo16");

  --*< Slave configuration  
  --*< Index of the SDO to configure.  
  --*< Subindex of the SDO to configure.  
  --*< Value to set.  
  --* Add a configuration value for a 32-bit SDO.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \see ecrt_slave_config_sdo().
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_slave_config_sdo32
     (sc : System.Address;
      sdo_index : stdint_h.uint16_t;
      sdo_subindex : stdint_h.uint8_t;
      value : stdint_h.uint32_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1442
   pragma Import (C, ecrt_slave_config_sdo32, "ecrt_slave_config_sdo32");

  --*< Slave configuration  
  --*< Index of the SDO to configure.  
  --*< Subindex of the SDO to configure.  
  --*< Value to set.  
  --* Add configuration data for a complete SDO.
  -- *
  -- * The SDO data are transferred via CompleteAccess. Data for the first
  -- * subindex (0) have to be included.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \see ecrt_slave_config_sdo().
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_slave_config_complete_sdo
     (sc : System.Address;
      index : stdint_h.uint16_t;
      data : access stdint_h.uint8_t;
      size : stddef_h.size_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1462
   pragma Import (C, ecrt_slave_config_complete_sdo, "ecrt_slave_config_complete_sdo");

  --*< Slave configuration.  
  --*< Index of the SDO to configure.  
  --*< Pointer to the data.  
  --*< Size of the \a data.  
  --* Set the size of the CoE emergency ring buffer.
  -- *
  -- * The initial size is zero, so all messages will be dropped. This method can
  -- * be called even after master activation, but it will clear the ring buffer!
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \return 0 on success, or negative error code.
  --  

   function ecrt_slave_config_emerg_size (sc : System.Address; elements : stddef_h.size_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1479
   pragma Import (C, ecrt_slave_config_emerg_size, "ecrt_slave_config_emerg_size");

  --*< Slave configuration.  
  --*< Number of records of the CoE emergency ring.  
  --* Read and remove one record from the CoE emergency ring buffer.
  -- *
  -- * A record consists of 8 bytes:
  -- *
  -- * Byte 0-1: Error code (little endian)
  -- * Byte   2: Error register
  -- * Byte 3-7: Data
  -- *
  -- * \return 0 on success (record popped), or negative error code (i. e.
  -- * -ENOENT, if ring is empty).
  --  

   function ecrt_slave_config_emerg_pop (sc : System.Address; target : access stdint_h.uint8_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1495
   pragma Import (C, ecrt_slave_config_emerg_pop, "ecrt_slave_config_emerg_pop");

  --*< Slave configuration.  
  --*< Pointer to target memory (at least
  --                          EC_COE_EMERGENCY_MSG_SIZE bytes).  

  --* Clears CoE emergency ring buffer and the overrun counter.
  -- *
  -- * \return 0 on success, or negative error code.
  --  

   function ecrt_slave_config_emerg_clear (sc : System.Address) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1505
   pragma Import (C, ecrt_slave_config_emerg_clear, "ecrt_slave_config_emerg_clear");

  --*< Slave configuration.  
  --* Read the number of CoE emergency overruns.
  -- *
  -- * The overrun counter will be incremented when a CoE emergency message could
  -- * not be stored in the ring buffer and had to be dropped. Call
  -- * ecrt_slave_config_emerg_clear() to reset the counter.
  -- *
  -- * \return Number of overruns since last clear, or negative error code.
  --  

   function ecrt_slave_config_emerg_overruns (sc : System.Address) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1517
   pragma Import (C, ecrt_slave_config_emerg_overruns, "ecrt_slave_config_emerg_overruns");

  --*< Slave configuration.  
  --* Create an SDO request to exchange SDOs during realtime operation.
  -- *
  -- * The created SDO request object is freed automatically when the master is
  -- * released.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \return New SDO request, or NULL on error.
  --  

   function ecrt_slave_config_create_sdo_request
     (sc : System.Address;
      index : stdint_h.uint16_t;
      subindex : stdint_h.uint8_t;
      size : stddef_h.size_t) return System.Address;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1531
   pragma Import (C, ecrt_slave_config_create_sdo_request, "ecrt_slave_config_create_sdo_request");

  --*< Slave configuration.  
  --*< SDO index.  
  --*< SDO subindex.  
  --*< Data size to reserve.  
  --* Create an VoE handler to exchange vendor-specific data during realtime
  -- * operation.
  -- *
  -- * The number of VoE handlers per slave configuration is not limited, but
  -- * usually it is enough to create one for sending and one for receiving, if
  -- * both can be done simultaneously.
  -- *
  -- * The created VoE handler object is freed automatically when the master is
  -- * released.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \return New VoE handler, or NULL on error.
  --  

   function ecrt_slave_config_create_voe_handler (sc : System.Address; size : stddef_h.size_t) return System.Address;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1553
   pragma Import (C, ecrt_slave_config_create_voe_handler, "ecrt_slave_config_create_voe_handler");

  --*< Slave configuration.  
  --*< Data size to reserve.  
  --* Create a register request to exchange EtherCAT register contents during
  -- * realtime operation.
  -- *
  -- * This interface should not be used to take over master functionality,
  -- * instead it is intended for debugging and monitoring reasons.
  -- *
  -- * The created register request object is freed automatically when the master
  -- * is released.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \return New register request, or NULL on error.
  --  

   function ecrt_slave_config_create_reg_request (sc : System.Address; size : stddef_h.size_t) return System.Address;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1572
   pragma Import (C, ecrt_slave_config_create_reg_request, "ecrt_slave_config_create_reg_request");

  --*< Slave configuration.  
  --*< Data size to reserve.  
  --* Outputs the state of the slave configuration.
  -- *
  -- * Stores the state information in the given \a state structure. The state
  -- * information is updated by the master state machine, so it may take a few
  -- * cycles, until it changes.
  -- *
  -- * \attention If the state of process data exchange shall be monitored in
  -- * realtime, ecrt_domain_state() should be used.
  --  

   procedure ecrt_slave_config_state (sc : System.Address; state : access ec_slave_config_state_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1586
   pragma Import (C, ecrt_slave_config_state, "ecrt_slave_config_state");

  --*< Slave configuration  
  --*< State object to write to.  
  --* Add an SoE IDN configuration.
  -- *
  -- * A configuration for a Sercos-over-EtherCAT IDN is stored in the slave
  -- * configuration object and is written to the slave whenever the slave is
  -- * being configured by the master. This usually happens once on master
  -- * activation, but can be repeated subsequently, for example after the slave's
  -- * power supply failed.
  -- *
  -- * The \a idn parameter can be separated into several sections:
  -- *  - Bit 15: Standard data (0) or Product data (1)
  -- *  - Bit 14 - 12: Parameter set (0 - 7)
  -- *  - Bit 11 - 0: Data block number (0 - 4095)
  -- *
  -- * Please note that the this function does not do any endianness correction.
  -- * Multi-byte data have to be passed in EtherCAT endianness (little-endian).
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \retval  0 Success.
  -- * \retval <0 Error code.
  --  

   function ecrt_slave_config_idn
     (sc : System.Address;
      drive_no : stdint_h.uint8_t;
      idn : stdint_h.uint16_t;
      state : ec_al_state_t;
      data : access stdint_h.uint8_t;
      size : stddef_h.size_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1613
   pragma Import (C, ecrt_slave_config_idn, "ecrt_slave_config_idn");

  --*< Slave configuration.  
  --*< Drive number.  
  --*< SoE IDN.  
  --*< AL state in which to write the IDN (PREOP or
  --                               SAFEOP).  

  --*< Pointer to the data.  
  --*< Size of the \a data.  
  --*****************************************************************************
  -- * Domain methods
  -- **************************************************************************** 

  --* Registers a bunch of PDO entries for a domain.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  -- * \see ecrt_slave_config_reg_pdo_entry()
  -- *
  -- * \attention The registration array has to be terminated with an empty
  -- *            structure, or one with the \a index field set to zero!
  -- * \return 0 on success, else non-zero.
  --  

   function ecrt_domain_reg_pdo_entry_list (domain : System.Address; pdo_entry_regs : access constant ec_pdo_entry_reg_t) return int;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1638
   pragma Import (C, ecrt_domain_reg_pdo_entry_list, "ecrt_domain_reg_pdo_entry_list");

  --*< Domain.  
  --*< Array of PDO
  --                                                   registrations.  

  --* Returns the current size of the domain's process data.
  -- *
  -- * \return Size of the process data image, or a negative error code.
  --  

   function ecrt_domain_size (domain : System.Address) return stddef_h.size_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1648
   pragma Import (C, ecrt_domain_size, "ecrt_domain_size");

  --*< Domain.  
  --* Provide external memory to store the domain's process data.
  -- *
  -- * Call this after all PDO entries have been registered and before activating
  -- * the master.
  -- *
  -- * The size of the allocated memory must be at least ecrt_domain_size(), after
  -- * all PDO entries have been registered.
  -- *
  -- * This method has to be called in non-realtime context before
  -- * ecrt_master_activate().
  -- *
  --  

  --*< Domain.  
  --*< Address of the memory to store the process
  --                          data in.  

  --* Returns the domain's process data.
  -- *
  -- * - In kernel context: If external memory was provided with
  -- * ecrt_domain_external_memory(), the returned pointer will contain the
  -- * address of that memory. Otherwise it will point to the internally allocated
  -- * memory. In the latter case, this method may not be called before
  -- * ecrt_master_activate().
  -- *
  -- * - In userspace context: This method has to be called after
  -- * ecrt_master_activate() to get the mapped domain process data memory.
  -- *
  -- * \return Pointer to the process data memory.
  --  

   function ecrt_domain_data (domain : System.Address) return access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1687
   pragma Import (C, ecrt_domain_data, "ecrt_domain_data");

  --*< Domain.  
  --* Determines the states of the domain's datagrams.
  -- *
  -- * Evaluates the working counters of the received datagrams and outputs
  -- * statistics, if necessary. This must be called after ecrt_master_receive()
  -- * is expected to receive the domain datagrams in order to make
  -- * ecrt_domain_state() return the result of the last process data exchange.
  --  

   procedure ecrt_domain_process (domain : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1698
   pragma Import (C, ecrt_domain_process, "ecrt_domain_process");

  --*< Domain.  
  --* (Re-)queues all domain datagrams in the master's datagram queue.
  -- *
  -- * Call this function to mark the domain's datagrams for exchanging at the
  -- * next call of ecrt_master_send().
  --  

   procedure ecrt_domain_queue (domain : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1707
   pragma Import (C, ecrt_domain_queue, "ecrt_domain_queue");

  --*< Domain.  
  --* Reads the state of a domain.
  -- *
  -- * Stores the domain state in the given \a state structure.
  -- *
  -- * Using this method, the process data exchange can be monitored in realtime.
  --  

   procedure ecrt_domain_state (domain : System.Address; state : access ec_domain_state_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1717
   pragma Import (C, ecrt_domain_state, "ecrt_domain_state");

  --*< Domain.  
  --*< Pointer to a state object to store the
  --                                   information.  

  --****************************************************************************
  -- * SDO request methods.
  -- *************************************************************************** 

  --* Set the SDO index and subindex.
  -- *
  -- * \attention If the SDO index and/or subindex is changed while
  -- * ecrt_sdo_request_state() returns EC_REQUEST_BUSY, this may lead to
  -- * unexpected results.
  --  

   procedure ecrt_sdo_request_index
     (req : System.Address;
      index : stdint_h.uint16_t;
      subindex : stdint_h.uint8_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1733
   pragma Import (C, ecrt_sdo_request_index, "ecrt_sdo_request_index");

  --*< SDO request.  
  --*< SDO index.  
  --*< SDO subindex.  
  --* Set the timeout for an SDO request.
  -- *
  -- * If the request cannot be processed in the specified time, if will be marked
  -- * as failed.
  -- *
  -- * The timeout is permanently stored in the request object and is valid until
  -- * the next call of this method.
  --  

   procedure ecrt_sdo_request_timeout (req : System.Address; timeout : stdint_h.uint32_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1747
   pragma Import (C, ecrt_sdo_request_timeout, "ecrt_sdo_request_timeout");

  --*< SDO request.  
  --*< Timeout in milliseconds. Zero means no
  --                           timeout.  

  --* Access to the SDO request's data.
  -- *
  -- * This function returns a pointer to the request's internal SDO data memory.
  -- *
  -- * - After a read operation was successful, integer data can be evaluated using
  -- *   the EC_READ_*() macros as usual. Example:
  -- *   \code
  -- *   uint16_t value = EC_READ_U16(ecrt_sdo_request_data(sdo)));
  -- *   \endcode
  -- * - If a write operation shall be triggered, the data have to be written to
  -- *   the internal memory. Use the EC_WRITE_*() macros, if you are writing
  -- *   integer data. Be sure, that the data fit into the memory. The memory size
  -- *   is a parameter of ecrt_slave_config_create_sdo_request().
  -- *   \code
  -- *   EC_WRITE_U16(ecrt_sdo_request_data(sdo), 0xFFFF);
  -- *   \endcode
  -- *
  -- * \attention The return value can be invalid during a read operation, because
  -- * the internal SDO data memory could be re-allocated if the read SDO data do
  -- * not fit inside.
  -- *
  -- * \return Pointer to the internal SDO data memory.
  --  

   function ecrt_sdo_request_data (req : System.Address) return access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1776
   pragma Import (C, ecrt_sdo_request_data, "ecrt_sdo_request_data");

  --*< SDO request.  
  --* Returns the current SDO data size.
  -- *
  -- * When the SDO request is created, the data size is set to the size of the
  -- * reserved memory. After a read operation the size is set to the size of the
  -- * read data. The size is not modified in any other situation.
  -- *
  -- * \return SDO data size in bytes.
  --  

   function ecrt_sdo_request_data_size (req : System.Address) return stddef_h.size_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1788
   pragma Import (C, ecrt_sdo_request_data_size, "ecrt_sdo_request_data_size");

  --*< SDO request.  
  --* Get the current state of the SDO request.
  -- *
  -- * \return Request state.
  --  

  --*< SDO request.  
   function ecrt_sdo_request_state (req : System.Address) return ec_request_state_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1801
   pragma Import (C, ecrt_sdo_request_state, "ecrt_sdo_request_state");

  --*< SDO request.  
  --* Schedule an SDO write operation.
  -- *
  -- * \attention This method may not be called while ecrt_sdo_request_state()
  -- * returns EC_REQUEST_BUSY.
  --  

   procedure ecrt_sdo_request_write (req : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1811
   pragma Import (C, ecrt_sdo_request_write, "ecrt_sdo_request_write");

  --*< SDO request.  
  --* Schedule an SDO read operation.
  -- *
  -- * \attention This method may not be called while ecrt_sdo_request_state()
  -- * returns EC_REQUEST_BUSY.
  -- *
  -- * \attention After calling this function, the return value of
  -- * ecrt_sdo_request_data() must be considered as invalid while
  -- * ecrt_sdo_request_state() returns EC_REQUEST_BUSY.
  --  

   procedure ecrt_sdo_request_read (req : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1824
   pragma Import (C, ecrt_sdo_request_read, "ecrt_sdo_request_read");

  --*< SDO request.  
  --****************************************************************************
  -- * VoE handler methods.
  -- *************************************************************************** 

  --* Sets the VoE header for future send operations.
  -- *
  -- * A VoE message shall contain a 4-byte vendor ID, followed by a 2-byte vendor
  -- * type at as header. These numbers can be set with this function. The values
  -- * are valid and will be used for future send operations until the next call
  -- * of this method.
  --  

   procedure ecrt_voe_handler_send_header
     (voe : System.Address;
      vendor_id : stdint_h.uint32_t;
      vendor_type : stdint_h.uint16_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1839
   pragma Import (C, ecrt_voe_handler_send_header, "ecrt_voe_handler_send_header");

  --*< VoE handler.  
  --*< Vendor ID.  
  --*< Vendor-specific type.  
  --* Reads the header data of a received VoE message.
  -- *
  -- * This method can be used to get the received VoE header information after a
  -- * read operation has succeeded.
  -- *
  -- * The header information is stored at the memory given by the pointer
  -- * parameters.
  --  

   procedure ecrt_voe_handler_received_header
     (voe : System.Address;
      vendor_id : access stdint_h.uint32_t;
      vendor_type : access stdint_h.uint16_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1853
   pragma Import (C, ecrt_voe_handler_received_header, "ecrt_voe_handler_received_header");

  --*< VoE handler.  
  --*< Vendor ID.  
  --*< Vendor-specific type.  
  --* Access to the VoE handler's data.
  -- *
  -- * This function returns a pointer to the VoE handler's internal memory, that
  -- * points to the actual VoE data right after the VoE header (see
  -- * ecrt_voe_handler_send_header()).
  -- *
  -- * - After a read operation was successful, the memory contains the received
  -- *   data. The size of the received data can be determined via
  -- *   ecrt_voe_handler_data_size().
  -- * - Before a write operation is triggered, the data have to be written to the
  -- *   internal memory. Be sure, that the data fit into the memory. The reserved
  -- *   memory size is a parameter of ecrt_slave_config_create_voe_handler().
  -- *
  -- * \attention The returned pointer is not necessarily persistent: After a read
  -- * operation, the internal memory may have been reallocated. This can be
  -- * avoided by reserving enough memory via the \a size parameter of
  -- * ecrt_slave_config_create_voe_handler().
  -- *
  -- * \return Pointer to the internal memory.
  --  

   function ecrt_voe_handler_data (voe : System.Address) return access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1879
   pragma Import (C, ecrt_voe_handler_data, "ecrt_voe_handler_data");

  --*< VoE handler.  
  --* Returns the current data size.
  -- *
  -- * The data size is the size of the VoE data without the header (see
  -- * ecrt_voe_handler_send_header()).
  -- *
  -- * When the VoE handler is created, the data size is set to the size of the
  -- * reserved memory. At a write operation, the data size is set to the number
  -- * of bytes to write. After a read operation the size is set to the size of
  -- * the read data. The size is not modified in any other situation.
  -- *
  -- * \return Data size in bytes.
  --  

   function ecrt_voe_handler_data_size (voe : System.Address) return stddef_h.size_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1895
   pragma Import (C, ecrt_voe_handler_data_size, "ecrt_voe_handler_data_size");

  --*< VoE handler.  
  --* Start a VoE write operation.
  -- *
  -- * After this function has been called, the ecrt_voe_handler_execute() method
  -- * must be called in every bus cycle as long as it returns EC_REQUEST_BUSY. No
  -- * other operation may be started while the handler is busy.
  --  

   procedure ecrt_voe_handler_write (voe : System.Address; size : stddef_h.size_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1905
   pragma Import (C, ecrt_voe_handler_write, "ecrt_voe_handler_write");

  --*< VoE handler.  
  --*< Number of bytes to write (without the VoE header).  
  --* Start a VoE read operation.
  -- *
  -- * After this function has been called, the ecrt_voe_handler_execute() method
  -- * must be called in every bus cycle as long as it returns EC_REQUEST_BUSY. No
  -- * other operation may be started while the handler is busy.
  -- *
  -- * The state machine queries the slave's send mailbox for new data to be send
  -- * to the master. If no data appear within the EC_VOE_RESPONSE_TIMEOUT
  -- * (defined in master/voe_handler.c), the operation fails.
  -- *
  -- * On success, the size of the read data can be determined via
  -- * ecrt_voe_handler_data_size(), while the VoE header of the received data
  -- * can be retrieved with ecrt_voe_handler_received_header().
  --  

   procedure ecrt_voe_handler_read (voe : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1924
   pragma Import (C, ecrt_voe_handler_read, "ecrt_voe_handler_read");

  --*< VoE handler.  
  --* Start a VoE read operation without querying the sync manager status.
  -- *
  -- * After this function has been called, the ecrt_voe_handler_execute() method
  -- * must be called in every bus cycle as long as it returns EC_REQUEST_BUSY. No
  -- * other operation may be started while the handler is busy.
  -- *
  -- * The state machine queries the slave by sending an empty mailbox. The slave
  -- * fills its data to the master in this mailbox. If no data appear within the
  -- * EC_VOE_RESPONSE_TIMEOUT (defined in master/voe_handler.c), the operation
  -- * fails.
  -- *
  -- * On success, the size of the read data can be determined via
  -- * ecrt_voe_handler_data_size(), while the VoE header of the received data
  -- * can be retrieved with ecrt_voe_handler_received_header().
  --  

   procedure ecrt_voe_handler_read_nosync (voe : System.Address);  -- /home/jan/ethercat.work/master/../include/ecrt.h:1943
   pragma Import (C, ecrt_voe_handler_read_nosync, "ecrt_voe_handler_read_nosync");

  --*< VoE handler.  
  --* Execute the handler.
  -- *
  -- * This method executes the VoE handler. It has to be called in every bus
  -- * cycle as long as it returns EC_REQUEST_BUSY.
  -- *
  -- * \return Handler state.
  --  

   function ecrt_voe_handler_execute (voe : System.Address) return ec_request_state_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1954
   pragma Import (C, ecrt_voe_handler_execute, "ecrt_voe_handler_execute");

  --*< VoE handler.  
  --****************************************************************************
  -- * Register request methods.
  -- *************************************************************************** 

  --* Access to the register request's data.
  -- *
  -- * This function returns a pointer to the request's internal memory.
  -- *
  -- * - After a read operation was successful, integer data can be evaluated
  -- *   using the EC_READ_*() macros as usual. Example:
  -- *   \code
  -- *   uint16_t value = EC_READ_U16(ecrt_reg_request_data(reg_request)));
  -- *   \endcode
  -- * - If a write operation shall be triggered, the data have to be written to
  -- *   the internal memory. Use the EC_WRITE_*() macros, if you are writing
  -- *   integer data. Be sure, that the data fit into the memory. The memory size
  -- *   is a parameter of ecrt_slave_config_create_reg_request().
  -- *   \code
  -- *   EC_WRITE_U16(ecrt_reg_request_data(reg_request), 0xFFFF);
  -- *   \endcode
  -- *
  -- * \return Pointer to the internal memory.
  --  

   function ecrt_reg_request_data (req : System.Address) return access stdint_h.uint8_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1981
   pragma Import (C, ecrt_reg_request_data, "ecrt_reg_request_data");

  --*< Register request.  
  --* Get the current state of the register request.
  -- *
  -- * \return Request state.
  --  

  --*< Register request.  
   function ecrt_reg_request_state (req : System.Address) return ec_request_state_t;  -- /home/jan/ethercat.work/master/../include/ecrt.h:1994
   pragma Import (C, ecrt_reg_request_state, "ecrt_reg_request_state");

  --*< Register request.  
  --* Schedule an register write operation.
  -- *
  -- * \attention This method may not be called while ecrt_reg_request_state()
  -- * returns EC_REQUEST_BUSY.
  -- *
  -- * \attention The \a size parameter is truncated to the size given at request
  -- * creation.
  --  

   procedure ecrt_reg_request_write
     (req : System.Address;
      address : stdint_h.uint16_t;
      size : stddef_h.size_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:2007
   pragma Import (C, ecrt_reg_request_write, "ecrt_reg_request_write");

  --*< Register request.  
  --*< Register address.  
  --*< Size to write.  
  --* Schedule a register read operation.
  -- *
  -- * \attention This method may not be called while ecrt_reg_request_state()
  -- * returns EC_REQUEST_BUSY.
  -- *
  -- * \attention The \a size parameter is truncated to the size given at request
  -- * creation.
  --  

   procedure ecrt_reg_request_read
     (req : System.Address;
      address : stdint_h.uint16_t;
      size : stddef_h.size_t);  -- /home/jan/ethercat.work/master/../include/ecrt.h:2021
   pragma Import (C, ecrt_reg_request_read, "ecrt_reg_request_read");

  --*< Register request.  
  --*< Register address.  
  --*< Size to write.  
  --*************************************************************************** 
  --*****************************************************************************
  -- * Bitwise read/write macros
  -- **************************************************************************** 

  --* Read a certain bit of an EtherCAT data byte.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param POS bit position
  --  

  --* Write a certain bit of an EtherCAT data byte.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param POS bit position
  -- * \param VAL new bit value
  --  

  --*****************************************************************************
  -- * Byte-swapping functions for user space
  -- **************************************************************************** 

  --*****************************************************************************
  -- * Read macros
  -- **************************************************************************** 

  --* Read an 8-bit unsigned value from EtherCAT data.
  -- *
  -- * \return EtherCAT data value
  --  

  --* Read an 8-bit signed value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 16-bit unsigned value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 16-bit signed value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 32-bit unsigned value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 32-bit signed value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 64-bit unsigned value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --* Read a 64-bit signed value from EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \return EtherCAT data value
  --  

  --*****************************************************************************
  -- * Write macros
  -- **************************************************************************** 

  --* Write an 8-bit unsigned value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write an 8-bit signed value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 16-bit unsigned value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 16-bit signed value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 32-bit unsigned value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 32-bit signed value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 64-bit unsigned value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --* Write a 64-bit signed value to EtherCAT data.
  -- *
  -- * \param DATA EtherCAT data pointer
  -- * \param VAL new value
  --  

  --*************************************************************************** 
  --* @}  
end ecrt_h;

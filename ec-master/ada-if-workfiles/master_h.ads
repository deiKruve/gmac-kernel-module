pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with ecdev_h;
with linux_types_h;
with cdev_h;
limited with linux_device_h;
with linux_semaphore_h;
with System;
with linux_wait_h;
limited with linux_sched_h;
limited with ecrt_h;

package master_h is

   --  unsupported macro: EC_MASTER_INFO(master,fmt,args...) printk(KERN_INFO "EtherCAT %u: " fmt, master->index, ##args)
   --  unsupported macro: EC_MASTER_ERR(master,fmt,args...) printk(KERN_ERR "EtherCAT ERROR %u: " fmt, master->index, ##args)
   --  unsupported macro: EC_MASTER_WARN(master,fmt,args...) printk(KERN_WARNING "EtherCAT WARNING %u: " fmt, master->index, ##args)
   --  unsupported macro: EC_MASTER_DBG(master,level,fmt,args...) do { if (master->debug_level >= level) { printk(KERN_DEBUG "EtherCAT DEBUG %u: " fmt, master->index, ##args); } } while (0)
   --  unsupported macro: EC_EXT_RING_SIZE 32
   --  arg-macro: procedure ec_master_num_devices 1
   --    1
  --*****************************************************************************
  -- *Compile command:
  -- * gcc  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.8/include
  --       -I /usr/src/linux-headers-3.16.0-4-common/arch/x86/include
  --       -I /usr/src/linux-headers-3.16.0-4-amd64/arch/x86/include/generated
  --       -I /usr/src/linux-headers-3.16.0-4-common/include
  --       -I include
  --        -c master.h
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
  --   EtherCAT master structure.
  -- 

  --*************************************************************************** 
  --EXTERN "C"{
  --*************************************************************************** 
  --* Convenience macro for printing master-specific information to syslog.
  -- *
  -- * This will print the message in \a fmt with a prefixed "EtherCAT <INDEX>: ",
  -- * where INDEX is the master index.
  -- *
  -- * \param master EtherCAT master
  -- * \param fmt format string (like in printf())
  -- * \param args arguments (optional)
  --  

  --* Convenience macro for printing master-specific errors to syslog.
  -- *
  -- * This will print the message in \a fmt with a prefixed "EtherCAT <INDEX>: ",
  -- * where INDEX is the master index.
  -- *
  -- * \param master EtherCAT master
  -- * \param fmt format string (like in printf())
  -- * \param args arguments (optional)
  --  

  --* Convenience macro for printing master-specific warnings to syslog.
  -- *
  -- * This will print the message in \a fmt with a prefixed "EtherCAT <INDEX>: ",
  -- * where INDEX is the master index.
  -- *
  -- * \param master EtherCAT master
  -- * \param fmt format string (like in printf())
  -- * \param args arguments (optional)
  --  

  --* Convenience macro for printing master-specific debug messages to syslog.
  -- *
  -- * This will print the message in \a fmt with a prefixed "EtherCAT <INDEX>: ",
  -- * where INDEX is the master index.
  -- *
  -- * \param master EtherCAT master
  -- * \param level Debug level. Master's debug level must be >= \a level for
  -- * output.
  -- * \param fmt format string (like in printf())
  -- * \param args arguments (optional)
  --  

  --* Size of the external datagram ring.
  -- *
  -- * The external datagram ring is used for slave FSMs.
  --  

  --*************************************************************************** 
  --* EtherCAT master phase.
  --  

  --*< Orphaned phase. The master has no Ethernet device
  --                   attached.  

  --*< Idle phase. An Ethernet device is attached, but the master
  --               is not in use, yet.  

  --*< Operation phase. The master was requested by a realtime
  --                   application.  

   type ec_master_phase_t is 
     (EC_ORPHANED,
      EC_IDLE,
      EC_OPERATION);
   pragma Convention (C, ec_master_phase_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:133

  --*************************************************************************** 
  --* Cyclic statistics.
  --  

  --*< datagram timeouts  
   type ec_stats_t is record
      timeouts : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:140
      corrupted : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:141
      unmatched : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:142
      output_jiffies : aliased unsigned_long;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:144
   end record;
   pragma Convention (C_Pass_By_Copy, ec_stats_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:145

   --  skipped anonymous struct anon_405

  --*< corrupted frames  
  --*< unmatched datagrams (received, but not
  --                               queued any longer)  

  --*< time of last output  
  --*************************************************************************** 
  --* Device statistics.
  --  

  --*< Number of frames sent.  
   type ec_device_stats_t_tx_frame_rates_array is array (0 .. 2) of aliased asm_generic_int_ll64_h.s32;
   type ec_device_stats_t_rx_frame_rates_array is array (0 .. 2) of aliased asm_generic_int_ll64_h.s32;
   type ec_device_stats_t_tx_byte_rates_array is array (0 .. 2) of aliased asm_generic_int_ll64_h.s32;
   type ec_device_stats_t_rx_byte_rates_array is array (0 .. 2) of aliased asm_generic_int_ll64_h.s32;
   type ec_device_stats_t_loss_rates_array is array (0 .. 2) of aliased asm_generic_int_ll64_h.s32;
   type ec_device_stats_t is record
      tx_count : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:152
      last_tx_count : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:153
      rx_count : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:154
      last_rx_count : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:155
      tx_bytes : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:157
      last_tx_bytes : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:158
      rx_bytes : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:159
      last_rx_bytes : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:160
      last_loss : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:162
      tx_frame_rates : aliased ec_device_stats_t_tx_frame_rates_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:163
      rx_frame_rates : aliased ec_device_stats_t_rx_frame_rates_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:166
      tx_byte_rates : aliased ec_device_stats_t_tx_byte_rates_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:169
      rx_byte_rates : aliased ec_device_stats_t_rx_byte_rates_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:171
      loss_rates : aliased ec_device_stats_t_loss_rates_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:173
      jiffies : aliased unsigned_long;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:175
   end record;
   pragma Convention (C_Pass_By_Copy, ec_device_stats_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:176

   --  skipped anonymous struct anon_406

  --*< Number of frames sent of last statistics cycle.  
  --*< Number of frames received.  
  --*< Number of frames received of last statistics
  --                         cycle.  

  --*< Number of bytes sent.  
  --*< Number of bytes sent of last statistics cycle.  
  --*< Number of bytes received.  
  --*< Number of bytes received of last statistics cycle.
  --                         

  --*< Tx/Rx difference of last statistics cycle.  
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

  --*< Frame loss rates for different
  --                                     statistics cycle periods.  

  --*< Jiffies of last statistic cycle.  
  --*************************************************************************** 
  --*************************************************************************** 
  --* EtherCAT master.
  -- *
  -- * Manages slaves, domains and IO.
  --  

  --*< Index.  
   type ec_master_devices_array is array (0 .. 0) of aliased ecdev_h.ec_device_t;
   type ec_master_macs_array is array (0 .. 0) of access linux_types_h.uint8_t;
   type ec_master is record
      index : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:192
      reserved : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:193
      cdev : aliased cdev_h.ec_cdev_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:195
      class_device : access linux_device_h.device;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:197
      master_sem : aliased linux_semaphore_h.semaphore;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:206
      devices : aliased ec_master_devices_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:208
      macs : aliased ec_master_macs_array;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:209
      device_sem : aliased linux_semaphore_h.semaphore;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:215
      device_stats : aliased ec_device_stats_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:216
      phase : aliased ec_master_phase_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:220
      active : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:221
      config_changed : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:222
      injection_seq_fsm : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:223
      injection_seq_rt : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:225
      slaves : System.Address;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:228
      slave_count : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:229
      configs : aliased linux_types_h.list_head;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:232
      domains : aliased linux_types_h.list_head;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:233
      app_time : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:235
      app_start_time : aliased asm_generic_int_ll64_h.u64;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:236
      has_app_time : aliased asm_generic_int_ll64_h.u8;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:237
      dc_ref_config : System.Address;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:247
      dc_ref_clock : System.Address;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:249
      scan_busy : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:251
      allow_scan : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:252
      scan_sem : aliased linux_semaphore_h.semaphore;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:253
      scan_queue : aliased linux_wait_h.wait_queue_head_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:255
      config_busy : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:258
      config_sem : aliased linux_semaphore_h.semaphore;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:259
      config_queue : aliased linux_wait_h.wait_queue_head_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:261
      datagram_queue : aliased linux_types_h.list_head;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:264
      datagram_index : aliased linux_types_h.uint8_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:265
      ext_datagram_queue : aliased linux_types_h.list_head;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:267
      ext_queue_sem : aliased linux_semaphore_h.semaphore;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:269
      ext_ring_idx_rt : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:275
      ext_ring_idx_fsm : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:277
      send_interval : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:279
      max_queue_size : aliased linux_types_h.size_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:281
      fsm_slave : System.Address;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:283
      fsm_exec_list : aliased linux_types_h.list_head;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:284
      fsm_exec_count : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:285
      debug_level : aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:287
      stats : aliased ec_stats_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:288
      thread : access linux_sched_h.task_struct;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:290
      eoe_thread : access linux_sched_h.task_struct;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:293
      eoe_handlers : aliased linux_types_h.list_head;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:294
      io_sem : aliased linux_semaphore_h.semaphore;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:297
      send_cb : access procedure (arg1 : System.Address);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:299
      receive_cb : access procedure (arg1 : System.Address);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:300
      cb_data : System.Address;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:301
      app_send_cb : access procedure (arg1 : System.Address);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:302
      app_receive_cb : access procedure (arg1 : System.Address);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:304
      app_cb_data : System.Address;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:306
      sii_requests : aliased linux_types_h.list_head;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:308
      emerg_reg_requests : aliased linux_types_h.list_head;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:309
      request_queue : aliased linux_wait_h.wait_queue_head_t;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:312
   end record;
   pragma Convention (C_Pass_By_Copy, ec_master);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:191

  --*< \a True, if the master is in use.  
  --*< Master character device.  
  --*< Master class device.  
  --*< Master class device.  
  --*< RTDM device.  
  --*< Master semaphore.  
  --*< EtherCAT devices.  
  --*< Device MAC addresses.  
  --*< Number of devices. Access this always via
  --                                ec_master_num_devices(), because it may be
  --                                optimized!  

  --*< Device semaphore.  
  --*< Device statistics.  
  --jdk//ec_fsm_master_t fsm; /**< Master state machine.  
  --jdk//ec_datagram_t fsm_datagram; /**< Datagram used for state machines.  
  --*< Master phase.  
  --*< Master has been activated.  
  --*< The configuration changed.  
  --*< Datagram injection sequence number
  --                                      for the FSM side.  

  --*< Datagram injection sequence number
  --                                     for the realtime side.  

  --*< Array of slaves on the bus.  
  --*< Number of slaves on the bus.  
  -- Configuration applied by the application.  
  --*< List of slave configurations.  
  --*< List of domains.  
  --*< Time of the last ecrt_master_sync() call.  
  --*< Application start time.  
  --*< Application time is valid.  
  --jdk//ec_datagram_t ref_sync_datagram;
  --*< Datagram used for synchronizing the
  --                                       reference clock to the master clock.  

  --jdk//ec_datagram_t sync_datagram;
  --*< Datagram used for DC drift
  --                                   compensation.  

  --jdk//ec_datagram_t sync_mon_datagram;
  --*< Datagram used for DC synchronisation
  --                                       monitoring.  

  --*< Application-selected DC reference
  --                                        clock slave config.  

  --*< DC reference clock slave.  
  --*< Current scan state.  
  --*< \a True, if slave scanning is allowed.  
  --*< Semaphore protecting the \a scan_busy
  --                                 variable and the \a allow_scan flag.  

  --*< Queue for processes that wait for
  --                                    slave scanning.  

  --*< State of slave configuration.  
  --*< Semaphore protecting the \a config_busy
  --                                   variable and the allow_config flag.  

  --*< Queue for processes that wait for
  --                                      slave configuration.  

  --*< Datagram queue.  
  --*< Current datagram index.  
  --*< Queue for non-application
  --                                           datagrams.  

  --*< Semaphore protecting the \a
  --                                      ext_datagram_queue.  

  --jdk//ec_datagram_t ext_datagram_ring[EC_EXT_RING_SIZE];
  --*< External datagram
  --                                                         ring.  

  --*< Index in external datagram ring for RT
  --                                    side.  

  --*< Index in external datagram ring for
  --                                     FSM side.  

  --*< Interval between two calls to
  --                                  ecrt_master_send().  

  --*< Maximum size of datagram queue  
  --*< Slave that is queried next for FSM exec.  
  --*< Slave FSM execution list.  
  --*< Number of entries in execution list.  
  --*< Master debug level.  
  --*< Cyclic statistics.  
  --*< Master thread.  
  --*< EoE thread.  
  --*< Ethernet over EtherCAT handlers.  
  --*< Semaphore used in \a IDLE phase.  
  --*< Current send datagrams callback.  
  --*< Current receive datagrams callback.  
  --*< Current callback data.  
  --*< Application's send datagrams
  --                                          callback.  

  --*< Application's receive datagrams
  --                                      callback.  

  --*< Application callback data.  
  --*< SII write requests.  
  --*< Emergency register access
  --                                           requests.  

  --*< Wait queue for external requests
  --                                       from user space.  

  --*************************************************************************** 
  -- static funtions
   procedure ec_master_init_static;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:319
   pragma Import (CPP, ec_master_init_static, "_Z21ec_master_init_staticv");

  -- master creation/deletion
   function ec_master_init return int;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:322
   pragma Import (CPP, ec_master_init, "_Z14ec_master_initz");

   procedure ec_master_clear (arg1 : access ecrt_h.ec_master_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:324
   pragma Import (CPP, ec_master_clear, "_Z15ec_master_clearP9ec_master");

  --* Number of Ethernet devices.
  --  

  -- phase transitions
   function ec_master_enter_idle_phase (arg1 : access ecrt_h.ec_master_t) return int;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:336
   pragma Import (CPP, ec_master_enter_idle_phase, "_Z26ec_master_enter_idle_phaseP9ec_master");

   procedure ec_master_leave_idle_phase (arg1 : access ecrt_h.ec_master_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:337
   pragma Import (CPP, ec_master_leave_idle_phase, "_Z26ec_master_leave_idle_phaseP9ec_master");

   function ec_master_enter_operation_phase (arg1 : access ecrt_h.ec_master_t) return int;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:338
   pragma Import (CPP, ec_master_enter_operation_phase, "_Z31ec_master_enter_operation_phaseP9ec_master");

   procedure ec_master_leave_operation_phase (arg1 : access ecrt_h.ec_master_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:339
   pragma Import (CPP, ec_master_leave_operation_phase, "_Z31ec_master_leave_operation_phaseP9ec_master");

  -- datagram IO
   procedure ec_master_receive_datagrams
     (arg1 : access ecrt_h.ec_master_t;
      arg2 : access ecdev_h.ec_device_t;
      arg3 : access linux_types_h.uint8_t;
      arg4 : linux_types_h.size_t);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:342
   pragma Import (CPP, ec_master_receive_datagrams, "_Z27ec_master_receive_datagramsP9ec_masterP9ec_devicePKhm");

  --jdk//void ec_master_queue_datagram(ec_master_t *, ec_datagram_t *);
  --jdk//void ec_master_queue_datagram_ext(ec_master_t *, ec_datagram_t *);
  -- misc.
   procedure ec_master_set_send_interval (arg1 : access ecrt_h.ec_master_t; arg2 : unsigned);  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:348
   pragma Import (CPP, ec_master_set_send_interval, "_Z27ec_master_set_send_intervalP9ec_masterj");

   function ec_master_debug_level (arg1 : access ecrt_h.ec_master_t; arg2 : unsigned) return int;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:350
   pragma Import (CPP, ec_master_debug_level, "_Z21ec_master_debug_levelP9ec_masterj");

  -- see master.c
   rate_intervals : aliased array (0 .. 2) of aliased unsigned;  -- /home/jan/MMS/programs-KERNEL/ec-master/master.h:352
   pragma Import (C, rate_intervals, "rate_intervals");

  --*************************************************************************** 
  --}
end master_h;

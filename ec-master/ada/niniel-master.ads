pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

with Cdev;
with Device;
with Linux_Types;
with Linux_Semaphore;
with Linux_Device;

with Hw_Types;

package Niniel.Master is
   package L   renames Linux_Types;
   package Ld  renames Linux_Device;
   package Hwt renames Hw_Types;
   
   ------------------
   --  data types  --
   ------------------

   type ec_master_phase_t is
     -- EtherCAT master phase.
     (EC_ORPHANED,
      -- Orphaned phase. The master has no Ethernet device attached.
      EC_IDLE,
      -- Idle phase. An Ethernet device is attached, 
      -- but the master is not in use, yet.
      --
      -- We use this phase to discover wether all field units are attached 
      -- and reachable.
      EC_OPERATION
        -- Operation phase. The master was requested by a realtime
        --                   application.
   );
   pragma Convention (C, ec_master_phase_t);
   
  
   type ec_stats_t is record
      -- Cyclic statistics.
      timeouts : aliased unsigned;
      -- datagram timeouts
      corrupted : aliased unsigned;
      -- corrupted frames
      unmatched : aliased unsigned;
      -- unmatched datagrams (received, but not queued any longer)
      output_jiffies : aliased unsigned_long;
      -- time of last output
   end record;
   pragma Convention (C_Pass_By_Copy, ec_stats_t);

   type ec_device_stats_t_tx_frame_rates_array is
     array (0 .. 2) of aliased L.s32;
   type ec_device_stats_t_rx_frame_rates_array is
     array (0 .. 2) of aliased L.s32;
   type ec_device_stats_t_tx_byte_rates_array is
     array (0 .. 2) of aliased L.s32;
   type ec_device_stats_t_rx_byte_rates_array is
     array (0 .. 2) of aliased L.s32;
   type ec_device_stats_t_loss_rates_array is array (0 .. 2) of aliased L.s32;

   type ec_device_stats_t is record
      tx_count       : aliased L.u64;
      last_tx_count  : aliased L.u64;
      rx_count       : aliased L.u64;
      last_rx_count  : aliased L.u64;
      tx_bytes       : aliased L.u64;
      last_tx_bytes  : aliased L.u64;
      rx_bytes       : aliased L.u64;
      last_rx_bytes  : aliased L.u64;
      last_loss      : aliased L.u64;
      tx_frame_rates : aliased ec_device_stats_t_tx_frame_rates_array;
      rx_frame_rates : aliased ec_device_stats_t_rx_frame_rates_array;
      tx_byte_rates  : aliased ec_device_stats_t_tx_byte_rates_array;
      rx_byte_rates  : aliased ec_device_stats_t_rx_byte_rates_array;
      loss_rates     : aliased ec_device_stats_t_loss_rates_array;
      jiffies        : aliased unsigned_long;
      -- Jiffies of last statistic cycle.
   end record;
   pragma Convention (C_Pass_By_Copy, ec_device_stats_t);

   rate_intervals : aliased array (0 .. 2) of aliased Unsigned := (1, 10, 60);
   pragma Export (C, rate_intervals, "rate_intervals");

   
   -- lets try to makew a master
   subtype Linux_Device_Device_Ptr is System.Address; 
   -- access linux_device_h.device;
   
   subtype Task_Struct_Ptr is System.Address; -- access linux_sched_h.task_struct;
   
   type ec_master_devices_array is array (0 .. 0) of Device.Ec_Device_Ptr;
   
   --   type ec_master_macs_array is array (0 .. 0) of access L.u8;
   subtype Mac_Addr_Type is Hwt.bits_48;
   type Mac_Addr_A_Type is access all Mac_Addr_Type;
   subtype Mac_Addr_Ptr is System.Address;
   type ec_master_macs_array is array (0 .. 0) of Mac_Addr_Ptr;
   
   type ec_master is record
      index : aliased unsigned;  --  *
      reserved : aliased unsigned;
      chdev : aliased cdev.ec_cdev_t;
      class_device : Linux_Device_Device_Ptr; -- access linux_device_h.device;
      master_sem : aliased linux_semaphore.Semaphore;
      Devices : Device.Ec_Device_Ptr;  --  *
      macs : aliased ec_master_macs_array;
      device_sem : aliased linux_semaphore.Semaphore;  --  *
      device_stats : aliased ec_device_stats_t;  --  *
      phase : aliased ec_master_phase_t;  --  *
      active : aliased unsigned;
      config_changed : aliased unsigned;------------------------not used
      injection_seq_fsm : aliased unsigned;---------------------not used
      injection_seq_rt : aliased unsigned;----------------------notused
      slaves : System.Address;----------------------------------not used
      slave_count : aliased unsigned;---------------------------not used
      configs : aliased linux_types.list_head;------------------not used
      domains : aliased linux_types.list_head;------------------not used
      app_time : aliased linux_types.u64;------------------what is this
      app_start_time : aliased linux_types.u64;------------what is this
      has_app_time : aliased linux_types.u8;---------------what is this
      dc_ref_config : System.Address;----------------------------not used
      dc_ref_clock : System.Address;-----------------------------not used
      --  scan_busy : aliased unsigned;-------------------maybe, but bool
      --  allow_scan : aliased unsigned;------------------maybe, but bool
      --  scan_sem : aliased linux_semaphore.semaphore;---maybe
      --  scan_queue : Linux_Device_Device_Ptr;-------------------------------bull
      --  config_busy : aliased unsigned;-----------------------------not used
      --  config_sem : aliased linux_semaphore.semaphore;-------------not used
      --  config_queue : Linux_Device_Device_Ptr;-----------------------------bull
      --  datagram_queue : aliased linux_types.list_head; -------------not used
      --  datagram_index : aliased linux_types.u8;---------------------not used
      --  ext_datagram_queue : aliased linux_types.list_head;----------not used
      --  ext_queue_sem : aliased linux_semaphore.semaphore;-----------not used
      --  ext_ring_idx_rt : aliased unsigned;--------------------------not used
      --  ext_ring_idx_fsm : aliased unsigned;-------------------------not used
      send_interval : aliased unsigned;
      --  max_queue_size : aliased linux_types.size_t;-----------------not used
      --  fsm_slave : System.Address;----------------------------------not used
      --  fsm_exec_list : aliased linux_types.list_head;
      --  fsm_exec_count : aliased unsigned;
      debug_level : aliased unsigned;  --  *
      stats : aliased ec_stats_t;
      thread : Task_Struct_Ptr;
      --  eoe_thread : Task_Struct_Ptr;--------------------------------not used
      --  eoe_handlers : aliased linux_types.list_head;----------------not used
      io_sem : aliased linux_semaphore.semaphore;
      send_cb : access procedure (arg1 : access Ec_Master);
      receive_cb : access procedure (arg1 : access Ec_Master);
      cb_data : System.Address;
      app_send_cb : access procedure (arg1 : System.Address);
      app_receive_cb : access procedure (arg1 : System.Address);
      app_cb_data : System.Address;
      sii_requests : aliased linux_types.list_head;
      emerg_reg_requests : aliased linux_types.list_head;
      --  request_queue : Linux_Device_Device_Ptr;-------------------------bull
      Name : aliased String (1 .. 32);
   end record;
   pragma Convention (C_Pass_By_Copy, ec_master);
   
   type Ec_Master_A_Type is access all Ec_Master;
   subtype Ec_Master_Ptr is System.Address;
   
   

   ---------------
   --  methods  --
   ---------------

   -- stats  --

   procedure ec_master_output_stats (arg1 : access Ec_Master);
   -- Output master statistics.
   -- This function outputs statistical data on demand, but not more often than
   -- necessary. The output happens at most once a second.
   --  pragma Import (C, ec_master_output_stats, "ec_master_output_stats");

   procedure ec_master_clear_device_stats (arg1 : access Ec_Master);
   -- Clears the common device statistics.
   --  pragma Import
   --    (C,
   --     ec_master_clear_device_stats,
   --     "ec_master_clear_device_stats");

   procedure ec_master_update_device_stats (Master : access Ec_Master);
   -- Updates the common device statistics.
   --  pragma Import
   --    (C,
   --     ec_master_update_device_stats,
   --     "ec_master_update_device_stats");
   
   
   procedure Ec_Master_Init_Static;
   -- static funtions
   pragma Export (C, Ec_Master_Init_Static, "ec_master_init_static");
   
   
   function Ec_Master_Init (Master_P      : Ec_Master_Ptr;
                            Index         : Unsigned;
                            Main_Mac      : Mac_Addr_Ptr;
                            Backup_Mac    : Mac_Addr_Ptr;
                            Device_Number : L.Dev_T;
                            Class         : Linux_Device.Class_Ptr;
                            Debug_Level   : Unsigned)
                           return Int;
   --  Master constructor.
   --  return 0 in case of success, else < 0
   pragma Export (C, Ec_Master_Init, "ec_master_init");
   
   
   procedure Ec_Master_Clear (arg1 : Ec_Master_Ptr);
   -- master deletion
   pragma Export (C, Ec_Master_Clear, "ec_master_clear");

   -- phase transitions
   
   
   
   function ec_master_enter_idle_phase (Master_P : Ec_Master_Ptr) return int;
   --  Transition function from ORPHANED to IDLE phase.
   --
   --  return Zero on success, otherwise a negative error code.
   pragma Export (C, ec_master_enter_idle_phase, "ec_master_enter_idle_phase");
   
   
   procedure ec_master_leave_idle_phase (Master_P : Ec_Master_Ptr);
   --  Transition function from IDLE to ORPHANED phase.
   pragma Export (C, ec_master_leave_idle_phase, "ec_master_leave_idle_phase");
   
   
   function Ec_Master_Enter_Operation_Phase
     (arg1 : Ec_Master_Ptr) return int;
   pragma Export
     (C,
      Ec_Master_Enter_Operation_Phase,
      "ec_master_enter_operation_phase");
   
   
   procedure Ec_Master_Leave_Operation_Phase (arg1 : Ec_Master_Ptr);
   pragma Export
     (C,
      Ec_Master_Leave_Operation_Phase,
      "ec_master_leave_operation_phase");
   
   
   -- datagram IO
   
   
   procedure Ec_Master_Receive_Datagrams
     (Master_P     : Ec_Master_Ptr;
      Device_P     : Device.Ec_Device_Ptr;
      Frame_Date_P : System.Address;
      Size         : L.size_t);
   --  Processes a received frame.
   --
   --  This function is called by the network driver for every received frame.
   --
   --  return 0 in case of success, else < 0
   pragma Export
     (C,
      Ec_Master_Receive_Datagrams,
      "ec_master_receive_datagrams");
   
   
   procedure ec_master_set_send_interval
     (arg1 : Ec_Master_Ptr;
      arg2 : unsigned);
   --  pragma Import
   --    (C,
   --     ec_master_set_send_interval,
   --     "ec_master_set_send_interval");

   function Ec_Master_Debug_Level
     -- set debug level
     -- 
     --  Master : master access
     --  Level  : debug level. May be 0, 1 or 2.
     --  return 0 on succcess
     --         -EINVAL Invalid debug level.
     (Master : access Ec_Master;
      Level  : unsigned) return int;
   --pragma Import (C, ec_master_debug_level, "ec_master_debug_level");

end Niniel.Master;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Linux_Types;
-- with ecdev;
-- limited with Ecrt;

package device is
   package L renames Linux_Types;
   
   subtype Sk_Buff_Ptr is System.Address;
   type ec_device_tx_skb_array is array (0 .. 1) of Sk_Buff_Ptr;
   type ec_device_tx_frame_rates_array is array (0 .. 2) of aliased L.s32;
   type ec_device_rx_frame_rates_array is array (0 .. 2) of aliased L.s32;
   type ec_device_tx_byte_rates_array is array (0 .. 2) of aliased L.s32;
   type ec_device_rx_byte_rates_array is array (0 .. 2) of aliased L.s32;
   
   subtype Ec_Master_Ptr is System.Address;
   subtype Net_Device_Ptr is System.Address;
   subtype Ec_Pollfunc_Ptr is System.Address;
   
   
   type ec_device is record
      master : Ec_Master_Ptr;
      dev : Net_Device_Ptr;
      poll : Ec_Pollfunc_Ptr;
      the_module : System.Address;
      open : aliased L.U8;
      link_state : aliased L.U8;
      tx_skb : aliased ec_device_tx_skb_array;
      tx_ring_index : aliased unsigned;
      jiffies_poll : aliased unsigned_long;
      tx_count : aliased L.U64;--asm_generic_int_ll64_h.u64;
      last_tx_count : aliased L.U64;--asm_generic_int_ll64_h.u64;
      rx_count : aliased L.U64;--asm_generic_int_ll64_h.u64;
      last_rx_count : aliased L.U64;--asm_generic_int_ll64_h.u64;
      tx_bytes : aliased L.U64;--asm_generic_int_ll64_h.u64;
      last_tx_bytes : aliased L.U64;--asm_generic_int_ll64_h.u64;
      rx_bytes : aliased L.U64;--asm_generic_int_ll64_h.u64;
      last_rx_bytes : aliased L.U64;--asm_generic_int_ll64_h.u64;
      tx_errors : aliased L.U64;--asm_generic_int_ll64_h.u64;
      tx_frame_rates : aliased ec_device_tx_frame_rates_array;
      rx_frame_rates : aliased ec_device_rx_frame_rates_array;
      tx_byte_rates : aliased ec_device_tx_byte_rates_array;
      rx_byte_rates : aliased ec_device_rx_byte_rates_array;
   end record;
   pragma Convention (C_Pass_By_Copy, ec_device);
   
   type Ec_Device_A_Type is access all Ec_Device;
   subtype Ec_Device_Ptr is System.Address;

   
   function ec_device_init (arg1 : Ec_Device_Ptr; 
                            arg2 : System.Address) 
                           return int;
   --   Constructor.
   --
   --   return 0 in case of success, else < 0
   pragma Import (C, ec_device_init, "ec_device_init");
   
   procedure ec_device_clear (arg1 : Ec_Device_Ptr);
   --  Destructor.
   pragma Import (C, ec_device_clear, "ec_device_clear");
   
   
   procedure ec_device_poll (arg1 : Ec_Device_Ptr);
   --   Calls the poll function of the assigned net_device.
   --
   --  The master itself works without using interrupts. 
   --  Therefore the processing of received data and status changes of the 
   --  network device has to be done by the master calling the ISR "manually".
   pragma Import (C, ec_device_poll, "ec_device_poll");

   
   function ec_device_tx_data (arg1 : Ec_Device_Ptr) 
                              --return access L.U8; -- maybe system address
                              return System.Address;
   --  Returns a pointer to the device's transmit memory.
   --
   --  return pointer to the TX socket buffer
   pragma Import (C, ec_device_tx_data, "ec_device_tx_data");
   
   
   procedure ec_device_send (arg1 : Ec_Device_Ptr; 
                             arg2 : L.size_t);
   --  Sends the content of the transmit socket buffer.
   --
   --  Cuts the socket buffer content to the (now known) size, and calls the
   --  start_xmit() function of the assigned net_device.
   pragma Import (C, ec_device_send, "ec_device_send");
   
   
   procedure ec_device_clear_stats (arg1 : Ec_Device_Ptr);
   --  Clears the frame statistics.
   pragma Import (C, ec_device_clear_stats, "ec_device_clear_stats");
   
   
   procedure ec_device_update_stats (arg1 : Ec_Device_Ptr);
   --  Update device statistics.
   pragma Import (C, ec_device_update_stats, "ec_device_update_stats");

end device;

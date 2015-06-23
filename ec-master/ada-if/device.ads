pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Linux_Types;
-- with ecdev;
-- limited with Ecrt;

package device is
   package L renames Linux_Types;

   --type ec_device_tx_skb_array is array (0 .. 1) of access linux_skbuff_h.sk_buff;
   type ec_device_tx_frame_rates_array is array (0 .. 2) of aliased L.s32;
   type ec_device_rx_frame_rates_array is array (0 .. 2) of aliased L.s32;
   type ec_device_tx_byte_rates_array is array (0 .. 2) of aliased L.s32;
   type ec_device_rx_byte_rates_array is array (0 .. 2) of aliased L.s32;
   
   subtype Ec_Device_Ptr is System.Address;

   
   function ec_device_init (arg1 : Ec_Device_Ptr; 
                            arg2 : System.Address) 
                           return int;
   pragma Import (C, ec_device_init, "ec_device_init");
   
   procedure ec_device_clear (arg1 : Ec_Device_Ptr);
   pragma Import (C, ec_device_clear, "ec_device_clear");

end device;

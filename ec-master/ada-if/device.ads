pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Linux_Types;
with ecdev;
limited with Ecrt;

package device is
   package L renames Linux_Types;

   --type ec_device_tx_skb_array is array (0 .. 1) of access linux_skbuff_h.sk_buff;
   type ec_device_tx_frame_rates_array is array (0 .. 2) of aliased L.s32;
   type ec_device_rx_frame_rates_array is array (0 .. 2) of aliased L.s32;
   type ec_device_tx_byte_rates_array is array (0 .. 2) of aliased L.s32;
   type ec_device_rx_byte_rates_array is array (0 .. 2) of aliased L.s32;

end device;

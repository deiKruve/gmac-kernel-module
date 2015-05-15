pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
--with device;
--limited with linux_netdevice_h;
with System;
with Linux_Types;

package ecdev is
   package L renames Linux_Types;

   subtype Ec_Device_T_Ptr is System.Address; -- device.h
   subtype Net_Device_Ptr is System.Address; -- linux_netdevice_h

   type ec_pollfunc_t is access procedure (arg1 : Net_Device_Ptr);
   -- Device poll function type.
   pragma Convention (C, ec_pollfunc_t);

   -------------------------------------
   --  Offering/withdrawal functions  --
   -------------------------------------

   function ecdev_offer
     (net_dev    : Net_Device_Ptr;
      poll       : ec_pollfunc_t;
      the_module : System.Address) return Ec_Device_T_Ptr;
   pragma Import (Cpp, ecdev_offer, "ecdev_offer");

   procedure ecdev_withdraw (device : Ec_Device_T_Ptr);
   pragma Import (Cpp, ecdev_withdraw, "ecdev_withdraw");

   ----------------------
   --  Device methods  --
   ----------------------

   function ecdev_open (device : Ec_Device_T_Ptr) return int;
   pragma Import (Cpp, ecdev_open, "ecdev_open");

   procedure ecdev_close (device : Ec_Device_T_Ptr);
   pragma Import (Cpp, ecdev_close, "ecdev_close");

   procedure ecdev_receive
     (device : Ec_Device_T_Ptr;
      data   : System.Address;
      size   : L.size_t);
   pragma Import (Cpp, ecdev_receive, "ecdev_receive");

   procedure ecdev_set_link (device : Ec_Device_T_Ptr; state : L.u8);
   pragma Import (Cpp, ecdev_set_link, "ecdev_set_link");

   function ecdev_get_link (device : System.Address) return L.u8;
   pragma Import (Cpp, ecdev_get_link, "ecdev_get_link");

end ecdev;

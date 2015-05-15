pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Linux_Types;

package Cdev is

   ------------------
   --  data types  --
   ------------------
   subtype Ec_Master_T_Ptr is System.Address;
   -- copied from master.ads

   type ec_cdev_t is record
      master   : Ec_Master_T_Ptr;
      the_cdev : aliased Linux_Types.cdev;
   end record;
   pragma Convention (C_Pass_By_Copy, ec_cdev_t);

   ----------------------------
   --  function proto types  --
   ----------------------------

   function ec_cdev_init
     (arg1 : access ec_cdev_t;
      arg2 : Ec_Master_T_Ptr;
      arg3 : Linux_Types.dev_t) return int;
   pragma Import (C, ec_cdev_init, "ec_cdev_init");

   procedure ec_cdev_clear (arg1 : access ec_cdev_t);
   pragma Import (C, ec_cdev_clear, "ec_cdev_clear");

end Cdev;

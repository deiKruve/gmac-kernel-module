
with System;
with Interfaces.C; use Interfaces.C;
with Linux_Types;

package Nienor.Master is
   package L   renames Linux_Types;
   
   type ec_master is record
      Fd : Int := -1;
      Process_Data_Ptr  : System.Address := System.Null_Address;
      Process_Data_Size : L.Size_T       := 0;
   end record;
   
   type Ec_Master_A is access all Ec_Master;
   

   type Ec_Ioctl_Module is record
      Ioctl_Version_Magic : Unsigned;
      Master_Count        : Unsigned;
   end record;
   
   type Ec_Ioctl_Module_A is access all Ec_Ioctl_Module;
   
   
   function Ecrt_Request_Master (Master_Idx : Unsigned) return Ec_Master_A;
   
   function Ecrt_Open_Master (Master_Idx : Unsigned) return Ec_Master_A;
   
   procedure Ecrt_Release_Master (Master_A : in out Ec_Master_A);
   -- at the end of the day release all memory
   
   
   --  -- so we can report errors to the real time thread.
   --  type Error_Reporter_Type is access procedure (Err_Str : String);
   --  M_Report_Error : Error_Reporter_Type;
   
end Nienor.Master;

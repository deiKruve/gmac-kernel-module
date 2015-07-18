
with Linux_Types;

package Nienor.Master is
   package L   renames Linux_Types;
   
   type ec_master is record
      Fd : Integer := -1;
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
   
   
   
end Nienor.Master;

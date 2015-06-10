
package body Niniel.Ioctl is
   
   package Ic  renames Interfaces.C;
   package Mr  renames Master;
   
   I : Integer;
   function Gm_Ioctl (This_Master : Mr.Ec_Master_T_Ptr; 
			Ctx  : access  Ec_Ioctl_Context_T; 
			Cmd  : Ic.Unsigned; 
			Arg  : Void_Ptr) 
		     return Ic.Long
   is
      Cty : access  Ec_Ioctl_Context_T; 
   begin
      Cty := new Ec_Ioctl_Context_T;
      return 0;
   end Gm_Ioctl;
begin
   I := 1;
end Niniel.Ioctl;

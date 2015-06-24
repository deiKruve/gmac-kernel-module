
with Ada.Unchecked_Conversion;

package body Niniel.Ioctl is
   
   package Ic  renames Interfaces.C;
   package Mr  renames Master;
   
   function ec_ioctl
     (Master_P : Mr.Ec_Master_T_Ptr;
      Ctx_P    : Ec_Ioctl_Context_Ptr;
      cmd      : unsigned;
      arg      : Ice.Void_Ptr) return Long
   is
      function Toa is new 
        Ada.Unchecked_Conversion (Source => Mr.Ec_Master_T_Ptr,
                                  Target => Mr.Ec_Master_A_Type);
      function Toca is new 
        Ada.Unchecked_Conversion (Source => Ec_Ioctl_Context_Ptr,
                                  Target => Ec_Ioctl_Context_A_Type);
      Master    : access Mr.Ec_Master := Toa (Master_P);
      Ctx       : access Ec_Ioctl_Context_T := Toca (Ctx_P);
   begin
      return 0;
   end Ec_Ioctl;
   
   
   function Gm_Ioctl (This_Master : Mr.Ec_Master_T_Ptr; 
			Ctx  : access  Ec_Ioctl_Context_T; 
			Cmd  : Ic.Unsigned; 
			Arg  : Ice.Void_Ptr) 
		     return Ic.Long
   is
       
   begin
      
      return 0;
   end Gm_Ioctl;
   
   
end Niniel.Ioctl;

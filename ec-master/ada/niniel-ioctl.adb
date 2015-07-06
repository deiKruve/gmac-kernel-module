
with Ada.Unchecked_Conversion;
with Errno_Base;
with Globals;
with Linux_Kif;

package body Niniel.Ioctl is
   
   package E   renames Errno_Base;
   package Ic  renames Interfaces.C;
   package Mr  renames Master;
   package Gl  renames Globals;
   package Lkf renames Linux_Kif;
   
      
   ----------------------------------------------------------------
   --  Get module information.                                   --
   --                                                            --
   --  return Zero on success, otherwise a negative error code.  --
   ----------------------------------------------------------------
   function  Ec_Ioctl_Module (arg : Ice.Void_Ptr) return int
   is
      M : Ec_Ioctl_Module_T;
      -- for M'Address use Arg;
   begin
      M.Ioctl_Version_Magic := EC_IOCTL_VERSION_MAGIC;
      M.Master_Count        := Gl.Ec_Master_Count;
      
      if Lkf.Copy_To_User (Arg, M'Address, Ec_Ioctl_Module_T'Size) /= 0 then
         return -E.EFAULT;
         
      else return 0;
      end if;
   end Ec_Ioctl_Module;
   
   
   --------------------------------------------------
   --  Called when an ioctl() command is issued.   --
   --                                              --
   --  return ioctl() return code.                 --
   --------------------------------------------------
   function ec_ioctl
     (Master_P : Mr.Ec_Master_Ptr;
      Ctx_P    : Ec_Ioctl_Context_Ptr;
      cmd      : Ioc.Ioctl_Cmd; --  was unsigned;
      arg      : Ice.Void_Ptr) return Long
   is
      use type Ioc.Ioctl_Cmd;
      function Toa is new 
        Ada.Unchecked_Conversion (Source => Mr.Ec_Master_Ptr,
                                  Target => Mr.Ec_Master_A_Type);
      function Toca is new 
        Ada.Unchecked_Conversion (Source => Ec_Ioctl_Context_Ptr,
                                  Target => Ec_Ioctl_Context_A_Type);
      Master    : access Mr.Ec_Master := Toa (Master_P);
      Ctx       : access Ec_Ioctl_Context_T := Toca (Ctx_P);
      Ret : Ic.Long := -1;
   begin
      
      if Cmd = NINR_IOCTL_MODULE then
         ret := Ic.Long (ec_ioctl_module(arg));
         null;
         --elsif Cmd = 
         --
         else return -E.ENOTTY;
      end if;
      return Ret;
   end Ec_Ioctl;
   
   
   
   --  function Gm_Ioctl (This_Master : Mr.Ec_Master_Ptr; 
   --       		Ctx  : access  Ec_Ioctl_Context_T; 
   --       		Cmd  : Ic.Unsigned; 
   --       		Arg  : Ice.Void_Ptr) 
   --       	     return Ic.Long
   --  is
       
   --  begin
      
   --     return 0;
   --  end Gm_Ioctl;
   
   
end Niniel.Ioctl;

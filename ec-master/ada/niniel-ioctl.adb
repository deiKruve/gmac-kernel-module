
with Ada.Unchecked_Conversion;
with Errno_Base;
with Errno;

with N_Ioctl;
with Globals;
with Linux_Kif;

with Niniel.Discover;

package body Niniel.Ioctl is
   
   package E    renames Errno_Base;
   package Ic   renames Interfaces.C;
   package Mr   renames Master;
   package Gl   renames Globals;
   package Lkf  renames Linux_Kif;
   package Nioc renames N_Ioctl;
   package Nd   renames Niniel.Discover;
   
      
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
   
   

   
   ------------------------------------------
   --  Request the master from userspace.  --
   --                                      --
   --  return Zero on success,             --
   --   otherwise a negative error code.   --
   ------------------------------------------
   function Ec_Ioctl_Request 
     (Master_P : Mr.Ec_Master_Ptr;     --  master.
      arg      : Ice.Void_Ptr;         --  ioctl() argument.
      Ctx_P    : Ec_Ioctl_Context_Ptr) -- Private data structure of file handle.
     return Int
   is
      M_P : Mr.Ec_Master_Ptr := Gl.Ecrt_Request_Master_Err (Master_P.Index);
      Ret : Int := 0;
   begin
      if Long (M.P) < 0 then
         Ret := Int (M.P);
      else
         Ctx_P.Requested = 1;
      end if;
      return Ret;
   end Ec_Ioctl_Request ;
   
   
   
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
      
      if Cmd = Nioc.NINR_IOCTL_MODULE then
         ret := Ic.Long (ec_ioctl_module(arg));
         null;
         
      elsif Cmd = Nioc.NINR_IOCTL_REQUEST then
         if not Ctx_P.Writable then
            Ret := -E.EPERM;
         else
            ret := Ec_Ioctl_Request (master, arg, ctx);
         end if;
         
      elsif Cmd = Nioc.NINR_DISCOVERY_REQUEST then
         if not Ctx_P.Writable then
            Ret := -E.EPERM;
         else
            Master_Fsm_State := Send_Discovery;
            ret := 0;
         end if;
         
      elsif Cmd = Nioc.NINR_DISCOVERY_POLL then
         if not Ctx_P.Writable then
            Ret := -E.EPERM;
         else
            if Master_Fsm_State = Pre_Operational then
               Ret := 0;
            elsif Master_Fsm_State = Disco_Hung then
               Ret := -E.DISCO_HUNG;
            else
               Ret := E.DISCO_WORKING;
            end if;
         end if;
         
      elsif Cmd = Nioc.NINR_DISCOVERY_STAT_REQUEST then
         if not Ctx_P.Writable then
            Ret := -E.EPERM;
         else
            declare 
               hw_Status : Hwd.Field_Status_Image_Type;
               for Hw_Status'Address use Arg;
            begin
               Hw_Status := Niniel.Discover.Field_Status;
            end;
            return 0;
         end if;
               
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

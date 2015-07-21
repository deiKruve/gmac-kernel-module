
with Ada.Unchecked_Conversion;
with Errno_Base;

with Globals;
with Linux_Kif;
with Linux_Semaphore;

with Hw_Definition.Main;

with Niniel.Discover;

package body Niniel.Ioctl is
   
   package E    renames Errno_Base;
   package Ic   renames Interfaces.C;
   package Mr   renames Master;
   package Gl   renames Globals;
   package Lkf  renames Linux_Kif;
   package Lsm renames Linux_Semaphore;
   package Nd   renames Niniel.Discover;
   package Hwdm renames Hw_Definition.Main;
      
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
     (Master_A : access Mr.Ec_Master;     --  master.
      arg      : Ice.Void_Ptr;         --  ioctl() argument.
      Ctx_A    : Ec_Ioctl_Context_A_type) -- Private data structure of file handle.
     return Int
   is
      pragma Unreferenced (Arg);
      function Tol is new 
        Ada.Unchecked_Conversion (Source => Mr.Ec_Master_Ptr,
                                  Target => Long);
      M_P : constant Mr.Ec_Master_Ptr := 
        Gl.Ecrt_Request_Master_Err (Master_A.Index);
      Ret : Int := 0;
   begin
      if Tol (M_P) < 0 then
         Ret := Int (Tol (M_P));
      else
         Ctx_A.Requested := 1;
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
      arg      : Ice.Void_Ptr) 
     return Long
   is
      use type Ioc.Ioctl_Cmd;
      use type Master.Master_Fsm_State_Type;
      function Toa is new 
        Ada.Unchecked_Conversion (Source => Mr.Ec_Master_Ptr,
                                  Target => Mr.Ec_Master_A_Type);
      function Toca is new 
        Ada.Unchecked_Conversion (Source => Ec_Ioctl_Context_Ptr,
                                  Target => Ec_Ioctl_Context_A_Type);
      function Toxa is new 
        Ada.Unchecked_Conversion (Source => Ec_Ioctl_Context_Ptr,
                                  Target => Ec_Ioctl_Context_A_Type);
      Ctx_A : constant Ec_Ioctl_Context_A_Type := Toxa (Ctx_P);
      Master_A  : constant access Mr.Ec_Master := Toa (Master_P);
      Ret : Ic.Int := -1;
   begin
      
      if Cmd = Nioc.NINR_IOCTL_MODULE then
         ret := ec_ioctl_module(arg);
         null;
         
      elsif Cmd = Nioc.NINR_IOCTL_REQUEST then
         if Ctx_A.Writable = 0 then
            Ret := -E.EPERM;
         else
            ret := Ec_Ioctl_Request (Master_A, arg, Ctx_A);
         end if;
         
      elsif Cmd = Nioc.NINR_DISCOVERY_REQUEST then
         if Ctx_A.Writable = 0 then
            Ret := -E.EPERM;
         else
            Master.Master_Fsm_State := Master.Send_Discovery;
            ret := 0;
         end if;
         
      elsif Cmd = Nioc.NINR_DISCOVERY_POLL then
         if Ctx_A.Writable = 0 then
            Ret := -E.EPERM;
         else
            if Master.Master_Fsm_State = Master.Pre_Operational then
               Ret := 0;
            elsif Master.Master_Fsm_State = Master.Disco_Hung then
               Ret := -E.DISCO_HUNG;
            else
               Ret := E.DISCO_WORKING;
            end if;
         end if;
         
      elsif Cmd = Nioc.NINR_DISCOVERY_STAT_REQUEST then
         if Ctx_A.Writable = 0 then
            Ret := -E.EPERM;
            
         else
            if (Lsm.Down_Interruptible(Nd.Disc_Sem'address) /= 0) then
               -- should not happen anyway.
               Master.Niniel_Debug 
                 (Master_A, 0, "ioctl: interrupted disc_sem semaphore");
            end if;
            
            if Lkf.Copy_To_User (Arg, Nd.Field_Status'Address, 
                                 Hwdm.Field_Status_Image_Type'Size) /= 0 then
               Ret := -E.EFAULT;
            else
               Ret := 0;
            end if;
            
            Lsm.Up (Nd.Disc_Sem'Address);

         end if;
         
         --
      else Ret := -E.ENOTTY;
      end if;
      return Ic.Long (Ret);
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

------------------------------------------------------------------------------
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                           N I N I E L . I O C T L                        --
--                                                                          --
--                                   B o d y                                --
--                                                                          --
--                     Copyright (C) 2015, Jan de Kruyf                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.                                               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
--          NINIEL - NIENOR  is maintained by J de Kruijf Engineers         --
--                     (email: jan.de.kruyf@hotmail.com)                    --
--                                                                          --
------------------------------------------------------------------------------

-- implementation of a fast Ethernet communication server
--
-- This is kernel side of the user / kernel communication
--

with System.Address_To_Access_Conversions;
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
      Ctx_A    : access Ec_Ioctl_Context_T) -- Private data structure of 
                                            -- file handle.
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
      
      package ecmas is new 
        System.Address_To_Access_Conversions (Object => Mr.Ec_Master);
      package Iocont is new
        System.Address_To_Access_Conversions (Object => Ec_Ioctl_Context_t);
      
      Ctx_A : constant access Ec_Ioctl_Context_T := Iocont.To_Pointer (Ctx_P);
      Master_A  : constant access Mr.Ec_Master := Ecmas.To_Pointer (Master_P);
      Ret : Ic.Int := -1;
   begin
      Mr.Niniel_Debug (Master_A, 0, "weare in ec_ioctl");
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

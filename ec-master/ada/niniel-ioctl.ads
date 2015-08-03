------------------------------------------------------------------------------
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                           N I N I E L . I O C T L                        --
--                                                                          --
--                                   S p e c                                --
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

with System;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with Linux_Types;
with Asm_Ioctl;
with N_Ioctl;
with Niniel.Master;

package Niniel.Ioctl is
   package L    renames Linux_Types;
   package Ioc  renames Asm_Ioctl;
   package Nioc renames N_Ioctl;
   package Ice  renames Interfaces.C.Extensions;
   
   
   EC_IOCTL_VERSION_MAGIC : constant L.U32 := 01;
   --  needs to change when the interface presented to userspace is 
   --  not consistent anymore.
   

   subtype Ec_Ioctl_Module_T is Nioc.Ec_Ioctl_Module_T;
   --  type ec_ioctl_module_t is record
   --     ioctl_version_magic : aliased L.u32;
   --     master_count        : aliased L.u32;
   --  end record;
   --  pragma Convention (C_Pass_By_Copy, ec_ioctl_module_t);
   
   
   type ec_ioctl_context_t is record
      -- Context data structure for file handles.
      writable : aliased unsigned;
      -- Device was opened with write permission.
      requested : aliased unsigned;
      -- Master was requested via this file handle.
      process_data : access L.u8;
      -- Total process data area. 
      process_data_size : aliased L.size_t;
      -- Size of the \a process_data.
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_context_t);
   
   type Ec_Ioctl_Context_A_Type is access all Ec_Ioctl_Context_T;
   subtype Ec_Ioctl_Context_Ptr is System.Address;
   
   
   function ec_ioctl
     (Master_P : Master.Ec_Master_Ptr;
      Ctx_P    : Ec_Ioctl_Context_Ptr;
      cmd      : Ioc.Ioctl_Cmd; --  was unsigned;
      arg      : Ice.Void_Ptr) return long;
   --  Called when an ioctl() command is issued.   --
   --                                              --
   --  return ioctl() return code.                 --
   pragma Export (C, ec_ioctl, "ec_ioctl");
   
   
   --  function Gm_Ioctl (This_Master : Master.Ec_Master_T_Ptr; 
   --       		Ctx  : access  Ec_Ioctl_Context_T; 
   --       		Cmd  : Unsigned; 
   --       		Arg  : Ice.Void_Ptr) 
   --       	     return Interfaces.C.Long;
   
   
end Niniel.Ioctl;

------------------------------------------------------------------------------
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                                 N I N I E L                              --
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
-- This is the root package on the kernel side
--

with System.Memory;
with Linux_Kernel;

package body Niniel is
   package Lk  renames Linux_Kernel;
   package Sm  renames System.Memory;
   
   
   -----------------------------------------------------
   --  initializes the ada part of the kernel module  --
   -----------------------------------------------------
   
   procedure Init
   is
   begin
      Lk.Printk ("Niniel_Ada is loaded");
   end Init;
   
   
   ---------------------------------------------------
   --  cleans up the ada part of the kernel module  --
   --  at module unloading time.                    --
   ---------------------------------------------------
   
   procedure N_Exit
   is
   begin
      Lk.Printk ("Niniel_Ada has passed on");
   end N_Exit;
   
    
begin
   Sm.Get_Free_Pages;  -- get some heap space
end Niniel;

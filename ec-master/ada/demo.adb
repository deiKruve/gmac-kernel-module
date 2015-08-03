------------------------------------------------------------------------------
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                            N I N I E L . D E M O                         --
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
-- This is the 'main' package on the kernel side.
-- it serves no useful purpose, except for aiding in the production of
-- a partial compilation for the Niniel kernel module
--


--with System.Standard_Library;
pragma Restrictions (No_Exception_Propagation);
--  Only local exception handling is supported in this profile

pragma Restrictions (No_Exception_Registration);
--  Disable exception name registration. This capability is not used because
--  it is only required by exception stream attributes which are not supported
--  in this run time.

pragma Restrictions (No_Implicit_Dynamic_Code);
--  Pointers to nested subprograms are not allowed in this run time, in order
--  to prevent the compiler from building "trampolines".

pragma Restrictions (No_Finalization);
--  Controlled types are not supported in this run time

--with Ada.Unchecked_Conversion; pragma Unreferenced (Ada.Unchecked_Conversion);

with System.Memory;  pragma Unreferenced (System.Memory);
-- we need to have to have a bit of heap available for gnat, it is implemented
-- in System.Memory. The exact semantics are not clear yet. At the moment
-- System.Memory.Get_Free_Pages needs to be called as a first statement 
-- in elaboration.

with Memory_Copy; pragma Unreferenced (Memory_Copy);

with Secondary_Stack;  pragma Unreferenced (Secondary_Stack);
-- we need a secondary stack for some functions

with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
--  The "last chance handler" is the user-defined routine that is called when
--  an exception is propagated. We need it in the executable, therefore it
--  must be somewhere in the closure of the context clauses.

with Niniel.Ioctl;   pragma Unreferenced (Niniel.Ioctl);
--  with Niniel;  pragma Unreferenced (Niniel);
with Niniel.Master;   pragma Unreferenced (Niniel.Master);

procedure Demo
is
begin
   null;
end Demo;

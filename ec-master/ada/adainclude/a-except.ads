------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                       A D A . E X C E P T I O N S                        --
--       (Version for No Exception Handlers/No_Exception_Propagation)       --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--          Copyright (C) 1992-2014, Free Software Foundation, Inc.         --
--                                                                          --
-- This specification is derived from the Ada Reference Manual for use with --
-- GNAT. The copyright notice above, and the license provisions that follow --
-- apply solely to the  contents of the part following the private keyword. --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  Version is for use when there are no handlers in the partition (i.e. either
--  of Restriction No_Exception_Handlers or No_Exception_Propagation is set).

with System;

package Ada.Exceptions is
   pragma Preelaborate;
   --  In accordance with Ada 2005 AI-362

   type Exception_Id is private;
   pragma Preelaborable_Initialization (Exception_Id);

   Null_Id : constant Exception_Id;

   procedure Raise_Exception (E : Exception_Id; Message : String := "");
   pragma No_Return (Raise_Exception);
   --  Unconditionally call __gnat_last_chance_handler. Message should be a
   --  null terminated string. Note that the exception is still raised even
   --  if E is the null exception id. This is a deliberate simplification for
   --  this profile (the use of Raise_Exception with a null id is very rare in
   --  any case, and this way we avoid introducing Raise_Exception_Always and
   --  we also avoid the if test in Raise_Exception).

   -----------------------------------
   --  dummies to keep gnat normal  --
   -----------------------------------
   procedure Rcheck_CE_Access_Check
     (File : System.Address; Line : Integer);
   pragma No_Return (Rcheck_CE_Access_Check);
   pragma Export (C, Rcheck_CE_Access_Check,
                  "__gnat_rcheck_CE_Access_Check");

   procedure Rcheck_CE_Index_Check
     (File : System.Address; Line : Integer);
   pragma No_Return (Rcheck_CE_Index_Check);
   pragma Export (C, Rcheck_CE_Index_Check,
                  "__gnat_rcheck_CE_Index_Check");

   procedure Rcheck_CE_Invalid_Data
     (File : System.Address; Line : Integer);
   pragma No_Return (Rcheck_CE_Invalid_Data);
   pragma Export (C, Rcheck_CE_Invalid_Data,
                  "__gnat_rcheck_CE_Invalid_Data");

   procedure Rcheck_CE_Range_Check
     (File : System.Address; Line : Integer);
   pragma No_Return (Rcheck_CE_Range_Check);
   pragma Export (C, Rcheck_CE_Range_Check,
                  "__gnat_rcheck_CE_Range_Check");

   procedure Rcheck_PE_Unchecked_Union_Restriction
     (File : System.Address; Line : Integer);
   pragma No_Return (Rcheck_PE_Unchecked_Union_Restriction);
   pragma Export (C, Rcheck_PE_Unchecked_Union_Restriction,
                  "__gnat_rcheck_PE_Unchecked_Union_Restriction");

   procedure Rcheck_CE_Divide_By_Zero
     (File : System.Address; Line : Integer);
   pragma No_Return (Rcheck_CE_Divide_By_Zero);
   pragma Export (C, Rcheck_CE_Divide_By_Zero,
                  "__gnat_rcheck_CE_Divide_By_Zero");

   procedure Personality_V0
     (File : System.Address; Line : Integer);
   --  the arguments are wrong here,
   --  dont know if it matters.
   pragma No_Return (Personality_V0);
   pragma Export (C, Personality_V0,
                  "__gnat_personality_v0");

private

   ------------------
   -- Exception_Id --
   ------------------

   type Exception_Id is access all System.Address;
   Null_Id : constant Exception_Id := null;

   pragma Inline_Always (Raise_Exception);

end Ada.Exceptions;

------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                         S Y S T E M . M E M O R Y                        --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--          Copyright (C) 2001-2011, Free Software Foundation, Inc.         --
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

--  Simple implementation for use with ZFP

with System.Storage_Elements;
with Ada.Unchecked_Conversion;
with Linux_Gfp;

package body System.Memory is

   package SSE renames System.Storage_Elements;
   package Gfp renames Linux_Gfp;
   
   
   type Mark_Id is new SSE.Integer_Address;   
   
   Page_Size := 4096;
   Order := Gfp.Pages2;
   Default_Size : Integer := 2**Order * Page_Size;
   -- heap size
   Heap_Start := Mark_Id;

   type Memory is array (Mark_Id range <>) of SSE.Storage_Element;
   for Memory'Alignment use Standard'Maximum_Alignment;
   for Memory'Address use Heap_Start;

   Mem : Memory (1 .. Default_Size);

   Top : Mark_Id := Mem'First;
   -- lowest heap address

   function To_Mark_Id is new Ada.Unchecked_Conversion
     (size_t, Mark_Id);

   ----------------
   -- For C code --
   ----------------

   function Malloc (Size : size_t) return System.Address;
   pragma Export (C, Malloc, "malloc");

   function Calloc (N_Elem : size_t; Elem_Size : size_t) return System.Address;
   pragma Export (C, Calloc, "calloc");

   procedure Free (Ptr : System.Address);
   pragma Export (C, Free, "free");

   -----------
   -- Alloc --
   -----------

   function Alloc (Size : size_t) return System.Address is
      Max_Align : constant Mark_Id := Mark_Id (Standard'Maximum_Alignment);
      Max_Size  : Mark_Id :=
	((To_Mark_Id (Size) + Max_Align - 1) / Max_Align) *
	Max_Align;
      Location  : constant Mark_Id := Top;

   begin
      if Max_Size = 0 then
         Max_Size := Max_Align;
      end if;

      if Size = size_t'Last then
         raise Storage_Error;
      end if;

      Top := Top + Max_Size;

      if Top > Default_Size then
         raise Storage_Error;
      end if;

      return Mem (Location)'Address;
   end Alloc;
   

   ------------
   -- Malloc --
   ------------

   function Malloc (Size : size_t) return System.Address is
   begin
      return Alloc (Size);
   end Malloc;

   ------------
   -- Calloc --
   ------------

   function Calloc
     (N_Elem : size_t; Elem_Size : size_t) return System.Address
   is
   begin
      return Malloc (N_Elem * Elem_Size);
   end Calloc;

   ----------
   -- Free --
   ----------

   procedure Free (Ptr : System.Address) is
      pragma Unreferenced (Ptr);
   begin
      null;
   end Free;
   
   
   -----------------------
   --  get_free_pages   --
   -----------------------
   
   procedure get_free_pages
   is
   begin
      Heap_Start := Gfp.K_Get_Free_Pages (Gfp.GFP_KERNEL, Order);
   end Get_Free_Pages;
   
   
end System.Memory;

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
with Interfaces.C;
with Ada.Unchecked_Conversion;
with Linux_Kernel;
--  with Sys_Mman;

package body System.Memory is

   package SSE renames System.Storage_Elements;
   package Gfp renames linux_gfp;
   package Lk  renames Linux_Kernel;
   --  package Mmn renames Sys_Mman;

   type Mark_Id is new SSE.Integer_Address;

   Default_Size : constant Mark_Id := Mark_Id (2**Order * Page_Size);
   --  heap size

   Heap_Start : System.Address;

   type Memory is array (Mark_Id range <>) of SSE.Storage_Element;
   for Memory'Alignment use Standard'Maximum_Alignment;

   Top : Mark_Id;
   --  lowest free heap address

   function To_Mark_Id is new Ada.Unchecked_Conversion (size_t, Mark_Id);

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

   function Alloc (Size : size_t) return System.Address
   is
      use SSE;
      Max_Align : constant Mark_Id := Mark_Id (Standard'Maximum_Alignment);
      Max_Size  : Mark_Id          :=
        ((To_Mark_Id (Size) + Max_Align - 1) / Max_Align) * Max_Align;
      Location : constant Mark_Id := Top;
   begin
      if Max_Size = 0 then
         Max_Size := Max_Align;
      end if;

      if Size = size_t'Last then
         --  raise Storage_Error;
         goto Error;
      end if;

      Top := Top + Max_Size;

      if Top > Default_Size then
         --  raise Storage_Error;
         goto Error;
      end if;
      return (Heap_Start + SSE.Storage_Offset (Location) -
                SSE.Storage_Offset (1));
   <<Error>>
      Lk.Printk ("s-memory : No Memory, heap too small");
      return System.Null_Address;
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
     (N_Elem    : size_t;
      Elem_Size : size_t) return System.Address
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

   procedure Get_Free_Pages
   is
      use type Interfaces.C.unsigned_long;
      I : Mark_Id;
   begin
      Heap_Start :=
        System.Address (Gfp.k_get_free_pages (Gfp.k_GFP_DMA, Order));
      if Heap_Start = 0 then
         Lk.Printk ("s-memory : No Kernel Memory available");
      else
         declare
            Mem : Memory (1 .. Default_Size);
            for Mem'Address use Heap_Start;
         begin
            Top := Mem'First;
            --  if Mmn.Mlockall (Mmn.MCL_CURRENT + Mmn.MCL_FUTURE) /= 0 then
            --     Lk.Printk ("s-memory : memory locking failed");
            --  else
            --  Touch each page in this piece of memory to get it mapped
            --    into RAM.
            I := Mem'First;
            while I <= Mem'Last loop
               Mem (I) := 0;
               I := I + Page_Size;
            end loop;
            Lk.Printk ("niniel: got 2 pages of heap memory");
         end;
      end if;
   end Get_Free_Pages;

end System.Memory;

with System;
with Ada.Unchecked_Conversion;
with Interfaces.C.Strings;

package body Linux_Kernel is
   package Ic  renames Interfaces.C;
   package Ics renames Interfaces.C.Strings;
   
   
   -----------------
   --  utilities  --
   -----------------
   
   function To_chars_ptr is
      new Ada.Unchecked_Conversion (System.Address, Ics.chars_ptr);
   
   
   --  ada string without line feed to c string with linefeed --
   function To_C
     (Item       : String) return Ic.char_array
   is
      use type Ic.Size_T;
      R : Ic.char_array (0 .. Item'Length + 1);
   begin
      for J in Item'Range loop
	 R (Ic.size_t (J - Item'First)) := 
	   Ic.char'Val (Character'Pos (Item (J)));
      end loop;
      R (R'Last - 1) := Ic.char'Val (10);
      R (R'Last) := Ic.nul;
      return R;
   end To_C;
   
   
   --------------------
   --  Kernel Calls  --
   --------------------

   procedure Printk( s : string )
   is
      procedure Kprintk (S : Ics.Chars_Ptr);
      pragma import( C, kprintk, "printk" );
      Ca : Ic.Char_Array := To_C (S);
   begin
      Kprintk (To_Chars_Ptr (Ca'address));
   end Printk;
   
end Linux_Kernel;


pragma Warnings (Off, "*may call Last_Chance_Handler");
pragma Warnings (Off, "*(No_Exception_Propagation) in effect");
pragma Restrictions (No_Exception_Propagation);
pragma Restrictions (No_Exception_Handlers);

--  with System;
--  with Ada.Unchecked_Conversion;
--  with Interfaces.C.Strings;

package body Linux_Kernel is
   --  package Ic  renames Interfaces.C;
   --  npackage Ics renames Interfaces.C.Strings;
   
   
   -----------------
   --  utilities  --
   -----------------
   
   --  function To_chars_ptr is
   --     new Ada.Unchecked_Conversion (System.Address, Ics.chars_ptr);
   
   
   --  ada string without line feed to c string with linefeed --
   --  function To_C
   --    (Item       : String) return Ic.char_array
   --  is
   --     --  procedure Kprintk (S : String);
   --     --  pragma import( C, kprintk, "printk" );
   --     use type Ic.Size_T;
   --     R : Ic.char_array (0 .. Item'Length + 1);
   --  begin
   --     if Item'Length > 0 then
   --  	 for J in Item'Range loop
   --  	    R (Ic.size_t (J - Item'First)) := 
   --  	      Ic.char'Val (Character'Pos (Item (J)));
   --  	 end loop;
   --     end if;
   --     R (R'Last - 1) := Ic.char'Val (10);
   --     R (R'Last) := Ic.nul;
   --     return R;
   --  end To_C;
   
   
   --------------------
   --  Kernel Calls  --
   --------------------

   procedure Printk( s : string )
   is
      --  procedure Kprintk (S : Ics.Chars_Ptr);
      procedure Kprintk (S : String);
      pragma import( C, kprintk, "printk" );
      --  Ca : Ic.Char_Array := To_C (S);
   begin
      --  Kprintk (To_Chars_Ptr (Ca'address));
      Kprintk (S & ASCII.LF & ASCII.NUL);
   end Printk;
   
end Linux_Kernel;

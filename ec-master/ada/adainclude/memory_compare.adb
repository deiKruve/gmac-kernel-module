pragma Warnings (Off, "*may call Last_Chance_Handler");
pragma Warnings (Off, "*(No_Exception_Propagation) in effect");

with Ada.Unchecked_Conversion;

package body Memory_Compare is

   ------------
   -- memcmp --
   ------------

   function memcmp (S1 : Address; S2 : Address; N : size_t) return int is
      --  procedure Kprintk (S : String);
      --  pragma import( C, kprintk, "printk" );
      --  procedure Sleepforever;
      --  pragma Import (C, Sleepforever, "kif_sleepforever");
      --  pragma No_Return (Sleepforever);
      subtype mem is char_array (size_t);
      type memptr is access mem;
      function to_memptr is
        new Ada.Unchecked_Conversion (Address, memptr);
      s1_p : constant memptr := to_memptr (S1);
      s2_p : constant memptr := to_memptr (S2);
   begin
      for J in 0 .. N - 1 loop
         if s1_p (J) < s2_p (J) then
            return -1;
         elsif s1_p (J) > s2_p (J) then
            return 1;
         end if;
      end loop;
      return 0;
  --  <<Error>>
  --  	 Kprintk ("Memory_Compare : Constraint_Error");
  --  	 Sleepforever;	
   end memcmp;

end Memory_Compare;

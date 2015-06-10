with System;

package Last_Chance_Handler is

   procedure Last_Chance_Handler (Msg : System.Address; Line : Integer);
   pragma Export (C, Last_Chance_Handler, "__gnat_last_chance_handler");
   pragma No_Return (Last_Chance_Handler);
   --  In this incarnation will spin forever (see next item)
   
   procedure Spin (S : String);
   pragma No_Return (Spin);
   --  Spin prints the string and puts the kernel task to sleep forever.
   --  It is meant to be a safety measure, so that a broken task cannot
   --  do further damage.
   
end Last_Chance_Handler;

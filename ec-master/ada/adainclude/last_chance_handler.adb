
with Linux_Kernel;
with Linux_Kif;
package body Last_Chance_Handler is
   package Lk renames  Linux_Kernel;
   package Kif renames Linux_Kif;
   
   ----------------------------
   -- Sleeps forever, i hope --
   ----------------------------
   
   procedure Spin (S : String)
   is
   begin
      Lk.Printk (S);
      loop
	 Kif.Sleepforever;
	 Lk.Printk ("Bah, I was woken up");
      end loop;
   end Spin;
 
   -------------------------
   -- Last_Chance_Handler --
   -------------------------

   procedure Last_Chance_Handler (Msg : System.Address; Line : Integer) is
      pragma Unreferenced (Msg, Line);

      --  procedure OS_Exit (Status : Integer);
      --  pragma Import (C, OS_Exit, "exit");
      --  pragma No_Return (OS_Exit);
   begin
      --  No return procedure.
      Spin ("Last chance handler");
      --  OS_Exit (1);
   end Last_Chance_Handler;
   

end Last_Chance_Handler;

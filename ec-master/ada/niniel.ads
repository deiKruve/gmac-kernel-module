
package Niniel is
   
   
   procedure Init;
   pragma Export (C, Init, "niniel_init");
   --  initializes the ada part of the kernel module
 
   procedure N_Exit;
   pragma Export (C, N_Exit, "niniel_exit");
   --  cleans up the ada part of the kernel module
   --  at module unloading time.

end Niniel;

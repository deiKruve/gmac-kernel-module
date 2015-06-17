
with System.Memory;
with Linux_Kernel;

package body Niniel is
   package Lk  renames Linux_Kernel;
   package Sm  renames System.Memory;
   
   
   -----------------------------------------------------
   --  initializes the ada part of the kernel module  --
   -----------------------------------------------------
   
   procedure Init
   is
   begin
      Lk.Printk ("Niniel_Ada is loaded");
   end Init;
   
   
   ---------------------------------------------------
   --  cleans up the ada part of the kernel module  --
   --  at module unloading time.                    --
   ---------------------------------------------------
   
   procedure N_Exit
   is
   begin
      Lk.Printk ("Niniel_Ada has passed on");
   end N_Exit;
   
begin
   Sm.Get_Free_Pages;  -- get some heap space
end Niniel;

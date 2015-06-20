pragma Ada_2005;
pragma Style_Checks (Off);

--with System;
with Interfaces.C;
--with Interfaces.C.Extensions;
--with Interfaces.C.Strings;
--with Linux_Types;

package Linux_Kernel is
   
   --  prink levels
   
   KERN_EMERG   : constant String := "0";  -- system is unusable
   KERN_ALERT   : constant String := "1";  -- action must be taken immediately
   KERN_CRIT    : constant String := "2";  -- critical conditions
   KERN_ERR     : constant String := "3";  -- error conditions
   KERN_WARNING : constant String := "4";  -- warning conditions
   KERN_NOTICE  : constant String := "5";  -- normal but significant condition
   KERN_INFO    : constant String := "6";  -- informational
   KERN_DEBUG   : constant String := "7";  -- debug-level messages
   KERN_DEFAULT : constant String := "d";  -- the default kernel loglevel
 
   
   
   -- Kernel Calls

  procedure Printk (s : string);
  
  
  procedure Do_Exit (error_code : Interfaces.C.long);
   pragma Import (C, Do_Exit, "do_exit");
   
end Linux_Kernel;



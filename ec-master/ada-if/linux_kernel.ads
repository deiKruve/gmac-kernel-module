pragma Ada_2005;
pragma Style_Checks (Off);

--with System;
with Interfaces.C;
--with Interfaces.C.Extensions;
--with Interfaces.C.Strings;
--with Linux_Types;

package Linux_Kernel is
   
 
   -- Kernel Calls

  procedure Printk (s : string);
  
  
  procedure Do_Exit (error_code : Interfaces.C.long);
   pragma Import (C, Do_Exit, "do_exit");
   
end Linux_Kernel;



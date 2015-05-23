pragma Ada_2005;
pragma Style_Checks (Off);

--with System;
--with Interfaces.C; use Interfaces.C;
--with Interfaces.C.Extensions;
--with Interfaces.C.Strings;
--with Linux_Types;

package Linux_Kernel is
   
 
   -- Kernel Calls

  procedure Printk( s : string );

   
end Linux_Kernel;



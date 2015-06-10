
pragma Ada_2005;
pragma Style_Checks (Off);

with System;
--  with Interfaces.C; use Interfaces.C;
with Linux_Types;

package Sys_Mman is

   --  flag constants           --
   --  from ASM_GENERIC_MMAN_H  --
   MCL_CURRENT : constant Integer := 1;  
   --  lock all current mappings
   MCL_FUTURE  : constant Integer := 2;  
   --  lock all future mappings

   --  function Mlockall (Flags : Integer) return Integer;
   --  --  Cause all currently mapped pages of the process to be memory resident
   --  --  until unlocked by a call to the `munlockall', until the process exits,
   --  --  or until the process calls `execve'.
   --  pragma Import (C, Mlockall, "mlockall");
   
   function Sys_Mlock (Start : System.Address; 
		       Len : Linux_Types.Size_T) 
		      return Integer;
   pragma Import (C, Sys_Mlock, "sys_mlock");

end Sys_Mman;

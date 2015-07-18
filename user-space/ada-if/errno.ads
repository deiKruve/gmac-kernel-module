pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

--with Errno_Base;

package errno is
   
   function Error_Str (Errno : Integer) return String;
   
   function Errno return Integer;
   pragma Import (C, Errno, "__get_errno");
   --  Return the task-safe last error number
   
end errno;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
--with x86_64_linux_gnu_bits_types_h;
--with Interfaces.C.Strings;
--with System;
--with stddef_h;

package unistd is
   
   function close (uu_fd : int) return int;
   -- Close the file descriptor FD.
   --   This function is a cancellation point and therefore not marked with
   --   __THROW.
   pragma Import (C, close, "close");
   
end Unistd;

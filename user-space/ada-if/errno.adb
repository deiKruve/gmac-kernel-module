
with GNAT.OS_Lib;
package body errno is
   
   function Error_Str (Errno : Integer) return String
   is
   begin
      return GNAT.OS_Lib.Errno_Message 
        (Errno, Default => "Unknown system error");
   end Error_Str;
   
   
   
end Errno;

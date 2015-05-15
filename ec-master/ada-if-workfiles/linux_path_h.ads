pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with linux_dcache_h;

package linux_path_h is

   type path is record
      mnt : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/path.h:8
      the_dentry : access linux_dcache_h.dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/path.h:9
   end record;
   pragma Convention (C_Pass_By_Copy, path);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/path.h:7

   procedure path_get (arg1 : access constant path);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/path.h:12
   pragma Import (CPP, path_get, "_Z8path_getPK4path");

   procedure path_put (arg1 : access constant path);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/path.h:13
   pragma Import (CPP, path_put, "_Z8path_putPK4path");

   function path_equal (path1 : access constant path; path2 : access constant path) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/path.h:15
   pragma Import (CPP, path_equal, "_ZL10path_equalPK4pathS1_");

end linux_path_h;

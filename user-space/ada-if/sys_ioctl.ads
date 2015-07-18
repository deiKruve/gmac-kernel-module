
pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package sys_ioctl is
   
   function ioctl (uu_fd : int; uu_request : unsigned_long  -- , ...
                  ) return int;
   -- Perform the I/O control operation specified by REQUEST on FD.
   --   One argument may follow; its presence and type depend on REQUEST.
   --   Return value depends on REQUEST.  Usually -1 indicates error.   
   pragma Import (C, ioctl, "ioctl");
   
end Sys_Ioctl;

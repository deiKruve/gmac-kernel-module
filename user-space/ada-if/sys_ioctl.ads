
pragma Ada_2005;
pragma Style_Checks (Off);
with System;
with Interfaces.C; use Interfaces.C;
with Asm_Ioctl;
package sys_ioctl is
   
   function ioctl (uu_fd      : int; 
                   uu_request : Asm_Ioctl.Ioctl_Cmd; -- Unsigned_Long; 
                   Ptr        : System.Address  
                  ) return int;
   -- Perform the I/O control operation specified by REQUEST on FD.
   --   One argument may follow; its presence and type depend on REQUEST.
   --   In our case this is the address of the datastructure used for 
   --    communication.
   --   Return value depends on REQUEST.  Usually -1 indicates error.   
   pragma Import (C, ioctl, "ioctl");
   
end Sys_Ioctl;

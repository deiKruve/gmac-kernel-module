pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types;
--with globals_h;
with System;
--with ecrt_h;

package ioctl is
   
   type ec_ioctl_context_t is record
      -- Context data structure for file handles.
      writable : aliased unsigned;
      -- Device was opened with write permission.
      requested : aliased unsigned;
      -- Master was requested via this file handle.  
      process_data : access linux_types.u8;
      -- Total process data area.
      process_data_size : aliased linux_types.size_t;
      -- Size of the process_data. 
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_context_t);
   
   
   function ec_ioctl
     (arg1 : System.Address;
      arg2 : access ec_ioctl_context_t;
      arg3 : unsigned;
      arg4 : System.Address) return long;
   pragma Export (C, EC_IOCTL, "ec_ioctl");
   
end Ioctl;

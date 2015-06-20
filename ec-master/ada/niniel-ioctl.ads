with System;
with Interfaces.C; use Interfaces.C;
with Linux_Types;
with Niniel.Master;
package Niniel.Ioctl is
   
   subtype Void_Ptr is System.Address;
   
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
   
   
   function Gm_Ioctl (This_Master : Niniel.Master.Ec_Master_T_Ptr; 
			Ctx  : access  Ec_Ioctl_Context_T; 
			Cmd  : Unsigned; 
			Arg  : Void_Ptr) 
		     return Interfaces.C.Long;
   
end Niniel.Ioctl;

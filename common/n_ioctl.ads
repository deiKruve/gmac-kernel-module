
with Interfaces.C.Extensions;
with Linux_Types;

with Asm_Ioctl;

with Hw_Definition.Main;

package N_Ioctl is
   package L    renames Linux_Types;
   package Ice renames Interfaces.C.Extensions;
   package Ioc renames Asm_Ioctl;
   package Hwd renames Hw_Definition.Main;
   
   
   ------------------------------------------------------
   --  some data structures have to be specified here  --
   --  to prevent circular dependencies.               --
   ------------------------------------------------------
   type ec_ioctl_module_t is record
      ioctl_version_magic : aliased L.u32;
      master_count        : aliased L.u32;
   end record;
   pragma Convention (C_Pass_By_Copy, ec_ioctl_module_t);
   
   
   ------------------------------------------
   --  magic number                        --
   --  increment when updating this file.  --
   ------------------------------------------
   NINR_IOCTL_VERSION_MAGIC : constant := 01;
   
   ---------------------------
   --  io control commands  --
   ---------------------------
   NINR_IOCTL_TYPE   : constant Ice.Unsigned_8 := 16#a4#;
   
   NINR_IOCTL_MODULE : constant Ioc.Ioctl_Cmd  := 
     (0, NINR_IOCTL_TYPE, Ec_Ioctl_Module_T'Size, Ioc.IOC_READ);
   -- lowest first
   
   NINR_IOCTL_REQUEST : constant Ioc.Ioctl_Cmd  :=
     (16#10#, NINR_IOCTL_TYPE, 0, Ioc.IOC_NONE);
   
   
   NINR_DISCOVERY_REQUEST : constant Ioc.Ioctl_Cmd  :=
     (16#20#, NINR_IOCTL_TYPE, 0, Ioc.IOC_NONE);
   
   NINR_DISCOVERY_POLL : constant Ioc.Ioctl_Cmd  :=
     (16#21#, NINR_IOCTL_TYPE, 0, Ioc.IOC_NONE);
   
   NINR_DISCOVERY_STAT_REQUEST : constant Ioc.Ioctl_Cmd  :=
     (16#22#, NINR_IOCTL_TYPE, Hwd.Field_Status_Image_Type'Size, Ioc.IOC_read);

   
   
end N_Ioctl;

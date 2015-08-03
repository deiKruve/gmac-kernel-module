
with System;

with Interfaces.C.Extensions; use Interfaces.C;
with Linux_Types;

package Linux_Device is
   
   package Ice renames Interfaces.C.Extensions;
   package L  renames Linux_Types;
   
   
   subtype Device_Ptr is System.address;
   subtype Class_Ptr is System.Address;
   
   
   -- from linux_kdev_t_h:
   
   --  #define MINORBITS	20
   --    #define MINORMASK	((1U << MINORBITS) - 1)
   --    #define MAJOR(dev)	((unsigned int) ((dev) >> MINORBITS))
   --    #define MINOR(dev)	((unsigned int) ((dev) & MINORMASK))
   --    #define MKDEV(ma,mi)	(((ma) << MINORBITS) | (mi))
   
   Minor_Bits : constant Natural  := 20;
   Minor_Mask : constant Unsigned := 2 ** Minor_Bits - 1;
   
   
   
   function Device_Create (Cls     : Class_Ptr;
                           Parent  : Device_Ptr;
                           Devt    : L.Dev_T;
                           Drvdata : Ice.Void_Ptr;
                           S       : String)
                          return Device_Ptr;
   pragma Import (C, Device_Create, "device_create");
   
   
   procedure Device_Unregister (Dev : Device_Ptr);
   pragma Import (C, Device_Unregister, "device_unregister");
   
   
   procedure Device_Destroy (Cls     : Class_Ptr;
                             Devt    : L.Dev_T);
   pragma Import (C, Device_Destroy, "device_destroy");
   
   
   --  struct class *cls, struct device *parent,
   --       		     dev_t devt, void *drvdata,
   --       		     const char *fmt, ...);
   
   -- extern void device_unregister(struct device *dev);
   
   -- extern void device_destroy(struct class *cls, dev_t devt);
end Linux_Device;

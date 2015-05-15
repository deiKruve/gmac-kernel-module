pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_dma_mapping_h;
with System;

package asm_device_h is

   type dev_archdata is record
      dma_ops : access linux_dma_mapping_h.dma_map_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/device.h:6
      iommu : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/device.h:9
   end record;
   pragma Convention (C_Pass_By_Copy, dev_archdata);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/device.h:4

  -- hook for IOMMU specific extension  
   type pdev_archdata is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, pdev_archdata);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/device.h:13

end asm_device_h;

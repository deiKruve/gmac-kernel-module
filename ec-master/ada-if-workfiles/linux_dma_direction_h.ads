pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_dma_direction_h is

  -- * These definitions mirror those in pci.h, so they can be used
  -- * interchangeably with their PCI_ counterparts.
  --  

   type dma_data_direction is 
     (DMA_BIDIRECTIONAL,
      DMA_TO_DEVICE,
      DMA_FROM_DEVICE,
      DMA_NONE);
   pragma Convention (C, dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-direction.h:7

end linux_dma_direction_h;

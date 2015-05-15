pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_device_h;
limited with linux_dma_mapping_h;
with linux_types_h;
with asm_generic_int_ll64_h;
limited with linux_dma_attrs_h;
with System;
with Interfaces.C.Extensions;
with linux_dma_direction_h;

package asm_dma_mapping_h is

   --  unsupported macro: ISA_DMA_BIT_MASK DMA_BIT_MASK(32)
   --  unsupported macro: DMA_ERROR_CODE 0
   --  arg-macro: procedure dma_alloc_noncoherent dma_alloc_coherent(d, s, h, f)
   --    dma_alloc_coherent(d, s, h, f)
   --  arg-macro: procedure dma_free_noncoherent dma_free_coherent(d, s, v, h)
   --    dma_free_coherent(d, s, v, h)
   --  arg-macro: procedure dma_alloc_coherent dma_alloc_attrs(d,s,h,f,NULL)
   --    dma_alloc_attrs(d,s,h,f,NULL)
   --  arg-macro: procedure dma_free_coherent dma_free_attrs(d,s,c,h,NULL)
   --    dma_free_attrs(d,s,c,h,NULL)
  -- * IOMMU interface. See Documentation/DMA-API-HOWTO.txt and
  -- * Documentation/DMA-API.txt for documentation.
  --  

   iommu_merge : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:26
   pragma Import (C, iommu_merge, "iommu_merge");

   x86_dma_fallback_dev : aliased linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:27
   pragma Import (C, x86_dma_fallback_dev, "x86_dma_fallback_dev");

   panic_on_overflow : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:28
   pragma Import (C, panic_on_overflow, "panic_on_overflow");

   dma_ops : access linux_dma_mapping_h.dma_map_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:30
   pragma Import (C, dma_ops, "dma_ops");

   function get_dma_ops (dev : access linux_device_h.device) return access linux_dma_mapping_h.dma_map_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:32
   pragma Import (CPP, get_dma_ops, "_ZL11get_dma_opsP6device");

  -- Make sure we keep the same behaviour  
   function dma_mapping_error (dev : access linux_device_h.device; dma_addr : linux_types_h.dma_addr_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:47
   pragma Import (CPP, dma_mapping_error, "_ZL17dma_mapping_errorP6devicey");

   function dma_supported (hwdev : access linux_device_h.device; mask : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:60
   pragma Import (CPP, dma_supported, "_Z13dma_supportedP6devicey");

   function dma_set_mask (dev : access linux_device_h.device; mask : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:61
   pragma Import (CPP, dma_set_mask, "_Z12dma_set_maskP6devicey");

   function dma_generic_alloc_coherent
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      dma_addr : access linux_types_h.dma_addr_t;
      flag : linux_types_h.gfp_t;
      attrs : access linux_dma_attrs_h.dma_attrs) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:63
   pragma Import (CPP, dma_generic_alloc_coherent, "_Z26dma_generic_alloc_coherentP6devicemPyjP9dma_attrs");

   procedure dma_generic_free_coherent
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      vaddr : System.Address;
      dma_addr : linux_types_h.dma_addr_t;
      attrs : access linux_dma_attrs_h.dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:67
   pragma Import (CPP, dma_generic_free_coherent, "_Z25dma_generic_free_coherentP6devicemPvyP9dma_attrs");

   function dma_capable
     (dev : access linux_device_h.device;
      addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:77
   pragma Import (CPP, dma_capable, "_ZL11dma_capableP6deviceym");

   function phys_to_dma (dev : access linux_device_h.device; paddr : linux_types_h.phys_addr_t) return linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:85
   pragma Import (CPP, phys_to_dma, "_ZL11phys_to_dmaP6devicey");

   function dma_to_phys (dev : access linux_device_h.device; daddr : linux_types_h.dma_addr_t) return linux_types_h.phys_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:90
   pragma Import (CPP, dma_to_phys, "_ZL11dma_to_physP6devicey");

   procedure dma_cache_sync
     (dev : access linux_device_h.device;
      vaddr : System.Address;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:97
   pragma Import (CPP, dma_cache_sync, "_ZL14dma_cache_syncP6devicePvm18dma_data_direction");

   function dma_alloc_coherent_mask (dev : access linux_device_h.device; gfp : linux_types_h.gfp_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:103
   pragma Import (CPP, dma_alloc_coherent_mask, "_ZL23dma_alloc_coherent_maskP6devicej");

   function dma_alloc_coherent_gfp_flags (dev : access linux_device_h.device; gfp : linux_types_h.gfp_t) return linux_types_h.gfp_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:115
   pragma Import (CPP, dma_alloc_coherent_gfp_flags, "_ZL28dma_alloc_coherent_gfp_flagsP6devicej");

   function dma_alloc_attrs
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      dma_handle : access linux_types_h.dma_addr_t;
      gfp : linux_types_h.gfp_t;
      attrs : access linux_dma_attrs_h.dma_attrs) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:131
   pragma Import (CPP, dma_alloc_attrs, "_ZL15dma_alloc_attrsP6devicemPyjP9dma_attrs");

   procedure dma_free_attrs
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      vaddr : System.Address;
      bus : linux_types_h.dma_addr_t;
      attrs : access linux_dma_attrs_h.dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/dma-mapping.h:160
   pragma Import (CPP, dma_free_attrs, "_ZL14dma_free_attrsP6devicemPvyP9dma_attrs");

  -- for portability  
end asm_dma_mapping_h;

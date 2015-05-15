pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;
limited with linux_device_h;
limited with linux_dma_attrs_h;

package asm_swiotlb_h is

   swiotlb : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/swiotlb.h:7
   pragma Import (C, swiotlb, "swiotlb");

   function pci_swiotlb_detect_override return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/swiotlb.h:8
   pragma Import (CPP, pci_swiotlb_detect_override, "_Z27pci_swiotlb_detect_overridev");

   function pci_swiotlb_detect_4gb return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/swiotlb.h:9
   pragma Import (CPP, pci_swiotlb_detect_4gb, "_Z22pci_swiotlb_detect_4gbv");

   procedure pci_swiotlb_init;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/swiotlb.h:10
   pragma Import (CPP, pci_swiotlb_init, "_Z16pci_swiotlb_initv");

   procedure pci_swiotlb_late_init;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/swiotlb.h:11
   pragma Import (CPP, pci_swiotlb_late_init, "_Z21pci_swiotlb_late_initv");

   procedure dma_mark_clean (addr : System.Address; size : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/swiotlb.h:30
   pragma Import (CPP, dma_mark_clean, "_ZL14dma_mark_cleanPvm");

   function x86_swiotlb_alloc_coherent
     (hwdev : access linux_device_h.device;
      size : linux_types_h.size_t;
      dma_handle : access linux_types_h.dma_addr_t;
      flags : linux_types_h.gfp_t;
      attrs : access linux_dma_attrs_h.dma_attrs) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/swiotlb.h:32
   pragma Import (CPP, x86_swiotlb_alloc_coherent, "_Z26x86_swiotlb_alloc_coherentP6devicemPyjP9dma_attrs");

   procedure x86_swiotlb_free_coherent
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      vaddr : System.Address;
      dma_addr : linux_types_h.dma_addr_t;
      attrs : access linux_dma_attrs_h.dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/swiotlb.h:35
   pragma Import (CPP, x86_swiotlb_free_coherent, "_Z25x86_swiotlb_free_coherentP6devicemPvyP9dma_attrs");

end asm_swiotlb_h;

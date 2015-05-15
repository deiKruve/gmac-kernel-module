pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_device_h;
with System;
with linux_types_h;
with linux_dma_direction_h;
limited with linux_dma_attrs_h;
limited with asm_generic_scatterlist_h;
limited with linux_mm_types_h;
limited with linux_scatterlist_h;

package asm_generic_dma_mapping_common_h is

   --  arg-macro: procedure dma_map_single dma_map_single_attrs(d, a, s, r, NULL)
   --    dma_map_single_attrs(d, a, s, r, NULL)
   --  arg-macro: procedure dma_unmap_single dma_unmap_single_attrs(d, a, s, r, NULL)
   --    dma_unmap_single_attrs(d, a, s, r, NULL)
   --  arg-macro: procedure dma_map_sg dma_map_sg_attrs(d, s, n, r, NULL)
   --    dma_map_sg_attrs(d, s, n, r, NULL)
   --  arg-macro: procedure dma_unmap_sg dma_unmap_sg_attrs(d, s, n, r, NULL)
   --    dma_unmap_sg_attrs(d, s, n, r, NULL)
   --  arg-macro: procedure dma_mmap_coherent dma_mmap_attrs(d, v, c, h, s, NULL)
   --    dma_mmap_attrs(d, v, c, h, s, NULL)
   --  arg-macro: procedure dma_get_sgtable dma_get_sgtable_attrs(d, t, v, h, s, NULL)
   --    dma_get_sgtable_attrs(d, t, v, h, s, NULL)
   function dma_map_single_attrs
     (dev : access linux_device_h.device;
      ptr : System.Address;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction;
      attrs : access linux_dma_attrs_h.dma_attrs) return linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:10
   pragma Import (CPP, dma_map_single_attrs, "_ZL20dma_map_single_attrsP6devicePvm18dma_data_directionP9dma_attrs");

   procedure dma_unmap_single_attrs
     (dev : access linux_device_h.device;
      addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction;
      attrs : access linux_dma_attrs_h.dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:29
   pragma Import (CPP, dma_unmap_single_attrs, "_ZL22dma_unmap_single_attrsP6deviceym18dma_data_directionP9dma_attrs");

   function dma_map_sg_attrs
     (dev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nents : int;
      dir : linux_dma_direction_h.dma_data_direction;
      attrs : access linux_dma_attrs_h.dma_attrs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:42
   pragma Import (CPP, dma_map_sg_attrs, "_ZL16dma_map_sg_attrsP6deviceP11scatterlisti18dma_data_directionP9dma_attrs");

   procedure dma_unmap_sg_attrs
     (dev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nents : int;
      dir : linux_dma_direction_h.dma_data_direction;
      attrs : access linux_dma_attrs_h.dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:59
   pragma Import (CPP, dma_unmap_sg_attrs, "_ZL18dma_unmap_sg_attrsP6deviceP11scatterlisti18dma_data_directionP9dma_attrs");

   function dma_map_page
     (dev : access linux_device_h.device;
      the_page : access linux_mm_types_h.page;
      offset : linux_types_h.size_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction) return linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:71
   pragma Import (CPP, dma_map_page, "_ZL12dma_map_pageP6deviceP4pagemm18dma_data_direction");

   procedure dma_unmap_page
     (dev : access linux_device_h.device;
      addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:86
   pragma Import (CPP, dma_unmap_page, "_ZL14dma_unmap_pageP6deviceym18dma_data_direction");

   procedure dma_sync_single_for_cpu
     (dev : access linux_device_h.device;
      addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:97
   pragma Import (CPP, dma_sync_single_for_cpu, "_ZL23dma_sync_single_for_cpuP6deviceym18dma_data_direction");

   procedure dma_sync_single_for_device
     (dev : access linux_device_h.device;
      addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:109
   pragma Import (CPP, dma_sync_single_for_device, "_ZL26dma_sync_single_for_deviceP6deviceym18dma_data_direction");

   procedure dma_sync_single_range_for_cpu
     (dev : access linux_device_h.device;
      addr : linux_types_h.dma_addr_t;
      offset : unsigned_long;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:121
   pragma Import (CPP, dma_sync_single_range_for_cpu, "_ZL29dma_sync_single_range_for_cpuP6deviceymm18dma_data_direction");

   procedure dma_sync_single_range_for_device
     (dev : access linux_device_h.device;
      addr : linux_types_h.dma_addr_t;
      offset : unsigned_long;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:135
   pragma Import (CPP, dma_sync_single_range_for_device, "_ZL32dma_sync_single_range_for_deviceP6deviceymm18dma_data_direction");

   procedure dma_sync_sg_for_cpu
     (dev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nelems : int;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:150
   pragma Import (CPP, dma_sync_sg_for_cpu, "_ZL19dma_sync_sg_for_cpuP6deviceP11scatterlisti18dma_data_direction");

   procedure dma_sync_sg_for_device
     (dev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nelems : int;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:162
   pragma Import (CPP, dma_sync_sg_for_device, "_ZL22dma_sync_sg_for_deviceP6deviceP11scatterlisti18dma_data_direction");

   function dma_common_mmap
     (dev : access linux_device_h.device;
      vma : access linux_mm_types_h.vm_area_struct;
      cpu_addr : System.Address;
      dma_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:179
   pragma Import (CPP, dma_common_mmap, "_Z15dma_common_mmapP6deviceP14vm_area_structPvym");

  --*
  -- * dma_mmap_attrs - map a coherent DMA allocation into user space
  -- * @dev: valid struct device pointer, or NULL for ISA and EISA-like devices
  -- * @vma: vm_area_struct describing requested user mapping
  -- * @cpu_addr: kernel CPU-view address returned from dma_alloc_attrs
  -- * @handle: device-view address returned from dma_alloc_attrs
  -- * @size: size of memory originally requested in dma_alloc_attrs
  -- * @attrs: attributes of mapping properties requested in dma_alloc_attrs
  -- *
  -- * Map a coherent DMA buffer previously allocated by dma_alloc_attrs
  -- * into user space.  The coherent DMA buffer must not be freed by the
  -- * driver until the user space mapping has been released.
  --  

   function dma_mmap_attrs
     (dev : access linux_device_h.device;
      vma : access linux_mm_types_h.vm_area_struct;
      cpu_addr : System.Address;
      dma_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      attrs : access linux_dma_attrs_h.dma_attrs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:196
   pragma Import (CPP, dma_mmap_attrs, "_ZL14dma_mmap_attrsP6deviceP14vm_area_structPvymP9dma_attrs");

   function dma_mmap_writecombine
     (dev : access linux_device_h.device;
      vma : access linux_mm_types_h.vm_area_struct;
      cpu_addr : System.Address;
      dma_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:208
   pragma Import (CPP, dma_mmap_writecombine, "_ZL21dma_mmap_writecombineP6deviceP14vm_area_structPvym");

   function dma_common_get_sgtable
     (dev : access linux_device_h.device;
      sgt : access linux_scatterlist_h.sg_table;
      cpu_addr : System.Address;
      dma_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:217
   pragma Import (CPP, dma_common_get_sgtable, "_Z22dma_common_get_sgtableP6deviceP8sg_tablePvym");

   function dma_get_sgtable_attrs
     (dev : access linux_device_h.device;
      sgt : access linux_scatterlist_h.sg_table;
      cpu_addr : System.Address;
      dma_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      attrs : access linux_dma_attrs_h.dma_attrs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/dma-mapping-common.h:221
   pragma Import (CPP, dma_get_sgtable_attrs, "_ZL21dma_get_sgtable_attrsP6deviceP8sg_tablePvymP9dma_attrs");

end asm_generic_dma_mapping_common_h;

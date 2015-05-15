pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with linux_device_h;
with linux_types_h;
with linux_dma_direction_h;
with System;
limited with linux_mm_types_h;
limited with linux_dma_attrs_h;
limited with asm_generic_scatterlist_h;
with asm_generic_int_ll64_h;

package linux_swiotlb_h is

   --  unsupported macro: IO_TLB_SEGSIZE 128
   --  unsupported macro: IO_TLB_SHIFT 11
   --  unsupported macro: SWIOTLB_MAP_ERROR (~(phys_addr_t)0x0)
   swiotlb_force : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:10
   pragma Import (C, swiotlb_force, "swiotlb_force");

  -- * Maximum allowable number of contiguous slabs to map,
  -- * must be a power of 2.  What is the appropriate value ?
  -- * The complexity of {map,unmap}_single is linearly dependent on this value.
  --  

  -- * log of the size of each IO TLB slab.  The number of slabs is command line
  -- * controllable.
  --  

   procedure swiotlb_init (verbose : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:25
   pragma Import (CPP, swiotlb_init, "_Z12swiotlb_initi");

   function swiotlb_init_with_tbl
     (tlb : Interfaces.C.Strings.chars_ptr;
      nslabs : unsigned_long;
      verbose : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:26
   pragma Import (CPP, swiotlb_init_with_tbl, "_Z21swiotlb_init_with_tblPcmi");

   function swiotlb_nr_tbl return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:27
   pragma Import (CPP, swiotlb_nr_tbl, "_Z14swiotlb_nr_tblv");

   function swiotlb_size_or_default return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:28
   pragma Import (CPP, swiotlb_size_or_default, "_Z23swiotlb_size_or_defaultv");

   function swiotlb_late_init_with_tbl (tlb : Interfaces.C.Strings.chars_ptr; nslabs : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:29
   pragma Import (CPP, swiotlb_late_init_with_tbl, "_Z26swiotlb_late_init_with_tblPcm");

  -- * Enumeration for sync targets
  --  

   type dma_sync_target is 
     (SYNC_FOR_CPU,
      SYNC_FOR_DEVICE);
   pragma Convention (C, dma_sync_target);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:34

  -- define the last possible byte of physical address space as a mapping error  
   function swiotlb_tbl_map_single
     (hwdev : access linux_device_h.device;
      tbl_dma_addr : linux_types_h.dma_addr_t;
      phys : linux_types_h.phys_addr_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction) return linux_types_h.phys_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:42
   pragma Import (CPP, swiotlb_tbl_map_single, "_Z22swiotlb_tbl_map_singleP6deviceyym18dma_data_direction");

   procedure swiotlb_tbl_unmap_single
     (hwdev : access linux_device_h.device;
      tlb_addr : linux_types_h.phys_addr_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:47
   pragma Import (CPP, swiotlb_tbl_unmap_single, "_Z24swiotlb_tbl_unmap_singleP6deviceym18dma_data_direction");

   procedure swiotlb_tbl_sync_single
     (hwdev : access linux_device_h.device;
      tlb_addr : linux_types_h.phys_addr_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction;
      target : dma_sync_target);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:51
   pragma Import (CPP, swiotlb_tbl_sync_single, "_Z23swiotlb_tbl_sync_singleP6deviceym18dma_data_direction15dma_sync_target");

  -- Accessory functions.  
   function swiotlb_alloc_coherent
     (hwdev : access linux_device_h.device;
      size : linux_types_h.size_t;
      dma_handle : access linux_types_h.dma_addr_t;
      flags : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:58
   pragma Import (CPP, swiotlb_alloc_coherent, "_Z22swiotlb_alloc_coherentP6devicemPyj");

   procedure swiotlb_free_coherent
     (hwdev : access linux_device_h.device;
      size : linux_types_h.size_t;
      vaddr : System.Address;
      dma_handle : linux_types_h.dma_addr_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:62
   pragma Import (CPP, swiotlb_free_coherent, "_Z21swiotlb_free_coherentP6devicemPvy");

   function swiotlb_map_page
     (dev : access linux_device_h.device;
      the_page : access linux_mm_types_h.page;
      offset : unsigned_long;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction;
      attrs : access linux_dma_attrs_h.dma_attrs) return linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:65
   pragma Import (CPP, swiotlb_map_page, "_Z16swiotlb_map_pageP6deviceP4pagemm18dma_data_directionP9dma_attrs");

   procedure swiotlb_unmap_page
     (hwdev : access linux_device_h.device;
      dev_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction;
      attrs : access linux_dma_attrs_h.dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:69
   pragma Import (CPP, swiotlb_unmap_page, "_Z18swiotlb_unmap_pageP6deviceym18dma_data_directionP9dma_attrs");

   function swiotlb_map_sg
     (hwdev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nents : int;
      dir : linux_dma_direction_h.dma_data_direction) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:74
   pragma Import (CPP, swiotlb_map_sg, "_Z14swiotlb_map_sgP6deviceP11scatterlisti18dma_data_direction");

   procedure swiotlb_unmap_sg
     (hwdev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nents : int;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:78
   pragma Import (CPP, swiotlb_unmap_sg, "_Z16swiotlb_unmap_sgP6deviceP11scatterlisti18dma_data_direction");

   function swiotlb_map_sg_attrs
     (hwdev : access linux_device_h.device;
      sgl : access asm_generic_scatterlist_h.scatterlist;
      nelems : int;
      dir : linux_dma_direction_h.dma_data_direction;
      attrs : access linux_dma_attrs_h.dma_attrs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:82
   pragma Import (CPP, swiotlb_map_sg_attrs, "_Z20swiotlb_map_sg_attrsP6deviceP11scatterlisti18dma_data_directionP9dma_attrs");

   procedure swiotlb_unmap_sg_attrs
     (hwdev : access linux_device_h.device;
      sgl : access asm_generic_scatterlist_h.scatterlist;
      nelems : int;
      dir : linux_dma_direction_h.dma_data_direction;
      attrs : access linux_dma_attrs_h.dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:86
   pragma Import (CPP, swiotlb_unmap_sg_attrs, "_Z22swiotlb_unmap_sg_attrsP6deviceP11scatterlisti18dma_data_directionP9dma_attrs");

   procedure swiotlb_sync_single_for_cpu
     (hwdev : access linux_device_h.device;
      dev_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:91
   pragma Import (CPP, swiotlb_sync_single_for_cpu, "_Z27swiotlb_sync_single_for_cpuP6deviceym18dma_data_direction");

   procedure swiotlb_sync_sg_for_cpu
     (hwdev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nelems : int;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:95
   pragma Import (CPP, swiotlb_sync_sg_for_cpu, "_Z23swiotlb_sync_sg_for_cpuP6deviceP11scatterlisti18dma_data_direction");

   procedure swiotlb_sync_single_for_device
     (hwdev : access linux_device_h.device;
      dev_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:99
   pragma Import (CPP, swiotlb_sync_single_for_device, "_Z30swiotlb_sync_single_for_deviceP6deviceym18dma_data_direction");

   procedure swiotlb_sync_sg_for_device
     (hwdev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nelems : int;
      dir : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:103
   pragma Import (CPP, swiotlb_sync_sg_for_device, "_Z26swiotlb_sync_sg_for_deviceP6deviceP11scatterlisti18dma_data_direction");

   function swiotlb_dma_mapping_error (hwdev : access linux_device_h.device; dma_addr : linux_types_h.dma_addr_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:107
   pragma Import (CPP, swiotlb_dma_mapping_error, "_Z25swiotlb_dma_mapping_errorP6devicey");

   function swiotlb_dma_supported (hwdev : access linux_device_h.device; mask : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:110
   pragma Import (CPP, swiotlb_dma_supported, "_Z21swiotlb_dma_supportedP6devicey");

   procedure swiotlb_free;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:113
   pragma Import (CPP, swiotlb_free, "_Z12swiotlb_freev");

   procedure swiotlb_print_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:118
   pragma Import (CPP, swiotlb_print_info, "_Z18swiotlb_print_infov");

   function is_swiotlb_buffer (paddr : linux_types_h.phys_addr_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/swiotlb.h:119
   pragma Import (CPP, is_swiotlb_buffer, "_Z17is_swiotlb_buffery");

end linux_swiotlb_h;

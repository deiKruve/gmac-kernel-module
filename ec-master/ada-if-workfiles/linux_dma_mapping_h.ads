pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_device_h;
with linux_types_h;
limited with linux_dma_attrs_h;
with System;
limited with linux_mm_types_h;
limited with linux_scatterlist_h;
with linux_dma_direction_h;
limited with asm_generic_scatterlist_h;
with asm_generic_int_ll64_h;

package linux_dma_mapping_h is

   --  arg-macro: function DMA_BIT_MASK (((n) = 64) ? ~0ULL : ((1ULL<<(n))-1)
   --    return ((n) = 64) ? ~0ULL : ((1ULL<<(n))-1);
   --  unsupported macro: DMA_MASK_NONE 0x0ULL
   --  unsupported macro: DMA_MEMORY_MAP 0x01
   --  unsupported macro: DMA_MEMORY_IO 0x02
   --  unsupported macro: DMA_MEMORY_INCLUDES_CHILDREN 0x04
   --  unsupported macro: DMA_MEMORY_EXCLUSIVE 0x08
   --  arg-macro: procedure DEFINE_DMA_UNMAP_ADDR dma_addr_t ADDR_NAME
   --    dma_addr_t ADDR_NAME
   --  arg-macro: procedure DEFINE_DMA_UNMAP_LEN __u32 LEN_NAME
   --    __u32 LEN_NAME
   --  arg-macro: function dma_unmap_addr ((PTR).ADDR_NAME
   --    return (PTR).ADDR_NAME;
   --  arg-macro: function dma_unmap_addr_set (((PTR).ADDR_NAME) := (VAL)
   --    return ((PTR).ADDR_NAME) := (VAL);
   --  arg-macro: function dma_unmap_len ((PTR).LEN_NAME
   --    return (PTR).LEN_NAME;
   --  arg-macro: function dma_unmap_len_set (((PTR).LEN_NAME) := (VAL)
   --    return ((PTR).LEN_NAME) := (VAL);
  -- * A dma_addr_t can hold any valid DMA or bus address for the platform.
  -- * It can be given to a device to use as a DMA source or target.  A CPU cannot
  -- * reference a dma_addr_t directly because there may be translation between
  -- * its physical address space and the bus address space.
  --  

   type dma_map_ops is record
      alloc : access function
           (arg1 : access linux_device_h.device;
            arg2 : linux_types_h.size_t;
            arg3 : access linux_types_h.dma_addr_t;
            arg4 : linux_types_h.gfp_t;
            arg5 : access linux_dma_attrs_h.dma_attrs) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:20
      free : access procedure
           (arg1 : access linux_device_h.device;
            arg2 : linux_types_h.size_t;
            arg3 : System.Address;
            arg4 : linux_types_h.dma_addr_t;
            arg5 : access linux_dma_attrs_h.dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:23
      mmap : access function
           (arg1 : access linux_device_h.device;
            arg2 : access linux_mm_types_h.vm_area_struct;
            arg3 : System.Address;
            arg4 : linux_types_h.dma_addr_t;
            arg5 : linux_types_h.size_t;
            arg6 : access linux_dma_attrs_h.dma_attrs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:25
      get_sgtable : access function
           (arg1 : access linux_device_h.device;
            arg2 : access linux_scatterlist_h.sg_table;
            arg3 : System.Address;
            arg4 : linux_types_h.dma_addr_t;
            arg5 : linux_types_h.size_t;
            arg6 : access linux_dma_attrs_h.dma_attrs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:28
      map_page : access function
           (arg1 : access linux_device_h.device;
            arg2 : access linux_mm_types_h.page;
            arg3 : unsigned_long;
            arg4 : linux_types_h.size_t;
            arg5 : linux_dma_direction_h.dma_data_direction;
            arg6 : access linux_dma_attrs_h.dma_attrs) return linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:33
      unmap_page : access procedure
           (arg1 : access linux_device_h.device;
            arg2 : linux_types_h.dma_addr_t;
            arg3 : linux_types_h.size_t;
            arg4 : linux_dma_direction_h.dma_data_direction;
            arg5 : access linux_dma_attrs_h.dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:36
      map_sg : access function
           (arg1 : access linux_device_h.device;
            arg2 : access asm_generic_scatterlist_h.scatterlist;
            arg3 : int;
            arg4 : linux_dma_direction_h.dma_data_direction;
            arg5 : access linux_dma_attrs_h.dma_attrs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:39
      unmap_sg : access procedure
           (arg1 : access linux_device_h.device;
            arg2 : access asm_generic_scatterlist_h.scatterlist;
            arg3 : int;
            arg4 : linux_dma_direction_h.dma_data_direction;
            arg5 : access linux_dma_attrs_h.dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:43
      sync_single_for_cpu : access procedure
           (arg1 : access linux_device_h.device;
            arg2 : linux_types_h.dma_addr_t;
            arg3 : linux_types_h.size_t;
            arg4 : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:46
      sync_single_for_device : access procedure
           (arg1 : access linux_device_h.device;
            arg2 : linux_types_h.dma_addr_t;
            arg3 : linux_types_h.size_t;
            arg4 : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:49
      sync_sg_for_cpu : access procedure
           (arg1 : access linux_device_h.device;
            arg2 : access asm_generic_scatterlist_h.scatterlist;
            arg3 : int;
            arg4 : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:52
      sync_sg_for_device : access procedure
           (arg1 : access linux_device_h.device;
            arg2 : access asm_generic_scatterlist_h.scatterlist;
            arg3 : int;
            arg4 : linux_dma_direction_h.dma_data_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:55
      mapping_error : access function (arg1 : access linux_device_h.device; arg2 : linux_types_h.dma_addr_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:56
      dma_supported : access function (arg1 : access linux_device_h.device; arg2 : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:57
      set_dma_mask : access function (arg1 : access linux_device_h.device; arg2 : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:58
      is_phys : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:62
   end record;
   pragma Convention (C_Pass_By_Copy, dma_map_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:17

   function valid_dma_direction (dma_direction : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:69
   pragma Import (CPP, valid_dma_direction, "_ZL19valid_dma_directioni");

   function is_device_dma_capable (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:76
   pragma Import (CPP, is_device_dma_capable, "_ZL21is_device_dma_capableP6device");

   function dma_get_mask (dev : access linux_device_h.device) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:87
   pragma Import (CPP, dma_get_mask, "_ZL12dma_get_maskP6device");

   function dma_set_coherent_mask (dev : access linux_device_h.device; mask : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:97
   pragma Import (CPP, dma_set_coherent_mask, "_ZL21dma_set_coherent_maskP6devicey");

  -- * Set both the DMA mask and the coherent DMA mask to the same thing.
  -- * Note that we don't check the return value from dma_set_coherent_mask()
  -- * as the DMA API guarantees that the coherent DMA mask can be set to
  -- * the same or smaller than the streaming DMA mask.
  --  

   function dma_set_mask_and_coherent (dev : access linux_device_h.device; mask : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:112
   pragma Import (CPP, dma_set_mask_and_coherent, "_ZL25dma_set_mask_and_coherentP6devicey");

  -- * Similar to the above, except it deals with the case where the device
  -- * does not have dev->dma_mask appropriately setup.
  --  

   function dma_coerce_mask_and_coherent (dev : access linux_device_h.device; mask : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:124
   pragma Import (CPP, dma_coerce_mask_and_coherent, "_ZL28dma_coerce_mask_and_coherentP6devicey");

   function dma_get_required_mask (dev : access linux_device_h.device) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:130
   pragma Import (CPP, dma_get_required_mask, "_Z21dma_get_required_maskP6device");

   function set_arch_dma_coherent_ops (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:133
   pragma Import (CPP, set_arch_dma_coherent_ops, "_ZL25set_arch_dma_coherent_opsP6device");

   function dma_get_max_seg_size (dev : access linux_device_h.device) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:139
   pragma Import (CPP, dma_get_max_seg_size, "_ZL20dma_get_max_seg_sizeP6device");

   function dma_set_max_seg_size (dev : access linux_device_h.device; size : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:144
   pragma Import (CPP, dma_set_max_seg_size, "_ZL20dma_set_max_seg_sizeP6devicej");

   function dma_get_seg_boundary (dev : access linux_device_h.device) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:154
   pragma Import (CPP, dma_get_seg_boundary, "_ZL20dma_get_seg_boundaryP6device");

   function dma_set_seg_boundary (dev : access linux_device_h.device; mask : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:160
   pragma Import (CPP, dma_set_seg_boundary, "_ZL20dma_set_seg_boundaryP6devicem");

   function dma_max_pfn (dev : access linux_device_h.device) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:170
   pragma Import (CPP, dma_max_pfn, "_ZL11dma_max_pfnP6device");

   function dma_zalloc_coherent
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      dma_handle : access linux_types_h.dma_addr_t;
      flag : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:176
   pragma Import (CPP, dma_zalloc_coherent, "_ZL19dma_zalloc_coherentP6devicemPyj");

   function dma_get_cache_alignment return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:185
   pragma Import (CPP, dma_get_cache_alignment, "_ZL23dma_get_cache_alignmentv");

  -- flags for the coherent memory api  
   function dma_declare_coherent_memory
     (dev : access linux_device_h.device;
      phys_addr : linux_types_h.phys_addr_t;
      device_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:202
   pragma Import (CPP, dma_declare_coherent_memory, "_ZL27dma_declare_coherent_memoryP6deviceyymi");

   procedure dma_release_declared_memory (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:209
   pragma Import (CPP, dma_release_declared_memory, "_ZL27dma_release_declared_memoryP6device");

   function dma_mark_declared_memory_occupied
     (dev : access linux_device_h.device;
      device_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:214
   pragma Import (CPP, dma_mark_declared_memory_occupied, "_ZL33dma_mark_declared_memory_occupiedP6deviceym");

  -- * Managed DMA API
  --  

   function dmam_alloc_coherent
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      dma_handle : access linux_types_h.dma_addr_t;
      gfp : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:224
   pragma Import (CPP, dmam_alloc_coherent, "_Z19dmam_alloc_coherentP6devicemPyj");

   procedure dmam_free_coherent
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      vaddr : System.Address;
      dma_handle : linux_types_h.dma_addr_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:226
   pragma Import (CPP, dmam_free_coherent, "_Z18dmam_free_coherentP6devicemPvy");

   function dmam_alloc_noncoherent
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      dma_handle : access linux_types_h.dma_addr_t;
      gfp : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:228
   pragma Import (CPP, dmam_alloc_noncoherent, "_Z22dmam_alloc_noncoherentP6devicemPyj");

   procedure dmam_free_noncoherent
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      vaddr : System.Address;
      dma_handle : linux_types_h.dma_addr_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:230
   pragma Import (CPP, dmam_free_noncoherent, "_Z21dmam_free_noncoherentP6devicemPvy");

   function dmam_declare_coherent_memory
     (dev : access linux_device_h.device;
      phys_addr : linux_types_h.phys_addr_t;
      device_addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      gfp : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:239
   pragma Import (CPP, dmam_declare_coherent_memory, "_ZL28dmam_declare_coherent_memoryP6deviceyymj");

   procedure dmam_release_declared_memory (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-mapping.h:246
   pragma Import (CPP, dmam_release_declared_memory, "_ZL28dmam_release_declared_memoryP6device");

end linux_dma_mapping_h;

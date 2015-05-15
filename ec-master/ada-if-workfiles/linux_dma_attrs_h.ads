pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_dma_attrs_h is

   --  arg-macro: procedure DEFINE_DMA_ATTRS struct dma_attrs x := { .flags := { (0 ... __DMA_ATTRS_LONGS-1) := 0 }, }
   --    struct dma_attrs x := { .flags := { (0 ... __DMA_ATTRS_LONGS-1) := 0 }, }
  --*
  -- * an enum dma_attr represents an attribute associated with a DMA
  -- * mapping. The semantics of each attribute should be defined in
  -- * Documentation/DMA-attributes.txt.
  --  

   type dma_attr is 
     (DMA_ATTR_WRITE_BARRIER,
      DMA_ATTR_WEAK_ORDERING,
      DMA_ATTR_WRITE_COMBINE,
      DMA_ATTR_NON_CONSISTENT,
      DMA_ATTR_NO_KERNEL_MAPPING,
      DMA_ATTR_SKIP_CPU_SYNC,
      DMA_ATTR_FORCE_CONTIGUOUS,
      DMA_ATTR_MAX);
   pragma Convention (C, dma_attr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-attrs.h:13

  --*
  -- * struct dma_attrs - an opaque container for DMA attributes
  -- * @flags - bitmask representing a collection of enum dma_attr
  --  

   type dma_attrs_flags_array is array (0 .. 0) of aliased unsigned_long;
   type dma_attrs is record
      flags : aliased dma_attrs_flags_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-attrs.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-attrs.h:30

   procedure init_dma_attrs (attrs : access dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-attrs.h:39
   pragma Import (CPP, init_dma_attrs, "_ZL14init_dma_attrsP9dma_attrs");

  --*
  -- * dma_set_attr - set a specific attribute
  -- * @attr: attribute to set
  -- * @attrs: struct dma_attrs (may be NULL)
  --  

   procedure dma_set_attr (attr : dma_attr; attrs : access dma_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-attrs.h:50
   pragma Import (CPP, dma_set_attr, "_ZL12dma_set_attr8dma_attrP9dma_attrs");

  --*
  -- * dma_get_attr - check for a specific attribute
  -- * @attr: attribute to set
  -- * @attrs: struct dma_attrs (may be NULL)
  --  

   function dma_get_attr (attr : dma_attr; attrs : access dma_attrs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-attrs.h:63
   pragma Import (CPP, dma_get_attr, "_ZL12dma_get_attr8dma_attrP9dma_attrs");

end linux_dma_attrs_h;

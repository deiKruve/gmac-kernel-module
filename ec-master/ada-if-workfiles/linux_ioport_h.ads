pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
with asm_generic_int_ll64_h;
with System;

package linux_ioport_h is

   --  unsupported macro: IORESOURCE_BITS 0x000000ff
   --  unsupported macro: IORESOURCE_TYPE_BITS 0x00001f00
   --  unsupported macro: IORESOURCE_IO 0x00000100
   --  unsupported macro: IORESOURCE_MEM 0x00000200
   --  unsupported macro: IORESOURCE_REG 0x00000300
   --  unsupported macro: IORESOURCE_IRQ 0x00000400
   --  unsupported macro: IORESOURCE_DMA 0x00000800
   --  unsupported macro: IORESOURCE_BUS 0x00001000
   --  unsupported macro: IORESOURCE_PREFETCH 0x00002000
   --  unsupported macro: IORESOURCE_READONLY 0x00004000
   --  unsupported macro: IORESOURCE_CACHEABLE 0x00008000
   --  unsupported macro: IORESOURCE_RANGELENGTH 0x00010000
   --  unsupported macro: IORESOURCE_SHADOWABLE 0x00020000
   --  unsupported macro: IORESOURCE_SIZEALIGN 0x00040000
   --  unsupported macro: IORESOURCE_STARTALIGN 0x00080000
   --  unsupported macro: IORESOURCE_MEM_64 0x00100000
   --  unsupported macro: IORESOURCE_WINDOW 0x00200000
   --  unsupported macro: IORESOURCE_MUXED 0x00400000
   --  unsupported macro: IORESOURCE_EXCLUSIVE 0x08000000
   --  unsupported macro: IORESOURCE_DISABLED 0x10000000
   --  unsupported macro: IORESOURCE_UNSET 0x20000000
   --  unsupported macro: IORESOURCE_AUTO 0x40000000
   --  unsupported macro: IORESOURCE_BUSY 0x80000000
   --  unsupported macro: IORESOURCE_IRQ_HIGHEDGE (1<<0)
   --  unsupported macro: IORESOURCE_IRQ_LOWEDGE (1<<1)
   --  unsupported macro: IORESOURCE_IRQ_HIGHLEVEL (1<<2)
   --  unsupported macro: IORESOURCE_IRQ_LOWLEVEL (1<<3)
   --  unsupported macro: IORESOURCE_IRQ_SHAREABLE (1<<4)
   --  unsupported macro: IORESOURCE_IRQ_OPTIONAL (1<<5)
   --  unsupported macro: IORESOURCE_DMA_TYPE_MASK (3<<0)
   --  unsupported macro: IORESOURCE_DMA_8BIT (0<<0)
   --  unsupported macro: IORESOURCE_DMA_8AND16BIT (1<<0)
   --  unsupported macro: IORESOURCE_DMA_16BIT (2<<0)
   --  unsupported macro: IORESOURCE_DMA_MASTER (1<<2)
   --  unsupported macro: IORESOURCE_DMA_BYTE (1<<3)
   --  unsupported macro: IORESOURCE_DMA_WORD (1<<4)
   --  unsupported macro: IORESOURCE_DMA_SPEED_MASK (3<<6)
   --  unsupported macro: IORESOURCE_DMA_COMPATIBLE (0<<6)
   --  unsupported macro: IORESOURCE_DMA_TYPEA (1<<6)
   --  unsupported macro: IORESOURCE_DMA_TYPEB (2<<6)
   --  unsupported macro: IORESOURCE_DMA_TYPEF (3<<6)
   --  unsupported macro: IORESOURCE_MEM_WRITEABLE (1<<0)
   --  unsupported macro: IORESOURCE_MEM_CACHEABLE (1<<1)
   --  unsupported macro: IORESOURCE_MEM_RANGELENGTH (1<<2)
   --  unsupported macro: IORESOURCE_MEM_TYPE_MASK (3<<3)
   --  unsupported macro: IORESOURCE_MEM_8BIT (0<<3)
   --  unsupported macro: IORESOURCE_MEM_16BIT (1<<3)
   --  unsupported macro: IORESOURCE_MEM_8AND16BIT (2<<3)
   --  unsupported macro: IORESOURCE_MEM_32BIT (3<<3)
   --  unsupported macro: IORESOURCE_MEM_SHADOWABLE (1<<5)
   --  unsupported macro: IORESOURCE_MEM_EXPANSIONROM (1<<6)
   --  unsupported macro: IORESOURCE_IO_16BIT_ADDR (1<<0)
   --  unsupported macro: IORESOURCE_IO_FIXED (1<<1)
   --  unsupported macro: IORESOURCE_ROM_ENABLE (1<<0)
   --  unsupported macro: IORESOURCE_ROM_SHADOW (1<<1)
   --  unsupported macro: IORESOURCE_ROM_COPY (1<<2)
   --  unsupported macro: IORESOURCE_ROM_BIOS_COPY (1<<3)
   --  unsupported macro: IORESOURCE_PCI_FIXED (1<<4)
   --  arg-macro: procedure DEFINE_RES_NAMED { .start := (_start), .end := (_start) + (_size) - 1, .name := (_name), .flags := (_flags), }
   --    { .start := (_start), .end := (_start) + (_size) - 1, .name := (_name), .flags := (_flags), }
   --  arg-macro: procedure DEFINE_RES_IO_NAMED DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_IO)
   --    DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_IO)
   --  arg-macro: procedure DEFINE_RES_IO DEFINE_RES_IO_NAMED((_start), (_size), NULL)
   --    DEFINE_RES_IO_NAMED((_start), (_size), NULL)
   --  arg-macro: procedure DEFINE_RES_MEM_NAMED DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_MEM)
   --    DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_MEM)
   --  arg-macro: procedure DEFINE_RES_MEM DEFINE_RES_MEM_NAMED((_start), (_size), NULL)
   --    DEFINE_RES_MEM_NAMED((_start), (_size), NULL)
   --  arg-macro: procedure DEFINE_RES_IRQ_NAMED DEFINE_RES_NAMED((_irq), 1, (_name), IORESOURCE_IRQ)
   --    DEFINE_RES_NAMED((_irq), 1, (_name), IORESOURCE_IRQ)
   --  arg-macro: procedure DEFINE_RES_IRQ DEFINE_RES_IRQ_NAMED((_irq), NULL)
   --    DEFINE_RES_IRQ_NAMED((_irq), NULL)
   --  arg-macro: procedure DEFINE_RES_DMA_NAMED DEFINE_RES_NAMED((_dma), 1, (_name), IORESOURCE_DMA)
   --    DEFINE_RES_NAMED((_dma), 1, (_name), IORESOURCE_DMA)
   --  arg-macro: procedure DEFINE_RES_DMA DEFINE_RES_DMA_NAMED((_dma), NULL)
   --    DEFINE_RES_DMA_NAMED((_dma), NULL)
   --  arg-macro: procedure request_region __request_region(andioport_resource, (start), (n), (name), 0)
   --    __request_region(andioport_resource, (start), (n), (name), 0)
   --  arg-macro: procedure request_muxed_region __request_region(andioport_resource, (start), (n), (name), IORESOURCE_MUXED)
   --    __request_region(andioport_resource, (start), (n), (name), IORESOURCE_MUXED)
   --  arg-macro: procedure request_mem_region __request_region(andiomem_resource, (start), (n), (name), 0)
   --    __request_region(andiomem_resource, (start), (n), (name), 0)
   --  arg-macro: procedure request_mem_region_exclusive __request_region(andiomem_resource, (start), (n), (name), IORESOURCE_EXCLUSIVE)
   --    __request_region(andiomem_resource, (start), (n), (name), IORESOURCE_EXCLUSIVE)
   --  arg-macro: procedure rename_region do { (region).name := (newname); } while (0)
   --    do { (region).name := (newname); } while (0)
   --  arg-macro: procedure release_region __release_region(andioport_resource, (start), (n))
   --    __release_region(andioport_resource, (start), (n))
   --  arg-macro: procedure check_mem_region __check_region(andiomem_resource, (start), (n))
   --    __check_region(andiomem_resource, (start), (n))
   --  arg-macro: procedure release_mem_region __release_region(andiomem_resource, (start), (n))
   --    __release_region(andiomem_resource, (start), (n))
   --  arg-macro: procedure devm_request_region __devm_request_region(dev, andioport_resource, (start), (n), (name))
   --    __devm_request_region(dev, andioport_resource, (start), (n), (name))
   --  arg-macro: procedure devm_request_mem_region __devm_request_region(dev, andiomem_resource, (start), (n), (name))
   --    __devm_request_region(dev, andiomem_resource, (start), (n), (name))
   --  arg-macro: procedure devm_release_region __devm_release_region(dev, andioport_resource, (start), (n))
   --    __devm_release_region(dev, andioport_resource, (start), (n))
   --  arg-macro: procedure devm_release_mem_region __devm_release_region(dev, andiomem_resource, (start), (n))
   --    __devm_release_region(dev, andiomem_resource, (start), (n))
  -- * ioport.h	Definitions of routines for detecting, reserving and
  -- *		allocating system resources.
  -- *
  -- * Authors:	Linus Torvalds
  --  

  -- * Resources are tree-like, allowing
  -- * nesting etc..
  --  

   type resource is record
      start : aliased linux_types_h.resource_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:19
      c_end : aliased linux_types_h.resource_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:20
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:21
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:22
      parent : access resource;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:23
      sibling : access resource;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:23
      child : access resource;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:23
   end record;
   pragma Convention (C_Pass_By_Copy, resource);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:18

  -- * IO resources have these defined flags.
  --  

  -- PnP IRQ specific bits (IORESOURCE_BITS)  
  -- PnP DMA specific bits (IORESOURCE_BITS)  
  -- PnP memory I/O specific bits (IORESOURCE_BITS)  
  -- PnP I/O specific bits (IORESOURCE_BITS)  
  -- PCI ROM control bits (IORESOURCE_BITS)  
  -- PCI control bits.  Shares IORESOURCE_BITS with above PCI ROM.   
  -- helpers to define resources  
  -- PC/ISA/whatever - the normal PC address spaces: IO and memory  
   ioport_resource : aliased resource;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:138
   pragma Import (C, ioport_resource, "ioport_resource");

   iomem_resource : aliased resource;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:139
   pragma Import (C, iomem_resource, "iomem_resource");

   function request_resource_conflict (root : access resource; arg2 : access resource) return access resource;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:141
   pragma Import (CPP, request_resource_conflict, "_Z25request_resource_conflictP8resourceS0_");

   function request_resource (root : access resource; arg2 : access resource) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:142
   pragma Import (CPP, request_resource, "_Z16request_resourceP8resourceS0_");

   function release_resource (arg1 : access resource) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:143
   pragma Import (CPP, release_resource, "_Z16release_resourceP8resource");

   procedure release_child_resources (arg1 : access resource);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:144
   pragma Import (CPP, release_child_resources, "_Z23release_child_resourcesP8resource");

   procedure reserve_region_with_split
     (root : access resource;
      start : linux_types_h.resource_size_t;
      c_end : linux_types_h.resource_size_t;
      name : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:145
   pragma Import (CPP, reserve_region_with_split, "_Z25reserve_region_with_splitP8resourceyyPKc");

   function insert_resource_conflict (parent : access resource; arg2 : access resource) return access resource;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:148
   pragma Import (CPP, insert_resource_conflict, "_Z24insert_resource_conflictP8resourceS0_");

   function insert_resource (parent : access resource; arg2 : access resource) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:149
   pragma Import (CPP, insert_resource, "_Z15insert_resourceP8resourceS0_");

   procedure insert_resource_expand_to_fit (root : access resource; arg2 : access resource);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:150
   pragma Import (CPP, insert_resource_expand_to_fit, "_Z29insert_resource_expand_to_fitP8resourceS0_");

   procedure arch_remove_reservations (avail : access resource);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:151
   pragma Import (CPP, arch_remove_reservations, "_Z24arch_remove_reservationsP8resource");

   function allocate_resource (root : access resource; arg2 : access resource) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:152
   pragma Import (CPP, allocate_resource, "_Z17allocate_resourceP8resourceS0_");

   function lookup_resource (root : access resource; start : linux_types_h.resource_size_t) return access resource;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:160
   pragma Import (CPP, lookup_resource, "_Z15lookup_resourceP8resourcey");

   function adjust_resource
     (res : access resource;
      start : linux_types_h.resource_size_t;
      size : linux_types_h.resource_size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:161
   pragma Import (CPP, adjust_resource, "_Z15adjust_resourceP8resourceyy");

   function resource_alignment (res : access resource) return linux_types_h.resource_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:163
   pragma Import (CPP, resource_alignment, "_Z18resource_alignmentP8resource");

   function resource_size (res : access constant resource) return linux_types_h.resource_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:164
   pragma Import (CPP, resource_size, "_ZL13resource_sizePK8resource");

   function resource_type (res : access constant resource) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:168
   pragma Import (CPP, resource_type, "_ZL13resource_typePK8resource");

  -- True iff r1 completely contains r2  
   function resource_contains (r1 : access resource; r2 : access resource) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:173
   pragma Import (CPP, resource_contains, "_ZL17resource_containsP8resourceS0_");

  -- Convenience shorthand with allocation  
   --  skipped func __request_region

  -- Compatibility cruft  
   --  skipped func __check_region

   --  skipped func __release_region

   function release_mem_region_adjustable
     (arg1 : access resource;
      arg2 : linux_types_h.resource_size_t;
      arg3 : linux_types_h.resource_size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:206
   pragma Import (CPP, release_mem_region_adjustable, "_Z29release_mem_region_adjustableP8resourceyy");

   function check_region (s : linux_types_h.resource_size_t; n : linux_types_h.resource_size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:210
   pragma Import (CPP, check_region, "_ZL12check_regionyy");

  -- Wrappers for managed devices  
   --  skipped func __devm_request_region

   --  skipped func __devm_release_region

   function iomem_map_sanity_check (addr : linux_types_h.resource_size_t; size : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:234
   pragma Import (CPP, iomem_map_sanity_check, "_Z22iomem_map_sanity_checkym");

   function iomem_is_exclusive (addr : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:235
   pragma Import (CPP, iomem_is_exclusive, "_Z18iomem_is_exclusivey");

   function walk_system_ram_range
     (start_pfn : unsigned_long;
      nr_pages : unsigned_long;
      arg : System.Address;
      func : access function
        (arg1 : unsigned_long;
         arg2 : unsigned_long;
         arg3 : System.Address) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:238
   pragma Import (CPP, walk_system_ram_range, "_Z21walk_system_ram_rangemmPvPFimmS_E");

  -- True if any part of r1 overlaps r2  
   function resource_overlaps (r1 : access resource; r2 : access resource) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ioport.h:242
   pragma Import (CPP, resource_overlaps, "_ZL17resource_overlapsP8resourceS0_");

end linux_ioport_h;

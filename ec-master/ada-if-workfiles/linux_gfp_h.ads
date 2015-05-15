pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with linux_mmzone_h;
limited with linux_mm_types_h;
with System;
with Interfaces.C.Extensions;

package linux_gfp_h is

   --  unsupported macro: GFP_ZONEMASK (__GFP_DMA|__GFP_HIGHMEM|__GFP_DMA32|__GFP_MOVABLE)
   --  unsupported macro: GFP_NOWAIT (GFP_ATOMIC & ~__GFP_HIGH)
   --  unsupported macro: GFP_ATOMIC (__GFP_HIGH)
   --  unsupported macro: GFP_NOIO (__GFP_WAIT)
   --  unsupported macro: GFP_NOFS (__GFP_WAIT | __GFP_IO)
   --  unsupported macro: GFP_KERNEL (__GFP_WAIT | __GFP_IO | __GFP_FS)
   --  unsupported macro: GFP_TEMPORARY (__GFP_WAIT | __GFP_IO | __GFP_FS | __GFP_RECLAIMABLE)
   --  unsupported macro: GFP_USER (__GFP_WAIT | __GFP_IO | __GFP_FS | __GFP_HARDWALL)
   --  unsupported macro: GFP_HIGHUSER (__GFP_WAIT | __GFP_IO | __GFP_FS | __GFP_HARDWALL | __GFP_HIGHMEM)
   --  unsupported macro: GFP_HIGHUSER_MOVABLE (__GFP_WAIT | __GFP_IO | __GFP_FS | __GFP_HARDWALL | __GFP_HIGHMEM | __GFP_MOVABLE)
   --  unsupported macro: GFP_IOFS (__GFP_IO | __GFP_FS)
   --  unsupported macro: GFP_TRANSHUGE (GFP_HIGHUSER_MOVABLE | __GFP_COMP | __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN | __GFP_NO_KSWAPD)
   --  unsupported macro: GFP_THISNODE (__GFP_THISNODE | __GFP_NOWARN | __GFP_NORETRY)
   --  unsupported macro: GFP_MOVABLE_MASK (__GFP_RECLAIMABLE|__GFP_MOVABLE)
   --  unsupported macro: GFP_RECLAIM_MASK (__GFP_WAIT|__GFP_HIGH|__GFP_IO|__GFP_FS| __GFP_NOWARN|__GFP_REPEAT|__GFP_NOFAIL| __GFP_NORETRY|__GFP_MEMALLOC|__GFP_NOMEMALLOC)
   --  unsupported macro: GFP_BOOT_MASK (__GFP_BITS_MASK & ~(__GFP_WAIT|__GFP_IO|__GFP_FS))
   --  unsupported macro: GFP_CONSTRAINT_MASK (__GFP_HARDWALL|__GFP_THISNODE)
   --  unsupported macro: GFP_SLAB_BUG_MASK (__GFP_DMA32|__GFP_HIGHMEM|~__GFP_BITS_MASK)
   --  unsupported macro: GFP_DMA __GFP_DMA
   --  unsupported macro: GFP_DMA32 __GFP_DMA32
   --  unsupported macro: OPT_ZONE_HIGHMEM ZONE_NORMAL
   --  unsupported macro: OPT_ZONE_DMA ZONE_DMA
   --  unsupported macro: OPT_ZONE_DMA32 ZONE_DMA32
   --  unsupported macro: GFP_ZONE_TABLE ( (ZONE_NORMAL << 0 * ZONES_SHIFT) | (OPT_ZONE_DMA << ___GFP_DMA * ZONES_SHIFT) | (OPT_ZONE_HIGHMEM << ___GFP_HIGHMEM * ZONES_SHIFT) | (OPT_ZONE_DMA32 << ___GFP_DMA32 * ZONES_SHIFT) | (ZONE_NORMAL << ___GFP_MOVABLE * ZONES_SHIFT) | (OPT_ZONE_DMA << (___GFP_MOVABLE | ___GFP_DMA) * ZONES_SHIFT) | (ZONE_MOVABLE << (___GFP_MOVABLE | ___GFP_HIGHMEM) * ZONES_SHIFT) | (OPT_ZONE_DMA32 << (___GFP_MOVABLE | ___GFP_DMA32) * ZONES_SHIFT) )
   --  unsupported macro: GFP_ZONE_BAD ( 1 << (___GFP_DMA | ___GFP_HIGHMEM) | 1 << (___GFP_DMA | ___GFP_DMA32) | 1 << (___GFP_DMA32 | ___GFP_HIGHMEM) | 1 << (___GFP_DMA | ___GFP_DMA32 | ___GFP_HIGHMEM) | 1 << (___GFP_MOVABLE | ___GFP_HIGHMEM | ___GFP_DMA) | 1 << (___GFP_MOVABLE | ___GFP_DMA32 | ___GFP_DMA) | 1 << (___GFP_MOVABLE | ___GFP_DMA32 | ___GFP_HIGHMEM) | 1 << (___GFP_MOVABLE | ___GFP_DMA32 | ___GFP_DMA | ___GFP_HIGHMEM) )
   --  arg-macro: procedure alloc_page alloc_pages(gfp_mask, 0)
   --    alloc_pages(gfp_mask, 0)
   --  arg-macro: procedure alloc_page_vma alloc_pages_vma(gfp_mask, 0, vma, addr, numa_node_id())
   --    alloc_pages_vma(gfp_mask, 0, vma, addr, numa_node_id())
   --  arg-macro: procedure alloc_page_vma_node alloc_pages_vma(gfp_mask, 0, vma, addr, node)
   --    alloc_pages_vma(gfp_mask, 0, vma, addr, node)
   --  arg-macro: procedure free_page free_pages((addr), 0)
   --    free_pages((addr), 0)
  -- Plain integer GFP bitmasks. Do not use this directly.  
  -- If the above are modified, __GFP_BITS_SHIFT may need updating  
  -- * GFP bitmasks..
  -- *
  -- * Zone modifiers (see linux/mmzone.h - low three bits)
  -- *
  -- * Do not put any conditional on these. If necessary modify the definitions
  -- * without the underscores and use them consistently. The definitions here may
  -- * be used in bit comparisons.
  --  

  -- * Action modifiers - doesn't change the zoning
  -- *
  -- * __GFP_REPEAT: Try hard to allocate the memory, but the allocation attempt
  -- * _might_ fail.  This depends upon the particular VM implementation.
  -- *
  -- * __GFP_NOFAIL: The VM implementation _must_ retry infinitely: the caller
  -- * cannot handle allocation failures.  This modifier is deprecated and no new
  -- * users should be added.
  -- *
  -- * __GFP_NORETRY: The VM implementation must not retry indefinitely.
  -- *
  -- * __GFP_MOVABLE: Flag that this page will be movable by the page migration
  -- * mechanism or reclaimed
  --  

  -- * This may seem redundant, but it's a way of annotating false positives vs.
  -- * allocations that simply cannot be supported (e.g. page tables).
  --  

  -- This equals 0, but use constants in case they ever change  
  -- GFP_ATOMIC means both !wait (__GFP_WAIT not set) and use emergency pool  
  -- * GFP_THISNODE does not perform any reclaim, you most likely want to
  -- * use __GFP_THISNODE to allocate from a given node without fallback!
  --  

  -- This mask makes up all the page movable related flags  
  -- Control page allocator reclaim behavior  
  -- Control slab gfp mask during early boot  
  -- Control allocation constraints  
  -- Do not use these with a slab allocator  
  -- Flag - indicates that the buffer will be suitable for DMA.  Ignored on some
  --   platforms, used as appropriate on others  

  -- 4GB DMA on some platforms  
  -- Convert GFP flags to their corresponding migrate type  
   function allocflags_to_migratetype (gfp_flags : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:159
   pragma Import (CPP, allocflags_to_migratetype, "_ZL25allocflags_to_migratetypej");

  -- Group based on mobility  
  -- * GFP_ZONE_TABLE is a word size bitstring that is used for looking up the
  -- * zone to use given the lowest 4 bits of gfp_t. Entries are ZONE_SHIFT long
  -- * and there are 16 of them to cover all possible combinations of
  -- * __GFP_DMA, __GFP_DMA32, __GFP_MOVABLE and __GFP_HIGHMEM.
  -- *
  -- * The zone fallback order is MOVABLE=>HIGHMEM=>NORMAL=>DMA32=>DMA.
  -- * But GFP_MOVABLE is not only a zone specifier but also an allocation
  -- * policy. Therefore __GFP_MOVABLE plus another zone selector is valid.
  -- * Only 1 bit of the lowest 3 bits (DMA,DMA32,HIGHMEM) can be set to "1".
  -- *
  -- *       bit       result
  -- *       =================
  -- *       0x0    => NORMAL
  -- *       0x1    => DMA or NORMAL
  -- *       0x2    => HIGHMEM or NORMAL
  -- *       0x3    => BAD (DMA+HIGHMEM)
  -- *       0x4    => DMA32 or DMA or NORMAL
  -- *       0x5    => BAD (DMA+DMA32)
  -- *       0x6    => BAD (HIGHMEM+DMA32)
  -- *       0x7    => BAD (HIGHMEM+DMA32+DMA)
  -- *       0x8    => NORMAL (MOVABLE+0)
  -- *       0x9    => DMA or NORMAL (MOVABLE+DMA)
  -- *       0xa    => MOVABLE (Movable is valid only if HIGHMEM is set too)
  -- *       0xb    => BAD (MOVABLE+HIGHMEM+DMA)
  -- *       0xc    => DMA32 (MOVABLE+DMA32)
  -- *       0xd    => BAD (MOVABLE+DMA32+DMA)
  -- *       0xe    => BAD (MOVABLE+DMA32+HIGHMEM)
  -- *       0xf    => BAD (MOVABLE+DMA32+HIGHMEM+DMA)
  -- *
  -- * ZONES_SHIFT must be <= 2 on 32 bit platforms.
  --  

  -- * GFP_ZONE_BAD is a bitmap for all combinations of __GFP_DMA, __GFP_DMA32
  -- * __GFP_HIGHMEM and __GFP_MOVABLE that are not permitted. One flag per
  -- * entry starting with bit 0. Bit is set if the combination is not
  -- * allowed.
  --  

   function gfp_zone (flags : linux_types_h.gfp_t) return linux_mmzone_h.zone_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:254
   pragma Import (CPP, gfp_zone, "_ZL8gfp_zonej");

  -- * There is only one page-allocator function, and two main namespaces to
  -- * it. The alloc_page*() variants return 'struct page *' and as such
  -- * can allocate highmem pages, the *get*page*() variants return
  -- * virtual kernel addresses to the allocated page(s).
  --  

   function gfp_zonelist (flags : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:272
   pragma Import (CPP, gfp_zonelist, "_ZL12gfp_zonelistj");

  -- * We get the zone list from the current node and the gfp_mask.
  -- * This zone list contains a maximum of MAXNODES*MAX_NR_ZONES zones.
  -- * There are two zonelists per node, one for all zones with memory and
  -- * one containing just zones from the node the zonelist belongs to.
  -- *
  -- * For the normal case of non-DISCONTIGMEM systems the NODE_DATA() gets
  -- * optimized to &contig_page_data at compile-time.
  --  

   function node_zonelist (nid : int; flags : linux_types_h.gfp_t) return access linux_mmzone_h.zonelist;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:289
   pragma Import (CPP, node_zonelist, "_ZL13node_zonelistij");

   procedure arch_free_page (the_page : access linux_mm_types_h.page; order : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:295
   pragma Import (CPP, arch_free_page, "_ZL14arch_free_pageP4pagei");

   procedure arch_alloc_page (the_page : access linux_mm_types_h.page; order : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:298
   pragma Import (CPP, arch_alloc_page, "_ZL15arch_alloc_pageP4pagei");

   --  skipped func __alloc_pages_nodemask

   --  skipped func __alloc_pages

   function alloc_pages_node
     (nid : int;
      gfp_mask : linux_types_h.gfp_t;
      order : unsigned) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:312
   pragma Import (CPP, alloc_pages_node, "_ZL16alloc_pages_nodeijj");

  -- Unknown node is current node  
   function alloc_pages_exact_node
     (nid : int;
      gfp_mask : linux_types_h.gfp_t;
      order : unsigned) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:322
   pragma Import (CPP, alloc_pages_exact_node, "_ZL22alloc_pages_exact_nodeijj");

   function alloc_pages_current (gfp_mask : linux_types_h.gfp_t; order : unsigned) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:331
   pragma Import (CPP, alloc_pages_current, "_Z19alloc_pages_currentjj");

   function alloc_pages (gfp_mask : linux_types_h.gfp_t; order : unsigned) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:334
   pragma Import (CPP, alloc_pages, "_ZL11alloc_pagesjj");

   function alloc_pages_vma
     (gfp_mask : linux_types_h.gfp_t;
      order : int;
      vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      node : int) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:338
   pragma Import (CPP, alloc_pages_vma, "_Z15alloc_pages_vmajiP14vm_area_structmi");

   function alloc_kmem_pages (gfp_mask : linux_types_h.gfp_t; order : unsigned) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:353
   pragma Import (CPP, alloc_kmem_pages, "_Z16alloc_kmem_pagesjj");

   function alloc_kmem_pages_node
     (nid : int;
      gfp_mask : linux_types_h.gfp_t;
      order : unsigned) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:354
   pragma Import (CPP, alloc_kmem_pages_node, "_Z21alloc_kmem_pages_nodeijj");

   --  skipped func __get_free_pages

   function get_zeroed_page (gfp_mask : linux_types_h.gfp_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:358
   pragma Import (CPP, get_zeroed_page, "_Z15get_zeroed_pagej");

   function alloc_pages_exact (size : linux_types_h.size_t; gfp_mask : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:360
   pragma Import (CPP, alloc_pages_exact, "_Z17alloc_pages_exactmj");

   procedure free_pages_exact (virt : System.Address; size : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:361
   pragma Import (CPP, free_pages_exact, "_Z16free_pages_exactPvm");

  -- This is different from alloc_pages_exact_node !!!  
   function alloc_pages_exact_nid
     (nid : int;
      size : linux_types_h.size_t;
      gfp_mask : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:363
   pragma Import (CPP, alloc_pages_exact_nid, "_Z21alloc_pages_exact_nidimj");

   --  skipped func __free_pages

   procedure free_pages (addr : unsigned_long; order : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:372
   pragma Import (CPP, free_pages, "_Z10free_pagesmj");

   procedure free_hot_cold_page (the_page : access linux_mm_types_h.page; cold : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:373
   pragma Import (CPP, free_hot_cold_page, "_Z18free_hot_cold_pageP4pageb");

   procedure free_hot_cold_page_list (list : access linux_types_h.list_head; cold : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:374
   pragma Import (CPP, free_hot_cold_page_list, "_Z23free_hot_cold_page_listP9list_headb");

   --  skipped func __free_kmem_pages

   procedure free_kmem_pages (addr : unsigned_long; order : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:377
   pragma Import (CPP, free_kmem_pages, "_Z15free_kmem_pagesmj");

   procedure page_alloc_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:382
   pragma Import (CPP, page_alloc_init, "_Z15page_alloc_initv");

   procedure drain_zone_pages (the_zone : access linux_mmzone_h.zone; pcp : access linux_mmzone_h.per_cpu_pages);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:383
   pragma Import (CPP, drain_zone_pages, "_Z16drain_zone_pagesP4zoneP13per_cpu_pages");

   procedure drain_all_pages;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:384
   pragma Import (CPP, drain_all_pages, "_Z15drain_all_pagesv");

   procedure drain_local_pages (dummy : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:385
   pragma Import (CPP, drain_local_pages, "_Z17drain_local_pagesPv");

  -- * gfp_allowed_mask is set to GFP_BOOT_MASK during early boot to restrict what
  -- * GFP flags are used before interrupts are enabled. Once interrupts are
  -- * enabled, it is set to __GFP_BITS_MASK while the system is running. During
  -- * hibernation, it is used by PM to avoid I/O during memory allocation while
  -- * devices are suspended.
  --  

   gfp_allowed_mask : aliased linux_types_h.gfp_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:394
   pragma Import (C, gfp_allowed_mask, "gfp_allowed_mask");

  -- Returns true if the gfp_mask allows use of ALLOC_NO_WATERMARK  
   function gfp_pfmemalloc_allowed (gfp_mask : linux_types_h.gfp_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:397
   pragma Import (CPP, gfp_pfmemalloc_allowed, "_Z22gfp_pfmemalloc_allowedj");

   procedure pm_restrict_gfp_mask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:399
   pragma Import (CPP, pm_restrict_gfp_mask, "_Z20pm_restrict_gfp_maskv");

   procedure pm_restore_gfp_mask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:400
   pragma Import (CPP, pm_restore_gfp_mask, "_Z19pm_restore_gfp_maskv");

   function pm_suspended_storage return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/gfp.h:403
   pragma Import (CPP, pm_suspended_storage, "_Z20pm_suspended_storagev");

  -- The below functions must be run on a range from a single zone.  
  -- CMA stuff  
end linux_gfp_h;

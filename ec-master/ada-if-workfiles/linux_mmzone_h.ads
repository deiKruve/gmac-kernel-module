pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_mm_types_h;
with linux_types_h;
with asm_generic_int_ll64_h;
with linux_spinlock_types_h;
with Interfaces.C.Extensions;
with linux_seqlock_h;
with asm_generic_atomic_long_h;
with linux_wait_h;
with System;
with Interfaces.C.Strings;
limited with linux_sched_h;
with linux_mutex_h;
limited with linux_sysctl_h;
limited with linux_nodemask_h;

package linux_mmzone_h is

   --  unsupported macro: MAX_ORDER 11
   --  unsupported macro: MAX_ORDER_NR_PAGES (1 << (MAX_ORDER - 1))
   --  unsupported macro: PAGE_ALLOC_COSTLY_ORDER 3
   --  arg-macro: procedure is_migrate_cma false
   --    false
   --  arg-macro: procedure for_each_migratetype_order for (order := 0; order < MAX_ORDER; order++) for (type := 0; type < MIGRATE_TYPES; type++)
   --    for (order := 0; order < MAX_ORDER; order++) for (type := 0; type < MIGRATE_TYPES; type++)
   --  unsupported macro: NR_MIGRATETYPE_BITS (PB_migrate_end - PB_migrate + 1)
   --  unsupported macro: MIGRATETYPE_MASK ((1UL << NR_MIGRATETYPE_BITS) - 1)
   --  arg-macro: procedure get_pageblock_migratetype get_pfnblock_flags_mask(page, page_to_pfn(page), PB_migrate_end, MIGRATETYPE_MASK)
   --    get_pfnblock_flags_mask(page, page_to_pfn(page), PB_migrate_end, MIGRATETYPE_MASK)
   --  arg-macro: procedure ZONE_PADDING struct zone_padding name;
   --    struct zone_padding name;
   --  unsupported macro: LRU_BASE 0
   --  unsupported macro: LRU_ACTIVE 1
   --  unsupported macro: LRU_FILE 2
   --  arg-macro: procedure for_each_lru for (lru := 0; lru < NR_LRU_LISTS; lru++)
   --    for (lru := 0; lru < NR_LRU_LISTS; lru++)
   --  arg-macro: procedure for_each_evictable_lru for (lru := 0; lru <= LRU_ACTIVE_FILE; lru++)
   --    for (lru := 0; lru <= LRU_ACTIVE_FILE; lru++)
   --  unsupported macro: LRU_ALL_FILE (BIT(LRU_INACTIVE_FILE) | BIT(LRU_ACTIVE_FILE))
   --  unsupported macro: LRU_ALL_ANON (BIT(LRU_INACTIVE_ANON) | BIT(LRU_ACTIVE_ANON))
   --  unsupported macro: LRU_ALL ((1 << NR_LRU_LISTS) - 1)
   --  unsupported macro: ISOLATE_CLEAN ((__force isolate_mode_t)0x1)
   --  unsupported macro: ISOLATE_UNMAPPED ((__force isolate_mode_t)0x2)
   --  unsupported macro: ISOLATE_ASYNC_MIGRATE ((__force isolate_mode_t)0x4)
   --  unsupported macro: ISOLATE_UNEVICTABLE ((__force isolate_mode_t)0x8)
   --  arg-macro: function min_wmark_pages (z.watermark(WMARK_MIN)
   --    return z.watermark(WMARK_MIN);
   --  arg-macro: function low_wmark_pages (z.watermark(WMARK_LOW)
   --    return z.watermark(WMARK_LOW);
   --  arg-macro: function high_wmark_pages (z.watermark(WMARK_HIGH)
   --    return z.watermark(WMARK_HIGH);
   --  unsupported macro: DEF_PRIORITY 12
   --  unsupported macro: MAX_ZONES_PER_ZONELIST (MAX_NUMNODES * MAX_NR_ZONES)
   --  unsupported macro: MAX_ZONELISTS 2
   --  arg-macro: function node_present_pages (NODE_DATA(nid).node_present_pages
   --    return NODE_DATA(nid).node_present_pages;
   --  arg-macro: function node_spanned_pages (NODE_DATA(nid).node_spanned_pages
   --    return NODE_DATA(nid).node_spanned_pages;
   --  arg-macro: procedure pgdat_page_nr pfn_to_page((pgdat).node_start_pfn + (pagenr))
   --    pfn_to_page((pgdat).node_start_pfn + (pagenr))
   --  arg-macro: procedure nid_page_nr pgdat_page_nr(NODE_DATA(nid),(pagenr))
   --    pgdat_page_nr(NODE_DATA(nid),(pagenr))
   --  arg-macro: function node_start_pfn (NODE_DATA(nid).node_start_pfn
   --    return NODE_DATA(nid).node_start_pfn;
   --  arg-macro: procedure node_end_pfn pgdat_end_pfn(NODE_DATA(nid))
   --    pgdat_end_pfn(NODE_DATA(nid))
   --  arg-macro: function zone_idx ((zone) - (zone).zone_pgdat.node_zones
   --    return (zone) - (zone).zone_pgdat.node_zones;
   --  unsupported macro: NUMA_ZONELIST_ORDER_LEN 16
   --  arg-macro: procedure for_each_online_pgdat for (pgdat := first_online_pgdat(); pgdat; pgdat := next_online_pgdat(pgdat))
   --    for (pgdat := first_online_pgdat(); pgdat; pgdat := next_online_pgdat(pgdat))
   --  arg-macro: procedure for_each_zone for (zone := (first_online_pgdat()).node_zones; zone; zone := next_zone(zone))
   --    for (zone := (first_online_pgdat()).node_zones; zone; zone := next_zone(zone))
   --  arg-macro: procedure for_each_populated_zone for (zone := (first_online_pgdat()).node_zones; zone; zone := next_zone(zone)) if (notpopulated_zone(zone)) ; else
   --    for (zone := (first_online_pgdat()).node_zones; zone; zone := next_zone(zone)) if (notpopulated_zone(zone)) ; else
   --  arg-macro: procedure for_each_zone_zonelist_nodemask for (z := first_zones_zonelist(zlist, highidx, nodemask, andzone); zone; z := next_zones_zonelist(++z, highidx, nodemask, andzone))
   --    for (z := first_zones_zonelist(zlist, highidx, nodemask, andzone); zone; z := next_zones_zonelist(++z, highidx, nodemask, andzone))
   --  arg-macro: procedure for_each_zone_zonelist for_each_zone_zonelist_nodemask(zone, z, zlist, highidx, NULL)
   --    for_each_zone_zonelist_nodemask(zone, z, zlist, highidx, NULL)
   --  unsupported macro: PA_SECTION_SHIFT (SECTION_SIZE_BITS)
   --  unsupported macro: PFN_SECTION_SHIFT (SECTION_SIZE_BITS - PAGE_SHIFT)
   --  unsupported macro: NR_MEM_SECTIONS (1UL << SECTIONS_SHIFT)
   --  unsupported macro: PAGES_PER_SECTION (1UL << PFN_SECTION_SHIFT)
   --  unsupported macro: PAGE_SECTION_MASK (~(PAGES_PER_SECTION-1))
   --  unsupported macro: SECTION_BLOCKFLAGS_BITS ((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
   --  arg-macro: function pfn_to_section_nr ((pfn) >> PFN_SECTION_SHIFT
   --    return (pfn) >> PFN_SECTION_SHIFT;
   --  arg-macro: function section_nr_to_pfn ((sec) << PFN_SECTION_SHIFT
   --    return (sec) << PFN_SECTION_SHIFT;
   --  arg-macro: function SECTION_ALIGN_UP (((pfn) + PAGES_PER_SECTION - 1) and PAGE_SECTION_MASK
   --    return ((pfn) + PAGES_PER_SECTION - 1) and PAGE_SECTION_MASK;
   --  arg-macro: function SECTION_ALIGN_DOWN ((pfn) and PAGE_SECTION_MASK
   --    return (pfn) and PAGE_SECTION_MASK;
   --  unsupported macro: SECTIONS_PER_ROOT (PAGE_SIZE / sizeof (struct mem_section))
   --  arg-macro: function SECTION_NR_TO_ROOT ((sec) / SECTIONS_PER_ROOT
   --    return (sec) / SECTIONS_PER_ROOT;
   --  unsupported macro: NR_SECTION_ROOTS DIV_ROUND_UP(NR_MEM_SECTIONS, SECTIONS_PER_ROOT)
   --  unsupported macro: SECTION_ROOT_MASK (SECTIONS_PER_ROOT - 1)
   --  unsupported macro: SECTION_MARKED_PRESENT (1UL<<0)
   --  unsupported macro: SECTION_HAS_MEM_MAP (1UL<<1)
   --  unsupported macro: SECTION_MAP_LAST_BIT (1UL<<2)
   --  unsupported macro: SECTION_MAP_MASK (~(SECTION_MAP_LAST_BIT-1))
   --  unsupported macro: SECTION_NID_SHIFT 2
   --  arg-macro: function pfn_to_nid ({ unsigned long __pfn_to_nid_pfn := (pfn); page_to_nid(pfn_to_page(__pfn_to_nid_pfn)); }
   --    return { unsigned long __pfn_to_nid_pfn := (pfn); page_to_nid(pfn_to_page(__pfn_to_nid_pfn)); };
   --  arg-macro: procedure early_pfn_valid pfn_valid(pfn)
   --    pfn_valid(pfn)
   --  arg-macro: function pfn_valid_within (1
   --    return 1;
  -- Free memory management - zoned buddy allocator.   
  -- * PAGE_ALLOC_COSTLY_ORDER is the order at which allocations are deemed
  -- * costly to service.  That is between allocation orders which should
  -- * coalesce naturally under reasonable reclaim pressure and those which
  -- * will not.
  --  

  -- the number of types on the pcp lists  
  --	 * MIGRATE_CMA migration type is designed to mimic the way
  --	 * ZONE_MOVABLE works.  Only movable pages can be allocated
  --	 * from MIGRATE_CMA pageblocks and page allocator never
  --	 * implicitly change migration type of MIGRATE_CMA pageblock.
  --	 *
  --	 * The way to use it is to change migratetype of a range of
  --	 * pageblocks to MIGRATE_CMA which can be done by
  --	 * __free_pageblock_cma() function.  What is important though
  --	 * is that a range of pageblocks must be aligned to
  --	 * MAX_ORDER_NR_PAGES should biggest page be bigger then
  --	 * a single pageblock.
  --	  

  -- can't allocate from here  
   page_group_by_mobility_disabled : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:76
   pragma Import (C, page_group_by_mobility_disabled, "page_group_by_mobility_disabled");

   function get_pfnblock_migratetype (the_page : access linux_mm_types_h.page; pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:85
   pragma Import (CPP, get_pfnblock_migratetype, "_ZL24get_pfnblock_migratetypeP4pagem");

   type free_area_free_list_array is array (0 .. 4) of aliased linux_types_h.list_head;
   type free_area is record
      free_list : aliased free_area_free_list_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:93
      nr_free : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:94
   end record;
   pragma Convention (C_Pass_By_Copy, free_area);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:92

  -- * zone->lock and zone->lru_lock are two of the hottest locks in the kernel.
  -- * So add a wild amount of padding here to ensure that they fall into separate
  -- * cachelines.  There are very few zone structures in the machine, so space
  -- * consumption is not a concern here.
  --  

   subtype zone_padding_x_array is Interfaces.C.char_array (0 .. -1);
   type zone_padding is record
      x : aliased zone_padding_x_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:107
   end record;
   pragma Convention (C_Pass_By_Copy, zone_padding);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:106

   subtype zone_stat_item is unsigned;
   NR_FREE_PAGES : constant zone_stat_item := 0;
   NR_ALLOC_BATCH : constant zone_stat_item := 1;
   NR_LRU_BASE : constant zone_stat_item := 2;
   NR_INACTIVE_ANON : constant zone_stat_item := 2;
   NR_ACTIVE_ANON : constant zone_stat_item := 3;
   NR_INACTIVE_FILE : constant zone_stat_item := 4;
   NR_ACTIVE_FILE : constant zone_stat_item := 5;
   NR_UNEVICTABLE : constant zone_stat_item := 6;
   NR_MLOCK : constant zone_stat_item := 7;
   NR_ANON_PAGES : constant zone_stat_item := 8;
   NR_FILE_MAPPED : constant zone_stat_item := 9;
   NR_FILE_PAGES : constant zone_stat_item := 10;
   NR_FILE_DIRTY : constant zone_stat_item := 11;
   NR_WRITEBACK : constant zone_stat_item := 12;
   NR_SLAB_RECLAIMABLE : constant zone_stat_item := 13;
   NR_SLAB_UNRECLAIMABLE : constant zone_stat_item := 14;
   NR_PAGETABLE : constant zone_stat_item := 15;
   NR_KERNEL_STACK : constant zone_stat_item := 16;
   NR_UNSTABLE_NFS : constant zone_stat_item := 17;
   NR_BOUNCE : constant zone_stat_item := 18;
   NR_VMSCAN_WRITE : constant zone_stat_item := 19;
   NR_VMSCAN_IMMEDIATE : constant zone_stat_item := 20;
   NR_WRITEBACK_TEMP : constant zone_stat_item := 21;
   NR_ISOLATED_ANON : constant zone_stat_item := 22;
   NR_ISOLATED_FILE : constant zone_stat_item := 23;
   NR_SHMEM : constant zone_stat_item := 24;
   NR_DIRTIED : constant zone_stat_item := 25;
   NR_WRITTEN : constant zone_stat_item := 26;
   NUMA_HIT : constant zone_stat_item := 27;
   NUMA_MISS : constant zone_stat_item := 28;
   NUMA_FOREIGN : constant zone_stat_item := 29;
   NUMA_INTERLEAVE_HIT : constant zone_stat_item := 30;
   NUMA_LOCAL : constant zone_stat_item := 31;
   NUMA_OTHER : constant zone_stat_item := 32;
   WORKINGSET_REFAULT : constant zone_stat_item := 33;
   WORKINGSET_ACTIVATE : constant zone_stat_item := 34;
   WORKINGSET_NODERECLAIM : constant zone_stat_item := 35;
   NR_ANON_TRANSPARENT_HUGEPAGES : constant zone_stat_item := 36;
   NR_FREE_CMA_PAGES : constant zone_stat_item := 37;
   NR_VM_ZONE_STAT_ITEMS : constant zone_stat_item := 38;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:114

  -- First 128 byte cacheline (assuming 64 bit words)  
  -- must match order of LRU_[IN]ACTIVE  
  --  "     "     "   "       "          
  --  "     "     "   "       "          
  --  "     "     "   "       "          
  --  "     "     "   "       "          
  -- mlock()ed pages found and moved off LRU  
  -- Mapped anonymous pages  
  -- pagecache pages mapped into pagetables.
  --			   only modified from process context  

  -- used for pagetables  
  -- Second 128 byte cacheline  
  -- NFS unstable pages  
  -- Prioritise for reclaim when writeback ends  
  -- Writeback using temporary buffers  
  -- Temporary isolated pages from anon lru  
  -- Temporary isolated pages from file lru  
  -- shmem pages (included tmpfs/GEM pages)  
  -- page dirtyings since bootup  
  -- page writings since bootup  
  -- allocated in intended node  
  -- allocated in non intended node  
  -- was intended here, hit elsewhere  
  -- interleaver preferred this zone  
  -- allocation from local node  
  -- allocation from other node  
  -- * We do arithmetic on the LRU lists in various places in the code,
  -- * so it is important to keep the active lists LRU_ACTIVE higher in
  -- * the array than the corresponding inactive lists, and to keep
  -- * the *_FILE lists LRU_FILE higher than the corresponding _ANON lists.
  -- *
  -- * This has to be kept in sync with the statistics in zone_stat_item
  -- * above and the descriptions in vmstat_text in mm/vmstat.c
  --  

   type lru_list is 
     (LRU_INACTIVE_ANON,
      LRU_ACTIVE_ANON,
      LRU_INACTIVE_FILE,
      LRU_ACTIVE_FILE,
      LRU_UNEVICTABLE,
      NR_LRU_LISTS);
   pragma Convention (C, lru_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:174

   function is_file_lru (lru : lru_list) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:187
   pragma Import (CPP, is_file_lru, "_ZL11is_file_lru8lru_list");

   function is_active_lru (lru : lru_list) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:192
   pragma Import (CPP, is_active_lru, "_ZL13is_active_lru8lru_list");

   function is_unevictable_lru (lru : lru_list) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:197
   pragma Import (CPP, is_unevictable_lru, "_ZL18is_unevictable_lru8lru_list");

  --	 * The pageout code in vmscan.c keeps track of how many of the
  --	 * mem/swap backed and file backed pages are referenced.
  --	 * The higher the rotated/scanned ratio, the more valuable
  --	 * that cache is.
  --	 *
  --	 * The anon LRU stats live in [0], file LRU stats in [1]
  --	  

   type zone_reclaim_stat_recent_rotated_array is array (0 .. 1) of aliased unsigned_long;
   type zone_reclaim_stat_recent_scanned_array is array (0 .. 1) of aliased unsigned_long;
   type zone_reclaim_stat is record
      recent_rotated : aliased zone_reclaim_stat_recent_rotated_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:211
      recent_scanned : aliased zone_reclaim_stat_recent_scanned_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:212
   end record;
   pragma Convention (C_Pass_By_Copy, zone_reclaim_stat);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:202

   type lruvec_lists_array is array (0 .. 4) of aliased linux_types_h.list_head;
   type zone;
   type lruvec is record
      lists : aliased lruvec_lists_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:216
      reclaim_stat : aliased zone_reclaim_stat;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:217
      the_zone : access zone;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:219
   end record;
   pragma Convention (C_Pass_By_Copy, lruvec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:215

  -- Mask used at gathering information at once (see memcontrol.c)  
  -- Isolate clean file  
  -- Isolate unmapped file  
  -- Isolate for asynchronous migration  
  -- Isolate unevictable pages  
  -- LRU Isolation modes.  
   subtype isolate_mode_t is unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:238

   type zone_watermarks is 
     (WMARK_MIN,
      WMARK_LOW,
      WMARK_HIGH,
      NR_WMARK);
   pragma Convention (C, zone_watermarks);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:240

  -- number of pages in the list  
   type per_cpu_pages_lists_array is array (0 .. 2) of aliased linux_types_h.list_head;
   type per_cpu_pages is record
      count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:252
      high : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:253
      batch : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:254
      lists : aliased per_cpu_pages_lists_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:257
   end record;
   pragma Convention (C_Pass_By_Copy, per_cpu_pages);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:251

  -- high watermark, emptying needed  
  -- chunk size for buddy add/remove  
  -- Lists of pages, one per migrate type stored on the pcp-lists  
   type per_cpu_pageset_vm_stat_diff_array is array (0 .. 37) of aliased asm_generic_int_ll64_h.s8;
   type per_cpu_pageset is record
      pcp : aliased per_cpu_pages;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:261
      expire : aliased asm_generic_int_ll64_h.s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:263
      stat_threshold : aliased asm_generic_int_ll64_h.s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:266
      vm_stat_diff : aliased per_cpu_pageset_vm_stat_diff_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:267
   end record;
   pragma Convention (C_Pass_By_Copy, per_cpu_pageset);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:260

   type zone_type is 
     (ZONE_DMA,
      ZONE_DMA32,
      ZONE_NORMAL,
      ZONE_MOVABLE,
      uu_MAX_NR_ZONES);
   pragma Convention (C, zone_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:273

  --	 * ZONE_DMA is used when there are devices that are not able
  --	 * to do DMA to all of addressable memory (ZONE_NORMAL). Then we
  --	 * carve out the portion of memory that is needed for these devices.
  --	 * The range is arch specific.
  --	 *
  --	 * Some examples
  --	 *
  --	 * Architecture		Limit
  --	 * ---------------------------
  --	 * parisc, ia64, sparc	<4G
  --	 * s390			<2G
  --	 * arm			Various
  --	 * alpha		Unlimited or 0-16MB.
  --	 *
  --	 * i386, x86_64 and multiple other arches
  --	 * 			<16M.
  --	  

  --	 * x86_64 needs two ZONE_DMAs because it supports devices that are
  --	 * only able to do DMA to the lower 16M but also 32 bit devices that
  --	 * can only do DMA areas below 4G.
  --	  

  --	 * Normal addressable memory is in ZONE_NORMAL. DMA operations can be
  --	 * performed on pages in ZONE_NORMAL if the DMA devices support
  --	 * transfers to all addressable memory.
  --	  

  --	 * A memory area that is only addressable by the kernel through
  --	 * mapping portions into its own address space. This is for example
  --	 * used by i386 to allow the kernel to address the memory beyond
  --	 * 900MB. The kernel will set up special mappings (page
  --	 * table entries on i386) for each page that the kernel needs to
  --	 * access.
  --	  

  -- Fields commonly accessed by the page allocator  
  -- zone watermarks, access with *_wmark_pages(zone) macros  
   type zone is record
      watermark : aliased zone_watermark_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:330
      percpu_drift_mark : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:337
      lowmem_reserve : aliased zone_lowmem_reserve_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:347
      dirty_balance_reserve : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:353
      node : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:356
      min_unmapped_pages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:360
      min_slab_pages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:361
      pageset : access per_cpu_pageset;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:363
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:367
      compact_blockskip_flush : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:370
      compact_cached_free_pfn : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:373
      compact_cached_migrate_pfn : aliased zone_compact_cached_migrate_pfn_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:375
      span_seqlock : aliased linux_seqlock_h.seqlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:379
      free_area : aliased zone_free_area_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:381
      compact_considered : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:397
      compact_defer_shift : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:398
      compact_order_failed : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:399
      u_pad1_u : aliased zone_padding;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:402
      lru_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:405
      the_lruvec : aliased lruvec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:406
      inactive_age : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:409
      pages_scanned : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:411
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:412
      vm_stat : aliased zone_vm_stat_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:415
      inactive_ratio : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:421
      u_pad2_u : aliased zone_padding;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:424
      wait_table : access linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:451
      wait_table_hash_nr_entries : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:452
      wait_table_bits : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:453
      zone_pgdat : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:458
      zone_start_pfn : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:460
      spanned_pages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:503
      present_pages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:504
      managed_pages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:505
      nr_migrate_reserve_block : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:511
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:516
   end record;
   pragma Convention (C_Pass_By_Copy, zone);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:326

  --	 * When free pages are below this point, additional steps are taken
  --	 * when reading the number of free pages to avoid per-cpu counter
  --	 * drift allowing watermarks to be breached
  --	  

  --	 * We don't know if the memory that we're going to allocate will be freeable
  --	 * or/and it will be released eventually, so to avoid totally wasting several
  --	 * GB of ram we must reserve some of the lower zone memory (otherwise we risk
  --	 * to run OOM on the lower zones despite there's tons of freeable ram
  --	 * on the higher zones). This array is recalculated at runtime if the
  --	 * sysctl_lowmem_reserve_ratio sysctl changes.
  --	  

  --	 * This is a per-zone reserve of pages that should not be
  --	 * considered dirtyable memory.
  --	  

  --	 * zone reclaim becomes active if more unmapped pages exist.
  --	  

  --	 * free areas of different sizes
  --	  

  -- Set to true when the PG_migrate_skip bits should be cleared  
  -- pfn where compaction free scanner should start  
  -- pfn where async and sync compaction migration scanner should start  
  -- see spanned/present_pages for more description  
  --	 * Flags for a pageblock_nr_pages block. See pageblock-flags.h.
  --	 * In SPARSEMEM, this map is stored in struct mem_section
  --	  

  --	 * On compaction failure, 1<<compact_defer_shift compactions
  --	 * are skipped before trying again. The number attempted since
  --	 * last failure is tracked with compact_considered.
  --	  

  -- Fields commonly accessed by the page reclaim scanner  
  -- Evictions & activations on the inactive file list  
  -- since last reclaim  
  -- zone flags, see below  
  -- Zone statistics  
  --	 * The target ratio of ACTIVE_ANON to INACTIVE_ANON pages on
  --	 * this zone's LRU.  Maintained by the pageout code.
  --	  

  -- Rarely used or read-mostly fields  
  --	 * wait_table		-- the array holding the hash table
  --	 * wait_table_hash_nr_entries	-- the size of the hash table array
  --	 * wait_table_bits	-- wait_table_size == (1 << wait_table_bits)
  --	 *
  --	 * The purpose of all these is to keep track of the people
  --	 * waiting for a page to become available and make them
  --	 * runnable again when possible. The trouble is that this
  --	 * consumes a lot of space, especially when so few things
  --	 * wait on pages at a given time. So instead of using
  --	 * per-page waitqueues, we use a waitqueue hash table.
  --	 *
  --	 * The bucket discipline is to sleep on the same queue when
  --	 * colliding and wake all in that wait queue when removing.
  --	 * When something wakes, it must check to be sure its page is
  --	 * truly available, a la thundering herd. The cost of a
  --	 * collision is great, but given the expected load of the
  --	 * table, they should be so rare as to be outweighed by the
  --	 * benefits from the saved space.
  --	 *
  --	 * __wait_on_page_locked() and unlock_page() in mm/filemap.c, are the
  --	 * primary users of these fields, and in mm/page_alloc.c
  --	 * free_area_init_core() performs the initialization of them.
  --	  

  --	 * Discontig memory support fields.
  --	  

  -- zone_start_pfn == zone_start_paddr >> PAGE_SHIFT  
  --	 * spanned_pages is the total pages spanned by the zone, including
  --	 * holes, which is calculated as:
  --	 * 	spanned_pages = zone_end_pfn - zone_start_pfn;
  --	 *
  --	 * present_pages is physical pages existing within the zone, which
  --	 * is calculated as:
  --	 *	present_pages = spanned_pages - absent_pages(pages in holes);
  --	 *
  --	 * managed_pages is present pages managed by the buddy system, which
  --	 * is calculated as (reserved_pages includes pages allocated by the
  --	 * bootmem allocator):
  --	 *	managed_pages = present_pages - reserved_pages;
  --	 *
  --	 * So present_pages may be used by memory hotplug or memory power
  --	 * management logic to figure out unmanaged pages by checking
  --	 * (present_pages - managed_pages). And managed_pages should be used
  --	 * by page allocator and vm scanner to calculate all kinds of watermarks
  --	 * and thresholds.
  --	 *
  --	 * Locking rules:
  --	 *
  --	 * zone_start_pfn and spanned_pages are protected by span_seqlock.
  --	 * It is a seqlock because it has to be read outside of zone->lock,
  --	 * and it is done in the main allocator path.  But, it is written
  --	 * quite infrequently.
  --	 *
  --	 * The span_seq lock is declared along with zone->lock because it is
  --	 * frequently read in proximity to zone->lock.  It's good to
  --	 * give them a chance of being in the same cacheline.
  --	 *
  --	 * Write access to present_pages at runtime should be protected by
  --	 * mem_hotplug_begin/end(). Any reader who can't tolerant drift of
  --	 * present_pages should get_online_mems() to get a stable value.
  --	 *
  --	 * Read access to managed_pages should be safe because it's unsigned
  --	 * long. Write access to zone->managed_pages and totalram_pages are
  --	 * protected by managed_page_count_lock at runtime. Idealy only
  --	 * adjust_managed_page_count() should be used instead of directly
  --	 * touching zone->managed_pages and totalram_pages.
  --	  

  --	 * Number of MIGRATE_RESEVE page block. To maintain for just
  --	 * optimization. Protected by zone->lock.
  --	  

  --	 * rarely used fields:
  --	  

  -- prevents concurrent reclaim  
  -- zone is in OOM killer zonelist  
  -- zone has many dirty pages backed by
  --					 * a congested BDI
  --					  

  -- reclaim scanning has recently found
  --					 * many dirty file pages at the tail
  --					 * of the LRU.
  --					  

  -- reclaim scanning has recently found
  --					 * many pages under writeback
  --					  

   type zone_flags_t is 
     (ZONE_RECLAIM_LOCKED,
      ZONE_OOM_LOCKED,
      ZONE_CONGESTED,
      ZONE_TAIL_LRU_DIRTY,
      ZONE_WRITEBACK);
   pragma Convention (C, zone_flags_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:532

   procedure zone_set_flag (the_zone : access zone; flag : zone_flags_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:534
   pragma Import (CPP, zone_set_flag, "_ZL13zone_set_flagP4zone12zone_flags_t");

   function zone_test_and_set_flag (the_zone : access zone; flag : zone_flags_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:539
   pragma Import (CPP, zone_test_and_set_flag, "_ZL22zone_test_and_set_flagP4zone12zone_flags_t");

   procedure zone_clear_flag (the_zone : access zone; flag : zone_flags_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:544
   pragma Import (CPP, zone_clear_flag, "_ZL15zone_clear_flagP4zone12zone_flags_t");

   function zone_is_reclaim_congested (the_zone : access constant zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:549
   pragma Import (CPP, zone_is_reclaim_congested, "_ZL25zone_is_reclaim_congestedPK4zone");

   function zone_is_reclaim_dirty (the_zone : access constant zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:554
   pragma Import (CPP, zone_is_reclaim_dirty, "_ZL21zone_is_reclaim_dirtyPK4zone");

   function zone_is_reclaim_writeback (the_zone : access constant zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:559
   pragma Import (CPP, zone_is_reclaim_writeback, "_ZL25zone_is_reclaim_writebackPK4zone");

   function zone_is_reclaim_locked (the_zone : access constant zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:564
   pragma Import (CPP, zone_is_reclaim_locked, "_ZL22zone_is_reclaim_lockedPK4zone");

   function zone_is_oom_locked (the_zone : access constant zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:569
   pragma Import (CPP, zone_is_oom_locked, "_ZL18zone_is_oom_lockedPK4zone");

   function zone_end_pfn (the_zone : access constant zone) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:574
   pragma Import (CPP, zone_end_pfn, "_ZL12zone_end_pfnPK4zone");

   function zone_spans_pfn (the_zone : access constant zone; pfn : unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:579
   pragma Import (CPP, zone_spans_pfn, "_ZL14zone_spans_pfnPK4zonem");

   function zone_is_initialized (the_zone : access zone) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:584
   pragma Import (CPP, zone_is_initialized, "_ZL19zone_is_initializedP4zone");

   function zone_is_empty (the_zone : access zone) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:589
   pragma Import (CPP, zone_is_empty, "_ZL13zone_is_emptyP4zone");

  -- * The "priority" of VM scanning is how much of the queues we will scan in one
  -- * go. A value of 12 for DEF_PRIORITY implies that we will scan 1/4096th of the
  -- * queues ("queue_length >> 12") during an aging round.
  --  

  -- Maximum number of zones on a zonelist  
  -- * The NUMA zonelists are doubled because we need zonelists that restrict the
  -- * allocations to a single node for __GFP_THISNODE.
  -- *
  -- * [0]	: Zonelist with fallback
  -- * [1]	: No fallback (__GFP_THISNODE)
  --  

  -- * We cache key information from each zonelist for smaller cache
  -- * footprint when scanning for free pages in get_page_from_freelist().
  -- *
  -- * 1) The BITMAP fullzones tracks which zones in a zonelist have come
  -- *    up short of free memory since the last time (last_fullzone_zap)
  -- *    we zero'd fullzones.
  -- * 2) The array z_to_n[] maps each zone in the zonelist to its node
  -- *    id, so that we can efficiently evaluate whether that node is
  -- *    set in the current tasks mems_allowed.
  -- *
  -- * Both fullzones and z_to_n[] are one-to-one with the zonelist,
  -- * indexed by a zones offset in the zonelist zones[] array.
  -- *
  -- * The get_page_from_freelist() routine does two scans.  During the
  -- * first scan, we skip zones whose corresponding bit in 'fullzones'
  -- * is set or whose corresponding node in current->mems_allowed (which
  -- * comes from cpusets) is not set.  During the second scan, we bypass
  -- * this zonelist_cache, to ensure we look methodically at each zone.
  -- *
  -- * Once per second, we zero out (zap) fullzones, forcing us to
  -- * reconsider nodes that might have regained more free memory.
  -- * The field last_full_zap is the time we last zapped fullzones.
  -- *
  -- * This mechanism reduces the amount of time we waste repeatedly
  -- * reexaming zones for free memory when they just came up low on
  -- * memory momentarilly ago.
  -- *
  -- * The zonelist_cache struct members logically belong in struct
  -- * zonelist.  However, the mempolicy zonelists constructed for
  -- * MPOL_BIND are intentionally variable length (and usually much
  -- * shorter).  A general purpose mechanism for handling structs with
  -- * multiple variable length members is more mechanism than we want
  -- * here.  We resort to some special case hackery instead.
  -- *
  -- * The MPOL_BIND zonelists don't need this zonelist_cache (in good
  -- * part because they are shorter), so we put the fixed length stuff
  -- * at the front of the zonelist struct, ending in a variable length
  -- * zones[], as is needed by MPOL_BIND.
  -- *
  -- * Then we put the optional zonelist cache on the end of the zonelist
  -- * struct.  This optional stuff is found by a 'zlcache_ptr' pointer in
  -- * the fixed length portion at the front of the struct.  This pointer
  -- * both enables us to find the zonelist cache, and in the case of
  -- * MPOL_BIND zonelists, (which will just set the zlcache_ptr to NULL)
  -- * to know that the zonelist cache is not there.
  -- *
  -- * The end result is that struct zonelists come in two flavors:
  -- *  1) The full, fixed length version, shown below, and
  -- *  2) The custom zonelists for MPOL_BIND.
  -- * The custom MPOL_BIND zonelists have a NULL zlcache_ptr and no zlcache.
  -- *
  -- * Even though there may be multiple CPU cores on a node modifying
  -- * fullzones or last_full_zap in the same zonelist_cache at the same
  -- * time, we don't lock it.  This is just hint data - if it is wrong now
  -- * and then, the allocator will still function, perhaps a bit slower.
  --  

  -- zone->nid  
   type zonelist_cache_z_to_n_array is array (0 .. 255) of aliased unsigned_short;
   type zonelist_cache_fullzones_array is array (0 .. 3) of aliased unsigned_long;
   type zonelist_cache is record
      z_to_n : aliased zonelist_cache_z_to_n_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:676
      fullzones : aliased zonelist_cache_fullzones_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:677
      last_full_zap : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:678
   end record;
   pragma Convention (C_Pass_By_Copy, zonelist_cache);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:675

  -- zone full?  
  -- when last zap'd (jiffies)  
  -- * This struct contains information about a zone in a zonelist. It is stored
  -- * here to avoid dereferences into large structures and lookups of tables
  --  

  -- Pointer to actual zone  
   type zoneref is record
      the_zone : access zone;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:690
      zone_idx : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:691
   end record;
   pragma Convention (C_Pass_By_Copy, zoneref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:689

  -- zone_idx(zoneref->zone)  
  -- * One allocation request operates on a zonelist. A zonelist
  -- * is a list of zones, the first one is the 'goal' of the
  -- * allocation, the other zones are fallback zones, in decreasing
  -- * priority.
  -- *
  -- * If zlcache_ptr is not NULL, then it is just the address of zlcache,
  -- * as explained above.  If zlcache_ptr is NULL, there is no zlcache.
  -- * *
  -- * To speed the reading of the zonelist, the zonerefs contain the zone index
  -- * of the entry being read. Helper functions to access information given
  -- * a struct zoneref are
  -- *
  -- * zonelist_zone()	- Return the struct zone * for an entry in _zonerefs
  -- * zonelist_zone_idx()	- Return the index of the zone for an entry
  -- * zonelist_node_idx()	- Return the index of the node for an entry
  --  

  -- NULL or &zlcache
   type zonelist_u_zonerefs_array is array (0 .. 256) of aliased zoneref;
   type zonelist is record
      zlcache_ptr : access zonelist_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:712
      u_zonerefs : aliased zonelist_u_zonerefs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:713
      zlcache : aliased zonelist_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:715
   end record;
   pragma Convention (C_Pass_By_Copy, zonelist);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:711

  -- optional ...
   type node_active_region is record
      start_pfn : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:721
      end_pfn : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:722
      nid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:723
   end record;
   pragma Convention (C_Pass_By_Copy, node_active_region);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:720

  -- The array of struct pages - for discontigmem use pgdat->lmem_map  
   mem_map : access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:729
   pragma Import (C, mem_map, "mem_map");

  -- * The pg_data_t structure is used in machines with CONFIG_DISCONTIGMEM
  -- * (mostly NUMA machines?) to denote a higher-level memory zone than the
  -- * zone denotes.
  -- *
  -- * On NUMA machines, each NUMA node would have a pg_data_t to describe
  -- * it's memory layout.
  -- *
  -- * Memory statistics and page replacement data structures are maintained on a
  -- * per-zone basis.
  --  

   --  skipped empty struct bootmem_data

   type pglist_data_node_zones_array is array (0 .. 3) of aliased zone;
   type pglist_data_node_zonelists_array is array (0 .. 1) of aliased zonelist;
   type pglist_data is record
      node_zones : aliased pglist_data_node_zones_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:745
      node_zonelists : aliased pglist_data_node_zonelists_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:746
      nr_zones : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:747
      node_size_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:768
      node_start_pfn : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:770
      node_present_pages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:771
      node_spanned_pages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:772
      node_id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:774
      kswapd_wait : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:775
      pfmemalloc_wait : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:776
      kswapd : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:777
      kswapd_max_order : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:779
      classzone_idx : aliased zone_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:780
      numabalancing_migrate_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:783
      numabalancing_migrate_next_window : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:786
      numabalancing_migrate_nr_pages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:789
   end record;
   pragma Convention (C_Pass_By_Copy, pglist_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:744

  --	 * Must be held any time you expect node_start_pfn, node_present_pages
  --	 * or node_spanned_pages stay constant.  Holding this will also
  --	 * guarantee that any pfn_valid() stays that way.
  --	 *
  --	 * pgdat_resize_lock() and pgdat_resize_unlock() are provided to
  --	 * manipulate node_size_lock without checking for CONFIG_MEMORY_HOTPLUG.
  --	 *
  --	 * Nests above zone->lock and zone->span_seqlock
  --	  

  -- total number of physical pages  
  -- total size of physical page
  --					     range, including holes  

  -- Protected by
  --					   mem_hotplug_begin/end()  

  -- Lock serializing the migrate rate limiting window  
  -- Rate limiting time interval  
  -- Number of pages migrated during the rate limiting time interval  
   subtype pg_data_t is pglist_data;

   function pgdat_end_pfn (pgdat : access pg_data_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:805
   pragma Import (CPP, pgdat_end_pfn, "_ZL13pgdat_end_pfnP11pglist_data");

   function pgdat_is_empty (pgdat : access pg_data_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:810
   pragma Import (CPP, pgdat_is_empty, "_ZL14pgdat_is_emptyP11pglist_data");

   zonelists_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:817
   pragma Import (C, zonelists_mutex, "zonelists_mutex");

   procedure build_all_zonelists (pgdat : access pg_data_t; the_zone : access zone);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:818
   pragma Import (CPP, build_all_zonelists, "_Z19build_all_zonelistsP11pglist_dataP4zone");

   procedure wakeup_kswapd
     (the_zone : access zone;
      order : int;
      classzone_idx : zone_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:819
   pragma Import (CPP, wakeup_kswapd, "_Z13wakeup_kswapdP4zonei9zone_type");

   function zone_watermark_ok
     (z : access zone;
      order : unsigned;
      mark : unsigned_long;
      classzone_idx : int;
      alloc_flags : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:820
   pragma Import (CPP, zone_watermark_ok, "_Z17zone_watermark_okP4zonejmii");

   function zone_watermark_ok_safe
     (z : access zone;
      order : unsigned;
      mark : unsigned_long;
      classzone_idx : int;
      alloc_flags : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:822
   pragma Import (CPP, zone_watermark_ok_safe, "_Z22zone_watermark_ok_safeP4zonejmii");

   type memmap_context is 
     (MEMMAP_EARLY,
      MEMMAP_HOTPLUG);
   pragma Convention (C, memmap_context);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:824

   function init_currently_empty_zone
     (the_zone : access zone;
      start_pfn : unsigned_long;
      size : unsigned_long;
      context : memmap_context) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:828
   pragma Import (CPP, init_currently_empty_zone, "_Z25init_currently_empty_zoneP4zonemm14memmap_context");

   procedure lruvec_init (the_lruvec : access lruvec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:832
   pragma Import (CPP, lruvec_init, "_Z11lruvec_initP6lruvec");

   function lruvec_zone (the_lruvec : access lruvec) return access zone;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:834
   pragma Import (CPP, lruvec_zone, "_ZL11lruvec_zoneP6lruvec");

   function local_memory_node (node_id : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:852
   pragma Import (CPP, local_memory_node, "_ZL17local_memory_nodei");

  -- * zone_idx() returns 0 for the ZONE_DMA zone, 1 for the ZONE_NORMAL zone, etc.
  --  

   function populated_zone (the_zone : access zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:864
   pragma Import (CPP, populated_zone, "_ZL14populated_zoneP4zone");

   movable_zone : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:869
   pragma Import (C, movable_zone, "movable_zone");

   function zone_movable_is_highmem return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:871
   pragma Import (CPP, zone_movable_is_highmem, "_ZL23zone_movable_is_highmemv");

   function is_highmem_idx (idx : zone_type) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:880
   pragma Import (CPP, is_highmem_idx, "_ZL14is_highmem_idx9zone_type");

  --*
  -- * is_highmem - helper function to quickly check if a struct zone is a 
  -- *              highmem zone or not.  This is an attempt to keep references
  -- *              to ZONE_{DMA/NORMAL/HIGHMEM/etc} in general code to a minimum.
  -- * @zone - pointer to struct zone variable
  --  

   function is_highmem (the_zone : access zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:896
   pragma Import (CPP, is_highmem, "_ZL10is_highmemP4zone");

  -- These two functions are used to setup the per zone pages min values  
   function min_free_kbytes_sysctl_handler
     (arg1 : access linux_sysctl_h.ctl_table;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:910
   pragma Import (CPP, min_free_kbytes_sysctl_handler, "_Z30min_free_kbytes_sysctl_handlerP9ctl_tableiPvPmPx");

   sysctl_lowmem_reserve_ratio : aliased array (0 .. 2) of aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:912
   pragma Import (C, sysctl_lowmem_reserve_ratio, "sysctl_lowmem_reserve_ratio");

   function lowmem_reserve_ratio_sysctl_handler
     (arg1 : access linux_sysctl_h.ctl_table;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:913
   pragma Import (CPP, lowmem_reserve_ratio_sysctl_handler, "_Z35lowmem_reserve_ratio_sysctl_handlerP9ctl_tableiPvPmPx");

   function percpu_pagelist_fraction_sysctl_handler
     (arg1 : access linux_sysctl_h.ctl_table;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:915
   pragma Import (CPP, percpu_pagelist_fraction_sysctl_handler, "_Z39percpu_pagelist_fraction_sysctl_handlerP9ctl_tableiPvPmPx");

   function sysctl_min_unmapped_ratio_sysctl_handler
     (arg1 : access linux_sysctl_h.ctl_table;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:917
   pragma Import (CPP, sysctl_min_unmapped_ratio_sysctl_handler, "_Z40sysctl_min_unmapped_ratio_sysctl_handlerP9ctl_tableiPvPmPx");

   function sysctl_min_slab_ratio_sysctl_handler
     (arg1 : access linux_sysctl_h.ctl_table;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:919
   pragma Import (CPP, sysctl_min_slab_ratio_sysctl_handler, "_Z36sysctl_min_slab_ratio_sysctl_handlerP9ctl_tableiPvPmPx");

   function numa_zonelist_order_handler
     (arg1 : access linux_sysctl_h.ctl_table;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:922
   pragma Import (CPP, numa_zonelist_order_handler, "_Z27numa_zonelist_order_handlerP9ctl_tableiPvPmPx");

   numa_zonelist_order : aliased Interfaces.C.char_array (size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:924
   pragma Import (C, numa_zonelist_order, "numa_zonelist_order");

   function first_online_pgdat return access pglist_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:939
   pragma Import (CPP, first_online_pgdat, "_Z18first_online_pgdatv");

   function next_online_pgdat (pgdat : access pglist_data) return access pglist_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:940
   pragma Import (CPP, next_online_pgdat, "_Z17next_online_pgdatP11pglist_data");

   function next_zone (the_zone : access zone) return access zone;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:941
   pragma Import (CPP, next_zone, "_Z9next_zoneP4zone");

  --*
  -- * for_each_online_pgdat - helper macro to iterate over all online nodes
  -- * @pgdat - pointer to a pg_data_t variable
  --  

  --*
  -- * for_each_zone - helper macro to iterate over all memory zones
  -- * @zone - pointer to struct zone variable
  -- *
  -- * The user only needs to declare the zone variable, for_each_zone
  -- * fills it in.
  --  

   function zonelist_zone (the_zoneref : access zoneref) return access zone;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:971
   pragma Import (CPP, zonelist_zone, "_ZL13zonelist_zoneP7zoneref");

   function zonelist_zone_idx (the_zoneref : access zoneref) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:976
   pragma Import (CPP, zonelist_zone_idx, "_ZL17zonelist_zone_idxP7zoneref");

   function zonelist_node_idx (the_zoneref : access zoneref) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:981
   pragma Import (CPP, zonelist_node_idx, "_ZL17zonelist_node_idxP7zoneref");

  -- zone_to_nid not available in this context  
  --*
  -- * next_zones_zonelist - Returns the next zone at or below highest_zoneidx within the allowed nodemask using a cursor within a zonelist as a starting point
  -- * @z - The cursor used as a starting point for the search
  -- * @highest_zoneidx - The zone index of the highest zone to return
  -- * @nodes - An optional nodemask to filter the zonelist with
  -- * @zone - The first suitable zone found is returned via this parameter
  -- *
  -- * This function returns the next zone at or below a given zone index that is
  -- * within the allowed nodemask using a cursor as the starting point for the
  -- * search. The zoneref returned is a cursor that represents the current zone
  -- * being examined. It should be advanced by one before calling
  -- * next_zones_zonelist again.
  --  

   function next_zones_zonelist
     (z : access zoneref;
      highest_zoneidx : zone_type;
      nodes : access linux_nodemask_h.nodemask_t;
      the_zone : System.Address) return access zoneref;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1004
   pragma Import (CPP, next_zones_zonelist, "_Z19next_zones_zonelistP7zoneref9zone_typeP10nodemask_tPP4zone");

  --*
  -- * first_zones_zonelist - Returns the first zone at or below highest_zoneidx within the allowed nodemask in a zonelist
  -- * @zonelist - The zonelist to search for a suitable zone
  -- * @highest_zoneidx - The zone index of the highest zone to return
  -- * @nodes - An optional nodemask to filter the zonelist with
  -- * @zone - The first suitable zone found is returned via this parameter
  -- *
  -- * This function returns the first zone at or below a given zone index that is
  -- * within the allowed nodemask. The zoneref returned is a cursor that can be
  -- * used to iterate the zonelist with next_zones_zonelist by advancing it by
  -- * one before calling.
  --  

   function first_zones_zonelist
     (the_zonelist : access zonelist;
      highest_zoneidx : zone_type;
      nodes : access linux_nodemask_h.nodemask_t;
      the_zone : System.Address) return access zoneref;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1021
   pragma Import (CPP, first_zones_zonelist, "_ZL20first_zones_zonelistP8zonelist9zone_typeP10nodemask_tPP4zone");

  --*
  -- * for_each_zone_zonelist_nodemask - helper macro to iterate over valid zones in a zonelist at or below a given zone index and within a nodemask
  -- * @zone - The current zone in the iterator
  -- * @z - The current pointer within zonelist->zones being iterated
  -- * @zlist - The zonelist being iterated
  -- * @highidx - The zone index of the highest zone to return
  -- * @nodemask - Nodemask allowed by the allocator
  -- *
  -- * This iterator iterates though all zones at or below a given zone index and
  -- * within a given nodemask
  --  

  --*
  -- * for_each_zone_zonelist - helper macro to iterate over valid zones in a zonelist at or below a given zone index
  -- * @zone - The current zone in the iterator
  -- * @z - The current pointer within zonelist->zones being iterated
  -- * @zlist - The zonelist being iterated
  -- * @highidx - The zone index of the highest zone to return
  -- *
  -- * This iterator iterates though all zones at or below a given zone index.
  --  

  -- * SECTION_SHIFT    		#bits space required to store a section #
  -- *
  -- * PA_SECTION_SHIFT		physical address to/from section number
  -- * PFN_SECTION_SHIFT		pfn to/from section number
  --  

   --  skipped empty struct page_cgroup

  --	 * This is, logically, a pointer to an array of struct
  --	 * pages.  However, it is stored with some other magic.
  --	 * (see sparse.c::sparse_init_one_section())
  --	 *
  --	 * Additionally during early boot we encode node id of
  --	 * the location of the section here to guide allocation.
  --	 * (see sparse.c::memory_present())
  --	 *
  --	 * Making it a UL at least makes someone do a cast
  --	 * before using it wrong.
  --	  

   type mem_section is record
      section_mem_map : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1118
      pageblock_flags : access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1121
      the_page_cgroup : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1127
      pad : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1128
   end record;
   pragma Convention (C_Pass_By_Copy, mem_section);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1105

  -- See declaration of similar field in struct zone  
  --	 * If !SPARSEMEM, pgdat doesn't have page_cgroup pointer. We use
  --	 * section. (see memcontrol.h/page_cgroup.h about this.)
  --	  

  --	 * WARNING: mem_section must be a power-of-2 in size for the
  --	 * calculation and use of SECTION_ROOT_MASK to make sense.
  --	  

   mem_section : aliased array (0 .. 4095) of access mem_section;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1147
   pragma Import (C, mem_section, "mem_section");

   --  skipped func __nr_to_section

   --  skipped func __section_nr

   function usemap_size return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1159
   pragma Import (CPP, usemap_size, "_Z11usemap_sizev");

  -- * We use the lower bits of the mem_map pointer to store
  -- * a little bit of information.  There should be at least
  -- * 3 bits here due to 32-bit alignment.
  --  

   --  skipped func __section_mem_map_addr

   function present_section (section : access mem_section) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1179
   pragma Import (CPP, present_section, "_ZL15present_sectionP11mem_section");

   function present_section_nr (nr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1184
   pragma Import (CPP, present_section_nr, "_ZL18present_section_nrm");

   function valid_section (section : access mem_section) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1189
   pragma Import (CPP, valid_section, "_ZL13valid_sectionP11mem_section");

   function valid_section_nr (nr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1194
   pragma Import (CPP, valid_section_nr, "_ZL16valid_section_nrm");

   --  skipped func __pfn_to_section

   function pfn_valid (pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1205
   pragma Import (CPP, pfn_valid, "_ZL9pfn_validm");

   function pfn_present (pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1213
   pragma Import (CPP, pfn_present, "_ZL11pfn_presentm");

  -- * These are _only_ used during initialisation, therefore they
  -- * can use __initdata ...  They could have names to indicate
  -- * this restriction.
  --  

   procedure sparse_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1236
   pragma Import (CPP, sparse_init, "_Z11sparse_initv");

   function early_pfn_in_nid (pfn : unsigned_long; nid : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1243
   pragma Import (CPP, early_pfn_in_nid, "_Z16early_pfn_in_nidmi");

   procedure memory_present
     (nid : int;
      start : unsigned_long;
      c_end : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1252
   pragma Import (CPP, memory_present, "_Z14memory_presentimm");

   function node_memmap_size_bytes
     (arg1 : int;
      arg2 : unsigned_long;
      arg3 : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1253
   pragma Import (CPP, node_memmap_size_bytes, "_Z22node_memmap_size_bytesimm");

  -- * If it is possible to have holes within a MAX_ORDER_NR_PAGES, then we
  -- * need to check pfn validility within that MAX_ORDER_NR_PAGES block.
  -- * pfn_valid_within() should be used in this case; we optimise this away
  -- * when we have no holes within a MAX_ORDER_NR_PAGES block.
  --  

  -- * pfn_valid() is meant to be able to tell if a given PFN has valid memmap
  -- * associated with it or not. In FLATMEM, it is expected that holes always
  -- * have valid memmap as long as there is valid PFNs either side of the hole.
  -- * In SPARSEMEM, it is assumed that a valid section has a memmap for the
  -- * entire section.
  -- *
  -- * However, an ARM, and maybe other embedded architectures in the future
  -- * free memmap backing holes to save memory on the assumption the memmap is
  -- * never used. The page_zone linkages are then broken even though pfn_valid()
  -- * returns true. A walker of the full memmap must then do this additional
  -- * check to ensure the memmap they are looking at is sane by making sure
  -- * the zone and PFN linkages are still valid. This is expensive, but walkers
  -- * of the full memmap are extremely rare.
  --  

   function memmap_valid_within
     (pfn : unsigned_long;
      the_page : access linux_mm_types_h.page;
      the_zone : access zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmzone.h:1286
   pragma Import (CPP, memmap_valid_within, "_ZL19memmap_valid_withinmP4pageP4zone");

end linux_mmzone_h;

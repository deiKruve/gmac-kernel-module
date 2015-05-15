pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_mmzone_h;
limited with linux_mm_types_h;
with Interfaces.C.Extensions;
with asm_generic_int_ll64_h;
with System;

package linux_memory_hotplug_h is

   --  arg-macro: procedure arch_alloc_nodedata generic_alloc_nodedata(nid)
   --    generic_alloc_nodedata(nid)
   --  arg-macro: procedure arch_free_nodedata generic_free_nodedata(pgdat)
   --    generic_free_nodedata(pgdat)
   --  arg-macro: function generic_alloc_nodedata ({ kzalloc(sizeof(pg_data_t), GFP_KERNEL); }
   --    return { kzalloc(sizeof(pg_data_t), GFP_KERNEL); };
   --  arg-macro: procedure generic_free_nodedata kfree(pgdat)
   --    kfree(pgdat)
   --  skipped empty struct memory_block

  -- * Types for free bootmem stored in page->lru.next. These have to be in
  -- * some random range in unsigned long space for debugging purposes.
  --  

  -- Types for control the zone type of onlined memory  
  -- * pgdat resizing functions
  --  

   procedure pgdat_resize_lock (pgdat : access linux_mmzone_h.pglist_data; flags : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:40
   pragma Import (CPP, pgdat_resize_lock, "_ZL17pgdat_resize_lockP11pglist_dataPm");

   procedure pgdat_resize_unlock (pgdat : access linux_mmzone_h.pglist_data; flags : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:45
   pragma Import (CPP, pgdat_resize_unlock, "_ZL19pgdat_resize_unlockP11pglist_dataPm");

   procedure pgdat_resize_init (pgdat : access linux_mmzone_h.pglist_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:50
   pragma Import (CPP, pgdat_resize_init, "_ZL17pgdat_resize_initP11pglist_data");

  -- * Zone resizing functions
  -- *
  -- * Note: any attempt to resize a zone should has pgdat_resize_lock()
  -- * zone_span_writelock() both held. This ensure the size of a zone
  -- * can't be changed while pgdat_resize_lock() held.
  --  

   function zone_span_seqbegin (the_zone : access linux_mmzone_h.zone) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:61
   pragma Import (CPP, zone_span_seqbegin, "_ZL18zone_span_seqbeginP4zone");

   function zone_span_seqretry (the_zone : access linux_mmzone_h.zone; iv : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:65
   pragma Import (CPP, zone_span_seqretry, "_ZL18zone_span_seqretryP4zonej");

   procedure zone_span_writelock (the_zone : access linux_mmzone_h.zone);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:69
   pragma Import (CPP, zone_span_writelock, "_ZL19zone_span_writelockP4zone");

   procedure zone_span_writeunlock (the_zone : access linux_mmzone_h.zone);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:73
   pragma Import (CPP, zone_span_writeunlock, "_ZL21zone_span_writeunlockP4zone");

   procedure zone_seqlock_init (the_zone : access linux_mmzone_h.zone);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:77
   pragma Import (CPP, zone_seqlock_init, "_ZL17zone_seqlock_initP4zone");

   function zone_grow_free_lists (the_zone : access linux_mmzone_h.zone; new_nr_pages : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:81
   pragma Import (CPP, zone_grow_free_lists, "_Z20zone_grow_free_listsP4zonem");

   function zone_grow_waitqueues (the_zone : access linux_mmzone_h.zone; nr_pages : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:82
   pragma Import (CPP, zone_grow_waitqueues, "_Z20zone_grow_waitqueuesP4zonem");

   function add_one_highpage
     (the_page : access linux_mm_types_h.page;
      pfn : int;
      bad_ppro : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:83
   pragma Import (CPP, add_one_highpage, "_Z16add_one_highpageP4pageii");

  -- VM interface that may be used by firmware interface  
   function online_pages
     (arg1 : unsigned_long;
      arg2 : unsigned_long;
      arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:85
   pragma Import (CPP, online_pages, "_Z12online_pagesmmi");

   --  skipped func __offline_isolated_pages

   type online_page_callback_t is access procedure (arg1 : access linux_mm_types_h.page);
   pragma Convention (C, online_page_callback_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:88

   function set_online_page_callback (callback : online_page_callback_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:90
   pragma Import (CPP, set_online_page_callback, "_Z24set_online_page_callbackPFvP4pageE");

   function restore_online_page_callback (callback : online_page_callback_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:91
   pragma Import (CPP, restore_online_page_callback, "_Z28restore_online_page_callbackPFvP4pageE");

   --  skipped func __online_page_set_limits

   --  skipped func __online_page_increment_counters

   --  skipped func __online_page_free

   function try_online_node (nid : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:97
   pragma Import (CPP, try_online_node, "_Z15try_online_nodei");

   function is_pageblock_removable_nolock (the_page : access linux_mm_types_h.page) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:100
   pragma Import (CPP, is_pageblock_removable_nolock, "_Z29is_pageblock_removable_nolockP4page");

   function arch_remove_memory (start : asm_generic_int_ll64_h.u64; size : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:101
   pragma Import (CPP, arch_remove_memory, "_Z18arch_remove_memoryyy");

   --  skipped func __remove_pages

  -- reasonably generic interface to expand the physical pages in a zone   
   --  skipped func __add_pages

   function memory_add_physaddr_to_nid (start : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:111
   pragma Import (CPP, memory_add_physaddr_to_nid, "_Z26memory_add_physaddr_to_nidy");

  -- * For supporting node-hotadd, we have to allocate a new pgdat.
  -- *
  -- * If an arch has generic style NODE_DATA(),
  -- * node_data[nid] = kzalloc() works well. But it depends on the architecture.
  -- *
  -- * In general, generic_alloc_nodedata() is used.
  -- * Now, arch_free_nodedata() is just defined for error path of node_hot_add.
  -- *
  --  

  -- * If ARCH_HAS_NODEDATA_EXTENSION=n, this func is used to allocate pgdat.
  -- * XXX: kmalloc_node() can't work well to get new node's memory at this time.
  -- *	Because, pgdat for the new node is not allocated/initialized yet itself.
  -- *	To use new node's memory, more consideration will be necessary.
  --  

  -- * This definition is just for error path in node hotadd.
  -- * For node hotremove, we have to replace this.
  --  

   procedure arch_refresh_nodedata (nid : int; pgdat : access linux_mmzone_h.pg_data_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:157
   pragma Import (CPP, arch_refresh_nodedata, "_ZL21arch_refresh_nodedataiP11pglist_data");

  -- never called  
   procedure register_page_bootmem_info_node (pgdat : access linux_mmzone_h.pglist_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:180
   pragma Import (CPP, register_page_bootmem_info_node, "_Z31register_page_bootmem_info_nodeP11pglist_data");

   procedure put_page_bootmem (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:186
   pragma Import (CPP, put_page_bootmem, "_Z16put_page_bootmemP4page");

   procedure get_page_bootmem
     (ingo : unsigned_long;
      the_page : access linux_mm_types_h.page;
      c_type : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:187
   pragma Import (CPP, get_page_bootmem, "_Z16get_page_bootmemmP4pagem");

   procedure get_online_mems;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:190
   pragma Import (CPP, get_online_mems, "_Z15get_online_memsv");

   procedure put_online_mems;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:191
   pragma Import (CPP, put_online_mems, "_Z15put_online_memsv");

  -- * Stub functions for when hotplug is off
  --  

   function is_mem_section_removable (pfn : unsigned_long; nr_pages : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:236
   pragma Import (CPP, is_mem_section_removable, "_Z24is_mem_section_removablemm");

   procedure try_offline_node (nid : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:237
   pragma Import (CPP, try_offline_node, "_Z16try_offline_nodei");

   function walk_memory_range
     (start_pfn : unsigned_long;
      end_pfn : unsigned_long;
      arg : System.Address;
      func : access function (arg1 : System.Address; arg2 : System.Address) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:258
   pragma Import (CPP, walk_memory_range, "_Z17walk_memory_rangemmPvPFiP12memory_blockS_E");

   function add_memory
     (nid : int;
      start : asm_generic_int_ll64_h.u64;
      size : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:260
   pragma Import (CPP, add_memory, "_Z10add_memoryiyy");

   function arch_add_memory
     (nid : int;
      start : asm_generic_int_ll64_h.u64;
      size : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:261
   pragma Import (CPP, arch_add_memory, "_Z15arch_add_memoryiyy");

   function offline_pages (start_pfn : unsigned_long; nr_pages : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:262
   pragma Import (CPP, offline_pages, "_Z13offline_pagesmm");

   function is_memblock_offlined (mem : System.Address) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:263
   pragma Import (CPP, is_memblock_offlined, "_Z20is_memblock_offlinedP12memory_block");

   procedure remove_memory
     (nid : int;
      start : asm_generic_int_ll64_h.u64;
      size : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:264
   pragma Import (CPP, remove_memory, "_Z13remove_memoryiyy");

   function sparse_add_one_section (the_zone : access linux_mmzone_h.zone; start_pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:265
   pragma Import (CPP, sparse_add_one_section, "_Z22sparse_add_one_sectionP4zonem");

   procedure sparse_remove_one_section (the_zone : access linux_mmzone_h.zone; ms : access linux_mmzone_h.mem_section);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:266
   pragma Import (CPP, sparse_remove_one_section, "_Z25sparse_remove_one_sectionP4zoneP11mem_section");

   function sparse_decode_mem_map (coded_mem_map : unsigned_long; pnum : unsigned_long) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/memory_hotplug.h:267
   pragma Import (CPP, sparse_decode_mem_map, "_Z21sparse_decode_mem_mapmm");

end linux_memory_hotplug_h;

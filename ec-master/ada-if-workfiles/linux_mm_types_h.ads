pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_fs_h;
with System;
with Interfaces.C.Extensions;
with linux_types_h;
with asm_pgtable_types_h;
with linux_spinlock_types_h;
limited with linux_slab_def_h;
with uapi_asm_generic_int_ll64_h;
with linux_rbtree_h;
limited with linux_mm_h;
limited with linux_sched_h;
with linux_completion_h;
with asm_generic_atomic_long_h;
with asm_generic_int_ll64_h;
with linux_rwsem_h;
with linux_cpumask_h;
with asm_mmu_h;
with linux_uprobes_h;
with Interfaces.C.Strings;

package linux_mm_types_h is

   --  unsupported macro: AT_VECTOR_SIZE (2*(AT_VECTOR_SIZE_ARCH + AT_VECTOR_SIZE_BASE + 1))
   --  unsupported macro: USE_SPLIT_PTE_PTLOCKS (NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
   --  unsupported macro: USE_SPLIT_PMD_PTLOCKS (USE_SPLIT_PTE_PTLOCKS && IS_ENABLED(CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK))
   --  unsupported macro: ALLOC_SPLIT_PTLOCKS (SPINLOCK_SIZE > BITS_PER_LONG/8)
  -- * Each physical page in the system has a struct page associated with
  -- * it to keep track of whatever it is we are using the page for at the
  -- * moment. Note that we have no way to track which tasks are using
  -- * a page, though if it is a pagecache page, rmap structures can tell us
  -- * who is mapping it.
  -- *
  -- * The objects in struct page are organized in double word blocks in
  -- * order to allows us to use atomic double word operations on portions
  -- * of struct page. That is currently only used by slub but the arrangement
  -- * allows the use of atomic double word operations on the flags/mapping
  -- * and lru list pointers also.
  --  

  -- First double word block  
  -- Atomic flags, some possibly
  --					 * updated asynchronously  

  -- If low bit clear, points to
  --						 * inode address_space, or NULL.
  --						 * If page mapped as anonymous
  --						 * memory, low bit is set, and
  --						 * it points to anon_vma object:
  --						 * see PAGE_MAPPING_ANON below.
  --						  

  -- slab first object  
  -- Second double word  
  -- Our offset within mapping.  
  -- sl[aou]b first free object  
  -- If set by the page allocator,
  --						 * ALLOC_NO_WATERMARKS was set
  --						 * and the low watermark was not
  --						 * met implying that the system
  --						 * is under some pressure. The
  --						 * caller should try ensure
  --						 * this page is only used to
  --						 * free other pages.
  --						  

  -- Used for cmpxchg_double in slub  
  --			 * Keep _count separate from slub cmpxchg_double data.
  --			 * As the rest of the double word is protected by
  --			 * slab_lock but _count is not.
  --			  

  --					 * Count of ptes mapped in
  --					 * mms, to show when page is
  --					 * mapped & limit reverse map
  --					 * searches.
  --					 *
  --					 * Used also for tail pages
  --					 * refcounting instead of
  --					 * _count. Tail pages cannot
  --					 * be mapped and keeping the
  --					 * tail page _count zero at
  --					 * all times guarantees
  --					 * get_page_unless_zero() will
  --					 * never succeed on tail
  --					 * pages.
  --					  

  -- SLUB  
  -- SLOB  
  -- Usage count, see below.  
  -- SLAB  
  -- Third double word block  
  -- Pageout list, eg. active_list
  --					 * protected by zone->lru_lock !
  --					 * Can be used as a generic list
  --					 * by the page owner.
  --					  

  -- slub per cpu partial pages  
  -- Next partial slab  
  -- Nr of partial slabs left  
  -- Approximate # of objects  
  -- slab fields  
   --  skipped empty struct slab

   type anon_153 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            mapping : access linux_fs_h.address_space;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:49
         when others =>
            s_mem : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:56
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_153);
   pragma Unchecked_Union (anon_153);
   type anon_155 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            index : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:62
         when 1 =>
            freelist : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:63
         when others =>
            pfmemalloc : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:64
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_155);
   pragma Unchecked_Union (anon_155);
   type anon_156;
   type anon_158;
   type anon_159 is record
      inuse : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:111
      objects : Extensions.Unsigned_15;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:112
      frozen : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:113
   end record;
   pragma Convention (C_Pass_By_Copy, anon_159);
   type anon_158 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            u_mapcount : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:108
            field_2 : aliased anon_159;
         when others =>
            units : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:115
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_158);
   pragma Unchecked_Union (anon_158);
   type anon_157 is record
      parent : aliased anon_158;
      u_count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:117
   end record;
   pragma Convention (C_Pass_By_Copy, anon_157);
   type anon_156 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            counters : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:86
            field_2 : aliased anon_157;
         when others =>
            active : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:119
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_156);
   pragma Unchecked_Union (anon_156);
   type anon_154 is record
      parent : aliased anon_155;
      field_2 : aliased anon_156;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_154);
   type anon_160;
   type anon_161 is record
      next : access page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:131
      pages : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:133
      pobjects : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:134
   end record;
   pragma Convention (C_Pass_By_Copy, anon_161);
   type anon_160 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            lru : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:125
            field_2 : aliased anon_161;
         when 2 =>
            slab_page : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:141
         when 3 =>
            the_callback_head : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:142
         when others =>
            pmd_huge_pte : asm_pgtable_types_h.pgtable_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:146
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_160);
   pragma Unchecked_Union (anon_160);
   type anon_162 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ptl : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:163
         when 1 =>
            slab_cache : access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:166
         when others =>
            first_page : access page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:167
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_162);
   pragma Unchecked_Union (anon_162);
   type page is record
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:46
      field_2 : aliased anon_153;
      field_3 : aliased anon_154;
      field_4 : aliased anon_160;
      field_5 : aliased anon_162;
   end record;
   pragma Convention (C_Pass_By_Copy, page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:44

  -- Used by SLAB
  --						 * when destroying via RCU
  --						  

  -- protected by page->ptl  
  -- Remainder is not double word aligned  
  -- Mapping-private opaque data:
  --					 	 * usually used for buffer_heads
  --						 * if PagePrivate set; used for
  --						 * swp_entry_t if PageSwapCache;
  --						 * indicates order in the buddy
  --						 * system if PG_buddy is set.
  --						  

  -- SL[AU]B: Pointer to slab  
  -- Compound tail pages  
  --	 * On machines where all RAM is mapped into kernel address space,
  --	 * we can simply calculate the virtual address. On machines with
  --	 * highmem some memory is mapped into kernel virtual memory
  --	 * dynamically, so we need a place to store that address.
  --	 * Note that this field could be 16 bits on x86 ... ;)
  --	 *
  --	 * Architectures with slow multiplication can define
  --	 * WANT_PAGE_VIRTUAL in asm/page.h
  --	  

  -- Kernel virtual address (NULL if
  --					   not kmapped, ie. highmem)  

  -- Use atomic bitops on this  
  --	 * kmemcheck wants to track the status of each byte in a page; this
  --	 * is a pointer to such a status block. NULL if not tracked.
  --	  

  -- * The struct page can be forced to be double word aligned so that atomic ops
  -- * on double words work. The SLUB allocator can make use of such a feature.
  --  

   type page_frag is record
      the_page : access page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:210
      offset : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:212
      size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:213
   end record;
   pragma Convention (C_Pass_By_Copy, page_frag);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:209

   subtype vm_flags_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:220

  -- * A region containing a mapping of a non-memory backed file under NOMMU
  -- * conditions.  These are held in a global tree and are pinned by the VMAs that
  -- * map parts of them.
  --  

  -- link in global region tree  
   type vm_region is record
      vm_rb : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:228
      vm_flags : aliased vm_flags_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:229
      vm_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:230
      vm_end : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:231
      vm_top : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:232
      vm_pgoff : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:233
      vm_file : access linux_fs_h.file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:234
      vm_prfile : access linux_fs_h.file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:235
      vm_usage : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:237
      vm_icache_flushed : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:238
   end record;
   pragma Convention (C_Pass_By_Copy, vm_region);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:227

  -- VMA vm_flags  
  -- start address of region  
  -- region initialised to here  
  -- region allocated to here  
  -- the offset in vm_file corresponding to vm_start  
  -- the backing file or NULL  
  -- the virtual backing file or NULL  
  -- region usage count (access under nommu_region_sem)  
  -- true if the icache has been flushed for
  --						* this region  

  -- * This struct defines a memory VMM memory area. There is one of these
  -- * per VM-area/task.  A VM area is any part of the process virtual memory
  -- * space that has a special rule for the page-fault handlers (ie a shared
  -- * library, the executable area etc).
  --  

  -- The first cache line has the info for VMA tree walking.  
  -- Our start address within vm_mm.  
   type mm_struct;
   type anon_163;
   type anon_164 is record
      rb : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:281
      rb_subtree_last : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:282
   end record;
   pragma Convention (C_Pass_By_Copy, anon_164);
   type anon_163 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            linear : aliased anon_164;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:283
         when others =>
            nonlinear : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:284
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_163);
   pragma Unchecked_Union (anon_163);
   type vm_area_struct is record
      vm_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:251
      vm_end : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:252
      vm_next : access vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:256
      vm_prev : access vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:256
      vm_rb : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:258
      rb_subtree_gap : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:266
      vm_mm : access mm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:270
      vm_page_prot : aliased asm_pgtable_types_h.pgprot_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:271
      vm_flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:272
      shared : anon_163;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:285
      anon_vma_chain : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:293
      the_anon_vma : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:295
      vm_ops : access constant linux_mm_h.vm_operations_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:298
      vm_pgoff : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:301
      vm_file : access linux_fs_h.file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:303
      vm_prfile : access linux_fs_h.file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:304
      vm_private_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:305
      vm_policy : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:311
   end record;
   pragma Convention (C_Pass_By_Copy, vm_area_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:248

  -- The first byte after our end address
  --					   within vm_mm.  

  -- linked list of VM areas per task, sorted by address  
  --	 * Largest free memory gap in bytes to the left of this VMA.
  --	 * Either between this VMA and vma->vm_prev, or between one of the
  --	 * VMAs below us in the VMA rbtree and its ->vm_prev. This helps
  --	 * get_unmapped_area find a free area of the right size.
  --	  

  -- Second cache line starts here.  
  -- The address space we belong to.  
  -- Access permissions of this VMA.  
  -- Flags, see mm.h.  
  --	 * For areas with an address space and backing store,
  --	 * linkage into the address_space->i_mmap interval tree, or
  --	 * linkage of vma in the address_space->i_mmap_nonlinear list.
  --	  

  --	 * A file's MAP_PRIVATE vma can be in both i_mmap tree and anon_vma
  --	 * list, after a COW of one of the file pages.	A MAP_SHARED vma
  --	 * can only be in the i_mmap tree.  An anonymous MAP_PRIVATE, stack
  --	 * or brk vma (with NULL file) can only be in an anon_vma list.
  --	  

  -- Serialized by mmap_sem &
  --					  * page_table_lock  

  -- Serialized by page_table_lock  
   --  skipped empty struct anon_vma

  -- Function pointers to deal with this struct.  
  -- Information about our backing store:  
  -- Offset (within vm_file) in PAGE_SIZE
  --					   units, *not* PAGE_CACHE_SIZE  

  -- File we map to (can be NULL).  
  -- shadow of vm_file  
  -- was vm_pte (shared mem)  
  -- NOMMU mapping region  
  -- NUMA policy for the VMA  
   --  skipped empty struct mempolicy

   type core_thread is record
      c_task : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:316
      next : access core_thread;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:317
   end record;
   pragma Convention (C_Pass_By_Copy, core_thread);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:315

   type core_state is record
      nr_threads : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:321
      dumper : aliased core_thread;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:322
      startup : aliased linux_completion_h.completion;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:323
   end record;
   pragma Convention (C_Pass_By_Copy, core_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:320

  -- per-thread cached information,  
  -- for synchronization threshold  
   type task_rss_stat_count_array is array (0 .. 2) of aliased int;
   type task_rss_stat is record
      events : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:337
      count : aliased task_rss_stat_count_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:338
   end record;
   pragma Convention (C_Pass_By_Copy, task_rss_stat);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:336

   type mm_rss_stat_count_array is array (0 .. 2) of aliased asm_generic_atomic_long_h.atomic_long_t;
   type mm_rss_stat is record
      count : aliased mm_rss_stat_count_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:343
   end record;
   pragma Convention (C_Pass_By_Copy, mm_rss_stat);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:342

   --  skipped empty struct kioctx_table

  -- list of VMAs  
   type mm_struct is record
      mmap : access vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:348
      mm_rb : aliased linux_rbtree_h.rb_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:349
      vmacache_seqnum : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:350
      get_unmapped_area : access function
           (arg1 : access linux_fs_h.file;
            arg2 : unsigned_long;
            arg3 : unsigned_long;
            arg4 : unsigned_long;
            arg5 : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:354
      mmap_base : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:356
      mmap_legacy_base : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:357
      task_size : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:358
      highest_vm_end : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:359
      pgd : access asm_pgtable_types_h.pgd_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:360
      mm_users : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:361
      mm_count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:362
      nr_ptes : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:363
      map_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:364
      page_table_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:366
      mmap_sem : aliased linux_rwsem_h.rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:367
      mmlist : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:369
      hiwater_rss : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:375
      hiwater_vm : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:376
      total_vm : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:378
      locked_vm : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:379
      pinned_vm : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:380
      shared_vm : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:381
      exec_vm : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:382
      stack_vm : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:383
      def_flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:384
      start_code : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:385
      end_code : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:385
      start_data : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:385
      end_data : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:385
      start_brk : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:386
      brk : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:386
      start_stack : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:386
      arg_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:387
      arg_end : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:387
      env_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:387
      env_end : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:387
      saved_auxv : aliased mm_struct_saved_auxv_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:389
      rss_stat : aliased mm_rss_stat;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:395
      binfmt : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:397
      cpu_vm_mask_var : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:399
      context : aliased asm_mmu_h.mm_context_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:402
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:404
      the_core_state : access core_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:406
      ioctx_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:408
      ioctx_table : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:409
      owner : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:422
      exe_file : access linux_fs_h.file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:426
      the_mmu_notifier_mm : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:428
      numa_next_scan : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:442
      numa_scan_offset : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:445
      numa_scan_seq : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:448
      tlb_flush_pending : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:456
      the_uprobes_state : aliased linux_uprobes_h.uprobes_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:458
   end record;
   pragma Convention (C_Pass_By_Copy, mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:347

  -- per-thread vmacache  
  -- base of mmap area  
  -- base of mmap area in bottom-up allocations  
  -- size of task vm space  
  -- highest vma end address  
  -- How many users with user space?  
  -- How many references to "struct mm_struct" (users count as 1)  
  -- Page table pages  
  -- number of VMAs  
  -- Protects page tables and some counters  
  -- List of maybe swapped mm's.	These are globally strung
  --						 * together off init_mm.mmlist, and are protected
  --						 * by mmlist_lock
  --						  

  -- High-watermark of RSS usage  
  -- High-water virtual memory usage  
  -- Total pages mapped  
  -- Pages that have PG_mlocked set  
  -- Refcount permanently increased  
  -- Shared pages (files)  
  -- VM_EXEC & ~VM_WRITE  
  -- VM_GROWSUP/DOWN  
  -- for /proc/PID/auxv  
  --	 * Special counters, in some configurations protected by the
  --	 * page_table_lock, in other configurations by being atomic.
  --	  

   --  skipped empty struct linux_binfmt

  -- Architecture-specific MM context  
  -- Must use atomic bitops to access the bits  
  -- coredumping support  
  --	 * "owner" points to a task that is regarded as the canonical
  --	 * user/owner of this mm. All of the following must be true in
  --	 * order for it to be changed:
  --	 *
  --	 * current == mm->owner
  --	 * current->mm != mm
  --	 * new_owner->mm == mm
  --	 * new_owner->alloc_lock is held
  --	  

  -- store ref to file /proc/<pid>/exe symlink points to  
   --  skipped empty struct mmu_notifier_mm

  -- protected by page_table_lock  
  --	 * numa_next_scan is the next time that the PTEs will be marked
  --	 * pte_numa. NUMA hinting faults will gather statistics and migrate
  --	 * pages to new nodes if necessary.
  --	  

  -- Restart point for scanning and setting pte_numa  
  -- numa_scan_seq prevents two threads setting pte_numa  
  --	 * An operation with batched TLB flushing is going on. Anything that
  --	 * can move process memory needs to flush the TLB when moving a
  --	 * PROT_NONE or PROT_NUMA mapped page.
  --	  

   procedure mm_init_cpumask (mm : access mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:461
   pragma Import (CPP, mm_init_cpumask, "_ZL15mm_init_cpumaskP9mm_struct");

  -- Future-safe accessor for struct mm_struct's cpu_vm_mask.  
   function mm_cpumask (mm : access mm_struct) return access linux_cpumask_h.cpumask_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:469
   pragma Import (CPP, mm_cpumask, "_ZL10mm_cpumaskP9mm_struct");

  -- * Memory barriers to keep this state in sync are graciously provided by
  -- * the page table locks, outside of which no page table modifications happen.
  -- * The barriers below prevent the compiler from re-ordering the instructions
  -- * around the memory barriers that are already present in the code.
  --  

   function mm_tlb_flush_pending (mm : access mm_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:481
   pragma Import (CPP, mm_tlb_flush_pending, "_ZL20mm_tlb_flush_pendingP9mm_struct");

   procedure set_tlb_flush_pending (mm : access mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:486
   pragma Import (CPP, set_tlb_flush_pending, "_ZL21set_tlb_flush_pendingP9mm_struct");

  --	 * Guarantee that the tlb_flush_pending store does not leak into the
  --	 * critical section updating the page tables
  --	  

  -- Clearing is done after a TLB flush, which also provides a barrier.  
   procedure clear_tlb_flush_pending (mm : access mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:497
   pragma Import (CPP, clear_tlb_flush_pending, "_ZL23clear_tlb_flush_pendingP9mm_struct");

   type vm_special_mapping is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:517
      pages : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:518
   end record;
   pragma Convention (C_Pass_By_Copy, vm_special_mapping);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm_types.h:515

end linux_mm_types_h;

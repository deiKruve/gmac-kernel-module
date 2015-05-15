pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with linux_types_h;
with System;
limited with linux_slab_def_h;
with Interfaces.C.Extensions;
limited with linux_seq_file_h;

package linux_slab_h is

   --  unsupported macro: SLAB_DEBUG_FREE 0x00000100UL
   --  unsupported macro: SLAB_RED_ZONE 0x00000400UL
   --  unsupported macro: SLAB_POISON 0x00000800UL
   --  unsupported macro: SLAB_HWCACHE_ALIGN 0x00002000UL
   --  unsupported macro: SLAB_CACHE_DMA 0x00004000UL
   --  unsupported macro: SLAB_STORE_USER 0x00010000UL
   --  unsupported macro: SLAB_PANIC 0x00040000UL
   --  unsupported macro: SLAB_DESTROY_BY_RCU 0x00080000UL
   --  unsupported macro: SLAB_MEM_SPREAD 0x00100000UL
   --  unsupported macro: SLAB_TRACE 0x00200000UL
   --  unsupported macro: SLAB_DEBUG_OBJECTS 0x00000000UL
   --  unsupported macro: SLAB_NOLEAKTRACE 0x00800000UL
   --  unsupported macro: SLAB_NOTRACK 0x00000000UL
   --  unsupported macro: SLAB_FAILSLAB 0x00000000UL
   --  unsupported macro: SLAB_RECLAIM_ACCOUNT 0x00020000UL
   --  unsupported macro: SLAB_TEMPORARY SLAB_RECLAIM_ACCOUNT
   --  unsupported macro: ZERO_SIZE_PTR ((void *)16)
   --  arg-macro: function ZERO_OR_NULL_PTR ((unsigned long)(x) <= (unsigned long)ZERO_SIZE_PTR
   --    return (unsigned long)(x) <= (unsigned long)ZERO_SIZE_PTR;
   --  unsupported macro: KMEM_CACHE(__struct,__flags) kmem_cache_create(#__struct, sizeof(struct __struct), __alignof__(struct __struct), (__flags), NULL)
   --  unsupported macro: ARCH_KMALLOC_MINALIGN __alignof__(unsigned long long)
   --  unsupported macro: KMALLOC_SHIFT_HIGH ((MAX_ORDER + PAGE_SHIFT - 1) <= 25 ? (MAX_ORDER + PAGE_SHIFT - 1) : 25)
   --  unsupported macro: KMALLOC_SHIFT_MAX KMALLOC_SHIFT_HIGH
   --  unsupported macro: KMALLOC_SHIFT_LOW 5
   --  unsupported macro: KMALLOC_MAX_SIZE (1UL << KMALLOC_SHIFT_MAX)
   --  unsupported macro: KMALLOC_MAX_CACHE_SIZE (1UL << KMALLOC_SHIFT_HIGH)
   --  unsupported macro: KMALLOC_MAX_ORDER (KMALLOC_SHIFT_MAX - PAGE_SHIFT)
   --  unsupported macro: KMALLOC_MIN_SIZE (1 << KMALLOC_SHIFT_LOW)
   --  unsupported macro: SLAB_OBJ_MIN_SIZE (KMALLOC_MIN_SIZE < 16 ? (KMALLOC_MIN_SIZE) : 16)
   --  unsupported macro: ARCH_SLAB_MINALIGN __alignof__(unsigned long long)
   --  arg-macro: procedure kmalloc_track_caller __kmalloc_track_caller(size, flags, _RET_IP_)
   --    __kmalloc_track_caller(size, flags, _RET_IP_)
   --  arg-macro: procedure kmalloc_node_track_caller __kmalloc_node_track_caller(size, flags, node, _RET_IP_)
   --    __kmalloc_node_track_caller(size, flags, node, _RET_IP_)
  -- * Written by Mark Hemment, 1996 (markhe@nextd.demon.co.uk).
  -- *
  -- * (C) SGI 2006, Christoph Lameter
  -- * 	Cleaned up and restructured to ease the addition of alternative
  -- * 	implementations of SLAB allocators.
  -- * (C) Linux Foundation 2008-2013
  -- *      Unified interface for all slab allocators
  --  

  -- * Flags to pass to kmem_cache_create().
  -- * The ones marked DEBUG are only valid if CONFIG_SLAB_DEBUG is set.
  --  

  -- * SLAB_DESTROY_BY_RCU - **WARNING** READ THIS!
  -- *
  -- * This delays freeing the SLAB page by a grace period, it does _NOT_
  -- * delay object freeing. This means that if you do kmem_cache_free()
  -- * that memory location is free to be reused at any time. Thus it may
  -- * be possible to see another object there in the same RCU grace period.
  -- *
  -- * This feature only ensures the memory location backing the object
  -- * stays valid, the trick to using this is relying on an independent
  -- * object validation pass. Something like:
  -- *
  -- *  rcu_read_lock()
  -- * again:
  -- *  obj = lockless_lookup(key);
  -- *  if (obj) {
  -- *    if (!try_get_ref(obj)) // might fail for free objects
  -- *      goto again;
  -- *
  -- *    if (obj->key != key) { // not the object we expected
  -- *      put_ref(obj);
  -- *      goto again;
  -- *    }
  -- *  }
  -- *  rcu_read_unlock();
  -- *
  -- * This is useful if we need to approach a kernel structure obliquely,
  -- * from its address obtained without the usual locking. We can lock
  -- * the structure to stabilize it and check it's still at the given address,
  -- * only if we can be sure that the memory has not been meanwhile reused
  -- * for some other kind of object (which our subsystem's lock might corrupt).
  -- *
  -- * rcu_read_lock before reading the address, then rcu_read_unlock after
  -- * taking the spinlock within the structure expected at that address.
  --  

  -- Flag to prevent checks on free  
  -- Don't track use of uninitialized memory  
  -- The following flags affect the page allocator grouping pages by mobility  
  -- * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
  -- *
  -- * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
  -- *
  -- * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
  -- * Both make kfree a no-op.
  --  

  -- * struct kmem_cache related prototypes
  --  

   procedure kmem_cache_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:112
   pragma Import (CPP, kmem_cache_init, "_Z15kmem_cache_initv");

   function slab_is_available return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:113
   pragma Import (CPP, slab_is_available, "_Z17slab_is_availablev");

   function kmem_cache_create
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : linux_types_h.size_t;
      arg3 : linux_types_h.size_t;
      arg4 : unsigned_long;
      arg5 : access procedure (arg1 : System.Address)) return access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:115
   pragma Import (CPP, kmem_cache_create, "_Z17kmem_cache_createPKcmmmPFvPvE");

   procedure kmem_cache_destroy (arg1 : access linux_slab_def_h.kmem_cache);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:123
   pragma Import (CPP, kmem_cache_destroy, "_Z18kmem_cache_destroyP10kmem_cache");

   function kmem_cache_shrink (arg1 : access linux_slab_def_h.kmem_cache) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:124
   pragma Import (CPP, kmem_cache_shrink, "_Z17kmem_cache_shrinkP10kmem_cache");

   procedure kmem_cache_free (arg1 : access linux_slab_def_h.kmem_cache; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:125
   pragma Import (CPP, kmem_cache_free, "_Z15kmem_cache_freeP10kmem_cachePv");

  -- * Please use this macro to create slab caches. Simply specify the
  -- * name of the structure and maybe some flags that are listed above.
  -- *
  -- * The alignment of the struct determines object alignment. If you
  -- * f.e. add ____cacheline_aligned_in_smp to the struct declaration
  -- * then the objects will be properly aligned in SMP configurations.
  --  

  -- * Common kmalloc functions provided by all allocators
  --  

   --  skipped func __krealloc

   function krealloc
     (arg1 : System.Address;
      arg2 : linux_types_h.size_t;
      arg3 : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:143
   pragma Import (CPP, krealloc, "_Z8kreallocPKvmj");

   procedure kfree (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:144
   pragma Import (CPP, kfree, "_Z5kfreePKv");

   procedure kzfree (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:145
   pragma Import (CPP, kzfree, "_Z6kzfreePKv");

   function ksize (arg1 : System.Address) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:146
   pragma Import (CPP, ksize, "_Z5ksizePKv");

  -- * Some archs want to perform DMA into kmalloc caches and need a guaranteed
  -- * alignment larger than the alignment of a 64-bit integer.
  -- * Setting ARCH_KMALLOC_MINALIGN in arch headers allows that.
  --  

  -- * Common fields provided in kmem_cache by all slab allocators
  -- * This struct is either used directly by the allocator (SLOB)
  -- * or the allocator must include definitions for all fields
  -- * provided in kmem_cache_common in their definition of kmem_cache.
  -- *
  -- * Once we can do anonymous structs (C11 standard) we could put a
  -- * anonymous struct definition in these allocators so that the
  -- * separate allocations in the kmem_cache structure of SLAB and
  -- * SLUB is no longer needed.
  --  

  -- The original size of the object  
  -- The aligned/padded/added on size   
  -- Alignment as calculated  
  -- Active flags on the slab  
  -- Slab name for sysfs  
  -- Use counter  
  -- Called on object slot creation  
  -- List of all slab caches on the system  
  -- * Kmalloc array related definitions
  --  

  -- * The largest kmalloc size supported by the SLAB allocators is
  -- * 32 megabyte (2^25) or the maximum allocatable page order if that is
  -- * less than 32 MB.
  -- *
  -- * WARNING: Its not easy to increase this value since the allocators have
  -- * to do various tricks to work around compiler limitations in order to
  -- * ensure proper constant folding.
  --  

  -- * SLUB directly allocates requests fitting in to an order-1 page
  -- * (PAGE_SIZE*2).  Larger requests are passed to the page allocator.
  --  

  -- * SLOB passes all requests larger than one page to the page allocator.
  -- * No kmalloc array is necessary since objects of different sizes can
  -- * be allocated from the same page.
  --  

  -- Maximum allocatable size  
  -- Maximum size for which we actually use a slab cache  
  -- Maximum order allocatable via the slab allocagtor  
  -- * Kmalloc subsystem.
  --  

  -- * This restriction comes from byte sized index implementation.
  -- * Page size is normally 2^12 bytes and, in this case, if we want to use
  -- * byte sized index which can represent 2^8 entries, the size of the object
  -- * should be equal or greater to 2^12 / 2^8 = 2^4 = 16.
  -- * If minimum size of kmalloc is less than 16, we use it as minimum object
  -- * size and give up to use byte sized index.
  --  

   kmalloc_caches : aliased array (0 .. 22) of access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:259
   pragma Import (C, kmalloc_caches, "kmalloc_caches");

   kmalloc_dma_caches : aliased array (0 .. 22) of access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:261
   pragma Import (C, kmalloc_dma_caches, "kmalloc_dma_caches");

  -- * Figure out which kmalloc slab an allocation of a certain size
  -- * belongs to.
  -- * 0 = zero alloc
  -- * 1 =  65 .. 96 bytes
  -- * 2 = 120 .. 192 bytes
  -- * n = 2^(n-1) .. 2^n -1
  --  

   function kmalloc_index (size : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:272
   pragma Import (CPP, kmalloc_index, "_ZL13kmalloc_indexm");

  -- Will never be reached. Needed because the compiler may complain  
   --  skipped func __kmalloc

   function kmem_cache_alloc (arg1 : access linux_slab_def_h.kmem_cache; flags : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:316
   pragma Import (CPP, kmem_cache_alloc, "_Z16kmem_cache_allocP10kmem_cachej");

   --  skipped func __kmalloc_node

   function kmem_cache_alloc_node
     (arg1 : access linux_slab_def_h.kmem_cache;
      flags : linux_types_h.gfp_t;
      node : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:320
   pragma Import (CPP, kmem_cache_alloc_node, "_Z21kmem_cache_alloc_nodeP10kmem_cacheji");

   function kmem_cache_alloc_trace
     (arg1 : access linux_slab_def_h.kmem_cache;
      arg2 : linux_types_h.gfp_t;
      arg3 : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:334
   pragma Import (CPP, kmem_cache_alloc_trace, "_Z22kmem_cache_alloc_traceP10kmem_cachejm");

   function kmem_cache_alloc_node_trace
     (s : access linux_slab_def_h.kmem_cache;
      gfpflags : linux_types_h.gfp_t;
      node : int;
      size : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:337
   pragma Import (CPP, kmem_cache_alloc_node_trace, "_Z27kmem_cache_alloc_node_traceP10kmem_cachejim");

   function kmalloc_order
     (size : linux_types_h.size_t;
      flags : linux_types_h.gfp_t;
      order : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:374
   pragma Import (CPP, kmalloc_order, "_Z13kmalloc_ordermjj");

   function kmalloc_order_trace
     (size : linux_types_h.size_t;
      flags : linux_types_h.gfp_t;
      order : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:377
   pragma Import (CPP, kmalloc_order_trace, "_Z19kmalloc_order_tracemjj");

   function kmalloc_large (size : linux_types_h.size_t; flags : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:386
   pragma Import (CPP, kmalloc_large, "_ZL13kmalloc_largemj");

  --*
  -- * kmalloc - allocate memory
  -- * @size: how many bytes of memory are required.
  -- * @flags: the type of memory to allocate.
  -- *
  -- * kmalloc is the normal method of allocating memory
  -- * for objects smaller than page size in the kernel.
  -- *
  -- * The @flags argument may be one of:
  -- *
  -- * %GFP_USER - Allocate memory on behalf of user.  May sleep.
  -- *
  -- * %GFP_KERNEL - Allocate normal kernel ram.  May sleep.
  -- *
  -- * %GFP_ATOMIC - Allocation will not sleep.  May use emergency pools.
  -- *   For example, use this inside interrupt handlers.
  -- *
  -- * %GFP_HIGHUSER - Allocate pages from high memory.
  -- *
  -- * %GFP_NOIO - Do not do any I/O at all while trying to get memory.
  -- *
  -- * %GFP_NOFS - Do not make any fs calls while trying to get memory.
  -- *
  -- * %GFP_NOWAIT - Allocation will not sleep.
  -- *
  -- * %__GFP_THISNODE - Allocate node-local memory only.
  -- *
  -- * %GFP_DMA - Allocation suitable for DMA.
  -- *   Should only be used for kmalloc() caches. Otherwise, use a
  -- *   slab created with SLAB_DMA.
  -- *
  -- * Also it is possible to set different flags by OR'ing
  -- * in one or more of the following additional @flags:
  -- *
  -- * %__GFP_COLD - Request cache-cold pages instead of
  -- *   trying to return cache-warm pages.
  -- *
  -- * %__GFP_HIGH - This allocation has high priority and may use emergency pools.
  -- *
  -- * %__GFP_NOFAIL - Indicate that this allocation is in no way allowed to fail
  -- *   (think twice before using).
  -- *
  -- * %__GFP_NORETRY - If memory is not immediately available,
  -- *   then give up at once.
  -- *
  -- * %__GFP_NOWARN - If allocation fails, don't issue any warnings.
  -- *
  -- * %__GFP_REPEAT - If allocation fails initially, try once more before failing.
  -- *
  -- * There are other flags available as well, but these are not intended
  -- * for general use, and so are not documented here. For a full list of
  -- * potential flags, always refer to linux/gfp.h.
  --  

   function kmalloc (size : linux_types_h.size_t; flags : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:445
   pragma Import (CPP, kmalloc, "_ZL7kmallocmj");

  -- * Determine size used for the nth kmalloc cache.
  -- * return size or 0 if a kmalloc cache for that
  -- * size does not exist
  --  

   function kmalloc_size (n : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:470
   pragma Import (CPP, kmalloc_size, "_ZL12kmalloc_sizei");

   function kmalloc_node
     (size : linux_types_h.size_t;
      flags : linux_types_h.gfp_t;
      node : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:485
   pragma Import (CPP, kmalloc_node, "_ZL12kmalloc_nodemji");

  -- * Setting ARCH_SLAB_MINALIGN in arch headers allows a different alignment.
  -- * Intended for arches that get misalignment faults even for 64 bit integer
  -- * aligned buffers.
  --  

  -- * This is the main placeholder for memcg-related information in kmem caches.
  -- * struct kmem_cache will hold a pointer to it, so the memory cost while
  -- * disabled is 1 pointer. The runtime cost while enabled, gets bigger than it
  -- * would otherwise be if that would be bundled in kmem_cache: we'll need an
  -- * extra pointer chase. But the trade off clearly lays in favor of not
  -- * penalizing non-users.
  -- *
  -- * Both the root cache and the child caches will have it. For the root cache,
  -- * this will hold a dynamically allocated array large enough to hold
  -- * information about the currently limited memcgs in the system. To allow the
  -- * array to be accessed without taking any locks, on relocation we free the old
  -- * version only after a grace period.
  -- *
  -- * Child caches will hold extra metadata needed for its operation. Fields are:
  -- *
  -- * @memcg: pointer to the memcg this cache belongs to
  -- * @list: list_head for the list of all caches in this memcg
  -- * @root_cache: pointer to the global, root cache, this cache was derived from
  -- * @nr_pages: number of pages that belongs to this cache.
  --  

   type anon_298;
   type anon_298_memcg_caches_array is array (0 .. -1) of access linux_slab_def_h.kmem_cache;
   type anon_299 is record
      the_callback_head : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:535
      memcg_caches : aliased anon_298_memcg_caches_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:536
   end record;
   pragma Convention (C_Pass_By_Copy, anon_299);
   type anon_300 is record
      memcg : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:539
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:540
      root_cache : access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:541
      nr_pages : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:542
   end record;
   pragma Convention (C_Pass_By_Copy, anon_300);
   type anon_298 (discr : unsigned := 0) is record
      case discr is
            parent : aliased anon_299;
            field_2 : aliased anon_300;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_298);
   pragma Unchecked_Union (anon_298);
   type memcg_cache_params is record
      is_root_cache : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:532
      field_2 : aliased anon_298;
   end record;
   pragma Convention (C_Pass_By_Copy, memcg_cache_params);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:531

   function memcg_update_all_caches (num_memcgs : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:547
   pragma Import (CPP, memcg_update_all_caches, "_Z23memcg_update_all_cachesi");

   function cache_show (s : access linux_slab_def_h.kmem_cache; m : access linux_seq_file_h.seq_file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:550
   pragma Import (CPP, cache_show, "_Z10cache_showP10kmem_cacheP8seq_file");

   procedure print_slabinfo_header (m : access linux_seq_file_h.seq_file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:551
   pragma Import (CPP, print_slabinfo_header, "_Z21print_slabinfo_headerP8seq_file");

  --*
  -- * kmalloc_array - allocate memory for an array.
  -- * @n: number of elements.
  -- * @size: element size.
  -- * @flags: the type of memory to allocate (see kmalloc).
  --  

   function kmalloc_array
     (n : linux_types_h.size_t;
      size : linux_types_h.size_t;
      flags : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:559
   pragma Import (CPP, kmalloc_array, "_ZL13kmalloc_arraymmj");

  --*
  -- * kcalloc - allocate memory for an array. The memory is set to zero.
  -- * @n: number of elements.
  -- * @size: element size.
  -- * @flags: the type of memory to allocate (see kmalloc).
  --  

   function kcalloc
     (n : linux_types_h.size_t;
      size : linux_types_h.size_t;
      flags : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:572
   pragma Import (CPP, kcalloc, "_ZL7kcallocmmj");

  -- * kmalloc_track_caller is a special version of kmalloc that records the
  -- * calling function of the routine calling it for slab leak tracking instead
  -- * of just the calling function (confusing, eh?).
  -- * It's useful when the call to kmalloc comes from a widely-used standard
  -- * allocator where we care about the real place the memory allocation
  -- * request comes from.
  --  

   --  skipped func __kmalloc_track_caller

  -- * kmalloc_node_track_caller is a special version of kmalloc_node that
  -- * records the calling function of the routine calling it for slab leak
  -- * tracking instead of just the calling function (confusing, eh?).
  -- * It's useful when the call to kmalloc_node comes from a widely-used
  -- * standard allocator where we care about the real place the memory
  -- * allocation request comes from.
  --  

   --  skipped func __kmalloc_node_track_caller

  -- * Shortcuts
  --  

   function kmem_cache_zalloc (k : access linux_slab_def_h.kmem_cache; flags : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:627
   pragma Import (CPP, kmem_cache_zalloc, "_ZL17kmem_cache_zallocP10kmem_cachej");

  --*
  -- * kzalloc - allocate memory. The memory is set to zero.
  -- * @size: how many bytes of memory are required.
  -- * @flags: the type of memory to allocate (see kmalloc).
  --  

   function kzalloc (size : linux_types_h.size_t; flags : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:637
   pragma Import (CPP, kzalloc, "_ZL7kzallocmj");

  --*
  -- * kzalloc_node - allocate zeroed memory from a particular memory node.
  -- * @size: how many bytes of memory are required.
  -- * @flags: the type of memory to allocate (see kmalloc).
  -- * @node: memory node from which to allocate
  --  

   function kzalloc_node
     (size : linux_types_h.size_t;
      flags : linux_types_h.gfp_t;
      node : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:648
   pragma Import (CPP, kzalloc_node, "_ZL12kzalloc_nodemji");

  -- * Determine the size of a slab object
  --  

   function kmem_cache_size (s : access linux_slab_def_h.kmem_cache) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:656
   pragma Import (CPP, kmem_cache_size, "_ZL15kmem_cache_sizeP10kmem_cache");

   procedure kmem_cache_init_late;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab.h:661
   pragma Import (CPP, kmem_cache_init_late, "_Z20kmem_cache_init_latev");

end linux_slab_h;

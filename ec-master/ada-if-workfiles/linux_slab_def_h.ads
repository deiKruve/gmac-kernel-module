pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_reciprocal_div_h;
with linux_types_h;
with Interfaces.C.Strings;

package linux_slab_def_h is

  -- * Definitions unique to the original Linux SLAB allocator.
  --  

  -- 1) Cache tunables. Protected by slab_mutex  
   type kmem_cache_c_array_array is array (0 .. 575) of System.Address;
   type kmem_cache is record
      batchcount : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:12
      limit : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:13
      shared : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:14
      size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:16
      reciprocal_buffer_size : aliased linux_reciprocal_div_h.reciprocal_value;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:17
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:20
      num : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:21
      gfporder : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:25
      allocflags : aliased linux_types_h.gfp_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:28
      colour : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:30
      colour_off : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:31
      freelist_cache : access kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:32
      freelist_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:33
      ctor : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:36
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:39
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:40
      refcount : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:41
      object_size : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:42
      align : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:43
      node : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:86
      c_array : aliased kmem_cache_c_array_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:87
   end record;
   pragma Convention (C_Pass_By_Copy, kmem_cache);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/slab_def.h:10

  -- 2) touched by every alloc & free from the backend  
  -- constant flags  
  -- # of objs per slab  
  -- 3) cache_grow/shrink  
  -- order of pgs per slab (2^n)  
  -- force GFP flags, e.g. GFP_DMA  
  -- cache colouring range  
  -- colour offset  
  -- constructor func  
  -- 4) cache creation/removal  
  -- 5) statistics  
  --	 * If debugging is enabled, then the allocator can add additional
  --	 * fields and/or padding to every object. size contains the total
  --	 * object size including these internal fields, the following two
  --	 * variables contain the offset to the user object and its size.
  --	  

  -- 6) per-cpu/per-node data, touched during every alloc/free  
  --	 * We put array[] at the end of kmem_cache, because we want to size
  --	 * this array to nr_cpu_ids slots instead of NR_CPUS
  --	 * (see kmem_cache_init())
  --	 * We still use [NR_CPUS] and not [1] or [0] because cache_cache
  --	 * is statically defined, so we reserve the max number of cpus.
  --	 *
  --	 * We also need to guarantee that the list is able to accomodate a
  --	 * pointer for each node since "nodelists" uses the remainder of
  --	 * available pointers.
  --	  

   --  skipped empty struct kmem_cache_node

   --  skipped empty struct array_cache

  --	 * Do not add fields after array[]
  --	  

end linux_slab_def_h;

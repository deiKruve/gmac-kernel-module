pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with linux_nodemask_h;
limited with asm_generic_atomic_long_h;

package linux_shrinker_h is

   --  unsupported macro: SHRINK_STOP (~0UL)
   --  unsupported macro: DEFAULT_SEEKS 2
   --  unsupported macro: SHRINKER_NUMA_AWARE (1 << 0)
  -- * This struct is used to pass information from page reclaim to the shrinkers.
  -- * We consolidate the values for easier extention later.
  -- *
  -- * The 'gfpmask' refers to the allocation we are currently trying to
  -- * fulfil.
  --  

   type shrink_control is record
      gfp_mask : aliased linux_types_h.gfp_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:12
      nr_to_scan : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:19
      nodes_to_scan : aliased linux_nodemask_h.nodemask_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:22
      nid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, shrink_control);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:11

  --	 * How many objects scan_objects should scan and try to reclaim.
  --	 * This is reset before every call, so it is safe for callees
  --	 * to modify.
  --	  

  -- shrink from these nodes  
  -- current node being shrunk (for NUMA aware shrinkers)  
  -- * A callback you can register to apply pressure to ageable caches.
  -- *
  -- * @count_objects should return the number of freeable items in the cache. If
  -- * there are no objects to free or the number of freeable items cannot be
  -- * determined, it should return 0. No deadlock checks should be done during the
  -- * count callback - the shrinker relies on aggregating scan counts that couldn't
  -- * be executed due to potential deadlocks to be run at a later call when the
  -- * deadlock condition is no longer pending.
  -- *
  -- * @scan_objects will only be called if @count_objects returned a non-zero
  -- * value for the number of freeable objects. The callout should scan the cache
  -- * and attempt to free items from the cache. It should then return the number
  -- * of objects freed during the scan, or SHRINK_STOP if progress cannot be made
  -- * due to potential deadlocks. If SHRINK_STOP is returned, then no further
  -- * attempts to call the @scan_objects will be made from the current reclaim
  -- * context.
  -- *
  -- * @flags determine the shrinker abilities, like numa awareness
  --  

   type shrinker is record
      count_objects : access function (arg1 : access shrinker; arg2 : access shrink_control) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:50
      scan_objects : access function (arg1 : access shrinker; arg2 : access shrink_control) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:52
      seeks : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:54
      batch : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:55
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:56
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:59
      nr_deferred : access asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:61
   end record;
   pragma Convention (C_Pass_By_Copy, shrinker);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:48

  -- seeks to recreate an obj  
  -- reclaim batch size, 0 = default  
  -- These are for internal use  
  -- objs pending delete, per node  
  -- Flags  
   function register_shrinker (arg1 : access shrinker) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:68
   pragma Import (CPP, register_shrinker, "_Z17register_shrinkerP8shrinker");

   procedure unregister_shrinker (arg1 : access shrinker);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/shrinker.h:69
   pragma Import (CPP, unregister_shrinker, "_Z19unregister_shrinkerP8shrinker");

end linux_shrinker_h;

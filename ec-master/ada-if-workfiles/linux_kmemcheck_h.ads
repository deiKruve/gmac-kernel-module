pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_mm_types_h;
with linux_types_h;
limited with linux_slab_def_h;
with System;
with Interfaces.C.Extensions;

package linux_kmemcheck_h is

   --  unsupported macro: kmemcheck_enabled 0
   --  arg-macro: procedure kmemcheck_annotate_bitfield do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure kmemcheck_annotate_variable do { } while (0)
   --    do { } while (0)
  -- The slab-related functions.  
  -- * Bitfield annotations
  -- *
  -- * How to use: If you have a struct using bitfields, for example
  -- *
  -- *     struct a {
  -- *             int x:8, y:8;
  -- *     };
  -- *
  -- * then this should be rewritten as
  -- *
  -- *     struct a {
  -- *             kmemcheck_bitfield_begin(flags);
  -- *             int x:8, y:8;
  -- *             kmemcheck_bitfield_end(flags);
  -- *     };
  -- *
  -- * Now the "flags_begin" and "flags_end" members may be used to refer to the
  -- * beginning and end, respectively, of the bitfield (and things like
  -- * &x.flags_begin is allowed). As soon as the struct is allocated, the bit-
  -- * fields should be annotated:
  -- *
  -- *     struct a *a = kmalloc(sizeof(struct a), GFP_KERNEL);
  -- *     kmemcheck_annotate_bitfield(a, flags);
  --  

   procedure kmemcheck_alloc_shadow
     (the_page : access linux_mm_types_h.page;
      order : int;
      flags : linux_types_h.gfp_t;
      node : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:93
   pragma Import (CPP, kmemcheck_alloc_shadow, "_ZL22kmemcheck_alloc_shadowP4pageiji");

   procedure kmemcheck_free_shadow (the_page : access linux_mm_types_h.page; order : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:98
   pragma Import (CPP, kmemcheck_free_shadow, "_ZL21kmemcheck_free_shadowP4pagei");

   procedure kmemcheck_slab_alloc
     (s : access linux_slab_def_h.kmem_cache;
      gfpflags : linux_types_h.gfp_t;
      object : System.Address;
      size : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:103
   pragma Import (CPP, kmemcheck_slab_alloc, "_ZL20kmemcheck_slab_allocP10kmem_cachejPvm");

   procedure kmemcheck_slab_free
     (s : access linux_slab_def_h.kmem_cache;
      object : System.Address;
      size : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:108
   pragma Import (CPP, kmemcheck_slab_free, "_ZL19kmemcheck_slab_freeP10kmem_cachePvm");

   procedure kmemcheck_pagealloc_alloc
     (p : access linux_mm_types_h.page;
      order : unsigned;
      gfpflags : linux_types_h.gfp_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:113
   pragma Import (CPP, kmemcheck_pagealloc_alloc, "_ZL25kmemcheck_pagealloc_allocP4pagejj");

   function kmemcheck_page_is_tracked (p : access linux_mm_types_h.page) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:118
   pragma Import (CPP, kmemcheck_page_is_tracked, "_ZL25kmemcheck_page_is_trackedP4page");

   procedure kmemcheck_mark_unallocated (address : System.Address; n : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:123
   pragma Import (CPP, kmemcheck_mark_unallocated, "_ZL26kmemcheck_mark_unallocatedPvj");

   procedure kmemcheck_mark_uninitialized (address : System.Address; n : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:127
   pragma Import (CPP, kmemcheck_mark_uninitialized, "_ZL28kmemcheck_mark_uninitializedPvj");

   procedure kmemcheck_mark_initialized (address : System.Address; n : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:131
   pragma Import (CPP, kmemcheck_mark_initialized, "_ZL26kmemcheck_mark_initializedPvj");

   procedure kmemcheck_mark_freed (address : System.Address; n : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:135
   pragma Import (CPP, kmemcheck_mark_freed, "_ZL20kmemcheck_mark_freedPvj");

   procedure kmemcheck_mark_unallocated_pages (p : access linux_mm_types_h.page; n : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:139
   pragma Import (CPP, kmemcheck_mark_unallocated_pages, "_ZL32kmemcheck_mark_unallocated_pagesP4pagej");

   procedure kmemcheck_mark_uninitialized_pages (p : access linux_mm_types_h.page; n : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:144
   pragma Import (CPP, kmemcheck_mark_uninitialized_pages, "_ZL34kmemcheck_mark_uninitialized_pagesP4pagej");

   procedure kmemcheck_mark_initialized_pages (p : access linux_mm_types_h.page; n : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:149
   pragma Import (CPP, kmemcheck_mark_initialized_pages, "_ZL32kmemcheck_mark_initialized_pagesP4pagej");

   function kmemcheck_is_obj_initialized (addr : unsigned_long; size : linux_types_h.size_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemcheck.h:154
   pragma Import (CPP, kmemcheck_is_obj_initialized, "_ZL28kmemcheck_is_obj_initializedmm");

end linux_kmemcheck_h;

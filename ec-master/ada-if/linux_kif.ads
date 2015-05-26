pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Linux_Types;

package linux_kif is
   
   package L  renames Linux_Types;

   procedure kif_destroy_mutex (lock : System.Address);
   pragma Import (CPP, kif_destroy_mutex, "kif_destroy_mutex");

   --  skipped empty struct mutex

   function kif_is_mutex_locked (lock : System.Address) return int;
   pragma Import (CPP, kif_is_mutex_locked, "kif_is_mutex_locked");
   
   
   ---------------------------------------------------
   --  this whole section is moved to s-memory.ads  --
   ---------------------------------------------------
   --
   --  kmalloc - allocate memory
   --  @size: how many bytes of memory are required.
   --  @flags: the type of memory to allocate.
   -- 
   --  kmalloc is the normal method of allocating memory
   --  for objects smaller than page size in the kernel.
   -- 
   --  The @flags argument may be one of:
   -- 
   --  %GFP_USER - Allocate memory on behalf of user.  May sleep.
   -- 
   --  %GFP_KERNEL - Allocate normal kernel ram.  May sleep.
   -- 
   --  %GFP_ATOMIC - Allocation will not sleep.  May use emergency pools.
   --    For example, use this inside interrupt handlers.
   -- 
   --  %GFP_HIGHUSER - Allocate pages from high memory.
   -- 
   --  %GFP_NOIO - Do not do any I/O at all while trying to get memory.
   -- 
   --  %GFP_NOFS - Do not make any fs calls while trying to get memory.
   -- 
   --  %GFP_NOWAIT - Allocation will not sleep.
   -- 
   --  %__GFP_THISNODE - Allocate node-local memory only.
   -- 
   --  %GFP_DMA - Allocation suitable for DMA.
   --    Should only be used for kmalloc() caches. Otherwise, use a
   --    slab created with SLAB_DMA.
   -- 
   --  Also it is possible to set different flags by OR'ing
   --  in one or more of the following additional @flags:
   -- 
   --  %__GFP_COLD - Request cache-cold pages instead of
   --    trying to return cache-warm pages.
   -- 
   --  %__GFP_HIGH - 
   --            This allocation has high priority and may use emergency pools.
   -- 
   --  %__GFP_NOFAIL - 
   --            Indicate that this allocation is in no way allowed to fail
   --    (think twice before using).
   -- 
   --  %__GFP_NORETRY - If memory is not immediately available,
   --    then give up at once.
   -- 
   --  %__GFP_NOWARN - If allocation fails, don't issue any warnings.
   -- 
   --  %__GFP_REPEAT - 
   --               If allocation fails initially, try once more before failing.
   -- 
   --  There are other flags available as well, but these are not intended
   --  for general use, and so are not documented here. For a full list of
   --  potential flags, always refer to linux/gfp.h.
   --


   --  procedure kif_kmalloc_user (size : L.size_t);
   --  pragma Import (CPP, kif_kmalloc_user, "kif_kmalloc_user");

   --  procedure kif_kmalloc_kernel (size : L.size_t);
   --  pragma Import (CPP, kif_kmalloc_kernel, "kif_kmalloc_kernel");

   --  procedure kif_kmalloc_atomic (size : L.size_t);
   --  pragma Import (CPP, kif_kmalloc_atomic, "kif_kmalloc_atomic");

   --  procedure kif_kmalloc_highuser (size : L.size_t);
   --  pragma Import (CPP, kif_kmalloc_highuser, "kif_kmalloc_highuser");

   --  procedure kif_kmalloc_noio (size : L.size_t);
   --  pragma Import (CPP, kif_kmalloc_noio, "kif_kmalloc_noiom");

   --  procedure kif_kmalloc_nofs (size : L.size_t);
   --  pragma Import (CPP, kif_kmalloc_nofs, "kif_kmalloc_nofs");

   --  procedure kif_kmalloc_nowait (size : L.size_t);
   --  pragma Import (CPP, kif_kmalloc_nowait, "kif_kmalloc_nowait");

end linux_kif;

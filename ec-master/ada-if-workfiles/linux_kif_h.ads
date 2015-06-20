pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package linux_kif_h is

   procedure init_mutexes;  -- linux_kif.h:5
   pragma Import (CPP, init_mutexes, "_Z12init_mutexesv");

   procedure kif_destroy_mutex (lock : System.Address);  -- linux_kif.h:6
   pragma Import (CPP, kif_destroy_mutex, "_Z17kif_destroy_mutexP5mutex");

   --  skipped empty struct mutex

   function kif_is_mutex_locked (lock : System.Address) return int;  -- linux_kif.h:7
   pragma Import (CPP, kif_is_mutex_locked, "_Z19kif_is_mutex_lockedP5mutex");

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

   subtype size_t is unsigned_long;  -- linux_kif.h:65

   function kif_kmalloc_user (size : size_t) return System.Address;  -- linux_kif.h:66
   pragma Import (CPP, kif_kmalloc_user, "_Z16kif_kmalloc_userm");

   function kif_kmalloc_kernel (size : size_t) return System.Address;  -- linux_kif.h:67
   pragma Import (CPP, kif_kmalloc_kernel, "_Z18kif_kmalloc_kernelm");

   function kif_kmalloc_atomic (size : size_t) return System.Address;  -- linux_kif.h:68
   pragma Import (CPP, kif_kmalloc_atomic, "_Z18kif_kmalloc_atomicm");

   function kif_kmalloc_highuser (size : size_t) return System.Address;  -- linux_kif.h:69
   pragma Import (CPP, kif_kmalloc_highuser, "_Z20kif_kmalloc_highuserm");

   function kif_kmalloc_noio (size : size_t) return System.Address;  -- linux_kif.h:70
   pragma Import (CPP, kif_kmalloc_noio, "_Z16kif_kmalloc_noiom");

   function kif_kmalloc_nofs (size : size_t) return System.Address;  -- linux_kif.h:71
   pragma Import (CPP, kif_kmalloc_nofs, "_Z16kif_kmalloc_nofsm");

  -- void *kif_kmalloc_nowait (size_t size);  
   procedure kif_sleepforever;  -- linux_kif.h:73
   pragma Import (CPP, kif_sleepforever, "_Z16kif_sleepforeverv");

   function kif_copy_from_user
     (to : System.Address;
      from : System.Address;
      n : unsigned_long) return unsigned_long;  -- linux_kif.h:76
   pragma Import (CPP, kif_copy_from_user, "_Z18kif_copy_from_userPvPKvm");

   function kif_copy_to_user
     (to : System.Address;
      from : System.Address;
      n : unsigned_long) return unsigned_long;  -- linux_kif.h:79
   pragma Import (CPP, kif_copy_to_user, "_Z16kif_copy_to_userPvPKvm");

   function kif_kthread_run
     (thread_func : access function (arg1 : System.Address) return int;
      master : System.Address;
      name : Interfaces.C.Strings.chars_ptr) return System.Address;  -- linux_kif.h:82
   pragma Import (CPP, kif_kthread_run, "_Z15kif_kthread_runPFiPvES_Pc");

   function kthread_stop (k : System.Address) return int;  -- linux_kif.h:84
   pragma Import (CPP, kthread_stop, "_Z12kthread_stopPv");

end linux_kif_h;

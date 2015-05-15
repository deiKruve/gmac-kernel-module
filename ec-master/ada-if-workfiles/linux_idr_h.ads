pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;
with linux_spinlock_types_h;
with Interfaces.C.Extensions;

package linux_idr_h is

   --  unsupported macro: IDR_BITS 8
   --  unsupported macro: IDR_SIZE (1 << IDR_BITS)
   --  unsupported macro: IDR_MASK ((1 << IDR_BITS)-1)
   --  arg-macro: procedure IDR_INIT { .lock := __SPIN_LOCK_UNLOCKED(name.lock), }
   --    { .lock := __SPIN_LOCK_UNLOCKED(name.lock), }
   --  arg-macro: procedure DEFINE_IDR struct idr name := IDR_INIT(name)
   --    struct idr name := IDR_INIT(name)
   --  arg-macro: procedure idr_for_each_entry for (id := 0; ((entry) := idr_get_next(idp, and(id))) /= NULL; ++id)
   --    for (id := 0; ((entry) := idr_get_next(idp, and(id))) /= NULL; ++id)
   --  unsupported macro: IDA_CHUNK_SIZE 128
   --  unsupported macro: IDA_BITMAP_LONGS (IDA_CHUNK_SIZE / sizeof(long) - 1)
   --  unsupported macro: IDA_BITMAP_BITS (IDA_BITMAP_LONGS * sizeof(long) * 8)
   --  arg-macro: procedure IDA_INIT { .idr := IDR_INIT((name).idr), .free_bitmap := NULL, }
   --    { .idr := IDR_INIT((name).idr), .free_bitmap := NULL, }
   --  arg-macro: procedure DEFINE_IDA struct ida name := IDA_INIT(name)
   --    struct ida name := IDA_INIT(name)
  -- * include/linux/idr.h
  -- * 
  -- * 2002-10-18  written by Jim Houston jim.houston@ccur.com
  -- *	Copyright (C) 2002 by Concurrent Computer Corporation
  -- *	Distributed under the GNU GPL license version 2.
  -- *
  -- * Small id to pointer translation service avoiding fixed sized
  -- * tables.
  --  

  -- * We want shallower trees and thus more bits covered at each layer.  8
  -- * bits gives us large enough first layer for most use cases and maximum
  -- * tree depth of 4.  Each idr_layer is slightly larger than 2k on 64bit and
  -- * 1k on 32bit.
  --  

  -- the ID prefix of this idr_layer  
   type idr_layer_ary_array is array (0 .. 255) of System.Address;
   type idr_layer_bitmap_array is array (0 .. 3) of aliased unsigned_long;
   type anon_40 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            bitmap : aliased idr_layer_bitmap_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:37
         when others =>
            the_callback_head : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:38
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_40);
   pragma Unchecked_Union (anon_40);
   type idr_layer is record
      prefix : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:31
      layer : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:32
      ary : aliased idr_layer_ary_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:33
      count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:34
      field_5 : aliased anon_40;
   end record;
   pragma Convention (C_Pass_By_Copy, idr_layer);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:30

  -- distance from leaf  
  -- When zero, we can release it  
  -- A zero bit means "space here"  
  -- the last layer allocated from  
   type idr is record
      hint : access idr_layer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:43
      top : access idr_layer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:44
      layers : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:45
      cur : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:46
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:47
      id_free_cnt : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:48
      id_free : access idr_layer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:49
   end record;
   pragma Convention (C_Pass_By_Copy, idr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:42

  -- only valid w/o concurrent changes  
  -- current pos for cyclic allocation  
  --*
  -- * DOC: idr sync
  -- * idr synchronization (stolen from radix-tree.h)
  -- *
  -- * idr_find() is able to be called locklessly, using RCU. The caller must
  -- * ensure calls to this function are made within rcu_read_lock() regions.
  -- * Other readers (lock-free or otherwise) and modifications may be running
  -- * concurrently.
  -- *
  -- * It is still required that the caller manage the synchronization and
  -- * lifetimes of the items. So if RCU lock-free lookups are used, typically
  -- * this would mean that the items have their own locks, or are amenable to
  -- * lock-free access; and that the items are freed by RCU (or only freed after
  -- * having been deleted from the idr tree *and* a synchronize_rcu() grace
  -- * period).
  --  

  -- * This is what we export.
  --  

   function idr_find_slowpath (idp : access idr; id : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:79
   pragma Import (CPP, idr_find_slowpath, "_Z17idr_find_slowpathP3idri");

   procedure idr_preload (gfp_mask : linux_types_h.gfp_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:80
   pragma Import (CPP, idr_preload, "_Z11idr_preloadj");

   function idr_alloc
     (idp : access idr;
      ptr : System.Address;
      start : int;
      c_end : int;
      gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:81
   pragma Import (CPP, idr_alloc, "_Z9idr_allocP3idrPviij");

   function idr_alloc_cyclic
     (the_idr : access idr;
      ptr : System.Address;
      start : int;
      c_end : int;
      gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:82
   pragma Import (CPP, idr_alloc_cyclic, "_Z16idr_alloc_cyclicP3idrPviij");

   function idr_for_each
     (idp : access idr;
      fn : access function
        (arg1 : int;
         arg2 : System.Address;
         arg3 : System.Address) return int;
      data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:83
   pragma Import (CPP, idr_for_each, "_Z12idr_for_eachP3idrPFiiPvS1_ES1_");

   function idr_get_next (idp : access idr; nextid : access int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:85
   pragma Import (CPP, idr_get_next, "_Z12idr_get_nextP3idrPi");

   function idr_replace
     (idp : access idr;
      ptr : System.Address;
      id : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:86
   pragma Import (CPP, idr_replace, "_Z11idr_replaceP3idrPvi");

   procedure idr_remove (idp : access idr; id : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:87
   pragma Import (CPP, idr_remove, "_Z10idr_removeP3idri");

   procedure idr_destroy (idp : access idr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:88
   pragma Import (CPP, idr_destroy, "_Z11idr_destroyP3idr");

   procedure idr_init (idp : access idr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:89
   pragma Import (CPP, idr_init, "_Z8idr_initP3idr");

   function idr_is_empty (idp : access idr) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:90
   pragma Import (CPP, idr_is_empty, "_Z12idr_is_emptyP3idr");

  --*
  -- * idr_preload_end - end preload section started with idr_preload()
  -- *
  -- * Each idr_preload() should be matched with an invocation of this
  -- * function.  See idr_preload() for details.
  --  

   procedure idr_preload_end;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:98
   pragma Import (CPP, idr_preload_end, "_ZL15idr_preload_endv");

  --*
  -- * idr_find - return pointer for given id
  -- * @idr: idr handle
  -- * @id: lookup key
  -- *
  -- * Return the pointer given the id it has been registered with.  A %NULL
  -- * return indicates that @id is not valid or you passed %NULL in
  -- * idr_get_new().
  -- *
  -- * This function can be called under rcu_read_lock(), given that the leaf
  -- * pointers lifetimes are correctly managed.
  --  

   function idr_find (the_idr : access idr; id : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:115
   pragma Import (CPP, idr_find, "_ZL8idr_findP3idri");

  --*
  -- * idr_for_each_entry - iterate over an idr's elements of a given type
  -- * @idp:     idr handle
  -- * @entry:   the type * to use as cursor
  -- * @id:      id entry's key
  -- *
  -- * @entry and @id do not need to be initialized before the loop, and
  -- * after normal terminatinon @entry is left with the value NULL.  This
  -- * is convenient for a "not found" value.
  --  

  -- * IDA - IDR based id allocator, use when translation from id to
  -- * pointer isn't necessary.
  -- *
  -- * IDA_BITMAP_LONGS is calculated to be one less to accommodate
  -- * ida_bitmap->nr_busy so that the whole struct fits in 128 bytes.
  --  

   type ida_bitmap_bitmap_array is array (0 .. 14) of aliased unsigned_long;
   type ida_bitmap is record
      nr_busy : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:150
      bitmap : aliased ida_bitmap_bitmap_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:151
   end record;
   pragma Convention (C_Pass_By_Copy, ida_bitmap);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:149

   type ida is record
      the_idr : aliased idr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:155
      free_bitmap : access ida_bitmap;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:156
   end record;
   pragma Convention (C_Pass_By_Copy, ida);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:154

   function ida_pre_get (the_ida : access ida; gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:162
   pragma Import (CPP, ida_pre_get, "_Z11ida_pre_getP3idaj");

   function ida_get_new_above
     (the_ida : access ida;
      starting_id : int;
      p_id : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:163
   pragma Import (CPP, ida_get_new_above, "_Z17ida_get_new_aboveP3idaiPi");

   procedure ida_remove (the_ida : access ida; id : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:164
   pragma Import (CPP, ida_remove, "_Z10ida_removeP3idai");

   procedure ida_destroy (the_ida : access ida);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:165
   pragma Import (CPP, ida_destroy, "_Z11ida_destroyP3ida");

   procedure ida_init (the_ida : access ida);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:166
   pragma Import (CPP, ida_init, "_Z8ida_initP3ida");

   function ida_simple_get
     (the_ida : access ida;
      start : unsigned;
      c_end : unsigned;
      gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:168
   pragma Import (CPP, ida_simple_get, "_Z14ida_simple_getP3idajjj");

   procedure ida_simple_remove (the_ida : access ida; id : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:170
   pragma Import (CPP, ida_simple_remove, "_Z17ida_simple_removeP3idaj");

  --*
  -- * ida_get_new - allocate new ID
  -- * @ida:	idr handle
  -- * @p_id:	pointer to the allocated handle
  -- *
  -- * Simple wrapper around ida_get_new_above() w/ @starting_id of zero.
  --  

   function ida_get_new (the_ida : access ida; p_id : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:179
   pragma Import (CPP, ida_get_new, "_ZL11ida_get_newP3idaPi");

   procedure idr_init_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/idr.h:184
   pragma Import (CPP, idr_init_cache, "_Z14idr_init_cachev");

end linux_idr_h;

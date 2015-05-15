pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;
limited with linux_spinlock_types_h;

package linux_radix_tree_h is

   --  unsupported macro: RADIX_TREE_INDIRECT_PTR 1
   --  unsupported macro: RADIX_TREE_EXCEPTIONAL_ENTRY 2
   --  unsupported macro: RADIX_TREE_EXCEPTIONAL_SHIFT 2
   --  unsupported macro: RADIX_TREE_MAX_TAGS 3
   --  unsupported macro: RADIX_TREE_MAP_SHIFT (CONFIG_BASE_SMALL ? 4 : 6)
   --  unsupported macro: RADIX_TREE_MAP_SIZE (1UL << RADIX_TREE_MAP_SHIFT)
   --  unsupported macro: RADIX_TREE_MAP_MASK (RADIX_TREE_MAP_SIZE-1)
   --  unsupported macro: RADIX_TREE_TAG_LONGS ((RADIX_TREE_MAP_SIZE + BITS_PER_LONG - 1) / BITS_PER_LONG)
   --  unsupported macro: RADIX_TREE_INDEX_BITS (8 * sizeof(unsigned long))
   --  unsupported macro: RADIX_TREE_MAX_PATH (DIV_ROUND_UP(RADIX_TREE_INDEX_BITS, RADIX_TREE_MAP_SHIFT))
   --  unsupported macro: RADIX_TREE_HEIGHT_SHIFT (RADIX_TREE_MAX_PATH + 1)
   --  unsupported macro: RADIX_TREE_HEIGHT_MASK ((1UL << RADIX_TREE_HEIGHT_SHIFT) - 1)
   --  unsupported macro: RADIX_TREE_COUNT_SHIFT (RADIX_TREE_MAP_SHIFT + 1)
   --  unsupported macro: RADIX_TREE_COUNT_MASK ((1UL << RADIX_TREE_COUNT_SHIFT) - 1)
   --  arg-macro: procedure RADIX_TREE_INIT { .height := 0, .gfp_mask := (mask), .rnode := NULL, }
   --    { .height := 0, .gfp_mask := (mask), .rnode := NULL, }
   --  arg-macro: procedure RADIX_TREE struct radix_tree_root name := RADIX_TREE_INIT(mask)
   --    struct radix_tree_root name := RADIX_TREE_INIT(mask)
   --  arg-macro: procedure INIT_RADIX_TREE do { (root).height := 0; (root).gfp_mask := (mask); (root).rnode := NULL; } while (0)
   --    do { (root).height := 0; (root).gfp_mask := (mask); (root).rnode := NULL; } while (0)
   --  unsupported macro: RADIX_TREE_ITER_TAG_MASK 0x00FF
   --  unsupported macro: RADIX_TREE_ITER_TAGGED 0x0100
   --  unsupported macro: RADIX_TREE_ITER_CONTIG 0x0200
   --  arg-macro: procedure radix_tree_for_each_chunk for (slot := radix_tree_iter_init(iter, start) ; (slot := radix_tree_next_chunk(root, iter, flags)) ;)
   --    for (slot := radix_tree_iter_init(iter, start) ; (slot := radix_tree_next_chunk(root, iter, flags)) ;)
   --  arg-macro: procedure radix_tree_for_each_chunk_slot for (; slot ; slot := radix_tree_next_slot(slot, iter, flags))
   --    for (; slot ; slot := radix_tree_next_slot(slot, iter, flags))
   --  arg-macro: procedure radix_tree_for_each_slot for (slot := radix_tree_iter_init(iter, start) ; slot  or else  (slot := radix_tree_next_chunk(root, iter, 0)) ; slot := radix_tree_next_slot(slot, iter, 0))
   --    for (slot := radix_tree_iter_init(iter, start) ; slot  or else  (slot := radix_tree_next_chunk(root, iter, 0)) ; slot := radix_tree_next_slot(slot, iter, 0))
   --  arg-macro: procedure radix_tree_for_each_contig for (slot := radix_tree_iter_init(iter, start) ; slot  or else  (slot := radix_tree_next_chunk(root, iter, RADIX_TREE_ITER_CONTIG)) ; slot := radix_tree_next_slot(slot, iter, RADIX_TREE_ITER_CONTIG))
   --    for (slot := radix_tree_iter_init(iter, start) ; slot  or else  (slot := radix_tree_next_chunk(root, iter, RADIX_TREE_ITER_CONTIG)) ; slot := radix_tree_next_slot(slot, iter, RADIX_TREE_ITER_CONTIG))
   --  arg-macro: procedure radix_tree_for_each_tagged for (slot := radix_tree_iter_init(iter, start) ; slot  or else  (slot := radix_tree_next_chunk(root, iter, RADIX_TREE_ITER_TAGGED or tag)) ; slot := radix_tree_next_slot(slot, iter, RADIX_TREE_ITER_TAGGED))
   --    for (slot := radix_tree_iter_init(iter, start) ; slot  or else  (slot := radix_tree_next_chunk(root, iter, RADIX_TREE_ITER_TAGGED or tag)) ; slot := radix_tree_next_slot(slot, iter, RADIX_TREE_ITER_TAGGED))
  -- * Copyright (C) 2001 Momchil Velikov
  -- * Portions Copyright (C) 2001 Christoph Hellwig
  -- * Copyright (C) 2006 Nick Piggin
  -- * Copyright (C) 2012 Konstantin Khlebnikov
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public License as
  -- * published by the Free Software Foundation; either version 2, or (at
  -- * your option) any later version.
  -- * 
  -- * This program is distributed in the hope that it will be useful, but
  -- * WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  -- * General Public License for more details.
  -- * 
  -- * You should have received a copy of the GNU General Public License
  -- * along with this program; if not, write to the Free Software
  -- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  --  

  -- * An indirect pointer (root->rnode pointing to a radix_tree_node, rather
  -- * than a data item) is signalled by the low bit set in the root->rnode
  -- * pointer.
  -- *
  -- * In this case root->height is > 0, but the indirect pointer tests are
  -- * needed for RCU lookups (because root->height is unreliable). The only
  -- * time callers need worry about this is when doing a lookup_slot under
  -- * RCU.
  -- *
  -- * Indirect pointer in fact is also used to tag the last pointer of a node
  -- * when it is shrunk, before we rcu free the node. See shrink code for
  -- * details.
  --  

  -- * A common use of the radix tree is to store pointers to struct pages;
  -- * but shmem/tmpfs needs also to store swap entries in the same tree:
  -- * those are marked as exceptional entries to distinguish them.
  -- * EXCEPTIONAL_ENTRY tests the bit, EXCEPTIONAL_SHIFT shifts content past it.
  --  

   function radix_tree_is_indirect_ptr (ptr : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:54
   pragma Import (CPP, radix_tree_is_indirect_ptr, "_ZL26radix_tree_is_indirect_ptrPv");

  --** radix-tree API starts here ** 
  -- Height component in node->path  
  -- Internally used bits of node->count  
  -- Offset in parent & height from the bottom  
   type radix_tree_node_slots_array is array (0 .. 63) of System.Address;
   type radix_tree_node_tags_array is array (0 .. 2, 0 .. 0) of aliased unsigned_long;
   type anon_185;
   type anon_186 is record
      parent : access radix_tree_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:93
      private_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:95
   end record;
   pragma Convention (C_Pass_By_Copy, anon_186);
   type anon_185 (discr : unsigned := 0) is record
      case discr is
            parent : aliased anon_186;
         when others =>
            the_callback_head : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:98
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_185);
   pragma Unchecked_Union (anon_185);
   type radix_tree_node is record
      path : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:88
      count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:89
      field_3 : aliased anon_185;
      private_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:101
      slots : aliased radix_tree_node_slots_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:102
      tags : aliased radix_tree_node_tags_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:103
   end record;
   pragma Convention (C_Pass_By_Copy, radix_tree_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:87

  -- Used when ascending tree  
  -- For tree user  
  -- Used when freeing node  
  -- For tree user  
  -- root tags are stored in gfp_mask, shifted by __GFP_BITS_SHIFT  
   type radix_tree_root is record
      height : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:108
      gfp_mask : aliased linux_types_h.gfp_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:109
      rnode : access radix_tree_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:110
   end record;
   pragma Convention (C_Pass_By_Copy, radix_tree_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:107

  --*
  -- * Radix-tree synchronization
  -- *
  -- * The radix-tree API requires that users provide all synchronisation (with
  -- * specific exceptions, noted below).
  -- *
  -- * Synchronization of access to the data items being stored in the tree, and
  -- * management of their lifetimes must be completely managed by API users.
  -- *
  -- * For API usage, in general,
  -- * - any function _modifying_ the tree or tags (inserting or deleting
  -- *   items, setting or clearing tags) must exclude other modifications, and
  -- *   exclude any functions reading the tree.
  -- * - any function _reading_ the tree or tags (looking up items or tags,
  -- *   gang lookups) must exclude modifications to the tree, but may occur
  -- *   concurrently with other readers.
  -- *
  -- * The notable exceptions to this rule are the following functions:
  -- * __radix_tree_lookup
  -- * radix_tree_lookup
  -- * radix_tree_lookup_slot
  -- * radix_tree_tag_get
  -- * radix_tree_gang_lookup
  -- * radix_tree_gang_lookup_slot
  -- * radix_tree_gang_lookup_tag
  -- * radix_tree_gang_lookup_tag_slot
  -- * radix_tree_tagged
  -- *
  -- * The first 7 functions are able to be called locklessly, using RCU. The
  -- * caller must ensure calls to these functions are made within rcu_read_lock()
  -- * regions. Other readers (lock-free or otherwise) and modifications may be
  -- * running concurrently.
  -- *
  -- * It is still required that the caller manage the synchronization and lifetimes
  -- * of the items. So if RCU lock-free lookups are used, typically this would mean
  -- * that the items have their own locks, or are amenable to lock-free access; and
  -- * that the items are freed by RCU (or only freed after having been deleted from
  -- * the radix tree *and* a synchronize_rcu() grace period).
  -- *
  -- * (Note, rcu_assign_pointer and rcu_dereference are not needed to control
  -- * access to data items when inserting into or looking up from the radix tree)
  -- *
  -- * Note that the value returned by radix_tree_tag_get() may not be relied upon
  -- * if only the RCU read lock is held.  Functions to set/clear tags and to
  -- * delete nodes running concurrently with it may affect its result such that
  -- * two consecutive reads in the same locked section may return different
  -- * values.  If reliability is required, modification functions must also be
  -- * excluded from concurrency.
  -- *
  -- * radix_tree_tagged is able to be called without locking or RCU.
  --  

  --*
  -- * radix_tree_deref_slot	- dereference a slot
  -- * @pslot:	pointer to slot, returned by radix_tree_lookup_slot
  -- * Returns:	item that was stored in that slot with any direct pointer flag
  -- *		removed.
  -- *
  -- * For use with radix_tree_lookup_slot().  Caller must hold tree at least read
  -- * locked across slot lookup and dereference. Not required if write lock is
  -- * held (ie. items cannot be concurrently inserted).
  -- *
  -- * radix_tree_deref_retry must be used to confirm validity of the pointer if
  -- * only the read lock is held.
  --  

   function radix_tree_deref_slot (pslot : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:194
   pragma Import (CPP, radix_tree_deref_slot, "_ZL21radix_tree_deref_slotPPv");

  --*
  -- * radix_tree_deref_slot_protected	- dereference a slot without RCU lock but with tree lock held
  -- * @pslot:	pointer to slot, returned by radix_tree_lookup_slot
  -- * Returns:	item that was stored in that slot with any direct pointer flag
  -- *		removed.
  -- *
  -- * Similar to radix_tree_deref_slot but only used during migration when a pages
  -- * mapping is being moved. The caller does not hold the RCU read lock but it
  -- * must hold the tree lock to prevent parallel updates.
  --  

   function radix_tree_deref_slot_protected (pslot : System.Address; treelock : access linux_spinlock_types_h.spinlock_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:209
   pragma Import (CPP, radix_tree_deref_slot_protected, "_ZL31radix_tree_deref_slot_protectedPPvP8spinlock");

  --*
  -- * radix_tree_deref_retry	- check radix_tree_deref_slot
  -- * @arg:	pointer returned by radix_tree_deref_slot
  -- * Returns:	0 if retry is not required, otherwise retry is required
  -- *
  -- * radix_tree_deref_retry must be used with radix_tree_deref_slot.
  --  

   function radix_tree_deref_retry (arg : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:222
   pragma Import (CPP, radix_tree_deref_retry, "_ZL22radix_tree_deref_retryPv");

  --*
  -- * radix_tree_exceptional_entry	- radix_tree_deref_slot gave exceptional entry?
  -- * @arg:	value returned by radix_tree_deref_slot
  -- * Returns:	0 if well-aligned pointer, non-0 if exceptional entry.
  --  

   function radix_tree_exceptional_entry (arg : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:232
   pragma Import (CPP, radix_tree_exceptional_entry, "_ZL28radix_tree_exceptional_entryPv");

  -- Not unlikely because radix_tree_exception often tested first  
  --*
  -- * radix_tree_exception	- radix_tree_deref_slot returned either exception?
  -- * @arg:	value returned by radix_tree_deref_slot
  -- * Returns:	0 if well-aligned pointer, non-0 if either kind of exception.
  --  

   function radix_tree_exception (arg : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:243
   pragma Import (CPP, radix_tree_exception, "_ZL20radix_tree_exceptionPv");

  --*
  -- * radix_tree_replace_slot	- replace item in a slot
  -- * @pslot:	pointer to slot, returned by radix_tree_lookup_slot
  -- * @item:	new item to store in the slot.
  -- *
  -- * For use with radix_tree_lookup_slot().  Caller must hold tree write locked
  -- * across slot lookup and replacement.
  --  

   procedure radix_tree_replace_slot (pslot : System.Address; item : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:257
   pragma Import (CPP, radix_tree_replace_slot, "_ZL23radix_tree_replace_slotPPvS_");

   --  skipped func __radix_tree_create

   function radix_tree_insert
     (arg1 : access radix_tree_root;
      arg2 : unsigned_long;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:265
   pragma Import (CPP, radix_tree_insert, "_Z17radix_tree_insertP15radix_tree_rootmPv");

   --  skipped func __radix_tree_lookup

   function radix_tree_lookup (arg1 : access radix_tree_root; arg2 : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:268
   pragma Import (CPP, radix_tree_lookup, "_Z17radix_tree_lookupP15radix_tree_rootm");

   function radix_tree_lookup_slot (arg1 : access radix_tree_root; arg2 : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:269
   pragma Import (CPP, radix_tree_lookup_slot, "_Z22radix_tree_lookup_slotP15radix_tree_rootm");

   --  skipped func __radix_tree_delete_node

   function radix_tree_delete_item
     (arg1 : access radix_tree_root;
      arg2 : unsigned_long;
      arg3 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:272
   pragma Import (CPP, radix_tree_delete_item, "_Z22radix_tree_delete_itemP15radix_tree_rootmPv");

   function radix_tree_delete (arg1 : access radix_tree_root; arg2 : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:273
   pragma Import (CPP, radix_tree_delete, "_Z17radix_tree_deleteP15radix_tree_rootm");

   function radix_tree_gang_lookup
     (root : access radix_tree_root;
      results : System.Address;
      first_index : unsigned_long;
      max_items : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:275
   pragma Import (CPP, radix_tree_gang_lookup, "_Z22radix_tree_gang_lookupP15radix_tree_rootPPvmj");

   function radix_tree_gang_lookup_slot
     (root : access radix_tree_root;
      results : System.Address;
      indices : access unsigned_long;
      first_index : unsigned_long;
      max_items : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:277
   pragma Import (CPP, radix_tree_gang_lookup_slot, "_Z27radix_tree_gang_lookup_slotP15radix_tree_rootPPPvPmmj");

   function radix_tree_preload (gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:280
   pragma Import (CPP, radix_tree_preload, "_Z18radix_tree_preloadj");

   function radix_tree_maybe_preload (gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:281
   pragma Import (CPP, radix_tree_maybe_preload, "_Z24radix_tree_maybe_preloadj");

   procedure radix_tree_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:282
   pragma Import (CPP, radix_tree_init, "_Z15radix_tree_initv");

   function radix_tree_tag_set
     (root : access radix_tree_root;
      index : unsigned_long;
      tag : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:283
   pragma Import (CPP, radix_tree_tag_set, "_Z18radix_tree_tag_setP15radix_tree_rootmj");

   function radix_tree_tag_clear
     (root : access radix_tree_root;
      index : unsigned_long;
      tag : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:285
   pragma Import (CPP, radix_tree_tag_clear, "_Z20radix_tree_tag_clearP15radix_tree_rootmj");

   function radix_tree_tag_get
     (root : access radix_tree_root;
      index : unsigned_long;
      tag : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:287
   pragma Import (CPP, radix_tree_tag_get, "_Z18radix_tree_tag_getP15radix_tree_rootmj");

   function radix_tree_gang_lookup_tag
     (root : access radix_tree_root;
      results : System.Address;
      first_index : unsigned_long;
      max_items : unsigned;
      tag : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:290
   pragma Import (CPP, radix_tree_gang_lookup_tag, "_Z26radix_tree_gang_lookup_tagP15radix_tree_rootPPvmjj");

   function radix_tree_gang_lookup_tag_slot
     (root : access radix_tree_root;
      results : System.Address;
      first_index : unsigned_long;
      max_items : unsigned;
      tag : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:294
   pragma Import (CPP, radix_tree_gang_lookup_tag_slot, "_Z31radix_tree_gang_lookup_tag_slotP15radix_tree_rootPPPvmjj");

   function radix_tree_range_tag_if_tagged
     (root : access radix_tree_root;
      first_indexp : access unsigned_long;
      last_index : unsigned_long;
      nr_to_tag : unsigned_long;
      fromtag : unsigned;
      totag : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:297
   pragma Import (CPP, radix_tree_range_tag_if_tagged, "_Z30radix_tree_range_tag_if_taggedP15radix_tree_rootPmmmjj");

   function radix_tree_tagged (root : access radix_tree_root; tag : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:301
   pragma Import (CPP, radix_tree_tagged, "_Z17radix_tree_taggedP15radix_tree_rootj");

   function radix_tree_locate_item (root : access radix_tree_root; item : System.Address) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:302
   pragma Import (CPP, radix_tree_locate_item, "_Z22radix_tree_locate_itemP15radix_tree_rootPv");

   procedure radix_tree_preload_end;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:304
   pragma Import (CPP, radix_tree_preload_end, "_ZL22radix_tree_preload_endv");

  --*
  -- * struct radix_tree_iter - radix tree iterator state
  -- *
  -- * @index:	index of current slot
  -- * @next_index:	next-to-last index for this chunk
  -- * @tags:	bit-mask for tag-iterating
  -- *
  -- * This radix tree iterator works in terms of "chunks" of slots.  A chunk is a
  -- * subinterval of slots contained within one radix tree leaf node.  It is
  -- * described by a pointer to its first slot and a struct radix_tree_iter
  -- * which holds the chunk's position in the tree and its size.  For tagged
  -- * iteration radix_tree_iter also holds the slots' bit-mask for one chosen
  -- * radix tree tag.
  --  

   type radix_tree_iter is record
      index : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:324
      next_index : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:325
      tags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:326
   end record;
   pragma Convention (C_Pass_By_Copy, radix_tree_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:323

  --*
  -- * radix_tree_iter_init - initialize radix tree iterator
  -- *
  -- * @iter:	pointer to iterator state
  -- * @start:	iteration starting index
  -- * Returns:	NULL
  --  

   function radix_tree_iter_init (iter : access radix_tree_iter; start : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:341
   pragma Import (CPP, radix_tree_iter_init, "_ZL20radix_tree_iter_initP15radix_tree_iterm");

  --	 * Leave iter->tags uninitialized. radix_tree_next_chunk() will fill it
  --	 * in the case of a successful tagged chunk lookup.  If the lookup was
  --	 * unsuccessful or non-tagged then nobody cares about ->tags.
  --	 *
  --	 * Set index to zero to bypass next_index overflow protection.
  --	 * See the comment in radix_tree_next_chunk() for details.
  --	  

  --*
  -- * radix_tree_next_chunk - find next chunk of slots for iteration
  -- *
  -- * @root:	radix tree root
  -- * @iter:	iterator state
  -- * @flags:	RADIX_TREE_ITER_* flags and tag index
  -- * Returns:	pointer to chunk first slot, or NULL if there no more left
  -- *
  -- * This function looks up the next chunk in the radix tree starting from
  -- * @iter->next_index.  It returns a pointer to the chunk's first slot.
  -- * Also it fills @iter with data about chunk: position in the tree (index),
  -- * its end (next_index), and constructs a bit mask for tagged iterating (tags).
  --  

   function radix_tree_next_chunk
     (root : access radix_tree_root;
      iter : access radix_tree_iter;
      flags : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:369
   pragma Import (CPP, radix_tree_next_chunk, "_Z21radix_tree_next_chunkP15radix_tree_rootP15radix_tree_iterj");

  --*
  -- * radix_tree_chunk_size - get current chunk size
  -- *
  -- * @iter:	pointer to radix tree iterator
  -- * Returns:	current chunk size
  --  

   function radix_tree_chunk_size (iter : access radix_tree_iter) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:379
   pragma Import (CPP, radix_tree_chunk_size, "_ZL21radix_tree_chunk_sizeP15radix_tree_iter");

  --*
  -- * radix_tree_next_slot - find next slot in chunk
  -- *
  -- * @slot:	pointer to current slot
  -- * @iter:	pointer to interator state
  -- * @flags:	RADIX_TREE_ITER_*, should be constant
  -- * Returns:	pointer to next slot, or NULL if there no more left
  -- *
  -- * This function updates @iter->index in the case of a successful lookup.
  -- * For tagged lookup it also eats @iter->tags.
  --  

   function radix_tree_next_slot
     (slot : System.Address;
      iter : access radix_tree_iter;
      flags : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/radix-tree.h:396
   pragma Import (CPP, radix_tree_next_slot, "_ZL20radix_tree_next_slotPPvP15radix_tree_iterj");

  -- forbid switching to the next chunk  
  --*
  -- * radix_tree_for_each_chunk - iterate over chunks
  -- *
  -- * @slot:	the void** variable for pointer to chunk first slot
  -- * @root:	the struct radix_tree_root pointer
  -- * @iter:	the struct radix_tree_iter pointer
  -- * @start:	iteration starting index
  -- * @flags:	RADIX_TREE_ITER_* and tag index
  -- *
  -- * Locks can be released and reacquired between iterations.
  --  

  --*
  -- * radix_tree_for_each_chunk_slot - iterate over slots in one chunk
  -- *
  -- * @slot:	the void** variable, at the beginning points to chunk first slot
  -- * @iter:	the struct radix_tree_iter pointer
  -- * @flags:	RADIX_TREE_ITER_*, should be constant
  -- *
  -- * This macro is designed to be nested inside radix_tree_for_each_chunk().
  -- * @slot points to the radix tree slot, @iter->index contains its index.
  --  

  --*
  -- * radix_tree_for_each_slot - iterate over non-empty slots
  -- *
  -- * @slot:	the void** variable for pointer to slot
  -- * @root:	the struct radix_tree_root pointer
  -- * @iter:	the struct radix_tree_iter pointer
  -- * @start:	iteration starting index
  -- *
  -- * @slot points to radix tree slot, @iter->index contains its index.
  --  

  --*
  -- * radix_tree_for_each_contig - iterate over contiguous slots
  -- *
  -- * @slot:	the void** variable for pointer to slot
  -- * @root:	the struct radix_tree_root pointer
  -- * @iter:	the struct radix_tree_iter pointer
  -- * @start:	iteration starting index
  -- *
  -- * @slot points to radix tree slot, @iter->index contains its index.
  --  

  --*
  -- * radix_tree_for_each_tagged - iterate over tagged slots
  -- *
  -- * @slot:	the void** variable for pointer to slot
  -- * @root:	the struct radix_tree_root pointer
  -- * @iter:	the struct radix_tree_iter pointer
  -- * @start:	iteration starting index
  -- * @tag:	tag index
  -- *
  -- * @slot points to radix tree slot, @iter->index contains its index.
  --  

end linux_radix_tree_h;

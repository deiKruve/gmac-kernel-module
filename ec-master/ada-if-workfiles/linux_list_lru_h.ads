pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_spinlock_types_h;
with linux_types_h;
with linux_nodemask_h;
limited with linux_lockdep_h;
with Interfaces.C.Extensions;
with System;

package linux_list_lru_h is

  -- * Copyright (c) 2013 Red Hat, Inc. and Parallels Inc. All rights reserved.
  -- * Authors: David Chinner and Glauber Costa
  -- *
  -- * Generic LRU infrastructure
  --  

  -- list_lru_walk_cb has to always return one of those  
   type lru_status is 
     (LRU_REMOVED,
      LRU_REMOVED_RETRY,
      LRU_ROTATE,
      LRU_SKIP,
      LRU_RETRY);
   pragma Convention (C, lru_status);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:14

  -- item removed from list  
  -- item removed, but lock has been
  --				   dropped and reacquired  

  -- item referenced, give another pass  
  -- item cannot be locked, skip  
  -- item not freeable. May drop the lock
  --				   internally, but has to return locked.  

   type list_lru_node is record
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:25
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:26
      nr_items : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, list_lru_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:24

  -- kept as signed so we can catch imbalance bugs  
   type list_lru is record
      node : access list_lru_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:32
      active_nodes : aliased linux_nodemask_h.nodemask_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, list_lru);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:31

   procedure list_lru_destroy (lru : access list_lru);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:36
   pragma Import (CPP, list_lru_destroy, "_Z16list_lru_destroyP8list_lru");

   function list_lru_init_key (lru : access list_lru; key : access linux_lockdep_h.lock_class_key) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:37
   pragma Import (CPP, list_lru_init_key, "_Z17list_lru_init_keyP8list_lruP14lock_class_key");

   function list_lru_init (lru : access list_lru) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:38
   pragma Import (CPP, list_lru_init, "_ZL13list_lru_initP8list_lru");

  --*
  -- * list_lru_add: add an element to the lru list's tail
  -- * @list_lru: the lru pointer
  -- * @item: the item to be added.
  -- *
  -- * If the element is already part of a list, this function returns doing
  -- * nothing. Therefore the caller does not need to keep state about whether or
  -- * not the element already belongs in the list and is allowed to lazy update
  -- * it. Note however that this is valid for *a* list, not *this* list. If
  -- * the caller organize itself in a way that elements can be in more than
  -- * one type of list, it is up to the caller to fully remove the item from
  -- * the previous list (with list_lru_del() for instance) before moving it
  -- * to @list_lru
  -- *
  -- * Return value: true if the list was updated, false otherwise
  --  

   function list_lru_add (lru : access list_lru; item : access linux_types_h.list_head) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:59
   pragma Import (CPP, list_lru_add, "_Z12list_lru_addP8list_lruP9list_head");

  --*
  -- * list_lru_del: delete an element to the lru list
  -- * @list_lru: the lru pointer
  -- * @item: the item to be deleted.
  -- *
  -- * This function works analogously as list_lru_add in terms of list
  -- * manipulation. The comments about an element already pertaining to
  -- * a list are also valid for list_lru_del.
  -- *
  -- * Return value: true if the list was updated, false otherwise
  --  

   function list_lru_del (lru : access list_lru; item : access linux_types_h.list_head) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:72
   pragma Import (CPP, list_lru_del, "_Z12list_lru_delP8list_lruP9list_head");

  --*
  -- * list_lru_count_node: return the number of objects currently held by @lru
  -- * @lru: the lru pointer.
  -- * @nid: the node id to count from.
  -- *
  -- * Always return a non-negative number, 0 for empty lists. There is no
  -- * guarantee that the list is not updated while the count is being computed.
  -- * Callers that want such a guarantee need to provide an outer lock.
  --  

   function list_lru_count_node (lru : access list_lru; nid : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:83
   pragma Import (CPP, list_lru_count_node, "_Z19list_lru_count_nodeP8list_lrui");

   function list_lru_count (lru : access list_lru) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:84
   pragma Import (CPP, list_lru_count, "_ZL14list_lru_countP8list_lru");

   type list_lru_walk_cb is access function
        (arg1 : access linux_types_h.list_head;
         arg2 : access linux_spinlock_types_h.spinlock_t;
         arg3 : System.Address) return lru_status;
   pragma Convention (C, list_lru_walk_cb);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:96

  --*
  -- * list_lru_walk_node: walk a list_lru, isolating and disposing freeable items.
  -- * @lru: the lru pointer.
  -- * @nid: the node id to scan from.
  -- * @isolate: callback function that is resposible for deciding what to do with
  -- *  the item currently being scanned
  -- * @cb_arg: opaque type that will be passed to @isolate
  -- * @nr_to_walk: how many items to scan.
  -- *
  -- * This function will scan all elements in a particular list_lru, calling the
  -- * @isolate callback for each of those items, along with the current list
  -- * spinlock and a caller-provided opaque. The @isolate callback can choose to
  -- * drop the lock internally, but *must* return with the lock held. The callback
  -- * will return an enum lru_status telling the list_lru infrastructure what to
  -- * do with the object being scanned.
  -- *
  -- * Please note that nr_to_walk does not mean how many objects will be freed,
  -- * just how many objects will be scanned.
  -- *
  -- * Return value: the number of objects effectively removed from the LRU.
  --  

   function list_lru_walk_node
     (lru : access list_lru;
      nid : int;
      isolate : list_lru_walk_cb;
      cb_arg : System.Address;
      nr_to_walk : access unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:118
   pragma Import (CPP, list_lru_walk_node, "_Z18list_lru_walk_nodeP8list_lruiPF10lru_statusP9list_headP8spinlockPvES6_Pm");

   function list_lru_walk
     (lru : access list_lru;
      isolate : list_lru_walk_cb;
      cb_arg : System.Address;
      nr_to_walk : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_lru.h:123
   pragma Import (CPP, list_lru_walk, "_ZL13list_lru_walkP8list_lruPF10lru_statusP9list_headP8spinlockPvES6_m");

end linux_list_lru_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_types_h;

package linux_rculist_h is

   --  arg-macro: function list_next_rcu (*((struct list_head __rcu **)(and(list).next))
   --    return *((struct list_head __rcu **)(and(list).next));
   --  arg-macro: function list_entry_rcu ({ typeof(*ptr) __rcu *__ptr := (typeof(*ptr) __rcu __force *)ptr; container_of((typeof(ptr))rcu_dereference_raw(__ptr), type, member); }
   --    return { typeof(*ptr) __rcu *__ptr := (typeof(*ptr) __rcu __force *)ptr; container_of((typeof(ptr))rcu_dereference_raw(__ptr), type, member); };
   --  arg-macro: function list_first_or_null_rcu ({ struct list_head *__ptr := (ptr); struct list_head *__next := ACCESS_ONCE(__ptr.next); likely(__ptr /= __next) ? list_entry_rcu(__next, type, member) : NULL; }
   --    return { struct list_head *__ptr := (ptr); struct list_head *__next := ACCESS_ONCE(__ptr.next); likely(__ptr /= __next) ? list_entry_rcu(__next, type, member) : NULL; };
   --  arg-macro: procedure list_for_each_entry_rcu for (pos := list_entry_rcu((head).next, typeof(*pos), member); andpos.member /= (head); pos := list_entry_rcu(pos.member.next, typeof(*pos), member))
   --    for (pos := list_entry_rcu((head).next, typeof(*pos), member); andpos.member /= (head); pos := list_entry_rcu(pos.member.next, typeof(*pos), member))
   --  arg-macro: procedure list_for_each_entry_continue_rcu for (pos := list_entry_rcu(pos.member.next, typeof(*pos), member); andpos.member /= (head); pos := list_entry_rcu(pos.member.next, typeof(*pos), member))
   --    for (pos := list_entry_rcu(pos.member.next, typeof(*pos), member); andpos.member /= (head); pos := list_entry_rcu(pos.member.next, typeof(*pos), member))
   --  arg-macro: function hlist_first_rcu (*((struct hlist_node __rcu **)(and(head).first))
   --    return *((struct hlist_node __rcu **)(and(head).first));
   --  arg-macro: function hlist_next_rcu (*((struct hlist_node __rcu **)(and(node).next))
   --    return *((struct hlist_node __rcu **)(and(node).next));
   --  arg-macro: function hlist_pprev_rcu (*((struct hlist_node __rcu **)((node).pprev))
   --    return *((struct hlist_node __rcu **)((node).pprev));
   --  arg-macro: procedure hlist_for_each_entry_rcu for (pos := hlist_entry_safe (rcu_dereference_raw(hlist_first_rcu(head)), typeof(*(pos)), member); pos; pos := hlist_entry_safe(rcu_dereference_raw(hlist_next_rcu( and(pos).member)), typeof(*(pos)), member))
   --    for (pos := hlist_entry_safe (rcu_dereference_raw(hlist_first_rcu(head)), typeof(*(pos)), member); pos; pos := hlist_entry_safe(rcu_dereference_raw(hlist_next_rcu( and(pos).member)), typeof(*(pos)), member))
   --  arg-macro: procedure hlist_for_each_entry_rcu_notrace for (pos := hlist_entry_safe (rcu_dereference_raw_notrace(hlist_first_rcu(head)), typeof(*(pos)), member); pos; pos := hlist_entry_safe(rcu_dereference_raw_notrace(hlist_next_rcu( and(pos).member)), typeof(*(pos)), member))
   --    for (pos := hlist_entry_safe (rcu_dereference_raw_notrace(hlist_first_rcu(head)), typeof(*(pos)), member); pos; pos := hlist_entry_safe(rcu_dereference_raw_notrace(hlist_next_rcu( and(pos).member)), typeof(*(pos)), member))
   --  arg-macro: procedure hlist_for_each_entry_rcu_bh for (pos := hlist_entry_safe(rcu_dereference_bh(hlist_first_rcu(head)), typeof(*(pos)), member); pos; pos := hlist_entry_safe(rcu_dereference_bh(hlist_next_rcu( and(pos).member)), typeof(*(pos)), member))
   --    for (pos := hlist_entry_safe(rcu_dereference_bh(hlist_first_rcu(head)), typeof(*(pos)), member); pos; pos := hlist_entry_safe(rcu_dereference_bh(hlist_next_rcu( and(pos).member)), typeof(*(pos)), member))
   --  arg-macro: procedure hlist_for_each_entry_continue_rcu for (pos := hlist_entry_safe(rcu_dereference((pos).member.next), typeof(*(pos)), member); pos; pos := hlist_entry_safe(rcu_dereference((pos).member.next), typeof(*(pos)), member))
   --    for (pos := hlist_entry_safe(rcu_dereference((pos).member.next), typeof(*(pos)), member); pos; pos := hlist_entry_safe(rcu_dereference((pos).member.next), typeof(*(pos)), member))
   --  arg-macro: procedure hlist_for_each_entry_continue_rcu_bh for (pos := hlist_entry_safe(rcu_dereference_bh((pos).member.next), typeof(*(pos)), member); pos; pos := hlist_entry_safe(rcu_dereference_bh((pos).member.next), typeof(*(pos)), member))
   --    for (pos := hlist_entry_safe(rcu_dereference_bh((pos).member.next), typeof(*(pos)), member); pos; pos := hlist_entry_safe(rcu_dereference_bh((pos).member.next), typeof(*(pos)), member))
  -- * RCU-protected list version
  --  

  -- * Why is there no list_empty_rcu()?  Because list_empty() serves this
  -- * purpose.  The list_empty() function fetches the RCU-protected pointer
  -- * and compares it to the address of the list head, but neither dereferences
  -- * this pointer itself nor provides this pointer to the caller.  Therefore,
  -- * it is not necessary to use rcu_dereference(), so that list_empty() can
  -- * be used anywhere you would want to use a list_empty_rcu().
  --  

  -- * INIT_LIST_HEAD_RCU - Initialize a list_head visible to RCU readers
  -- * @list: list to be initialized
  -- *
  -- * You should instead use INIT_LIST_HEAD() for normal initialization and
  -- * cleanup tasks, when readers have no access to the list being initialized.
  -- * However, if the list being initialized is visible to readers, you
  -- * need to keep the compiler from being too mischievous.
  --  

   procedure INIT_LIST_HEAD_RCU (list : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:30
   pragma Import (CPP, INIT_LIST_HEAD_RCU, "_ZL18INIT_LIST_HEAD_RCUP9list_head");

  -- * return the ->next pointer of a list_head in an rcu safe
  -- * way, we must not access it directly
  --  

  -- * Insert a new entry between two known consecutive entries.
  -- *
  -- * This is only for internal list manipulation where we know
  -- * the prev/next entries already!
  --  

   --  skipped func __list_add_rcu

  --*
  -- * list_add_rcu - add a new entry to rcu-protected list
  -- * @new: new entry to be added
  -- * @head: list head to add it after
  -- *
  -- * Insert a new entry after the specified head.
  -- * This is good for implementing stacks.
  -- *
  -- * The caller must take whatever precautions are necessary
  -- * (such as holding appropriate locks) to avoid racing
  -- * with another list-mutation primitive, such as list_add_rcu()
  -- * or list_del_rcu(), running on this same list.
  -- * However, it is perfectly legal to run concurrently with
  -- * the _rcu list-traversal primitives, such as
  -- * list_for_each_entry_rcu().
  --  

   procedure list_add_rcu (arg1 : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:78
   pragma Import (CPP, list_add_rcu, "_ZL12list_add_rcuP9list_head");

  --*
  -- * list_add_tail_rcu - add a new entry to rcu-protected list
  -- * @new: new entry to be added
  -- * @head: list head to add it before
  -- *
  -- * Insert a new entry before the specified head.
  -- * This is useful for implementing queues.
  -- *
  -- * The caller must take whatever precautions are necessary
  -- * (such as holding appropriate locks) to avoid racing
  -- * with another list-mutation primitive, such as list_add_tail_rcu()
  -- * or list_del_rcu(), running on this same list.
  -- * However, it is perfectly legal to run concurrently with
  -- * the _rcu list-traversal primitives, such as
  -- * list_for_each_entry_rcu().
  --  

   procedure list_add_tail_rcu (arg1 : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:99
   pragma Import (CPP, list_add_tail_rcu, "_ZL17list_add_tail_rcuP9list_head");

  --*
  -- * list_del_rcu - deletes entry from list without re-initialization
  -- * @entry: the element to delete from the list.
  -- *
  -- * Note: list_empty() on entry does not return true after this,
  -- * the entry is in an undefined state. It is useful for RCU based
  -- * lockfree traversal.
  -- *
  -- * In particular, it means that we can not poison the forward
  -- * pointers that may still be used for walking the list.
  -- *
  -- * The caller must take whatever precautions are necessary
  -- * (such as holding appropriate locks) to avoid racing
  -- * with another list-mutation primitive, such as list_del_rcu()
  -- * or list_add_rcu(), running on this same list.
  -- * However, it is perfectly legal to run concurrently with
  -- * the _rcu list-traversal primitives, such as
  -- * list_for_each_entry_rcu().
  -- *
  -- * Note that the caller is not permitted to immediately free
  -- * the newly deleted entry.  Instead, either synchronize_rcu()
  -- * or call_rcu() must be used to defer freeing until an RCU
  -- * grace period has elapsed.
  --  

   procedure list_del_rcu (c_entry : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:129
   pragma Import (CPP, list_del_rcu, "_ZL12list_del_rcuP9list_head");

  --*
  -- * hlist_del_init_rcu - deletes entry from hash list with re-initialization
  -- * @n: the element to delete from the hash list.
  -- *
  -- * Note: list_unhashed() on the node return true after this. It is
  -- * useful for RCU based read lockfree traversal if the writer side
  -- * must know if the list entry is still hashed or already unhashed.
  -- *
  -- * In particular, it means that we can not poison the forward pointers
  -- * that may still be used for walking the hash list and we can only
  -- * zero the pprev pointer so list_unhashed() will return true after
  -- * this.
  -- *
  -- * The caller must take whatever precautions are necessary (such as
  -- * holding appropriate locks) to avoid racing with another
  -- * list-mutation primitive, such as hlist_add_head_rcu() or
  -- * hlist_del_rcu(), running on this same list.  However, it is
  -- * perfectly legal to run concurrently with the _rcu list-traversal
  -- * primitives, such as hlist_for_each_entry_rcu().
  --  

   procedure hlist_del_init_rcu (n : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:155
   pragma Import (CPP, hlist_del_init_rcu, "_ZL18hlist_del_init_rcuP10hlist_node");

  --*
  -- * list_replace_rcu - replace old entry by new one
  -- * @old : the element to be replaced
  -- * @new : the new element to insert
  -- *
  -- * The @old entry will be replaced with the @new entry atomically.
  -- * Note: @old should not be empty.
  --  

   procedure list_replace_rcu (old : access linux_types_h.list_head; arg2 : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:171
   pragma Import (CPP, list_replace_rcu, "_ZL16list_replace_rcuP9list_headS0_");

  --*
  -- * list_splice_init_rcu - splice an RCU-protected list into an existing list.
  -- * @list:	the RCU-protected list to splice
  -- * @head:	the place in the list to splice the first list into
  -- * @sync:	function to sync: synchronize_rcu(), synchronize_sched(), ...
  -- *
  -- * @head can be RCU-read traversed concurrently with this function.
  -- *
  -- * Note that this function blocks.
  -- *
  -- * Important note: the caller must take whatever action is necessary to
  -- *	prevent any other updates to @head.  In principle, it is possible
  -- *	to modify the list as soon as sync() begins execution.
  -- *	If this sort of thing becomes necessary, an alternative version
  -- *	based on call_rcu() could be created.  But only if -really-
  -- *	needed -- there is no shortage of RCU API members.
  --  

   procedure list_splice_init_rcu
     (list : access linux_types_h.list_head;
      head : access linux_types_h.list_head;
      sync : access procedure);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:198
   pragma Import (CPP, list_splice_init_rcu, "_ZL20list_splice_init_rcuP9list_headS0_PFvvE");

  --	 * "first" and "last" tracking list, so initialize it.  RCU readers
  --	 * have access to this list, so we must use INIT_LIST_HEAD_RCU()
  --	 * instead of INIT_LIST_HEAD().
  --	  

  --	 * At this point, the list body still points to the source list.
  --	 * Wait for any readers to finish using the list before splicing
  --	 * the list body into the new list.  Any new readers will see
  --	 * an empty list.
  --	  

  --	 * Readers are finished with the source list, so perform splice.
  --	 * The order is important if the new list is global and accessible
  --	 * to concurrent RCU readers.  Note that RCU readers are not
  --	 * permitted to traverse the prev pointers without excluding
  --	 * this function.
  --	  

  --*
  -- * list_entry_rcu - get the struct for this entry
  -- * @ptr:        the &struct list_head pointer.
  -- * @type:       the type of the struct this is embedded in.
  -- * @member:     the name of the list_struct within the struct.
  -- *
  -- * This primitive may safely run concurrently with the _rcu list-mutation
  -- * primitives such as list_add_rcu() as long as it's guarded by rcu_read_lock().
  --  

  --*
  -- * Where are list_empty_rcu() and list_first_entry_rcu()?
  -- *
  -- * Implementing those functions following their counterparts list_empty() and
  -- * list_first_entry() is not advisable because they lead to subtle race
  -- * conditions as the following snippet shows:
  -- *
  -- * if (!list_empty_rcu(mylist)) {
  -- *	struct foo *bar = list_first_entry_rcu(mylist, struct foo, list_member);
  -- *	do_something(bar);
  -- * }
  -- *
  -- * The list may not be empty when list_empty_rcu checks it, but it may be when
  -- * list_first_entry_rcu rereads the ->next pointer.
  -- *
  -- * Rereading the ->next pointer is not a problem for list_empty() and
  -- * list_first_entry() because they would be protected by a lock that blocks
  -- * writers.
  -- *
  -- * See list_first_or_null_rcu for an alternative.
  --  

  --*
  -- * list_first_or_null_rcu - get the first element from a list
  -- * @ptr:        the list head to take the element from.
  -- * @type:       the type of the struct this is embedded in.
  -- * @member:     the name of the list_struct within the struct.
  -- *
  -- * Note that if the list is empty, it returns NULL.
  -- *
  -- * This primitive may safely run concurrently with the _rcu list-mutation
  -- * primitives such as list_add_rcu() as long as it's guarded by rcu_read_lock().
  --  

  --*
  -- * list_for_each_entry_rcu	-	iterate over rcu list of given type
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * This list-traversal primitive may safely run concurrently with
  -- * the _rcu list-mutation primitives such as list_add_rcu()
  -- * as long as the traversal is guarded by rcu_read_lock().
  --  

  --*
  -- * list_for_each_entry_continue_rcu - continue iteration over list of given type
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Continue to iterate over list of given type, continuing after
  -- * the current position.
  --  

  --*
  -- * hlist_del_rcu - deletes entry from hash list without re-initialization
  -- * @n: the element to delete from the hash list.
  -- *
  -- * Note: list_unhashed() on entry does not return true after this,
  -- * the entry is in an undefined state. It is useful for RCU based
  -- * lockfree traversal.
  -- *
  -- * In particular, it means that we can not poison the forward
  -- * pointers that may still be used for walking the hash list.
  -- *
  -- * The caller must take whatever precautions are necessary
  -- * (such as holding appropriate locks) to avoid racing
  -- * with another list-mutation primitive, such as hlist_add_head_rcu()
  -- * or hlist_del_rcu(), running on this same list.
  -- * However, it is perfectly legal to run concurrently with
  -- * the _rcu list-traversal primitives, such as
  -- * hlist_for_each_entry().
  --  

   procedure hlist_del_rcu (n : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:343
   pragma Import (CPP, hlist_del_rcu, "_ZL13hlist_del_rcuP10hlist_node");

  --*
  -- * hlist_replace_rcu - replace old entry by new one
  -- * @old : the element to be replaced
  -- * @new : the new element to insert
  -- *
  -- * The @old entry will be replaced with the @new entry atomically.
  --  

   procedure hlist_replace_rcu (old : access linux_types_h.hlist_node; arg2 : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:356
   pragma Import (CPP, hlist_replace_rcu, "_ZL17hlist_replace_rcuP10hlist_nodeS0_");

  -- * return the first or the next element in an RCU protected hlist
  --  

  --*
  -- * hlist_add_head_rcu
  -- * @n: the element to add to the hash list.
  -- * @h: the list to add to.
  -- *
  -- * Description:
  -- * Adds the specified element to the specified hlist,
  -- * while permitting racing traversals.
  -- *
  -- * The caller must take whatever precautions are necessary
  -- * (such as holding appropriate locks) to avoid racing
  -- * with another list-mutation primitive, such as hlist_add_head_rcu()
  -- * or hlist_del_rcu(), running on this same list.
  -- * However, it is perfectly legal to run concurrently with
  -- * the _rcu list-traversal primitives, such as
  -- * hlist_for_each_entry_rcu(), used to prevent memory-consistency
  -- * problems on Alpha CPUs.  Regardless of the type of CPU, the
  -- * list-traversal primitive must be guarded by rcu_read_lock().
  --  

   procedure hlist_add_head_rcu (n : access linux_types_h.hlist_node; h : access linux_types_h.hlist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:395
   pragma Import (CPP, hlist_add_head_rcu, "_ZL18hlist_add_head_rcuP10hlist_nodeP10hlist_head");

  --*
  -- * hlist_add_before_rcu
  -- * @n: the new element to add to the hash list.
  -- * @next: the existing element to add the new element before.
  -- *
  -- * Description:
  -- * Adds the specified element to the specified hlist
  -- * before the specified node while permitting racing traversals.
  -- *
  -- * The caller must take whatever precautions are necessary
  -- * (such as holding appropriate locks) to avoid racing
  -- * with another list-mutation primitive, such as hlist_add_head_rcu()
  -- * or hlist_del_rcu(), running on this same list.
  -- * However, it is perfectly legal to run concurrently with
  -- * the _rcu list-traversal primitives, such as
  -- * hlist_for_each_entry_rcu(), used to prevent memory-consistency
  -- * problems on Alpha CPUs.
  --  

   procedure hlist_add_before_rcu (n : access linux_types_h.hlist_node; next : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:425
   pragma Import (CPP, hlist_add_before_rcu, "_ZL20hlist_add_before_rcuP10hlist_nodeS0_");

  --*
  -- * hlist_add_after_rcu
  -- * @prev: the existing element to add the new element after.
  -- * @n: the new element to add to the hash list.
  -- *
  -- * Description:
  -- * Adds the specified element to the specified hlist
  -- * after the specified node while permitting racing traversals.
  -- *
  -- * The caller must take whatever precautions are necessary
  -- * (such as holding appropriate locks) to avoid racing
  -- * with another list-mutation primitive, such as hlist_add_head_rcu()
  -- * or hlist_del_rcu(), running on this same list.
  -- * However, it is perfectly legal to run concurrently with
  -- * the _rcu list-traversal primitives, such as
  -- * hlist_for_each_entry_rcu(), used to prevent memory-consistency
  -- * problems on Alpha CPUs.
  --  

   procedure hlist_add_after_rcu (prev : access linux_types_h.hlist_node; n : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist.h:452
   pragma Import (CPP, hlist_add_after_rcu, "_ZL19hlist_add_after_rcuP10hlist_nodeS0_");

  --*
  -- * hlist_for_each_entry_rcu - iterate over rcu list of given type
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the hlist_node within the struct.
  -- *
  -- * This list-traversal primitive may safely run concurrently with
  -- * the _rcu list-mutation primitives such as hlist_add_head_rcu()
  -- * as long as the traversal is guarded by rcu_read_lock().
  --  

  --*
  -- * hlist_for_each_entry_rcu_notrace - iterate over rcu list of given type (for tracing)
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the hlist_node within the struct.
  -- *
  -- * This list-traversal primitive may safely run concurrently with
  -- * the _rcu list-mutation primitives such as hlist_add_head_rcu()
  -- * as long as the traversal is guarded by rcu_read_lock().
  -- *
  -- * This is the same as hlist_for_each_entry_rcu() except that it does
  -- * not do any RCU debugging or tracing.
  --  

  --*
  -- * hlist_for_each_entry_rcu_bh - iterate over rcu list of given type
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the hlist_node within the struct.
  -- *
  -- * This list-traversal primitive may safely run concurrently with
  -- * the _rcu list-mutation primitives such as hlist_add_head_rcu()
  -- * as long as the traversal is guarded by rcu_read_lock().
  --  

  --*
  -- * hlist_for_each_entry_continue_rcu - iterate over a hlist continuing after current point
  -- * @pos:	the type * to use as a loop cursor.
  -- * @member:	the name of the hlist_node within the struct.
  --  

  --*
  -- * hlist_for_each_entry_continue_rcu_bh - iterate over a hlist continuing after current point
  -- * @pos:	the type * to use as a loop cursor.
  -- * @member:	the name of the hlist_node within the struct.
  --  

end linux_rculist_h;

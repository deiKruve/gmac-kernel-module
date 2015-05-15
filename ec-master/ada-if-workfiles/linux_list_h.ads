pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_types_h;

package linux_list_h is

   --  arg-macro: procedure LIST_HEAD_INIT { and(name), and(name) }
   --    { and(name), and(name) }
   --  arg-macro: procedure LIST_HEAD struct list_head name := LIST_HEAD_INIT(name)
   --    struct list_head name := LIST_HEAD_INIT(name)
   --  arg-macro: procedure list_entry container_of(ptr, type, member)
   --    container_of(ptr, type, member)
   --  arg-macro: procedure list_first_entry list_entry((ptr).next, type, member)
   --    list_entry((ptr).next, type, member)
   --  arg-macro: procedure list_last_entry list_entry((ptr).prev, type, member)
   --    list_entry((ptr).prev, type, member)
   --  arg-macro: function list_first_entry_or_null (notlist_empty(ptr) ? list_first_entry(ptr, type, member) : NULL
   --    return notlist_empty(ptr) ? list_first_entry(ptr, type, member) : NULL;
   --  arg-macro: procedure list_next_entry list_entry((pos).member.next, typeof(*(pos)), member)
   --    list_entry((pos).member.next, typeof(*(pos)), member)
   --  arg-macro: procedure list_prev_entry list_entry((pos).member.prev, typeof(*(pos)), member)
   --    list_entry((pos).member.prev, typeof(*(pos)), member)
   --  arg-macro: procedure list_for_each for (pos := (head).next; pos /= (head); pos := pos.next)
   --    for (pos := (head).next; pos /= (head); pos := pos.next)
   --  arg-macro: procedure list_for_each_prev for (pos := (head).prev; pos /= (head); pos := pos.prev)
   --    for (pos := (head).prev; pos /= (head); pos := pos.prev)
   --  arg-macro: procedure list_for_each_safe for (pos := (head).next, n := pos.next; pos /= (head); pos := n, n := pos.next)
   --    for (pos := (head).next, n := pos.next; pos /= (head); pos := n, n := pos.next)
   --  arg-macro: procedure list_for_each_prev_safe for (pos := (head).prev, n := pos.prev; pos /= (head); pos := n, n := pos.prev)
   --    for (pos := (head).prev, n := pos.prev; pos /= (head); pos := n, n := pos.prev)
   --  arg-macro: procedure list_for_each_entry for (pos := list_first_entry(head, typeof(*pos), member); andpos.member /= (head); pos := list_next_entry(pos, member))
   --    for (pos := list_first_entry(head, typeof(*pos), member); andpos.member /= (head); pos := list_next_entry(pos, member))
   --  arg-macro: procedure list_for_each_entry_reverse for (pos := list_last_entry(head, typeof(*pos), member); andpos.member /= (head); pos := list_prev_entry(pos, member))
   --    for (pos := list_last_entry(head, typeof(*pos), member); andpos.member /= (head); pos := list_prev_entry(pos, member))
   --  arg-macro: function list_prepare_entry ((pos) ? : list_entry(head, typeof(*pos), member)
   --    return (pos) ? : list_entry(head, typeof(*pos), member);
   --  arg-macro: procedure list_for_each_entry_continue for (pos := list_next_entry(pos, member); andpos.member /= (head); pos := list_next_entry(pos, member))
   --    for (pos := list_next_entry(pos, member); andpos.member /= (head); pos := list_next_entry(pos, member))
   --  arg-macro: procedure list_for_each_entry_continue_reverse for (pos := list_prev_entry(pos, member); andpos.member /= (head); pos := list_prev_entry(pos, member))
   --    for (pos := list_prev_entry(pos, member); andpos.member /= (head); pos := list_prev_entry(pos, member))
   --  arg-macro: procedure list_for_each_entry_from for (; andpos.member /= (head); pos := list_next_entry(pos, member))
   --    for (; andpos.member /= (head); pos := list_next_entry(pos, member))
   --  arg-macro: procedure list_for_each_entry_safe for (pos := list_first_entry(head, typeof(*pos), member), n := list_next_entry(pos, member); andpos.member /= (head); pos := n, n := list_next_entry(n, member))
   --    for (pos := list_first_entry(head, typeof(*pos), member), n := list_next_entry(pos, member); andpos.member /= (head); pos := n, n := list_next_entry(n, member))
   --  arg-macro: procedure list_for_each_entry_safe_continue for (pos := list_next_entry(pos, member), n := list_next_entry(pos, member); andpos.member /= (head); pos := n, n := list_next_entry(n, member))
   --    for (pos := list_next_entry(pos, member), n := list_next_entry(pos, member); andpos.member /= (head); pos := n, n := list_next_entry(n, member))
   --  arg-macro: procedure list_for_each_entry_safe_from for (n := list_next_entry(pos, member); andpos.member /= (head); pos := n, n := list_next_entry(n, member))
   --    for (n := list_next_entry(pos, member); andpos.member /= (head); pos := n, n := list_next_entry(n, member))
   --  arg-macro: procedure list_for_each_entry_safe_reverse for (pos := list_last_entry(head, typeof(*pos), member), n := list_prev_entry(pos, member); andpos.member /= (head); pos := n, n := list_prev_entry(n, member))
   --    for (pos := list_last_entry(head, typeof(*pos), member), n := list_prev_entry(pos, member); andpos.member /= (head); pos := n, n := list_prev_entry(n, member))
   --  arg-macro: procedure list_safe_reset_next n := list_next_entry(pos, member)
   --    n := list_next_entry(pos, member)
   --  unsupported macro: HLIST_HEAD_INIT { .first = NULL }
   --  arg-macro: procedure HLIST_HEAD struct hlist_head name := { .first := NULL }
   --    struct hlist_head name := { .first := NULL }
   --  arg-macro: function INIT_HLIST_HEAD ((ptr).first := NULL
   --    return (ptr).first := NULL;
   --  arg-macro: procedure hlist_entry container_of(ptr,type,member)
   --    container_of(ptr,type,member)
   --  arg-macro: procedure hlist_for_each for (pos := (head).first; pos ; pos := pos.next)
   --    for (pos := (head).first; pos ; pos := pos.next)
   --  arg-macro: procedure hlist_for_each_safe for (pos := (head).first; pos  and then  ({ n := pos.next; 1; }); pos := n)
   --    for (pos := (head).first; pos  and then  ({ n := pos.next; 1; }); pos := n)
   --  arg-macro: function hlist_entry_safe ({ typeof(ptr) ____ptr := (ptr); ____ptr ? hlist_entry(____ptr, type, member) : NULL; }
   --    return { typeof(ptr) ____ptr := (ptr); ____ptr ? hlist_entry(____ptr, type, member) : NULL; };
   --  arg-macro: procedure hlist_for_each_entry for (pos := hlist_entry_safe((head).first, typeof(*(pos)), member); pos; pos := hlist_entry_safe((pos).member.next, typeof(*(pos)), member))
   --    for (pos := hlist_entry_safe((head).first, typeof(*(pos)), member); pos; pos := hlist_entry_safe((pos).member.next, typeof(*(pos)), member))
   --  arg-macro: procedure hlist_for_each_entry_continue for (pos := hlist_entry_safe((pos).member.next, typeof(*(pos)), member); pos; pos := hlist_entry_safe((pos).member.next, typeof(*(pos)), member))
   --    for (pos := hlist_entry_safe((pos).member.next, typeof(*(pos)), member); pos; pos := hlist_entry_safe((pos).member.next, typeof(*(pos)), member))
   --  arg-macro: procedure hlist_for_each_entry_from for (; pos; pos := hlist_entry_safe((pos).member.next, typeof(*(pos)), member))
   --    for (; pos; pos := hlist_entry_safe((pos).member.next, typeof(*(pos)), member))
   --  arg-macro: procedure hlist_for_each_entry_safe for (pos := hlist_entry_safe((head).first, typeof(*pos), member); pos  and then  ({ n := pos.member.next; 1; }); pos := hlist_entry_safe(n, typeof(*pos), member))
   --    for (pos := hlist_entry_safe((head).first, typeof(*pos), member); pos  and then  ({ n := pos.member.next; 1; }); pos := hlist_entry_safe(n, typeof(*pos), member))
  -- * Simple doubly linked list implementation.
  -- *
  -- * Some of the internal functions ("__xxx") are useful when
  -- * manipulating whole lists rather than single entries, as
  -- * sometimes we already know the next/prev entries and we can
  -- * generate better code by using them directly rather than
  -- * using the generic single-entry routines.
  --  

   procedure INIT_LIST_HEAD (list : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:24
   pragma Import (CPP, INIT_LIST_HEAD, "_ZL14INIT_LIST_HEADP9list_head");

  -- * Insert a new entry between two known consecutive entries.
  -- *
  -- * This is only for internal list manipulation where we know
  -- * the prev/next entries already!
  --  

   --  skipped func __list_add

  --*
  -- * list_add - add a new entry
  -- * @new: new entry to be added
  -- * @head: list head to add it after
  -- *
  -- * Insert a new entry after the specified head.
  -- * This is good for implementing stacks.
  --  

   procedure list_add (arg1 : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:60
   pragma Import (CPP, list_add, "_ZL8list_addP9list_head");

  --*
  -- * list_add_tail - add a new entry
  -- * @new: new entry to be added
  -- * @head: list head to add it before
  -- *
  -- * Insert a new entry before the specified head.
  -- * This is useful for implementing queues.
  --  

   procedure list_add_tail (arg1 : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:74
   pragma Import (CPP, list_add_tail, "_ZL13list_add_tailP9list_head");

  -- * Delete a list entry by making the prev/next entries
  -- * point to each other.
  -- *
  -- * This is only for internal list manipulation where we know
  -- * the prev/next entries already!
  --  

   --  skipped func __list_del

  --*
  -- * list_del - deletes entry from list.
  -- * @entry: the element to delete from the list.
  -- * Note: list_empty() on entry does not return true after this, the entry is
  -- * in an undefined state.
  --  

   --  skipped func __list_del_entry

   procedure list_del (c_entry : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:104
   pragma Import (CPP, list_del, "_ZL8list_delP9list_head");

  --*
  -- * list_replace - replace old entry by new one
  -- * @old : the element to be replaced
  -- * @new : the new element to insert
  -- *
  -- * If @old was empty, it will be overwritten.
  --  

   procedure list_replace (old : access linux_types_h.list_head; arg2 : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:122
   pragma Import (CPP, list_replace, "_ZL12list_replaceP9list_headS0_");

   procedure list_replace_init (old : access linux_types_h.list_head; arg2 : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:131
   pragma Import (CPP, list_replace_init, "_ZL17list_replace_initP9list_headS0_");

  --*
  -- * list_del_init - deletes entry from list and reinitialize it.
  -- * @entry: the element to delete from the list.
  --  

   procedure list_del_init (c_entry : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:142
   pragma Import (CPP, list_del_init, "_ZL13list_del_initP9list_head");

  --*
  -- * list_move - delete from one list and add as another's head
  -- * @list: the entry to move
  -- * @head: the head that will precede our entry
  --  

   procedure list_move (list : access linux_types_h.list_head; head : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:153
   pragma Import (CPP, list_move, "_ZL9list_moveP9list_headS0_");

  --*
  -- * list_move_tail - delete from one list and add as another's tail
  -- * @list: the entry to move
  -- * @head: the head that will follow our entry
  --  

   procedure list_move_tail (list : access linux_types_h.list_head; head : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:164
   pragma Import (CPP, list_move_tail, "_ZL14list_move_tailP9list_headS0_");

  --*
  -- * list_is_last - tests whether @list is the last entry in list @head
  -- * @list: the entry to test
  -- * @head: the head of the list
  --  

   function list_is_last (list : access constant linux_types_h.list_head; head : access constant linux_types_h.list_head) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:176
   pragma Import (CPP, list_is_last, "_ZL12list_is_lastPK9list_headS1_");

  --*
  -- * list_empty - tests whether a list is empty
  -- * @head: the list to test.
  --  

   function list_empty (head : access constant linux_types_h.list_head) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:186
   pragma Import (CPP, list_empty, "_ZL10list_emptyPK9list_head");

  --*
  -- * list_empty_careful - tests whether a list is empty and not being modified
  -- * @head: the list to test
  -- *
  -- * Description:
  -- * tests whether a list is empty _and_ checks that no other CPU might be
  -- * in the process of modifying either member (next or prev)
  -- *
  -- * NOTE: using list_empty_careful() without synchronization
  -- * can only be safe if the only activity that can happen
  -- * to the list entry is list_del_init(). Eg. it cannot be used
  -- * if another CPU could re-list_add() it.
  --  

   function list_empty_careful (head : access constant linux_types_h.list_head) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:204
   pragma Import (CPP, list_empty_careful, "_ZL18list_empty_carefulPK9list_head");

  --*
  -- * list_rotate_left - rotate the list to the left
  -- * @head: the head of the list
  --  

   procedure list_rotate_left (head : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:214
   pragma Import (CPP, list_rotate_left, "_ZL16list_rotate_leftP9list_head");

  --*
  -- * list_is_singular - tests whether a list has just one entry.
  -- * @head: the list to test.
  --  

   function list_is_singular (head : access constant linux_types_h.list_head) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:228
   pragma Import (CPP, list_is_singular, "_ZL16list_is_singularPK9list_head");

   --  skipped func __list_cut_position

  --*
  -- * list_cut_position - cut a list into two
  -- * @list: a new list to add all removed entries
  -- * @head: a list with entries
  -- * @entry: an entry within head, could be the head itself
  -- *	and if so we won't cut the list
  -- *
  -- * This helper moves the initial part of @head, up to and
  -- * including @entry, from @head to @list. You should
  -- * pass on @entry an element you know is on @head. @list
  -- * should be an empty list or a list you do not care about
  -- * losing its data.
  -- *
  --  

   procedure list_cut_position
     (list : access linux_types_h.list_head;
      head : access linux_types_h.list_head;
      c_entry : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:259
   pragma Import (CPP, list_cut_position, "_ZL17list_cut_positionP9list_headS0_S0_");

   --  skipped func __list_splice

  --*
  -- * list_splice - join two lists, this is designed for stacks
  -- * @list: the new list to add.
  -- * @head: the place to add it in the first list.
  --  

   procedure list_splice (list : access constant linux_types_h.list_head; head : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:292
   pragma Import (CPP, list_splice, "_ZL11list_splicePK9list_headPS_");

  --*
  -- * list_splice_tail - join two lists, each list being a queue
  -- * @list: the new list to add.
  -- * @head: the place to add it in the first list.
  --  

   procedure list_splice_tail (list : access linux_types_h.list_head; head : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:304
   pragma Import (CPP, list_splice_tail, "_ZL16list_splice_tailP9list_headS0_");

  --*
  -- * list_splice_init - join two lists and reinitialise the emptied list.
  -- * @list: the new list to add.
  -- * @head: the place to add it in the first list.
  -- *
  -- * The list at @list is reinitialised
  --  

   procedure list_splice_init (list : access linux_types_h.list_head; head : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:318
   pragma Import (CPP, list_splice_init, "_ZL16list_splice_initP9list_headS0_");

  --*
  -- * list_splice_tail_init - join two lists and reinitialise the emptied list
  -- * @list: the new list to add.
  -- * @head: the place to add it in the first list.
  -- *
  -- * Each of the lists is a queue.
  -- * The list at @list is reinitialised
  --  

   procedure list_splice_tail_init (list : access linux_types_h.list_head; head : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:335
   pragma Import (CPP, list_splice_tail_init, "_ZL21list_splice_tail_initP9list_headS0_");

  --*
  -- * list_entry - get the struct for this entry
  -- * @ptr:	the &struct list_head pointer.
  -- * @type:	the type of the struct this is embedded in.
  -- * @member:	the name of the list_struct within the struct.
  --  

  --*
  -- * list_first_entry - get the first element from a list
  -- * @ptr:	the list head to take the element from.
  -- * @type:	the type of the struct this is embedded in.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Note, that list is expected to be not empty.
  --  

  --*
  -- * list_last_entry - get the last element from a list
  -- * @ptr:	the list head to take the element from.
  -- * @type:	the type of the struct this is embedded in.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Note, that list is expected to be not empty.
  --  

  --*
  -- * list_first_entry_or_null - get the first element from a list
  -- * @ptr:	the list head to take the element from.
  -- * @type:	the type of the struct this is embedded in.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Note that if the list is empty, it returns NULL.
  --  

  --*
  -- * list_next_entry - get the next element in list
  -- * @pos:	the type * to cursor
  -- * @member:	the name of the list_struct within the struct.
  --  

  --*
  -- * list_prev_entry - get the prev element in list
  -- * @pos:	the type * to cursor
  -- * @member:	the name of the list_struct within the struct.
  --  

  --*
  -- * list_for_each	-	iterate over a list
  -- * @pos:	the &struct list_head to use as a loop cursor.
  -- * @head:	the head for your list.
  --  

  --*
  -- * list_for_each_prev	-	iterate over a list backwards
  -- * @pos:	the &struct list_head to use as a loop cursor.
  -- * @head:	the head for your list.
  --  

  --*
  -- * list_for_each_safe - iterate over a list safe against removal of list entry
  -- * @pos:	the &struct list_head to use as a loop cursor.
  -- * @n:		another &struct list_head to use as temporary storage
  -- * @head:	the head for your list.
  --  

  --*
  -- * list_for_each_prev_safe - iterate over a list backwards safe against removal of list entry
  -- * @pos:	the &struct list_head to use as a loop cursor.
  -- * @n:		another &struct list_head to use as temporary storage
  -- * @head:	the head for your list.
  --  

  --*
  -- * list_for_each_entry	-	iterate over list of given type
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  --  

  --*
  -- * list_for_each_entry_reverse - iterate backwards over list of given type.
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  --  

  --*
  -- * list_prepare_entry - prepare a pos entry for use in list_for_each_entry_continue()
  -- * @pos:	the type * to use as a start point
  -- * @head:	the head of the list
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Prepares a pos entry for use as a start point in list_for_each_entry_continue().
  --  

  --*
  -- * list_for_each_entry_continue - continue iteration over list of given type
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Continue to iterate over list of given type, continuing after
  -- * the current position.
  --  

  --*
  -- * list_for_each_entry_continue_reverse - iterate backwards from the given point
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Start to iterate over list of given type backwards, continuing after
  -- * the current position.
  --  

  --*
  -- * list_for_each_entry_from - iterate over list of given type from the current point
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Iterate over list of given type, continuing from current position.
  --  

  --*
  -- * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
  -- * @pos:	the type * to use as a loop cursor.
  -- * @n:		another type * to use as temporary storage
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  --  

  --*
  -- * list_for_each_entry_safe_continue - continue list iteration safe against removal
  -- * @pos:	the type * to use as a loop cursor.
  -- * @n:		another type * to use as temporary storage
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Iterate over list of given type, continuing after current point,
  -- * safe against removal of list entry.
  --  

  --*
  -- * list_for_each_entry_safe_from - iterate over list from current point safe against removal
  -- * @pos:	the type * to use as a loop cursor.
  -- * @n:		another type * to use as temporary storage
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Iterate over list of given type from current point, safe against
  -- * removal of list entry.
  --  

  --*
  -- * list_for_each_entry_safe_reverse - iterate backwards over list safe against removal
  -- * @pos:	the type * to use as a loop cursor.
  -- * @n:		another type * to use as temporary storage
  -- * @head:	the head for your list.
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * Iterate backwards over list of given type, safe against removal
  -- * of list entry.
  --  

  --*
  -- * list_safe_reset_next - reset a stale list_for_each_entry_safe loop
  -- * @pos:	the loop cursor used in the list_for_each_entry_safe loop
  -- * @n:		temporary storage used in list_for_each_entry_safe
  -- * @member:	the name of the list_struct within the struct.
  -- *
  -- * list_safe_reset_next is not safe to use in general if the list may be
  -- * modified concurrently (eg. the lock is dropped in the loop body). An
  -- * exception to this is if the cursor element (pos) is pinned in the list,
  -- * and list_safe_reset_next is called after re-taking the lock and before
  -- * completing the current iteration of the loop body.
  --  

  -- * Double linked lists with a single pointer list head.
  -- * Mostly useful for hash tables where the two pointer list head is
  -- * too wasteful.
  -- * You lose the ability to access the tail in O(1).
  --  

   procedure INIT_HLIST_NODE (h : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:597
   pragma Import (CPP, INIT_HLIST_NODE, "_ZL15INIT_HLIST_NODEP10hlist_node");

   function hlist_unhashed (h : access constant linux_types_h.hlist_node) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:603
   pragma Import (CPP, hlist_unhashed, "_ZL14hlist_unhashedPK10hlist_node");

   function hlist_empty (h : access constant linux_types_h.hlist_head) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:608
   pragma Import (CPP, hlist_empty, "_ZL11hlist_emptyPK10hlist_head");

   --  skipped func __hlist_del

   procedure hlist_del (n : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:622
   pragma Import (CPP, hlist_del, "_ZL9hlist_delP10hlist_node");

   procedure hlist_del_init (n : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:629
   pragma Import (CPP, hlist_del_init, "_ZL14hlist_del_initP10hlist_node");

   procedure hlist_add_head (n : access linux_types_h.hlist_node; h : access linux_types_h.hlist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:637
   pragma Import (CPP, hlist_add_head, "_ZL14hlist_add_headP10hlist_nodeP10hlist_head");

  -- next must be != NULL  
   procedure hlist_add_before (n : access linux_types_h.hlist_node; next : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:648
   pragma Import (CPP, hlist_add_before, "_ZL16hlist_add_beforeP10hlist_nodeS0_");

   procedure hlist_add_after (n : access linux_types_h.hlist_node; next : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:657
   pragma Import (CPP, hlist_add_after, "_ZL15hlist_add_afterP10hlist_nodeS0_");

  -- after that we'll appear to be on some hlist and hlist_del will work  
   procedure hlist_add_fake (n : access linux_types_h.hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:669
   pragma Import (CPP, hlist_add_fake, "_ZL14hlist_add_fakeP10hlist_node");

  -- * Move a list from one list head to another. Fixup the pprev
  -- * reference of the first entry if it exists.
  --  

   procedure hlist_move_list (old : access linux_types_h.hlist_head; arg2 : access linux_types_h.hlist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list.h:678
   pragma Import (CPP, hlist_move_list, "_ZL15hlist_move_listP10hlist_headS0_");

  --*
  -- * hlist_for_each_entry	- iterate over list of given type
  -- * @pos:	the type * to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the hlist_node within the struct.
  --  

  --*
  -- * hlist_for_each_entry_continue - iterate over a hlist continuing after current point
  -- * @pos:	the type * to use as a loop cursor.
  -- * @member:	the name of the hlist_node within the struct.
  --  

  --*
  -- * hlist_for_each_entry_from - iterate over a hlist continuing from current point
  -- * @pos:	the type * to use as a loop cursor.
  -- * @member:	the name of the hlist_node within the struct.
  --  

  --*
  -- * hlist_for_each_entry_safe - iterate over list of given type safe against removal of list entry
  -- * @pos:	the type * to use as a loop cursor.
  -- * @n:		another &struct hlist_node to use as temporary storage
  -- * @head:	the head for your list.
  -- * @member:	the name of the hlist_node within the struct.
  --  

end linux_list_h;

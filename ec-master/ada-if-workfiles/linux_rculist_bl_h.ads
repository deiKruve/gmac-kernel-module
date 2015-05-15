pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_list_bl_h;

package linux_rculist_bl_h is

   --  arg-macro: procedure hlist_bl_for_each_entry_rcu for (pos := hlist_bl_first_rcu(head); pos  and then  ({ tpos := hlist_bl_entry(pos, typeof(*tpos), member); 1; }); pos := rcu_dereference_raw(pos.next))
   --    for (pos := hlist_bl_first_rcu(head); pos  and then  ({ tpos := hlist_bl_entry(pos, typeof(*tpos), member); 1; }); pos := rcu_dereference_raw(pos.next))
  -- * RCU-protected bl list version. See include/linux/list_bl.h.
  --  

   procedure hlist_bl_set_first_rcu (h : access linux_list_bl_h.hlist_bl_head; n : access linux_list_bl_h.hlist_bl_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist_bl.h:10
   pragma Import (CPP, hlist_bl_set_first_rcu, "_ZL22hlist_bl_set_first_rcuP13hlist_bl_headP13hlist_bl_node");

   function hlist_bl_first_rcu (h : access linux_list_bl_h.hlist_bl_head) return access linux_list_bl_h.hlist_bl_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist_bl.h:20
   pragma Import (CPP, hlist_bl_first_rcu, "_ZL18hlist_bl_first_rcuP13hlist_bl_head");

  --*
  -- * hlist_bl_del_init_rcu - deletes entry from hash list with re-initialization
  -- * @n: the element to delete from the hash list.
  -- *
  -- * Note: hlist_bl_unhashed() on the node returns true after this. It is
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
  -- * list-mutation primitive, such as hlist_bl_add_head_rcu() or
  -- * hlist_bl_del_rcu(), running on this same list.  However, it is
  -- * perfectly legal to run concurrently with the _rcu list-traversal
  -- * primitives, such as hlist_bl_for_each_entry_rcu().
  --  

   procedure hlist_bl_del_init_rcu (n : access linux_list_bl_h.hlist_bl_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist_bl.h:46
   pragma Import (CPP, hlist_bl_del_init_rcu, "_ZL21hlist_bl_del_init_rcuP13hlist_bl_node");

  --*
  -- * hlist_bl_del_rcu - deletes entry from hash list without re-initialization
  -- * @n: the element to delete from the hash list.
  -- *
  -- * Note: hlist_bl_unhashed() on entry does not return true after this,
  -- * the entry is in an undefined state. It is useful for RCU based
  -- * lockfree traversal.
  -- *
  -- * In particular, it means that we can not poison the forward
  -- * pointers that may still be used for walking the hash list.
  -- *
  -- * The caller must take whatever precautions are necessary
  -- * (such as holding appropriate locks) to avoid racing
  -- * with another list-mutation primitive, such as hlist_bl_add_head_rcu()
  -- * or hlist_bl_del_rcu(), running on this same list.
  -- * However, it is perfectly legal to run concurrently with
  -- * the _rcu list-traversal primitives, such as
  -- * hlist_bl_for_each_entry().
  --  

   procedure hlist_bl_del_rcu (n : access linux_list_bl_h.hlist_bl_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist_bl.h:73
   pragma Import (CPP, hlist_bl_del_rcu, "_ZL16hlist_bl_del_rcuP13hlist_bl_node");

  --*
  -- * hlist_bl_add_head_rcu
  -- * @n: the element to add to the hash list.
  -- * @h: the list to add to.
  -- *
  -- * Description:
  -- * Adds the specified element to the specified hlist_bl,
  -- * while permitting racing traversals.
  -- *
  -- * The caller must take whatever precautions are necessary
  -- * (such as holding appropriate locks) to avoid racing
  -- * with another list-mutation primitive, such as hlist_bl_add_head_rcu()
  -- * or hlist_bl_del_rcu(), running on this same list.
  -- * However, it is perfectly legal to run concurrently with
  -- * the _rcu list-traversal primitives, such as
  -- * hlist_bl_for_each_entry_rcu(), used to prevent memory-consistency
  -- * problems on Alpha CPUs.  Regardless of the type of CPU, the
  -- * list-traversal primitive must be guarded by rcu_read_lock().
  --  

   procedure hlist_bl_add_head_rcu (n : access linux_list_bl_h.hlist_bl_node; h : access linux_list_bl_h.hlist_bl_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rculist_bl.h:98
   pragma Import (CPP, hlist_bl_add_head_rcu, "_ZL21hlist_bl_add_head_rcuP13hlist_bl_nodeP13hlist_bl_head");

  -- don't need hlist_bl_first_rcu because we're under lock  
  -- need _rcu because we can have concurrent lock free readers  
  --*
  -- * hlist_bl_for_each_entry_rcu - iterate over rcu list of given type
  -- * @tpos:	the type * to use as a loop cursor.
  -- * @pos:	the &struct hlist_bl_node to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the hlist_bl_node within the struct.
  -- *
  --  

end linux_rculist_bl_h;

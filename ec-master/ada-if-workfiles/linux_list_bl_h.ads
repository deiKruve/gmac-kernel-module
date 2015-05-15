pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Extensions;

package linux_list_bl_h is

   --  unsupported macro: LIST_BL_LOCKMASK 1UL
   --  arg-macro: function INIT_HLIST_BL_HEAD ((ptr).first := NULL
   --    return (ptr).first := NULL;
   --  arg-macro: procedure hlist_bl_entry container_of(ptr,type,member)
   --    container_of(ptr,type,member)
   --  arg-macro: procedure hlist_bl_for_each_entry for (pos := hlist_bl_first(head); pos  and then  ({ tpos := hlist_bl_entry(pos, typeof(*tpos), member); 1;}); pos := pos.next)
   --    for (pos := hlist_bl_first(head); pos  and then  ({ tpos := hlist_bl_entry(pos, typeof(*tpos), member); 1;}); pos := pos.next)
   --  arg-macro: procedure hlist_bl_for_each_entry_safe for (pos := hlist_bl_first(head); pos  and then  ({ n := pos.next; 1; })  and then  ({ tpos := hlist_bl_entry(pos, typeof(*tpos), member); 1;}); pos := n)
   --    for (pos := hlist_bl_first(head); pos  and then  ({ n := pos.next; 1; })  and then  ({ tpos := hlist_bl_entry(pos, typeof(*tpos), member); 1;}); pos := n)
  -- * Special version of lists, where head of the list has a lock in the lowest
  -- * bit. This is useful for scalable hash tables without increasing memory
  -- * footprint overhead.
  -- *
  -- * For modification operations, the 0 bit of hlist_bl_head->first
  -- * pointer must be set.
  -- *
  -- * With some small modifications, this can easily be adapted to store several
  -- * arbitrary bits (not just a single lock bit), if the need arises to store
  -- * some fast and compact auxiliary data.
  --  

   type hlist_bl_node;
   type hlist_bl_head is record
      first : access hlist_bl_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, hlist_bl_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:33

   type hlist_bl_node is record
      next : access hlist_bl_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:38
      pprev : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, hlist_bl_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:37

   procedure INIT_HLIST_BL_NODE (h : access hlist_bl_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:43
   pragma Import (CPP, INIT_HLIST_BL_NODE, "_ZL18INIT_HLIST_BL_NODEP13hlist_bl_node");

   function hlist_bl_unhashed (h : access constant hlist_bl_node) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:51
   pragma Import (CPP, hlist_bl_unhashed, "_ZL17hlist_bl_unhashedPK13hlist_bl_node");

   function hlist_bl_first (h : access hlist_bl_head) return access hlist_bl_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:56
   pragma Import (CPP, hlist_bl_first, "_ZL14hlist_bl_firstP13hlist_bl_head");

   procedure hlist_bl_set_first (h : access hlist_bl_head; n : access hlist_bl_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:62
   pragma Import (CPP, hlist_bl_set_first, "_ZL18hlist_bl_set_firstP13hlist_bl_headP13hlist_bl_node");

   function hlist_bl_empty (h : access constant hlist_bl_head) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:71
   pragma Import (CPP, hlist_bl_empty, "_ZL14hlist_bl_emptyPK13hlist_bl_head");

   procedure hlist_bl_add_head (n : access hlist_bl_node; h : access hlist_bl_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:76
   pragma Import (CPP, hlist_bl_add_head, "_ZL17hlist_bl_add_headP13hlist_bl_nodeP13hlist_bl_head");

   --  skipped func __hlist_bl_del

  -- pprev may be `first`, so be careful not to lose the lock bit  
   procedure hlist_bl_del (n : access hlist_bl_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:103
   pragma Import (CPP, hlist_bl_del, "_ZL12hlist_bl_delP13hlist_bl_node");

   procedure hlist_bl_del_init (n : access hlist_bl_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:110
   pragma Import (CPP, hlist_bl_del_init, "_ZL17hlist_bl_del_initP13hlist_bl_node");

   procedure hlist_bl_lock (b : access hlist_bl_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:118
   pragma Import (CPP, hlist_bl_lock, "_ZL13hlist_bl_lockP13hlist_bl_head");

   procedure hlist_bl_unlock (b : access hlist_bl_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:123
   pragma Import (CPP, hlist_bl_unlock, "_ZL15hlist_bl_unlockP13hlist_bl_head");

   function hlist_bl_is_locked (b : access hlist_bl_head) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_bl.h:128
   pragma Import (CPP, hlist_bl_is_locked, "_ZL18hlist_bl_is_lockedP13hlist_bl_head");

  --*
  -- * hlist_bl_for_each_entry	- iterate over list of given type
  -- * @tpos:	the type * to use as a loop cursor.
  -- * @pos:	the &struct hlist_node to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the hlist_node within the struct.
  -- *
  --  

  --*
  -- * hlist_bl_for_each_entry_safe - iterate over list of given type safe against removal of list entry
  -- * @tpos:	the type * to use as a loop cursor.
  -- * @pos:	the &struct hlist_node to use as a loop cursor.
  -- * @n:		another &struct hlist_node to use as temporary storage
  -- * @head:	the head for your list.
  -- * @member:	the name of the hlist_node within the struct.
  --  

end linux_list_bl_h;

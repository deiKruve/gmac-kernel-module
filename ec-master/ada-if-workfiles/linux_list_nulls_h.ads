pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package linux_list_nulls_h is

   --  arg-macro: function INIT_HLIST_NULLS_HEAD ((ptr).first := (struct hlist_nulls_node *) (1UL or (((long)nulls) << 1))
   --    return (ptr).first := (struct hlist_nulls_node *) (1UL or (((long)nulls) << 1));
   --  arg-macro: procedure hlist_nulls_entry container_of(ptr,type,member)
   --    container_of(ptr,type,member)
   --  arg-macro: procedure hlist_nulls_for_each_entry for (pos := (head).first; (notis_a_nulls(pos))  and then  ({ tpos := hlist_nulls_entry(pos, typeof(*tpos), member); 1;}); pos := pos.next)
   --    for (pos := (head).first; (notis_a_nulls(pos))  and then  ({ tpos := hlist_nulls_entry(pos, typeof(*tpos), member); 1;}); pos := pos.next)
   --  arg-macro: procedure hlist_nulls_for_each_entry_from for (; (notis_a_nulls(pos))  and then  ({ tpos := hlist_nulls_entry(pos, typeof(*tpos), member); 1;}); pos := pos.next)
   --    for (; (notis_a_nulls(pos))  and then  ({ tpos := hlist_nulls_entry(pos, typeof(*tpos), member); 1;}); pos := pos.next)
  -- * Special version of lists, where end of list is not a NULL pointer,
  -- * but a 'nulls' marker, which can have many different values.
  -- * (up to 2^31 different values guaranteed on all platforms)
  -- *
  -- * In the standard hlist, termination of a list is the NULL pointer.
  -- * In this special 'nulls' variant, we use the fact that objects stored in
  -- * a list are aligned on a word (4 or 8 bytes alignment).
  -- * We therefore use the last significant bit of 'ptr' :
  -- * Set to 1 : This is a 'nulls' end-of-list marker (ptr >> 1)
  -- * Set to 0 : This is a pointer to some object (ptr)
  --  

   type hlist_nulls_node;
   type hlist_nulls_head is record
      first : access hlist_nulls_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:18
   end record;
   pragma Convention (C_Pass_By_Copy, hlist_nulls_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:17

   type hlist_nulls_node is record
      next : access hlist_nulls_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:22
      pprev : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:22
   end record;
   pragma Convention (C_Pass_By_Copy, hlist_nulls_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:21

  --*
  -- * ptr_is_a_nulls - Test if a ptr is a nulls
  -- * @ptr: ptr to be tested
  -- *
  --  

   function is_a_nulls (ptr : access constant hlist_nulls_node) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:33
   pragma Import (CPP, is_a_nulls, "_ZL10is_a_nullsPK16hlist_nulls_node");

  --*
  -- * get_nulls_value - Get the 'nulls' value of the end of chain
  -- * @ptr: end of chain
  -- *
  -- * Should be called only if is_a_nulls(ptr);
  --  

   function get_nulls_value (ptr : access constant hlist_nulls_node) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:44
   pragma Import (CPP, get_nulls_value, "_ZL15get_nulls_valuePK16hlist_nulls_node");

   function hlist_nulls_unhashed (h : access constant hlist_nulls_node) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:49
   pragma Import (CPP, hlist_nulls_unhashed, "_ZL20hlist_nulls_unhashedPK16hlist_nulls_node");

   function hlist_nulls_empty (h : access constant hlist_nulls_head) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:54
   pragma Import (CPP, hlist_nulls_empty, "_ZL17hlist_nulls_emptyPK16hlist_nulls_head");

   procedure hlist_nulls_add_head (n : access hlist_nulls_node; h : access hlist_nulls_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:59
   pragma Import (CPP, hlist_nulls_add_head, "_ZL20hlist_nulls_add_headP16hlist_nulls_nodeP16hlist_nulls_head");

   --  skipped func __hlist_nulls_del

   procedure hlist_nulls_del (n : access hlist_nulls_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/list_nulls.h:80
   pragma Import (CPP, hlist_nulls_del, "_ZL15hlist_nulls_delP16hlist_nulls_node");

  --*
  -- * hlist_nulls_for_each_entry	- iterate over list of given type
  -- * @tpos:	the type * to use as a loop cursor.
  -- * @pos:	the &struct hlist_node to use as a loop cursor.
  -- * @head:	the head for your list.
  -- * @member:	the name of the hlist_node within the struct.
  -- *
  --  

  --*
  -- * hlist_nulls_for_each_entry_from - iterate over a hlist continuing from current point
  -- * @tpos:	the type * to use as a loop cursor.
  -- * @pos:	the &struct hlist_node to use as a loop cursor.
  -- * @member:	the name of the hlist_node within the struct.
  -- *
  --  

end linux_list_nulls_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;

package linux_plist_h is

   --  arg-macro: procedure PLIST_HEAD_INIT { .node_list := LIST_HEAD_INIT((head).node_list) }
   --    { .node_list := LIST_HEAD_INIT((head).node_list) }
   --  arg-macro: procedure PLIST_HEAD struct plist_head head := PLIST_HEAD_INIT(head)
   --    struct plist_head head := PLIST_HEAD_INIT(head)
   --  arg-macro: procedure PLIST_NODE_INIT { .prio := (__prio), .prio_list := LIST_HEAD_INIT((node).prio_list), .node_list := LIST_HEAD_INIT((node).node_list), }
   --    { .prio := (__prio), .prio_list := LIST_HEAD_INIT((node).prio_list), .node_list := LIST_HEAD_INIT((node).node_list), }
   --  arg-macro: procedure plist_for_each list_for_each_entry(pos, and(head).node_list, node_list)
   --    list_for_each_entry(pos, and(head).node_list, node_list)
   --  arg-macro: procedure plist_for_each_continue list_for_each_entry_continue(pos, and(head).node_list, node_list)
   --    list_for_each_entry_continue(pos, and(head).node_list, node_list)
   --  arg-macro: procedure plist_for_each_safe list_for_each_entry_safe(pos, n, and(head).node_list, node_list)
   --    list_for_each_entry_safe(pos, n, and(head).node_list, node_list)
   --  arg-macro: procedure plist_for_each_entry list_for_each_entry(pos, and(head).node_list, mem.node_list)
   --    list_for_each_entry(pos, and(head).node_list, mem.node_list)
   --  arg-macro: procedure plist_for_each_entry_continue list_for_each_entry_continue(pos, and(head).node_list, m.node_list)
   --    list_for_each_entry_continue(pos, and(head).node_list, m.node_list)
   --  arg-macro: procedure plist_for_each_entry_safe list_for_each_entry_safe(pos, n, and(head).node_list, m.node_list)
   --    list_for_each_entry_safe(pos, n, and(head).node_list, m.node_list)
   --  arg-macro: procedure plist_first_entry container_of(plist_first(head), type, member)
   --    container_of(plist_first(head), type, member)
   --  arg-macro: procedure plist_last_entry container_of(plist_last(head), type, member)
   --    container_of(plist_last(head), type, member)
   --  arg-macro: procedure plist_next list_next_entry(pos, node_list)
   --    list_next_entry(pos, node_list)
   --  arg-macro: procedure plist_prev list_prev_entry(pos, node_list)
   --    list_prev_entry(pos, node_list)
  -- * Descending-priority-sorted double-linked list
  -- *
  -- * (C) 2002-2003 Intel Corp
  -- * Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>.
  -- *
  -- * 2001-2005 (c) MontaVista Software, Inc.
  -- * Daniel Walker <dwalker@mvista.com>
  -- *
  -- * (C) 2005 Thomas Gleixner <tglx@linutronix.de>
  -- *
  -- * Simplifications of the original code by
  -- * Oleg Nesterov <oleg@tv-sign.ru>
  -- *
  -- * Licensed under the FSF's GNU Public License v2 or later.
  -- *
  -- * Based on simple lists (include/linux/list.h).
  -- *
  -- * This is a priority-sorted list of nodes; each node has a
  -- * priority from INT_MIN (highest) to INT_MAX (lowest).
  -- *
  -- * Addition is O(K), removal is O(1), change of priority of a node is
  -- * O(K) and K is the number of RT priority levels used in the system.
  -- * (1 <= K <= 99)
  -- *
  -- * This list is really a list of lists:
  -- *
  -- *  - The tier 1 list is the prio_list, different priority nodes.
  -- *
  -- *  - The tier 2 list is the node_list, serialized nodes.
  -- *
  -- * Simple ASCII art explanation:
  -- *
  -- * pl:prio_list (only for plist_node)
  -- * nl:node_list
  -- *   HEAD|             NODE(S)
  -- *       |
  -- *       ||------------------------------------|
  -- *       ||->|pl|<->|pl|<--------------->|pl|<-|
  -- *       |   |10|   |21|   |21|   |21|   |40|   (prio)
  -- *       |   |  |   |  |   |  |   |  |   |  |
  -- *       |   |  |   |  |   |  |   |  |   |  |
  -- * |->|nl|<->|nl|<->|nl|<->|nl|<->|nl|<->|nl|<-|
  -- * |-------------------------------------------|
  -- *
  -- * The nodes on the prio_list list are sorted by priority to simplify
  -- * the insertion of new nodes. There are no nodes with duplicate
  -- * priorites on the list.
  -- *
  -- * The nodes on the node_list are ordered by priority and can contain
  -- * entries which have the same priority. Those entries are ordered
  -- * FIFO
  -- *
  -- * Addition means: look for the prio_list node in the prio_list
  -- * for the priority of the node and insert it before the node_list
  -- * entry of the next prio_list node. If it is the first node of
  -- * that priority, add it to the prio_list in the right position and
  -- * insert it into the serialized node_list list
  -- *
  -- * Removal means remove it from the node_list and remove it from
  -- * the prio_list if the node_list list_head is non empty. In case
  -- * of removal from the prio_list it must be checked whether other
  -- * entries of the same priority are on the list or not. If there
  -- * is another entry of the same priority then this entry has to
  -- * replace the removed entry on the prio_list. If the entry which
  -- * is removed is the only entry of this priority then a simple
  -- * remove from both list is sufficient.
  -- *
  -- * INT_MIN is the highest priority, 0 is the medium highest, INT_MAX
  -- * is lowest priority.
  -- *
  -- * No locking is done, up to the caller.
  -- *
  --  

   type plist_head is record
      node_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:82
   end record;
   pragma Convention (C_Pass_By_Copy, plist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:81

   type plist_node is record
      prio : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:86
      prio_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:87
      node_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:88
   end record;
   pragma Convention (C_Pass_By_Copy, plist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:85

  --*
  -- * PLIST_HEAD_INIT - static struct plist_head initializer
  -- * @head:	struct plist_head variable name
  --  

  --*
  -- * PLIST_HEAD - declare and init plist_head
  -- * @head:	name for struct plist_head variable
  --  

  --*
  -- * PLIST_NODE_INIT - static struct plist_node initializer
  -- * @node:	struct plist_node variable name
  -- * @__prio:	initial node priority
  --  

  --*
  -- * plist_head_init - dynamic struct plist_head initializer
  -- * @head:	&struct plist_head pointer
  --  

   procedure plist_head_init (head : access plist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:124
   pragma Import (CPP, plist_head_init, "_ZL15plist_head_initP10plist_head");

  --*
  -- * plist_node_init - Dynamic struct plist_node initializer
  -- * @node:	&struct plist_node pointer
  -- * @prio:	initial node priority
  --  

   procedure plist_node_init (node : access plist_node; prio : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:134
   pragma Import (CPP, plist_node_init, "_ZL15plist_node_initP10plist_nodei");

   procedure plist_add (node : access plist_node; head : access plist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:141
   pragma Import (CPP, plist_add, "_Z9plist_addP10plist_nodeP10plist_head");

   procedure plist_del (node : access plist_node; head : access plist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:142
   pragma Import (CPP, plist_del, "_Z9plist_delP10plist_nodeP10plist_head");

   procedure plist_requeue (node : access plist_node; head : access plist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:144
   pragma Import (CPP, plist_requeue, "_Z13plist_requeueP10plist_nodeP10plist_head");

  --*
  -- * plist_for_each - iterate over the plist
  -- * @pos:	the type * to use as a loop counter
  -- * @head:	the head for your list
  --  

  --*
  -- * plist_for_each_continue - continue iteration over the plist
  -- * @pos:	the type * to use as a loop cursor
  -- * @head:	the head for your list
  -- *
  -- * Continue to iterate over plist, continuing after the current position.
  --  

  --*
  -- * plist_for_each_safe - iterate safely over a plist of given type
  -- * @pos:	the type * to use as a loop counter
  -- * @n:	another type * to use as temporary storage
  -- * @head:	the head for your list
  -- *
  -- * Iterate over a plist of given type, safe against removal of list entry.
  --  

  --*
  -- * plist_for_each_entry	- iterate over list of given type
  -- * @pos:	the type * to use as a loop counter
  -- * @head:	the head for your list
  -- * @mem:	the name of the list_struct within the struct
  --  

  --*
  -- * plist_for_each_entry_continue - continue iteration over list of given type
  -- * @pos:	the type * to use as a loop cursor
  -- * @head:	the head for your list
  -- * @m:		the name of the list_struct within the struct
  -- *
  -- * Continue to iterate over list of given type, continuing after
  -- * the current position.
  --  

  --*
  -- * plist_for_each_entry_safe - iterate safely over list of given type
  -- * @pos:	the type * to use as a loop counter
  -- * @n:		another type * to use as temporary storage
  -- * @head:	the head for your list
  -- * @m:		the name of the list_struct within the struct
  -- *
  -- * Iterate over list of given type, safe against removal of list entry.
  --  

  --*
  -- * plist_head_empty - return !0 if a plist_head is empty
  -- * @head:	&struct plist_head pointer
  --  

   function plist_head_empty (head : access constant plist_head) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:212
   pragma Import (CPP, plist_head_empty, "_ZL16plist_head_emptyPK10plist_head");

  --*
  -- * plist_node_empty - return !0 if plist_node is not on a list
  -- * @node:	&struct plist_node pointer
  --  

   function plist_node_empty (node : access constant plist_node) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:221
   pragma Import (CPP, plist_node_empty, "_ZL16plist_node_emptyPK10plist_node");

  -- All functions below assume the plist_head is not empty.  
  --*
  -- * plist_first_entry - get the struct for the first entry
  -- * @head:	the &struct plist_head pointer
  -- * @type:	the type of the struct this is embedded in
  -- * @member:	the name of the list_struct within the struct
  --  

  --*
  -- * plist_last_entry - get the struct for the last entry
  -- * @head:	the &struct plist_head pointer
  -- * @type:	the type of the struct this is embedded in
  -- * @member:	the name of the list_struct within the struct
  --  

  --*
  -- * plist_next - get the next entry in list
  -- * @pos:	the type * to cursor
  --  

  --*
  -- * plist_prev - get the prev entry in list
  -- * @pos:	the type * to cursor
  --  

  --*
  -- * plist_first - return the first node (and thus, highest priority)
  -- * @head:	the &struct plist_head pointer
  -- *
  -- * Assumes the plist is _not_ empty.
  --  

   function plist_first (head : access constant plist_head) return access plist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:282
   pragma Import (CPP, plist_first, "_ZL11plist_firstPK10plist_head");

  --*
  -- * plist_last - return the last node (and thus, lowest priority)
  -- * @head:	the &struct plist_head pointer
  -- *
  -- * Assumes the plist is _not_ empty.
  --  

   function plist_last (head : access constant plist_head) return access plist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/plist.h:294
   pragma Import (CPP, plist_last, "_ZL10plist_lastPK10plist_head");

end linux_plist_h;

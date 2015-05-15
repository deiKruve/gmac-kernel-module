pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package linux_llist_h is

   --  arg-macro: procedure LLIST_HEAD_INIT { NULL }
   --    { NULL }
   --  arg-macro: procedure LLIST_HEAD struct llist_head name := LLIST_HEAD_INIT(name)
   --    struct llist_head name := LLIST_HEAD_INIT(name)
   --  arg-macro: procedure llist_entry container_of(ptr, type, member)
   --    container_of(ptr, type, member)
   --  arg-macro: procedure llist_for_each for ((pos) := (node); pos; (pos) := (pos).next)
   --    for ((pos) := (node); pos; (pos) := (pos).next)
   --  arg-macro: procedure llist_for_each_entry for ((pos) := llist_entry((node), typeof(*(pos)), member); and(pos).member /= NULL; (pos) := llist_entry((pos).member.next, typeof(*(pos)), member))
   --    for ((pos) := llist_entry((node), typeof(*(pos)), member); and(pos).member /= NULL; (pos) := llist_entry((pos).member.next, typeof(*(pos)), member))
   --  arg-macro: procedure llist_for_each_entry_safe for (pos := llist_entry((node), typeof(*pos), member); andpos.member /= NULL  and then  (n := llist_entry(pos.member.next, typeof(*n), member), true); pos := n)
   --    for (pos := llist_entry((node), typeof(*pos), member); andpos.member /= NULL  and then  (n := llist_entry(pos.member.next, typeof(*n), member), true); pos := n)
  -- * Lock-less NULL terminated single linked list
  -- *
  -- * If there are multiple producers and multiple consumers, llist_add
  -- * can be used in producers and llist_del_all can be used in
  -- * consumers.  They can work simultaneously without lock.  But
  -- * llist_del_first can not be used here.  Because llist_del_first
  -- * depends on list->first->next does not changed if list->first is not
  -- * changed during its operation, but llist_del_first, llist_add,
  -- * llist_add (or llist_del_all, llist_add, llist_add) sequence in
  -- * another consumer may violate that.
  -- *
  -- * If there are multiple producers and one consumer, llist_add can be
  -- * used in producers and llist_del_all or llist_del_first can be used
  -- * in the consumer.
  -- *
  -- * This can be summarized as follow:
  -- *
  -- *           |   add    | del_first |  del_all
  -- * add       |    -     |     -     |     -
  -- * del_first |          |     L     |     L
  -- * del_all   |          |           |     -
  -- *
  -- * Where "-" stands for no lock is needed, while "L" stands for lock
  -- * is needed.
  -- *
  -- * The list entries deleted via llist_del_all can be traversed with
  -- * traversing function such as llist_for_each etc.  But the list
  -- * entries can not be traversed safely before deleted from the list.
  -- * The order of deleted entries is from the newest to the oldest added
  -- * one.  If you want to traverse from the oldest to the newest, you
  -- * must reverse the order by yourself before traversing.
  -- *
  -- * The basic atomic operation of this list is cmpxchg on long.  On
  -- * architectures that don't have NMI-safe cmpxchg implementation, the
  -- * list can NOT be used in NMI handlers.  So code that uses the list in
  -- * an NMI handler should depend on CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG.
  -- *
  -- * Copyright 2010,2011 Intel Corp.
  -- *   Author: Huang Ying <ying.huang@intel.com>
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public License version
  -- * 2 as published by the Free Software Foundation;
  -- *
  -- * This program is distributed in the hope that it will be useful,
  -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- * GNU General Public License for more details.
  -- *
  -- * You should have received a copy of the GNU General Public License
  -- * along with this program; if not, write to the Free Software
  -- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  --  

   type llist_node;
   type llist_head is record
      first : access llist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:62
   end record;
   pragma Convention (C_Pass_By_Copy, llist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:61

   type llist_node is record
      next : access llist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:66
   end record;
   pragma Convention (C_Pass_By_Copy, llist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:65

  --*
  -- * init_llist_head - initialize lock-less list head
  -- * @head:	the head for your lock-less list
  --  

   procedure init_llist_head (list : access llist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:76
   pragma Import (CPP, init_llist_head, "_ZL15init_llist_headP10llist_head");

  --*
  -- * llist_entry - get the struct of this entry
  -- * @ptr:	the &struct llist_node pointer.
  -- * @type:	the type of the struct this is embedded in.
  -- * @member:	the name of the llist_node within the struct.
  --  

  --*
  -- * llist_for_each - iterate over some deleted entries of a lock-less list
  -- * @pos:	the &struct llist_node to use as a loop cursor
  -- * @node:	the first entry of deleted list entries
  -- *
  -- * In general, some entries of the lock-less list can be traversed
  -- * safely only after being deleted from list, so start with an entry
  -- * instead of list head.
  -- *
  -- * If being used on entries deleted from lock-less list directly, the
  -- * traverse order is from the newest to the oldest added entry.  If
  -- * you want to traverse from the oldest to the newest, you must
  -- * reverse the order by yourself before traversing.
  --  

  --*
  -- * llist_for_each_entry - iterate over some deleted entries of lock-less list of given type
  -- * @pos:	the type * to use as a loop cursor.
  -- * @node:	the fist entry of deleted list entries.
  -- * @member:	the name of the llist_node with the struct.
  -- *
  -- * In general, some entries of the lock-less list can be traversed
  -- * safely only after being removed from list, so start with an entry
  -- * instead of list head.
  -- *
  -- * If being used on entries deleted from lock-less list directly, the
  -- * traverse order is from the newest to the oldest added entry.  If
  -- * you want to traverse from the oldest to the newest, you must
  -- * reverse the order by yourself before traversing.
  --  

  --*
  -- * llist_for_each_entry_safe - iterate over some deleted entries of lock-less list of given type
  -- *			       safe against removal of list entry
  -- * @pos:	the type * to use as a loop cursor.
  -- * @n:		another type * to use as temporary storage
  -- * @node:	the first entry of deleted list entries.
  -- * @member:	the name of the llist_node with the struct.
  -- *
  -- * In general, some entries of the lock-less list can be traversed
  -- * safely only after being removed from list, so start with an entry
  -- * instead of list head.
  -- *
  -- * If being used on entries deleted from lock-less list directly, the
  -- * traverse order is from the newest to the oldest added entry.  If
  -- * you want to traverse from the oldest to the newest, you must
  -- * reverse the order by yourself before traversing.
  --  

  --*
  -- * llist_empty - tests whether a lock-less list is empty
  -- * @head:	the list to test
  -- *
  -- * Not guaranteed to be accurate or up to date.  Just a quick way to
  -- * test whether the list is empty without deleting something from the
  -- * list.
  --  

   function llist_empty (head : access constant llist_head) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:158
   pragma Import (CPP, llist_empty, "_ZL11llist_emptyPK10llist_head");

   function llist_next (node : access llist_node) return access llist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:163
   pragma Import (CPP, llist_next, "_ZL10llist_nextP10llist_node");

   function llist_add_batch
     (new_first : access llist_node;
      new_last : access llist_node;
      head : access llist_head) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:168
   pragma Import (CPP, llist_add_batch, "_Z15llist_add_batchP10llist_nodeS0_P10llist_head");

  --*
  -- * llist_add - add a new entry
  -- * @new:	new entry to be added
  -- * @head:	the head for your lock-less list
  -- *
  -- * Returns true if the list was empty prior to adding this entry.
  --  

   function llist_add (arg1 : access llist_node) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:178
   pragma Import (CPP, llist_add, "_ZL9llist_addP10llist_node");

  --*
  -- * llist_del_all - delete all entries from lock-less list
  -- * @head:	the head of lock-less list to delete all entries
  -- *
  -- * If list is empty, return NULL, otherwise, delete all entries and
  -- * return the pointer to the first entry.  The order of entries
  -- * deleted is from the newest to the oldest added one.
  --  

   function llist_del_all (head : access llist_head) return access llist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:191
   pragma Import (CPP, llist_del_all, "_ZL13llist_del_allP10llist_head");

   function llist_del_first (head : access llist_head) return access llist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:196
   pragma Import (CPP, llist_del_first, "_Z15llist_del_firstP10llist_head");

   function llist_reverse_order (head : access llist_node) return access llist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/llist.h:198
   pragma Import (CPP, llist_reverse_order, "_Z19llist_reverse_orderP10llist_node");

end linux_llist_h;

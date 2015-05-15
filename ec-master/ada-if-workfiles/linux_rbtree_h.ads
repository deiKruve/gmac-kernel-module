pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package linux_rbtree_h is

   --  arg-macro: function rb_parent ((struct rb_node *)((r).__rb_parent_color and ~3)
   --    return (struct rb_node *)((r).__rb_parent_color and ~3);
   --  unsupported macro: RB_ROOT (struct rb_root) { NULL, }
   --  arg-macro: procedure rb_entry container_of(ptr, type, member)
   --    container_of(ptr, type, member)
   --  arg-macro: function RB_EMPTY_ROOT ((root).rb_node = NULL
   --    return (root).rb_node = NULL;
   --  arg-macro: function RB_EMPTY_NODE ((node).__rb_parent_color = (unsigned long)(node)
   --    return (node).__rb_parent_color = (unsigned long)(node);
   --  arg-macro: function RB_CLEAR_NODE ((node).__rb_parent_color := (unsigned long)(node)
   --    return (node).__rb_parent_color := (unsigned long)(node);
   --  arg-macro: function rb_entry_safe ({ typeof(ptr) ____ptr := (ptr); ____ptr ? rb_entry(____ptr, type, member) : NULL; }
   --    return { typeof(ptr) ____ptr := (ptr); ____ptr ? rb_entry(____ptr, type, member) : NULL; };
   --  arg-macro: procedure rbtree_postorder_for_each_entry_safe for (pos := rb_entry_safe(rb_first_postorder(root), typeof(*pos), field); pos  and then  ({ n := rb_entry_safe(rb_next_postorder(andpos.field), typeof(*pos), field); 1; }); pos := n)
   --    for (pos := rb_entry_safe(rb_first_postorder(root), typeof(*pos), field); pos  and then  ({ n := rb_entry_safe(rb_next_postorder(andpos.field), typeof(*pos), field); 1; }); pos := n)
  --  Red Black Trees
  --  (C) 1999  Andrea Arcangeli <andrea@suse.de>
  --  
  --  This program is free software; you can redistribute it and/or modify
  --  it under the terms of the GNU General Public License as published by
  --  the Free Software Foundation; either version 2 of the License, or
  --  (at your option) any later version.
  --  This program is distributed in the hope that it will be useful,
  --  but WITHOUT ANY WARRANTY; without even the implied warranty of
  --  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  --  GNU General Public License for more details.
  --  You should have received a copy of the GNU General Public License
  --  along with this program; if not, write to the Free Software
  --  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  --  linux/include/linux/rbtree.h
  --  To use rbtrees you'll have to implement your own insert and search cores.
  --  This will avoid us to use callbacks and to drop drammatically performances.
  --  I know it's not the cleaner way,  but in C (not in C++) to get
  --  performances and genericity...
  --  See Documentation/rbtree.txt for documentation and samples.
  -- 

   type rb_node is record
      uu_rb_parent_color : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:36
      rb_right : access rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:37
      rb_left : access rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, rb_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:35

  -- The alignment might seem pointless, but allegedly CRIS needs it  
   type rb_root is record
      the_rb_node : access rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:43
   end record;
   pragma Convention (C_Pass_By_Copy, rb_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:42

  -- 'empty' nodes are nodes that are known not to be inserted in an rbree  
   procedure rb_insert_color (arg1 : access rb_node; arg2 : access rb_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:61
   pragma Import (CPP, rb_insert_color, "_Z15rb_insert_colorP7rb_nodeP7rb_root");

   procedure rb_erase (arg1 : access rb_node; arg2 : access rb_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:62
   pragma Import (CPP, rb_erase, "_Z8rb_eraseP7rb_nodeP7rb_root");

  -- Find logical next and previous nodes in a tree  
   function rb_next (arg1 : access constant rb_node) return access rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:66
   pragma Import (CPP, rb_next, "_Z7rb_nextPK7rb_node");

   function rb_prev (arg1 : access constant rb_node) return access rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:67
   pragma Import (CPP, rb_prev, "_Z7rb_prevPK7rb_node");

   function rb_first (arg1 : access constant rb_root) return access rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:68
   pragma Import (CPP, rb_first, "_Z8rb_firstPK7rb_root");

   function rb_last (arg1 : access constant rb_root) return access rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:69
   pragma Import (CPP, rb_last, "_Z7rb_lastPK7rb_root");

  -- Postorder iteration - always visit the parent after its children  
   function rb_first_postorder (arg1 : access constant rb_root) return access rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:72
   pragma Import (CPP, rb_first_postorder, "_Z18rb_first_postorderPK7rb_root");

   function rb_next_postorder (arg1 : access constant rb_node) return access rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:73
   pragma Import (CPP, rb_next_postorder, "_Z17rb_next_postorderPK7rb_node");

  -- Fast replacement of a single node without remove/rebalance/add/rebalance  
   procedure rb_replace_node (victim : access rb_node; arg2 : access rb_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:76
   pragma Import (CPP, rb_replace_node, "_Z15rb_replace_nodeP7rb_nodeS0_");

   procedure rb_link_node
     (node : access rb_node;
      parent : access rb_node;
      rb_link : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/rbtree.h:79
   pragma Import (CPP, rb_link_node, "_ZL12rb_link_nodeP7rb_nodeS0_PS0_");

  --*
  -- * rbtree_postorder_for_each_entry_safe - iterate over rb_root in post order of
  -- * given type safe against removal of rb_node entry
  -- *
  -- * @pos:	the 'type *' to use as a loop cursor.
  -- * @n:		another 'type *' to use as temporary storage
  -- * @root:	'rb_root *' of the rbtree.
  -- * @field:	the name of the rb_node field within 'type'.
  --  

end linux_rbtree_h;

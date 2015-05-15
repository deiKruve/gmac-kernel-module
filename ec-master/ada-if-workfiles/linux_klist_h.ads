pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_spinlock_types_h;
with linux_types_h;
with System;
with linux_kref_h;

package linux_klist_h is

   --  arg-macro: procedure KLIST_INIT { .k_lock := __SPIN_LOCK_UNLOCKED(_name.k_lock), .k_list := LIST_HEAD_INIT(_name.k_list), .get := _get, .put := _put, }
   --    { .k_lock := __SPIN_LOCK_UNLOCKED(_name.k_lock), .k_list := LIST_HEAD_INIT(_name.k_list), .get := _get, .put := _put, }
   --  arg-macro: procedure DEFINE_KLIST struct klist _name := KLIST_INIT(_name, _get, _put)
   --    struct klist _name := KLIST_INIT(_name, _get, _put)
  -- *	klist.h - Some generic list helpers, extending struct list_head a bit.
  -- *
  -- *	Implementations are found in lib/klist.c
  -- *
  -- *
  -- *	Copyright (C) 2005 Patrick Mochel
  -- *
  -- *	This file is rleased under the GPL v2.
  --  

   type klist is record
      k_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:21
      k_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:22
      get : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:23
      put : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, klist);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:20

   procedure klist_init
     (k : access klist;
      get : access procedure (arg1 : System.Address);
      put : access procedure (arg1 : System.Address));  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:36
   pragma Import (CPP, klist_init, "_Z10klist_initP5klistPFvP10klist_nodeES4_");

  -- never access directly  
   type klist_node is record
      n_klist : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:40
      n_node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:41
      n_ref : aliased linux_kref_h.kref;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:42
   end record;
   pragma Convention (C_Pass_By_Copy, klist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:39

   procedure klist_add_tail (n : access klist_node; k : access klist);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:45
   pragma Import (CPP, klist_add_tail, "_Z14klist_add_tailP10klist_nodeP5klist");

   procedure klist_add_head (n : access klist_node; k : access klist);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:46
   pragma Import (CPP, klist_add_head, "_Z14klist_add_headP10klist_nodeP5klist");

   procedure klist_add_after (n : access klist_node; pos : access klist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:47
   pragma Import (CPP, klist_add_after, "_Z15klist_add_afterP10klist_nodeS0_");

   procedure klist_add_before (n : access klist_node; pos : access klist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:48
   pragma Import (CPP, klist_add_before, "_Z16klist_add_beforeP10klist_nodeS0_");

   procedure klist_del (n : access klist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:50
   pragma Import (CPP, klist_del, "_Z9klist_delP10klist_node");

   procedure klist_remove (n : access klist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:51
   pragma Import (CPP, klist_remove, "_Z12klist_removeP10klist_node");

   function klist_node_attached (n : access klist_node) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:53
   pragma Import (CPP, klist_node_attached, "_Z19klist_node_attachedP10klist_node");

   type klist_iter is record
      i_klist : access klist;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:57
      i_cur : access klist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:58
   end record;
   pragma Convention (C_Pass_By_Copy, klist_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:56

   procedure klist_iter_init (k : access klist; i : access klist_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:62
   pragma Import (CPP, klist_iter_init, "_Z15klist_iter_initP5klistP10klist_iter");

   procedure klist_iter_init_node
     (k : access klist;
      i : access klist_iter;
      n : access klist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:63
   pragma Import (CPP, klist_iter_init_node, "_Z20klist_iter_init_nodeP5klistP10klist_iterP10klist_node");

   procedure klist_iter_exit (i : access klist_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:65
   pragma Import (CPP, klist_iter_exit, "_Z15klist_iter_exitP10klist_iter");

   function klist_next (i : access klist_iter) return access klist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/klist.h:66
   pragma Import (CPP, klist_next, "_Z10klist_nextP10klist_iter");

end linux_klist_h;

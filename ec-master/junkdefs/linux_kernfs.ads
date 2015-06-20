
with System;
with Interfaces.C.Strings;
with Linux_Types;
with Linux_Rbtree;


package Linux_Kernfs is
   
   type Kernfs_Node;
   type Anon_41 is
      record  -- just for size its a union actually
         Ops : System.Address;
         open : System.Address;
         size : aliased linux_types.loff_t;
         notify_next : access kernfs_node;
      end record;
   pragma Convention (C_Pass_By_Copy, Anon_41);
   
   type kernfs_node is record
      count : aliased linux_types.atomic_t;
      active : aliased linux_types.atomic_t;
      parent : access kernfs_node;
      name : Interfaces.C.Strings.chars_ptr;
      rb : aliased linux_rbtree.rb_node;
      ns : System.Address;
      hash : aliased Interfaces.C.unsigned;
      field_8 : aliased anon_41;
      priv : System.Address;
      flags : aliased Interfaces.C.unsigned_short;
      mode : aliased linux_types.umode_t;
      ino : aliased unsigned;
      iattr : System.Address;
   end record;
   pragma Convention (C_Pass_By_Copy, kernfs_node);
   
end Linux_Kernfs;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
-- with System;

package Linux_Rbtree is

   type rb_node is record
      uu_rb_parent_color : aliased unsigned_long;
      rb_right           : access rb_node;
      rb_left            : access rb_node;
   end record;
   pragma Convention (C_Pass_By_Copy, rb_node);

   type rb_root is record
      the_rb_node : access rb_node;
   end record;
   pragma Convention (C_Pass_By_Copy, rb_root);

end Linux_Rbtree;

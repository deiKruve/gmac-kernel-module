pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Linux_Rbtree;
with Linux_Ktime;

package Linux_Timerqueue is

   type timerqueue_node is record
      node    : aliased Linux_Rbtree.rb_node;
      expires : Linux_Ktime.ktime_t;
   end record;
   pragma Convention (C_Pass_By_Copy, timerqueue_node);

   type timerqueue_head is record
      head : aliased Linux_Rbtree.rb_root;
      next : access timerqueue_node;
   end record;
   pragma Convention (C_Pass_By_Copy, timerqueue_head);

end Linux_Timerqueue;

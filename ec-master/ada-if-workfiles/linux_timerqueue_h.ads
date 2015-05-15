pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_rbtree_h;
with linux_ktime_h;

package linux_timerqueue_h is

   type timerqueue_node is record
      node : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:9
      expires : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:10
   end record;
   pragma Convention (C_Pass_By_Copy, timerqueue_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:8

   type timerqueue_head is record
      head : aliased linux_rbtree_h.rb_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:14
      next : access timerqueue_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:15
   end record;
   pragma Convention (C_Pass_By_Copy, timerqueue_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:13

   procedure timerqueue_add (head : access timerqueue_head; node : access timerqueue_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:19
   pragma Import (CPP, timerqueue_add, "_Z14timerqueue_addP15timerqueue_headP15timerqueue_node");

   procedure timerqueue_del (head : access timerqueue_head; node : access timerqueue_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:21
   pragma Import (CPP, timerqueue_del, "_Z14timerqueue_delP15timerqueue_headP15timerqueue_node");

   function timerqueue_iterate_next (node : access timerqueue_node) return access timerqueue_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:23
   pragma Import (CPP, timerqueue_iterate_next, "_Z23timerqueue_iterate_nextP15timerqueue_node");

  --*
  -- * timerqueue_getnext - Returns the timer with the earliest expiration time
  -- *
  -- * @head: head of timerqueue
  -- *
  -- * Returns a pointer to the timer node that has the
  -- * earliest expiration time.
  --  

   function timerqueue_getnext (head : access timerqueue_head) return access timerqueue_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:35
   pragma Import (CPP, timerqueue_getnext, "_ZL18timerqueue_getnextP15timerqueue_head");

   procedure timerqueue_init (node : access timerqueue_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:40
   pragma Import (CPP, timerqueue_init, "_ZL15timerqueue_initP15timerqueue_node");

   procedure timerqueue_init_head (head : access timerqueue_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timerqueue.h:45
   pragma Import (CPP, timerqueue_init_head, "_ZL20timerqueue_init_headP15timerqueue_head");

end linux_timerqueue_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with linux_sched_h;
with linux_types_h;

package linux_preempt_h is

   --  unsupported macro: PREEMPT_NEED_RESCHED 0x80000000
   --  arg-macro: procedure preempt_count_add __preempt_count_add(val)
   --    __preempt_count_add(val)
   --  arg-macro: procedure preempt_count_sub __preempt_count_sub(val)
   --    __preempt_count_sub(val)
   --  arg-macro: procedure preempt_count_dec_and_test __preempt_count_dec_and_test()
   --    __preempt_count_dec_and_test()
   --  arg-macro: procedure preempt_count_inc preempt_count_add(1)
   --    preempt_count_add(1)
   --  arg-macro: procedure preempt_count_dec preempt_count_sub(1)
   --    preempt_count_sub(1)
   --  arg-macro: procedure preempt_disable barrier()
   --    barrier()
   --  arg-macro: procedure preempt_enable barrier()
   --    barrier()
   --  arg-macro: procedure preempt_disable_notrace barrier()
   --    barrier()
   --  arg-macro: procedure preempt_enable_notrace barrier()
   --    barrier()
   --  arg-macro: procedure preempt_set_need_resched do { set_preempt_need_resched(); } while (0)
   --    do { set_preempt_need_resched(); } while (0)
   --  arg-macro: procedure preempt_fold_need_resched do { if (tif_need_resched()) set_preempt_need_resched(); } while (0)
   --    do { if (tif_need_resched()) set_preempt_need_resched(); } while (0)
  -- * include/linux/preempt.h - macros for accessing and manipulating
  -- * preempt_count (used for kernel preemption, interrupt count, etc.)
  --  

  -- * We use the MSB mostly because its available; see <linux/preempt_mask.h> for
  -- * the other bits -- can't include that header due to inclusion hell.
  --  

  -- * Even if we don't have any preemption, we need preempt disable/enable
  -- * to be barriers, so that we don't have things like get_user/put_user
  -- * that can cause faults and scheduling migrate into our preempt-protected
  -- * region.
  --  

  -- * Modules have no business playing preemption tricks.
  --  

  --*
  -- * preempt_ops - notifiers called when a task is preempted and rescheduled
  -- * @sched_in: we're about to be rescheduled:
  -- *    notifier: struct preempt_notifier for the task being scheduled
  -- *    cpu:  cpu we're scheduled on
  -- * @sched_out: we've just been preempted
  -- *    notifier: struct preempt_notifier for the task being preempted
  -- *    next: the task that's kicking us out
  -- *
  -- * Please note that sched_in and out are called under different
  -- * contexts.  sched_out is called with rq lock held and irq disabled
  -- * while sched_in is called without rq lock and irq enabled.  This
  -- * difference is intentional and depended upon by its users.
  --  

   type preempt_ops is record
      sched_in : access procedure (arg1 : System.Address; arg2 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/preempt.h:166
      sched_out : access procedure (arg1 : System.Address; arg2 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/preempt.h:168
   end record;
   pragma Convention (C_Pass_By_Copy, preempt_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/preempt.h:165

  --*
  -- * preempt_notifier - key for installing preemption notifiers
  -- * @link: internal use
  -- * @ops: defines the notifier functions to be called
  -- *
  -- * Usually used in conjunction with container_of().
  --  

   type preempt_notifier is record
      link : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/preempt.h:179
      ops : access preempt_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/preempt.h:180
   end record;
   pragma Convention (C_Pass_By_Copy, preempt_notifier);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/preempt.h:178

   procedure preempt_notifier_register (notifier : access preempt_notifier);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/preempt.h:183
   pragma Import (CPP, preempt_notifier_register, "_Z25preempt_notifier_registerP16preempt_notifier");

   procedure preempt_notifier_unregister (notifier : access preempt_notifier);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/preempt.h:184
   pragma Import (CPP, preempt_notifier_unregister, "_Z27preempt_notifier_unregisterP16preempt_notifier");

   procedure preempt_notifier_init (notifier : access preempt_notifier; ops : access preempt_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/preempt.h:186
   pragma Import (CPP, preempt_notifier_init, "_ZL21preempt_notifier_initP16preempt_notifierP11preempt_ops");

end linux_preempt_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_hardirq_h is

   --  arg-macro: procedure nmi_enter do { lockdep_off(); ftrace_nmi_enter(); BUG_ON(in_nmi()); preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET); rcu_nmi_enter(); trace_hardirq_enter(); } while (0)
   --    do { lockdep_off(); ftrace_nmi_enter(); BUG_ON(in_nmi()); preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET); rcu_nmi_enter(); trace_hardirq_enter(); } while (0)
   --  arg-macro: procedure nmi_exit do { trace_hardirq_exit(); rcu_nmi_exit(); BUG_ON(notin_nmi()); preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET); ftrace_nmi_exit(); lockdep_on(); } while (0)
   --    do { trace_hardirq_exit(); rcu_nmi_exit(); BUG_ON(notin_nmi()); preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET); ftrace_nmi_exit(); lockdep_on(); } while (0)
   procedure synchronize_irq (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hardirq.h:11
   pragma Import (CPP, synchronize_irq, "_Z15synchronize_irqj");

   procedure synchronize_hardirq (irq : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hardirq.h:12
   pragma Import (CPP, synchronize_hardirq, "_Z19synchronize_hardirqj");

   procedure rcu_nmi_enter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hardirq.h:25
   pragma Import (CPP, rcu_nmi_enter, "_Z13rcu_nmi_enterv");

   procedure rcu_nmi_exit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hardirq.h:26
   pragma Import (CPP, rcu_nmi_exit, "_Z12rcu_nmi_exitv");

  -- * It is safe to do non-atomic ops on ->hardirq_context,
  -- * because NMI handlers may not preempt and the ops are
  -- * always balanced, so the interrupted value of ->hardirq_context
  -- * will always be restored.
  --  

  -- * Enter irq context (on NO_HZ, update jiffies):
  --  

   procedure irq_enter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hardirq.h:45
   pragma Import (CPP, irq_enter, "_Z9irq_enterv");

  -- * Exit irq context without processing softirqs:
  --  

  -- * Exit irq context and process softirqs if needed:
  --  

   procedure irq_exit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hardirq.h:60
   pragma Import (CPP, irq_exit, "_Z8irq_exitv");

end linux_hardirq_h;

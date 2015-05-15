pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package asm_preempt_h is

   --  unsupported macro: PREEMPT_ENABLED (0 + PREEMPT_NEED_RESCHED)
   --  arg-macro: function task_preempt_count (task_thread_info(p).saved_preempt_count and ~PREEMPT_NEED_RESCHED
   --    return task_thread_info(p).saved_preempt_count and ~PREEMPT_NEED_RESCHED;
   --  arg-macro: procedure init_task_preempt_count do { task_thread_info(p).saved_preempt_count := PREEMPT_DISABLED; } while (0)
   --    do { task_thread_info(p).saved_preempt_count := PREEMPT_DISABLED; } while (0)
   --  arg-macro: procedure init_idle_preempt_count do { task_thread_info(p).saved_preempt_count := PREEMPT_ENABLED; per_cpu(__preempt_count, (cpu)) := PREEMPT_ENABLED; } while (0)
   --    do { task_thread_info(p).saved_preempt_count := PREEMPT_ENABLED; per_cpu(__preempt_count, (cpu)) := PREEMPT_ENABLED; } while (0)
  -- * We use the PREEMPT_NEED_RESCHED bit as an inverted NEED_RESCHED such
  -- * that a decrement hitting 0 means we can and should reschedule.
  --  

  -- * We mask the PREEMPT_NEED_RESCHED bit so as not to confuse all current users
  -- * that think a non-zero value indicates we cannot preempt.
  --  

   function preempt_count return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/preempt.h:20
   pragma Import (CPP, preempt_count, "_ZL13preempt_countv");

   procedure preempt_count_set (pc : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/preempt.h:25
   pragma Import (CPP, preempt_count_set, "_ZL17preempt_count_seti");

  -- * must be macros to avoid header recursion hell
  --  

  -- * We fold the NEED_RESCHED bit into the preempt count such that
  -- * preempt_enable() can decrement and test for needing to reschedule with a
  -- * single instruction.
  -- *
  -- * We invert the actual bit, so that when the decrement hits 0 we know we both
  -- * need to resched (the bit is cleared) and can resched (no preempt count).
  --  

   procedure set_preempt_need_resched;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/preempt.h:54
   pragma Import (CPP, set_preempt_need_resched, "_ZL24set_preempt_need_reschedv");

   procedure clear_preempt_need_resched;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/preempt.h:59
   pragma Import (CPP, clear_preempt_need_resched, "_ZL26clear_preempt_need_reschedv");

   function test_preempt_need_resched return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/preempt.h:64
   pragma Import (CPP, test_preempt_need_resched, "_ZL25test_preempt_need_reschedv");

  -- * The various preempt_count add/sub methods
  --  

   --  skipped func __preempt_count_add

   --  skipped func __preempt_count_sub

  -- * Because we keep PREEMPT_NEED_RESCHED set when we do _not_ need to reschedule
  -- * a decrement which hits zero means we have no preempt_count and should
  -- * reschedule.
  --  

   --  skipped func __preempt_count_dec_and_test

  -- * Returns true when we need to resched and can (barring IRQ state).
  --  

   function should_resched return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/preempt.h:96
   pragma Import (CPP, should_resched, "_ZL14should_reschedv");

end asm_preempt_h;

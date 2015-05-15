pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;
with linux_spinlock_types_h;
limited with linux_sched_h;

package linux_wait_h is

   --  unsupported macro: WQ_FLAG_EXCLUSIVE 0x01
   --  unsupported macro: WAIT_ATOMIC_T_BIT_NR -1
   --  arg-macro: procedure DECLARE_WAITQUEUE wait_queue_t name := __WAITQUEUE_INITIALIZER(name, tsk)
   --    wait_queue_t name := __WAITQUEUE_INITIALIZER(name, tsk)
   --  arg-macro: procedure DECLARE_WAIT_QUEUE_HEAD wait_queue_head_t name := __WAIT_QUEUE_HEAD_INITIALIZER(name)
   --    wait_queue_head_t name := __WAIT_QUEUE_HEAD_INITIALIZER(name)
   --  unsupported macro: init_waitqueue_head(q) do { static struct lock_class_key __key; __init_waitqueue_head((q), #q, &__key); } while (0)
   --  arg-macro: procedure DECLARE_WAIT_QUEUE_HEAD_ONSTACK DECLARE_WAIT_QUEUE_HEAD(name)
   --    DECLARE_WAIT_QUEUE_HEAD(name)
   --  arg-macro: procedure wake_up __wake_up(x, TASK_NORMAL, 1, NULL)
   --    __wake_up(x, TASK_NORMAL, 1, NULL)
   --  arg-macro: procedure wake_up_nr __wake_up(x, TASK_NORMAL, nr, NULL)
   --    __wake_up(x, TASK_NORMAL, nr, NULL)
   --  arg-macro: procedure wake_up_all __wake_up(x, TASK_NORMAL, 0, NULL)
   --    __wake_up(x, TASK_NORMAL, 0, NULL)
   --  arg-macro: procedure wake_up_locked __wake_up_locked((x), TASK_NORMAL, 1)
   --    __wake_up_locked((x), TASK_NORMAL, 1)
   --  arg-macro: procedure wake_up_all_locked __wake_up_locked((x), TASK_NORMAL, 0)
   --    __wake_up_locked((x), TASK_NORMAL, 0)
   --  arg-macro: procedure wake_up_interruptible __wake_up(x, TASK_INTERRUPTIBLE, 1, NULL)
   --    __wake_up(x, TASK_INTERRUPTIBLE, 1, NULL)
   --  arg-macro: procedure wake_up_interruptible_nr __wake_up(x, TASK_INTERRUPTIBLE, nr, NULL)
   --    __wake_up(x, TASK_INTERRUPTIBLE, nr, NULL)
   --  arg-macro: procedure wake_up_interruptible_all __wake_up(x, TASK_INTERRUPTIBLE, 0, NULL)
   --    __wake_up(x, TASK_INTERRUPTIBLE, 0, NULL)
   --  arg-macro: procedure wake_up_interruptible_sync __wake_up_sync((x), TASK_INTERRUPTIBLE, 1)
   --    __wake_up_sync((x), TASK_INTERRUPTIBLE, 1)
   --  arg-macro: procedure wake_up_poll __wake_up(x, TASK_NORMAL, 1, (void *) (m))
   --    __wake_up(x, TASK_NORMAL, 1, (void *) (m))
   --  arg-macro: procedure wake_up_locked_poll __wake_up_locked_key((x), TASK_NORMAL, (void *) (m))
   --    __wake_up_locked_key((x), TASK_NORMAL, (void *) (m))
   --  arg-macro: procedure wake_up_interruptible_poll __wake_up(x, TASK_INTERRUPTIBLE, 1, (void *) (m))
   --    __wake_up(x, TASK_INTERRUPTIBLE, 1, (void *) (m))
   --  arg-macro: procedure wake_up_interruptible_sync_poll __wake_up_sync_key((x), TASK_INTERRUPTIBLE, 1, (void *) (m))
   --    __wake_up_sync_key((x), TASK_INTERRUPTIBLE, 1, (void *) (m))
   --  arg-macro: procedure wait_event do { if (condition) break; __wait_event(wq, condition); } while (0)
   --    do { if (condition) break; __wait_event(wq, condition); } while (0)
   --  arg-macro: function wait_event_timeout ({ long __ret := timeout; if (not___wait_cond_timeout(condition)) __ret := __wait_event_timeout(wq, condition, timeout); __ret; }
   --    return { long __ret := timeout; if (not___wait_cond_timeout(condition)) __ret := __wait_event_timeout(wq, condition, timeout); __ret; };
   --  arg-macro: procedure wait_event_cmd do { if (condition) break; __wait_event_cmd(wq, condition, cmd1, cmd2); } while (0)
   --    do { if (condition) break; __wait_event_cmd(wq, condition, cmd1, cmd2); } while (0)
   --  arg-macro: function wait_event_interruptible ({ int __ret := 0; if (not(condition)) __ret := __wait_event_interruptible(wq, condition); __ret; }
   --    return { int __ret := 0; if (not(condition)) __ret := __wait_event_interruptible(wq, condition); __ret; };
   --  arg-macro: function wait_event_interruptible_timeout ({ long __ret := timeout; if (not___wait_cond_timeout(condition)) __ret := __wait_event_interruptible_timeout(wq, condition, timeout); __ret; }
   --    return { long __ret := timeout; if (not___wait_cond_timeout(condition)) __ret := __wait_event_interruptible_timeout(wq, condition, timeout); __ret; };
   --  arg-macro: function wait_event_hrtimeout ({ int __ret := 0; if (not(condition)) __ret := __wait_event_hrtimeout(wq, condition, timeout, TASK_UNINTERRUPTIBLE); __ret; }
   --    return { int __ret := 0; if (not(condition)) __ret := __wait_event_hrtimeout(wq, condition, timeout, TASK_UNINTERRUPTIBLE); __ret; };
   --  arg-macro: function wait_event_interruptible_hrtimeout ({ long __ret := 0; if (not(condition)) __ret := __wait_event_hrtimeout(wq, condition, timeout, TASK_INTERRUPTIBLE); __ret; }
   --    return { long __ret := 0; if (not(condition)) __ret := __wait_event_hrtimeout(wq, condition, timeout, TASK_INTERRUPTIBLE); __ret; };
   --  arg-macro: function wait_event_interruptible_exclusive ({ int __ret := 0; if (not(condition)) __ret := __wait_event_interruptible_exclusive(wq, condition); __ret; }
   --    return { int __ret := 0; if (not(condition)) __ret := __wait_event_interruptible_exclusive(wq, condition); __ret; };
   --  arg-macro: function wait_event_interruptible_locked ((condition) ? 0 : __wait_event_interruptible_locked(wq, condition, 0, 0)
   --    return (condition) ? 0 : __wait_event_interruptible_locked(wq, condition, 0, 0);
   --  arg-macro: function wait_event_interruptible_locked_irq ((condition) ? 0 : __wait_event_interruptible_locked(wq, condition, 0, 1)
   --    return (condition) ? 0 : __wait_event_interruptible_locked(wq, condition, 0, 1);
   --  arg-macro: function wait_event_interruptible_exclusive_locked ((condition) ? 0 : __wait_event_interruptible_locked(wq, condition, 1, 0)
   --    return (condition) ? 0 : __wait_event_interruptible_locked(wq, condition, 1, 0);
   --  arg-macro: function wait_event_interruptible_exclusive_locked_irq ((condition) ? 0 : __wait_event_interruptible_locked(wq, condition, 1, 1)
   --    return (condition) ? 0 : __wait_event_interruptible_locked(wq, condition, 1, 1);
   --  arg-macro: function wait_event_killable ({ int __ret := 0; if (not(condition)) __ret := __wait_event_killable(wq, condition); __ret; }
   --    return { int __ret := 0; if (not(condition)) __ret := __wait_event_killable(wq, condition); __ret; };
   --  arg-macro: procedure wait_event_lock_irq_cmd do { if (condition) break; __wait_event_lock_irq(wq, condition, lock, cmd); } while (0)
   --    do { if (condition) break; __wait_event_lock_irq(wq, condition, lock, cmd); } while (0)
   --  arg-macro: procedure wait_event_lock_irq do { if (condition) break; __wait_event_lock_irq(wq, condition, lock, ); } while (0)
   --    do { if (condition) break; __wait_event_lock_irq(wq, condition, lock, ); } while (0)
   --  arg-macro: function wait_event_interruptible_lock_irq_cmd ({ int __ret := 0; if (not(condition)) __ret := __wait_event_interruptible_lock_irq(wq, condition, lock, cmd); __ret; }
   --    return { int __ret := 0; if (not(condition)) __ret := __wait_event_interruptible_lock_irq(wq, condition, lock, cmd); __ret; };
   --  arg-macro: function wait_event_interruptible_lock_irq ({ int __ret := 0; if (not(condition)) __ret := __wait_event_interruptible_lock_irq(wq, condition, lock,); __ret; }
   --    return { int __ret := 0; if (not(condition)) __ret := __wait_event_interruptible_lock_irq(wq, condition, lock,); __ret; };
   --  arg-macro: function wait_event_interruptible_lock_irq_timeout ({ long __ret := timeout; if (not___wait_cond_timeout(condition)) __ret := __wait_event_interruptible_lock_irq_timeout( wq, condition, lock, timeout); __ret; }
   --    return { long __ret := timeout; if (not___wait_cond_timeout(condition)) __ret := __wait_event_interruptible_lock_irq_timeout( wq, condition, lock, timeout); __ret; };
   --  arg-macro: procedure DEFINE_WAIT_FUNC wait_queue_t name := { .private := current, .func := function, .task_list := LIST_HEAD_INIT((name).task_list), }
   --    wait_queue_t name := { .private := current, .func := function, .task_list := LIST_HEAD_INIT((name).task_list), }
   --  arg-macro: procedure DEFINE_WAIT DEFINE_WAIT_FUNC(name, autoremove_wake_function)
   --    DEFINE_WAIT_FUNC(name, autoremove_wake_function)
   --  arg-macro: procedure DEFINE_WAIT_BIT struct wait_bit_queue name := { .key := __WAIT_BIT_KEY_INITIALIZER(word, bit), .wait := { .private := current, .func := wake_bit_function, .task_list := LIST_HEAD_INIT((name).wait.task_list), }, }
   --    struct wait_bit_queue name := { .key := __WAIT_BIT_KEY_INITIALIZER(word, bit), .wait := { .private := current, .func := wake_bit_function, .task_list := LIST_HEAD_INIT((name).wait.task_list), }, }
   --  arg-macro: procedure init_wait do { (wait).private := current; (wait).func := autoremove_wake_function; INIT_LIST_HEAD(and(wait).task_list); (wait).flags := 0; } while (0)
   --    do { (wait).private := current; (wait).func := autoremove_wake_function; INIT_LIST_HEAD(and(wait).task_list); (wait).flags := 0; } while (0)
  -- * Linux wait queue related types and methods
  --  

   type uu_wait_queue;
   subtype wait_queue_t is uu_wait_queue;

   type wait_queue_func_t is access function
        (arg1 : access wait_queue_t;
         arg2 : unsigned;
         arg3 : int;
         arg4 : System.Address) return int;
   pragma Convention (C, wait_queue_func_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:13

   function default_wake_function
     (wait : access wait_queue_t;
      mode : unsigned;
      flags : int;
      key : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:14
   pragma Import (CPP, default_wake_function, "_Z21default_wake_functionP12__wait_queuejiPv");

   type uu_wait_queue is record
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:17
      func : wait_queue_func_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:20
      task_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:21
   end record;
   pragma Convention (C_Pass_By_Copy, uu_wait_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:16

   type wait_bit_key is record
      flags : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:25
      bit_nr : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, wait_bit_key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:24

   type wait_bit_queue is record
      key : aliased wait_bit_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:31
      wait : aliased wait_queue_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, wait_bit_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:30

   type uu_wait_queue_head is record
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:36
      task_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, uu_wait_queue_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:35

   subtype wait_queue_head_t is uu_wait_queue_head;

  -- * Macros for declaration and initialisaton of the datatypes
  --  

   --  skipped func __init_waitqueue_head

   procedure init_waitqueue_entry (q : access wait_queue_t; p : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:86
   pragma Import (CPP, init_waitqueue_entry, "_ZL20init_waitqueue_entryP12__wait_queueP11task_struct");

   procedure init_waitqueue_func_entry (q : access wait_queue_t; func : wait_queue_func_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:94
   pragma Import (CPP, init_waitqueue_func_entry, "_ZL25init_waitqueue_func_entryP12__wait_queuePFiS0_jiPvE");

   function waitqueue_active (q : access wait_queue_head_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:101
   pragma Import (CPP, waitqueue_active, "_ZL16waitqueue_activeP17__wait_queue_head");

   procedure add_wait_queue (q : access wait_queue_head_t; wait : access wait_queue_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:106
   pragma Import (CPP, add_wait_queue, "_Z14add_wait_queueP17__wait_queue_headP12__wait_queue");

   procedure add_wait_queue_exclusive (q : access wait_queue_head_t; wait : access wait_queue_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:107
   pragma Import (CPP, add_wait_queue_exclusive, "_Z24add_wait_queue_exclusiveP17__wait_queue_headP12__wait_queue");

   procedure remove_wait_queue (q : access wait_queue_head_t; wait : access wait_queue_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:108
   pragma Import (CPP, remove_wait_queue, "_Z17remove_wait_queueP17__wait_queue_headP12__wait_queue");

   --  skipped func __add_wait_queue

  -- * Used for wake-one threads:
  --  

   --  skipped func __add_wait_queue_exclusive

   --  skipped func __add_wait_queue_tail

   --  skipped func __add_wait_queue_tail_exclusive

   --  skipped func __remove_wait_queue

   --  skipped func __wake_up

   --  skipped func __wake_up_locked_key

   --  skipped func __wake_up_sync_key

   --  skipped func __wake_up_locked

   --  skipped func __wake_up_sync

   --  skipped func __wake_up_bit

   --  skipped func __wait_on_bit

   --  skipped func __wait_on_bit_lock

   procedure wake_up_bit (arg1 : System.Address; arg2 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:152
   pragma Import (CPP, wake_up_bit, "_Z11wake_up_bitPvi");

   procedure wake_up_atomic_t (arg1 : access linux_types_h.atomic_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:153
   pragma Import (CPP, wake_up_atomic_t, "_Z16wake_up_atomic_tP8atomic_t");

   function out_of_line_wait_on_bit
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access function (arg1 : System.Address) return int;
      arg4 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:154
   pragma Import (CPP, out_of_line_wait_on_bit, "_Z23out_of_line_wait_on_bitPviPFiS_Ej");

   function out_of_line_wait_on_bit_lock
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access function (arg1 : System.Address) return int;
      arg4 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:155
   pragma Import (CPP, out_of_line_wait_on_bit_lock, "_Z28out_of_line_wait_on_bit_lockPviPFiS_Ej");

   function out_of_line_wait_on_atomic_t
     (arg1 : access linux_types_h.atomic_t;
      arg2 : access function (arg1 : access linux_types_h.atomic_t) return int;
      arg3 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:156
   pragma Import (CPP, out_of_line_wait_on_atomic_t, "_Z28out_of_line_wait_on_atomic_tP8atomic_tPFiS0_Ej");

   function bit_waitqueue (arg1 : System.Address; arg2 : int) return access wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:157
   pragma Import (CPP, bit_waitqueue, "_Z13bit_waitqueuePvi");

  -- * Wakeup macros to be used to report events to the targets.
  --  

  -- * The below macro ___wait_event() has an explicit shadow of the __ret
  -- * variable when used from the wait_event_*() macros.
  -- *
  -- * This is so that both can use the ___wait_cond_timeout() construct
  -- * to wrap the condition.
  -- *
  -- * The type inconsistency of the wait_event_*() __ret variable is also
  -- * on purpose; we use long where we can return timeout values and int
  -- * otherwise.
  --  

  --*
  -- * wait_event - sleep until a condition gets true
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- *
  -- * The process is put to sleep (TASK_UNINTERRUPTIBLE) until the
  -- * @condition evaluates to true. The @condition is checked each time
  -- * the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  --  

  --*
  -- * wait_event_timeout - sleep until a condition gets true or a timeout elapses
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- * @timeout: timeout, in jiffies
  -- *
  -- * The process is put to sleep (TASK_UNINTERRUPTIBLE) until the
  -- * @condition evaluates to true. The @condition is checked each time
  -- * the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * The function returns 0 if the @timeout elapsed, or the remaining
  -- * jiffies (at least 1) if the @condition evaluated to %true before
  -- * the @timeout elapsed.
  --  

  --*
  -- * wait_event_cmd - sleep until a condition gets true
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- * @cmd1: the command will be executed before sleep
  -- * @cmd2: the command will be executed after sleep
  -- *
  -- * The process is put to sleep (TASK_UNINTERRUPTIBLE) until the
  -- * @condition evaluates to true. The @condition is checked each time
  -- * the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  --  

  --*
  -- * wait_event_interruptible - sleep until a condition gets true
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- *
  -- * The process is put to sleep (TASK_INTERRUPTIBLE) until the
  -- * @condition evaluates to true or a signal is received.
  -- * The @condition is checked each time the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * The function will return -ERESTARTSYS if it was interrupted by a
  -- * signal and 0 if @condition evaluated to true.
  --  

  --*
  -- * wait_event_interruptible_timeout - sleep until a condition gets true or a timeout elapses
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- * @timeout: timeout, in jiffies
  -- *
  -- * The process is put to sleep (TASK_INTERRUPTIBLE) until the
  -- * @condition evaluates to true or a signal is received.
  -- * The @condition is checked each time the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * Returns:
  -- * 0 if the @timeout elapsed, -%ERESTARTSYS if it was interrupted by
  -- * a signal, or the remaining jiffies (at least 1) if the @condition
  -- * evaluated to %true before the @timeout elapsed.
  --  

  --*
  -- * wait_event_hrtimeout - sleep until a condition gets true or a timeout elapses
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- * @timeout: timeout, as a ktime_t
  -- *
  -- * The process is put to sleep (TASK_UNINTERRUPTIBLE) until the
  -- * @condition evaluates to true or a signal is received.
  -- * The @condition is checked each time the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * The function returns 0 if @condition became true, or -ETIME if the timeout
  -- * elapsed.
  --  

  --*
  -- * wait_event_interruptible_hrtimeout - sleep until a condition gets true or a timeout elapses
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- * @timeout: timeout, as a ktime_t
  -- *
  -- * The process is put to sleep (TASK_INTERRUPTIBLE) until the
  -- * @condition evaluates to true or a signal is received.
  -- * The @condition is checked each time the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * The function returns 0 if @condition became true, -ERESTARTSYS if it was
  -- * interrupted by a signal, or -ETIME if the timeout elapsed.
  --  

  --*
  -- * wait_event_interruptible_locked - sleep until a condition gets true
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- *
  -- * The process is put to sleep (TASK_INTERRUPTIBLE) until the
  -- * @condition evaluates to true or a signal is received.
  -- * The @condition is checked each time the waitqueue @wq is woken up.
  -- *
  -- * It must be called with wq.lock being held.  This spinlock is
  -- * unlocked while sleeping but @condition testing is done while lock
  -- * is held and when this macro exits the lock is held.
  -- *
  -- * The lock is locked/unlocked using spin_lock()/spin_unlock()
  -- * functions which must match the way they are locked/unlocked outside
  -- * of this macro.
  -- *
  -- * wake_up_locked() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * The function will return -ERESTARTSYS if it was interrupted by a
  -- * signal and 0 if @condition evaluated to true.
  --  

  --*
  -- * wait_event_interruptible_locked_irq - sleep until a condition gets true
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- *
  -- * The process is put to sleep (TASK_INTERRUPTIBLE) until the
  -- * @condition evaluates to true or a signal is received.
  -- * The @condition is checked each time the waitqueue @wq is woken up.
  -- *
  -- * It must be called with wq.lock being held.  This spinlock is
  -- * unlocked while sleeping but @condition testing is done while lock
  -- * is held and when this macro exits the lock is held.
  -- *
  -- * The lock is locked/unlocked using spin_lock_irq()/spin_unlock_irq()
  -- * functions which must match the way they are locked/unlocked outside
  -- * of this macro.
  -- *
  -- * wake_up_locked() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * The function will return -ERESTARTSYS if it was interrupted by a
  -- * signal and 0 if @condition evaluated to true.
  --  

  --*
  -- * wait_event_interruptible_exclusive_locked - sleep exclusively until a condition gets true
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- *
  -- * The process is put to sleep (TASK_INTERRUPTIBLE) until the
  -- * @condition evaluates to true or a signal is received.
  -- * The @condition is checked each time the waitqueue @wq is woken up.
  -- *
  -- * It must be called with wq.lock being held.  This spinlock is
  -- * unlocked while sleeping but @condition testing is done while lock
  -- * is held and when this macro exits the lock is held.
  -- *
  -- * The lock is locked/unlocked using spin_lock()/spin_unlock()
  -- * functions which must match the way they are locked/unlocked outside
  -- * of this macro.
  -- *
  -- * The process is put on the wait queue with an WQ_FLAG_EXCLUSIVE flag
  -- * set thus when other process waits process on the list if this
  -- * process is awaken further processes are not considered.
  -- *
  -- * wake_up_locked() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * The function will return -ERESTARTSYS if it was interrupted by a
  -- * signal and 0 if @condition evaluated to true.
  --  

  --*
  -- * wait_event_interruptible_exclusive_locked_irq - sleep until a condition gets true
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- *
  -- * The process is put to sleep (TASK_INTERRUPTIBLE) until the
  -- * @condition evaluates to true or a signal is received.
  -- * The @condition is checked each time the waitqueue @wq is woken up.
  -- *
  -- * It must be called with wq.lock being held.  This spinlock is
  -- * unlocked while sleeping but @condition testing is done while lock
  -- * is held and when this macro exits the lock is held.
  -- *
  -- * The lock is locked/unlocked using spin_lock_irq()/spin_unlock_irq()
  -- * functions which must match the way they are locked/unlocked outside
  -- * of this macro.
  -- *
  -- * The process is put on the wait queue with an WQ_FLAG_EXCLUSIVE flag
  -- * set thus when other process waits process on the list if this
  -- * process is awaken further processes are not considered.
  -- *
  -- * wake_up_locked() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * The function will return -ERESTARTSYS if it was interrupted by a
  -- * signal and 0 if @condition evaluated to true.
  --  

  --*
  -- * wait_event_killable - sleep until a condition gets true
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- *
  -- * The process is put to sleep (TASK_KILLABLE) until the
  -- * @condition evaluates to true or a signal is received.
  -- * The @condition is checked each time the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * The function will return -ERESTARTSYS if it was interrupted by a
  -- * signal and 0 if @condition evaluated to true.
  --  

  --*
  -- * wait_event_lock_irq_cmd - sleep until a condition gets true. The
  -- *			     condition is checked under the lock. This
  -- *			     is expected to be called with the lock
  -- *			     taken.
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- * @lock: a locked spinlock_t, which will be released before cmd
  -- *	  and schedule() and reacquired afterwards.
  -- * @cmd: a command which is invoked outside the critical section before
  -- *	 sleep
  -- *
  -- * The process is put to sleep (TASK_UNINTERRUPTIBLE) until the
  -- * @condition evaluates to true. The @condition is checked each time
  -- * the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * This is supposed to be called while holding the lock. The lock is
  -- * dropped before invoking the cmd and going to sleep and is reacquired
  -- * afterwards.
  --  

  --*
  -- * wait_event_lock_irq - sleep until a condition gets true. The
  -- *			 condition is checked under the lock. This
  -- *			 is expected to be called with the lock
  -- *			 taken.
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- * @lock: a locked spinlock_t, which will be released before schedule()
  -- *	  and reacquired afterwards.
  -- *
  -- * The process is put to sleep (TASK_UNINTERRUPTIBLE) until the
  -- * @condition evaluates to true. The @condition is checked each time
  -- * the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * This is supposed to be called while holding the lock. The lock is
  -- * dropped before going to sleep and is reacquired afterwards.
  --  

  --*
  -- * wait_event_interruptible_lock_irq_cmd - sleep until a condition gets true.
  -- *		The condition is checked under the lock. This is expected to
  -- *		be called with the lock taken.
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- * @lock: a locked spinlock_t, which will be released before cmd and
  -- *	  schedule() and reacquired afterwards.
  -- * @cmd: a command which is invoked outside the critical section before
  -- *	 sleep
  -- *
  -- * The process is put to sleep (TASK_INTERRUPTIBLE) until the
  -- * @condition evaluates to true or a signal is received. The @condition is
  -- * checked each time the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * This is supposed to be called while holding the lock. The lock is
  -- * dropped before invoking the cmd and going to sleep and is reacquired
  -- * afterwards.
  -- *
  -- * The macro will return -ERESTARTSYS if it was interrupted by a signal
  -- * and 0 if @condition evaluated to true.
  --  

  --*
  -- * wait_event_interruptible_lock_irq - sleep until a condition gets true.
  -- *		The condition is checked under the lock. This is expected
  -- *		to be called with the lock taken.
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- * @lock: a locked spinlock_t, which will be released before schedule()
  -- *	  and reacquired afterwards.
  -- *
  -- * The process is put to sleep (TASK_INTERRUPTIBLE) until the
  -- * @condition evaluates to true or signal is received. The @condition is
  -- * checked each time the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * This is supposed to be called while holding the lock. The lock is
  -- * dropped before going to sleep and is reacquired afterwards.
  -- *
  -- * The macro will return -ERESTARTSYS if it was interrupted by a signal
  -- * and 0 if @condition evaluated to true.
  --  

  --*
  -- * wait_event_interruptible_lock_irq_timeout - sleep until a condition gets
  -- *		true or a timeout elapses. The condition is checked under
  -- *		the lock. This is expected to be called with the lock taken.
  -- * @wq: the waitqueue to wait on
  -- * @condition: a C expression for the event to wait for
  -- * @lock: a locked spinlock_t, which will be released before schedule()
  -- *	  and reacquired afterwards.
  -- * @timeout: timeout, in jiffies
  -- *
  -- * The process is put to sleep (TASK_INTERRUPTIBLE) until the
  -- * @condition evaluates to true or signal is received. The @condition is
  -- * checked each time the waitqueue @wq is woken up.
  -- *
  -- * wake_up() has to be called after changing any variable that could
  -- * change the result of the wait condition.
  -- *
  -- * This is supposed to be called while holding the lock. The lock is
  -- * dropped before going to sleep and is reacquired afterwards.
  -- *
  -- * The function returns 0 if the @timeout elapsed, -ERESTARTSYS if it
  -- * was interrupted by a signal, and the remaining jiffies otherwise
  -- * if the condition evaluated to true before the timeout elapsed.
  --  

  -- * Waitqueues which are removed from the waitqueue_head at wakeup time
  --  

   procedure prepare_to_wait
     (q : access wait_queue_head_t;
      wait : access wait_queue_t;
      state : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:821
   pragma Import (CPP, prepare_to_wait, "_Z15prepare_to_waitP17__wait_queue_headP12__wait_queuei");

   procedure prepare_to_wait_exclusive
     (q : access wait_queue_head_t;
      wait : access wait_queue_t;
      state : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:822
   pragma Import (CPP, prepare_to_wait_exclusive, "_Z25prepare_to_wait_exclusiveP17__wait_queue_headP12__wait_queuei");

   function prepare_to_wait_event
     (q : access wait_queue_head_t;
      wait : access wait_queue_t;
      state : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:823
   pragma Import (CPP, prepare_to_wait_event, "_Z21prepare_to_wait_eventP17__wait_queue_headP12__wait_queuei");

   procedure finish_wait (q : access wait_queue_head_t; wait : access wait_queue_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:824
   pragma Import (CPP, finish_wait, "_Z11finish_waitP17__wait_queue_headP12__wait_queue");

   procedure abort_exclusive_wait
     (q : access wait_queue_head_t;
      wait : access wait_queue_t;
      mode : unsigned;
      key : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:825
   pragma Import (CPP, abort_exclusive_wait, "_Z20abort_exclusive_waitP17__wait_queue_headP12__wait_queuejPv");

   function autoremove_wake_function
     (wait : access wait_queue_t;
      mode : unsigned;
      sync : int;
      key : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:826
   pragma Import (CPP, autoremove_wake_function, "_Z24autoremove_wake_functionP12__wait_queuejiPv");

   function wake_bit_function
     (wait : access wait_queue_t;
      mode : unsigned;
      sync : int;
      key : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:827
   pragma Import (CPP, wake_bit_function, "_Z17wake_bit_functionP12__wait_queuejiPv");

  --*
  -- * wait_on_bit - wait for a bit to be cleared
  -- * @word: the word being waited on, a kernel virtual address
  -- * @bit: the bit of the word being waited on
  -- * @action: the function used to sleep, which may take special actions
  -- * @mode: the task state to sleep in
  -- *
  -- * There is a standard hashed waitqueue table for generic use. This
  -- * is the part of the hashtable's accessor API that waits on a bit.
  -- * For instance, if one were to have waiters on a bitflag, one would
  -- * call wait_on_bit() in threads waiting for the bit to clear.
  -- * One uses wait_on_bit() where one is waiting for the bit to clear,
  -- * but has no intention of setting it.
  --  

   function wait_on_bit
     (word : System.Address;
      bit : int;
      action : access function (arg1 : System.Address) return int;
      mode : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:872
   pragma Import (CPP, wait_on_bit, "_ZL11wait_on_bitPviPFiS_Ej");

  --*
  -- * wait_on_bit_lock - wait for a bit to be cleared, when wanting to set it
  -- * @word: the word being waited on, a kernel virtual address
  -- * @bit: the bit of the word being waited on
  -- * @action: the function used to sleep, which may take special actions
  -- * @mode: the task state to sleep in
  -- *
  -- * There is a standard hashed waitqueue table for generic use. This
  -- * is the part of the hashtable's accessor API that waits on a bit
  -- * when one intends to set it, for instance, trying to lock bitflags.
  -- * For instance, if one were to have waiters trying to set bitflag
  -- * and waiting for it to clear before setting it, one would call
  -- * wait_on_bit() in threads waiting to be able to set the bit.
  -- * One uses wait_on_bit_lock() where one is waiting for the bit to
  -- * clear with the intention of setting it, and when done, clearing it.
  --  

   function wait_on_bit_lock
     (word : System.Address;
      bit : int;
      action : access function (arg1 : System.Address) return int;
      mode : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:896
   pragma Import (CPP, wait_on_bit_lock, "_ZL16wait_on_bit_lockPviPFiS_Ej");

  --*
  -- * wait_on_atomic_t - Wait for an atomic_t to become 0
  -- * @val: The atomic value being waited on, a kernel virtual address
  -- * @action: the function used to sleep, which may take special actions
  -- * @mode: the task state to sleep in
  -- *
  -- * Wait for an atomic_t to become 0.  We abuse the bit-wait waitqueue table for
  -- * the purpose of getting a waitqueue, but we set the key to a bit number
  -- * outside of the target 'word'.
  --  

   function wait_on_atomic_t
     (val : access linux_types_h.atomic_t;
      action : access function (arg1 : access linux_types_h.atomic_t) return int;
      mode : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/wait.h:914
   pragma Import (CPP, wait_on_atomic_t, "_ZL16wait_on_atomic_tP8atomic_tPFiS0_Ej");

end linux_wait_h;

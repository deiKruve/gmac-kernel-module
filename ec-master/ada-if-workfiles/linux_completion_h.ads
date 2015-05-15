pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_wait_h;
with Interfaces.C.Extensions;

package linux_completion_h is

   --  arg-macro: procedure COMPLETION_INITIALIZER { 0, __WAIT_QUEUE_HEAD_INITIALIZER((work).wait) }
   --    { 0, __WAIT_QUEUE_HEAD_INITIALIZER((work).wait) }
   --  arg-macro: function COMPLETION_INITIALIZER_ONSTACK ({ init_completion(andwork); work; }
   --    return { init_completion(andwork); work; };
   --  arg-macro: procedure DECLARE_COMPLETION struct completion work := COMPLETION_INITIALIZER(work)
   --    struct completion work := COMPLETION_INITIALIZER(work)
   --  arg-macro: procedure DECLARE_COMPLETION_ONSTACK DECLARE_COMPLETION(work)
   --    DECLARE_COMPLETION(work)
  -- * (C) Copyright 2001 Linus Torvalds
  -- *
  -- * Atomic wait-for-completion handler data structures.
  -- * See kernel/sched/completion.c for details.
  --  

  -- * struct completion - structure used to maintain state for a "completion"
  -- *
  -- * This is the opaque structure used to maintain the state for a "completion".
  -- * Completions currently use a FIFO to queue threads that have to wait for
  -- * the "completion" event.
  -- *
  -- * See also:  complete(), wait_for_completion() (and friends _timeout,
  -- * _interruptible, _interruptible_timeout, and _killable), init_completion(),
  -- * reinit_completion(), and macros DECLARE_COMPLETION(),
  -- * DECLARE_COMPLETION_ONSTACK().
  --  

   type completion is record
      done : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:26
      wait : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:27
   end record;
   pragma Convention (C_Pass_By_Copy, completion);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:25

  --*
  -- * DECLARE_COMPLETION - declare and initialize a completion structure
  -- * @work:  identifier for the completion structure
  -- *
  -- * This macro declares and initializes a completion structure. Generally used
  -- * for static declarations. You should use the _ONSTACK variant for automatic
  -- * variables.
  --  

  -- * Lockdep needs to run a non-constant initializer for on-stack
  -- * completions - so we use the _ONSTACK() variant for those that
  -- * are on the kernel stack:
  --  

  --*
  -- * DECLARE_COMPLETION_ONSTACK - declare and initialize a completion structure
  -- * @work:  identifier for the completion structure
  -- *
  -- * This macro declares and initializes a completion structure on the kernel
  -- * stack.
  --  

  --*
  -- * init_completion - Initialize a dynamically allocated completion
  -- * @x:  pointer to completion structure that is to be initialized
  -- *
  -- * This inline function will initialize a dynamically created completion
  -- * structure.
  --  

   procedure init_completion (x : access completion);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:73
   pragma Import (CPP, init_completion, "_ZL15init_completionP10completion");

  --*
  -- * reinit_completion - reinitialize a completion structure
  -- * @x:  pointer to completion structure that is to be reinitialized
  -- *
  -- * This inline function should be used to reinitialize a completion structure so it can
  -- * be reused. This is especially important after complete_all() is used.
  --  

   procedure reinit_completion (x : access completion);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:86
   pragma Import (CPP, reinit_completion, "_ZL17reinit_completionP10completion");

   procedure wait_for_completion (arg1 : access completion);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:91
   pragma Import (CPP, wait_for_completion, "_Z19wait_for_completionP10completion");

   procedure wait_for_completion_io (arg1 : access completion);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:92
   pragma Import (CPP, wait_for_completion_io, "_Z22wait_for_completion_ioP10completion");

   function wait_for_completion_interruptible (x : access completion) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:93
   pragma Import (CPP, wait_for_completion_interruptible, "_Z33wait_for_completion_interruptibleP10completion");

   function wait_for_completion_killable (x : access completion) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:94
   pragma Import (CPP, wait_for_completion_killable, "_Z28wait_for_completion_killableP10completion");

   function wait_for_completion_timeout (x : access completion; timeout : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:95
   pragma Import (CPP, wait_for_completion_timeout, "_Z27wait_for_completion_timeoutP10completionm");

   function wait_for_completion_io_timeout (x : access completion; timeout : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:97
   pragma Import (CPP, wait_for_completion_io_timeout, "_Z30wait_for_completion_io_timeoutP10completionm");

   function wait_for_completion_interruptible_timeout (x : access completion; timeout : unsigned_long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:99
   pragma Import (CPP, wait_for_completion_interruptible_timeout, "_Z41wait_for_completion_interruptible_timeoutP10completionm");

   function wait_for_completion_killable_timeout (x : access completion; timeout : unsigned_long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:101
   pragma Import (CPP, wait_for_completion_killable_timeout, "_Z36wait_for_completion_killable_timeoutP10completionm");

   function try_wait_for_completion (x : access completion) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:103
   pragma Import (CPP, try_wait_for_completion, "_Z23try_wait_for_completionP10completion");

   function completion_done (x : access completion) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:104
   pragma Import (CPP, completion_done, "_Z15completion_doneP10completion");

   procedure complete (arg1 : access completion);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:106
   pragma Import (CPP, complete, "_Z8completeP10completion");

   procedure complete_all (arg1 : access completion);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/completion.h:107
   pragma Import (CPP, complete_all, "_Z12complete_allP10completion");

end linux_completion_h;

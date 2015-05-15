pragma Ada_2005;
pragma Style_Checks (Off);

with System;
with Interfaces.C; use Interfaces.C;

with Linux_Types;
with Linux_Ktime;
with Linux_Timerqueue;
with linux_time;

package Linux_Hrtimer is
   package L renames Linux_Types;

   -- hrtimers - High-resolution kernel timers
   -- for amd64

   -- there are various clever inlines defined in linux_hrtimer_h
   --  you are free to go and look there and implement them .

   subtype hrtimer_mode is unsigned;
   -- Mode arguments of xxx_hrtimer functions:
   HRTIMER_MODE_ABS        : constant hrtimer_mode := 0;
   -- Time value is absolute
   HRTIMER_MODE_REL        : constant hrtimer_mode := 1;
   -- Time value is relative to now
   HRTIMER_MODE_PINNED     : constant hrtimer_mode := 2;
   -- Timer is bound to CPU
   HRTIMER_MODE_ABS_PINNED : constant hrtimer_mode := 2;
   HRTIMER_MODE_REL_PINNED : constant hrtimer_mode := 3;

   type hrtimer_restart is (HRTIM_NORESTART,
   -- Timer is not restarted
    HRTIM_RESTART
   -- Timer must be restarted
   );
   pragma Convention (C, hrtimer_restart);

   subtype Hrtimer_State is unsigned_long;
   -- Values to track state of the timer
   --
   -- Special cases:
   -- 0x03              callback function running and enqueued
   --           (was requeued on another CPU)
   -- 0x05              timer was migrated on CPU hotunplug
   --
-- The "callback function running and enqueued" status is only possible on
-- SMP. It happens for example when a posix timer expired and the callback
-- queued a signal. Between dropping the lock which protects the posix timer
-- and reacquiring the base lock of the hrtimer, another CPU can deliver the
-- signal and rearm the timer. We have to preserve the callback running state,
-- as otherwise the timer could be removed before the softirq code finishes
-- the handling of the timer.
   --
   -- The HRTIMER_STATE_ENQUEUED bit is always or'ed to the current state
   -- to preserve the HRTIMER_STATE_CALLBACK in the above scenario. This
   -- also affects HRTIMER_STATE_MIGRATE where the preservation is not
   -- necessary. HRTIMER_STATE_MIGRATE is cleared after the timer is
   -- enqueued on the new cpu.
   --
   -- All state transitions are protected by cpu_base->lock.
   HRTIMER_STATE_INACTIVE : constant Hrtimer_State := 0;
   -- inactive
   HRTIMER_STATE_ENQUEUED : constant Hrtimer_State := 1;
   -- enqueued into rbtree
   HRTIMER_STATE_CALLBACK : constant Hrtimer_State := 2;
   -- callback function running
   HRTIMER_STATE_MIGRATE  : constant Hrtimer_State := 4;
   -- timer is migrated to another cpu

   type hrtimer_clock_base;
   subtype hrtimer_start_comm_array is Interfaces.C.char_array (0 .. 15);
   type hrtimer is record
      -- the basic hrtimer structure
      --  The hrtimer structure must be initialized by hrtimer_init()
      Node          : aliased Linux_Timerqueue.timerqueue_node;
      -- timerqueue node, which also manages node.expires,
      --                the absolute expiry time in the hrtimers internal
      --                representation. The time is related to the clock on
      --                which the timer is based. Is setup by adding
      --                slack to the _softexpires value. For non range timers
      --                identical to _softexpires.
      u_softexpires : Linux_Ktime.ktime_t;
      -- the absolute earliest expiry time of the hrtimer.
      --                The time which was given as expiry time when the timer
      --                was armed.
      C_Function    : access function
        (arg1 : access hrtimer) return hrtimer_restart;
      -- timer expiry callback function
      Base          : access hrtimer_clock_base;
      -- pointer to the timer base (per cpu and per clock)
      state : aliased Hrtimer_State;
      -- state information (See bit values above)
      Start_Pid     : aliased int;
      -- timer statistics field to store the pid of the task which
      --                started the timer
      Start_Site    : System.Address;
      -- timer statistics field to store the site where the timer
      --                was started
      start_comm    : aliased hrtimer_start_comm_array;
      -- timer statistics field to store the name of the process which
      --                started the timer
   end record;
   pragma Convention (C_Pass_By_Copy, hrtimer);

   subtype Task_Struct is System.Address; -- linux_sched_h

   type hrtimer_sleeper is record
      -- struct hrtimer_sleeper - simple sleeper structure
      timer  : aliased hrtimer;
      --  timer:        embedded timer structure
      c_task : Task_Struct;
      --  task: task to wake up
      --  task is set to NULL, when the timer expires.
   end record;
   pragma Convention (C_Pass_By_Copy, hrtimer_sleeper);

   type hrtimer_clock_base is record
      -- the timer base for a specific clock
      cpu_base     : System.Address;
      -- per cpu clock base
      index        : aliased int;
      -- clock type index for per_cpu support when moving a
      --                        timer to a base on another cpu.
      clockid      : aliased Linux_Types.Clockid_T;
      -- clock id for per_cpu support
      active       : aliased Linux_Timerqueue.timerqueue_head;
      -- red black tree root node for the active timers
      resolution   : Linux_Ktime.ktime_t;
      -- the resolution of the clock, in nanoseconds
      Get_Time     : access function return Linux_Ktime.ktime_t;
      -- function to retrieve the current time of the clock
      softirq_time : Linux_Ktime.ktime_t;
      -- the time when running the hrtimer queue in the softirq
      Offset       : Linux_Ktime.ktime_t;
      -- offset of this clock to the monotonic base
   end record;
   pragma Convention (C_Pass_By_Copy, hrtimer_clock_base);

   type hrtimer_base_type is
     (HRTIMER_BASE_MONOTONIC,
      HRTIMER_BASE_REALTIME,
      HRTIMER_BASE_BOOTTIME,
      HRTIMER_BASE_TAI,
      HRTIMER_MAX_CLOCK_BASES);
   pragma Convention (C, hrtimer_base_type);

   procedure Hrtimer_Init
   -- Initialize timer
     (timer       : access hrtimer;
      which_clock : Linux_Types.Clockid_T;
      mode        : hrtimer_mode);
   -- hrtimer_init - initialize a timer to the given clock
   --  timer:   the timer to be initialized
   --  clock_id:        the clock to be used
   --  mode:    timer mode abs/rel
   pragma Import (C, Hrtimer_Init, "hrtimer_init");

   function hrtimer_start
     (timer : access hrtimer;
      tim   : Linux_Ktime.ktime_t;
      mode  : hrtimer_mode) return int;
   -- (re)start an hrtimer on the current CPU
   --  timer:   the timer to be added
   --  tim:     expiry time
   --  mode:    expiry mode: absolute (HRTIMER_ABS) or relative (HRTIMER_REL)
   --
   -- Returns:
   --  0 on success
   --  1 when the timer was active
   pragma Import (C, hrtimer_start, "hrtimer_start");

   function Hrtimer_Start_Range_Ns
     (timer    : access hrtimer;
      tim      : Linux_Ktime.ktime_t;
      range_ns : unsigned_long;
      mode     : hrtimer_mode) return int;
   -- (re)start an hrtimer on the current CPU
   --  timer:   the timer to be added
   --  tim:     expiry time
   --  delta_ns:        "slack" range for the timer
   --  mode:    expiry mode: absolute (HRTIMER_ABS) or relative (HRTIMER_REL)
   --
   -- Returns:
   --  0 on success
   --  1 when the timer was active
   pragma Import (C, Hrtimer_Start_Range_Ns, "hrtimer_start_range_ns");

   function hrtimer_cancel (timer : access hrtimer) return int;
   -- hrtimer_cancel - cancel a timer and wait for the handler to finish.
   --  timer:   the timer to be cancelled
   --
   -- Returns:
   --  0 when the timer was not active
   --  1 when the timer was active
   pragma Import (C, hrtimer_cancel, "hrtimer_cancel");

   function hrtimer_try_to_cancel (timer : access hrtimer) return int;
   -- hrtimer_try_to_cancel - try to deactivate a timer
   --  timer:   hrtimer to stop
   --
   -- Returns:
   --  0 when the timer was not active
   --  1 when the timer was active
   -- -1 when the timer is currently excuting the callback function and
   --    cannot be stopped
   pragma Import (C, hrtimer_try_to_cancel, "hrtimer_try_to_cancel");

   function Hrtimer_Forward
     (timer    : access hrtimer;
      now      : Linux_Ktime.ktime_t;
      interval : Linux_Ktime.ktime_t) return L.u64;
   -- Forward a hrtimer so it expires after now
   --  timer:   hrtimer to forward
   --  now:     forward past this time
   --  interval:        the interval to forward
   --
   -- Forward the timer expiry so it will expire in the future.
   -- Returns the number of overruns.
   pragma Import (C, Hrtimer_Forward, "hrtimer_forward");

   --------------------
   --  Query timers  --
   --------------------

   function hrtimer_get_remaining
     (timer : access constant hrtimer) return Linux_Ktime.ktime_t;
   -- get remaining time for the timer
   --  timer:   the timer to read
   pragma Import (C, hrtimer_get_remaining, "hrtimer_get_remaining");

   function hrtimer_get_res
     (which_clock : Linux_Types.Clockid_T;
      tp          : access linux_time.timespec) return int;
   -- get resolution in nsecs.
   -- get the timer resolution for a clock
   --  which_clock: which clock to query
   --  tp:               pointer to timespec variable to store the resolution
   --
   -- Store the resolution of the clock selected by @which_clock in the
   -- variable pointed to by @tp.
   pragma Import (C, hrtimer_get_res, "hrtimer_get_res");

   function hrtimer_get_next_event return Linux_Ktime.ktime_t;
   -- get the time until next expiry event
   --
   -- Returns the delta to the next expiry event or KTIME_MAX if no timer
   -- is pending.
   pragma Import (C, hrtimer_get_next_event, "hrtimer_get_next_event");

   -----------------------
   --  sleep functions  --
   -----------------------

   function schedule_hrtimeout_range_clock
     (expires : access Linux_Ktime.ktime_t;
      c_delta : unsigned_long;
      mode    : hrtimer_mode;
      clock   : int) return int;
   -- schedule_hrtimeout_range_clock - sleep until timeout
   --  expires: timeout value (ktime_t)
   --  delta:   slack in expires timeout (ktime_t)
   --  mode:    timer mode, HRTIMER_MODE_ABS or HRTIMER_MODE_REL
   --  clock:   timer clock, CLOCK_MONOTONIC or CLOCK_REALTIME
   pragma Import
     (C,
      schedule_hrtimeout_range_clock,
      "schedule_hrtimeout_range_clock");

   function schedule_hrtimeout_range
     (expires : access Linux_Ktime.ktime_t;
      c_delta : unsigned_long;
      mode    : hrtimer_mode) return int;
   -- schedule_hrtimeout_range - sleep until timeout
   --  expires: timeout value (ktime_t)
   --  delta:   slack in expires timeout (ktime_t)
   --  mode:    timer mode, HRTIMER_MODE_ABS or HRTIMER_MODE_REL
   --
   -- Make the current task sleep until the given expiry time has
   -- elapsed. The routine will return immediately unless
   -- the current task state has been set (see set_current_state()).
   --
   -- The @delta argument gives the kernel the freedom to schedule the
   -- actual wakeup to a time that is both power and performance friendly.
   -- The kernel give the normal best effort behavior for "@expires+@delta",
   -- but may decide to fire the timer earlier, but no earlier than @expires.
   --
   -- You can set the task state as follows -
   --
   -- %TASK_UNINTERRUPTIBLE - at least @timeout time is guaranteed to
   -- pass before the routine returns.
   --
   -- %TASK_INTERRUPTIBLE - the routine may return early if a signal is
   -- delivered to the current task.
   --
   -- The current task state is guaranteed to be TASK_RUNNING when this
   -- routine returns.
   --
   -- Returns 0 when the timer has expired otherwise -EINTR
   pragma Import (C, schedule_hrtimeout_range, "schedule_hrtimeout_range");

   function schedule_hrtimeout
     (expires : access Linux_Ktime.ktime_t;
      mode    : hrtimer_mode) return int;
   -- sleep until timeout
   --  expires: timeout value (ktime_t)
   --  mode:    timer mode, HRTIMER_MODE_ABS or HRTIMER_MODE_REL
   --
   -- Make the current task sleep until the given expiry time has
   -- elapsed. The routine will return immediately unless
   -- the current task state has been set (see set_current_state()).
   --
   -- You can set the task state as follows -
   --
   -- %TASK_UNINTERRUPTIBLE - at least @timeout time is guaranteed to
   -- pass before the routine returns.
   --
   -- %TASK_INTERRUPTIBLE - the routine may return early if a signal is
   -- delivered to the current task.
   --
   -- The current task state is guaranteed to be TASK_RUNNING when this
   -- routine returns.
   --
   -- Returns 0 when the timer has expired otherwise -EINTR
   pragma Import (C, schedule_hrtimeout, "schedule_hrtimeout");

end Linux_Hrtimer;

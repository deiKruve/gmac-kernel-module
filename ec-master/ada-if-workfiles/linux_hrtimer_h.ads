pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_timerqueue_h;
with linux_ktime_h;
with System;
limited with linux_sched_h;
with linux_types_h;
with linux_spinlock_types_h;
with asm_generic_int_ll64_h;
limited with uapi_linux_time_h;
limited with linux_thread_info_h;

package linux_hrtimer_h is

   --  unsupported macro: HRTIMER_STATE_INACTIVE 0x00
   --  unsupported macro: HRTIMER_STATE_ENQUEUED 0x01
   --  unsupported macro: HRTIMER_STATE_CALLBACK 0x02
   --  unsupported macro: HRTIMER_STATE_MIGRATE 0x04
   --  unsupported macro: HIGH_RES_NSEC 1
   --  unsupported macro: KTIME_HIGH_RES (ktime_t) { .tv64 = HIGH_RES_NSEC }
   --  unsupported macro: MONOTONIC_RES_NSEC HIGH_RES_NSEC
   --  unsupported macro: KTIME_MONOTONIC_RES KTIME_HIGH_RES
   --  arg-macro: function ktime_divns (u64)((kt).tv64 / (div)
   --    return u64)((kt).tv64 / (div);
  -- *  include/linux/hrtimer.h
  -- *
  -- *  hrtimers - High-resolution kernel timers
  -- *
  -- *   Copyright(C) 2005, Thomas Gleixner <tglx@linutronix.de>
  -- *   Copyright(C) 2005, Red Hat, Inc., Ingo Molnar
  -- *
  -- *  data type definitions, declarations, prototypes
  -- *
  -- *  Started by: Thomas Gleixner and Ingo Molnar
  -- *
  -- *  For licencing details see kernel-base/COPYING
  --  

  -- * Mode arguments of xxx_hrtimer functions:
  --  

   subtype hrtimer_mode is unsigned;
   HRTIMER_MODE_ABS : constant hrtimer_mode := 0;
   HRTIMER_MODE_REL : constant hrtimer_mode := 1;
   HRTIMER_MODE_PINNED : constant hrtimer_mode := 2;
   HRTIMER_MODE_ABS_PINNED : constant hrtimer_mode := 2;
   HRTIMER_MODE_REL_PINNED : constant hrtimer_mode := 3;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:33

  -- Time value is absolute  
  -- Time value is relative to now  
  -- Timer is bound to CPU  
  -- * Return values for the callback function
  --  

   type hrtimer_restart is 
     (HRTIMER_NORESTART,
      HRTIMER_RESTART);
   pragma Convention (C, hrtimer_restart);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:44

  -- Timer is not restarted  
  -- Timer must be restarted  
  -- * Values to track state of the timer
  -- *
  -- * Possible states:
  -- *
  -- * 0x00		inactive
  -- * 0x01		enqueued into rbtree
  -- * 0x02		callback function running
  -- * 0x04		timer is migrated to another cpu
  -- *
  -- * Special cases:
  -- * 0x03		callback function running and enqueued
  -- *		(was requeued on another CPU)
  -- * 0x05		timer was migrated on CPU hotunplug
  -- *
  -- * The "callback function running and enqueued" status is only possible on
  -- * SMP. It happens for example when a posix timer expired and the callback
  -- * queued a signal. Between dropping the lock which protects the posix timer
  -- * and reacquiring the base lock of the hrtimer, another CPU can deliver the
  -- * signal and rearm the timer. We have to preserve the callback running state,
  -- * as otherwise the timer could be removed before the softirq code finishes the
  -- * the handling of the timer.
  -- *
  -- * The HRTIMER_STATE_ENQUEUED bit is always or'ed to the current state
  -- * to preserve the HRTIMER_STATE_CALLBACK in the above scenario. This
  -- * also affects HRTIMER_STATE_MIGRATE where the preservation is not
  -- * necessary. HRTIMER_STATE_MIGRATE is cleared after the timer is
  -- * enqueued on the new cpu.
  -- *
  -- * All state transitions are protected by cpu_base->lock.
  --  

  --*
  -- * struct hrtimer - the basic hrtimer structure
  -- * @node:	timerqueue node, which also manages node.expires,
  -- *		the absolute expiry time in the hrtimers internal
  -- *		representation. The time is related to the clock on
  -- *		which the timer is based. Is setup by adding
  -- *		slack to the _softexpires value. For non range timers
  -- *		identical to _softexpires.
  -- * @_softexpires: the absolute earliest expiry time of the hrtimer.
  -- *		The time which was given as expiry time when the timer
  -- *		was armed.
  -- * @function:	timer expiry callback function
  -- * @base:	pointer to the timer base (per cpu and per clock)
  -- * @state:	state information (See bit values above)
  -- * @start_pid: timer statistics field to store the pid of the task which
  -- *		started the timer
  -- * @start_site:	timer statistics field to store the site where the timer
  -- *		was started
  -- * @start_comm: timer statistics field to store the name of the process which
  -- *		started the timer
  -- *
  -- * The hrtimer structure must be initialized by hrtimer_init()
  --  

   type hrtimer_clock_base;
   subtype hrtimer_start_comm_array is Interfaces.C.char_array (0 .. 15);
   type hrtimer is record
      node : aliased linux_timerqueue_h.timerqueue_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:109
      u_softexpires : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:110
      c_function : access function (arg1 : access hrtimer) return hrtimer_restart;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:111
      base : access hrtimer_clock_base;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:112
      state : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:113
      start_pid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:115
      start_site : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:116
      start_comm : aliased hrtimer_start_comm_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:117
   end record;
   pragma Convention (C_Pass_By_Copy, hrtimer);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:108

  --*
  -- * struct hrtimer_sleeper - simple sleeper structure
  -- * @timer:	embedded timer structure
  -- * @task:	task to wake up
  -- *
  -- * task is set to NULL, when the timer expires.
  --  

   type hrtimer_sleeper is record
      timer : aliased hrtimer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:129
      c_task : access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:130
   end record;
   pragma Convention (C_Pass_By_Copy, hrtimer_sleeper);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:128

  --*
  -- * struct hrtimer_clock_base - the timer base for a specific clock
  -- * @cpu_base:		per cpu clock base
  -- * @index:		clock type index for per_cpu support when moving a
  -- *			timer to a base on another cpu.
  -- * @clockid:		clock id for per_cpu support
  -- * @active:		red black tree root node for the active timers
  -- * @resolution:		the resolution of the clock, in nanoseconds
  -- * @get_time:		function to retrieve the current time of the clock
  -- * @softirq_time:	the time when running the hrtimer queue in the softirq
  -- * @offset:		offset of this clock to the monotonic base
  --  

   type hrtimer_clock_base is record
      cpu_base : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:146
      index : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:147
      clockid : aliased linux_types_h.clockid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:148
      active : aliased linux_timerqueue_h.timerqueue_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:149
      resolution : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:150
      get_time : access function return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:151
      softirq_time : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:152
      offset : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:153
   end record;
   pragma Convention (C_Pass_By_Copy, hrtimer_clock_base);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:145

   type hrtimer_base_type is 
     (HRTIMER_BASE_MONOTONIC,
      HRTIMER_BASE_REALTIME,
      HRTIMER_BASE_BOOTTIME,
      HRTIMER_BASE_TAI,
      HRTIMER_MAX_CLOCK_BASES);
   pragma Convention (C, hrtimer_base_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:156

  -- * struct hrtimer_cpu_base - the per cpu clock bases
  -- * @lock:		lock protecting the base and associated clock bases
  -- *			and timers
  -- * @active_bases:	Bitfield to mark bases with active timers
  -- * @clock_was_set:	Indicates that clock was set from irq context.
  -- * @expires_next:	absolute time of the next event which was scheduled
  -- *			via clock_set_next_event()
  -- * @hres_active:	State of high resolution mode
  -- * @hang_detected:	The last hrtimer interrupt detected a hang
  -- * @nr_events:		Total number of hrtimer interrupt events
  -- * @nr_retries:		Total number of hrtimer interrupt retries
  -- * @nr_hangs:		Total number of hrtimer interrupt hangs
  -- * @max_hang_time:	Maximum time spent in hrtimer_interrupt
  -- * @clock_base:		array of clock bases for this cpu
  --  

   type hrtimer_cpu_base_clock_base_array is array (0 .. 3) of aliased hrtimer_clock_base;
   type hrtimer_cpu_base is record
      lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:181
      active_bases : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:182
      clock_was_set : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:183
      expires_next : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:185
      hres_active : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:186
      hang_detected : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:187
      nr_events : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:188
      nr_retries : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:189
      nr_hangs : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:190
      max_hang_time : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:191
      clock_base : aliased hrtimer_cpu_base_clock_base_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:193
   end record;
   pragma Convention (C_Pass_By_Copy, hrtimer_cpu_base);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:180

   procedure hrtimer_set_expires (timer : access hrtimer; time : linux_ktime_h.ktime_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:196
   pragma Import (CPP, hrtimer_set_expires, "_ZL19hrtimer_set_expiresP7hrtimer5ktime");

   procedure hrtimer_set_expires_range
     (timer : access hrtimer;
      time : linux_ktime_h.ktime_t;
      c_delta : linux_ktime_h.ktime_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:202
   pragma Import (CPP, hrtimer_set_expires_range, "_ZL25hrtimer_set_expires_rangeP7hrtimer5ktimeS1_");

   procedure hrtimer_set_expires_range_ns
     (timer : access hrtimer;
      time : linux_ktime_h.ktime_t;
      c_delta : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:208
   pragma Import (CPP, hrtimer_set_expires_range_ns, "_ZL28hrtimer_set_expires_range_nsP7hrtimer5ktimem");

   procedure hrtimer_set_expires_tv64 (timer : access hrtimer; tv64 : asm_generic_int_ll64_h.s64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:214
   pragma Import (CPP, hrtimer_set_expires_tv64, "_ZL24hrtimer_set_expires_tv64P7hrtimerx");

   procedure hrtimer_add_expires (timer : access hrtimer; time : linux_ktime_h.ktime_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:220
   pragma Import (CPP, hrtimer_add_expires, "_ZL19hrtimer_add_expiresP7hrtimer5ktime");

   procedure hrtimer_add_expires_ns (timer : access hrtimer; ns : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:226
   pragma Import (CPP, hrtimer_add_expires_ns, "_ZL22hrtimer_add_expires_nsP7hrtimery");

   function hrtimer_get_expires (timer : access constant hrtimer) return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:232
   pragma Import (CPP, hrtimer_get_expires, "_ZL19hrtimer_get_expiresPK7hrtimer");

   function hrtimer_get_softexpires (timer : access constant hrtimer) return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:237
   pragma Import (CPP, hrtimer_get_softexpires, "_ZL23hrtimer_get_softexpiresPK7hrtimer");

   function hrtimer_get_expires_tv64 (timer : access constant hrtimer) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:242
   pragma Import (CPP, hrtimer_get_expires_tv64, "_ZL24hrtimer_get_expires_tv64PK7hrtimer");

   function hrtimer_get_softexpires_tv64 (timer : access constant hrtimer) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:246
   pragma Import (CPP, hrtimer_get_softexpires_tv64, "_ZL28hrtimer_get_softexpires_tv64PK7hrtimer");

   function hrtimer_get_expires_ns (timer : access constant hrtimer) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:251
   pragma Import (CPP, hrtimer_get_expires_ns, "_ZL22hrtimer_get_expires_nsPK7hrtimer");

   function hrtimer_expires_remaining (timer : access constant hrtimer) return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:256
   pragma Import (CPP, hrtimer_expires_remaining, "_ZL25hrtimer_expires_remainingPK7hrtimer");

   --  skipped empty struct clock_event_device

   procedure hrtimer_interrupt (dev : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:264
   pragma Import (CPP, hrtimer_interrupt, "_Z17hrtimer_interruptP18clock_event_device");

  -- * In high resolution mode the time reference must be read accurate
  --  

   function hrtimer_cb_get_time (timer : access hrtimer) return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:269
   pragma Import (CPP, hrtimer_cb_get_time, "_ZL19hrtimer_cb_get_timeP7hrtimer");

   function hrtimer_is_hres_active (timer : access hrtimer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:274
   pragma Import (CPP, hrtimer_is_hres_active, "_ZL22hrtimer_is_hres_activeP7hrtimer");

   procedure hrtimer_peek_ahead_timers;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:279
   pragma Import (CPP, hrtimer_peek_ahead_timers, "_Z25hrtimer_peek_ahead_timersv");

  -- * The resolution of the clocks. The resolution value is returned in
  -- * the clock_getres() system call to give application programmers an
  -- * idea of the (in)accuracy of timers. Timer values are rounded up to
  -- * this resolution values.
  --  

   procedure clock_was_set_delayed;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:292
   pragma Import (CPP, clock_was_set_delayed, "_Z21clock_was_set_delayedv");

  -- * In non high resolution mode the time reference is taken from
  -- * the base softirq time variable.
  --  

   procedure clock_was_set;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:319
   pragma Import (CPP, clock_was_set, "_Z13clock_was_setv");

   procedure timerfd_clock_was_set;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:321
   pragma Import (CPP, timerfd_clock_was_set, "_Z21timerfd_clock_was_setv");

   procedure hrtimers_resume;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:325
   pragma Import (CPP, hrtimers_resume, "_Z15hrtimers_resumev");

   function ktime_get return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:327
   pragma Import (CPP, ktime_get, "_Z9ktime_getv");

   function ktime_get_real return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:328
   pragma Import (CPP, ktime_get_real, "_Z14ktime_get_realv");

   function ktime_get_boottime return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:329
   pragma Import (CPP, ktime_get_boottime, "_Z18ktime_get_boottimev");

   function ktime_get_monotonic_offset return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:330
   pragma Import (CPP, ktime_get_monotonic_offset, "_Z26ktime_get_monotonic_offsetv");

   function ktime_get_clocktai return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:331
   pragma Import (CPP, ktime_get_clocktai, "_Z18ktime_get_clocktaiv");

   function ktime_get_update_offsets
     (offs_real : access linux_ktime_h.ktime_t;
      offs_boot : access linux_ktime_h.ktime_t;
      offs_tai : access linux_ktime_h.ktime_t) return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:332
   pragma Import (CPP, ktime_get_update_offsets, "_Z24ktime_get_update_offsetsP5ktimeS0_S0_");

   tick_cpu_device : aliased tick_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:335
   pragma Import (C, tick_cpu_device, "tick_cpu_device");

   --  skipped empty struct tick_device

  -- Exported timer functions:  
  -- Initialize timers:  
   procedure hrtimer_init
     (timer : access hrtimer;
      which_clock : linux_types_h.clockid_t;
      mode : hrtimer_mode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:341
   pragma Import (CPP, hrtimer_init, "_Z12hrtimer_initP7hrtimeri12hrtimer_mode");

   procedure hrtimer_init_on_stack
     (timer : access hrtimer;
      which_clock : linux_types_h.clockid_t;
      mode : hrtimer_mode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:350
   pragma Import (CPP, hrtimer_init_on_stack, "_ZL21hrtimer_init_on_stackP7hrtimeri12hrtimer_mode");

   procedure destroy_hrtimer_on_stack (timer : access hrtimer);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:356
   pragma Import (CPP, destroy_hrtimer_on_stack, "_ZL24destroy_hrtimer_on_stackP7hrtimer");

  -- Basic timer operations:  
   function hrtimer_start
     (timer : access hrtimer;
      tim : linux_ktime_h.ktime_t;
      mode : hrtimer_mode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:360
   pragma Import (CPP, hrtimer_start, "_Z13hrtimer_startP7hrtimer5ktime12hrtimer_mode");

   function hrtimer_start_range_ns
     (timer : access hrtimer;
      tim : linux_ktime_h.ktime_t;
      range_ns : unsigned_long;
      mode : hrtimer_mode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:362
   pragma Import (CPP, hrtimer_start_range_ns, "_Z22hrtimer_start_range_nsP7hrtimer5ktimem12hrtimer_mode");

   --  skipped func __hrtimer_start_range_ns

   function hrtimer_cancel (timer : access hrtimer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:369
   pragma Import (CPP, hrtimer_cancel, "_Z14hrtimer_cancelP7hrtimer");

   function hrtimer_try_to_cancel (timer : access hrtimer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:370
   pragma Import (CPP, hrtimer_try_to_cancel, "_Z21hrtimer_try_to_cancelP7hrtimer");

   function hrtimer_start_expires (timer : access hrtimer; mode : hrtimer_mode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:372
   pragma Import (CPP, hrtimer_start_expires, "_ZL21hrtimer_start_expiresP7hrtimer12hrtimer_mode");

   function hrtimer_restart (timer : access hrtimer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:383
   pragma Import (CPP, hrtimer_restart, "_ZL15hrtimer_restartP7hrtimer");

  -- Query timers:  
   function hrtimer_get_remaining (timer : access constant hrtimer) return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:389
   pragma Import (CPP, hrtimer_get_remaining, "_Z21hrtimer_get_remainingPK7hrtimer");

   function hrtimer_get_res (which_clock : linux_types_h.clockid_t; tp : access uapi_linux_time_h.timespec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:390
   pragma Import (CPP, hrtimer_get_res, "_Z15hrtimer_get_resiP8timespec");

   function hrtimer_get_next_event return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:392
   pragma Import (CPP, hrtimer_get_next_event, "_Z22hrtimer_get_next_eventv");

  -- * A timer is active, when it is enqueued into the rbtree or the
  -- * callback function is running or it's in the state of being migrated
  -- * to another cpu.
  --  

   function hrtimer_active (timer : access constant hrtimer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:399
   pragma Import (CPP, hrtimer_active, "_ZL14hrtimer_activePK7hrtimer");

  -- * Helper function to check, whether the timer is on one of the queues
  --  

   function hrtimer_is_queued (timer : access hrtimer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:407
   pragma Import (CPP, hrtimer_is_queued, "_ZL17hrtimer_is_queuedP7hrtimer");

  -- * Helper function to check, whether the timer is running the callback
  -- * function
  --  

   function hrtimer_callback_running (timer : access hrtimer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:416
   pragma Import (CPP, hrtimer_callback_running, "_ZL24hrtimer_callback_runningP7hrtimer");

  -- Forward a hrtimer so it expires after now:  
   function hrtimer_forward
     (timer : access hrtimer;
      now : linux_ktime_h.ktime_t;
      interval : linux_ktime_h.ktime_t) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:423
   pragma Import (CPP, hrtimer_forward, "_Z15hrtimer_forwardP7hrtimer5ktimeS1_");

  -- Forward a hrtimer so it expires after the hrtimer's current now  
   function hrtimer_forward_now (timer : access hrtimer; interval : linux_ktime_h.ktime_t) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:426
   pragma Import (CPP, hrtimer_forward_now, "_ZL19hrtimer_forward_nowP7hrtimer5ktime");

  -- Precise sleep:  
   function hrtimer_nanosleep
     (rqtp : access uapi_linux_time_h.timespec;
      rmtp : access uapi_linux_time_h.timespec;
      mode : hrtimer_mode;
      clockid : linux_types_h.clockid_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:433
   pragma Import (CPP, hrtimer_nanosleep, "_Z17hrtimer_nanosleepP8timespecS0_12hrtimer_modei");

   function hrtimer_nanosleep_restart (the_restart_block : access linux_thread_info_h.restart_block) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:437
   pragma Import (CPP, hrtimer_nanosleep_restart, "_Z25hrtimer_nanosleep_restartP13restart_block");

   procedure hrtimer_init_sleeper (sl : access hrtimer_sleeper; tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:439
   pragma Import (CPP, hrtimer_init_sleeper, "_Z20hrtimer_init_sleeperP15hrtimer_sleeperP11task_struct");

   function schedule_hrtimeout_range
     (expires : access linux_ktime_h.ktime_t;
      c_delta : unsigned_long;
      mode : hrtimer_mode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:442
   pragma Import (CPP, schedule_hrtimeout_range, "_Z24schedule_hrtimeout_rangeP5ktimem12hrtimer_mode");

   function schedule_hrtimeout_range_clock
     (expires : access linux_ktime_h.ktime_t;
      c_delta : unsigned_long;
      mode : hrtimer_mode;
      clock : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:444
   pragma Import (CPP, schedule_hrtimeout_range_clock, "_Z30schedule_hrtimeout_range_clockP5ktimem12hrtimer_modei");

   function schedule_hrtimeout (expires : access linux_ktime_h.ktime_t; mode : hrtimer_mode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:446
   pragma Import (CPP, schedule_hrtimeout, "_Z18schedule_hrtimeoutP5ktime12hrtimer_mode");

  -- Soft interrupt function to run the hrtimer queues:  
   procedure hrtimer_run_queues;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:449
   pragma Import (CPP, hrtimer_run_queues, "_Z18hrtimer_run_queuesv");

   procedure hrtimer_run_pending;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:450
   pragma Import (CPP, hrtimer_run_pending, "_Z19hrtimer_run_pendingv");

  -- Bootup initialization:  
   procedure hrtimers_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:453
   pragma Import (CPP, hrtimers_init, "_Z13hrtimers_initv");

  -- Show pending timers:  
   procedure sysrq_timer_list_show;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/hrtimer.h:462
   pragma Import (CPP, sysrq_timer_list_show, "_Z21sysrq_timer_list_showv");

end linux_hrtimer_h;

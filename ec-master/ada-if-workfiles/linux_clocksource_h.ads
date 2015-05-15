pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with asm_clocksource_h;
with Interfaces.C.Strings;
with linux_types_h;
with System;

package linux_clocksource_h is

   --  unsupported macro: CLOCK_SOURCE_IS_CONTINUOUS 0x01
   --  unsupported macro: CLOCK_SOURCE_MUST_VERIFY 0x02
   --  unsupported macro: CLOCK_SOURCE_WATCHDOG 0x10
   --  unsupported macro: CLOCK_SOURCE_VALID_FOR_HRES 0x20
   --  unsupported macro: CLOCK_SOURCE_UNSTABLE 0x40
   --  unsupported macro: CLOCK_SOURCE_SUSPEND_NONSTOP 0x80
   --  unsupported macro: CLOCK_SOURCE_RESELECT 0x100
   --  arg-macro: function CLOCKSOURCE_MASK (cycle_t)((bits) < 64 ? ((1ULL<<(bits))-1) : -1
   --    return cycle_t)((bits) < 64 ? ((1ULL<<(bits))-1) : -1;
   --  arg-macro: procedure CLOCKSOURCE_OF_DECLARE OF_DECLARE_1(clksrc, name, compat, fn)
   --    OF_DECLARE_1(clksrc, name, compat, fn)
  --  linux/include/linux/clocksource.h
  -- *
  -- *  This file contains the structure definitions for clocksources.
  -- *
  -- *  If you are not a clocksource, or timekeeping code, you should
  -- *  not be including this file!
  --  

  -- clocksource cycle base type  
   subtype cycle_t is asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:22

  --*
  -- * struct cyclecounter - hardware abstraction for a free running counter
  -- *	Provides completely state-free accessors to the underlying hardware.
  -- *	Depending on which hardware it reads, the cycle counter may wrap
  -- *	around quickly. Locking rules (if necessary) have to be defined
  -- *	by the implementor and user of specific instances of this API.
  -- *
  -- * @read:		returns the current cycle value
  -- * @mask:		bitmask for two's complement
  -- *			subtraction of non 64 bit counters,
  -- *			see CLOCKSOURCE_MASK() helper macro
  -- * @mult:		cycle to nanosecond multiplier
  -- * @shift:		cycle to nanosecond divisor (power of two)
  --  

   type cyclecounter is record
      read : access function (arg1 : access constant cyclecounter) return cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:45
      mask : aliased cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:46
      mult : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:47
      shift : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:48
   end record;
   pragma Convention (C_Pass_By_Copy, cyclecounter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:44

  --*
  -- * struct timecounter - layer above a %struct cyclecounter which counts nanoseconds
  -- *	Contains the state needed by timecounter_read() to detect
  -- *	cycle counter wrap around. Initialize with
  -- *	timecounter_init(). Also used to convert cycle counts into the
  -- *	corresponding nanosecond counts with timecounter_cyc2time(). Users
  -- *	of this code are responsible for initializing the underlying
  -- *	cycle counter hardware, locking issues and reading the time
  -- *	more often than the cycle counter wraps around. The nanosecond
  -- *	counter will only wrap around after ~585 years.
  -- *
  -- * @cc:			the cycle counter used by this instance
  -- * @cycle_last:		most recent cycle counter value seen by
  -- *			timecounter_read()
  -- * @nsec:		continuously increasing count
  --  

   type timecounter is record
      cc : access constant cyclecounter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:68
      cycle_last : aliased cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:69
      nsec : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:70
   end record;
   pragma Convention (C_Pass_By_Copy, timecounter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:67

  --*
  -- * cyclecounter_cyc2ns - converts cycle counter cycles to nanoseconds
  -- * @cc:		Pointer to cycle counter.
  -- * @cycles:	Cycles
  -- *
  -- * XXX - This could use some mult_lxl_ll() asm optimization. Same code
  -- * as in cyc2ns, but with unsigned result.
  --  

   function cyclecounter_cyc2ns (cc : access constant cyclecounter; cycles : cycle_t) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:81
   pragma Import (CPP, cyclecounter_cyc2ns, "_ZL19cyclecounter_cyc2nsPK12cyclecountery");

  --*
  -- * timecounter_init - initialize a time counter
  -- * @tc:			Pointer to time counter which is to be initialized/reset
  -- * @cc:			A cycle counter, ready to be used.
  -- * @start_tstamp:	Arbitrary initial time stamp.
  -- *
  -- * After this call the current cycle register (roughly) corresponds to
  -- * the initial time stamp. Every call to timecounter_read() increments
  -- * the time stamp counter by the number of elapsed nanoseconds.
  --  

   procedure timecounter_init
     (tc : access timecounter;
      cc : access constant cyclecounter;
      start_tstamp : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:99
   pragma Import (CPP, timecounter_init, "_Z16timecounter_initP11timecounterPK12cyclecountery");

  --*
  -- * timecounter_read - return nanoseconds elapsed since timecounter_init()
  -- *                    plus the initial time stamp
  -- * @tc:          Pointer to time counter.
  -- *
  -- * In other words, keeps track of time since the same epoch as
  -- * the function which generated the initial time stamp.
  --  

   function timecounter_read (tc : access timecounter) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:111
   pragma Import (CPP, timecounter_read, "_Z16timecounter_readP11timecounter");

  --*
  -- * timecounter_cyc2time - convert a cycle counter to same
  -- *                        time base as values returned by
  -- *                        timecounter_read()
  -- * @tc:		Pointer to time counter.
  -- * @cycle_tstamp:	a value returned by tc->cc->read()
  -- *
  -- * Cycle counts that are converted correctly as long as they
  -- * fall into the interval [-1/2 max cycle count, +1/2 max cycle count],
  -- * with "max cycle count" == cs->mask+1.
  -- *
  -- * This allows conversion of cycle counter values which were generated
  -- * in the past.
  --  

   function timecounter_cyc2time (tc : access timecounter; cycle_tstamp : cycle_t) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:127
   pragma Import (CPP, timecounter_cyc2time, "_Z20timecounter_cyc2timeP11timecountery");

  --*
  -- * struct clocksource - hardware abstraction for a free running counter
  -- *	Provides mostly state-free accessors to the underlying hardware.
  -- *	This is the structure used for system time.
  -- *
  -- * @name:		ptr to clocksource name
  -- * @list:		list head for registration
  -- * @rating:		rating value for selection (higher is better)
  -- *			To avoid rating inflation the following
  -- *			list should give you a guide as to how
  -- *			to assign your clocksource a rating
  -- *			1-99: Unfit for real use
  -- *				Only available for bootup and testing purposes.
  -- *			100-199: Base level usability.
  -- *				Functional for real use, but not desired.
  -- *			200-299: Good.
  -- *				A correct and usable clocksource.
  -- *			300-399: Desired.
  -- *				A reasonably fast and accurate clocksource.
  -- *			400-499: Perfect
  -- *				The ideal clocksource. A must-use where
  -- *				available.
  -- * @read:		returns a cycle value, passes clocksource as argument
  -- * @enable:		optional function to enable the clocksource
  -- * @disable:		optional function to disable the clocksource
  -- * @mask:		bitmask for two's complement
  -- *			subtraction of non 64 bit counters
  -- * @mult:		cycle to nanosecond multiplier
  -- * @shift:		cycle to nanosecond divisor (power of two)
  -- * @max_idle_ns:	max idle time permitted by the clocksource (nsecs)
  -- * @maxadj:		maximum adjustment value to mult (~11%)
  -- * @flags:		flags describing special properties
  -- * @archdata:		arch-specific data
  -- * @suspend:		suspend function for the clocksource, if necessary
  -- * @resume:		resume function for the clocksource, if necessary
  -- * @cycle_last:		most recent cycle counter value seen by ::read()
  -- * @owner:		module reference, must be set by clocksource in modules
  --  

  --	 * Hotpath data, fits in a single cache line when the
  --	 * clocksource itself is cacheline aligned.
  --	  

   type clocksource is record
      read : access function (arg1 : access clocksource) return cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:173
      cycle_last : aliased cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:174
      mask : aliased cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:175
      mult : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:176
      shift : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:177
      max_idle_ns : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:178
      maxadj : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:179
      archdata : aliased asm_clocksource_h.arch_clocksource_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:181
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:184
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:185
      rating : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:186
      enable : access function (arg1 : access clocksource) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:187
      disable : access procedure (arg1 : access clocksource);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:188
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:189
      suspend : access procedure (arg1 : access clocksource);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:190
      resume : access procedure (arg1 : access clocksource);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:191
      wd_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:196
      cs_last : aliased cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:197
      wd_last : aliased cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:198
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:200
   end record;
   pragma Convention (C_Pass_By_Copy, clocksource);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:168

  -- private:  
  -- Watchdog related data, used by the framework  
  -- * Clock source flags bits::
  --  

  -- simplify initialization of mask field  
  --*
  -- * clocksource_khz2mult - calculates mult from khz and shift
  -- * @khz:		Clocksource frequency in KHz
  -- * @shift_constant:	Clocksource shift factor
  -- *
  -- * Helper functions that converts a khz counter frequency to a timsource
  -- * multiplier, given the clocksource shift value
  --  

   function clocksource_khz2mult (khz : asm_generic_int_ll64_h.u32; shift_constant : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:226
   pragma Import (CPP, clocksource_khz2mult, "_ZL20clocksource_khz2multjj");

  --  khz = cyc/(Million ns)
  --	 *  mult/2^shift  = ns/cyc
  --	 *  mult = ns/cyc * 2^shift
  --	 *  mult = 1Million/khz * 2^shift
  --	 *  mult = 1000000 * 2^shift / khz
  --	 *  mult = (1000000<<shift) / khz
  --	  

  -- round for do_div  
  --*
  -- * clocksource_hz2mult - calculates mult from hz and shift
  -- * @hz:			Clocksource frequency in Hz
  -- * @shift_constant:	Clocksource shift factor
  -- *
  -- * Helper functions that converts a hz counter
  -- * frequency to a timsource multiplier, given the
  -- * clocksource shift value
  --  

   function clocksource_hz2mult (hz : asm_generic_int_ll64_h.u32; shift_constant : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:252
   pragma Import (CPP, clocksource_hz2mult, "_ZL19clocksource_hz2multjj");

  --  hz = cyc/(Billion ns)
  --	 *  mult/2^shift  = ns/cyc
  --	 *  mult = ns/cyc * 2^shift
  --	 *  mult = 1Billion/hz * 2^shift
  --	 *  mult = 1000000000 * 2^shift / hz
  --	 *  mult = (1000000000<<shift) / hz
  --	  

  -- round for do_div  
  --*
  -- * clocksource_cyc2ns - converts clocksource cycles to nanoseconds
  -- * @cycles:	cycles
  -- * @mult:	cycle to nanosecond multiplier
  -- * @shift:	cycle to nanosecond divisor (power of two)
  -- *
  -- * Converts cycles to nanoseconds, using the given mult and shift.
  -- *
  -- * XXX - This could use some mult_lxl_ll() asm optimization
  --  

   function clocksource_cyc2ns
     (cycles : cycle_t;
      mult : asm_generic_int_ll64_h.u32;
      shift : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:279
   pragma Import (CPP, clocksource_cyc2ns, "_ZL18clocksource_cyc2nsyjj");

   function clocksource_register (arg1 : access clocksource) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:285
   pragma Import (CPP, clocksource_register, "_Z20clocksource_registerP11clocksource");

   function clocksource_unregister (arg1 : access clocksource) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:286
   pragma Import (CPP, clocksource_unregister, "_Z22clocksource_unregisterP11clocksource");

   procedure clocksource_touch_watchdog;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:287
   pragma Import (CPP, clocksource_touch_watchdog, "_Z26clocksource_touch_watchdogv");

   function clocksource_get_next return access clocksource;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:288
   pragma Import (CPP, clocksource_get_next, "_Z20clocksource_get_nextv");

   procedure clocksource_change_rating (cs : access clocksource; rating : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:289
   pragma Import (CPP, clocksource_change_rating, "_Z25clocksource_change_ratingP11clocksourcei");

   procedure clocksource_suspend;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:290
   pragma Import (CPP, clocksource_suspend, "_Z19clocksource_suspendv");

   procedure clocksource_resume;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:291
   pragma Import (CPP, clocksource_resume, "_Z18clocksource_resumev");

   function clocksource_default_clock return access clocksource;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:292
   pragma Import (CPP, clocksource_default_clock, "_Z25clocksource_default_clockv");

   procedure clocksource_mark_unstable (cs : access clocksource);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:293
   pragma Import (CPP, clocksource_mark_unstable, "_Z25clocksource_mark_unstableP11clocksource");

   function clocks_calc_max_nsecs
     (mult : asm_generic_int_ll64_h.u32;
      shift : asm_generic_int_ll64_h.u32;
      maxadj : asm_generic_int_ll64_h.u32;
      mask : asm_generic_int_ll64_h.u64) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:296
   pragma Import (CPP, clocks_calc_max_nsecs, "_Z21clocks_calc_max_nsecsjjjy");

   procedure clocks_calc_mult_shift
     (mult : access asm_generic_int_ll64_h.u32;
      shift : access asm_generic_int_ll64_h.u32;
      from : asm_generic_int_ll64_h.u32;
      to : asm_generic_int_ll64_h.u32;
      minsec : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:298
   pragma Import (CPP, clocks_calc_mult_shift, "_Z22clocks_calc_mult_shiftPjS_jjj");

  -- * Don't call __clocksource_register_scale directly, use
  -- * clocksource_register_hz/khz
  --  

   --  skipped func __clocksource_register_scale

   --  skipped func __clocksource_updatefreq_scale

   function clocksource_register_hz (cs : access clocksource; hz : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:309
   pragma Import (CPP, clocksource_register_hz, "_ZL23clocksource_register_hzP11clocksourcej");

   function clocksource_register_khz (cs : access clocksource; khz : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:314
   pragma Import (CPP, clocksource_register_khz, "_ZL24clocksource_register_khzP11clocksourcej");

   --  skipped func __clocksource_updatefreq_hz

   --  skipped func __clocksource_updatefreq_khz

   function timekeeping_notify (clock : access clocksource) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:330
   pragma Import (CPP, timekeeping_notify, "_Z18timekeeping_notifyP11clocksource");

   function clocksource_mmio_readl_up (arg1 : access clocksource) return cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:332
   pragma Import (CPP, clocksource_mmio_readl_up, "_Z25clocksource_mmio_readl_upP11clocksource");

   function clocksource_mmio_readl_down (arg1 : access clocksource) return cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:333
   pragma Import (CPP, clocksource_mmio_readl_down, "_Z27clocksource_mmio_readl_downP11clocksource");

   function clocksource_mmio_readw_up (arg1 : access clocksource) return cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:334
   pragma Import (CPP, clocksource_mmio_readw_up, "_Z25clocksource_mmio_readw_upP11clocksource");

   function clocksource_mmio_readw_down (arg1 : access clocksource) return cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:335
   pragma Import (CPP, clocksource_mmio_readw_down, "_Z27clocksource_mmio_readw_downP11clocksource");

   function clocksource_mmio_init
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : unsigned_long;
      arg4 : int;
      arg5 : unsigned;
      arg6 : access function (arg1 : access clocksource) return cycle_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:337
   pragma Import (CPP, clocksource_mmio_init, "_Z21clocksource_mmio_initPvPKcmijPFyP11clocksourceE");

   function clocksource_i8253_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:340
   pragma Import (CPP, clocksource_i8253_init, "_Z22clocksource_i8253_initv");

   procedure clocksource_of_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/clocksource.h:348
   pragma Import (CPP, clocksource_of_init, "_ZL19clocksource_of_initv");

end linux_clocksource_h;

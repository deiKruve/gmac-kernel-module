pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_time_h;
with linux_types_h;
with asm_generic_int_ll64_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with System;

package linux_time_h is

   --  unsupported macro: MSEC_PER_SEC 1000L
   --  unsupported macro: USEC_PER_MSEC 1000L
   --  unsupported macro: NSEC_PER_USEC 1000L
   --  unsupported macro: NSEC_PER_MSEC 1000000L
   --  unsupported macro: USEC_PER_SEC 1000000L
   --  unsupported macro: NSEC_PER_SEC 1000000000L
   --  unsupported macro: FSEC_PER_SEC 1000000000000000LL
   --  unsupported macro: TIME_T_MAX (time_t)((1UL << ((sizeof(time_t) << 3) - 1)) - 1)
   --  unsupported macro: KTIME_MAX ((s64)~((u64)1 << 63))
   --  unsupported macro: KTIME_SEC_MAX (KTIME_MAX / NSEC_PER_SEC)
   --  unsupported macro: CURRENT_TIME (current_kernel_time())
   --  unsupported macro: CURRENT_TIME_SEC ((struct timespec) { get_seconds(), 0 })
   --  arg-macro: procedure do_posix_clock_monotonic_gettime ktime_get_ts(ts)
   --    ktime_get_ts(ts)
   sys_tz : aliased uapi_linux_time_h.timezone;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:9
   pragma Import (C, sys_tz, "sys_tz");

  -- Parameters used to convert the timespec values:  
   function timespec_equal (a : access constant uapi_linux_time_h.timespec; b : access constant uapi_linux_time_h.timespec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:22
   pragma Import (CPP, timespec_equal, "_ZL14timespec_equalPK8timespecS1_");

  -- * lhs < rhs:  return <0
  -- * lhs == rhs: return 0
  -- * lhs > rhs:  return >0
  --  

   function timespec_compare (lhs : access constant uapi_linux_time_h.timespec; rhs : access constant uapi_linux_time_h.timespec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:33
   pragma Import (CPP, timespec_compare, "_ZL16timespec_comparePK8timespecS1_");

   function timeval_compare (lhs : access constant uapi_linux_time_h.timeval; rhs : access constant uapi_linux_time_h.timeval) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:42
   pragma Import (CPP, timeval_compare, "_ZL15timeval_comparePK7timevalS1_");

   function mktime
     (year : unsigned;
      mon : unsigned;
      day : unsigned;
      hour : unsigned;
      min : unsigned;
      sec : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:51
   pragma Import (CPP, mktime, "_Z6mktimejjjjjj");

   procedure set_normalized_timespec
     (ts : access uapi_linux_time_h.timespec;
      sec : linux_types_h.time_t;
      nsec : asm_generic_int_ll64_h.s64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:55
   pragma Import (CPP, set_normalized_timespec, "_Z23set_normalized_timespecP8timespeclx");

  -- * timespec_add_safe assumes both values are positive and checks
  -- * for overflow. It will return TIME_T_MAX if the reutrn would be
  -- * smaller then either of the arguments.
  --  

   function timespec_add_safe (lhs : uapi_linux_time_h.timespec; rhs : uapi_linux_time_h.timespec) return uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:62
   pragma Import (CPP, timespec_add_safe, "_Z17timespec_add_safe8timespecS_");

   function timespec_add (lhs : uapi_linux_time_h.timespec; rhs : uapi_linux_time_h.timespec) return uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:66
   pragma Import (CPP, timespec_add, "_ZL12timespec_add8timespecS_");

  -- * sub = lhs - rhs, in normalized form
  --  

   function timespec_sub (lhs : uapi_linux_time_h.timespec; rhs : uapi_linux_time_h.timespec) return uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:78
   pragma Import (CPP, timespec_sub, "_ZL12timespec_sub8timespecS_");

  -- * Returns true if the timespec is norm, false if denorm:
  --  

   function timespec_valid (ts : access constant uapi_linux_time_h.timespec) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:97
   pragma Import (CPP, timespec_valid, "_ZL14timespec_validPK8timespec");

  -- Dates before 1970 are bogus  
  -- Can't have more nanoseconds then a second  
   function timespec_valid_strict (ts : access constant uapi_linux_time_h.timespec) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:108
   pragma Import (CPP, timespec_valid_strict, "_ZL21timespec_valid_strictPK8timespec");

  -- Disallow values that could overflow ktime_t  
   persistent_clock_exist : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:118
   pragma Import (C, persistent_clock_exist, "persistent_clock_exist");

   function has_persistent_clock return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:120
   pragma Import (CPP, has_persistent_clock, "_ZL20has_persistent_clockv");

   procedure read_persistent_clock (ts : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:125
   pragma Import (CPP, read_persistent_clock, "_Z21read_persistent_clockP8timespec");

   procedure read_boot_clock (ts : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:126
   pragma Import (CPP, read_boot_clock, "_Z15read_boot_clockP8timespec");

   persistent_clock_is_local : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:127
   pragma Import (C, persistent_clock_is_local, "persistent_clock_is_local");

   function update_persistent_clock (now : uapi_linux_time_h.timespec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:128
   pragma Import (CPP, update_persistent_clock, "_Z23update_persistent_clock8timespec");

   procedure timekeeping_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:129
   pragma Import (CPP, timekeeping_init, "_Z16timekeeping_initv");

   timekeeping_suspended : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:130
   pragma Import (C, timekeeping_suspended, "timekeeping_suspended");

   function get_seconds return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:132
   pragma Import (CPP, get_seconds, "_Z11get_secondsv");

   function current_kernel_time return uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:133
   pragma Import (CPP, current_kernel_time, "_Z19current_kernel_timev");

  -- does not take xtime_lock  
   --  skipped func __current_kernel_time

   function get_monotonic_coarse return uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:135
   pragma Import (CPP, get_monotonic_coarse, "_Z20get_monotonic_coarsev");

   procedure get_xtime_and_monotonic_and_sleep_offset
     (xtim : access uapi_linux_time_h.timespec;
      wtom : access uapi_linux_time_h.timespec;
      sleep : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:136
   pragma Import (CPP, get_xtime_and_monotonic_and_sleep_offset, "_Z40get_xtime_and_monotonic_and_sleep_offsetP8timespecS0_S0_");

   procedure timekeeping_inject_sleeptime (c_delta : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:138
   pragma Import (CPP, timekeeping_inject_sleeptime, "_Z28timekeeping_inject_sleeptimeP8timespec");

  -- Some architectures do not supply their own clocksource.
  -- * This is mainly the case in architectures that get their
  -- * inter-tick times by reading the counter on their interval
  -- * timer. Since these timers wrap every tick, they're not really
  -- * useful as clocksources. Wrapping them to act like one is possible
  -- * but not very efficient. So we provide a callout these arches
  -- * can implement for use with the jiffies clocksource to provide
  -- * finer then tick granular time.
  --  

   procedure do_gettimeofday (tv : access uapi_linux_time_h.timeval);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:156
   pragma Import (CPP, do_gettimeofday, "_Z15do_gettimeofdayP7timeval");

   function do_settimeofday (tv : access constant uapi_linux_time_h.timespec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:157
   pragma Import (CPP, do_settimeofday, "_Z15do_settimeofdayPK8timespec");

   function do_sys_settimeofday (tv : access constant uapi_linux_time_h.timespec; tz : access constant uapi_linux_time_h.timezone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:158
   pragma Import (CPP, do_sys_settimeofday, "_Z19do_sys_settimeofdayPK8timespecPK8timezone");

   function do_utimes
     (dfd : int;
      filename : Interfaces.C.Strings.chars_ptr;
      times : access uapi_linux_time_h.timespec;
      flags : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:161
   pragma Import (CPP, do_utimes, "_Z9do_utimesiPKcP8timespeci");

   function do_setitimer
     (which : int;
      value : access uapi_linux_time_h.itimerval;
      ovalue : access uapi_linux_time_h.itimerval) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:163
   pragma Import (CPP, do_setitimer, "_Z12do_setitimeriP9itimervalS0_");

   function alarm_setitimer (seconds : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:165
   pragma Import (CPP, alarm_setitimer, "_Z15alarm_setitimerj");

   function do_getitimer (which : int; value : access uapi_linux_time_h.itimerval) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:166
   pragma Import (CPP, do_getitimer, "_Z12do_getitimeriP9itimerval");

   --  skipped func __getnstimeofday

   procedure getnstimeofday (tv : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:168
   pragma Import (CPP, getnstimeofday, "_Z14getnstimeofdayP8timespec");

   procedure getrawmonotonic (ts : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:169
   pragma Import (CPP, getrawmonotonic, "_Z15getrawmonotonicP8timespec");

   procedure getnstime_raw_and_real (ts_raw : access uapi_linux_time_h.timespec; ts_real : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:170
   pragma Import (CPP, getnstime_raw_and_real, "_Z22getnstime_raw_and_realP8timespecS0_");

   procedure getboottime (ts : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:172
   pragma Import (CPP, getboottime, "_Z11getboottimeP8timespec");

   procedure monotonic_to_bootbased (ts : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:173
   pragma Import (CPP, monotonic_to_bootbased, "_Z22monotonic_to_bootbasedP8timespec");

   procedure get_monotonic_boottime (ts : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:174
   pragma Import (CPP, get_monotonic_boottime, "_Z22get_monotonic_boottimeP8timespec");

   function timeval_valid (tv : access constant uapi_linux_time_h.timeval) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:176
   pragma Import (CPP, timeval_valid, "_ZL13timeval_validPK7timeval");

  -- Dates before 1970 are bogus  
  -- Can't have more microseconds then a second  
   function timespec_trunc (t : uapi_linux_time_h.timespec; gran : unsigned) return uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:189
   pragma Import (CPP, timespec_trunc, "_Z14timespec_trunc8timespecj");

   function timekeeping_valid_for_hres return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:190
   pragma Import (CPP, timekeeping_valid_for_hres, "_Z26timekeeping_valid_for_hresv");

   function timekeeping_max_deferment return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:191
   pragma Import (CPP, timekeeping_max_deferment, "_Z25timekeeping_max_defermentv");

   function timekeeping_inject_offset (ts : access uapi_linux_time_h.timespec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:192
   pragma Import (CPP, timekeeping_inject_offset, "_Z25timekeeping_inject_offsetP8timespec");

   function timekeeping_get_tai_offset return asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:193
   pragma Import (CPP, timekeeping_get_tai_offset, "_Z26timekeeping_get_tai_offsetv");

   procedure timekeeping_set_tai_offset (tai_offset : asm_generic_int_ll64_h.s32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:194
   pragma Import (CPP, timekeeping_set_tai_offset, "_Z26timekeeping_set_tai_offseti");

   procedure timekeeping_clocktai (ts : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:195
   pragma Import (CPP, timekeeping_clocktai, "_Z20timekeeping_clocktaiP8timespec");

   --  skipped empty struct tms

   procedure do_sys_times (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:198
   pragma Import (CPP, do_sys_times, "_Z12do_sys_timesP3tms");

  -- * Similar to the struct tm in userspace <time.h>, but it needs to be here so
  -- * that the kernel source is self contained.
  --  

  --	 * the number of seconds after the minute, normally in the range
  --	 * 0 to 59, but can be up to 60 to allow for leap seconds
  --	  

   type tm is record
      tm_sec : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:209
      tm_min : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:211
      tm_hour : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:213
      tm_mday : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:215
      tm_mon : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:217
      tm_year : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:219
      tm_wday : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:221
      tm_yday : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:223
   end record;
   pragma Convention (C_Pass_By_Copy, tm);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:204

  -- the number of minutes after the hour, in the range 0 to 59 
  -- the number of hours past midnight, in the range 0 to 23  
  -- the day of the month, in the range 1 to 31  
  -- the number of months since January, in the range 0 to 11  
  -- the number of years since 1900  
  -- the number of days since Sunday, in the range 0 to 6  
  -- the number of days since January 1, in the range 0 to 365  
   procedure time_to_tm
     (totalsecs : linux_types_h.time_t;
      offset : int;
      result : access tm);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:226
   pragma Import (CPP, time_to_tm, "_Z10time_to_tmliP2tm");

  --*
  -- * timespec_to_ns - Convert timespec to nanoseconds
  -- * @ts:		pointer to the timespec variable to be converted
  -- *
  -- * Returns the scalar nanosecond representation of the timespec
  -- * parameter.
  --  

   function timespec_to_ns (ts : access constant uapi_linux_time_h.timespec) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:235
   pragma Import (CPP, timespec_to_ns, "_ZL14timespec_to_nsPK8timespec");

  --*
  -- * timeval_to_ns - Convert timeval to nanoseconds
  -- * @ts:		pointer to the timeval variable to be converted
  -- *
  -- * Returns the scalar nanosecond representation of the timeval
  -- * parameter.
  --  

   function timeval_to_ns (tv : access constant uapi_linux_time_h.timeval) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:247
   pragma Import (CPP, timeval_to_ns, "_ZL13timeval_to_nsPK7timeval");

  --*
  -- * ns_to_timespec - Convert nanoseconds to timespec
  -- * @nsec:	the nanoseconds value to be converted
  -- *
  -- * Returns the timespec representation of the nsec parameter.
  --  

   function ns_to_timespec (nsec : asm_generic_int_ll64_h.s64) return uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:259
   pragma Import (CPP, ns_to_timespec, "_Z14ns_to_timespecx");

  --*
  -- * ns_to_timeval - Convert nanoseconds to timeval
  -- * @nsec:	the nanoseconds value to be converted
  -- *
  -- * Returns the timeval representation of the nsec parameter.
  --  

   function ns_to_timeval (nsec : asm_generic_int_ll64_h.s64) return uapi_linux_time_h.timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:267
   pragma Import (CPP, ns_to_timeval, "_Z13ns_to_timevalx");

  --*
  -- * timespec_add_ns - Adds nanoseconds to a timespec
  -- * @a:		pointer to timespec to be incremented
  -- * @ns:		unsigned nanoseconds value to be added
  -- *
  -- * This must always be inlined because its used from the x86-64 vdso,
  -- * which cannot call other kernel functions.
  --  

   procedure timespec_add_ns (a : access uapi_linux_time_h.timespec; ns : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/time.h:277
   pragma Import (CPP, timespec_add_ns, "_ZL15timespec_add_nsP8timespecy");

end linux_time_h;

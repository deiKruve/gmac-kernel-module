pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with uapi_linux_time_h;
with Interfaces.C.Extensions;

package linux_ktime_h is

   --  arg-macro: function ktime_sub ({ (ktime_t){ .tv64 := (lhs).tv64 - (rhs).tv64 }; }
   --    return { (ktime_t){ .tv64 := (lhs).tv64 - (rhs).tv64 }; };
   --  arg-macro: function ktime_add ({ (ktime_t){ .tv64 := (lhs).tv64 + (rhs).tv64 }; }
   --    return { (ktime_t){ .tv64 := (lhs).tv64 + (rhs).tv64 }; };
   --  arg-macro: function ktime_add_ns ({ (ktime_t){ .tv64 := (kt).tv64 + (nsval) }; }
   --    return { (ktime_t){ .tv64 := (kt).tv64 + (nsval) }; };
   --  arg-macro: function ktime_sub_ns ({ (ktime_t){ .tv64 := (kt).tv64 - (nsval) }; }
   --    return { (ktime_t){ .tv64 := (kt).tv64 - (nsval) }; };
   --  arg-macro: procedure ktime_to_timespec ns_to_timespec((kt).tv64)
   --    ns_to_timespec((kt).tv64)
   --  arg-macro: procedure ktime_to_timeval ns_to_timeval((kt).tv64)
   --    ns_to_timeval((kt).tv64)
   --  arg-macro: function ktime_to_ns ((kt).tv64
   --    return (kt).tv64;
   --  unsupported macro: LOW_RES_NSEC TICK_NSEC
   --  unsupported macro: KTIME_LOW_RES (ktime_t){ .tv64 = LOW_RES_NSEC }
   --  arg-macro: procedure ktime_get_real_ts getnstimeofday(ts)
   --    getnstimeofday(ts)
  -- *  include/linux/ktime.h
  -- *
  -- *  ktime_t - nanosecond-resolution time format.
  -- *
  -- *   Copyright(C) 2005, Thomas Gleixner <tglx@linutronix.de>
  -- *   Copyright(C) 2005, Red Hat, Inc., Ingo Molnar
  -- *
  -- *  data type definitions, declarations, prototypes and macros.
  -- *
  -- *  Started by: Thomas Gleixner and Ingo Molnar
  -- *
  -- *  Credits:
  -- *
  -- *  	Roman Zippel provided the ideas and primary code snippets of
  -- *  	the ktime_t union and further simplifications of the original
  -- *  	code.
  -- *
  -- *  For licencing details see kernel-base/COPYING
  --  

  -- * ktime_t:
  -- *
  -- * On 64-bit CPUs a single 64-bit variable is used to store the hrtimers
  -- * internal representation of time values in scalar nanoseconds. The
  -- * design plays out best on 64-bit CPUs, where most conversions are
  -- * NOPs and most arithmetic ktime_t operations are plain arithmetic
  -- * operations.
  -- *
  -- * On 32-bit CPUs an optimized representation of the timespec structure
  -- * is used to avoid expensive conversions from and to timespecs. The
  -- * endian-aware order of the tv struct members is chosen to allow
  -- * mathematical operations on the tv64 member of the union too, which
  -- * for certain operations produces better code.
  -- *
  -- * For architectures with efficient support for 64/32-bit conversions the
  -- * plain scalar nanosecond based representation can be selected by the
  -- * config switch CONFIG_KTIME_SCALAR.
  --  

   type ktime (discr : unsigned := 0) is record
      case discr is
         when others =>
            tv64 : aliased asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:47
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, ktime);
   pragma Unchecked_Union (ktime);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:46

  -- Kill this  
   subtype ktime_t is ktime;

  -- * ktime_t definitions when using the 64-bit scalar representation:
  --  

  --*
  -- * ktime_set - Set a ktime_t variable from a seconds/nanoseconds value
  -- * @secs:	seconds to set
  -- * @nsecs:	nanoseconds to set
  -- *
  -- * Return: The ktime_t representation of the value.
  --  

   function ktime_set (secs : long; nsecs : unsigned_long) return ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:74
   pragma Import (CPP, ktime_set, "_ZL9ktime_setlm");

  -- Subtract two ktime_t variables. rem = lhs -rhs:  
  -- Add two ktime_t variables. res = lhs + rhs:  
  -- * Add a ktime_t variable and a scalar nanosecond value.
  -- * res = kt + nsval:
  --  

  -- * Subtract a scalar nanosecod from a ktime_t variable
  -- * res = kt - nsval:
  --  

  -- convert a timespec to ktime_t format:  
   function timespec_to_ktime (ts : uapi_linux_time_h.timespec) return ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:106
   pragma Import (CPP, timespec_to_ktime, "_ZL17timespec_to_ktime8timespec");

  -- convert a timeval to ktime_t format:  
   function timeval_to_ktime (tv : uapi_linux_time_h.timeval) return ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:112
   pragma Import (CPP, timeval_to_ktime, "_ZL16timeval_to_ktime7timeval");

  -- Map the ktime_t to timespec conversion to ns_to_timespec function  
  -- Map the ktime_t to timeval conversion to ns_to_timeval function  
  -- Convert ktime_t to nanoseconds - NOP in the scalar storage format:  
  -- * Helper macros/inlines to get the ktime_t math right in the timespec
  -- * representation. The macros are sometimes ugly - their actual use is
  -- * pretty okay-ish, given the circumstances. We do all this for
  -- * performance reasons. The pure scalar nsec_t based code was nice and
  -- * simple, but created too many 64-bit / 32-bit conversions and divisions.
  -- *
  -- * Be especially aware that negative values are represented in a way
  -- * that the tv.sec field is negative and the tv.nsec field is greater
  -- * or equal to zero but less than nanoseconds per second. This is the
  -- * same representation which is used by timespecs.
  -- *
  -- *   tv.sec < 0 and 0 >= tv.nsec < NSEC_PER_SEC
  --  

  -- Set a ktime_t variable to a value in sec/nsec representation:  
  --*
  -- * ktime_sub - subtract two ktime_t variables
  -- * @lhs:	minuend
  -- * @rhs:	subtrahend
  -- *
  -- * Return: The remainder of the subtraction.
  --  

  --*
  -- * ktime_add - add two ktime_t variables
  -- * @add1:	addend1
  -- * @add2:	addend2
  -- *
  -- * Return: The sum of @add1 and @add2.
  --  

  --	 * performance trick: the (u32) -NSEC gives 0x00000000Fxxxxxxx
  --	 * so we subtract NSEC_PER_SEC and add 1 to the upper 32 bit.
  --	 *
  --	 * it's equivalent to:
  --	 *   tv.nsec -= NSEC_PER_SEC
  --	 *   tv.sec ++;
  --	  

  --*
  -- * ktime_add_ns - Add a scalar nanoseconds value to a ktime_t variable
  -- * @kt:		addend
  -- * @nsec:	the scalar nsec value to add
  -- *
  -- * Return: The sum of @kt and @nsec in ktime_t format.
  --  

  --*
  -- * ktime_sub_ns - Subtract a scalar nanoseconds value from a ktime_t variable
  -- * @kt:		minuend
  -- * @nsec:	the scalar nsec value to subtract
  -- *
  -- * Return: The subtraction of @nsec from @kt in ktime_t format.
  --  

  --*
  -- * timespec_to_ktime - convert a timespec to ktime_t format
  -- * @ts:		the timespec variable to convert
  -- *
  -- * Return: A ktime_t variable with the converted timespec value.
  --  

  --*
  -- * timeval_to_ktime - convert a timeval to ktime_t format
  -- * @tv:		the timeval variable to convert
  -- *
  -- * Return: A ktime_t variable with the converted timeval value.
  --  

  --*
  -- * ktime_to_timespec - convert a ktime_t variable to timespec format
  -- * @kt:		the ktime_t variable to convert
  -- *
  -- * Return: The timespec representation of the ktime value.
  --  

  --*
  -- * ktime_to_timeval - convert a ktime_t variable to timeval format
  -- * @kt:		the ktime_t variable to convert
  -- *
  -- * Return: The timeval representation of the ktime value.
  --  

  --*
  -- * ktime_to_ns - convert a ktime_t variable to scalar nanoseconds
  -- * @kt:		the ktime_t variable to convert
  -- *
  -- * Return: The scalar nanoseconds representation of @kt.
  --  

  --*
  -- * ktime_equal - Compares two ktime_t variables to see if they are equal
  -- * @cmp1:	comparable1
  -- * @cmp2:	comparable2
  -- *
  -- * Compare two ktime_t variables.
  -- *
  -- * Return: 1 if equal.
  --  

   function ktime_equal (cmp1 : ktime_t; cmp2 : ktime_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:283
   pragma Import (CPP, ktime_equal, "_ZL11ktime_equal5ktimeS_");

  --*
  -- * ktime_compare - Compares two ktime_t variables for less, greater or equal
  -- * @cmp1:	comparable1
  -- * @cmp2:	comparable2
  -- *
  -- * Return: ...
  -- *   cmp1  < cmp2: return <0
  -- *   cmp1 == cmp2: return 0
  -- *   cmp1  > cmp2: return >0
  --  

   function ktime_compare (cmp1 : ktime_t; cmp2 : ktime_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:298
   pragma Import (CPP, ktime_compare, "_ZL13ktime_compare5ktimeS_");

  --*
  -- * ktime_after - Compare if a ktime_t value is bigger than another one.
  -- * @cmp1:	comparable1
  -- * @cmp2:	comparable2
  -- *
  -- * Return: true if cmp1 happened after cmp2.
  --  

   function ktime_after (cmp1 : ktime_t; cmp2 : ktime_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:314
   pragma Import (CPP, ktime_after, "_ZL11ktime_after5ktimeS_");

  --*
  -- * ktime_before - Compare if a ktime_t value is smaller than another one.
  -- * @cmp1:	comparable1
  -- * @cmp2:	comparable2
  -- *
  -- * Return: true if cmp1 happened before cmp2.
  --  

   function ktime_before (cmp1 : ktime_t; cmp2 : ktime_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:326
   pragma Import (CPP, ktime_before, "_ZL12ktime_before5ktimeS_");

   function ktime_to_us (kt : ktime_t) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:331
   pragma Import (CPP, ktime_to_us, "_ZL11ktime_to_us5ktime");

   function ktime_to_ms (kt : ktime_t) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:337
   pragma Import (CPP, ktime_to_ms, "_ZL11ktime_to_ms5ktime");

   function ktime_us_delta (later : ktime_t; earlier : ktime_t) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:343
   pragma Import (CPP, ktime_us_delta, "_ZL14ktime_us_delta5ktimeS_");

   function ktime_add_us (kt : ktime_t; usec : asm_generic_int_ll64_h.u64) return ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:348
   pragma Import (CPP, ktime_add_us, "_ZL12ktime_add_us5ktimey");

   function ktime_add_ms (kt : ktime_t; msec : asm_generic_int_ll64_h.u64) return ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:353
   pragma Import (CPP, ktime_add_ms, "_ZL12ktime_add_ms5ktimey");

   function ktime_sub_us (kt : ktime_t; usec : asm_generic_int_ll64_h.u64) return ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:358
   pragma Import (CPP, ktime_sub_us, "_ZL12ktime_sub_us5ktimey");

   function ktime_add_safe (lhs : ktime_t; rhs : ktime_t) return ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:363
   pragma Import (CPP, ktime_add_safe, "_Z14ktime_add_safe5ktimeS_");

  --*
  -- * ktime_to_timespec_cond - convert a ktime_t variable to timespec
  -- *			    format only if the variable contains data
  -- * @kt:		the ktime_t variable to convert
  -- * @ts:		the timespec variable to store the result in
  -- *
  -- * Return: %true if there was a successful conversion, %false if kt was 0.
  --  

   function ktime_to_timespec_cond (kt : ktime_t; ts : access uapi_linux_time_h.timespec) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:373
   pragma Import (CPP, ktime_to_timespec_cond, "_ZL22ktime_to_timespec_cond5ktimeP8timespec");

  -- * The resolution of the clocks. The resolution value is returned in
  -- * the clock_getres() system call to give application programmers an
  -- * idea of the (in)accuracy of timers. Timer values are rounded up to
  -- * this resolution values.
  --  

  -- Get the monotonic time in timespec format:  
   procedure ktime_get_ts (ts : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:394
   pragma Import (CPP, ktime_get_ts, "_Z12ktime_get_tsP8timespec");

  -- Get the real (wall-) time in timespec format:  
   function ns_to_ktime (ns : asm_generic_int_ll64_h.u64) return ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:399
   pragma Import (CPP, ns_to_ktime, "_ZL11ns_to_ktimey");

   function ms_to_ktime (ms : asm_generic_int_ll64_h.u64) return ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ktime.h:406
   pragma Import (CPP, ms_to_ktime, "_ZL11ms_to_ktimey");

end linux_ktime_h;

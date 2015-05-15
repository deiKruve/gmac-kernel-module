pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
limited with uapi_linux_time_h;
with linux_types_h;

package linux_jiffies_h is

   --  unsupported macro: SHIFT_HZ 8
   --  arg-macro: function SH_DIV ( (((NOM) / (DEN)) << (LSH)) + ((((NOM) mod (DEN)) << (LSH)) + (DEN) / 2) / (DEN)
   --    return  (((NOM) / (DEN)) << (LSH)) + ((((NOM) mod (DEN)) << (LSH)) + (DEN) / 2) / (DEN);
   --  unsupported macro: LATCH ((CLOCK_TICK_RATE + HZ/2) / HZ)
   --  unsupported macro: TICK_NSEC ((NSEC_PER_SEC+HZ/2)/HZ)
   --  unsupported macro: TICK_USEC ((1000000UL + USER_HZ/2) / USER_HZ)
   --  arg-macro: function time_after (typecheck(unsigned long, a)  and then  typecheck(unsigned long, b)  and then  ((long)((b) - (a)) < 0)
   --    return typecheck(unsigned long, a)  and then  typecheck(unsigned long, b)  and then  ((long)((b) - (a)) < 0);
   --  arg-macro: procedure time_before time_after(b,a)
   --    time_after(b,a)
   --  arg-macro: function time_after_eq (typecheck(unsigned long, a)  and then  typecheck(unsigned long, b)  and then  ((long)((a) - (b)) >= 0)
   --    return typecheck(unsigned long, a)  and then  typecheck(unsigned long, b)  and then  ((long)((a) - (b)) >= 0);
   --  arg-macro: procedure time_before_eq time_after_eq(b,a)
   --    time_after_eq(b,a)
   --  arg-macro: function time_in_range (time_after_eq(a,b)  and then  time_before_eq(a,c)
   --    return time_after_eq(a,b)  and then  time_before_eq(a,c);
   --  arg-macro: function time_in_range_open (time_after_eq(a,b)  and then  time_before(a,c)
   --    return time_after_eq(a,b)  and then  time_before(a,c);
   --  arg-macro: function time_after64 (typecheck(__u64, a)  and then  typecheck(__u64, b)  and then  ((__s64)((b) - (a)) < 0)
   --    return typecheck(__u64, a)  and then  typecheck(__u64, b)  and then  ((__s64)((b) - (a)) < 0);
   --  arg-macro: procedure time_before64 time_after64(b,a)
   --    time_after64(b,a)
   --  arg-macro: function time_after_eq64 (typecheck(__u64, a)  and then  typecheck(__u64, b)  and then  ((__s64)((a) - (b)) >= 0)
   --    return typecheck(__u64, a)  and then  typecheck(__u64, b)  and then  ((__s64)((a) - (b)) >= 0);
   --  arg-macro: procedure time_before_eq64 time_after_eq64(b,a)
   --    time_after_eq64(b,a)
   --  arg-macro: function time_in_range64 (time_after_eq64(a, b)  and then  time_before_eq64(a, c)
   --    return time_after_eq64(a, b)  and then  time_before_eq64(a, c);
   --  arg-macro: procedure time_is_before_jiffies time_after(jiffies, a)
   --    time_after(jiffies, a)
   --  arg-macro: procedure time_is_after_jiffies time_before(jiffies, a)
   --    time_before(jiffies, a)
   --  arg-macro: procedure time_is_before_eq_jiffies time_after_eq(jiffies, a)
   --    time_after_eq(jiffies, a)
   --  arg-macro: procedure time_is_after_eq_jiffies time_before_eq(jiffies, a)
   --    time_before_eq(jiffies, a)
   --  unsupported macro: INITIAL_JIFFIES ((unsigned long)(unsigned int) (-300*HZ))
   --  unsupported macro: MAX_JIFFY_OFFSET ((LONG_MAX >> 1)-1)
   --  unsupported macro: SEC_JIFFIE_SC (32 - SHIFT_HZ)
   --  unsupported macro: NSEC_JIFFIE_SC (SEC_JIFFIE_SC + 29)
   --  unsupported macro: SEC_CONVERSION ((unsigned long)((((u64)NSEC_PER_SEC << SEC_JIFFIE_SC) + TICK_NSEC -1) / (u64)TICK_NSEC))
   --  unsupported macro: NSEC_CONVERSION ((unsigned long)((((u64)1 << NSEC_JIFFIE_SC) + TICK_NSEC -1) / (u64)TICK_NSEC))
   --  unsupported macro: MAX_SEC_IN_JIFFIES (SH_DIV((MAX_JIFFY_OFFSET >> SEC_JIFFIE_SC) * TICK_NSEC, NSEC_PER_SEC, 1) - 1)
   --  unsupported macro: TIMESTAMP_SIZE 30
  -- for HZ  
  -- * The following defines establish the engineering parameters of the PLL
  -- * model. The HZ variable establishes the timer interrupt frequency, 100 Hz
  -- * for the SunOS kernel, 256 Hz for the Ultrix kernel and 1024 Hz for the
  -- * OSF/1 kernel. The SHIFT_HZ define expresses the same value as the
  -- * nearest power of two in order to avoid hardware multiply operations.
  --  

  -- Suppose we want to divide two numbers NOM and DEN: NOM/DEN, then we can
  -- * improve accuracy by shifting LSH bits, hence calculating:
  -- *     (NOM << LSH) / DEN
  -- * This however means trouble for large NOM, because (NOM << LSH) may no
  -- * longer fit in 32 bits. The following way of calculating this gives us
  -- * some slack, under the following conditions:
  -- *   - (NOM / DEN) fits in (32 - LSH) bits.
  -- *   - (NOM % DEN) fits in (32 - LSH) bits.
  --  

  -- LATCH is used in the interval timer and ftape setup.  
   function register_refined_jiffies (clock_tick_rate : long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:57
   pragma Import (CPP, register_refined_jiffies, "_Z24register_refined_jiffiesl");

  -- TICK_NSEC is the time between ticks in nsec assuming SHIFTED_HZ  
  -- TICK_USEC is the time between ticks in usec assuming fake USER_HZ  
  -- some arch's have a small-data section that can be accessed register-relative
  -- * but that can only take up to, say, 4-byte variables. jiffies being part of
  -- * an 8-byte variable may not be correctly accessed unless we force the issue
  --  

  -- * The 64-bit value is not atomic - you MUST NOT read it
  -- * without sampling the sequence number in jiffies_lock.
  -- * get_jiffies_64() will do this for you as appropriate.
  --  

   jiffies_64 : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:76
   pragma Import (C, jiffies_64, "jiffies_64");

   jiffies : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:77
   pragma Import (C, jiffies, "jiffies");

   function get_jiffies_64 return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:82
   pragma Import (CPP, get_jiffies_64, "_ZL14get_jiffies_64v");

  -- *	These inlines deal with timer wrapping correctly. You are 
  -- *	strongly encouraged to use them
  -- *	1. Because people otherwise forget
  -- *	2. Because if the timer wrap changes in future you won't have to
  -- *	   alter your driver code.
  -- *
  -- * time_after(a,b) returns true if the time a is after time b.
  -- *
  -- * Do this with "<0" and ">=0" to only test the sign of the result. A
  -- * good compiler would generate better code (and a really good compiler
  -- * wouldn't care). Gcc is currently neither.
  --  

  -- * Calculate whether a is in the range of [b, c].
  --  

  -- * Calculate whether a is in the range of [b, c).
  --  

  -- Same as above, but does so with platform independent 64bit types.
  -- * These must be used when utilizing jiffies_64 (i.e. return value of
  -- * get_jiffies_64()  

  -- * These four macros compare jiffies and 'a' for convenience.
  --  

  -- time_is_before_jiffies(a) return true if a is before jiffies  
  -- time_is_after_jiffies(a) return true if a is after jiffies  
  -- time_is_before_eq_jiffies(a) return true if a is before or equal to jiffies 
  -- time_is_after_eq_jiffies(a) return true if a is after or equal to jiffies 
  -- * Have the 32 bit jiffies value wrap 5 minutes after boot
  -- * so jiffies wrap bugs show up earlier.
  --  

  -- * Change timeval to jiffies, trying to avoid the
  -- * most obvious overflows..
  -- *
  -- * And some not so obvious.
  -- *
  -- * Note that we don't want to return LONG_MAX, because
  -- * for various timeout reasons we often end up having
  -- * to wait "jiffies+1" in order to guarantee that we wait
  -- * at _least_ "jiffies" - so "jiffies+1" had better still
  -- * be positive.
  --  

   preset_lpj : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:182
   pragma Import (C, preset_lpj, "preset_lpj");

  -- * We want to do realistic conversions of time so we need to use the same
  -- * values the update wall clock code uses as the jiffies size.  This value
  -- * is: TICK_NSEC (which is defined in timex.h).  This
  -- * is a constant and is in nanoseconds.  We will use scaled math
  -- * with a set of scales defined here as SEC_JIFFIE_SC,  USEC_JIFFIE_SC and
  -- * NSEC_JIFFIE_SC.  Note that these defines contain nothing but
  -- * constants and so are computed at compile time.  SHIFT_HZ (computed in
  -- * timex.h) adjusts the scaling for different HZ values.
  -- * Scaled math???  What is that?
  -- *
  -- * Scaled math is a way to do integer math on values that would,
  -- * otherwise, either overflow, underflow, or cause undesired div
  -- * instructions to appear in the execution path.  In short, we "scale"
  -- * up the operands so they take more bits (more precision, less
  -- * underflow), do the desired operation and then "scale" the result back
  -- * by the same amount.  If we do the scaling by shifting we avoid the
  -- * costly mpy and the dastardly div instructions.
  -- * Suppose, for example, we want to convert from seconds to jiffies
  -- * where jiffies is defined in nanoseconds as NSEC_PER_JIFFIE.  The
  -- * simple math is: jiff = (sec * NSEC_PER_SEC) / NSEC_PER_JIFFIE; We
  -- * observe that (NSEC_PER_SEC / NSEC_PER_JIFFIE) is a constant which we
  -- * might calculate at compile time, however, the result will only have
  -- * about 3-4 bits of precision (less for smaller values of HZ).
  -- *
  -- * So, we scale as follows:
  -- * jiff = (sec) * (NSEC_PER_SEC / NSEC_PER_JIFFIE);
  -- * jiff = ((sec) * ((NSEC_PER_SEC * SCALE)/ NSEC_PER_JIFFIE)) / SCALE;
  -- * Then we make SCALE a power of two so:
  -- * jiff = ((sec) * ((NSEC_PER_SEC << SCALE)/ NSEC_PER_JIFFIE)) >> SCALE;
  -- * Now we define:
  -- * #define SEC_CONV = ((NSEC_PER_SEC << SCALE)/ NSEC_PER_JIFFIE))
  -- * jiff = (sec * SEC_CONV) >> SCALE;
  -- *
  -- * Often the math we use will expand beyond 32-bits so we tell C how to
  -- * do this and pass the 64-bit result of the mpy through the ">> SCALE"
  -- * which should take the result back to 32-bits.  We want this expansion
  -- * to capture as much precision as possible.  At the same time we don't
  -- * want to overflow so we pick the SCALE to avoid this.  In this file,
  -- * that means using a different scale for each range of HZ values (as
  -- * defined in timex.h).
  -- *
  -- * For those who want to know, gcc will give a 64-bit result from a "*"
  -- * operator if the result is a long long AND at least one of the
  -- * operands is cast to long long (usually just prior to the "*" so as
  -- * not to confuse it into thinking it really has a 64-bit operand,
  -- * which, buy the way, it can do, but it takes more code and at least 2
  -- * mpys).
  -- * We also need to be aware that one second in nanoseconds is only a
  -- * couple of bits away from overflowing a 32-bit word, so we MUST use
  -- * 64-bits to get the full range time in nanoseconds.
  --  

  -- * Here are the scales we will use.  One for seconds, nanoseconds and
  -- * microseconds.
  -- *
  -- * Within the limits of cpp we do a rough cut at the SEC_JIFFIE_SC and
  -- * check if the sign bit is set.  If not, we bump the shift count by 1.
  -- * (Gets an extra bit of precision where we can use it.)
  -- * We know it is set for HZ = 1024 and HZ = 100 not for 1000.
  -- * Haven't tested others.
  -- * Limits of cpp (for #if expressions) only long (no long long), but
  -- * then we only need the most signicant bit.
  --  

  -- * The maximum jiffie value is (MAX_INT >> 1).  Here we translate that
  -- * into seconds.  The 64-bit case will overflow if we are not careful,
  -- * so use the messy SH_DIV macro to do it.  Still all constants.
  --  

  -- * Convert various time units to each other:
  --  

   function jiffies_to_msecs (j : unsigned_long) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:283
   pragma Import (CPP, jiffies_to_msecs, "_Z16jiffies_to_msecsm");

   function jiffies_to_usecs (j : unsigned_long) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:284
   pragma Import (CPP, jiffies_to_usecs, "_Z16jiffies_to_usecsm");

   function jiffies_to_nsecs (j : unsigned_long) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:286
   pragma Import (CPP, jiffies_to_nsecs, "_ZL16jiffies_to_nsecsm");

   function msecs_to_jiffies (m : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:291
   pragma Import (CPP, msecs_to_jiffies, "_Z16msecs_to_jiffiesj");

   function usecs_to_jiffies (u : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:292
   pragma Import (CPP, usecs_to_jiffies, "_Z16usecs_to_jiffiesj");

   function timespec_to_jiffies (value : access constant uapi_linux_time_h.timespec) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:293
   pragma Import (CPP, timespec_to_jiffies, "_Z19timespec_to_jiffiesPK8timespec");

   procedure jiffies_to_timespec (jiffies : unsigned_long; value : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:294
   pragma Import (CPP, jiffies_to_timespec, "_Z19jiffies_to_timespecmP8timespec");

   function timeval_to_jiffies (value : access constant uapi_linux_time_h.timeval) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:296
   pragma Import (CPP, timeval_to_jiffies, "_Z18timeval_to_jiffiesPK7timeval");

   procedure jiffies_to_timeval (jiffies : unsigned_long; value : access uapi_linux_time_h.timeval);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:297
   pragma Import (CPP, jiffies_to_timeval, "_Z18jiffies_to_timevalmP7timeval");

   function jiffies_to_clock_t (x : unsigned_long) return linux_types_h.clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:300
   pragma Import (CPP, jiffies_to_clock_t, "_Z18jiffies_to_clock_tm");

   function jiffies_delta_to_clock_t (c_delta : long) return linux_types_h.clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:301
   pragma Import (CPP, jiffies_delta_to_clock_t, "_ZL24jiffies_delta_to_clock_tl");

   function clock_t_to_jiffies (x : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:306
   pragma Import (CPP, clock_t_to_jiffies, "_Z18clock_t_to_jiffiesm");

   function jiffies_64_to_clock_t (x : asm_generic_int_ll64_h.u64) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:307
   pragma Import (CPP, jiffies_64_to_clock_t, "_Z21jiffies_64_to_clock_ty");

   function nsec_to_clock_t (x : asm_generic_int_ll64_h.u64) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:308
   pragma Import (CPP, nsec_to_clock_t, "_Z15nsec_to_clock_ty");

   function nsecs_to_jiffies64 (n : asm_generic_int_ll64_h.u64) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:309
   pragma Import (CPP, nsecs_to_jiffies64, "_Z18nsecs_to_jiffies64y");

   function nsecs_to_jiffies (n : asm_generic_int_ll64_h.u64) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jiffies.h:310
   pragma Import (CPP, nsecs_to_jiffies, "_Z16nsecs_to_jiffiesy");

end linux_jiffies_h;

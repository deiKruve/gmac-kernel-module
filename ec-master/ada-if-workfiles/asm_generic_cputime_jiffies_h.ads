pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package asm_generic_cputime_jiffies_h is

   --  unsupported macro: cputime_one_jiffy jiffies_to_cputime(1)
   --  arg-macro: function cputime_to_jiffies (__force unsigned long)(__ct
   --    return __force unsigned long)(__ct;
   --  arg-macro: function cputime_to_scaled (__ct
   --    return __ct;
   --  arg-macro: function jiffies_to_cputime (__force cputime_t)(__hz
   --    return __force cputime_t)(__hz;
   --  arg-macro: function cputime64_to_jiffies64 (__force u64)(__ct
   --    return __force u64)(__ct;
   --  arg-macro: function jiffies64_to_cputime64 (__force cputime64_t)(__jif
   --    return __force cputime64_t)(__jif;
   --  arg-macro: procedure cputime_to_nsecs jiffies_to_nsecs(cputime_to_jiffies(__ct))
   --    jiffies_to_nsecs(cputime_to_jiffies(__ct))
   --  arg-macro: procedure nsecs_to_cputime64 jiffies64_to_cputime64(nsecs_to_jiffies64(__nsec))
   --    jiffies64_to_cputime64(nsecs_to_jiffies64(__nsec))
   --  arg-macro: procedure nsecs_to_cputime jiffies_to_cputime(nsecs_to_jiffies(__nsec))
   --    jiffies_to_cputime(nsecs_to_jiffies(__nsec))
   --  arg-macro: procedure cputime_to_usecs jiffies_to_usecs(cputime_to_jiffies(__ct))
   --    jiffies_to_usecs(cputime_to_jiffies(__ct))
   --  arg-macro: procedure usecs_to_cputime jiffies_to_cputime(usecs_to_jiffies(__usec))
   --    jiffies_to_cputime(usecs_to_jiffies(__usec))
   --  arg-macro: procedure usecs_to_cputime64 jiffies64_to_cputime64(nsecs_to_jiffies64((__usec) * 1000))
   --    jiffies64_to_cputime64(nsecs_to_jiffies64((__usec) * 1000))
   --  arg-macro: function cputime_to_secs (cputime_to_jiffies(jif) / HZ
   --    return cputime_to_jiffies(jif) / HZ;
   --  arg-macro: procedure secs_to_cputime jiffies_to_cputime((sec) * HZ)
   --    jiffies_to_cputime((sec) * HZ)
   --  arg-macro: procedure timespec_to_cputime jiffies_to_cputime(timespec_to_jiffies(__val))
   --    jiffies_to_cputime(timespec_to_jiffies(__val))
   --  arg-macro: procedure cputime_to_timespec jiffies_to_timespec(cputime_to_jiffies(__ct),__val)
   --    jiffies_to_timespec(cputime_to_jiffies(__ct),__val)
   --  arg-macro: procedure timeval_to_cputime jiffies_to_cputime(timeval_to_jiffies(__val))
   --    jiffies_to_cputime(timeval_to_jiffies(__val))
   --  arg-macro: procedure cputime_to_timeval jiffies_to_timeval(cputime_to_jiffies(__ct),__val)
   --    jiffies_to_timeval(cputime_to_jiffies(__ct),__val)
   --  arg-macro: procedure cputime_to_clock_t jiffies_to_clock_t(cputime_to_jiffies(__ct))
   --    jiffies_to_clock_t(cputime_to_jiffies(__ct))
   --  arg-macro: procedure clock_t_to_cputime jiffies_to_cputime(clock_t_to_jiffies(__x))
   --    jiffies_to_cputime(clock_t_to_jiffies(__x))
   --  arg-macro: procedure cputime64_to_clock_t jiffies_64_to_clock_t(cputime64_to_jiffies64(__ct))
   --    jiffies_64_to_clock_t(cputime64_to_jiffies64(__ct))
   subtype cputime_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/cputime_jiffies.h:4

   subtype cputime64_t is asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/cputime_jiffies.h:11

  -- * Convert nanoseconds <-> cputime
  --  

  -- * Convert cputime to microseconds and back.
  --  

  -- * Convert cputime to seconds and back.
  --  

  -- * Convert cputime to timespec and back.
  --  

  -- * Convert cputime to timeval and back.
  --  

  -- * Convert cputime to clock and back.
  --  

  -- * Convert cputime64 to clock.
  --  

end asm_generic_cputime_jiffies_h;

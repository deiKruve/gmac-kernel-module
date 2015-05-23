pragma Ada_2005;
pragma Style_Checks (Off);

-- with Interfaces.C; use Interfaces.C;
-- with Interfaces.C.Extensions;

with Linux_Types;
--with Linux_Time;

-- this module needs reworking since all c defs are inline
-- only the 'Ktime record' is usable.
package Linux_Ktime is
   package L renames Linux_Types;

   -- for amd64
   -- ktime_t definitions when using the 64-bit scalar representation:

   -- * On 64-bit CPUs a single 64-bit variable is used to store the hrtimers
   -- * internal representation of time values in scalar nanoseconds. The
   -- * design plays out best on 64-bit CPUs, where most conversions are
   -- * NOPs and most arithmetic ktime_t operations are plain arithmetic
   -- * operations.

   type Ktime is record
      tv64 : aliased L.s64;
   end record;
   pragma Convention (C_Pass_By_Copy, Ktime);

   subtype ktime_t is Ktime;

   --  function ktime_set (secs : long; nsecs : unsigned_long) return ktime_t;
   --  -- ktime_set - Set a ktime_t variable from a seconds/nanoseconds value
   --  -- secs: seconds to set
   --  -- nsecs:        nanoseconds to set
   --  --
   --  -- Return: The ktime_t representation of the value.
   --  pragma Import (CPP, ktime_set, "ktime_set");

   --  function timespec_to_ktime (ts : linux_time.timespec) return ktime_t;
   --  -- convert a timespec to ktime_t format.
   --  pragma Import (CPP, timespec_to_ktime, "timespec_to_ktime");

   --  function timeval_to_ktime (tv : linux_time.timeval)
   --                        return ktime_t;
   --  -- convert a timeval to ktime_t format
   --  pragma Import (CPP, timeval_to_ktime, "timeval_to_ktime");

   --  function ktime_equal (cmp1 : ktime_t; cmp2 : ktime_t)
   --                   return int;
   --  -- ktime_equal - Compares two ktime_t variables to see if they are equal
   --  --  cmp1:        comparable1
   --  --  cmp2:        comparable2
   --  --
   --  -- Return: 1 if equal.
   --  pragma Import (CPP, ktime_equal, "ktime_equal");

   --  function ktime_compare (cmp1 : ktime_t; cmp2 : ktime_t)
   --                     return int;
   --  -- ktime_compare - Compares two ktime_t variables for less, greater or equal
   --  -- cmp1: comparable1
   --  -- cmp2: comparable2
   --  --
   --  -- Return: ...
   --  --    cmp1  < cmp2: return <0
   --  --    cmp1 == cmp2: return 0
   --  --    cmp1  > cmp2: return >0
   --  pragma Import (CPP, ktime_compare, "ktime_compare");

   --  function ktime_after (cmp1 : ktime_t; cmp2 : ktime_t)
   --                   return Extensions.bool;
   --  -- ktime_after - Compare if a ktime_t value is bigger than another one.
   --  --  cmp1:        comparable1
   --  --  cmp2:        comparable2
   --  --
   --  -- Return: true if cmp1 happened after cmp2.
   --  pragma Import (CPP, ktime_after, "ktime_after");

   --  function ktime_before (cmp1 : ktime_t; cmp2 : ktime_t)
   --                    return Extensions.bool;
--  -- ktime_before - Compare if a ktime_t value is smaller than another one.
--  --  cmp1:        comparable1
--  --  cmp2:        comparable2
   --  --
   --  -- Return: true if cmp1 happened before cmp2.
   --  pragma Import (CPP, ktime_before, "ktime_before");

   --  function ns_to_ktime (ns : L.u64) return ktime_t;
   --  pragma Import (CPP, ns_to_ktime, "ns_to_ktime");

   --  function ktime_to_us (kt : ktime_t) return L.s64;
   --  pragma Import (CPP, ktime_to_us, "ktime_to_us");

   --  function ktime_to_ms (kt : ktime_t) return L.s64;
   --  pragma Import (CPP, ktime_to_ms, "ktime_to_ms");

   --  function ms_to_ktime (ms : L.u64) return ktime_t;
   --  pragma Import (CPP, ms_to_ktime, "ms_to_ktime");

   --  function ktime_us_delta (later : ktime_t; earlier : ktime_t)
   --                      return L.s64;
   --  pragma Import (CPP, ktime_us_delta, "ktime_us_delta");

   --  function ktime_add_us (kt : ktime_t; usec : L.u64)
   --                    return ktime_t;
   --  pragma Import (CPP, ktime_add_us, "ktime_add_us");

   --  function ktime_add_ms (kt : ktime_t; msec : L.u64)
   --                    return ktime_t;
   --  pragma Import (CPP, ktime_add_ms, "ktime_add_ms");

   --  function ktime_sub_us (kt : ktime_t; usec : L.u64)
   --                    return ktime_t;
   --  pragma Import (CPP, ktime_sub_us, "ktime_sub_us");

   --  function ktime_add_safe (lhs : ktime_t; rhs : ktime_t)
   --                      return ktime_t;
   --  pragma Import (CPP, ktime_add_safe, "ktime_add_safe");

   --  function ktime_to_timespec_cond (kt : ktime_t;
   --                               ts : access linux_time.timespec)
   --                              return Extensions.bool;
   --  -- ktime_to_timespec_cond - convert a ktime_t variable to timespec
   --  --                           format only if the variable contains data
   --  --  kt:          the ktime_t variable to convert
   --  --  ts:          the timespec variable to store the result in
   --  --
--  -- Return: %true if there was a successful conversion, %false if kt was 0.
--  pragma Import (CPP, ktime_to_timespec_cond, "ktime_to_timespec_cond");

   --  -- * The resolution of the clocks. The resolution value is returned in
   --  -- * the clock_getres() system call to give application programmers an
   --  -- * idea of the (in)accuracy of timers. Timer values are rounded up to
   --  -- * this resolution values.
   --  --

end Linux_Ktime;

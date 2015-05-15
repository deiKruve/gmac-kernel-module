pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_posix_types_h;

package uapi_linux_time_h is

   --  unsupported macro: ITIMER_REAL 0
   --  unsupported macro: ITIMER_VIRTUAL 1
   --  unsupported macro: ITIMER_PROF 2
   --  unsupported macro: CLOCK_REALTIME 0
   --  unsupported macro: CLOCK_MONOTONIC 1
   --  unsupported macro: CLOCK_PROCESS_CPUTIME_ID 2
   --  unsupported macro: CLOCK_THREAD_CPUTIME_ID 3
   --  unsupported macro: CLOCK_MONOTONIC_RAW 4
   --  unsupported macro: CLOCK_REALTIME_COARSE 5
   --  unsupported macro: CLOCK_MONOTONIC_COARSE 6
   --  unsupported macro: CLOCK_BOOTTIME 7
   --  unsupported macro: CLOCK_REALTIME_ALARM 8
   --  unsupported macro: CLOCK_BOOTTIME_ALARM 9
   --  unsupported macro: CLOCK_SGI_CYCLE 10
   --  unsupported macro: CLOCK_TAI 11
   --  unsupported macro: MAX_CLOCKS 16
   --  unsupported macro: CLOCKS_MASK (CLOCK_REALTIME | CLOCK_MONOTONIC)
   --  unsupported macro: CLOCKS_MONO CLOCK_MONOTONIC
   --  unsupported macro: TIMER_ABSTIME 0x01
  -- seconds  
   type timespec is record
      tv_sec : aliased uapi_asm_generic_posix_types_h.uu_kernel_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:10
      tv_nsec : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:11
   end record;
   pragma Convention (C_Pass_By_Copy, timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:9

  -- nanoseconds  
  -- seconds  
   type timeval is record
      tv_sec : aliased uapi_asm_generic_posix_types_h.uu_kernel_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:16
      tv_usec : aliased uapi_asm_generic_posix_types_h.uu_kernel_suseconds_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:17
   end record;
   pragma Convention (C_Pass_By_Copy, timeval);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:15

  -- microseconds  
  -- minutes west of Greenwich  
   type timezone is record
      tz_minuteswest : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:21
      tz_dsttime : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:22
   end record;
   pragma Convention (C_Pass_By_Copy, timezone);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:20

  -- type of dst correction  
  -- * Names of the interval timers, and structure
  -- * defining a timer setting:
  --  

  -- timer period  
   type itimerspec is record
      it_interval : aliased timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:35
      it_value : aliased timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, itimerspec);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:34

  -- timer expiration  
  -- timer interval  
   type itimerval is record
      it_interval : aliased timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:40
      it_value : aliased timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:41
   end record;
   pragma Convention (C_Pass_By_Copy, itimerval);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/time.h:39

  -- current value  
  -- * The IDs of the various system clocks (for POSIX.1b interval timers):
  --  

  -- * The various flags for setting POSIX.1b interval timers:
  --  

end uapi_linux_time_h;

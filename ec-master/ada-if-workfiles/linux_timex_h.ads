pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with uapi_linux_timex_h;
limited with uapi_linux_time_h;

package linux_timex_h is

   --  unsupported macro: ADJ_ADJTIME 0x8000
   --  unsupported macro: ADJ_OFFSET_SINGLESHOT 0x0001
   --  unsupported macro: ADJ_OFFSET_READONLY 0x2000
   --  arg-macro: procedure random_get_entropy get_cycles()
   --    get_cycles()
   --  unsupported macro: SHIFT_PLL 2
   --  unsupported macro: SHIFT_FLL 2
   --  unsupported macro: MAXTC 10
   --  unsupported macro: SHIFT_USEC 16
   --  unsupported macro: PPM_SCALE ((s64)NSEC_PER_USEC << (NTP_SCALE_SHIFT - SHIFT_USEC))
   --  unsupported macro: PPM_SCALE_INV_SHIFT 19
   --  unsupported macro: PPM_SCALE_INV ((1LL << (PPM_SCALE_INV_SHIFT + NTP_SCALE_SHIFT)) / PPM_SCALE + 1)
   --  unsupported macro: MAXPHASE 500000000L
   --  unsupported macro: MAXFREQ 500000
   --  unsupported macro: MAXFREQ_SCALED ((s64)MAXFREQ << NTP_SCALE_SHIFT)
   --  unsupported macro: MINSEC 256
   --  unsupported macro: MAXSEC 2048
   --  unsupported macro: NTP_PHASE_LIMIT ((MAXPHASE / NSEC_PER_USEC) << 5)
   --  arg-macro: function shift_right ({ __typeof__(x) __x := (x); __typeof__(s) __s := (s); __x < 0 ? -(-__x >> __s) : __x >> __s; }
   --    return { __typeof__(x) __x := (x); __typeof__(s) __s := (s); __x < 0 ? -(-__x >> __s) : __x >> __s; };
   --  unsupported macro: NTP_SCALE_SHIFT 32
   --  unsupported macro: NTP_INTERVAL_FREQ (HZ)
   --  unsupported macro: NTP_INTERVAL_LENGTH (NSEC_PER_SEC/NTP_INTERVAL_FREQ)
   --  unsupported macro: PIT_TICK_RATE 1193182ul
  --****************************************************************************
  -- *                                                                           *
  -- * Copyright (c) David L. Mills 1993                                         *
  -- *                                                                           *
  -- * Permission to use, copy, modify, and distribute this software and its     *
  -- * documentation for any purpose and without fee is hereby granted, provided *
  -- * that the above copyright notice appears in all copies and that both the   *
  -- * copyright notice and this permission notice appear in supporting          *
  -- * documentation, and that the name University of Delaware not be used in    *
  -- * advertising or publicity pertaining to distribution of the software       *
  -- * without specific, written prior permission.  The University of Delaware   *
  -- * makes no representations about the suitability this software for any      *
  -- * purpose.  It is provided "as is" without express or implied warranty.     *
  -- *                                                                           *
  -- **************************************************************************** 

  -- * Modification history timex.h
  -- *
  -- * 29 Dec 97	Russell King
  -- *	Moved CLOCK_TICK_RATE, CLOCK_TICK_FACTOR and FINETUNE to asm/timex.h
  -- *	for ARM machines
  -- *
  -- *  9 Jan 97    Adrian Sun
  -- *      Shifted LATCH define to allow access to alpha machines.
  -- *
  -- * 26 Sep 94	David L. Mills
  -- *	Added defines for hybrid phase/frequency-lock loop.
  -- *
  -- * 19 Mar 94	David L. Mills
  -- *	Moved defines from kernel routines to header file and added new
  -- *	defines for PPS phase-lock loop.
  -- *
  -- * 20 Feb 94	David L. Mills
  -- *	Revised status codes and structures for external clock and PPS
  -- *	signal discipline.
  -- *
  -- * 28 Nov 93	David L. Mills
  -- *	Adjusted parameters to improve stability and increase poll
  -- *	interval.
  -- *
  -- * 17 Sep 93    David L. Mills
  -- *      Created file $NTP/include/sys/timex.h
  -- * 07 Oct 93    Torsten Duwe
  -- *      Derived linux/timex.h
  -- * 1995-08-13    Torsten Duwe
  -- *      kernel PLL updated to 1994-12-13 specs (rfc-1589)
  -- * 1997-08-30    Ulrich Windl
  -- *      Added new constant NTP_PHASE_LIMIT
  -- * 2004-08-12    Christoph Lameter
  -- *      Reworked time interpolation logic
  --  

  -- * The random_get_entropy() function is used by the /dev/random driver
  -- * in order to extract entropy via the relative unpredictability of
  -- * when an interrupt takes places versus a high speed, fine-grained
  -- * timing source or cycle counter.  Since it will be occurred on every
  -- * single interrupt, it must have a very low cost/overhead.
  -- *
  -- * By default we use get_cycles() for this purpose, but individual
  -- * architectures may override this in their asm/timex.h header file.
  --  

  -- * SHIFT_PLL is used as a dampening factor to define how much we
  -- * adjust the frequency correction for a given offset in PLL mode.
  -- * It also used in dampening the offset correction, to define how
  -- * much of the current value in time_offset we correct for each
  -- * second. Changing this value changes the stiffness of the ntp
  -- * adjustment code. A lower value makes it more flexible, reducing
  -- * NTP convergence time. A higher value makes it stiffer, increasing
  -- * convergence time, but making the clock more stable.
  -- *
  -- * In David Mills' nanokernel reference implementation SHIFT_PLL is 4.
  -- * However this seems to increase convergence time much too long.
  -- *
  -- * https://lists.ntp.org/pipermail/hackers/2008-January/003487.html
  -- *
  -- * In the above mailing list discussion, it seems the value of 4
  -- * was appropriate for other Unix systems with HZ=100, and that
  -- * SHIFT_PLL should be decreased as HZ increases. However, Linux's
  -- * clock steering implementation is HZ independent.
  -- *
  -- * Through experimentation, a SHIFT_PLL value of 2 was found to allow
  -- * for fast convergence (very similar to the NTPv3 code used prior to
  -- * v2.6.19), with good clock stability.
  -- *
  -- *
  -- * SHIFT_FLL is used as a dampening factor to define how much we
  -- * adjust the frequency correction for a given offset in FLL mode.
  -- * In David Mills' nanokernel reference implementation SHIFT_FLL is 2.
  -- *
  -- * MAXTC establishes the maximum time constant of the PLL.
  --  

  -- * SHIFT_USEC defines the scaling (shift) of the time_freq and
  -- * time_tolerance variables, which represent the current frequency
  -- * offset and maximum frequency tolerance.
  --  

  -- * kernel variables
  -- * Note: maximum error = NTP synch distance = dispersion + delay / 2;
  -- * estimated error = NTP dispersion.
  --  

  -- USER_HZ period (usec)  
   tick_usec : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timex.h:139
   pragma Import (C, tick_usec, "tick_usec");

  -- SHIFTED_HZ period (nsec)  
   tick_nsec : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timex.h:140
   pragma Import (C, tick_nsec, "tick_nsec");

  -- Required to safely shift negative values  
   function do_adjtimex (arg1 : access uapi_linux_timex_h.timex) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timex.h:154
   pragma Import (CPP, do_adjtimex, "_Z11do_adjtimexP5timex");

   procedure hardpps (arg1 : access constant uapi_linux_time_h.timespec; arg2 : access constant uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timex.h:155
   pragma Import (CPP, hardpps, "_Z7hardppsPK8timespecS1_");

   function read_current_timer (timer_val : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timex.h:157
   pragma Import (CPP, read_current_timer, "_Z18read_current_timerPm");

   procedure ntp_notify_cmos_timer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/timex.h:158
   pragma Import (CPP, ntp_notify_cmos_timer, "_Z21ntp_notify_cmos_timerv");

  -- The clock frequency of the i8253/i8254 PIT  
end linux_timex_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_posix_types_h;
with uapi_linux_time_h;

package uapi_linux_timex_h is

   --  unsupported macro: NTP_API 4
   --  unsupported macro: ADJ_OFFSET 0x0001
   --  unsupported macro: ADJ_FREQUENCY 0x0002
   --  unsupported macro: ADJ_MAXERROR 0x0004
   --  unsupported macro: ADJ_ESTERROR 0x0008
   --  unsupported macro: ADJ_STATUS 0x0010
   --  unsupported macro: ADJ_TIMECONST 0x0020
   --  unsupported macro: ADJ_TAI 0x0080
   --  unsupported macro: ADJ_SETOFFSET 0x0100
   --  unsupported macro: ADJ_MICRO 0x1000
   --  unsupported macro: ADJ_NANO 0x2000
   --  unsupported macro: ADJ_TICK 0x4000
   --  unsupported macro: MOD_OFFSET ADJ_OFFSET
   --  unsupported macro: MOD_FREQUENCY ADJ_FREQUENCY
   --  unsupported macro: MOD_MAXERROR ADJ_MAXERROR
   --  unsupported macro: MOD_ESTERROR ADJ_ESTERROR
   --  unsupported macro: MOD_STATUS ADJ_STATUS
   --  unsupported macro: MOD_TIMECONST ADJ_TIMECONST
   --  unsupported macro: MOD_TAI ADJ_TAI
   --  unsupported macro: MOD_MICRO ADJ_MICRO
   --  unsupported macro: MOD_NANO ADJ_NANO
   --  unsupported macro: STA_PLL 0x0001
   --  unsupported macro: STA_PPSFREQ 0x0002
   --  unsupported macro: STA_PPSTIME 0x0004
   --  unsupported macro: STA_FLL 0x0008
   --  unsupported macro: STA_INS 0x0010
   --  unsupported macro: STA_DEL 0x0020
   --  unsupported macro: STA_UNSYNC 0x0040
   --  unsupported macro: STA_FREQHOLD 0x0080
   --  unsupported macro: STA_PPSSIGNAL 0x0100
   --  unsupported macro: STA_PPSJITTER 0x0200
   --  unsupported macro: STA_PPSWANDER 0x0400
   --  unsupported macro: STA_PPSERROR 0x0800
   --  unsupported macro: STA_CLOCKERR 0x1000
   --  unsupported macro: STA_NANO 0x2000
   --  unsupported macro: STA_MODE 0x4000
   --  unsupported macro: STA_CLK 0x8000
   --  unsupported macro: STA_RONLY (STA_PPSSIGNAL | STA_PPSJITTER | STA_PPSWANDER | STA_PPSERROR | STA_CLOCKERR | STA_NANO | STA_MODE | STA_CLK)
   --  unsupported macro: TIME_OK 0
   --  unsupported macro: TIME_INS 1
   --  unsupported macro: TIME_DEL 2
   --  unsupported macro: TIME_OOP 3
   --  unsupported macro: TIME_WAIT 4
   --  unsupported macro: TIME_ERROR 5
   --  unsupported macro: TIME_BAD TIME_ERROR
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

  -- * syscall interface - used (mainly by NTP daemon)
  -- * to discipline kernel clock oscillator
  --  

  -- mode selector  
   type timex is record
      modes : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:65
      offset : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:66
      freq : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:67
      maxerror : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:68
      esterror : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:69
      status : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:70
      c_constant : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:71
      precision : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:72
      tolerance : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:73
      time : aliased uapi_linux_time_h.timeval;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:76
      tick : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:77
      ppsfreq : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:79
      jitter : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:80
      shift : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:81
      stabil : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:82
      jitcnt : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:83
      calcnt : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:84
      errcnt : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:85
      stbcnt : aliased uapi_asm_generic_posix_types_h.uu_kernel_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:86
      tai : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:88
      field_21 : aliased int;
      field_22 : aliased int;
      field_23 : aliased int;
      field_24 : aliased int;
      field_25 : aliased int;
      field_26 : aliased int;
      field_27 : aliased int;
      field_28 : aliased int;
      field_29 : aliased int;
      field_30 : aliased int;
      field_31 : aliased int;
   end record;
   pragma Convention (C_Pass_By_Copy, timex);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/timex.h:64

  -- time offset (usec)  
  -- frequency offset (scaled ppm)  
  -- maximum error (usec)  
  -- estimated error (usec)  
  -- clock command/status  
  -- pll time constant  
  -- clock precision (usec) (read only)  
  -- clock frequency tolerance (ppm)
  --				   * (read only)
  --				    

  -- (read only, except for ADJ_SETOFFSET)  
  -- (modified) usecs between clock ticks  
  -- pps frequency (scaled ppm) (ro)  
  -- pps jitter (us) (ro)  
  -- interval duration (s) (shift) (ro)  
  -- pps stability (scaled ppm) (ro)  
  -- jitter limit exceeded (ro)  
  -- calibration intervals (ro)  
  -- calibration errors (ro)  
  -- stability limit exceeded (ro)  
  -- TAI offset (ro)  
  -- * Mode codes (timex.mode)
  --  

  -- NTP userland likes the MOD_ prefix better  
  -- * Status codes (timex.status)
  --  

  -- read-only bits  
  -- * Clock states (time_state)
  --  

end uapi_linux_timex_h;

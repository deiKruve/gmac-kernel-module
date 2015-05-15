pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_delay_h is

   --  unsupported macro: MAX_UDELAY_MS 5
   --  arg-macro: function mdelay ( (__builtin_constant_p(n)  and then  (n)<=MAX_UDELAY_MS) ? udelay((n)*1000) : ({unsigned long __ms:=(n); while (__ms--) udelay(1000);})
   --    return  (__builtin_constant_p(n)  and then  (n)<=MAX_UDELAY_MS) ? udelay((n)*1000) : ({unsigned long __ms:=(n); while (__ms--) udelay(1000);});
  -- * Copyright (C) 1993 Linus Torvalds
  -- *
  -- * Delay routines, using a pre-computed "loops_per_jiffy" value.
  --  

   loops_per_jiffy : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/delay.h:12
   pragma Import (C, loops_per_jiffy, "loops_per_jiffy");

  -- * Using udelay() for intervals greater than a few milliseconds can
  -- * risk overflow for high loops_per_jiffy (high bogomips) machines. The
  -- * mdelay() provides a wrapper to prevent this.  For delays greater
  -- * than MAX_UDELAY_MS milliseconds, the wrapper is used.  Architecture
  -- * specific values can be defined in asm-???/delay.h as an override.
  -- * The 2nd mdelay() definition ensures GCC will optimize away the 
  -- * while loop for the common cases where n <= MAX_UDELAY_MS  --  Paul G.
  --  

   lpj_fine : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/delay.h:44
   pragma Import (C, lpj_fine, "lpj_fine");

   procedure calibrate_delay;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/delay.h:45
   pragma Import (CPP, calibrate_delay, "_Z15calibrate_delayv");

   procedure msleep (msecs : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/delay.h:46
   pragma Import (CPP, msleep, "_Z6msleepj");

   function msleep_interruptible (msecs : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/delay.h:47
   pragma Import (CPP, msleep_interruptible, "_Z20msleep_interruptiblej");

   procedure usleep_range (min : unsigned_long; max : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/delay.h:48
   pragma Import (CPP, usleep_range, "_Z12usleep_rangemm");

   procedure ssleep (seconds : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/delay.h:50
   pragma Import (CPP, ssleep, "_ZL6ssleepj");

end linux_delay_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;

package asm_tsc_h is

   --  unsupported macro: NS_SCALE 10
   --  unsupported macro: US_SCALE 32
  -- * x86 TSC related functions
  --  

  -- * Standard way to access the cycle counter.
  --  

   subtype cycles_t is Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:15

   cpu_khz : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:17
   pragma Import (C, cpu_khz, "cpu_khz");

   tsc_khz : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:18
   pragma Import (C, tsc_khz, "tsc_khz");

   procedure disable_TSC;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:20
   pragma Import (CPP, disable_TSC, "_Z11disable_TSCv");

   function get_cycles return cycles_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:22
   pragma Import (CPP, get_cycles, "_ZL10get_cyclesv");

   function vget_cycles return cycles_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:35
   pragma Import (CPP, vget_cycles, "_ZL11vget_cyclesv");

  --	 * We only do VDSOs on TSC capable CPUs, so this shouldn't
  --	 * access boot_cpu_data (which is not VDSO-safe):
  --	  

   procedure tsc_init;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:48
   pragma Import (CPP, tsc_init, "_Z8tsc_initv");

   procedure mark_tsc_unstable (reason : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:49
   pragma Import (CPP, mark_tsc_unstable, "_Z17mark_tsc_unstablePc");

   function unsynchronized_tsc return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:50
   pragma Import (CPP, unsynchronized_tsc, "_Z18unsynchronized_tscv");

   function check_tsc_unstable return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:51
   pragma Import (CPP, check_tsc_unstable, "_Z18check_tsc_unstablev");

   function check_tsc_disabled return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:52
   pragma Import (CPP, check_tsc_disabled, "_Z18check_tsc_disabledv");

   function native_calibrate_tsc return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:53
   pragma Import (CPP, native_calibrate_tsc, "_Z20native_calibrate_tscv");

   tsc_clocksource_reliable : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:55
   pragma Import (C, tsc_clocksource_reliable, "tsc_clocksource_reliable");

  -- * Boot-time check whether the TSCs are synchronized across
  -- * all CPUs/cores:
  --  

   procedure check_tsc_sync_source (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:61
   pragma Import (CPP, check_tsc_sync_source, "_Z21check_tsc_sync_sourcei");

   procedure check_tsc_sync_target;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:62
   pragma Import (CPP, check_tsc_sync_target, "_Z21check_tsc_sync_targetv");

   function notsc_setup (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:64
   pragma Import (CPP, notsc_setup, "_Z11notsc_setupPc");

   procedure tsc_save_sched_clock_state;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:65
   pragma Import (CPP, tsc_save_sched_clock_state, "_Z26tsc_save_sched_clock_statev");

   procedure tsc_restore_sched_clock_state;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:66
   pragma Import (CPP, tsc_restore_sched_clock_state, "_Z29tsc_restore_sched_clock_statev");

  -- MSR based TSC calibration for Intel Atom SoC platforms  
   function try_msr_calibrate_tsc return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/tsc.h:69
   pragma Import (CPP, try_msr_calibrate_tsc, "_Z21try_msr_calibrate_tscv");

end asm_tsc_h;

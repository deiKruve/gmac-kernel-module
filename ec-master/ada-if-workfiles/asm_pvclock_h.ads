pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_pvclock_abi_h;
with linux_clocksource_h;
with asm_generic_int_ll64_h;
limited with uapi_linux_time_h;

package asm_pvclock_h is

   --  unsupported macro: PVTI_SIZE sizeof(struct pvclock_vsyscall_time_info)
   --  unsupported macro: PVCLOCK_VSYSCALL_NR_PAGES (((NR_CPUS-1)/(PAGE_SIZE/PVTI_SIZE))+1)
  -- some helper functions for xen and kvm pv clock sources  
   function pvclock_clocksource_read (src : access asm_pvclock_abi_h.pvclock_vcpu_time_info) return linux_clocksource_h.cycle_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:8
   pragma Import (CPP, pvclock_clocksource_read, "_Z24pvclock_clocksource_readP22pvclock_vcpu_time_info");

   function pvclock_read_flags (src : access asm_pvclock_abi_h.pvclock_vcpu_time_info) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:9
   pragma Import (CPP, pvclock_read_flags, "_Z18pvclock_read_flagsP22pvclock_vcpu_time_info");

   procedure pvclock_set_flags (flags : asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:10
   pragma Import (CPP, pvclock_set_flags, "_Z17pvclock_set_flagsh");

   function pvclock_tsc_khz (src : access asm_pvclock_abi_h.pvclock_vcpu_time_info) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:11
   pragma Import (CPP, pvclock_tsc_khz, "_Z15pvclock_tsc_khzP22pvclock_vcpu_time_info");

   procedure pvclock_read_wallclock
     (wall : access asm_pvclock_abi_h.pvclock_wall_clock;
      vcpu : access asm_pvclock_abi_h.pvclock_vcpu_time_info;
      ts : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:12
   pragma Import (CPP, pvclock_read_wallclock, "_Z22pvclock_read_wallclockP18pvclock_wall_clockP22pvclock_vcpu_time_infoP8timespec");

   procedure pvclock_resume;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:15
   pragma Import (CPP, pvclock_resume, "_Z14pvclock_resumev");

   procedure pvclock_touch_watchdogs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:17
   pragma Import (CPP, pvclock_touch_watchdogs, "_Z23pvclock_touch_watchdogsv");

  -- * Scale a 64-bit delta by scaling and multiplying by a 32-bit fraction,
  -- * yielding a 64-bit result.
  --  

   function pvclock_scale_delta
     (c_delta : asm_generic_int_ll64_h.u64;
      mul_frac : asm_generic_int_ll64_h.u32;
      shift : int) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:23
   pragma Import (CPP, pvclock_scale_delta, "_ZL19pvclock_scale_deltayji");

   function pvclock_get_nsec_offset (src : access constant asm_pvclock_abi_h.pvclock_vcpu_time_info) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:63
   pragma Import (CPP, pvclock_get_nsec_offset, "_ZL23pvclock_get_nsec_offsetPK22pvclock_vcpu_time_info");

   --  skipped func __pvclock_read_cycles

  -- Note: emulated platforms which do not advertise SSE2 support
  --	 * result in kvmclock not using the necessary RDTSC barriers.
  --	 * Without barriers, it is possible that RDTSC instruction reads from
  --	 * the time stamp counter outside rdtsc_barrier protected section
  --	 * below, resulting in violation of monotonicity.
  --	  

   type pvclock_vsyscall_time_info is record
      pvti : aliased asm_pvclock_abi_h.pvclock_vcpu_time_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:97
   end record;
   pragma Convention (C_Pass_By_Copy, pvclock_vsyscall_time_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:96

   function pvclock_init_vsyscall (i : access pvclock_vsyscall_time_info; size : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:103
   pragma Import (CPP, pvclock_init_vsyscall, "_Z21pvclock_init_vsyscallP26pvclock_vsyscall_time_infoi");

   function pvclock_get_vsyscall_time_info (cpu : int) return access asm_pvclock_abi_h.pvclock_vcpu_time_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock.h:105
   pragma Import (CPP, pvclock_get_vsyscall_time_info, "_Z30pvclock_get_vsyscall_time_infoi");

end asm_pvclock_h;

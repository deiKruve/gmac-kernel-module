pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with asm_generic_int_ll64_h;
with Interfaces.C.Strings;
limited with linux_cpumask_h;
limited with asm_mpspec_h;
limited with asm_mpspec_def_h;
with linux_types_h;

package asm_apic_h is

   --  unsupported macro: ARCH_APICTIMER_STOPS_ON_C3 1
   --  unsupported macro: APIC_QUIET 0
   --  unsupported macro: APIC_VERBOSE 1
   --  unsupported macro: APIC_DEBUG 2
   --  unsupported macro: apic_printk(v,s,a...) do { if ((v) <= apic_verbosity) printk(s, ##a); } while (0)
   --  arg-macro: function x2apic_supported (cpu_has_x2apic
   --    return cpu_has_x2apic;
   --  arg-macro: function SET_APIC_ID (apic.set_apic_id(x)
   --    return apic.set_apic_id(x);
   --  unsupported macro: apic_driver(sym) static const struct apic *__apicdrivers_ ##sym __used __aligned(sizeof(struct apic *)) __section(.apicdrivers) = { &sym }
   --  unsupported macro: apic_drivers(sym1,sym2) static struct apic *__apicdrivers_ ##sym1 ##sym2[2] __used __aligned(sizeof(struct apic *)) __section(.apicdrivers) = { &sym1, &sym2 }
   --  unsupported macro: DEFAULT_TRAMPOLINE_PHYS_LOW 0x467
   --  unsupported macro: DEFAULT_TRAMPOLINE_PHYS_HIGH 0x469
   --  unsupported macro: APIC_DFR_VALUE (APIC_DFR_FLAT)
  -- * Debugging macros
  --  

  -- * Define the default level of output to be very little
  -- * This can be turned up by using apic=verbose for more
  -- * information and apic=debug for _lots_ of information.
  -- * apic_verbosity is defined in apic.c
  --  

   procedure generic_apic_probe;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:41
   pragma Import (CPP, generic_apic_probe, "_ZL18generic_apic_probev");

   apic_verbosity : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:48
   pragma Import (C, apic_verbosity, "apic_verbosity");

   local_apic_timer_c2_ok : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:49
   pragma Import (C, local_apic_timer_c2_ok, "local_apic_timer_c2_ok");

   disable_apic : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:51
   pragma Import (C, disable_apic, "disable_apic");

   lapic_timer_frequency : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:52
   pragma Import (C, lapic_timer_frequency, "lapic_timer_frequency");

   --  skipped func __inquire_remote_apic

   procedure default_inquire_remote_apic (apicid : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:62
   pragma Import (CPP, default_inquire_remote_apic, "_ZL27default_inquire_remote_apici");

  -- * With 82489DX we can't rely on apic feature bit
  -- * retrieved via cpuid but still have to deal with
  -- * such an apic chip so we assume that SMP configuration
  -- * is found from MP table (64bit case uses ACPI mostly
  -- * which set smp presence flag as well so we are safe
  -- * to use this helper too).
  --  

   function apic_from_smp_config return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:76
   pragma Import (CPP, apic_from_smp_config, "_ZL20apic_from_smp_configv");

  -- * Basic functions accessing APICs.
  --  

   function is_vsmp_box return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:89
   pragma Import (CPP, is_vsmp_box, "_Z11is_vsmp_boxv");

   procedure native_apic_mem_write (reg : asm_generic_int_ll64_h.u32; v : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:98
   pragma Import (CPP, native_apic_mem_write, "_ZL21native_apic_mem_writejj");

   function native_apic_mem_read (reg : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:107
   pragma Import (CPP, native_apic_mem_read, "_ZL20native_apic_mem_readj");

   procedure native_apic_wait_icr_idle;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:112
   pragma Import (CPP, native_apic_wait_icr_idle, "_Z25native_apic_wait_icr_idlev");

   function native_safe_apic_wait_icr_idle return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:113
   pragma Import (CPP, native_safe_apic_wait_icr_idle, "_Z30native_safe_apic_wait_icr_idlev");

   procedure native_apic_icr_write (low : asm_generic_int_ll64_h.u32; id : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:114
   pragma Import (CPP, native_apic_icr_write, "_Z21native_apic_icr_writejj");

   function native_apic_icr_read return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:115
   pragma Import (CPP, native_apic_icr_read, "_Z20native_apic_icr_readv");

   x2apic_mode : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:117
   pragma Import (C, x2apic_mode, "x2apic_mode");

  -- * Make previous memory operations globally visible before
  -- * sending the IPI through x2apic wrmsr. We need a serializing instruction or
  -- * mfence for this.
  --  

   procedure x2apic_wrmsr_fence;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:125
   pragma Import (CPP, x2apic_wrmsr_fence, "_ZL18x2apic_wrmsr_fencev");

   procedure native_apic_msr_write (reg : asm_generic_int_ll64_h.u32; v : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:130
   pragma Import (CPP, native_apic_msr_write, "_ZL21native_apic_msr_writejj");

   procedure native_apic_msr_eoi_write (reg : asm_generic_int_ll64_h.u32; v : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:139
   pragma Import (CPP, native_apic_msr_eoi_write, "_ZL25native_apic_msr_eoi_writejj");

   function native_apic_msr_read (reg : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:144
   pragma Import (CPP, native_apic_msr_read, "_ZL20native_apic_msr_readj");

   procedure native_x2apic_wait_icr_idle;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:155
   pragma Import (CPP, native_x2apic_wait_icr_idle, "_ZL27native_x2apic_wait_icr_idlev");

  -- no need to wait for icr idle in x2apic  
   function native_safe_x2apic_wait_icr_idle return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:161
   pragma Import (CPP, native_safe_x2apic_wait_icr_idle, "_ZL32native_safe_x2apic_wait_icr_idlev");

  -- no need to wait for icr idle in x2apic  
   procedure native_x2apic_icr_write (low : asm_generic_int_ll64_h.u32; id : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:167
   pragma Import (CPP, native_x2apic_icr_write, "_ZL23native_x2apic_icr_writejj");

   function native_x2apic_icr_read return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:172
   pragma Import (CPP, native_x2apic_icr_read, "_ZL22native_x2apic_icr_readv");

   x2apic_phys : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:180
   pragma Import (C, x2apic_phys, "x2apic_phys");

   x2apic_preenabled : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:181
   pragma Import (C, x2apic_preenabled, "x2apic_preenabled");

   procedure check_x2apic;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:182
   pragma Import (CPP, check_x2apic, "_Z12check_x2apicv");

   procedure enable_x2apic;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:183
   pragma Import (CPP, enable_x2apic, "_Z13enable_x2apicv");

   function x2apic_enabled return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:184
   pragma Import (CPP, x2apic_enabled, "_ZL14x2apic_enabledv");

   procedure x2apic_force_phys;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:198
   pragma Import (CPP, x2apic_force_phys, "_ZL17x2apic_force_physv");

   procedure enable_IR_x2apic;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:224
   pragma Import (CPP, enable_IR_x2apic, "_Z16enable_IR_x2apicv");

   function get_physical_broadcast return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:226
   pragma Import (CPP, get_physical_broadcast, "_Z22get_physical_broadcastv");

   function lapic_get_maxlvt return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:228
   pragma Import (CPP, lapic_get_maxlvt, "_Z16lapic_get_maxlvtv");

   procedure clear_local_APIC;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:229
   pragma Import (CPP, clear_local_APIC, "_Z16clear_local_APICv");

   procedure connect_bsp_APIC;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:230
   pragma Import (CPP, connect_bsp_APIC, "_Z16connect_bsp_APICv");

   procedure disconnect_bsp_APIC (virt_wire_setup : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:231
   pragma Import (CPP, disconnect_bsp_APIC, "_Z19disconnect_bsp_APICi");

   procedure disable_local_APIC;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:232
   pragma Import (CPP, disable_local_APIC, "_Z18disable_local_APICv");

   procedure lapic_shutdown;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:233
   pragma Import (CPP, lapic_shutdown, "_Z14lapic_shutdownv");

   function verify_local_APIC return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:234
   pragma Import (CPP, verify_local_APIC, "_Z17verify_local_APICv");

   procedure sync_Arb_IDs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:235
   pragma Import (CPP, sync_Arb_IDs, "_Z12sync_Arb_IDsv");

   procedure init_bsp_APIC;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:236
   pragma Import (CPP, init_bsp_APIC, "_Z13init_bsp_APICv");

   procedure setup_local_APIC;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:237
   pragma Import (CPP, setup_local_APIC, "_Z16setup_local_APICv");

   procedure end_local_APIC_setup;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:238
   pragma Import (CPP, end_local_APIC_setup, "_Z20end_local_APIC_setupv");

   procedure bsp_end_local_APIC_setup;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:239
   pragma Import (CPP, bsp_end_local_APIC_setup, "_Z24bsp_end_local_APIC_setupv");

   procedure init_apic_mappings;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:240
   pragma Import (CPP, init_apic_mappings, "_Z18init_apic_mappingsv");

   procedure register_lapic_address (address : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:241
   pragma Import (CPP, register_lapic_address, "_Z22register_lapic_addressm");

   procedure setup_boot_APIC_clock;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:242
   pragma Import (CPP, setup_boot_APIC_clock, "_Z21setup_boot_APIC_clockv");

   procedure setup_secondary_APIC_clock;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:243
   pragma Import (CPP, setup_secondary_APIC_clock, "_Z26setup_secondary_APIC_clockv");

   function APIC_init_uniprocessor return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:244
   pragma Import (CPP, APIC_init_uniprocessor, "_Z22APIC_init_uniprocessorv");

   function apic_force_enable (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:245
   pragma Import (CPP, apic_force_enable, "_Z17apic_force_enablem");

  -- * On 32bit this is mach-xxx local
  --  

   function apic_is_clustered_box return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:251
   pragma Import (CPP, apic_is_clustered_box, "_Z21apic_is_clustered_boxv");

   function setup_APIC_eilvt
     (lvt_off : asm_generic_int_ll64_h.u8;
      vector : asm_generic_int_ll64_h.u8;
      msg_type : asm_generic_int_ll64_h.u8;
      mask : asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:259
   pragma Import (CPP, setup_APIC_eilvt, "_Z16setup_APIC_eilvthhhh");

  -- * Copyright 2004 James Cleverdon, IBM.
  -- * Subject to the GNU Public License, v.2
  -- *
  -- * Generic APIC sub-arch data struct.
  -- *
  -- * Hacked for x86-64 by James Cleverdon from i386 architecture code by
  -- * Martin Bligh, Andi Kleen, James Bottomley, John Stultz, and
  -- * James Cleverdon.
  --  

   type apic is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:287
      probe : access function return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:289
      acpi_madt_oem_check : access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:290
      apic_id_valid : access function (arg1 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:291
      apic_id_registered : access function return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:292
      irq_delivery_mode : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:294
      irq_dest_mode : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:295
      target_cpus : access function return access constant linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:297
      disable_esr : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:299
      dest_logical : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:301
      check_apicid_used : access function (arg1 : access asm_mpspec_h.physid_mask_t; arg2 : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:302
      check_apicid_present : access function (arg1 : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:303
      vector_allocation_domain : access procedure
           (arg1 : int;
            arg2 : access linux_cpumask_h.cpumask;
            arg3 : access constant linux_cpumask_h.cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:306
      init_apic_ldr : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:307
      ioapic_phys_id_map : access procedure (arg1 : access asm_mpspec_h.physid_mask_t; arg2 : access asm_mpspec_h.physid_mask_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:309
      setup_apic_routing : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:311
      multi_timer_check : access function (arg1 : int; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:312
      cpu_present_to_apicid : access function (arg1 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:313
      apicid_to_cpu_present : access procedure (arg1 : int; arg2 : access asm_mpspec_h.physid_mask_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:314
      setup_portio_remap : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:315
      check_phys_apicid_present : access function (arg1 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:316
      enable_apic_mode : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:317
      phys_pkg_id : access function (arg1 : int; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:318
      mps_oem_check : access function
           (arg1 : access asm_mpspec_def_h.mpc_table;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:325
      get_apic_id : access function (arg1 : unsigned_long) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:327
      set_apic_id : access function (arg1 : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:328
      apic_id_mask : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:329
      cpu_mask_to_apicid_and : access function
           (arg1 : access constant linux_cpumask_h.cpumask;
            arg2 : access constant linux_cpumask_h.cpumask;
            arg3 : access unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:333
      send_IPI_mask : access procedure (arg1 : access constant linux_cpumask_h.cpumask; arg2 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:336
      send_IPI_mask_allbutself : access procedure (arg1 : access constant linux_cpumask_h.cpumask; arg2 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:338
      send_IPI_allbutself : access procedure (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:339
      send_IPI_all : access procedure (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:340
      send_IPI_self : access procedure (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:341
      wakeup_secondary_cpu : access function (arg1 : int; arg2 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:344
      trampoline_phys_low : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:346
      trampoline_phys_high : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:347
      wait_for_init_deassert : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:349
      smp_callin_clear_local_apic : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:350
      inquire_remote_apic : access procedure (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:351
      read : access function (arg1 : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:354
      write : access procedure (arg1 : asm_generic_int_ll64_h.u32; arg2 : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:355
      eoi_write : access procedure (arg1 : asm_generic_int_ll64_h.u32; arg2 : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:363
      icr_read : access function return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:364
      icr_write : access procedure (arg1 : asm_generic_int_ll64_h.u32; arg2 : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:365
      wait_icr_idle : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:366
      safe_wait_icr_idle : access function return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:367
   end record;
   pragma Convention (C_Pass_By_Copy, apic);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:286

  --	 * When one of the next two hooks returns 1 the apic
  --	 * is switched to this. Essentially they are additional
  --	 * probe functions:
  --	  

  -- ipi  
  -- wakeup_secondary_cpu  
  -- apic ops  
  --	 * ->eoi_write() has the same signature as ->write().
  --	 *
  --	 * Drivers can support both ->eoi_write() and ->write() by passing the same
  --	 * callback value. Kernel can override ->eoi_write() and fall back
  --	 * on write for EOI.
  --	  

  --	 * Called very early during boot from get_smp_config().  It should
  --	 * return the logical apicid.  x86_[bios]_cpu_to_apicid is
  --	 * initialized before this function is called.
  --	 *
  --	 * If logical apicid can't be determined that early, the function
  --	 * may return BAD_APICID.  Logical apicid will be configured after
  --	 * init_apic_ldr() while bringing up CPUs.  Note that NUMA affinity
  --	 * won't be applied properly during early boot in this case.
  --	  

  --	 * Optional method called from setup_local_APIC() after logical
  --	 * apicid is guaranteed to be known to initialize apicid -> node
  --	 * mapping if NUMA initialization hasn't done so already.  Don't
  --	 * add new users.
  --	  

  -- * Pointer to the local APIC driver in use on this system (there's
  -- * always just one such driver in use - the kernel decides via an
  -- * early probing process which one it picks - and then sticks to it):
  --  

   apic : access apic;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:397
   pragma Import (C, apic, "apic");

  -- * APIC drivers are probed based on how they are listed in the .apicdrivers
  -- * section. So the order is important and enforced by the ordering
  -- * of different apic driver files in the Makefile.
  -- *
  -- * For the files having two apic drivers, we use apic_drivers()
  -- * to enforce the order with in them.
  --  

  -- * APIC functionality to boot other CPUs - only used on SMP:
  --  

   init_deasserted : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:423
   pragma Import (C, init_deasserted, "init_deasserted");

   function wakeup_secondary_cpu_via_nmi (apicid : int; start_eip : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:424
   pragma Import (CPP, wakeup_secondary_cpu_via_nmi, "_Z28wakeup_secondary_cpu_via_nmiim");

   function apic_read (reg : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:429
   pragma Import (CPP, apic_read, "_ZL9apic_readj");

   procedure apic_write (reg : asm_generic_int_ll64_h.u32; val : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:434
   pragma Import (CPP, apic_write, "_ZL10apic_writejj");

   procedure apic_eoi;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:439
   pragma Import (CPP, apic_eoi, "_ZL8apic_eoiv");

   function apic_icr_read return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:444
   pragma Import (CPP, apic_icr_read, "_ZL13apic_icr_readv");

   procedure apic_icr_write (low : asm_generic_int_ll64_h.u32; high : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:449
   pragma Import (CPP, apic_icr_write, "_ZL14apic_icr_writejj");

   procedure apic_wait_icr_idle;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:454
   pragma Import (CPP, apic_wait_icr_idle, "_ZL18apic_wait_icr_idlev");

   function safe_apic_wait_icr_idle return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:459
   pragma Import (CPP, safe_apic_wait_icr_idle, "_ZL23safe_apic_wait_icr_idlev");

   procedure apic_set_eoi_write (eoi_write : access procedure (arg1 : asm_generic_int_ll64_h.u32; arg2 : asm_generic_int_ll64_h.u32));  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:464
   pragma Import (CPP, apic_set_eoi_write, "_Z18apic_set_eoi_writePFvjjE");

   procedure ack_APIC_irq;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:479
   pragma Import (CPP, ack_APIC_irq, "_ZL12ack_APIC_irqv");

  --	 * ack_APIC_irq() actually gets compiled as a single instruction
  --	 * ... yummie.
  --	  

   function default_get_apic_id (x : unsigned_long) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:488
   pragma Import (CPP, default_get_apic_id, "_ZL19default_get_apic_idm");

  -- * Warm reset vector default position:
  --  

   function default_acpi_madt_oem_check (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:505
   pragma Import (CPP, default_acpi_madt_oem_check, "_Z27default_acpi_madt_oem_checkPcS_");

   procedure apic_send_IPI_self (vector : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:507
   pragma Import (CPP, apic_send_IPI_self, "_Z18apic_send_IPI_selfi");

   x2apic_extra_bits : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:509
   pragma Import (C, x2apic_extra_bits, "x2apic_extra_bits");

   procedure generic_bigsmp_probe;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:515
   pragma Import (CPP, generic_bigsmp_probe, "_Z20generic_bigsmp_probev");

   function default_target_cpus return access constant linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:524
   pragma Import (CPP, default_target_cpus, "_ZL19default_target_cpusv");

   function online_target_cpus return access constant linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:533
   pragma Import (CPP, online_target_cpus, "_ZL18online_target_cpusv");

   function read_apic_id return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:541
   pragma Import (CPP, read_apic_id, "_ZL12read_apic_idv");

   function default_apic_id_valid (apicid : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:550
   pragma Import (CPP, default_apic_id_valid, "_ZL21default_apic_id_validi");

   procedure default_setup_apic_routing;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:555
   pragma Import (CPP, default_setup_apic_routing, "_Z26default_setup_apic_routingv");

   apic_noop : aliased apic;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:557
   pragma Import (C, apic_noop, "apic_noop");

  -- * Set up the logical destination ID.
  -- *
  -- * Intel recommends to set DFR, LDR and TPR before enabling
  -- * an APIC.  See e.g. "AP-388 82489DX User's Manual" (Intel
  -- * document number 292116).  So here it goes...
  --  

   function flat_cpu_mask_to_apicid_and
     (the_cpumask : access constant linux_cpumask_h.cpumask;
      andmask : access constant linux_cpumask_h.cpumask;
      apicid : access unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:588
   pragma Import (CPP, flat_cpu_mask_to_apicid_and, "_ZL27flat_cpu_mask_to_apicid_andPK7cpumaskS1_Pj");

   function default_cpu_mask_to_apicid_and
     (the_cpumask : access constant linux_cpumask_h.cpumask;
      andmask : access constant linux_cpumask_h.cpumask;
      apicid : access unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:606
   pragma Import (CPP, default_cpu_mask_to_apicid_and, "_Z30default_cpu_mask_to_apicid_andPK7cpumaskS1_Pj");

   procedure flat_vector_allocation_domain
     (cpu : int;
      retmask : access linux_cpumask_h.cpumask;
      mask : access constant linux_cpumask_h.cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:611
   pragma Import (CPP, flat_vector_allocation_domain, "_ZL29flat_vector_allocation_domainiP7cpumaskPKS_");

  -- Careful. Some cpus do not strictly honor the set of cpus
  --	 * specified in the interrupt destination when using lowest
  --	 * priority interrupt delivery mode.
  --	 *
  --	 * In particular there was a hyperthreading cpu observed to
  --	 * deliver interrupts to the wrong hyperthread when only one
  --	 * hyperthread was specified in the interrupt desitination.
  --	  

   procedure default_vector_allocation_domain
     (cpu : int;
      retmask : access linux_cpumask_h.cpumask;
      mask : access constant linux_cpumask_h.cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:627
   pragma Import (CPP, default_vector_allocation_domain, "_ZL32default_vector_allocation_domainiP7cpumaskPKS_");

   function default_check_apicid_used (map : access asm_mpspec_h.physid_mask_t; apicid : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:633
   pragma Import (CPP, default_check_apicid_used, "_ZL25default_check_apicid_usedP11physid_maski");

   function default_check_apicid_present (bit : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:638
   pragma Import (CPP, default_check_apicid_present, "_ZL28default_check_apicid_presenti");

   procedure default_ioapic_phys_id_map (phys_map : access asm_mpspec_h.physid_mask_t; retmap : access asm_mpspec_h.physid_mask_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:643
   pragma Import (CPP, default_ioapic_phys_id_map, "_ZL26default_ioapic_phys_id_mapP11physid_maskS0_");

   --  skipped func __default_cpu_present_to_apicid

   --  skipped func __default_check_phys_apicid_present

   function default_cpu_present_to_apicid (mps_cpu : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:674
   pragma Import (CPP, default_cpu_present_to_apicid, "_Z29default_cpu_present_to_apicidi");

   function default_check_phys_apicid_present (phys_apicid : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:675
   pragma Import (CPP, default_check_phys_apicid_present, "_Z33default_check_phys_apicid_presenti");

   procedure entering_irq;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:682
   pragma Import (CPP, entering_irq, "_ZL12entering_irqv");

   procedure entering_ack_irq;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:688
   pragma Import (CPP, entering_ack_irq, "_ZL16entering_ack_irqv");

   procedure exiting_irq;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:694
   pragma Import (CPP, exiting_irq, "_ZL11exiting_irqv");

   procedure exiting_ack_irq;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:699
   pragma Import (CPP, exiting_ack_irq, "_ZL15exiting_ack_irqv");

  -- Ack only at the end to avoid potential reentry  
   procedure ioapic_zap_locks;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apic.h:706
   pragma Import (CPP, ioapic_zap_locks, "_Z16ioapic_zap_locksv");

end asm_apic_h;

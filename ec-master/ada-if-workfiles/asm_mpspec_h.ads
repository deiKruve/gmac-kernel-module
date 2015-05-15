pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_mpspec_def_h;
with Interfaces.C.Strings;
with asm_generic_int_ll64_h;
limited with linux_device_h;

package asm_mpspec_h is

   --  unsupported macro: MAX_MP_BUSSES 256
   --  unsupported macro: MAX_IRQ_SOURCES (MAX_MP_BUSSES * 4)
   --  unsupported macro: PHYSID_ARRAY_SIZE BITS_TO_LONGS(MAX_LOCAL_APIC)
   --  arg-macro: procedure physid_set set_bit(physid, (map).mask)
   --    set_bit(physid, (map).mask)
   --  arg-macro: procedure physid_clear clear_bit(physid, (map).mask)
   --    clear_bit(physid, (map).mask)
   --  arg-macro: procedure physid_isset test_bit(physid, (map).mask)
   --    test_bit(physid, (map).mask)
   --  arg-macro: procedure physid_test_and_set test_and_set_bit(physid, (map).mask)
   --    test_and_set_bit(physid, (map).mask)
   --  arg-macro: procedure physids_and bitmap_and((dst).mask, (src1).mask, (src2).mask, MAX_LOCAL_APIC)
   --    bitmap_and((dst).mask, (src1).mask, (src2).mask, MAX_LOCAL_APIC)
   --  arg-macro: procedure physids_or bitmap_or((dst).mask, (src1).mask, (src2).mask, MAX_LOCAL_APIC)
   --    bitmap_or((dst).mask, (src1).mask, (src2).mask, MAX_LOCAL_APIC)
   --  arg-macro: procedure physids_clear bitmap_zero((map).mask, MAX_LOCAL_APIC)
   --    bitmap_zero((map).mask, MAX_LOCAL_APIC)
   --  arg-macro: procedure physids_complement bitmap_complement((dst).mask, (src).mask, MAX_LOCAL_APIC)
   --    bitmap_complement((dst).mask, (src).mask, MAX_LOCAL_APIC)
   --  arg-macro: procedure physids_empty bitmap_empty((map).mask, MAX_LOCAL_APIC)
   --    bitmap_empty((map).mask, MAX_LOCAL_APIC)
   --  arg-macro: procedure physids_equal bitmap_equal((map1).mask, (map2).mask, MAX_LOCAL_APIC)
   --    bitmap_equal((map1).mask, (map2).mask, MAX_LOCAL_APIC)
   --  arg-macro: procedure physids_weight bitmap_weight((map).mask, MAX_LOCAL_APIC)
   --    bitmap_weight((map).mask, MAX_LOCAL_APIC)
   --  arg-macro: procedure physids_shift_right bitmap_shift_right((d).mask, (s).mask, n, MAX_LOCAL_APIC)
   --    bitmap_shift_right((d).mask, (s).mask, n, MAX_LOCAL_APIC)
   --  arg-macro: procedure physids_shift_left bitmap_shift_left((d).mask, (s).mask, n, MAX_LOCAL_APIC)
   --    bitmap_shift_left((d).mask, (s).mask, n, MAX_LOCAL_APIC)
   --  unsupported macro: PHYSID_MASK_ALL { {[0 ... PHYSID_ARRAY_SIZE-1] = ~0UL} }
   --  unsupported macro: PHYSID_MASK_NONE { {[0 ... PHYSID_ARRAY_SIZE-1] = 0UL} }
   apic_version : aliased array (size_t) of aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:9
   pragma Import (C, apic_version, "apic_version");

   pic_mode : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:10
   pragma Import (C, pic_mode, "pic_mode");

  -- * Summit or generic (i.e. installer) kernels need lots of bus entries.
  -- * Maximum 256 PCI busses, plus 1 ISA bus in each of 4 cabinets.
  --  

  -- Each PCI slot may be a combo card with its own bus.  4 IRQ pins per slot.  
   mp_bus_not_pci : aliased array (0 .. 3) of aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:40
   pragma Import (C, mp_bus_not_pci, "mp_bus_not_pci");

   boot_cpu_physical_apicid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:42
   pragma Import (C, boot_cpu_physical_apicid, "boot_cpu_physical_apicid");

   max_physical_apicid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:43
   pragma Import (C, max_physical_apicid, "max_physical_apicid");

   mp_lapic_addr : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:45
   pragma Import (C, mp_lapic_addr, "mp_lapic_addr");

   smp_found_config : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:48
   pragma Import (C, smp_found_config, "smp_found_config");

   procedure get_smp_config;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:53
   pragma Import (CPP, get_smp_config, "_ZL14get_smp_configv");

   procedure early_get_smp_config;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:58
   pragma Import (CPP, early_get_smp_config, "_ZL20early_get_smp_configv");

   procedure find_smp_config;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:63
   pragma Import (CPP, find_smp_config, "_ZL15find_smp_configv");

   procedure early_reserve_e820_mpc_new;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:69
   pragma Import (CPP, early_reserve_e820_mpc_new, "_Z26early_reserve_e820_mpc_newv");

   enable_update_mptable : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:70
   pragma Import (C, enable_update_mptable, "enable_update_mptable");

   function default_mpc_apic_id (m : access asm_mpspec_def_h.mpc_cpu) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:71
   pragma Import (CPP, default_mpc_apic_id, "_Z19default_mpc_apic_idP7mpc_cpu");

   procedure default_smp_read_mpc_oem (mpc : access asm_mpspec_def_h.mpc_table);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:72
   pragma Import (CPP, default_smp_read_mpc_oem, "_Z24default_smp_read_mpc_oemP9mpc_table");

   procedure default_mpc_oem_bus_info (m : access asm_mpspec_def_h.mpc_bus; str : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:74
   pragma Import (CPP, default_mpc_oem_bus_info, "_Z24default_mpc_oem_bus_infoP7mpc_busPc");

   procedure default_find_smp_config;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:78
   pragma Import (CPP, default_find_smp_config, "_Z23default_find_smp_configv");

   procedure default_get_smp_config (early : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:79
   pragma Import (CPP, default_get_smp_config, "_Z22default_get_smp_configj");

   function generic_processor_info (apicid : int; version : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:90
   pragma Import (CPP, generic_processor_info, "_Z22generic_processor_infoii");

   procedure mp_override_legacy_irq
     (bus_irq : asm_generic_int_ll64_h.u8;
      polarity : asm_generic_int_ll64_h.u8;
      trigger : asm_generic_int_ll64_h.u8;
      gsi : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:93
   pragma Import (CPP, mp_override_legacy_irq, "_Z22mp_override_legacy_irqhhhj");

   procedure mp_config_acpi_legacy_irqs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:95
   pragma Import (CPP, mp_config_acpi_legacy_irqs, "_Z26mp_config_acpi_legacy_irqsv");

   function mp_register_gsi
     (dev : access linux_device_h.device;
      gsi : asm_generic_int_ll64_h.u32;
      edge_level : int;
      active_high_low : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:97
   pragma Import (CPP, mp_register_gsi, "_Z15mp_register_gsiP6devicejii");

   type physid_mask_mask_array is array (0 .. 511) of aliased unsigned_long;
   type physid_mask is record
      mask : aliased physid_mask_mask_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:104
   end record;
   pragma Convention (C_Pass_By_Copy, physid_mask);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:103

   subtype physid_mask_t is physid_mask;

   function physids_coerce (map : access physid_mask_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:142
   pragma Import (CPP, physids_coerce, "_ZL14physids_coerceP11physid_mask");

   procedure physids_promote (physids : unsigned_long; map : access physid_mask_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:147
   pragma Import (CPP, physids_promote, "_ZL15physids_promotemP11physid_mask");

   procedure physid_set_mask_of_physid (physid : int; map : access physid_mask_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:153
   pragma Import (CPP, physid_set_mask_of_physid, "_ZL25physid_set_mask_of_physidiP11physid_mask");

   phys_cpu_present_map : aliased physid_mask_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:162
   pragma Import (C, phys_cpu_present_map, "phys_cpu_present_map");

   function generic_mps_oem_check
     (arg1 : access asm_mpspec_def_h.mpc_table;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec.h:164
   pragma Import (CPP, generic_mps_oem_check, "_Z21generic_mps_oem_checkP9mpc_tablePcS1_");

end asm_mpspec_h;

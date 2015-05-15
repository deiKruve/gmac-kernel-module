pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_e820_h;
with asm_generic_int_ll64_h;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;

package asm_e820_h is

   --  unsupported macro: E820_X_MAX (E820MAX + 3 * MAX_NUMNODES)
   --  unsupported macro: HIGH_MEMORY (1024*1024)
  -- see comment in arch/x86/kernel/e820.c  
   e820 : aliased uapi_asm_e820_h.e820map;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:13
   pragma Import (C, e820, "e820");

   e820_saved : aliased uapi_asm_e820_h.e820map;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:14
   pragma Import (C, e820_saved, "e820_saved");

   pci_mem_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:16
   pragma Import (C, pci_mem_start, "pci_mem_start");

   function e820_any_mapped
     (start : asm_generic_int_ll64_h.u64;
      c_end : asm_generic_int_ll64_h.u64;
      c_type : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:17
   pragma Import (CPP, e820_any_mapped, "_Z15e820_any_mappedyyj");

   function e820_all_mapped
     (start : asm_generic_int_ll64_h.u64;
      c_end : asm_generic_int_ll64_h.u64;
      c_type : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:18
   pragma Import (CPP, e820_all_mapped, "_Z15e820_all_mappedyyj");

   procedure e820_add_region
     (start : asm_generic_int_ll64_h.u64;
      size : asm_generic_int_ll64_h.u64;
      c_type : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:19
   pragma Import (CPP, e820_add_region, "_Z15e820_add_regionyyi");

   procedure e820_print_map (who : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:20
   pragma Import (CPP, e820_print_map, "_Z14e820_print_mapPc");

   function sanitize_e820_map
     (biosmap : access uapi_asm_e820_h.e820entry;
      max_nr_map : int;
      pnr_map : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:22
   pragma Import (CPP, sanitize_e820_map, "_Z17sanitize_e820_mapP9e820entryiPj");

   function e820_update_range
     (start : asm_generic_int_ll64_h.u64;
      size : asm_generic_int_ll64_h.u64;
      old_type : unsigned;
      new_type : unsigned) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:23
   pragma Import (CPP, e820_update_range, "_Z17e820_update_rangeyyjj");

   function e820_remove_range
     (start : asm_generic_int_ll64_h.u64;
      size : asm_generic_int_ll64_h.u64;
      old_type : unsigned;
      checktype : int) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:25
   pragma Import (CPP, e820_remove_range, "_Z17e820_remove_rangeyyji");

   procedure update_e820;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:27
   pragma Import (CPP, update_e820, "_Z11update_e820v");

   procedure e820_setup_gap;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:28
   pragma Import (CPP, e820_setup_gap, "_Z14e820_setup_gapv");

   function e820_search_gap
     (gapstart : access unsigned_long;
      gapsize : access unsigned_long;
      start_addr : unsigned_long;
      end_addr : Extensions.unsigned_long_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:29
   pragma Import (CPP, e820_search_gap, "_Z15e820_search_gapPmS_my");

   procedure parse_e820_ext (phys_addr : asm_generic_int_ll64_h.u64; data_len : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:32
   pragma Import (CPP, parse_e820_ext, "_Z14parse_e820_extyj");

   procedure e820_mark_nosave_regions (limit_pfn : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:36
   pragma Import (CPP, e820_mark_nosave_regions, "_Z24e820_mark_nosave_regionsm");

   procedure early_memtest (start : unsigned_long; c_end : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:44
   pragma Import (CPP, early_memtest, "_Z13early_memtestmm");

   function e820_end_of_ram_pfn return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:51
   pragma Import (CPP, e820_end_of_ram_pfn, "_Z19e820_end_of_ram_pfnv");

   function e820_end_of_low_ram_pfn return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:52
   pragma Import (CPP, e820_end_of_low_ram_pfn, "_Z23e820_end_of_low_ram_pfnv");

   function early_reserve_e820 (sizet : asm_generic_int_ll64_h.u64; align : asm_generic_int_ll64_h.u64) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:53
   pragma Import (CPP, early_reserve_e820, "_Z18early_reserve_e820yy");

   procedure memblock_x86_fill;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:55
   pragma Import (CPP, memblock_x86_fill, "_Z17memblock_x86_fillv");

   procedure memblock_find_dma_reserve;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:56
   pragma Import (CPP, memblock_find_dma_reserve, "_Z25memblock_find_dma_reservev");

   procedure finish_e820_parsing;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:58
   pragma Import (CPP, finish_e820_parsing, "_Z19finish_e820_parsingv");

   procedure e820_reserve_resources;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:59
   pragma Import (CPP, e820_reserve_resources, "_Z22e820_reserve_resourcesv");

   procedure e820_reserve_resources_late;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:60
   pragma Import (CPP, e820_reserve_resources_late, "_Z27e820_reserve_resources_latev");

   procedure setup_memory_map;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:61
   pragma Import (CPP, setup_memory_map, "_Z16setup_memory_mapv");

   function default_machine_specific_memory_setup return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:62
   pragma Import (CPP, default_machine_specific_memory_setup, "_Z37default_machine_specific_memory_setupv");

  -- * Returns true iff the specified range [s,e) is completely contained inside
  -- * the ISA region.
  --  

   function is_ISA_range (s : asm_generic_int_ll64_h.u64; e : asm_generic_int_ll64_h.u64) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/e820.h:68
   pragma Import (CPP, is_ISA_range, "_ZL12is_ISA_rangeyy");

end asm_e820_h;

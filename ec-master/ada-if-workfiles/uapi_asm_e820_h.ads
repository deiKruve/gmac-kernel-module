pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_asm_e820_h is

   --  unsupported macro: E820MAP 0x2d0
   --  unsupported macro: E820MAX 128
   --  unsupported macro: E820NR 0x1e8
   --  unsupported macro: E820_RAM 1
   --  unsupported macro: E820_RESERVED 2
   --  unsupported macro: E820_ACPI 3
   --  unsupported macro: E820_NVS 4
   --  unsupported macro: E820_UNUSABLE 5
   --  unsupported macro: E820_RESERVED_KERN 128
   --  unsupported macro: ISA_START_ADDRESS 0xa0000
   --  unsupported macro: ISA_END_ADDRESS 0x100000
   --  unsupported macro: BIOS_BEGIN 0x000a0000
   --  unsupported macro: BIOS_END 0x00100000
   --  unsupported macro: BIOS_ROM_BASE 0xffe00000
   --  unsupported macro: BIOS_ROM_END 0xffffffff
  -- * Legacy E820 BIOS limits us to 128 (E820MAX) nodes due to the
  -- * constrained space in the zeropage.  If we have more nodes than
  -- * that, and if we've booted off EFI firmware, then the EFI tables
  -- * passed us from the EFI firmware can list more nodes.  Size our
  -- * internal memory map tables to have room for these additional
  -- * nodes, based on up to three entries per node for which the
  -- * kernel was built: MAX_NUMNODES == (1 << CONFIG_NODES_SHIFT),
  -- * plus E820MAX, allowing space for the possible duplicate E820
  -- * entries that might need room in the same arrays, prior to the
  -- * call to sanitize_e820_map() to remove duplicates.  The allowance
  -- * of three memory map entries per node is "enough" entries for
  -- * the initial hardware platform motivating this mechanism to make
  -- * use of additional EFI map entries.  Future platforms may want
  -- * to allow more than three entries per node or otherwise refine
  -- * this size.
  --  

  -- * Odd: 'make headers_check' complains about numa.h if I try
  -- * to collapse the next two #ifdef lines to a single line:
  -- *	#if defined(__KERNEL__) && defined(CONFIG_EFI)
  --  

  -- * reserved RAM used by kernel itself
  -- * if CONFIG_INTEL_TXT is enabled, memory of this type will be
  -- * included in the S3 integrity calculation and so should not include
  -- * any memory that BIOS might alter over the S3 transition
  --  

  -- start of memory segment  
   type e820entry is record
      addr : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/e820.h:53
      size : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/e820.h:54
      c_type : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/e820.h:55
   end record;
   pragma Convention (C_Pass_By_Copy, e820entry);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/e820.h:52

  -- size of memory segment  
  -- type of memory segment  
   type e820map_map_array is array (0 .. 319) of aliased e820entry;
   type e820map is record
      nr_map : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/e820.h:59
      map : aliased e820map_map_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/e820.h:60
   end record;
   pragma Convention (C_Pass_By_Copy, e820map);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/e820.h:58

end uapi_asm_e820_h;

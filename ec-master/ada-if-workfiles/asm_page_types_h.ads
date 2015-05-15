pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with Interfaces.C.Extensions;

package asm_page_types_h is

   --  unsupported macro: PAGE_SHIFT 12
   --  unsupported macro: PAGE_SIZE (_AC(1,UL) << PAGE_SHIFT)
   --  unsupported macro: PAGE_MASK (~(PAGE_SIZE-1))
   --  unsupported macro: PHYSICAL_PAGE_MASK (((signed long)PAGE_MASK) & __PHYSICAL_MASK)
   --  unsupported macro: PMD_PAGE_SIZE (_AC(1, UL) << PMD_SHIFT)
   --  unsupported macro: PMD_PAGE_MASK (~(PMD_PAGE_SIZE-1))
   --  unsupported macro: HPAGE_SHIFT PMD_SHIFT
   --  unsupported macro: HPAGE_SIZE (_AC(1,UL) << HPAGE_SHIFT)
   --  unsupported macro: HPAGE_MASK (~(HPAGE_SIZE - 1))
   --  unsupported macro: HUGETLB_PAGE_ORDER (HPAGE_SHIFT - PAGE_SHIFT)
   --  unsupported macro: HUGE_MAX_HSTATE 2
   --  unsupported macro: PAGE_OFFSET ((unsigned long)__PAGE_OFFSET)
   --  unsupported macro: VM_DATA_DEFAULT_FLAGS (((current->personality & READ_IMPLIES_EXEC) ? VM_EXEC : 0 ) | VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
  -- PAGE_SHIFT determines the page size  
  -- Cast PAGE_MASK to a signed type so that it is sign-extended if
  --   virtual addresses are 32-bits but physical addresses are larger
  --   (ie, 32-bit PAE).  

   function devmem_is_allowed (pagenr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_types.h:49
   pragma Import (CPP, devmem_is_allowed, "_Z17devmem_is_allowedm");

   max_low_pfn_mapped : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_types.h:51
   pragma Import (C, max_low_pfn_mapped, "max_low_pfn_mapped");

   max_pfn_mapped : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_types.h:52
   pragma Import (C, max_pfn_mapped, "max_pfn_mapped");

   function get_max_mapped return linux_types_h.phys_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_types.h:54
   pragma Import (CPP, get_max_mapped, "_ZL14get_max_mappedv");

   function pfn_range_is_mapped (start_pfn : unsigned_long; end_pfn : unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_types.h:59
   pragma Import (CPP, pfn_range_is_mapped, "_Z19pfn_range_is_mappedmm");

   function init_memory_mapping (start : unsigned_long; c_end : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_types.h:61
   pragma Import (CPP, init_memory_mapping, "_Z19init_memory_mappingmm");

   procedure initmem_init;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_types.h:64
   pragma Import (CPP, initmem_init, "_Z12initmem_initv");

end asm_page_types_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_range_h;
with System;
limited with linux_mm_types_h;

package asm_page_h is

   --  arg-macro: procedure virt_to_page pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
   --    pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
   --  arg-macro: procedure pfn_to_kaddr __va((pfn) << PAGE_SHIFT)
   --    __va((pfn) << PAGE_SHIFT)
   --  arg-macro: procedure virt_addr_valid __virt_addr_valid((unsigned long) (kaddr))
   --    __virt_addr_valid((unsigned long) (kaddr))
   pfn_mapped : aliased array (size_t) of aliased linux_range_h.c_range;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page.h:21
   pragma Import (C, pfn_mapped, "pfn_mapped");

   nr_pfn_mapped : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page.h:22
   pragma Import (C, nr_pfn_mapped, "nr_pfn_mapped");

   procedure clear_user_page
     (page : System.Address;
      vaddr : unsigned_long;
      pg : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page.h:24
   pragma Import (CPP, clear_user_page, "_ZL15clear_user_pagePvmP4page");

   procedure copy_user_page
     (to : System.Address;
      from : System.Address;
      vaddr : unsigned_long;
      topage : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page.h:30
   pragma Import (CPP, copy_user_page, "_ZL14copy_user_pagePvS_mP4page");

  -- __pa_symbol should be used for C visible symbols.
  --   This seems to be the official gcc blessed way to do such arithmetic.  

  -- * We need __phys_reloc_hide() here because gcc may assume that there is no
  -- * overflow during __pa() calculation and can optimize it unexpectedly.
  -- * Newer versions of gcc provide -fno-strict-overflow switch to handle this
  -- * case properly. Once all supported versions of gcc understand it, we can
  -- * remove this Voodoo magic stuff. (i.e. once gcc3.x is deprecated)
  --  

  -- * virt_to_page(kaddr) returns a valid pointer if and only if
  -- * virt_addr_valid(kaddr) returns true.
  --  

   --  skipped func __virt_addr_valid

end asm_page_h;

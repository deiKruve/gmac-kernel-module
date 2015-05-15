pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package asm_page_64_h is

  -- duplicated to the one in bootmem.h  
   max_pfn : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_64.h:9
   pragma Import (C, max_pfn, "max_pfn");

   phys_base : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_64.h:10
   pragma Import (C, phys_base, "phys_base");

   --  skipped func __phys_addr_nodebug

  -- use the carry flag to determine if x was < __START_KERNEL_map  
   procedure clear_page (page : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_64.h:37
   pragma Import (CPP, clear_page, "_Z10clear_pagePv");

   procedure copy_page (to : System.Address; from : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/page_64.h:38
   pragma Import (CPP, copy_page, "_Z9copy_pagePvS_");

end asm_page_64_h;

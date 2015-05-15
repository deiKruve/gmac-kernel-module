pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with System;

package asm_generic_early_ioremap_h is

  -- * early_ioremap() and early_iounmap() are for temporary early boot-time
  -- * mappings, before the real ioremap() is functional.
  --  

   function early_ioremap (phys_addr : linux_types_h.resource_size_t; size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/early_ioremap.h:10
   pragma Import (CPP, early_ioremap, "_Z13early_ioremapym");

   function early_memremap (phys_addr : linux_types_h.resource_size_t; size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/early_ioremap.h:12
   pragma Import (CPP, early_memremap, "_Z14early_memremapym");

   procedure early_iounmap (addr : System.Address; size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/early_ioremap.h:14
   pragma Import (CPP, early_iounmap, "_Z13early_iounmapPvm");

   procedure early_memunmap (addr : System.Address; size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/early_ioremap.h:15
   pragma Import (CPP, early_memunmap, "_Z14early_memunmapPvm");

  -- * Weak function called by early_ioremap_reset(). It does nothing, but
  -- * architectures may provide their own version to do any needed cleanups.
  --  

   procedure early_ioremap_shutdown;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/early_ioremap.h:21
   pragma Import (CPP, early_ioremap_shutdown, "_Z22early_ioremap_shutdownv");

  -- Arch-specific initialization  
   procedure early_ioremap_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/early_ioremap.h:25
   pragma Import (CPP, early_ioremap_init, "_Z18early_ioremap_initv");

  -- Generic initialization called by architecture code  
   procedure early_ioremap_setup;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/early_ioremap.h:28
   pragma Import (CPP, early_ioremap_setup, "_Z19early_ioremap_setupv");

  -- * Called as last step in paging_init() so library can act
  -- * accordingly for subsequent map/unmap requests.
  --  

   procedure early_ioremap_reset;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/early_ioremap.h:34
   pragma Import (CPP, early_ioremap_reset, "_Z19early_ioremap_resetv");

end asm_generic_early_ioremap_h;

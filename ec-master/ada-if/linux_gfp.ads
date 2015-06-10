pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
--with linux_types_h;
--with linux_mmzone_h;
--limited with linux_mm_types_h;
--with System;
--with Interfaces.C.Extensions;

package linux_gfp is
   
   k_GFP_DMA      : constant := 1;
   k_GFP_HIGHMEM  : constant := 2; --		0x02u
   k_GFP_DMA32    : constant := 4; --		0x04u
   k_GFP_MOVABLE  : constant := 8; --		0x08u
   k_GFP_WAIT     : constant := 16#10#; --		0x10u
   k_GFP_HIGH     : constant := 16#20#; --		0x20u
   k_GFP_IO	  : constant := 16#40#; --	0x40u
   k_GFP_FS       : constant := 16#80#; --		0x80u
   K_GFP_REPEAT   : constant := 16#400#; --		0x400u
   -- Try hard to allocate the memory, but the allocation attempt
   --  _might_ fail.  This depends upon the particular VM implementation.
   K_GFP_HARDWALL : constant := 16#20_000#; --		0x20_000u
   
   
   GFP_ATOMIC : constant Unsigned := 2 ** k_GFP_HIGH; 
   -- means both !wait (__GFP_WAIT not set) and use emergency pool
   GFP_NOWAIT : constant Unsigned := 
     2 ** Natural (GFP_ATOMIC) and not (2 ** K_GFP_HIGH);
   -- this equals 0, dont ask look in gfp.h
   GFP_NOIO   : constant Unsigned := 2 ** k_GFP_WAIT;
   GFP_NOFS   : constant Unsigned := 2 ** k_GFP_WAIT or 2 ** k_GFP_IO;
   GFP_KERNEL : constant Unsigned := 
     2 ** k_GFP_WAIT or 2 ** k_GFP_IO or 2 ** k_GFP_FS;
   GFP_USER   : constant Unsigned :=
     2 ** k_GFP_WAIT or 2 ** k_GFP_IO or 2 ** k_GFP_FS or 2 ** k_GFP_HARDWALL;
   
   
   -----------------------------------------------
   --  constants for use with k_get_free_pages  --
   --  to specify the requested heap size       --
   -----------------------------------------------
   Pages_1  : constant Unsigned := 0; -- 4096 bytes by my calculations
   Pages_2  : constant Unsigned := 1; -- 8192
   Pages_4  : constant Unsigned := 2; -- 16384
   Pages_8  : constant Unsigned := 3; -- 32768
   Pages_16 : constant Unsigned := 4; -- 65536
   
   
   subtype gfp_t is unsigned; -- from linux_types_h
   
   
   function k_get_free_pages (gfp_mask : gfp_t; 
			      order : unsigned) 
			     return unsigned_long;
   --  k_get_free_pages() returns a 32-bit address, which cannot represent
   --   a highmem page.
   --   Returns 0 on failure.
   pragma Import (C, k_Get_Free_Pages, "__get_free_pages");

   -- #define __get_free_page(gfp_mask) __get_free_pages((gfp_mask), 0)

   function get_zeroed_page (gfp_mask : gfp_t) 
			    return unsigned_long;
   pragma Import (C, get_zeroed_page, "get_zeroed_page");


   procedure free_pages (addr : unsigned_long; order : unsigned);
   pragma Import (C, free_pages, "free_pages");
   
   -- #define free_page(addr) free_pages((addr), 0)
   
end Linux_Gfp;


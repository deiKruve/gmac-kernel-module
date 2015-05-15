pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_mm_types_h;

package linux_pageblock_flags_h is

   --  unsupported macro: pageblock_order HUGETLB_PAGE_ORDER
   --  unsupported macro: pageblock_nr_pages (1UL << pageblock_order)
   --  arg-macro: procedure get_pageblock_flags_group get_pfnblock_flags_mask(page, page_to_pfn(page), end_bitidx, (1 << (end_bitidx - start_bitidx + 1)) - 1)
   --    get_pfnblock_flags_mask(page, page_to_pfn(page), end_bitidx, (1 << (end_bitidx - start_bitidx + 1)) - 1)
   --  arg-macro: procedure set_pageblock_flags_group set_pfnblock_flags_mask(page, flags, page_to_pfn(page), end_bitidx, (1 << (end_bitidx - start_bitidx + 1)) - 1)
   --    set_pfnblock_flags_mask(page, flags, page_to_pfn(page), end_bitidx, (1 << (end_bitidx - start_bitidx + 1)) - 1)
   --  arg-macro: procedure get_pageblock_skip get_pageblock_flags_group(page, PB_migrate_skip, PB_migrate_skip)
   --    get_pageblock_flags_group(page, PB_migrate_skip, PB_migrate_skip)
   --  arg-macro: procedure clear_pageblock_skip set_pageblock_flags_group(page, 0, PB_migrate_skip, PB_migrate_skip)
   --    set_pageblock_flags_group(page, 0, PB_migrate_skip, PB_migrate_skip)
   --  arg-macro: procedure set_pageblock_skip set_pageblock_flags_group(page, 1, PB_migrate_skip, PB_migrate_skip)
   --    set_pageblock_flags_group(page, 1, PB_migrate_skip, PB_migrate_skip)
  -- * Macros for manipulating and testing flags related to a
  -- * pageblock_nr_pages number of pages.
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License as published by
  -- * the Free Software Foundation version 2 of the License
  -- *
  -- * This program is distributed in the hope that it will be useful,
  -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- * GNU General Public License for more details.
  -- *
  -- * You should have received a copy of the GNU General Public License
  -- * along with this program; if not, write to the Free Software
  -- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
  -- *
  -- * Copyright (C) IBM Corporation, 2006
  -- *
  -- * Original author, Mel Gorman
  -- * Major cleanups and reduction of bit operations, Andy Whitcroft
  --  

  -- Bit indices that affect a whole block of pages  
   subtype pageblock_bits is unsigned;
   PB_migrate : constant pageblock_bits := 0;
   PB_migrate_end : constant pageblock_bits := 2;
   PB_migrate_skip : constant pageblock_bits := 3;
   NR_PAGEBLOCK_BITS : constant pageblock_bits := 4;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pageblock-flags.h:29

  -- 3 bits required for migrate types  
  -- If set the block is skipped by compaction  
  --	 * Assume the bits will always align on a word. If this assumption
  --	 * changes then get/set pageblock needs updating.
  --	  

  -- Huge page sizes are variable  
  -- Huge pages are a constant size  
  -- If huge pages are not used, group by MAX_ORDER_NR_PAGES  
  -- Forward declaration  
   function get_pfnblock_flags_mask
     (the_page : access linux_mm_types_h.page;
      pfn : unsigned_long;
      end_bitidx : unsigned_long;
      mask : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pageblock-flags.h:68
   pragma Import (CPP, get_pfnblock_flags_mask, "_Z23get_pfnblock_flags_maskP4pagemmm");

   procedure set_pfnblock_flags_mask
     (the_page : access linux_mm_types_h.page;
      flags : unsigned_long;
      pfn : unsigned_long;
      end_bitidx : unsigned_long;
      mask : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pageblock-flags.h:73
   pragma Import (CPP, set_pfnblock_flags_mask, "_Z23set_pfnblock_flags_maskP4pagemmmm");

  -- Declarations for getting and setting flags. See mm/page_alloc.c  
end linux_pageblock_flags_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_pgtable_64_types_h;
with asm_pgtable_types_h;
with linux_types_h;

package asm_fixmap_h is

   --  unsupported macro: FIXADDR_TOP (round_up(VSYSCALL_ADDR + PAGE_SIZE, 1<<PMD_SHIFT) - PAGE_SIZE)
   --  unsupported macro: NR_FIX_BTMAPS 64
   --  unsupported macro: FIX_BTMAPS_SLOTS 8
   --  unsupported macro: TOTAL_FIX_BTMAPS (NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
   --  unsupported macro: FIXADDR_SIZE (__end_of_permanent_fixed_addresses << PAGE_SHIFT)
   --  unsupported macro: FIXADDR_BOOT_SIZE (__end_of_fixed_addresses << PAGE_SHIFT)
   --  unsupported macro: FIXADDR_START (FIXADDR_TOP - FIXADDR_SIZE)
   --  unsupported macro: FIXADDR_BOOT_START (FIXADDR_TOP - FIXADDR_BOOT_SIZE)
  -- * fixmap.h: compile-time virtual memory allocation
  -- *
  -- * This file is subject to the terms and conditions of the GNU General Public
  -- * License.  See the file "COPYING" in the main directory of this archive
  -- * for more details.
  -- *
  -- * Copyright (C) 1998 Ingo Molnar
  -- *
  -- * Support of BIGMEM added by Gerhard Wichert, Siemens AG, July 1999
  -- * x86_32 and x86_64 integration by Gustavo F. Padovan, February 2009
  --  

  -- * We can't declare FIXADDR_TOP as variable for x86_64 because vsyscall
  -- * uses fixmaps that relies on FIXADDR_TOP for proper address calculation.
  -- * Because of this, FIXADDR_TOP x86 integration was left as later work.
  --  

  -- used by vmalloc.c, vsyscall.lds.S.
  -- *
  -- * Leave one empty page between vmalloc'ed areas and
  -- * the start of the fixmap.
  --  

  -- * Here we define all the compile-time 'special' virtual
  -- * addresses. The point is to have a constant address at
  -- * compile time, but to set the physical address only
  -- * in the boot process.
  -- * for x86_32: We allocate these special addresses
  -- * from the end of virtual memory (0xfffff000) backwards.
  -- * Also this lets us do fail-safe vmalloc(), we
  -- * can guarantee that these special addresses and
  -- * vmalloc()-ed addresses never overlap.
  -- *
  -- * These 'compile-time allocated' memory buffers are
  -- * fixed-size 4k pages (or larger if used with an increment
  -- * higher than 1). Use set_fixmap(idx,phys) to associate
  -- * physical memory with fixmap indices.
  -- *
  -- * TLB entries of such buffers will not be flushed across
  -- * task switches.
  --  

   subtype fixed_addresses is unsigned;
   VSYSCALL_PAGE : constant fixed_addresses := 511;
   PVCLOCK_FIXMAP_BEGIN : constant fixed_addresses := 512;
   PVCLOCK_FIXMAP_END : constant fixed_addresses := 519;
   FIX_DBGP_BASE : constant fixed_addresses := 520;
   FIX_EARLYCON_MEM_BASE : constant fixed_addresses := 521;
   FIX_APIC_BASE : constant fixed_addresses := 522;
   FIX_IO_APIC_BASE_0 : constant fixed_addresses := 523;
   FIX_IO_APIC_BASE_END : constant fixed_addresses := 650;
   FIX_RO_IDT : constant fixed_addresses := 651;
   FIX_PARAVIRT_BOOTMAP : constant fixed_addresses := 652;
   FIX_TEXT_POKE1 : constant fixed_addresses := 653;
   FIX_TEXT_POKE0 : constant fixed_addresses := 654;
   uu_end_of_permanent_fixed_addresses : constant fixed_addresses := 655;
   FIX_BTMAP_END : constant fixed_addresses := 1024;
   FIX_BTMAP_BEGIN : constant fixed_addresses := 1535;
   uu_end_of_fixed_addresses : constant fixed_addresses := 1536;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/fixmap.h:68

  -- local (CPU) APIC) -- required for SMP or not  
  -- Virtual mapping for read-only IDT  
  -- reserved pte's for temporary kernel mappings  
  -- reserve 2 pages for text_poke()  
  -- first page is last, because allocation is backward  
  --	 * 512 temporary boot-time mappings, used by early_ioremap(),
  --	 * before ioremap() is functional.
  --	 *
  --	 * If necessary we round it up to the next 512 pages boundary so
  --	 * that we can have a single pgd entry and a single pte table:
  --	  

   procedure reserve_top_address (reserve : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/fixmap.h:136
   pragma Import (CPP, reserve_top_address, "_Z19reserve_top_addressm");

   fixmaps_set : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/fixmap.h:143
   pragma Import (C, fixmaps_set, "fixmaps_set");

   kmap_pte : access asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/fixmap.h:145
   pragma Import (C, kmap_pte, "kmap_pte");

   kmap_prot : aliased asm_pgtable_types_h.pgprot_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/fixmap.h:146
   pragma Import (C, kmap_prot, "kmap_prot");

   pkmap_page_table : access asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/fixmap.h:147
   pragma Import (C, pkmap_page_table, "pkmap_page_table");

   --  skipped func __native_set_fixmap

   procedure native_set_fixmap
     (idx : fixed_addresses;
      phys : linux_types_h.phys_addr_t;
      flags : asm_pgtable_types_h.pgprot_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/fixmap.h:150
   pragma Import (CPP, native_set_fixmap, "_Z17native_set_fixmap15fixed_addressesy6pgprot");

   --  skipped func __early_set_fixmap

end asm_fixmap_h;

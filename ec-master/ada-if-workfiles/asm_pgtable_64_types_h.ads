pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_pgtable_64_types_h is

   --  unsupported macro: SHARED_KERNEL_PMD 0
   --  unsupported macro: PAGETABLE_LEVELS 4
   --  unsupported macro: PGDIR_SHIFT 39
   --  unsupported macro: PTRS_PER_PGD 512
   --  unsupported macro: PUD_SHIFT 30
   --  unsupported macro: PTRS_PER_PUD 512
   --  unsupported macro: PMD_SHIFT 21
   --  unsupported macro: PTRS_PER_PMD 512
   --  unsupported macro: PTRS_PER_PTE 512
   --  unsupported macro: PMD_SIZE (_AC(1, UL) << PMD_SHIFT)
   --  unsupported macro: PMD_MASK (~(PMD_SIZE - 1))
   --  unsupported macro: PUD_SIZE (_AC(1, UL) << PUD_SHIFT)
   --  unsupported macro: PUD_MASK (~(PUD_SIZE - 1))
   --  unsupported macro: PGDIR_SIZE (_AC(1, UL) << PGDIR_SHIFT)
   --  unsupported macro: PGDIR_MASK (~(PGDIR_SIZE - 1))
   --  unsupported macro: MAXMEM _AC(__AC(1, UL) << MAX_PHYSMEM_BITS, UL)
   --  unsupported macro: VMALLOC_START _AC(0xffffc90000000000, UL)
   --  unsupported macro: VMALLOC_END _AC(0xffffe8ffffffffff, UL)
   --  unsupported macro: VMEMMAP_START _AC(0xffffea0000000000, UL)
   --  unsupported macro: MODULES_VADDR (__START_KERNEL_map + KERNEL_IMAGE_SIZE)
   --  unsupported macro: MODULES_END _AC(0xffffffffff000000, UL)
   --  unsupported macro: MODULES_LEN (MODULES_END - MODULES_VADDR)
   --  unsupported macro: ESPFIX_PGD_ENTRY _AC(-2, UL)
   --  unsupported macro: ESPFIX_BASE_ADDR (ESPFIX_PGD_ENTRY << PGDIR_SHIFT)
   --  unsupported macro: EARLY_DYNAMIC_PAGE_TABLES 64
  -- * These are used to make use of C type-checking..
  --  

   subtype pteval_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64_types.h:12

   subtype pmdval_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64_types.h:13

   subtype pudval_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64_types.h:14

   subtype pgdval_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64_types.h:15

   subtype pgprotval_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64_types.h:16

   type pte_t is record
      pte : aliased pteval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64_types.h:18
   end record;
   pragma Convention (C_Pass_By_Copy, pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64_types.h:18

   --  skipped anonymous struct anon_13

  -- * PGDIR_SHIFT determines what a top-level page table entry can map
  --  

  -- * 3rd level page
  --  

  -- * PMD_SHIFT determines the size of the area a middle-level
  -- * page table can map
  --  

  -- * entries per page directory level
  --  

  -- See Documentation/x86/x86_64/mm.txt for a description of the memory map.  
end asm_pgtable_64_types_h;

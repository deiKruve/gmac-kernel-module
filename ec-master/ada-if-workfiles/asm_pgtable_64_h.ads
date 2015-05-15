pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_pgtable_types_h;
with asm_pgtable_64_types_h;
limited with linux_mm_types_h;

package asm_pgtable_64_h is

   --  unsupported macro: swapper_pg_dir init_level4_pgt
   --  arg-macro: procedure pte_ERROR pr_err("%s:%d: bad pte %p(%016lx)\n", __FILE__, __LINE__, and(e), pte_val(e))
   --    pr_err("%s:%d: bad pte %p(%016lx)\n", __FILE__, __LINE__, and(e), pte_val(e))
   --  arg-macro: procedure pmd_ERROR pr_err("%s:%d: bad pmd %p(%016lx)\n", __FILE__, __LINE__, and(e), pmd_val(e))
   --    pr_err("%s:%d: bad pmd %p(%016lx)\n", __FILE__, __LINE__, and(e), pmd_val(e))
   --  arg-macro: procedure pud_ERROR pr_err("%s:%d: bad pud %p(%016lx)\n", __FILE__, __LINE__, and(e), pud_val(e))
   --    pr_err("%s:%d: bad pud %p(%016lx)\n", __FILE__, __LINE__, and(e), pud_val(e))
   --  arg-macro: procedure pgd_ERROR pr_err("%s:%d: bad pgd %p(%016lx)\n", __FILE__, __LINE__, and(e), pgd_val(e))
   --    pr_err("%s:%d: bad pgd %p(%016lx)\n", __FILE__, __LINE__, and(e), pgd_val(e))
   --  arg-macro: procedure mk_kernel_pgd __pgd((address) or _KERNPG_TABLE)
   --    __pgd((address) or _KERNPG_TABLE)
   --  arg-macro: function pte_to_pgoff ((pte_val((pte)) and PHYSICAL_PAGE_MASK) >> PAGE_SHIFT
   --    return (pte_val((pte)) and PHYSICAL_PAGE_MASK) >> PAGE_SHIFT;
   --  arg-macro: function pgoff_to_pte ((pte_t) { .pte := ((off) << PAGE_SHIFT) or _PAGE_FILE }
   --    return (pte_t) { .pte := ((off) << PAGE_SHIFT) or _PAGE_FILE };
   --  unsupported macro: PTE_FILE_MAX_BITS __PHYSICAL_MASK_SHIFT
   --  arg-macro: procedure pte_offset_map pte_offset_kernel((dir), (address))
   --    pte_offset_kernel((dir), (address))
   --  arg-macro: function pte_unmap ((void)(pte)
   --    return (void)(pte);
   --  unsupported macro: SWP_TYPE_BITS (_PAGE_BIT_FILE - _PAGE_BIT_PRESENT - 1)
   --  unsupported macro: SWP_OFFSET_SHIFT (_PAGE_BIT_PROTNONE + 2)
   --  arg-macro: procedure MAX_SWAPFILES_CHECK BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > SWP_TYPE_BITS)
   --    BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > SWP_TYPE_BITS)
   --  arg-macro: procedure pgtable_cache_init do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure check_pgt_cache do { } while (0)
   --    do { } while (0)
   --  unsupported macro: PAGE_AGP PAGE_KERNEL_NOCACHE
   --  unsupported macro: HAVE_PAGE_AGP 1
   --  arg-macro: function kc_vaddr_to_offset ((v) and __VIRTUAL_MASK
   --    return (v) and __VIRTUAL_MASK;
   --  arg-macro: function kc_offset_to_vaddr ((o) or ~__VIRTUAL_MASK
   --    return (o) or ~__VIRTUAL_MASK;
   --  unsupported macro: vmemmap ((struct page *)VMEMMAP_START)
  -- * This file contains the functions and defines necessary to modify and use
  -- * the x86-64 page table tree.
  --  

   level3_kernel_pgt : aliased array (0 .. 511) of aliased asm_pgtable_types_h.pud_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:17
   pragma Import (C, level3_kernel_pgt, "level3_kernel_pgt");

   level3_ident_pgt : aliased array (0 .. 511) of aliased asm_pgtable_types_h.pud_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:18
   pragma Import (C, level3_ident_pgt, "level3_ident_pgt");

   level2_kernel_pgt : aliased array (0 .. 511) of aliased asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:19
   pragma Import (C, level2_kernel_pgt, "level2_kernel_pgt");

   level2_fixmap_pgt : aliased array (0 .. 511) of aliased asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:20
   pragma Import (C, level2_fixmap_pgt, "level2_fixmap_pgt");

   level2_ident_pgt : aliased array (0 .. 511) of aliased asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:21
   pragma Import (C, level2_ident_pgt, "level2_ident_pgt");

   level1_fixmap_pgt : aliased array (0 .. 511) of aliased asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:22
   pragma Import (C, level1_fixmap_pgt, "level1_fixmap_pgt");

   init_level4_pgt : aliased array (size_t) of aliased asm_pgtable_types_h.pgd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:23
   pragma Import (C, init_level4_pgt, "init_level4_pgt");

   procedure paging_init;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:27
   pragma Import (CPP, paging_init, "_Z11paging_initv");

   procedure set_pte_vaddr_pud
     (pud_page : access asm_pgtable_types_h.pud_t;
      vaddr : unsigned_long;
      new_pte : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:44
   pragma Import (CPP, set_pte_vaddr_pud, "_Z17set_pte_vaddr_pudP5pud_tm5pte_t");

   procedure native_pte_clear
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:47
   pragma Import (CPP, native_pte_clear, "_ZL16native_pte_clearP9mm_structmP5pte_t");

   procedure native_set_pte (ptep : access asm_pgtable_64_types_h.pte_t; pte : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:53
   pragma Import (CPP, native_set_pte, "_ZL14native_set_pteP5pte_tS_");

   procedure native_set_pte_atomic (ptep : access asm_pgtable_64_types_h.pte_t; pte : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:58
   pragma Import (CPP, native_set_pte_atomic, "_ZL21native_set_pte_atomicP5pte_tS_");

   procedure native_set_pmd (pmdp : access asm_pgtable_types_h.pmd_t; pmd : asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:63
   pragma Import (CPP, native_set_pmd, "_ZL14native_set_pmdP5pmd_tS_");

   procedure native_pmd_clear (pmd : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:68
   pragma Import (CPP, native_pmd_clear, "_ZL16native_pmd_clearP5pmd_t");

   function native_ptep_get_and_clear (xp : access asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:73
   pragma Import (CPP, native_ptep_get_and_clear, "_ZL25native_ptep_get_and_clearP5pte_t");

  -- native_local_ptep_get_and_clear,
  --	   but duplicated because of cyclic dependency  

   function native_pmdp_get_and_clear (xp : access asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:86
   pragma Import (CPP, native_pmdp_get_and_clear, "_ZL25native_pmdp_get_and_clearP5pmd_t");

  -- native_local_pmdp_get_and_clear,
  --	   but duplicated because of cyclic dependency  

   procedure native_set_pud (pudp : access asm_pgtable_types_h.pud_t; pud : asm_pgtable_types_h.pud_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:99
   pragma Import (CPP, native_set_pud, "_ZL14native_set_pudP5pud_tS_");

   procedure native_pud_clear (pud : access asm_pgtable_types_h.pud_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:104
   pragma Import (CPP, native_pud_clear, "_ZL16native_pud_clearP5pud_t");

   procedure native_set_pgd (pgdp : access asm_pgtable_types_h.pgd_t; pgd : asm_pgtable_types_h.pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:109
   pragma Import (CPP, native_set_pgd, "_ZL14native_set_pgdP5pgd_tS_");

   procedure native_pgd_clear (pgd : access asm_pgtable_types_h.pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:114
   pragma Import (CPP, native_pgd_clear, "_ZL16native_pgd_clearP5pgd_t");

   procedure sync_global_pgds (start : unsigned_long; c_end : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:119
   pragma Import (CPP, sync_global_pgds, "_Z16sync_global_pgdsmm");

  -- * Conversion functions: convert a page and protection to a page entry,
  -- * and a page entry and page directory to the page they refer to.
  --  

  -- * Level 4 access.
  --  

   function pgd_large (pgd : asm_pgtable_types_h.pgd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:129
   pragma Import (CPP, pgd_large, "_ZL9pgd_large5pgd_t");

  -- PUD - Level3 access  
  -- PMD  - Level 2 access  
  -- PTE - Level 1 access.  
  -- x86-64 always has all page tables mapped.  
  -- Encode and de-code a swap entry  
  -- Automatic NUMA balancing needs to be distinguishable from swap entries  
   function kern_addr_valid (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:166
   pragma Import (CPP, kern_addr_valid, "_Z15kern_addr_validm");

   procedure cleanup_highmap;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:167
   pragma Import (CPP, cleanup_highmap, "_Z15cleanup_highmapv");

  -- fs/proc/kcore.c  
   procedure init_extra_mapping_uc (phys : unsigned_long; size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:186
   pragma Import (CPP, init_extra_mapping_uc, "_Z21init_extra_mapping_ucmm");

   procedure init_extra_mapping_wb (phys : unsigned_long; size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_64.h:187
   pragma Import (CPP, init_extra_mapping_wb, "_Z21init_extra_mapping_wbmm");

end asm_pgtable_64_h;

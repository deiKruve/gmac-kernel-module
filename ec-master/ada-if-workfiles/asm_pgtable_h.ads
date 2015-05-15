pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_seq_file_h;
with asm_pgtable_types_h;
with linux_spinlock_types_h;
with linux_types_h;
limited with linux_mm_types_h;
with asm_pgtable_64_types_h;
with asm_generic_int_ll64_h;
with Interfaces.C.Extensions;

package asm_pgtable_h is

   --  arg-macro: function pgprot_noncached ((boot_cpu_data.x86 > 3) ? (__pgprot(pgprot_val(prot) or _PAGE_CACHE_UC_MINUS)) : (prot)
   --    return (boot_cpu_data.x86 > 3) ? (__pgprot(pgprot_val(prot) or _PAGE_CACHE_UC_MINUS)) : (prot);
   --  arg-macro: function ZERO_PAGE (virt_to_page(empty_zero_page)
   --    return virt_to_page(empty_zero_page);
   --  arg-macro: procedure pte_page pfn_to_page(pte_pfn(pte))
   --    pfn_to_page(pte_pfn(pte))
   --  unsupported macro: pgprot_modify pgprot_modify
   --  arg-macro: procedure pte_pgprot __pgprot(pte_flags(x) and PTE_FLAGS_MASK)
   --    __pgprot(pte_flags(x) and PTE_FLAGS_MASK)
   --  arg-macro: procedure canon_pgprot __pgprot(massage_pgprot(p))
   --    __pgprot(massage_pgprot(p))
   --  unsupported macro: pte_present_nonuma pte_present_nonuma
   --  unsupported macro: pte_accessible pte_accessible
   --  arg-macro: procedure pmd_page pfn_to_page((pmd_val(pmd) and PTE_PFN_MASK) >> PAGE_SHIFT)
   --    pfn_to_page((pmd_val(pmd) and PTE_PFN_MASK) >> PAGE_SHIFT)
   --  arg-macro: procedure mk_pte pfn_pte(page_to_pfn(page), (pgprot))
   --    pfn_pte(page_to_pfn(page), (pgprot))
   --  arg-macro: procedure pud_page pfn_to_page(pud_val(pud) >> PAGE_SHIFT)
   --    pfn_to_page(pud_val(pud) >> PAGE_SHIFT)
   --  arg-macro: procedure pgd_page pfn_to_page(pgd_val(pgd) >> PAGE_SHIFT)
   --    pfn_to_page(pgd_val(pgd) >> PAGE_SHIFT)
   --  arg-macro: function pgd_index (((address) >> PGDIR_SHIFT) and (PTRS_PER_PGD - 1)
   --    return ((address) >> PGDIR_SHIFT) and (PTRS_PER_PGD - 1);
   --  arg-macro: function pgd_offset ((mm).pgd + pgd_index((address))
   --    return (mm).pgd + pgd_index((address));
   --  arg-macro: procedure pgd_offset_k pgd_offset(andinit_mm, (address))
   --    pgd_offset(andinit_mm, (address))
   --  unsupported macro: KERNEL_PGD_BOUNDARY pgd_index(PAGE_OFFSET)
   --  unsupported macro: KERNEL_PGD_PTRS (PTRS_PER_PGD - KERNEL_PGD_BOUNDARY)
   --  arg-macro: procedure flush_tlb_fix_spurious_fault do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure mk_pmd pfn_pmd(page_to_pfn(page), (pgprot))
   --    pfn_pmd(page_to_pfn(page), (pgprot))
   --  unsupported macro: PTE_SHIFT ilog2(PTRS_PER_PTE)
  -- * Macro to mark a page protection value as UC-
  --  

   procedure ptdump_walk_pgd_level (m : access linux_seq_file_h.seq_file; pgd : access asm_pgtable_types_h.pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:20
   pragma Import (CPP, ptdump_walk_pgd_level, "_Z21ptdump_walk_pgd_levelP8seq_fileP5pgd_t");

  -- * ZERO_PAGE is a global shared page that is always zero: used
  -- * for zero-mapped memory areas etc..
  --  

   empty_zero_page : aliased array (0 .. 511) of aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:26
   pragma Import (C, empty_zero_page, "empty_zero_page");

   pgd_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:30
   pragma Import (C, pgd_lock, "pgd_lock");

   pgd_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:31
   pragma Import (C, pgd_list, "pgd_list");

   function pgd_page_get_mm (the_page : access linux_mm_types_h.page) return access linux_mm_types_h.mm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:33
   pragma Import (CPP, pgd_page_get_mm, "_Z15pgd_page_get_mmP4page");

  -- * The following only work if pte_present() is true.
  -- * Undefined behaviour if not..
  --  

   function pte_dirty (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:92
   pragma Import (CPP, pte_dirty, "_ZL9pte_dirty5pte_t");

   function pte_young (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:97
   pragma Import (CPP, pte_young, "_ZL9pte_young5pte_t");

   function pmd_young (pmd : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:102
   pragma Import (CPP, pmd_young, "_ZL9pmd_young5pmd_t");

   function pte_write (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:107
   pragma Import (CPP, pte_write, "_ZL9pte_write5pte_t");

   function pte_file (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:112
   pragma Import (CPP, pte_file, "_ZL8pte_file5pte_t");

   function pte_huge (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:117
   pragma Import (CPP, pte_huge, "_ZL8pte_huge5pte_t");

   function pte_global (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:122
   pragma Import (CPP, pte_global, "_ZL10pte_global5pte_t");

   function pte_exec (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:127
   pragma Import (CPP, pte_exec, "_ZL8pte_exec5pte_t");

   function pte_special (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:132
   pragma Import (CPP, pte_special, "_ZL11pte_special5pte_t");

  --	 * See CONFIG_NUMA_BALANCING pte_numa in include/asm-generic/pgtable.h.
  --	 * On x86 we have _PAGE_BIT_NUMA == _PAGE_BIT_GLOBAL+1 ==
  --	 * __PAGE_BIT_SOFTW1 == _PAGE_BIT_SPECIAL.
  --	  

   function pte_pfn (pte : asm_pgtable_64_types_h.pte_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:143
   pragma Import (CPP, pte_pfn, "_ZL7pte_pfn5pte_t");

   function pmd_pfn (pmd : asm_pgtable_types_h.pmd_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:148
   pragma Import (CPP, pmd_pfn, "_ZL7pmd_pfn5pmd_t");

   function pud_pfn (pud : asm_pgtable_types_h.pud_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:153
   pragma Import (CPP, pud_pfn, "_ZL7pud_pfn5pud_t");

   function pmd_large (pte : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:160
   pragma Import (CPP, pmd_large, "_ZL9pmd_large5pmd_t");

   function pmd_trans_splitting (pmd : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:166
   pragma Import (CPP, pmd_trans_splitting, "_ZL19pmd_trans_splitting5pmd_t");

   function pmd_trans_huge (pmd : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:171
   pragma Import (CPP, pmd_trans_huge, "_ZL14pmd_trans_huge5pmd_t");

   function has_transparent_hugepage return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:176
   pragma Import (CPP, has_transparent_hugepage, "_ZL24has_transparent_hugepagev");

   function pte_set_flags (pte : asm_pgtable_64_types_h.pte_t; set : asm_pgtable_64_types_h.pteval_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:182
   pragma Import (CPP, pte_set_flags, "_ZL13pte_set_flags5pte_tm");

   function pte_clear_flags (pte : asm_pgtable_64_types_h.pte_t; clear : asm_pgtable_64_types_h.pteval_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:189
   pragma Import (CPP, pte_clear_flags, "_ZL15pte_clear_flags5pte_tm");

   function pte_mkclean (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:196
   pragma Import (CPP, pte_mkclean, "_ZL11pte_mkclean5pte_t");

   function pte_mkold (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:201
   pragma Import (CPP, pte_mkold, "_ZL9pte_mkold5pte_t");

   function pte_wrprotect (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:206
   pragma Import (CPP, pte_wrprotect, "_ZL13pte_wrprotect5pte_t");

   function pte_mkexec (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:211
   pragma Import (CPP, pte_mkexec, "_ZL10pte_mkexec5pte_t");

   function pte_mkdirty (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:216
   pragma Import (CPP, pte_mkdirty, "_ZL11pte_mkdirty5pte_t");

   function pte_mkyoung (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:221
   pragma Import (CPP, pte_mkyoung, "_ZL11pte_mkyoung5pte_t");

   function pte_mkwrite (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:226
   pragma Import (CPP, pte_mkwrite, "_ZL11pte_mkwrite5pte_t");

   function pte_mkhuge (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:231
   pragma Import (CPP, pte_mkhuge, "_ZL10pte_mkhuge5pte_t");

   function pte_clrhuge (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:236
   pragma Import (CPP, pte_clrhuge, "_ZL11pte_clrhuge5pte_t");

   function pte_mkglobal (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:241
   pragma Import (CPP, pte_mkglobal, "_ZL12pte_mkglobal5pte_t");

   function pte_clrglobal (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:246
   pragma Import (CPP, pte_clrglobal, "_ZL13pte_clrglobal5pte_t");

   function pte_mkspecial (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:251
   pragma Import (CPP, pte_mkspecial, "_ZL13pte_mkspecial5pte_t");

   function pmd_set_flags (pmd : asm_pgtable_types_h.pmd_t; set : asm_pgtable_64_types_h.pmdval_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:256
   pragma Import (CPP, pmd_set_flags, "_ZL13pmd_set_flags5pmd_tm");

   function pmd_clear_flags (pmd : asm_pgtable_types_h.pmd_t; clear : asm_pgtable_64_types_h.pmdval_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:263
   pragma Import (CPP, pmd_clear_flags, "_ZL15pmd_clear_flags5pmd_tm");

   function pmd_mkold (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:270
   pragma Import (CPP, pmd_mkold, "_ZL9pmd_mkold5pmd_t");

   function pmd_wrprotect (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:275
   pragma Import (CPP, pmd_wrprotect, "_ZL13pmd_wrprotect5pmd_t");

   function pmd_mkdirty (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:280
   pragma Import (CPP, pmd_mkdirty, "_ZL11pmd_mkdirty5pmd_t");

   function pmd_mkhuge (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:285
   pragma Import (CPP, pmd_mkhuge, "_ZL10pmd_mkhuge5pmd_t");

   function pmd_mkyoung (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:290
   pragma Import (CPP, pmd_mkyoung, "_ZL11pmd_mkyoung5pmd_t");

   function pmd_mkwrite (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:295
   pragma Import (CPP, pmd_mkwrite, "_ZL11pmd_mkwrite5pmd_t");

   function pmd_mknotpresent (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:300
   pragma Import (CPP, pmd_mknotpresent, "_ZL16pmd_mknotpresent5pmd_t");

   function pte_soft_dirty (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:306
   pragma Import (CPP, pte_soft_dirty, "_ZL14pte_soft_dirty5pte_t");

   function pmd_soft_dirty (pmd : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:311
   pragma Import (CPP, pmd_soft_dirty, "_ZL14pmd_soft_dirty5pmd_t");

   function pte_mksoft_dirty (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:316
   pragma Import (CPP, pte_mksoft_dirty, "_ZL16pte_mksoft_dirty5pte_t");

   function pmd_mksoft_dirty (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:321
   pragma Import (CPP, pmd_mksoft_dirty, "_ZL16pmd_mksoft_dirty5pmd_t");

   function pte_file_clear_soft_dirty (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:326
   pragma Import (CPP, pte_file_clear_soft_dirty, "_ZL25pte_file_clear_soft_dirty5pte_t");

   function pte_file_mksoft_dirty (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:331
   pragma Import (CPP, pte_file_mksoft_dirty, "_ZL21pte_file_mksoft_dirty5pte_t");

   function pte_file_soft_dirty (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:336
   pragma Import (CPP, pte_file_soft_dirty, "_ZL19pte_file_soft_dirty5pte_t");

  -- * Mask out unsupported bits in a present pgprot.  Non-present pgprots
  -- * can use those bits for other purposes, so leave them be.
  --  

   function massage_pgprot (pgprot : asm_pgtable_types_h.pgprot_t) return asm_pgtable_64_types_h.pgprotval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:347
   pragma Import (CPP, massage_pgprot, "_ZL14massage_pgprot6pgprot");

   function pfn_pte (page_nr : unsigned_long; pgprot : asm_pgtable_types_h.pgprot_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:357
   pragma Import (CPP, pfn_pte, "_ZL7pfn_ptem6pgprot");

   function pfn_pmd (page_nr : unsigned_long; pgprot : asm_pgtable_types_h.pgprot_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:363
   pragma Import (CPP, pfn_pmd, "_ZL7pfn_pmdm6pgprot");

   function pte_modify (pte : asm_pgtable_64_types_h.pte_t; newprot : asm_pgtable_types_h.pgprot_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:369
   pragma Import (CPP, pte_modify, "_ZL10pte_modify5pte_t6pgprot");

  --	 * Chop off the NX bit (if present), and add the NX portion of
  --	 * the newprot (if present):
  --	  

   function pmd_modify (pmd : asm_pgtable_types_h.pmd_t; newprot : asm_pgtable_types_h.pgprot_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:383
   pragma Import (CPP, pmd_modify, "_ZL10pmd_modify5pmd_t6pgprot");

  -- mprotect needs to preserve PAT bits when updating vm_page_prot  
   function pgprot_modify (oldprot : asm_pgtable_types_h.pgprot_t; newprot : asm_pgtable_types_h.pgprot_t) return asm_pgtable_types_h.pgprot_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:395
   pragma Import (CPP, pgprot_modify, "_ZL13pgprot_modify6pgprotS_");

   function is_new_memtype_allowed
     (paddr : asm_generic_int_ll64_h.u64;
      size : unsigned_long;
      flags : unsigned_long;
      new_flags : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:406
   pragma Import (CPP, is_new_memtype_allowed, "_ZL22is_new_memtype_allowedymmm");

  --	 * PAT type is always WB for untracked ranges, so no need to check.
  --	  

  --	 * Certain new memtypes are not allowed with certain
  --	 * requested memtype:
  --	 * - request is uncached, return cannot be write-back
  --	 * - request is write-combine, return cannot be write-back
  --	  

   function populate_extra_pmd (vaddr : unsigned_long) return access asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:432
   pragma Import (CPP, populate_extra_pmd, "_Z18populate_extra_pmdm");

   function populate_extra_pte (vaddr : unsigned_long) return access asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:433
   pragma Import (CPP, populate_extra_pte, "_Z18populate_extra_ptem");

   function pte_none (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:447
   pragma Import (CPP, pte_none, "_ZL8pte_none5pte_t");

   function pte_same (a : asm_pgtable_64_types_h.pte_t; b : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:453
   pragma Import (CPP, pte_same, "_ZL8pte_same5pte_tS_");

   function pte_present (a : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:458
   pragma Import (CPP, pte_present, "_ZL11pte_present5pte_t");

   function pte_present_nonuma (a : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:465
   pragma Import (CPP, pte_present_nonuma, "_ZL18pte_present_nonuma5pte_t");

   function pte_accessible (mm : access linux_mm_types_h.mm_struct; a : asm_pgtable_64_types_h.pte_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:471
   pragma Import (CPP, pte_accessible, "_ZL14pte_accessibleP9mm_struct5pte_t");

   function pte_hidden (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:483
   pragma Import (CPP, pte_hidden, "_ZL10pte_hidden5pte_t");

   function pmd_present (pmd : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:488
   pragma Import (CPP, pmd_present, "_ZL11pmd_present5pmd_t");

  --	 * Checking for _PAGE_PSE is needed too because
  --	 * split_huge_page will temporarily clear the present bit (but
  --	 * the _PAGE_PSE flag will remain set at all times while the
  --	 * _PAGE_PRESENT bit is clear).
  --	  

   function pmd_none (pmd : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:500
   pragma Import (CPP, pmd_none, "_ZL8pmd_none5pmd_t");

  -- Only check low word on 32-bit platforms, since it might be
  --	   out of sync with upper half.  

   function pmd_page_vaddr (pmd : asm_pgtable_types_h.pmd_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:507
   pragma Import (CPP, pmd_page_vaddr, "_ZL14pmd_page_vaddr5pmd_t");

  -- * Currently stuck as a macro due to indirect forward reference to
  -- * linux/mmzone.h's __section_mem_map_addr() definition:
  --  

  -- * the pmd page can be thought of an array like this: pmd_t[PTRS_PER_PMD]
  -- *
  -- * this macro returns the index of the entry in the pmd page which would
  -- * control the given virtual address
  --  

   function pmd_index (address : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:524
   pragma Import (CPP, pmd_index, "_ZL9pmd_indexm");

  -- * Conversion functions: convert a page and protection to a page entry,
  -- * and a page entry and page directory to the page they refer to.
  -- *
  -- * (Currently stuck as a macro because of indirect forward reference
  -- * to linux/mm.h:page_to_nid())
  --  

  -- * the pte page can be thought of an array like this: pte_t[PTRS_PER_PTE]
  -- *
  -- * this function returns the index of the entry in the pte page which would
  -- * control the given virtual address
  --  

   function pte_index (address : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:544
   pragma Import (CPP, pte_index, "_ZL9pte_indexm");

   function pte_offset_kernel (pmd : access asm_pgtable_types_h.pmd_t; address : unsigned_long) return access asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:549
   pragma Import (CPP, pte_offset_kernel, "_ZL17pte_offset_kernelP5pmd_tm");

   function pmd_bad (pmd : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:554
   pragma Import (CPP, pmd_bad, "_ZL7pmd_bad5pmd_t");

  -- pmd_numa check  
   function pages_to_mb (npg : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:564
   pragma Import (CPP, pages_to_mb, "_ZL11pages_to_mbm");

   function pud_none (pud : asm_pgtable_types_h.pud_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:570
   pragma Import (CPP, pud_none, "_ZL8pud_none5pud_t");

   function pud_present (pud : asm_pgtable_types_h.pud_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:575
   pragma Import (CPP, pud_present, "_ZL11pud_present5pud_t");

   function pud_page_vaddr (pud : asm_pgtable_types_h.pud_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:580
   pragma Import (CPP, pud_page_vaddr, "_ZL14pud_page_vaddr5pud_t");

  -- * Currently stuck as a macro due to indirect forward reference to
  -- * linux/mmzone.h's __section_mem_map_addr() definition:
  --  

  -- Find an entry in the second-level page table..  
   function pmd_offset (pud : access asm_pgtable_types_h.pud_t; address : unsigned_long) return access asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:592
   pragma Import (CPP, pmd_offset, "_ZL10pmd_offsetP5pud_tm");

   function pud_large (pud : asm_pgtable_types_h.pud_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:597
   pragma Import (CPP, pud_large, "_ZL9pud_large5pud_t");

   function pud_bad (pud : asm_pgtable_types_h.pud_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:603
   pragma Import (CPP, pud_bad, "_ZL7pud_bad5pud_t");

   function pgd_present (pgd : asm_pgtable_types_h.pgd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:615
   pragma Import (CPP, pgd_present, "_ZL11pgd_present5pgd_t");

   function pgd_page_vaddr (pgd : asm_pgtable_types_h.pgd_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:620
   pragma Import (CPP, pgd_page_vaddr, "_ZL14pgd_page_vaddr5pgd_t");

  -- * Currently stuck as a macro due to indirect forward reference to
  -- * linux/mmzone.h's __section_mem_map_addr() definition:
  --  

  -- to find an entry in a page-table-directory.  
   function pud_index (address : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:632
   pragma Import (CPP, pud_index, "_ZL9pud_indexm");

   function pud_offset (pgd : access asm_pgtable_types_h.pgd_t; address : unsigned_long) return access asm_pgtable_types_h.pud_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:637
   pragma Import (CPP, pud_offset, "_ZL10pud_offsetP5pgd_tm");

   function pgd_bad (pgd : asm_pgtable_types_h.pgd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:642
   pragma Import (CPP, pgd_bad, "_ZL7pgd_bad5pgd_t");

   function pgd_none (pgd : asm_pgtable_types_h.pgd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:647
   pragma Import (CPP, pgd_none, "_ZL8pgd_none5pgd_t");

  -- * the pgd page can be thought of an array like this: pgd_t[PTRS_PER_PGD]
  -- *
  -- * this macro returns the index of the entry in the pgd page which would
  -- * control the given virtual address
  --  

  -- * pgd_offset() returns a (pgd_t *)
  -- * pgd_index() is used get the offset into the pgd page's array of pgd_t's;
  --  

  -- * a shortcut which implies the use of the kernel's pgd, instead
  -- * of a process's
  --  

   direct_gbpages : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:680
   pragma Import (C, direct_gbpages, "direct_gbpages");

   procedure init_mem_mapping;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:681
   pragma Import (CPP, init_mem_mapping, "_Z16init_mem_mappingv");

   procedure early_alloc_pgt_buf;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:682
   pragma Import (CPP, early_alloc_pgt_buf, "_Z19early_alloc_pgt_bufv");

  -- local pte updates need not use xchg for locking  
   function native_local_ptep_get_and_clear (ptep : access asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:685
   pragma Import (CPP, native_local_ptep_get_and_clear, "_ZL31native_local_ptep_get_and_clearP5pte_t");

  -- Pure native function needs no input for mm, addr  
   function native_local_pmdp_get_and_clear (pmdp : access asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:694
   pragma Import (CPP, native_local_pmdp_get_and_clear, "_ZL31native_local_pmdp_get_and_clearP5pmd_t");

   procedure native_set_pte_at
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t;
      pte : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:702
   pragma Import (CPP, native_set_pte_at, "_ZL17native_set_pte_atP9mm_structmP5pte_tS1_");

   procedure native_set_pmd_at
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t;
      pmd : asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:708
   pragma Import (CPP, native_set_pmd_at, "_ZL17native_set_pmd_atP9mm_structmP5pmd_tS1_");

  -- * Rules for using pte_update - it must be called after any PTE update which
  -- * has not been done using the set_pte / clear_pte interfaces.  It is used by
  -- * shadow mode hypervisors to resynchronize the shadow page tables.  Kernel PTE
  -- * updates should either be sets, clears, or set_pte_atomic for P->P
  -- * transitions, which means this hook should only be called for user PTEs.
  -- * This hook implies a P->P protection or access change has taken place, which
  -- * requires a subsequent TLB flush.  The notification can optionally be delayed
  -- * until the TLB flush event by using the pte_update_defer form of the
  -- * interface, but care must be taken to assure that the flush happens while
  -- * still holding the same page table lock so that the shadow and primary pages
  -- * do not become out of sync on SMP.
  --  

  -- * We only update the dirty/accessed state if we set
  -- * the dirty bit by hand in the kernel, since the hardware
  -- * will do the accessed bit for us, and we don't want to
  -- * race with other CPU's that might be updating the dirty
  -- * bit at the same time.
  --  

   function ptep_set_access_flags
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t;
      c_entry : asm_pgtable_64_types_h.pte_t;
      dirty : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:742
   pragma Import (CPP, ptep_set_access_flags, "_Z21ptep_set_access_flagsP14vm_area_structmP5pte_tS1_i");

   function ptep_test_and_clear_young
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:747
   pragma Import (CPP, ptep_test_and_clear_young, "_Z25ptep_test_and_clear_youngP14vm_area_structmP5pte_t");

   function ptep_clear_flush_young
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:751
   pragma Import (CPP, ptep_clear_flush_young, "_Z22ptep_clear_flush_youngP14vm_area_structmP5pte_t");

   function ptep_get_and_clear
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:755
   pragma Import (CPP, ptep_get_and_clear, "_ZL18ptep_get_and_clearP9mm_structmP5pte_t");

   function ptep_get_and_clear_full
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t;
      full : int) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:764
   pragma Import (CPP, ptep_get_and_clear_full, "_ZL23ptep_get_and_clear_fullP9mm_structmP5pte_ti");

  --		 * Full address destruction in progress; paravirt does not
  --		 * care about updates and native needs no locking
  --		  

   procedure ptep_set_wrprotect
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:782
   pragma Import (CPP, ptep_set_wrprotect, "_ZL18ptep_set_wrprotectP9mm_structmP5pte_t");

   function pmdp_set_access_flags
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t;
      c_entry : asm_pgtable_types_h.pmd_t;
      dirty : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:794
   pragma Import (CPP, pmdp_set_access_flags, "_Z21pmdp_set_access_flagsP14vm_area_structmP5pmd_tS1_i");

   function pmdp_test_and_clear_young
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:799
   pragma Import (CPP, pmdp_test_and_clear_young, "_Z25pmdp_test_and_clear_youngP14vm_area_structmP5pmd_t");

   function pmdp_clear_flush_young
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:803
   pragma Import (CPP, pmdp_clear_flush_young, "_Z22pmdp_clear_flush_youngP14vm_area_structmP5pmd_t");

   procedure pmdp_splitting_flush
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:808
   pragma Import (CPP, pmdp_splitting_flush, "_Z20pmdp_splitting_flushP14vm_area_structmP5pmd_t");

   function pmd_write (pmd : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:812
   pragma Import (CPP, pmd_write, "_ZL9pmd_write5pmd_t");

   function pmdp_get_and_clear
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:818
   pragma Import (CPP, pmdp_get_and_clear, "_ZL18pmdp_get_and_clearP9mm_structmP5pmd_t");

   procedure pmdp_set_wrprotect
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:827
   pragma Import (CPP, pmdp_set_wrprotect, "_ZL18pmdp_set_wrprotectP9mm_structmP5pmd_t");

  -- * clone_pgd_range(pgd_t *dst, pgd_t *src, int count);
  -- *
  -- *  dst - pointer to pgd range anwhere on a pgd page
  -- *  src - ""
  -- *  count - the number of pgds to copy.
  -- *
  -- * dst and src can be on the same page, but the range must not overlap,
  -- * and must not cross a page boundary.
  --  

   procedure clone_pgd_range
     (dst : access asm_pgtable_types_h.pgd_t;
      src : access asm_pgtable_types_h.pgd_t;
      count : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:844
   pragma Import (CPP, clone_pgd_range, "_ZL15clone_pgd_rangeP5pgd_tS0_i");

   function page_level_shift (level : asm_pgtable_types_h.pg_level) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:850
   pragma Import (CPP, page_level_shift, "_ZL16page_level_shift8pg_level");

   function page_level_size (level : asm_pgtable_types_h.pg_level) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:854
   pragma Import (CPP, page_level_size, "_ZL15page_level_size8pg_level");

   function page_level_mask (level : asm_pgtable_types_h.pg_level) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:858
   pragma Import (CPP, page_level_mask, "_ZL15page_level_mask8pg_level");

  -- * The x86 doesn't have any external MMU info: the kernel page
  -- * tables contain all the necessary information.
  --  

   procedure update_mmu_cache
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:867
   pragma Import (CPP, update_mmu_cache, "_ZL16update_mmu_cacheP14vm_area_structmP5pte_t");

   procedure update_mmu_cache_pmd
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      pmd : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:871
   pragma Import (CPP, update_mmu_cache_pmd, "_ZL20update_mmu_cache_pmdP14vm_area_structmP5pmd_t");

   function pte_swp_mksoft_dirty (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:877
   pragma Import (CPP, pte_swp_mksoft_dirty, "_ZL20pte_swp_mksoft_dirty5pte_t");

   function pte_swp_soft_dirty (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:883
   pragma Import (CPP, pte_swp_soft_dirty, "_ZL18pte_swp_soft_dirty5pte_t");

   function pte_swp_clear_soft_dirty (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable.h:889
   pragma Import (CPP, pte_swp_clear_soft_dirty, "_ZL24pte_swp_clear_soft_dirty5pte_t");

end asm_pgtable_h;

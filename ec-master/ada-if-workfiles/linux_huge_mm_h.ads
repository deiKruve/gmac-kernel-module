pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_mm_types_h;
with asm_pgtable_types_h;
with System;
with Interfaces.C.Extensions;
limited with linux_types_h;

package linux_huge_mm_h is

   --  unsupported macro: HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
   --  unsupported macro: HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
   --  unsupported macro: HPAGE_PMD_SHIFT PMD_SHIFT
   --  unsupported macro: HPAGE_PMD_SIZE ((1UL) << HPAGE_PMD_SHIFT)
   --  unsupported macro: HPAGE_PMD_MASK (~(HPAGE_PMD_SIZE - 1))
   --  arg-macro: function transparent_hugepage_enabled ((transparent_hugepage_flags and (1<<TRANSPARENT_HUGEPAGE_FLAG)  or else  (transparent_hugepage_flags and (1<<TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG)  and then  ((__vma).vm_flags and VM_HUGEPAGE)))  and then  not((__vma).vm_flags and VM_NOHUGEPAGE)  and then  notis_vma_temporary_stack(__vma)
   --    return (transparent_hugepage_flags and (1<<TRANSPARENT_HUGEPAGE_FLAG)  or else  (transparent_hugepage_flags and (1<<TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG)  and then  ((__vma).vm_flags and VM_HUGEPAGE)))  and then  not((__vma).vm_flags and VM_NOHUGEPAGE)  and then  notis_vma_temporary_stack(__vma);
   --  arg-macro: function transparent_hugepage_defrag ((transparent_hugepage_flags and (1<<TRANSPARENT_HUGEPAGE_DEFRAG_FLAG))  or else  (transparent_hugepage_flags and (1<<TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG)  and then  (__vma).vm_flags and VM_HUGEPAGE)
   --    return (transparent_hugepage_flags and (1<<TRANSPARENT_HUGEPAGE_DEFRAG_FLAG))  or else  (transparent_hugepage_flags and (1<<TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG)  and then  (__vma).vm_flags and VM_HUGEPAGE);
   --  arg-macro: function transparent_hugepage_use_zero_page (transparent_hugepage_flags and (1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG)
   --    return transparent_hugepage_flags and (1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
   --  arg-macro: procedure transparent_hugepage_debug_cow 0
   --    0
   --  arg-macro: procedure split_huge_page_pmd do { pmd_t *____pmd := (__pmd); if (unlikely(pmd_trans_huge(*____pmd))) __split_huge_page_pmd(__vma, __address, ____pmd); } while (0)
   --    do { pmd_t *____pmd := (__pmd); if (unlikely(pmd_trans_huge(*____pmd))) __split_huge_page_pmd(__vma, __address, ____pmd); } while (0)
   --  arg-macro: procedure wait_split_huge_page do { pmd_t *____pmd := (__pmd); anon_vma_lock_write(__anon_vma); anon_vma_unlock_write(__anon_vma); BUG_ON(pmd_trans_splitting(*____pmd)  or else  pmd_trans_huge(*____pmd)); } while (0)
   --    do { pmd_t *____pmd := (__pmd); anon_vma_lock_write(__anon_vma); anon_vma_unlock_write(__anon_vma); BUG_ON(pmd_trans_splitting(*____pmd)  or else  pmd_trans_huge(*____pmd)); } while (0)
   function do_huge_pmd_anonymous_page
     (mm : access linux_mm_types_h.mm_struct;
      vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      pmd : access asm_pgtable_types_h.pmd_t;
      flags : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:4
   pragma Import (CPP, do_huge_pmd_anonymous_page, "_Z26do_huge_pmd_anonymous_pageP9mm_structP14vm_area_structmP5pmd_tj");

   function copy_huge_pmd
     (dst_mm : access linux_mm_types_h.mm_struct;
      src_mm : access linux_mm_types_h.mm_struct;
      dst_pmd : access asm_pgtable_types_h.pmd_t;
      src_pmd : access asm_pgtable_types_h.pmd_t;
      addr : unsigned_long;
      vma : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:8
   pragma Import (CPP, copy_huge_pmd, "_Z13copy_huge_pmdP9mm_structS0_P5pmd_tS2_mP14vm_area_struct");

   procedure huge_pmd_set_accessed
     (mm : access linux_mm_types_h.mm_struct;
      vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      pmd : access asm_pgtable_types_h.pmd_t;
      orig_pmd : asm_pgtable_types_h.pmd_t;
      dirty : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:11
   pragma Import (CPP, huge_pmd_set_accessed, "_Z21huge_pmd_set_accessedP9mm_structP14vm_area_structmP5pmd_tS3_i");

   function do_huge_pmd_wp_page
     (mm : access linux_mm_types_h.mm_struct;
      vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      pmd : access asm_pgtable_types_h.pmd_t;
      orig_pmd : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:15
   pragma Import (CPP, do_huge_pmd_wp_page, "_Z19do_huge_pmd_wp_pageP9mm_structP14vm_area_structmP5pmd_tS3_");

   function follow_trans_huge_pmd
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      pmd : access asm_pgtable_types_h.pmd_t;
      flags : unsigned) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:18
   pragma Import (CPP, follow_trans_huge_pmd, "_Z21follow_trans_huge_pmdP14vm_area_structmP5pmd_tj");

   function zap_huge_pmd
     (tlb : System.Address;
      vma : access linux_mm_types_h.vm_area_struct;
      pmd : access asm_pgtable_types_h.pmd_t;
      addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:22
   pragma Import (CPP, zap_huge_pmd, "_Z12zap_huge_pmdP10mmu_gatherP14vm_area_structP5pmd_tm");

   function mincore_huge_pmd
     (vma : access linux_mm_types_h.vm_area_struct;
      pmd : access asm_pgtable_types_h.pmd_t;
      addr : unsigned_long;
      c_end : unsigned_long;
      vec : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:25
   pragma Import (CPP, mincore_huge_pmd, "_Z16mincore_huge_pmdP14vm_area_structP5pmd_tmmPh");

   function move_huge_pmd
     (vma : access linux_mm_types_h.vm_area_struct;
      new_vma : access linux_mm_types_h.vm_area_struct;
      old_addr : unsigned_long;
      new_addr : unsigned_long;
      old_end : unsigned_long;
      old_pmd : access asm_pgtable_types_h.pmd_t;
      new_pmd : access asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:28
   pragma Import (CPP, move_huge_pmd, "_Z13move_huge_pmdP14vm_area_structS0_mmmP5pmd_tS2_");

   function change_huge_pmd
     (vma : access linux_mm_types_h.vm_area_struct;
      pmd : access asm_pgtable_types_h.pmd_t;
      addr : unsigned_long;
      newprot : asm_pgtable_types_h.pgprot_t;
      prot_numa : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:33
   pragma Import (CPP, change_huge_pmd, "_Z15change_huge_pmdP14vm_area_structP5pmd_tm6pgproti");

   type transparent_hugepage_flag is 
     (TRANSPARENT_HUGEPAGE_FLAG,
      TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
      TRANSPARENT_HUGEPAGE_DEFRAG_FLAG,
      TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG,
      TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG,
      TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
   pragma Convention (C, transparent_hugepage_flag);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:37

   type page_check_address_pmd_flag is 
     (PAGE_CHECK_ADDRESS_PMD_FLAG,
      PAGE_CHECK_ADDRESS_PMD_NOTSPLITTING_FLAG,
      PAGE_CHECK_ADDRESS_PMD_SPLITTING_FLAG);
   pragma Convention (C, page_check_address_pmd_flag);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:49

   function page_check_address_pmd
     (the_page : access linux_mm_types_h.page;
      mm : access linux_mm_types_h.mm_struct;
      address : unsigned_long;
      flag : page_check_address_pmd_flag;
      ptl : System.Address) return access asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:54
   pragma Import (CPP, page_check_address_pmd, "_Z22page_check_address_pmdP4pageP9mm_structm27page_check_address_pmd_flagPP8spinlock");

   function is_vma_temporary_stack (vma : access linux_mm_types_h.vm_area_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:68
   pragma Import (CPP, is_vma_temporary_stack, "_Z22is_vma_temporary_stackP14vm_area_struct");

   transparent_hugepage_flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:95
   pragma Import (C, transparent_hugepage_flags, "transparent_hugepage_flags");

   function copy_pte_range
     (dst_mm : access linux_mm_types_h.mm_struct;
      src_mm : access linux_mm_types_h.mm_struct;
      dst_pmd : access asm_pgtable_types_h.pmd_t;
      src_pmd : access asm_pgtable_types_h.pmd_t;
      vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      c_end : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:96
   pragma Import (CPP, copy_pte_range, "_Z14copy_pte_rangeP9mm_structS0_P5pmd_tS2_P14vm_area_structmm");

   function split_huge_page_to_list (the_page : access linux_mm_types_h.page; list : access linux_types_h.list_head) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:100
   pragma Import (CPP, split_huge_page_to_list, "_Z23split_huge_page_to_listP4pageP9list_head");

   function split_huge_page (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:101
   pragma Import (CPP, split_huge_page, "_ZL15split_huge_pageP4page");

   --  skipped func __split_huge_page_pmd

   procedure split_huge_page_pmd_mm
     (mm : access linux_mm_types_h.mm_struct;
      address : unsigned_long;
      pmd : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:122
   pragma Import (CPP, split_huge_page_pmd_mm, "_Z22split_huge_page_pmd_mmP9mm_structmP5pmd_t");

   function hugepage_madvise
     (vma : access linux_mm_types_h.vm_area_struct;
      vm_flags : access unsigned_long;
      advice : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:127
   pragma Import (CPP, hugepage_madvise, "_Z16hugepage_madviseP14vm_area_structPmi");

   --  skipped func __vma_adjust_trans_huge

   --  skipped func __pmd_trans_huge_lock

  -- mmap_sem must be held on entry  
   function pmd_trans_huge_lock
     (pmd : access asm_pgtable_types_h.pmd_t;
      vma : access linux_mm_types_h.vm_area_struct;
      ptl : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:136
   pragma Import (CPP, pmd_trans_huge_lock, "_ZL19pmd_trans_huge_lockP5pmd_tP14vm_area_structPP8spinlock");

   procedure vma_adjust_trans_huge
     (vma : access linux_mm_types_h.vm_area_struct;
      start : unsigned_long;
      c_end : unsigned_long;
      adjust_next : long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:145
   pragma Import (CPP, vma_adjust_trans_huge, "_ZL21vma_adjust_trans_hugeP14vm_area_structmml");

   function hpage_nr_pages (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:154
   pragma Import (CPP, hpage_nr_pages, "_ZL14hpage_nr_pagesP4page");

   function do_huge_pmd_numa_page
     (mm : access linux_mm_types_h.mm_struct;
      vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      pmd : asm_pgtable_types_h.pmd_t;
      pmdp : access asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/huge_mm.h:161
   pragma Import (CPP, do_huge_pmd_numa_page, "_Z21do_huge_pmd_numa_pageP9mm_structP14vm_area_structm5pmd_tPS3_");

end linux_huge_mm_h;

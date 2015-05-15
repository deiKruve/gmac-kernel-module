pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_mm_types_h;
with asm_pgtable_64_types_h;
with asm_pgtable_types_h;
limited with linux_spinlock_types_h;

package asm_generic_pgtable_h is

   --  unsupported macro: USER_PGTABLES_CEILING 0UL
   --  arg-macro: procedure pgd_offset_gate pgd_offset(mm, addr)
   --    pgd_offset(mm, addr)
   --  arg-macro: function move_pte (pte
   --    return pte;
   --  arg-macro: function pgd_addr_end ({ unsigned long __boundary := ((addr) + PGDIR_SIZE) and PGDIR_MASK; (__boundary - 1 < (end) - 1)? __boundary: (end); }
   --    return { unsigned long __boundary := ((addr) + PGDIR_SIZE) and PGDIR_MASK; (__boundary - 1 < (end) - 1)? __boundary: (end); };
   --  arg-macro: function pud_addr_end ({ unsigned long __boundary := ((addr) + PUD_SIZE) and PUD_MASK; (__boundary - 1 < (end) - 1)? __boundary: (end); }
   --    return { unsigned long __boundary := ((addr) + PUD_SIZE) and PUD_MASK; (__boundary - 1 < (end) - 1)? __boundary: (end); };
   --  arg-macro: function pmd_addr_end ({ unsigned long __boundary := ((addr) + PMD_SIZE) and PMD_MASK; (__boundary - 1 < (end) - 1)? __boundary: (end); }
   --    return { unsigned long __boundary := ((addr) + PMD_SIZE) and PMD_MASK; (__boundary - 1 < (end) - 1)? __boundary: (end); };
   --  unsupported macro: io_remap_pfn_range remap_pfn_range
  -- * On almost all architectures and configurations, 0 can be used as the
  -- * upper ceiling to free_pgtables(): on many architectures it has the same
  -- * effect as using TASK_SIZE.  However, there is one configuration which
  -- * must impose a more careful limit, to avoid freeing kernel pgtables.
  --  

  -- * Some architectures may be able to avoid expensive synchronization
  -- * primitives when modifications are made to PTE's which are already
  -- * not present, or in the process of an address space destruction.
  --  

   procedure pte_clear_not_present_full
     (mm : access linux_mm_types_h.mm_struct;
      address : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t;
      full : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:123
   pragma Import (CPP, pte_clear_not_present_full, "_ZL26pte_clear_not_present_fullP9mm_structmP5pte_ti");

   function ptep_clear_flush
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:133
   pragma Import (CPP, ptep_clear_flush, "_Z16ptep_clear_flushP14vm_area_structmP5pte_t");

   function pmdp_clear_flush
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:139
   pragma Import (CPP, pmdp_clear_flush, "_Z16pmdp_clear_flushP14vm_area_structmP5pmd_t");

   procedure pgtable_trans_huge_deposit
     (mm : access linux_mm_types_h.mm_struct;
      pmdp : access asm_pgtable_types_h.pmd_t;
      pgtable : asm_pgtable_types_h.pgtable_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:176
   pragma Import (CPP, pgtable_trans_huge_deposit, "_Z26pgtable_trans_huge_depositP9mm_structP5pmd_tP4page");

   function pgtable_trans_huge_withdraw (mm : access linux_mm_types_h.mm_struct; pmdp : access asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pgtable_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:181
   pragma Import (CPP, pgtable_trans_huge_withdraw, "_Z27pgtable_trans_huge_withdrawP9mm_structP5pmd_t");

   procedure pmdp_invalidate
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:185
   pragma Import (CPP, pmdp_invalidate, "_Z15pmdp_invalidateP14vm_area_structmP5pmd_t");

  -- * Some architectures provide facilities to virtualization guests
  -- * so that they can flag allocated pages as unused. This allows the
  -- * host to transparently reclaim unused pages. This function returns
  -- * whether the pte's page is unused.
  --  

   function pte_unused (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:203
   pragma Import (CPP, pte_unused, "_ZL10pte_unused5pte_t");

   function pmd_same (pmd_a : asm_pgtable_types_h.pmd_t; pmd_b : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:211
   pragma Import (CPP, pmd_same, "_ZL8pmd_same5pmd_tS_");

  -- * When walking page tables, get the address of the next boundary,
  -- * or the end address of the range if that comes earlier.  Although no
  -- * vma end wraps to 0, rounded up __boundary may wrap to 0 throughout.
  --  

  -- * When walking page tables, we usually want to skip any p?d_none entries;
  -- * and any p?d_bad entries - reporting the error before resetting to none.
  -- * Do the tests inline, but report and clear the bad entry in mm/memory.c.
  --  

   procedure pgd_clear_bad (arg1 : access asm_pgtable_types_h.pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:282
   pragma Import (CPP, pgd_clear_bad, "_Z13pgd_clear_badP5pgd_t");

   procedure pud_clear_bad (arg1 : access asm_pgtable_types_h.pud_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:283
   pragma Import (CPP, pud_clear_bad, "_Z13pud_clear_badP5pud_t");

   procedure pmd_clear_bad (arg1 : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:284
   pragma Import (CPP, pmd_clear_bad, "_Z13pmd_clear_badP5pmd_t");

   function pgd_none_or_clear_bad (pgd : access asm_pgtable_types_h.pgd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:286
   pragma Import (CPP, pgd_none_or_clear_bad, "_ZL21pgd_none_or_clear_badP5pgd_t");

   function pud_none_or_clear_bad (pud : access asm_pgtable_types_h.pud_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:297
   pragma Import (CPP, pud_none_or_clear_bad, "_ZL21pud_none_or_clear_badP5pud_t");

   function pmd_none_or_clear_bad (pmd : access asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:308
   pragma Import (CPP, pmd_none_or_clear_bad, "_ZL21pmd_none_or_clear_badP5pmd_t");

   --  skipped func __ptep_modify_prot_start

  --	 * Get the current pte state, but zero it out to make it
  --	 * non-present, preventing the hardware from asynchronously
  --	 * updating it.
  --	  

   --  skipped func __ptep_modify_prot_commit

  --	 * The pte is non-present, so there's no hardware state to
  --	 * preserve.
  --	  

  -- * Start a pte protection read-modify-write transaction, which
  -- * protects against asynchronous hardware modifications to the pte.
  -- * The intention is not to prevent the hardware from making pte
  -- * updates, but to prevent any updates it may make from being lost.
  -- *
  -- * This does not protect against other software modifications of the
  -- * pte; the appropriate pte lock must be held over the transation.
  -- *
  -- * Note that this interface is intended to be batchable, meaning that
  -- * ptep_modify_prot_commit may not actually update the pte, but merely
  -- * queue the update to be done at some later time.  The update must be
  -- * actually committed before the pte lock is released, however.
  --  

  -- * Commit an update to a pte, leaving any hardware-controlled bits in
  -- * the PTE unmodified.
  --  

  -- * A facility to provide lazy MMU batching.  This allows PTE updates and
  -- * page invalidations to be delayed until a call to leave lazy MMU mode
  -- * is issued.  Some architectures may benefit from doing this, and it is
  -- * beneficial for both shadow and direct mode hypervisors, which may batch
  -- * the PTE updates which happen during this window.  Note that using this
  -- * interface requires that read hazards be removed from the code.  A read
  -- * hazard could result in the direct mode hypervisor case, since the actual
  -- * write to the page tables may not yet have taken place, so reads though
  -- * a raw PTE pointer after it has been modified are not guaranteed to be
  -- * up to date.  This mode can only be entered and left under the protection of
  -- * the page table locks for all page tables which may be modified.  In the UP
  -- * case, this is required so that preemption is disabled, and in the SMP case,
  -- * it must synchronize the delayed page table writes properly on other CPUs.
  --  

  -- * A facility to provide batching of the reload of page tables and
  -- * other process state with the actual context switch code for
  -- * paravirtualized guests.  By convention, only one of the batched
  -- * update (lazy) modes (CPU, MMU) should be active at any given time,
  -- * entry should never be nested, and entry and exits should always be
  -- * paired.  This is for sanity of maintaining and reasoning about the
  -- * kernel code.  In this case, the exit (end of the context switch) is
  -- * in architecture-specific code, and so doesn't need a generic
  -- * definition.
  --  

  -- * Interfaces that can be used by architecture code to keep track of
  -- * memory type of pfn mappings specified by the remap_pfn_range,
  -- * vm_insert_pfn.
  --  

  -- * track_pfn_remap is called when a _new_ pfn mapping is being established
  -- * by remap_pfn_range() for physical range indicated by pfn and size.
  --  

  -- * track_pfn_insert is called when a _new_ single pfn is established
  -- * by vm_insert_pfn().
  --  

  -- * track_pfn_copy is called when vma that is covering the pfnmap gets
  -- * copied through copy_page_range().
  --  

  -- * untrack_pfn_vma is called while unmapping a pfnmap for a region.
  -- * untrack can be called for a specific region indicated by pfn and size or
  -- * can be for the entire vma (in which case pfn, size are zero).
  --  

   function track_pfn_remap
     (vma : access linux_mm_types_h.vm_area_struct;
      prot : access asm_pgtable_types_h.pgprot_t;
      pfn : unsigned_long;
      addr : unsigned_long;
      size : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:512
   pragma Import (CPP, track_pfn_remap, "_Z15track_pfn_remapP14vm_area_structP6pgprotmmm");

   function track_pfn_insert
     (vma : access linux_mm_types_h.vm_area_struct;
      prot : access asm_pgtable_types_h.pgprot_t;
      pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:515
   pragma Import (CPP, track_pfn_insert, "_Z16track_pfn_insertP14vm_area_structP6pgprotm");

   function track_pfn_copy (vma : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:517
   pragma Import (CPP, track_pfn_copy, "_Z14track_pfn_copyP14vm_area_struct");

   procedure untrack_pfn
     (vma : access linux_mm_types_h.vm_area_struct;
      pfn : unsigned_long;
      size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:518
   pragma Import (CPP, untrack_pfn, "_Z11untrack_pfnP14vm_area_structmm");

   function is_zero_pfn (pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:533
   pragma Import (CPP, is_zero_pfn, "_ZL11is_zero_pfnm");

   function my_zero_pfn (addr : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:539
   pragma Import (CPP, my_zero_pfn, "_ZL11my_zero_pfnm");

   function pmd_read_atomic (pmdp : access asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:567
   pragma Import (CPP, pmd_read_atomic, "_ZL15pmd_read_atomicP5pmd_t");

  --	 * Depend on compiler for an atomic pmd read. NOTE: this is
  --	 * only going to work, if the pmdval_t isn't larger than
  --	 * an unsigned long.
  --	  

   function pmd_move_must_withdraw (new_pmd_ptl : access linux_spinlock_types_h.spinlock_t; old_pmd_ptl : access linux_spinlock_types_h.spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:579
   pragma Import (CPP, pmd_move_must_withdraw, "_ZL22pmd_move_must_withdrawP8spinlockS0_");

  --	 * With split pmd lock we also need to move preallocated
  --	 * PTE page table if new_pmd is on different PMD page table.
  --	  

  -- * This function is meant to be used by sites walking pagetables with
  -- * the mmap_sem hold in read mode to protect against MADV_DONTNEED and
  -- * transhuge page faults. MADV_DONTNEED can convert a transhuge pmd
  -- * into a null pmd and the transhuge page fault can convert a null pmd
  -- * into an hugepmd or into a regular pmd (if the hugepage allocation
  -- * fails). While holding the mmap_sem in read mode the pmd becomes
  -- * stable and stops changing under us only if it's not null and not a
  -- * transhuge pmd. When those races occurs and this function makes a
  -- * difference vs the standard pmd_none_or_clear_bad, the result is
  -- * undefined so behaving like if the pmd was none is safe (because it
  -- * can return none anyway). The compiler level barrier() is critically
  -- * important to compute the two checks atomically on the same pmdval.
  -- *
  -- * For 32bit kernels with a 64bit large pmd_t this automatically takes
  -- * care of reading the pmd atomically to avoid SMP race conditions
  -- * against pmd_populate() when the mmap_sem is hold for reading by the
  -- * caller (a special atomic read not done by "gcc" as in the generic
  -- * version above, is also needed when THP is disabled because the page
  -- * fault can populate the pmd from under us).
  --  

   function pmd_none_or_trans_huge_or_clear_bad (pmd : access asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:611
   pragma Import (CPP, pmd_none_or_trans_huge_or_clear_bad, "_ZL35pmd_none_or_trans_huge_or_clear_badP5pmd_t");

  --	 * The barrier will stabilize the pmdval in a register or on
  --	 * the stack so that it will stop changing under the code.
  --	 *
  --	 * When CONFIG_TRANSPARENT_HUGEPAGE=y on x86 32bit PAE,
  --	 * pmd_read_atomic is allowed to return a not atomic pmdval
  --	 * (for example pointing to an hugepage that has never been
  --	 * mapped in the pmd). The below checks will only care about
  --	 * the low part of the pmd with 32bit PAE x86 anyway, with the
  --	 * exception of pmd_none(). So the important thing is that if
  --	 * the low part of the pmd is found null, the high part will
  --	 * be also null or the pmd_none() check below would be
  --	 * confused.
  --	  

  -- * This is a noop if Transparent Hugepage Support is not built into
  -- * the kernel. Otherwise it is equivalent to
  -- * pmd_none_or_trans_huge_or_clear_bad(), and shall only be called in
  -- * places that already verified the pmd is not none and they want to
  -- * walk ptes while holding the mmap sem in read mode (write mode don't
  -- * need this). If THP is not enabled, the pmd can't go away under the
  -- * code even if MADV_DONTNEED runs, but if THP is enabled we need to
  -- * run a pmd_trans_unstable before walking the ptes after
  -- * split_huge_page_pmd returns (because it may have run when the pmd
  -- * become null, but then a page fault can map in a THP and not a
  -- * regular page).
  --  

   function pmd_trans_unstable (pmd : access asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:653
   pragma Import (CPP, pmd_trans_unstable, "_ZL18pmd_trans_unstableP5pmd_t");

  -- * _PAGE_NUMA works identical to _PAGE_PROTNONE (it's actually the
  -- * same bit too). It's set only when _PAGE_PRESET is not set and it's
  -- * never set if _PAGE_PRESENT is set.
  -- *
  -- * pte/pmd_present() returns true if pte/pmd_numa returns true. Page
  -- * fault triggers on those regions if pte/pmd_numa returns true
  -- * (because _PAGE_PRESENT is not set).
  --  

   function pte_numa (pte : asm_pgtable_64_types_h.pte_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:674
   pragma Import (CPP, pte_numa, "_ZL8pte_numa5pte_t");

   function pmd_numa (pmd : asm_pgtable_types_h.pmd_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:682
   pragma Import (CPP, pmd_numa, "_ZL8pmd_numa5pmd_t");

  -- * pte/pmd_mknuma sets the _PAGE_ACCESSED bitflag automatically
  -- * because they're called by the NUMA hinting minor page fault. If we
  -- * wouldn't set the _PAGE_ACCESSED bitflag here, the TLB miss handler
  -- * would be forced to set it later while filling the TLB after we
  -- * return to userland. That would trigger a second write to memory
  -- * that we optimize away by setting _PAGE_ACCESSED here.
  --  

   function pte_mknonnuma (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:698
   pragma Import (CPP, pte_mknonnuma, "_ZL13pte_mknonnuma5pte_t");

   function pmd_mknonnuma (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:709
   pragma Import (CPP, pmd_mknonnuma, "_ZL13pmd_mknonnuma5pmd_t");

   function pte_mknuma (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:721
   pragma Import (CPP, pte_mknuma, "_ZL10pte_mknuma5pte_t");

   procedure ptep_set_numa
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptep : access asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:733
   pragma Import (CPP, ptep_set_numa, "_ZL13ptep_set_numaP9mm_structmP5pte_t");

   function pmd_mknuma (pmd : asm_pgtable_types_h.pmd_t) return asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:745
   pragma Import (CPP, pmd_mknuma, "_ZL10pmd_mknuma5pmd_t");

   procedure pmdp_set_numa
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      pmdp : access asm_pgtable_types_h.pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pgtable.h:757
   pragma Import (CPP, pmdp_set_numa, "_ZL13pmdp_set_numaP9mm_structmP5pmd_t");

end asm_generic_pgtable_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with linux_sysctl_h;
with linux_types_h;
limited with linux_slab_def_h;
with asm_pgtable_types_h;
with linux_mm_types_h;
with asm_pgtable_64_types_h;
with Interfaces.C.Strings;
limited with linux_nodemask_h;
with Interfaces.C.Extensions;
with linux_mmzone_h;
limited with linux_fs_h;
limited with linux_sched_h;
limited with linux_uio_h;
limited with linux_spinlock_types_h;
limited with uapi_linux_sysinfo_h;
with asm_generic_atomic_long_h;
limited with linux_rbtree_h;
limited with linux_shrinker_h;

package linux_mm_h is

   --  arg-macro: procedure nth_page pfn_to_page(page_to_pfn((page)) + (n))
   --    pfn_to_page(page_to_pfn((page)) + (n))
   --  arg-macro: procedure PAGE_ALIGN ALIGN(addr, PAGE_SIZE)
   --    ALIGN(addr, PAGE_SIZE)
   --  arg-macro: procedure PAGE_ALIGNED IS_ALIGNED((unsigned long)addr, PAGE_SIZE)
   --    IS_ALIGNED((unsigned long)addr, PAGE_SIZE)
   --  unsupported macro: VM_NONE 0x00000000
   --  unsupported macro: VM_READ 0x00000001
   --  unsupported macro: VM_WRITE 0x00000002
   --  unsupported macro: VM_EXEC 0x00000004
   --  unsupported macro: VM_SHARED 0x00000008
   --  unsupported macro: VM_MAYREAD 0x00000010
   --  unsupported macro: VM_MAYWRITE 0x00000020
   --  unsupported macro: VM_MAYEXEC 0x00000040
   --  unsupported macro: VM_MAYSHARE 0x00000080
   --  unsupported macro: VM_GROWSDOWN 0x00000100
   --  unsupported macro: VM_PFNMAP 0x00000400
   --  unsupported macro: VM_DENYWRITE 0x00000800
   --  unsupported macro: VM_LOCKED 0x00002000
   --  unsupported macro: VM_IO 0x00004000
   --  unsupported macro: VM_SEQ_READ 0x00008000
   --  unsupported macro: VM_RAND_READ 0x00010000
   --  unsupported macro: VM_DONTCOPY 0x00020000
   --  unsupported macro: VM_DONTEXPAND 0x00040000
   --  unsupported macro: VM_ACCOUNT 0x00100000
   --  unsupported macro: VM_NORESERVE 0x00200000
   --  unsupported macro: VM_HUGETLB 0x00400000
   --  unsupported macro: VM_NONLINEAR 0x00800000
   --  unsupported macro: VM_ARCH_1 0x01000000
   --  unsupported macro: VM_DONTDUMP 0x04000000
   --  unsupported macro: VM_SOFTDIRTY 0x08000000
   --  unsupported macro: VM_MIXEDMAP 0x10000000
   --  unsupported macro: VM_HUGEPAGE 0x20000000
   --  unsupported macro: VM_NOHUGEPAGE 0x40000000
   --  unsupported macro: VM_MERGEABLE 0x80000000
   --  unsupported macro: VM_PAT VM_ARCH_1
   --  unsupported macro: VM_GROWSUP VM_NONE
   --  unsupported macro: VM_STACK_INCOMPLETE_SETUP (VM_RAND_READ | VM_SEQ_READ)
   --  unsupported macro: VM_STACK_DEFAULT_FLAGS VM_DATA_DEFAULT_FLAGS
   --  unsupported macro: VM_STACK_FLAGS (VM_GROWSDOWN | VM_STACK_DEFAULT_FLAGS | VM_ACCOUNT)
   --  unsupported macro: VM_SPECIAL (VM_IO | VM_DONTEXPAND | VM_PFNMAP | VM_MIXEDMAP)
   --  unsupported macro: VM_INIT_DEF_MASK VM_NOHUGEPAGE
   --  unsupported macro: FAULT_FLAG_WRITE 0x01
   --  unsupported macro: FAULT_FLAG_NONLINEAR 0x02
   --  unsupported macro: FAULT_FLAG_MKWRITE 0x04
   --  unsupported macro: FAULT_FLAG_ALLOW_RETRY 0x08
   --  unsupported macro: FAULT_FLAG_RETRY_NOWAIT 0x10
   --  unsupported macro: FAULT_FLAG_KILLABLE 0x20
   --  unsupported macro: FAULT_FLAG_TRIED 0x40
   --  unsupported macro: FAULT_FLAG_USER 0x80
   --  arg-macro: function page_private ((page).private
   --    return (page).private;
   --  arg-macro: function set_page_private ((page).private := (v)
   --    return (page).private := (v);
   --  unsupported macro: PAGE_BUDDY_MAPCOUNT_VALUE (-128)
   --  unsupported macro: SECTIONS_PGOFF ((sizeof(unsigned long)*8) - SECTIONS_WIDTH)
   --  unsupported macro: NODES_PGOFF (SECTIONS_PGOFF - NODES_WIDTH)
   --  unsupported macro: ZONES_PGOFF (NODES_PGOFF - ZONES_WIDTH)
   --  unsupported macro: LAST_CPUPID_PGOFF (ZONES_PGOFF - LAST_CPUPID_WIDTH)
   --  unsupported macro: SECTIONS_PGSHIFT (SECTIONS_PGOFF * (SECTIONS_WIDTH != 0))
   --  unsupported macro: NODES_PGSHIFT (NODES_PGOFF * (NODES_WIDTH != 0))
   --  unsupported macro: ZONES_PGSHIFT (ZONES_PGOFF * (ZONES_WIDTH != 0))
   --  unsupported macro: LAST_CPUPID_PGSHIFT (LAST_CPUPID_PGOFF * (LAST_CPUPID_WIDTH != 0))
   --  unsupported macro: ZONEID_SHIFT (NODES_SHIFT + ZONES_SHIFT)
   --  unsupported macro: ZONEID_PGOFF ((NODES_PGOFF < ZONES_PGOFF)? NODES_PGOFF : ZONES_PGOFF)
   --  unsupported macro: ZONEID_PGSHIFT (ZONEID_PGOFF * (ZONEID_SHIFT != 0))
   --  unsupported macro: ZONES_MASK ((1UL << ZONES_WIDTH) - 1)
   --  unsupported macro: NODES_MASK ((1UL << NODES_WIDTH) - 1)
   --  unsupported macro: SECTIONS_MASK ((1UL << SECTIONS_WIDTH) - 1)
   --  unsupported macro: LAST_CPUPID_MASK ((1UL << LAST_CPUPID_SHIFT) - 1)
   --  unsupported macro: ZONEID_MASK ((1UL << ZONEID_SHIFT) - 1)
   --  arg-macro: procedure cpupid_match_pid __cpupid_match_pid(task.pid, cpupid)
   --    __cpupid_match_pid(task.pid, cpupid)
   --  arg-macro: procedure page_address lowmem_page_address(page)
   --    lowmem_page_address(page)
   --  arg-macro: procedure set_page_address do { } while(0)
   --    do { } while(0)
   --  arg-macro: procedure page_address_init do { } while(0)
   --    do { } while(0)
   --  unsupported macro: PAGE_MAPPING_ANON 1
   --  unsupported macro: PAGE_MAPPING_KSM 2
   --  unsupported macro: PAGE_MAPPING_FLAGS (PAGE_MAPPING_ANON | PAGE_MAPPING_KSM)
   --  unsupported macro: VM_FAULT_MINOR 0
   --  unsupported macro: VM_FAULT_OOM 0x0001
   --  unsupported macro: VM_FAULT_SIGBUS 0x0002
   --  unsupported macro: VM_FAULT_MAJOR 0x0004
   --  unsupported macro: VM_FAULT_WRITE 0x0008
   --  unsupported macro: VM_FAULT_HWPOISON 0x0010
   --  unsupported macro: VM_FAULT_HWPOISON_LARGE 0x0020
   --  unsupported macro: VM_FAULT_SIGSEGV 0x0040
   --  unsupported macro: VM_FAULT_NOPAGE 0x0100
   --  unsupported macro: VM_FAULT_LOCKED 0x0200
   --  unsupported macro: VM_FAULT_RETRY 0x0400
   --  unsupported macro: VM_FAULT_FALLBACK 0x0800
   --  unsupported macro: VM_FAULT_HWPOISON_LARGE_MASK 0xf000
   --  unsupported macro: VM_FAULT_ERROR (VM_FAULT_OOM | VM_FAULT_SIGBUS | VM_FAULT_SIGSEGV | VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_LARGE | VM_FAULT_FALLBACK)
   --  arg-macro: function VM_FAULT_SET_HINDEX ((x) << 12
   --    return (x) << 12;
   --  arg-macro: function VM_FAULT_GET_HINDEX (((x) >> 12) and 0xf
   --    return ((x) >> 12) and 0xf;
   --  arg-macro: function offset_in_page ((unsigned long)(p) and ~PAGE_MASK
   --    return (unsigned long)(p) and ~PAGE_MASK;
   --  unsupported macro: SHOW_MEM_FILTER_NODES (0x0001u)
   --  arg-macro: procedure vma_file_update_time vma_do_file_update_time(vma, __func__, __LINE__)
   --    vma_do_file_update_time(vma, __func__, __LINE__)
   --  arg-macro: procedure vma_pr_or_file vma_do_pr_or_file(vma, __func__, __LINE__)
   --    vma_do_pr_or_file(vma, __func__, __LINE__)
   --  arg-macro: procedure vma_get_file vma_do_get_file(vma, __func__, __LINE__)
   --    vma_do_get_file(vma, __func__, __LINE__)
   --  arg-macro: procedure vma_fput vma_do_fput(vma, __func__, __LINE__)
   --    vma_do_fput(vma, __func__, __LINE__)
   --  arg-macro: function pte_offset_map_lock ({ spinlock_t *__ptl := pte_lockptr(mm, pmd); pte_t *__pte := pte_offset_map(pmd, address); *(ptlp) := __ptl; spin_lock(__ptl); __pte; }
   --    return { spinlock_t *__ptl := pte_lockptr(mm, pmd); pte_t *__pte := pte_offset_map(pmd, address); *(ptlp) := __ptl; spin_lock(__ptl); __pte; };
   --  arg-macro: procedure pte_unmap_unlock do { spin_unlock(ptl); pte_unmap(pte); } while (0)
   --    do { spin_unlock(ptl); pte_unmap(pte); } while (0)
   --  arg-macro: function pte_alloc_map ((unlikely(pmd_none(*(pmd)))  and then  __pte_alloc(mm, vma, pmd, address))? NULL: pte_offset_map(pmd, address)
   --    return (unlikely(pmd_none(*(pmd)))  and then  __pte_alloc(mm, vma, pmd, address))? NULL: pte_offset_map(pmd, address);
   --  arg-macro: function pte_alloc_map_lock ((unlikely(pmd_none(*(pmd)))  and then  __pte_alloc(mm, NULL, pmd, address))? NULL: pte_offset_map_lock(mm, pmd, address, ptlp)
   --    return (unlikely(pmd_none(*(pmd)))  and then  __pte_alloc(mm, NULL, pmd, address))? NULL: pte_offset_map_lock(mm, pmd, address, ptlp);
   --  arg-macro: function pte_alloc_kernel ((unlikely(pmd_none(*(pmd)))  and then  __pte_alloc_kernel(pmd, address))? NULL: pte_offset_kernel(pmd, address)
   --    return (unlikely(pmd_none(*(pmd)))  and then  __pte_alloc_kernel(pmd, address))? NULL: pte_offset_kernel(pmd, address);
   --  arg-macro: function pmd_huge_pte (pmd_to_page(pmd).pmd_huge_pte
   --    return pmd_to_page(pmd).pmd_huge_pte;
   --  arg-macro: procedure vma_interval_tree_foreach for (vma := vma_interval_tree_iter_first(root, start, last); vma; vma := vma_interval_tree_iter_next(vma, start, last))
   --    for (vma := vma_interval_tree_iter_first(root, start, last); vma; vma := vma_interval_tree_iter_next(vma, start, last))
   --  arg-macro: procedure anon_vma_interval_tree_foreach for (avc := anon_vma_interval_tree_iter_first(root, start, last); avc; avc := anon_vma_interval_tree_iter_next(avc, start, last))
   --    for (avc := anon_vma_interval_tree_iter_first(root, start, last); avc; avc := anon_vma_interval_tree_iter_next(avc, start, last))
   --  unsupported macro: VM_UNMAPPED_AREA_TOPDOWN 1
   --  unsupported macro: VM_MAX_READAHEAD 128
   --  unsupported macro: VM_MIN_READAHEAD 16
   --  arg-macro: function expand_upwards (0
   --    return 0;
   --  unsupported macro: FOLL_WRITE 0x01
   --  unsupported macro: FOLL_TOUCH 0x02
   --  unsupported macro: FOLL_GET 0x04
   --  unsupported macro: FOLL_DUMP 0x08
   --  unsupported macro: FOLL_FORCE 0x10
   --  unsupported macro: FOLL_NOWAIT 0x20
   --  unsupported macro: FOLL_MLOCK 0x40
   --  unsupported macro: FOLL_SPLIT 0x80
   --  unsupported macro: FOLL_HWPOISON 0x100
   --  unsupported macro: FOLL_NUMA 0x200
   --  unsupported macro: FOLL_MIGRATION 0x400
   --  skipped empty struct anon_vma_chain

   --  skipped empty struct writeback_control

   procedure set_max_mapnr (limit : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:37
   pragma Import (CPP, set_max_mapnr, "_ZL13set_max_mapnrm");

   totalram_pages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:40
   pragma Import (C, totalram_pages, "totalram_pages");

   high_memory : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:41
   pragma Import (C, high_memory, "high_memory");

   page_cluster : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:42
   pragma Import (C, page_cluster, "page_cluster");

   sysctl_legacy_va_layout : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:45
   pragma Import (C, sysctl_legacy_va_layout, "sysctl_legacy_va_layout");

   sysctl_user_reserve_kbytes : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:58
   pragma Import (C, sysctl_user_reserve_kbytes, "sysctl_user_reserve_kbytes");

   sysctl_admin_reserve_kbytes : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:59
   pragma Import (C, sysctl_admin_reserve_kbytes, "sysctl_admin_reserve_kbytes");

   sysctl_overcommit_memory : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:61
   pragma Import (C, sysctl_overcommit_memory, "sysctl_overcommit_memory");

   sysctl_overcommit_ratio : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:62
   pragma Import (C, sysctl_overcommit_ratio, "sysctl_overcommit_ratio");

   sysctl_overcommit_kbytes : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:63
   pragma Import (C, sysctl_overcommit_kbytes, "sysctl_overcommit_kbytes");

   function overcommit_ratio_handler
     (arg1 : access linux_sysctl_h.ctl_table;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:65
   pragma Import (CPP, overcommit_ratio_handler, "_Z24overcommit_ratio_handlerP9ctl_tableiPvPmPx");

   function overcommit_kbytes_handler
     (arg1 : access linux_sysctl_h.ctl_table;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:67
   pragma Import (CPP, overcommit_kbytes_handler, "_Z25overcommit_kbytes_handlerP9ctl_tableiPvPmPx");

  -- to align the pointer to the (next) page boundary  
  -- test whether an address (unsigned long or pointer) is aligned to PAGE_SIZE  
  -- * Linux kernel virtual memory manager primitives.
  -- * The idea being to have a "virtual" mm in the same way
  -- * we have a virtual fs - giving a cleaner interface to the
  -- * mm details, and allowing different kinds of memory mappings
  -- * (from shared memory to executable loading to arbitrary
  -- * mmap() functions).
  --  

   vm_area_cachep : access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:87
   pragma Import (C, vm_area_cachep, "vm_area_cachep");

  -- * vm_flags in vm_area_struct, see mm_types.h.
  --  

  -- mprotect() hardcodes VM_MAYREAD >> 4 == VM_READ, and so for r/w/x bits.  
  -- Used by sys_madvise()  
  -- Bits set in the VMA until the stack is in its final location  
  -- * Special vmas that are non-mergable, non-mlock()able.
  -- * Note: mm/huge_memory.c VM_NO_THP depends on this definition.
  --  

  -- This mask defines which mm->def_flags a process can inherit its parent  
  -- * mapping from the currently active vm_flags protection bits (the
  -- * low four bits) to a page protection mask..
  --  

   protection_map : aliased array (0 .. 15) of aliased asm_pgtable_types_h.pgprot_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:187
   pragma Import (C, protection_map, "protection_map");

  -- * vm_fault is filled by the the pagefault handler and passed to the vma's
  -- * ->fault function. The vma's ->fault is responsible for returning a bitmask
  -- * of VM_FAULT_xxx flags that give details about how the fault was handled.
  -- *
  -- * pgoff should be used in favour of virtual_address, if possible. If pgoff
  -- * is used, one may implement ->remap_pages to get nonlinear mapping support.
  --  

  -- FAULT_FLAG_xxx flags  
   type vm_fault is record
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:207
      pgoff : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:208
      virtual_address : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:209
      the_page : access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:211
      max_pgoff : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:217
      pte : access asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:219
   end record;
   pragma Convention (C_Pass_By_Copy, vm_fault);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:206

  -- Logical page offset based on vma  
  -- Faulting virtual address  
  -- ->fault handlers should return a
  --					 * page here, unless VM_FAULT_NOPAGE
  --					 * is set (which is also implied by
  --					 * VM_FAULT_ERROR).
  --					  

  -- for ->map_pages() only  
  -- map pages for offset from pgoff till
  --					 * max_pgoff inclusive  

  -- pte entry associated with ->pgoff  
  -- * These are the virtual MM functions - opening of an area, closing and
  -- * unmapping it (needed to keep files on disk up-to-date etc), pointer
  -- * to the functions called when a no-page or a wp-page exception occurs. 
  --  

   type vm_operations_struct is record
      open : access procedure (arg1 : access linux_mm_types_h.vm_area_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:228
      close : access procedure (arg1 : access linux_mm_types_h.vm_area_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:229
      fault : access function (arg1 : access linux_mm_types_h.vm_area_struct; arg2 : access vm_fault) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:230
      map_pages : access procedure (arg1 : access linux_mm_types_h.vm_area_struct; arg2 : access vm_fault);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:231
      page_mkwrite : access function (arg1 : access linux_mm_types_h.vm_area_struct; arg2 : access vm_fault) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:235
      c_access : access function
           (arg1 : access linux_mm_types_h.vm_area_struct;
            arg2 : unsigned_long;
            arg3 : System.Address;
            arg4 : int;
            arg5 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:241
      name : access function (arg1 : access linux_mm_types_h.vm_area_struct) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:246
      set_policy : access function (arg1 : access linux_mm_types_h.vm_area_struct; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:256
      get_policy : access function (arg1 : access linux_mm_types_h.vm_area_struct; arg2 : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:269
      migrate : access function
           (arg1 : access linux_mm_types_h.vm_area_struct;
            arg2 : access constant linux_nodemask_h.nodemask_t;
            arg3 : access constant linux_nodemask_h.nodemask_t;
            arg4 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:271
      remap_pages : access function
           (arg1 : access linux_mm_types_h.vm_area_struct;
            arg2 : unsigned_long;
            arg3 : unsigned_long;
            arg4 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:275
   end record;
   pragma Convention (C_Pass_By_Copy, vm_operations_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:227

  -- notification that a previously read-only page is about to become
  --	 * writable, if an error is returned it will cause a SIGBUS  

  -- called by access_process_vm when get_user_pages() fails, typically
  --	 * for use by special VMAs that can switch between memory and hardware
  --	  

  -- Called by the /proc/PID/maps code to ask the vma whether it
  --	 * has a special name.  Returning non-NULL will also cause this
  --	 * vma to be dumped unconditionally.  

  --	 * set_policy() op must add a reference to any non-NULL @new mempolicy
  --	 * to hold the policy upon return.  Caller should pass NULL @new to
  --	 * remove a policy and fall back to surrounding context--i.e. do not
  --	 * install a MPOL_DEFAULT policy, nor the task or system default
  --	 * mempolicy.
  --	  

  --	 * get_policy() op must add reference [mpol_get()] to any policy at
  --	 * (vma,addr) marked as MPOL_SHARED.  The shared policy infrastructure
  --	 * in mm/mempolicy.c will do this automatically.
  --	 * get_policy() must NOT add a ref if the policy at (vma,addr) is not
  --	 * marked as MPOL_SHARED. vma policies are protected by the mmap_sem.
  --	 * If no [shared/vma] mempolicy exists at the addr, get_policy() op
  --	 * must return NULL--i.e., do not "fallback" to task or system default
  --	 * policy.
  --	  

  -- called by sys_remap_file_pages() to populate non-linear mapping  
   --  skipped empty struct mmu_gather

  -- It's valid only if the page is free path or free_list  
   procedure set_freepage_migratetype (the_page : access linux_mm_types_h.page; migratetype : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:285
   pragma Import (CPP, set_freepage_migratetype, "_ZL24set_freepage_migratetypeP4pagei");

  -- It's valid only if the page is free path or free_list  
   function get_freepage_migratetype (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:291
   pragma Import (CPP, get_freepage_migratetype, "_ZL24get_freepage_migratetypeP4page");

  -- * FIXME: take this include out, include page-flags.h in
  -- * files which need it (119 of them)
  --  

  -- * Methods to modify the page usage count.
  -- *
  -- * What counts for a page usage:
  -- * - cache mapping   (page->mapping)
  -- * - private data    (page->private)
  -- * - page mapped in a task's page tables, each mapping
  -- *   is counted separately
  -- *
  -- * Also, many kernel routines increase the page count before a critical
  -- * routine so they can be sure the page doesn't go away from under them.
  --  

  -- * Drop a ref, return true if the refcount fell to zero (the page has no users)
  --  

   function put_page_testzero (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:319
   pragma Import (CPP, put_page_testzero, "_ZL17put_page_testzeroP4page");

  -- * Try to grab a ref unless the page has a refcount of zero, return false if
  -- * that is the case.
  -- * This can be called when MMU is off so it must not access
  -- * any of the virtual mappings.
  --  

   function get_page_unless_zero (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:331
   pragma Import (CPP, get_page_unless_zero, "_ZL20get_page_unless_zeroP4page");

  -- * Try to drop a ref unless the page has a refcount of one, return false if
  -- * that is the case.
  -- * This is to make sure that the refcount won't become zero after this drop.
  -- * This can be called when MMU is off so it must not access
  -- * any of the virtual mappings.
  --  

   function put_page_unless_one (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:343
   pragma Import (CPP, put_page_unless_one, "_ZL19put_page_unless_oneP4page");

   function page_is_ram (pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:348
   pragma Import (CPP, page_is_ram, "_Z11page_is_ramm");

  -- Support for virtually mapped pages  
   function vmalloc_to_page (addr : System.Address) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:351
   pragma Import (CPP, vmalloc_to_page, "_Z15vmalloc_to_pagePKv");

   function vmalloc_to_pfn (addr : System.Address) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:352
   pragma Import (CPP, vmalloc_to_pfn, "_Z14vmalloc_to_pfnPKv");

  -- * Determine if an address is within the vmalloc range
  -- *
  -- * On nommu, vmalloc/vfree wrap through kmalloc/kfree directly, so there
  -- * is no special casing required.
  --  

   function is_vmalloc_addr (x : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:360
   pragma Import (CPP, is_vmalloc_addr, "_ZL15is_vmalloc_addrPKv");

   function is_vmalloc_or_module_addr (x : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:371
   pragma Import (CPP, is_vmalloc_or_module_addr, "_Z25is_vmalloc_or_module_addrPKv");

   procedure kvfree (addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:379
   pragma Import (CPP, kvfree, "_Z6kvfreePKv");

   procedure compound_lock (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:381
   pragma Import (CPP, compound_lock, "_ZL13compound_lockP4page");

   procedure compound_unlock (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:389
   pragma Import (CPP, compound_unlock, "_ZL15compound_unlockP4page");

   function compound_lock_irqsave (the_page : access linux_mm_types_h.page) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:397
   pragma Import (CPP, compound_lock_irqsave, "_ZL21compound_lock_irqsaveP4page");

   procedure compound_unlock_irqrestore (the_page : access linux_mm_types_h.page; flags : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:407
   pragma Import (CPP, compound_unlock_irqrestore, "_ZL26compound_unlock_irqrestoreP4pagem");

   function compound_head_by_tail (tail : access linux_mm_types_h.page) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:416
   pragma Import (CPP, compound_head_by_tail, "_ZL21compound_head_by_tailP4page");

  --	 * page->first_page may be a dangling pointer to an old
  --	 * compound page, so recheck that it is still a tail
  --	 * page before returning.
  --	  

   function compound_head (the_page : access linux_mm_types_h.page) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:431
   pragma Import (CPP, compound_head, "_ZL13compound_headP4page");

  -- * The atomic page->_mapcount, starts from -1: so that transitions
  -- * both from it and to it can be tracked, using atomic_inc_and_test
  -- * and atomic_add_negative(-1).
  --  

   procedure page_mapcount_reset (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:443
   pragma Import (CPP, page_mapcount_reset, "_ZL19page_mapcount_resetP4page");

   function page_mapcount (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:448
   pragma Import (CPP, page_mapcount, "_ZL13page_mapcountP4page");

   function page_count (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:453
   pragma Import (CPP, page_count, "_ZL10page_countP4page");

   function PageHeadHuge (page_head : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:459
   pragma Import (CPP, PageHeadHuge, "_Z12PageHeadHugeP4page");

   --  skipped func __compound_tail_refcounted

  -- * This takes a head page as parameter and tells if the
  -- * tail page reference counting can be skipped.
  -- *
  -- * For this to be safe, PageSlab and PageHeadHuge must remain true on
  -- * any given page where they return true here, until all tail pins
  -- * have been released.
  --  

   function compound_tail_refcounted (the_page : access linux_mm_types_h.page) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:480
   pragma Import (CPP, compound_tail_refcounted, "_ZL24compound_tail_refcountedP4page");

   procedure get_huge_page_tail (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:486
   pragma Import (CPP, get_huge_page_tail, "_ZL18get_huge_page_tailP4page");

  --	 * __split_huge_page_refcount() cannot run from under us.
  --	  

   --  skipped func __get_page_tail

   procedure get_page (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:500
   pragma Import (CPP, get_page, "_ZL8get_pageP4page");

  --	 * Getting a normal page or the head of a compound page
  --	 * requires to already have an elevated page->_count.
  --	  

   function virt_to_head_page (x : System.Address) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:513
   pragma Import (CPP, virt_to_head_page, "_ZL17virt_to_head_pagePKv");

  -- * Setup the page count before being freed into the page allocator for
  -- * the first time (boot or memory hotplug)
  --  

   procedure init_page_count (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:523
   pragma Import (CPP, init_page_count, "_ZL15init_page_countP4page");

  -- * PageBuddy() indicate that the page is free and in the buddy system
  -- * (see mm/page_alloc.c).
  -- *
  -- * PAGE_BUDDY_MAPCOUNT_VALUE must be <= -2 but better not too close to
  -- * -2 so that an underflow of the page_mapcount() won't be mistaken
  -- * for a genuine PAGE_BUDDY_MAPCOUNT_VALUE. -128 can be created very
  -- * efficiently by most CPU architectures.
  --  

   function PageBuddy (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:539
   pragma Import (CPP, PageBuddy, "_ZL9PageBuddyP4page");

   --  skipped func __SetPageBuddy

   --  skipped func __ClearPageBuddy

   procedure put_page (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:556
   pragma Import (CPP, put_page, "_Z8put_pageP4page");

   procedure put_pages_list (pages : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:557
   pragma Import (CPP, put_pages_list, "_Z14put_pages_listP9list_head");

   procedure split_page (the_page : access linux_mm_types_h.page; order : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:559
   pragma Import (CPP, split_page, "_Z10split_pageP4pagej");

   function split_free_page (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:560
   pragma Import (CPP, split_free_page, "_Z15split_free_pageP4page");

  -- * Compound pages have a destructor function.  Provide a
  -- * prototype for that function and accessor functions.
  -- * These are _only_ valid on the head of a PG_compound page.
  --  

   --  skipped function type compound_page_dtor

   procedure set_compound_page_dtor (the_page : access linux_mm_types_h.page; dtor : access procedure (arg1 : access linux_mm_types_h.page));  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:569
   pragma Import (CPP, set_compound_page_dtor, "_ZL22set_compound_page_dtorP4pagePFvS0_E");

   function get_compound_page_dtor (the_page : access linux_mm_types_h.page) return access procedure (arg1 : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:575
   pragma Import (CPP, get_compound_page_dtor, "_ZL22get_compound_page_dtorP4page");

   function compound_order (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:580
   pragma Import (CPP, compound_order, "_ZL14compound_orderP4page");

   procedure set_compound_order (the_page : access linux_mm_types_h.page; order : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:587
   pragma Import (CPP, set_compound_order, "_ZL18set_compound_orderP4pagem");

  -- * Do pte_mkwrite, but only if the vma says VM_WRITE.  We do this when
  -- * servicing faults for write access.  In the normal case, do always want
  -- * pte_mkwrite.  But get_user_pages can cause write faults for mappings
  -- * that do not have writing enabled, when used by access_process_vm.
  --  

   function maybe_mkwrite (pte : asm_pgtable_64_types_h.pte_t; vma : access linux_mm_types_h.vm_area_struct) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:599
   pragma Import (CPP, maybe_mkwrite, "_ZL13maybe_mkwrite5pte_tP14vm_area_struct");

   procedure do_set_pte
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      the_page : access linux_mm_types_h.page;
      pte : access asm_pgtable_64_types_h.pte_t;
      write : Extensions.bool;
      anon : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:606
   pragma Import (CPP, do_set_pte, "_Z10do_set_pteP14vm_area_structmP4pageP5pte_tbb");

  -- * Multiple processes may "see" the same page. E.g. for untouched
  -- * mappings of /dev/null, all processes see the same page full of
  -- * zeroes, and text pages of executables and shared libraries have
  -- * only one copy in memory, at most, normally.
  -- *
  -- * For the non-reserved pages, page_count(page) denotes a reference count.
  -- *   page_count() == 0 means the page is free. page->lru is then used for
  -- *   freelist management in the buddy allocator.
  -- *   page_count() > 0  means the page has been allocated.
  -- *
  -- * Pages are allocated by the slab allocator in order to provide memory
  -- * to kmalloc and kmem_cache_alloc. In this case, the management of the
  -- * page, and the fields in 'struct page' are the responsibility of mm/slab.c
  -- * unless a particular usage is carefully commented. (the responsibility of
  -- * freeing the kmalloc memory is the caller's, of course).
  -- *
  -- * A page may be used by anyone else who does a __get_free_page().
  -- * In this case, page_count still tracks the references, and should only
  -- * be used through the normal accessor functions. The top bits of page->flags
  -- * and page->virtual store page management information, but all other fields
  -- * are unused and could be used privately, carefully. The management of this
  -- * page is the responsibility of the one who allocated it, and those who have
  -- * subsequently been given references to it.
  -- *
  -- * The other pages (we may call them "pagecache pages") are completely
  -- * managed by the Linux memory manager: I/O, buffers, swapping etc.
  -- * The following discussion applies only to them.
  -- *
  -- * A pagecache page contains an opaque `private' member, which belongs to the
  -- * page's address_space. Usually, this is the address of a circular list of
  -- * the page's disk buffers. PG_private must be set to tell the VM to call
  -- * into the filesystem to release these pages.
  -- *
  -- * A page may belong to an inode's memory mapping. In this case, page->mapping
  -- * is the pointer to the inode, and page->index is the file offset of the page,
  -- * in units of PAGE_CACHE_SIZE.
  -- *
  -- * If pagecache pages are not associated with an inode, they are said to be
  -- * anonymous pages. These may become associated with the swapcache, and in that
  -- * case PG_swapcache is set, and page->private is an offset into the swapcache.
  -- *
  -- * In either case (swapcache or inode backed), the pagecache itself holds one
  -- * reference to the page. Setting PG_private should also increment the
  -- * refcount. The each user mapping also has a reference to the page.
  -- *
  -- * The pagecache pages are stored in a per-mapping radix tree, which is
  -- * rooted at mapping->page_tree, and indexed by offset.
  -- * Where 2.4 and early 2.6 kernels kept dirty/clean pages in per-address_space
  -- * lists, we instead now tag pages as dirty/writeback in the radix tree.
  -- *
  -- * All pagecache pages may be subject to I/O:
  -- * - inode pages may need to be read from disk,
  -- * - inode pages which have been modified and are MAP_SHARED may need
  -- *   to be written back to the inode on disk,
  -- * - anonymous pages (including MAP_PRIVATE file mappings) which have been
  -- *   modified may need to be swapped out to swap space and (later) to be read
  -- *   back into memory.
  --  

  -- * The zone field is never updated after free_area_init_core()
  -- * sets it, so none of the operations on it need to be atomic.
  --  

  -- Page flags: | [SECTION] | [NODE] | ZONE | [LAST_CPUPID] | ... | FLAGS |  
  -- * Define the bit shifts to access each section.  For non-existent
  -- * sections we define the shift as 0; that plus a 0 mask ensures
  -- * the compiler will optimise away reference to them.
  --  

  -- NODE:ZONE or SECTION:ZONE is used to ID a zone for the buddy allocator  
   function page_zonenum (the_page : access constant linux_mm_types_h.page) return linux_mmzone_h.zone_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:714
   pragma Import (CPP, page_zonenum, "_ZL12page_zonenumPK4page");

  -- * The identification function is mainly used by the buddy allocator for
  -- * determining if two pages could be buddies. We are not really identifying
  -- * the zone since we could be using the section number id if we do not have
  -- * node id available in page flags.
  -- * We only guarantee that it will return the same value for two combinable
  -- * pages in a zone.
  --  

   function page_zone_id (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:731
   pragma Import (CPP, page_zone_id, "_ZL12page_zone_idP4page");

   function zone_to_nid (the_zone : access linux_mmzone_h.zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:736
   pragma Import (CPP, zone_to_nid, "_ZL11zone_to_nidP4zone");

   function page_to_nid (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:748
   pragma Import (CPP, page_to_nid, "_ZL11page_to_nidPK4page");

   function cpu_pid_to_cpupid (cpu : int; pid : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:755
   pragma Import (CPP, cpu_pid_to_cpupid, "_ZL17cpu_pid_to_cpupidii");

   function cpupid_to_pid (cpupid : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:760
   pragma Import (CPP, cpupid_to_pid, "_ZL13cpupid_to_pidi");

   function cpupid_to_cpu (cpupid : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:765
   pragma Import (CPP, cpupid_to_cpu, "_ZL13cpupid_to_cpui");

   function cpupid_to_nid (cpupid : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:770
   pragma Import (CPP, cpupid_to_nid, "_ZL13cpupid_to_nidi");

   function cpupid_pid_unset (cpupid : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:775
   pragma Import (CPP, cpupid_pid_unset, "_ZL16cpupid_pid_unseti");

   function cpupid_cpu_unset (cpupid : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:780
   pragma Import (CPP, cpupid_cpu_unset, "_ZL16cpupid_cpu_unseti");

   --  skipped func __cpupid_match_pid

   function page_cpupid_last (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:806
   pragma Import (CPP, page_cpupid_last, "_ZL16page_cpupid_lastP4page");

   function page_cpupid_xchg_last (the_page : access linux_mm_types_h.page; cpupid : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:811
   pragma Import (CPP, page_cpupid_xchg_last, "_Z21page_cpupid_xchg_lastP4pagei");

   procedure page_cpupid_reset_last (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:813
   pragma Import (CPP, page_cpupid_reset_last, "_ZL22page_cpupid_reset_lastP4page");

  -- XXX  
  -- XXX  
   function page_zone (the_page : access constant linux_mm_types_h.page) return access linux_mmzone_h.zone;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:867
   pragma Import (CPP, page_zone, "_ZL9page_zonePK4page");

   procedure set_page_zone (the_page : access linux_mm_types_h.page; zone : linux_mmzone_h.zone_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:885
   pragma Import (CPP, set_page_zone, "_ZL13set_page_zoneP4page9zone_type");

   procedure set_page_node (the_page : access linux_mm_types_h.page; node : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:891
   pragma Import (CPP, set_page_node, "_ZL13set_page_nodeP4pagem");

   procedure set_page_links
     (the_page : access linux_mm_types_h.page;
      zone : linux_mmzone_h.zone_type;
      node : unsigned_long;
      pfn : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:897
   pragma Import (CPP, set_page_links, "_ZL14set_page_linksP4page9zone_typemm");

  -- * Some inline functions in vmstat.h depend on page_zone()
  --  

   function lowmem_page_address (the_page : access constant linux_mm_types_h.page) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:912
   pragma Import (CPP, lowmem_page_address, "_ZL19lowmem_page_addressPK4page");

  -- * On an anonymous page mapped into a user virtual memory area,
  -- * page->mapping points to its anon_vma, not to a struct address_space;
  -- * with the PAGE_MAPPING_ANON bit set to distinguish it.  See rmap.h.
  -- *
  -- * On an anonymous page in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
  -- * the PAGE_MAPPING_KSM bit may be set along with the PAGE_MAPPING_ANON bit;
  -- * and then page->mapping points, not to an anon_vma, but to a private
  -- * structure which KSM associates with that merged page.  See ksm.h.
  -- *
  -- * PAGE_MAPPING_KSM without PAGE_MAPPING_ANON is currently never used.
  -- *
  -- * Please note that, confusingly, "page_mapping" refers to the inode
  -- * address_space which maps the page from disk; whereas "page_mapped"
  -- * refers to user virtual address space into which the page is mapped.
  --  

   function page_mapping (the_page : access linux_mm_types_h.page) return access linux_fs_h.address_space;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:965
   pragma Import (CPP, page_mapping, "_Z12page_mappingP4page");

  -- Neutral page->mapping pointer to address_space or anon_vma or other  
   function page_rmapping (the_page : access linux_mm_types_h.page) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:968
   pragma Import (CPP, page_rmapping, "_ZL13page_rmappingP4page");

   --  skipped func __page_file_mapping

   function page_file_mapping (the_page : access linux_mm_types_h.page) return access linux_fs_h.address_space;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:976
   pragma Import (CPP, page_file_mapping, "_ZL17page_file_mappingP4page");

   function PageAnon (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:984
   pragma Import (CPP, PageAnon, "_ZL8PageAnonP4page");

  -- * Return the pagecache index of the passed page.  Regular pagecache pages
  -- * use ->index whereas swapcache pages use ->private
  --  

   function page_index (the_page : access linux_mm_types_h.page) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:993
   pragma Import (CPP, page_index, "_ZL10page_indexP4page");

   --  skipped func __page_file_index

  -- * Return the file index of the page. Regular pagecache pages use ->index
  -- * whereas swapcache pages use swp_offset(->private)
  --  

   function page_file_index (the_page : access linux_mm_types_h.page) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1006
   pragma Import (CPP, page_file_index, "_ZL15page_file_indexP4page");

  -- * Return true if this page is mapped into pagetables.
  --  

   function page_mapped (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1017
   pragma Import (CPP, page_mapped, "_ZL11page_mappedP4page");

  -- * Different kinds of faults, as returned by handle_mm_fault().
  -- * Used to decide whether a process gets delivered SIGBUS or
  -- * just gets major/minor fault counters bumped up.
  --  

  -- Encode hstate index for a hwpoisoned large page  
  -- * Can be called by the pagefault handler when it gets a VM_FAULT_OOM.
  --  

   procedure pagefault_out_of_memory;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1056
   pragma Import (CPP, pagefault_out_of_memory, "_Z23pagefault_out_of_memoryv");

  -- * Flags passed to show_mem() and show_free_areas() to suppress output in
  -- * various contexts.
  --  

   procedure show_free_areas (flags : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1066
   pragma Import (CPP, show_free_areas, "_Z15show_free_areasj");

   function skip_free_areas_node (flags : unsigned; nid : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1067
   pragma Import (CPP, skip_free_areas_node, "_Z20skip_free_areas_nodeji");

   function shmem_zero_setup (arg1 : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1069
   pragma Import (CPP, shmem_zero_setup, "_Z16shmem_zero_setupP14vm_area_struct");

   function shmem_mapping (mapping : access linux_fs_h.address_space) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1071
   pragma Import (CPP, shmem_mapping, "_Z13shmem_mappingP13address_space");

   function can_do_mlock return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1079
   pragma Import (CPP, can_do_mlock, "_Z12can_do_mlockv");

   function user_shm_lock (arg1 : linux_types_h.size_t; arg2 : access linux_sched_h.user_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1080
   pragma Import (CPP, user_shm_lock, "_Z13user_shm_lockmP11user_struct");

   procedure user_shm_unlock (arg1 : linux_types_h.size_t; arg2 : access linux_sched_h.user_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1081
   pragma Import (CPP, user_shm_unlock, "_Z15user_shm_unlockmP11user_struct");

  -- * Parameter block passed down to zap_pte_range in exceptional cases.
  --  

  -- Check page->index if set  
   type zap_details is record
      nonlinear_vma : access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1087
      check_mapping : access linux_fs_h.address_space;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1088
      first_index : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1089
      last_index : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1090
   end record;
   pragma Convention (C_Pass_By_Copy, zap_details);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1086

  -- Check page->mapping if set  
  -- Lowest page->index to unmap  
  -- Highest page->index to unmap  
   function vm_normal_page
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      pte : asm_pgtable_64_types_h.pte_t) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1093
   pragma Import (CPP, vm_normal_page, "_Z14vm_normal_pageP14vm_area_structm5pte_t");

   function zap_vma_ptes
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      size : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1096
   pragma Import (CPP, zap_vma_ptes, "_Z12zap_vma_ptesP14vm_area_structmm");

   procedure zap_page_range
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      size : unsigned_long;
      arg4 : access zap_details);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1098
   pragma Import (CPP, zap_page_range, "_Z14zap_page_rangeP14vm_area_structmmP11zap_details");

   procedure unmap_vmas
     (tlb : System.Address;
      start_vma : access linux_mm_types_h.vm_area_struct;
      start : unsigned_long;
      c_end : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1100
   pragma Import (CPP, unmap_vmas, "_Z10unmap_vmasP10mmu_gatherP14vm_area_structmm");

  --*
  -- * mm_walk - callbacks for walk_page_range
  -- * @pgd_entry: if set, called for each non-empty PGD (top-level) entry
  -- * @pud_entry: if set, called for each non-empty PUD (2nd-level) entry
  -- * @pmd_entry: if set, called for each non-empty PMD (3rd-level) entry
  -- *	       this handler is required to be able to handle
  -- *	       pmd_trans_huge() pmds.  They may simply choose to
  -- *	       split_huge_page() instead of handling it explicitly.
  -- * @pte_entry: if set, called for each non-empty PTE (4th-level) entry
  -- * @pte_hole: if set, called for each hole at all levels
  -- * @hugetlb_entry: if set, called for each hugetlb entry
  -- *		   *Caution*: The caller must hold mmap_sem() if @hugetlb_entry
  -- * 			      is used.
  -- *
  -- * (see walk_page_range for more details)
  --  

   type mm_walk is record
      pgd_entry : access function
           (arg1 : access asm_pgtable_types_h.pgd_t;
            arg2 : unsigned_long;
            arg3 : unsigned_long;
            arg4 : access mm_walk) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1121
      pud_entry : access function
           (arg1 : access asm_pgtable_types_h.pud_t;
            arg2 : unsigned_long;
            arg3 : unsigned_long;
            arg4 : access mm_walk) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1123
      pmd_entry : access function
           (arg1 : access asm_pgtable_types_h.pmd_t;
            arg2 : unsigned_long;
            arg3 : unsigned_long;
            arg4 : access mm_walk) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1125
      pte_entry : access function
           (arg1 : access asm_pgtable_64_types_h.pte_t;
            arg2 : unsigned_long;
            arg3 : unsigned_long;
            arg4 : access mm_walk) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1127
      pte_hole : access function
           (arg1 : unsigned_long;
            arg2 : unsigned_long;
            arg3 : access mm_walk) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1129
      hugetlb_entry : access function
           (arg1 : access asm_pgtable_64_types_h.pte_t;
            arg2 : unsigned_long;
            arg3 : unsigned_long;
            arg4 : unsigned_long;
            arg5 : access mm_walk) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1132
      mm : access linux_mm_types_h.mm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1133
   end record;
   pragma Convention (C_Pass_By_Copy, mm_walk);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1119

   function walk_page_range
     (addr : unsigned_long;
      c_end : unsigned_long;
      walk : access mm_walk) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1137
   pragma Import (CPP, walk_page_range, "_Z15walk_page_rangemmP7mm_walk");

   procedure free_pgd_range
     (tlb : System.Address;
      addr : unsigned_long;
      c_end : unsigned_long;
      floor : unsigned_long;
      ceiling : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1139
   pragma Import (CPP, free_pgd_range, "_Z14free_pgd_rangeP10mmu_gathermmmm");

   function copy_page_range
     (dst : access linux_mm_types_h.mm_struct;
      src : access linux_mm_types_h.mm_struct;
      vma : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1141
   pragma Import (CPP, copy_page_range, "_Z15copy_page_rangeP9mm_structS0_P14vm_area_struct");

   procedure unmap_mapping_range
     (mapping : access linux_fs_h.address_space;
      holebegin : linux_types_h.loff_t;
      holelen : linux_types_h.loff_t;
      even_cows : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1143
   pragma Import (CPP, unmap_mapping_range, "_Z19unmap_mapping_rangeP13address_spacexxi");

   function follow_pfn
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      pfn : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1145
   pragma Import (CPP, follow_pfn, "_Z10follow_pfnP14vm_area_structmPm");

   function follow_phys
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      flags : unsigned;
      prot : access unsigned_long;
      phys : access linux_types_h.resource_size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1147
   pragma Import (CPP, follow_phys, "_Z11follow_physP14vm_area_structmjPmPy");

   function generic_access_phys
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      buf : System.Address;
      len : int;
      write : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1149
   pragma Import (CPP, generic_access_phys, "_Z19generic_access_physP14vm_area_structmPvii");

   procedure unmap_shared_mapping_range
     (mapping : access linux_fs_h.address_space;
      holebegin : linux_types_h.loff_t;
      holelen : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1152
   pragma Import (CPP, unmap_shared_mapping_range, "_ZL26unmap_shared_mapping_rangeP13address_spacexx");

   procedure truncate_pagecache (the_inode : access linux_fs_h.inode; arg2 : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1158
   pragma Import (CPP, truncate_pagecache, "_Z18truncate_pagecacheP5inodex");

   procedure truncate_setsize (the_inode : access linux_fs_h.inode; newsize : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1159
   pragma Import (CPP, truncate_setsize, "_Z16truncate_setsizeP5inodex");

   procedure pagecache_isize_extended
     (the_inode : access linux_fs_h.inode;
      from : linux_types_h.loff_t;
      to : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1160
   pragma Import (CPP, pagecache_isize_extended, "_Z24pagecache_isize_extendedP5inodexx");

   procedure truncate_pagecache_range
     (the_inode : access linux_fs_h.inode;
      offset : linux_types_h.loff_t;
      c_end : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1161
   pragma Import (CPP, truncate_pagecache_range, "_Z24truncate_pagecache_rangeP5inodexx");

   function truncate_inode_page (mapping : access linux_fs_h.address_space; the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1162
   pragma Import (CPP, truncate_inode_page, "_Z19truncate_inode_pageP13address_spaceP4page");

   function generic_error_remove_page (mapping : access linux_fs_h.address_space; the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1163
   pragma Import (CPP, generic_error_remove_page, "_Z25generic_error_remove_pageP13address_spaceP4page");

   function invalidate_inode_page (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1164
   pragma Import (CPP, invalidate_inode_page, "_Z21invalidate_inode_pageP4page");

   function handle_mm_fault
     (mm : access linux_mm_types_h.mm_struct;
      vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      flags : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1167
   pragma Import (CPP, handle_mm_fault, "_Z15handle_mm_faultP9mm_structP14vm_area_structmj");

   function fixup_user_fault
     (tsk : access linux_sched_h.task_struct;
      mm : access linux_mm_types_h.mm_struct;
      address : unsigned_long;
      fault_flags : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1169
   pragma Import (CPP, fixup_user_fault, "_Z16fixup_user_faultP11task_structP9mm_structmj");

  -- should never happen if there's no MMU  
  -- should never happen if there's no MMU  
   procedure vma_do_file_update_time
     (arg1 : access linux_mm_types_h.vm_area_struct;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1191
   pragma Import (CPP, vma_do_file_update_time, "_Z23vma_do_file_update_timeP14vm_area_structPKci");

   function vma_do_pr_or_file
     (arg1 : access linux_mm_types_h.vm_area_struct;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return access linux_fs_h.file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1192
   pragma Import (CPP, vma_do_pr_or_file, "_Z17vma_do_pr_or_fileP14vm_area_structPKci");

   procedure vma_do_get_file
     (arg1 : access linux_mm_types_h.vm_area_struct;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1194
   pragma Import (CPP, vma_do_get_file, "_Z15vma_do_get_fileP14vm_area_structPKci");

   procedure vma_do_fput
     (arg1 : access linux_mm_types_h.vm_area_struct;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1195
   pragma Import (CPP, vma_do_fput, "_Z11vma_do_fputP14vm_area_structPKci");

   function access_process_vm
     (tsk : access linux_sched_h.task_struct;
      addr : unsigned_long;
      buf : System.Address;
      len : int;
      write : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1212
   pragma Import (CPP, access_process_vm, "_Z17access_process_vmP11task_structmPvii");

   function access_remote_vm
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      buf : System.Address;
      len : int;
      write : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1213
   pragma Import (CPP, access_remote_vm, "_Z16access_remote_vmP9mm_structmPvii");

   --  skipped func __get_user_pages

   function get_user_pages
     (tsk : access linux_sched_h.task_struct;
      mm : access linux_mm_types_h.mm_struct;
      start : unsigned_long;
      nr_pages : unsigned_long;
      write : int;
      force : int;
      pages : System.Address;
      vmas : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1220
   pragma Import (CPP, get_user_pages, "_Z14get_user_pagesP11task_structP9mm_structmmiiPP4pagePP14vm_area_struct");

   function get_user_pages_fast
     (start : unsigned_long;
      nr_pages : int;
      write : int;
      pages : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1224
   pragma Import (CPP, get_user_pages_fast, "_Z19get_user_pages_fastmiiPP4page");

   function get_kernel_pages
     (iov : access constant linux_uio_h.kvec;
      nr_pages : int;
      write : int;
      pages : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1227
   pragma Import (CPP, get_kernel_pages, "_Z16get_kernel_pagesPK4kveciiPP4page");

   function get_kernel_page
     (start : unsigned_long;
      write : int;
      pages : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1229
   pragma Import (CPP, get_kernel_page, "_Z15get_kernel_pagemiPP4page");

   function get_dump_page (addr : unsigned_long) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1230
   pragma Import (CPP, get_dump_page, "_Z13get_dump_pagem");

   function try_to_release_page (the_page : access linux_mm_types_h.page; gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1232
   pragma Import (CPP, try_to_release_page, "_Z19try_to_release_pageP4pagej");

   procedure do_invalidatepage
     (the_page : access linux_mm_types_h.page;
      offset : unsigned;
      length : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1233
   pragma Import (CPP, do_invalidatepage, "_Z17do_invalidatepageP4pagejj");

   --  skipped func __set_page_dirty_nobuffers

   --  skipped func __set_page_dirty_no_writeback

   function redirty_page_for_writepage (wbc : System.Address; the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1238
   pragma Import (CPP, redirty_page_for_writepage, "_Z26redirty_page_for_writepageP17writeback_controlP4page");

   procedure account_page_dirtied (the_page : access linux_mm_types_h.page; mapping : access linux_fs_h.address_space);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1240
   pragma Import (CPP, account_page_dirtied, "_Z20account_page_dirtiedP4pageP13address_space");

   procedure account_page_writeback (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1241
   pragma Import (CPP, account_page_writeback, "_Z22account_page_writebackP4page");

   function set_page_dirty (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1242
   pragma Import (CPP, set_page_dirty, "_Z14set_page_dirtyP4page");

   function set_page_dirty_lock (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1243
   pragma Import (CPP, set_page_dirty_lock, "_Z19set_page_dirty_lockP4page");

   function clear_page_dirty_for_io (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1244
   pragma Import (CPP, clear_page_dirty_for_io, "_Z23clear_page_dirty_for_ioP4page");

   function get_cmdline
     (c_task : access linux_sched_h.task_struct;
      buffer : Interfaces.C.Strings.chars_ptr;
      buflen : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1245
   pragma Import (CPP, get_cmdline, "_Z11get_cmdlineP11task_structPci");

  -- Is the vma a continuation of the stack vma above it?  
   function vma_growsdown (vma : access linux_mm_types_h.vm_area_struct; addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1248
   pragma Import (CPP, vma_growsdown, "_ZL13vma_growsdownP14vm_area_structm");

   function stack_guard_page_start (vma : access linux_mm_types_h.vm_area_struct; addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1253
   pragma Import (CPP, stack_guard_page_start, "_ZL22stack_guard_page_startP14vm_area_structm");

  -- Is the vma a continuation of the stack vma below it?  
   function vma_growsup (vma : access linux_mm_types_h.vm_area_struct; addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1262
   pragma Import (CPP, vma_growsup, "_ZL11vma_growsupP14vm_area_structm");

   function stack_guard_page_end (vma : access linux_mm_types_h.vm_area_struct; addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1267
   pragma Import (CPP, stack_guard_page_end, "_ZL20stack_guard_page_endP14vm_area_structm");

   function vm_is_stack
     (c_task : access linux_sched_h.task_struct;
      vma : access linux_mm_types_h.vm_area_struct;
      in_group : int) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1276
   pragma Import (CPP, vm_is_stack, "_Z11vm_is_stackP11task_structP14vm_area_structi");

   function move_page_tables
     (vma : access linux_mm_types_h.vm_area_struct;
      old_addr : unsigned_long;
      new_vma : access linux_mm_types_h.vm_area_struct;
      new_addr : unsigned_long;
      len : unsigned_long;
      need_rmap_locks : Extensions.bool) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1278
   pragma Import (CPP, move_page_tables, "_Z16move_page_tablesP14vm_area_structmS0_mmb");

   function change_protection
     (vma : access linux_mm_types_h.vm_area_struct;
      start : unsigned_long;
      c_end : unsigned_long;
      newprot : asm_pgtable_types_h.pgprot_t;
      dirty_accountable : int;
      prot_numa : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1282
   pragma Import (CPP, change_protection, "_Z17change_protectionP14vm_area_structmm6pgprotii");

   function mprotect_fixup
     (vma : access linux_mm_types_h.vm_area_struct;
      pprev : System.Address;
      start : unsigned_long;
      c_end : unsigned_long;
      newflags : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1285
   pragma Import (CPP, mprotect_fixup, "_Z14mprotect_fixupP14vm_area_structPS0_mmm");

  -- * doesn't attempt to fault and will return short.
  --  

   --  skipped func __get_user_pages_fast

  -- * per-process(per-mm_struct) statistics.
  --  

   function get_mm_counter (mm : access linux_mm_types_h.mm_struct; member : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1297
   pragma Import (CPP, get_mm_counter, "_ZL14get_mm_counterP9mm_structi");

  --	 * counter is updated in asynchronous manner and may go to minus.
  --	 * But it's never be expected number for users.
  --	  

   procedure add_mm_counter
     (mm : access linux_mm_types_h.mm_struct;
      member : int;
      value : long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1312
   pragma Import (CPP, add_mm_counter, "_ZL14add_mm_counterP9mm_structil");

   procedure inc_mm_counter (mm : access linux_mm_types_h.mm_struct; member : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1317
   pragma Import (CPP, inc_mm_counter, "_ZL14inc_mm_counterP9mm_structi");

   procedure dec_mm_counter (mm : access linux_mm_types_h.mm_struct; member : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1322
   pragma Import (CPP, dec_mm_counter, "_ZL14dec_mm_counterP9mm_structi");

   function get_mm_rss (mm : access linux_mm_types_h.mm_struct) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1327
   pragma Import (CPP, get_mm_rss, "_ZL10get_mm_rssP9mm_struct");

   function get_mm_hiwater_rss (mm : access linux_mm_types_h.mm_struct) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1333
   pragma Import (CPP, get_mm_hiwater_rss, "_ZL18get_mm_hiwater_rssP9mm_struct");

   function get_mm_hiwater_vm (mm : access linux_mm_types_h.mm_struct) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1338
   pragma Import (CPP, get_mm_hiwater_vm, "_ZL17get_mm_hiwater_vmP9mm_struct");

   procedure update_hiwater_rss (mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1343
   pragma Import (CPP, update_hiwater_rss, "_ZL18update_hiwater_rssP9mm_struct");

   procedure update_hiwater_vm (mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1351
   pragma Import (CPP, update_hiwater_vm, "_ZL17update_hiwater_vmP9mm_struct");

   procedure setmax_mm_hiwater_rss (maxrss : access unsigned_long; mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1357
   pragma Import (CPP, setmax_mm_hiwater_rss, "_ZL21setmax_mm_hiwater_rssPmP9mm_struct");

   procedure sync_mm_rss (mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1367
   pragma Import (CPP, sync_mm_rss, "_Z11sync_mm_rssP9mm_struct");

   function vma_wants_writenotify (vma : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1374
   pragma Import (CPP, vma_wants_writenotify, "_Z21vma_wants_writenotifyP14vm_area_struct");

   --  skipped func __get_locked_pte

   function get_locked_pte
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      ptl : System.Address) return access asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1378
   pragma Import (CPP, get_locked_pte, "_ZL14get_locked_pteP9mm_structmPP8spinlock");

   --  skipped func __pud_alloc

   --  skipped func __pmd_alloc

   --  skipped func __pte_alloc

   --  skipped func __pte_alloc_kernel

  -- * The following ifdef needed to get the 4level-fixup.h header to work.
  -- * Remove it when 4level-fixup.h has been removed.
  --  

   function pud_alloc
     (mm : access linux_mm_types_h.mm_struct;
      pgd : access asm_pgtable_types_h.pgd_t;
      address : unsigned_long) return access asm_pgtable_types_h.pud_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1415
   pragma Import (CPP, pud_alloc, "_ZL9pud_allocP9mm_structP5pgd_tm");

   function pmd_alloc
     (mm : access linux_mm_types_h.mm_struct;
      pud : access asm_pgtable_types_h.pud_t;
      address : unsigned_long) return access asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1421
   pragma Import (CPP, pmd_alloc, "_ZL9pmd_allocP9mm_structP5pud_tm");

   procedure ptlock_cache_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1439
   pragma Import (CPP, ptlock_cache_init, "_ZL17ptlock_cache_initv");

   function ptlock_alloc (the_page : access linux_mm_types_h.page) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1443
   pragma Import (CPP, ptlock_alloc, "_ZL12ptlock_allocP4page");

   procedure ptlock_free (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1448
   pragma Import (CPP, ptlock_free, "_ZL11ptlock_freeP4page");

   function ptlock_ptr (the_page : access linux_mm_types_h.page) return access linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1452
   pragma Import (CPP, ptlock_ptr, "_ZL10ptlock_ptrP4page");

   function pte_lockptr (mm : access linux_mm_types_h.mm_struct; pmd : access asm_pgtable_types_h.pmd_t) return access linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1458
   pragma Import (CPP, pte_lockptr, "_ZL11pte_lockptrP9mm_structP5pmd_t");

   function ptlock_init (the_page : access linux_mm_types_h.page) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1463
   pragma Import (CPP, ptlock_init, "_ZL11ptlock_initP4page");

  --	 * prep_new_page() initialize page->private (and therefore page->ptl)
  --	 * with 0. Make sure nobody took it in use in between.
  --	 *
  --	 * It can happen if arch try to use slab for page table allocation:
  --	 * slab code uses page->slab_cache and page->first_page (for tail
  --	 * pages), which share storage with page->ptl.
  --	  

  -- Reset page->mapping so free_pages_check won't complain.  
   procedure pte_lock_deinit (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1481
   pragma Import (CPP, pte_lock_deinit, "_ZL15pte_lock_deinitP4page");

  -- * We use mm->page_table_lock to guard all pagetable pages of the mm.
  --  

   procedure pgtable_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1500
   pragma Import (CPP, pgtable_init, "_ZL12pgtable_initv");

   function pgtable_page_ctor (the_page : access linux_mm_types_h.page) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1506
   pragma Import (CPP, pgtable_page_ctor, "_ZL17pgtable_page_ctorP4page");

   procedure pgtable_page_dtor (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1512
   pragma Import (CPP, pgtable_page_dtor, "_ZL17pgtable_page_dtorP4page");

   function pmd_to_page (pmd : access asm_pgtable_types_h.pmd_t) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1548
   pragma Import (CPP, pmd_to_page, "_ZL11pmd_to_pageP5pmd_t");

   function pmd_lockptr (mm : access linux_mm_types_h.mm_struct; pmd : access asm_pgtable_types_h.pmd_t) return access linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1554
   pragma Import (CPP, pmd_lockptr, "_ZL11pmd_lockptrP9mm_structP5pmd_t");

   function pgtable_pmd_page_ctor (the_page : access linux_mm_types_h.page) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1559
   pragma Import (CPP, pgtable_pmd_page_ctor, "_ZL21pgtable_pmd_page_ctorP4page");

   procedure pgtable_pmd_page_dtor (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1567
   pragma Import (CPP, pgtable_pmd_page_dtor, "_ZL21pgtable_pmd_page_dtorP4page");

   function pmd_lock (mm : access linux_mm_types_h.mm_struct; pmd : access asm_pgtable_types_h.pmd_t) return access linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1591
   pragma Import (CPP, pmd_lock, "_ZL8pmd_lockP9mm_structP5pmd_t");

   procedure free_area_init (zones_size : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1598
   pragma Import (CPP, free_area_init, "_Z14free_area_initPm");

   procedure free_area_init_node
     (nid : int;
      zones_size : access unsigned_long;
      zone_start_pfn : unsigned_long;
      zholes_size : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1599
   pragma Import (CPP, free_area_init_node, "_Z19free_area_init_nodeiPmmS_");

   procedure free_initmem;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1601
   pragma Import (CPP, free_initmem, "_Z12free_initmemv");

  -- * Free reserved pages within range [PAGE_ALIGN(start), end & PAGE_MASK)
  -- * into the buddy system. The freed pages will be poisoned with pattern
  -- * "poison" if it's within range [0, UCHAR_MAX].
  -- * Return pages freed into the buddy system.
  --  

   function free_reserved_area
     (start : System.Address;
      c_end : System.Address;
      poison : int;
      s : Interfaces.C.Strings.chars_ptr) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1609
   pragma Import (CPP, free_reserved_area, "_Z18free_reserved_areaPvS_iPc");

  -- * Free a highmem page into the buddy system, adjusting totalhigh_pages
  -- * and totalram_pages.
  --  

   procedure adjust_managed_page_count (the_page : access linux_mm_types_h.page; count : long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1620
   pragma Import (CPP, adjust_managed_page_count, "_Z25adjust_managed_page_countP4pagel");

   procedure mem_init_print_info (str : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1621
   pragma Import (CPP, mem_init_print_info, "_Z19mem_init_print_infoPKc");

  -- Free the reserved page into the buddy system, so it gets managed.  
   --  skipped func __free_reserved_page

   procedure free_reserved_page (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1631
   pragma Import (CPP, free_reserved_page, "_ZL18free_reserved_pageP4page");

   procedure mark_page_reserved (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1637
   pragma Import (CPP, mark_page_reserved, "_ZL18mark_page_reservedP4page");

  -- * Default method to free all the __init memory into the buddy system.
  -- * The freed pages will be poisoned with pattern "poison" if it's within
  -- * range [0, UCHAR_MAX].
  -- * Return pages freed into the buddy system.
  --  

   function free_initmem_default (poison : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1649
   pragma Import (CPP, free_initmem_default, "_ZL20free_initmem_defaulti");

   function get_num_physpages return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1657
   pragma Import (CPP, get_num_physpages, "_ZL17get_num_physpagesv");

  -- * With CONFIG_HAVE_MEMBLOCK_NODE_MAP set, an architecture may initialise its
  -- * zones, allocate the backing mem_map and account for memory holes in a more
  -- * architecture independent manner. This is a substitute for creating the
  -- * zone_sizes[] and zholes_size[] arrays and passing them to
  -- * free_area_init_node()
  -- *
  -- * An architecture is expected to register range of page frames backed by
  -- * physical memory with memblock_add[_node]() before calling
  -- * free_area_init_nodes() passing in the PFN each zone ends at. At a basic
  -- * usage, an architecture is expected to do something like
  -- *
  -- * unsigned long max_zone_pfns[MAX_NR_ZONES] = {max_dma, max_normal_pfn,
  -- * 							 max_highmem_pfn};
  -- * for_each_valid_physical_page_range()
  -- * 	memblock_add_node(base, size, nid)
  -- * free_area_init_nodes(max_zone_pfns);
  -- *
  -- * free_bootmem_with_active_regions() calls free_bootmem_node() for each
  -- * registered physical page range.  Similarly
  -- * sparse_memory_present_with_active_regions() calls memory_present() for
  -- * each range when SPARSEMEM is enabled.
  -- *
  -- * See mm/page_alloc.c for more information on each function exposed by
  -- * CONFIG_HAVE_MEMBLOCK_NODE_MAP.
  --  

   procedure free_area_init_nodes (max_zone_pfn : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1695
   pragma Import (CPP, free_area_init_nodes, "_Z20free_area_init_nodesPm");

   function node_map_pfn_alignment return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1696
   pragma Import (CPP, node_map_pfn_alignment, "_Z22node_map_pfn_alignmentv");

   --  skipped func __absent_pages_in_range

   function absent_pages_in_range (start_pfn : unsigned_long; end_pfn : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1699
   pragma Import (CPP, absent_pages_in_range, "_Z21absent_pages_in_rangemm");

   procedure get_pfn_range_for_nid
     (nid : unsigned;
      start_pfn : access unsigned_long;
      end_pfn : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1701
   pragma Import (CPP, get_pfn_range_for_nid, "_Z21get_pfn_range_for_nidjPmS_");

   function find_min_pfn_with_active_regions return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1703
   pragma Import (CPP, find_min_pfn_with_active_regions, "_Z32find_min_pfn_with_active_regionsv");

   procedure free_bootmem_with_active_regions (nid : int; max_low_pfn : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1704
   pragma Import (CPP, free_bootmem_with_active_regions, "_Z32free_bootmem_with_active_regionsim");

   procedure sparse_memory_present_with_active_regions (nid : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1706
   pragma Import (CPP, sparse_memory_present_with_active_regions, "_Z41sparse_memory_present_with_active_regionsi");

  -- please see mm/page_alloc.c  
   function early_pfn_to_nid (pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1718
   pragma Import (CPP, early_pfn_to_nid, "_Z16early_pfn_to_nidm");

  -- there is a per-arch backend function.  
   --  skipped func __early_pfn_to_nid

   procedure set_dma_reserve (new_dma_reserve : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1723
   pragma Import (CPP, set_dma_reserve, "_Z15set_dma_reservem");

   procedure memmap_init_zone
     (arg1 : unsigned_long;
      arg2 : int;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : linux_mmzone_h.memmap_context);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1724
   pragma Import (CPP, memmap_init_zone, "_Z16memmap_init_zonemimm14memmap_context");

   procedure setup_per_zone_wmarks;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1726
   pragma Import (CPP, setup_per_zone_wmarks, "_Z21setup_per_zone_wmarksv");

   function init_per_zone_wmark_min return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1727
   pragma Import (CPP, init_per_zone_wmark_min, "_Z23init_per_zone_wmark_minv");

   procedure mem_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1728
   pragma Import (CPP, mem_init, "_Z8mem_initv");

   procedure mmap_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1729
   pragma Import (CPP, mmap_init, "_Z9mmap_initv");

   procedure show_mem (flags : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1730
   pragma Import (CPP, show_mem, "_Z8show_memj");

   procedure si_meminfo (val : access uapi_linux_sysinfo_h.sysinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1731
   pragma Import (CPP, si_meminfo, "_Z10si_meminfoP7sysinfo");

   procedure si_meminfo_node (val : access uapi_linux_sysinfo_h.sysinfo; nid : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1732
   pragma Import (CPP, si_meminfo_node, "_Z15si_meminfo_nodeP7sysinfoi");

   procedure warn_alloc_failed
     (gfp_mask : linux_types_h.gfp_t;
      order : int;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      );  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1735
   pragma Import (CPP, warn_alloc_failed, "_Z17warn_alloc_failedjiPKcz");

   procedure setup_per_cpu_pageset;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1737
   pragma Import (CPP, setup_per_cpu_pageset, "_Z21setup_per_cpu_pagesetv");

   procedure zone_pcp_update (the_zone : access linux_mmzone_h.zone);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1739
   pragma Import (CPP, zone_pcp_update, "_Z15zone_pcp_updateP4zone");

   procedure zone_pcp_reset (the_zone : access linux_mmzone_h.zone);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1740
   pragma Import (CPP, zone_pcp_reset, "_Z14zone_pcp_resetP4zone");

  -- page_alloc.c  
   min_free_kbytes : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1743
   pragma Import (C, min_free_kbytes, "min_free_kbytes");

  -- nommu.c  
   mmap_pages_allocated : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1746
   pragma Import (C, mmap_pages_allocated, "mmap_pages_allocated");

   function nommu_shrink_inode_mappings
     (arg1 : access linux_fs_h.inode;
      arg2 : linux_types_h.size_t;
      arg3 : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1747
   pragma Import (CPP, nommu_shrink_inode_mappings, "_Z27nommu_shrink_inode_mappingsP5inodemm");

  -- interval_tree.c  
   procedure vma_interval_tree_insert (node : access linux_mm_types_h.vm_area_struct; root : access linux_rbtree_h.rb_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1750
   pragma Import (CPP, vma_interval_tree_insert, "_Z24vma_interval_tree_insertP14vm_area_structP7rb_root");

   procedure vma_interval_tree_insert_after
     (node : access linux_mm_types_h.vm_area_struct;
      prev : access linux_mm_types_h.vm_area_struct;
      root : access linux_rbtree_h.rb_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1752
   pragma Import (CPP, vma_interval_tree_insert_after, "_Z30vma_interval_tree_insert_afterP14vm_area_structS0_P7rb_root");

   procedure vma_interval_tree_remove (node : access linux_mm_types_h.vm_area_struct; root : access linux_rbtree_h.rb_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1755
   pragma Import (CPP, vma_interval_tree_remove, "_Z24vma_interval_tree_removeP14vm_area_structP7rb_root");

   function vma_interval_tree_iter_first
     (root : access linux_rbtree_h.rb_root;
      start : unsigned_long;
      last : unsigned_long) return access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1757
   pragma Import (CPP, vma_interval_tree_iter_first, "_Z28vma_interval_tree_iter_firstP7rb_rootmm");

   function vma_interval_tree_iter_next
     (node : access linux_mm_types_h.vm_area_struct;
      start : unsigned_long;
      last : unsigned_long) return access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1759
   pragma Import (CPP, vma_interval_tree_iter_next, "_Z27vma_interval_tree_iter_nextP14vm_area_structmm");

   procedure vma_nonlinear_insert (vma : access linux_mm_types_h.vm_area_struct; list : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1766
   pragma Import (CPP, vma_nonlinear_insert, "_ZL20vma_nonlinear_insertP14vm_area_structP9list_head");

   procedure anon_vma_interval_tree_insert (node : System.Address; root : access linux_rbtree_h.rb_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1772
   pragma Import (CPP, anon_vma_interval_tree_insert, "_Z29anon_vma_interval_tree_insertP14anon_vma_chainP7rb_root");

   procedure anon_vma_interval_tree_remove (node : System.Address; root : access linux_rbtree_h.rb_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1774
   pragma Import (CPP, anon_vma_interval_tree_remove, "_Z29anon_vma_interval_tree_removeP14anon_vma_chainP7rb_root");

   function anon_vma_interval_tree_iter_first
     (root : access linux_rbtree_h.rb_root;
      start : unsigned_long;
      last : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1776
   pragma Import (CPP, anon_vma_interval_tree_iter_first, "_Z33anon_vma_interval_tree_iter_firstP7rb_rootmm");

   function anon_vma_interval_tree_iter_next
     (node : System.Address;
      start : unsigned_long;
      last : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1778
   pragma Import (CPP, anon_vma_interval_tree_iter_next, "_Z32anon_vma_interval_tree_iter_nextP14anon_vma_chainmm");

  -- mmap.c  
   --  skipped func __vm_enough_memory

   function vma_adjust
     (vma : access linux_mm_types_h.vm_area_struct;
      start : unsigned_long;
      c_end : unsigned_long;
      pgoff : unsigned_long;
      insert : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1790
   pragma Import (CPP, vma_adjust, "_Z10vma_adjustP14vm_area_structmmmS0_");

   function vma_merge
     (arg1 : access linux_mm_types_h.mm_struct;
      prev : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      c_end : unsigned_long;
      vm_flags : unsigned_long;
      arg6 : System.Address;
      arg7 : access linux_fs_h.file;
      arg8 : unsigned_long;
      arg9 : System.Address) return access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1792
   pragma Import (CPP, vma_merge, "_Z9vma_mergeP9mm_structP14vm_area_structmmmP8anon_vmaP4filemP9mempolicy");

   function find_mergeable_anon_vma (arg1 : access linux_mm_types_h.vm_area_struct) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1796
   pragma Import (CPP, find_mergeable_anon_vma, "_Z23find_mergeable_anon_vmaP14vm_area_struct");

   function split_vma
     (arg1 : access linux_mm_types_h.mm_struct;
      arg2 : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      new_below : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1797
   pragma Import (CPP, split_vma, "_Z9split_vmaP9mm_structP14vm_area_structmi");

   function insert_vm_struct (arg1 : access linux_mm_types_h.mm_struct; arg2 : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1799
   pragma Import (CPP, insert_vm_struct, "_Z16insert_vm_structP9mm_structP14vm_area_struct");

   --  skipped func __vma_link_rb

   procedure unlink_file_vma (arg1 : access linux_mm_types_h.vm_area_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1802
   pragma Import (CPP, unlink_file_vma, "_Z15unlink_file_vmaP14vm_area_struct");

   function copy_vma
     (arg1 : System.Address;
      addr : unsigned_long;
      len : unsigned_long;
      pgoff : unsigned_long;
      need_rmap_locks : access Extensions.bool) return access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1803
   pragma Import (CPP, copy_vma, "_Z8copy_vmaPP14vm_area_structmmmPb");

   procedure exit_mmap (arg1 : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1806
   pragma Import (CPP, exit_mmap, "_Z9exit_mmapP9mm_struct");

   function mm_take_all_locks (mm : access linux_mm_types_h.mm_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1808
   pragma Import (CPP, mm_take_all_locks, "_Z17mm_take_all_locksP9mm_struct");

   procedure mm_drop_all_locks (mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1809
   pragma Import (CPP, mm_drop_all_locks, "_Z17mm_drop_all_locksP9mm_struct");

   procedure set_mm_exe_file (mm : access linux_mm_types_h.mm_struct; new_exe_file : access linux_fs_h.file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1811
   pragma Import (CPP, set_mm_exe_file, "_Z15set_mm_exe_fileP9mm_structP4file");

   function get_mm_exe_file (mm : access linux_mm_types_h.mm_struct) return access linux_fs_h.file;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1812
   pragma Import (CPP, get_mm_exe_file, "_Z15get_mm_exe_fileP9mm_struct");

   function may_expand_vm (mm : access linux_mm_types_h.mm_struct; npages : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1814
   pragma Import (CPP, may_expand_vm, "_Z13may_expand_vmP9mm_structm");

   --  skipped func _install_special_mapping

  -- This is an obsolete alternative to _install_special_mapping.  
   function install_special_mapping
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      len : unsigned_long;
      flags : unsigned_long;
      pages : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1820
   pragma Import (CPP, install_special_mapping, "_Z23install_special_mappingP9mm_structmmmPP4page");

   function get_unmapped_area
     (arg1 : access linux_fs_h.file;
      arg2 : unsigned_long;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1824
   pragma Import (CPP, get_unmapped_area, "_Z17get_unmapped_areaP4filemmmm");

   function mmap_region
     (the_file : access linux_fs_h.file;
      addr : unsigned_long;
      len : unsigned_long;
      vm_flags : linux_mm_types_h.vm_flags_t;
      pgoff : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1826
   pragma Import (CPP, mmap_region, "_Z11mmap_regionP4filemmmm");

   function do_mmap_pgoff
     (the_file : access linux_fs_h.file;
      addr : unsigned_long;
      len : unsigned_long;
      prot : unsigned_long;
      flags : unsigned_long;
      pgoff : unsigned_long;
      populate : access unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1828
   pragma Import (CPP, do_mmap_pgoff, "_Z13do_mmap_pgoffP4filemmmmmPm");

   function do_munmap
     (arg1 : access linux_mm_types_h.mm_struct;
      arg2 : unsigned_long;
      arg3 : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1831
   pragma Import (CPP, do_munmap, "_Z9do_munmapP9mm_structmm");

   --  skipped func __mm_populate

   procedure mm_populate (addr : unsigned_long; len : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1836
   pragma Import (CPP, mm_populate, "_ZL11mm_populatemm");

  -- Ignore errors  
  -- These take the mm semaphore themselves  
   function vm_brk (arg1 : unsigned_long; arg2 : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1846
   pragma Import (CPP, vm_brk, "_Z6vm_brkmm");

   function vm_munmap (arg1 : unsigned_long; arg2 : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1847
   pragma Import (CPP, vm_munmap, "_Z9vm_munmapmm");

   function vm_mmap
     (arg1 : access linux_fs_h.file;
      arg2 : unsigned_long;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned_long;
      arg6 : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1848
   pragma Import (CPP, vm_mmap, "_Z7vm_mmapP4filemmmmm");

   type vm_unmapped_area_info is record
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1854
      length : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1855
      low_limit : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1856
      high_limit : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1857
      align_mask : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1858
      align_offset : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1859
   end record;
   pragma Convention (C_Pass_By_Copy, vm_unmapped_area_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1852

   function unmapped_area (info : access vm_unmapped_area_info) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1862
   pragma Import (CPP, unmapped_area, "_Z13unmapped_areaP21vm_unmapped_area_info");

   function unmapped_area_topdown (info : access vm_unmapped_area_info) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1863
   pragma Import (CPP, unmapped_area_topdown, "_Z21unmapped_area_topdownP21vm_unmapped_area_info");

  -- * Search for an unmapped address range.
  -- *
  -- * We are looking for a range that:
  -- * - does not intersect with any VMA;
  -- * - is contained within the [low_limit, high_limit) interval;
  -- * - is at least the desired size.
  -- * - satisfies (begin_addr & align_mask) == (align_offset & align_mask)
  --  

   function vm_unmapped_area (info : access vm_unmapped_area_info) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1875
   pragma Import (CPP, vm_unmapped_area, "_ZL16vm_unmapped_areaP21vm_unmapped_area_info");

  -- truncate.c  
   procedure truncate_inode_pages (arg1 : access linux_fs_h.address_space; arg2 : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1884
   pragma Import (CPP, truncate_inode_pages, "_Z20truncate_inode_pagesP13address_spacex");

   procedure truncate_inode_pages_range
     (arg1 : access linux_fs_h.address_space;
      lstart : linux_types_h.loff_t;
      lend : linux_types_h.loff_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1885
   pragma Import (CPP, truncate_inode_pages_range, "_Z26truncate_inode_pages_rangeP13address_spacexx");

   procedure truncate_inode_pages_final (arg1 : access linux_fs_h.address_space);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1887
   pragma Import (CPP, truncate_inode_pages_final, "_Z26truncate_inode_pages_finalP13address_space");

  -- generic vm_area_ops exported for stackable file systems  
   function filemap_fault (arg1 : access linux_mm_types_h.vm_area_struct; arg2 : access vm_fault) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1890
   pragma Import (CPP, filemap_fault, "_Z13filemap_faultP14vm_area_structP8vm_fault");

   procedure filemap_map_pages (vma : access linux_mm_types_h.vm_area_struct; vmf : access vm_fault);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1891
   pragma Import (CPP, filemap_map_pages, "_Z17filemap_map_pagesP14vm_area_structP8vm_fault");

   function filemap_page_mkwrite (vma : access linux_mm_types_h.vm_area_struct; vmf : access vm_fault) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1892
   pragma Import (CPP, filemap_page_mkwrite, "_Z20filemap_page_mkwriteP14vm_area_structP8vm_fault");

  -- mm/page-writeback.c  
   function write_one_page (the_page : access linux_mm_types_h.page; wait : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1895
   pragma Import (CPP, write_one_page, "_Z14write_one_pageP4pagei");

   procedure task_dirty_inc (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1896
   pragma Import (CPP, task_dirty_inc, "_Z14task_dirty_incP11task_struct");

  -- readahead.c  
   function force_page_cache_readahead
     (mapping : access linux_fs_h.address_space;
      filp : access linux_fs_h.file;
      offset : unsigned_long;
      nr_to_read : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1902
   pragma Import (CPP, force_page_cache_readahead, "_Z26force_page_cache_readaheadP13address_spaceP4filemm");

   procedure page_cache_sync_readahead
     (mapping : access linux_fs_h.address_space;
      ra : access linux_fs_h.file_ra_state;
      filp : access linux_fs_h.file;
      offset : unsigned_long;
      size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1905
   pragma Import (CPP, page_cache_sync_readahead, "_Z25page_cache_sync_readaheadP13address_spaceP13file_ra_stateP4filemm");

   procedure page_cache_async_readahead
     (mapping : access linux_fs_h.address_space;
      ra : access linux_fs_h.file_ra_state;
      filp : access linux_fs_h.file;
      pg : access linux_mm_types_h.page;
      offset : unsigned_long;
      size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1911
   pragma Import (CPP, page_cache_async_readahead, "_Z26page_cache_async_readaheadP13address_spaceP13file_ra_stateP4fileP4pagemm");

   function max_sane_readahead (nr : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1918
   pragma Import (CPP, max_sane_readahead, "_Z18max_sane_readaheadm");

  -- Generic expand stack which grows the stack according to GROWS{UP,DOWN}  
   function expand_stack (vma : access linux_mm_types_h.vm_area_struct; address : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1921
   pragma Import (CPP, expand_stack, "_Z12expand_stackP14vm_area_structm");

  -- CONFIG_STACK_GROWSUP still needs to to grow downwards at some places  
   function expand_downwards (vma : access linux_mm_types_h.vm_area_struct; address : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1924
   pragma Import (CPP, expand_downwards, "_Z16expand_downwardsP14vm_area_structm");

  -- Look up the first VMA which satisfies  addr < vm_end,  NULL if none.  
   function find_vma (mm : access linux_mm_types_h.mm_struct; addr : unsigned_long) return access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1933
   pragma Import (CPP, find_vma, "_Z8find_vmaP9mm_structm");

   function find_vma_prev
     (mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long;
      pprev : System.Address) return access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1934
   pragma Import (CPP, find_vma_prev, "_Z13find_vma_prevP9mm_structmPP14vm_area_struct");

  -- Look up the first VMA which intersects the interval start_addr..end_addr-1,
  --   NULL if none.  Assume start_addr < end_addr.  

   function find_vma_intersection
     (mm : access linux_mm_types_h.mm_struct;
      start_addr : unsigned_long;
      end_addr : unsigned_long) return access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1939
   pragma Import (CPP, find_vma_intersection, "_ZL21find_vma_intersectionP9mm_structmm");

   function vma_pages (vma : access linux_mm_types_h.vm_area_struct) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1948
   pragma Import (CPP, vma_pages, "_ZL9vma_pagesP14vm_area_struct");

  -- Look up the first VMA which exactly match the interval vm_start ... vm_end  
   function find_exact_vma
     (mm : access linux_mm_types_h.mm_struct;
      vm_start : unsigned_long;
      vm_end : unsigned_long) return access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1954
   pragma Import (CPP, find_exact_vma, "_ZL14find_exact_vmaP9mm_structmm");

   function vm_get_page_prot (vm_flags : unsigned_long) return asm_pgtable_types_h.pgprot_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1966
   pragma Import (CPP, vm_get_page_prot, "_Z16vm_get_page_protm");

   function change_prot_numa
     (vma : access linux_mm_types_h.vm_area_struct;
      start : unsigned_long;
      c_end : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1975
   pragma Import (CPP, change_prot_numa, "_Z16change_prot_numaP14vm_area_structmm");

   function find_extend_vma (arg1 : access linux_mm_types_h.mm_struct; addr : unsigned_long) return access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1979
   pragma Import (CPP, find_extend_vma, "_Z15find_extend_vmaP9mm_structm");

   function remap_pfn_range
     (arg1 : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      pfn : unsigned_long;
      size : unsigned_long;
      arg5 : asm_pgtable_types_h.pgprot_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1980
   pragma Import (CPP, remap_pfn_range, "_Z15remap_pfn_rangeP14vm_area_structmmm6pgprot");

   function vm_insert_page
     (arg1 : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      arg3 : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1982
   pragma Import (CPP, vm_insert_page, "_Z14vm_insert_pageP14vm_area_structmP4page");

   function vm_insert_pfn
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1983
   pragma Import (CPP, vm_insert_pfn, "_Z13vm_insert_pfnP14vm_area_structmm");

   function vm_insert_mixed
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : unsigned_long;
      pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1985
   pragma Import (CPP, vm_insert_mixed, "_Z15vm_insert_mixedP14vm_area_structmm");

   function vm_iomap_memory
     (vma : access linux_mm_types_h.vm_area_struct;
      start : linux_types_h.phys_addr_t;
      len : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1987
   pragma Import (CPP, vm_iomap_memory, "_Z15vm_iomap_memoryP14vm_area_structym");

   function follow_page_mask
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      foll_flags : unsigned;
      page_mask : access unsigned) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1990
   pragma Import (CPP, follow_page_mask, "_Z16follow_page_maskP14vm_area_structmjPj");

   function follow_page
     (vma : access linux_mm_types_h.vm_area_struct;
      address : unsigned_long;
      foll_flags : unsigned) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:1994
   pragma Import (CPP, follow_page, "_ZL11follow_pageP14vm_area_structmj");

   type pte_fn_t is access function
        (arg1 : access asm_pgtable_64_types_h.pte_t;
         arg2 : asm_pgtable_types_h.pgtable_t;
         arg3 : unsigned_long;
         arg4 : System.Address) return int;
   pragma Convention (C, pte_fn_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2014

   function apply_to_page_range
     (mm : access linux_mm_types_h.mm_struct;
      address : unsigned_long;
      size : unsigned_long;
      fn : pte_fn_t;
      data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2016
   pragma Import (CPP, apply_to_page_range, "_Z19apply_to_page_rangeP9mm_structmmPFiP5pte_tP4pagemPvES5_");

   procedure vm_stat_account
     (arg1 : access linux_mm_types_h.mm_struct;
      arg2 : unsigned_long;
      arg3 : access linux_fs_h.file;
      arg4 : long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2020
   pragma Import (CPP, vm_stat_account, "_Z15vm_stat_accountP9mm_structmP4filel");

   procedure kernel_map_pages
     (the_page : access linux_mm_types_h.page;
      numpages : int;
      enable : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2036
   pragma Import (CPP, kernel_map_pages, "_ZL16kernel_map_pagesP4pageii");

   function kernel_page_present (the_page : access linux_mm_types_h.page) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2038
   pragma Import (CPP, kernel_page_present, "_ZL19kernel_page_presentP4page");

   function get_gate_vma (mm : access linux_mm_types_h.mm_struct) return access linux_mm_types_h.vm_area_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2042
   pragma Import (CPP, get_gate_vma, "_Z12get_gate_vmaP9mm_struct");

   function in_gate_area_no_mm (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2044
   pragma Import (CPP, in_gate_area_no_mm, "_Z18in_gate_area_no_mmm");

   function in_gate_area (mm : access linux_mm_types_h.mm_struct; addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2045
   pragma Import (CPP, in_gate_area, "_Z12in_gate_areaP9mm_structm");

   sysctl_drop_caches : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2052
   pragma Import (C, sysctl_drop_caches, "sysctl_drop_caches");

   function drop_caches_sysctl_handler
     (arg1 : access linux_sysctl_h.ctl_table;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2053
   pragma Import (CPP, drop_caches_sysctl_handler, "_Z26drop_caches_sysctl_handlerP9ctl_tableiPvPmPx");

   function shrink_slab
     (shrink : access linux_shrinker_h.shrink_control;
      nr_pages_scanned : unsigned_long;
      lru_pages : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2057
   pragma Import (CPP, shrink_slab, "_Z11shrink_slabP14shrink_controlmm");

   randomize_va_space : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2064
   pragma Import (C, randomize_va_space, "randomize_va_space");

   function arch_vma_name (vma : access linux_mm_types_h.vm_area_struct) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2067
   pragma Import (CPP, arch_vma_name, "_Z13arch_vma_nameP14vm_area_struct");

   procedure print_vma_addr (prefix : Interfaces.C.Strings.chars_ptr; rip : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2068
   pragma Import (CPP, print_vma_addr, "_Z14print_vma_addrPcm");

   procedure sparse_mem_maps_populate_node
     (map_map : System.Address;
      pnum_begin : unsigned_long;
      pnum_end : unsigned_long;
      map_count : unsigned_long;
      nodeid : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2070
   pragma Import (CPP, sparse_mem_maps_populate_node, "_Z29sparse_mem_maps_populate_nodePP4pagemmmi");

   function sparse_mem_map_populate (pnum : unsigned_long; nid : int) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2076
   pragma Import (CPP, sparse_mem_map_populate, "_Z23sparse_mem_map_populatemi");

   function vmemmap_pgd_populate (addr : unsigned_long; node : int) return access asm_pgtable_types_h.pgd_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2077
   pragma Import (CPP, vmemmap_pgd_populate, "_Z20vmemmap_pgd_populatemi");

   function vmemmap_pud_populate
     (pgd : access asm_pgtable_types_h.pgd_t;
      addr : unsigned_long;
      node : int) return access asm_pgtable_types_h.pud_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2078
   pragma Import (CPP, vmemmap_pud_populate, "_Z20vmemmap_pud_populateP5pgd_tmi");

   function vmemmap_pmd_populate
     (pud : access asm_pgtable_types_h.pud_t;
      addr : unsigned_long;
      node : int) return access asm_pgtable_types_h.pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2079
   pragma Import (CPP, vmemmap_pmd_populate, "_Z20vmemmap_pmd_populateP5pud_tmi");

   function vmemmap_pte_populate
     (pmd : access asm_pgtable_types_h.pmd_t;
      addr : unsigned_long;
      node : int) return access asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2080
   pragma Import (CPP, vmemmap_pte_populate, "_Z20vmemmap_pte_populateP5pmd_tmi");

   function vmemmap_alloc_block (size : unsigned_long; node : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2081
   pragma Import (CPP, vmemmap_alloc_block, "_Z19vmemmap_alloc_blockmi");

   function vmemmap_alloc_block_buf (size : unsigned_long; node : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2082
   pragma Import (CPP, vmemmap_alloc_block_buf, "_Z23vmemmap_alloc_block_bufmi");

   procedure vmemmap_verify
     (arg1 : access asm_pgtable_64_types_h.pte_t;
      arg2 : int;
      arg3 : unsigned_long;
      arg4 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2083
   pragma Import (CPP, vmemmap_verify, "_Z14vmemmap_verifyP5pte_timm");

   function vmemmap_populate_basepages
     (start : unsigned_long;
      c_end : unsigned_long;
      node : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2084
   pragma Import (CPP, vmemmap_populate_basepages, "_Z26vmemmap_populate_basepagesmmi");

   function vmemmap_populate
     (start : unsigned_long;
      c_end : unsigned_long;
      node : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2086
   pragma Import (CPP, vmemmap_populate, "_Z16vmemmap_populatemmi");

   procedure vmemmap_populate_print_last;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2087
   pragma Import (CPP, vmemmap_populate_print_last, "_Z27vmemmap_populate_print_lastv");

   procedure vmemmap_free (start : unsigned_long; c_end : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2089
   pragma Import (CPP, vmemmap_free, "_Z12vmemmap_freemm");

   procedure register_page_bootmem_memmap
     (section_nr : unsigned_long;
      map : access linux_mm_types_h.page;
      size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2091
   pragma Import (CPP, register_page_bootmem_memmap, "_Z28register_page_bootmem_memmapmP4pagem");

   subtype mf_flags is unsigned;
   MF_COUNT_INCREASED : constant mf_flags := 1;
   MF_ACTION_REQUIRED : constant mf_flags := 2;
   MF_MUST_KILL : constant mf_flags := 4;
   MF_SOFT_OFFLINE : constant mf_flags := 8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2094

   function memory_failure
     (pfn : unsigned_long;
      trapno : int;
      flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2100
   pragma Import (CPP, memory_failure, "_Z14memory_failuremii");

   procedure memory_failure_queue
     (pfn : unsigned_long;
      trapno : int;
      flags : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2101
   pragma Import (CPP, memory_failure_queue, "_Z20memory_failure_queuemii");

   function unpoison_memory (pfn : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2102
   pragma Import (CPP, unpoison_memory, "_Z15unpoison_memorym");

   sysctl_memory_failure_early_kill : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2103
   pragma Import (C, sysctl_memory_failure_early_kill, "sysctl_memory_failure_early_kill");

   sysctl_memory_failure_recovery : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2104
   pragma Import (C, sysctl_memory_failure_recovery, "sysctl_memory_failure_recovery");

   procedure shake_page (p : access linux_mm_types_h.page; c_access : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2105
   pragma Import (CPP, shake_page, "_Z10shake_pageP4pagei");

   num_poisoned_pages : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2106
   pragma Import (C, num_poisoned_pages, "num_poisoned_pages");

   function soft_offline_page (the_page : access linux_mm_types_h.page; flags : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2107
   pragma Import (CPP, soft_offline_page, "_Z17soft_offline_pageP4pagei");

   procedure clear_huge_page
     (the_page : access linux_mm_types_h.page;
      addr : unsigned_long;
      pages_per_huge_page : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2110
   pragma Import (CPP, clear_huge_page, "_Z15clear_huge_pageP4pagemj");

   procedure copy_user_huge_page
     (dst : access linux_mm_types_h.page;
      src : access linux_mm_types_h.page;
      addr : unsigned_long;
      vma : access linux_mm_types_h.vm_area_struct;
      pages_per_huge_page : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2113
   pragma Import (CPP, copy_user_huge_page, "_Z19copy_user_huge_pageP4pageS0_mP14vm_area_structj");

   function debug_guardpage_minorder return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2131
   pragma Import (CPP, debug_guardpage_minorder, "_ZL24debug_guardpage_minorderv");

   function page_is_guard (the_page : access linux_mm_types_h.page) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2132
   pragma Import (CPP, page_is_guard, "_ZL13page_is_guardP4page");

   procedure setup_nr_node_ids;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mm.h:2136
   pragma Import (CPP, setup_nr_node_ids, "_Z17setup_nr_node_idsv");

end linux_mm_h;

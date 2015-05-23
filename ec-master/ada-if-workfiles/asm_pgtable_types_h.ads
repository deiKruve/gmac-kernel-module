pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_pgtable_64_types_h;
with System;
with linux_types_h;
with asm_generic_int_ll64_h;

package asm_pgtable_types_h is

   --  unsupported macro: FIRST_USER_ADDRESS 0
   --  unsupported macro: PAGE_NONE __pgprot(_PAGE_PROTNONE | _PAGE_ACCESSED)
   --  unsupported macro: PAGE_SHARED __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_USER | _PAGE_ACCESSED | _PAGE_NX)
   --  unsupported macro: PAGE_SHARED_EXEC __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_USER | _PAGE_ACCESSED)
   --  unsupported macro: PAGE_COPY_NOEXEC __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED | _PAGE_NX)
   --  unsupported macro: PAGE_COPY_EXEC __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
   --  unsupported macro: PAGE_COPY PAGE_COPY_NOEXEC
   --  unsupported macro: PAGE_READONLY __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED | _PAGE_NX)
   --  unsupported macro: PAGE_READONLY_EXEC __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_ACCESSED)
   --  unsupported macro: PAGE_KERNEL __pgprot(__PAGE_KERNEL)
   --  unsupported macro: PAGE_KERNEL_RO __pgprot(__PAGE_KERNEL_RO)
   --  unsupported macro: PAGE_KERNEL_EXEC __pgprot(__PAGE_KERNEL_EXEC)
   --  unsupported macro: PAGE_KERNEL_RX __pgprot(__PAGE_KERNEL_RX)
   --  unsupported macro: PAGE_KERNEL_WC __pgprot(__PAGE_KERNEL_WC)
   --  unsupported macro: PAGE_KERNEL_NOCACHE __pgprot(__PAGE_KERNEL_NOCACHE)
   --  unsupported macro: PAGE_KERNEL_UC_MINUS __pgprot(__PAGE_KERNEL_UC_MINUS)
   --  unsupported macro: PAGE_KERNEL_EXEC_NOCACHE __pgprot(__PAGE_KERNEL_EXEC_NOCACHE)
   --  unsupported macro: PAGE_KERNEL_LARGE __pgprot(__PAGE_KERNEL_LARGE)
   --  unsupported macro: PAGE_KERNEL_LARGE_NOCACHE __pgprot(__PAGE_KERNEL_LARGE_NOCACHE)
   --  unsupported macro: PAGE_KERNEL_LARGE_EXEC __pgprot(__PAGE_KERNEL_LARGE_EXEC)
   --  unsupported macro: PAGE_KERNEL_VSYSCALL __pgprot(__PAGE_KERNEL_VSYSCALL)
   --  unsupported macro: PAGE_KERNEL_VVAR __pgprot(__PAGE_KERNEL_VVAR)
   --  unsupported macro: PAGE_KERNEL_VVAR_NOCACHE __pgprot(__PAGE_KERNEL_VVAR_NOCACHE)
   --  unsupported macro: PAGE_KERNEL_IO __pgprot(__PAGE_KERNEL_IO)
   --  unsupported macro: PAGE_KERNEL_IO_NOCACHE __pgprot(__PAGE_KERNEL_IO_NOCACHE)
   --  unsupported macro: PAGE_KERNEL_IO_UC_MINUS __pgprot(__PAGE_KERNEL_IO_UC_MINUS)
   --  unsupported macro: PAGE_KERNEL_IO_WC __pgprot(__PAGE_KERNEL_IO_WC)
   --  unsupported macro: PTE_PFN_MASK ((pteval_t)PHYSICAL_PAGE_MASK)
   --  unsupported macro: PTE_FLAGS_MASK (~PTE_PFN_MASK)
   --  arg-macro: function pgprot_val ((x).pgprot
   --    return (x).pgprot;
   --  unsupported macro: pgprot_writecombine pgprot_writecombine
   --  unsupported macro: native_pagetable_init paging_init
  -- * Swap offsets on configurations that allow automatic NUMA balancing use the
  -- * bits after _PAGE_BIT_GLOBAL. To uniquely distinguish NUMA hinting PTEs from
  -- * swap entries, we use the first bit after _PAGE_BIT_GLOBAL and shrink the
  -- * maximum possible swap space from 16TB to 8TB.
  --  

  -- If _PAGE_BIT_PRESENT is clear, we use these:  
  -- - if the user mapped it with PROT_NONE; pte_present gives true  
  -- - set: nonlinear file mapping, saved PTE; unset:swap  
  -- * The same hidden bit is used by kmemcheck, but since kmemcheck
  -- * works on kernel pages while soft-dirty engine on user space,
  -- * they do not conflict with each other.
  --  

  -- * _PAGE_NUMA distinguishes between a numa hinting minor fault and a page
  -- * that is not present. The hinting fault gathers numa placement statistics
  -- * (see pte_numa()). The bit is always zero when the PTE is not present.
  -- *
  -- * The bit picked must be always zero when the pmd is present and not
  -- * present, so that we don't lose information when we set it while
  -- * atomically clearing the present bit.
  --  

  -- * Tracking soft dirty bit when a page goes to a swap is tricky.
  -- * We need a bit which can be stored in pte _and_ not conflict
  -- * with swap entry format. On x86 bits 6 and 7 are *not* involved
  -- * into swap entry computation, but bit 6 is used for nonlinear
  -- * file mapping, so we borrow bit 7 for soft dirty tracking.
  -- *
  -- * Please note that this bit must be treated as swap dirty page
  -- * mark if and only if the PTE has present bit clear!
  --  

  -- Set of bits not changed in pte_modify  
  --         xwr  
  -- * early identity mapping  pte attrib macros.
  --  

  -- PTE_PFN_MASK extracts the PFN from a (pte|pmd|pud|pgd)val_t  
  -- PTE_FLAGS_MASK extracts the flags from a (pte|pmd|pud|pgd)val_t  
   type pgprot is record
      pgprot : aliased asm_pgtable_64_types_h.pgprotval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:242
   end record;
   pragma Convention (C_Pass_By_Copy, pgprot);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:242

   subtype pgprot_t is pgprot;

   type pgd_t is record
      pgd : aliased asm_pgtable_64_types_h.pgdval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:244
   end record;
   pragma Convention (C_Pass_By_Copy, pgd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:244

   --  skipped anonymous struct anon_14

   function native_make_pgd (val : asm_pgtable_64_types_h.pgdval_t) return pgd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:246
   pragma Import (CPP, native_make_pgd, "_ZL15native_make_pgdm");

   function native_pgd_val (pgd : pgd_t) return asm_pgtable_64_types_h.pgdval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:251
   pragma Import (CPP, native_pgd_val, "_ZL14native_pgd_val5pgd_t");

   function pgd_flags (pgd : pgd_t) return asm_pgtable_64_types_h.pgdval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:256
   pragma Import (CPP, pgd_flags, "_ZL9pgd_flags5pgd_t");

   type pud_t is record
      pud : aliased asm_pgtable_64_types_h.pudval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:262
   end record;
   pragma Convention (C_Pass_By_Copy, pud_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:262

   --  skipped anonymous struct anon_15

   function native_make_pud (val : asm_pgtable_64_types_h.pmdval_t) return pud_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:264
   pragma Import (CPP, native_make_pud, "_ZL15native_make_pudm");

   function native_pud_val (pud : pud_t) return asm_pgtable_64_types_h.pudval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:269
   pragma Import (CPP, native_pud_val, "_ZL14native_pud_val5pud_t");

   type pmd_t is record
      pmd : aliased asm_pgtable_64_types_h.pmdval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:283
   end record;
   pragma Convention (C_Pass_By_Copy, pmd_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:283

   --  skipped anonymous struct anon_16

   function native_make_pmd (val : asm_pgtable_64_types_h.pmdval_t) return pmd_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:285
   pragma Import (CPP, native_make_pmd, "_ZL15native_make_pmdm");

   function native_pmd_val (pmd : pmd_t) return asm_pgtable_64_types_h.pmdval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:290
   pragma Import (CPP, native_pmd_val, "_ZL14native_pmd_val5pmd_t");

   function pud_flags (pud : pud_t) return asm_pgtable_64_types_h.pudval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:303
   pragma Import (CPP, pud_flags, "_ZL9pud_flags5pud_t");

   function pmd_flags (pmd : pmd_t) return asm_pgtable_64_types_h.pmdval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:308
   pragma Import (CPP, pmd_flags, "_ZL9pmd_flags5pmd_t");

   function native_make_pte (val : asm_pgtable_64_types_h.pteval_t) return asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:313
   pragma Import (CPP, native_make_pte, "_ZL15native_make_ptem");

   function native_pte_val (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pteval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:318
   pragma Import (CPP, native_pte_val, "_ZL14native_pte_val5pte_t");

   function pte_flags (pte : asm_pgtable_64_types_h.pte_t) return asm_pgtable_64_types_h.pteval_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:323
   pragma Import (CPP, pte_flags, "_ZL9pte_flags5pte_t");

   --  skipped empty struct page

   type pgtable_t is new System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:332

   procedure set_nx;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:335
   pragma Import (CPP, set_nx, "_Z6set_nxv");

   nx_enabled : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:336
   pragma Import (C, nx_enabled, "nx_enabled");

   function pgprot_writecombine (prot : pgprot_t) return pgprot_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:339
   pragma Import (CPP, pgprot_writecombine, "_Z19pgprot_writecombine6pgprot");

  -- Indicate that x86 has its own track and untrack pfn vma functions  
   --  skipped empty struct file

   function phys_mem_access_prot
     (the_file : System.Address;
      pfn : unsigned_long;
      size : unsigned_long;
      vma_prot : pgprot_t) return pgprot_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:346
   pragma Import (CPP, phys_mem_access_prot, "_Z20phys_mem_access_protP4filemm6pgprot");

   function phys_mem_access_prot_allowed
     (the_file : System.Address;
      pfn : unsigned_long;
      size : unsigned_long;
      vma_prot : access pgprot_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:348
   pragma Import (CPP, phys_mem_access_prot_allowed, "_Z28phys_mem_access_prot_allowedP4filemmP6pgprot");

  -- Install a pte for a particular vaddr in kernel space.  
   procedure set_pte_vaddr (vaddr : unsigned_long; pte : asm_pgtable_64_types_h.pte_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:352
   pragma Import (CPP, set_pte_vaddr, "_Z13set_pte_vaddrm5pte_t");

   --  skipped empty struct seq_file

   procedure arch_report_meminfo (m : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:361
   pragma Import (CPP, arch_report_meminfo, "_Z19arch_report_meminfoP8seq_file");

   type pg_level is 
     (PG_LEVEL_NONE,
      PG_LEVEL_4K,
      PG_LEVEL_2M,
      PG_LEVEL_1G,
      PG_LEVEL_NUM);
   pragma Convention (C, pg_level);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:363

   procedure update_page_count (level : int; pages : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:372
   pragma Import (CPP, update_page_count, "_Z17update_page_countim");

  -- * Helper function that returns the kernel pagetable entry controlling
  -- * the virtual address 'address'. NULL means no pagetable entry present.
  -- * NOTE: the return type is pte_t but if the pmd is PSE then we return it
  -- * as a pte too.
  --  

   function lookup_address (address : unsigned_long; level : access unsigned) return access asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:383
   pragma Import (CPP, lookup_address, "_Z14lookup_addressmPj");

   function lookup_address_in_pgd
     (pgd : access pgd_t;
      address : unsigned_long;
      level : access unsigned) return access asm_pgtable_64_types_h.pte_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:384
   pragma Import (CPP, lookup_address_in_pgd, "_Z21lookup_address_in_pgdP5pgd_tmPj");

   function slow_virt_to_phys (uu_address : System.Address) return linux_types_h.phys_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:386
   pragma Import (CPP, slow_virt_to_phys, "_Z17slow_virt_to_physPv");

   function kernel_map_pages_in_pgd
     (pgd : access pgd_t;
      pfn : asm_generic_int_ll64_h.u64;
      address : unsigned_long;
      numpages : unsigned;
      page_flags : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:387
   pragma Import (CPP, kernel_map_pages_in_pgd, "_Z23kernel_map_pages_in_pgdP5pgd_tymjm");

   procedure kernel_unmap_pages_in_pgd
     (root : access pgd_t;
      address : unsigned_long;
      numpages : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pgtable_types.h:389
   pragma Import (CPP, kernel_unmap_pages_in_pgd, "_Z25kernel_unmap_pages_in_pgdP5pgd_tmj");

end asm_pgtable_types_h;

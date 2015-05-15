pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_mm_types_h;
with asm_generic_int_ll64_h;

package linux_page_flags_h is

   --  unsupported macro: TESTPAGEFLAG(uname,lname) static inline int Page ##uname(const struct page *page) { return test_bit(PG_ ##lname, &page->flags); }
   --  unsupported macro: SETPAGEFLAG(uname,lname) static inline void SetPage ##uname(struct page *page) { set_bit(PG_ ##lname, &page->flags); }
   --  unsupported macro: CLEARPAGEFLAG(uname,lname) static inline void ClearPage ##uname(struct page *page) { clear_bit(PG_ ##lname, &page->flags); }
   --  unsupported macro: TESTSETFLAG(uname,lname) static inline int TestSetPage ##uname(struct page *page) { return test_and_set_bit(PG_ ##lname, &page->flags); }
   --  unsupported macro: TESTCLEARFLAG(uname,lname) static inline int TestClearPage ##uname(struct page *page) { return test_and_clear_bit(PG_ ##lname, &page->flags); }
   --  arg-macro: procedure PAGEFLAG TESTPAGEFLAG(uname, lname) SETPAGEFLAG(uname, lname) CLEARPAGEFLAG(uname, lname)
   --    TESTPAGEFLAG(uname, lname) SETPAGEFLAG(uname, lname) CLEARPAGEFLAG(uname, lname)
   --  unsupported macro: PAGEFLAG_FALSE(uname) static inline int Page ##uname(const struct page *page) { return 0; }
   --  arg-macro: procedure TESTSCFLAG TESTSETFLAG(uname, lname) TESTCLEARFLAG(uname, lname)
   --    TESTSETFLAG(uname, lname) TESTCLEARFLAG(uname, lname)
   --  unsupported macro: SETPAGEFLAG_NOOP(uname) static inline void SetPage ##uname(struct page *page) { }
   --  unsupported macro: CLEARPAGEFLAG_NOOP(uname) static inline void ClearPage ##uname(struct page *page) { }
   --  unsupported macro: TESTCLEARFLAG_FALSE(uname) static inline int TestClearPage ##uname(struct page *page) { return 0; }
   --  arg-macro: procedure test_set_page_writeback __test_set_page_writeback(page, false)
   --    __test_set_page_writeback(page, false)
   --  arg-macro: procedure test_set_page_writeback_keepwrite __test_set_page_writeback(page, true)
   --    __test_set_page_writeback(page, true)
   --  unsupported macro: PG_head_mask ((1L << PG_head))
   --  unsupported macro: PAGE_FLAGS_CHECK_AT_FREE (1 << PG_lru | 1 << PG_locked | 1 << PG_private | 1 << PG_private_2 | 1 << PG_writeback | 1 << PG_reserved | 1 << PG_slab | 1 << PG_swapcache | 1 << PG_active | 1 << PG_unevictable | __PG_MLOCKED | __PG_HWPOISON | __PG_COMPOUND_LOCK)
   --  unsupported macro: PAGE_FLAGS_CHECK_AT_PREP ((1 << NR_PAGEFLAGS) - 1)
   --  unsupported macro: PAGE_FLAGS_PRIVATE (1 << PG_private | 1 << PG_private_2)
  -- * Macros for manipulating and testing page->flags
  --  

  -- * Various page->flags bits:
  -- *
  -- * PG_reserved is set for special pages, which can never be swapped out. Some
  -- * of them might not even exist (eg empty_bad_page)...
  -- *
  -- * The PG_private bitflag is set on pagecache pages if they contain filesystem
  -- * specific data (which is normally at page->private). It can be used by
  -- * private allocations for its own usage.
  -- *
  -- * During initiation of disk I/O, PG_locked is set. This bit is set before I/O
  -- * and cleared when writeback _starts_ or when read _completes_. PG_writeback
  -- * is set before writeback starts and cleared when it finishes.
  -- *
  -- * PG_locked also pins a page in pagecache, and blocks truncation of the file
  -- * while it is held.
  -- *
  -- * page_waitqueue(page) is a wait queue of all tasks waiting for the page
  -- * to become unlocked.
  -- *
  -- * PG_uptodate tells whether the page's contents is valid.  When a read
  -- * completes, the page becomes uptodate, unless a disk I/O error happened.
  -- *
  -- * PG_referenced, PG_reclaim are used for page reclaim for anonymous and
  -- * file-backed pagecache (see mm/vmscan.c).
  -- *
  -- * PG_error is set to indicate that an I/O error occurred on this page.
  -- *
  -- * PG_arch_1 is an architecture specific page state bit.  The generic code
  -- * guarantees that this bit is cleared for a page when it first is entered into
  -- * the page cache.
  -- *
  -- * PG_highmem pages are not permanently mapped into the kernel virtual address
  -- * space, they need to be kmapped separately for doing IO on the pages.  The
  -- * struct page (these bits with information) are always mapped into kernel
  -- * address space...
  -- *
  -- * PG_hwpoison indicates that a page got corrupted in hardware and contains
  -- * data with incorrect ECC bits that triggered a machine check. Accessing is
  -- * not safe since it may cause another machine check. Don't touch!
  --  

  -- * Don't use the *_dontuse flags.  Use the macros.  Otherwise you'll break
  -- * locked- and dirty-page accounting.
  -- *
  -- * The page flags field is split into two parts, the main flags area
  -- * which extends from the low bits upwards, and the fields area which
  -- * extends from the high bits downwards.
  -- *
  -- *  | FIELD | ... | FLAGS |
  -- *  N-1           ^       0
  -- *               (NR_PAGEFLAGS)
  -- *
  -- * The fields area is reserved for fields mapping zone, node (for NUMA) and
  -- * SPARSEMEM section (for variants of SPARSEMEM that require section ids like
  -- * SPARSEMEM_EXTREME with !SPARSEMEM_VMEMMAP).
  --  

   subtype pageflags is unsigned;
   PG_locked : constant pageflags := 0;
   PG_error : constant pageflags := 1;
   PG_referenced : constant pageflags := 2;
   PG_uptodate : constant pageflags := 3;
   PG_dirty : constant pageflags := 4;
   PG_lru : constant pageflags := 5;
   PG_active : constant pageflags := 6;
   PG_slab : constant pageflags := 7;
   PG_owner_priv_1 : constant pageflags := 8;
   PG_arch_1 : constant pageflags := 9;
   PG_reserved : constant pageflags := 10;
   PG_private : constant pageflags := 11;
   PG_private_2 : constant pageflags := 12;
   PG_writeback : constant pageflags := 13;
   PG_head : constant pageflags := 14;
   PG_tail : constant pageflags := 15;
   PG_swapcache : constant pageflags := 16;
   PG_mappedtodisk : constant pageflags := 17;
   PG_reclaim : constant pageflags := 18;
   PG_swapbacked : constant pageflags := 19;
   PG_unevictable : constant pageflags := 20;
   PG_mlocked : constant pageflags := 21;
   PG_uncached : constant pageflags := 22;
   PG_hwpoison : constant pageflags := 23;
   PG_compound_lock : constant pageflags := 24;
   uu_NR_PAGEFLAGS : constant pageflags := 25;
   PG_checked : constant pageflags := 8;
   PG_fscache : constant pageflags := 12;
   PG_pinned : constant pageflags := 8;
   PG_savepinned : constant pageflags := 4;
   PG_slob_free : constant pageflags := 11;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:74

  -- Page is locked. Don't touch.  
  -- Owner use. If pagecache, fs may use 
  -- If pagecache, has fs-private data  
  -- If pagecache, has fs aux data  
  -- Page is under writeback  
  -- A head page  
  -- A tail page  
  -- A compound page  
  -- Swap page: swp_entry_t in private  
  -- Has blocks allocated on-disk  
  -- To be reclaimed asap  
  -- Page is backed by RAM/swap  
  -- Page is "unevictable"   
  -- Page is vma mlocked  
  -- Page has been mapped as uncached  
  -- hardware poisoned page. Don't touch  
  -- Filesystems  
  -- Two page bits are conscripted by FS-Cache to maintain local caching
  --	 * state.  These bits are set on pages belonging to the netfs's inodes
  --	 * when those inodes are being locally cached.
  --	  

  -- page backed by cache  
  -- XEN  
  -- SLOB  
  -- * Macros to create function definitions for page flags
  --  

  -- forward declaration  
   function PageLocked (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:198
   pragma Import (CPP, PageLocked, "_ZL10PageLockedPK4page");

   procedure ClearPageError (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:199
   pragma Import (CPP, ClearPageError, "_ZL14ClearPageErrorP4page");

   procedure SetPageError (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:199
   pragma Import (CPP, SetPageError, "_ZL12SetPageErrorP4page");

   function PageError (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:199
   pragma Import (CPP, PageError, "_ZL9PageErrorPK4page");

   function TestClearPageError (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:199
   pragma Import (CPP, TestClearPageError, "_ZL18TestClearPageErrorP4page");

   procedure ClearPageReferenced (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:200
   pragma Import (CPP, ClearPageReferenced, "_ZL19ClearPageReferencedP4page");

   procedure SetPageReferenced (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:200
   pragma Import (CPP, SetPageReferenced, "_ZL17SetPageReferencedP4page");

   function PageReferenced (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:200
   pragma Import (CPP, PageReferenced, "_ZL14PageReferencedPK4page");

   function TestClearPageReferenced (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:200
   pragma Import (CPP, TestClearPageReferenced, "_ZL23TestClearPageReferencedP4page");

   --  skipped func __SetPageReferenced

   procedure ClearPageDirty (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:202
   pragma Import (CPP, ClearPageDirty, "_ZL14ClearPageDirtyP4page");

   procedure SetPageDirty (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:202
   pragma Import (CPP, SetPageDirty, "_ZL12SetPageDirtyP4page");

   function PageDirty (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:202
   pragma Import (CPP, PageDirty, "_ZL9PageDirtyPK4page");

   function TestClearPageDirty (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:202
   pragma Import (CPP, TestClearPageDirty, "_ZL18TestClearPageDirtyP4page");

   function TestSetPageDirty (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:202
   pragma Import (CPP, TestSetPageDirty, "_ZL16TestSetPageDirtyP4page");

   --  skipped func __ClearPageDirty

   procedure ClearPageLRU (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:203
   pragma Import (CPP, ClearPageLRU, "_ZL12ClearPageLRUP4page");

   procedure SetPageLRU (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:203
   pragma Import (CPP, SetPageLRU, "_ZL10SetPageLRUP4page");

   function PageLRU (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:203
   pragma Import (CPP, PageLRU, "_ZL7PageLRUPK4page");

   --  skipped func __ClearPageLRU

   procedure ClearPageActive (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:204
   pragma Import (CPP, ClearPageActive, "_ZL15ClearPageActiveP4page");

   procedure SetPageActive (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:204
   pragma Import (CPP, SetPageActive, "_ZL13SetPageActiveP4page");

   function PageActive (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:204
   pragma Import (CPP, PageActive, "_ZL10PageActivePK4page");

   --  skipped func __ClearPageActive

   function TestClearPageActive (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:205
   pragma Import (CPP, TestClearPageActive, "_ZL19TestClearPageActiveP4page");

   --  skipped func __ClearPageSlab

   --  skipped func __SetPageSlab

   function PageSlab (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:206
   pragma Import (CPP, PageSlab, "_ZL8PageSlabPK4page");

  -- Used by some filesystems  
   procedure ClearPageChecked (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:207
   pragma Import (CPP, ClearPageChecked, "_ZL16ClearPageCheckedP4page");

   procedure SetPageChecked (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:207
   pragma Import (CPP, SetPageChecked, "_ZL14SetPageCheckedP4page");

   function PageChecked (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:207
   pragma Import (CPP, PageChecked, "_ZL11PageCheckedPK4page");

  -- Xen  
   procedure ClearPagePinned (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:208
   pragma Import (CPP, ClearPagePinned, "_ZL15ClearPagePinnedP4page");

   procedure SetPagePinned (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:208
   pragma Import (CPP, SetPagePinned, "_ZL13SetPagePinnedP4page");

   function PagePinned (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:208
   pragma Import (CPP, PagePinned, "_ZL10PagePinnedPK4page");

   function TestClearPagePinned (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:208
   pragma Import (CPP, TestClearPagePinned, "_ZL19TestClearPagePinnedP4page");

   function TestSetPagePinned (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:208
   pragma Import (CPP, TestSetPagePinned, "_ZL17TestSetPagePinnedP4page");

  -- Xen  
   procedure ClearPageSavePinned (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:209
   pragma Import (CPP, ClearPageSavePinned, "_ZL19ClearPageSavePinnedP4page");

   procedure SetPageSavePinned (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:209
   pragma Import (CPP, SetPageSavePinned, "_ZL17SetPageSavePinnedP4page");

   function PageSavePinned (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:209
   pragma Import (CPP, PageSavePinned, "_ZL14PageSavePinnedPK4page");

   procedure ClearPageReserved (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:210
   pragma Import (CPP, ClearPageReserved, "_ZL17ClearPageReservedP4page");

   procedure SetPageReserved (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:210
   pragma Import (CPP, SetPageReserved, "_ZL15SetPageReservedP4page");

   function PageReserved (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:210
   pragma Import (CPP, PageReserved, "_ZL12PageReservedPK4page");

   --  skipped func __ClearPageReserved

   procedure ClearPageSwapBacked (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:211
   pragma Import (CPP, ClearPageSwapBacked, "_ZL19ClearPageSwapBackedP4page");

   procedure SetPageSwapBacked (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:211
   pragma Import (CPP, SetPageSwapBacked, "_ZL17SetPageSwapBackedP4page");

   function PageSwapBacked (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:211
   pragma Import (CPP, PageSwapBacked, "_ZL14PageSwapBackedPK4page");

   --  skipped func __ClearPageSwapBacked

   --  skipped func __SetPageSwapBacked

   --  skipped func __ClearPageSlobFree

   --  skipped func __SetPageSlobFree

   function PageSlobFree (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:214
   pragma Import (CPP, PageSlobFree, "_ZL12PageSlobFreePK4page");

  -- * Private page markings that may be used by the filesystem that owns the page
  -- * for its own purposes.
  -- * - PG_private and PG_private_2 cause releasepage() and co to be invoked
  --  

   procedure ClearPagePrivate (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:221
   pragma Import (CPP, ClearPagePrivate, "_ZL16ClearPagePrivateP4page");

   procedure SetPagePrivate (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:221
   pragma Import (CPP, SetPagePrivate, "_ZL14SetPagePrivateP4page");

   function PagePrivate (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:221
   pragma Import (CPP, PagePrivate, "_ZL11PagePrivatePK4page");

   --  skipped func __SetPagePrivate

   --  skipped func __ClearPagePrivate

   procedure ClearPagePrivate2 (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:223
   pragma Import (CPP, ClearPagePrivate2, "_ZL17ClearPagePrivate2P4page");

   procedure SetPagePrivate2 (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:223
   pragma Import (CPP, SetPagePrivate2, "_ZL15SetPagePrivate2P4page");

   function PagePrivate2 (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:223
   pragma Import (CPP, PagePrivate2, "_ZL12PagePrivate2PK4page");

   function TestClearPagePrivate2 (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:223
   pragma Import (CPP, TestClearPagePrivate2, "_ZL21TestClearPagePrivate2P4page");

   function TestSetPagePrivate2 (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:223
   pragma Import (CPP, TestSetPagePrivate2, "_ZL19TestSetPagePrivate2P4page");

   procedure ClearPageOwnerPriv1 (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:224
   pragma Import (CPP, ClearPageOwnerPriv1, "_ZL19ClearPageOwnerPriv1P4page");

   procedure SetPageOwnerPriv1 (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:224
   pragma Import (CPP, SetPageOwnerPriv1, "_ZL17SetPageOwnerPriv1P4page");

   function PageOwnerPriv1 (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:224
   pragma Import (CPP, PageOwnerPriv1, "_ZL14PageOwnerPriv1PK4page");

   function TestClearPageOwnerPriv1 (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:224
   pragma Import (CPP, TestClearPageOwnerPriv1, "_ZL23TestClearPageOwnerPriv1P4page");

  -- * Only test-and-set exist for PG_writeback.  The unconditional operators are
  -- * risky: they bypass page accounting.
  --  

   function PageWriteback (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:230
   pragma Import (CPP, PageWriteback, "_ZL13PageWritebackPK4page");

   function TestClearPageWriteback (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:230
   pragma Import (CPP, TestClearPageWriteback, "_ZL22TestClearPageWritebackP4page");

   function TestSetPageWriteback (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:230
   pragma Import (CPP, TestSetPageWriteback, "_ZL20TestSetPageWritebackP4page");

   procedure ClearPageMappedToDisk (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:231
   pragma Import (CPP, ClearPageMappedToDisk, "_ZL21ClearPageMappedToDiskP4page");

   procedure SetPageMappedToDisk (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:231
   pragma Import (CPP, SetPageMappedToDisk, "_ZL19SetPageMappedToDiskP4page");

   function PageMappedToDisk (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:231
   pragma Import (CPP, PageMappedToDisk, "_ZL16PageMappedToDiskPK4page");

  -- PG_readahead is only used for reads; PG_reclaim is only for writes  
   procedure ClearPageReclaim (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:234
   pragma Import (CPP, ClearPageReclaim, "_ZL16ClearPageReclaimP4page");

   procedure SetPageReclaim (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:234
   pragma Import (CPP, SetPageReclaim, "_ZL14SetPageReclaimP4page");

   function PageReclaim (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:234
   pragma Import (CPP, PageReclaim, "_ZL11PageReclaimPK4page");

   function TestClearPageReclaim (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:234
   pragma Import (CPP, TestClearPageReclaim, "_ZL20TestClearPageReclaimP4page");

   procedure ClearPageReadahead (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:235
   pragma Import (CPP, ClearPageReadahead, "_ZL18ClearPageReadaheadP4page");

   procedure SetPageReadahead (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:235
   pragma Import (CPP, SetPageReadahead, "_ZL16SetPageReadaheadP4page");

   function PageReadahead (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:235
   pragma Import (CPP, PageReadahead, "_ZL13PageReadaheadPK4page");

   function TestClearPageReadahead (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:235
   pragma Import (CPP, TestClearPageReadahead, "_ZL22TestClearPageReadaheadP4page");

  -- * Must use a macro here due to header dependency issues. page_zone() is not
  -- * available at this point.
  --  

   function PageHighMem (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:244
   pragma Import (CPP, PageHighMem, "_ZL11PageHighMemPK4page");

   procedure ClearPageSwapCache (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:248
   pragma Import (CPP, ClearPageSwapCache, "_ZL18ClearPageSwapCacheP4page");

   procedure SetPageSwapCache (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:248
   pragma Import (CPP, SetPageSwapCache, "_ZL16SetPageSwapCacheP4page");

   function PageSwapCache (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:248
   pragma Import (CPP, PageSwapCache, "_ZL13PageSwapCachePK4page");

   procedure ClearPageUnevictable (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:254
   pragma Import (CPP, ClearPageUnevictable, "_ZL20ClearPageUnevictableP4page");

   procedure SetPageUnevictable (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:254
   pragma Import (CPP, SetPageUnevictable, "_ZL18SetPageUnevictableP4page");

   function PageUnevictable (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:254
   pragma Import (CPP, PageUnevictable, "_ZL15PageUnevictablePK4page");

   --  skipped func __ClearPageUnevictable

   function TestClearPageUnevictable (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:255
   pragma Import (CPP, TestClearPageUnevictable, "_ZL24TestClearPageUnevictableP4page");

   procedure ClearPageMlocked (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:258
   pragma Import (CPP, ClearPageMlocked, "_ZL16ClearPageMlockedP4page");

   procedure SetPageMlocked (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:258
   pragma Import (CPP, SetPageMlocked, "_ZL14SetPageMlockedP4page");

   function PageMlocked (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:258
   pragma Import (CPP, PageMlocked, "_ZL11PageMlockedPK4page");

   --  skipped func __ClearPageMlocked

   function TestClearPageMlocked (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:259
   pragma Import (CPP, TestClearPageMlocked, "_ZL20TestClearPageMlockedP4page");

   function TestSetPageMlocked (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:259
   pragma Import (CPP, TestSetPageMlocked, "_ZL18TestSetPageMlockedP4page");

   --  skipped func __TestClearPageMlocked

   procedure ClearPageUncached (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:266
   pragma Import (CPP, ClearPageUncached, "_ZL17ClearPageUncachedP4page");

   procedure SetPageUncached (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:266
   pragma Import (CPP, SetPageUncached, "_ZL15SetPageUncachedP4page");

   function PageUncached (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:266
   pragma Import (CPP, PageUncached, "_ZL12PageUncachedPK4page");

   procedure ClearPageHWPoison (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:272
   pragma Import (CPP, ClearPageHWPoison, "_ZL17ClearPageHWPoisonP4page");

   procedure SetPageHWPoison (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:272
   pragma Import (CPP, SetPageHWPoison, "_ZL15SetPageHWPoisonP4page");

   function PageHWPoison (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:272
   pragma Import (CPP, PageHWPoison, "_ZL12PageHWPoisonPK4page");

   function TestClearPageHWPoison (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:273
   pragma Import (CPP, TestClearPageHWPoison, "_ZL21TestClearPageHWPoisonP4page");

   function TestSetPageHWPoison (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:273
   pragma Import (CPP, TestSetPageHWPoison, "_ZL19TestSetPageHWPoisonP4page");

   function stable_page_flags (the_page : access linux_mm_types_h.page) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:280
   pragma Import (CPP, stable_page_flags, "_Z17stable_page_flagsP4page");

   function PageUptodate (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:282
   pragma Import (CPP, PageUptodate, "_ZL12PageUptodateP4page");

  --	 * Must ensure that the data we read out of the page is loaded
  --	 * _after_ we've loaded page->flags to check for PageUptodate.
  --	 * We can skip the barrier if the page is not uptodate, because
  --	 * we wouldn't be reading anything from it.
  --	 *
  --	 * See SetPageUptodate() for the other side of the story.
  --	  

   --  skipped func __SetPageUptodate

   procedure SetPageUptodate (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:306
   pragma Import (CPP, SetPageUptodate, "_ZL15SetPageUptodateP4page");

  --	 * Memory barrier must be issued before setting the PG_uptodate bit,
  --	 * so that all previous stores issued in order to bring the page
  --	 * uptodate are actually visible before PageUptodate becomes true.
  --	  

   procedure ClearPageUptodate (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:317
   pragma Import (CPP, ClearPageUptodate, "_ZL17ClearPageUptodateP4page");

   procedure cancel_dirty_page (the_page : access linux_mm_types_h.page; account_size : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:319
   pragma Import (CPP, cancel_dirty_page, "_Z17cancel_dirty_pageP4pagej");

   function test_clear_page_writeback (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:321
   pragma Import (CPP, test_clear_page_writeback, "_Z25test_clear_page_writebackP4page");

   --  skipped func __test_set_page_writeback

   procedure set_page_writeback (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:329
   pragma Import (CPP, set_page_writeback, "_ZL18set_page_writebackP4page");

   procedure set_page_writeback_keepwrite (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:334
   pragma Import (CPP, set_page_writeback_keepwrite, "_ZL28set_page_writeback_keepwriteP4page");

  -- * System with lots of page flags available. This allows separate
  -- * flags for PageHead() and PageTail() checks of compound pages so that bit
  -- * tests can be used in performance sensitive paths. PageCompound is
  -- * generally not used in hot code paths except arch/powerpc/mm/init_64.c
  -- * and arch/powerpc/kvm/book3s_64_vio_hv.c which use it to detect huge pages
  -- * and avoid handling those in real mode.
  --  

   --  skipped func __ClearPageHead

   --  skipped func __SetPageHead

   function PageHead (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:348
   pragma Import (CPP, PageHead, "_ZL8PageHeadPK4page");

   procedure ClearPageHead (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:348
   pragma Import (CPP, ClearPageHead, "_ZL13ClearPageHeadP4page");

   --  skipped func __ClearPageTail

   --  skipped func __SetPageTail

   function PageTail (the_page : access constant linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:349
   pragma Import (CPP, PageTail, "_ZL8PageTailPK4page");

   function PageCompound (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:351
   pragma Import (CPP, PageCompound, "_ZL12PageCompoundP4page");

   procedure ClearPageCompound (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:357
   pragma Import (CPP, ClearPageCompound, "_ZL17ClearPageCompoundP4page");

  -- * Reduce page flag use as much as possible by overlapping
  -- * compound page flags with the flags used for page cache pages. Possible
  -- * because PageCompound is always set for compound pages and not for
  -- * pages on the LRU and/or pagecache.
  --  

  -- * PG_reclaim is used in combination with PG_compound to mark the
  -- * head and tail of a compound page. This saves one page flag
  -- * but makes it impossible to use compound pages for the page cache.
  -- * The PG_reclaim bit would have to be used for reclaim or readahead
  -- * if compound pages enter the page cache.
  -- *
  -- * PG_compound & PG_reclaim	=> Tail page
  -- * PG_compound & ~PG_reclaim	=> Head page
  --  

  -- * PageHuge() only returns true for hugetlbfs pages, but not for
  -- * normal or transparent huge pages.
  -- *
  -- * PageTransHuge() returns true for both transparent huge and
  -- * hugetlbfs pages, but not normal pages. PageTransHuge() can only be
  -- * called only in the core VM paths where hugetlbfs pages can't exist.
  --  

   function PageTransHuge (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:428
   pragma Import (CPP, PageTransHuge, "_ZL13PageTransHugeP4page");

  -- * PageTransCompound returns true for both transparent huge pages
  -- * and hugetlbfs pages, so it should only be called when it's known
  -- * that hugetlbfs pages aren't involved.
  --  

   function PageTransCompound (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:439
   pragma Import (CPP, PageTransCompound, "_ZL17PageTransCompoundP4page");

  -- * PageTransTail returns true for both transparent huge pages
  -- * and hugetlbfs pages, so it should only be called when it's known
  -- * that hugetlbfs pages aren't involved.
  --  

   function PageTransTail (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:449
   pragma Import (CPP, PageTransTail, "_ZL13PageTransTailP4page");

  -- * If network-based swap is enabled, sl*b must keep track of whether pages
  -- * were allocated from pfmemalloc reserves.
  --  

   function PageSlabPfmemalloc (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:476
   pragma Import (CPP, PageSlabPfmemalloc, "_ZL18PageSlabPfmemallocP4page");

   procedure SetPageSlabPfmemalloc (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:482
   pragma Import (CPP, SetPageSlabPfmemalloc, "_ZL21SetPageSlabPfmemallocP4page");

   --  skipped func __ClearPageSlabPfmemalloc

   procedure ClearPageSlabPfmemalloc (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:494
   pragma Import (CPP, ClearPageSlabPfmemalloc, "_ZL23ClearPageSlabPfmemallocP4page");

  -- * Flags checked when a page is freed.  Pages being freed should not have
  -- * these flags set.  It they are, there is a problem.
  --  

  -- * Flags checked when a page is prepped for return by the page allocator.
  -- * Pages being prepped should not have any flags set.  It they are set,
  -- * there has been a kernel bug or struct page corruption.
  --  

  --*
  -- * page_has_private - Determine if page has private stuff
  -- * @page: The page to be checked
  -- *
  -- * Determine if a page has private stuff, indicating that release routines
  -- * should be invoked upon it.
  --  

   function page_has_private (the_page : access linux_mm_types_h.page) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-flags.h:540
   pragma Import (CPP, page_has_private, "_ZL16page_has_privateP4page");

end linux_page_flags_h;

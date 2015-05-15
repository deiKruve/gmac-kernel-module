pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_page_debug_flags_h is

  -- * page->debug_flags bits:
  -- *
  -- * PAGE_DEBUG_FLAG_POISON is set for poisoned pages. This is used to
  -- * implement generic debug pagealloc feature. The pages are filled with
  -- * poison patterns and set this flag after free_pages(). The poisoned
  -- * pages are verified whether the patterns are not corrupted and clear
  -- * the flag before alloc_pages().
  --  

   type page_debug_flags is 
     (PAGE_DEBUG_FLAG_POISON,
      PAGE_DEBUG_FLAG_GUARD);
   pragma Convention (C, page_debug_flags);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/page-debug-flags.h:14

  -- Page is poisoned  
  -- * Ensure that CONFIG_WANT_PAGE_DEBUG_FLAGS reliably
  -- * gets turned off when no debug features are enabling it!
  --  

end linux_page_debug_flags_h;

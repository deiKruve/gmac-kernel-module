pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_mm_types_h;
with Interfaces.C.Strings;

package linux_mmdebug_h is

   --  unsupported macro: LINUX_MM_DEBUG_H 1
   --  arg-macro: procedure VM_BUG_ON BUILD_BUG_ON_INVALID(cond)
   --    BUILD_BUG_ON_INVALID(cond)
   --  arg-macro: procedure VM_BUG_ON_PAGE VM_BUG_ON(cond)
   --    VM_BUG_ON(cond)
   --  arg-macro: procedure VM_WARN_ON BUILD_BUG_ON_INVALID(cond)
   --    BUILD_BUG_ON_INVALID(cond)
   --  arg-macro: procedure VM_WARN_ON_ONCE BUILD_BUG_ON_INVALID(cond)
   --    BUILD_BUG_ON_INVALID(cond)
   --  arg-macro: procedure VIRTUAL_BUG_ON do { } while (0)
   --    do { } while (0)
   procedure dump_page (the_page : access linux_mm_types_h.page; reason : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmdebug.h:8
   pragma Import (CPP, dump_page, "_Z9dump_pageP4pagePKc");

   procedure dump_page_badflags
     (the_page : access linux_mm_types_h.page;
      reason : Interfaces.C.Strings.chars_ptr;
      badflags : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/mmdebug.h:9
   pragma Import (CPP, dump_page_badflags, "_Z18dump_page_badflagsP4pagePKcm");

end linux_mmdebug_h;

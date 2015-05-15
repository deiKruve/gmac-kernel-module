pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_generic_bug_h;
limited with asm_ptrace_h;

package linux_bug_h is

   --  arg-macro: procedure BUILD_BUG_ON_NOT_POWER_OF_2 BUILD_BUG_ON((n) = 0  or else  (((n) and ((n) - 1)) /= 0))
   --    BUILD_BUG_ON((n) = 0  or else  (((n) and ((n) - 1)) /= 0))
   --  arg-macro: function BUILD_BUG_ON_ZERO (sizeof(struct { int:-notnot(e); })
   --    return sizeof(struct { int:-notnot(e); });
   --  arg-macro: function BUILD_BUG_ON_NULL ((void *)sizeof(struct { int:-notnot(e); })
   --    return (void *)sizeof(struct { int:-notnot(e); });
   --  arg-macro: function BUILD_BUG_ON_INVALID ((void)(sizeof((__force long)(e)))
   --    return (void)(sizeof((__force long)(e)));
   --  arg-macro: procedure BUILD_BUG_ON_MSG compiletime_assert(not(cond), msg)
   --    compiletime_assert(not(cond), msg)
   --  unsupported macro: BUILD_BUG_ON(condition) BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
   --  arg-macro: procedure BUILD_BUG BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
   --    BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
   type bug_trap_type is 
     (BUG_TRAP_TYPE_NONE,
      BUG_TRAP_TYPE_WARN,
      BUG_TRAP_TYPE_BUG);
   pragma Convention (C, bug_trap_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bug.h:7

  -- Force a compilation error if a constant expression is not a power of 2  
  -- Force a compilation error if condition is true, but also produce a
  --   result (of value 0 and type size_t), so the expression can be used
  --   e.g. in a structure initializer (or where-ever else comma expressions
  --   aren't permitted).  

  -- * BUILD_BUG_ON_INVALID() permits the compiler to check the validity of the
  -- * expression but avoids the generation of any code, even if that expression
  -- * has side-effects.
  --  

  --*
  -- * BUILD_BUG_ON_MSG - break compile if a condition is true & emit supplied
  -- *		      error message.
  -- * @condition: the condition which the compiler should know is false.
  -- *
  -- * See BUILD_BUG_ON for description.
  --  

  --*
  -- * BUILD_BUG_ON - break compile if a condition is true.
  -- * @condition: the condition which the compiler should know is false.
  -- *
  -- * If you have some code which relies on certain constants being equal, or
  -- * some other compile-time-evaluated condition, you should use BUILD_BUG_ON to
  -- * detect if someone changes it.
  -- *
  -- * The implementation uses gcc's reluctance to create a negative array, but gcc
  -- * (as of 4.4) only emits that error for obvious cases (e.g. not arguments to
  -- * inline functions).  Luckily, in 4.3 they added the "error" function
  -- * attribute just for this type of case.  Thus, we use a negative sized array
  -- * (should always create an error on gcc versions older than 4.4) and then call
  -- * an undefined function with the error attribute (should always create an
  -- * error on gcc 4.3 and later).  If for some reason, neither creates a
  -- * compile-time error, we'll still have a link-time error, which is harder to
  -- * track down.
  --  

  --*
  -- * BUILD_BUG - break compile if used.
  -- *
  -- * If you have some code that you expect the compiler to eliminate at
  -- * build time, you should use BUILD_BUG to detect if it is
  -- * unexpectedly used.
  --  

   function is_warning_bug (bug : access constant asm_generic_bug_h.bug_entry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bug.h:91
   pragma Import (CPP, is_warning_bug, "_ZL14is_warning_bugPK9bug_entry");

   function find_bug (bugaddr : unsigned_long) return access constant asm_generic_bug_h.bug_entry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bug.h:96
   pragma Import (CPP, find_bug, "_Z8find_bugm");

   function report_bug (bug_addr : unsigned_long; regs : access asm_ptrace_h.pt_regs) return bug_trap_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bug.h:98
   pragma Import (CPP, report_bug, "_Z10report_bugmP7pt_regs");

  -- These are defined by the architecture  
   function is_valid_bugaddr (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bug.h:101
   pragma Import (CPP, is_valid_bugaddr, "_Z16is_valid_bugaddrm");

end linux_bug_h;

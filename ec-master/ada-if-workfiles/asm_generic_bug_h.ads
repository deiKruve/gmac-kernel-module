pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package asm_generic_bug_h is

   --  unsupported macro: BUGFLAG_WARNING (1 << 0)
   --  arg-macro: function BUGFLAG_TAINT (BUGFLAG_WARNING or ((taint) << 8)
   --    return BUGFLAG_WARNING or ((taint) << 8);
   --  arg-macro: function BUG_GET_TAINT ((bug).flags >> 8
   --    return (bug).flags >> 8;
   --  arg-macro: procedure BUG_ON do { if (unlikely(condition)) BUG(); } while (0)
   --    do { if (unlikely(condition)) BUG(); } while (0)
   --  arg-macro: function WARN_ON ({ int __ret_warn_on := notnot(condition); if (unlikely(__ret_warn_on)) __WARN(); unlikely(__ret_warn_on); }
   --    return { int __ret_warn_on := notnot(condition); if (unlikely(__ret_warn_on)) __WARN(); unlikely(__ret_warn_on); };
   --  unsupported macro: WARN(condition,format...) ({ int __ret_warn_on = !!(condition); if (unlikely(__ret_warn_on)) __WARN_printf(format); unlikely(__ret_warn_on); })
   --  unsupported macro: WARN_TAINT(condition,taint,format...) ({ int __ret_warn_on = !!(condition); if (unlikely(__ret_warn_on)) __WARN_printf_taint(taint, format); unlikely(__ret_warn_on); })
   --  arg-macro: function WARN_ON_ONCE ({ static bool __section(.data.unlikely) __warned; int __ret_warn_once := notnot(condition); if (unlikely(__ret_warn_once)) if (WARN_ON(not__warned)) __warned := true; unlikely(__ret_warn_once); }
   --    return { static bool __section(.data.unlikely) __warned; int __ret_warn_once := notnot(condition); if (unlikely(__ret_warn_once)) if (WARN_ON(not__warned)) __warned := true; unlikely(__ret_warn_once); };
   --  unsupported macro: WARN_ONCE(condition,format...) ({ static bool __section(.data.unlikely) __warned; int __ret_warn_once = !!(condition); if (unlikely(__ret_warn_once)) if (WARN(!__warned, format)) __warned = true; unlikely(__ret_warn_once); })
   --  unsupported macro: WARN_TAINT_ONCE(condition,taint,format...) ({ static bool __section(.data.unlikely) __warned; int __ret_warn_once = !!(condition); if (unlikely(__ret_warn_once)) if (WARN_TAINT(!__warned, taint, format)) __warned = true; unlikely(__ret_warn_once); })
   --  arg-macro: procedure WARN_ON_SMP WARN_ON(x)
   --    WARN_ON(x)
   type bug_entry is record
      bug_addr_disp : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bug.h:22
      file_disp : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bug.h:28
      line : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bug.h:30
      flags : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bug.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, bug_entry);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bug.h:18

  -- * Don't use BUG() or BUG_ON() unless there's really no way out; one
  -- * example might be detecting data structure corruption in the middle
  -- * of an operation that can't be backed out of.  If the (sub)system
  -- * can somehow continue operating, perhaps with reduced functionality,
  -- * it's probably not BUG-worthy.
  -- *
  -- * If you're tempted to BUG(), think again:  is completely giving up
  -- * really the *only* solution?  There are usually better options, where
  -- * users don't need to reboot ASAP and can mostly shut down cleanly.
  --  

  -- * WARN(), WARN_ON(), WARN_ON_ONCE, and so on can be used to report
  -- * significant issues that need prompt attention if they should ever
  -- * appear at runtime.  Use the versions with printk format strings
  -- * to provide better diagnostics.
  --  

   procedure warn_slowpath_fmt
     (file : Interfaces.C.Strings.chars_ptr;
      line : int;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      );  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bug.h:66
   pragma Import (CPP, warn_slowpath_fmt, "_Z17warn_slowpath_fmtPKciS0_z");

   procedure warn_slowpath_fmt_taint
     (file : Interfaces.C.Strings.chars_ptr;
      line : int;
      taint : unsigned;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      );  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bug.h:69
   pragma Import (CPP, warn_slowpath_fmt_taint, "_Z23warn_slowpath_fmt_taintPKcijS0_z");

   procedure warn_slowpath_null (file : Interfaces.C.Strings.chars_ptr; line : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bug.h:71
   pragma Import (CPP, warn_slowpath_null, "_Z18warn_slowpath_nullPKci");

  -- * WARN_ON_SMP() is for cases that the warning is either
  -- * meaningless for !SMP or may even cause failures.
  -- * This is usually used for cases that we have
  -- * WARN_ON(!spin_is_locked(&lock)) checks, as spin_is_locked()
  -- * returns 0 for uniprocessor settings.
  -- * It can also be used with values that are only defined
  -- * on SMP:
  -- *
  -- * struct foo {
  -- *  [...]
  -- * #ifdef CONFIG_SMP
  -- *	int bar;
  -- * #endif
  -- * };
  -- *
  -- * void func(struct foo *zoot)
  -- * {
  -- *	WARN_ON_SMP(!zoot->bar);
  -- *
  -- * For CONFIG_SMP, WARN_ON_SMP() should act the same as WARN_ON(),
  -- * and should be a nop and return false for uniprocessor.
  -- *
  -- * if (WARN_ON_SMP(x)) returns true only when CONFIG_SMP is set
  -- * and x is true.
  --  

  -- * Use of ({0;}) because WARN_ON_SMP(x) may be used either as
  -- * a stand alone line statement or as a condition in an if ()
  -- * statement.
  -- * A simple "0" would cause gcc to give a "statement has no effect"
  -- * warning.
  --  

end asm_generic_bug_h;

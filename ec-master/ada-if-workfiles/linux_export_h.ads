pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package linux_export_h is

   --  arg-macro: procedure VMLINUX_SYMBOL __VMLINUX_SYMBOL(x)
   --    __VMLINUX_SYMBOL(x)
   --  arg-macro: procedure VMLINUX_SYMBOL_STR __VMLINUX_SYMBOL_STR(x)
   --    __VMLINUX_SYMBOL_STR(x)
   --  unsupported macro: THIS_MODULE (&__this_module)
   --  arg-macro: procedure EXPORT_SYMBOL __EXPORT_SYMBOL(sym, "")
   --    __EXPORT_SYMBOL(sym, "")
   --  arg-macro: procedure EXPORT_SYMBOL_GPL __EXPORT_SYMBOL(sym, "_gpl")
   --    __EXPORT_SYMBOL(sym, "_gpl")
   --  arg-macro: procedure EXPORT_SYMBOL_GPL_FUTURE __EXPORT_SYMBOL(sym, "_gpl_future")
   --    __EXPORT_SYMBOL(sym, "_gpl_future")
   --  arg-macro: procedure EXPORT_UNUSED_SYMBOL __EXPORT_SYMBOL(sym, "_unused")
   --    __EXPORT_SYMBOL(sym, "_unused")
   --  arg-macro: procedure EXPORT_UNUSED_SYMBOL_GPL __EXPORT_SYMBOL(sym, "_unused_gpl")
   --    __EXPORT_SYMBOL(sym, "_unused_gpl")
  -- * Export symbols from the kernel to modules.  Forked from module.h
  -- * to reduce the amount of pointless cruft we feed to gcc when only
  -- * exporting a simple symbol or two.
  -- *
  -- * Try not to add #includes here.  It slows compilation and makes kernel
  -- * hackers place grumpy comments in header files.
  --  

  -- Some toolchains use a `_' prefix for all user symbols.  
  -- Indirect, so macros are expanded before pasting.  
   type kernel_symbol is record
      value : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/export.h:28
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/export.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, kernel_symbol);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/export.h:26

   --  skipped empty struct module

  -- Mark the CRC weak since genksyms apparently decides not to
  -- * generate a checksums for some symbols  

  -- For every exported symbol, place a struct in the __ksymtab section  
end linux_export_h;

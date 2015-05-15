pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package asm_special_insns_h is

   --  arg-macro: procedure stts write_cr0(read_cr0() or X86_CR0_TS)
   --    write_cr0(read_cr0() or X86_CR0_TS)
   --  arg-macro: procedure nop asm volatile ("nop")
   --    asm volatile ("nop")
   procedure native_clts;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:7
   pragma Import (CPP, native_clts, "_ZL11native_cltsv");

  -- * Volatile isn't enough to prevent the compiler from reordering the
  -- * read/write functions for the control registers and messing everything up.
  -- * A memory clobber would solve the problem, but would prevent reordering of
  -- * all loads stores around it, which can hurt performance. Solution is to
  -- * use a variable and mimic reads and writes to it to enforce serialization
  --  

   function native_read_cr0 return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:21
   pragma Import (CPP, native_read_cr0, "_ZL15native_read_cr0v");

   procedure native_write_cr0 (val : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:28
   pragma Import (CPP, native_write_cr0, "_ZL16native_write_cr0m");

   function native_read_cr2 return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:33
   pragma Import (CPP, native_read_cr2, "_ZL15native_read_cr2v");

   procedure native_write_cr2 (val : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:40
   pragma Import (CPP, native_write_cr2, "_ZL16native_write_cr2m");

   function native_read_cr3 return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:45
   pragma Import (CPP, native_read_cr3, "_ZL15native_read_cr3v");

   procedure native_write_cr3 (val : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:52
   pragma Import (CPP, native_write_cr3, "_ZL16native_write_cr3m");

   function native_read_cr4 return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:57
   pragma Import (CPP, native_read_cr4, "_ZL15native_read_cr4v");

   function native_read_cr4_safe return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:64
   pragma Import (CPP, native_read_cr4_safe, "_ZL20native_read_cr4_safev");

  -- This could fault if %cr4 does not exist. In x86_64, a cr4 always
  --	 * exists, so it will never fail.  

   procedure native_write_cr4 (val : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:80
   pragma Import (CPP, native_write_cr4, "_ZL16native_write_cr4m");

   function native_read_cr8 return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:86
   pragma Import (CPP, native_read_cr8, "_ZL15native_read_cr8v");

   procedure native_write_cr8 (val : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:93
   pragma Import (CPP, native_write_cr8, "_ZL16native_write_cr8m");

   procedure native_wbinvd;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:99
   pragma Import (CPP, native_wbinvd, "_ZL13native_wbinvdv");

  -- Clear the 'TS' bit  
   procedure clflush (uu_p : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:189
   pragma Import (CPP, clflush, "_ZL7clflushPVv");

   procedure clflushopt (uu_p : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/special_insns.h:194
   pragma Import (CPP, clflushopt, "_ZL10clflushoptPVv");

end asm_special_insns_h;

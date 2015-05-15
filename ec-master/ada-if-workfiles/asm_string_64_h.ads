pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;

package asm_string_64_h is

  -- Written 2002 by Andi Kleen  
  -- Only used for special circumstances. Stolen from i386/string.h  
   --  skipped func __inline_memcpy

  -- Even with __builtin_ the compiler may decide to use the out of line
  --   function.  

   function memcpy
     (to : System.Address;
      from : System.Address;
      len : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/string_64.h:32
   pragma Import (CPP, memcpy, "_Z6memcpyPvPKvm");

  -- * kmemcheck becomes very happy if we use the REP instructions unconditionally,
  -- * because it means that we know both memory operands in advance.
  --  

   function memset
     (s : System.Address;
      c : int;
      n : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/string_64.h:55
   pragma Import (CPP, memset, "_Z6memsetPvim");

   function memmove
     (dest : System.Address;
      src : System.Address;
      count : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/string_64.h:58
   pragma Import (CPP, memmove, "_Z7memmovePvPKvm");

end asm_string_64_h;

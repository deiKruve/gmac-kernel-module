pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_generic_sections_h is

   --  arg-macro: function dereference_function_descriptor (p
   --    return p;
  -- References to section boundaries  
  -- * Usage guidelines:
  -- * _text, _data: architecture specific, don't use them in arch-independent code
  -- * [_stext, _etext]: contains .text.* sections, may also contain .rodata.*
  -- *                   and/or .init.* sections
  -- * [_sdata, _edata]: contains .data.* sections, may also contain .rodata.*
  -- *                   and/or .init.* sections.
  -- * [__start_rodata, __end_rodata]: contains .rodata.* sections
  -- * [__init_begin, __init_end]: contains .init.* sections, but .init.text.*
  -- *                   may be out of this range on some architectures.
  -- * [_sinittext, _einittext]: contains .init.text.* sections
  -- * [__bss_start, __bss_stop]: contains BSS sections
  -- *
  -- * Following global variables are optional and may be unavailable on some
  -- * architectures and/or kernel configurations.
  -- *	_text, _data
  -- *	__kprobes_text_start, __kprobes_text_end
  -- *	__entry_text_start, __entry_text_end
  -- *	__ctors_start, __ctors_end
  --  

  -- Start and end of .ctors section - used for constructor calls.  
  -- function descriptor handling (if any).  Override
  -- * in asm/sections.h  

  -- random extra sections (if any).  Override
  -- * in asm/sections.h  

   function arch_is_kernel_text (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/sections.h:49
   pragma Import (CPP, arch_is_kernel_text, "_ZL19arch_is_kernel_textm");

   function arch_is_kernel_data (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/sections.h:56
   pragma Import (CPP, arch_is_kernel_data, "_ZL19arch_is_kernel_datam");

end asm_generic_sections_h;

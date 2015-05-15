pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_generic_fixmap_h is

   --  unsupported macro: FIXMAP_PAGE_NORMAL PAGE_KERNEL
   --  unsupported macro: FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
   --  unsupported macro: FIXMAP_PAGE_IO PAGE_KERNEL_IO
   --  unsupported macro: FIXMAP_PAGE_CLEAR __pgprot(0)
   --  arg-macro: procedure set_fixmap __set_fixmap(idx, phys, FIXMAP_PAGE_NORMAL)
   --    __set_fixmap(idx, phys, FIXMAP_PAGE_NORMAL)
   --  arg-macro: procedure clear_fixmap __set_fixmap(idx, 0, FIXMAP_PAGE_CLEAR)
   --    __set_fixmap(idx, 0, FIXMAP_PAGE_CLEAR)
   --  arg-macro: procedure set_fixmap_offset __set_fixmap_offset(idx, phys, FIXMAP_PAGE_NORMAL)
   --    __set_fixmap_offset(idx, phys, FIXMAP_PAGE_NORMAL)
   --  arg-macro: procedure set_fixmap_nocache __set_fixmap(idx, phys, FIXMAP_PAGE_NOCACHE)
   --    __set_fixmap(idx, phys, FIXMAP_PAGE_NOCACHE)
   --  arg-macro: procedure set_fixmap_offset_nocache __set_fixmap_offset(idx, phys, FIXMAP_PAGE_NOCACHE)
   --    __set_fixmap_offset(idx, phys, FIXMAP_PAGE_NOCACHE)
   --  arg-macro: procedure set_fixmap_io __set_fixmap(idx, phys, FIXMAP_PAGE_IO)
   --    __set_fixmap(idx, phys, FIXMAP_PAGE_IO)
   --  arg-macro: procedure set_fixmap_offset_io __set_fixmap_offset(idx, phys, FIXMAP_PAGE_IO)
   --    __set_fixmap_offset(idx, phys, FIXMAP_PAGE_IO)
  -- * fixmap.h: compile-time virtual memory allocation
  -- *
  -- * This file is subject to the terms and conditions of the GNU General Public
  -- * License.  See the file "COPYING" in the main directory of this archive
  -- * for more details.
  -- *
  -- * Copyright (C) 1998 Ingo Molnar
  -- *
  -- * Support of BIGMEM added by Gerhard Wichert, Siemens AG, July 1999
  -- * x86_32 and x86_64 integration by Gustavo F. Padovan, February 2009
  -- * Break out common bits to asm-generic by Mark Salter, November 2013
  --  

  -- * 'index to address' translation. If anyone tries to use the idx
  -- * directly without translation, we catch the bug with a NULL-deference
  -- * kernel oops. Illegal ranges of incoming indices are caught too.
  --  

   function fix_to_virt (idx : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/fixmap.h:29
   pragma Import (CPP, fix_to_virt, "_ZL11fix_to_virtj");

   function virt_to_fix (vaddr : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/fixmap.h:35
   pragma Import (CPP, virt_to_fix, "_ZL11virt_to_fixm");

  -- * Provide some reasonable defaults for page flags.
  -- * Not all architectures use all of these different types and some
  -- * architectures use different names.
  --  

  -- Return a pointer with offset calculated  
  -- * Some hardware wants to get fixmapped without caching.
  --  

  -- * Some fixmaps are for IO
  --  

end asm_generic_fixmap_h;

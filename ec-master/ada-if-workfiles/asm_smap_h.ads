pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_smap_h is

   --  unsupported macro: ASM_CLAC ALTERNATIVE(ASM_NOP3, __stringify(__ASM_CLAC), X86_FEATURE_SMAP)
   --  unsupported macro: ASM_STAC ALTERNATIVE(ASM_NOP3, __stringify(__ASM_STAC), X86_FEATURE_SMAP)
  -- * Supervisor Mode Access Prevention support
  -- *
  -- * Copyright (C) 2012 Intel Corporation
  -- * Author: H. Peter Anvin <hpa@linux.intel.com>
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public License
  -- * as published by the Free Software Foundation; version 2
  -- * of the License.
  --  

  -- "Raw" instruction opcodes  
   procedure clac;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smap.h:61
   pragma Import (CPP, clac, "_ZL4clacv");

  -- Note: a barrier is implicit in alternative()  
   procedure stac;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/smap.h:67
   pragma Import (CPP, stac, "_ZL4stacv");

  -- Note: a barrier is implicit in alternative()  
  -- These macros can be used in asm() statements  
end asm_smap_h;

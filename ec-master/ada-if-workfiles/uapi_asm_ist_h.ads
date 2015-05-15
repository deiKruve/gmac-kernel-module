pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_asm_ist_h is

  -- * Include file for the interface to IST BIOS
  -- * Copyright 2002 Andy Grover <andrew.grover@intel.com>
  -- *
  -- * This program is free software; you can redistribute it and/or modify it
  -- * under the terms of the GNU General Public License as published by the
  -- * Free Software Foundation; either version 2, or (at your option) any
  -- * later version.
  -- *
  -- * This program is distributed in the hope that it will be useful, but
  -- * WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  -- * General Public License for more details.
  --  

   type ist_info is record
      signature : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/ist.h:23
      command : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/ist.h:24
      event : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/ist.h:25
      perf_level : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/ist.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, ist_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/ist.h:22

end uapi_asm_ist_h;

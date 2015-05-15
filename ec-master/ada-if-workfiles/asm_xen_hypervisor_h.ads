pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with xen_interface_xen_h;
with linux_types_h;
with Interfaces.C.Extensions;

package asm_xen_hypervisor_h is

  --*****************************************************************************
  -- * hypervisor.h
  -- *
  -- * Linux-specific hypervisor handling.
  -- *
  -- * Copyright (c) 2002-2004, K A Fraser
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public License version 2
  -- * as published by the Free Software Foundation; or, when distributed
  -- * separately from the Linux kernel or incorporated into other
  -- * software packages, subject to the following license:
  -- *
  -- * Permission is hereby granted, free of charge, to any person obtaining a copy
  -- * of this source file (the "Software"), to deal in the Software without
  -- * restriction, including without limitation the rights to use, copy, modify,
  -- * merge, publish, distribute, sublicense, and/or sell copies of the Software,
  -- * and to permit persons to whom the Software is furnished to do so, subject to
  -- * the following conditions:
  -- *
  -- * The above copyright notice and this permission notice shall be included in
  -- * all copies or substantial portions of the Software.
  -- *
  -- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  -- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  -- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  -- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  -- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  -- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
  -- * IN THE SOFTWARE.
  --  

   HYPERVISOR_shared_info : access xen_interface_xen_h.shared_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/hypervisor.h:36
   pragma Import (C, HYPERVISOR_shared_info, "HYPERVISOR_shared_info");

   xen_start_info : access xen_interface_xen_h.start_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/hypervisor.h:37
   pragma Import (C, xen_start_info, "xen_start_info");

   function xen_cpuid_base return linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/hypervisor.h:41
   pragma Import (CPP, xen_cpuid_base, "_ZL14xen_cpuid_basev");

   function xen_hvm_need_lapic return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/hypervisor.h:47
   pragma Import (CPP, xen_hvm_need_lapic, "_Z18xen_hvm_need_lapicv");

   function xen_x2apic_para_available return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/xen/hypervisor.h:49
   pragma Import (CPP, xen_x2apic_para_available, "_ZL25xen_x2apic_para_availablev");

end asm_xen_hypervisor_h;

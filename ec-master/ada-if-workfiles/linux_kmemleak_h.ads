pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;

package linux_kmemleak_h is

  -- * include/linux/kmemleak.h
  -- *
  -- * Copyright (C) 2008 ARM Limited
  -- * Written by Catalin Marinas <catalin.marinas@arm.com>
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License version 2 as
  -- * published by the Free Software Foundation.
  -- *
  -- * This program is distributed in the hope that it will be useful,
  -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- * GNU General Public License for more details.
  -- *
  -- * You should have received a copy of the GNU General Public License
  -- * along with this program; if not, write to the Free Software
  -- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
  --  

   procedure kmemleak_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:60
   pragma Import (CPP, kmemleak_init, "_ZL13kmemleak_initv");

   procedure kmemleak_alloc
     (ptr : System.Address;
      size : linux_types_h.size_t;
      min_count : int;
      gfp : linux_types_h.gfp_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:63
   pragma Import (CPP, kmemleak_alloc, "_ZL14kmemleak_allocPKvmij");

   procedure kmemleak_alloc_recursive
     (ptr : System.Address;
      size : linux_types_h.size_t;
      min_count : int;
      flags : unsigned_long;
      gfp : linux_types_h.gfp_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:67
   pragma Import (CPP, kmemleak_alloc_recursive, "_ZL24kmemleak_alloc_recursivePKvmimj");

   procedure kmemleak_alloc_percpu (ptr : System.Address; size : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:72
   pragma Import (CPP, kmemleak_alloc_percpu, "_ZL21kmemleak_alloc_percpuPKvm");

   procedure kmemleak_free (ptr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:75
   pragma Import (CPP, kmemleak_free, "_ZL13kmemleak_freePKv");

   procedure kmemleak_free_part (ptr : System.Address; size : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:78
   pragma Import (CPP, kmemleak_free_part, "_ZL18kmemleak_free_partPKvm");

   procedure kmemleak_free_recursive (ptr : System.Address; flags : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:81
   pragma Import (CPP, kmemleak_free_recursive, "_ZL23kmemleak_free_recursivePKvm");

   procedure kmemleak_free_percpu (ptr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:84
   pragma Import (CPP, kmemleak_free_percpu, "_ZL20kmemleak_free_percpuPKv");

   procedure kmemleak_update_trace (ptr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:87
   pragma Import (CPP, kmemleak_update_trace, "_ZL21kmemleak_update_tracePKv");

   procedure kmemleak_not_leak (ptr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:90
   pragma Import (CPP, kmemleak_not_leak, "_ZL17kmemleak_not_leakPKv");

   procedure kmemleak_ignore (ptr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:93
   pragma Import (CPP, kmemleak_ignore, "_ZL15kmemleak_ignorePKv");

   procedure kmemleak_scan_area
     (ptr : System.Address;
      size : linux_types_h.size_t;
      gfp : linux_types_h.gfp_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:96
   pragma Import (CPP, kmemleak_scan_area, "_ZL18kmemleak_scan_areaPKvmj");

   procedure kmemleak_erase (ptr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:99
   pragma Import (CPP, kmemleak_erase, "_ZL14kmemleak_erasePPv");

   procedure kmemleak_no_scan (ptr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kmemleak.h:102
   pragma Import (CPP, kmemleak_no_scan, "_ZL16kmemleak_no_scanPKv");

end linux_kmemleak_h;

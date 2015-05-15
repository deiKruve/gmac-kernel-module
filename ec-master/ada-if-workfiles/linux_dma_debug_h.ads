pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_device_h;
with asm_generic_int_ll64_h;
limited with linux_mm_types_h;
with linux_types_h;
with Interfaces.C.Extensions;
limited with asm_generic_scatterlist_h;
with System;

package linux_dma_debug_h is

  -- * Copyright (C) 2008 Advanced Micro Devices, Inc.
  -- *
  -- * Author: Joerg Roedel <joerg.roedel@amd.com>
  -- *
  -- * This program is free software; you can redistribute it and/or modify it
  -- * under the terms of the GNU General Public License version 2 as published
  -- * by the Free Software Foundation.
  -- *
  -- * This program is distributed in the hope that it will be useful,
  -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- * GNU General Public License for more details.
  -- *
  -- * You should have received a copy of the GNU General Public License
  -- * along with this program; if not, write to the Free Software
  -- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
  --  

   procedure dma_debug_add_bus (bus : access linux_device_h.bus_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:92
   pragma Import (CPP, dma_debug_add_bus, "_ZL17dma_debug_add_busP8bus_type");

   procedure dma_debug_init (num_entries : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:96
   pragma Import (CPP, dma_debug_init, "_ZL14dma_debug_initj");

   function dma_debug_resize_entries (num_entries : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:100
   pragma Import (CPP, dma_debug_resize_entries, "_ZL24dma_debug_resize_entriesj");

   procedure debug_dma_map_page
     (dev : access linux_device_h.device;
      the_page : access linux_mm_types_h.page;
      offset : linux_types_h.size_t;
      size : linux_types_h.size_t;
      direction : int;
      dma_addr : linux_types_h.dma_addr_t;
      map_single : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:105
   pragma Import (CPP, debug_dma_map_page, "_ZL18debug_dma_map_pageP6deviceP4pagemmiyb");

   procedure debug_dma_mapping_error (dev : access linux_device_h.device; dma_addr : linux_types_h.dma_addr_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:112
   pragma Import (CPP, debug_dma_mapping_error, "_ZL23debug_dma_mapping_errorP6devicey");

   procedure debug_dma_unmap_page
     (dev : access linux_device_h.device;
      addr : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      direction : int;
      map_single : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:117
   pragma Import (CPP, debug_dma_unmap_page, "_ZL20debug_dma_unmap_pageP6deviceymib");

   procedure debug_dma_map_sg
     (dev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nents : int;
      mapped_ents : int;
      direction : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:123
   pragma Import (CPP, debug_dma_map_sg, "_ZL16debug_dma_map_sgP6deviceP11scatterlistiii");

   procedure debug_dma_unmap_sg
     (dev : access linux_device_h.device;
      sglist : access asm_generic_scatterlist_h.scatterlist;
      nelems : int;
      dir : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:128
   pragma Import (CPP, debug_dma_unmap_sg, "_ZL18debug_dma_unmap_sgP6deviceP11scatterlistii");

   procedure debug_dma_alloc_coherent
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      dma_addr : linux_types_h.dma_addr_t;
      virt : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:134
   pragma Import (CPP, debug_dma_alloc_coherent, "_ZL24debug_dma_alloc_coherentP6devicemyPv");

   procedure debug_dma_free_coherent
     (dev : access linux_device_h.device;
      size : linux_types_h.size_t;
      virt : System.Address;
      addr : linux_types_h.dma_addr_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:139
   pragma Import (CPP, debug_dma_free_coherent, "_ZL23debug_dma_free_coherentP6devicemPvy");

   procedure debug_dma_sync_single_for_cpu
     (dev : access linux_device_h.device;
      dma_handle : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      direction : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:144
   pragma Import (CPP, debug_dma_sync_single_for_cpu, "_ZL29debug_dma_sync_single_for_cpuP6deviceymi");

   procedure debug_dma_sync_single_for_device
     (dev : access linux_device_h.device;
      dma_handle : linux_types_h.dma_addr_t;
      size : linux_types_h.size_t;
      direction : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:150
   pragma Import (CPP, debug_dma_sync_single_for_device, "_ZL32debug_dma_sync_single_for_deviceP6deviceymi");

   procedure debug_dma_sync_single_range_for_cpu
     (dev : access linux_device_h.device;
      dma_handle : linux_types_h.dma_addr_t;
      offset : unsigned_long;
      size : linux_types_h.size_t;
      direction : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:156
   pragma Import (CPP, debug_dma_sync_single_range_for_cpu, "_ZL35debug_dma_sync_single_range_for_cpuP6deviceymmi");

   procedure debug_dma_sync_single_range_for_device
     (dev : access linux_device_h.device;
      dma_handle : linux_types_h.dma_addr_t;
      offset : unsigned_long;
      size : linux_types_h.size_t;
      direction : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:164
   pragma Import (CPP, debug_dma_sync_single_range_for_device, "_ZL38debug_dma_sync_single_range_for_deviceP6deviceymmi");

   procedure debug_dma_sync_sg_for_cpu
     (dev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nelems : int;
      direction : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:172
   pragma Import (CPP, debug_dma_sync_sg_for_cpu, "_ZL25debug_dma_sync_sg_for_cpuP6deviceP11scatterlistii");

   procedure debug_dma_sync_sg_for_device
     (dev : access linux_device_h.device;
      sg : access asm_generic_scatterlist_h.scatterlist;
      nelems : int;
      direction : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:178
   pragma Import (CPP, debug_dma_sync_sg_for_device, "_ZL28debug_dma_sync_sg_for_deviceP6deviceP11scatterlistii");

   procedure debug_dma_dump_mappings (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:184
   pragma Import (CPP, debug_dma_dump_mappings, "_ZL23debug_dma_dump_mappingsP6device");

   procedure debug_dma_assert_idle (the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-debug.h:188
   pragma Import (CPP, debug_dma_assert_idle, "_ZL21debug_dma_assert_idleP4page");

end linux_dma_debug_h;

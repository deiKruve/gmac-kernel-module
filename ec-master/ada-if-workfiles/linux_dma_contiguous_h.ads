pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_device_h;
with System;
with linux_types_h;
with Interfaces.C.Extensions;
limited with linux_mm_types_h;

package linux_dma_contiguous_h is

   --  unsupported macro: MAX_CMA_AREAS (0)
  -- * Contiguous Memory Allocator for DMA mapping framework
  -- * Copyright (c) 2010-2011 by Samsung Electronics.
  -- * Written by:
  -- *	Marek Szyprowski <m.szyprowski@samsung.com>
  -- *	Michal Nazarewicz <mina86@mina86.com>
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public License as
  -- * published by the Free Software Foundation; either version 2 of the
  -- * License or (at your optional) any later version of the license.
  --  

  -- * Contiguous Memory Allocator
  -- *
  -- *   The Contiguous Memory Allocator (CMA) makes it possible to
  -- *   allocate big contiguous chunks of memory after the system has
  -- *   booted.
  -- *
  -- * Why is it needed?
  -- *
  -- *   Various devices on embedded systems have no scatter-getter and/or
  -- *   IO map support and require contiguous blocks of memory to
  -- *   operate.  They include devices such as cameras, hardware video
  -- *   coders, etc.
  -- *
  -- *   Such devices often require big memory buffers (a full HD frame
  -- *   is, for instance, more then 2 mega pixels large, i.e. more than 6
  -- *   MB of memory), which makes mechanisms such as kmalloc() or
  -- *   alloc_page() ineffective.
  -- *
  -- *   At the same time, a solution where a big memory region is
  -- *   reserved for a device is suboptimal since often more memory is
  -- *   reserved then strictly required and, moreover, the memory is
  -- *   inaccessible to page system even if device drivers don't use it.
  -- *
  -- *   CMA tries to solve this issue by operating on memory regions
  -- *   where only movable pages can be allocated from.  This way, kernel
  -- *   can use the memory for pagecache and when device driver requests
  -- *   it, allocated pages can be migrated.
  -- *
  -- * Driver usage
  -- *
  -- *   CMA should not be used by the device drivers directly. It is
  -- *   only a helper framework for dma-mapping subsystem.
  -- *
  -- *   For more information, see kernel-docs in drivers/base/dma-contiguous.c
  --  

   --  skipped empty struct cma

  -- * There is always at least global CMA area and a few optional device
  -- * private areas configured in kernel .config.
  --  

  --*
  -- * dma_declare_contiguous() - reserve area for contiguous memory handling
  -- *			      for particular device
  -- * @dev:   Pointer to device structure.
  -- * @size:  Size of the reserved memory.
  -- * @base:  Start address of the reserved memory (optional, 0 for any).
  -- * @limit: End address of the reserved memory (optional, 0 for any).
  -- *
  -- * This function reserves memory for specified device. It should be
  -- * called by board specific code when early allocator (memblock or bootmem)
  -- * is still activate.
  --  

   function dev_get_cma_area (dev : access linux_device_h.device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-contiguous.h:128
   pragma Import (CPP, dev_get_cma_area, "_ZL16dev_get_cma_areaP6device");

   procedure dev_set_cma_area (dev : access linux_device_h.device; the_cma : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-contiguous.h:133
   pragma Import (CPP, dev_set_cma_area, "_ZL16dev_set_cma_areaP6deviceP3cma");

   procedure dma_contiguous_set_default (the_cma : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-contiguous.h:135
   pragma Import (CPP, dma_contiguous_set_default, "_ZL26dma_contiguous_set_defaultP3cma");

   procedure dma_contiguous_reserve (limit : linux_types_h.phys_addr_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-contiguous.h:137
   pragma Import (CPP, dma_contiguous_reserve, "_ZL22dma_contiguous_reservey");

   function dma_contiguous_reserve_area
     (size : linux_types_h.phys_addr_t;
      base : linux_types_h.phys_addr_t;
      limit : linux_types_h.phys_addr_t;
      res_cma : System.Address;
      fixed : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-contiguous.h:139
   pragma Import (CPP, dma_contiguous_reserve_area, "_ZL27dma_contiguous_reserve_areayyyPP3cmab");

   function dma_declare_contiguous
     (dev : access linux_device_h.device;
      size : linux_types_h.phys_addr_t;
      base : linux_types_h.phys_addr_t;
      limit : linux_types_h.phys_addr_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-contiguous.h:147
   pragma Import (CPP, dma_declare_contiguous, "_ZL22dma_declare_contiguousP6deviceyyy");

   function dma_alloc_from_contiguous
     (dev : access linux_device_h.device;
      count : int;
      order : unsigned) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-contiguous.h:154
   pragma Import (CPP, dma_alloc_from_contiguous, "_ZL25dma_alloc_from_contiguousP6deviceij");

   function dma_release_from_contiguous
     (dev : access linux_device_h.device;
      pages : access linux_mm_types_h.page;
      count : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dma-contiguous.h:161
   pragma Import (CPP, dma_release_from_contiguous, "_ZL27dma_release_from_contiguousP6deviceP4pagei");

end linux_dma_contiguous_h;

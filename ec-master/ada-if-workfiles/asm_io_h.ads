pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;
limited with asm_pgtable_64_types_h;
with Interfaces.C.Extensions;
limited with linux_blk_types_h;

package asm_io_h is

   --  arg-macro: procedure build_mmio_read static inline type name(const volatile void __iomem *addr) { type ret; asm volatile("mov" size " %1,%0":reg (ret) :"m" (*(volatile type __force *)addr) barrier); return ret; }
   --    static inline type name(const volatile void __iomem *addr) { type ret; asm volatile("mov" size " %1,%0":reg (ret) :"m" (*(volatile type __force *)addr) barrier); return ret; }
   --  arg-macro: procedure build_mmio_write static inline void name(type val, volatile void __iomem *addr) { asm volatile("mov" size " %0,%1": :reg (val), "m" (*(volatile type __force *)addr) barrier); }
   --    static inline void name(type val, volatile void __iomem *addr) { asm volatile("mov" size " %0,%1": :reg (val), "m" (*(volatile type __force *)addr) barrier); }
   --  arg-macro: procedure readb_relaxed __readb(a)
   --    __readb(a)
   --  arg-macro: procedure readw_relaxed __readw(a)
   --    __readw(a)
   --  arg-macro: procedure readl_relaxed __readl(a)
   --    __readl(a)
   --  arg-macro: procedure mmiowb barrier()
   --    barrier()
   --  arg-macro: procedure readq_relaxed readq(a)
   --    readq(a)
   --  unsupported macro: readq readq
   --  unsupported macro: writeq writeq
   --  arg-macro: function page_to_phys ((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT
   --    return (dma_addr_t)page_to_pfn(page) << PAGE_SHIFT;
   --  arg-macro: function isa_page_to_bus ((unsigned int)page_to_phys(page)
   --    return (unsigned int)page_to_phys(page);
   --  unsupported macro: isa_bus_to_virt phys_to_virt
   --  unsupported macro: virt_to_bus virt_to_phys
   --  unsupported macro: bus_to_virt phys_to_virt
   --  arg-macro: procedure xlate_dev_kmem_ptr p
   --    p
   --  unsupported macro: BUILDIO(bwl,bw,type) static inline void out ##bwl(unsigned type value, int port) { asm volatile("out" #bwl " %" #bw "0, %w1" : : "a"(value), "Nd"(port)); } static inline unsigned type in ##bwl(int port) { unsigned type value; asm volatile("in" #bwl " %w1, %" #bw "0" : "=a"(value) : "Nd"(port)); return value; } static inline void out ##bwl ##_p(unsigned type value, int port) { out ##bwl(value, port); slow_down_io(); } static inline unsigned type in ##bwl ##_p(int port) { unsigned type value = in ##bwl(port); slow_down_io(); return value; } static inline void outs ##bwl(int port, const void *addr, unsigned long count) { asm volatile("rep; outs" #bwl : "+S"(addr), "+c"(count) : "d"(port)); } static inline void ins ##bwl(int port, void *addr, unsigned long count) { asm volatile("rep; ins" #bwl : "+D"(addr), "+c"(count) : "d"(port)); }
   --  arg-macro: function BIOVEC_PHYS_MERGEABLE (__BIOVEC_PHYS_MERGEABLE(vec1, vec2)  and then  (notxen_domain()  or else  xen_biovec_phys_mergeable(vec1, vec2))
   --    return __BIOVEC_PHYS_MERGEABLE(vec1, vec2)  and then  (notxen_domain()  or else  xen_biovec_phys_mergeable(vec1, vec2));
   --  unsupported macro: IO_SPACE_LIMIT 0xffff
   --  unsupported macro: arch_phys_wc_add arch_phys_wc_add
  -- * This file contains the definitions for the x86 IO instructions
  -- * inb/inw/inl/outb/outw/outl and the "string versions" of the same
  -- * (insb/insw/insl/outsb/outsw/outsl). You can also use "pausing"
  -- * versions of the single-IO instructions (inb_p/inw_p/..).
  -- *
  -- * This file is not meant to be obfuscating: it's just complicated
  -- * to (a) handle it all in a way that makes gcc able to optimize it
  -- * as well as possible and (b) trying to avoid writing the same thing
  -- * over and over again with slight variations and possibly making a
  -- * mistake somewhere.
  --  

  -- * Thanks to James van Artsdalen for a better timing-fix than
  -- * the two short jumps: using outb's to a nonexistent port seems
  -- * to guarantee better timings even on fast machines.
  -- *
  -- * On the other hand, I'd like to be sure of a non-existent port:
  -- * I feel a bit unsafe about using 0x80 (should be safe, though)
  -- *
  -- *		Linus
  --  

  --  *  Bit simplified and optimized by Jan Hubicka
  --  *  Support of BIGMEM added by Gerhard Wichert, Siemens AG, July 1999.
  --  *
  --  *  isa_memset_io, isa_memcpy_fromio, isa_memcpy_toio added,
  --  *  isa_read[wl] and isa_write[wl] fixed
  --  *  - Arnaldo Carvalho de Melo <acme@conectiva.com.br>
  --   

   function readb (addr : System.Address) return unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:54
   pragma Import (CPP, readb, "_ZL5readbPVKv");

   function readw (addr : System.Address) return unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:55
   pragma Import (CPP, readw, "_ZL5readwPVKv");

   function readl (addr : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:56
   pragma Import (CPP, readl, "_ZL5readlPVKv");

   --  skipped func __readb

   --  skipped func __readw

   --  skipped func __readl

   procedure writeb (val : unsigned_char; addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:62
   pragma Import (CPP, writeb, "_ZL6writebhPVv");

   procedure writew (val : unsigned_short; addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:63
   pragma Import (CPP, writew, "_ZL6writewtPVv");

   procedure writel (val : unsigned; addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:64
   pragma Import (CPP, writel, "_ZL6writeljPVv");

   --  skipped func __writeb

   --  skipped func __writew

   --  skipped func __writel

   function readq (addr : System.Address) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:85
   pragma Import (CPP, readq, "_ZL5readqPVKv");

   procedure writeq (val : unsigned_long; addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:86
   pragma Import (CPP, writeq, "_ZL6writeqmPVv");

  -- Let people know that we have them  
  --*
  -- *	virt_to_phys	-	map virtual addresses to physical
  -- *	@address: address to remap
  -- *
  -- *	The returned physical address is the physical (CPU) mapping for
  -- *	the memory address given. It is only valid to use this function on
  -- *	addresses directly mapped or allocated via kmalloc.
  -- *
  -- *	This function does not give bus mappings for DMA transfers. In
  -- *	almost all conceivable cases a device driver should not be using
  -- *	this function
  --  

   function virt_to_phys (address : System.Address) return linux_types_h.phys_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:112
   pragma Import (CPP, virt_to_phys, "_ZL12virt_to_physPVv");

  --*
  -- *	phys_to_virt	-	map physical address to virtual
  -- *	@address: address to remap
  -- *
  -- *	The returned virtual address is a current CPU mapping for
  -- *	the memory address given. It is only valid to use this function on
  -- *	addresses that have a kernel mapping
  -- *
  -- *	This function does not handle bus mappings for DMA transfers. In
  -- *	almost all conceivable cases a device driver should not be using
  -- *	this function
  --  

   function phys_to_virt (address : linux_types_h.phys_addr_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:130
   pragma Import (CPP, phys_to_virt, "_ZL12phys_to_virty");

  -- * Change "struct page" to physical address.
  --  

  -- * ISA I/O bus memory addresses are 1:1 with the physical address.
  -- * However, we truncate the address to unsigned int to avoid undesirable
  -- * promitions in legacy drivers.
  --  

   function isa_virt_to_bus (address : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:145
   pragma Import (CPP, isa_virt_to_bus, "_ZL15isa_virt_to_busPVv");

  -- * However PCI ones are not necessarily 1:1 and therefore these interfaces
  -- * are forbidden in portable PCI drivers.
  -- *
  -- * Allow them on x86 for legacy drivers, though.
  --  

  --*
  -- * ioremap     -   map bus memory into CPU space
  -- * @offset:    bus address of the memory
  -- * @size:      size of the resource to map
  -- *
  -- * ioremap performs a platform specific sequence of operations to
  -- * make bus memory CPU accessible via the readb/readw/readl/writeb/
  -- * writew/writel functions and the other mmio helpers. The returned
  -- * address is not guaranteed to be usable directly as a virtual
  -- * address.
  -- *
  -- * If the area you are trying to map is a PCI BAR you should have a
  -- * look at pci_iomap().
  --  

   function ioremap_nocache (offset : linux_types_h.resource_size_t; size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:175
   pragma Import (CPP, ioremap_nocache, "_Z15ioremap_nocacheym");

   function ioremap_cache (offset : linux_types_h.resource_size_t; size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:176
   pragma Import (CPP, ioremap_cache, "_Z13ioremap_cacheym");

   function ioremap_prot
     (offset : linux_types_h.resource_size_t;
      size : unsigned_long;
      prot_val : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:177
   pragma Import (CPP, ioremap_prot, "_Z12ioremap_protymm");

  -- * The default ioremap() behavior is non-cached:
  --  

   function ioremap (offset : linux_types_h.resource_size_t; size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:183
   pragma Import (CPP, ioremap, "_ZL7ioremapym");

   procedure iounmap (addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:188
   pragma Import (CPP, iounmap, "_Z7iounmapPVv");

   procedure set_iounmap_nonlazy;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:190
   pragma Import (CPP, set_iounmap_nonlazy, "_Z19set_iounmap_nonlazyv");

  -- * Convert a virtual cached pointer to an uncached pointer
  --  

   procedure memset_io
     (addr : System.Address;
      val : unsigned_char;
      count : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:204
   pragma Import (CPP, memset_io, "_ZL9memset_ioPVvhm");

   procedure memcpy_fromio
     (dst : System.Address;
      src : System.Address;
      count : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:210
   pragma Import (CPP, memcpy_fromio, "_ZL13memcpy_fromioPvPVKvm");

   procedure memcpy_toio
     (dst : System.Address;
      src : System.Address;
      count : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:216
   pragma Import (CPP, memcpy_toio, "_ZL11memcpy_toioPVvPKvm");

  -- * ISA space is 'always mapped' on a typical x86 system, no need to
  -- * explicitly ioremap() it. The fact that the ISA IO space is mapped
  -- * to PAGE_OFFSET is pure coincidence - it does not mean ISA values
  -- * are physical addresses. The following constant pointer can be
  -- * used as the IO-area pointer (it can be iounmapped as well, so the
  -- * analogy with PCI is quite large):
  --  

  -- *	Cache management
  -- *
  -- *	This needed for two cases
  -- *	1. Out of order aware processors
  -- *	2. Accidentally out of order processors (PPro errata #51)
  --  

   procedure flush_write_buffers;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:239
   pragma Import (CPP, flush_write_buffers, "_ZL19flush_write_buffersv");

   procedure native_io_delay;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:248
   pragma Import (CPP, native_io_delay, "_Z15native_io_delayv");

   io_delay_type : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:250
   pragma Import (C, io_delay_type, "io_delay_type");

   procedure io_delay_init;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:251
   pragma Import (CPP, io_delay_init, "_Z13io_delay_initv");

   procedure insb
     (port : int;
      addr : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:309
   pragma Import (CPP, insb, "_ZL4insbiPvm");

   procedure outsb
     (port : int;
      addr : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:309
   pragma Import (CPP, outsb, "_ZL5outsbiPKvm");

   function inb_p (port : int) return unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:309
   pragma Import (CPP, inb_p, "_ZL5inb_pi");

   procedure outb_p (value : unsigned_char; port : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:309
   pragma Import (CPP, outb_p, "_ZL6outb_phi");

   function inb (port : int) return unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:309
   pragma Import (CPP, inb, "_ZL3inbi");

   procedure outb (value : unsigned_char; port : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:309
   pragma Import (CPP, outb, "_ZL4outbhi");

   procedure insw
     (port : int;
      addr : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:310
   pragma Import (CPP, insw, "_ZL4inswiPvm");

   procedure outsw
     (port : int;
      addr : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:310
   pragma Import (CPP, outsw, "_ZL5outswiPKvm");

   function inw_p (port : int) return unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:310
   pragma Import (CPP, inw_p, "_ZL5inw_pi");

   procedure outw_p (value : unsigned_short; port : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:310
   pragma Import (CPP, outw_p, "_ZL6outw_pti");

   function inw (port : int) return unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:310
   pragma Import (CPP, inw, "_ZL3inwi");

   procedure outw (value : unsigned_short; port : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:310
   pragma Import (CPP, outw, "_ZL4outwti");

   procedure insl
     (port : int;
      addr : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:311
   pragma Import (CPP, insl, "_ZL4insliPvm");

   procedure outsl
     (port : int;
      addr : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:311
   pragma Import (CPP, outsl, "_ZL5outsliPKvm");

   function inl_p (port : int) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:311
   pragma Import (CPP, inl_p, "_ZL5inl_pi");

   procedure outl_p (value : unsigned; port : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:311
   pragma Import (CPP, outl_p, "_ZL6outl_pji");

   function inl (port : int) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:311
   pragma Import (CPP, inl, "_ZL3inli");

   procedure outl (value : unsigned; port : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:311
   pragma Import (CPP, outl, "_ZL4outlji");

   function xlate_dev_mem_ptr (phys : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:313
   pragma Import (CPP, xlate_dev_mem_ptr, "_Z17xlate_dev_mem_ptrm");

   procedure unxlate_dev_mem_ptr (phys : unsigned_long; addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:314
   pragma Import (CPP, unxlate_dev_mem_ptr, "_Z19unxlate_dev_mem_ptrmPv");

   function ioremap_change_attr
     (vaddr : unsigned_long;
      size : unsigned_long;
      prot_val : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:316
   pragma Import (CPP, ioremap_change_attr, "_Z19ioremap_change_attrmmm");

   function ioremap_wc (offset : linux_types_h.resource_size_t; size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:318
   pragma Import (CPP, ioremap_wc, "_Z10ioremap_wcym");

   function is_early_ioremap_ptep (ptep : access asm_pgtable_64_types_h.pte_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:320
   pragma Import (CPP, is_early_ioremap_ptep, "_Z21is_early_ioremap_ptepP5pte_t");

   function xen_biovec_phys_mergeable (vec1 : access constant linux_blk_types_h.bio_vec; vec2 : access constant linux_blk_types_h.bio_vec) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:326
   pragma Import (CPP, xen_biovec_phys_mergeable, "_Z25xen_biovec_phys_mergeablePK7bio_vecS1_");

   function arch_phys_wc_add (base : unsigned_long; size : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:337
   pragma Import (CPP, arch_phys_wc_add, "_Z16arch_phys_wc_addmm");

   procedure arch_phys_wc_del (handle : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io.h:339
   pragma Import (CPP, arch_phys_wc_del, "_Z16arch_phys_wc_deli");

end asm_io_h;

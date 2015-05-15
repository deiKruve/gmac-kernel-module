pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with asm_generic_int_ll64_h;

package asm_generic_iomap_h is

  -- * These are the "generic" interfaces for doing new-style
  -- * memory-mapped or PIO accesses. Architectures may do
  -- * their own arch-optimized versions, these just act as
  -- * wrappers around the old-style IO register access functions:
  -- * read[bwl]/write[bwl]/in[bwl]/out[bwl]
  -- *
  -- * Don't include this directly, include it from <asm/io.h>.
  --  

  -- * Read/write from/to an (offsettable) iomem cookie. It might be a PIO
  -- * access or a MMIO access, these functions don't care. The info is
  -- * encoded in the hardware mapping set up by the mapping functions
  -- * (or the cookie itself, depending on implementation and hw).
  -- *
  -- * The generic routines just encode the PIO/MMIO as part of the
  -- * cookie, and coldly assume that the MMIO IO mappings are not
  -- * in the low address range. Architectures for which this is not
  -- * true can't use this generic implementation.
  --  

   function ioread8 (arg1 : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:28
   pragma Import (CPP, ioread8, "_Z7ioread8Pv");

   function ioread16 (arg1 : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:29
   pragma Import (CPP, ioread16, "_Z8ioread16Pv");

   function ioread16be (arg1 : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:30
   pragma Import (CPP, ioread16be, "_Z10ioread16bePv");

   function ioread32 (arg1 : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:31
   pragma Import (CPP, ioread32, "_Z8ioread32Pv");

   function ioread32be (arg1 : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:32
   pragma Import (CPP, ioread32be, "_Z10ioread32bePv");

   procedure iowrite8 (arg1 : asm_generic_int_ll64_h.u8; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:34
   pragma Import (CPP, iowrite8, "_Z8iowrite8hPv");

   procedure iowrite16 (arg1 : asm_generic_int_ll64_h.u16; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:35
   pragma Import (CPP, iowrite16, "_Z9iowrite16tPv");

   procedure iowrite16be (arg1 : asm_generic_int_ll64_h.u16; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:36
   pragma Import (CPP, iowrite16be, "_Z11iowrite16betPv");

   procedure iowrite32 (arg1 : asm_generic_int_ll64_h.u32; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:37
   pragma Import (CPP, iowrite32, "_Z9iowrite32jPv");

   procedure iowrite32be (arg1 : asm_generic_int_ll64_h.u32; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:38
   pragma Import (CPP, iowrite32be, "_Z11iowrite32bejPv");

  -- * "string" versions of the above. Note that they
  -- * use native byte ordering for the accesses (on
  -- * the assumption that IO and memory agree on a
  -- * byte order, and CPU byteorder is irrelevant).
  -- *
  -- * They do _not_ update the port address. If you
  -- * want MMIO that copies stuff laid out in MMIO
  -- * memory across multiple ports, use "memcpy_toio()"
  -- * and friends.
  --  

   procedure ioread8_rep
     (port : System.Address;
      buf : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:51
   pragma Import (CPP, ioread8_rep, "_Z11ioread8_repPvS_m");

   procedure ioread16_rep
     (port : System.Address;
      buf : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:52
   pragma Import (CPP, ioread16_rep, "_Z12ioread16_repPvS_m");

   procedure ioread32_rep
     (port : System.Address;
      buf : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:53
   pragma Import (CPP, ioread32_rep, "_Z12ioread32_repPvS_m");

   procedure iowrite8_rep
     (port : System.Address;
      buf : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:55
   pragma Import (CPP, iowrite8_rep, "_Z12iowrite8_repPvPKvm");

   procedure iowrite16_rep
     (port : System.Address;
      buf : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:56
   pragma Import (CPP, iowrite16_rep, "_Z13iowrite16_repPvPKvm");

   procedure iowrite32_rep
     (port : System.Address;
      buf : System.Address;
      count : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:57
   pragma Import (CPP, iowrite32_rep, "_Z13iowrite32_repPvPKvm");

  -- Create a virtual mapping cookie for an IO port range  
   function ioport_map (port : unsigned_long; nr : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:61
   pragma Import (CPP, ioport_map, "_Z10ioport_mapmj");

   procedure ioport_unmap (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:62
   pragma Import (CPP, ioport_unmap, "_Z12ioport_unmapPv");

  -- Destroy a virtual mapping cookie for a PCI BAR (memory or IO)  
   procedure pci_iounmap (dev : System.Address; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/iomap.h:72
   pragma Import (CPP, pci_iounmap, "_Z11pci_iounmapP7pci_devPv");

end asm_generic_iomap_h;

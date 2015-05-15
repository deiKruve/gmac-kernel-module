pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package asm_generic_pci_iomap_h is

  -- Generic I/O port emulation, based on MN10300 code
  -- *
  -- * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
  -- * Written by David Howells (dhowells@redhat.com)
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public Licence
  -- * as published by the Free Software Foundation; either version
  -- * 2 of the Licence, or (at your option) any later version.
  --  

  -- Create a virtual mapping cookie for a PCI BAR (memory or IO)  
   function pci_iomap
     (dev : System.Address;
      bar : int;
      max : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/pci_iomap.h:17
   pragma Import (CPP, pci_iomap, "_Z9pci_iomapP7pci_devim");

  -- Create a virtual mapping cookie for a port on a given PCI device.
  -- * Do not call this directly, it exists to make it easier for architectures
  -- * to override  

end asm_generic_pci_iomap_h;

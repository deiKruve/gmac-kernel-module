------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                         S Y S T E M . M E M O R Y                        --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--          Copyright (C) 2001-2011, Free Software Foundation, Inc.         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  This is a simplified version of this package, for use with a configurable
--  run-time library that does not provide Ada tasking. It does not provide
--  any deallocation routine.

--  This package provides the low level memory allocation/deallocation
--  mechanisms used by GNAT.

package System.Memory is
   pragma Elaborate_Body;

   type size_t is mod 2 ** Standard'Address_Size;
   --  Note: the reason we redefine this here instead of using the
   --  definition in Interfaces.C is that we do not want to drag in
   --  all of Interfaces.C just because System.Memory is used.

   function Alloc (Size : size_t) return System.Address;
   --  This is the low level allocation routine. Given a size in storage
   --  units, it returns the address of a maximally aligned block of
   --  memory.
   --
   --  If size_t is set to size_t'Last on entry, then a Storage_Error
   --  exception is raised.
   --
   --  If size_t is set to zero on entry, then a minimal (but non-zero)
   --  size block is allocated.
   --
   --  Note: this is roughly equivalent to the standard C malloc call
   --  with the additional semantics as described above.
   --
   ----------------------------------------------------------------------
   
   
   ---------------------------------------------------
   --  these procedures are defined in linux_kif.c  --
   ---------------------------------------------------
   --
   --  kmalloc - allocate memory
   --  @size: how many bytes of memory are required.
   --  @flags: the type of memory to allocate.
   -- 
   --  kmalloc is the normal method of allocating memory
   --  for objects smaller than page size in the kernel.
   -- 
   --  The @flags argument may be one of:
   -- 
   --  %GFP_USER - Allocate memory on behalf of user.  May sleep.
   -- 
   --  %GFP_KERNEL - Allocate normal kernel ram.  May sleep waiting for memory.
   --  caller must be re-entrant, cannot be used in atomic context
   -- 
   --  %GFP_ATOMIC - Allocation will not sleep.  May use emergency pools.
   --    For example, use this inside interrupt handlers.
   -- 
   --  %GFP_HIGHUSER - Allocate pages from high memory.
   -- 
   --  %GFP_NOIO - Do not do any I/O at all while trying to get memory.
   -- 
   --  %GFP_NOFS - Do not make any fs calls while trying to get memory.
   -- 
   --  %GFP_NOWAIT - Allocation will not sleep.
   -- 
   --  %__GFP_THISNODE - Allocate node-local memory only.
   -- 
   --  %GFP_DMA - Allocation suitable for DMA.
   --    Should only be used for kmalloc() caches. Otherwise, use a
   --    slab created with SLAB_DMA.
   -- 
   --  Also it is possible to set different flags by OR'ing
   --  in one or more of the following additional @flags:
   -- 
   --  %__GFP_COLD - Request cache-cold pages instead of
   --    trying to return cache-warm pages.
   -- 
   --  %__GFP_HIGH - 
   --            This allocation has high priority and may use emergency pools.
   -- 
   --  %__GFP_NOFAIL - 
   --            Indicate that this allocation is in no way allowed to fail
   --    (think twice before using).
   -- 
   --  %__GFP_NORETRY - If memory is not immediately available,
   --    then give up at once.
   -- 
   --  %__GFP_NOWARN - If allocation fails, don't issue any warnings.
   -- 
   --  %__GFP_REPEAT - 
   --               If allocation fails initially, try once more before failing.
   -- 
   --  There are other flags available as well, but these are not intended
   --  for general use, and so are not documented here. For a full list of
   --  potential flags, always refer to linux/gfp.h.
   --

   
   function kif_kmalloc_user (size : L.size_t) return System.Address;
   pragma Import (C, kif_kmalloc_user, "kif_kmalloc_user");

   function kif_kmalloc_kernel (size : L.size_t) return System.Address;
   pragma Import (C, kif_kmalloc_kernel, "kif_kmalloc_kernel");

   function kif_kmalloc_atomic (size : L.size_t) return System.Address;
   pragma Import (C, kif_kmalloc_atomic, "kif_kmalloc_atomic");

   function kif_kmalloc_highuser (size : L.size_t) return System.Address;
   pragma Import (C, kif_kmalloc_highuser, "kif_kmalloc_highuser");

   function kif_kmalloc_noio (size : L.size_t) return System.Address;
   pragma Import (C, kif_kmalloc_noio, "kif_kmalloc_noiom");

   function kif_kmalloc_nofs (size : L.size_t) return System.Address;
   pragma Import (C, kif_kmalloc_nofs, "kif_kmalloc_nofs");

   function kif_kmalloc_nowait (size : L.size_t) return System.Address;
   pragma Import (C, kif_kmalloc_nowait, "kif_kmalloc_nowait");

   
   
   
private
   --  The following names are used from the generated compiler code

   pragma Export (C, Alloc,   "__gnat_malloc");

end System.Memory;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;

package asm_generic_scatterlist_h is

   --  arg-macro: function sg_dma_address ((sg).dma_address
   --    return (sg).dma_address;
   --  arg-macro: function sg_dma_len ((sg).dma_length
   --    return (sg).dma_length;
   type scatterlist is record
      page_link : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/scatterlist.h:10
      offset : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/scatterlist.h:11
      length : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/scatterlist.h:12
      dma_address : aliased linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/scatterlist.h:13
      dma_length : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/scatterlist.h:15
   end record;
   pragma Convention (C_Pass_By_Copy, scatterlist);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/scatterlist.h:6

  -- * These macros should be used after a dma_map_sg call has been done
  -- * to get bus addresses of each of the SG entries and their lengths.
  -- * You should only work with the number of sg entries pci_map_sg
  -- * returns, or alternatively stop on the first sg_dma_len(sg) which
  -- * is 0.
  --  

end asm_generic_scatterlist_h;

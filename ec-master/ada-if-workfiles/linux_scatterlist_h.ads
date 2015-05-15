pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_generic_scatterlist_h;
limited with linux_mm_types_h;
with System;
with linux_types_h;
with Interfaces.C.Extensions;

package linux_scatterlist_h is

   --  unsupported macro: SG_MAGIC 0x87654321
   --  arg-macro: function sg_is_chain ((sg).page_link and 0x01
   --    return (sg).page_link and 0x01;
   --  arg-macro: function sg_is_last ((sg).page_link and 0x02
   --    return (sg).page_link and 0x02;
   --  arg-macro: function sg_chain_ptr ((struct scatterlist *) ((sg).page_link and ~0x03)
   --    return (struct scatterlist *) ((sg).page_link and ~0x03);
   --  arg-macro: procedure for_each_sg for (__i := 0, sg := (sglist); __i < (nr); __i++, sg := sg_next(sg))
   --    for (__i := 0, sg := (sglist); __i < (nr); __i++, sg := sg_next(sg))
   --  unsupported macro: SG_MAX_SINGLE_ALLOC (PAGE_SIZE / sizeof(struct scatterlist))
   --  arg-macro: procedure for_each_sg_page for (__sg_page_iter_start((piter), (sglist), (nents), (pgoffset)); __sg_page_iter_next(piter);)
   --    for (__sg_page_iter_start((piter), (sglist), (nents), (pgoffset)); __sg_page_iter_next(piter);)
   --  unsupported macro: SG_MITER_ATOMIC (1 << 0)
   --  unsupported macro: SG_MITER_TO_SG (1 << 1)
   --  unsupported macro: SG_MITER_FROM_SG (1 << 2)
  -- the list  
   type sg_table is record
      sgl : access asm_generic_scatterlist_h.scatterlist;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:13
      nents : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:14
      orig_nents : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:15
   end record;
   pragma Convention (C_Pass_By_Copy, sg_table);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:12

  -- number of mapped entries  
  -- original size of list  
  -- * Notes on SG table design.
  -- *
  -- * Architectures must provide an unsigned long page_link field in the
  -- * scatterlist struct. We use that to place the page pointer AND encode
  -- * information about the sg table as well. The two lower bits are reserved
  -- * for this information.
  -- *
  -- * If bit 0 is set, then the page_link contains a pointer to the next sg
  -- * table list. Otherwise the next entry is at sg + 1.
  -- *
  -- * If bit 1 is set, then this sg entry is the last element in a list.
  -- *
  -- * See sg_next().
  -- *
  --  

  -- * We overload the LSB of the page pointer to indicate whether it's
  -- * a valid sg entry, or whether it points to the start of a new scatterlist.
  -- * Those low bits are there for everyone! (thanks mason :-)
  --  

  --*
  -- * sg_assign_page - Assign a given page to an SG entry
  -- * @sg:		    SG entry
  -- * @page:	    The page
  -- *
  -- * Description:
  -- *   Assign page to sg entry. Also see sg_set_page(), the most commonly used
  -- *   variant.
  -- *
  -- * 

   procedure sg_assign_page (sg : access asm_generic_scatterlist_h.scatterlist; the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:57
   pragma Import (CPP, sg_assign_page, "_ZL14sg_assign_pageP11scatterlistP4page");

  --	 * In order for the low bit stealing approach to work, pages
  --	 * must be aligned at a 32-bit boundary as a minimum.
  --	  

  --*
  -- * sg_set_page - Set sg entry to point at given page
  -- * @sg:		 SG entry
  -- * @page:	 The page
  -- * @len:	 Length of data
  -- * @offset:	 Offset into page
  -- *
  -- * Description:
  -- *   Use this function to set an sg entry pointing at a page, never assign
  -- *   the page directly. We encode sg table information in the lower bits
  -- *   of the page pointer. See sg_page() for looking up the page belonging
  -- *   to an sg entry.
  -- *
  -- * 

   procedure sg_set_page
     (sg : access asm_generic_scatterlist_h.scatterlist;
      the_page : access linux_mm_types_h.page;
      len : unsigned;
      offset : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:87
   pragma Import (CPP, sg_set_page, "_ZL11sg_set_pageP11scatterlistP4pagejj");

   function sg_page (sg : access asm_generic_scatterlist_h.scatterlist) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:95
   pragma Import (CPP, sg_page, "_ZL7sg_pageP11scatterlist");

  --*
  -- * sg_set_buf - Set sg entry to point at given data
  -- * @sg:		 SG entry
  -- * @buf:	 Data
  -- * @buflen:	 Data length
  -- *
  -- * 

   procedure sg_set_buf
     (sg : access asm_generic_scatterlist_h.scatterlist;
      buf : System.Address;
      buflen : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:111
   pragma Import (CPP, sg_set_buf, "_ZL10sg_set_bufP11scatterlistPKvj");

  -- * Loop over each sg element, following the pointer to a new list if necessary
  --  

  --*
  -- * sg_chain - Chain two sglists together
  -- * @prv:	First scatterlist
  -- * @prv_nents:	Number of entries in prv
  -- * @sgl:	Second scatterlist
  -- *
  -- * Description:
  -- *   Links @prv@ and @sgl@ together, to form a longer scatterlist.
  -- *
  -- * 

   procedure sg_chain
     (prv : access asm_generic_scatterlist_h.scatterlist;
      prv_nents : unsigned;
      sgl : access asm_generic_scatterlist_h.scatterlist);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:136
   pragma Import (CPP, sg_chain, "_ZL8sg_chainP11scatterlistjS0_");

  --	 * offset and length are unused for chain entry.  Clear them.
  --	  

  --	 * Set lowest bit to indicate a link pointer, and make sure to clear
  --	 * the termination bit if it happens to be set.
  --	  

  --*
  -- * sg_mark_end - Mark the end of the scatterlist
  -- * @sg:		 SG entryScatterlist
  -- *
  -- * Description:
  -- *   Marks the passed in sg entry as the termination point for the sg
  -- *   table. A call to sg_next() on this entry will return NULL.
  -- *
  -- * 

   procedure sg_mark_end (sg : access asm_generic_scatterlist_h.scatterlist);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:165
   pragma Import (CPP, sg_mark_end, "_ZL11sg_mark_endP11scatterlist");

  --	 * Set termination bit, clear potential chain bit
  --	  

  --*
  -- * sg_unmark_end - Undo setting the end of the scatterlist
  -- * @sg:		 SG entryScatterlist
  -- *
  -- * Description:
  -- *   Removes the termination marker from the given entry of the scatterlist.
  -- *
  -- * 

   procedure sg_unmark_end (sg : access asm_generic_scatterlist_h.scatterlist);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:185
   pragma Import (CPP, sg_unmark_end, "_ZL13sg_unmark_endP11scatterlist");

  --*
  -- * sg_phys - Return physical address of an sg entry
  -- * @sg:	     SG entry
  -- *
  -- * Description:
  -- *   This calls page_to_phys() on the page in this sg entry, and adds the
  -- *   sg offset. The caller must know that it is legal to call page_to_phys()
  -- *   on the sg page.
  -- *
  -- * 

   function sg_phys (sg : access asm_generic_scatterlist_h.scatterlist) return linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:203
   pragma Import (CPP, sg_phys, "_ZL7sg_physP11scatterlist");

  --*
  -- * sg_virt - Return virtual address of an sg entry
  -- * @sg:      SG entry
  -- *
  -- * Description:
  -- *   This calls page_address() on the page in this sg entry, and adds the
  -- *   sg offset. The caller must know that the sg page has a valid virtual
  -- *   mapping.
  -- *
  -- * 

   function sg_virt (sg : access asm_generic_scatterlist_h.scatterlist) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:218
   pragma Import (CPP, sg_virt, "_ZL7sg_virtP11scatterlist");

   function sg_nents (sg : access asm_generic_scatterlist_h.scatterlist) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:223
   pragma Import (CPP, sg_nents, "_Z8sg_nentsP11scatterlist");

   function sg_next (arg1 : access asm_generic_scatterlist_h.scatterlist) return access asm_generic_scatterlist_h.scatterlist;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:224
   pragma Import (CPP, sg_next, "_Z7sg_nextP11scatterlist");

   function sg_last (s : access asm_generic_scatterlist_h.scatterlist; arg2 : unsigned) return access asm_generic_scatterlist_h.scatterlist;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:225
   pragma Import (CPP, sg_last, "_Z7sg_lastP11scatterlistj");

   procedure sg_init_table (arg1 : access asm_generic_scatterlist_h.scatterlist; arg2 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:226
   pragma Import (CPP, sg_init_table, "_Z13sg_init_tableP11scatterlistj");

   procedure sg_init_one
     (arg1 : access asm_generic_scatterlist_h.scatterlist;
      arg2 : System.Address;
      arg3 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:227
   pragma Import (CPP, sg_init_one, "_Z11sg_init_oneP11scatterlistPKvj");

   --  skipped function type sg_alloc_fn

   --  skipped function type sg_free_fn

   --  skipped func __sg_free_table

   procedure sg_free_table (arg1 : access sg_table);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:233
   pragma Import (CPP, sg_free_table, "_Z13sg_free_tableP8sg_table");

   --  skipped func __sg_alloc_table

   function sg_alloc_table
     (arg1 : access sg_table;
      arg2 : unsigned;
      arg3 : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:236
   pragma Import (CPP, sg_alloc_table, "_Z14sg_alloc_tableP8sg_tablejj");

   function sg_alloc_table_from_pages
     (sgt : access sg_table;
      pages : System.Address;
      n_pages : unsigned;
      offset : unsigned_long;
      size : unsigned_long;
      gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:237
   pragma Import (CPP, sg_alloc_table_from_pages, "_Z25sg_alloc_table_from_pagesP8sg_tablePP4pagejmmj");

   function sg_copy_from_buffer
     (sgl : access asm_generic_scatterlist_h.scatterlist;
      nents : unsigned;
      buf : System.Address;
      buflen : linux_types_h.size_t) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:242
   pragma Import (CPP, sg_copy_from_buffer, "_Z19sg_copy_from_bufferP11scatterlistjPvm");

   function sg_copy_to_buffer
     (sgl : access asm_generic_scatterlist_h.scatterlist;
      nents : unsigned;
      buf : System.Address;
      buflen : linux_types_h.size_t) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:244
   pragma Import (CPP, sg_copy_to_buffer, "_Z17sg_copy_to_bufferP11scatterlistjPvm");

   function sg_pcopy_from_buffer
     (sgl : access asm_generic_scatterlist_h.scatterlist;
      nents : unsigned;
      buf : System.Address;
      buflen : linux_types_h.size_t;
      skip : linux_types_h.off_t) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:247
   pragma Import (CPP, sg_pcopy_from_buffer, "_Z20sg_pcopy_from_bufferP11scatterlistjPvml");

   function sg_pcopy_to_buffer
     (sgl : access asm_generic_scatterlist_h.scatterlist;
      nents : unsigned;
      buf : System.Address;
      buflen : linux_types_h.size_t;
      skip : linux_types_h.off_t) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:249
   pragma Import (CPP, sg_pcopy_to_buffer, "_Z18sg_pcopy_to_bufferP11scatterlistjPvml");

  -- * Maximum number of entries that will be allocated in one piece, if
  -- * a list larger than this is required then chaining will be utilized.
  --  

  -- * sg page iterator
  -- *
  -- * Iterates over sg entries page-by-page.  On each successful iteration,
  -- * you can call sg_page_iter_page(@piter) and sg_page_iter_dma_address(@piter)
  -- * to get the current page and its dma address. @piter->sg will point to the
  -- * sg holding this page and @piter->sg_pgoffset to the page's page offset
  -- * within the sg. The iteration will stop either when a maximum number of sg
  -- * entries was reached or a terminating sg (sg_last(sg) == true) was reached.
  --  

  -- sg holding the page  
   type sg_page_iter is record
      sg : access asm_generic_scatterlist_h.scatterlist;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:269
      sg_pgoffset : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:270
      uu_nents : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:273
      uu_pg_advance : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:274
   end record;
   pragma Convention (C_Pass_By_Copy, sg_page_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:268

  -- page offset within the sg  
  -- these are internal states, keep away  
  -- remaining sg entries  
  -- nr pages to advance at the
  --						 * next step  

   --  skipped func __sg_page_iter_next

   --  skipped func __sg_page_iter_start

  --*
  -- * sg_page_iter_page - get the current page held by the page iterator
  -- * @piter:	page iterator holding the page
  --  

   function sg_page_iter_page (piter : access sg_page_iter) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:286
   pragma Import (CPP, sg_page_iter_page, "_ZL17sg_page_iter_pageP12sg_page_iter");

  --*
  -- * sg_page_iter_dma_address - get the dma address of the current page held by
  -- * the page iterator.
  -- * @piter:	page iterator holding the page
  --  

   function sg_page_iter_dma_address (piter : access sg_page_iter) return linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:296
   pragma Import (CPP, sg_page_iter_dma_address, "_ZL24sg_page_iter_dma_addressP12sg_page_iter");

  --*
  -- * for_each_sg_page - iterate over the pages of the given sg list
  -- * @sglist:	sglist to iterate over
  -- * @piter:	page iterator to hold current page, sg, sg_pgoffset
  -- * @nents:	maximum number of sg entries to iterate over
  -- * @pgoffset:	starting page offset
  --  

  -- * Mapping sg iterator
  -- *
  -- * Iterates over sg entries mapping page-by-page.  On each successful
  -- * iteration, @miter->page points to the mapped page and
  -- * @miter->length bytes of data can be accessed at @miter->addr.  As
  -- * long as an interation is enclosed between start and stop, the user
  -- * is free to choose control structure and when to stop.
  -- *
  -- * @miter->consumed is set to @miter->length on each iteration.  It
  -- * can be adjusted if the user can't consume all the bytes in one go.
  -- * Also, a stopped iteration can be resumed by calling next on it.
  -- * This is useful when iteration needs to release all resources and
  -- * continue later (e.g. at the next interrupt).
  --  

  -- the following three fields can be accessed directly  
  -- currently mapped page  
   type sg_mapping_iter is record
      the_page : access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:334
      addr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:335
      length : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:336
      consumed : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:337
      piter : aliased sg_page_iter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:338
      uu_offset : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:341
      uu_remaining : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:342
      uu_flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:343
   end record;
   pragma Convention (C_Pass_By_Copy, sg_mapping_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:332

  -- pointer to the mapped area  
  -- length of the mapped area  
  -- number of consumed bytes  
  -- page iterator  
  -- these are internal states, keep away  
  -- offset within page  
  -- remaining bytes on page  
   procedure sg_miter_start
     (miter : access sg_mapping_iter;
      sgl : access asm_generic_scatterlist_h.scatterlist;
      nents : unsigned;
      flags : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:346
   pragma Import (CPP, sg_miter_start, "_Z14sg_miter_startP15sg_mapping_iterP11scatterlistjj");

   function sg_miter_skip (miter : access sg_mapping_iter; offset : linux_types_h.off_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:348
   pragma Import (CPP, sg_miter_skip, "_Z13sg_miter_skipP15sg_mapping_iterl");

   function sg_miter_next (miter : access sg_mapping_iter) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:349
   pragma Import (CPP, sg_miter_next, "_Z13sg_miter_nextP15sg_mapping_iter");

   procedure sg_miter_stop (miter : access sg_mapping_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/scatterlist.h:350
   pragma Import (CPP, sg_miter_stop, "_Z13sg_miter_stopP15sg_mapping_iter");

end linux_scatterlist_h;

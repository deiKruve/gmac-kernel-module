pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;
with uapi_linux_uio_h;
limited with linux_blk_types_h;
limited with linux_mm_types_h;
with asm_generic_int_ll64_h;

package linux_uio_h is

   --  arg-macro: procedure iov_for_each if (not((start).type and ITER_BVEC)) for (iter := (start); (iter).count  and then  ((iov := iov_iter_iovec(and(iter))), 1); iov_iter_advance(and(iter), (iov).iov_len))
   --    if (not((start).type and ITER_BVEC)) for (iter := (start); (iter).count  and then  ((iov := iov_iter_iovec(and(iter))), 1); iov_iter_advance(and(iter), (iov).iov_len))
  -- *	Berkeley style UIO structures	-	Alan Cox 1994.
  -- *
  -- *		This program is free software; you can redistribute it and/or
  -- *		modify it under the terms of the GNU General Public License
  -- *		as published by the Free Software Foundation; either version
  -- *		2 of the License, or (at your option) any later version.
  --  

  -- and that should *never* hold a userland pointer  
   type kvec is record
      iov_base : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:18
      iov_len : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:19
   end record;
   pragma Convention (C_Pass_By_Copy, kvec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:17

   type anon_145 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            iov : access constant uapi_linux_uio_h.iovec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:33
         when others =>
            bvec : access constant linux_blk_types_h.bio_vec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:34
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_145);
   pragma Unchecked_Union (anon_145);
   type iov_iter is record
      c_type : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:29
      iov_offset : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:30
      count : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:31
      field_4 : aliased anon_145;
      nr_segs : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, iov_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:28

  -- * Total number of bytes covered by an iovec.
  -- *
  -- * NOTE that it is not safe to use this function until all the iovec's
  -- * segment lengths have been validated.  Because the individual lengths can
  -- * overflow a size_t when added together.
  --  

   function iov_length (iov : access constant uapi_linux_uio_h.iovec; nr_segs : unsigned_long) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:46
   pragma Import (CPP, iov_length, "_ZL10iov_lengthPK5iovecm");

   function iov_iter_iovec (iter : access constant iov_iter) return uapi_linux_uio_h.iovec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:56
   pragma Import (CPP, iov_iter_iovec, "_ZL14iov_iter_iovecPK8iov_iter");

   function iov_shorten
     (iov : access uapi_linux_uio_h.iovec;
      nr_segs : unsigned_long;
      to : linux_types_h.size_t) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:72
   pragma Import (CPP, iov_shorten, "_Z11iov_shortenP5iovecmm");

   function iov_iter_copy_from_user_atomic
     (the_page : access linux_mm_types_h.page;
      i : access iov_iter;
      offset : unsigned_long;
      bytes : linux_types_h.size_t) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:74
   pragma Import (CPP, iov_iter_copy_from_user_atomic, "_Z30iov_iter_copy_from_user_atomicP4pageP8iov_itermm");

   procedure iov_iter_advance (i : access iov_iter; bytes : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:76
   pragma Import (CPP, iov_iter_advance, "_Z16iov_iter_advanceP8iov_iterm");

   function iov_iter_fault_in_readable (i : access iov_iter; bytes : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:77
   pragma Import (CPP, iov_iter_fault_in_readable, "_Z26iov_iter_fault_in_readableP8iov_iterm");

   function iov_iter_single_seg_count (i : access constant iov_iter) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:78
   pragma Import (CPP, iov_iter_single_seg_count, "_Z25iov_iter_single_seg_countPK8iov_iter");

   function copy_page_to_iter
     (the_page : access linux_mm_types_h.page;
      offset : linux_types_h.size_t;
      bytes : linux_types_h.size_t;
      i : access iov_iter) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:79
   pragma Import (CPP, copy_page_to_iter, "_Z17copy_page_to_iterP4pagemmP8iov_iter");

   function copy_page_from_iter
     (the_page : access linux_mm_types_h.page;
      offset : linux_types_h.size_t;
      bytes : linux_types_h.size_t;
      i : access iov_iter) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:81
   pragma Import (CPP, copy_page_from_iter, "_Z19copy_page_from_iterP4pagemmP8iov_iter");

   function iov_iter_alignment (i : access constant iov_iter) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:83
   pragma Import (CPP, iov_iter_alignment, "_Z18iov_iter_alignmentPK8iov_iter");

   procedure iov_iter_init
     (i : access iov_iter;
      direction : int;
      iov : access constant uapi_linux_uio_h.iovec;
      nr_segs : unsigned_long;
      count : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:84
   pragma Import (CPP, iov_iter_init, "_Z13iov_iter_initP8iov_iteriPK5iovecmm");

   function iov_iter_get_pages
     (i : access iov_iter;
      pages : System.Address;
      maxsize : linux_types_h.size_t;
      maxpages : unsigned;
      start : access linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:86
   pragma Import (CPP, iov_iter_get_pages, "_Z18iov_iter_get_pagesP8iov_iterPP4pagemjPm");

   function iov_iter_get_pages_alloc
     (i : access iov_iter;
      pages : System.Address;
      maxsize : linux_types_h.size_t;
      start : access linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:88
   pragma Import (CPP, iov_iter_get_pages_alloc, "_Z24iov_iter_get_pages_allocP8iov_iterPPP4pagemPm");

   function iov_iter_npages (i : access constant iov_iter; maxpages : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:90
   pragma Import (CPP, iov_iter_npages, "_Z15iov_iter_npagesPK8iov_iteri");

   function iov_iter_count (i : access iov_iter) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:92
   pragma Import (CPP, iov_iter_count, "_ZL14iov_iter_countP8iov_iter");

  -- * Cap the iov_iter by given limit; note that the second argument is
  -- * *not* the new size - it's upper limit for such.  Passing it a value
  -- * greater than the amount of data in iov_iter is fine - it'll just do
  -- * nothing in that case.
  --  

   procedure iov_iter_truncate (i : access iov_iter; count : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:103
   pragma Import (CPP, iov_iter_truncate, "_ZL17iov_iter_truncateP8iov_itery");

  --	 * count doesn't have to fit in size_t - comparison extends both
  --	 * operands to u64 here and any value that would be truncated by
  --	 * conversion in assignement is by definition greater than all
  --	 * values of size_t, including old i->count.
  --	  

  -- * reexpand a previously truncated iterator; count must be no more than how much
  -- * we had shrunk it.
  --  

   procedure iov_iter_reexpand (i : access iov_iter; count : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:119
   pragma Import (CPP, iov_iter_reexpand, "_ZL17iov_iter_reexpandP8iov_iterm");

   function memcpy_fromiovec
     (kdata : access unsigned_char;
      iov : access uapi_linux_uio_h.iovec;
      len : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:124
   pragma Import (CPP, memcpy_fromiovec, "_Z16memcpy_fromiovecPhP5ioveci");

   function memcpy_toiovec
     (iov : access uapi_linux_uio_h.iovec;
      kdata : access unsigned_char;
      len : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:125
   pragma Import (CPP, memcpy_toiovec, "_Z14memcpy_toiovecP5iovecPhi");

   function memcpy_fromiovecend
     (kdata : access unsigned_char;
      iov : access constant uapi_linux_uio_h.iovec;
      offset : int;
      len : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:126
   pragma Import (CPP, memcpy_fromiovecend, "_Z19memcpy_fromiovecendPhPK5iovecii");

   function memcpy_toiovecend
     (v : access constant uapi_linux_uio_h.iovec;
      kdata : access unsigned_char;
      offset : int;
      len : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uio.h:128
   pragma Import (CPP, memcpy_toiovecend, "_Z17memcpy_toiovecendPK5iovecPhii");

end linux_uio_h;

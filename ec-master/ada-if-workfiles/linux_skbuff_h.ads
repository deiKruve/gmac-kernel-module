pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
limited with linux_netdevice_h;
with uapi_asm_generic_int_ll64_h;
with linux_spinlock_types_h;
limited with linux_mm_types_h;
with System;
with linux_ktime_h;
with Interfaces.C.Extensions;
with uapi_linux_types_h;
with asm_generic_int_ll64_h;
limited with linux_slab_def_h;
limited with asm_generic_scatterlist_h;
with Interfaces.C.Strings;
limited with linux_textsearch_h;
limited with linux_lockdep_h;
limited with linux_device_h;
with linux_dma_direction_h;
limited with linux_fs_h;
limited with linux_net_h;
limited with uapi_linux_uio_h;
with linux_netdev_features_h;
limited with uapi_linux_time_h;

package linux_skbuff_h is

   --  unsupported macro: CHECKSUM_NONE 0
   --  unsupported macro: CHECKSUM_UNNECESSARY 1
   --  unsupported macro: CHECKSUM_COMPLETE 2
   --  unsupported macro: CHECKSUM_PARTIAL 3
   --  arg-macro: function SKB_DATA_ALIGN (((X) + (SMP_CACHE_BYTES - 1)) and ~(SMP_CACHE_BYTES - 1)
   --    return ((X) + (SMP_CACHE_BYTES - 1)) and ~(SMP_CACHE_BYTES - 1);
   --  arg-macro: function SKB_WITH_OVERHEAD ((X) - SKB_DATA_ALIGN(sizeof(struct skb_shared_info))
   --    return (X) - SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
   --  arg-macro: procedure SKB_MAX_ORDER SKB_WITH_OVERHEAD((PAGE_SIZE << (ORDER)) - (X))
   --    SKB_WITH_OVERHEAD((PAGE_SIZE << (ORDER)) - (X))
   --  arg-macro: function SKB_MAX_HEAD (SKB_MAX_ORDER((X), 0)
   --    return SKB_MAX_ORDER((X), 0);
   --  unsupported macro: SKB_MAX_ALLOC (SKB_MAX_ORDER(0, 2))
   --  arg-macro: function SKB_TRUESIZE ((X) + SKB_DATA_ALIGN(sizeof(struct sk_buff)) + SKB_DATA_ALIGN(sizeof(struct skb_shared_info))
   --    return (X) + SKB_DATA_ALIGN(sizeof(struct sk_buff)) + SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
   --  unsupported macro: MAX_SKB_FRAGS (65536/PAGE_SIZE + 1)
   --  unsupported macro: SKB_DATAREF_SHIFT 16
   --  unsupported macro: SKB_DATAREF_MASK ((1 << SKB_DATAREF_SHIFT) - 1)
   --  unsupported macro: NET_SKBUFF_DATA_USES_OFFSET 1
   --  unsupported macro: SKB_ALLOC_FCLONE 0x01
   --  unsupported macro: SKB_ALLOC_RX 0x02
   --  unsupported macro: SKB_DST_NOREF 1UL
   --  unsupported macro: SKB_DST_PTRMASK ~(SKB_DST_NOREF)
   --  arg-macro: procedure dev_kfree_skb consume_skb(a)
   --    consume_skb(a)
   --  arg-macro: function skb_shinfo ((struct skb_shared_info *)(skb_end_pointer(SKB))
   --    return (struct skb_shared_info *)(skb_end_pointer(SKB));
   --  arg-macro: procedure SKB_PAGE_ASSERT BUG_ON(skb_shinfo(skb).nr_frags)
   --    BUG_ON(skb_shinfo(skb).nr_frags)
   --  arg-macro: procedure SKB_FRAG_ASSERT BUG_ON(skb_has_frag_list(skb))
   --    BUG_ON(skb_has_frag_list(skb))
   --  arg-macro: procedure SKB_LINEAR_ASSERT BUG_ON(skb_is_nonlinear(skb))
   --    BUG_ON(skb_is_nonlinear(skb))
   --  unsupported macro: NET_SKB_PAD max(32, L1_CACHE_BYTES)
   --  unsupported macro: NETDEV_FRAG_PAGE_MAX_ORDER get_order(32768)
   --  unsupported macro: NETDEV_FRAG_PAGE_MAX_SIZE (PAGE_SIZE << NETDEV_FRAG_PAGE_MAX_ORDER)
   --  unsupported macro: NETDEV_PAGECNT_MAX_BIAS NETDEV_FRAG_PAGE_MAX_SIZE
   --  arg-macro: procedure skb_queue_walk for (skb := (queue).next; skb /= (struct sk_buff *)(queue); skb := skb.next)
   --    for (skb := (queue).next; skb /= (struct sk_buff *)(queue); skb := skb.next)
   --  arg-macro: procedure skb_queue_walk_safe for (skb := (queue).next, tmp := skb.next; skb /= (struct sk_buff *)(queue); skb := tmp, tmp := skb.next)
   --    for (skb := (queue).next, tmp := skb.next; skb /= (struct sk_buff *)(queue); skb := tmp, tmp := skb.next)
   --  arg-macro: procedure skb_queue_walk_from for (; skb /= (struct sk_buff *)(queue); skb := skb.next)
   --    for (; skb /= (struct sk_buff *)(queue); skb := skb.next)
   --  arg-macro: procedure skb_queue_walk_from_safe for (tmp := skb.next; skb /= (struct sk_buff *)(queue); skb := tmp, tmp := skb.next)
   --    for (tmp := skb.next; skb /= (struct sk_buff *)(queue); skb := tmp, tmp := skb.next)
   --  arg-macro: procedure skb_queue_reverse_walk for (skb := (queue).prev; skb /= (struct sk_buff *)(queue); skb := skb.prev)
   --    for (skb := (queue).prev; skb /= (struct sk_buff *)(queue); skb := skb.prev)
   --  arg-macro: procedure skb_queue_reverse_walk_safe for (skb := (queue).prev, tmp := skb.prev; skb /= (struct sk_buff *)(queue); skb := tmp, tmp := skb.prev)
   --    for (skb := (queue).prev, tmp := skb.prev; skb /= (struct sk_buff *)(queue); skb := tmp, tmp := skb.prev)
   --  arg-macro: procedure skb_queue_reverse_walk_from_safe for (tmp := skb.prev; skb /= (struct sk_buff *)(queue); skb := tmp, tmp := skb.prev)
   --    for (tmp := skb.prev; skb /= (struct sk_buff *)(queue); skb := tmp, tmp := skb.prev)
   --  arg-macro: procedure skb_walk_frags for (iter := skb_shinfo(skb).frag_list; iter; iter := iter.next)
   --    for (iter := skb_shinfo(skb).frag_list; iter; iter := iter.next)
   --  unsupported macro: CHECKSUM_BREAK 76
   --  arg-macro: procedure skb_checksum_init __skb_checksum_validate(skb, proto, false, false, 0, compute_pseudo)
   --    __skb_checksum_validate(skb, proto, false, false, 0, compute_pseudo)
   --  arg-macro: procedure skb_checksum_init_zero_check __skb_checksum_validate(skb, proto, false, true, check, compute_pseudo)
   --    __skb_checksum_validate(skb, proto, false, true, check, compute_pseudo)
   --  arg-macro: procedure skb_checksum_validate __skb_checksum_validate(skb, proto, true, false, 0, compute_pseudo)
   --    __skb_checksum_validate(skb, proto, true, false, 0, compute_pseudo)
   --  arg-macro: procedure skb_checksum_validate_zero_check __skb_checksum_validate_(skb, proto, true, true, check, compute_pseudo)
   --    __skb_checksum_validate_(skb, proto, true, true, check, compute_pseudo)
   --  arg-macro: procedure skb_checksum_simple_validate __skb_checksum_validate(skb, 0, true, false, 0, null_compute_pseudo)
   --    __skb_checksum_validate(skb, 0, true, false, 0, null_compute_pseudo)
   --  arg-macro: function SKB_GSO_CB ((struct skb_gso_cb *)(skb).cb
   --    return (struct skb_gso_cb *)(skb).cb;
  -- *	Definitions for the 'struct sk_buff' memory handlers.
  -- *
  -- *	Authors:
  -- *		Alan Cox, <gw4pts@gw4pts.ampr.org>
  -- *		Florian La Roche, <rzsfl@rz.uni-sb.de>
  -- *
  -- *	This program is free software; you can redistribute it and/or
  -- *	modify it under the terms of the GNU General Public License
  -- *	as published by the Free Software Foundation; either version
  -- *	2 of the License, or (at your option) any later version.
  --  

  -- A. Checksumming of received packets by device.
  -- *
  -- * CHECKSUM_NONE:
  -- *
  -- *   Device failed to checksum this packet e.g. due to lack of capabilities.
  -- *   The packet contains full (though not verified) checksum in packet but
  -- *   not in skb->csum. Thus, skb->csum is undefined in this case.
  -- *
  -- * CHECKSUM_UNNECESSARY:
  -- *
  -- *   The hardware you're dealing with doesn't calculate the full checksum
  -- *   (as in CHECKSUM_COMPLETE), but it does parse headers and verify checksums
  -- *   for specific protocols e.g. TCP/UDP/SCTP, then, for such packets it will
  -- *   set CHECKSUM_UNNECESSARY if their checksums are okay. skb->csum is still
  -- *   undefined in this case though. It is a bad option, but, unfortunately,
  -- *   nowadays most vendors do this. Apparently with the secret goal to sell
  -- *   you new devices, when you will add new protocol to your host, f.e. IPv6 8)
  -- *
  -- * CHECKSUM_COMPLETE:
  -- *
  -- *   This is the most generic way. The device supplied checksum of the _whole_
  -- *   packet as seen by netif_rx() and fills out in skb->csum. Meaning, the
  -- *   hardware doesn't need to parse L3/L4 headers to implement this.
  -- *
  -- *   Note: Even if device supports only some protocols, but is able to produce
  -- *   skb->csum, it MUST use CHECKSUM_COMPLETE, not CHECKSUM_UNNECESSARY.
  -- *
  -- * CHECKSUM_PARTIAL:
  -- *
  -- *   This is identical to the case for output below. This may occur on a packet
  -- *   received directly from another Linux OS, e.g., a virtualized Linux kernel
  -- *   on the same host. The packet can be treated in the same way as
  -- *   CHECKSUM_UNNECESSARY, except that on output (i.e., forwarding) the
  -- *   checksum must be filled in by the OS or the hardware.
  -- *
  -- * B. Checksumming on output.
  -- *
  -- * CHECKSUM_NONE:
  -- *
  -- *   The skb was already checksummed by the protocol, or a checksum is not
  -- *   required.
  -- *
  -- * CHECKSUM_PARTIAL:
  -- *
  -- *   The device is required to checksum the packet as seen by hard_start_xmit()
  -- *   from skb->csum_start up to the end, and to record/write the checksum at
  -- *   offset skb->csum_start + skb->csum_offset.
  -- *
  -- *   The device must show its capabilities in dev->features, set up at device
  -- *   setup time, e.g. netdev_features.h:
  -- *
  -- *	NETIF_F_HW_CSUM	- It's a clever device, it's able to checksum everything.
  -- *	NETIF_F_IP_CSUM - Device is dumb, it's able to checksum only TCP/UDP over
  -- *			  IPv4. Sigh. Vendors like this way for an unknown reason.
  -- *			  Though, see comment above about CHECKSUM_UNNECESSARY. 8)
  -- *	NETIF_F_IPV6_CSUM - About as dumb as the last one but does IPv6 instead.
  -- *	NETIF_F_...     - Well, you get the picture.
  -- *
  -- * CHECKSUM_UNNECESSARY:
  -- *
  -- *   Normally, the device will do per protocol specific checksumming. Protocol
  -- *   implementations that do not want the NIC to perform the checksum
  -- *   calculation should use this flag in their outgoing skbs.
  -- *
  -- *	NETIF_F_FCOE_CRC - This indicates that the device can do FCoE FC CRC
  -- *			   offload. Correspondingly, the FCoE protocol driver
  -- *			   stack should use CHECKSUM_UNNECESSARY.
  -- *
  -- * Any questions? No questions, good.		--ANK
  --  

  -- Don't change this without changing skb_csum_unnecessary!  
  -- return minimum truesize of one skb containing X bytes of data  
   type nf_conntrack is record
      c_use : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:135
   end record;
   pragma Convention (C_Pass_By_Copy, nf_conntrack);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:134

   type nf_bridge_info_data_array is array (0 .. 3) of aliased unsigned_long;
   type nf_bridge_info is record
      c_use : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:141
      mask : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:142
      physindev : access linux_netdevice_h.net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:143
      physoutdev : access linux_netdevice_h.net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:144
      data : aliased nf_bridge_info_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:145
   end record;
   pragma Convention (C_Pass_By_Copy, nf_bridge_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:140

  -- These two members must be first.  
   type sk_buff;
   type sk_buff_head is record
      next : access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:151
      prev : access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:152
      qlen : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:154
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:155
   end record;
   pragma Convention (C_Pass_By_Copy, sk_buff_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:149

  -- To allow 64K frame to be packed as single skb without frag_list we
  -- * require 64K/PAGE_SIZE pages plus 1 additional page to allow for
  -- * buffers which do not start on a page boundary.
  -- *
  -- * Since GRO uses frags we allocate at least 16 regardless of page
  -- * size.
  --  

   type skb_frag_struct;
   type anon_303 is record
      p : access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:177
   end record;
   pragma Convention (C_Pass_By_Copy, anon_303);
   subtype skb_frag_t is skb_frag_struct;

   type skb_frag_struct is record
      page : aliased anon_303;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:178
      page_offset : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:180
      size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:181
   end record;
   pragma Convention (C_Pass_By_Copy, skb_frag_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:175

   function skb_frag_size (frag : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:188
   pragma Import (CPP, skb_frag_size, "_ZL13skb_frag_sizePK15skb_frag_struct");

   procedure skb_frag_size_set (frag : access skb_frag_t; size : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:193
   pragma Import (CPP, skb_frag_size_set, "_ZL17skb_frag_size_setP15skb_frag_structj");

   procedure skb_frag_size_add (frag : access skb_frag_t; c_delta : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:198
   pragma Import (CPP, skb_frag_size_add, "_ZL17skb_frag_size_addP15skb_frag_structi");

   procedure skb_frag_size_sub (frag : access skb_frag_t; c_delta : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:203
   pragma Import (CPP, skb_frag_size_sub, "_ZL17skb_frag_size_subP15skb_frag_structi");

  --*
  -- * struct skb_shared_hwtstamps - hardware time stamps
  -- * @hwtstamp:	hardware time stamp transformed into duration
  -- *		since arbitrary point in time
  -- * @syststamp:	hwtstamp transformed to system time base
  -- *
  -- * Software time stamps generated by ktime_get_real() are stored in
  -- * skb->tstamp. The relation between the different kinds of time
  -- * stamps is as follows:
  -- *
  -- * syststamp and tstamp can be compared against each other in
  -- * arbitrary combinations.  The accuracy of a
  -- * syststamp/tstamp/"syststamp from other device" comparison is
  -- * limited by the accuracy of the transformation into system time
  -- * base. This depends on the device driver and its underlying
  -- * hardware.
  -- *
  -- * hwtstamps can only be compared against other hwtstamps from
  -- * the same device.
  -- *
  -- * This structure is attached to packets as part of the
  -- * &skb_shared_info. Use skb_hwtstamps() to get a pointer.
  --  

   type skb_shared_hwtstamps is record
      hwtstamp : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:234
      syststamp : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:235
   end record;
   pragma Convention (C_Pass_By_Copy, skb_shared_hwtstamps);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:233

  -- Definitions for tx_flags in struct skb_shared_info  
  -- generate hardware time stamp  
  -- generate software time stamp  
  -- device driver is going to provide hardware time stamp  
  -- device driver supports TX zero-copy buffers  
  -- generate wifi status information (where possible)  
  -- This indicates at least one fragment might be overwritten
  --	 * (as in vmsplice(), sendfile() ...)
  --	 * If we need to compute a TX checksum, we'll need to copy
  --	 * all frags to avoid possible bad checksum
  --	  

  -- * The callback notifies userspace to release buffers when skb DMA is done in
  -- * lower device, the skb last reference should be 0 when calling this.
  -- * The zerocopy_success argument is true if zero copy transmit occurred,
  -- * false on data copy or out of memory error caused by data copy attempt.
  -- * The ctx field is used to track device context.
  -- * The desc field is used to track userspace buffer index.
  --  

   type ubuf_info is record
      callback : access procedure (arg1 : access ubuf_info; arg2 : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:272
      ctx : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:273
      desc : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:274
   end record;
   pragma Convention (C_Pass_By_Copy, ubuf_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:271

  -- This data is invariant across clones and lives at
  -- * the end of the header data, ie. at skb->end.
  --  

   type skb_shared_info_frags_array is array (0 .. 16) of aliased skb_frag_t;
   type skb_shared_info is record
      nr_frags : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:281
      tx_flags : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:282
      gso_size : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:283
      gso_segs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:285
      gso_type : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:286
      frag_list : access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:287
      hwtstamps : aliased skb_shared_hwtstamps;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:288
      ip6_frag_id : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:289
      dataref : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:294
      destructor_arg : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:298
      frags : aliased skb_shared_info_frags_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:301
   end record;
   pragma Convention (C_Pass_By_Copy, skb_shared_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:280

  -- Warning: this field is not always filled in (UFO)!  
  --	 * Warning : all fields before dataref are cleared in __alloc_skb()
  --	  

  -- Intermediate layers must ensure that destructor_arg
  --	 * remains valid until skb destructor  

  -- must be last field, see pskb_expand_head()  
  -- We divide dataref into two halves.  The higher 16 bits hold references
  -- * to the payload part of skb->data.  The lower 16 bits hold references to
  -- * the entire skb->data.  A clone of a headerless skb holds the length of
  -- * the header in skb->hdr_len.
  -- *
  -- * All users must obey the rule that the skb->data reference count must be
  -- * greater than or equal to the payload reference count.
  -- *
  -- * Holding a reference to the payload part means that the user does not
  -- * care about modifications to the header part of skb->data.
  --  

  -- This indicates the skb is from an untrusted source.  
  -- This indicates the tcp segment has CWR set.  
   subtype sk_buff_data_t is unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:360

  --*
  -- * struct skb_mstamp - multi resolution time stamps
  -- * @stamp_us: timestamp in us resolution
  -- * @stamp_jiffies: timestamp in jiffies
  --  

   type anon_307;
   type anon_308 is record
      stamp_us : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:374
      stamp_jiffies : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:375
   end record;
   pragma Convention (C_Pass_By_Copy, anon_308);
   type anon_307 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            v64 : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:372
            field_2 : aliased anon_308;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_307);
   pragma Unchecked_Union (anon_307);
   type skb_mstamp is record
      parent : aliased anon_307;
   end record;
   pragma Convention (C_Pass_By_Copy, skb_mstamp);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:370

  --*
  -- * skb_mstamp_get - get current timestamp
  -- * @cl: place to store timestamps
  --  

   procedure skb_mstamp_get (cl : access skb_mstamp);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:384
   pragma Import (CPP, skb_mstamp_get, "_ZL14skb_mstamp_getP10skb_mstamp");

  --*
  -- * skb_mstamp_delta - compute the difference in usec between two skb_mstamp
  -- * @t1: pointer to newest sample
  -- * @t0: pointer to oldest sample
  --  

   function skb_mstamp_us_delta (t1 : access constant skb_mstamp; t0 : access constant skb_mstamp) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:398
   pragma Import (CPP, skb_mstamp_us_delta, "_ZL19skb_mstamp_us_deltaPK10skb_mstampS1_");

  -- If delta_us is negative, this might be because interval is too big,
  --	 * or local_clock() drift is too big : fallback using jiffies.
  --	  

  --* 
  -- *	struct sk_buff - socket buffer
  -- *	@next: Next buffer in list
  -- *	@prev: Previous buffer in list
  -- *	@tstamp: Time we arrived/left
  -- *	@sk: Socket we are owned by
  -- *	@dev: Device we arrived on/are leaving by
  -- *	@cb: Control buffer. Free for use by every layer. Put private vars here
  -- *	@_skb_refdst: destination entry (with norefcount bit)
  -- *	@sp: the security path, used for xfrm
  -- *	@len: Length of actual data
  -- *	@data_len: Data length
  -- *	@mac_len: Length of link layer header
  -- *	@hdr_len: writable header length of cloned skb
  -- *	@csum: Checksum (must include start/offset pair)
  -- *	@csum_start: Offset from skb->head where checksumming should start
  -- *	@csum_offset: Offset from csum_start where checksum should be stored
  -- *	@priority: Packet queueing priority
  -- *	@ignore_df: allow local fragmentation
  -- *	@cloned: Head may be cloned (check refcnt to be sure)
  -- *	@ip_summed: Driver fed us an IP checksum
  -- *	@nohdr: Payload reference only, must not modify header
  -- *	@nfctinfo: Relationship of this skb to the connection
  -- *	@pkt_type: Packet class
  -- *	@fclone: skbuff clone status
  -- *	@ipvs_property: skbuff is owned by ipvs
  -- *	@peeked: this packet has been seen already, so stats have been
  -- *		done for it, don't do them again
  -- *	@nf_trace: netfilter packet trace flag
  -- *	@protocol: Packet protocol from driver
  -- *	@destructor: Destruct function
  -- *	@nfct: Associated connection, if any
  -- *	@nf_bridge: Saved data about a bridged frame - see br_netfilter.c
  -- *	@skb_iif: ifindex of device we arrived on
  -- *	@tc_index: Traffic control index
  -- *	@tc_verd: traffic control verdict
  -- *	@hash: the packet hash
  -- *	@queue_mapping: Queue mapping for multiqueue devices
  -- *	@ndisc_nodetype: router type (from link layer)
  -- *	@ooo_okay: allow the mapping of a socket to a queue to be changed
  -- *	@l4_hash: indicate hash is a canonical 4-tuple hash over transport
  -- *		ports.
  -- *	@wifi_acked_valid: wifi_acked was set
  -- *	@wifi_acked: whether frame was acked on wifi or not
  -- *	@no_fcs:  Request NIC to treat last 4 bytes as Ethernet FCS
  -- *	@dma_cookie: a cookie to one of several possible DMA operations
  -- *		done by skb DMA functions
  --  *	@napi_id: id of the NAPI struct this skb came from
  -- *	@secmark: security marking
  -- *	@mark: Generic packet mark
  -- *	@dropcount: total number of sk_receive_queue overflows
  -- *	@vlan_proto: vlan encapsulation protocol
  -- *	@vlan_tci: vlan tag control information
  -- *	@inner_protocol: Protocol (encapsulation)
  -- *	@inner_transport_header: Inner transport layer header (encapsulation)
  -- *	@inner_network_header: Network layer header (encapsulation)
  -- *	@inner_mac_header: Link layer header (encapsulation)
  -- *	@transport_header: Transport layer header
  -- *	@network_header: Network layer header
  -- *	@mac_header: Link layer header
  -- *	@tail: Tail pointer
  -- *	@end: End pointer
  -- *	@head: Head of buffer
  -- *	@data: Data head pointer
  -- *	@truesize: Buffer size
  -- *	@users: User count - see {datagram,tcp}.c
  --  

  -- These two members must be first.  
  --	 * This is the control buffer. It is free to use for every
  --	 * layer. Please put your private variables there. If you
  --	 * want to keep them across layers you have to do a skb_clone()
  --	 * first. This is owned by whoever has the skb queued ATM.
  --	  

   --  skipped empty struct sec_path

   type sk_buff is record
      next : access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:486
      prev : access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:487
      field_3 : aliased anon_309;
      sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:494
      dev : access linux_netdevice_h.net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:495
      cb : aliased sk_buff_cb_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:503
      u_skb_refdst : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:505
      sp : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:507
      len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:509
      data_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:510
      mac_len : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:511
      hdr_len : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:512
      field_13 : aliased anon_310;
      priority : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:520
      ignore_df : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:522
      cloned : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:523
      ip_summed : Extensions.Unsigned_2;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:524
      nohdr : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:525
      nfctinfo : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:526
      pkt_type : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:527
      fclone : Extensions.Unsigned_2;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:528
      ipvs_property : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:529
      peeked : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:530
      nf_trace : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:531
      protocol : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:533
      destructor : access procedure (arg1 : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:535
      nfct : access nf_conntrack;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:537
      nf_bridge : access nf_bridge_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:540
      skb_iif : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:543
      hash : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:545
      vlan_proto : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:547
      vlan_tci : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:548
      tc_index : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:551
      tc_verd : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:553
      queue_mapping : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:557
      ndisc_nodetype : Extensions.Unsigned_2;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:560
      pfmemalloc : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:562
      ooo_okay : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:563
      l4_hash : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:564
      wifi_acked_valid : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:565
      wifi_acked : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:566
      no_fcs : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:567
      head_frag : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:568
      encapsulation : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:574
      encap_hdr_csum : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:575
      csum_valid : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:576
      csum_complete_sw : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:577
      field_48 : aliased anon_312;
      secmark : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:588
      field_50 : aliased anon_313;
      inner_protocol : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:596
      inner_transport_header : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:597
      inner_network_header : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:598
      inner_mac_header : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:599
      transport_header : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:600
      network_header : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:601
      mac_header : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:602
      tail : aliased sk_buff_data_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:604
      c_end : aliased sk_buff_data_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:605
      head : access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:606
      data : access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:607
      truesize : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:608
      users : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:609
   end record;
   pragma Convention (C_Pass_By_Copy, sk_buff);
   pragma Pack (sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:484

  -- traffic control index  
  -- traffic control verdict  
  -- Encapsulation protocol and NIC drivers should use
  --	 * this flag to indicate to each other if the skb contains
  --	 * encapsulated packet or not and maybe use the inner packet
  --	 * headers if needed
  --	  

  -- 3/5 bit hole (depending on ndisc_nodetype presence)  
  -- These elements must be at the end, see alloc_skb() for details.   
  -- *	Handling routines are only of interest to the kernel
  --  

  -- Returns true if the skb was allocated from PFMEMALLOC reserves  
   function skb_pfmemalloc (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:623
   pragma Import (CPP, skb_pfmemalloc, "_ZL14skb_pfmemallocPK7sk_buff");

  -- * skb might have a dst pointer attached, refcounted or not.
  -- * _skb_refdst low order bit is set if refcount was _not_ taken
  --  

  --*
  -- * skb_dst - returns skb dst_entry
  -- * @skb: buffer
  -- *
  -- * Returns skb dst_entry, regardless of reference taken or not.
  --  

   --  skipped empty struct dst_entry

   function skb_dst (skb : access constant sk_buff) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:641
   pragma Import (CPP, skb_dst, "_ZL7skb_dstPK7sk_buff");

  -- If refdst was not refcounted, check we still are in a 
  --	 * rcu_read_lock section
  --	  

  --*
  -- * skb_dst_set - sets skb dst
  -- * @skb: buffer
  -- * @dst: dst entry
  -- *
  -- * Sets skb dst, assuming a reference was taken on dst and should
  -- * be released by skb_dst_drop()
  --  

   procedure skb_dst_set (skb : access sk_buff; dst : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:660
   pragma Import (CPP, skb_dst_set, "_ZL11skb_dst_setP7sk_buffP9dst_entry");

   --  skipped func __skb_dst_set_noref

  --*
  -- * skb_dst_set_noref - sets skb dst, hopefully, without taking reference
  -- * @skb: buffer
  -- * @dst: dst entry
  -- *
  -- * Sets skb dst, assuming a reference was not taken on dst.
  -- * If dst entry is cached, we do not take reference and dst_release
  -- * will be avoided by refdst_drop. If dst entry is not cached, we take
  -- * reference, so that last dst_release can destroy the dst immediately.
  --  

   procedure skb_dst_set_noref (skb : access sk_buff; dst : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:678
   pragma Import (CPP, skb_dst_set_noref, "_ZL17skb_dst_set_norefP7sk_buffP9dst_entry");

  --*
  -- * skb_dst_set_noref_force - sets skb dst, without taking reference
  -- * @skb: buffer
  -- * @dst: dst entry
  -- *
  -- * Sets skb dst, assuming a reference was not taken on dst.
  -- * No reference is taken and no dst_release will be called. While for
  -- * cached dsts deferred reclaim is a basic feature, for entries that are
  -- * not cached it is caller's job to guarantee that last dst_release for
  -- * provided dst happens when nobody uses it, eg. after a RCU grace period.
  --  

   procedure skb_dst_set_noref_force (skb : access sk_buff; dst : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:694
   pragma Import (CPP, skb_dst_set_noref_force, "_ZL23skb_dst_set_noref_forceP7sk_buffP9dst_entry");

  --*
  -- * skb_dst_is_noref - Test if skb dst isn't refcounted
  -- * @skb: buffer
  --  

   function skb_dst_is_noref (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:704
   pragma Import (CPP, skb_dst_is_noref, "_ZL16skb_dst_is_norefPK7sk_buff");

   --  skipped empty struct rtable

   function skb_rtable (skb : access constant sk_buff) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:709
   pragma Import (CPP, skb_rtable, "_ZL10skb_rtablePK7sk_buff");

   procedure kfree_skb (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:714
   pragma Import (CPP, kfree_skb, "_Z9kfree_skbP7sk_buff");

   procedure kfree_skb_list (segs : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:715
   pragma Import (CPP, kfree_skb_list, "_Z14kfree_skb_listP7sk_buff");

   procedure skb_tx_error (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:716
   pragma Import (CPP, skb_tx_error, "_Z12skb_tx_errorP7sk_buff");

   procedure consume_skb (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:717
   pragma Import (CPP, consume_skb, "_Z11consume_skbP7sk_buff");

   --  skipped func __kfree_skb

   skbuff_head_cache : access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:719
   pragma Import (C, skbuff_head_cache, "skbuff_head_cache");

   procedure kfree_skb_partial (skb : access sk_buff; head_stolen : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:721
   pragma Import (CPP, kfree_skb_partial, "_Z17kfree_skb_partialP7sk_buffb");

   function skb_try_coalesce
     (to : access sk_buff;
      from : access sk_buff;
      fragstolen : access Extensions.bool;
      delta_truesize : access int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:722
   pragma Import (CPP, skb_try_coalesce, "_Z16skb_try_coalesceP7sk_buffS0_PbPi");

   --  skipped func __alloc_skb

   function build_skb (data : System.Address; frag_size : unsigned) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:727
   pragma Import (CPP, build_skb, "_Z9build_skbPvj");

   function alloc_skb (size : unsigned; priority : linux_types_h.gfp_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:728
   pragma Import (CPP, alloc_skb, "_ZL9alloc_skbjj");

   function alloc_skb_fclone (size : unsigned; priority : linux_types_h.gfp_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:734
   pragma Import (CPP, alloc_skb_fclone, "_ZL16alloc_skb_fclonejj");

   --  skipped func __alloc_skb_head

   function alloc_skb_head (priority : linux_types_h.gfp_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:741
   pragma Import (CPP, alloc_skb_head, "_ZL14alloc_skb_headj");

   function skb_morph (dst : access sk_buff; src : access sk_buff) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:746
   pragma Import (CPP, skb_morph, "_Z9skb_morphP7sk_buffS0_");

   function skb_copy_ubufs (skb : access sk_buff; gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:747
   pragma Import (CPP, skb_copy_ubufs, "_Z14skb_copy_ubufsP7sk_buffj");

   function skb_clone (skb : access sk_buff; priority : linux_types_h.gfp_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:748
   pragma Import (CPP, skb_clone, "_Z9skb_cloneP7sk_buffj");

   function skb_copy (skb : access constant sk_buff; priority : linux_types_h.gfp_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:749
   pragma Import (CPP, skb_copy, "_Z8skb_copyPK7sk_buffj");

   --  skipped func __pskb_copy_fclone

   --  skipped func __pskb_copy

   function pskb_expand_head
     (skb : access sk_buff;
      nhead : int;
      ntail : int;
      gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:758
   pragma Import (CPP, pskb_expand_head, "_Z16pskb_expand_headP7sk_buffiij");

   function skb_realloc_headroom (skb : access sk_buff; headroom : unsigned) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:759
   pragma Import (CPP, skb_realloc_headroom, "_Z20skb_realloc_headroomP7sk_buffj");

   function skb_copy_expand
     (skb : access constant sk_buff;
      newheadroom : int;
      newtailroom : int;
      priority : linux_types_h.gfp_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:761
   pragma Import (CPP, skb_copy_expand, "_Z15skb_copy_expandPK7sk_buffiij");

   function skb_to_sgvec_nomark
     (skb : access sk_buff;
      sg : access asm_generic_scatterlist_h.scatterlist;
      offset : int;
      len : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:763
   pragma Import (CPP, skb_to_sgvec_nomark, "_Z19skb_to_sgvec_nomarkP7sk_buffP11scatterlistii");

   function skb_to_sgvec
     (skb : access sk_buff;
      sg : access asm_generic_scatterlist_h.scatterlist;
      offset : int;
      len : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:765
   pragma Import (CPP, skb_to_sgvec, "_Z12skb_to_sgvecP7sk_buffP11scatterlistii");

   function skb_cow_data
     (skb : access sk_buff;
      tailbits : int;
      trailer : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:767
   pragma Import (CPP, skb_cow_data, "_Z12skb_cow_dataP7sk_buffiPS0_");

   function skb_pad (skb : access sk_buff; pad : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:768
   pragma Import (CPP, skb_pad, "_Z7skb_padP7sk_buffi");

   function skb_append_datato_frags
     (sk : System.Address;
      skb : access sk_buff;
      getfrag : access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : int;
         arg5 : int;
         arg6 : access sk_buff) return int;
      from : System.Address;
      length : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:771
   pragma Import (CPP, skb_append_datato_frags, "_Z23skb_append_datato_fragsP4sockP7sk_buffPFiPvPciiiS2_ES3_i");

   type skb_seq_state is record
      lower_offset : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:777
      upper_offset : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:778
      frag_idx : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:779
      stepped_offset : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:780
      root_skb : access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:781
      cur_skb : access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:782
      frag_data : access uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:783
   end record;
   pragma Convention (C_Pass_By_Copy, skb_seq_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:776

   procedure skb_prepare_seq_read
     (skb : access sk_buff;
      from : unsigned;
      to : unsigned;
      st : access skb_seq_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:786
   pragma Import (CPP, skb_prepare_seq_read, "_Z20skb_prepare_seq_readP7sk_buffjjP13skb_seq_state");

   function skb_seq_read
     (consumed : unsigned;
      data : System.Address;
      st : access skb_seq_state) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:788
   pragma Import (CPP, skb_seq_read, "_Z12skb_seq_readjPPKhP13skb_seq_state");

   procedure skb_abort_seq_read (st : access skb_seq_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:790
   pragma Import (CPP, skb_abort_seq_read, "_Z18skb_abort_seq_readP13skb_seq_state");

   function skb_find_text
     (skb : access sk_buff;
      from : unsigned;
      to : unsigned;
      config : access linux_textsearch_h.ts_config;
      state : access linux_textsearch_h.ts_state) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:792
   pragma Import (CPP, skb_find_text, "_Z13skb_find_textP7sk_buffjjP9ts_configP8ts_state");

  -- * Packet hash types specify the type of hash in skb_set_hash.
  -- *
  -- * Hash types refer to the protocol layer addresses which are used to
  -- * construct a packet's hash. The hashes are used to differentiate or identify
  -- * flows of the protocol layer for the hash type. Hash types are either
  -- * layer-2 (L2), layer-3 (L3), or layer-4 (L4).
  -- *
  -- * Properties of hashes:
  -- *
  -- * 1) Two packets in different flows have different hash values
  -- * 2) Two packets in the same flow should have the same hash value
  -- *
  -- * A hash at a higher layer is considered to be more specific. A driver should
  -- * set the most specific hash possible.
  -- *
  -- * A driver cannot indicate a more specific hash than the layer at which a hash
  -- * was computed. For instance an L3 hash cannot be set as an L4 hash.
  -- *
  -- * A driver may indicate a hash level which is less specific than the
  -- * actual layer the hash was computed on. For instance, a hash computed
  -- * at L4 may be considered an L3 hash. This should only be done if the
  -- * driver can't unambiguously determine that the HW computed the hash at
  -- * the higher layer. Note that the "should" in the second property above
  -- * permits this.
  --  

   type pkt_hash_types is 
     (PKT_HASH_TYPE_NONE,
      PKT_HASH_TYPE_L2,
      PKT_HASH_TYPE_L3,
      PKT_HASH_TYPE_L4);
   pragma Convention (C, pkt_hash_types);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:822

  -- Undefined type  
  -- Input: src_MAC, dest_MAC  
  -- Input: src_IP, dst_IP  
  -- Input: src_IP, dst_IP, src_port, dst_port  
   procedure skb_set_hash
     (skb : access sk_buff;
      hash : uapi_asm_generic_int_ll64_h.uu_u32;
      c_type : pkt_hash_types);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:830
   pragma Import (CPP, skb_set_hash, "_ZL12skb_set_hashP7sk_buffj14pkt_hash_types");

   --  skipped func __skb_get_hash

   function skb_get_hash (skb : access sk_buff) return uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:837
   pragma Import (CPP, skb_get_hash, "_ZL12skb_get_hashP7sk_buff");

   function skb_get_hash_raw (skb : access constant sk_buff) return uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:845
   pragma Import (CPP, skb_get_hash_raw, "_ZL16skb_get_hash_rawPK7sk_buff");

   procedure skb_clear_hash (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:850
   pragma Import (CPP, skb_clear_hash, "_ZL14skb_clear_hashP7sk_buff");

   procedure skb_clear_hash_if_not_l4 (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:856
   pragma Import (CPP, skb_clear_hash_if_not_l4, "_ZL24skb_clear_hash_if_not_l4P7sk_buff");

   procedure skb_copy_hash (to : access sk_buff; from : access constant sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:862
   pragma Import (CPP, skb_copy_hash, "_ZL13skb_copy_hashP7sk_buffPKS_");

   function skb_end_pointer (skb : access constant sk_buff) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:869
   pragma Import (CPP, skb_end_pointer, "_ZL15skb_end_pointerPK7sk_buff");

   function skb_end_offset (skb : access constant sk_buff) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:874
   pragma Import (CPP, skb_end_offset, "_ZL14skb_end_offsetPK7sk_buff");

  -- Internal  
   function skb_hwtstamps (skb : access sk_buff) return access skb_shared_hwtstamps;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:893
   pragma Import (CPP, skb_hwtstamps, "_ZL13skb_hwtstampsP7sk_buff");

  --*
  -- *	skb_queue_empty - check if a queue is empty
  -- *	@list: queue head
  -- *
  -- *	Returns true if the queue is empty, false otherwise.
  --  

   function skb_queue_empty (list : access constant sk_buff_head) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:904
   pragma Import (CPP, skb_queue_empty, "_ZL15skb_queue_emptyPK12sk_buff_head");

  --*
  -- *	skb_queue_is_last - check if skb is the last entry in the queue
  -- *	@list: queue head
  -- *	@skb: buffer
  -- *
  -- *	Returns true if @skb is the last buffer on the list.
  --  

   function skb_queue_is_last (list : access constant sk_buff_head; skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:916
   pragma Import (CPP, skb_queue_is_last, "_ZL17skb_queue_is_lastPK12sk_buff_headPK7sk_buff");

  --*
  -- *	skb_queue_is_first - check if skb is the first entry in the queue
  -- *	@list: queue head
  -- *	@skb: buffer
  -- *
  -- *	Returns true if @skb is the first buffer on the list.
  --  

   function skb_queue_is_first (list : access constant sk_buff_head; skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:929
   pragma Import (CPP, skb_queue_is_first, "_ZL18skb_queue_is_firstPK12sk_buff_headPK7sk_buff");

  --*
  -- *	skb_queue_next - return the next packet in the queue
  -- *	@list: queue head
  -- *	@skb: current buffer
  -- *
  -- *	Return the next packet in @list after @skb.  It is only valid to
  -- *	call this if skb_queue_is_last() evaluates to false.
  --  

   function skb_queue_next (list : access constant sk_buff_head; skb : access constant sk_buff) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:943
   pragma Import (CPP, skb_queue_next, "_ZL14skb_queue_nextPK12sk_buff_headPK7sk_buff");

  -- This BUG_ON may seem severe, but if we just return then we
  --	 * are going to dereference garbage.
  --	  

  --*
  -- *	skb_queue_prev - return the prev packet in the queue
  -- *	@list: queue head
  -- *	@skb: current buffer
  -- *
  -- *	Return the prev packet in @list before @skb.  It is only valid to
  -- *	call this if skb_queue_is_first() evaluates to false.
  --  

   function skb_queue_prev (list : access constant sk_buff_head; skb : access constant sk_buff) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:961
   pragma Import (CPP, skb_queue_prev, "_ZL14skb_queue_prevPK12sk_buff_headPK7sk_buff");

  -- This BUG_ON may seem severe, but if we just return then we
  --	 * are going to dereference garbage.
  --	  

  --*
  -- *	skb_get - reference buffer
  -- *	@skb: buffer to reference
  -- *
  -- *	Makes another reference to a socket buffer and returns a pointer
  -- *	to the buffer.
  --  

   function skb_get (skb : access sk_buff) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:978
   pragma Import (CPP, skb_get, "_ZL7skb_getP7sk_buff");

  -- * If users == 1, we are the only owner and are can avoid redundant
  -- * atomic change.
  --  

  --*
  -- *	skb_cloned - is the buffer a clone
  -- *	@skb: buffer to check
  -- *
  -- *	Returns true if the buffer was generated with skb_clone() and is
  -- *	one of multiple shared copies of the buffer. Cloned buffers are
  -- *	shared data so must not be written to under normal circumstances.
  --  

   function skb_cloned (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:997
   pragma Import (CPP, skb_cloned, "_ZL10skb_clonedPK7sk_buff");

   function skb_unclone (skb : access sk_buff; pri : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1003
   pragma Import (CPP, skb_unclone, "_ZL11skb_uncloneP7sk_buffj");

  --*
  -- *	skb_header_cloned - is the header a clone
  -- *	@skb: buffer to check
  -- *
  -- *	Returns true if modifying the header part of the buffer requires
  -- *	the data to be copied.
  --  

   function skb_header_cloned (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1020
   pragma Import (CPP, skb_header_cloned, "_ZL17skb_header_clonedPK7sk_buff");

  --*
  -- *	skb_header_release - release reference to header
  -- *	@skb: buffer to operate on
  -- *
  -- *	Drop a reference to the header part of the buffer.  This is done
  -- *	by acquiring a payload reference.  You must not read from the header
  -- *	part of skb->data after this.
  --  

   procedure skb_header_release (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1040
   pragma Import (CPP, skb_header_release, "_ZL18skb_header_releaseP7sk_buff");

  --*
  -- *	skb_shared - is the buffer shared
  -- *	@skb: buffer to check
  -- *
  -- *	Returns true if more than one person has a reference to this
  -- *	buffer.
  --  

   function skb_shared (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1054
   pragma Import (CPP, skb_shared, "_ZL10skb_sharedPK7sk_buff");

  --*
  -- *	skb_share_check - check if buffer is shared and if so clone it
  -- *	@skb: buffer to check
  -- *	@pri: priority for memory allocation
  -- *
  -- *	If the buffer is shared the buffer is cloned and the old copy
  -- *	drops a reference. A new clone with a single reference is returned.
  -- *	If the buffer is not shared the original buffer is returned. When
  -- *	being called from interrupt status or with spinlocks held pri must
  -- *	be GFP_ATOMIC.
  -- *
  -- *	NULL is returned on a memory allocation failure.
  --  

   function skb_share_check (skb : access sk_buff; pri : linux_types_h.gfp_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1072
   pragma Import (CPP, skb_share_check, "_ZL15skb_share_checkP7sk_buffj");

  -- *	Copy shared buffers into a new sk_buff. We effectively do COW on
  -- *	packets to handle cases where we have a local reader and forward
  -- *	and a couple of other messy ones. The normal one is tcpdumping
  -- *	a packet thats being forwarded.
  --  

  --*
  -- *	skb_unshare - make a copy of a shared buffer
  -- *	@skb: buffer to check
  -- *	@pri: priority for memory allocation
  -- *
  -- *	If the socket buffer is a clone then this function creates a new
  -- *	copy of the data, drops a reference count on the old copy and returns
  -- *	the new copy with the reference count at 1. If the buffer is not a clone
  -- *	the original buffer is returned. When called with a spinlock held or
  -- *	from interrupt state @pri must be %GFP_ATOMIC
  -- *
  -- *	%NULL is returned on a memory allocation failure.
  --  

   function skb_unshare (skb : access sk_buff; pri : linux_types_h.gfp_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1107
   pragma Import (CPP, skb_unshare, "_ZL11skb_unshareP7sk_buffj");

  -- Free our shared copy  
  --*
  -- *	skb_peek - peek at the head of an &sk_buff_head
  -- *	@list_: list to peek at
  -- *
  -- *	Peek an &sk_buff. Unlike most other operations you _MUST_
  -- *	be careful with this one. A peek leaves the buffer on the
  -- *	list and someone else may run off with it. You must hold
  -- *	the appropriate locks or have a private queue to do this.
  -- *
  -- *	Returns %NULL for an empty list or a pointer to the head element.
  -- *	The reference count is not incremented and the reference is therefore
  -- *	volatile. Use with caution.
  --  

   function skb_peek (list_u : access constant sk_buff_head) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1132
   pragma Import (CPP, skb_peek, "_ZL8skb_peekPK12sk_buff_head");

  --*
  -- *	skb_peek_next - peek skb following the given one from a queue
  -- *	@skb: skb to start from
  -- *	@list_: list to peek at
  -- *
  -- *	Returns %NULL when the end of the list is met or a pointer to the
  -- *	next element. The reference count is not incremented and the
  -- *	reference is therefore volatile. Use with caution.
  --  

   function skb_peek_next (skb : access sk_buff; list_u : access constant sk_buff_head) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1150
   pragma Import (CPP, skb_peek_next, "_ZL13skb_peek_nextP7sk_buffPK12sk_buff_head");

  --*
  -- *	skb_peek_tail - peek at the tail of an &sk_buff_head
  -- *	@list_: list to peek at
  -- *
  -- *	Peek an &sk_buff. Unlike most other operations you _MUST_
  -- *	be careful with this one. A peek leaves the buffer on the
  -- *	list and someone else may run off with it. You must hold
  -- *	the appropriate locks or have a private queue to do this.
  -- *
  -- *	Returns %NULL for an empty list or a pointer to the tail element.
  -- *	The reference count is not incremented and the reference is therefore
  -- *	volatile. Use with caution.
  --  

   function skb_peek_tail (list_u : access constant sk_buff_head) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1173
   pragma Import (CPP, skb_peek_tail, "_ZL13skb_peek_tailPK12sk_buff_head");

  --*
  -- *	skb_queue_len	- get queue length
  -- *	@list_: list to measure
  -- *
  -- *	Return the length of an &sk_buff queue.
  --  

   function skb_queue_len (list_u : access constant sk_buff_head) return uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1189
   pragma Import (CPP, skb_queue_len, "_ZL13skb_queue_lenPK12sk_buff_head");

  --*
  -- *	__skb_queue_head_init - initialize non-spinlock portions of sk_buff_head
  -- *	@list: queue to initialize
  -- *
  -- *	This initializes only the list and queue length aspects of
  -- *	an sk_buff_head object.  This allows to initialize the list
  -- *	aspects of an sk_buff_head without reinitializing things like
  -- *	the spinlock.  It can also be used for on-stack sk_buff_head
  -- *	objects where the spinlock is known to not be used.
  --  

   --  skipped func __skb_queue_head_init

  -- * This function creates a split out lock class for each invocation;
  -- * this is needed for now since a whole lot of users of the skb-queue
  -- * infrastructure in drivers have different locking usage (in hardirq)
  -- * than the networking core (in softirq only). In the long run either the
  -- * network layer or drivers should need annotation to consolidate the
  -- * main types of usage into 3 classes.
  --  

   procedure skb_queue_head_init (list : access sk_buff_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1218
   pragma Import (CPP, skb_queue_head_init, "_ZL19skb_queue_head_initP12sk_buff_head");

   procedure skb_queue_head_init_class (list : access sk_buff_head; arg2 : access linux_lockdep_h.lock_class_key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1224
   pragma Import (CPP, skb_queue_head_init_class, "_ZL25skb_queue_head_init_classP12sk_buff_headP14lock_class_key");

  -- *	Insert an sk_buff on a list.
  -- *
  -- *	The "__skb_xxxx()" functions are the non-atomic ones that
  -- *	can only be called with interrupts disabled.
  --  

   procedure skb_insert
     (old : access sk_buff;
      newsk : access sk_buff;
      list : access sk_buff_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1237
   pragma Import (CPP, skb_insert, "_Z10skb_insertP7sk_buffS0_P12sk_buff_head");

   --  skipped func __skb_insert

   --  skipped func __skb_queue_splice

  --*
  -- *	skb_queue_splice - join two skb lists, this is designed for stacks
  -- *	@list: the new list to add
  -- *	@head: the place to add it in the first list
  --  

   procedure skb_queue_splice (list : access constant sk_buff_head; head : access sk_buff_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1268
   pragma Import (CPP, skb_queue_splice, "_ZL16skb_queue_splicePK12sk_buff_headPS_");

  --*
  -- *	skb_queue_splice_init - join two skb lists and reinitialise the emptied list
  -- *	@list: the new list to add
  -- *	@head: the place to add it in the first list
  -- *
  -- *	The list at @list is reinitialised
  --  

   procedure skb_queue_splice_init (list : access sk_buff_head; head : access sk_buff_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1284
   pragma Import (CPP, skb_queue_splice_init, "_ZL21skb_queue_splice_initP12sk_buff_headS0_");

  --*
  -- *	skb_queue_splice_tail - join two skb lists, each list being a queue
  -- *	@list: the new list to add
  -- *	@head: the place to add it in the first list
  --  

   procedure skb_queue_splice_tail (list : access constant sk_buff_head; head : access sk_buff_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1299
   pragma Import (CPP, skb_queue_splice_tail, "_ZL21skb_queue_splice_tailPK12sk_buff_headPS_");

  --*
  -- *	skb_queue_splice_tail_init - join two skb lists and reinitialise the emptied list
  -- *	@list: the new list to add
  -- *	@head: the place to add it in the first list
  -- *
  -- *	Each of the lists is a queue.
  -- *	The list at @list is reinitialised
  --  

   procedure skb_queue_splice_tail_init (list : access sk_buff_head; head : access sk_buff_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1316
   pragma Import (CPP, skb_queue_splice_tail_init, "_ZL26skb_queue_splice_tail_initP12sk_buff_headS0_");

  --*
  -- *	__skb_queue_after - queue a buffer at the list head
  -- *	@list: list to use
  -- *	@prev: place after this buffer
  -- *	@newsk: buffer to queue
  -- *
  -- *	Queue a buffer int the middle of a list. This function takes no locks
  -- *	and you must therefore hold required locks before calling it.
  -- *
  -- *	A buffer cannot be placed on two lists at the same time.
  --  

   --  skipped func __skb_queue_after

   procedure skb_append
     (old : access sk_buff;
      newsk : access sk_buff;
      list : access sk_buff_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1344
   pragma Import (CPP, skb_append, "_Z10skb_appendP7sk_buffS0_P12sk_buff_head");

   --  skipped func __skb_queue_before

  --*
  -- *	__skb_queue_head - queue a buffer at the list head
  -- *	@list: list to use
  -- *	@newsk: buffer to queue
  -- *
  -- *	Queue a buffer at the start of a list. This function takes no locks
  -- *	and you must therefore hold required locks before calling it.
  -- *
  -- *	A buffer cannot be placed on two lists at the same time.
  --  

   procedure skb_queue_head (list : access sk_buff_head; newsk : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1364
   pragma Import (CPP, skb_queue_head, "_Z14skb_queue_headP12sk_buff_headP7sk_buff");

   --  skipped func __skb_queue_head

  --*
  -- *	__skb_queue_tail - queue a buffer at the list tail
  -- *	@list: list to use
  -- *	@newsk: buffer to queue
  -- *
  -- *	Queue a buffer at the end of a list. This function takes no locks
  -- *	and you must therefore hold required locks before calling it.
  -- *
  -- *	A buffer cannot be placed on two lists at the same time.
  --  

   procedure skb_queue_tail (list : access sk_buff_head; newsk : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1381
   pragma Import (CPP, skb_queue_tail, "_Z14skb_queue_tailP12sk_buff_headP7sk_buff");

   --  skipped func __skb_queue_tail

  -- * remove sk_buff from list. _Must_ be called atomically, and with
  -- * the list known..
  --  

   procedure skb_unlink (skb : access sk_buff; list : access sk_buff_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1392
   pragma Import (CPP, skb_unlink, "_Z10skb_unlinkP7sk_buffP12sk_buff_head");

   --  skipped func __skb_unlink

  --*
  -- *	__skb_dequeue - remove from the head of the queue
  -- *	@list: list to dequeue from
  -- *
  -- *	Remove the head of the list. This function does not take any locks
  -- *	so must be used with appropriate locks held only. The head item is
  -- *	returned or %NULL if the list is empty.
  --  

   function skb_dequeue (list : access sk_buff_head) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1413
   pragma Import (CPP, skb_dequeue, "_Z11skb_dequeueP12sk_buff_head");

   --  skipped func __skb_dequeue

  --*
  -- *	__skb_dequeue_tail - remove from the tail of the queue
  -- *	@list: list to dequeue from
  -- *
  -- *	Remove the tail of the list. This function does not take any locks
  -- *	so must be used with appropriate locks held only. The tail item is
  -- *	returned or %NULL if the list is empty.
  --  

   function skb_dequeue_tail (list : access sk_buff_head) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1430
   pragma Import (CPP, skb_dequeue_tail, "_Z16skb_dequeue_tailP12sk_buff_head");

   --  skipped func __skb_dequeue_tail

   function skb_is_nonlinear (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1440
   pragma Import (CPP, skb_is_nonlinear, "_ZL16skb_is_nonlinearPK7sk_buff");

   function skb_headlen (skb : access constant sk_buff) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1445
   pragma Import (CPP, skb_headlen, "_ZL11skb_headlenPK7sk_buff");

   function skb_pagelen (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1450
   pragma Import (CPP, skb_pagelen, "_ZL11skb_pagelenPK7sk_buff");

  --*
  -- * __skb_fill_page_desc - initialise a paged fragment in an skb
  -- * @skb: buffer containing fragment to be initialised
  -- * @i: paged fragment index to initialise
  -- * @page: the page to use for this fragment
  -- * @off: the offset to the data with @page
  -- * @size: the length of the data
  -- *
  -- * Initialises the @i'th fragment of @skb to point to &size bytes at
  -- * offset @off within @page.
  -- *
  -- * Does not take any additional reference on the fragment.
  --  

   --  skipped func __skb_fill_page_desc

  --	 * Propagate page->pfmemalloc to the skb if we can. The problem is
  --	 * that not all callers have unique ownership of the page. If
  --	 * pfmemalloc is set, we check the mapping as a mapping implies
  --	 * page->index is set (index and pfmemalloc share space).
  --	 * If it's a valid mapping, we cannot use page->pfmemalloc but we
  --	 * do not lose pfmemalloc information as the pages would not be
  --	 * allocated using __GFP_MEMALLOC.
  --	  

  --*
  -- * skb_fill_page_desc - initialise a paged fragment in an skb
  -- * @skb: buffer containing fragment to be initialised
  -- * @i: paged fragment index to initialise
  -- * @page: the page to use for this fragment
  -- * @off: the offset to the data with @page
  -- * @size: the length of the data
  -- *
  -- * As per __skb_fill_page_desc() -- initialises the @i'th fragment of
  -- * @skb to point to @size bytes at offset @off within @page. In
  -- * addition updates @skb such that @i is the last fragment.
  -- *
  -- * Does not take any additional reference on the fragment.
  --  

   procedure skb_fill_page_desc
     (skb : access sk_buff;
      i : int;
      the_page : access linux_mm_types_h.page;
      off : int;
      size : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1509
   pragma Import (CPP, skb_fill_page_desc, "_ZL18skb_fill_page_descP7sk_buffiP4pageii");

   procedure skb_add_rx_frag
     (skb : access sk_buff;
      i : int;
      the_page : access linux_mm_types_h.page;
      off : int;
      size : int;
      truesize : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1516
   pragma Import (CPP, skb_add_rx_frag, "_Z15skb_add_rx_fragP7sk_buffiP4pageiij");

   procedure skb_coalesce_rx_frag
     (skb : access sk_buff;
      i : int;
      size : int;
      truesize : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1519
   pragma Import (CPP, skb_coalesce_rx_frag, "_Z20skb_coalesce_rx_fragP7sk_buffiij");

   function skb_tail_pointer (skb : access constant sk_buff) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1527
   pragma Import (CPP, skb_tail_pointer, "_ZL16skb_tail_pointerPK7sk_buff");

   procedure skb_reset_tail_pointer (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1532
   pragma Import (CPP, skb_reset_tail_pointer, "_ZL22skb_reset_tail_pointerP7sk_buff");

   procedure skb_set_tail_pointer (skb : access sk_buff; offset : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1537
   pragma Import (CPP, skb_set_tail_pointer, "_ZL20skb_set_tail_pointerP7sk_buffi");

  -- *	Add data to an sk_buff
  --  

   function pskb_put
     (skb : access sk_buff;
      tail : access sk_buff;
      len : int) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1564
   pragma Import (CPP, pskb_put, "_Z8pskb_putP7sk_buffS0_i");

   function skb_put (skb : access sk_buff; len : unsigned) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1565
   pragma Import (CPP, skb_put, "_Z7skb_putP7sk_buffj");

   --  skipped func __skb_put

   function skb_push (skb : access sk_buff; len : unsigned) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1575
   pragma Import (CPP, skb_push, "_Z8skb_pushP7sk_buffj");

   --  skipped func __skb_push

   function skb_pull (skb : access sk_buff; len : unsigned) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1583
   pragma Import (CPP, skb_pull, "_Z8skb_pullP7sk_buffj");

   --  skipped func __skb_pull

   function skb_pull_inline (skb : access sk_buff; len : unsigned) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1591
   pragma Import (CPP, skb_pull_inline, "_ZL15skb_pull_inlineP7sk_buffj");

   --  skipped func __pskb_pull_tail

   --  skipped func __pskb_pull

   function pskb_pull (skb : access sk_buff; len : unsigned) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1607
   pragma Import (CPP, pskb_pull, "_ZL9pskb_pullP7sk_buffj");

   function pskb_may_pull (skb : access sk_buff; len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1612
   pragma Import (CPP, pskb_may_pull, "_ZL13pskb_may_pullP7sk_buffj");

  --*
  -- *	skb_headroom - bytes at buffer head
  -- *	@skb: buffer to check
  -- *
  -- *	Return the number of bytes of free space at the head of an &sk_buff.
  --  

   function skb_headroom (skb : access constant sk_buff) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1627
   pragma Import (CPP, skb_headroom, "_ZL12skb_headroomPK7sk_buff");

  --*
  -- *	skb_tailroom - bytes at buffer end
  -- *	@skb: buffer to check
  -- *
  -- *	Return the number of bytes of free space at the tail of an sk_buff
  --  

   function skb_tailroom (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1638
   pragma Import (CPP, skb_tailroom, "_ZL12skb_tailroomPK7sk_buff");

  --*
  -- *	skb_availroom - bytes at buffer end
  -- *	@skb: buffer to check
  -- *
  -- *	Return the number of bytes of free space at the tail of an sk_buff
  -- *	allocated by sk_stream_alloc()
  --  

   function skb_availroom (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1650
   pragma Import (CPP, skb_availroom, "_ZL13skb_availroomPK7sk_buff");

  --*
  -- *	skb_reserve - adjust headroom
  -- *	@skb: buffer to alter
  -- *	@len: bytes to move
  -- *
  -- *	Increase the headroom of an empty &sk_buff by reducing the tail
  -- *	room. This is only allowed for an empty buffer.
  --  

   procedure skb_reserve (skb : access sk_buff; len : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1666
   pragma Import (CPP, skb_reserve, "_ZL11skb_reserveP7sk_buffi");

   procedure skb_reset_inner_headers (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1672
   pragma Import (CPP, skb_reset_inner_headers, "_ZL23skb_reset_inner_headersP7sk_buff");

   procedure skb_reset_mac_len (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1679
   pragma Import (CPP, skb_reset_mac_len, "_ZL17skb_reset_mac_lenP7sk_buff");

   function skb_inner_transport_header (skb : access constant sk_buff) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1684
   pragma Import (CPP, skb_inner_transport_header, "_ZL26skb_inner_transport_headerPK7sk_buff");

   procedure skb_reset_inner_transport_header (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1690
   pragma Import (CPP, skb_reset_inner_transport_header, "_ZL32skb_reset_inner_transport_headerP7sk_buff");

   procedure skb_set_inner_transport_header (skb : access sk_buff; offset : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1695
   pragma Import (CPP, skb_set_inner_transport_header, "_ZL30skb_set_inner_transport_headerP7sk_buffi");

   function skb_inner_network_header (skb : access constant sk_buff) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1702
   pragma Import (CPP, skb_inner_network_header, "_ZL24skb_inner_network_headerPK7sk_buff");

   procedure skb_reset_inner_network_header (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1707
   pragma Import (CPP, skb_reset_inner_network_header, "_ZL30skb_reset_inner_network_headerP7sk_buff");

   procedure skb_set_inner_network_header (skb : access sk_buff; offset : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1712
   pragma Import (CPP, skb_set_inner_network_header, "_ZL28skb_set_inner_network_headerP7sk_buffi");

   function skb_inner_mac_header (skb : access constant sk_buff) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1719
   pragma Import (CPP, skb_inner_mac_header, "_ZL20skb_inner_mac_headerPK7sk_buff");

   procedure skb_reset_inner_mac_header (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1724
   pragma Import (CPP, skb_reset_inner_mac_header, "_ZL26skb_reset_inner_mac_headerP7sk_buff");

   procedure skb_set_inner_mac_header (skb : access sk_buff; offset : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1729
   pragma Import (CPP, skb_set_inner_mac_header, "_ZL24skb_set_inner_mac_headerP7sk_buffi");

   function skb_transport_header_was_set (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1735
   pragma Import (CPP, skb_transport_header_was_set, "_ZL28skb_transport_header_was_setPK7sk_buff");

   function skb_transport_header (skb : access constant sk_buff) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1740
   pragma Import (CPP, skb_transport_header, "_ZL20skb_transport_headerPK7sk_buff");

   procedure skb_reset_transport_header (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1745
   pragma Import (CPP, skb_reset_transport_header, "_ZL26skb_reset_transport_headerP7sk_buff");

   procedure skb_set_transport_header (skb : access sk_buff; offset : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1750
   pragma Import (CPP, skb_set_transport_header, "_ZL24skb_set_transport_headerP7sk_buffi");

   function skb_network_header (skb : access constant sk_buff) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1757
   pragma Import (CPP, skb_network_header, "_ZL18skb_network_headerPK7sk_buff");

   procedure skb_reset_network_header (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1762
   pragma Import (CPP, skb_reset_network_header, "_ZL24skb_reset_network_headerP7sk_buff");

   procedure skb_set_network_header (skb : access sk_buff; offset : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1767
   pragma Import (CPP, skb_set_network_header, "_ZL22skb_set_network_headerP7sk_buffi");

   function skb_mac_header (skb : access constant sk_buff) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1773
   pragma Import (CPP, skb_mac_header, "_ZL14skb_mac_headerPK7sk_buff");

   function skb_mac_header_was_set (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1778
   pragma Import (CPP, skb_mac_header_was_set, "_ZL22skb_mac_header_was_setPK7sk_buff");

   procedure skb_reset_mac_header (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1783
   pragma Import (CPP, skb_reset_mac_header, "_ZL20skb_reset_mac_headerP7sk_buff");

   procedure skb_set_mac_header (skb : access sk_buff; offset : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1788
   pragma Import (CPP, skb_set_mac_header, "_ZL18skb_set_mac_headerP7sk_buffi");

   procedure skb_pop_mac_header (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1794
   pragma Import (CPP, skb_pop_mac_header, "_ZL18skb_pop_mac_headerP7sk_buff");

   procedure skb_probe_transport_header (skb : access sk_buff; offset_hint : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1799
   pragma Import (CPP, skb_probe_transport_header, "_ZL26skb_probe_transport_headerP7sk_buffi");

   procedure skb_mac_header_rebuild (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1812
   pragma Import (CPP, skb_mac_header_rebuild, "_ZL22skb_mac_header_rebuildP7sk_buff");

   function skb_checksum_start_offset (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1822
   pragma Import (CPP, skb_checksum_start_offset, "_ZL25skb_checksum_start_offsetPK7sk_buff");

   function skb_transport_offset (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1827
   pragma Import (CPP, skb_transport_offset, "_ZL20skb_transport_offsetPK7sk_buff");

   function skb_network_header_len (skb : access constant sk_buff) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1832
   pragma Import (CPP, skb_network_header_len, "_ZL22skb_network_header_lenPK7sk_buff");

   function skb_inner_network_header_len (skb : access constant sk_buff) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1837
   pragma Import (CPP, skb_inner_network_header_len, "_ZL28skb_inner_network_header_lenPK7sk_buff");

   function skb_network_offset (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1842
   pragma Import (CPP, skb_network_offset, "_ZL18skb_network_offsetPK7sk_buff");

   function skb_inner_network_offset (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1847
   pragma Import (CPP, skb_inner_network_offset, "_ZL24skb_inner_network_offsetPK7sk_buff");

   function pskb_network_may_pull (skb : access sk_buff; len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1852
   pragma Import (CPP, pskb_network_may_pull, "_ZL21pskb_network_may_pullP7sk_buffj");

   procedure skb_pop_rcv_encapsulation (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1857
   pragma Import (CPP, skb_pop_rcv_encapsulation, "_ZL25skb_pop_rcv_encapsulationP7sk_buff");

  -- Only continue with checksum unnecessary if device indicated
  --	 * it is valid across encapsulation (skb->encapsulation was set).
  --	  

  -- * CPUs often take a performance hit when accessing unaligned memory
  -- * locations. The actual performance hit varies, it can be small if the
  -- * hardware handles it or large if we have to take an exception and fix it
  -- * in software.
  -- *
  -- * Since an ethernet header is 14 bytes network drivers often end up with
  -- * the IP header at an unaligned offset. The IP header can be aligned by
  -- * shifting the start of the packet by 2 bytes. Drivers should do this
  -- * with:
  -- *
  -- * skb_reserve(skb, NET_IP_ALIGN);
  -- *
  -- * The downside to this alignment of the IP header is that the DMA is now
  -- * unaligned. On some architectures the cost of an unaligned DMA is high
  -- * and this cost outweighs the gains made by aligning the IP header.
  -- *
  -- * Since this trade off varies between architectures, we allow NET_IP_ALIGN
  -- * to be overridden.
  --  

  -- * The networking layer reserves some headroom in skb data (via
  -- * dev_alloc_skb). This is used to avoid having to reallocate skb data when
  -- * the header has to grow. In the default case, if the header has to grow
  -- * 32 bytes or less we avoid the reallocation.
  -- *
  -- * Unfortunately this headroom changes the DMA alignment of the resulting
  -- * network packet. As for NET_IP_ALIGN, this unaligned DMA is expensive
  -- * on some architectures. An architecture can override this value,
  -- * perhaps setting it to a cacheline in size (since that will maintain
  -- * cacheline alignment of the DMA). It must be a power of 2.
  -- *
  -- * Various parts of the networking layer expect at least 32 bytes of
  -- * headroom, you should not reduce this.
  -- *
  -- * Using max(32, L1_CACHE_BYTES) makes sense (especially with RPS)
  -- * to reduce average number of cache lines per packet.
  -- * get_rps_cpus() for example only access one 64 bytes aligned block :
  -- * NET_IP_ALIGN(2) + ethernet_header(14) + IP_header(20/40) + ports(8)
  --  

   --  skipped func ___pskb_trim

   --  skipped func __skb_trim

   procedure skb_trim (skb : access sk_buff; len : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1929
   pragma Import (CPP, skb_trim, "_Z8skb_trimP7sk_buffj");

   --  skipped func __pskb_trim

   function pskb_trim (skb : access sk_buff; len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1939
   pragma Import (CPP, pskb_trim, "_ZL9pskb_trimP7sk_buffj");

  --*
  -- *	pskb_trim_unique - remove end from a paged unique (not cloned) buffer
  -- *	@skb: buffer to alter
  -- *	@len: new length
  -- *
  -- *	This is identical to pskb_trim except that the caller knows that
  -- *	the skb is not cloned so we should never get an error due to out-
  -- *	of-memory.
  --  

   procedure pskb_trim_unique (skb : access sk_buff; len : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1953
   pragma Import (CPP, pskb_trim_unique, "_ZL16pskb_trim_uniqueP7sk_buffj");

  --*
  -- *	skb_orphan - orphan a buffer
  -- *	@skb: buffer to orphan
  -- *
  -- *	If a buffer currently has an owner then we call the owner's
  -- *	destructor function and make the @skb unowned. The buffer continues
  -- *	to exist but is no longer charged to its former owner.
  --  

   procedure skb_orphan (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1967
   pragma Import (CPP, skb_orphan, "_ZL10skb_orphanP7sk_buff");

  --*
  -- *	skb_orphan_frags - orphan the frags contained in a buffer
  -- *	@skb: buffer to orphan frags from
  -- *	@gfp_mask: allocation mask for replacement pages
  -- *
  -- *	For each frag in the SKB which needs a destructor (i.e. has an
  -- *	owner) create a copy of that frag and release the original
  -- *	page by calling the destructor.
  --  

   function skb_orphan_frags (skb : access sk_buff; gfp_mask : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:1987
   pragma Import (CPP, skb_orphan_frags, "_ZL16skb_orphan_fragsP7sk_buffj");

  --*
  -- *	__skb_queue_purge - empty a list
  -- *	@list: list to empty
  -- *
  -- *	Delete all buffers on an &sk_buff list. Each buffer is removed from
  -- *	the list and one reference dropped. This function does not take the
  -- *	list lock and the caller must hold the relevant locks to use it.
  --  

   procedure skb_queue_purge (list : access sk_buff_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2002
   pragma Import (CPP, skb_queue_purge, "_Z15skb_queue_purgeP12sk_buff_head");

   --  skipped func __skb_queue_purge

   function netdev_alloc_frag (fragsz : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2014
   pragma Import (CPP, netdev_alloc_frag, "_Z17netdev_alloc_fragj");

   --  skipped func __netdev_alloc_skb

  --*
  -- *	netdev_alloc_skb - allocate an skbuff for rx on a specific device
  -- *	@dev: network device to receive on
  -- *	@length: length to allocate
  -- *
  -- *	Allocate a new &sk_buff and assign it a usage count of one. The
  -- *	buffer has unspecified headroom built in. Users should allocate
  -- *	the headroom they think they need without accounting for the
  -- *	built in space. The built in space is used for optimisations.
  -- *
  -- *	%NULL is returned if there is no free memory. Although this function
  -- *	allocates memory it can be called from an interrupt.
  --  

   function netdev_alloc_skb (dev : access linux_netdevice_h.net_device; length : unsigned) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2032
   pragma Import (CPP, netdev_alloc_skb, "_ZL16netdev_alloc_skbP10net_devicej");

  -- legacy helper around __netdev_alloc_skb()  
   --  skipped func __dev_alloc_skb

  -- legacy helper around netdev_alloc_skb()  
   function dev_alloc_skb (length : unsigned) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2046
   pragma Import (CPP, dev_alloc_skb, "_ZL13dev_alloc_skbj");

   --  skipped func __netdev_alloc_skb_ip_align

   function netdev_alloc_skb_ip_align (dev : access linux_netdevice_h.net_device; length : unsigned) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2062
   pragma Import (CPP, netdev_alloc_skb_ip_align, "_ZL25netdev_alloc_skb_ip_alignP10net_devicej");

  --*
  -- *	__skb_alloc_pages - allocate pages for ps-rx on a skb and preserve pfmemalloc data
  -- *	@gfp_mask: alloc_pages_node mask. Set __GFP_NOMEMALLOC if not for network packet RX
  -- *	@skb: skb to set pfmemalloc on if __GFP_MEMALLOC is used
  -- *	@order: size of the allocation
  -- *
  -- * 	Allocate a new page.
  -- *
  -- * 	%NULL is returned if there is no free memory.
  -- 

   --  skipped func __skb_alloc_pages

  --*
  -- *	__skb_alloc_page - allocate a page for ps-rx for a given skb and preserve pfmemalloc data
  -- *	@gfp_mask: alloc_pages_node mask. Set __GFP_NOMEMALLOC if not for network packet RX
  -- *	@skb: skb to set pfmemalloc on if __GFP_MEMALLOC is used
  -- *
  -- * 	Allocate a new page.
  -- *
  -- * 	%NULL is returned if there is no free memory.
  --  

   --  skipped func __skb_alloc_page

  --*
  -- *	skb_propagate_pfmemalloc - Propagate pfmemalloc if skb is allocated after RX page
  -- *	@page: The page that was allocated from skb_alloc_page
  -- *	@skb: The skb that may need pfmemalloc set
  --  

   procedure skb_propagate_pfmemalloc (the_page : access linux_mm_types_h.page; skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2116
   pragma Import (CPP, skb_propagate_pfmemalloc, "_ZL24skb_propagate_pfmemallocP4pageP7sk_buff");

  --*
  -- * skb_frag_page - retrieve the page referred to by a paged fragment
  -- * @frag: the paged fragment
  -- *
  -- * Returns the &struct page associated with @frag.
  --  

   function skb_frag_page (frag : System.Address) return access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2129
   pragma Import (CPP, skb_frag_page, "_ZL13skb_frag_pagePK15skb_frag_struct");

  --*
  -- * __skb_frag_ref - take an addition reference on a paged fragment.
  -- * @frag: the paged fragment
  -- *
  -- * Takes an additional reference on the paged fragment @frag.
  --  

   --  skipped func __skb_frag_ref

  --*
  -- * skb_frag_ref - take an addition reference on a paged fragment of an skb.
  -- * @skb: the buffer
  -- * @f: the fragment offset.
  -- *
  -- * Takes an additional reference on the @f'th paged fragment of @skb.
  --  

   procedure skb_frag_ref (skb : access sk_buff; f : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2152
   pragma Import (CPP, skb_frag_ref, "_ZL12skb_frag_refP7sk_buffi");

  --*
  -- * __skb_frag_unref - release a reference on a paged fragment.
  -- * @frag: the paged fragment
  -- *
  -- * Releases a reference on the paged fragment @frag.
  --  

   --  skipped func __skb_frag_unref

  --*
  -- * skb_frag_unref - release a reference on a paged fragment of an skb.
  -- * @skb: the buffer
  -- * @f: the fragment offset
  -- *
  -- * Releases a reference on the @f'th paged fragment of @skb.
  --  

   procedure skb_frag_unref (skb : access sk_buff; f : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2175
   pragma Import (CPP, skb_frag_unref, "_ZL14skb_frag_unrefP7sk_buffi");

  --*
  -- * skb_frag_address - gets the address of the data contained in a paged fragment
  -- * @frag: the paged fragment buffer
  -- *
  -- * Returns the address of the data within @frag. The page must already
  -- * be mapped.
  --  

   function skb_frag_address (frag : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2187
   pragma Import (CPP, skb_frag_address, "_ZL16skb_frag_addressPK15skb_frag_struct");

  --*
  -- * skb_frag_address_safe - gets the address of the data contained in a paged fragment
  -- * @frag: the paged fragment buffer
  -- *
  -- * Returns the address of the data within @frag. Checks that the page
  -- * is mapped and returns %NULL otherwise.
  --  

   function skb_frag_address_safe (frag : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2199
   pragma Import (CPP, skb_frag_address_safe, "_ZL21skb_frag_address_safePK15skb_frag_struct");

  --*
  -- * __skb_frag_set_page - sets the page contained in a paged fragment
  -- * @frag: the paged fragment
  -- * @page: the page to set
  -- *
  -- * Sets the fragment @frag to contain @page.
  --  

   --  skipped func __skb_frag_set_page

  --*
  -- * skb_frag_set_page - sets the page contained in a paged fragment of an skb
  -- * @skb: the buffer
  -- * @f: the fragment offset
  -- * @page: the page to set
  -- *
  -- * Sets the @f'th fragment of @skb to contain @page.
  --  

   procedure skb_frag_set_page
     (skb : access sk_buff;
      f : int;
      the_page : access linux_mm_types_h.page);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2228
   pragma Import (CPP, skb_frag_set_page, "_ZL17skb_frag_set_pageP7sk_buffiP4page");

   function skb_page_frag_refill
     (sz : unsigned;
      pfrag : access linux_mm_types_h.page_frag;
      prio : linux_types_h.gfp_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2234
   pragma Import (CPP, skb_page_frag_refill, "_Z20skb_page_frag_refilljP9page_fragj");

  --*
  -- * skb_frag_dma_map - maps a paged fragment via the DMA API
  -- * @dev: the device to map the fragment to
  -- * @frag: the paged fragment to map
  -- * @offset: the offset within the fragment (starting at the
  -- *          fragment's own offset)
  -- * @size: the number of bytes to map
  -- * @dir: the direction of the mapping (%PCI_DMA_*)
  -- *
  -- * Maps the page associated with @frag to @device.
  --  

   function skb_frag_dma_map
     (dev : access linux_device_h.device;
      frag : System.Address;
      offset : linux_types_h.size_t;
      size : linux_types_h.size_t;
      dir : linux_dma_direction_h.dma_data_direction) return linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2247
   pragma Import (CPP, skb_frag_dma_map, "_ZL16skb_frag_dma_mapP6devicePK15skb_frag_structmm18dma_data_direction");

   function pskb_copy (skb : access sk_buff; gfp_mask : linux_types_h.gfp_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2256
   pragma Import (CPP, pskb_copy, "_ZL9pskb_copyP7sk_buffj");

   function pskb_copy_for_clone (skb : access sk_buff; gfp_mask : linux_types_h.gfp_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2263
   pragma Import (CPP, pskb_copy_for_clone, "_ZL19pskb_copy_for_cloneP7sk_buffj");

  --*
  -- *	skb_clone_writable - is the header of a clone writable
  -- *	@skb: buffer to check
  -- *	@len: length up to which to write
  -- *
  -- *	Returns true if modifying the header part of the cloned buffer
  -- *	does not requires the data to be copied.
  --  

   function skb_clone_writable (skb : access constant sk_buff; len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2278
   pragma Import (CPP, skb_clone_writable, "_ZL18skb_clone_writablePK7sk_buffj");

   --  skipped func __skb_cow

  --*
  -- *	skb_cow - copy header of skb when it is required
  -- *	@skb: buffer to cow
  -- *	@headroom: needed headroom
  -- *
  -- *	If the skb passed lacks sufficient headroom or its data part
  -- *	is shared, data is reallocated. If reallocation fails, an error
  -- *	is returned and original skb is not changed.
  -- *
  -- *	The result is skb with writable area skb->head...skb->tail
  -- *	and at least @headroom of space at head.
  --  

   function skb_cow (skb : access sk_buff; headroom : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2310
   pragma Import (CPP, skb_cow, "_ZL7skb_cowP7sk_buffj");

  --*
  -- *	skb_cow_head - skb_cow but only making the head writable
  -- *	@skb: buffer to cow
  -- *	@headroom: needed headroom
  -- *
  -- *	This function is identical to skb_cow except that we replace the
  -- *	skb_cloned check by skb_header_cloned.  It should be used when
  -- *	you only need to push on some header and do not need to modify
  -- *	the data.
  --  

   function skb_cow_head (skb : access sk_buff; headroom : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2325
   pragma Import (CPP, skb_cow_head, "_ZL12skb_cow_headP7sk_buffj");

  --*
  -- *	skb_padto	- pad an skbuff up to a minimal size
  -- *	@skb: buffer to pad
  -- *	@len: minimal length
  -- *
  -- *	Pads up a buffer to ensure the trailing bytes exist and are
  -- *	blanked. If the buffer already contains sufficient data it
  -- *	is untouched. Otherwise it is extended. Returns zero on
  -- *	success. The skb is freed on error.
  --  

   function skb_padto (skb : access sk_buff; len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2341
   pragma Import (CPP, skb_padto, "_ZL9skb_padtoP7sk_buffj");

   function skb_add_data
     (skb : access sk_buff;
      from : Interfaces.C.Strings.chars_ptr;
      copy : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2349
   pragma Import (CPP, skb_add_data, "_ZL12skb_add_dataP7sk_buffPci");

   function skb_can_coalesce
     (skb : access sk_buff;
      i : int;
      the_page : access constant linux_mm_types_h.page;
      off : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2369
   pragma Import (CPP, skb_can_coalesce, "_ZL16skb_can_coalesceP7sk_buffiPK4pagei");

   --  skipped func __skb_linearize

  --*
  -- *	skb_linearize - convert paged skb to linear one
  -- *	@skb: buffer to linarize
  -- *
  -- *	If there is no free memory -ENOMEM is returned, otherwise zero
  -- *	is returned and the old skb data released.
  --  

   function skb_linearize (skb : access sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2393
   pragma Import (CPP, skb_linearize, "_ZL13skb_linearizeP7sk_buff");

  --*
  -- * skb_has_shared_frag - can any frag be overwritten
  -- * @skb: buffer to test
  -- *
  -- * Return true if the skb has at least one frag that might be modified
  -- * by an external entity (as in vmsplice()/sendfile())
  --  

   function skb_has_shared_frag (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2405
   pragma Import (CPP, skb_has_shared_frag, "_ZL19skb_has_shared_fragPK7sk_buff");

  --*
  -- *	skb_linearize_cow - make sure skb is linear and writable
  -- *	@skb: buffer to process
  -- *
  -- *	If there is no free memory -ENOMEM is returned, otherwise zero
  -- *	is returned and the old skb data released.
  --  

   function skb_linearize_cow (skb : access sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2418
   pragma Import (CPP, skb_linearize_cow, "_ZL17skb_linearize_cowP7sk_buff");

  --*
  -- *	skb_postpull_rcsum - update checksum for received skb after pull
  -- *	@skb: buffer to update
  -- *	@start: start of data before pull
  -- *	@len: length of data pulled
  -- *
  -- *	After doing a pull on a received packet, you need to call this to
  -- *	update the CHECKSUM_COMPLETE checksum, or set ip_summed to
  -- *	CHECKSUM_NONE so that it can be recomputed from scratch.
  --  

   procedure skb_postpull_rcsum
     (skb : access sk_buff;
      start : System.Address;
      len : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2435
   pragma Import (CPP, skb_postpull_rcsum, "_ZL18skb_postpull_rcsumP7sk_buffPKvj");

   function skb_pull_rcsum (skb : access sk_buff; len : unsigned) return access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2442
   pragma Import (CPP, skb_pull_rcsum, "_Z14skb_pull_rcsumP7sk_buffj");

  --*
  -- *	pskb_trim_rcsum - trim received skb and update checksum
  -- *	@skb: buffer to trim
  -- *	@len: new length
  -- *
  -- *	This is exactly the same as pskb_trim except that it ensures the
  -- *	checksum of received packets are still valid after the operation.
  --  

   function pskb_trim_rcsum (skb : access sk_buff; len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2453
   pragma Import (CPP, pskb_trim_rcsum, "_ZL15pskb_trim_rcsumP7sk_buffj");

   function skb_has_frag_list (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2496
   pragma Import (CPP, skb_has_frag_list, "_ZL17skb_has_frag_listPK7sk_buff");

   procedure skb_frag_list_init (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2501
   pragma Import (CPP, skb_frag_list_init, "_ZL18skb_frag_list_initP7sk_buff");

   procedure skb_frag_add_head (skb : access sk_buff; frag : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2506
   pragma Import (CPP, skb_frag_add_head, "_ZL17skb_frag_add_headP7sk_buffS0_");

   --  skipped func __skb_recv_datagram

   function skb_recv_datagram
     (sk : System.Address;
      flags : unsigned;
      noblock : int;
      err : access int) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2517
   pragma Import (CPP, skb_recv_datagram, "_Z17skb_recv_datagramP4sockjiPi");

   function datagram_poll
     (the_file : access linux_fs_h.file;
      sock : access linux_net_h.socket;
      wait : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2519
   pragma Import (CPP, datagram_poll, "_Z13datagram_pollP4fileP6socketP17poll_table_struct");

   function skb_copy_datagram_iovec
     (from : access constant sk_buff;
      offset : int;
      to : access uapi_linux_uio_h.iovec;
      size : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2521
   pragma Import (CPP, skb_copy_datagram_iovec, "_Z23skb_copy_datagram_iovecPK7sk_buffiP5ioveci");

   function skb_copy_and_csum_datagram_iovec
     (skb : access sk_buff;
      hlen : int;
      iov : access uapi_linux_uio_h.iovec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2523
   pragma Import (CPP, skb_copy_and_csum_datagram_iovec, "_Z32skb_copy_and_csum_datagram_iovecP7sk_buffiP5iovec");

   function skb_copy_datagram_from_iovec
     (skb : access sk_buff;
      offset : int;
      from : access constant uapi_linux_uio_h.iovec;
      from_offset : int;
      len : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2525
   pragma Import (CPP, skb_copy_datagram_from_iovec, "_Z28skb_copy_datagram_from_iovecP7sk_buffiPK5iovecii");

   function zerocopy_sg_from_iovec
     (skb : access sk_buff;
      frm : access constant uapi_linux_uio_h.iovec;
      offset : int;
      count : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2528
   pragma Import (CPP, zerocopy_sg_from_iovec, "_Z22zerocopy_sg_from_iovecP7sk_buffPK5iovecim");

   function skb_copy_datagram_const_iovec
     (from : access constant sk_buff;
      offset : int;
      to : access constant uapi_linux_uio_h.iovec;
      to_offset : int;
      size : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2530
   pragma Import (CPP, skb_copy_datagram_const_iovec, "_Z29skb_copy_datagram_const_iovecPK7sk_buffiPK5iovecii");

   procedure skb_free_datagram (sk : System.Address; skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2533
   pragma Import (CPP, skb_free_datagram, "_Z17skb_free_datagramP4sockP7sk_buff");

   procedure skb_free_datagram_locked (sk : System.Address; skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2534
   pragma Import (CPP, skb_free_datagram_locked, "_Z24skb_free_datagram_lockedP4sockP7sk_buff");

   function skb_kill_datagram
     (sk : System.Address;
      skb : access sk_buff;
      flags : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2535
   pragma Import (CPP, skb_kill_datagram, "_Z17skb_kill_datagramP4sockP7sk_buffj");

   function skb_copy_bits
     (skb : access constant sk_buff;
      offset : int;
      to : System.Address;
      len : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2536
   pragma Import (CPP, skb_copy_bits, "_Z13skb_copy_bitsPK7sk_buffiPvi");

   function skb_store_bits
     (skb : access sk_buff;
      offset : int;
      from : System.Address;
      len : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2537
   pragma Import (CPP, skb_store_bits, "_Z14skb_store_bitsP7sk_buffiPKvi");

   function skb_copy_and_csum_bits
     (skb : access constant sk_buff;
      offset : int;
      to : access asm_generic_int_ll64_h.u8;
      len : int;
      csum : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2538
   pragma Import (CPP, skb_copy_and_csum_bits, "_Z22skb_copy_and_csum_bitsPK7sk_buffiPhij");

   function skb_splice_bits
     (skb : access sk_buff;
      offset : unsigned;
      pipe : System.Address;
      len : unsigned;
      flags : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2540
   pragma Import (CPP, skb_splice_bits, "_Z15skb_splice_bitsP7sk_buffjP15pipe_inode_infojj");

   procedure skb_copy_and_csum_dev (skb : access constant sk_buff; to : access asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2543
   pragma Import (CPP, skb_copy_and_csum_dev, "_Z21skb_copy_and_csum_devPK7sk_buffPh");

   function skb_zerocopy_headlen (from : access constant sk_buff) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2544
   pragma Import (CPP, skb_zerocopy_headlen, "_Z20skb_zerocopy_headlenPK7sk_buff");

   function skb_zerocopy
     (to : access sk_buff;
      from : access sk_buff;
      len : int;
      hlen : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2545
   pragma Import (CPP, skb_zerocopy, "_Z12skb_zerocopyP7sk_buffS0_ii");

   procedure skb_split
     (skb : access sk_buff;
      skb1 : access sk_buff;
      len : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2547
   pragma Import (CPP, skb_split, "_Z9skb_splitP7sk_buffS0_j");

   function skb_shift
     (tgt : access sk_buff;
      skb : access sk_buff;
      shiftlen : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2548
   pragma Import (CPP, skb_shift, "_Z9skb_shiftP7sk_buffS0_i");

   procedure skb_scrub_packet (skb : access sk_buff; xnet : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2549
   pragma Import (CPP, skb_scrub_packet, "_Z16skb_scrub_packetP7sk_buffb");

   function skb_gso_transport_seglen (skb : access constant sk_buff) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2550
   pragma Import (CPP, skb_gso_transport_seglen, "_Z24skb_gso_transport_seglenPK7sk_buff");

   function skb_segment (skb : access sk_buff; features : linux_netdev_features_h.netdev_features_t) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2551
   pragma Import (CPP, skb_segment, "_Z11skb_segmentP7sk_buffy");

   function skb_vlan_untag (skb : access sk_buff) return access sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2552
   pragma Import (CPP, skb_vlan_untag, "_Z14skb_vlan_untagP7sk_buff");

   type skb_checksum_ops is record
      update : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2555
      combine : access function
           (arg1 : uapi_linux_types_h.uu_wsum;
            arg2 : uapi_linux_types_h.uu_wsum;
            arg3 : int;
            arg4 : int) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2556
   end record;
   pragma Convention (C_Pass_By_Copy, skb_checksum_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2554

   --  skipped func __skb_checksum

   function skb_checksum
     (skb : access constant sk_buff;
      offset : int;
      len : int;
      csum : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2561
   pragma Import (CPP, skb_checksum, "_Z12skb_checksumPK7sk_buffiij");

   function skb_header_pointer
     (skb : access constant sk_buff;
      offset : int;
      len : int;
      buffer : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2564
   pragma Import (CPP, skb_header_pointer, "_ZL18skb_header_pointerPK7sk_buffiiPv");

  --*
  -- *	skb_needs_linearize - check if we need to linearize a given skb
  -- *			      depending on the given device features.
  -- *	@skb: socket buffer to check
  -- *	@features: net device features
  -- *
  -- *	Returns true if either:
  -- *	1. skb has frag_list and the device doesn't support FRAGLIST, or
  -- *	2. skb is fragmented and the device does not support SG.
  --  

   function skb_needs_linearize (skb : access sk_buff; features : linux_netdev_features_h.netdev_features_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2588
   pragma Import (CPP, skb_needs_linearize, "_ZL19skb_needs_linearizeP7sk_buffy");

   procedure skb_copy_from_linear_data
     (skb : access constant sk_buff;
      to : System.Address;
      len : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2596
   pragma Import (CPP, skb_copy_from_linear_data, "_ZL25skb_copy_from_linear_dataPK7sk_buffPvj");

   procedure skb_copy_from_linear_data_offset
     (skb : access constant sk_buff;
      offset : int;
      to : System.Address;
      len : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2603
   pragma Import (CPP, skb_copy_from_linear_data_offset, "_ZL32skb_copy_from_linear_data_offsetPK7sk_buffiPvj");

   procedure skb_copy_to_linear_data
     (skb : access sk_buff;
      from : System.Address;
      len : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2610
   pragma Import (CPP, skb_copy_to_linear_data, "_ZL23skb_copy_to_linear_dataP7sk_buffPKvj");

   procedure skb_copy_to_linear_data_offset
     (skb : access sk_buff;
      offset : int;
      from : System.Address;
      len : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2617
   pragma Import (CPP, skb_copy_to_linear_data_offset, "_ZL30skb_copy_to_linear_data_offsetP7sk_buffiPKvj");

   procedure skb_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2625
   pragma Import (CPP, skb_init, "_Z8skb_initv");

   function skb_get_ktime (skb : access constant sk_buff) return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2627
   pragma Import (CPP, skb_get_ktime, "_ZL13skb_get_ktimePK7sk_buff");

  --*
  -- *	skb_get_timestamp - get timestamp from a skb
  -- *	@skb: skb to get stamp from
  -- *	@stamp: pointer to struct timeval to store stamp in
  -- *
  -- *	Timestamps are stored in the skb as offsets to a base timestamp.
  -- *	This function converts the offset back to a struct timeval and stores
  -- *	it in stamp.
  --  

   procedure skb_get_timestamp (skb : access constant sk_buff; stamp : access uapi_linux_time_h.timeval);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2641
   pragma Import (CPP, skb_get_timestamp, "_ZL17skb_get_timestampPK7sk_buffP7timeval");

   procedure skb_get_timestampns (skb : access constant sk_buff; stamp : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2647
   pragma Import (CPP, skb_get_timestampns, "_ZL19skb_get_timestampnsPK7sk_buffP8timespec");

   --  skipped func __net_timestamp

   function net_timedelta (t : linux_ktime_h.ktime_t) return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2658
   pragma Import (CPP, net_timedelta, "_ZL13net_timedelta5ktime");

   function net_invalid_timestamp return linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2663
   pragma Import (CPP, net_invalid_timestamp, "_ZL21net_invalid_timestampv");

   procedure skb_clone_tx_timestamp (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2675
   pragma Import (CPP, skb_clone_tx_timestamp, "_ZL22skb_clone_tx_timestampP7sk_buff");

   function skb_defer_rx_timestamp (skb : access sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2679
   pragma Import (CPP, skb_defer_rx_timestamp, "_ZL22skb_defer_rx_timestampP7sk_buff");

  --*
  -- * skb_complete_tx_timestamp() - deliver cloned skb with tx timestamps
  -- *
  -- * PHY drivers may accept clones of transmitted packets for
  -- * timestamping via their phy_driver.txtstamp method. These drivers
  -- * must call this function to return the skb back to the stack, with
  -- * or without a timestamp.
  -- *
  -- * @skb: clone of the the original outgoing packet
  -- * @hwtstamps: hardware time stamps, may be NULL if not available
  -- *
  --  

   procedure skb_complete_tx_timestamp (skb : access sk_buff; hwtstamps : access skb_shared_hwtstamps);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2698
   pragma Import (CPP, skb_complete_tx_timestamp, "_Z25skb_complete_tx_timestampP7sk_buffP20skb_shared_hwtstamps");

  --*
  -- * skb_tstamp_tx - queue clone of skb with send time stamps
  -- * @orig_skb:	the original outgoing packet
  -- * @hwtstamps:	hardware time stamps, may be NULL if not available
  -- *
  -- * If the skb has a socket associated, then this function clones the
  -- * skb (thus sharing the actual data and optional structures), stores
  -- * the optional hardware time stamping information (if non NULL) or
  -- * generates a software time stamp (otherwise), then queues the clone
  -- * to the error queue of the socket.  Errors are silently ignored.
  --  

   procedure skb_tstamp_tx (orig_skb : access sk_buff; hwtstamps : access skb_shared_hwtstamps);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2712
   pragma Import (CPP, skb_tstamp_tx, "_Z13skb_tstamp_txP7sk_buffP20skb_shared_hwtstamps");

   procedure sw_tx_timestamp (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2715
   pragma Import (CPP, sw_tx_timestamp, "_ZL15sw_tx_timestampP7sk_buff");

  --*
  -- * skb_tx_timestamp() - Driver hook for transmit timestamping
  -- *
  -- * Ethernet MAC Drivers should call this function in their hard_xmit()
  -- * function immediately before giving the sk_buff to the MAC hardware.
  -- *
  -- * Specifically, one should make absolutely sure that this function is
  -- * called before TX completion of this packet can trigger.  Otherwise
  -- * the packet could potentially already be freed.
  -- *
  -- * @skb: A socket buffer.
  --  

   procedure skb_tx_timestamp (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2734
   pragma Import (CPP, skb_tx_timestamp, "_ZL16skb_tx_timestampP7sk_buff");

  --*
  -- * skb_complete_wifi_ack - deliver skb with wifi status
  -- *
  -- * @skb: the original outgoing packet
  -- * @acked: ack status
  -- *
  --  

   procedure skb_complete_wifi_ack (skb : access sk_buff; acked : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2747
   pragma Import (CPP, skb_complete_wifi_ack, "_Z21skb_complete_wifi_ackP7sk_buffb");

   --  skipped func __skb_checksum_complete_head

   --  skipped func __skb_checksum_complete

   function skb_csum_unnecessary (skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2752
   pragma Import (CPP, skb_csum_unnecessary, "_ZL20skb_csum_unnecessaryPK7sk_buff");

  --*
  -- *	skb_checksum_complete - Calculate checksum of an entire packet
  -- *	@skb: packet to process
  -- *
  -- *	This function calculates the checksum over the entire packet plus
  -- *	the value of skb->csum.  The latter can be used to supply the
  -- *	checksum of a pseudo header as used by TCP/UDP.  It returns the
  -- *	checksum.
  -- *
  -- *	For protocols that contain complete checksums such as ICMP/TCP/UDP,
  -- *	this function can be used to verify that checksum on received
  -- *	packets.  In that case the function should return zero if the
  -- *	checksum is correct.  In particular, this function will return zero
  -- *	if skb->ip_summed is CHECKSUM_UNNECESSARY which indicates that the
  -- *	hardware has already verified the correctness of the checksum.
  --  

   function skb_checksum_complete (skb : access sk_buff) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2773
   pragma Import (CPP, skb_checksum_complete, "_ZL21skb_checksum_completeP7sk_buff");

  -- Check if we need to perform checksum complete validation.
  -- *
  -- * Returns true if checksum complete is needed, false otherwise
  -- * (either checksum is unnecessary or zero checksum is allowed).
  --  

   --  skipped func __skb_checksum_validate_needed

  -- For small packets <= CHECKSUM_BREAK peform checksum complete directly
  -- * in checksum_init.
  --  

  -- Validate (init) checksum based on checksum complete.
  -- *
  -- * Return values:
  -- *   0: checksum is validated or try to in skb_checksum_complete. In the latter
  -- *	case the ip_summed will not be CHECKSUM_UNNECESSARY and the pseudo
  -- *	checksum is stored in skb->csum for use in __skb_checksum_complete
  -- *   non-zero: value of invalid checksum
  -- *
  --  

   --  skipped func __skb_checksum_validate_complete

   function null_compute_pseudo (skb : access sk_buff; proto : int) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2834
   pragma Import (CPP, null_compute_pseudo, "_ZL19null_compute_pseudoP7sk_buffi");

  -- Perform checksum validate (init). Note that this is a macro since we only
  -- * want to calculate the pseudo header which is an input function if necessary.
  -- * First we try to validate without any computation (checksum unnecessary) and
  -- * then calculate based on checksum complete calling the function to compute
  -- * pseudo header.
  -- *
  -- * Return values:
  -- *   0: checksum is validated or try to in skb_checksum_complete
  -- *   non-zero: value of invalid checksum
  --  

   procedure nf_conntrack_destroy (nfct : access nf_conntrack);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2877
   pragma Import (CPP, nf_conntrack_destroy, "_Z20nf_conntrack_destroyP12nf_conntrack");

   procedure nf_conntrack_put (nfct : access nf_conntrack);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2878
   pragma Import (CPP, nf_conntrack_put, "_ZL16nf_conntrack_putP12nf_conntrack");

   procedure nf_conntrack_get (nfct : access nf_conntrack);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2883
   pragma Import (CPP, nf_conntrack_get, "_ZL16nf_conntrack_getP12nf_conntrack");

   procedure nf_bridge_put (nf_bridge : access nf_bridge_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2890
   pragma Import (CPP, nf_bridge_put, "_ZL13nf_bridge_putP14nf_bridge_info");

   procedure nf_bridge_get (nf_bridge : access nf_bridge_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2895
   pragma Import (CPP, nf_bridge_get, "_ZL13nf_bridge_getP14nf_bridge_info");

   procedure nf_reset (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2901
   pragma Import (CPP, nf_reset, "_ZL8nf_resetP7sk_buff");

   procedure nf_reset_trace (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2913
   pragma Import (CPP, nf_reset_trace, "_ZL14nf_reset_traceP7sk_buff");

  -- Note: This doesn't put any conntrack and bridge info in dst.  
   --  skipped func __nf_copy

   procedure nf_copy (dst : access sk_buff; src : access constant sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2937
   pragma Import (CPP, nf_copy, "_ZL7nf_copyP7sk_buffPKS_");

   procedure skb_copy_secmark (to : access sk_buff; from : access constant sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2949
   pragma Import (CPP, skb_copy_secmark, "_ZL16skb_copy_secmarkP7sk_buffPKS_");

   procedure skb_init_secmark (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2954
   pragma Import (CPP, skb_init_secmark, "_ZL16skb_init_secmarkP7sk_buff");

   function skb_irq_freeable (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2966
   pragma Import (CPP, skb_irq_freeable, "_ZL16skb_irq_freeablePK7sk_buff");

   procedure skb_set_queue_mapping (skb : access sk_buff; queue_mapping : asm_generic_int_ll64_h.u16);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2979
   pragma Import (CPP, skb_set_queue_mapping, "_ZL21skb_set_queue_mappingP7sk_bufft");

   function skb_get_queue_mapping (skb : access constant sk_buff) return asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2984
   pragma Import (CPP, skb_get_queue_mapping, "_ZL21skb_get_queue_mappingPK7sk_buff");

   procedure skb_copy_queue_mapping (to : access sk_buff; from : access constant sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2989
   pragma Import (CPP, skb_copy_queue_mapping, "_ZL22skb_copy_queue_mappingP7sk_buffPKS_");

   procedure skb_record_rx_queue (skb : access sk_buff; rx_queue : asm_generic_int_ll64_h.u16);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2994
   pragma Import (CPP, skb_record_rx_queue, "_ZL19skb_record_rx_queueP7sk_bufft");

   function skb_get_rx_queue (skb : access constant sk_buff) return asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:2999
   pragma Import (CPP, skb_get_rx_queue, "_ZL16skb_get_rx_queuePK7sk_buff");

   function skb_rx_queue_recorded (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3004
   pragma Import (CPP, skb_rx_queue_recorded, "_ZL21skb_rx_queue_recordedPK7sk_buff");

   --  skipped func __skb_tx_hash

   function skb_sec_path (skb : access sk_buff) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3012
   pragma Import (CPP, skb_sec_path, "_ZL12skb_sec_pathP7sk_buff");

  -- Keeps track of mac header offset relative to skb->head.
  -- * It is useful for TSO of Tunneling protocol. e.g. GRE.
  -- * For non-tunnel skb it points to skb_mac_header() and for
  -- * tunnel skb it points to outer mac header.
  -- * Keeps track of level of encapsulation of network headers.
  --  

   type skb_gso_cb is record
      mac_offset : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3028
      encap_level : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3029
      csum_start : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3030
   end record;
   pragma Convention (C_Pass_By_Copy, skb_gso_cb);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3027

   function skb_tnl_header_len (inner_skb : access constant sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3034
   pragma Import (CPP, skb_tnl_header_len, "_ZL18skb_tnl_header_lenPK7sk_buff");

   function gso_pskb_expand_head (skb : access sk_buff; extra : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3040
   pragma Import (CPP, gso_pskb_expand_head, "_ZL20gso_pskb_expand_headP7sk_buffi");

  -- Compute the checksum for a gso segment. First compute the checksum value
  -- * from the start of transport header to SKB_GSO_CB(skb)->csum_start, and
  -- * then add in skb->csum (checksum from csum_start to end of packet).
  -- * skb->csum and csum_start are then updated to reflect the checksum of the
  -- * resultant packet starting from the transport header-- the resultant checksum
  -- * is in the res argument (i.e. normally zero or ~ of checksum of a pseudo
  -- * header.
  --  

   function gso_make_checksum (skb : access sk_buff; res : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3063
   pragma Import (CPP, gso_make_checksum, "_ZL17gso_make_checksumP7sk_buffj");

   function skb_is_gso (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3077
   pragma Import (CPP, skb_is_gso, "_ZL10skb_is_gsoPK7sk_buff");

  -- Note: Should be called only if skb_is_gso(skb) is true  
   function skb_is_gso_v6 (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3083
   pragma Import (CPP, skb_is_gso_v6, "_ZL13skb_is_gso_v6PK7sk_buff");

   --  skipped func __skb_warn_lro_forwarding

   function skb_warn_if_lro (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3090
   pragma Import (CPP, skb_warn_if_lro, "_ZL15skb_warn_if_lroPK7sk_buff");

  -- LRO sets gso_size but not gso_type, whereas if GSO is really
  --	 * wanted then gso_type will be set.  

   procedure skb_forward_csum (skb : access sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3104
   pragma Import (CPP, skb_forward_csum, "_ZL16skb_forward_csumP7sk_buff");

  -- Unfortunately we don't support this one.  Any brave souls?  
  --*
  -- * skb_checksum_none_assert - make sure skb ip_summed is CHECKSUM_NONE
  -- * @skb: skb to check
  -- *
  -- * fresh skbs have their ip_summed set to CHECKSUM_NONE.
  -- * Instead of forcing ip_summed to CHECKSUM_NONE, we can
  -- * use this helper, to document places where we make this assertion.
  --  

   procedure skb_checksum_none_assert (skb : access constant sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3119
   pragma Import (CPP, skb_checksum_none_assert, "_ZL24skb_checksum_none_assertPK7sk_buff");

   function skb_partial_csum_set
     (skb : access sk_buff;
      start : asm_generic_int_ll64_h.u16;
      off : asm_generic_int_ll64_h.u16) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3126
   pragma Import (CPP, skb_partial_csum_set, "_Z20skb_partial_csum_setP7sk_bufftt");

   function skb_checksum_setup (skb : access sk_buff; recalculate : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3128
   pragma Import (CPP, skb_checksum_setup, "_Z18skb_checksum_setupP7sk_buffb");

   --  skipped func __skb_get_poff

  --*
  -- * skb_head_is_locked - Determine if the skb->head is locked down
  -- * @skb: skb to check
  -- *
  -- * The head on skbs build around a head frag can be removed if they are
  -- * not cloned.  This function returns true if the skb head is locked down
  -- * due to either being allocated via kmalloc, or by being a clone with
  -- * multiple references to the head.
  --  

   function skb_head_is_locked (skb : access constant sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3141
   pragma Import (CPP, skb_head_is_locked, "_ZL18skb_head_is_lockedPK7sk_buff");

  --*
  -- * skb_gso_network_seglen - Return length of individual segments of a gso packet
  -- *
  -- * @skb: GSO skb
  -- *
  -- * skb_gso_network_seglen is used to determine the real size of the
  -- * individual segments, including Layer3 (IP, IPv6) and L4 headers (TCP/UDP).
  -- *
  -- * The MAC/L2 header is not accounted for.
  --  

   function skb_gso_network_seglen (skb : access constant sk_buff) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/skbuff.h:3156
   pragma Import (CPP, skb_gso_network_seglen, "_ZL22skb_gso_network_seglenPK7sk_buff");

end linux_skbuff_h;

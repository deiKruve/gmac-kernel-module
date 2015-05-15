pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_types_h;
with System;
limited with uapi_linux_in6_h;
with uapi_asm_generic_int_ll64_h;

package asm_checksum_64_h is

   --  unsupported macro: HAVE_CSUM_COPY_USER 1
   --  unsupported macro: csum_and_copy_to_user csum_partial_copy_to_user
   --  unsupported macro: csum_and_copy_from_user csum_partial_copy_from_user
  -- * Checksums for x86-64
  -- * Copyright 2002 by Andi Kleen, SuSE Labs
  -- * with some code from asm-x86/checksum.h
  --  

  --*
  -- * csum_fold - Fold and invert a 32bit checksum.
  -- * sum: 32bit unfolded sum
  -- *
  -- * Fold a 32bit running checksum to 16bit and invert it. This is usually
  -- * the last step before putting a checksum into a packet.
  -- * Make sure not to mix with 64bit checksums.
  --  

   function csum_fold (sum : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:22
   pragma Import (CPP, csum_fold, "_ZL9csum_foldj");

  -- *	This is a version of ip_compute_csum() optimized for IP headers,
  -- *	which always checksum on 4 octet boundaries.
  -- *
  -- *	By Jorge Cwik <jorge@laser.satlink.net>, adapted for linux by
  -- *	Arnt Gulbrandsen.
  --  

  --*
  -- * ip_fast_csum - Compute the IPv4 header checksum efficiently.
  -- * iph: ipv4 header
  -- * ihl: length of header / 4
  --  

   function ip_fast_csum (iph : System.Address; ihl : unsigned) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:45
   pragma Import (CPP, ip_fast_csum, "_ZL12ip_fast_csumPKvj");

  -- Since the input registers which are loaded with iph and ihl
  --	   are modified, we must also specify them as outputs, or gcc
  --	   will assume they contain their original values.  

  --*
  -- * csum_tcpup_nofold - Compute an IPv4 pseudo header checksum.
  -- * @saddr: source address
  -- * @daddr: destination address
  -- * @len: length of packet
  -- * @proto: ip protocol of packet
  -- * @sum: initial sum to be added in (32bit unfolded)
  -- *
  -- * Returns the pseudo header checksum the input data. Result is
  -- * 32bit unfolded.
  --  

   function csum_tcpudp_nofold
     (saddr : uapi_linux_types_h.uu_be32;
      daddr : uapi_linux_types_h.uu_be32;
      len : unsigned_short;
      proto : unsigned_short;
      sum : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:87
   pragma Import (CPP, csum_tcpudp_nofold, "_ZL18csum_tcpudp_nofoldjjttj");

  --*
  -- * csum_tcpup_magic - Compute an IPv4 pseudo header checksum.
  -- * @saddr: source address
  -- * @daddr: destination address
  -- * @len: length of packet
  -- * @proto: ip protocol of packet
  -- * @sum: initial sum to be added in (32bit unfolded)
  -- *
  -- * Returns the 16bit pseudo header checksum the input data already
  -- * complemented and ready to be filled in.
  --  

   function csum_tcpudp_magic
     (saddr : uapi_linux_types_h.uu_be32;
      daddr : uapi_linux_types_h.uu_be32;
      len : unsigned_short;
      proto : unsigned_short;
      sum : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:112
   pragma Import (CPP, csum_tcpudp_magic, "_ZL17csum_tcpudp_magicjjttj");

  --*
  -- * csum_partial - Compute an internet checksum.
  -- * @buff: buffer to be checksummed
  -- * @len: length of buffer.
  -- * @sum: initial sum to be added in (32bit unfolded)
  -- *
  -- * Returns the 32bit unfolded internet checksum of the buffer.
  -- * Before filling it in it needs to be csum_fold()'ed.
  -- * buff should be aligned to a 64bit boundary if possible.
  --  

   function csum_partial
     (buff : System.Address;
      len : int;
      sum : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:129
   pragma Import (CPP, csum_partial, "_Z12csum_partialPKvij");

  -- Do not call this directly. Use the wrappers below  
   function csum_partial_copy_generic
     (src : System.Address;
      dst : System.Address;
      len : int;
      sum : uapi_linux_types_h.uu_wsum;
      src_err_ptr : access int;
      dst_err_ptr : access int) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:136
   pragma Import (CPP, csum_partial_copy_generic, "_Z25csum_partial_copy_genericPKvS0_ijPiS1_");

   function csum_partial_copy_from_user
     (src : System.Address;
      dst : System.Address;
      len : int;
      isum : uapi_linux_types_h.uu_wsum;
      errp : access int) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:141
   pragma Import (CPP, csum_partial_copy_from_user, "_Z27csum_partial_copy_from_userPKvPvijPi");

   function csum_partial_copy_to_user
     (src : System.Address;
      dst : System.Address;
      len : int;
      isum : uapi_linux_types_h.uu_wsum;
      errp : access int) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:143
   pragma Import (CPP, csum_partial_copy_to_user, "_Z25csum_partial_copy_to_userPKvPvijPi");

   function csum_partial_copy_nocheck
     (src : System.Address;
      dst : System.Address;
      len : int;
      sum : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:145
   pragma Import (CPP, csum_partial_copy_nocheck, "_Z25csum_partial_copy_nocheckPKvPvij");

  -- Old names. To be removed.  
  --*
  -- * ip_compute_csum - Compute an 16bit IP checksum.
  -- * @buff: buffer address.
  -- * @len: length of buffer.
  -- *
  -- * Returns the 16bit folded/inverted checksum of the passed buffer.
  -- * Ready to fill in.
  --  

   function ip_compute_csum (buff : System.Address; len : int) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:160
   pragma Import (CPP, ip_compute_csum, "_Z15ip_compute_csumPKvi");

  --*
  -- * csum_ipv6_magic - Compute checksum of an IPv6 pseudo header.
  -- * @saddr: source address
  -- * @daddr: destination address
  -- * @len: length of packet
  -- * @proto: protocol of packet
  -- * @sum: initial sum (32bit unfolded) to be added in
  -- *
  -- * Computes an IPv6 pseudo header checksum. This sum is added the checksum
  -- * into UDP/TCP packets and contains some link layer information.
  -- * Returns the unfolded 32bit checksum.
  --  

   function csum_ipv6_magic
     (saddr : access constant uapi_linux_in6_h.in6_addr;
      daddr : access constant uapi_linux_in6_h.in6_addr;
      len : uapi_asm_generic_int_ll64_h.uu_u32;
      proto : unsigned_short;
      sum : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:179
   pragma Import (CPP, csum_ipv6_magic, "_Z15csum_ipv6_magicPK8in6_addrS1_jtj");

   function add32_with_carry (a : unsigned; b : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:182
   pragma Import (CPP, add32_with_carry, "_ZL16add32_with_carryjj");

   function csum_add (csum : uapi_linux_types_h.uu_wsum; addend : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/checksum_64.h:192
   pragma Import (CPP, csum_add, "_ZL8csum_addjj");

end asm_checksum_64_h;

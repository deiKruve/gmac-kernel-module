pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_types_h;
with System;
limited with linux_skbuff_h;

package net_checksum_h is

   --  unsupported macro: CSUM_MANGLED_0 ((__force __sum16)0xffff)
  -- * INET		An implementation of the TCP/IP protocol suite for the LINUX
  -- *		operating system.  INET is implemented using the  BSD Socket
  -- *		interface as the means of communication with the user level.
  -- *
  -- *		Checksumming functions for IP, TCP, UDP and so on
  -- *
  -- * Authors:	Jorge Cwik, <jorge@laser.satlink.net>
  -- *		Arnt Gulbrandsen, <agulbra@nvg.unit.no>
  -- *		Borrows very liberally from tcp.c and ip.c, see those
  -- *		files for more names.
  -- *
  -- *		This program is free software; you can redistribute it and/or
  -- *		modify it under the terms of the GNU General Public License
  -- *		as published by the Free Software Foundation; either version
  -- *		2 of the License, or (at your option) any later version.
  --  

  -- invalid checksum  
   function csum_sub (csum : uapi_linux_types_h.uu_wsum; addend : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:69
   pragma Import (CPP, csum_sub, "_ZL8csum_subjj");

   function csum16_add (csum : uapi_linux_types_h.uu_sum16; addend : uapi_linux_types_h.uu_be16) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:74
   pragma Import (CPP, csum16_add, "_ZL10csum16_addtt");

   function csum16_sub (csum : uapi_linux_types_h.uu_sum16; addend : uapi_linux_types_h.uu_be16) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:82
   pragma Import (CPP, csum16_sub, "_ZL10csum16_subtt");

   function csum_block_add
     (csum : uapi_linux_types_h.uu_wsum;
      csum2 : uapi_linux_types_h.uu_wsum;
      offset : int) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:88
   pragma Import (CPP, csum_block_add, "_ZL14csum_block_addjji");

   function csum_block_add_ext
     (csum : uapi_linux_types_h.uu_wsum;
      csum2 : uapi_linux_types_h.uu_wsum;
      offset : int;
      len : int) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:97
   pragma Import (CPP, csum_block_add_ext, "_ZL18csum_block_add_extjjii");

   function csum_block_sub
     (csum : uapi_linux_types_h.uu_wsum;
      csum2 : uapi_linux_types_h.uu_wsum;
      offset : int) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:103
   pragma Import (CPP, csum_block_sub, "_ZL14csum_block_subjji");

   function csum_unfold (n : uapi_linux_types_h.uu_sum16) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:111
   pragma Import (CPP, csum_unfold, "_ZL11csum_unfoldt");

   function csum_partial_ext
     (buff : System.Address;
      len : int;
      sum : uapi_linux_types_h.uu_wsum) return uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:116
   pragma Import (CPP, csum_partial_ext, "_ZL16csum_partial_extPKvij");

   procedure csum_replace4
     (sum : access uapi_linux_types_h.uu_sum16;
      from : uapi_linux_types_h.uu_be32;
      to : uapi_linux_types_h.uu_be32);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:123
   pragma Import (CPP, csum_replace4, "_ZL13csum_replace4Ptjj");

  -- Implements RFC 1624 (Incremental Internet Checksum)
  -- * 3. Discussion states :
  -- *     HC' = ~(~HC + ~m + m')
  -- *  m : old value of a 16bit field
  -- *  m' : new value of a 16bit field
  --  

   procedure csum_replace2
     (sum : access uapi_linux_types_h.uu_sum16;
      old : uapi_linux_types_h.uu_be16;
      arg3 : uapi_linux_types_h.uu_be16);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:136
   pragma Import (CPP, csum_replace2, "_ZL13csum_replace2Pttt");

   procedure inet_proto_csum_replace4
     (sum : access uapi_linux_types_h.uu_sum16;
      skb : access linux_skbuff_h.sk_buff;
      from : uapi_linux_types_h.uu_be32;
      to : uapi_linux_types_h.uu_be32;
      pseudohdr : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:142
   pragma Import (CPP, inet_proto_csum_replace4, "_Z24inet_proto_csum_replace4PtP7sk_buffjji");

   procedure inet_proto_csum_replace16
     (sum : access uapi_linux_types_h.uu_sum16;
      skb : access linux_skbuff_h.sk_buff;
      from : access uapi_linux_types_h.uu_be32;
      to : access uapi_linux_types_h.uu_be32;
      pseudohdr : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:144
   pragma Import (CPP, inet_proto_csum_replace16, "_Z25inet_proto_csum_replace16PtP7sk_buffPKjS3_i");

   procedure inet_proto_csum_replace2
     (sum : access uapi_linux_types_h.uu_sum16;
      skb : access linux_skbuff_h.sk_buff;
      from : uapi_linux_types_h.uu_be16;
      to : uapi_linux_types_h.uu_be16;
      pseudohdr : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/checksum.h:148
   pragma Import (CPP, inet_proto_csum_replace2, "_ZL24inet_proto_csum_replace2PtP7sk_bufftti");

end net_checksum_h;

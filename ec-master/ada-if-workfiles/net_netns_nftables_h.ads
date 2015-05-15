pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with System;
with asm_generic_int_ll64_h;

package net_netns_nftables_h is

   --  skipped empty struct nft_af_info

   type netns_nftables is record
      af_info : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/nftables.h:9
      commit_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/nftables.h:10
      ipv4 : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/nftables.h:11
      ipv6 : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/nftables.h:12
      inet : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/nftables.h:13
      arp : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/nftables.h:14
      bridge : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/nftables.h:15
      base_seq : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/nftables.h:16
      gencursor : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/nftables.h:17
   end record;
   pragma Convention (C_Pass_By_Copy, netns_nftables);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/nftables.h:8

end net_netns_nftables_h;

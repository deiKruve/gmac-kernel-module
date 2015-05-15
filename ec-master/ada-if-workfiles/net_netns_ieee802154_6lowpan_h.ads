pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sysctl_h;
with net_inet_frag_h;

package net_netns_ieee802154_6lowpan_h is

  -- * ieee802154 6lowpan in net namespaces
  --  

   type netns_sysctl_lowpan is record
      frags_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ieee802154_6lowpan.h:12
   end record;
   pragma Convention (C_Pass_By_Copy, netns_sysctl_lowpan);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ieee802154_6lowpan.h:10

   type netns_ieee802154_lowpan is record
      sysctl : aliased netns_sysctl_lowpan;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ieee802154_6lowpan.h:17
      frags : aliased net_inet_frag_h.netns_frags;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ieee802154_6lowpan.h:18
      max_dsize : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ieee802154_6lowpan.h:19
   end record;
   pragma Convention (C_Pass_By_Copy, netns_ieee802154_lowpan);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ieee802154_6lowpan.h:16

end net_netns_ieee802154_6lowpan_h;

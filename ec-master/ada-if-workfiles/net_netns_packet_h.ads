pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_mutex_h;
with linux_types_h;

package net_netns_packet_h is

  -- * Packet network namespace
  --  

   type netns_packet is record
      sklist_lock : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/packet.h:11
      sklist : aliased linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/packet.h:12
   end record;
   pragma Convention (C_Pass_By_Copy, netns_packet);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/packet.h:10

end net_netns_packet_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with net_snmp_h;
with System;

package net_netns_mib_h is

   type netns_mib is record
      tcp_statistics : access net_snmp_h.tcp_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:7
      ip_statistics : access net_snmp_h.ipstats_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:8
      net_statistics : access net_snmp_h.linux_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:9
      udp_statistics : access net_snmp_h.udp_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:10
      udplite_statistics : access net_snmp_h.udp_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:11
      icmp_statistics : access net_snmp_h.icmp_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:12
      icmpmsg_statistics : access net_snmp_h.icmpmsg_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:13
      proc_net_devsnmp6 : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:16
      udp_stats_in6 : access net_snmp_h.udp_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:17
      udplite_stats_in6 : access net_snmp_h.udp_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:18
      ipv6_statistics : access net_snmp_h.ipstats_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:19
      icmpv6_statistics : access net_snmp_h.icmpv6_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:20
      icmpv6msg_statistics : access net_snmp_h.icmpv6msg_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:21
   end record;
   pragma Convention (C_Pass_By_Copy, netns_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/mib.h:6

   --  skipped empty struct proc_dir_entry

end net_netns_mib_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sysctl_h;
with System;
with net_inet_frag_h;
with linux_timer_h;
with linux_types_h;
with net_dst_ops_h;

package net_netns_ipv6_h is

  -- * ipv6 in net namespaces
  --  

   type netns_sysctl_ipv6 is record
      hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:15
      route_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:16
      icmp_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:17
      frags_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:18
      xfrm6_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:19
      bindv6only : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:21
      flush_delay : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:22
      ip6_rt_max_size : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:23
      ip6_rt_gc_min_interval : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:24
      ip6_rt_gc_timeout : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:25
      ip6_rt_gc_interval : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:26
      ip6_rt_gc_elasticity : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:27
      ip6_rt_mtu_expires : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:28
      ip6_rt_min_advmss : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:29
      flowlabel_consistency : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:30
      icmpv6_time : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:31
      anycast_src_echo_reply : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:32
      fwmark_reflect : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, netns_sysctl_ipv6);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:13

   type netns_ipv6 is record
      sysctl : aliased netns_sysctl_ipv6;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:37
      devconf_all : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:38
      devconf_dflt : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:39
      peers : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:40
      frags : aliased net_inet_frag_h.netns_frags;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:41
      ip6table_filter : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:43
      ip6table_mangle : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:44
      ip6table_raw : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:45
      ip6table_security : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:47
      ip6table_nat : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:49
      ip6_null_entry : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:51
      rt6_stats : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:52
      ip6_fib_timer : aliased linux_timer_h.timer_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:53
      fib_table_hash : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:54
      fib6_main_tbl : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:55
      ip6_dst_ops : aliased net_dst_ops_h.dst_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:56
      ip6_rt_gc_expire : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:57
      ip6_rt_last_gc : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:58
      ip6_prohibit_entry : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:60
      ip6_blk_hole_entry : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:61
      fib6_local_tbl : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:62
      fib6_rules_ops : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:63
      icmp_sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:65
      ndisc_sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:66
      tcp_sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:67
      igmp_sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:68
      mr6_tables : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:73
      mr6_rules_ops : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:74
      dev_addr_genid : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:77
      rt_genid : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, netns_ipv6);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:36

   --  skipped empty struct ipv6_devconf

   --  skipped empty struct rt6_info

   --  skipped empty struct rt6_statistics

   --  skipped empty struct fib6_table

   type netns_nf_frag is record
      sysctl : aliased netns_sysctl_ipv6;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:83
      frags : aliased net_inet_frag_h.netns_frags;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:84
   end record;
   pragma Convention (C_Pass_By_Copy, netns_nf_frag);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv6.h:82

end net_netns_ipv6_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_seqlock_h;
with linux_uidgid_h;
limited with linux_sysctl_h;
with System;
with Interfaces.C.Extensions;
with linux_types_h;
with net_inet_frag_h;

package net_netns_ipv4_h is

  -- * ipv4 in net namespaces
  --  

   --  skipped empty struct tcpm_hash_bucket

   --  skipped empty struct ipv4_devconf

   --  skipped empty struct fib_rules_ops

   --  skipped empty struct fib_table

   type local_ports_c_range_array is array (0 .. 1) of aliased int;
   type local_ports is record
      lock : aliased linux_seqlock_h.seqlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:19
      c_range : aliased local_ports_c_range_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:20
   end record;
   pragma Convention (C_Pass_By_Copy, local_ports);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:18

   type ping_group_range_c_range_array is array (0 .. 1) of aliased linux_uidgid_h.kgid_t;
   type ping_group_range is record
      lock : aliased linux_seqlock_h.seqlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:24
      c_range : aliased ping_group_range_c_range_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:25
   end record;
   pragma Convention (C_Pass_By_Copy, ping_group_range);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:23

   type netns_ipv4 is record
      forw_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:30
      frags_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:31
      ipv4_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:32
      route_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:33
      xfrm4_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:34
      devconf_all : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:36
      devconf_dflt : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:37
      rules_ops : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:39
      fib_has_custom_rules : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:40
      fib_local : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:41
      fib_main : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:42
      fib_default : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:43
      fib_num_tclassid_users : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:46
      fib_table_hash : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:48
      fibnl : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:49
      icmp_sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:51
      peers : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:52
      tcp_metrics_hash : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:53
      tcp_metrics_hash_log : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:54
      frags : aliased net_inet_frag_h.netns_frags;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:55
      iptable_filter : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:57
      iptable_mangle : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:58
      iptable_raw : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:59
      arptable_filter : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:60
      iptable_security : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:62
      nat_table : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:64
      sysctl_icmp_echo_ignore_all : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:67
      sysctl_icmp_echo_ignore_broadcasts : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:68
      sysctl_icmp_ignore_bogus_error_responses : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:69
      sysctl_icmp_ratelimit : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:70
      sysctl_icmp_ratemask : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:71
      sysctl_icmp_errors_use_inbound_ifaddr : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:72
      ip_local_ports : aliased local_ports;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:74
      sysctl_tcp_ecn : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:76
      sysctl_ip_no_pmtu_disc : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:77
      sysctl_ip_fwd_use_pmtu : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:78
      sysctl_fwmark_reflect : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:80
      sysctl_tcp_fwmark_accept : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:81
      the_ping_group_range : aliased ping_group_range;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:83
      dev_addr_genid : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:85
      sysctl_local_reserved_ports : access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:88
      mr_tables : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:95
      mr_rules_ops : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:96
      rt_genid : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:99
   end record;
   pragma Convention (C_Pass_By_Copy, netns_ipv4);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/ipv4.h:28

   --  skipped empty struct inet_peer_base

   --  skipped empty struct xt_table

end net_netns_ipv4_h;

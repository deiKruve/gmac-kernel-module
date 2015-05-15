pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sysctl_h;
with linux_spinlock_types_h;
with linux_list_nulls_h;
with linux_types_h;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
with linux_seqlock_h;
limited with linux_slab_def_h;
with System;
with asm_generic_int_ll64_h;

package net_netns_conntrack_h is

   --  skipped empty struct nf_conntrack_ecache

   type nf_proto_net is record
      the_ctl_table_header : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:15
      the_ctl_table : access linux_sysctl_h.ctl_table;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:16
      ctl_compat_header : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:18
      ctl_compat_table : access linux_sysctl_h.ctl_table;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:19
      users : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:22
   end record;
   pragma Convention (C_Pass_By_Copy, nf_proto_net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:13

   type nf_generic_net is record
      pn : aliased nf_proto_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:26
      timeout : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:27
   end record;
   pragma Convention (C_Pass_By_Copy, nf_generic_net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:25

   type nf_tcp_net_timeouts_array is array (0 .. 13) of aliased unsigned;
   type nf_tcp_net is record
      pn : aliased nf_proto_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:31
      timeouts : aliased nf_tcp_net_timeouts_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:32
      tcp_loose : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:33
      tcp_be_liberal : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:34
      tcp_max_retrans : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:35
   end record;
   pragma Convention (C_Pass_By_Copy, nf_tcp_net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:30

   type udp_conntrack is 
     (UDP_CT_UNREPLIED,
      UDP_CT_REPLIED,
      UDP_CT_MAX);
   pragma Convention (C, udp_conntrack);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:38

   type nf_udp_net_timeouts_array is array (0 .. 1) of aliased unsigned;
   type nf_udp_net is record
      pn : aliased nf_proto_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:45
      timeouts : aliased nf_udp_net_timeouts_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:46
   end record;
   pragma Convention (C_Pass_By_Copy, nf_udp_net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:44

   type nf_icmp_net is record
      pn : aliased nf_proto_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:50
      timeout : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:51
   end record;
   pragma Convention (C_Pass_By_Copy, nf_icmp_net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:49

   type nf_ip_net is record
      c_generic : aliased nf_generic_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:55
      tcp : aliased nf_tcp_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:56
      udp : aliased nf_udp_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:57
      icmp : aliased nf_icmp_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:58
      icmpv6 : aliased nf_icmp_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:59
      the_ctl_table_header : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:61
      the_ctl_table : access linux_sysctl_h.ctl_table;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:62
   end record;
   pragma Convention (C_Pass_By_Copy, nf_ip_net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:54

   type ct_pcpu is record
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:67
      unconfirmed : aliased linux_list_nulls_h.hlist_nulls_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:68
      dying : aliased linux_list_nulls_h.hlist_nulls_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:69
      tmpl : aliased linux_list_nulls_h.hlist_nulls_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:70
   end record;
   pragma Convention (C_Pass_By_Copy, ct_pcpu);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:66

   type netns_ct is record
      count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:74
      expect_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:75
      sysctl_header : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:77
      acct_sysctl_header : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:78
      tstamp_sysctl_header : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:79
      event_sysctl_header : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:80
      helper_sysctl_header : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:81
      slabname : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:83
      sysctl_log_invalid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:84
      sysctl_events_retry_timeout : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:85
      sysctl_events : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:86
      sysctl_acct : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:87
      sysctl_auto_assign_helper : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:88
      auto_assign_helper_warned : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:89
      sysctl_tstamp : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:90
      sysctl_checksum : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:91
      htable_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:93
      generation : aliased linux_seqlock_h.seqcount_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:94
      nf_conntrack_cachep : access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:95
      hash : access linux_list_nulls_h.hlist_nulls_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:96
      expect_hash : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:97
      pcpu_lists : access ct_pcpu;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:98
      stat : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:99
      nf_conntrack_event_cb : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:100
      nf_expect_event_cb : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:101
      nf_ct_proto : aliased nf_ip_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:102
      labels_used : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:104
      label_words : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:105
      nat_bysource : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:108
      nat_htable_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:109
   end record;
   pragma Convention (C_Pass_By_Copy, netns_ct);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/conntrack.h:73

  -- Log invalid packets  
   --  skipped empty struct ip_conntrack_stat

   --  skipped empty struct nf_ct_event_notifier

   --  skipped empty struct nf_exp_event_notifier

end net_netns_conntrack_h;

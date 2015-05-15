pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with linux_spinlock_types_h;
with System;
with linux_sysctl_h;
limited with linux_netdevice_h;
with net_netns_core_h;
with net_netns_mib_h;
with net_netns_packet_h;
with net_netns_unix_h;
with net_netns_ipv4_h;
with net_netns_ipv6_h;
with net_netns_ieee802154_6lowpan_h;
with net_netns_sctp_h;
with net_netns_dccp_h;
with net_netns_netfilter_h;
with net_netns_x_tables_h;
with net_netns_conntrack_h;
with net_netns_nftables_h;
with linux_skbuff_h;
with net_netns_xfrm_h;
with Interfaces.C.Strings;

package net_net_namespace_h is

   --  unsupported macro: NETDEV_HASHBITS 8
   --  unsupported macro: NETDEV_HASHENTRIES (1 << NETDEV_HASHBITS)
   --  arg-macro: procedure for_each_net list_for_each_entry(VAR, andnet_namespace_list, list)
   --    list_for_each_entry(VAR, andnet_namespace_list, list)
   --  arg-macro: procedure for_each_net_rcu list_for_each_entry_rcu(VAR, andnet_namespace_list, list)
   --    list_for_each_entry_rcu(VAR, andnet_namespace_list, list)
  -- * Operations on the network namespace
  --  

   --  skipped empty struct net_generic

   --  skipped empty struct netns_ipvs

  -- To decided when the network
  --						 * namespace should be freed.
  --						  

   type net is record
      passive : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:44
      count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:47
      rules_mod_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:55
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:57
      cleanup_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:58
      exit_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:59
      user_ns : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:61
      proc_inum : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:63
      proc_net : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:65
      proc_net_stat : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:66
      sysctls : aliased linux_sysctl_h.ctl_table_set;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:69
      rtnl : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:72
      genl_sock : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:73
      dev_base_head : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:75
      dev_name_head : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:76
      dev_index_head : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:77
      dev_base_seq : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:78
      ifindex : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:79
      dev_unreg_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:80
      rules_ops : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:83
      loopback_dev : access linux_netdevice_h.net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:86
      core : aliased net_netns_core_h.netns_core;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:87
      mib : aliased net_netns_mib_h.netns_mib;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:88
      packet : aliased net_netns_packet_h.netns_packet;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:89
      unx : aliased net_netns_unix_h.netns_unix;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:90
      ipv4 : aliased net_netns_ipv4_h.netns_ipv4;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:91
      ipv6 : aliased net_netns_ipv6_h.netns_ipv6;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:93
      ieee802154_lowpan : aliased net_netns_ieee802154_6lowpan_h.netns_ieee802154_lowpan;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:96
      sctp : aliased net_netns_sctp_h.netns_sctp;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:99
      dccp : aliased net_netns_dccp_h.netns_dccp;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:102
      nf : aliased net_netns_netfilter_h.netns_nf;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:105
      xt : aliased net_netns_x_tables_h.netns_xt;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:106
      ct : aliased net_netns_conntrack_h.netns_ct;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:108
      nft : aliased net_netns_nftables_h.netns_nftables;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:111
      nf_frag : aliased net_netns_ipv6_h.netns_nf_frag;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:114
      nfnl : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:116
      nfnl_stash : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:117
      wext_nlevents : aliased linux_skbuff_h.sk_buff_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:120
      gen : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:122
      xfrm : aliased net_netns_xfrm_h.netns_xfrm;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:126
      ipvs : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:129
      diag_nlsk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:131
      fnhe_genid : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:132
      tcp_sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:134
   end record;
   pragma Convention (C_Pass_By_Copy, net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:43

  -- To decided when the network
  --						 *  namespace should be shut down.
  --						  

  -- To track references we
  --						 * destroy on demand
  --						  

  -- list of network namespaces  
  -- namespaces on death row  
  -- Use only net_mutex  
  -- Owning user namespace  
  -- rtnetlink socket  
  -- protected by rtnl_mutex  
  -- core fib_rules  
  -- The loopback  
  -- Note : following structs are cache line aligned  
  -- Init's network namespace  
   init_net : aliased net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:141
   pragma Import (C, init_net, "init_net");

   function copy_net_ns
     (flags : unsigned_long;
      user_ns : System.Address;
      old_net : access net) return access net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:144
   pragma Import (CPP, copy_net_ns, "_Z11copy_net_nsmP14user_namespaceP3net");

   net_namespace_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:160
   pragma Import (C, net_namespace_list, "net_namespace_list");

   function get_net_ns_by_pid (pid : linux_types_h.pid_t) return access net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:162
   pragma Import (CPP, get_net_ns_by_pid, "_Z17get_net_ns_by_pidi");

   function get_net_ns_by_fd (pid : int) return access net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:163
   pragma Import (CPP, get_net_ns_by_fd, "_Z16get_net_ns_by_fdi");

   procedure ipx_register_sysctl;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:166
   pragma Import (CPP, ipx_register_sysctl, "_Z19ipx_register_sysctlv");

   procedure ipx_unregister_sysctl;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:167
   pragma Import (CPP, ipx_unregister_sysctl, "_Z21ipx_unregister_sysctlv");

   --  skipped func __put_net

   function get_net (the_net : access net) return access net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:176
   pragma Import (CPP, get_net, "_ZL7get_netP3net");

   function maybe_get_net (the_net : access net) return access net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:182
   pragma Import (CPP, maybe_get_net, "_ZL13maybe_get_netP3net");

  -- Used when we know struct net exists but we
  --	 * aren't guaranteed a previous reference count
  --	 * exists.  If the reference count is zero this
  --	 * function fails and returns NULL.
  --	  

   procedure put_net (the_net : access net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:194
   pragma Import (CPP, put_net, "_ZL7put_netP3net");

   function net_eq (net1 : access constant net; net2 : access constant net) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:201
   pragma Import (CPP, net_eq, "_ZL6net_eqPK3netS1_");

   procedure net_drop_ns (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:206
   pragma Import (CPP, net_drop_ns, "_Z11net_drop_nsPv");

   function hold_net (the_net : access net) return access net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:248
   pragma Import (CPP, hold_net, "_ZL8hold_netP3net");

   procedure release_net (the_net : access net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:253
   pragma Import (CPP, release_net, "_ZL11release_netP3net");

   procedure write_pnet (pnet : System.Address; the_net : access net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:260
   pragma Import (CPP, write_pnet, "_ZL10write_pnetPP3netS0_");

   function read_pnet (pnet : System.Address) return access net;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:265
   pragma Import (CPP, read_pnet, "_ZL9read_pnetPKP3net");

   type pernet_operations is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:296
      init : access function (arg1 : access net) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:297
      c_exit : access procedure (arg1 : access net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:298
      exit_batch : access procedure (arg1 : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:299
      id : access int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:300
      size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:301
   end record;
   pragma Convention (C_Pass_By_Copy, pernet_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:295

  -- * Use these carefully.  If you implement a network device and it
  -- * needs per network namespace operations use device pernet operations,
  -- * otherwise use pernet subsys operations.
  -- *
  -- * Network interfaces need to be removed from a dying netns _before_
  -- * subsys notifiers can be called, as most of the network code cleanup
  -- * (which is done from subsys notifiers) runs with the assumption that
  -- * dev_remove_pack has been called so no new packets will arrive during
  -- * and after the cleanup functions have been called.  dev_remove_pack
  -- * is not per namespace so instead the guarantee of no more packets
  -- * arriving in a network namespace is provided by ensuring that all
  -- * network devices and all sockets have left the network namespace
  -- * before the cleanup methods are called.
  -- *
  -- * For the longest time the ipv4 icmp code was registered as a pernet
  -- * device which caused kernel oops, and panics during network
  -- * namespace cleanup.   So please don't get this wrong.
  --  

   function register_pernet_subsys (arg1 : access pernet_operations) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:323
   pragma Import (CPP, register_pernet_subsys, "_Z22register_pernet_subsysP17pernet_operations");

   procedure unregister_pernet_subsys (arg1 : access pernet_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:324
   pragma Import (CPP, unregister_pernet_subsys, "_Z24unregister_pernet_subsysP17pernet_operations");

   function register_pernet_device (arg1 : access pernet_operations) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:325
   pragma Import (CPP, register_pernet_device, "_Z22register_pernet_deviceP17pernet_operations");

   procedure unregister_pernet_device (arg1 : access pernet_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:326
   pragma Import (CPP, unregister_pernet_device, "_Z24unregister_pernet_deviceP17pernet_operations");

   function net_sysctl_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:332
   pragma Import (CPP, net_sysctl_init, "_Z15net_sysctl_initv");

   function register_net_sysctl
     (the_net : access net;
      path : Interfaces.C.Strings.chars_ptr;
      table : access linux_sysctl_h.ctl_table) return access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:333
   pragma Import (CPP, register_net_sysctl, "_Z19register_net_sysctlP3netPKcP9ctl_table");

   procedure unregister_net_sysctl_table (header : access linux_sysctl_h.ctl_table_header);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:335
   pragma Import (CPP, unregister_net_sysctl_table, "_Z27unregister_net_sysctl_tableP16ctl_table_header");

   function rt_genid_ipv4 (the_net : access net) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:348
   pragma Import (CPP, rt_genid_ipv4, "_ZL13rt_genid_ipv4P3net");

   procedure rt_genid_bump_ipv4 (the_net : access net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:353
   pragma Import (CPP, rt_genid_bump_ipv4, "_ZL18rt_genid_bump_ipv4P3net");

   procedure rt_genid_bump_ipv6 (the_net : access net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:359
   pragma Import (CPP, rt_genid_bump_ipv6, "_ZL18rt_genid_bump_ipv6P3net");

   function net_ieee802154_lowpan (the_net : access net) return access net_netns_ieee802154_6lowpan_h.netns_ieee802154_lowpan;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:367
   pragma Import (CPP, net_ieee802154_lowpan, "_ZL21net_ieee802154_lowpanP3net");

  -- For callers who don't really care about whether it's IPv4 or IPv6  
   procedure rt_genid_bump_all (the_net : access net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:374
   pragma Import (CPP, rt_genid_bump_all, "_ZL17rt_genid_bump_allP3net");

   function fnhe_genid (the_net : access net) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:380
   pragma Import (CPP, fnhe_genid, "_ZL10fnhe_genidP3net");

   procedure fnhe_genid_bump (the_net : access net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/net_namespace.h:385
   pragma Import (CPP, fnhe_genid_bump, "_ZL15fnhe_genid_bumpP3net");

end net_net_namespace_h;

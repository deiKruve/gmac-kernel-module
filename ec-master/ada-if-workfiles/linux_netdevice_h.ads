pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with linux_ethtool_h;
with Interfaces.C.Extensions;
with linux_jump_label_h;
with linux_types_h;
with asm_generic_int_ll64_h;
with linux_seqlock_h;
with linux_skbuff_h;
with uapi_linux_types_h;
with uapi_linux_if_h;
with Interfaces.C.Strings;
with linux_spinlock_types_h;
with linux_kobject_h;
with linux_dynamic_queue_limits_h;
with linux_sysfs_h;
limited with uapi_linux_if_link_h;
limited with linux_if_link_h;
limited with asm_generic_scatterlist_h;
with linux_netdev_features_h;
limited with uapi_linux_neighbour_h;
limited with linux_netlink_h;
limited with uapi_linux_netlink_h;
with linux_socket_h;
with asm_generic_atomic_long_h;
with linux_timer_h;
with net_net_namespace_h;
with linux_device_h;
limited with net_dcbnl_h;
limited with net_netprio_cgroup_h;
limited with linux_lockdep_h;
with linux_pm_qos_h;
with linux_u64_stats_sync_h;
limited with linux_notifier_h;
with linux_rwlock_types_h;
with linux_smp_h;
limited with linux_cpumask_h;
with linux_kobject_ns_h;

package linux_netdevice_h is

   --  unsupported macro: NET_RX_SUCCESS 0
   --  unsupported macro: NET_RX_DROP 1
   --  unsupported macro: NET_XMIT_SUCCESS 0x00
   --  unsupported macro: NET_XMIT_DROP 0x01
   --  unsupported macro: NET_XMIT_CN 0x02
   --  unsupported macro: NET_XMIT_POLICED 0x03
   --  unsupported macro: NET_XMIT_MASK 0x0f
   --  arg-macro: function net_xmit_eval ((e) = NET_XMIT_CN ? 0 : (e)
   --    return (e) = NET_XMIT_CN ? 0 : (e);
   --  arg-macro: function net_xmit_errno ((e) /= NET_XMIT_CN ? -ENOBUFS : 0
   --    return (e) /= NET_XMIT_CN ? -ENOBUFS : 0;
   --  unsupported macro: NETDEV_TX_MASK 0xf0
   --  unsupported macro: LL_MAX_HEADER 128
   --  unsupported macro: MAX_HEADER (LL_MAX_HEADER + 48)
   --  unsupported macro: NETDEV_HW_ADDR_T_LAN 1
   --  unsupported macro: NETDEV_HW_ADDR_T_SAN 2
   --  unsupported macro: NETDEV_HW_ADDR_T_SLAVE 3
   --  unsupported macro: NETDEV_HW_ADDR_T_UNICAST 4
   --  unsupported macro: NETDEV_HW_ADDR_T_MULTICAST 5
   --  arg-macro: function netdev_hw_addr_list_count ((l).count
   --    return (l).count;
   --  arg-macro: function netdev_hw_addr_list_empty (netdev_hw_addr_list_count(l) = 0
   --    return netdev_hw_addr_list_count(l) = 0;
   --  arg-macro: procedure netdev_hw_addr_list_for_each list_for_each_entry(ha, and(l).list, list)
   --    list_for_each_entry(ha, and(l).list, list)
   --  arg-macro: procedure netdev_uc_count netdev_hw_addr_list_count(and(dev).uc)
   --    netdev_hw_addr_list_count(and(dev).uc)
   --  arg-macro: procedure netdev_uc_empty netdev_hw_addr_list_empty(and(dev).uc)
   --    netdev_hw_addr_list_empty(and(dev).uc)
   --  arg-macro: procedure netdev_for_each_uc_addr netdev_hw_addr_list_for_each(ha, and(dev).uc)
   --    netdev_hw_addr_list_for_each(ha, and(dev).uc)
   --  arg-macro: procedure netdev_mc_count netdev_hw_addr_list_count(and(dev).mc)
   --    netdev_hw_addr_list_count(and(dev).mc)
   --  arg-macro: procedure netdev_mc_empty netdev_hw_addr_list_empty(and(dev).mc)
   --    netdev_hw_addr_list_empty(and(dev).mc)
   --  arg-macro: procedure netdev_for_each_mc_addr netdev_hw_addr_list_for_each(ha, and(dev).mc)
   --    netdev_hw_addr_list_for_each(ha, and(dev).mc)
   --  unsupported macro: HH_DATA_MOD 16
   --  arg-macro: function HH_DATA_OFF (HH_DATA_MOD - (((__len - 1) and (HH_DATA_MOD - 1)) + 1)
   --    return HH_DATA_MOD - (((__len - 1) and (HH_DATA_MOD - 1)) + 1);
   --  arg-macro: function HH_DATA_ALIGN (((__len)+(HH_DATA_MOD-1))and~(HH_DATA_MOD - 1)
   --    return ((__len)+(HH_DATA_MOD-1))and~(HH_DATA_MOD - 1);
   --  arg-macro: function LL_RESERVED_SPACE ((((dev).hard_header_len+(dev).needed_headroom)and~(HH_DATA_MOD - 1)) + HH_DATA_MOD
   --    return (((dev).hard_header_len+(dev).needed_headroom)and~(HH_DATA_MOD - 1)) + HH_DATA_MOD;
   --  arg-macro: function LL_RESERVED_SPACE_EXTRA ((((dev).hard_header_len+(dev).needed_headroom+(extra))and~(HH_DATA_MOD - 1)) + HH_DATA_MOD
   --    return (((dev).hard_header_len+(dev).needed_headroom+(extra))and~(HH_DATA_MOD - 1)) + HH_DATA_MOD;
   --  unsupported macro: NETDEV_BOOT_SETUP_MAX 8
   --  unsupported macro: QUEUE_STATE_DRV_XOFF (1 << __QUEUE_STATE_DRV_XOFF)
   --  unsupported macro: QUEUE_STATE_STACK_XOFF (1 << __QUEUE_STATE_STACK_XOFF)
   --  unsupported macro: QUEUE_STATE_FROZEN (1 << __QUEUE_STATE_FROZEN)
   --  unsupported macro: QUEUE_STATE_ANY_XOFF (QUEUE_STATE_DRV_XOFF | QUEUE_STATE_STACK_XOFF)
   --  unsupported macro: QUEUE_STATE_ANY_XOFF_OR_FROZEN (QUEUE_STATE_ANY_XOFF | QUEUE_STATE_FROZEN)
   --  unsupported macro: QUEUE_STATE_DRV_XOFF_OR_FROZEN (QUEUE_STATE_DRV_XOFF | QUEUE_STATE_FROZEN)
   --  arg-macro: function RPS_MAP_SIZE (sizeof(struct rps_map) + ((_num) * sizeof(u16))
   --    return sizeof(struct rps_map) + ((_num) * sizeof(u16));
   --  unsupported macro: RPS_NO_FILTER 0xffff
   --  arg-macro: function RPS_DEV_FLOW_TABLE_SIZE (sizeof(struct rps_dev_flow_table) + ((_num) * sizeof(struct rps_dev_flow))
   --    return sizeof(struct rps_dev_flow_table) + ((_num) * sizeof(struct rps_dev_flow));
   --  arg-macro: function RPS_SOCK_FLOW_TABLE_SIZE (sizeof(struct rps_sock_flow_table) + ((_num) * sizeof(u16))
   --    return sizeof(struct rps_sock_flow_table) + ((_num) * sizeof(u16));
   --  unsupported macro: RPS_NO_CPU 0xffff
   --  arg-macro: function XPS_MAP_SIZE (sizeof(struct xps_map) + ((_num) * sizeof(u16))
   --    return sizeof(struct xps_map) + ((_num) * sizeof(u16));
   --  unsupported macro: XPS_MIN_MAP_ALLOC ((L1_CACHE_BYTES - sizeof(struct xps_map)) / sizeof(u16))
   --  unsupported macro: XPS_DEV_MAPS_SIZE (sizeof(struct xps_dev_maps) + (nr_cpu_ids * sizeof(struct xps_map *)))
   --  unsupported macro: TC_MAX_QUEUE 16
   --  unsupported macro: TC_BITMASK 15
   --  unsupported macro: MAX_PHYS_PORT_ID_LEN 32
   --  unsupported macro: NETDEV_FCOE_WWNN 0
   --  unsupported macro: NETDEV_FCOE_WWPN 1
   --  unsupported macro: IFF_802_1Q_VLAN IFF_802_1Q_VLAN
   --  unsupported macro: IFF_EBRIDGE IFF_EBRIDGE
   --  unsupported macro: IFF_SLAVE_INACTIVE IFF_SLAVE_INACTIVE
   --  unsupported macro: IFF_MASTER_8023AD IFF_MASTER_8023AD
   --  unsupported macro: IFF_MASTER_ALB IFF_MASTER_ALB
   --  unsupported macro: IFF_BONDING IFF_BONDING
   --  unsupported macro: IFF_SLAVE_NEEDARP IFF_SLAVE_NEEDARP
   --  unsupported macro: IFF_ISATAP IFF_ISATAP
   --  unsupported macro: IFF_MASTER_ARPMON IFF_MASTER_ARPMON
   --  unsupported macro: IFF_WAN_HDLC IFF_WAN_HDLC
   --  unsupported macro: IFF_XMIT_DST_RELEASE IFF_XMIT_DST_RELEASE
   --  unsupported macro: IFF_DONT_BRIDGE IFF_DONT_BRIDGE
   --  unsupported macro: IFF_DISABLE_NETPOLL IFF_DISABLE_NETPOLL
   --  unsupported macro: IFF_MACVLAN_PORT IFF_MACVLAN_PORT
   --  unsupported macro: IFF_BRIDGE_PORT IFF_BRIDGE_PORT
   --  unsupported macro: IFF_OVS_DATAPATH IFF_OVS_DATAPATH
   --  unsupported macro: IFF_TX_SKB_SHARING IFF_TX_SKB_SHARING
   --  unsupported macro: IFF_UNICAST_FLT IFF_UNICAST_FLT
   --  unsupported macro: IFF_TEAM_PORT IFF_TEAM_PORT
   --  unsupported macro: IFF_SUPP_NOFCS IFF_SUPP_NOFCS
   --  unsupported macro: IFF_LIVE_ADDR_CHANGE IFF_LIVE_ADDR_CHANGE
   --  unsupported macro: IFF_MACVLAN IFF_MACVLAN
   --  unsupported macro: GSO_MAX_SIZE 65536
   --  unsupported macro: GSO_MAX_SEGS 65535
   --  arg-macro: procedure to_net_dev container_of(d, struct net_device, dev)
   --    container_of(d, struct net_device, dev)
   --  unsupported macro: NETDEV_ALIGN 32
   --  arg-macro: function SET_NETDEV_DEV ((net).dev.parent := (pdev)
   --    return (net).dev.parent := (pdev);
   --  arg-macro: function SET_NETDEV_DEVTYPE ((net).dev.type := (devtype)
   --    return (net).dev.type := (devtype);
   --  unsupported macro: NAPI_POLL_WEIGHT 64
   --  unsupported macro: NAPI_GRO_FREE 1
   --  unsupported macro: NAPI_GRO_FREE_STOLEN_HEAD 2
   --  arg-macro: function NAPI_GRO_CB ((struct napi_gro_cb *)(skb).cb
   --    return (struct napi_gro_cb *)(skb).cb;
   --  arg-macro: function netdev_alloc_pcpu_stats ({ typeof(type) __percpu *pcpu_stats := alloc_percpu(type); if (pcpu_stats) { int i; for_each_possible_cpu(i) { typeof(type) *stat; stat := per_cpu_ptr(pcpu_stats, i); u64_stats_init(andstat.syncp); } } pcpu_stats; }
   --    return { typeof(type) __percpu *pcpu_stats := alloc_percpu(type); if (pcpu_stats) { int i; for_each_possible_cpu(i) { typeof(type) *stat; stat := per_cpu_ptr(pcpu_stats, i); u64_stats_init(andstat.syncp); } } pcpu_stats; };
   --  unsupported macro: NETDEV_UP 0x0001
   --  unsupported macro: NETDEV_DOWN 0x0002
   --  unsupported macro: NETDEV_REBOOT 0x0003
   --  unsupported macro: NETDEV_CHANGE 0x0004
   --  unsupported macro: NETDEV_REGISTER 0x0005
   --  unsupported macro: NETDEV_UNREGISTER 0x0006
   --  unsupported macro: NETDEV_CHANGEMTU 0x0007
   --  unsupported macro: NETDEV_CHANGEADDR 0x0008
   --  unsupported macro: NETDEV_GOING_DOWN 0x0009
   --  unsupported macro: NETDEV_CHANGENAME 0x000A
   --  unsupported macro: NETDEV_FEAT_CHANGE 0x000B
   --  unsupported macro: NETDEV_BONDING_FAILOVER 0x000C
   --  unsupported macro: NETDEV_PRE_UP 0x000D
   --  unsupported macro: NETDEV_PRE_TYPE_CHANGE 0x000E
   --  unsupported macro: NETDEV_POST_TYPE_CHANGE 0x000F
   --  unsupported macro: NETDEV_POST_INIT 0x0010
   --  unsupported macro: NETDEV_UNREGISTER_FINAL 0x0011
   --  unsupported macro: NETDEV_RELEASE 0x0012
   --  unsupported macro: NETDEV_NOTIFY_PEERS 0x0013
   --  unsupported macro: NETDEV_JOIN 0x0014
   --  unsupported macro: NETDEV_CHANGEUPPER 0x0015
   --  unsupported macro: NETDEV_RESEND_IGMP 0x0016
   --  unsupported macro: NETDEV_PRECHANGEMTU 0x0017
   --  arg-macro: procedure for_each_netdev list_for_each_entry(d, and(net).dev_base_head, dev_list)
   --    list_for_each_entry(d, and(net).dev_base_head, dev_list)
   --  arg-macro: procedure for_each_netdev_reverse list_for_each_entry_reverse(d, and(net).dev_base_head, dev_list)
   --    list_for_each_entry_reverse(d, and(net).dev_base_head, dev_list)
   --  arg-macro: procedure for_each_netdev_rcu list_for_each_entry_rcu(d, and(net).dev_base_head, dev_list)
   --    list_for_each_entry_rcu(d, and(net).dev_base_head, dev_list)
   --  arg-macro: procedure for_each_netdev_safe list_for_each_entry_safe(d, n, and(net).dev_base_head, dev_list)
   --    list_for_each_entry_safe(d, n, and(net).dev_base_head, dev_list)
   --  arg-macro: procedure for_each_netdev_continue list_for_each_entry_continue(d, and(net).dev_base_head, dev_list)
   --    list_for_each_entry_continue(d, and(net).dev_base_head, dev_list)
   --  arg-macro: procedure for_each_netdev_continue_rcu list_for_each_entry_continue_rcu(d, and(net).dev_base_head, dev_list)
   --    list_for_each_entry_continue_rcu(d, and(net).dev_base_head, dev_list)
   --  arg-macro: procedure for_each_netdev_in_bond_rcu for_each_netdev_rcu(andinit_net, slave) if (netdev_master_upper_dev_get_rcu(slave) = bond)
   --    for_each_netdev_rcu(andinit_net, slave) if (netdev_master_upper_dev_get_rcu(slave) = bond)
   --  arg-macro: procedure net_device_entry list_entry(lh, struct net_device, dev_list)
   --    list_entry(lh, struct net_device, dev_list)
   --  unsupported macro: FLOW_LIMIT_HISTORY (1 << 7)
   --  unsupported macro: DEFAULT_MAX_NUM_RSS_QUEUES (8)
   --  arg-macro: function netif_msg_drv ((p).msg_enable and NETIF_MSG_DRV
   --    return (p).msg_enable and NETIF_MSG_DRV;
   --  arg-macro: function netif_msg_probe ((p).msg_enable and NETIF_MSG_PROBE
   --    return (p).msg_enable and NETIF_MSG_PROBE;
   --  arg-macro: function netif_msg_link ((p).msg_enable and NETIF_MSG_LINK
   --    return (p).msg_enable and NETIF_MSG_LINK;
   --  arg-macro: function netif_msg_timer ((p).msg_enable and NETIF_MSG_TIMER
   --    return (p).msg_enable and NETIF_MSG_TIMER;
   --  arg-macro: function netif_msg_ifdown ((p).msg_enable and NETIF_MSG_IFDOWN
   --    return (p).msg_enable and NETIF_MSG_IFDOWN;
   --  arg-macro: function netif_msg_ifup ((p).msg_enable and NETIF_MSG_IFUP
   --    return (p).msg_enable and NETIF_MSG_IFUP;
   --  arg-macro: function netif_msg_rx_err ((p).msg_enable and NETIF_MSG_RX_ERR
   --    return (p).msg_enable and NETIF_MSG_RX_ERR;
   --  arg-macro: function netif_msg_tx_err ((p).msg_enable and NETIF_MSG_TX_ERR
   --    return (p).msg_enable and NETIF_MSG_TX_ERR;
   --  arg-macro: function netif_msg_tx_queued ((p).msg_enable and NETIF_MSG_TX_QUEUED
   --    return (p).msg_enable and NETIF_MSG_TX_QUEUED;
   --  arg-macro: function netif_msg_intr ((p).msg_enable and NETIF_MSG_INTR
   --    return (p).msg_enable and NETIF_MSG_INTR;
   --  arg-macro: function netif_msg_tx_done ((p).msg_enable and NETIF_MSG_TX_DONE
   --    return (p).msg_enable and NETIF_MSG_TX_DONE;
   --  arg-macro: function netif_msg_rx_status ((p).msg_enable and NETIF_MSG_RX_STATUS
   --    return (p).msg_enable and NETIF_MSG_RX_STATUS;
   --  arg-macro: function netif_msg_pktdata ((p).msg_enable and NETIF_MSG_PKTDATA
   --    return (p).msg_enable and NETIF_MSG_PKTDATA;
   --  arg-macro: function netif_msg_hw ((p).msg_enable and NETIF_MSG_HW
   --    return (p).msg_enable and NETIF_MSG_HW;
   --  arg-macro: function netif_msg_wol ((p).msg_enable and NETIF_MSG_WOL
   --    return (p).msg_enable and NETIF_MSG_WOL;
   --  arg-macro: procedure HARD_TX_LOCK { if ((dev.features and NETIF_F_LLTX) = 0) { __netif_tx_lock(txq, cpu); } }
   --    { if ((dev.features and NETIF_F_LLTX) = 0) { __netif_tx_lock(txq, cpu); } }
   --  arg-macro: function HARD_TX_TRYLOCK (((dev.features and NETIF_F_LLTX) = 0) ? __netif_tx_trylock(txq) : true 
   --    return ((dev.features and NETIF_F_LLTX) = 0) ? __netif_tx_trylock(txq) : true ;
   --  arg-macro: procedure HARD_TX_UNLOCK { if ((dev.features and NETIF_F_LLTX) = 0) { __netif_tx_unlock(txq); } }
   --    { if ((dev.features and NETIF_F_LLTX) = 0) { __netif_tx_unlock(txq); } }
   --  arg-macro: procedure for_each_dev_addr list_for_each_entry_rcu(ha, anddev.dev_addrs.list, list)
   --    list_for_each_entry_rcu(ha, anddev.dev_addrs.list, list)
   --  arg-macro: procedure alloc_netdev alloc_netdev_mqs(sizeof_priv, name, setup, 1, 1)
   --    alloc_netdev_mqs(sizeof_priv, name, setup, 1, 1)
   --  arg-macro: procedure alloc_netdev_mq alloc_netdev_mqs(sizeof_priv, name, setup, count, count)
   --    alloc_netdev_mqs(sizeof_priv, name, setup, count, count)
   --  arg-macro: procedure netdev_for_each_upper_dev_rcu for (iter := and(dev).adj_list.upper, updev := netdev_upper_get_next_dev_rcu(dev, and(iter)); updev; updev := netdev_upper_get_next_dev_rcu(dev, and(iter)))
   --    for (iter := and(dev).adj_list.upper, updev := netdev_upper_get_next_dev_rcu(dev, and(iter)); updev; updev := netdev_upper_get_next_dev_rcu(dev, and(iter)))
   --  arg-macro: procedure netdev_for_each_all_upper_dev_rcu for (iter := and(dev).all_adj_list.upper, updev := netdev_all_upper_get_next_dev_rcu(dev, and(iter)); updev; updev := netdev_all_upper_get_next_dev_rcu(dev, and(iter)))
   --    for (iter := and(dev).all_adj_list.upper, updev := netdev_all_upper_get_next_dev_rcu(dev, and(iter)); updev; updev := netdev_all_upper_get_next_dev_rcu(dev, and(iter)))
   --  arg-macro: procedure netdev_for_each_lower_private for (iter := (dev).adj_list.lower.next, priv := netdev_lower_get_next_private(dev, and(iter)); priv; priv := netdev_lower_get_next_private(dev, and(iter)))
   --    for (iter := (dev).adj_list.lower.next, priv := netdev_lower_get_next_private(dev, and(iter)); priv; priv := netdev_lower_get_next_private(dev, and(iter)))
   --  arg-macro: procedure netdev_for_each_lower_private_rcu for (iter := and(dev).adj_list.lower, priv := netdev_lower_get_next_private_rcu(dev, and(iter)); priv; priv := netdev_lower_get_next_private_rcu(dev, and(iter)))
   --    for (iter := and(dev).adj_list.lower, priv := netdev_lower_get_next_private_rcu(dev, and(iter)); priv; priv := netdev_lower_get_next_private_rcu(dev, and(iter)))
   --  arg-macro: procedure netdev_for_each_lower_dev for (iter := and(dev).adj_list.lower, ldev := netdev_lower_get_next(dev, and(iter)); ldev; ldev := netdev_lower_get_next(dev, and(iter)))
   --    for (iter := and(dev).adj_list.lower, ldev := netdev_lower_get_next(dev, and(iter)); ldev; ldev := netdev_lower_get_next(dev, and(iter)))
   --  arg-macro: procedure MODULE_ALIAS_NETDEV MODULE_ALIAS("netdev-" device)
   --    MODULE_ALIAS("netdev-" device)
   --  unsupported macro: netdev_dbg(__dev,format,args...) do { dynamic_netdev_dbg(__dev, format, ##args); } while (0)
   --  unsupported macro: netdev_vdbg(dev,format,args...) ({ if (0) netdev_printk(KERN_DEBUG, dev, format, ##args); 0; })
   --  unsupported macro: netdev_WARN(dev,format,args...) WARN(1, "netdevice: %s\n" format, netdev_name(dev), ##args)
   --  unsupported macro: netif_printk(priv,type,level,dev,fmt,args...) do { if (netif_msg_ ##type(priv)) netdev_printk(level, (dev), fmt, ##args); } while (0)
   --  unsupported macro: netif_level(level,priv,type,dev,fmt,args...) do { if (netif_msg_ ##type(priv)) netdev_ ##level(dev, fmt, ##args); } while (0)
   --  unsupported macro: netif_emerg(priv,type,dev,fmt,args...) netif_level(emerg, priv, type, dev, fmt, ##args)
   --  unsupported macro: netif_alert(priv,type,dev,fmt,args...) netif_level(alert, priv, type, dev, fmt, ##args)
   --  unsupported macro: netif_crit(priv,type,dev,fmt,args...) netif_level(crit, priv, type, dev, fmt, ##args)
   --  unsupported macro: netif_err(priv,type,dev,fmt,args...) netif_level(err, priv, type, dev, fmt, ##args)
   --  unsupported macro: netif_warn(priv,type,dev,fmt,args...) netif_level(warn, priv, type, dev, fmt, ##args)
   --  unsupported macro: netif_notice(priv,type,dev,fmt,args...) netif_level(notice, priv, type, dev, fmt, ##args)
   --  unsupported macro: netif_info(priv,type,dev,fmt,args...) netif_level(info, priv, type, dev, fmt, ##args)
   --  unsupported macro: netif_dbg(priv,type,netdev,format,args...) do { if (netif_msg_ ##type(priv)) dynamic_netdev_dbg(netdev, format, ##args); } while (0)
   --  unsupported macro: netif_vdbg(priv,type,dev,format,args...) ({ if (0) netif_printk(priv, type, KERN_DEBUG, dev, format, ##args); 0; })
   --  unsupported macro: PTYPE_HASH_SIZE (16)
   --  unsupported macro: PTYPE_HASH_MASK (PTYPE_HASH_SIZE - 1)
  -- * INET		An implementation of the TCP/IP protocol suite for the LINUX
  -- *		operating system.  INET is implemented using the  BSD Socket
  -- *		interface as the means of communication with the user level.
  -- *
  -- *		Definitions for the Interfaces handler.
  -- *
  -- * Version:	@(#)dev.h	1.0.10	08/12/93
  -- *
  -- * Authors:	Ross Biro
  -- *		Fred N. van Kempen, <waltje@uWalt.NL.Mugnet.ORG>
  -- *		Corey Minyard <wf-rch!minyard@relay.EU.net>
  -- *		Donald J. Becker, <becker@cesdis.gsfc.nasa.gov>
  -- *		Alan Cox, <alan@lxorguk.ukuu.org.uk>
  -- *		Bjorn Ekwall. <bj0rn@blox.se>
  -- *              Pekka Riikonen <priikone@poseidon.pspt.fi>
  -- *
  -- *		This program is free software; you can redistribute it and/or
  -- *		modify it under the terms of the GNU General Public License
  -- *		as published by the Free Software Foundation; either version
  -- *		2 of the License, or (at your option) any later version.
  -- *
  -- *		Moved to /usr/include/linux for NET3
  --  

   --  skipped empty struct netpoll_info

   --  skipped empty struct phy_device

  -- 802.11 specific  
   --  skipped empty struct wireless_dev

   procedure netdev_set_default_ethtool_ops (dev : System.Address; ops : access constant linux_ethtool_h.ethtool_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:60
   pragma Import (CPP, netdev_set_default_ethtool_ops, "_Z30netdev_set_default_ethtool_opsP10net_devicePK11ethtool_ops");

  -- Backlog congestion levels  
  -- * Transmit return codes: transmit return codes originate from three different
  -- * namespaces:
  -- *
  -- * - qdisc return codes
  -- * - driver transmit return codes
  -- * - errno values
  -- *
  -- * Drivers are allowed to return any one of those in their hard_start_xmit()
  -- * function. Real network devices commonly used with qdiscs should only return
  -- * the driver transmit return codes though - when qdiscs are used, the actual
  -- * transmission happens asynchronously, so the value is not propagated to
  -- * higher layers. Virtual network devices transmit synchronously, in this case
  -- * the driver transmit return codes are consumed by dev_queue_xmit(), all
  -- * others are propagated to higher layers.
  --  

  -- qdisc ->enqueue() return codes.  
  -- NET_XMIT_CN is special. It does not guarantee that this packet is lost. It
  -- * indicates that the device will soon be dropping packets, or already drops
  -- * some packets of the same priority; prompting us to send less aggressively.  

  -- Driver transmit return codes  
   subtype netdev_tx is unsigned;
   uu_NETDEV_TX_MIN : constant netdev_tx := -2147483648;
   NETDEV_TX_OK : constant netdev_tx := 0;
   NETDEV_TX_BUSY : constant netdev_tx := 16;
   NETDEV_TX_LOCKED : constant netdev_tx := 32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:100

  -- make sure enum is signed  
  -- driver took care of packet  
  -- driver tx path was busy 
  -- driver tx lock was already taken  
   subtype netdev_tx_t is netdev_tx;

  -- * Current order: NETDEV_TX_MASK > NET_XMIT_MASK >= 0 is significant;
  -- * hard_start_xmit() return < NET_XMIT_MASK means skb was consumed.
  --  

   function dev_xmit_complete (rc : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:112
   pragma Import (CPP, dev_xmit_complete, "_ZL17dev_xmit_completei");

  --	 * Positive cases with an skb consumed by a driver:
  --	 * - successful transmission (rc == NETDEV_TX_OK)
  --	 * - error while transmitting (rc < 0)
  --	 * - error while queueing to a different device (rc & NET_XMIT_MASK)
  --	  

  -- *	Compute the worst case header length according to the protocols
  -- *	used.
  --  

  -- *	Old network device statistics. Fields are native words
  -- *	(unsigned long) so they can be read and written atomically.
  --  

   type net_device_stats is record
      rx_packets : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:154
      tx_packets : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:155
      rx_bytes : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:156
      tx_bytes : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:157
      rx_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:158
      tx_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:159
      rx_dropped : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:160
      tx_dropped : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:161
      multicast : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:162
      collisions : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:163
      rx_length_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:164
      rx_over_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:165
      rx_crc_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:166
      rx_frame_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:167
      rx_fifo_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:168
      rx_missed_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:169
      tx_aborted_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:170
      tx_carrier_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:171
      tx_fifo_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:172
      tx_heartbeat_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:173
      tx_window_errors : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:174
      rx_compressed : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:175
      tx_compressed : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:176
   end record;
   pragma Convention (C_Pass_By_Copy, net_device_stats);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:153

   rps_needed : aliased linux_jump_label_h.static_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:185
   pragma Import (C, rps_needed, "rps_needed");

   --  skipped empty struct neigh_parms

   type netdev_hw_addr_addr_array is array (0 .. 31) of aliased unsigned_char;
   type netdev_hw_addr is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:193
      addr : aliased netdev_hw_addr_addr_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:194
      c_type : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:195
      global_use : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:201
      sync_cnt : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:202
      refcount : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:203
      synced : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:204
      the_callback_head : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:205
   end record;
   pragma Convention (C_Pass_By_Copy, netdev_hw_addr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:192

   type netdev_hw_addr_list is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:209
      count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:210
   end record;
   pragma Convention (C_Pass_By_Copy, netdev_hw_addr_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:208

   type hh_cache_hh_data_array is array (0 .. 15) of aliased unsigned_long;
   type hh_cache is record
      hh_len : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:229
      uu_pad : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:230
      hh_lock : aliased linux_seqlock_h.seqlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:231
      hh_data : aliased hh_cache_hh_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:239
   end record;
   pragma Convention (C_Pass_By_Copy, hh_cache);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:228

  -- cached hardware header; allow for machine alignment needs.         
  -- Reserve HH_DATA_MOD byte aligned hard_header_len, but at least that much.
  -- * Alternative is:
  -- *   dev->hard_header_len ? (dev->hard_header_len +
  -- *                           (HH_DATA_MOD - 1)) & ~(HH_DATA_MOD - 1) : 0
  -- *
  -- * We could use other alignment values, but we must maintain the
  -- * relationship HH alignment <= LL alignment.
  --  

   type header_ops is record
      create : access function
           (arg1 : access linux_skbuff_h.sk_buff;
            arg2 : System.Address;
            arg3 : unsigned_short;
            arg4 : System.Address;
            arg5 : System.Address;
            arg6 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:258
      parse : access function (arg1 : access constant linux_skbuff_h.sk_buff; arg2 : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:259
      rebuild : access function (arg1 : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:260
      cache : access function
           (arg1 : System.Address;
            arg2 : access hh_cache;
            arg3 : uapi_linux_types_h.uu_be16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:261
      cache_update : access procedure
           (arg1 : access hh_cache;
            arg2 : System.Address;
            arg3 : access unsigned_char);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:264
   end record;
   pragma Convention (C_Pass_By_Copy, header_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:255

  -- These flag bits are private to the generic network queueing
  -- * layer, they may not be explicitly referenced by any other
  -- * code.
  --  

   type netdev_state_t is 
     (uu_LINK_STATE_START,
      uu_LINK_STATE_PRESENT,
      uu_LINK_STATE_NOCARRIER,
      uu_LINK_STATE_LINKWATCH_PENDING,
      uu_LINK_STATE_DORMANT);
   pragma Convention (C, netdev_state_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:272

  -- * This structure holds at boot time configured netdevice settings. They
  -- * are then used in the device probing.
  --  

   subtype netdev_boot_setup_name_array is Interfaces.C.char_array (0 .. 15);
   type netdev_boot_setup is record
      name : aliased netdev_boot_setup_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:286
      map : aliased uapi_linux_if_h.ifmap;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:287
   end record;
   pragma Convention (C_Pass_By_Copy, netdev_boot_setup);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:285

   function netdev_boot_setup (str : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:291
   pragma Import (CPP, netdev_boot_setup, "_Z17netdev_boot_setupPc");

  -- * Structure for NAPI scheduling similar to tasklet but with weighting
  --  

  -- The poll_list must only be managed by the entity which
  --	 * changes the state of the NAPI_STATE_SCHED bit.  This means
  --	 * whoever atomically sets that bit can add this napi_struct
  --	 * to the per-cpu poll_list, and whoever clears that bit
  --	 * can remove from the list right before clearing the bit.
  --	  

   type net_device;
   type napi_struct is record
      poll_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:303
      state : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:305
      weight : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:306
      gro_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:307
      poll : access function (arg1 : access napi_struct; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:308
      poll_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:310
      poll_owner : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:311
      dev : access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:313
      gro_list : access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:314
      skb : access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:315
      dev_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:316
      napi_hash_node : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:317
      napi_id : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:318
   end record;
   pragma Convention (C_Pass_By_Copy, napi_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:296

  -- Poll is scheduled  
  -- Disable pending  
  -- Netpoll - don't dequeue from poll_list  
  -- In NAPI hash  
   type gro_result is 
     (GRO_MERGED,
      GRO_MERGED_FREE,
      GRO_HELD,
      GRO_NORMAL,
      GRO_DROP);
   pragma Convention (C, gro_result);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:328

   subtype gro_result_t is gro_result;

  -- * enum rx_handler_result - Possible return values for rx_handlers.
  -- * @RX_HANDLER_CONSUMED: skb was consumed by rx_handler, do not process it
  -- * further.
  -- * @RX_HANDLER_ANOTHER: Do another round in receive path. This is indicated in
  -- * case skb->dev was changed by rx_handler.
  -- * @RX_HANDLER_EXACT: Force exact delivery, no wildcard.
  -- * @RX_HANDLER_PASS: Do nothing, passe the skb as if no rx_handler was called.
  -- *
  -- * rx_handlers are functions called from inside __netif_receive_skb(), to do
  -- * special processing of the skb, prior to delivery to protocol handlers.
  -- *
  -- * Currently, a net_device can only have a single rx_handler registered. Trying
  -- * to register a second rx_handler will return -EBUSY.
  -- *
  -- * To register a rx_handler on a net_device, use netdev_rx_handler_register().
  -- * To unregister a rx_handler on a net_device, use
  -- * netdev_rx_handler_unregister().
  -- *
  -- * Upon return, rx_handler is expected to tell __netif_receive_skb() what to
  -- * do with the skb.
  -- *
  -- * If the rx_handler consumed to skb in some way, it should return
  -- * RX_HANDLER_CONSUMED. This is appropriate when the rx_handler arranged for
  -- * the skb to be delivered in some other ways.
  -- *
  -- * If the rx_handler changed skb->dev, to divert the skb to another
  -- * net_device, it should return RX_HANDLER_ANOTHER. The rx_handler for the
  -- * new device will be called if it exists.
  -- *
  -- * If the rx_handler consider the skb should be ignored, it should return
  -- * RX_HANDLER_EXACT. The skb will only be delivered to protocol handlers that
  -- * are registered on exact device (ptype->dev == skb->dev).
  -- *
  -- * If the rx_handler didn't changed skb->dev, but want the skb to be normally
  -- * delivered, it should return RX_HANDLER_PASS.
  -- *
  -- * A device without a registered rx_handler will behave as if rx_handler
  -- * returned RX_HANDLER_PASS.
  --  

   type rx_handler_result is 
     (RX_HANDLER_CONSUMED,
      RX_HANDLER_ANOTHER,
      RX_HANDLER_EXACT,
      RX_HANDLER_PASS);
   pragma Convention (C, rx_handler_result);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:378

   subtype rx_handler_result_t is rx_handler_result;

   --  skipped function type rx_handler_func_t

   --  skipped func __napi_schedule

   function napi_disable_pending (n : access napi_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:389
   pragma Import (CPP, napi_disable_pending, "_ZL20napi_disable_pendingP11napi_struct");

  --*
  -- *	napi_schedule_prep - check if napi can be scheduled
  -- *	@n: napi context
  -- *
  -- * Test if NAPI routine is already running, and if not mark
  -- * it as running.  This is used as a condition variable
  -- * insure only one NAPI poll instance runs.  We also make
  -- * sure there is no pending NAPI disable.
  --  

   function napi_schedule_prep (n : access napi_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:403
   pragma Import (CPP, napi_schedule_prep, "_ZL18napi_schedule_prepP11napi_struct");

  --*
  -- *	napi_schedule - schedule NAPI poll
  -- *	@n: napi context
  -- *
  -- * Schedule NAPI poll routine to be called if it is not already
  -- * running.
  --  

   procedure napi_schedule (n : access napi_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:416
   pragma Import (CPP, napi_schedule, "_ZL13napi_scheduleP11napi_struct");

  -- Try to reschedule poll. Called by dev->poll() after napi_complete().   
   function napi_reschedule (napi : access napi_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:423
   pragma Import (CPP, napi_reschedule, "_ZL15napi_rescheduleP11napi_struct");

  --*
  -- *	napi_complete - NAPI processing complete
  -- *	@n: napi context
  -- *
  -- * Mark NAPI processing as complete.
  --  

   --  skipped func __napi_complete

   procedure napi_complete (n : access napi_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:439
   pragma Import (CPP, napi_complete, "_Z13napi_completeP11napi_struct");

  --*
  -- *	napi_by_id - lookup a NAPI by napi_id
  -- *	@napi_id: hashed napi_id
  -- *
  -- * lookup @napi_id in napi_hash table
  -- * must be called under rcu_read_lock()
  --  

   function napi_by_id (napi_id : unsigned) return access napi_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:448
   pragma Import (CPP, napi_by_id, "_Z10napi_by_idj");

  --*
  -- *	napi_hash_add - add a NAPI to global hashtable
  -- *	@napi: napi context
  -- *
  -- * generate a new napi_id and store a @napi under it in napi_hash
  --  

   procedure napi_hash_add (napi : access napi_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:456
   pragma Import (CPP, napi_hash_add, "_Z13napi_hash_addP11napi_struct");

  --*
  -- *	napi_hash_del - remove a NAPI from global table
  -- *	@napi: napi context
  -- *
  -- * Warning: caller must observe rcu grace period
  -- * before freeing memory containing @napi
  --  

   procedure napi_hash_del (napi : access napi_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:465
   pragma Import (CPP, napi_hash_del, "_Z13napi_hash_delP11napi_struct");

  --*
  -- *	napi_disable - prevent NAPI from scheduling
  -- *	@n: napi context
  -- *
  -- * Stop NAPI from being scheduled on this context.
  -- * Waits till any outstanding processing completes.
  --  

   procedure napi_disable (n : access napi_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:474
   pragma Import (CPP, napi_disable, "_ZL12napi_disableP11napi_struct");

  --*
  -- *	napi_enable - enable NAPI scheduling
  -- *	@n: napi context
  -- *
  -- * Resume NAPI from being scheduled on this context.
  -- * Must be paired with napi_disable.
  --  

   procedure napi_enable (n : access napi_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:490
   pragma Import (CPP, napi_enable, "_ZL11napi_enableP11napi_struct");

  --*
  -- *	napi_synchronize - wait until NAPI is not running
  -- *	@n: napi context
  -- *
  -- * Wait until NAPI is done being scheduled on this context.
  -- * Waits till any outstanding processing completes but
  -- * does not disable future activations.
  --  

   procedure napi_synchronize (n : access constant napi_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:506
   pragma Import (CPP, napi_synchronize, "_ZL16napi_synchronizePK11napi_struct");

   type netdev_queue_state_t is 
     (uu_QUEUE_STATE_DRV_XOFF,
      uu_QUEUE_STATE_STACK_XOFF,
      uu_QUEUE_STATE_FROZEN);
   pragma Convention (C, netdev_queue_state_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:515

  -- * __QUEUE_STATE_DRV_XOFF is used by drivers to stop the transmit queue.  The
  -- * netif_tx_* functions below are used to manipulate this flag.  The
  -- * __QUEUE_STATE_STACK_XOFF flag is used by the stack to stop the transmit
  -- * queue independently.  The netif_xmit_*stopped functions below are called
  -- * to check if the queue has been stopped by the driver or stack (either
  -- * of the XOFF bits are set in the state).  Drivers should not need to call
  -- * netif_xmit*stopped functions, they should only be using netif_tx_*.
  --  

  -- * read mostly part
  --  

   type netdev_queue is record
      dev : access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:545
      the_qdisc : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:546
      qdisc_sleeping : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:547
      kobj : aliased linux_kobject_h.kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:549
      numa_node : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:552
      u_xmit_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:557
      xmit_lock_owner : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:558
      trans_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:562
      trans_timeout : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:568
      state : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:570
      the_dql : aliased linux_dynamic_queue_limits_h.dql;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:573
   end record;
   pragma Convention (C_Pass_By_Copy, netdev_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:541

   --  skipped empty struct Qdisc

  -- * write mostly part
  --  

  --	 * please use this field instead of dev->trans_start
  --	  

  --	 * Number of TX timeouts for this queue
  --	 * (/sys/class/net/DEV/Q/trans_timeout)
  --	  

   function netdev_queue_numa_node_read (q : access constant netdev_queue) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:577
   pragma Import (CPP, netdev_queue_numa_node_read, "_ZL27netdev_queue_numa_node_readPK12netdev_queue");

   procedure netdev_queue_numa_node_write (q : access netdev_queue; node : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:586
   pragma Import (CPP, netdev_queue_numa_node_write, "_ZL28netdev_queue_numa_node_writeP12netdev_queuei");

  -- * This structure holds an RPS map which can be of variable length.  The
  -- * map is an array of CPUs.
  --  

   type rps_map_cpus_array is array (0 .. -1) of aliased asm_generic_int_ll64_h.u16;
   type rps_map is record
      len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:599
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:600
      cpus : aliased rps_map_cpus_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:601
   end record;
   pragma Convention (C_Pass_By_Copy, rps_map);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:598

  -- * The rps_dev_flow structure contains the mapping of a flow to a CPU, the
  -- * tail pointer for that CPU's input queue at the time of last enqueue, and
  -- * a hardware filter index.
  --  

   type rps_dev_flow is record
      cpu : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:611
      filter : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:612
      last_qtail : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:613
   end record;
   pragma Convention (C_Pass_By_Copy, rps_dev_flow);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:610

  -- * The rps_dev_flow_table structure contains a table of flow mappings.
  --  

   type rps_dev_flow_table_flows_array is array (0 .. -1) of aliased rps_dev_flow;
   type rps_dev_flow_table is record
      mask : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:621
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:622
      flows : aliased rps_dev_flow_table_flows_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:623
   end record;
   pragma Convention (C_Pass_By_Copy, rps_dev_flow_table);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:620

  -- * The rps_sock_flow_table contains mappings of flows to the last CPU
  -- * on which they were processed by the application (set in recvmsg).
  --  

   type rps_sock_flow_table_ents_array is array (0 .. -1) of aliased asm_generic_int_ll64_h.u16;
   type rps_sock_flow_table is record
      mask : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:633
      ents : aliased rps_sock_flow_table_ents_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:634
   end record;
   pragma Convention (C_Pass_By_Copy, rps_sock_flow_table);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:632

   procedure rps_record_sock_flow (table : access rps_sock_flow_table; hash : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:641
   pragma Import (CPP, rps_record_sock_flow, "_ZL20rps_record_sock_flowP19rps_sock_flow_tablej");

  -- We only give a hint, preemption can change cpu under us  
   procedure rps_reset_sock_flow (table : access rps_sock_flow_table; hash : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:655
   pragma Import (CPP, rps_reset_sock_flow, "_ZL19rps_reset_sock_flowP19rps_sock_flow_tablej");

   rps_sock_flow_table : access rps_sock_flow_table;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:662
   pragma Import (C, rps_sock_flow_table, "rps_sock_flow_table");

   function rps_may_expire_flow
     (dev : access net_device;
      rxq_index : asm_generic_int_ll64_h.u16;
      flow_id : asm_generic_int_ll64_h.u32;
      filter_id : asm_generic_int_ll64_h.u16) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:665
   pragma Import (CPP, rps_may_expire_flow, "_Z19rps_may_expire_flowP10net_devicetjt");

  -- This structure contains an instance of an RX queue.  
   type netdev_rx_queue is record
      the_rps_map : access rps_map;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:673
      rps_flow_table : access rps_dev_flow_table;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:674
      kobj : aliased linux_kobject_h.kobject;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:676
      dev : access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:677
   end record;
   pragma Convention (C_Pass_By_Copy, netdev_rx_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:671

  -- * RX queue sysfs structures and functions.
  --  

   type rx_queue_attribute is record
      attr : aliased linux_sysfs_h.attribute;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:684
      show : access function
           (arg1 : access netdev_rx_queue;
            arg2 : access rx_queue_attribute;
            arg3 : Interfaces.C.Strings.chars_ptr) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:686
      store : access function
           (arg1 : access netdev_rx_queue;
            arg2 : access rx_queue_attribute;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:688
   end record;
   pragma Convention (C_Pass_By_Copy, rx_queue_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:683

  -- * This structure holds an XPS map which can be of variable length.  The
  -- * map is an array of queues.
  --  

   type xps_map_queues_array is array (0 .. -1) of aliased asm_generic_int_ll64_h.u16;
   type xps_map is record
      len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:697
      alloc_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:698
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:699
      queues : aliased xps_map_queues_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:700
   end record;
   pragma Convention (C_Pass_By_Copy, xps_map);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:696

  -- * This structure holds all XPS maps for device.  Maps are indexed by CPU.
  --  

   type xps_dev_maps_cpu_map_array is array (0 .. -1) of access xps_map;
   type xps_dev_maps is record
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:710
      cpu_map : aliased xps_dev_maps_cpu_map_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:711
   end record;
   pragma Convention (C_Pass_By_Copy, xps_dev_maps);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:709

  -- HW offloaded queuing disciplines txq count and offset maps  
   type netdev_tc_txq is record
      count : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:721
      offset : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:722
   end record;
   pragma Convention (C_Pass_By_Copy, netdev_tc_txq);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:720

  -- * This structure is to hold information about the device
  -- * configured to run FCoE protocol stack.
  --  

   subtype netdev_fcoe_hbainfo_manufacturer_array is Interfaces.C.char_array (0 .. 63);
   subtype netdev_fcoe_hbainfo_serial_number_array is Interfaces.C.char_array (0 .. 63);
   subtype netdev_fcoe_hbainfo_hardware_version_array is Interfaces.C.char_array (0 .. 63);
   subtype netdev_fcoe_hbainfo_driver_version_array is Interfaces.C.char_array (0 .. 63);
   subtype netdev_fcoe_hbainfo_optionrom_version_array is Interfaces.C.char_array (0 .. 63);
   subtype netdev_fcoe_hbainfo_firmware_version_array is Interfaces.C.char_array (0 .. 63);
   subtype netdev_fcoe_hbainfo_model_array is Interfaces.C.char_array (0 .. 255);
   subtype netdev_fcoe_hbainfo_model_description_array is Interfaces.C.char_array (0 .. 255);
   type netdev_fcoe_hbainfo is record
      manufacturer : aliased netdev_fcoe_hbainfo_manufacturer_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:731
      serial_number : aliased netdev_fcoe_hbainfo_serial_number_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:732
      hardware_version : aliased netdev_fcoe_hbainfo_hardware_version_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:733
      driver_version : aliased netdev_fcoe_hbainfo_driver_version_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:734
      optionrom_version : aliased netdev_fcoe_hbainfo_optionrom_version_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:735
      firmware_version : aliased netdev_fcoe_hbainfo_firmware_version_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:736
      model : aliased netdev_fcoe_hbainfo_model_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:737
      model_description : aliased netdev_fcoe_hbainfo_model_description_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:738
   end record;
   pragma Convention (C_Pass_By_Copy, netdev_fcoe_hbainfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:730

  -- This structure holds a unique identifier to identify the
  -- * physical port used by a netdevice.
  --  

   type netdev_phys_port_id_id_array is array (0 .. 31) of aliased unsigned_char;
   type netdev_phys_port_id is record
      id : aliased netdev_phys_port_id_id_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:748
      id_len : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:749
   end record;
   pragma Convention (C_Pass_By_Copy, netdev_phys_port_id);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:747

   type select_queue_fallback_t is access function (arg1 : access net_device; arg2 : access linux_skbuff_h.sk_buff) return asm_generic_int_ll64_h.u16;
   pragma Convention (C, select_queue_fallback_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:752

  -- * This structure defines the management hooks for network devices.
  -- * The following hooks can be defined; unless noted otherwise, they are
  -- * optional and can be filled with a null pointer.
  -- *
  -- * int (*ndo_init)(struct net_device *dev);
  -- *     This function is called once when network device is registered.
  -- *     The network device can use this to any late stage initializaton
  -- *     or semantic validattion. It can fail with an error code which will
  -- *     be propogated back to register_netdev
  -- *
  -- * void (*ndo_uninit)(struct net_device *dev);
  -- *     This function is called when device is unregistered or when registration
  -- *     fails. It is not called if init fails.
  -- *
  -- * int (*ndo_open)(struct net_device *dev);
  -- *     This function is called when network device transistions to the up
  -- *     state.
  -- *
  -- * int (*ndo_stop)(struct net_device *dev);
  -- *     This function is called when network device transistions to the down
  -- *     state.
  -- *
  -- * netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb,
  -- *                               struct net_device *dev);
  -- *	Called when a packet needs to be transmitted.
  -- *	Must return NETDEV_TX_OK , NETDEV_TX_BUSY.
  -- *        (can also return NETDEV_TX_LOCKED iff NETIF_F_LLTX)
  -- *	Required can not be NULL.
  -- *
  -- * u16 (*ndo_select_queue)(struct net_device *dev, struct sk_buff *skb,
  -- *                         void *accel_priv, select_queue_fallback_t fallback);
  -- *	Called to decide which queue to when device supports multiple
  -- *	transmit queues.
  -- *
  -- * void (*ndo_change_rx_flags)(struct net_device *dev, int flags);
  -- *	This function is called to allow device receiver to make
  -- *	changes to configuration when multicast or promiscious is enabled.
  -- *
  -- * void (*ndo_set_rx_mode)(struct net_device *dev);
  -- *	This function is called device changes address list filtering.
  -- *	If driver handles unicast address filtering, it should set
  -- *	IFF_UNICAST_FLT to its priv_flags.
  -- *
  -- * int (*ndo_set_mac_address)(struct net_device *dev, void *addr);
  -- *	This function  is called when the Media Access Control address
  -- *	needs to be changed. If this interface is not defined, the
  -- *	mac address can not be changed.
  -- *
  -- * int (*ndo_validate_addr)(struct net_device *dev);
  -- *	Test if Media Access Control address is valid for the device.
  -- *
  -- * int (*ndo_do_ioctl)(struct net_device *dev, struct ifreq *ifr, int cmd);
  -- *	Called when a user request an ioctl which can't be handled by
  -- *	the generic interface code. If not defined ioctl's return
  -- *	not supported error code.
  -- *
  -- * int (*ndo_set_config)(struct net_device *dev, struct ifmap *map);
  -- *	Used to set network devices bus interface parameters. This interface
  -- *	is retained for legacy reason, new devices should use the bus
  -- *	interface (PCI) for low level management.
  -- *
  -- * int (*ndo_change_mtu)(struct net_device *dev, int new_mtu);
  -- *	Called when a user wants to change the Maximum Transfer Unit
  -- *	of a device. If not defined, any request to change MTU will
  -- *	will return an error.
  -- *
  -- * void (*ndo_tx_timeout)(struct net_device *dev);
  -- *	Callback uses when the transmitter has not made any progress
  -- *	for dev->watchdog ticks.
  -- *
  -- * struct rtnl_link_stats64* (*ndo_get_stats64)(struct net_device *dev,
  -- *                      struct rtnl_link_stats64 *storage);
  -- * struct net_device_stats* (*ndo_get_stats)(struct net_device *dev);
  -- *	Called when a user wants to get the network device usage
  -- *	statistics. Drivers must do one of the following:
  -- *	1. Define @ndo_get_stats64 to fill in a zero-initialised
  -- *	   rtnl_link_stats64 structure passed by the caller.
  -- *	2. Define @ndo_get_stats to update a net_device_stats structure
  -- *	   (which should normally be dev->stats) and return a pointer to
  -- *	   it. The structure may be changed asynchronously only if each
  -- *	   field is written atomically.
  -- *	3. Update dev->stats asynchronously and atomically, and define
  -- *	   neither operation.
  -- *
  -- * int (*ndo_vlan_rx_add_vid)(struct net_device *dev, __be16 proto, u16t vid);
  -- *	If device support VLAN filtering this function is called when a
  -- *	VLAN id is registered.
  -- *
  -- * int (*ndo_vlan_rx_kill_vid)(struct net_device *dev, unsigned short vid);
  -- *	If device support VLAN filtering this function is called when a
  -- *	VLAN id is unregistered.
  -- *
  -- * void (*ndo_poll_controller)(struct net_device *dev);
  -- *
  -- *	SR-IOV management functions.
  -- * int (*ndo_set_vf_mac)(struct net_device *dev, int vf, u8* mac);
  -- * int (*ndo_set_vf_vlan)(struct net_device *dev, int vf, u16 vlan, u8 qos);
  -- * int (*ndo_set_vf_rate)(struct net_device *dev, int vf, int min_tx_rate,
  -- *			  int max_tx_rate);
  -- * int (*ndo_set_vf_spoofchk)(struct net_device *dev, int vf, bool setting);
  -- * int (*ndo_get_vf_config)(struct net_device *dev,
  -- *			    int vf, struct ifla_vf_info *ivf);
  -- * int (*ndo_set_vf_link_state)(struct net_device *dev, int vf, int link_state);
  -- * int (*ndo_set_vf_port)(struct net_device *dev, int vf,
  -- *			  struct nlattr *port[]);
  -- * int (*ndo_get_vf_port)(struct net_device *dev, int vf, struct sk_buff *skb);
  -- * int (*ndo_setup_tc)(struct net_device *dev, u8 tc)
  -- * 	Called to setup 'tc' number of traffic classes in the net device. This
  -- * 	is always called from the stack with the rtnl lock held and netif tx
  -- * 	queues stopped. This allows the netdevice to perform queue management
  -- * 	safely.
  -- *
  -- *	Fiber Channel over Ethernet (FCoE) offload functions.
  -- * int (*ndo_fcoe_enable)(struct net_device *dev);
  -- *	Called when the FCoE protocol stack wants to start using LLD for FCoE
  -- *	so the underlying device can perform whatever needed configuration or
  -- *	initialization to support acceleration of FCoE traffic.
  -- *
  -- * int (*ndo_fcoe_disable)(struct net_device *dev);
  -- *	Called when the FCoE protocol stack wants to stop using LLD for FCoE
  -- *	so the underlying device can perform whatever needed clean-ups to
  -- *	stop supporting acceleration of FCoE traffic.
  -- *
  -- * int (*ndo_fcoe_ddp_setup)(struct net_device *dev, u16 xid,
  -- *			     struct scatterlist *sgl, unsigned int sgc);
  -- *	Called when the FCoE Initiator wants to initialize an I/O that
  -- *	is a possible candidate for Direct Data Placement (DDP). The LLD can
  -- *	perform necessary setup and returns 1 to indicate the device is set up
  -- *	successfully to perform DDP on this I/O, otherwise this returns 0.
  -- *
  -- * int (*ndo_fcoe_ddp_done)(struct net_device *dev,  u16 xid);
  -- *	Called when the FCoE Initiator/Target is done with the DDPed I/O as
  -- *	indicated by the FC exchange id 'xid', so the underlying device can
  -- *	clean up and reuse resources for later DDP requests.
  -- *
  -- * int (*ndo_fcoe_ddp_target)(struct net_device *dev, u16 xid,
  -- *			      struct scatterlist *sgl, unsigned int sgc);
  -- *	Called when the FCoE Target wants to initialize an I/O that
  -- *	is a possible candidate for Direct Data Placement (DDP). The LLD can
  -- *	perform necessary setup and returns 1 to indicate the device is set up
  -- *	successfully to perform DDP on this I/O, otherwise this returns 0.
  -- *
  -- * int (*ndo_fcoe_get_hbainfo)(struct net_device *dev,
  -- *			       struct netdev_fcoe_hbainfo *hbainfo);
  -- *	Called when the FCoE Protocol stack wants information on the underlying
  -- *	device. This information is utilized by the FCoE protocol stack to
  -- *	register attributes with Fiber Channel management service as per the
  -- *	FC-GS Fabric Device Management Information(FDMI) specification.
  -- *
  -- * int (*ndo_fcoe_get_wwn)(struct net_device *dev, u64 *wwn, int type);
  -- *	Called when the underlying device wants to override default World Wide
  -- *	Name (WWN) generation mechanism in FCoE protocol stack to pass its own
  -- *	World Wide Port Name (WWPN) or World Wide Node Name (WWNN) to the FCoE
  -- *	protocol stack to use.
  -- *
  -- *	RFS acceleration.
  -- * int (*ndo_rx_flow_steer)(struct net_device *dev, const struct sk_buff *skb,
  -- *			    u16 rxq_index, u32 flow_id);
  -- *	Set hardware filter for RFS.  rxq_index is the target queue index;
  -- *	flow_id is a flow ID to be passed to rps_may_expire_flow() later.
  -- *	Return the filter ID on success, or a negative error code.
  -- *
  -- *	Slave management functions (for bridge, bonding, etc).
  -- * int (*ndo_add_slave)(struct net_device *dev, struct net_device *slave_dev);
  -- *	Called to make another netdev an underling.
  -- *
  -- * int (*ndo_del_slave)(struct net_device *dev, struct net_device *slave_dev);
  -- *	Called to release previously enslaved netdev.
  -- *
  -- *      Feature/offload setting functions.
  -- * netdev_features_t (*ndo_fix_features)(struct net_device *dev,
  -- *		netdev_features_t features);
  -- *	Adjusts the requested feature flags according to device-specific
  -- *	constraints, and returns the resulting flags. Must not modify
  -- *	the device state.
  -- *
  -- * int (*ndo_set_features)(struct net_device *dev, netdev_features_t features);
  -- *	Called to update device configuration to new features. Passed
  -- *	feature set might be less than what was returned by ndo_fix_features()).
  -- *	Must return >0 or -errno if it changed dev->features itself.
  -- *
  -- * int (*ndo_fdb_add)(struct ndmsg *ndm, struct nlattr *tb[],
  -- *		      struct net_device *dev,
  -- *		      const unsigned char *addr, u16 flags)
  -- *	Adds an FDB entry to dev for addr.
  -- * int (*ndo_fdb_del)(struct ndmsg *ndm, struct nlattr *tb[],
  -- *		      struct net_device *dev,
  -- *		      const unsigned char *addr)
  -- *	Deletes the FDB entry from dev coresponding to addr.
  -- * int (*ndo_fdb_dump)(struct sk_buff *skb, struct netlink_callback *cb,
  -- *		       struct net_device *dev, int idx)
  -- *	Used to add FDB entries to dump requests. Implementers should add
  -- *	entries to skb and update idx with the number of entries.
  -- *
  -- * int (*ndo_bridge_setlink)(struct net_device *dev, struct nlmsghdr *nlh)
  -- * int (*ndo_bridge_getlink)(struct sk_buff *skb, u32 pid, u32 seq,
  -- *			     struct net_device *dev, u32 filter_mask)
  -- *
  -- * int (*ndo_change_carrier)(struct net_device *dev, bool new_carrier);
  -- *	Called to change device carrier. Soft-devices (like dummy, team, etc)
  -- *	which do not represent real hardware may define this to allow their
  -- *	userspace components to manage their virtual carrier state. Devices
  -- *	that determine carrier state from physical hardware properties (eg
  -- *	network cables) or protocol-dependent mechanisms (eg
  -- *	USB_CDC_NOTIFY_NETWORK_CONNECTION) should NOT implement this function.
  -- *
  -- * int (*ndo_get_phys_port_id)(struct net_device *dev,
  -- *			       struct netdev_phys_port_id *ppid);
  -- *	Called to get ID of physical port of this device. If driver does
  -- *	not implement this, it is assumed that the hw is not able to have
  -- *	multiple net devices on single physical port.
  -- *
  -- * void (*ndo_add_vxlan_port)(struct  net_device *dev,
  -- *			      sa_family_t sa_family, __be16 port);
  -- *	Called by vxlan to notiy a driver about the UDP port and socket
  -- *	address family that vxlan is listnening to. It is called only when
  -- *	a new port starts listening. The operation is protected by the
  -- *	vxlan_net->sock_lock.
  -- *
  -- * void (*ndo_del_vxlan_port)(struct  net_device *dev,
  -- *			      sa_family_t sa_family, __be16 port);
  -- *	Called by vxlan to notify the driver about a UDP port and socket
  -- *	address family that vxlan is not listening to anymore. The operation
  -- *	is protected by the vxlan_net->sock_lock.
  -- *
  -- * void* (*ndo_dfwd_add_station)(struct net_device *pdev,
  -- *				 struct net_device *dev)
  -- *	Called by upper layer devices to accelerate switching or other
  -- *	station functionality into hardware. 'pdev is the lowerdev
  -- *	to use for the offload and 'dev' is the net device that will
  -- *	back the offload. Returns a pointer to the private structure
  -- *	the upper layer will maintain.
  -- * void (*ndo_dfwd_del_station)(struct net_device *pdev, void *priv)
  -- *	Called by upper layer device to delete the station created
  -- *	by 'ndo_dfwd_add_station'. 'pdev' is the net device backing
  -- *	the station and priv is the structure returned by the add
  -- *	operation.
  -- * netdev_tx_t (*ndo_dfwd_start_xmit)(struct sk_buff *skb,
  -- *				      struct net_device *dev,
  -- *				      void *priv);
  -- *	Callback to use for xmit over the accelerated station. This
  -- *	is used in place of ndo_start_xmit on accelerated net
  -- *	devices.
  --  

   type net_device_ops is record
      ndo_init : access function (arg1 : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1001
      ndo_uninit : access procedure (arg1 : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1002
      ndo_open : access function (arg1 : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1003
      ndo_stop : access function (arg1 : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1004
      ndo_start_xmit : access function (arg1 : access linux_skbuff_h.sk_buff; arg2 : access net_device) return netdev_tx_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1006
      ndo_select_queue : access function
           (arg1 : access net_device;
            arg2 : access linux_skbuff_h.sk_buff;
            arg3 : System.Address;
            arg4 : select_queue_fallback_t) return asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1010
      ndo_change_rx_flags : access procedure (arg1 : access net_device; arg2 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1012
      ndo_set_rx_mode : access procedure (arg1 : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1013
      ndo_set_mac_address : access function (arg1 : access net_device; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1015
      ndo_validate_addr : access function (arg1 : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1016
      ndo_do_ioctl : access function
           (arg1 : access net_device;
            arg2 : access uapi_linux_if_h.ifreq;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1018
      ndo_set_config : access function (arg1 : access net_device; arg2 : access uapi_linux_if_h.ifmap) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1020
      ndo_change_mtu : access function (arg1 : access net_device; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1022
      ndo_neigh_setup : access function (arg1 : access net_device; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1024
      ndo_tx_timeout : access procedure (arg1 : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1025
      ndo_get_stats64 : access function (arg1 : access net_device; arg2 : access uapi_linux_if_link_h.rtnl_link_stats64) return access uapi_linux_if_link_h.rtnl_link_stats64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1028
      ndo_get_stats : access function (arg1 : access net_device) return access net_device_stats;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1029
      ndo_vlan_rx_add_vid : access function
           (arg1 : access net_device;
            arg2 : uapi_linux_types_h.uu_be16;
            arg3 : asm_generic_int_ll64_h.u16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1032
      ndo_vlan_rx_kill_vid : access function
           (arg1 : access net_device;
            arg2 : uapi_linux_types_h.uu_be16;
            arg3 : asm_generic_int_ll64_h.u16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1034
      ndo_poll_controller : access procedure (arg1 : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1036
      ndo_netpoll_setup : access function (arg1 : access net_device; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1038
      ndo_netpoll_cleanup : access procedure (arg1 : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1039
      ndo_busy_poll : access function (arg1 : access napi_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1042
      ndo_set_vf_mac : access function
           (arg1 : access net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1045
      ndo_set_vf_vlan : access function
           (arg1 : access net_device;
            arg2 : int;
            arg3 : asm_generic_int_ll64_h.u16;
            arg4 : asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1047
      ndo_set_vf_rate : access function
           (arg1 : access net_device;
            arg2 : int;
            arg3 : int;
            arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1050
      ndo_set_vf_spoofchk : access function
           (arg1 : access net_device;
            arg2 : int;
            arg3 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1052
      ndo_get_vf_config : access function
           (arg1 : access net_device;
            arg2 : int;
            arg3 : access linux_if_link_h.ifla_vf_info) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1055
      ndo_set_vf_link_state : access function
           (arg1 : access net_device;
            arg2 : int;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1057
      ndo_set_vf_port : access function
           (arg1 : access net_device;
            arg2 : int;
            arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1060
      ndo_get_vf_port : access function
           (arg1 : access net_device;
            arg2 : int;
            arg3 : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1062
      ndo_setup_tc : access function (arg1 : access net_device; arg2 : asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1063
      ndo_fcoe_enable : access function (arg1 : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1065
      ndo_fcoe_disable : access function (arg1 : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1066
      ndo_fcoe_ddp_setup : access function
           (arg1 : access net_device;
            arg2 : asm_generic_int_ll64_h.u16;
            arg3 : access asm_generic_scatterlist_h.scatterlist;
            arg4 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1070
      ndo_fcoe_ddp_done : access function (arg1 : access net_device; arg2 : asm_generic_int_ll64_h.u16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1072
      ndo_fcoe_ddp_target : access function
           (arg1 : access net_device;
            arg2 : asm_generic_int_ll64_h.u16;
            arg3 : access asm_generic_scatterlist_h.scatterlist;
            arg4 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1076
      ndo_fcoe_get_hbainfo : access function (arg1 : access net_device; arg2 : access netdev_fcoe_hbainfo) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1078
      ndo_fcoe_get_wwn : access function
           (arg1 : access net_device;
            arg2 : access asm_generic_int_ll64_h.u64;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1085
      ndo_rx_flow_steer : access function
           (arg1 : access net_device;
            arg2 : access constant linux_skbuff_h.sk_buff;
            arg3 : asm_generic_int_ll64_h.u16;
            arg4 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1092
      ndo_add_slave : access function (arg1 : access net_device; arg2 : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1095
      ndo_del_slave : access function (arg1 : access net_device; arg2 : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1097
      ndo_fix_features : access function (arg1 : access net_device; arg2 : linux_netdev_features_h.netdev_features_t) return linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1099
      ndo_set_features : access function (arg1 : access net_device; arg2 : linux_netdev_features_h.netdev_features_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1101
      ndo_neigh_construct : access function (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1102
      ndo_neigh_destroy : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1103
      ndo_fdb_add : access function
           (arg1 : access uapi_linux_neighbour_h.ndmsg;
            arg2 : System.Address;
            arg3 : access net_device;
            arg4 : access unsigned_char;
            arg5 : asm_generic_int_ll64_h.u16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1109
      ndo_fdb_del : access function
           (arg1 : access uapi_linux_neighbour_h.ndmsg;
            arg2 : System.Address;
            arg3 : access net_device;
            arg4 : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1113
      ndo_fdb_dump : access function
           (arg1 : access linux_skbuff_h.sk_buff;
            arg2 : access linux_netlink_h.netlink_callback;
            arg3 : access net_device;
            arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1117
      ndo_bridge_setlink : access function (arg1 : access net_device; arg2 : access uapi_linux_netlink_h.nlmsghdr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1120
      ndo_bridge_getlink : access function
           (arg1 : access linux_skbuff_h.sk_buff;
            arg2 : asm_generic_int_ll64_h.u32;
            arg3 : asm_generic_int_ll64_h.u32;
            arg4 : access net_device;
            arg5 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1124
      ndo_bridge_dellink : access function (arg1 : access net_device; arg2 : access uapi_linux_netlink_h.nlmsghdr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1126
      ndo_change_carrier : access function (arg1 : access net_device; arg2 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1128
      ndo_get_phys_port_id : access function (arg1 : access net_device; arg2 : access netdev_phys_port_id) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1130
      ndo_add_vxlan_port : access procedure
           (arg1 : access net_device;
            arg2 : linux_socket_h.sa_family_t;
            arg3 : uapi_linux_types_h.uu_be16);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1133
      ndo_del_vxlan_port : access procedure
           (arg1 : access net_device;
            arg2 : linux_socket_h.sa_family_t;
            arg3 : uapi_linux_types_h.uu_be16);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1136
      ndo_dfwd_add_station : access function (arg1 : access net_device; arg2 : access net_device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1139
      ndo_dfwd_del_station : access procedure (arg1 : access net_device; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1141
      ndo_dfwd_start_xmit : access function
           (arg1 : access linux_skbuff_h.sk_buff;
            arg2 : access net_device;
            arg3 : System.Address) return netdev_tx_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1145
      ndo_get_lock_subclass : access function (arg1 : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1146
   end record;
   pragma Convention (C_Pass_By_Copy, net_device_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1000

  --*
  -- * enum net_device_priv_flags - &struct net_device priv_flags
  -- *
  -- * These are the &struct net_device, they are only set internally
  -- * by drivers and used in the kernel. These flags are invisible to
  -- * userspace, this means that the order of these flags can change
  -- * during any kernel release.
  -- *
  -- * You should have a pretty good reason to be extending these flags.
  -- *
  -- * @IFF_802_1Q_VLAN: 802.1Q VLAN device
  -- * @IFF_EBRIDGE: Ethernet bridging device
  -- * @IFF_SLAVE_INACTIVE: bonding slave not the curr. active
  -- * @IFF_MASTER_8023AD: bonding master, 802.3ad
  -- * @IFF_MASTER_ALB: bonding master, balance-alb
  -- * @IFF_BONDING: bonding master or slave
  -- * @IFF_SLAVE_NEEDARP: need ARPs for validation
  -- * @IFF_ISATAP: ISATAP interface (RFC4214)
  -- * @IFF_MASTER_ARPMON: bonding master, ARP mon in use
  -- * @IFF_WAN_HDLC: WAN HDLC device
  -- * @IFF_XMIT_DST_RELEASE: dev_hard_start_xmit() is allowed to
  -- *	release skb->dst
  -- * @IFF_DONT_BRIDGE: disallow bridging this ether dev
  -- * @IFF_DISABLE_NETPOLL: disable netpoll at run-time
  -- * @IFF_MACVLAN_PORT: device used as macvlan port
  -- * @IFF_BRIDGE_PORT: device used as bridge port
  -- * @IFF_OVS_DATAPATH: device used as Open vSwitch datapath port
  -- * @IFF_TX_SKB_SHARING: The interface supports sharing skbs on transmit
  -- * @IFF_UNICAST_FLT: Supports unicast filtering
  -- * @IFF_TEAM_PORT: device used as team port
  -- * @IFF_SUPP_NOFCS: device supports sending custom FCS
  -- * @IFF_LIVE_ADDR_CHANGE: device supports hardware address
  -- *	change when it's running
  -- * @IFF_MACVLAN: Macvlan device
  --  

   subtype netdev_priv_flags is unsigned;
   IFF_802_1Q_VLAN : constant netdev_priv_flags := 1;
   IFF_EBRIDGE : constant netdev_priv_flags := 2;
   IFF_SLAVE_INACTIVE : constant netdev_priv_flags := 4;
   IFF_MASTER_8023AD : constant netdev_priv_flags := 8;
   IFF_MASTER_ALB : constant netdev_priv_flags := 16;
   IFF_BONDING : constant netdev_priv_flags := 32;
   IFF_SLAVE_NEEDARP : constant netdev_priv_flags := 64;
   IFF_ISATAP : constant netdev_priv_flags := 128;
   IFF_MASTER_ARPMON : constant netdev_priv_flags := 256;
   IFF_WAN_HDLC : constant netdev_priv_flags := 512;
   IFF_XMIT_DST_RELEASE : constant netdev_priv_flags := 1024;
   IFF_DONT_BRIDGE : constant netdev_priv_flags := 2048;
   IFF_DISABLE_NETPOLL : constant netdev_priv_flags := 4096;
   IFF_MACVLAN_PORT : constant netdev_priv_flags := 8192;
   IFF_BRIDGE_PORT : constant netdev_priv_flags := 16384;
   IFF_OVS_DATAPATH : constant netdev_priv_flags := 32768;
   IFF_TX_SKB_SHARING : constant netdev_priv_flags := 65536;
   IFF_UNICAST_FLT : constant netdev_priv_flags := 131072;
   IFF_TEAM_PORT : constant netdev_priv_flags := 262144;
   IFF_SUPP_NOFCS : constant netdev_priv_flags := 524288;
   IFF_LIVE_ADDR_CHANGE : constant netdev_priv_flags := 1048576;
   IFF_MACVLAN : constant netdev_priv_flags := 2097152;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1184

  -- *	The DEVICE structure.
  -- *	Actually, this whole structure is a big mistake.  It mixes I/O
  -- *	data with strictly "high-level" data, and it has to know about
  -- *	almost every data structure used in the INET module.
  -- *
  -- *	FIXME: cleanup struct net_device such that network protocol info
  -- *	moves out.
  --  

  --	 * This is the first field of the "visible" part of this structure
  --	 * (i.e. as seen by users in the "Space.c" file).  It is the name
  --	 * of the interface.
  --	  

  -- device name hash chain, please keep it close to name[]  
  -- snmp alias  
  --	 *	I/O specific fields
  --	 *	FIXME: Merge these and struct ifmap into one
  --	  

  -- shared mem end	 
  -- shared mem start	 
  -- device I/O address	 
  -- device IRQ number	 
  --	 *	Some hardware also needs these fields, but they are not
  --	 *	part of the usual set specified in Space.c.
  --	  

  -- directly linked devices, like slaves for bonding  
  -- all linked devices, *including* neighbours  
  -- currently active device features  
  -- user-changeable features  
  -- user-requested features  
  -- mask of features inheritable by VLAN devices  
  -- mask of features inherited by encapsulating devices
  --	 * This field indicates what encapsulation offloads
  --	 * the hardware is capable of doing, and drivers will
  --	 * need to set them appropriately.
  --	  

  -- mask of fetures inheritable by MPLS  
  -- Interface index. Unique device identifier	 
  -- dropped packets by core network, Do not use this in drivers  
  -- Stats to monitor carrier on<->off transitions  
  -- List of functions to handle Wireless Extensions (instead of ioctl).
  --	 * See <net/iw_handler.h> for details. Jean II  

   --  skipped empty struct iw_handler_def

  -- Instance data managed by the core of Wireless Extensions.  
   --  skipped empty struct iw_public_data

  -- Management operations  
   --  skipped empty struct forwarding_accel_ops

  -- Hardware header description  
  -- interface flags (a la BSD)	 
  -- Like 'flags' but invisible to userspace.
  --					     * See if.h for definitions.  

  -- How much padding added by alloc_netdev()  
  -- RFC2863 operstate  
  -- mapping policy to operstate  
  -- Selectable AUI, TP,.. 
  -- DMA channel		 
  -- interface MTU value		 
  -- interface hardware type	 
  -- hardware hdr length	 
  -- extra head- and tailroom the hardware may need, but not in all cases
  --	 * can this be guaranteed, especially tailroom. Some cases also use
  --	 * LL_MAX_HEADER instead to allocate the skb.
  --	  

  -- Interface address info.  
  -- permanent hw address  
  -- hw address assignment type  
  -- hardware address length	 
  -- Used to differentiate devices
  --						 * that share the same link
  --						 * layer address
  --						  

  -- Used to differentiate
  --						 * devices that share the same
  --						 * function
  --						  

  -- Unicast mac addresses  
  -- Multicast mac addresses  
  -- list of device
  --						    * hw addresses
  --						     

  -- Protocol specific pointers  
  -- VLAN info  
   --  skipped empty struct vlan_info

  -- dsa specific data  
  -- TIPC specific data  
   --  skipped empty struct tipc_bearer

  -- AppleTalk link 	 
  -- IPv4 specific data	 
   --  skipped empty struct in_device

  -- DECnet specific data  
   --  skipped empty struct dn_dev

  -- IPv6 specific data  
   --  skipped empty struct inet6_dev

  -- AX.25 specific data  
  -- IEEE 802.11 specific data,
  --						   assign before registering  

  -- * Cache lines mostly used on receive path (including eth_type_trans())
  --  

  -- Time of last Rx  
  -- Interface address info used in eth_type_trans()  
  -- hw address, (before bcast
  --						   because most packets are
  --						   unicast)  

  -- Number of RX queues allocated at register_netdev() time  
  -- Number of RX queues currently active in device  
  -- hw bcast add	 
  -- * Cache lines mostly used on transmit path
  --  

  -- Number of TX queues allocated at alloc_netdev_mq() time   
  -- Number of TX queues currently active in device   
  -- root qdisc from userspace point of view  
  -- Max frames per queue allowed  
  -- CPU reverse-mapping for RX completion interrupts, indexed
  --	 * by RX queue number.  Assigned by driver.  This must only be
  --	 * set if the ndo_rx_flow_steer operation is defined.  

   --  skipped empty struct cpu_rmap

   type net_device is record
      name : aliased net_device_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1249
      name_hlist : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1252
      ifalias : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1255
      mem_end : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1261
      mem_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1262
      base_addr : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1263
      irq : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1264
      state : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1271
      dev_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1273
      napi_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1274
      unreg_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1275
      close_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1276
      adj_list : aliased anon_385;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1282
      all_adj_list : aliased anon_386;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1288
      features : aliased linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1292
      hw_features : aliased linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1294
      wanted_features : aliased linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1296
      vlan_features : aliased linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1298
      hw_enc_features : aliased linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1304
      mpls_features : aliased linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1306
      ifindex : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1309
      iflink : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1310
      stats : aliased net_device_stats;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1312
      rx_dropped : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1315
      tx_dropped : aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1316
      carrier_changes : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1319
      wireless_handlers : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1324
      wireless_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1326
      netdev_ops : access constant net_device_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1329
      the_ethtool_ops : access constant linux_ethtool_h.ethtool_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1330
      fwd_ops : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1331
      the_header_ops : access constant header_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1334
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1336
      priv_flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1337
      gflags : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1339
      padded : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1340
      operstate : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1342
      link_mode : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1343
      if_port : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1345
      dma : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1346
      mtu : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1348
      c_type : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1349
      hard_header_len : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1350
      needed_headroom : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1356
      needed_tailroom : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1357
      perm_addr : aliased net_device_perm_addr_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1360
      addr_assign_type : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1361
      addr_len : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1362
      neigh_priv_len : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1363
      dev_id : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1364
      dev_port : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1368
      addr_list_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1372
      uc : aliased netdev_hw_addr_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1373
      mc : aliased netdev_hw_addr_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1374
      dev_addrs : aliased netdev_hw_addr_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1375
      queues_kset : access linux_kobject_h.kset;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1379
      uc_promisc : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1382
      promiscuity : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1383
      allmulti : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1384
      the_vlan_info : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1390
      tipc_ptr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1396
      atalk_ptr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1398
      ip_ptr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1399
      dn_ptr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1400
      ip6_ptr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1401
      ax25_ptr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1402
      ieee80211_ptr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1403
      last_rx : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1409
      dev_addr : access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1412
      u_rx : access netdev_rx_queue;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1418
      num_rx_queues : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1421
      real_num_rx_queues : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1424
      rx_handler : access function (arg1 : System.Address) return rx_handler_result_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1428
      rx_handler_data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1429
      ingress_queue : access netdev_queue;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1431
      broadcast : aliased net_device_broadcast_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1432
      u_tx : access netdev_queue;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1438
      num_tx_queues : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1441
      real_num_tx_queues : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1444
      the_qdisc : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1447
      tx_queue_len : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1449
      tx_global_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1450
      xps_maps : access xps_dev_maps;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1453
      rx_cpu_rmap : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1459
      trans_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1468
      watchdog_timeo : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1470
      watchdog_timer : aliased linux_timer_h.timer_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1471
      pcpu_refcnt : access int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1474
      todo_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1477
      index_hlist : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1479
      link_watch_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1481
      reg_state : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1490
      dismantle : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1492
      rtnl_link_state : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1497
      destructor : access procedure (arg1 : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1500
      npinfo : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1503
      nd_net : access net_net_namespace_h.net;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1508
      field_98 : aliased anon_389;
      the_garp_port : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1520
      the_mrp_port : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1522
      dev : aliased linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1525
      sysfs_groups : aliased net_device_sysfs_groups_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1527
      sysfs_rx_queue_group : access constant linux_sysfs_h.attribute_group;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1529
      the_rtnl_link_ops : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1532
      gso_max_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1536
      gso_max_segs : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1538
      dcbnl_ops : access constant net_dcbnl_h.dcbnl_rtnl_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1542
      num_tc : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1544
      tc_to_txq : aliased net_device_tc_to_txq_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1545
      prio_tc_map : aliased net_device_prio_tc_map_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1546
      fcoe_ddp_xid : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1550
      priomap : access net_netprio_cgroup_h.netprio_map;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1553
      phydev : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1556
      qdisc_tx_busylock : access linux_lockdep_h.lock_class_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1558
      group : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1561
      pm_qos_req : aliased linux_pm_qos_h.pm_qos_request;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1563
   end record;
   pragma Convention (C_Pass_By_Copy, net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1242

  -- These may be needed for future network-power-down code.  
  --	 * trans_start here is expensive for high speed devices on SMP,
  --	 * please use netdev_queue->trans_start instead.
  --	  

  -- Time (in jiffies) of last Tx	 
  -- used by dev_watchdog()  
  -- Number of references to this device  
  -- delayed register/unregister  
  -- device index hash chain  
  -- register/unregister state machine  
  -- completed register_netdevice  
  -- called unregister_netdevice  
  -- completed unregister todo  
  -- called free_netdev  
  -- dummy device for NAPI poll  
  -- device is going do be freed  
  -- Called from unregister, can be used to call free_netdev  
  -- Network namespace this network device is inside  
  -- mid-layer private  
  -- loopback stats  
   --  skipped empty struct pcpu_lstats

  -- dummy stats  
   --  skipped empty struct pcpu_dstats

  -- veth stats  
   --  skipped empty struct pcpu_vstats

  -- GARP  
   --  skipped empty struct garp_port

  -- MRP  
   --  skipped empty struct mrp_port

  -- class/net/name entry  
  -- space for optional device, statistics, and wireless sysfs groups  
  -- space for optional per-rx queue attributes  
  -- rtnetlink link ops  
   --  skipped empty struct rtnl_link_ops

  -- for setting kernel sock attribute on TCP connection setup  
  -- Data Center Bridging netlink ops  
  -- max exchange id for FCoE LRO by ddp  
  -- phy device may attach itself for hardware timestamping  
  -- group the device belongs to  
   function netdev_get_prio_tc_map (dev : access constant net_device; prio : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1570
   pragma Import (CPP, netdev_get_prio_tc_map, "_ZL22netdev_get_prio_tc_mapPK10net_devicej");

   function netdev_set_prio_tc_map
     (dev : access net_device;
      prio : asm_generic_int_ll64_h.u8;
      tc : asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1576
   pragma Import (CPP, netdev_set_prio_tc_map, "_ZL22netdev_set_prio_tc_mapP10net_devicehh");

   procedure netdev_reset_tc (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1586
   pragma Import (CPP, netdev_reset_tc, "_ZL15netdev_reset_tcP10net_device");

   function netdev_set_tc_queue
     (dev : access net_device;
      tc : asm_generic_int_ll64_h.u8;
      count : asm_generic_int_ll64_h.u16;
      offset : asm_generic_int_ll64_h.u16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1594
   pragma Import (CPP, netdev_set_tc_queue, "_ZL19netdev_set_tc_queueP10net_devicehtt");

   function netdev_set_num_tc (dev : access net_device; num_tc : asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1605
   pragma Import (CPP, netdev_set_num_tc, "_ZL17netdev_set_num_tcP10net_deviceh");

   function netdev_get_num_tc (dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1615
   pragma Import (CPP, netdev_get_num_tc, "_ZL17netdev_get_num_tcP10net_device");

   function netdev_get_tx_queue (dev : access constant net_device; index : unsigned) return access netdev_queue;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1621
   pragma Import (CPP, netdev_get_tx_queue, "_ZL19netdev_get_tx_queuePK10net_devicej");

   procedure netdev_for_each_tx_queue
     (dev : access net_device;
      f : access procedure
        (arg1 : access net_device;
         arg2 : access netdev_queue;
         arg3 : System.Address);
      arg : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1627
   pragma Import (CPP, netdev_for_each_tx_queue, "_ZL24netdev_for_each_tx_queueP10net_devicePFvS0_P12netdev_queuePvES3_");

   function netdev_pick_tx
     (dev : access net_device;
      skb : access linux_skbuff_h.sk_buff;
      accel_priv : System.Address) return access netdev_queue;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1639
   pragma Import (CPP, netdev_pick_tx, "_Z14netdev_pick_txP10net_deviceP7sk_buffPv");

  -- * Net namespace inlines
  --  

   function dev_net (dev : access constant net_device) return access net_net_namespace_h.net;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1647
   pragma Import (CPP, dev_net, "_ZL7dev_netPK10net_device");

   procedure dev_net_set (dev : access net_device; the_net : access net_net_namespace_h.net);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1653
   pragma Import (CPP, dev_net_set, "_ZL11dev_net_setP10net_deviceP3net");

   function netdev_uses_dsa_tags (dev : access net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1661
   pragma Import (CPP, netdev_uses_dsa_tags, "_ZL20netdev_uses_dsa_tagsP10net_device");

   function netdev_uses_trailer_tags (dev : access net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1671
   pragma Import (CPP, netdev_uses_trailer_tags, "_ZL24netdev_uses_trailer_tagsP10net_device");

  --*
  -- *	netdev_priv - access network device private data
  -- *	@dev: network device
  -- *
  -- * Get network device private data
  --  

   function netdev_priv (dev : access constant net_device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1687
   pragma Import (CPP, netdev_priv, "_ZL11netdev_privPK10net_device");

  -- Set the sysfs physical device reference for the network logical device
  -- * if set prior to registration will cause a symlink during initialization.
  --  

  -- Set the sysfs device type for the network logical device to allow
  -- * fine-grained identification of different network device types. For
  -- * example Ethernet, Wirelss LAN, Bluetooth, WiMAX etc.
  --  

  -- Default NAPI poll() weight
  -- * Device drivers are strongly advised to not use bigger value
  --  

  --*
  -- *	netif_napi_add - initialize a napi context
  -- *	@dev:  network device
  -- *	@napi: napi context
  -- *	@poll: polling function
  -- *	@weight: default weight
  -- *
  -- * netif_napi_add() must be used to initialize a napi context prior to calling
  -- * *any* of the other napi related functions.
  --  

   procedure netif_napi_add
     (dev : access net_device;
      napi : access napi_struct;
      poll : access function (arg1 : access napi_struct; arg2 : int) return int;
      weight : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1718
   pragma Import (CPP, netif_napi_add, "_Z14netif_napi_addP10net_deviceP11napi_structPFiS2_iEi");

  --*
  -- *  netif_napi_del - remove a napi context
  -- *  @napi: napi context
  -- *
  -- *  netif_napi_del() removes a napi context from the network device napi list
  --  

   procedure netif_napi_del (napi : access napi_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1727
   pragma Import (CPP, netif_napi_del, "_Z14netif_napi_delP11napi_struct");

  -- Virtual address of skb_shinfo(skb)->frags[0].page + offset.  
   type napi_gro_cb is record
      frag0 : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1731
      frag0_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1734
      data_offset : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1737
      flush : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1740
      flush_id : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1743
      count : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1746
      same_flow : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1749
      free : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1752
      age : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1757
      proto : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1760
      udp_mark : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1763
      csum : aliased uapi_linux_types_h.uu_wsum;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1766
      last : access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1769
   end record;
   pragma Convention (C_Pass_By_Copy, napi_gro_cb);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1729

  -- Length of frag0.  
  -- This indicates where we are processing relative to skb->data.  
  -- This is non-zero if the packet cannot be merged with the new skb.  
  -- Save the IP ID here and check when we get to the transport layer  
  -- Number of segments aggregated.  
  -- This is non-zero if the packet may be of the same flow.  
  -- Free the skb?  
  -- jiffies when first packet was created/queued  
  -- Used in ipv6_gro_receive()  
  -- Used in udp_gro_receive  
  -- used to support CHECKSUM_COMPLETE for tunneling protocols  
  -- used in skb_gro_receive() slow path  
  -- This is really htons(ether_type).  
   type packet_type is record
      c_type : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1775
      dev : access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1776
      func : access function
           (arg1 : access linux_skbuff_h.sk_buff;
            arg2 : access net_device;
            arg3 : access packet_type;
            arg4 : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1780
      id_match : access function (arg1 : access packet_type; arg2 : System.Address) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1782
      af_packet_priv : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1783
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1784
   end record;
   pragma Convention (C_Pass_By_Copy, packet_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1774

  -- NULL is wildcarded here	      
   type offload_callbacks is record
      gso_segment : access function (arg1 : access linux_skbuff_h.sk_buff; arg2 : linux_netdev_features_h.netdev_features_t) return access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1789
      gso_send_check : access function (arg1 : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1790
      gro_receive : access function (arg1 : System.Address; arg2 : access linux_skbuff_h.sk_buff) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1792
      gro_complete : access function (arg1 : access linux_skbuff_h.sk_buff; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1793
   end record;
   pragma Convention (C_Pass_By_Copy, offload_callbacks);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1787

  -- This is really htons(ether_type).  
   type packet_offload is record
      c_type : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1797
      callbacks : aliased offload_callbacks;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1798
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1799
   end record;
   pragma Convention (C_Pass_By_Copy, packet_offload);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1796

   type udp_offload is record
      port : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1803
      callbacks : aliased offload_callbacks;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1804
   end record;
   pragma Convention (C_Pass_By_Copy, udp_offload);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1802

  -- often modified stats are per cpu, other are shared (netdev->stats)  
   type pcpu_sw_netstats is record
      rx_packets : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1809
      rx_bytes : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1810
      tx_packets : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1811
      tx_bytes : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1812
      syncp : aliased linux_u64_stats_sync_h.u64_stats_sync;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1813
   end record;
   pragma Convention (C_Pass_By_Copy, pcpu_sw_netstats);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1808

  -- netdevice notifier chain. Please remember to update the rtnetlink
  -- * notification exclusion list in rtnetlink_event() when adding new
  -- * types.
  --  

   function register_netdevice_notifier (nb : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1863
   pragma Import (CPP, register_netdevice_notifier, "_Z27register_netdevice_notifierP14notifier_block");

   function unregister_netdevice_notifier (nb : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1864
   pragma Import (CPP, unregister_netdevice_notifier, "_Z29unregister_netdevice_notifierP14notifier_block");

   type netdev_notifier_info is record
      dev : access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1867
   end record;
   pragma Convention (C_Pass_By_Copy, netdev_notifier_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1866

  -- must be first  
   type netdev_notifier_change_info is record
      info : aliased netdev_notifier_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1871
      flags_changed : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1872
   end record;
   pragma Convention (C_Pass_By_Copy, netdev_notifier_change_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1870

   procedure netdev_notifier_info_init (info : access netdev_notifier_info; dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1875
   pragma Import (CPP, netdev_notifier_info_init, "_ZL25netdev_notifier_info_initP20netdev_notifier_infoP10net_device");

   function netdev_notifier_info_to_dev (info : access constant netdev_notifier_info) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1882
   pragma Import (CPP, netdev_notifier_info_to_dev, "_ZL27netdev_notifier_info_to_devPK20netdev_notifier_info");

   function call_netdevice_notifiers (val : unsigned_long; dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1887
   pragma Import (CPP, call_netdevice_notifiers, "_Z24call_netdevice_notifiersmP10net_device");

  -- Device list lock  
   dev_base_lock : aliased linux_rwlock_types_h.rwlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1890
   pragma Import (C, dev_base_lock, "dev_base_lock");

   function next_net_device (dev : access net_device) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1909
   pragma Import (CPP, next_net_device, "_ZL15next_net_deviceP10net_device");

   function next_net_device_rcu (dev : access net_device) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1919
   pragma Import (CPP, next_net_device_rcu, "_ZL19next_net_device_rcuP10net_device");

   function first_net_device (the_net : access net_net_namespace_h.net) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1929
   pragma Import (CPP, first_net_device, "_ZL16first_net_deviceP3net");

   function first_net_device_rcu (the_net : access net_net_namespace_h.net) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1935
   pragma Import (CPP, first_net_device_rcu, "_ZL20first_net_device_rcuP3net");

   function netdev_boot_setup_check (dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1942
   pragma Import (CPP, netdev_boot_setup_check, "_Z23netdev_boot_setup_checkP10net_device");

   function netdev_boot_base (prefix : Interfaces.C.Strings.chars_ptr; unit : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1943
   pragma Import (CPP, netdev_boot_base, "_Z16netdev_boot_basePKci");

   function dev_getbyhwaddr_rcu
     (the_net : access net_net_namespace_h.net;
      c_type : unsigned_short;
      hwaddr : Interfaces.C.Strings.chars_ptr) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1944
   pragma Import (CPP, dev_getbyhwaddr_rcu, "_Z19dev_getbyhwaddr_rcuP3nettPKc");

   function dev_getfirstbyhwtype (the_net : access net_net_namespace_h.net; c_type : unsigned_short) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1946
   pragma Import (CPP, dev_getfirstbyhwtype, "_Z20dev_getfirstbyhwtypeP3nett");

   --  skipped func __dev_getfirstbyhwtype

   procedure dev_add_pack (pt : access packet_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1948
   pragma Import (CPP, dev_add_pack, "_Z12dev_add_packP11packet_type");

   procedure dev_remove_pack (pt : access packet_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1949
   pragma Import (CPP, dev_remove_pack, "_Z15dev_remove_packP11packet_type");

   --  skipped func __dev_remove_pack

   procedure dev_add_offload (po : access packet_offload);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1951
   pragma Import (CPP, dev_add_offload, "_Z15dev_add_offloadP14packet_offload");

   procedure dev_remove_offload (po : access packet_offload);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1952
   pragma Import (CPP, dev_remove_offload, "_Z18dev_remove_offloadP14packet_offload");

   function dev_get_by_flags_rcu
     (the_net : access net_net_namespace_h.net;
      flags : unsigned_short;
      mask : unsigned_short) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1954
   pragma Import (CPP, dev_get_by_flags_rcu, "_Z20dev_get_by_flags_rcuP3nettt");

   function dev_get_by_name (the_net : access net_net_namespace_h.net; name : Interfaces.C.Strings.chars_ptr) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1956
   pragma Import (CPP, dev_get_by_name, "_Z15dev_get_by_nameP3netPKc");

   function dev_get_by_name_rcu (the_net : access net_net_namespace_h.net; name : Interfaces.C.Strings.chars_ptr) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1957
   pragma Import (CPP, dev_get_by_name_rcu, "_Z19dev_get_by_name_rcuP3netPKc");

   --  skipped func __dev_get_by_name

   function dev_alloc_name (dev : access net_device; name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1959
   pragma Import (CPP, dev_alloc_name, "_Z14dev_alloc_nameP10net_devicePKc");

   function dev_open (dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1960
   pragma Import (CPP, dev_open, "_Z8dev_openP10net_device");

   function dev_close (dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1961
   pragma Import (CPP, dev_close, "_Z9dev_closeP10net_device");

   procedure dev_disable_lro (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1962
   pragma Import (CPP, dev_disable_lro, "_Z15dev_disable_lroP10net_device");

   function dev_loopback_xmit (newskb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1963
   pragma Import (CPP, dev_loopback_xmit, "_Z17dev_loopback_xmitP7sk_buff");

   function dev_queue_xmit (skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1964
   pragma Import (CPP, dev_queue_xmit, "_Z14dev_queue_xmitP7sk_buff");

   function dev_queue_xmit_accel (skb : access linux_skbuff_h.sk_buff; accel_priv : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1965
   pragma Import (CPP, dev_queue_xmit_accel, "_Z20dev_queue_xmit_accelP7sk_buffPv");

   function register_netdevice (dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1966
   pragma Import (CPP, register_netdevice, "_Z18register_netdeviceP10net_device");

   procedure unregister_netdevice_queue (dev : access net_device; head : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1967
   pragma Import (CPP, unregister_netdevice_queue, "_Z26unregister_netdevice_queueP10net_deviceP9list_head");

   procedure unregister_netdevice_many (head : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1968
   pragma Import (CPP, unregister_netdevice_many, "_Z25unregister_netdevice_manyP9list_head");

   procedure unregister_netdevice (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1969
   pragma Import (CPP, unregister_netdevice, "_ZL20unregister_netdeviceP10net_device");

   function netdev_refcnt_read (dev : access constant net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1974
   pragma Import (CPP, netdev_refcnt_read, "_Z18netdev_refcnt_readPK10net_device");

   procedure free_netdev (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1975
   pragma Import (CPP, free_netdev, "_Z11free_netdevP10net_device");

   procedure netdev_freemem (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1976
   pragma Import (CPP, netdev_freemem, "_Z14netdev_freememP10net_device");

   procedure synchronize_net;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1977
   pragma Import (CPP, synchronize_net, "_Z15synchronize_netv");

   function init_dummy_netdev (dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1978
   pragma Import (CPP, init_dummy_netdev, "_Z17init_dummy_netdevP10net_device");

   function dev_get_by_index (the_net : access net_net_namespace_h.net; ifindex : int) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1980
   pragma Import (CPP, dev_get_by_index, "_Z16dev_get_by_indexP3neti");

   --  skipped func __dev_get_by_index

   function dev_get_by_index_rcu (the_net : access net_net_namespace_h.net; ifindex : int) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1982
   pragma Import (CPP, dev_get_by_index_rcu, "_Z20dev_get_by_index_rcuP3neti");

   function netdev_get_name
     (the_net : access net_net_namespace_h.net;
      name : Interfaces.C.Strings.chars_ptr;
      ifindex : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1983
   pragma Import (CPP, netdev_get_name, "_Z15netdev_get_nameP3netPci");

   function dev_restart (dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1984
   pragma Import (CPP, dev_restart, "_Z11dev_restartP10net_device");

   function skb_gro_receive (head : System.Address; skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1985
   pragma Import (CPP, skb_gro_receive, "_Z15skb_gro_receivePP7sk_buffS0_");

   function skb_gro_offset (skb : access constant linux_skbuff_h.sk_buff) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1987
   pragma Import (CPP, skb_gro_offset, "_ZL14skb_gro_offsetPK7sk_buff");

   function skb_gro_len (skb : access constant linux_skbuff_h.sk_buff) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1992
   pragma Import (CPP, skb_gro_len, "_ZL11skb_gro_lenPK7sk_buff");

   procedure skb_gro_pull (skb : access linux_skbuff_h.sk_buff; len : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:1997
   pragma Import (CPP, skb_gro_pull, "_ZL12skb_gro_pullP7sk_buffj");

   function skb_gro_header_fast (skb : access linux_skbuff_h.sk_buff; offset : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2002
   pragma Import (CPP, skb_gro_header_fast, "_ZL19skb_gro_header_fastP7sk_buffj");

   function skb_gro_header_hard (skb : access linux_skbuff_h.sk_buff; hlen : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2008
   pragma Import (CPP, skb_gro_header_hard, "_ZL19skb_gro_header_hardP7sk_buffj");

   function skb_gro_header_slow
     (skb : access linux_skbuff_h.sk_buff;
      hlen : unsigned;
      offset : unsigned) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2013
   pragma Import (CPP, skb_gro_header_slow, "_ZL19skb_gro_header_slowP7sk_buffjj");

   function skb_gro_network_header (skb : access linux_skbuff_h.sk_buff) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2024
   pragma Import (CPP, skb_gro_network_header, "_ZL22skb_gro_network_headerP7sk_buff");

   procedure skb_gro_postpull_rcsum
     (skb : access linux_skbuff_h.sk_buff;
      start : System.Address;
      len : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2030
   pragma Import (CPP, skb_gro_postpull_rcsum, "_ZL22skb_gro_postpull_rcsumP7sk_buffPKvj");

   function dev_hard_header
     (skb : access linux_skbuff_h.sk_buff;
      dev : access net_device;
      c_type : unsigned_short;
      daddr : System.Address;
      saddr : System.Address;
      len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2038
   pragma Import (CPP, dev_hard_header, "_ZL15dev_hard_headerP7sk_buffP10net_devicetPKvS4_j");

   function dev_parse_header (skb : access constant linux_skbuff_h.sk_buff; haddr : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2049
   pragma Import (CPP, dev_parse_header, "_ZL16dev_parse_headerPK7sk_buffPh");

   function dev_rebuild_header (skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2059
   pragma Import (CPP, dev_rebuild_header, "_ZL18dev_rebuild_headerP7sk_buff");

   --  skipped function type gifconf_func_t

   function register_gifconf (family : unsigned; gifconf : access function
        (arg1 : access net_device;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2069
   pragma Import (CPP, register_gifconf, "_Z16register_gifconfjPFiP10net_devicePciE");

   function unregister_gifconf (family : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2070
   pragma Import (CPP, unregister_gifconf, "_ZL18unregister_gifconfj");

   type sd_flow_limit_history_array is array (0 .. 127) of aliased asm_generic_int_ll64_h.u16;
   type sd_flow_limit_buckets_array is array (0 .. -1) of aliased asm_generic_int_ll64_h.u8;
   type sd_flow_limit is record
      count : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2078
      num_buckets : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2079
      history_head : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2080
      history : aliased sd_flow_limit_history_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2081
      buckets : aliased sd_flow_limit_buckets_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2082
   end record;
   pragma Convention (C_Pass_By_Copy, sd_flow_limit);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2077

   netdev_flow_limit_table_len : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2085
   pragma Import (C, netdev_flow_limit_table_len, "netdev_flow_limit_table_len");

  -- * Incoming packets are placed on per-cpu queues
  --  

   type softnet_data is record
      output_queue : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2092
      output_queue_tailp : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2093
      poll_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2094
      completion_queue : access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2095
      process_queue : aliased linux_skbuff_h.sk_buff_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2096
      processed : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2099
      time_squeeze : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2100
      cpu_collision : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2101
      received_rps : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2102
      rps_ipi_list : access softnet_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2105
      csd : aliased linux_smp_h.call_single_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2108
      rps_ipi_next : access softnet_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2109
      cpu : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2110
      input_queue_head : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2111
      input_queue_tail : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2112
      dropped : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2114
      input_pkt_queue : aliased linux_skbuff_h.sk_buff_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2115
      backlog : aliased napi_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2116
      flow_limit : access sd_flow_limit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2119
   end record;
   pragma Convention (C_Pass_By_Copy, softnet_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2091

  -- stats  
  -- Elements below can be accessed between CPUs for RPS  
   procedure input_queue_head_incr (sd : access softnet_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2123
   pragma Import (CPP, input_queue_head_incr, "_ZL21input_queue_head_incrP12softnet_data");

   procedure input_queue_tail_incr_save (sd : access softnet_data; qtail : access unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2130
   pragma Import (CPP, input_queue_tail_incr_save, "_ZL26input_queue_tail_incr_saveP12softnet_dataPj");

   softnet_data : aliased softnet_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2138
   pragma Import (C, softnet_data, "softnet_data");

   --  skipped func __netif_schedule

   procedure netif_schedule_queue (txq : access netdev_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2142
   pragma Import (CPP, netif_schedule_queue, "_ZL20netif_schedule_queueP12netdev_queue");

   procedure netif_tx_schedule_all (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2148
   pragma Import (CPP, netif_tx_schedule_all, "_ZL21netif_tx_schedule_allP10net_device");

   procedure netif_tx_start_queue (dev_queue : access netdev_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2156
   pragma Import (CPP, netif_tx_start_queue, "_ZL20netif_tx_start_queueP12netdev_queue");

  --*
  -- *	netif_start_queue - allow transmit
  -- *	@dev: network device
  -- *
  -- *	Allow upper layers to call the device hard_start_xmit routine.
  --  

   procedure netif_start_queue (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2167
   pragma Import (CPP, netif_start_queue, "_ZL17netif_start_queueP10net_device");

   procedure netif_tx_start_all_queues (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2172
   pragma Import (CPP, netif_tx_start_all_queues, "_ZL25netif_tx_start_all_queuesP10net_device");

   procedure netif_tx_wake_queue (dev_queue : access netdev_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2182
   pragma Import (CPP, netif_tx_wake_queue, "_ZL19netif_tx_wake_queueP12netdev_queue");

  --*
  -- *	netif_wake_queue - restart transmit
  -- *	@dev: network device
  -- *
  -- *	Allow upper layers to call the device hard_start_xmit routine.
  -- *	Used for flow control when transmit resources are available.
  --  

   procedure netif_wake_queue (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2195
   pragma Import (CPP, netif_wake_queue, "_ZL16netif_wake_queueP10net_device");

   procedure netif_tx_wake_all_queues (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2200
   pragma Import (CPP, netif_tx_wake_all_queues, "_ZL24netif_tx_wake_all_queuesP10net_device");

   procedure netif_tx_stop_queue (dev_queue : access netdev_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2210
   pragma Import (CPP, netif_tx_stop_queue, "_ZL19netif_tx_stop_queueP12netdev_queue");

  --*
  -- *	netif_stop_queue - stop transmitted packets
  -- *	@dev: network device
  -- *
  -- *	Stop upper layers calling the device hard_start_xmit routine.
  -- *	Used for flow control when transmit resources are unavailable.
  --  

   procedure netif_stop_queue (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2226
   pragma Import (CPP, netif_stop_queue, "_ZL16netif_stop_queueP10net_device");

   procedure netif_tx_stop_all_queues (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2231
   pragma Import (CPP, netif_tx_stop_all_queues, "_ZL24netif_tx_stop_all_queuesP10net_device");

   function netif_tx_queue_stopped (dev_queue : access constant netdev_queue) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2241
   pragma Import (CPP, netif_tx_queue_stopped, "_ZL22netif_tx_queue_stoppedPK12netdev_queue");

  --*
  -- *	netif_queue_stopped - test if transmit queue is flowblocked
  -- *	@dev: network device
  -- *
  -- *	Test if transmit queue on device is currently unable to send.
  --  

   function netif_queue_stopped (dev : access constant net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2252
   pragma Import (CPP, netif_queue_stopped, "_ZL19netif_queue_stoppedPK10net_device");

   function netif_xmit_stopped (dev_queue : access constant netdev_queue) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2257
   pragma Import (CPP, netif_xmit_stopped, "_ZL18netif_xmit_stoppedPK12netdev_queue");

   function netif_xmit_frozen_or_stopped (dev_queue : access constant netdev_queue) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2263
   pragma Import (CPP, netif_xmit_frozen_or_stopped, "_ZL28netif_xmit_frozen_or_stoppedPK12netdev_queue");

   function netif_xmit_frozen_or_drv_stopped (dev_queue : access constant netdev_queue) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2269
   pragma Import (CPP, netif_xmit_frozen_or_drv_stopped, "_ZL32netif_xmit_frozen_or_drv_stoppedPK12netdev_queue");

   procedure netdev_tx_sent_queue (dev_queue : access netdev_queue; bytes : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2274
   pragma Import (CPP, netdev_tx_sent_queue, "_ZL20netdev_tx_sent_queueP12netdev_queuej");

  --	 * The XOFF flag must be set before checking the dql_avail below,
  --	 * because in netdev_tx_completed_queue we update the dql_completed
  --	 * before checking the XOFF flag.
  --	  

  -- check again in case another CPU has just made room avail  
  --*
  -- * 	netdev_sent_queue - report the number of bytes queued to hardware
  -- * 	@dev: network device
  -- * 	@bytes: number of bytes queued to the hardware device queue
  -- *
  -- * 	Report the number of bytes queued for sending/completion to the network
  -- * 	device hardware queue. @bytes should be a good approximation and should
  -- * 	exactly match netdev_completed_queue() @bytes
  --  

   procedure netdev_sent_queue (dev : access net_device; bytes : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2307
   pragma Import (CPP, netdev_sent_queue, "_ZL17netdev_sent_queueP10net_devicej");

   procedure netdev_tx_completed_queue
     (dev_queue : access netdev_queue;
      pkts : unsigned;
      bytes : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2312
   pragma Import (CPP, netdev_tx_completed_queue, "_ZL25netdev_tx_completed_queueP12netdev_queuejj");

  --	 * Without the memory barrier there is a small possiblity that
  --	 * netdev_tx_sent_queue will miss the update and cause the queue to
  --	 * be stopped forever
  --	  

  --*
  -- * 	netdev_completed_queue - report bytes and packets completed by device
  -- * 	@dev: network device
  -- * 	@pkts: actual number of packets sent over the medium
  -- * 	@bytes: actual number of bytes sent over the medium
  -- *
  -- * 	Report the number of bytes and packets transmitted by the network device
  -- * 	hardware queue over the physical medium, @bytes must exactly match the
  -- * 	@bytes amount passed to netdev_sent_queue()
  --  

   procedure netdev_completed_queue
     (dev : access net_device;
      pkts : unsigned;
      bytes : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2346
   pragma Import (CPP, netdev_completed_queue, "_ZL22netdev_completed_queueP10net_devicejj");

   procedure netdev_tx_reset_queue (q : access netdev_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2352
   pragma Import (CPP, netdev_tx_reset_queue, "_ZL21netdev_tx_reset_queueP12netdev_queue");

  --*
  -- * 	netdev_reset_queue - reset the packets and bytes count of a network device
  -- * 	@dev_queue: network device
  -- *
  -- * 	Reset the bytes and packet count of a network device and clear the
  -- * 	software flow control OFF bit for this network device
  --  

   procedure netdev_reset_queue (dev_queue : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2367
   pragma Import (CPP, netdev_reset_queue, "_ZL18netdev_reset_queueP10net_device");

  --*
  -- * 	netdev_cap_txqueue - check if selected tx queue exceeds device queues
  -- * 	@dev: network device
  -- * 	@queue_index: given tx queue index
  -- *
  -- * 	Returns 0 if given tx queue index >= number of device tx queues,
  -- * 	otherwise returns the originally passed tx queue index.
  --  

   function netdev_cap_txqueue (dev : access net_device; queue_index : asm_generic_int_ll64_h.u16) return asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2380
   pragma Import (CPP, netdev_cap_txqueue, "_ZL18netdev_cap_txqueueP10net_devicet");

  --*
  -- *	netif_running - test if up
  -- *	@dev: network device
  -- *
  -- *	Test if the device has been brought up.
  --  

   function netif_running (dev : access constant net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2398
   pragma Import (CPP, netif_running, "_ZL13netif_runningPK10net_device");

  -- * Routines to manage the subqueues on a device.  We only need start
  -- * stop, and a check if it's stopped.  All other device management is
  -- * done at the overall netdevice level.
  -- * Also test the device if we're multiqueue.
  --  

  --*
  -- *	netif_start_subqueue - allow sending packets on subqueue
  -- *	@dev: network device
  -- *	@queue_index: sub queue index
  -- *
  -- * Start individual transmit queue of a device with multiple transmit queues.
  --  

   procedure netif_start_subqueue (dev : access net_device; queue_index : asm_generic_int_ll64_h.u16);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2417
   pragma Import (CPP, netif_start_subqueue, "_ZL20netif_start_subqueueP10net_devicet");

  --*
  -- *	netif_stop_subqueue - stop sending packets on subqueue
  -- *	@dev: network device
  -- *	@queue_index: sub queue index
  -- *
  -- * Stop individual transmit queue of a device with multiple transmit queues.
  --  

   procedure netif_stop_subqueue (dev : access net_device; queue_index : asm_generic_int_ll64_h.u16);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2431
   pragma Import (CPP, netif_stop_subqueue, "_ZL19netif_stop_subqueueP10net_devicet");

  --*
  -- *	netif_subqueue_stopped - test status of subqueue
  -- *	@dev: network device
  -- *	@queue_index: sub queue index
  -- *
  -- * Check individual transmit queue of a device with multiple transmit queues.
  --  

   --  skipped func __netif_subqueue_stopped

   function netif_subqueue_stopped (dev : access constant net_device; skb : access linux_skbuff_h.sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2452
   pragma Import (CPP, netif_subqueue_stopped, "_ZL22netif_subqueue_stoppedPK10net_deviceP7sk_buff");

  --*
  -- *	netif_wake_subqueue - allow sending packets on subqueue
  -- *	@dev: network device
  -- *	@queue_index: sub queue index
  -- *
  -- * Resume individual transmit queue of a device with multiple transmit queues.
  --  

   procedure netif_wake_subqueue (dev : access net_device; queue_index : asm_generic_int_ll64_h.u16);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2465
   pragma Import (CPP, netif_wake_subqueue, "_ZL19netif_wake_subqueueP10net_devicet");

   function netif_set_xps_queue
     (dev : access net_device;
      mask : access constant linux_cpumask_h.cpumask;
      index : asm_generic_int_ll64_h.u16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2473
   pragma Import (CPP, netif_set_xps_queue, "_Z19netif_set_xps_queueP10net_devicePK7cpumaskt");

  -- * Returns a Tx hash for the given packet when dev->real_num_tx_queues is used
  -- * as a distribution range limit for the returned value.
  --  

   function skb_tx_hash (dev : access constant net_device; skb : access constant linux_skbuff_h.sk_buff) return asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2488
   pragma Import (CPP, skb_tx_hash, "_ZL11skb_tx_hashPK10net_devicePK7sk_buff");

  --*
  -- *	netif_is_multiqueue - test if device has multiple transmit queues
  -- *	@dev: network device
  -- *
  -- * Check if device has multiple transmit queues
  --  

   function netif_is_multiqueue (dev : access constant net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2500
   pragma Import (CPP, netif_is_multiqueue, "_ZL19netif_is_multiqueuePK10net_device");

   function netif_set_real_num_tx_queues (dev : access net_device; txq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2505
   pragma Import (CPP, netif_set_real_num_tx_queues, "_Z28netif_set_real_num_tx_queuesP10net_devicej");

   function netif_set_real_num_rx_queues (dev : access net_device; rxq : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2508
   pragma Import (CPP, netif_set_real_num_rx_queues, "_Z28netif_set_real_num_rx_queuesP10net_devicej");

   function netif_copy_real_num_queues (to_dev : access net_device; from_dev : access constant net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2517
   pragma Import (CPP, netif_copy_real_num_queues, "_ZL26netif_copy_real_num_queuesP10net_devicePKS_");

   function get_netdev_rx_queue_index (queue : access netdev_rx_queue) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2535
   pragma Import (CPP, get_netdev_rx_queue_index, "_ZL25get_netdev_rx_queue_indexP15netdev_rx_queue");

   function netif_get_num_default_rss_queues return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2547
   pragma Import (CPP, netif_get_num_default_rss_queues, "_Z32netif_get_num_default_rss_queuesv");

   type skb_free_reason is 
     (SKB_REASON_CONSUMED,
      SKB_REASON_DROPPED);
   pragma Convention (C, skb_free_reason);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2549

   --  skipped func __dev_kfree_skb_irq

   --  skipped func __dev_kfree_skb_any

  -- * It is not allowed to call kfree_skb() or consume_skb() from hardware
  -- * interrupt context or with hardware interrupts being disabled.
  -- * (in_irq() || irqs_disabled())
  -- *
  -- * We provide four helpers that can be used in following contexts :
  -- *
  -- * dev_kfree_skb_irq(skb) when caller drops a packet from irq context,
  -- *  replacing kfree_skb(skb)
  -- *
  -- * dev_consume_skb_irq(skb) when caller consumes a packet from irq context.
  -- *  Typically used in place of consume_skb(skb) in TX completion path
  -- *
  -- * dev_kfree_skb_any(skb) when caller doesn't know its current irq context,
  -- *  replacing kfree_skb(skb)
  -- *
  -- * dev_consume_skb_any(skb) when caller doesn't know its current irq context,
  -- *  and consumed a packet. Used in place of consume_skb(skb)
  --  

   procedure dev_kfree_skb_irq (skb : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2576
   pragma Import (CPP, dev_kfree_skb_irq, "_ZL17dev_kfree_skb_irqP7sk_buff");

   procedure dev_consume_skb_irq (skb : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2581
   pragma Import (CPP, dev_consume_skb_irq, "_ZL19dev_consume_skb_irqP7sk_buff");

   procedure dev_kfree_skb_any (skb : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2586
   pragma Import (CPP, dev_kfree_skb_any, "_ZL17dev_kfree_skb_anyP7sk_buff");

   procedure dev_consume_skb_any (skb : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2591
   pragma Import (CPP, dev_consume_skb_any, "_ZL19dev_consume_skb_anyP7sk_buff");

   function netif_rx (skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2596
   pragma Import (CPP, netif_rx, "_Z8netif_rxP7sk_buff");

   function netif_rx_ni (skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2597
   pragma Import (CPP, netif_rx_ni, "_Z11netif_rx_niP7sk_buff");

   function netif_receive_skb (skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2598
   pragma Import (CPP, netif_receive_skb, "_Z17netif_receive_skbP7sk_buff");

   function napi_gro_receive (napi : access napi_struct; skb : access linux_skbuff_h.sk_buff) return gro_result_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2599
   pragma Import (CPP, napi_gro_receive, "_Z16napi_gro_receiveP11napi_structP7sk_buff");

   procedure napi_gro_flush (napi : access napi_struct; flush_old : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2600
   pragma Import (CPP, napi_gro_flush, "_Z14napi_gro_flushP11napi_structb");

   function napi_get_frags (napi : access napi_struct) return access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2601
   pragma Import (CPP, napi_get_frags, "_Z14napi_get_fragsP11napi_struct");

   function napi_gro_frags (napi : access napi_struct) return gro_result_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2602
   pragma Import (CPP, napi_gro_frags, "_Z14napi_gro_fragsP11napi_struct");

   function gro_find_receive_by_type (c_type : uapi_linux_types_h.uu_be16) return access packet_offload;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2603
   pragma Import (CPP, gro_find_receive_by_type, "_Z24gro_find_receive_by_typet");

   function gro_find_complete_by_type (c_type : uapi_linux_types_h.uu_be16) return access packet_offload;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2604
   pragma Import (CPP, gro_find_complete_by_type, "_Z25gro_find_complete_by_typet");

   procedure napi_free_frags (napi : access napi_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2606
   pragma Import (CPP, napi_free_frags, "_ZL15napi_free_fragsP11napi_struct");

   function netdev_rx_handler_register
     (dev : access net_device;
      rx_handler : access function (arg1 : System.Address) return rx_handler_result_t;
      rx_handler_data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2612
   pragma Import (CPP, netdev_rx_handler_register, "_Z26netdev_rx_handler_registerP10net_devicePF17rx_handler_resultPP7sk_buffEPv");

   procedure netdev_rx_handler_unregister (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2615
   pragma Import (CPP, netdev_rx_handler_unregister, "_Z28netdev_rx_handler_unregisterP10net_device");

   function dev_valid_name (name : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2617
   pragma Import (CPP, dev_valid_name, "_Z14dev_valid_namePKc");

   function dev_ioctl
     (the_net : access net_net_namespace_h.net;
      cmd : unsigned;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2618
   pragma Import (CPP, dev_ioctl, "_Z9dev_ioctlP3netjPv");

   function dev_ethtool (the_net : access net_net_namespace_h.net; arg2 : access uapi_linux_if_h.ifreq) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2619
   pragma Import (CPP, dev_ethtool, "_Z11dev_ethtoolP3netP5ifreq");

   function dev_get_flags (arg1 : access constant net_device) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2620
   pragma Import (CPP, dev_get_flags, "_Z13dev_get_flagsPK10net_device");

   --  skipped func __dev_change_flags

   function dev_change_flags (arg1 : access net_device; arg2 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2622
   pragma Import (CPP, dev_change_flags, "_Z16dev_change_flagsP10net_devicej");

   --  skipped func __dev_notify_flags

   function dev_change_name (arg1 : access net_device; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2625
   pragma Import (CPP, dev_change_name, "_Z15dev_change_nameP10net_devicePKc");

   function dev_set_alias
     (arg1 : access net_device;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2626
   pragma Import (CPP, dev_set_alias, "_Z13dev_set_aliasP10net_devicePKcm");

   function dev_change_net_namespace
     (arg1 : access net_device;
      arg2 : access net_net_namespace_h.net;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2627
   pragma Import (CPP, dev_change_net_namespace, "_Z24dev_change_net_namespaceP10net_deviceP3netPKc");

   function dev_set_mtu (arg1 : access net_device; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2628
   pragma Import (CPP, dev_set_mtu, "_Z11dev_set_mtuP10net_devicei");

   procedure dev_set_group (arg1 : access net_device; arg2 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2629
   pragma Import (CPP, dev_set_group, "_Z13dev_set_groupP10net_devicei");

   function dev_set_mac_address (arg1 : access net_device; arg2 : access linux_socket_h.sockaddr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2630
   pragma Import (CPP, dev_set_mac_address, "_Z19dev_set_mac_addressP10net_deviceP8sockaddr");

   function dev_change_carrier (arg1 : access net_device; new_carrier : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2631
   pragma Import (CPP, dev_change_carrier, "_Z18dev_change_carrierP10net_deviceb");

   function dev_get_phys_port_id (dev : access net_device; ppid : access netdev_phys_port_id) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2632
   pragma Import (CPP, dev_get_phys_port_id, "_Z20dev_get_phys_port_idP10net_deviceP19netdev_phys_port_id");

   function dev_hard_start_xmit
     (skb : access linux_skbuff_h.sk_buff;
      dev : access net_device;
      txq : access netdev_queue) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2634
   pragma Import (CPP, dev_hard_start_xmit, "_Z19dev_hard_start_xmitP7sk_buffP10net_deviceP12netdev_queue");

   --  skipped func __dev_forward_skb

   function dev_forward_skb (dev : access net_device; skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2637
   pragma Import (CPP, dev_forward_skb, "_Z15dev_forward_skbP10net_deviceP7sk_buff");

   function is_skb_forwardable (dev : access net_device; skb : access linux_skbuff_h.sk_buff) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2638
   pragma Import (CPP, is_skb_forwardable, "_Z18is_skb_forwardableP10net_deviceP7sk_buff");

   netdev_budget : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2640
   pragma Import (C, netdev_budget, "netdev_budget");

  -- Called by rtnetlink.c:rtnl_unlock()  
   procedure netdev_run_todo;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2643
   pragma Import (CPP, netdev_run_todo, "_Z15netdev_run_todov");

  --*
  -- *	dev_put - release reference to device
  -- *	@dev: network device
  -- *
  -- * Release reference to device to allow it to be freed.
  --  

   procedure dev_put (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2651
   pragma Import (CPP, dev_put, "_ZL7dev_putP10net_device");

  --*
  -- *	dev_hold - get reference to device
  -- *	@dev: network device
  -- *
  -- * Hold reference to device to keep it from being freed.
  --  

   procedure dev_hold (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2662
   pragma Import (CPP, dev_hold, "_ZL8dev_holdP10net_device");

  -- Carrier loss detection, dial on demand. The functions netif_carrier_on
  -- * and _off may be called from IRQ context, but it is caller
  -- * who is responsible for serialization of these calls.
  -- *
  -- * The name carrier is inappropriate, these functions should really be
  -- * called netif_lowerlayer_*() because they represent the state of any
  -- * kind of lower layer not just hardware media.
  --  

   procedure linkwatch_init_dev (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2676
   pragma Import (CPP, linkwatch_init_dev, "_Z18linkwatch_init_devP10net_device");

   procedure linkwatch_fire_event (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2677
   pragma Import (CPP, linkwatch_fire_event, "_Z20linkwatch_fire_eventP10net_device");

   procedure linkwatch_forget_dev (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2678
   pragma Import (CPP, linkwatch_forget_dev, "_Z20linkwatch_forget_devP10net_device");

  --*
  -- *	netif_carrier_ok - test if carrier present
  -- *	@dev: network device
  -- *
  -- * Check if carrier is present on device
  --  

   function netif_carrier_ok (dev : access constant net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2686
   pragma Import (CPP, netif_carrier_ok, "_ZL16netif_carrier_okPK10net_device");

   function dev_trans_start (dev : access net_device) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2691
   pragma Import (CPP, dev_trans_start, "_Z15dev_trans_startP10net_device");

   --  skipped func __netdev_watchdog_up

   procedure netif_carrier_on (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2695
   pragma Import (CPP, netif_carrier_on, "_Z16netif_carrier_onP10net_device");

   procedure netif_carrier_off (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2697
   pragma Import (CPP, netif_carrier_off, "_Z17netif_carrier_offP10net_device");

  --*
  -- *	netif_dormant_on - mark device as dormant.
  -- *	@dev: network device
  -- *
  -- * Mark device as dormant (as per RFC2863).
  -- *
  -- * The dormant state indicates that the relevant interface is not
  -- * actually in a condition to pass packets (i.e., it is not 'up') but is
  -- * in a "pending" state, waiting for some external event.  For "on-
  -- * demand" interfaces, this new state identifies the situation where the
  -- * interface is waiting for events to place it in the up state.
  -- *
  --  

   procedure netif_dormant_on (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2712
   pragma Import (CPP, netif_dormant_on, "_ZL16netif_dormant_onP10net_device");

  --*
  -- *	netif_dormant_off - set device as not dormant.
  -- *	@dev: network device
  -- *
  -- * Device is not in dormant state.
  --  

   procedure netif_dormant_off (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2724
   pragma Import (CPP, netif_dormant_off, "_ZL17netif_dormant_offP10net_device");

  --*
  -- *	netif_dormant - test if carrier present
  -- *	@dev: network device
  -- *
  -- * Check if carrier is present on device
  --  

   function netif_dormant (dev : access constant net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2736
   pragma Import (CPP, netif_dormant, "_ZL13netif_dormantPK10net_device");

  --*
  -- *	netif_oper_up - test if device is operational
  -- *	@dev: network device
  -- *
  -- * Check if carrier is operational
  --  

   function netif_oper_up (dev : access constant net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2748
   pragma Import (CPP, netif_oper_up, "_ZL13netif_oper_upPK10net_device");

  -- backward compat  
  --*
  -- *	netif_device_present - is device available or removed
  -- *	@dev: network device
  -- *
  -- * Check if device has not been removed from system.
  --  

   function netif_device_present (dev : access net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2760
   pragma Import (CPP, netif_device_present, "_ZL20netif_device_presentP10net_device");

   procedure netif_device_detach (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2765
   pragma Import (CPP, netif_device_detach, "_Z19netif_device_detachP10net_device");

   procedure netif_device_attach (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2767
   pragma Import (CPP, netif_device_attach, "_Z19netif_device_attachP10net_device");

  -- * Network interface message level settings
  --  

   function netif_msg_init (debug_value : int; default_msg_enable_bits : int) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2807
   pragma Import (CPP, netif_msg_init, "_ZL14netif_msg_initii");

  -- use default  
  -- no output  
  -- set low N bits  
   --  skipped func __netif_tx_lock

   --  skipped func __netif_tx_lock_bh

   --  skipped func __netif_tx_trylock

   --  skipped func __netif_tx_unlock

   --  skipped func __netif_tx_unlock_bh

   procedure txq_trans_update (txq : access netdev_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2850
   pragma Import (CPP, txq_trans_update, "_ZL16txq_trans_updateP12netdev_queue");

  --*
  -- *	netif_tx_lock - grab network device transmit lock
  -- *	@dev: network device
  -- *
  -- * Get network device transmit lock
  --  

   procedure netif_tx_lock (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2862
   pragma Import (CPP, netif_tx_lock, "_ZL13netif_tx_lockP10net_device");

  -- We are the only thread of execution doing a
  --		 * freeze, but we have to grab the _xmit_lock in
  --		 * order to synchronize with threads which are in
  --		 * the ->hard_start_xmit() handler and already
  --		 * checked the frozen bit.
  --		  

   procedure netif_tx_lock_bh (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2884
   pragma Import (CPP, netif_tx_lock_bh, "_ZL16netif_tx_lock_bhP10net_device");

   procedure netif_tx_unlock (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2890
   pragma Import (CPP, netif_tx_unlock, "_ZL15netif_tx_unlockP10net_device");

  -- No need to grab the _xmit_lock here.  If the
  --		 * queue is not stopped for another reason, we
  --		 * force a schedule.
  --		  

   procedure netif_tx_unlock_bh (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2907
   pragma Import (CPP, netif_tx_unlock_bh, "_ZL18netif_tx_unlock_bhP10net_device");

   procedure netif_tx_disable (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2930
   pragma Import (CPP, netif_tx_disable, "_ZL16netif_tx_disableP10net_device");

   procedure netif_addr_lock (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2947
   pragma Import (CPP, netif_addr_lock, "_ZL15netif_addr_lockP10net_device");

   procedure netif_addr_lock_nested (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2952
   pragma Import (CPP, netif_addr_lock_nested, "_ZL22netif_addr_lock_nestedP10net_device");

   procedure netif_addr_lock_bh (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2962
   pragma Import (CPP, netif_addr_lock_bh, "_ZL18netif_addr_lock_bhP10net_device");

   procedure netif_addr_unlock (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2967
   pragma Import (CPP, netif_addr_unlock, "_ZL17netif_addr_unlockP10net_device");

   procedure netif_addr_unlock_bh (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2972
   pragma Import (CPP, netif_addr_unlock_bh, "_ZL20netif_addr_unlock_bhP10net_device");

  -- * dev_addrs walker. Should be used only for read access. Call with
  -- * rcu_read_lock held.
  --  

  -- These functions live elsewhere (drivers/net/net_init.c, but related)  
   procedure ether_setup (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2986
   pragma Import (CPP, ether_setup, "_Z11ether_setupP10net_device");

  -- Support for loadable net-drivers  
   function alloc_netdev_mqs
     (sizeof_priv : int;
      name : Interfaces.C.Strings.chars_ptr;
      setup : access procedure (arg1 : access net_device);
      txqs : unsigned;
      rxqs : unsigned) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2989
   pragma Import (CPP, alloc_netdev_mqs, "_Z16alloc_netdev_mqsiPKcPFvP10net_deviceEjj");

   function register_netdev (dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2998
   pragma Import (CPP, register_netdev, "_Z15register_netdevP10net_device");

   procedure unregister_netdev (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:2999
   pragma Import (CPP, unregister_netdev, "_Z17unregister_netdevP10net_device");

  -- General hardware address lists handling functions  
   --  skipped func __hw_addr_sync

   --  skipped func __hw_addr_unsync

   --  skipped func __hw_addr_sync_dev

   --  skipped func __hw_addr_unsync_dev

   --  skipped func __hw_addr_init

  -- Functions used for device addresses handling  
   function dev_addr_add
     (dev : access net_device;
      addr : access unsigned_char;
      addr_type : unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3018
   pragma Import (CPP, dev_addr_add, "_Z12dev_addr_addP10net_devicePKhh");

   function dev_addr_del
     (dev : access net_device;
      addr : access unsigned_char;
      addr_type : unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3020
   pragma Import (CPP, dev_addr_del, "_Z12dev_addr_delP10net_devicePKhh");

   procedure dev_addr_flush (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3022
   pragma Import (CPP, dev_addr_flush, "_Z14dev_addr_flushP10net_device");

   function dev_addr_init (dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3023
   pragma Import (CPP, dev_addr_init, "_Z13dev_addr_initP10net_device");

  -- Functions used for unicast addresses handling  
   function dev_uc_add (dev : access net_device; addr : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3026
   pragma Import (CPP, dev_uc_add, "_Z10dev_uc_addP10net_devicePKh");

   function dev_uc_add_excl (dev : access net_device; addr : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3027
   pragma Import (CPP, dev_uc_add_excl, "_Z15dev_uc_add_exclP10net_devicePKh");

   function dev_uc_del (dev : access net_device; addr : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3028
   pragma Import (CPP, dev_uc_del, "_Z10dev_uc_delP10net_devicePKh");

   function dev_uc_sync (to : access net_device; from : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3029
   pragma Import (CPP, dev_uc_sync, "_Z11dev_uc_syncP10net_deviceS0_");

   function dev_uc_sync_multiple (to : access net_device; from : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3030
   pragma Import (CPP, dev_uc_sync_multiple, "_Z20dev_uc_sync_multipleP10net_deviceS0_");

   procedure dev_uc_unsync (to : access net_device; from : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3031
   pragma Import (CPP, dev_uc_unsync, "_Z13dev_uc_unsyncP10net_deviceS0_");

   procedure dev_uc_flush (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3032
   pragma Import (CPP, dev_uc_flush, "_Z12dev_uc_flushP10net_device");

   procedure dev_uc_init (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3033
   pragma Import (CPP, dev_uc_init, "_Z11dev_uc_initP10net_device");

  --*
  -- *  __dev_uc_sync - Synchonize device's unicast list
  -- *  @dev:  device to sync
  -- *  @sync: function to call if address should be added
  -- *  @unsync: function to call if address should be removed
  -- *
  -- *  Add newly added addresses to the interface, and release
  -- *  addresses that have been deleted.
  -- * 

   --  skipped func __dev_uc_sync

  --*
  -- *  __dev_uc_unsync - Remove synchonized addresses from device
  -- *  @dev:  device to sync
  -- *  @unsync: function to call if address should be removed
  -- *
  -- *  Remove all addresses that were added to the device by dev_uc_sync().
  -- * 

   --  skipped func __dev_uc_unsync

  -- Functions used for multicast addresses handling  
   function dev_mc_add (dev : access net_device; addr : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3068
   pragma Import (CPP, dev_mc_add, "_Z10dev_mc_addP10net_devicePKh");

   function dev_mc_add_global (dev : access net_device; addr : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3069
   pragma Import (CPP, dev_mc_add_global, "_Z17dev_mc_add_globalP10net_devicePKh");

   function dev_mc_add_excl (dev : access net_device; addr : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3070
   pragma Import (CPP, dev_mc_add_excl, "_Z15dev_mc_add_exclP10net_devicePKh");

   function dev_mc_del (dev : access net_device; addr : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3071
   pragma Import (CPP, dev_mc_del, "_Z10dev_mc_delP10net_devicePKh");

   function dev_mc_del_global (dev : access net_device; addr : access unsigned_char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3072
   pragma Import (CPP, dev_mc_del_global, "_Z17dev_mc_del_globalP10net_devicePKh");

   function dev_mc_sync (to : access net_device; from : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3073
   pragma Import (CPP, dev_mc_sync, "_Z11dev_mc_syncP10net_deviceS0_");

   function dev_mc_sync_multiple (to : access net_device; from : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3074
   pragma Import (CPP, dev_mc_sync_multiple, "_Z20dev_mc_sync_multipleP10net_deviceS0_");

   procedure dev_mc_unsync (to : access net_device; from : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3075
   pragma Import (CPP, dev_mc_unsync, "_Z13dev_mc_unsyncP10net_deviceS0_");

   procedure dev_mc_flush (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3076
   pragma Import (CPP, dev_mc_flush, "_Z12dev_mc_flushP10net_device");

   procedure dev_mc_init (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3077
   pragma Import (CPP, dev_mc_init, "_Z11dev_mc_initP10net_device");

  --*
  -- *  __dev_mc_sync - Synchonize device's multicast list
  -- *  @dev:  device to sync
  -- *  @sync: function to call if address should be added
  -- *  @unsync: function to call if address should be removed
  -- *
  -- *  Add newly added addresses to the interface, and release
  -- *  addresses that have been deleted.
  -- * 

   --  skipped func __dev_mc_sync

  --*
  -- *  __dev_mc_unsync - Remove synchonized addresses from device
  -- *  @dev:  device to sync
  -- *  @unsync: function to call if address should be removed
  -- *
  -- *  Remove all addresses that were added to the device by dev_mc_sync().
  -- * 

   --  skipped func __dev_mc_unsync

  -- Functions used for secondary unicast and multicast support  
   procedure dev_set_rx_mode (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3112
   pragma Import (CPP, dev_set_rx_mode, "_Z15dev_set_rx_modeP10net_device");

   --  skipped func __dev_set_rx_mode

   function dev_set_promiscuity (dev : access net_device; inc : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3114
   pragma Import (CPP, dev_set_promiscuity, "_Z19dev_set_promiscuityP10net_devicei");

   function dev_set_allmulti (dev : access net_device; inc : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3115
   pragma Import (CPP, dev_set_allmulti, "_Z16dev_set_allmultiP10net_devicei");

   procedure netdev_state_change (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3116
   pragma Import (CPP, netdev_state_change, "_Z19netdev_state_changeP10net_device");

   procedure netdev_notify_peers (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3117
   pragma Import (CPP, netdev_notify_peers, "_Z19netdev_notify_peersP10net_device");

   procedure netdev_features_change (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3118
   pragma Import (CPP, netdev_features_change, "_Z22netdev_features_changeP10net_device");

  -- Load a device via the kmod  
   procedure dev_load (the_net : access net_net_namespace_h.net; name : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3120
   pragma Import (CPP, dev_load, "_Z8dev_loadP3netPKc");

   function dev_get_stats (dev : access net_device; storage : access uapi_linux_if_link_h.rtnl_link_stats64) return access uapi_linux_if_link_h.rtnl_link_stats64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3121
   pragma Import (CPP, dev_get_stats, "_Z13dev_get_statsP10net_deviceP17rtnl_link_stats64");

   procedure netdev_stats_to_stats64 (stats64 : access uapi_linux_if_link_h.rtnl_link_stats64; netdev_stats : access constant net_device_stats);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3123
   pragma Import (CPP, netdev_stats_to_stats64, "_Z23netdev_stats_to_stats64P17rtnl_link_stats64PK16net_device_stats");

   netdev_max_backlog : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3126
   pragma Import (C, netdev_max_backlog, "netdev_max_backlog");

   netdev_tstamp_prequeue : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3127
   pragma Import (C, netdev_tstamp_prequeue, "netdev_tstamp_prequeue");

   weight_p : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3128
   pragma Import (C, weight_p, "weight_p");

   bpf_jit_enable : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3129
   pragma Import (C, bpf_jit_enable, "bpf_jit_enable");

   function netdev_has_upper_dev (dev : access net_device; upper_dev : access net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3131
   pragma Import (CPP, netdev_has_upper_dev, "_Z20netdev_has_upper_devP10net_deviceS0_");

   function netdev_upper_get_next_dev_rcu (dev : access net_device; iter : System.Address) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3132
   pragma Import (CPP, netdev_upper_get_next_dev_rcu, "_Z29netdev_upper_get_next_dev_rcuP10net_devicePP9list_head");

   function netdev_all_upper_get_next_dev_rcu (dev : access net_device; iter : System.Address) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3134
   pragma Import (CPP, netdev_all_upper_get_next_dev_rcu, "_Z33netdev_all_upper_get_next_dev_rcuP10net_devicePP9list_head");

  -- iterate through upper list, must be called under RCU read lock  
  -- iterate through upper list, must be called under RCU read lock  
   function netdev_lower_get_next_private (dev : access net_device; iter : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3151
   pragma Import (CPP, netdev_lower_get_next_private, "_Z29netdev_lower_get_next_privateP10net_devicePP9list_head");

   function netdev_lower_get_next_private_rcu (dev : access net_device; iter : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3153
   pragma Import (CPP, netdev_lower_get_next_private_rcu, "_Z33netdev_lower_get_next_private_rcuP10net_devicePP9list_head");

   function netdev_lower_get_next (dev : access net_device; iter : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3168
   pragma Import (CPP, netdev_lower_get_next, "_Z21netdev_lower_get_nextP10net_devicePP9list_head");

   function netdev_adjacent_get_private (adj_list : access linux_types_h.list_head) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3176
   pragma Import (CPP, netdev_adjacent_get_private, "_Z27netdev_adjacent_get_privateP9list_head");

   function netdev_lower_get_first_private_rcu (dev : access net_device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3177
   pragma Import (CPP, netdev_lower_get_first_private_rcu, "_Z34netdev_lower_get_first_private_rcuP10net_device");

   function netdev_master_upper_dev_get (dev : access net_device) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3178
   pragma Import (CPP, netdev_master_upper_dev_get, "_Z27netdev_master_upper_dev_getP10net_device");

   function netdev_master_upper_dev_get_rcu (dev : access net_device) return access net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3179
   pragma Import (CPP, netdev_master_upper_dev_get_rcu, "_Z31netdev_master_upper_dev_get_rcuP10net_device");

   function netdev_upper_dev_link (dev : access net_device; upper_dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3180
   pragma Import (CPP, netdev_upper_dev_link, "_Z21netdev_upper_dev_linkP10net_deviceS0_");

   function netdev_master_upper_dev_link (dev : access net_device; upper_dev : access net_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3181
   pragma Import (CPP, netdev_master_upper_dev_link, "_Z28netdev_master_upper_dev_linkP10net_deviceS0_");

   function netdev_master_upper_dev_link_private
     (dev : access net_device;
      upper_dev : access net_device;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3183
   pragma Import (CPP, netdev_master_upper_dev_link_private, "_Z36netdev_master_upper_dev_link_privateP10net_deviceS0_Pv");

   procedure netdev_upper_dev_unlink (dev : access net_device; upper_dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3186
   pragma Import (CPP, netdev_upper_dev_unlink, "_Z23netdev_upper_dev_unlinkP10net_deviceS0_");

   procedure netdev_adjacent_rename_links (dev : access net_device; oldname : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3188
   pragma Import (CPP, netdev_adjacent_rename_links, "_Z28netdev_adjacent_rename_linksP10net_devicePc");

   function netdev_lower_dev_get_private (dev : access net_device; lower_dev : access net_device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3189
   pragma Import (CPP, netdev_lower_dev_get_private, "_Z28netdev_lower_dev_get_privateP10net_deviceS0_");

   function dev_get_nest_level (dev : access net_device; type_check : access function (arg1 : access net_device) return Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3191
   pragma Import (CPP, dev_get_nest_level, "_Z18dev_get_nest_levelP10net_devicePFbS0_E");

   function skb_checksum_help (skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3193
   pragma Import (CPP, skb_checksum_help, "_Z17skb_checksum_helpP7sk_buff");

   --  skipped func __skb_gso_segment

   function skb_mac_gso_segment (skb : access linux_skbuff_h.sk_buff; features : linux_netdev_features_h.netdev_features_t) return access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3196
   pragma Import (CPP, skb_mac_gso_segment, "_Z19skb_mac_gso_segmentP7sk_buffy");

   function skb_gso_segment (skb : access linux_skbuff_h.sk_buff; features : linux_netdev_features_h.netdev_features_t) return access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3200
   pragma Import (CPP, skb_gso_segment, "_ZL15skb_gso_segmentP7sk_buffy");

   function skb_network_protocol (skb : access linux_skbuff_h.sk_buff; depth : access int) return uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3204
   pragma Import (CPP, skb_network_protocol, "_Z20skb_network_protocolP7sk_buffPi");

   function can_checksum_protocol (features : linux_netdev_features_h.netdev_features_t; protocol : uapi_linux_types_h.uu_be16) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3206
   pragma Import (CPP, can_checksum_protocol, "_ZL21can_checksum_protocolyt");

   procedure netdev_rx_csum_fault (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3219
   pragma Import (CPP, netdev_rx_csum_fault, "_Z20netdev_rx_csum_faultP10net_device");

  -- rx skb timestamps  
   procedure net_enable_timestamp;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3226
   pragma Import (CPP, net_enable_timestamp, "_Z20net_enable_timestampv");

   procedure net_disable_timestamp;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3227
   pragma Import (CPP, net_disable_timestamp, "_Z21net_disable_timestampv");

   function dev_proc_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3230
   pragma Import (CPP, dev_proc_init, "_Z13dev_proc_initv");

   function netdev_class_create_file_ns (class_attr : access linux_device_h.class_attribute; ns : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3235
   pragma Import (CPP, netdev_class_create_file_ns, "_Z27netdev_class_create_file_nsP15class_attributePKv");

   procedure netdev_class_remove_file_ns (class_attr : access linux_device_h.class_attribute; ns : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3237
   pragma Import (CPP, netdev_class_remove_file_ns, "_Z27netdev_class_remove_file_nsP15class_attributePKv");

   function netdev_class_create_file (class_attr : access linux_device_h.class_attribute) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3240
   pragma Import (CPP, netdev_class_create_file, "_ZL24netdev_class_create_fileP15class_attribute");

   procedure netdev_class_remove_file (class_attr : access linux_device_h.class_attribute);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3245
   pragma Import (CPP, netdev_class_remove_file, "_ZL24netdev_class_remove_fileP15class_attribute");

   net_ns_type_operations : aliased linux_kobject_ns_h.kobj_ns_type_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3250
   pragma Import (C, net_ns_type_operations, "net_ns_type_operations");

   function netdev_drivername (dev : access constant net_device) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3252
   pragma Import (CPP, netdev_drivername, "_Z17netdev_drivernamePK10net_device");

   procedure linkwatch_run_queue;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3254
   pragma Import (CPP, linkwatch_run_queue, "_Z19linkwatch_run_queuev");

   function netdev_intersect_features (f1 : linux_netdev_features_h.netdev_features_t; f2 : linux_netdev_features_h.netdev_features_t) return linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3256
   pragma Import (CPP, netdev_intersect_features, "_ZL25netdev_intersect_featuresyy");

   function netdev_get_wanted_features (dev : access net_device) return linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3270
   pragma Import (CPP, netdev_get_wanted_features, "_ZL26netdev_get_wanted_featuresP10net_device");

   function netdev_increment_features
     (c_all : linux_netdev_features_h.netdev_features_t;
      one : linux_netdev_features_h.netdev_features_t;
      mask : linux_netdev_features_h.netdev_features_t) return linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3275
   pragma Import (CPP, netdev_increment_features, "_Z25netdev_increment_featuresyyy");

  -- Allow TSO being used on stacked device :
  -- * Performing the GSO segmentation before last device
  -- * is a performance improvement.
  --  

   function netdev_add_tso_features (features : linux_netdev_features_h.netdev_features_t; mask : linux_netdev_features_h.netdev_features_t) return linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3282
   pragma Import (CPP, netdev_add_tso_features, "_ZL23netdev_add_tso_featuresyy");

   --  skipped func __netdev_update_features

   procedure netdev_update_features (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3289
   pragma Import (CPP, netdev_update_features, "_Z22netdev_update_featuresP10net_device");

   procedure netdev_change_features (dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3290
   pragma Import (CPP, netdev_change_features, "_Z22netdev_change_featuresP10net_device");

   procedure netif_stacked_transfer_operstate (rootdev : access constant net_device; dev : access net_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3292
   pragma Import (CPP, netif_stacked_transfer_operstate, "_Z32netif_stacked_transfer_operstatePK10net_devicePS_");

   function netif_skb_features (skb : access linux_skbuff_h.sk_buff) return linux_netdev_features_h.netdev_features_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3295
   pragma Import (CPP, netif_skb_features, "_Z18netif_skb_featuresP7sk_buff");

   function net_gso_ok (features : linux_netdev_features_h.netdev_features_t; gso_type : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3297
   pragma Import (CPP, net_gso_ok, "_ZL10net_gso_okyi");

  -- check flags correspondence  
   function skb_gso_ok (skb : access linux_skbuff_h.sk_buff; features : linux_netdev_features_h.netdev_features_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3319
   pragma Import (CPP, skb_gso_ok, "_ZL10skb_gso_okP7sk_buffy");

   function netif_needs_gso (skb : access linux_skbuff_h.sk_buff; features : linux_netdev_features_h.netdev_features_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3325
   pragma Import (CPP, netif_needs_gso, "_ZL15netif_needs_gsoP7sk_buffy");

   procedure netif_set_gso_max_size (dev : access net_device; size : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3333
   pragma Import (CPP, netif_set_gso_max_size, "_ZL22netif_set_gso_max_sizeP10net_devicej");

   procedure skb_gso_error_unwind
     (skb : access linux_skbuff_h.sk_buff;
      protocol : uapi_linux_types_h.uu_be16;
      pulled_hlen : int;
      mac_offset : asm_generic_int_ll64_h.u16;
      mac_len : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3339
   pragma Import (CPP, skb_gso_error_unwind, "_ZL20skb_gso_error_unwindP7sk_bufftiti");

   function netif_is_macvlan (dev : access net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3352
   pragma Import (CPP, netif_is_macvlan, "_ZL16netif_is_macvlanP10net_device");

   function netif_is_bond_master (dev : access net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3357
   pragma Import (CPP, netif_is_bond_master, "_ZL20netif_is_bond_masterP10net_device");

   function netif_is_bond_slave (dev : access net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3362
   pragma Import (CPP, netif_is_bond_slave, "_ZL19netif_is_bond_slaveP10net_device");

   function netif_supports_nofcs (dev : access net_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3367
   pragma Import (CPP, netif_supports_nofcs, "_ZL20netif_supports_nofcsP10net_device");

   loopback_net_ops : aliased net_net_namespace_h.pernet_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3372
   pragma Import (C, loopback_net_ops, "loopback_net_ops");

  -- Logging, debugging and troubleshooting/diagnostic helpers.  
  -- netdev_printk helpers, similar to dev_printk  
   function netdev_name (dev : access constant net_device) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3378
   pragma Import (CPP, netdev_name, "_ZL11netdev_namePK10net_device");

   function netdev_printk
     (level : Interfaces.C.Strings.chars_ptr;
      dev : access constant net_device;
      format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3386
   pragma Import (CPP, netdev_printk, "_Z13netdev_printkPKcPK10net_deviceS0_z");

   function netdev_emerg (dev : access constant net_device; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3389
   pragma Import (CPP, netdev_emerg, "_Z12netdev_emergPK10net_devicePKcz");

   function netdev_alert (dev : access constant net_device; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3391
   pragma Import (CPP, netdev_alert, "_Z12netdev_alertPK10net_devicePKcz");

   function netdev_crit (dev : access constant net_device; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3393
   pragma Import (CPP, netdev_crit, "_Z11netdev_critPK10net_devicePKcz");

   function netdev_err (dev : access constant net_device; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3395
   pragma Import (CPP, netdev_err, "_Z10netdev_errPK10net_devicePKcz");

   function netdev_warn (dev : access constant net_device; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3397
   pragma Import (CPP, netdev_warn, "_Z11netdev_warnPK10net_devicePKcz");

   function netdev_notice (dev : access constant net_device; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3399
   pragma Import (CPP, netdev_notice, "_Z13netdev_noticePK10net_devicePKcz");

   function netdev_info (dev : access constant net_device; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdevice.h:3401
   pragma Import (CPP, netdev_info, "_Z11netdev_infoPK10net_devicePKcz");

  -- * netdev_WARN() acts like dev_printk(), but with the key difference
  -- * of using a WARN/WARN_ON to get the message out, including the
  -- * file/line information and a backtrace.
  --  

  -- netif printk helpers, similar to netdev_printk  
  -- *	The list of packet types we will receive (as opposed to discard)
  -- *	and the routines to invoke.
  -- *
  -- *	Why 16. Because with 16 the only overlap we get on a hash of the
  -- *	low nibble of the protocol value is RARP/SNAP/X.25.
  -- *
  -- *      NOTE:  That is no longer true with the addition of VLAN tags.  Not
  -- *             sure which should go first, but I bet it won't make much
  -- *             difference if we are running VLANs.  The good news is that
  -- *             this protocol won't be in the list unless compiled in, so
  -- *             the average user (w/out VLANs) will not be adversely affected.
  -- *             --BLG
  -- *
  -- *		0800	IP
  -- *		8100    802.1Q VLAN
  -- *		0001	802.3
  -- *		0002	AX.25
  -- *		0004	802.2
  -- *		8035	RARP
  -- *		0005	SNAP
  -- *		0805	X.25
  -- *		0806	ARP
  -- *		8137	IPX
  -- *		0009	Localtalk
  -- *		86DD	IPv6
  --  

end linux_netdevice_h;

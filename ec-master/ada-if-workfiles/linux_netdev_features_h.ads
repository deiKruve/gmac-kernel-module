pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package linux_netdev_features_h is

   --  unsupported macro: NETIF_F_FCOE_CRC __NETIF_F(FCOE_CRC)
   --  unsupported macro: NETIF_F_FCOE_MTU __NETIF_F(FCOE_MTU)
   --  unsupported macro: NETIF_F_FRAGLIST __NETIF_F(FRAGLIST)
   --  unsupported macro: NETIF_F_FSO __NETIF_F(FSO)
   --  unsupported macro: NETIF_F_GRO __NETIF_F(GRO)
   --  unsupported macro: NETIF_F_GSO __NETIF_F(GSO)
   --  unsupported macro: NETIF_F_GSO_ROBUST __NETIF_F(GSO_ROBUST)
   --  unsupported macro: NETIF_F_HIGHDMA __NETIF_F(HIGHDMA)
   --  unsupported macro: NETIF_F_HW_CSUM __NETIF_F(HW_CSUM)
   --  unsupported macro: NETIF_F_HW_VLAN_CTAG_FILTER __NETIF_F(HW_VLAN_CTAG_FILTER)
   --  unsupported macro: NETIF_F_HW_VLAN_CTAG_RX __NETIF_F(HW_VLAN_CTAG_RX)
   --  unsupported macro: NETIF_F_HW_VLAN_CTAG_TX __NETIF_F(HW_VLAN_CTAG_TX)
   --  unsupported macro: NETIF_F_IP_CSUM __NETIF_F(IP_CSUM)
   --  unsupported macro: NETIF_F_IPV6_CSUM __NETIF_F(IPV6_CSUM)
   --  unsupported macro: NETIF_F_LLTX __NETIF_F(LLTX)
   --  unsupported macro: NETIF_F_LOOPBACK __NETIF_F(LOOPBACK)
   --  unsupported macro: NETIF_F_LRO __NETIF_F(LRO)
   --  unsupported macro: NETIF_F_NETNS_LOCAL __NETIF_F(NETNS_LOCAL)
   --  unsupported macro: NETIF_F_NOCACHE_COPY __NETIF_F(NOCACHE_COPY)
   --  unsupported macro: NETIF_F_NTUPLE __NETIF_F(NTUPLE)
   --  unsupported macro: NETIF_F_RXCSUM __NETIF_F(RXCSUM)
   --  unsupported macro: NETIF_F_RXHASH __NETIF_F(RXHASH)
   --  unsupported macro: NETIF_F_SCTP_CSUM __NETIF_F(SCTP_CSUM)
   --  unsupported macro: NETIF_F_SG __NETIF_F(SG)
   --  unsupported macro: NETIF_F_TSO6 __NETIF_F(TSO6)
   --  unsupported macro: NETIF_F_TSO_ECN __NETIF_F(TSO_ECN)
   --  unsupported macro: NETIF_F_TSO __NETIF_F(TSO)
   --  unsupported macro: NETIF_F_UFO __NETIF_F(UFO)
   --  unsupported macro: NETIF_F_VLAN_CHALLENGED __NETIF_F(VLAN_CHALLENGED)
   --  unsupported macro: NETIF_F_RXFCS __NETIF_F(RXFCS)
   --  unsupported macro: NETIF_F_RXALL __NETIF_F(RXALL)
   --  unsupported macro: NETIF_F_GSO_GRE __NETIF_F(GSO_GRE)
   --  unsupported macro: NETIF_F_GSO_GRE_CSUM __NETIF_F(GSO_GRE_CSUM)
   --  unsupported macro: NETIF_F_GSO_IPIP __NETIF_F(GSO_IPIP)
   --  unsupported macro: NETIF_F_GSO_SIT __NETIF_F(GSO_SIT)
   --  unsupported macro: NETIF_F_GSO_UDP_TUNNEL __NETIF_F(GSO_UDP_TUNNEL)
   --  unsupported macro: NETIF_F_GSO_UDP_TUNNEL_CSUM __NETIF_F(GSO_UDP_TUNNEL_CSUM)
   --  unsupported macro: NETIF_F_GSO_MPLS __NETIF_F(GSO_MPLS)
   --  unsupported macro: NETIF_F_HW_VLAN_STAG_FILTER __NETIF_F(HW_VLAN_STAG_FILTER)
   --  unsupported macro: NETIF_F_HW_VLAN_STAG_RX __NETIF_F(HW_VLAN_STAG_RX)
   --  unsupported macro: NETIF_F_HW_VLAN_STAG_TX __NETIF_F(HW_VLAN_STAG_TX)
   --  unsupported macro: NETIF_F_HW_L2FW_DOFFLOAD __NETIF_F(HW_L2FW_DOFFLOAD)
   --  unsupported macro: NETIF_F_BUSY_POLL __NETIF_F(BUSY_POLL)
   --  unsupported macro: NETIF_F_NEVER_CHANGE (NETIF_F_VLAN_CHALLENGED | NETIF_F_LLTX | NETIF_F_NETNS_LOCAL)
   --  unsupported macro: NETIF_F_ETHTOOL_BITS ((__NETIF_F_BIT(NETDEV_FEATURE_COUNT - 1) | (__NETIF_F_BIT(NETDEV_FEATURE_COUNT - 1) - 1)) & ~NETIF_F_NEVER_CHANGE)
   --  unsupported macro: NETIF_F_GSO_MASK (__NETIF_F_BIT(NETIF_F_GSO_LAST + 1) - __NETIF_F_BIT(NETIF_F_GSO_SHIFT))
   --  unsupported macro: NETIF_F_GSO_SOFTWARE (NETIF_F_TSO | NETIF_F_TSO_ECN | NETIF_F_TSO6 | NETIF_F_UFO)
   --  unsupported macro: NETIF_F_GEN_CSUM NETIF_F_HW_CSUM
   --  unsupported macro: NETIF_F_V4_CSUM (NETIF_F_GEN_CSUM | NETIF_F_IP_CSUM)
   --  unsupported macro: NETIF_F_V6_CSUM (NETIF_F_GEN_CSUM | NETIF_F_IPV6_CSUM)
   --  unsupported macro: NETIF_F_ALL_CSUM (NETIF_F_V4_CSUM | NETIF_F_V6_CSUM)
   --  unsupported macro: NETIF_F_ALL_TSO (NETIF_F_TSO | NETIF_F_TSO6 | NETIF_F_TSO_ECN)
   --  unsupported macro: NETIF_F_ALL_FCOE (NETIF_F_FCOE_CRC | NETIF_F_FCOE_MTU | NETIF_F_FSO)
   --  unsupported macro: NETIF_F_ONE_FOR_ALL (NETIF_F_GSO_SOFTWARE | NETIF_F_GSO_ROBUST | NETIF_F_SG | NETIF_F_HIGHDMA | NETIF_F_FRAGLIST | NETIF_F_VLAN_CHALLENGED)
   --  unsupported macro: NETIF_F_ALL_FOR_ALL (NETIF_F_NOCACHE_COPY | NETIF_F_FSO)
   --  unsupported macro: NETIF_F_SOFT_FEATURES (NETIF_F_GSO | NETIF_F_GRO)
   --  unsupported macro: NETIF_F_VLAN_FEATURES (NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_STAG_FILTER | NETIF_F_HW_VLAN_STAG_RX | NETIF_F_HW_VLAN_STAG_TX)
  -- * Network device features.
  -- *
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public License
  -- * as published by the Free Software Foundation; either version
  -- * 2 of the License, or (at your option) any later version.
  --  

   subtype netdev_features_t is asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netdev_features.h:15

  -- Scatter/gather IO.  
  -- Can checksum TCP/UDP over IPv4.  
  -- Can checksum all the packets.  
  -- Can checksum TCP/UDP over IPV6  
  -- Can DMA to high memory.  
  -- Scatter/gather IO.  
  -- Transmit VLAN CTAG HW acceleration  
  -- Receive VLAN CTAG HW acceleration  
  -- Receive filtering on VLAN CTAGs  
  -- Device cannot handle VLAN packets  
  -- Enable software GSO.  
  -- LockLess TX - deprecated. Please  
  -- do not use LLTX in new drivers  
  -- Does not change network namespaces  
  -- Generic receive offload  
  -- large receive offload  
  -- 
  -- keep the order of SKB_GSO_* bits  
  -- ... TCPv4 segmentation  
  -- ... UDPv4 fragmentation  
  -- ... ->SKB_GSO_DODGY  
  -- ... TCP ECN support  
  -- ... TCPv6 segmentation  
  -- ... FCoE segmentation  
  -- ... GRE with TSO  
  -- ... GRE with csum with TSO  
  -- ... IPIP tunnel with TSO  
  -- ... SIT tunnel with TSO  
  -- ... UDP TUNNEL with TSO  
  -- ... UDP TUNNEL with TSO & CSUM  
  -- ... MPLS segmentation  
  -- 
  -- last bit, see GSO_MASK  
  -- FCoE CRC32  
  -- SCTP checksum offload  
  -- Supports max FCoE MTU, 2158 bytes 
  -- N-tuple filters supported  
  -- Receive hashing offload  
  -- Receive checksumming offload  
  -- Use no-cache copyfromuser  
  -- Enable loopback  
  -- Append FCS to skb pkt data  
  -- Receive errored frames too  
  -- Transmit VLAN STAG HW acceleration  
  -- Receive VLAN STAG HW acceleration  
  -- Receive filtering on VLAN STAGs  
  -- Allow L2 Forwarding in Hardware  
  -- Busy poll  
  --	 * Add your fresh new feature above and remember to update
  --	 * netdev_features_strings[] in net/core/ethtool.c and maybe
  --	 * some feature mask #defines below. Please also describe it
  --	 * in Documentation/networking/netdev-features.txt.
  --	  

  -- 
  -- copy'n'paste compression ;)  
  -- Features valid for ethtool to change  
  -- = all defined minus driver/device-class-related  
  -- remember that ((t)1 << t_BITS) is undefined in C99  
  -- Segmentation offload feature mask  
  -- List of features with software fallbacks.  
  -- * If one device supports one of these features, then enable them
  -- * for all in netdev_increment_features.
  --  

  -- * If one device doesn't support one of these features, then disable it
  -- * for all in netdev_increment_features.
  --  

  -- changeable features with no special hardware requirements  
end linux_netdev_features_h;

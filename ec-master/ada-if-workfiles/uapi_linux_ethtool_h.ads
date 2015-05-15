pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;
with uapi_linux_types_h;
with uapi_linux_if_ether_h;

package uapi_linux_ethtool_h is

   --  unsupported macro: ETH_MDIO_SUPPORTS_C22 1
   --  unsupported macro: ETH_MDIO_SUPPORTS_C45 2
   --  unsupported macro: ETHTOOL_FWVERS_LEN 32
   --  unsupported macro: ETHTOOL_BUSINFO_LEN 32
   --  unsupported macro: SOPASS_MAX 6
   --  unsupported macro: ETH_GSTRING_LEN 32
   --  unsupported macro: ETH_RX_NFC_IP4 1
   --  unsupported macro: ETH_RXFH_INDIR_NO_CHANGE 0xffffffff
   --  unsupported macro: ETHTOOL_RXNTUPLE_ACTION_DROP (-1)
   --  unsupported macro: ETHTOOL_RXNTUPLE_ACTION_CLEAR (-2)
   --  unsupported macro: ETHTOOL_FLASH_MAX_FILENAME 128
   --  unsupported macro: ETH_FW_DUMP_DISABLE 0
   --  unsupported macro: ETHTOOL_F_UNSUPPORTED (1 << ETHTOOL_F_UNSUPPORTED__BIT)
   --  unsupported macro: ETHTOOL_F_WISH (1 << ETHTOOL_F_WISH__BIT)
   --  unsupported macro: ETHTOOL_F_COMPAT (1 << ETHTOOL_F_COMPAT__BIT)
   --  unsupported macro: ETHTOOL_GSET 0x00000001
   --  unsupported macro: ETHTOOL_SSET 0x00000002
   --  unsupported macro: ETHTOOL_GDRVINFO 0x00000003
   --  unsupported macro: ETHTOOL_GREGS 0x00000004
   --  unsupported macro: ETHTOOL_GWOL 0x00000005
   --  unsupported macro: ETHTOOL_SWOL 0x00000006
   --  unsupported macro: ETHTOOL_GMSGLVL 0x00000007
   --  unsupported macro: ETHTOOL_SMSGLVL 0x00000008
   --  unsupported macro: ETHTOOL_NWAY_RST 0x00000009
   --  unsupported macro: ETHTOOL_GLINK 0x0000000a
   --  unsupported macro: ETHTOOL_GEEPROM 0x0000000b
   --  unsupported macro: ETHTOOL_SEEPROM 0x0000000c
   --  unsupported macro: ETHTOOL_GCOALESCE 0x0000000e
   --  unsupported macro: ETHTOOL_SCOALESCE 0x0000000f
   --  unsupported macro: ETHTOOL_GRINGPARAM 0x00000010
   --  unsupported macro: ETHTOOL_SRINGPARAM 0x00000011
   --  unsupported macro: ETHTOOL_GPAUSEPARAM 0x00000012
   --  unsupported macro: ETHTOOL_SPAUSEPARAM 0x00000013
   --  unsupported macro: ETHTOOL_GRXCSUM 0x00000014
   --  unsupported macro: ETHTOOL_SRXCSUM 0x00000015
   --  unsupported macro: ETHTOOL_GTXCSUM 0x00000016
   --  unsupported macro: ETHTOOL_STXCSUM 0x00000017
   --  unsupported macro: ETHTOOL_GSG 0x00000018
   --  unsupported macro: ETHTOOL_SSG 0x00000019
   --  unsupported macro: ETHTOOL_TEST 0x0000001a
   --  unsupported macro: ETHTOOL_GSTRINGS 0x0000001b
   --  unsupported macro: ETHTOOL_PHYS_ID 0x0000001c
   --  unsupported macro: ETHTOOL_GSTATS 0x0000001d
   --  unsupported macro: ETHTOOL_GTSO 0x0000001e
   --  unsupported macro: ETHTOOL_STSO 0x0000001f
   --  unsupported macro: ETHTOOL_GPERMADDR 0x00000020
   --  unsupported macro: ETHTOOL_GUFO 0x00000021
   --  unsupported macro: ETHTOOL_SUFO 0x00000022
   --  unsupported macro: ETHTOOL_GGSO 0x00000023
   --  unsupported macro: ETHTOOL_SGSO 0x00000024
   --  unsupported macro: ETHTOOL_GFLAGS 0x00000025
   --  unsupported macro: ETHTOOL_SFLAGS 0x00000026
   --  unsupported macro: ETHTOOL_GPFLAGS 0x00000027
   --  unsupported macro: ETHTOOL_SPFLAGS 0x00000028
   --  unsupported macro: ETHTOOL_GRXFH 0x00000029
   --  unsupported macro: ETHTOOL_SRXFH 0x0000002a
   --  unsupported macro: ETHTOOL_GGRO 0x0000002b
   --  unsupported macro: ETHTOOL_SGRO 0x0000002c
   --  unsupported macro: ETHTOOL_GRXRINGS 0x0000002d
   --  unsupported macro: ETHTOOL_GRXCLSRLCNT 0x0000002e
   --  unsupported macro: ETHTOOL_GRXCLSRULE 0x0000002f
   --  unsupported macro: ETHTOOL_GRXCLSRLALL 0x00000030
   --  unsupported macro: ETHTOOL_SRXCLSRLDEL 0x00000031
   --  unsupported macro: ETHTOOL_SRXCLSRLINS 0x00000032
   --  unsupported macro: ETHTOOL_FLASHDEV 0x00000033
   --  unsupported macro: ETHTOOL_RESET 0x00000034
   --  unsupported macro: ETHTOOL_SRXNTUPLE 0x00000035
   --  unsupported macro: ETHTOOL_GRXNTUPLE 0x00000036
   --  unsupported macro: ETHTOOL_GSSET_INFO 0x00000037
   --  unsupported macro: ETHTOOL_GRXFHINDIR 0x00000038
   --  unsupported macro: ETHTOOL_SRXFHINDIR 0x00000039
   --  unsupported macro: ETHTOOL_GFEATURES 0x0000003a
   --  unsupported macro: ETHTOOL_SFEATURES 0x0000003b
   --  unsupported macro: ETHTOOL_GCHANNELS 0x0000003c
   --  unsupported macro: ETHTOOL_SCHANNELS 0x0000003d
   --  unsupported macro: ETHTOOL_SET_DUMP 0x0000003e
   --  unsupported macro: ETHTOOL_GET_DUMP_FLAG 0x0000003f
   --  unsupported macro: ETHTOOL_GET_DUMP_DATA 0x00000040
   --  unsupported macro: ETHTOOL_GET_TS_INFO 0x00000041
   --  unsupported macro: ETHTOOL_GMODULEINFO 0x00000042
   --  unsupported macro: ETHTOOL_GMODULEEEPROM 0x00000043
   --  unsupported macro: ETHTOOL_GEEE 0x00000044
   --  unsupported macro: ETHTOOL_SEEE 0x00000045
   --  unsupported macro: ETHTOOL_GRSSH 0x00000046
   --  unsupported macro: ETHTOOL_SRSSH 0x00000047
   --  unsupported macro: SPARC_ETH_GSET ETHTOOL_GSET
   --  unsupported macro: SPARC_ETH_SSET ETHTOOL_SSET
   --  unsupported macro: SUPPORTED_10baseT_Half (1 << 0)
   --  unsupported macro: SUPPORTED_10baseT_Full (1 << 1)
   --  unsupported macro: SUPPORTED_100baseT_Half (1 << 2)
   --  unsupported macro: SUPPORTED_100baseT_Full (1 << 3)
   --  unsupported macro: SUPPORTED_1000baseT_Half (1 << 4)
   --  unsupported macro: SUPPORTED_1000baseT_Full (1 << 5)
   --  unsupported macro: SUPPORTED_Autoneg (1 << 6)
   --  unsupported macro: SUPPORTED_TP (1 << 7)
   --  unsupported macro: SUPPORTED_AUI (1 << 8)
   --  unsupported macro: SUPPORTED_MII (1 << 9)
   --  unsupported macro: SUPPORTED_FIBRE (1 << 10)
   --  unsupported macro: SUPPORTED_BNC (1 << 11)
   --  unsupported macro: SUPPORTED_10000baseT_Full (1 << 12)
   --  unsupported macro: SUPPORTED_Pause (1 << 13)
   --  unsupported macro: SUPPORTED_Asym_Pause (1 << 14)
   --  unsupported macro: SUPPORTED_2500baseX_Full (1 << 15)
   --  unsupported macro: SUPPORTED_Backplane (1 << 16)
   --  unsupported macro: SUPPORTED_1000baseKX_Full (1 << 17)
   --  unsupported macro: SUPPORTED_10000baseKX4_Full (1 << 18)
   --  unsupported macro: SUPPORTED_10000baseKR_Full (1 << 19)
   --  unsupported macro: SUPPORTED_10000baseR_FEC (1 << 20)
   --  unsupported macro: SUPPORTED_20000baseMLD2_Full (1 << 21)
   --  unsupported macro: SUPPORTED_20000baseKR2_Full (1 << 22)
   --  unsupported macro: SUPPORTED_40000baseKR4_Full (1 << 23)
   --  unsupported macro: SUPPORTED_40000baseCR4_Full (1 << 24)
   --  unsupported macro: SUPPORTED_40000baseSR4_Full (1 << 25)
   --  unsupported macro: SUPPORTED_40000baseLR4_Full (1 << 26)
   --  unsupported macro: ADVERTISED_10baseT_Half (1 << 0)
   --  unsupported macro: ADVERTISED_10baseT_Full (1 << 1)
   --  unsupported macro: ADVERTISED_100baseT_Half (1 << 2)
   --  unsupported macro: ADVERTISED_100baseT_Full (1 << 3)
   --  unsupported macro: ADVERTISED_1000baseT_Half (1 << 4)
   --  unsupported macro: ADVERTISED_1000baseT_Full (1 << 5)
   --  unsupported macro: ADVERTISED_Autoneg (1 << 6)
   --  unsupported macro: ADVERTISED_TP (1 << 7)
   --  unsupported macro: ADVERTISED_AUI (1 << 8)
   --  unsupported macro: ADVERTISED_MII (1 << 9)
   --  unsupported macro: ADVERTISED_FIBRE (1 << 10)
   --  unsupported macro: ADVERTISED_BNC (1 << 11)
   --  unsupported macro: ADVERTISED_10000baseT_Full (1 << 12)
   --  unsupported macro: ADVERTISED_Pause (1 << 13)
   --  unsupported macro: ADVERTISED_Asym_Pause (1 << 14)
   --  unsupported macro: ADVERTISED_2500baseX_Full (1 << 15)
   --  unsupported macro: ADVERTISED_Backplane (1 << 16)
   --  unsupported macro: ADVERTISED_1000baseKX_Full (1 << 17)
   --  unsupported macro: ADVERTISED_10000baseKX4_Full (1 << 18)
   --  unsupported macro: ADVERTISED_10000baseKR_Full (1 << 19)
   --  unsupported macro: ADVERTISED_10000baseR_FEC (1 << 20)
   --  unsupported macro: ADVERTISED_20000baseMLD2_Full (1 << 21)
   --  unsupported macro: ADVERTISED_20000baseKR2_Full (1 << 22)
   --  unsupported macro: ADVERTISED_40000baseKR4_Full (1 << 23)
   --  unsupported macro: ADVERTISED_40000baseCR4_Full (1 << 24)
   --  unsupported macro: ADVERTISED_40000baseSR4_Full (1 << 25)
   --  unsupported macro: ADVERTISED_40000baseLR4_Full (1 << 26)
   --  unsupported macro: SPEED_10 10
   --  unsupported macro: SPEED_100 100
   --  unsupported macro: SPEED_1000 1000
   --  unsupported macro: SPEED_2500 2500
   --  unsupported macro: SPEED_10000 10000
   --  unsupported macro: SPEED_UNKNOWN -1
   --  unsupported macro: DUPLEX_HALF 0x00
   --  unsupported macro: DUPLEX_FULL 0x01
   --  unsupported macro: DUPLEX_UNKNOWN 0xff
   --  unsupported macro: PORT_TP 0x00
   --  unsupported macro: PORT_AUI 0x01
   --  unsupported macro: PORT_MII 0x02
   --  unsupported macro: PORT_FIBRE 0x03
   --  unsupported macro: PORT_BNC 0x04
   --  unsupported macro: PORT_DA 0x05
   --  unsupported macro: PORT_NONE 0xef
   --  unsupported macro: PORT_OTHER 0xff
   --  unsupported macro: XCVR_INTERNAL 0x00
   --  unsupported macro: XCVR_EXTERNAL 0x01
   --  unsupported macro: XCVR_DUMMY1 0x02
   --  unsupported macro: XCVR_DUMMY2 0x03
   --  unsupported macro: XCVR_DUMMY3 0x04
   --  unsupported macro: AUTONEG_DISABLE 0x00
   --  unsupported macro: AUTONEG_ENABLE 0x01
   --  unsupported macro: ETH_TP_MDI_INVALID 0x00
   --  unsupported macro: ETH_TP_MDI 0x01
   --  unsupported macro: ETH_TP_MDI_X 0x02
   --  unsupported macro: ETH_TP_MDI_AUTO 0x03
   --  unsupported macro: WAKE_PHY (1 << 0)
   --  unsupported macro: WAKE_UCAST (1 << 1)
   --  unsupported macro: WAKE_MCAST (1 << 2)
   --  unsupported macro: WAKE_BCAST (1 << 3)
   --  unsupported macro: WAKE_ARP (1 << 4)
   --  unsupported macro: WAKE_MAGIC (1 << 5)
   --  unsupported macro: WAKE_MAGICSECURE (1 << 6)
   --  unsupported macro: TCP_V4_FLOW 0x01
   --  unsupported macro: UDP_V4_FLOW 0x02
   --  unsupported macro: SCTP_V4_FLOW 0x03
   --  unsupported macro: AH_ESP_V4_FLOW 0x04
   --  unsupported macro: TCP_V6_FLOW 0x05
   --  unsupported macro: UDP_V6_FLOW 0x06
   --  unsupported macro: SCTP_V6_FLOW 0x07
   --  unsupported macro: AH_ESP_V6_FLOW 0x08
   --  unsupported macro: AH_V4_FLOW 0x09
   --  unsupported macro: ESP_V4_FLOW 0x0a
   --  unsupported macro: AH_V6_FLOW 0x0b
   --  unsupported macro: ESP_V6_FLOW 0x0c
   --  unsupported macro: IP_USER_FLOW 0x0d
   --  unsupported macro: IPV4_FLOW 0x10
   --  unsupported macro: IPV6_FLOW 0x11
   --  unsupported macro: ETHER_FLOW 0x12
   --  unsupported macro: FLOW_EXT 0x80000000
   --  unsupported macro: FLOW_MAC_EXT 0x40000000
   --  unsupported macro: RXH_L2DA (1 << 1)
   --  unsupported macro: RXH_VLAN (1 << 2)
   --  unsupported macro: RXH_L3_PROTO (1 << 3)
   --  unsupported macro: RXH_IP_SRC (1 << 4)
   --  unsupported macro: RXH_IP_DST (1 << 5)
   --  unsupported macro: RXH_L4_B_0_1 (1 << 6)
   --  unsupported macro: RXH_L4_B_2_3 (1 << 7)
   --  unsupported macro: RXH_DISCARD (1 << 31)
   --  unsupported macro: RX_CLS_FLOW_DISC 0xffffffffffffffffULL
   --  unsupported macro: RX_CLS_LOC_SPECIAL 0x80000000
   --  unsupported macro: RX_CLS_LOC_ANY 0xffffffff
   --  unsupported macro: RX_CLS_LOC_FIRST 0xfffffffe
   --  unsupported macro: RX_CLS_LOC_LAST 0xfffffffd
   --  unsupported macro: ETH_MODULE_SFF_8079 0x1
   --  unsupported macro: ETH_MODULE_SFF_8079_LEN 256
   --  unsupported macro: ETH_MODULE_SFF_8472 0x2
   --  unsupported macro: ETH_MODULE_SFF_8472_LEN 512
   --  unsupported macro: ETH_RESET_SHARED_SHIFT 16
  -- * ethtool.h: Defines for Linux ethtool.
  -- *
  -- * Copyright (C) 1998 David S. Miller (davem@redhat.com)
  -- * Copyright 2001 Jeff Garzik <jgarzik@pobox.com>
  -- * Portions Copyright 2001 Sun Microsystems (thockin@sun.com)
  -- * Portions Copyright 2002 Intel (eli.kupermann@intel.com,
  -- *                                christopher.leech@intel.com,
  -- *                                scott.feldman@intel.com)
  -- * Portions Copyright (C) Sun Microsystems 2008
  --  

  -- All structures exposed to userland should be defined such that they
  -- * have the same layout for 32-bit and 64-bit userland.
  --  

  --*
  -- * struct ethtool_cmd - link control and status
  -- * @cmd: Command number = %ETHTOOL_GSET or %ETHTOOL_SSET
  -- * @supported: Bitmask of %SUPPORTED_* flags for the link modes,
  -- *	physical connectors and other link features for which the
  -- *	interface supports autonegotiation or auto-detection.
  -- *	Read-only.
  -- * @advertising: Bitmask of %ADVERTISED_* flags for the link modes,
  -- *	physical connectors and other link features that are
  -- *	advertised through autonegotiation or enabled for
  -- *	auto-detection.
  -- * @speed: Low bits of the speed
  -- * @duplex: Duplex mode; one of %DUPLEX_*
  -- * @port: Physical connector type; one of %PORT_*
  -- * @phy_address: MDIO address of PHY (transceiver); 0 or 255 if not
  -- *	applicable.  For clause 45 PHYs this is the PRTAD.
  -- * @transceiver: Historically used to distinguish different possible
  -- *	PHY types, but not in a consistent way.  Deprecated.
  -- * @autoneg: Enable/disable autonegotiation and auto-detection;
  -- *	either %AUTONEG_DISABLE or %AUTONEG_ENABLE
  -- * @mdio_support: Bitmask of %ETH_MDIO_SUPPORTS_* flags for the MDIO
  -- *	protocols supported by the interface; 0 if unknown.
  -- *	Read-only.
  -- * @maxtxpkt: Historically used to report TX IRQ coalescing; now
  -- *	obsoleted by &struct ethtool_coalesce.  Read-only; deprecated.
  -- * @maxrxpkt: Historically used to report RX IRQ coalescing; now
  -- *	obsoleted by &struct ethtool_coalesce.  Read-only; deprecated.
  -- * @speed_hi: High bits of the speed
  -- * @eth_tp_mdix: Ethernet twisted-pair MDI(-X) status; one of
  -- *	%ETH_TP_MDI_*.  If the status is unknown or not applicable, the
  -- *	value will be %ETH_TP_MDI_INVALID.  Read-only.
  -- * @eth_tp_mdix_ctrl: Ethernet twisted pair MDI(-X) control; one of
  -- *	%ETH_TP_MDI_*.  If MDI(-X) control is not implemented, reads
  -- *	yield %ETH_TP_MDI_INVALID and writes may be ignored or rejected.
  -- *	When written successfully, the link should be renegotiated if
  -- *	necessary.
  -- * @lp_advertising: Bitmask of %ADVERTISED_* flags for the link modes
  -- *	and other link features that the link partner advertised
  -- *	through autonegotiation; 0 if unknown or not applicable.
  -- *	Read-only.
  -- *
  -- * The link speed in Mbps is split between @speed and @speed_hi.  Use
  -- * the ethtool_cmd_speed() and ethtool_cmd_speed_set() functions to
  -- * access it.
  -- *
  -- * If autonegotiation is disabled, the speed and @duplex represent the
  -- * fixed link mode and are writable if the driver supports multiple
  -- * link modes.  If it is enabled then they are read-only; if the link
  -- * is up they represent the negotiated link mode; if the link is down,
  -- * the speed is 0, %SPEED_UNKNOWN or the highest enabled speed and
  -- * @duplex is %DUPLEX_UNKNOWN or the best enabled duplex mode.
  -- *
  -- * Some hardware interfaces may have multiple PHYs and/or physical
  -- * connectors fitted or do not allow the driver to detect which are
  -- * fitted.  For these interfaces @port and/or @phy_address may be
  -- * writable, possibly dependent on @autoneg being %AUTONEG_DISABLE.
  -- * Otherwise, attempts to write different values may be ignored or
  -- * rejected.
  -- *
  -- * Users should assume that all fields not marked read-only are
  -- * writable and subject to validation by the driver.  They should use
  -- * %ETHTOOL_GSET to get the current values before making specific
  -- * changes and then applying them with %ETHTOOL_SSET.
  -- *
  -- * Drivers that implement set_settings() should validate all fields
  -- * other than @cmd that are not described as read-only or deprecated,
  -- * and must ignore all fields described as read-only.
  -- *
  -- * Deprecated fields should be ignored by both users and drivers.
  --  

   type ethtool_cmd_reserved_array is array (0 .. 1) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type ethtool_cmd is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:94
      supported : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:95
      advertising : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:96
      speed : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:97
      duplex : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:98
      port : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:99
      phy_address : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:100
      transceiver : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:101
      autoneg : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:102
      mdio_support : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:103
      maxtxpkt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:104
      maxrxpkt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:105
      speed_hi : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:106
      eth_tp_mdix : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:107
      eth_tp_mdix_ctrl : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:108
      lp_advertising : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:109
      reserved : aliased ethtool_cmd_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:110
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_cmd);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:93

   procedure ethtool_cmd_speed_set (ep : access ethtool_cmd; speed : uapi_asm_generic_int_ll64_h.uu_u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:113
   pragma Import (CPP, ethtool_cmd_speed_set, "_ZL21ethtool_cmd_speed_setP11ethtool_cmdj");

   function ethtool_cmd_speed (ep : access constant ethtool_cmd) return uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:121
   pragma Import (CPP, ethtool_cmd_speed, "_ZL17ethtool_cmd_speedPK11ethtool_cmd");

  -- Device supports clause 22 register access to PHY or peripherals
  -- * using the interface defined in <linux/mii.h>.  This should not be
  -- * set if there are known to be no such peripherals present or if
  -- * the driver only emulates clause 22 registers for compatibility.
  --  

  -- Device supports clause 45 register access to PHY or peripherals
  -- * using the interface defined in <linux/mii.h> and <linux/mdio.h>.
  -- * This should not be set if there are known to be no such peripherals
  -- * present.
  --  

  --*
  -- * struct ethtool_drvinfo - general driver and device information
  -- * @cmd: Command number = %ETHTOOL_GDRVINFO
  -- * @driver: Driver short name.  This should normally match the name
  -- *	in its bus driver structure (e.g. pci_driver::name).  Must
  -- *	not be an empty string.
  -- * @version: Driver version string; may be an empty string
  -- * @fw_version: Firmware version string; may be an empty string
  -- * @bus_info: Device bus address.  This should match the dev_name()
  -- *	string for the underlying bus device, if there is one.  May be
  -- *	an empty string.
  -- * @n_priv_flags: Number of flags valid for %ETHTOOL_GPFLAGS and
  -- *	%ETHTOOL_SPFLAGS commands; also the number of strings in the
  -- *	%ETH_SS_PRIV_FLAGS set
  -- * @n_stats: Number of u64 statistics returned by the %ETHTOOL_GSTATS
  -- *	command; also the number of strings in the %ETH_SS_STATS set
  -- * @testinfo_len: Number of results returned by the %ETHTOOL_TEST
  -- *	command; also the number of strings in the %ETH_SS_TEST set
  -- * @eedump_len: Size of EEPROM accessible through the %ETHTOOL_GEEPROM
  -- *	and %ETHTOOL_SEEPROM commands, in bytes
  -- * @regdump_len: Size of register dump returned by the %ETHTOOL_GREGS
  -- *	command, in bytes
  -- *
  -- * Users can use the %ETHTOOL_GSSET_INFO command to get the number of
  -- * strings in any string set (from Linux 2.6.34).
  -- *
  -- * Drivers should set at most @driver, @version, @fw_version and
  -- * @bus_info in their get_drvinfo() implementation.  The ethtool
  -- * core fills in the other fields using other driver operations.
  --  

   subtype ethtool_drvinfo_driver_array is Interfaces.C.char_array (0 .. 31);
   subtype ethtool_drvinfo_version_array is Interfaces.C.char_array (0 .. 31);
   subtype ethtool_drvinfo_fw_version_array is Interfaces.C.char_array (0 .. 31);
   subtype ethtool_drvinfo_bus_info_array is Interfaces.C.char_array (0 .. 31);
   subtype ethtool_drvinfo_reserved1_array is Interfaces.C.char_array (0 .. 31);
   subtype ethtool_drvinfo_reserved2_array is Interfaces.C.char_array (0 .. 11);
   type ethtool_drvinfo is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:174
      driver : aliased ethtool_drvinfo_driver_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:175
      version : aliased ethtool_drvinfo_version_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:176
      fw_version : aliased ethtool_drvinfo_fw_version_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:177
      bus_info : aliased ethtool_drvinfo_bus_info_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:178
      reserved1 : aliased ethtool_drvinfo_reserved1_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:179
      reserved2 : aliased ethtool_drvinfo_reserved2_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:180
      n_priv_flags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:181
      n_stats : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:182
      testinfo_len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:183
      eedump_len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:184
      regdump_len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:185
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_drvinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:173

  --*
  -- * struct ethtool_wolinfo - Wake-On-Lan configuration
  -- * @cmd: Command number = %ETHTOOL_GWOL or %ETHTOOL_SWOL
  -- * @supported: Bitmask of %WAKE_* flags for supported Wake-On-Lan modes.
  -- *	Read-only.
  -- * @wolopts: Bitmask of %WAKE_* flags for enabled Wake-On-Lan modes.
  -- * @sopass: SecureOn(tm) password; meaningful only if %WAKE_MAGICSECURE
  -- *	is set in @wolopts.
  --  

   type ethtool_wolinfo_sopass_array is array (0 .. 5) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ethtool_wolinfo is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:200
      supported : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:201
      wolopts : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:202
      sopass : aliased ethtool_wolinfo_sopass_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:203
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_wolinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:199

  -- for passing single values  
   type ethtool_value is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:208
      data : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:209
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_value);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:207

  --*
  -- * struct ethtool_regs - hardware register dump
  -- * @cmd: Command number = %ETHTOOL_GREGS
  -- * @version: Dump format version.  This is driver-specific and may
  -- *	distinguish different chips/revisions.  Drivers must use new
  -- *	version numbers whenever the dump format changes in an
  -- *	incompatible way.
  -- * @len: On entry, the real length of @data.  On return, the number of
  -- *	bytes used.
  -- * @data: Buffer for the register dump
  -- *
  -- * Users should use %ETHTOOL_GDRVINFO to find the maximum length of
  -- * a register dump for the interface.  They must allocate the buffer
  -- * immediately following this structure.
  --  

   type ethtool_regs_data_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ethtool_regs is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:228
      version : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:229
      len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:230
      data : aliased ethtool_regs_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:231
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_regs);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:227

  --*
  -- * struct ethtool_eeprom - EEPROM dump
  -- * @cmd: Command number = %ETHTOOL_GEEPROM, %ETHTOOL_GMODULEEEPROM or
  -- *	%ETHTOOL_SEEPROM
  -- * @magic: A 'magic cookie' value to guard against accidental changes.
  -- *	The value passed in to %ETHTOOL_SEEPROM must match the value
  -- *	returned by %ETHTOOL_GEEPROM for the same device.  This is
  -- *	unused when @cmd is %ETHTOOL_GMODULEEEPROM.
  -- * @offset: Offset within the EEPROM to begin reading/writing, in bytes
  -- * @len: On entry, number of bytes to read/write.  On successful
  -- *	return, number of bytes actually read/written.  In case of
  -- *	error, this may indicate at what point the error occurred.
  -- * @data: Buffer to read/write from
  -- *
  -- * Users may use %ETHTOOL_GDRVINFO or %ETHTOOL_GMODULEINFO to find
  -- * the length of an on-board or module EEPROM, respectively.  They
  -- * must allocate the buffer immediately following this structure.
  --  

   type ethtool_eeprom_data_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ethtool_eeprom is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:253
      magic : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:254
      offset : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:255
      len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:256
      data : aliased ethtool_eeprom_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:257
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_eeprom);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:252

  --*
  -- * struct ethtool_eee - Energy Efficient Ethernet information
  -- * @cmd: ETHTOOL_{G,S}EEE
  -- * @supported: Mask of %SUPPORTED_* flags for the speed/duplex combinations
  -- *	for which there is EEE support.
  -- * @advertised: Mask of %ADVERTISED_* flags for the speed/duplex combinations
  -- *	advertised as eee capable.
  -- * @lp_advertised: Mask of %ADVERTISED_* flags for the speed/duplex
  -- *	combinations advertised by the link partner as eee capable.
  -- * @eee_active: Result of the eee auto negotiation.
  -- * @eee_enabled: EEE configured mode (enabled/disabled).
  -- * @tx_lpi_enabled: Whether the interface should assert its tx lpi, given
  -- *	that eee was negotiated.
  -- * @tx_lpi_timer: Time in microseconds the interface delays prior to asserting
  -- *	its tx lpi (after reaching 'idle' state). Effective only when eee
  -- *	was negotiated and tx_lpi_enabled was set.
  --  

   type ethtool_eee_reserved_array is array (0 .. 1) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type ethtool_eee is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:278
      supported : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:279
      advertised : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:280
      lp_advertised : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:281
      eee_active : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:282
      eee_enabled : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:283
      tx_lpi_enabled : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:284
      tx_lpi_timer : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:285
      reserved : aliased ethtool_eee_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:286
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_eee);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:277

  --*
  -- * struct ethtool_modinfo - plugin module eeprom information
  -- * @cmd: %ETHTOOL_GMODULEINFO
  -- * @type: Standard the module information conforms to %ETH_MODULE_SFF_xxxx
  -- * @eeprom_len: Length of the eeprom
  -- *
  -- * This structure is used to return the information to
  -- * properly size memory for a subsequent call to %ETHTOOL_GMODULEEEPROM.
  -- * The type code indicates the eeprom data format
  --  

   type ethtool_modinfo_reserved_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type ethtool_modinfo is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:300
      c_type : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:301
      eeprom_len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:302
      reserved : aliased ethtool_modinfo_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:303
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_modinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:299

  --*
  -- * struct ethtool_coalesce - coalescing parameters for IRQs and stats updates
  -- * @cmd: ETHTOOL_{G,S}COALESCE
  -- * @rx_coalesce_usecs: How many usecs to delay an RX interrupt after
  -- *	a packet arrives.
  -- * @rx_max_coalesced_frames: Maximum number of packets to receive
  -- *	before an RX interrupt.
  -- * @rx_coalesce_usecs_irq: Same as @rx_coalesce_usecs, except that
  -- *	this value applies while an IRQ is being serviced by the host.
  -- * @rx_max_coalesced_frames_irq: Same as @rx_max_coalesced_frames,
  -- *	except that this value applies while an IRQ is being serviced
  -- *	by the host.
  -- * @tx_coalesce_usecs: How many usecs to delay a TX interrupt after
  -- *	a packet is sent.
  -- * @tx_max_coalesced_frames: Maximum number of packets to be sent
  -- *	before a TX interrupt.
  -- * @tx_coalesce_usecs_irq: Same as @tx_coalesce_usecs, except that
  -- *	this value applies while an IRQ is being serviced by the host.
  -- * @tx_max_coalesced_frames_irq: Same as @tx_max_coalesced_frames,
  -- *	except that this value applies while an IRQ is being serviced
  -- *	by the host.
  -- * @stats_block_coalesce_usecs: How many usecs to delay in-memory
  -- *	statistics block updates.  Some drivers do not have an
  -- *	in-memory statistic block, and in such cases this value is
  -- *	ignored.  This value must not be zero.
  -- * @use_adaptive_rx_coalesce: Enable adaptive RX coalescing.
  -- * @use_adaptive_tx_coalesce: Enable adaptive TX coalescing.
  -- * @pkt_rate_low: Threshold for low packet rate (packets per second).
  -- * @rx_coalesce_usecs_low: How many usecs to delay an RX interrupt after
  -- *	a packet arrives, when the packet rate is below @pkt_rate_low.
  -- * @rx_max_coalesced_frames_low: Maximum number of packets to be received
  -- *	before an RX interrupt, when the packet rate is below @pkt_rate_low.
  -- * @tx_coalesce_usecs_low: How many usecs to delay a TX interrupt after
  -- *	a packet is sent, when the packet rate is below @pkt_rate_low.
  -- * @tx_max_coalesced_frames_low: Maximum nuumber of packets to be sent before
  -- *	a TX interrupt, when the packet rate is below @pkt_rate_low.
  -- * @pkt_rate_high: Threshold for high packet rate (packets per second).
  -- * @rx_coalesce_usecs_high: How many usecs to delay an RX interrupt after
  -- *	a packet arrives, when the packet rate is above @pkt_rate_high.
  -- * @rx_max_coalesced_frames_high: Maximum number of packets to be received
  -- *	before an RX interrupt, when the packet rate is above @pkt_rate_high.
  -- * @tx_coalesce_usecs_high: How many usecs to delay a TX interrupt after
  -- *	a packet is sent, when the packet rate is above @pkt_rate_high.
  -- * @tx_max_coalesced_frames_high: Maximum number of packets to be sent before
  -- *	a TX interrupt, when the packet rate is above @pkt_rate_high.
  -- * @rate_sample_interval: How often to do adaptive coalescing packet rate
  -- *	sampling, measured in seconds.  Must not be zero.
  -- *
  -- * Each pair of (usecs, max_frames) fields specifies that interrupts
  -- * should be coalesced until
  -- *	(usecs > 0 && time_since_first_completion >= usecs) ||
  -- *	(max_frames > 0 && completed_frames >= max_frames)
  -- *
  -- * It is illegal to set both usecs and max_frames to zero as this
  -- * would cause interrupts to never be generated.  To disable
  -- * coalescing, set usecs = 0 and max_frames = 1.
  -- *
  -- * Some implementations ignore the value of max_frames and use the
  -- * condition time_since_first_completion >= usecs
  -- *
  -- * This is deprecated.  Drivers for hardware that does not support
  -- * counting completions should validate that max_frames == !rx_usecs.
  -- *
  -- * Adaptive RX/TX coalescing is an algorithm implemented by some
  -- * drivers to improve latency under low packet rates and improve
  -- * throughput under high packet rates.  Some drivers only implement
  -- * one of RX or TX adaptive coalescing.  Anything not implemented by
  -- * the driver causes these values to be silently ignored.
  -- *
  -- * When the packet rate is below @pkt_rate_high but above
  -- * @pkt_rate_low (both measured in packets per second) the
  -- * normal {rx,tx}_* coalescing parameters are used.
  --  

   type ethtool_coalesce is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:380
      rx_coalesce_usecs : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:381
      rx_max_coalesced_frames : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:382
      rx_coalesce_usecs_irq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:383
      rx_max_coalesced_frames_irq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:384
      tx_coalesce_usecs : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:385
      tx_max_coalesced_frames : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:386
      tx_coalesce_usecs_irq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:387
      tx_max_coalesced_frames_irq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:388
      stats_block_coalesce_usecs : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:389
      use_adaptive_rx_coalesce : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:390
      use_adaptive_tx_coalesce : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:391
      pkt_rate_low : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:392
      rx_coalesce_usecs_low : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:393
      rx_max_coalesced_frames_low : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:394
      tx_coalesce_usecs_low : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:395
      tx_max_coalesced_frames_low : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:396
      pkt_rate_high : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:397
      rx_coalesce_usecs_high : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:398
      rx_max_coalesced_frames_high : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:399
      tx_coalesce_usecs_high : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:400
      tx_max_coalesced_frames_high : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:401
      rate_sample_interval : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:402
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_coalesce);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:379

  --*
  -- * struct ethtool_ringparam - RX/TX ring parameters
  -- * @cmd: Command number = %ETHTOOL_GRINGPARAM or %ETHTOOL_SRINGPARAM
  -- * @rx_max_pending: Maximum supported number of pending entries per
  -- *	RX ring.  Read-only.
  -- * @rx_mini_max_pending: Maximum supported number of pending entries
  -- *	per RX mini ring.  Read-only.
  -- * @rx_jumbo_max_pending: Maximum supported number of pending entries
  -- *	per RX jumbo ring.  Read-only.
  -- * @tx_max_pending: Maximum supported number of pending entries per
  -- *	TX ring.  Read-only.
  -- * @rx_pending: Current maximum number of pending entries per RX ring
  -- * @rx_mini_pending: Current maximum number of pending entries per RX
  -- *	mini ring
  -- * @rx_jumbo_pending: Current maximum number of pending entries per RX
  -- *	jumbo ring
  -- * @tx_pending: Current maximum supported number of pending entries
  -- *	per TX ring
  -- *
  -- * If the interface does not have separate RX mini and/or jumbo rings,
  -- * @rx_mini_max_pending and/or @rx_jumbo_max_pending will be 0.
  -- *
  -- * There may also be driver-dependent minimum values for the number
  -- * of entries per ring.
  --  

   type ethtool_ringparam is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:431
      rx_max_pending : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:432
      rx_mini_max_pending : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:433
      rx_jumbo_max_pending : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:434
      tx_max_pending : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:435
      rx_pending : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:436
      rx_mini_pending : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:437
      rx_jumbo_pending : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:438
      tx_pending : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:439
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_ringparam);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:430

  --*
  -- * struct ethtool_channels - configuring number of network channel
  -- * @cmd: ETHTOOL_{G,S}CHANNELS
  -- * @max_rx: Read only. Maximum number of receive channel the driver support.
  -- * @max_tx: Read only. Maximum number of transmit channel the driver support.
  -- * @max_other: Read only. Maximum number of other channel the driver support.
  -- * @max_combined: Read only. Maximum number of combined channel the driver
  -- *	support. Set of queues RX, TX or other.
  -- * @rx_count: Valid values are in the range 1 to the max_rx.
  -- * @tx_count: Valid values are in the range 1 to the max_tx.
  -- * @other_count: Valid values are in the range 1 to the max_other.
  -- * @combined_count: Valid values are in the range 1 to the max_combined.
  -- *
  -- * This can be used to configure RX, TX and other channels.
  --  

   type ethtool_channels is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:459
      max_rx : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:460
      max_tx : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:461
      max_other : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:462
      max_combined : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:463
      rx_count : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:464
      tx_count : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:465
      other_count : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:466
      combined_count : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:467
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_channels);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:458

  --*
  -- * struct ethtool_pauseparam - Ethernet pause (flow control) parameters
  -- * @cmd: Command number = %ETHTOOL_GPAUSEPARAM or %ETHTOOL_SPAUSEPARAM
  -- * @autoneg: Flag to enable autonegotiation of pause frame use
  -- * @rx_pause: Flag to enable reception of pause frames
  -- * @tx_pause: Flag to enable transmission of pause frames
  -- *
  -- * Drivers should reject a non-zero setting of @autoneg when
  -- * autoneogotiation is disabled (or not supported) for the link.
  -- *
  -- * If the link is autonegotiated, drivers should use
  -- * mii_advertise_flowctrl() or similar code to set the advertised
  -- * pause frame capabilities based on the @rx_pause and @tx_pause flags,
  -- * even if @autoneg is zero.  They should also allow the advertised
  -- * pause frame capabilities to be controlled directly through the
  -- * advertising field of &struct ethtool_cmd.
  -- *
  -- * If @autoneg is non-zero, the MAC is configured to send and/or
  -- * receive pause frames according to the result of autonegotiation.
  -- * Otherwise, it is configured directly based on the @rx_pause and
  -- * @tx_pause flags.
  --  

   type ethtool_pauseparam is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:493
      autoneg : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:494
      rx_pause : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:495
      tx_pause : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:496
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_pauseparam);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:492

  --*
  -- * enum ethtool_stringset - string set ID
  -- * @ETH_SS_TEST: Self-test result names, for use with %ETHTOOL_TEST
  -- * @ETH_SS_STATS: Statistic names, for use with %ETHTOOL_GSTATS
  -- * @ETH_SS_PRIV_FLAGS: Driver private flag names, for use with
  -- *	%ETHTOOL_GPFLAGS and %ETHTOOL_SPFLAGS
  -- * @ETH_SS_NTUPLE_FILTERS: Previously used with %ETHTOOL_GRXNTUPLE;
  -- *	now deprecated
  -- * @ETH_SS_FEATURES: Device feature names
  --  

   type ethtool_stringset is 
     (ETH_SS_TEST,
      ETH_SS_STATS,
      ETH_SS_PRIV_FLAGS,
      ETH_SS_NTUPLE_FILTERS,
      ETH_SS_FEATURES);
   pragma Convention (C, ethtool_stringset);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:511

  --*
  -- * struct ethtool_gstrings - string set for data tagging
  -- * @cmd: Command number = %ETHTOOL_GSTRINGS
  -- * @string_set: String set ID; one of &enum ethtool_stringset
  -- * @len: On return, the number of strings in the string set
  -- * @data: Buffer for strings.  Each string is null-padded to a size of
  -- *	%ETH_GSTRING_LEN.
  -- *
  -- * Users must use %ETHTOOL_GSSET_INFO to find the number of strings in
  -- * the string set.  They must allocate a buffer of the appropriate
  -- * size immediately following this structure.
  --  

   type ethtool_gstrings_data_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ethtool_gstrings is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:532
      string_set : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:533
      len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:534
      data : aliased ethtool_gstrings_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:535
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_gstrings);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:531

  --*
  -- * struct ethtool_sset_info - string set information
  -- * @cmd: Command number = %ETHTOOL_GSSET_INFO
  -- * @sset_mask: On entry, a bitmask of string sets to query, with bits
  -- *	numbered according to &enum ethtool_stringset.  On return, a
  -- *	bitmask of those string sets queried that are supported.
  -- * @data: Buffer for string set sizes.  On return, this contains the
  -- *	size of each string set that was queried and supported, in
  -- *	order of ID.
  -- *
  -- * Example: The user passes in @sset_mask = 0x7 (sets 0, 1, 2) and on
  -- * return @sset_mask == 0x6 (sets 1, 2).  Then @data[0] contains the
  -- * size of set 1 and @data[1] contains the size of set 2.
  -- *
  -- * Users must allocate a buffer of the appropriate size (4 * number of
  -- * sets queried) immediately following this structure.
  --  

   type ethtool_sset_info_data_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type ethtool_sset_info is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:556
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:557
      sset_mask : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:558
      data : aliased ethtool_sset_info_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:559
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_sset_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:555

  --*
  -- * enum ethtool_test_flags - flags definition of ethtool_test
  -- * @ETH_TEST_FL_OFFLINE: if set perform online and offline tests, otherwise
  -- *	only online tests.
  -- * @ETH_TEST_FL_FAILED: Driver set this flag if test fails.
  -- * @ETH_TEST_FL_EXTERNAL_LB: Application request to perform external loopback
  -- *	test.
  -- * @ETH_TEST_FL_EXTERNAL_LB_DONE: Driver performed the external loopback test
  --  

   subtype ethtool_test_flags is unsigned;
   ETH_TEST_FL_OFFLINE : constant ethtool_test_flags := 1;
   ETH_TEST_FL_FAILED : constant ethtool_test_flags := 2;
   ETH_TEST_FL_EXTERNAL_LB : constant ethtool_test_flags := 4;
   ETH_TEST_FL_EXTERNAL_LB_DONE : constant ethtool_test_flags := 8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:572

  --*
  -- * struct ethtool_test - device self-test invocation
  -- * @cmd: Command number = %ETHTOOL_TEST
  -- * @flags: A bitmask of flags from &enum ethtool_test_flags.  Some
  -- *	flags may be set by the user on entry; others may be set by
  -- *	the driver on return.
  -- * @len: On return, the number of test results
  -- * @data: Array of test results
  -- *
  -- * Users must use %ETHTOOL_GSSET_INFO or %ETHTOOL_GDRVINFO to find the
  -- * number of test results that will be returned.  They must allocate a
  -- * buffer of the appropriate size (8 * number of results) immediately
  -- * following this structure.
  --  

   type ethtool_test_data_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u64;
   type ethtool_test is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:594
      flags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:595
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:596
      len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:597
      data : aliased ethtool_test_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:598
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_test);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:593

  --*
  -- * struct ethtool_stats - device-specific statistics
  -- * @cmd: Command number = %ETHTOOL_GSTATS
  -- * @n_stats: On return, the number of statistics
  -- * @data: Array of statistics
  -- *
  -- * Users must use %ETHTOOL_GSSET_INFO or %ETHTOOL_GDRVINFO to find the
  -- * number of statistics that will be returned.  They must allocate a
  -- * buffer of the appropriate size (8 * number of statistics)
  -- * immediately following this structure.
  --  

   type ethtool_stats_data_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u64;
   type ethtool_stats is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:613
      n_stats : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:614
      data : aliased ethtool_stats_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:615
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_stats);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:612

  --*
  -- * struct ethtool_perm_addr - permanent hardware address
  -- * @cmd: Command number = %ETHTOOL_GPERMADDR
  -- * @size: On entry, the size of the buffer.  On return, the size of the
  -- *	address.  The command fails if the buffer is too small.
  -- * @data: Buffer for the address
  -- *
  -- * Users must allocate the buffer immediately following this structure.
  -- * A buffer size of %MAX_ADDR_LEN should be sufficient for any address
  -- * type.
  --  

   type ethtool_perm_addr_data_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ethtool_perm_addr is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:630
      size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:631
      data : aliased ethtool_perm_addr_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:632
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_perm_addr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:629

  -- boolean flags controlling per-interface behavior characteristics.
  -- * When reading, the flag indicates whether or not a certain behavior
  -- * is enabled/present.  When writing, the flag indicates whether
  -- * or not the driver should turn on (set) or off (clear) a behavior.
  -- *
  -- * Some behaviors may read-only (unconditionally absent or present).
  -- * If such is the case, return EINVAL in the set-flags operation if the
  -- * flag differs from the read-only value.
  --  

   subtype ethtool_flags is unsigned;
   ETH_FLAG_TXVLAN : constant ethtool_flags := 128;
   ETH_FLAG_RXVLAN : constant ethtool_flags := 256;
   ETH_FLAG_LRO : constant ethtool_flags := 32768;
   ETH_FLAG_NTUPLE : constant ethtool_flags := 134217728;
   ETH_FLAG_RXHASH : constant ethtool_flags := 268435456;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:644

  -- TX VLAN offload enabled  
  -- RX VLAN offload enabled  
  -- LRO is enabled  
  -- N-tuple filters enabled  
  -- The following structures are for supporting RX network flow
  -- * classification and RX n-tuple configuration. Note, all multibyte
  -- * fields, e.g., ip4src, ip4dst, psrc, pdst, spi, etc. are expected to
  -- * be in network byte order.
  --  

  --*
  -- * struct ethtool_tcpip4_spec - flow specification for TCP/IPv4 etc.
  -- * @ip4src: Source host
  -- * @ip4dst: Destination host
  -- * @psrc: Source port
  -- * @pdst: Destination port
  -- * @tos: Type-of-service
  -- *
  -- * This can be used to specify a TCP/IPv4, UDP/IPv4 or SCTP/IPv4 flow.
  --  

   type ethtool_tcpip4_spec is record
      ip4src : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:669
      ip4dst : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:670
      psrc : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:671
      pdst : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:672
      tos : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:673
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_tcpip4_spec);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:668

  --*
  -- * struct ethtool_ah_espip4_spec - flow specification for IPsec/IPv4
  -- * @ip4src: Source host
  -- * @ip4dst: Destination host
  -- * @spi: Security parameters index
  -- * @tos: Type-of-service
  -- *
  -- * This can be used to specify an IPsec transport or tunnel over IPv4.
  --  

   type ethtool_ah_espip4_spec is record
      ip4src : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:686
      ip4dst : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:687
      spi : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:688
      tos : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:689
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_ah_espip4_spec);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:685

  --*
  -- * struct ethtool_usrip4_spec - general flow specification for IPv4
  -- * @ip4src: Source host
  -- * @ip4dst: Destination host
  -- * @l4_4_bytes: First 4 bytes of transport (layer 4) header
  -- * @tos: Type-of-service
  -- * @ip_ver: Value must be %ETH_RX_NFC_IP4; mask must be 0
  -- * @proto: Transport protocol number; mask must be 0
  --  

   type ethtool_usrip4_spec is record
      ip4src : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:704
      ip4dst : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:705
      l4_4_bytes : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:706
      tos : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:707
      ip_ver : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:708
      proto : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:709
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_usrip4_spec);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:703

   type ethtool_flow_union_hdata_array is array (0 .. 51) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ethtool_flow_union (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            tcp_ip4_spec : aliased ethtool_tcpip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:713
         when 1 =>
            udp_ip4_spec : aliased ethtool_tcpip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:714
         when 2 =>
            sctp_ip4_spec : aliased ethtool_tcpip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:715
         when 3 =>
            ah_ip4_spec : aliased ethtool_ah_espip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:716
         when 4 =>
            esp_ip4_spec : aliased ethtool_ah_espip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:717
         when 5 =>
            usr_ip4_spec : aliased ethtool_usrip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:718
         when 6 =>
            ether_spec : aliased uapi_linux_if_ether_h.ethhdr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:719
         when others =>
            hdata : aliased ethtool_flow_union_hdata_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:720
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_flow_union);
   pragma Unchecked_Union (ethtool_flow_union);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:712

  --*
  -- * struct ethtool_flow_ext - additional RX flow fields
  -- * @h_dest: destination MAC address
  -- * @vlan_etype: VLAN EtherType
  -- * @vlan_tci: VLAN tag control information
  -- * @data: user defined data
  -- *
  -- * Note, @vlan_etype, @vlan_tci, and @data are only valid if %FLOW_EXT
  -- * is set in &struct ethtool_rx_flow_spec @flow_type.
  -- * @h_dest is valid if %FLOW_MAC_EXT is set.
  --  

   type ethtool_flow_ext_padding_array is array (0 .. 1) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ethtool_flow_ext_h_dest_array is array (0 .. 5) of aliased unsigned_char;
   type ethtool_flow_ext_data_array is array (0 .. 1) of aliased uapi_linux_types_h.uu_be32;
   type ethtool_flow_ext is record
      padding : aliased ethtool_flow_ext_padding_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:735
      h_dest : aliased ethtool_flow_ext_h_dest_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:736
      vlan_etype : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:737
      vlan_tci : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:738
      data : aliased ethtool_flow_ext_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:739
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_flow_ext);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:734

  --*
  -- * struct ethtool_rx_flow_spec - classification rule for RX flows
  -- * @flow_type: Type of match to perform, e.g. %TCP_V4_FLOW
  -- * @h_u: Flow fields to match (dependent on @flow_type)
  -- * @h_ext: Additional fields to match
  -- * @m_u: Masks for flow field bits to be matched
  -- * @m_ext: Masks for additional field bits to be matched
  -- *	Note, all additional fields must be ignored unless @flow_type
  -- *	includes the %FLOW_EXT or %FLOW_MAC_EXT flag
  -- *	(see &struct ethtool_flow_ext description).
  -- * @ring_cookie: RX ring/queue index to deliver to, or %RX_CLS_FLOW_DISC
  -- *	if packets should be discarded
  -- * @location: Location of rule in the table.  Locations must be
  -- *	numbered such that a flow matching multiple rules will be
  -- *	classified according to the first (lowest numbered) rule.
  --  

   type ethtool_rx_flow_spec is record
      flow_type : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:759
      h_u : ethtool_flow_union;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:760
      h_ext : aliased ethtool_flow_ext;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:761
      m_u : ethtool_flow_union;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:762
      m_ext : aliased ethtool_flow_ext;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:763
      ring_cookie : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:764
      location : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:765
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_rx_flow_spec);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:758

  --*
  -- * struct ethtool_rxnfc - command to get or set RX flow classification rules
  -- * @cmd: Specific command number - %ETHTOOL_GRXFH, %ETHTOOL_SRXFH,
  -- *	%ETHTOOL_GRXRINGS, %ETHTOOL_GRXCLSRLCNT, %ETHTOOL_GRXCLSRULE,
  -- *	%ETHTOOL_GRXCLSRLALL, %ETHTOOL_SRXCLSRLDEL or %ETHTOOL_SRXCLSRLINS
  -- * @flow_type: Type of flow to be affected, e.g. %TCP_V4_FLOW
  -- * @data: Command-dependent value
  -- * @fs: Flow classification rule
  -- * @rule_cnt: Number of rules to be affected
  -- * @rule_locs: Array of used rule locations
  -- *
  -- * For %ETHTOOL_GRXFH and %ETHTOOL_SRXFH, @data is a bitmask indicating
  -- * the fields included in the flow hash, e.g. %RXH_IP_SRC.  The following
  -- * structure fields must not be used.
  -- *
  -- * For %ETHTOOL_GRXRINGS, @data is set to the number of RX rings/queues
  -- * on return.
  -- *
  -- * For %ETHTOOL_GRXCLSRLCNT, @rule_cnt is set to the number of defined
  -- * rules on return.  If @data is non-zero on return then it is the
  -- * size of the rule table, plus the flag %RX_CLS_LOC_SPECIAL if the
  -- * driver supports any special location values.  If that flag is not
  -- * set in @data then special location values should not be used.
  -- *
  -- * For %ETHTOOL_GRXCLSRULE, @fs.@location specifies the location of an
  -- * existing rule on entry and @fs contains the rule on return.
  -- *
  -- * For %ETHTOOL_GRXCLSRLALL, @rule_cnt specifies the array size of the
  -- * user buffer for @rule_locs on entry.  On return, @data is the size
  -- * of the rule table, @rule_cnt is the number of defined rules, and
  -- * @rule_locs contains the locations of the defined rules.  Drivers
  -- * must use the second parameter to get_rxnfc() instead of @rule_locs.
  -- *
  -- * For %ETHTOOL_SRXCLSRLINS, @fs specifies the rule to add or update.
  -- * @fs.@location either specifies the location to use or is a special
  -- * location value with %RX_CLS_LOC_SPECIAL flag set.  On return,
  -- * @fs.@location is the actual rule location.
  -- *
  -- * For %ETHTOOL_SRXCLSRLDEL, @fs.@location specifies the location of an
  -- * existing rule on entry.
  -- *
  -- * A driver supporting the special location values for
  -- * %ETHTOOL_SRXCLSRLINS may add the rule at any suitable unused
  -- * location, and may remove a rule at a later location (lower
  -- * priority) that matches exactly the same set of flows.  The special
  -- * values are %RX_CLS_LOC_ANY, selecting any location;
  -- * %RX_CLS_LOC_FIRST, selecting the first suitable location (maximum
  -- * priority); and %RX_CLS_LOC_LAST, selecting the last suitable
  -- * location (minimum priority).  Additional special values may be
  -- * defined in future and drivers must return -%EINVAL for any
  -- * unrecognised value.
  --  

   type ethtool_rxnfc_rule_locs_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type ethtool_rxnfc is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:821
      flow_type : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:822
      data : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:823
      fs : aliased ethtool_rx_flow_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:824
      rule_cnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:825
      rule_locs : aliased ethtool_rxnfc_rule_locs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:826
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_rxnfc);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:820

  --*
  -- * struct ethtool_rxfh_indir - command to get or set RX flow hash indirection
  -- * @cmd: Specific command number - %ETHTOOL_GRXFHINDIR or %ETHTOOL_SRXFHINDIR
  -- * @size: On entry, the array size of the user buffer, which may be zero.
  -- *	On return from %ETHTOOL_GRXFHINDIR, the array size of the hardware
  -- *	indirection table.
  -- * @ring_index: RX ring/queue index for each hash value
  -- *
  -- * For %ETHTOOL_GRXFHINDIR, a @size of zero means that only the size
  -- * should be returned.  For %ETHTOOL_SRXFHINDIR, a @size of zero means
  -- * the table should be reset to default values.  This last feature
  -- * is not supported by the original implementations.
  --  

   type ethtool_rxfh_indir_ring_index_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type ethtool_rxfh_indir is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:844
      size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:845
      ring_index : aliased ethtool_rxfh_indir_ring_index_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:846
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_rxfh_indir);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:843

  --*
  -- * struct ethtool_rxfh - command to get/set RX flow hash indir or/and hash key.
  -- * @cmd: Specific command number - %ETHTOOL_GRSSH or %ETHTOOL_SRSSH
  -- * @rss_context: RSS context identifier.
  -- * @indir_size: On entry, the array size of the user buffer for the
  -- *	indirection table, which may be zero, or (for %ETHTOOL_SRSSH),
  -- *	%ETH_RXFH_INDIR_NO_CHANGE.  On return from %ETHTOOL_GRSSH,
  -- *	the array size of the hardware indirection table.
  -- * @key_size: On entry, the array size of the user buffer for the hash key,
  -- *	which may be zero.  On return from %ETHTOOL_GRSSH, the size of the
  -- *	hardware hash key.
  -- * @rsvd:	Reserved for future extensions.
  -- * @rss_config: RX ring/queue index for each hash value i.e., indirection table
  -- *	of @indir_size __u32 elements, followed by hash key of @key_size
  -- *	bytes.
  -- *
  -- * For %ETHTOOL_GRSSH, a @indir_size and key_size of zero means that only the
  -- * size should be returned.  For %ETHTOOL_SRSSH, an @indir_size of
  -- * %ETH_RXFH_INDIR_NO_CHANGE means that indir table setting is not requested
  -- * and a @indir_size of zero means the indir table should be reset to default
  -- * values.
  --  

   type ethtool_rxfh_rsvd_array is array (0 .. 1) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type ethtool_rxfh_rss_config_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type ethtool_rxfh is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:872
      rss_context : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:873
      indir_size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:874
      key_size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:875
      rsvd : aliased ethtool_rxfh_rsvd_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:876
      rss_config : aliased ethtool_rxfh_rss_config_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:877
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_rxfh);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:871

  --*
  -- * struct ethtool_rx_ntuple_flow_spec - specification for RX flow filter
  -- * @flow_type: Type of match to perform, e.g. %TCP_V4_FLOW
  -- * @h_u: Flow field values to match (dependent on @flow_type)
  -- * @m_u: Masks for flow field value bits to be ignored
  -- * @vlan_tag: VLAN tag to match
  -- * @vlan_tag_mask: Mask for VLAN tag bits to be ignored
  -- * @data: Driver-dependent data to match
  -- * @data_mask: Mask for driver-dependent data bits to be ignored
  -- * @action: RX ring/queue index to deliver to (non-negative) or other action
  -- *	(negative, e.g. %ETHTOOL_RXNTUPLE_ACTION_DROP)
  -- *
  -- * For flow types %TCP_V4_FLOW, %UDP_V4_FLOW and %SCTP_V4_FLOW, where
  -- * a field value and mask are both zero this is treated as if all mask
  -- * bits are set i.e. the field is ignored.
  --  

   type ethtool_rx_ntuple_flow_spec_hdata_array is array (0 .. 71) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type anon_314 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            tcp_ip4_spec : aliased ethtool_tcpip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:900
         when 1 =>
            udp_ip4_spec : aliased ethtool_tcpip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:901
         when 2 =>
            sctp_ip4_spec : aliased ethtool_tcpip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:902
         when 3 =>
            ah_ip4_spec : aliased ethtool_ah_espip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:903
         when 4 =>
            esp_ip4_spec : aliased ethtool_ah_espip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:904
         when 5 =>
            usr_ip4_spec : aliased ethtool_usrip4_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:905
         when 6 =>
            ether_spec : aliased uapi_linux_if_ether_h.ethhdr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:906
         when others =>
            hdata : aliased ethtool_rx_ntuple_flow_spec_hdata_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:907
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_314);
   pragma Unchecked_Union (anon_314);
   type ethtool_rx_ntuple_flow_spec is record
      flow_type : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:898
      h_u : anon_314;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:908
      m_u : anon_314;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:908
      vlan_tag : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:910
      vlan_tag_mask : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:911
      data : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:912
      data_mask : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:913
      action : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:915
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_rx_ntuple_flow_spec);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:897

  --*
  -- * struct ethtool_rx_ntuple - command to set or clear RX flow filter
  -- * @cmd: Command number - %ETHTOOL_SRXNTUPLE
  -- * @fs: Flow filter specification
  --  

   type ethtool_rx_ntuple is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:926
      fs : aliased ethtool_rx_ntuple_flow_spec;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:927
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_rx_ntuple);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:925

   type ethtool_flash_op_type is 
     (ETHTOOL_FLASH_ALL_REGIONS);
   pragma Convention (C, ethtool_flash_op_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:931

  -- for passing firmware flashing related parameters  
   subtype ethtool_flash_data_array is Interfaces.C.char_array (0 .. 127);
   type ethtool_flash is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:937
      region : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:938
      data : aliased ethtool_flash_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:939
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_flash);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:936

  --*
  -- * struct ethtool_dump - used for retrieving, setting device dump
  -- * @cmd: Command number - %ETHTOOL_GET_DUMP_FLAG, %ETHTOOL_GET_DUMP_DATA, or
  -- * 	%ETHTOOL_SET_DUMP
  -- * @version: FW version of the dump, filled in by driver
  -- * @flag: driver dependent flag for dump setting, filled in by driver during
  -- *        get and filled in by ethtool for set operation.
  -- *        flag must be initialized by macro ETH_FW_DUMP_DISABLE value when
  -- *        firmware dump is disabled.
  -- * @len: length of dump data, used as the length of the user buffer on entry to
  -- * 	 %ETHTOOL_GET_DUMP_DATA and this is returned as dump length by driver
  -- * 	 for %ETHTOOL_GET_DUMP_FLAG command
  -- * @data: data collected for get dump data operation
  --  

   type ethtool_dump_data_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ethtool_dump is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:957
      version : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:958
      flag : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:959
      len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:960
      data : aliased ethtool_dump_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:961
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_dump);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:956

  -- for returning and changing feature sets  
  --*
  -- * struct ethtool_get_features_block - block with state of 32 features
  -- * @available: mask of changeable features
  -- * @requested: mask of features requested to be enabled if possible
  -- * @active: mask of currently enabled features
  -- * @never_changed: mask of features not changeable for any device
  --  

   type ethtool_get_features_block is record
      available : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:976
      requested : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:977
      active : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:978
      never_changed : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:979
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_get_features_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:975

  --*
  -- * struct ethtool_gfeatures - command to get state of device's features
  -- * @cmd: command number = %ETHTOOL_GFEATURES
  -- * @size: On entry, the number of elements in the features[] array;
  -- *	on return, the number of elements in features[] needed to hold
  -- *	all features
  -- * @features: state of features
  --  

   type ethtool_gfeatures_features_array is array (0 .. -1) of aliased ethtool_get_features_block;
   type ethtool_gfeatures is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:991
      size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:992
      features : aliased ethtool_gfeatures_features_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:993
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_gfeatures);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:990

  --*
  -- * struct ethtool_set_features_block - block with request for 32 features
  -- * @valid: mask of features to be changed
  -- * @requested: values of features to be changed
  --  

   type ethtool_set_features_block is record
      valid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1002
      requested : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1003
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_set_features_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1001

  --*
  -- * struct ethtool_sfeatures - command to request change in device's features
  -- * @cmd: command number = %ETHTOOL_SFEATURES
  -- * @size: array size of the features[] array
  -- * @features: feature change masks
  --  

   type ethtool_sfeatures_features_array is array (0 .. -1) of aliased ethtool_set_features_block;
   type ethtool_sfeatures is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1013
      size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1014
      features : aliased ethtool_sfeatures_features_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1015
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_sfeatures);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1012

  --*
  -- * struct ethtool_ts_info - holds a device's timestamping and PHC association
  -- * @cmd: command number = %ETHTOOL_GET_TS_INFO
  -- * @so_timestamping: bit mask of the sum of the supported SO_TIMESTAMPING flags
  -- * @phc_index: device index of the associated PHC, or -1 if there is none
  -- * @tx_types: bit mask of the supported hwtstamp_tx_types enumeration values
  -- * @rx_filters: bit mask of the supported hwtstamp_rx_filters enumeration values
  -- *
  -- * The bits in the 'tx_types' and 'rx_filters' fields correspond to
  -- * the 'hwtstamp_tx_types' and 'hwtstamp_rx_filters' enumeration values,
  -- * respectively.  For example, if the device supports HWTSTAMP_TX_ON,
  -- * then (1 << HWTSTAMP_TX_ON) in 'tx_types' will be set.
  --  

   type ethtool_ts_info_tx_reserved_array is array (0 .. 2) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type ethtool_ts_info_rx_reserved_array is array (0 .. 2) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type ethtool_ts_info is record
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1032
      so_timestamping : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1033
      phc_index : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1034
      tx_types : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1035
      tx_reserved : aliased ethtool_ts_info_tx_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1036
      rx_filters : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1037
      rx_reserved : aliased ethtool_ts_info_rx_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1038
   end record;
   pragma Convention (C_Pass_By_Copy, ethtool_ts_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1031

  -- * %ETHTOOL_SFEATURES changes features present in features[].valid to the
  -- * values of corresponding bits in features[].requested. Bits in .requested
  -- * not set in .valid or not changeable are ignored.
  -- *
  -- * Returns %EINVAL when .valid contains undefined or never-changeable bits
  -- * or size is not equal to required number of features words (32-bit blocks).
  -- * Returns >= 0 if request was completed; bits set in the value mean:
  -- *   %ETHTOOL_F_UNSUPPORTED - there were bits set in .valid that are not
  -- *	changeable (not present in %ETHTOOL_GFEATURES' features[].available)
  -- *	those bits were ignored.
  -- *   %ETHTOOL_F_WISH - some or all changes requested were recorded but the
  -- *      resulting state of bits masked by .valid is not equal to .requested.
  -- *      Probably there are other device-specific constraints on some features
  -- *      in the set. When %ETHTOOL_F_UNSUPPORTED is set, .valid is considered
  -- *      here as though ignored bits were cleared.
  -- *   %ETHTOOL_F_COMPAT - some or all changes requested were made by calling
  -- *      compatibility functions. Requested offload state cannot be properly
  -- *      managed by kernel.
  -- *
  -- * Meaning of bits in the masks are obtained by %ETHTOOL_GSSET_INFO (number of
  -- * bits in the arrays - always multiple of 32) and %ETHTOOL_GSTRINGS commands
  -- * for ETH_SS_FEATURES string set. First entry in the table corresponds to least
  -- * significant bit in features[0] fields. Empty strings mark undefined features.
  --  

   type ethtool_sfeatures_retval_bits is 
     (ETHTOOL_F_UNSUPPORTED_u_BIT,
      ETHTOOL_F_WISH_u_BIT,
      ETHTOOL_F_COMPAT_u_BIT);
   pragma Convention (C, ethtool_sfeatures_retval_bits);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1066

  -- CMDs currently supported  
  -- Get link status for host, i.e. whether the interface *and* the
  -- * physical port (if there is one) are up (ethtool_value).  

  -- compatibility with older code  
  -- The following are all involved in forcing a particular link
  -- * mode for the device for setting things.  When getting the
  -- * devices settings, these indicate the current mode and whether
  -- * it was forced up into this mode or autonegotiated.
  --  

  -- The forced speed, 10Mb, 100Mb, gigabit, 2.5Gb, 10GbE.  
  -- Duplex, half or full.  
  -- Which connector port.  
  -- Which transceiver to use.  
  -- Enable or disable autonegotiation.  
  -- MDI or MDI-X status/control - if MDI/MDI_X/AUTO is set then
  -- * the driver is required to renegotiate link
  --  

  -- Wake-On-Lan options.  
  -- L2-L4 network traffic flow types  
  -- Flag to enable additional fields in struct ethtool_rx_flow_spec  
  -- L3-L4 network traffic flow hash options  
  -- Special RX classification rule insert location values  
  -- EEPROM Standards for plug in modules  
  -- Reset flags  
  -- The reset() operation must clear the flags for the components which
  -- * were actually reset.  On successful return, the flags indicate the
  -- * components which were not reset, either because they do not exist
  -- * in the hardware or because they cannot be reset independently.  The
  -- * driver must never reset any components that were not requested.
  --  

   subtype ethtool_reset_flags is unsigned;
   ETH_RESET_MGMT : constant ethtool_reset_flags := 1;
   ETH_RESET_IRQ : constant ethtool_reset_flags := 2;
   ETH_RESET_DMA : constant ethtool_reset_flags := 4;
   ETH_RESET_FILTER : constant ethtool_reset_flags := 8;
   ETH_RESET_OFFLOAD : constant ethtool_reset_flags := 16;
   ETH_RESET_MAC : constant ethtool_reset_flags := 32;
   ETH_RESET_PHY : constant ethtool_reset_flags := 64;
   ETH_RESET_RAM : constant ethtool_reset_flags := 128;
   ETH_RESET_DEDICATED : constant ethtool_reset_flags := 65535;
   ETH_RESET_ALL : constant ethtool_reset_flags := 4294967295;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ethtool.h:1325

  -- These flags represent components dedicated to the interface
  --	 * the command is addressed to.  Shift any flag left by
  --	 * ETH_RESET_SHARED_SHIFT to reset a shared component of the
  --	 * same type.
  --	  

  -- Management processor  
  -- Interrupt requester  
  -- DMA engine  
  -- Filtering/flow direction  
  -- Protocol offload  
  -- Media access controller  
  -- Transceiver/PHY  
  -- RAM shared between
  --						 * multiple components  

  -- All components dedicated to
  --						 * this interface  

  -- All components used by this
  --						 * interface, even if shared  

end uapi_linux_ethtool_h;

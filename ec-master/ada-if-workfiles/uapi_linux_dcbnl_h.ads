pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_dcbnl_h is

   --  unsupported macro: IEEE_8021QAZ_MAX_TCS 8
   --  unsupported macro: IEEE_8021QAZ_TSA_STRICT 0
   --  unsupported macro: IEEE_8021QAZ_TSA_CB_SHAPER 1
   --  unsupported macro: IEEE_8021QAZ_TSA_ETS 2
   --  unsupported macro: IEEE_8021QAZ_TSA_VENDOR 255
   --  unsupported macro: CEE_DCBX_MAX_PGS 8
   --  unsupported macro: CEE_DCBX_MAX_PRIO 8
   --  unsupported macro: IEEE_8021QAZ_APP_SEL_ETHERTYPE 1
   --  unsupported macro: IEEE_8021QAZ_APP_SEL_STREAM 2
   --  unsupported macro: IEEE_8021QAZ_APP_SEL_DGRAM 3
   --  unsupported macro: IEEE_8021QAZ_APP_SEL_ANY 4
   --  unsupported macro: DCB_ATTR_IEEE_MAX (__DCB_ATTR_IEEE_MAX - 1)
   --  unsupported macro: DCB_ATTR_IEEE_APP_MAX (__DCB_ATTR_IEEE_APP_MAX - 1)
   --  unsupported macro: DCB_ATTR_CEE_MAX (__DCB_ATTR_CEE_MAX - 1)
   --  unsupported macro: DCB_ATTR_CEE_PEER_APP_MAX (__DCB_ATTR_CEE_PEER_APP_MAX - 1)
   --  unsupported macro: DCB_ATTR_CEE_APP_MAX (__DCB_ATTR_CEE_APP_MAX - 1)
   --  unsupported macro: DCB_CAP_DCBX_HOST 0x01
   --  unsupported macro: DCB_CAP_DCBX_LLD_MANAGED 0x02
   --  unsupported macro: DCB_CAP_DCBX_VER_CEE 0x04
   --  unsupported macro: DCB_CAP_DCBX_VER_IEEE 0x08
   --  unsupported macro: DCB_CAP_DCBX_STATIC 0x10
   --  unsupported macro: DCB_APP_IDTYPE_ETHTYPE 0x00
   --  unsupported macro: DCB_APP_IDTYPE_PORTNUM 0x01
   --  unsupported macro: DCB_FEATCFG_ERROR 0x01
   --  unsupported macro: DCB_FEATCFG_ENABLE 0x02
   --  unsupported macro: DCB_FEATCFG_WILLING 0x04
   --  unsupported macro: DCB_FEATCFG_ADVERTISE 0x08
  -- * Copyright (c) 2008-2011, Intel Corporation.
  -- *
  -- * This program is free software; you can redistribute it and/or modify it
  -- * under the terms and conditions of the GNU General Public License,
  -- * version 2, as published by the Free Software Foundation.
  -- *
  -- * This program is distributed in the hope it will be useful, but WITHOUT
  -- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  -- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  -- * more details.
  -- *
  -- * You should have received a copy of the GNU General Public License along with
  -- * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
  -- * Place - Suite 330, Boston, MA 02111-1307 USA.
  -- *
  -- * Author: Lucy Liu <lucy.liu@intel.com>
  --  

  -- IEEE 802.1Qaz std supported values  
  -- This structure contains the IEEE 802.1Qaz ETS managed object
  -- *
  -- * @willing: willing bit in ETS configuration TLV
  -- * @ets_cap: indicates supported capacity of ets feature
  -- * @cbs: credit based shaper ets algorithm supported
  -- * @tc_tx_bw: tc tx bandwidth indexed by traffic class
  -- * @tc_rx_bw: tc rx bandwidth indexed by traffic class
  -- * @tc_tsa: TSA Assignment table, indexed by traffic class
  -- * @prio_tc: priority assignment table mapping 8021Qp to traffic class
  -- * @tc_reco_bw: recommended tc bandwidth indexed by traffic class for TLV
  -- * @tc_reco_tsa: recommended tc bandwidth indexed by traffic class for TLV
  -- * @reco_prio_tc: recommended tc tx bandwidth indexed by traffic class for TLV
  -- *
  -- * Recommended values are used to set fields in the ETS recommendation TLV
  -- * with hardware offloaded LLDP.
  -- *
  -- * ----
  -- *  TSA Assignment 8 bit identifiers
  -- *	0	strict priority
  -- *	1	credit-based shaper
  -- *	2	enhanced transmission selection
  -- *	3-254	reserved
  -- *	255	vendor specific
  --  

   type ieee_ets_tc_tx_bw_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ieee_ets_tc_rx_bw_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ieee_ets_tc_tsa_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ieee_ets_prio_tc_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ieee_ets_tc_reco_bw_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ieee_ets_tc_reco_tsa_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ieee_ets_reco_prio_tc_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ieee_ets is record
      willing : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:58
      ets_cap : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:59
      cbs : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:60
      tc_tx_bw : aliased ieee_ets_tc_tx_bw_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:61
      tc_rx_bw : aliased ieee_ets_tc_rx_bw_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:62
      tc_tsa : aliased ieee_ets_tc_tsa_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:63
      prio_tc : aliased ieee_ets_prio_tc_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:64
      tc_reco_bw : aliased ieee_ets_tc_reco_bw_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:65
      tc_reco_tsa : aliased ieee_ets_tc_reco_tsa_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:66
      reco_prio_tc : aliased ieee_ets_reco_prio_tc_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:67
   end record;
   pragma Convention (C_Pass_By_Copy, ieee_ets);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:57

  -- This structure contains rate limit extension to the IEEE 802.1Qaz ETS
  -- * managed object.
  -- * Values are 64 bits long and specified in Kbps to enable usage over both
  -- * slow and very fast networks.
  -- *
  -- * @tc_maxrate: maximal tc tx bandwidth indexed by traffic class
  --  

   type ieee_maxrate_tc_maxrate_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u64;
   type ieee_maxrate is record
      tc_maxrate : aliased ieee_maxrate_tc_maxrate_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, ieee_maxrate);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:77

  -- This structure contains the IEEE 802.1Qaz PFC managed object
  -- *
  -- * @pfc_cap: Indicates the number of traffic classes on the local device
  -- *	     that may simultaneously have PFC enabled.
  -- * @pfc_en: bitmap indicating pfc enabled traffic classes
  -- * @mbc: enable macsec bypass capability
  -- * @delay: the allowance made for a round-trip propagation delay of the
  -- *	   link in bits.
  -- * @requests: count of the sent pfc frames
  -- * @indications: count of the received pfc frames
  --  

   type ieee_pfc_requests_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u64;
   type ieee_pfc_indications_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u64;
   type ieee_pfc is record
      pfc_cap : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:93
      pfc_en : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:94
      mbc : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:95
      c_delay : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:96
      requests : aliased ieee_pfc_requests_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:97
      indications : aliased ieee_pfc_indications_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:98
   end record;
   pragma Convention (C_Pass_By_Copy, ieee_pfc);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:92

  -- CEE DCBX std supported values  
  --*
  -- * struct cee_pg - CEE Priority-Group managed object
  -- *
  -- * @willing: willing bit in the PG tlv
  -- * @error: error bit in the PG tlv
  -- * @pg_en: enable bit of the PG feature
  -- * @tcs_supported: number of traffic classes supported
  -- * @pg_bw: bandwidth percentage for each priority group
  -- * @prio_pg: priority to PG mapping indexed by priority
  --  

   type cee_pg_pg_bw_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type cee_pg_prio_pg_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type cee_pg is record
      willing : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:116
      error : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:117
      pg_en : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:118
      tcs_supported : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:119
      pg_bw : aliased cee_pg_pg_bw_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:120
      prio_pg : aliased cee_pg_prio_pg_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:121
   end record;
   pragma Convention (C_Pass_By_Copy, cee_pg);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:115

  --*
  -- * struct cee_pfc - CEE PFC managed object
  -- *
  -- * @willing: willing bit in the PFC tlv
  -- * @error: error bit in the PFC tlv
  -- * @pfc_en: bitmap indicating pfc enabled traffic classes
  -- * @tcs_supported: number of traffic classes supported
  --  

   type cee_pfc is record
      willing : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:133
      error : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:134
      pfc_en : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:135
      tcs_supported : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:136
   end record;
   pragma Convention (C_Pass_By_Copy, cee_pfc);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:132

  -- IEEE 802.1Qaz std supported values  
  -- This structure contains the IEEE 802.1Qaz APP managed object. This
  -- * object is also used for the CEE std as well. There is no difference
  -- * between the objects.
  -- *
  -- * @selector: protocol identifier type
  -- * @protocol: protocol of type indicated
  -- * @priority: 3-bit unsigned integer indicating priority
  -- *
  -- * ----
  -- *  Selector field values
  -- *	0	Reserved
  -- *	1	Ethertype
  -- *	2	Well known port number over TCP or SCTP
  -- *	3	Well known port number over UDP or DCCP
  -- *	4	Well known port number over TCP, SCTP, UDP, or DCCP
  -- *	5-7	Reserved
  --  

   type dcb_app is record
      selector : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:163
      priority : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:164
      protocol : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:165
   end record;
   pragma Convention (C_Pass_By_Copy, dcb_app);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:162

  --*
  -- * struct dcb_peer_app_info - APP feature information sent by the peer
  -- *
  -- * @willing: willing bit in the peer APP tlv
  -- * @error: error bit in the peer APP tlv
  -- *
  -- * In addition to this information the full peer APP tlv also contains
  -- * a table of 'app_count' APP objects defined above.
  --  

   type dcb_peer_app_info is record
      willing : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:178
      error : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:179
   end record;
   pragma Convention (C_Pass_By_Copy, dcb_peer_app_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:177

   type dcbmsg is record
      dcb_family : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:183
      cmd : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:184
      dcb_pad : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:185
   end record;
   pragma Convention (C_Pass_By_Copy, dcbmsg);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:182

  --*
  -- * enum dcbnl_commands - supported DCB commands
  -- *
  -- * @DCB_CMD_UNDEFINED: unspecified command to catch errors
  -- * @DCB_CMD_GSTATE: request the state of DCB in the device
  -- * @DCB_CMD_SSTATE: set the state of DCB in the device
  -- * @DCB_CMD_PGTX_GCFG: request the priority group configuration for Tx
  -- * @DCB_CMD_PGTX_SCFG: set the priority group configuration for Tx
  -- * @DCB_CMD_PGRX_GCFG: request the priority group configuration for Rx
  -- * @DCB_CMD_PGRX_SCFG: set the priority group configuration for Rx
  -- * @DCB_CMD_PFC_GCFG: request the priority flow control configuration
  -- * @DCB_CMD_PFC_SCFG: set the priority flow control configuration
  -- * @DCB_CMD_SET_ALL: apply all changes to the underlying device
  -- * @DCB_CMD_GPERM_HWADDR: get the permanent MAC address of the underlying
  -- *                        device.  Only useful when using bonding.
  -- * @DCB_CMD_GCAP: request the DCB capabilities of the device
  -- * @DCB_CMD_GNUMTCS: get the number of traffic classes currently supported
  -- * @DCB_CMD_SNUMTCS: set the number of traffic classes
  -- * @DCB_CMD_GBCN: set backward congestion notification configuration
  -- * @DCB_CMD_SBCN: get backward congestion notification configration.
  -- * @DCB_CMD_GAPP: get application protocol configuration
  -- * @DCB_CMD_SAPP: set application protocol configuration
  -- * @DCB_CMD_IEEE_SET: set IEEE 802.1Qaz configuration
  -- * @DCB_CMD_IEEE_GET: get IEEE 802.1Qaz configuration
  -- * @DCB_CMD_GDCBX: get DCBX engine configuration
  -- * @DCB_CMD_SDCBX: set DCBX engine configuration
  -- * @DCB_CMD_GFEATCFG: get DCBX features flags
  -- * @DCB_CMD_SFEATCFG: set DCBX features negotiation flags
  -- * @DCB_CMD_CEE_GET: get CEE aggregated configuration
  -- * @DCB_CMD_IEEE_DEL: delete IEEE 802.1Qaz configuration
  --  

   subtype dcbnl_commands is unsigned;
   DCB_CMD_UNDEFINED : constant dcbnl_commands := 0;
   DCB_CMD_GSTATE : constant dcbnl_commands := 1;
   DCB_CMD_SSTATE : constant dcbnl_commands := 2;
   DCB_CMD_PGTX_GCFG : constant dcbnl_commands := 3;
   DCB_CMD_PGTX_SCFG : constant dcbnl_commands := 4;
   DCB_CMD_PGRX_GCFG : constant dcbnl_commands := 5;
   DCB_CMD_PGRX_SCFG : constant dcbnl_commands := 6;
   DCB_CMD_PFC_GCFG : constant dcbnl_commands := 7;
   DCB_CMD_PFC_SCFG : constant dcbnl_commands := 8;
   DCB_CMD_SET_ALL : constant dcbnl_commands := 9;
   DCB_CMD_GPERM_HWADDR : constant dcbnl_commands := 10;
   DCB_CMD_GCAP : constant dcbnl_commands := 11;
   DCB_CMD_GNUMTCS : constant dcbnl_commands := 12;
   DCB_CMD_SNUMTCS : constant dcbnl_commands := 13;
   DCB_CMD_PFC_GSTATE : constant dcbnl_commands := 14;
   DCB_CMD_PFC_SSTATE : constant dcbnl_commands := 15;
   DCB_CMD_BCN_GCFG : constant dcbnl_commands := 16;
   DCB_CMD_BCN_SCFG : constant dcbnl_commands := 17;
   DCB_CMD_GAPP : constant dcbnl_commands := 18;
   DCB_CMD_SAPP : constant dcbnl_commands := 19;
   DCB_CMD_IEEE_SET : constant dcbnl_commands := 20;
   DCB_CMD_IEEE_GET : constant dcbnl_commands := 21;
   DCB_CMD_GDCBX : constant dcbnl_commands := 22;
   DCB_CMD_SDCBX : constant dcbnl_commands := 23;
   DCB_CMD_GFEATCFG : constant dcbnl_commands := 24;
   DCB_CMD_SFEATCFG : constant dcbnl_commands := 25;
   DCB_CMD_CEE_GET : constant dcbnl_commands := 26;
   DCB_CMD_IEEE_DEL : constant dcbnl_commands := 27;
   uu_DCB_CMD_ENUM_MAX : constant dcbnl_commands := 28;
   DCB_CMD_MAX : constant dcbnl_commands := 27;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:219

  --*
  -- * enum dcbnl_attrs - DCB top-level netlink attributes
  -- *
  -- * @DCB_ATTR_UNDEFINED: unspecified attribute to catch errors
  -- * @DCB_ATTR_IFNAME: interface name of the underlying device (NLA_STRING)
  -- * @DCB_ATTR_STATE: enable state of DCB in the device (NLA_U8)
  -- * @DCB_ATTR_PFC_STATE: enable state of PFC in the device (NLA_U8)
  -- * @DCB_ATTR_PFC_CFG: priority flow control configuration (NLA_NESTED)
  -- * @DCB_ATTR_NUM_TC: number of traffic classes supported in the device (NLA_U8)
  -- * @DCB_ATTR_PG_CFG: priority group configuration (NLA_NESTED)
  -- * @DCB_ATTR_SET_ALL: bool to commit changes to hardware or not (NLA_U8)
  -- * @DCB_ATTR_PERM_HWADDR: MAC address of the physical device (NLA_NESTED)
  -- * @DCB_ATTR_CAP: DCB capabilities of the device (NLA_NESTED)
  -- * @DCB_ATTR_NUMTCS: number of traffic classes supported (NLA_NESTED)
  -- * @DCB_ATTR_BCN: backward congestion notification configuration (NLA_NESTED)
  -- * @DCB_ATTR_IEEE: IEEE 802.1Qaz supported attributes (NLA_NESTED)
  -- * @DCB_ATTR_DCBX: DCBX engine configuration in the device (NLA_U8)
  -- * @DCB_ATTR_FEATCFG: DCBX features flags (NLA_NESTED)
  -- * @DCB_ATTR_CEE: CEE std supported attributes (NLA_NESTED)
  --  

   subtype dcbnl_attrs is unsigned;
   DCB_ATTR_UNDEFINED : constant dcbnl_attrs := 0;
   DCB_ATTR_IFNAME : constant dcbnl_attrs := 1;
   DCB_ATTR_STATE : constant dcbnl_attrs := 2;
   DCB_ATTR_PFC_STATE : constant dcbnl_attrs := 3;
   DCB_ATTR_PFC_CFG : constant dcbnl_attrs := 4;
   DCB_ATTR_NUM_TC : constant dcbnl_attrs := 5;
   DCB_ATTR_PG_CFG : constant dcbnl_attrs := 6;
   DCB_ATTR_SET_ALL : constant dcbnl_attrs := 7;
   DCB_ATTR_PERM_HWADDR : constant dcbnl_attrs := 8;
   DCB_ATTR_CAP : constant dcbnl_attrs := 9;
   DCB_ATTR_NUMTCS : constant dcbnl_attrs := 10;
   DCB_ATTR_BCN : constant dcbnl_attrs := 11;
   DCB_ATTR_APP : constant dcbnl_attrs := 12;
   DCB_ATTR_IEEE : constant dcbnl_attrs := 13;
   DCB_ATTR_DCBX : constant dcbnl_attrs := 14;
   DCB_ATTR_FEATCFG : constant dcbnl_attrs := 15;
   DCB_ATTR_CEE : constant dcbnl_attrs := 16;
   uu_DCB_ATTR_ENUM_MAX : constant dcbnl_attrs := 17;
   DCB_ATTR_MAX : constant dcbnl_attrs := 16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:287

  -- IEEE std attributes  
  -- CEE nested attributes  
  --*
  -- * enum ieee_attrs - IEEE 802.1Qaz get/set attributes
  -- *
  -- * @DCB_ATTR_IEEE_UNSPEC: unspecified
  -- * @DCB_ATTR_IEEE_ETS: negotiated ETS configuration
  -- * @DCB_ATTR_IEEE_PFC: negotiated PFC configuration
  -- * @DCB_ATTR_IEEE_APP_TABLE: negotiated APP configuration
  -- * @DCB_ATTR_IEEE_PEER_ETS: peer ETS configuration - get only
  -- * @DCB_ATTR_IEEE_PEER_PFC: peer PFC configuration - get only
  -- * @DCB_ATTR_IEEE_PEER_APP: peer APP tlv - get only
  --  

   type ieee_attrs is 
     (DCB_ATTR_IEEE_UNSPEC,
      DCB_ATTR_IEEE_ETS,
      DCB_ATTR_IEEE_PFC,
      DCB_ATTR_IEEE_APP_TABLE,
      DCB_ATTR_IEEE_PEER_ETS,
      DCB_ATTR_IEEE_PEER_PFC,
      DCB_ATTR_IEEE_PEER_APP,
      DCB_ATTR_IEEE_MAXRATE,
      uu_DCB_ATTR_IEEE_MAX);
   pragma Convention (C, ieee_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:327

   type ieee_attrs_app is 
     (DCB_ATTR_IEEE_APP_UNSPEC,
      DCB_ATTR_IEEE_APP,
      uu_DCB_ATTR_IEEE_APP_MAX);
   pragma Convention (C, ieee_attrs_app);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:340

  --*
  -- * enum cee_attrs - CEE DCBX get attributes.
  -- *
  -- * @DCB_ATTR_CEE_UNSPEC: unspecified
  -- * @DCB_ATTR_CEE_PEER_PG: peer PG configuration - get only
  -- * @DCB_ATTR_CEE_PEER_PFC: peer PFC configuration - get only
  -- * @DCB_ATTR_CEE_PEER_APP_TABLE: peer APP tlv - get only
  -- * @DCB_ATTR_CEE_TX_PG: TX PG configuration (DCB_CMD_PGTX_GCFG)
  -- * @DCB_ATTR_CEE_RX_PG: RX PG configuration (DCB_CMD_PGRX_GCFG)
  -- * @DCB_ATTR_CEE_PFC: PFC configuration (DCB_CMD_PFC_GCFG)
  -- * @DCB_ATTR_CEE_APP_TABLE: APP configuration (multi DCB_CMD_GAPP)
  -- * @DCB_ATTR_CEE_FEAT: DCBX features flags (DCB_CMD_GFEATCFG)
  -- *
  -- * An aggregated collection of the cee std negotiated parameters.
  --  

   type cee_attrs is 
     (DCB_ATTR_CEE_UNSPEC,
      DCB_ATTR_CEE_PEER_PG,
      DCB_ATTR_CEE_PEER_PFC,
      DCB_ATTR_CEE_PEER_APP_TABLE,
      DCB_ATTR_CEE_TX_PG,
      DCB_ATTR_CEE_RX_PG,
      DCB_ATTR_CEE_PFC,
      DCB_ATTR_CEE_APP_TABLE,
      DCB_ATTR_CEE_FEAT,
      uu_DCB_ATTR_CEE_MAX);
   pragma Convention (C, cee_attrs);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:362

   type peer_app_attr is 
     (DCB_ATTR_CEE_PEER_APP_UNSPEC,
      DCB_ATTR_CEE_PEER_APP_INFO,
      DCB_ATTR_CEE_PEER_APP,
      uu_DCB_ATTR_CEE_PEER_APP_MAX);
   pragma Convention (C, peer_app_attr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:376

   type cee_attrs_app is 
     (DCB_ATTR_CEE_APP_UNSPEC,
      DCB_ATTR_CEE_APP,
      uu_DCB_ATTR_CEE_APP_MAX);
   pragma Convention (C, cee_attrs_app);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:384

  --*
  -- * enum dcbnl_pfc_attrs - DCB Priority Flow Control user priority nested attrs
  -- *
  -- * @DCB_PFC_UP_ATTR_UNDEFINED: unspecified attribute to catch errors
  -- * @DCB_PFC_UP_ATTR_0: Priority Flow Control value for User Priority 0 (NLA_U8)
  -- * @DCB_PFC_UP_ATTR_1: Priority Flow Control value for User Priority 1 (NLA_U8)
  -- * @DCB_PFC_UP_ATTR_2: Priority Flow Control value for User Priority 2 (NLA_U8)
  -- * @DCB_PFC_UP_ATTR_3: Priority Flow Control value for User Priority 3 (NLA_U8)
  -- * @DCB_PFC_UP_ATTR_4: Priority Flow Control value for User Priority 4 (NLA_U8)
  -- * @DCB_PFC_UP_ATTR_5: Priority Flow Control value for User Priority 5 (NLA_U8)
  -- * @DCB_PFC_UP_ATTR_6: Priority Flow Control value for User Priority 6 (NLA_U8)
  -- * @DCB_PFC_UP_ATTR_7: Priority Flow Control value for User Priority 7 (NLA_U8)
  -- * @DCB_PFC_UP_ATTR_MAX: highest attribute number currently defined
  -- * @DCB_PFC_UP_ATTR_ALL: apply to all priority flow control attrs (NLA_FLAG)
  -- *
  --  

   subtype dcbnl_pfc_up_attrs is unsigned;
   DCB_PFC_UP_ATTR_UNDEFINED : constant dcbnl_pfc_up_attrs := 0;
   DCB_PFC_UP_ATTR_0 : constant dcbnl_pfc_up_attrs := 1;
   DCB_PFC_UP_ATTR_1 : constant dcbnl_pfc_up_attrs := 2;
   DCB_PFC_UP_ATTR_2 : constant dcbnl_pfc_up_attrs := 3;
   DCB_PFC_UP_ATTR_3 : constant dcbnl_pfc_up_attrs := 4;
   DCB_PFC_UP_ATTR_4 : constant dcbnl_pfc_up_attrs := 5;
   DCB_PFC_UP_ATTR_5 : constant dcbnl_pfc_up_attrs := 6;
   DCB_PFC_UP_ATTR_6 : constant dcbnl_pfc_up_attrs := 7;
   DCB_PFC_UP_ATTR_7 : constant dcbnl_pfc_up_attrs := 8;
   DCB_PFC_UP_ATTR_ALL : constant dcbnl_pfc_up_attrs := 9;
   uu_DCB_PFC_UP_ATTR_ENUM_MAX : constant dcbnl_pfc_up_attrs := 10;
   DCB_PFC_UP_ATTR_MAX : constant dcbnl_pfc_up_attrs := 9;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:407

  --*
  -- * enum dcbnl_pg_attrs - DCB Priority Group attributes
  -- *
  -- * @DCB_PG_ATTR_UNDEFINED: unspecified attribute to catch errors
  -- * @DCB_PG_ATTR_TC_0: Priority Group Traffic Class 0 configuration (NLA_NESTED)
  -- * @DCB_PG_ATTR_TC_1: Priority Group Traffic Class 1 configuration (NLA_NESTED)
  -- * @DCB_PG_ATTR_TC_2: Priority Group Traffic Class 2 configuration (NLA_NESTED)
  -- * @DCB_PG_ATTR_TC_3: Priority Group Traffic Class 3 configuration (NLA_NESTED)
  -- * @DCB_PG_ATTR_TC_4: Priority Group Traffic Class 4 configuration (NLA_NESTED)
  -- * @DCB_PG_ATTR_TC_5: Priority Group Traffic Class 5 configuration (NLA_NESTED)
  -- * @DCB_PG_ATTR_TC_6: Priority Group Traffic Class 6 configuration (NLA_NESTED)
  -- * @DCB_PG_ATTR_TC_7: Priority Group Traffic Class 7 configuration (NLA_NESTED)
  -- * @DCB_PG_ATTR_TC_MAX: highest attribute number currently defined
  -- * @DCB_PG_ATTR_TC_ALL: apply to all traffic classes (NLA_NESTED)
  -- * @DCB_PG_ATTR_BW_ID_0: Percent of link bandwidth for Priority Group 0 (NLA_U8)
  -- * @DCB_PG_ATTR_BW_ID_1: Percent of link bandwidth for Priority Group 1 (NLA_U8)
  -- * @DCB_PG_ATTR_BW_ID_2: Percent of link bandwidth for Priority Group 2 (NLA_U8)
  -- * @DCB_PG_ATTR_BW_ID_3: Percent of link bandwidth for Priority Group 3 (NLA_U8)
  -- * @DCB_PG_ATTR_BW_ID_4: Percent of link bandwidth for Priority Group 4 (NLA_U8)
  -- * @DCB_PG_ATTR_BW_ID_5: Percent of link bandwidth for Priority Group 5 (NLA_U8)
  -- * @DCB_PG_ATTR_BW_ID_6: Percent of link bandwidth for Priority Group 6 (NLA_U8)
  -- * @DCB_PG_ATTR_BW_ID_7: Percent of link bandwidth for Priority Group 7 (NLA_U8)
  -- * @DCB_PG_ATTR_BW_ID_MAX: highest attribute number currently defined
  -- * @DCB_PG_ATTR_BW_ID_ALL: apply to all priority groups (NLA_FLAG)
  -- *
  --  

   subtype dcbnl_pg_attrs is unsigned;
   DCB_PG_ATTR_UNDEFINED : constant dcbnl_pg_attrs := 0;
   DCB_PG_ATTR_TC_0 : constant dcbnl_pg_attrs := 1;
   DCB_PG_ATTR_TC_1 : constant dcbnl_pg_attrs := 2;
   DCB_PG_ATTR_TC_2 : constant dcbnl_pg_attrs := 3;
   DCB_PG_ATTR_TC_3 : constant dcbnl_pg_attrs := 4;
   DCB_PG_ATTR_TC_4 : constant dcbnl_pg_attrs := 5;
   DCB_PG_ATTR_TC_5 : constant dcbnl_pg_attrs := 6;
   DCB_PG_ATTR_TC_6 : constant dcbnl_pg_attrs := 7;
   DCB_PG_ATTR_TC_7 : constant dcbnl_pg_attrs := 8;
   DCB_PG_ATTR_TC_MAX : constant dcbnl_pg_attrs := 9;
   DCB_PG_ATTR_TC_ALL : constant dcbnl_pg_attrs := 10;
   DCB_PG_ATTR_BW_ID_0 : constant dcbnl_pg_attrs := 11;
   DCB_PG_ATTR_BW_ID_1 : constant dcbnl_pg_attrs := 12;
   DCB_PG_ATTR_BW_ID_2 : constant dcbnl_pg_attrs := 13;
   DCB_PG_ATTR_BW_ID_3 : constant dcbnl_pg_attrs := 14;
   DCB_PG_ATTR_BW_ID_4 : constant dcbnl_pg_attrs := 15;
   DCB_PG_ATTR_BW_ID_5 : constant dcbnl_pg_attrs := 16;
   DCB_PG_ATTR_BW_ID_6 : constant dcbnl_pg_attrs := 17;
   DCB_PG_ATTR_BW_ID_7 : constant dcbnl_pg_attrs := 18;
   DCB_PG_ATTR_BW_ID_MAX : constant dcbnl_pg_attrs := 19;
   DCB_PG_ATTR_BW_ID_ALL : constant dcbnl_pg_attrs := 20;
   uu_DCB_PG_ATTR_ENUM_MAX : constant dcbnl_pg_attrs := 21;
   DCB_PG_ATTR_MAX : constant dcbnl_pg_attrs := 20;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:450

  --*
  -- * enum dcbnl_tc_attrs - DCB Traffic Class attributes
  -- *
  -- * @DCB_TC_ATTR_PARAM_UNDEFINED: unspecified attribute to catch errors
  -- * @DCB_TC_ATTR_PARAM_PGID: (NLA_U8) Priority group the traffic class belongs to
  -- *                          Valid values are:  0-7
  -- * @DCB_TC_ATTR_PARAM_UP_MAPPING: (NLA_U8) Traffic class to user priority map
  -- *                                Some devices may not support changing the
  -- *                                user priority map of a TC.
  -- * @DCB_TC_ATTR_PARAM_STRICT_PRIO: (NLA_U8) Strict priority setting
  -- *                                 0 - none
  -- *                                 1 - group strict
  -- *                                 2 - link strict
  -- * @DCB_TC_ATTR_PARAM_BW_PCT: optional - (NLA_U8) If supported by the device and
  -- *                            not configured to use link strict priority,
  -- *                            this is the percentage of bandwidth of the
  -- *                            priority group this traffic class belongs to
  -- * @DCB_TC_ATTR_PARAM_ALL: (NLA_FLAG) all traffic class parameters
  -- *
  --  

   subtype dcbnl_tc_attrs is unsigned;
   DCB_TC_ATTR_PARAM_UNDEFINED : constant dcbnl_tc_attrs := 0;
   DCB_TC_ATTR_PARAM_PGID : constant dcbnl_tc_attrs := 1;
   DCB_TC_ATTR_PARAM_UP_MAPPING : constant dcbnl_tc_attrs := 2;
   DCB_TC_ATTR_PARAM_STRICT_PRIO : constant dcbnl_tc_attrs := 3;
   DCB_TC_ATTR_PARAM_BW_PCT : constant dcbnl_tc_attrs := 4;
   DCB_TC_ATTR_PARAM_ALL : constant dcbnl_tc_attrs := 5;
   uu_DCB_TC_ATTR_PARAM_ENUM_MAX : constant dcbnl_tc_attrs := 6;
   DCB_TC_ATTR_PARAM_MAX : constant dcbnl_tc_attrs := 5;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:499

  --*
  -- * enum dcbnl_cap_attrs - DCB Capability attributes
  -- *
  -- * @DCB_CAP_ATTR_UNDEFINED: unspecified attribute to catch errors
  -- * @DCB_CAP_ATTR_ALL: (NLA_FLAG) all capability parameters
  -- * @DCB_CAP_ATTR_PG: (NLA_U8) device supports Priority Groups
  -- * @DCB_CAP_ATTR_PFC: (NLA_U8) device supports Priority Flow Control
  -- * @DCB_CAP_ATTR_UP2TC: (NLA_U8) device supports user priority to
  -- *                               traffic class mapping
  -- * @DCB_CAP_ATTR_PG_TCS: (NLA_U8) bitmap where each bit represents a
  -- *                                number of traffic classes the device
  -- *                                can be configured to use for Priority Groups
  -- * @DCB_CAP_ATTR_PFC_TCS: (NLA_U8) bitmap where each bit represents a
  -- *                                 number of traffic classes the device can be
  -- *                                 configured to use for Priority Flow Control
  -- * @DCB_CAP_ATTR_GSP: (NLA_U8) device supports group strict priority
  -- * @DCB_CAP_ATTR_BCN: (NLA_U8) device supports Backwards Congestion
  -- *                             Notification
  -- * @DCB_CAP_ATTR_DCBX: (NLA_U8) device supports DCBX engine
  -- *
  --  

   subtype dcbnl_cap_attrs is unsigned;
   DCB_CAP_ATTR_UNDEFINED : constant dcbnl_cap_attrs := 0;
   DCB_CAP_ATTR_ALL : constant dcbnl_cap_attrs := 1;
   DCB_CAP_ATTR_PG : constant dcbnl_cap_attrs := 2;
   DCB_CAP_ATTR_PFC : constant dcbnl_cap_attrs := 3;
   DCB_CAP_ATTR_UP2TC : constant dcbnl_cap_attrs := 4;
   DCB_CAP_ATTR_PG_TCS : constant dcbnl_cap_attrs := 5;
   DCB_CAP_ATTR_PFC_TCS : constant dcbnl_cap_attrs := 6;
   DCB_CAP_ATTR_GSP : constant dcbnl_cap_attrs := 7;
   DCB_CAP_ATTR_BCN : constant dcbnl_cap_attrs := 8;
   DCB_CAP_ATTR_DCBX : constant dcbnl_cap_attrs := 9;
   uu_DCB_CAP_ATTR_ENUM_MAX : constant dcbnl_cap_attrs := 10;
   DCB_CAP_ATTR_MAX : constant dcbnl_cap_attrs := 9;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:533

  --*
  -- * DCBX capability flags
  -- *
  -- * @DCB_CAP_DCBX_HOST: DCBX negotiation is performed by the host LLDP agent.
  -- *                     'set' routines are used to configure the device with
  -- *                     the negotiated parameters
  -- *
  -- * @DCB_CAP_DCBX_LLD_MANAGED: DCBX negotiation is not performed in the host but
  -- *                            by another entity
  -- *                            'get' routines are used to retrieve the
  -- *                            negotiated parameters
  -- *                            'set' routines can be used to set the initial
  -- *                            negotiation configuration
  -- *
  -- * @DCB_CAP_DCBX_VER_CEE: for a non-host DCBX engine, indicates the engine
  -- *                        supports the CEE protocol flavor
  -- *
  -- * @DCB_CAP_DCBX_VER_IEEE: for a non-host DCBX engine, indicates the engine
  -- *                         supports the IEEE protocol flavor
  -- *
  -- * @DCB_CAP_DCBX_STATIC: for a non-host DCBX engine, indicates the engine
  -- *                       supports static configuration (i.e no actual
  -- *                       negotiation is performed negotiated parameters equal
  -- *                       the initial configuration)
  -- *
  --  

  --*
  -- * enum dcbnl_numtcs_attrs - number of traffic classes
  -- *
  -- * @DCB_NUMTCS_ATTR_UNDEFINED: unspecified attribute to catch errors
  -- * @DCB_NUMTCS_ATTR_ALL: (NLA_FLAG) all traffic class attributes
  -- * @DCB_NUMTCS_ATTR_PG: (NLA_U8) number of traffic classes used for
  -- *                               priority groups
  -- * @DCB_NUMTCS_ATTR_PFC: (NLA_U8) number of traffic classes which can
  -- *                                support priority flow control
  --  

   subtype dcbnl_numtcs_attrs is unsigned;
   DCB_NUMTCS_ATTR_UNDEFINED : constant dcbnl_numtcs_attrs := 0;
   DCB_NUMTCS_ATTR_ALL : constant dcbnl_numtcs_attrs := 1;
   DCB_NUMTCS_ATTR_PG : constant dcbnl_numtcs_attrs := 2;
   DCB_NUMTCS_ATTR_PFC : constant dcbnl_numtcs_attrs := 3;
   uu_DCB_NUMTCS_ATTR_ENUM_MAX : constant dcbnl_numtcs_attrs := 4;
   DCB_NUMTCS_ATTR_MAX : constant dcbnl_numtcs_attrs := 3;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:591

   subtype dcbnl_bcn_attrs is unsigned;
   DCB_BCN_ATTR_UNDEFINED : constant dcbnl_bcn_attrs := 0;
   DCB_BCN_ATTR_RP_0 : constant dcbnl_bcn_attrs := 1;
   DCB_BCN_ATTR_RP_1 : constant dcbnl_bcn_attrs := 2;
   DCB_BCN_ATTR_RP_2 : constant dcbnl_bcn_attrs := 3;
   DCB_BCN_ATTR_RP_3 : constant dcbnl_bcn_attrs := 4;
   DCB_BCN_ATTR_RP_4 : constant dcbnl_bcn_attrs := 5;
   DCB_BCN_ATTR_RP_5 : constant dcbnl_bcn_attrs := 6;
   DCB_BCN_ATTR_RP_6 : constant dcbnl_bcn_attrs := 7;
   DCB_BCN_ATTR_RP_7 : constant dcbnl_bcn_attrs := 8;
   DCB_BCN_ATTR_RP_ALL : constant dcbnl_bcn_attrs := 9;
   DCB_BCN_ATTR_BCNA_0 : constant dcbnl_bcn_attrs := 10;
   DCB_BCN_ATTR_BCNA_1 : constant dcbnl_bcn_attrs := 11;
   DCB_BCN_ATTR_ALPHA : constant dcbnl_bcn_attrs := 12;
   DCB_BCN_ATTR_BETA : constant dcbnl_bcn_attrs := 13;
   DCB_BCN_ATTR_GD : constant dcbnl_bcn_attrs := 14;
   DCB_BCN_ATTR_GI : constant dcbnl_bcn_attrs := 15;
   DCB_BCN_ATTR_TMAX : constant dcbnl_bcn_attrs := 16;
   DCB_BCN_ATTR_TD : constant dcbnl_bcn_attrs := 17;
   DCB_BCN_ATTR_RMIN : constant dcbnl_bcn_attrs := 18;
   DCB_BCN_ATTR_W : constant dcbnl_bcn_attrs := 19;
   DCB_BCN_ATTR_RD : constant dcbnl_bcn_attrs := 20;
   DCB_BCN_ATTR_RU : constant dcbnl_bcn_attrs := 21;
   DCB_BCN_ATTR_WRTT : constant dcbnl_bcn_attrs := 22;
   DCB_BCN_ATTR_RI : constant dcbnl_bcn_attrs := 23;
   DCB_BCN_ATTR_C : constant dcbnl_bcn_attrs := 24;
   DCB_BCN_ATTR_ALL : constant dcbnl_bcn_attrs := 25;
   uu_DCB_BCN_ATTR_ENUM_MAX : constant dcbnl_bcn_attrs := 26;
   DCB_BCN_ATTR_MAX : constant dcbnl_bcn_attrs := 25;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:601

  --*
  -- * enum dcb_general_attr_values - general DCB attribute values
  -- *
  -- * @DCB_ATTR_UNDEFINED: value used to indicate an attribute is not supported
  -- *
  --  

   subtype dcb_general_attr_values is unsigned;
   DCB_ATTR_VALUE_UNDEFINED : constant dcb_general_attr_values := 255;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:641

   subtype dcbnl_app_attrs is unsigned;
   DCB_APP_ATTR_UNDEFINED : constant dcbnl_app_attrs := 0;
   DCB_APP_ATTR_IDTYPE : constant dcbnl_app_attrs := 1;
   DCB_APP_ATTR_ID : constant dcbnl_app_attrs := 2;
   DCB_APP_ATTR_PRIORITY : constant dcbnl_app_attrs := 3;
   uu_DCB_APP_ATTR_ENUM_MAX : constant dcbnl_app_attrs := 4;
   DCB_APP_ATTR_MAX : constant dcbnl_app_attrs := 3;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:647

  --*
  -- * enum dcbnl_featcfg_attrs - features conifiguration flags
  -- *
  -- * @DCB_FEATCFG_ATTR_UNDEFINED: unspecified attribute to catch errors
  -- * @DCB_FEATCFG_ATTR_ALL: (NLA_FLAG) all features configuration attributes
  -- * @DCB_FEATCFG_ATTR_PG: (NLA_U8) configuration flags for priority groups
  -- * @DCB_FEATCFG_ATTR_PFC: (NLA_U8) configuration flags for priority
  -- *                                 flow control
  -- * @DCB_FEATCFG_ATTR_APP: (NLA_U8) configuration flags for application TLV
  -- *
  --  

   subtype dcbnl_featcfg_attrs is unsigned;
   DCB_FEATCFG_ATTR_UNDEFINED : constant dcbnl_featcfg_attrs := 0;
   DCB_FEATCFG_ATTR_ALL : constant dcbnl_featcfg_attrs := 1;
   DCB_FEATCFG_ATTR_PG : constant dcbnl_featcfg_attrs := 2;
   DCB_FEATCFG_ATTR_PFC : constant dcbnl_featcfg_attrs := 3;
   DCB_FEATCFG_ATTR_APP : constant dcbnl_featcfg_attrs := 4;
   uu_DCB_FEATCFG_ATTR_ENUM_MAX : constant dcbnl_featcfg_attrs := 5;
   DCB_FEATCFG_ATTR_MAX : constant dcbnl_featcfg_attrs := 4;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/dcbnl.h:673

end uapi_linux_dcbnl_h;

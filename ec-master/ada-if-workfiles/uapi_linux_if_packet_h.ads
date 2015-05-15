pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_types_h;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_if_packet_h is

   --  unsupported macro: PACKET_HOST 0
   --  unsupported macro: PACKET_BROADCAST 1
   --  unsupported macro: PACKET_MULTICAST 2
   --  unsupported macro: PACKET_OTHERHOST 3
   --  unsupported macro: PACKET_OUTGOING 4
   --  unsupported macro: PACKET_LOOPBACK 5
   --  unsupported macro: PACKET_USER 6
   --  unsupported macro: PACKET_KERNEL 7
   --  unsupported macro: PACKET_FASTROUTE 6
   --  unsupported macro: PACKET_ADD_MEMBERSHIP 1
   --  unsupported macro: PACKET_DROP_MEMBERSHIP 2
   --  unsupported macro: PACKET_RECV_OUTPUT 3
   --  unsupported macro: PACKET_RX_RING 5
   --  unsupported macro: PACKET_STATISTICS 6
   --  unsupported macro: PACKET_COPY_THRESH 7
   --  unsupported macro: PACKET_AUXDATA 8
   --  unsupported macro: PACKET_ORIGDEV 9
   --  unsupported macro: PACKET_VERSION 10
   --  unsupported macro: PACKET_HDRLEN 11
   --  unsupported macro: PACKET_RESERVE 12
   --  unsupported macro: PACKET_TX_RING 13
   --  unsupported macro: PACKET_LOSS 14
   --  unsupported macro: PACKET_VNET_HDR 15
   --  unsupported macro: PACKET_TX_TIMESTAMP 16
   --  unsupported macro: PACKET_TIMESTAMP 17
   --  unsupported macro: PACKET_FANOUT 18
   --  unsupported macro: PACKET_TX_HAS_OFF 19
   --  unsupported macro: PACKET_QDISC_BYPASS 20
   --  unsupported macro: PACKET_FANOUT_HASH 0
   --  unsupported macro: PACKET_FANOUT_LB 1
   --  unsupported macro: PACKET_FANOUT_CPU 2
   --  unsupported macro: PACKET_FANOUT_ROLLOVER 3
   --  unsupported macro: PACKET_FANOUT_RND 4
   --  unsupported macro: PACKET_FANOUT_QM 5
   --  unsupported macro: PACKET_FANOUT_FLAG_ROLLOVER 0x1000
   --  unsupported macro: PACKET_FANOUT_FLAG_DEFRAG 0x8000
   --  unsupported macro: TP_STATUS_KERNEL 0
   --  unsupported macro: TP_STATUS_USER (1 << 0)
   --  unsupported macro: TP_STATUS_COPY (1 << 1)
   --  unsupported macro: TP_STATUS_LOSING (1 << 2)
   --  unsupported macro: TP_STATUS_CSUMNOTREADY (1 << 3)
   --  unsupported macro: TP_STATUS_VLAN_VALID (1 << 4)
   --  unsupported macro: TP_STATUS_BLK_TMO (1 << 5)
   --  unsupported macro: TP_STATUS_VLAN_TPID_VALID (1 << 6)
   --  unsupported macro: TP_STATUS_AVAILABLE 0
   --  unsupported macro: TP_STATUS_SEND_REQUEST (1 << 0)
   --  unsupported macro: TP_STATUS_SENDING (1 << 1)
   --  unsupported macro: TP_STATUS_WRONG_FORMAT (1 << 2)
   --  unsupported macro: TP_STATUS_TS_SOFTWARE (1 << 29)
   --  unsupported macro: TP_STATUS_TS_SYS_HARDWARE (1 << 30)
   --  unsupported macro: TP_STATUS_TS_RAW_HARDWARE (1 << 31)
   --  unsupported macro: TP_FT_REQ_FILL_RXHASH 0x1
   --  unsupported macro: TPACKET_ALIGNMENT 16
   --  arg-macro: function TPACKET_ALIGN (((x)+TPACKET_ALIGNMENT-1)and~(TPACKET_ALIGNMENT-1)
   --    return ((x)+TPACKET_ALIGNMENT-1)and~(TPACKET_ALIGNMENT-1);
   --  unsupported macro: TPACKET_HDRLEN (TPACKET_ALIGN(sizeof(struct tpacket_hdr)) + sizeof(struct sockaddr_ll))
   --  unsupported macro: TPACKET2_HDRLEN (TPACKET_ALIGN(sizeof(struct tpacket2_hdr)) + sizeof(struct sockaddr_ll))
   --  unsupported macro: TPACKET3_HDRLEN (TPACKET_ALIGN(sizeof(struct tpacket3_hdr)) + sizeof(struct sockaddr_ll))
   --  unsupported macro: PACKET_MR_MULTICAST 0
   --  unsupported macro: PACKET_MR_PROMISC 1
   --  unsupported macro: PACKET_MR_ALLMULTI 2
   --  unsupported macro: PACKET_MR_UNICAST 3
   type sockaddr_pkt_spkt_device_array is array (0 .. 13) of aliased unsigned_char;
   type sockaddr_pkt is record
      spkt_family : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:7
      spkt_device : aliased sockaddr_pkt_spkt_device_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:8
      spkt_protocol : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:9
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr_pkt);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:6

   type sockaddr_ll_sll_addr_array is array (0 .. 7) of aliased unsigned_char;
   type sockaddr_ll is record
      sll_family : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:13
      sll_protocol : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:14
      sll_ifindex : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:15
      sll_hatype : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:16
      sll_pkttype : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:17
      sll_halen : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:18
      sll_addr : aliased sockaddr_ll_sll_addr_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:19
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr_ll);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:12

  -- Packet types  
  -- Unused, PACKET_FASTROUTE and PACKET_LOOPBACK are invisible to user space  
  -- Packet socket options  
  -- Value 4 is still used by obsolete turbo-packet.  
   type tpacket_stats is record
      tp_packets : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:68
      tp_drops : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:69
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_stats);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:67

   type tpacket_stats_v3 is record
      tp_packets : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:73
      tp_drops : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:74
      tp_freeze_q_cnt : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:75
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_stats_v3);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:72

   type tpacket_stats_u (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            stats1 : aliased tpacket_stats;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:79
         when others =>
            stats3 : aliased tpacket_stats_v3;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:80
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_stats_u);
   pragma Unchecked_Union (tpacket_stats_u);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:78

   type tpacket_auxdata is record
      tp_status : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:84
      tp_len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:85
      tp_snaplen : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:86
      tp_mac : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:87
      tp_net : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:88
      tp_vlan_tci : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:89
      tp_vlan_tpid : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:90
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_auxdata);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:83

  -- Rx ring - header status  
  -- Tx ring - header status  
  -- Rx and Tx ring - header status  
  -- Rx ring - feature request bits  
   type tpacket_hdr is record
      tp_status : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:118
      tp_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:119
      tp_snaplen : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:120
      tp_mac : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:121
      tp_net : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:122
      tp_sec : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:123
      tp_usec : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:124
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_hdr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:117

   type tpacket2_hdr_tp_padding_array is array (0 .. 3) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type tpacket2_hdr is record
      tp_status : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:132
      tp_len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:133
      tp_snaplen : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:134
      tp_mac : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:135
      tp_net : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:136
      tp_sec : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:137
      tp_nsec : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:138
      tp_vlan_tci : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:139
      tp_vlan_tpid : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:140
      tp_padding : aliased tpacket2_hdr_tp_padding_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:141
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket2_hdr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:131

   type tpacket_hdr_variant1 is record
      tp_rxhash : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:145
      tp_vlan_tci : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:146
      tp_vlan_tpid : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:147
      tp_padding : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:148
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_hdr_variant1);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:144

   type tpacket3_hdr_tp_padding_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type anon_358 (discr : unsigned := 0) is record
      case discr is
         when others =>
            hv1 : aliased tpacket_hdr_variant1;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:162
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_358);
   pragma Unchecked_Union (anon_358);
   type tpacket3_hdr is record
      tp_next_offset : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:152
      tp_sec : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:153
      tp_nsec : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:154
      tp_snaplen : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:155
      tp_len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:156
      tp_status : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:157
      tp_mac : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:158
      tp_net : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:159
      field_9 : aliased anon_358;
      tp_padding : aliased tpacket3_hdr_tp_padding_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:164
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket3_hdr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:151

  -- pkt_hdr variants  
   type anon_359 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ts_usec : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:170
         when others =>
            ts_nsec : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:171
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_359);
   pragma Unchecked_Union (anon_359);
   type tpacket_bd_ts is record
      ts_sec : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:168
      field_2 : aliased anon_359;
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_bd_ts);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:167

   type tpacket_hdr_v1 is record
      block_status : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:176
      num_pkts : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:177
      offset_to_first_pkt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:178
      blk_len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:183
      seq_num : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:194
      ts_first_pkt : aliased tpacket_bd_ts;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:221
      ts_last_pkt : aliased tpacket_bd_ts;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:221
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_hdr_v1);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:175

  -- Number of valid bytes (including padding)
  --	 * blk_len <= tp_block_size
  --	  

  --	 * Quite a few uses of sequence number:
  --	 * 1. Make sure cache flush etc worked.
  --	 *    Well, one can argue - why not use the increasing ts below?
  --	 *    But look at 2. below first.
  --	 * 2. When you pass around blocks to other user space decoders,
  --	 *    you can see which blk[s] is[are] outstanding etc.
  --	 * 3. Validate kernel code.
  --	  

  --	 * ts_last_pkt:
  --	 *
  --	 * Case 1.	Block has 'N'(N >=1) packets and TMO'd(timed out)
  --	 *		ts_last_pkt == 'time-stamp of last packet' and NOT the
  --	 *		time when the timer fired and the block was closed.
  --	 *		By providing the ts of the last packet we can absolutely
  --	 *		guarantee that time-stamp wise, the first packet in the
  --	 *		next block will never precede the last packet of the
  --	 *		previous block.
  --	 * Case 2.	Block has zero packets and TMO'd
  --	 *		ts_last_pkt = time when the timer fired and the block
  --	 *		was closed.
  --	 * Case 3.	Block has 'N' packets and NO TMO.
  --	 *		ts_last_pkt = time-stamp of the last pkt in the block.
  --	 *
  --	 * ts_first_pkt:
  --	 *		Is always the time-stamp when the block was opened.
  --	 *		Case a)	ZERO packets
  --	 *			No packets to deal with but atleast you know the
  --	 *			time-interval of this block.
  --	 *		Case b) Non-zero packets
  --	 *			Use the ts of the first packet in the block.
  --	 *
  --	  

   type tpacket_bd_header_u (discr : unsigned := 0) is record
      case discr is
         when others =>
            bh1 : aliased tpacket_hdr_v1;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:225
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_bd_header_u);
   pragma Unchecked_Union (tpacket_bd_header_u);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:224

   type tpacket_block_desc is record
      version : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:229
      offset_to_priv : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:230
      hdr : tpacket_bd_header_u;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:231
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_block_desc);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:228

   type tpacket_versions is 
     (TPACKET_V1,
      TPACKET_V2,
      TPACKET_V3);
   pragma Convention (C, tpacket_versions);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:237

  --   Frame structure:
  --   - Start. Frame must be aligned to TPACKET_ALIGNMENT=16
  --   - struct tpacket_hdr
  --   - pad to TPACKET_ALIGNMENT=16
  --   - struct sockaddr_ll
  --   - Gap, chosen so that packet data (Start+tp_net) alignes to TPACKET_ALIGNMENT=16
  --   - Start+tp_mac: [ Optional MAC header ]
  --   - Start+tp_net: Packet data, aligned to TPACKET_ALIGNMENT=16.
  --   - Pad to align to TPACKET_ALIGNMENT=16
  --  

  -- Minimal size of contiguous block  
   type tpacket_req is record
      tp_block_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:257
      tp_block_nr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:258
      tp_frame_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:259
      tp_frame_nr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:260
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_req);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:256

  -- Number of blocks  
  -- Size of frame  
  -- Total number of frames  
  -- Minimal size of contiguous block  
   type tpacket_req3 is record
      tp_block_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:264
      tp_block_nr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:265
      tp_frame_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:266
      tp_frame_nr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:267
      tp_retire_blk_tov : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:268
      tp_sizeof_priv : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:269
      tp_feature_req_word : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:270
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_req3);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:263

  -- Number of blocks  
  -- Size of frame  
  -- Total number of frames  
  -- timeout in msecs  
  -- offset to private data area  
   type tpacket_req_u (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            req : aliased tpacket_req;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:274
         when others =>
            req3 : aliased tpacket_req3;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:275
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, tpacket_req_u);
   pragma Unchecked_Union (tpacket_req_u);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:273

   type packet_mreq_mr_address_array is array (0 .. 7) of aliased unsigned_char;
   type packet_mreq is record
      mr_ifindex : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:279
      mr_type : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:280
      mr_alen : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:281
      mr_address : aliased packet_mreq_mr_address_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:282
   end record;
   pragma Convention (C_Pass_By_Copy, packet_mreq);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/if_packet.h:278

end uapi_linux_if_packet_h;

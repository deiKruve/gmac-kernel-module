pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_neighbour_h is

   --  unsupported macro: NDA_MAX (__NDA_MAX - 1)
   --  unsupported macro: NTF_USE 0x01
   --  unsupported macro: NTF_PROXY 0x08
   --  unsupported macro: NTF_ROUTER 0x80
   --  unsupported macro: NTF_SELF 0x02
   --  unsupported macro: NTF_MASTER 0x04
   --  unsupported macro: NUD_INCOMPLETE 0x01
   --  unsupported macro: NUD_REACHABLE 0x02
   --  unsupported macro: NUD_STALE 0x04
   --  unsupported macro: NUD_DELAY 0x08
   --  unsupported macro: NUD_PROBE 0x10
   --  unsupported macro: NUD_FAILED 0x20
   --  unsupported macro: NUD_NOARP 0x40
   --  unsupported macro: NUD_PERMANENT 0x80
   --  unsupported macro: NUD_NONE 0x00
   --  unsupported macro: NDTPA_MAX (__NDTPA_MAX - 1)
   --  unsupported macro: NDTA_MAX (__NDTA_MAX - 1)
   type ndmsg is record
      ndm_family : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:8
      ndm_pad1 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:9
      ndm_pad2 : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:10
      ndm_ifindex : aliased uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:11
      ndm_state : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:12
      ndm_flags : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:13
      ndm_type : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:14
   end record;
   pragma Convention (C_Pass_By_Copy, ndmsg);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:7

  -- *	Neighbor Cache Entry Flags
  --  

  -- *	Neighbor Cache Entry States.
  --  

  -- Dummy states  
  -- NUD_NOARP & NUD_PERMANENT are pseudostates, they never change
  --   and make no address resolution or NUD.
  --   NUD_PERMANENT also cannot be deleted by garbage collectors.
  --  

   type nda_cacheinfo is record
      ndm_confirmed : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:66
      ndm_used : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:67
      ndm_updated : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:68
      ndm_refcnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:69
   end record;
   pragma Convention (C_Pass_By_Copy, nda_cacheinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:65

  --****************************************************************
  -- *		Neighbour tables specific messages.
  -- *
  -- * To retrieve the neighbour tables send RTM_GETNEIGHTBL with the
  -- * NLM_F_DUMP flag set. Every neighbour table configuration is
  -- * spread over multiple messages to avoid running into message
  -- * size limits on systems with many interfaces. The first message
  -- * in the sequence transports all not device specific data such as
  -- * statistics, configuration, and the default parameter set.
  -- * This message is followed by 0..n messages carrying device
  -- * specific parameter sets.
  -- * Although the ordering should be sufficient, NDTA_NAME can be
  -- * used to identify sequences. The initial message can be identified
  -- * by checking for NDTA_CONFIG. The device specific messages do
  -- * not contain this TLV but have NDTPA_IFINDEX set to the
  -- * corresponding interface index.
  -- *
  -- * To change neighbour table attributes, send RTM_SETNEIGHTBL
  -- * with NDTA_NAME set. Changeable attribute include NDTA_THRESH[1-3],
  -- * NDTA_GC_INTERVAL, and all TLVs in NDTA_PARMS unless marked
  -- * otherwise. Device specific parameter sets can be changed by
  -- * setting NDTPA_IFINDEX to the interface index of the corresponding
  -- * device.
  -- *** 

   type ndt_stats is record
      ndts_allocs : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:98
      ndts_destroys : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:99
      ndts_hash_grows : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:100
      ndts_res_failed : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:101
      ndts_lookups : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:102
      ndts_hits : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:103
      ndts_rcv_probes_mcast : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:104
      ndts_rcv_probes_ucast : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:105
      ndts_periodic_gc_runs : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:106
      ndts_forced_gc_runs : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:107
   end record;
   pragma Convention (C_Pass_By_Copy, ndt_stats);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:97

  -- u32, unchangeable  
  -- u32, read-only  
  -- u64, read-only, msecs  
  -- u64, msecs  
  -- u64, msecs  
  -- u64, msecs  
  -- u64, msecs  
  -- u32  
  -- u32  
  -- u32  
  -- u32  
  -- u64, msecs  
  -- u64, msecs  
  -- u32  
  -- u64, msecs  
  -- u32  
   type ndtmsg is record
      ndtm_family : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:133
      ndtm_pad1 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:134
      ndtm_pad2 : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:135
   end record;
   pragma Convention (C_Pass_By_Copy, ndtmsg);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:132

   type ndt_config is record
      ndtc_key_len : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:139
      ndtc_entry_size : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:140
      ndtc_entries : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:141
      ndtc_last_flush : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:142
      ndtc_last_rand : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:143
      ndtc_hash_rnd : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:144
      ndtc_hash_mask : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:145
      ndtc_hash_chain_gc : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:146
      ndtc_proxy_qlen : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:147
   end record;
   pragma Convention (C_Pass_By_Copy, ndt_config);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/neighbour.h:138

  -- delta to now in msecs  
  -- delta to now in msecs  
  -- char *, unchangeable  
  -- u32  
  -- u32  
  -- u32  
  -- struct ndt_config, read-only  
  -- nested TLV NDTPA_*  
  -- struct ndt_stats, read-only  
  -- u64, msecs  
end uapi_linux_neighbour_h;

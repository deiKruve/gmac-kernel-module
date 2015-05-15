pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;
with uapi_linux_types_h;
with uapi_linux_in6_h;
with asm_generic_int_ll64_h;
with linux_types_h;
limited with net_net_namespace_h;
with System;

package net_flow_h is

   --  unsupported macro: LOOPBACK_IFINDEX 1
   --  unsupported macro: FLOWI_FLAG_ANYSRC 0x01
   --  unsupported macro: FLOWI_FLAG_KNOWN_NH 0x02
   --  unsupported macro: flowi4_oif __fl_common.flowic_oif
   --  unsupported macro: flowi4_iif __fl_common.flowic_iif
   --  unsupported macro: flowi4_mark __fl_common.flowic_mark
   --  unsupported macro: flowi4_tos __fl_common.flowic_tos
   --  unsupported macro: flowi4_scope __fl_common.flowic_scope
   --  unsupported macro: flowi4_proto __fl_common.flowic_proto
   --  unsupported macro: flowi4_flags __fl_common.flowic_flags
   --  unsupported macro: flowi4_secid __fl_common.flowic_secid
   --  unsupported macro: fl4_sport uli.ports.sport
   --  unsupported macro: fl4_dport uli.ports.dport
   --  unsupported macro: fl4_icmp_type uli.icmpt.type
   --  unsupported macro: fl4_icmp_code uli.icmpt.code
   --  unsupported macro: fl4_ipsec_spi uli.spi
   --  unsupported macro: fl4_mh_type uli.mht.type
   --  unsupported macro: fl4_gre_key uli.gre_key
   --  unsupported macro: flowi6_oif __fl_common.flowic_oif
   --  unsupported macro: flowi6_iif __fl_common.flowic_iif
   --  unsupported macro: flowi6_mark __fl_common.flowic_mark
   --  unsupported macro: flowi6_tos __fl_common.flowic_tos
   --  unsupported macro: flowi6_scope __fl_common.flowic_scope
   --  unsupported macro: flowi6_proto __fl_common.flowic_proto
   --  unsupported macro: flowi6_flags __fl_common.flowic_flags
   --  unsupported macro: flowi6_secid __fl_common.flowic_secid
   --  unsupported macro: fl6_sport uli.ports.sport
   --  unsupported macro: fl6_dport uli.ports.dport
   --  unsupported macro: fl6_icmp_type uli.icmpt.type
   --  unsupported macro: fl6_icmp_code uli.icmpt.code
   --  unsupported macro: fl6_ipsec_spi uli.spi
   --  unsupported macro: fl6_mh_type uli.mht.type
   --  unsupported macro: fl6_gre_key uli.gre_key
   --  unsupported macro: flowidn_oif __fl_common.flowic_oif
   --  unsupported macro: flowidn_iif __fl_common.flowic_iif
   --  unsupported macro: flowidn_mark __fl_common.flowic_mark
   --  unsupported macro: flowidn_scope __fl_common.flowic_scope
   --  unsupported macro: flowidn_proto __fl_common.flowic_proto
   --  unsupported macro: flowidn_flags __fl_common.flowic_flags
   --  unsupported macro: fld_sport uli.ports.sport
   --  unsupported macro: fld_dport uli.ports.dport
   --  unsupported macro: flowi_oif u.__fl_common.flowic_oif
   --  unsupported macro: flowi_iif u.__fl_common.flowic_iif
   --  unsupported macro: flowi_mark u.__fl_common.flowic_mark
   --  unsupported macro: flowi_tos u.__fl_common.flowic_tos
   --  unsupported macro: flowi_scope u.__fl_common.flowic_scope
   --  unsupported macro: flowi_proto u.__fl_common.flowic_proto
   --  unsupported macro: flowi_flags u.__fl_common.flowic_flags
   --  unsupported macro: flowi_secid u.__fl_common.flowic_secid
   --  unsupported macro: FLOW_DIR_IN 0
   --  unsupported macro: FLOW_DIR_OUT 1
   --  unsupported macro: FLOW_DIR_FWD 2
  -- *
  -- *	Generic internet FLOW.
  -- *
  --  

  -- * ifindex generation is per-net namespace, and loopback is
  -- * always the 1st device in ns (see net_dev_init), thus any
  -- * loopback device should get ifindex 1
  --  

   type flowi_common is record
      flowic_oif : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:23
      flowic_iif : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:24
      flowic_mark : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:25
      flowic_tos : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:26
      flowic_scope : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:27
      flowic_proto : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:28
      flowic_flags : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:29
      flowic_secid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, flowi_common);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:22

   type flowi_uli;
   type anon_316 is record
      dport : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:37
      sport : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, anon_316);
   type anon_317 is record
      c_type : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:42
      code : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:43
   end record;
   pragma Convention (C_Pass_By_Copy, anon_317);
   type anon_318 is record
      dport : aliased uapi_linux_types_h.uu_le16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:47
      sport : aliased uapi_linux_types_h.uu_le16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:48
   end record;
   pragma Convention (C_Pass_By_Copy, anon_318);
   type anon_319 is record
      c_type : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:55
   end record;
   pragma Convention (C_Pass_By_Copy, anon_319);
   type flowi_uli (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ports : aliased anon_316;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:39
         when 1 =>
            icmpt : aliased anon_317;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:44
         when 2 =>
            dnports : aliased anon_318;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:49
         when 3 =>
            spi : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:51
         when 4 =>
            gre_key : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:52
         when others =>
            mht : aliased anon_319;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:56
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, flowi_uli);
   pragma Unchecked_Union (flowi_uli);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:35

   type flowi4 is record
      uu_fl_common : aliased flowi_common;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:60
      saddr : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:71
      daddr : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:72
      uli : flowi_uli;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:74
   end record;
   pragma Convention (C_Pass_By_Copy, flowi4);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:59

  -- (saddr,daddr) must be grouped, same order as in IP header  
   procedure flowi4_init_output
     (fl4 : access flowi4;
      oif : int;
      mark : uapi_asm_generic_int_ll64_h.uu_u32;
      tos : uapi_asm_generic_int_ll64_h.uu_u8;
      scope : uapi_asm_generic_int_ll64_h.uu_u8;
      proto : uapi_asm_generic_int_ll64_h.uu_u8;
      flags : uapi_asm_generic_int_ll64_h.uu_u8;
      daddr : uapi_linux_types_h.uu_be32;
      saddr : uapi_linux_types_h.uu_be32;
      dport : uapi_linux_types_h.uu_be16;
      sport : uapi_linux_types_h.uu_be16);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:84
   pragma Import (CPP, flowi4_init_output, "_ZL18flowi4_init_outputP6flowi4ijhhhhjjtt");

  -- Reset some input parameters after previous lookup  
   procedure flowi4_update_output
     (fl4 : access flowi4;
      oif : int;
      tos : uapi_asm_generic_int_ll64_h.uu_u8;
      daddr : uapi_linux_types_h.uu_be32;
      saddr : uapi_linux_types_h.uu_be32);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:105
   pragma Import (CPP, flowi4_update_output, "_ZL20flowi4_update_outputP6flowi4ihjj");

   type flowi6 is record
      uu_fl_common : aliased flowi_common;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:116
      daddr : aliased uapi_linux_in6_h.in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:125
      saddr : aliased uapi_linux_in6_h.in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:126
      flowlabel : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:127
      uli : flowi_uli;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:128
   end record;
   pragma Convention (C_Pass_By_Copy, flowi6);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:115

   type flowidn is record
      uu_fl_common : aliased flowi_common;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:139
      daddr : aliased uapi_linux_types_h.uu_le16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:146
      saddr : aliased uapi_linux_types_h.uu_le16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:147
      uli : flowi_uli;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:148
   end record;
   pragma Convention (C_Pass_By_Copy, flowidn);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:138

   type anon_320 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_fl_common : aliased flowi_common;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:155
         when 1 =>
            ip4 : aliased flowi4;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:156
         when 2 =>
            ip6 : aliased flowi6;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:157
         when others =>
            dn : aliased flowidn;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:158
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_320);
   pragma Unchecked_Union (anon_320);
   type flowi is record
      u : anon_320;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:159
   end record;
   pragma Convention (C_Pass_By_Copy, flowi);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:153

   function flowi4_to_flowi (fl4 : access flowi4) return access flowi;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:170
   pragma Import (CPP, flowi4_to_flowi, "_ZL15flowi4_to_flowiP6flowi4");

   function flowi6_to_flowi (fl6 : access flowi6) return access flowi;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:175
   pragma Import (CPP, flowi6_to_flowi, "_ZL15flowi6_to_flowiP6flowi6");

   function flowidn_to_flowi (fldn : access flowidn) return access flowi;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:180
   pragma Import (CPP, flowidn_to_flowi, "_ZL16flowidn_to_flowiP7flowidn");

   subtype flow_compare_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:185

   function flow_key_size (family : asm_generic_int_ll64_h.u16) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:187
   pragma Import (CPP, flow_key_size, "_ZL13flow_key_sizet");

   type flow_cache_ops;
   type flow_cache_object is record
      ops : access constant flow_cache_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:212
   end record;
   pragma Convention (C_Pass_By_Copy, flow_cache_object);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:211

   type flow_cache_ops is record
      get : access function (arg1 : access flow_cache_object) return access flow_cache_object;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:216
      check : access function (arg1 : access flow_cache_object) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:217
   end record;
   pragma Convention (C_Pass_By_Copy, flow_cache_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:215

   type flow_resolve_t is access function
        (arg1 : access net_net_namespace_h.net;
         arg2 : access constant flowi;
         arg3 : asm_generic_int_ll64_h.u16;
         arg4 : asm_generic_int_ll64_h.u8;
         arg5 : access flow_cache_object;
         arg6 : System.Address) return access flow_cache_object;
   pragma Convention (C, flow_resolve_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:221

   function flow_cache_lookup
     (the_net : access net_net_namespace_h.net;
      key : access constant flowi;
      family : asm_generic_int_ll64_h.u16;
      dir : asm_generic_int_ll64_h.u8;
      resolver : flow_resolve_t;
      ctx : System.Address) return access flow_cache_object;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:225
   pragma Import (CPP, flow_cache_lookup, "_Z17flow_cache_lookupP3netPK5flowithPFP17flow_cache_objectS0_S3_thS5_PvES6_");

   function flow_cache_init (the_net : access net_net_namespace_h.net) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:229
   pragma Import (CPP, flow_cache_init, "_Z15flow_cache_initP3net");

   procedure flow_cache_fini (the_net : access net_net_namespace_h.net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:230
   pragma Import (CPP, flow_cache_fini, "_Z15flow_cache_finiP3net");

   procedure flow_cache_flush (the_net : access net_net_namespace_h.net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:232
   pragma Import (CPP, flow_cache_flush, "_Z16flow_cache_flushP3net");

   procedure flow_cache_flush_deferred (the_net : access net_net_namespace_h.net);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:233
   pragma Import (CPP, flow_cache_flush_deferred, "_Z25flow_cache_flush_deferredP3net");

   flow_cache_genid : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow.h:234
   pragma Import (C, flow_cache_genid, "flow_cache_genid");

end net_flow_h;

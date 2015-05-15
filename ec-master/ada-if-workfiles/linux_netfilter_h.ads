pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with uapi_linux_netfilter_h;
with linux_types_h;
with System;
limited with linux_skbuff_h;
limited with linux_netdevice_h;
with linux_jump_label_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with uapi_linux_types_h;
limited with net_net_namespace_h;
limited with net_flow_h;
limited with uapi_linux_netlink_h;
with asm_generic_int_ll64_h;

package linux_netfilter_h is

   --  unsupported macro: NF_MAX_HOOKS 8
   function NF_DROP_GETERR (verdict : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:14
   pragma Import (CPP, NF_DROP_GETERR, "_ZL14NF_DROP_GETERRi");

   function nf_inet_addr_cmp (a1 : access constant uapi_linux_netfilter_h.nf_inet_addr; a2 : access constant uapi_linux_netfilter_h.nf_inet_addr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:19
   pragma Import (CPP, nf_inet_addr_cmp, "_ZL16nf_inet_addr_cmpPK12nf_inet_addrS1_");

   procedure nf_inet_addr_mask
     (a1 : access constant uapi_linux_netfilter_h.nf_inet_addr;
      result : access uapi_linux_netfilter_h.nf_inet_addr;
      mask : access constant uapi_linux_netfilter_h.nf_inet_addr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:28
   pragma Import (CPP, nf_inet_addr_mask, "_ZL17nf_inet_addr_maskPK12nf_inet_addrPS_S1_");

   function netfilter_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:38
   pragma Import (CPP, netfilter_init, "_Z14netfilter_initv");

  -- Largest hook number + 1  
   --  skipped function type nf_hookfn

   type nf_hook_ops is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:53
      hook : access function
           (arg1 : System.Address;
            arg2 : access linux_skbuff_h.sk_buff;
            arg3 : access constant linux_netdevice_h.net_device;
            arg4 : access constant linux_netdevice_h.net_device;
            arg5 : access function (arg1 : access linux_skbuff_h.sk_buff) return int) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:56
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:57
      priv : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:58
      pf : aliased linux_types_h.u_int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:59
      hooknum : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:60
      priority : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:62
   end record;
   pragma Convention (C_Pass_By_Copy, nf_hook_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:52

  -- User fills in from here down.  
  -- Hooks are ordered in ascending priority.  
   type nf_sockopt_ops is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:66
      pf : aliased linux_types_h.u_int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:68
      set_optmin : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:71
      set_optmax : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:72
      set : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : System.Address;
            arg4 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:73
      compat_set : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : System.Address;
            arg4 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:76
      get_optmin : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:78
      get_optmax : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:79
      get : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : System.Address;
            arg4 : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:80
      compat_get : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : System.Address;
            arg4 : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:83
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:86
   end record;
   pragma Convention (C_Pass_By_Copy, nf_sockopt_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:65

  -- Non-inclusive ranges: use 0/0/NULL to never get called.  
  -- Use the module struct to lock set/get code in place  
  -- Function to register/unregister hook points.  
   function nf_register_hook (reg : access nf_hook_ops) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:90
   pragma Import (CPP, nf_register_hook, "_Z16nf_register_hookP11nf_hook_ops");

   procedure nf_unregister_hook (reg : access nf_hook_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:91
   pragma Import (CPP, nf_unregister_hook, "_Z18nf_unregister_hookP11nf_hook_ops");

   function nf_register_hooks (reg : access nf_hook_ops; n : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:92
   pragma Import (CPP, nf_register_hooks, "_Z17nf_register_hooksP11nf_hook_opsj");

   procedure nf_unregister_hooks (reg : access nf_hook_ops; n : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:93
   pragma Import (CPP, nf_unregister_hooks, "_Z19nf_unregister_hooksP11nf_hook_opsj");

  -- Functions to register get/setsockopt ranges (non-inclusive).  You
  --   need to check permissions yourself!  

   function nf_register_sockopt (reg : access nf_sockopt_ops) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:97
   pragma Import (CPP, nf_register_sockopt, "_Z19nf_register_sockoptP14nf_sockopt_ops");

   procedure nf_unregister_sockopt (reg : access nf_sockopt_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:98
   pragma Import (CPP, nf_unregister_sockopt, "_Z21nf_unregister_sockoptP14nf_sockopt_ops");

   nf_hooks : aliased array (0 .. 12, 0 .. 7) of aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:100
   pragma Import (C, nf_hooks, "nf_hooks");

   nf_hooks_needed : aliased array (0 .. 12, 0 .. 7) of aliased linux_jump_label_h.static_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:104
   pragma Import (C, nf_hooks_needed, "nf_hooks_needed");

   function nf_hooks_active (pf : linux_types_h.u_int8_t; hook : unsigned) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:105
   pragma Import (CPP, nf_hooks_active, "_ZL15nf_hooks_activehj");

   function nf_hook_slow
     (pf : linux_types_h.u_int8_t;
      hook : unsigned;
      skb : access linux_skbuff_h.sk_buff;
      indev : access linux_netdevice_h.net_device;
      outdev : access linux_netdevice_h.net_device;
      okfn : access function (arg1 : access linux_skbuff_h.sk_buff) return int;
      thresh : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:120
   pragma Import (CPP, nf_hook_slow, "_Z12nf_hook_slowhjP7sk_buffP10net_deviceS2_PFiS0_Ei");

  --*
  -- *	nf_hook_thresh - call a netfilter hook
  -- *	
  -- *	Returns 1 if the hook has allowed the packet to pass.  The function
  -- *	okfn must be invoked by the caller in this case.  Any other return
  -- *	value indicates the packet has been consumed by the hook.
  --  

   function nf_hook_thresh
     (pf : linux_types_h.u_int8_t;
      hook : unsigned;
      skb : access linux_skbuff_h.sk_buff;
      indev : access linux_netdevice_h.net_device;
      outdev : access linux_netdevice_h.net_device;
      okfn : access function (arg1 : access linux_skbuff_h.sk_buff) return int;
      thresh : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:131
   pragma Import (CPP, nf_hook_thresh, "_ZL14nf_hook_threshhjP7sk_buffP10net_deviceS2_PFiS0_Ei");

   function nf_hook
     (pf : linux_types_h.u_int8_t;
      hook : unsigned;
      skb : access linux_skbuff_h.sk_buff;
      indev : access linux_netdevice_h.net_device;
      outdev : access linux_netdevice_h.net_device;
      okfn : access function (arg1 : access linux_skbuff_h.sk_buff) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:142
   pragma Import (CPP, nf_hook, "_ZL7nf_hookhjP7sk_buffP10net_deviceS2_PFiS0_E");

  -- Activate hook; either okfn or kfree_skb called, unless a hook
  --   returns NF_STOLEN (in which case, it's up to the hook to deal with
  --   the consequences).
  --   Returns -ERRNO if packet dropped.  Zero means queued, stolen or
  --   accepted.
  -- 

  -- RR:
  --   > I don't want nf_hook to return anything because people might forget
  --   > about async and trust the return value to mean "packet was ok".
  --   AK:
  --   Just document it clearly, then you can expect some sense from kernel
  --   coders :)
  -- 

   function NF_HOOK_THRESH
     (pf : linux_types_h.uint8_t;
      hook : unsigned;
      skb : access linux_skbuff_h.sk_buff;
      c_in : access linux_netdevice_h.net_device;
      c_out : access linux_netdevice_h.net_device;
      okfn : access function (arg1 : access linux_skbuff_h.sk_buff) return int;
      thresh : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:167
   pragma Import (CPP, NF_HOOK_THRESH, "_ZL14NF_HOOK_THRESHhjP7sk_buffP10net_deviceS2_PFiS0_Ei");

   function NF_HOOK_COND
     (pf : linux_types_h.uint8_t;
      hook : unsigned;
      skb : access linux_skbuff_h.sk_buff;
      c_in : access linux_netdevice_h.net_device;
      c_out : access linux_netdevice_h.net_device;
      okfn : access function (arg1 : access linux_skbuff_h.sk_buff) return int;
      cond : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:178
   pragma Import (CPP, NF_HOOK_COND, "_ZL12NF_HOOK_CONDhjP7sk_buffP10net_deviceS2_PFiS0_Eb");

   function NF_HOOK
     (pf : linux_types_h.uint8_t;
      hook : unsigned;
      skb : access linux_skbuff_h.sk_buff;
      c_in : access linux_netdevice_h.net_device;
      c_out : access linux_netdevice_h.net_device;
      okfn : access function (arg1 : access linux_skbuff_h.sk_buff) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:191
   pragma Import (CPP, NF_HOOK, "_ZL7NF_HOOKhjP7sk_buffP10net_deviceS2_PFiS0_E");

  -- Call setsockopt()  
   function nf_setsockopt
     (sk : System.Address;
      pf : linux_types_h.u_int8_t;
      optval : int;
      opt : Interfaces.C.Strings.chars_ptr;
      len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:199
   pragma Import (CPP, nf_setsockopt, "_Z13nf_setsockoptP4sockhiPcj");

   function nf_getsockopt
     (sk : System.Address;
      pf : linux_types_h.u_int8_t;
      optval : int;
      opt : Interfaces.C.Strings.chars_ptr;
      len : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:201
   pragma Import (CPP, nf_getsockopt, "_Z13nf_getsockoptP4sockhiPcPi");

   function compat_nf_setsockopt
     (sk : System.Address;
      pf : linux_types_h.u_int8_t;
      optval : int;
      opt : Interfaces.C.Strings.chars_ptr;
      len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:204
   pragma Import (CPP, compat_nf_setsockopt, "_Z20compat_nf_setsockoptP4sockhiPcj");

   function compat_nf_getsockopt
     (sk : System.Address;
      pf : linux_types_h.u_int8_t;
      optval : int;
      opt : Interfaces.C.Strings.chars_ptr;
      len : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:206
   pragma Import (CPP, compat_nf_getsockopt, "_Z20compat_nf_getsockoptP4sockhiPcPi");

  -- Call this before modifying an existing packet: ensures it is
  --   modifiable and linear to the point you care about (writable_len).
  --   Returns true or false.  

   function skb_make_writable (skb : access linux_skbuff_h.sk_buff; writable_len : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:213
   pragma Import (CPP, skb_make_writable, "_Z17skb_make_writableP7sk_buffj");

   --  skipped empty struct nf_queue_entry

   type nf_afinfo is record
      family : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:219
      checksum : access function
           (arg1 : access linux_skbuff_h.sk_buff;
            arg2 : unsigned;
            arg3 : unsigned;
            arg4 : linux_types_h.u_int8_t) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:221
      checksum_partial : access function
           (arg1 : access linux_skbuff_h.sk_buff;
            arg2 : unsigned;
            arg3 : unsigned;
            arg4 : unsigned;
            arg5 : linux_types_h.u_int8_t) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:226
      route : access function
           (arg1 : access net_net_namespace_h.net;
            arg2 : System.Address;
            arg3 : access net_flow_h.flowi;
            arg4 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:228
      saveroute : access procedure (arg1 : access constant linux_skbuff_h.sk_buff; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:230
      reroute : access function (arg1 : access linux_skbuff_h.sk_buff; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:232
      route_key_size : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:233
   end record;
   pragma Convention (C_Pass_By_Copy, nf_afinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:218

   nf_afinfo : aliased array (0 .. 12) of access constant nf_afinfo;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:236
   pragma Import (C, nf_afinfo, "nf_afinfo");

   function nf_get_afinfo (family : unsigned_short) return access constant nf_afinfo;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:237
   pragma Import (CPP, nf_get_afinfo, "_ZL13nf_get_afinfot");

   function nf_checksum
     (skb : access linux_skbuff_h.sk_buff;
      hook : unsigned;
      dataoff : unsigned;
      protocol : linux_types_h.u_int8_t;
      family : unsigned_short) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:243
   pragma Import (CPP, nf_checksum, "_ZL11nf_checksumP7sk_buffjjht");

   function nf_checksum_partial
     (skb : access linux_skbuff_h.sk_buff;
      hook : unsigned;
      dataoff : unsigned;
      len : unsigned;
      protocol : linux_types_h.u_int8_t;
      family : unsigned_short) return uapi_linux_types_h.uu_sum16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:258
   pragma Import (CPP, nf_checksum_partial, "_ZL19nf_checksum_partialP7sk_buffjjjht");

   function nf_register_afinfo (afinfo : access constant nf_afinfo) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:274
   pragma Import (CPP, nf_register_afinfo, "_Z18nf_register_afinfoPK9nf_afinfo");

   procedure nf_unregister_afinfo (afinfo : access constant nf_afinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:275
   pragma Import (CPP, nf_unregister_afinfo, "_Z20nf_unregister_afinfoPK9nf_afinfo");

   nf_nat_decode_session_hook : access procedure (arg1 : access linux_skbuff_h.sk_buff; arg2 : access net_flow_h.flowi);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:278
   pragma Import (C, nf_nat_decode_session_hook, "nf_nat_decode_session_hook");

   procedure nf_nat_decode_session
     (skb : access linux_skbuff_h.sk_buff;
      fl : access net_flow_h.flowi;
      family : linux_types_h.u_int8_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:281
   pragma Import (CPP, nf_nat_decode_session, "_ZL21nf_nat_decode_sessionP7sk_buffP5flowih");

   ip_ct_attach : access procedure (arg1 : access linux_skbuff_h.sk_buff; arg2 : access constant linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:319
   pragma Import (C, ip_ct_attach, "ip_ct_attach");

   procedure nf_ct_attach (arg1 : access linux_skbuff_h.sk_buff; arg2 : access constant linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:320
   pragma Import (CPP, nf_ct_attach, "_Z12nf_ct_attachP7sk_buffPKS_");

   nf_ct_destroy : access procedure (arg1 : access linux_skbuff_h.nf_conntrack);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:321
   pragma Import (C, nf_ct_destroy, "nf_ct_destroy");

   --  skipped empty struct nf_conn

   type nfq_ct_hook is record
      build_size : access function (arg1 : System.Address) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:328
      build : access function (arg1 : access linux_skbuff_h.sk_buff; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:329
      parse : access function (arg1 : access constant uapi_linux_netlink_h.nlattr; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:330
      attach_expect : access function
           (arg1 : access constant uapi_linux_netlink_h.nlattr;
            arg2 : System.Address;
            arg3 : asm_generic_int_ll64_h.u32;
            arg4 : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:332
      seq_adjust : access procedure
           (arg1 : access linux_skbuff_h.sk_buff;
            arg2 : System.Address;
            arg3 : int;
            arg4 : asm_generic_int_ll64_h.s32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:334
   end record;
   pragma Convention (C_Pass_By_Copy, nfq_ct_hook);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:327

   nfq_ct_hook : access nfq_ct_hook;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter.h:336
   pragma Import (C, nfq_ct_hook, "nfq_ct_hook");

end linux_netfilter_h;

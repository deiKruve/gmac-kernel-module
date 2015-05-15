pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_skbuff_h;
limited with uapi_linux_netlink_h;
with net_scm_h;
with uapi_asm_generic_int_ll64_h;
with System;
limited with linux_mutex_h;
limited with net_net_namespace_h;
with Interfaces.C.Extensions;
with asm_generic_int_ll64_h;
with linux_types_h;
limited with linux_notifier_h;
limited with linux_fs_h;
limited with linux_netdevice_h;

package linux_netlink_h is

   --  arg-macro: function NETLINK_CB (*(struct netlink_skb_parms*)and((skb).cb)
   --    return *(struct netlink_skb_parms*)and((skb).cb);
   --  arg-macro: function NETLINK_CREDS (andNETLINK_CB((skb)).creds
   --    return andNETLINK_CB((skb)).creds;
   --  unsupported macro: NL_CFG_F_NONROOT_RECV (1 << 0)
   --  unsupported macro: NL_CFG_F_NONROOT_SEND (1 << 1)
   --  unsupported macro: NLMSG_GOODSIZE SKB_WITH_OVERHEAD(PAGE_SIZE)
   --  unsupported macro: NLMSG_DEFAULT_SIZE (NLMSG_GOODSIZE - NLMSG_HDRLEN)
   function nlmsg_hdr (skb : access constant linux_skbuff_h.sk_buff) return access uapi_linux_netlink_h.nlmsghdr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:13
   pragma Import (CPP, nlmsg_hdr, "_ZL9nlmsg_hdrPK7sk_buff");

   subtype netlink_skb_flags is unsigned;
   NETLINK_SKB_MMAPED : constant netlink_skb_flags := 1;
   NETLINK_SKB_TX : constant netlink_skb_flags := 2;
   NETLINK_SKB_DELIVERED : constant netlink_skb_flags := 4;
   NETLINK_SKB_DST : constant netlink_skb_flags := 8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:18

  -- Packet data is mmaped  
  -- Packet was sent by userspace  
  -- Packet was delivered  
  -- Dst set in sendto or sendmsg  
  -- Skb credentials	 
   type netlink_skb_parms is record
      creds : aliased net_scm_h.scm_creds;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:26
      portid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:27
      dst_group : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:28
      flags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:29
      sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:30
   end record;
   pragma Convention (C_Pass_By_Copy, netlink_skb_parms);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:25

   procedure netlink_table_grab;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:37
   pragma Import (CPP, netlink_table_grab, "_Z18netlink_table_grabv");

   procedure netlink_table_ungrab;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:38
   pragma Import (CPP, netlink_table_ungrab, "_Z20netlink_table_ungrabv");

  -- optional Netlink kernel configuration parameters  
   type netlink_kernel_cfg is record
      groups : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:45
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:46
      input : access procedure (arg1 : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:47
      cb_mutex : access linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:48
      bind : access function (arg1 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:49
      unbind : access procedure (arg1 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:50
      compare : access function (arg1 : access net_net_namespace_h.net; arg2 : System.Address) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:51
   end record;
   pragma Convention (C_Pass_By_Copy, netlink_kernel_cfg);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:44

   --  skipped func __netlink_kernel_create

   function netlink_kernel_create
     (the_net : access net_net_namespace_h.net;
      unit : int;
      cfg : access netlink_kernel_cfg) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:58
   pragma Import (CPP, netlink_kernel_create, "_ZL21netlink_kernel_createP3netiP18netlink_kernel_cfg");

   procedure netlink_kernel_release (sk : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:63
   pragma Import (CPP, netlink_kernel_release, "_Z22netlink_kernel_releaseP4sock");

   --  skipped func __netlink_change_ngroups

   function netlink_change_ngroups (sk : System.Address; groups : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:65
   pragma Import (CPP, netlink_change_ngroups, "_Z22netlink_change_ngroupsP4sockj");

   --  skipped func __netlink_clear_multicast_users

   procedure netlink_ack
     (in_skb : access linux_skbuff_h.sk_buff;
      nlh : access uapi_linux_netlink_h.nlmsghdr;
      err : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:67
   pragma Import (CPP, netlink_ack, "_Z11netlink_ackP7sk_buffP8nlmsghdri");

   function netlink_has_listeners (sk : System.Address; group : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:68
   pragma Import (CPP, netlink_has_listeners, "_Z21netlink_has_listenersP4sockj");

   function netlink_alloc_skb
     (ssk : System.Address;
      size : unsigned;
      dst_portid : asm_generic_int_ll64_h.u32;
      gfp_mask : linux_types_h.gfp_t) return access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:69
   pragma Import (CPP, netlink_alloc_skb, "_Z17netlink_alloc_skbP4sockjjj");

   function netlink_unicast
     (ssk : System.Address;
      skb : access linux_skbuff_h.sk_buff;
      portid : uapi_asm_generic_int_ll64_h.uu_u32;
      nonblock : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:71
   pragma Import (CPP, netlink_unicast, "_Z15netlink_unicastP4sockP7sk_buffji");

   function netlink_broadcast
     (ssk : System.Address;
      skb : access linux_skbuff_h.sk_buff;
      portid : uapi_asm_generic_int_ll64_h.uu_u32;
      group : uapi_asm_generic_int_ll64_h.uu_u32;
      allocation : linux_types_h.gfp_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:72
   pragma Import (CPP, netlink_broadcast, "_Z17netlink_broadcastP4sockP7sk_buffjjj");

   function netlink_broadcast_filtered
     (ssk : System.Address;
      skb : access linux_skbuff_h.sk_buff;
      portid : uapi_asm_generic_int_ll64_h.uu_u32;
      group : uapi_asm_generic_int_ll64_h.uu_u32;
      allocation : linux_types_h.gfp_t;
      filter : access function
        (arg1 : System.Address;
         arg2 : access linux_skbuff_h.sk_buff;
         arg3 : System.Address) return int;
      filter_data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:74
   pragma Import (CPP, netlink_broadcast_filtered, "_Z26netlink_broadcast_filteredP4sockP7sk_buffjjjPFiS0_S2_PvES3_");

   function netlink_set_err
     (ssk : System.Address;
      portid : uapi_asm_generic_int_ll64_h.uu_u32;
      group : uapi_asm_generic_int_ll64_h.uu_u32;
      code : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:78
   pragma Import (CPP, netlink_set_err, "_Z15netlink_set_errP4sockjji");

   function netlink_register_notifier (nb : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:79
   pragma Import (CPP, netlink_register_notifier, "_Z25netlink_register_notifierP14notifier_block");

   function netlink_unregister_notifier (nb : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:80
   pragma Import (CPP, netlink_unregister_notifier, "_Z27netlink_unregister_notifierP14notifier_block");

  -- finegrained unicast helpers:  
   function netlink_getsockbyfilp (filp : access linux_fs_h.file) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:83
   pragma Import (CPP, netlink_getsockbyfilp, "_Z21netlink_getsockbyfilpP4file");

   function netlink_attachskb
     (sk : System.Address;
      skb : access linux_skbuff_h.sk_buff;
      timeo : access long;
      ssk : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:84
   pragma Import (CPP, netlink_attachskb, "_Z17netlink_attachskbP4sockP7sk_buffPlS0_");

   procedure netlink_detachskb (sk : System.Address; skb : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:86
   pragma Import (CPP, netlink_detachskb, "_Z17netlink_detachskbP4sockP7sk_buff");

   function netlink_sendskb (sk : System.Address; skb : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:87
   pragma Import (CPP, netlink_sendskb, "_Z15netlink_sendskbP4sockP7sk_buff");

   function netlink_skb_clone (skb : access linux_skbuff_h.sk_buff; gfp_mask : linux_types_h.gfp_t) return access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:90
   pragma Import (CPP, netlink_skb_clone, "_ZL17netlink_skb_cloneP7sk_buffj");

  -- This is a large skb, set destructor callback to release head  
  -- *	skb should fit one page. This choice is good for headerless malloc.
  -- *	But we should limit to 8K so that userspace does not have to
  -- *	use enormous buffer sizes on recvmsg() calls just to avoid
  -- *	MSG_TRUNC when PAGE_SIZE is very large.
  --  

   type netlink_callback_args_array is array (0 .. 5) of aliased long;
   type netlink_callback is record
      skb : access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:121
      nlh : access constant uapi_linux_netlink_h.nlmsghdr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:122
      dump : access function (arg1 : access linux_skbuff_h.sk_buff; arg2 : access netlink_callback) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:124
      done : access function (arg1 : access netlink_callback) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:125
      data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:126
      the_module : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:128
      family : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:129
      min_dump_alloc : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:130
      prev_seq : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:131
      seq : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:131
      args : aliased netlink_callback_args_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:132
   end record;
   pragma Convention (C_Pass_By_Copy, netlink_callback);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:120

  -- the module that dump function belong to  
   type netlink_notify is record
      the_net : access net_net_namespace_h.net;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:136
      portid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:137
      protocol : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:138
   end record;
   pragma Convention (C_Pass_By_Copy, netlink_notify);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:135

   --  skipped func __nlmsg_put

   type netlink_dump_control is record
      dump : access function (arg1 : access linux_skbuff_h.sk_buff; arg2 : access netlink_callback) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:145
      done : access function (arg1 : access netlink_callback) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:146
      data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:147
      the_module : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:148
      min_dump_alloc : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:149
   end record;
   pragma Convention (C_Pass_By_Copy, netlink_dump_control);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:144

   --  skipped func __netlink_dump_start

   function netlink_dump_start
     (ssk : System.Address;
      skb : access linux_skbuff_h.sk_buff;
      nlh : access constant uapi_linux_netlink_h.nlmsghdr;
      control : access netlink_dump_control) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:155
   pragma Import (CPP, netlink_dump_start, "_ZL18netlink_dump_startP4sockP7sk_buffPK8nlmsghdrP20netlink_dump_control");

   type netlink_tap is record
      dev : access linux_netdevice_h.net_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:166
      the_module : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:167
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:168
   end record;
   pragma Convention (C_Pass_By_Copy, netlink_tap);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:165

   function netlink_add_tap (nt : access netlink_tap) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:171
   pragma Import (CPP, netlink_add_tap, "_Z15netlink_add_tapP11netlink_tap");

   function netlink_remove_tap (nt : access netlink_tap) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:172
   pragma Import (CPP, netlink_remove_tap, "_Z18netlink_remove_tapP11netlink_tap");

   --  skipped func __netlink_ns_capable

   function netlink_ns_capable
     (skb : access constant linux_skbuff_h.sk_buff;
      ns : System.Address;
      cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:176
   pragma Import (CPP, netlink_ns_capable, "_Z18netlink_ns_capablePK7sk_buffP14user_namespacei");

   function netlink_capable (skb : access constant linux_skbuff_h.sk_buff; cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:178
   pragma Import (CPP, netlink_capable, "_Z15netlink_capablePK7sk_buffi");

   function netlink_net_capable (skb : access constant linux_skbuff_h.sk_buff; cap : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netlink.h:179
   pragma Import (CPP, netlink_net_capable, "_Z19netlink_net_capablePK7sk_buffi");

end linux_netlink_h;

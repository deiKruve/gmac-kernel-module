pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with linux_workqueue_h;
with System;
with asm_generic_int_ll64_h;
limited with linux_sysctl_h;
with net_dst_ops_h;
with linux_spinlock_types_h;
with linux_rwlock_types_h;
with linux_mutex_h;
with net_flowcache_h;

package net_netns_xfrm_h is

   type xfrm_policy_hash is record
      table : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:14
      hmask : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:15
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_policy_hash);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:13

   type netns_xfrm_policy_inexact_array is array (0 .. 5) of aliased linux_types_h.hlist_head;
   type netns_xfrm_policy_bydst_array is array (0 .. 5) of aliased xfrm_policy_hash;
   type netns_xfrm_policy_count_array is array (0 .. 5) of aliased unsigned;
   type netns_xfrm is record
      state_all : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:19
      state_bydst : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:28
      state_bysrc : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:29
      state_byspi : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:30
      state_hmask : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:31
      state_num : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:32
      state_hash_work : aliased linux_workqueue_h.work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:33
      state_gc_list : aliased linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:34
      state_gc_work : aliased linux_workqueue_h.work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:35
      policy_all : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:37
      policy_byidx : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:38
      policy_idx_hmask : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:39
      policy_inexact : aliased netns_xfrm_policy_inexact_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:40
      policy_bydst : aliased netns_xfrm_policy_bydst_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:41
      policy_count : aliased netns_xfrm_policy_count_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:42
      policy_hash_work : aliased linux_workqueue_h.work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:43
      nlsk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:46
      nlsk_stash : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:47
      sysctl_aevent_etime : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:49
      sysctl_aevent_rseqth : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:50
      sysctl_larval_drop : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:51
      sysctl_acq_expires : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:52
      sysctl_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:54
      xfrm4_dst_ops : aliased net_dst_ops_h.dst_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:57
      xfrm6_dst_ops : aliased net_dst_ops_h.dst_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:59
      xfrm_state_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:61
      xfrm_policy_lock : aliased linux_rwlock_types_h.rwlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:62
      xfrm_cfg_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:63
      flow_cache_global : aliased net_flowcache_h.flow_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:66
      flow_cache_genid : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:67
      flow_cache_gc_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:68
      flow_cache_gc_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:69
      flow_cache_gc_work : aliased linux_workqueue_h.work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:70
      flow_cache_flush_work : aliased linux_workqueue_h.work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:71
      flow_flush_sem : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:72
   end record;
   pragma Convention (C_Pass_By_Copy, netns_xfrm);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/xfrm.h:18

  --	 * Hash table to find appropriate SA towards given target (endpoint of
  --	 * tunnel or destination of transport mode) allowed by selector.
  --	 *
  --	 * Main use is finding SA after policy selected tunnel or transport
  --	 * mode. Also, it can be used by ah/esp icmp error handler to find
  --	 * offending SA.
  --	  

  -- flow cache part  
end net_netns_xfrm_h;

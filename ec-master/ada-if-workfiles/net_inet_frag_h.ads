pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with linux_spinlock_types_h;
with linux_percpu_counter_h;
with linux_timer_h;
limited with linux_skbuff_h;
with linux_ktime_h;
with uapi_asm_generic_int_ll64_h;
with asm_generic_int_ll64_h;
with linux_rwlock_types_h;
with System;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;

package net_inet_frag_h is

   --  unsupported macro: INET_FRAG_COMPLETE 4
   --  unsupported macro: INET_FRAG_FIRST_IN 2
   --  unsupported macro: INET_FRAG_LAST_IN 1
   --  unsupported macro: INETFRAGS_HASHSZ 1024
   --  unsupported macro: INETFRAGS_MAXDEPTH 128
   --  unsupported macro: IPFRAG_ECN_NOT_ECT 0x01
   --  unsupported macro: IPFRAG_ECN_ECT_1 0x02
   --  unsupported macro: IPFRAG_ECN_ECT_0 0x04
   --  unsupported macro: IPFRAG_ECN_CE 0x08
   type netns_frags is record
      nqueues : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:7
      lru_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:8
      lru_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:9
      mem : aliased linux_percpu_counter_h.percpu_counter;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:14
      timeout : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:17
      high_thresh : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:18
      low_thresh : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:19
   end record;
   pragma Convention (C_Pass_By_Copy, netns_frags);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:6

  -- The percpu_counter "mem" need to be cacheline aligned.
  --	 *  mem.count must not share cacheline with other writers
  --	  

  -- sysctls  
   type inet_frag_queue is record
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:23
      timer : aliased linux_timer_h.timer_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:24
      lru_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:25
      list : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:26
      refcnt : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:27
      fragments : access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:28
      fragments_tail : access linux_skbuff_h.sk_buff;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:29
      stamp : linux_ktime_h.ktime_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:30
      len : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:31
      meat : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:32
      last_in : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:33
      max_size : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:39
      net : access netns_frags;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:41
   end record;
   pragma Convention (C_Pass_By_Copy, inet_frag_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:22

  -- when will this queue expire?  
  -- lru list member  
  -- list of received fragments  
  -- total length of orig datagram  
  -- first/last segment arrived?  
  -- averaged:
  -- * max_depth = default ipfrag_high_thresh / INETFRAGS_HASHSZ /
  -- *	       rounded up (SKB_TRUELEN(0) + sizeof(struct ipq or
  -- *	       struct frag_queue))
  --  

   type inet_frag_bucket is record
      chain : aliased linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:54
      chain_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:55
   end record;
   pragma Convention (C_Pass_By_Copy, inet_frag_bucket);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:53

   type inet_frags_hash_array is array (0 .. 1023) of aliased inet_frag_bucket;
   type inet_frags is record
      hash : aliased inet_frags_hash_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:59
      lock : aliased linux_rwlock_types_h.rwlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:64
      secret_interval : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:65
      secret_timer : aliased linux_timer_h.timer_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:66
      rnd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:71
      qsize : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:72
      hashfn : access function (arg1 : access inet_frag_queue) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:74
      match : access function (arg1 : access inet_frag_queue; arg2 : System.Address) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:75
      constructor : access procedure (arg1 : access inet_frag_queue; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:77
      destructor : access procedure (arg1 : access inet_frag_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:78
      skb_free : access procedure (arg1 : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:79
      frag_expire : access procedure (arg1 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:80
   end record;
   pragma Convention (C_Pass_By_Copy, inet_frags);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:58

  -- This rwlock is a global lock (seperate per IPv4, IPv6 and
  --	 * netfilter). Important to keep this on a seperate cacheline.
  --	 * Its primarily a rebuild protection rwlock.
  --	  

  -- The first call to hashfn is responsible to initialize
  --	 * rnd. This is best done with net_get_random_once.
  --	  

   procedure inet_frags_init (arg1 : access inet_frags);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:83
   pragma Import (CPP, inet_frags_init, "_Z15inet_frags_initP10inet_frags");

   procedure inet_frags_fini (arg1 : access inet_frags);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:84
   pragma Import (CPP, inet_frags_fini, "_Z15inet_frags_finiP10inet_frags");

   procedure inet_frags_init_net (nf : access netns_frags);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:86
   pragma Import (CPP, inet_frags_init_net, "_Z19inet_frags_init_netP11netns_frags");

   procedure inet_frags_exit_net (nf : access netns_frags; f : access inet_frags);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:87
   pragma Import (CPP, inet_frags_exit_net, "_Z19inet_frags_exit_netP11netns_fragsP10inet_frags");

   procedure inet_frag_kill (q : access inet_frag_queue; f : access inet_frags);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:89
   pragma Import (CPP, inet_frag_kill, "_Z14inet_frag_killP15inet_frag_queueP10inet_frags");

   procedure inet_frag_destroy
     (q : access inet_frag_queue;
      f : access inet_frags;
      work : access int);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:90
   pragma Import (CPP, inet_frag_destroy, "_Z17inet_frag_destroyP15inet_frag_queueP10inet_fragsPi");

   function inet_frag_evictor
     (nf : access netns_frags;
      f : access inet_frags;
      force : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:92
   pragma Import (CPP, inet_frag_evictor, "_Z17inet_frag_evictorP11netns_fragsP10inet_fragsb");

   function inet_frag_find
     (nf : access netns_frags;
      f : access inet_frags;
      key : System.Address;
      hash : unsigned) return access inet_frag_queue;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:93
   pragma Import (CPP, inet_frag_find, "_Z14inet_frag_findP11netns_fragsP10inet_fragsPvj");

   procedure inet_frag_maybe_warn_overflow (q : access inet_frag_queue; prefix : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:96
   pragma Import (CPP, inet_frag_maybe_warn_overflow, "_Z29inet_frag_maybe_warn_overflowP15inet_frag_queuePKc");

   procedure inet_frag_put (q : access inet_frag_queue; f : access inet_frags);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:99
   pragma Import (CPP, inet_frag_put, "_ZL13inet_frag_putP15inet_frag_queueP10inet_frags");

  -- Memory Tracking Functions.  
  -- The default percpu_counter batch size is not big enough to scale to
  -- * fragmentation mem acct sizes.
  -- * The mem size of a 64K fragment is approx:
  -- *  (44 fragments * 2944 truesize) + frag_queue struct(200) = 129736 bytes
  --  

   frag_percpu_counter_batch : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:112
   pragma Import (CPP, frag_percpu_counter_batch, "_ZL25frag_percpu_counter_batch");

   function frag_mem_limit (nf : access netns_frags) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:114
   pragma Import (CPP, frag_mem_limit, "_ZL14frag_mem_limitP11netns_frags");

   procedure sub_frag_mem_limit (q : access inet_frag_queue; i : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:119
   pragma Import (CPP, sub_frag_mem_limit, "_ZL18sub_frag_mem_limitP15inet_frag_queuei");

   procedure add_frag_mem_limit (q : access inet_frag_queue; i : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:124
   pragma Import (CPP, add_frag_mem_limit, "_ZL18add_frag_mem_limitP15inet_frag_queuei");

   procedure init_frag_mem_limit (nf : access netns_frags);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:129
   pragma Import (CPP, init_frag_mem_limit, "_ZL19init_frag_mem_limitP11netns_frags");

   function sum_frag_mem_limit (nf : access netns_frags) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:134
   pragma Import (CPP, sum_frag_mem_limit, "_ZL18sum_frag_mem_limitP11netns_frags");

   procedure inet_frag_lru_move (q : access inet_frag_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:145
   pragma Import (CPP, inet_frag_lru_move, "_ZL18inet_frag_lru_moveP15inet_frag_queue");

   procedure inet_frag_lru_del (q : access inet_frag_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:153
   pragma Import (CPP, inet_frag_lru_del, "_ZL17inet_frag_lru_delP15inet_frag_queue");

   procedure inet_frag_lru_add (nf : access netns_frags; q : access inet_frag_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:161
   pragma Import (CPP, inet_frag_lru_add, "_ZL17inet_frag_lru_addP11netns_fragsP15inet_frag_queue");

  -- RFC 3168 support :
  -- * We want to check ECN values of all fragments, do detect invalid combinations.
  -- * In ipq->ecn, we store the OR value of each ip4_frag_ecn() fragment value.
  --  

   ip_frag_ecn_table : aliased array (0 .. 15) of aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/inet_frag.h:179
   pragma Import (C, ip_frag_ecn_table, "ip_frag_ecn_table");

end net_inet_frag_h;

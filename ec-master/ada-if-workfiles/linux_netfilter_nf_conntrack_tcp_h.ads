pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;

package linux_netfilter_nf_conntrack_tcp_h is

  -- max of seq + len  
   type ip_ct_tcp_state is record
      td_end : aliased linux_types_h.u_int32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:8
      td_maxend : aliased linux_types_h.u_int32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:9
      td_maxwin : aliased linux_types_h.u_int32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:10
      td_maxack : aliased linux_types_h.u_int32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:11
      td_scale : aliased linux_types_h.u_int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:12
      flags : aliased linux_types_h.u_int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:13
   end record;
   pragma Convention (C_Pass_By_Copy, ip_ct_tcp_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:7

  -- max of ack + max(win, 1)  
  -- max(win)  
  -- max of ack  
  -- window scale factor  
  -- per direction options  
  -- connection parameters per direction  
   type ip_ct_tcp_seen_array is array (0 .. 1) of aliased ip_ct_tcp_state;
   type ip_ct_tcp is record
      seen : aliased ip_ct_tcp_seen_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:17
      state : aliased linux_types_h.u_int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:18
      last_dir : aliased linux_types_h.u_int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:20
      retrans : aliased linux_types_h.u_int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:21
      last_index : aliased linux_types_h.u_int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:22
      last_seq : aliased linux_types_h.u_int32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:23
      last_ack : aliased linux_types_h.u_int32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:24
      last_end : aliased linux_types_h.u_int32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:25
      last_win : aliased linux_types_h.u_int16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:26
      last_wscale : aliased linux_types_h.u_int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:28
      last_flags : aliased linux_types_h.u_int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, ip_ct_tcp);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/netfilter/nf_conntrack_tcp.h:16

  -- state of the connection (enum tcp_conntrack)  
  -- For detecting stale connections  
  -- Direction of the last packet (enum ip_conntrack_dir)  
  -- Number of retransmitted packets  
  -- Index of the last packet  
  -- Last sequence number seen in dir  
  -- Last sequence number seen in opposite dir  
  -- Last seq + len  
  -- Last window advertisement seen in dir  
  -- For SYN packets while we may be out-of-sync  
  -- Last window scaling factor seen  
  -- Last flags set  
end linux_netfilter_nf_conntrack_tcp_h;

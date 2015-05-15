pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_netfilter_nf_conntrack_tcp_h is

   --  unsupported macro: TCP_CONNTRACK_SYN_SENT2 TCP_CONNTRACK_LISTEN
   --  unsupported macro: IP_CT_TCP_FLAG_WINDOW_SCALE 0x01
   --  unsupported macro: IP_CT_TCP_FLAG_SACK_PERM 0x02
   --  unsupported macro: IP_CT_TCP_FLAG_CLOSE_INIT 0x04
   --  unsupported macro: IP_CT_TCP_FLAG_BE_LIBERAL 0x08
   --  unsupported macro: IP_CT_TCP_FLAG_DATA_UNACKNOWLEDGED 0x10
   --  unsupported macro: IP_CT_TCP_FLAG_MAXACK_SET 0x20
  -- TCP tracking.  
  -- This is exposed to userspace (ctnetlink)  
   type tcp_conntrack is 
     (TCP_CONNTRACK_NONE,
      TCP_CONNTRACK_SYN_SENT,
      TCP_CONNTRACK_SYN_RECV,
      TCP_CONNTRACK_ESTABLISHED,
      TCP_CONNTRACK_FIN_WAIT,
      TCP_CONNTRACK_CLOSE_WAIT,
      TCP_CONNTRACK_LAST_ACK,
      TCP_CONNTRACK_TIME_WAIT,
      TCP_CONNTRACK_CLOSE,
      TCP_CONNTRACK_LISTEN,
      TCP_CONNTRACK_MAX,
      TCP_CONNTRACK_IGNORE,
      TCP_CONNTRACK_RETRANS,
      TCP_CONNTRACK_UNACK,
      TCP_CONNTRACK_TIMEOUT_MAX);
   pragma Convention (C, tcp_conntrack);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter/nf_conntrack_tcp.h:8

  -- obsolete  
  -- Window scaling is advertised by the sender  
  -- SACK is permitted by the sender  
  -- This sender sent FIN first  
  -- Be liberal in window checking  
  -- Has unacknowledged data  
  -- The field td_maxack has been set  
   type nf_ct_tcp_flags is record
      flags : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter/nf_conntrack_tcp.h:46
      mask : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter/nf_conntrack_tcp.h:47
   end record;
   pragma Convention (C_Pass_By_Copy, nf_ct_tcp_flags);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter/nf_conntrack_tcp.h:45

end uapi_linux_netfilter_nf_conntrack_tcp_h;

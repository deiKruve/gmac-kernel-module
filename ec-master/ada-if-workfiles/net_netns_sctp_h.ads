pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with linux_sysctl_h;
with linux_types_h;
with linux_timer_h;
with linux_spinlock_types_h;
with Interfaces.C.Strings;

package net_netns_sctp_h is

   --  skipped empty struct sctp_mib

   type netns_sctp is record
      sctp_statistics : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:10
      proc_net_sctp : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:13
      sysctl_header : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:16
      ctl_sock : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:22
      local_addr_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:30
      addr_waitq : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:31
      addr_wq_timer : aliased linux_timer_h.timer_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:32
      auto_asconf_splist : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:33
      addr_wq_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:34
      local_addr_lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:37
      rto_initial : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:49
      rto_min : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:50
      rto_max : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:51
      rto_alpha : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:56
      rto_beta : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:57
      max_burst : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:60
      cookie_preserve_enable : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:63
      sctp_hmac_alg : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:66
      valid_cookie_life : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:69
      sack_timeout : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:72
      hb_interval : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:75
      max_retrans_association : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:81
      max_retrans_path : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:82
      max_retrans_init : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:83
      pf_retrans : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:88
      sndbuf_policy : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:95
      rcvbuf_policy : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:102
      default_auto_asconf : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:104
      addip_enable : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:107
      addip_noauth : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:108
      prsctp_enable : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:111
      auth_enable : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:114
      scope_policy : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:123
      rwnd_upd_shift : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:128
      max_autoclose : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:131
   end record;
   pragma Convention (C_Pass_By_Copy, netns_sctp);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/sctp.h:9

  -- This is the global socket data structure used for responding to
  --	 * the Out-of-the-blue (OOTB) packets.  A control sock will be created
  --	 * for this socket at the initialization time.
  --	  

  -- This is the global local address list.
  --	 * We actively maintain this complete list of addresses on
  --	 * the system by catching address add/delete events.
  --	 *
  --	 * It is a list of sctp_sockaddr_entry.
  --	  

  -- Lock that protects the local_addr_list writers  
  -- RFC2960 Section 14. Suggested SCTP Protocol Parameter Values
  --	 *
  --	 * The following protocol parameters are RECOMMENDED:
  --	 *
  --	 * RTO.Initial		    - 3	 seconds
  --	 * RTO.Min		    - 1	 second
  --	 * RTO.Max		   -  60 seconds
  --	 * RTO.Alpha		    - 1/8  (3 when converted to right shifts.)
  --	 * RTO.Beta		    - 1/4  (2 when converted to right shifts.)
  --	  

  -- Note: rto_alpha and rto_beta are really defined as inverse
  --	 * powers of two to facilitate integer operations.
  --	  

  -- Max.Burst		    - 4  
  -- Whether Cookie Preservative is enabled(1) or not(0)  
  -- The namespace default hmac alg  
  -- Valid.Cookie.Life	    - 60  seconds   
  -- Delayed SACK timeout  200ms default 
  -- HB.interval		    - 30 seconds   
  -- Association.Max.Retrans  - 10 attempts
  --	 * Path.Max.Retrans	    - 5	 attempts (per destination address)
  --	 * Max.Init.Retransmits	    - 8	 attempts
  --	  

  -- Potentially-Failed.Max.Retrans sysctl value
  --	 * taken from:
  --	 * http://tools.ietf.org/html/draft-nishida-tsvwg-sctp-failover-05
  --	  

  --	 * Policy for preforming sctp/socket accounting
  --	 * 0   - do socket level accounting, all assocs share sk_sndbuf
  --	 * 1   - do sctp accounting, each asoc may use sk_sndbuf bytes
  --	  

  --	 * Policy for preforming sctp/socket accounting
  --	 * 0   - do socket level accounting, all assocs share sk_rcvbuf
  --	 * 1   - do sctp accounting, each asoc may use sk_rcvbuf bytes
  --	  

  -- Flag to indicate if addip is enabled.  
  -- Flag to indicate if PR-SCTP is enabled.  
  -- Flag to idicate if SCTP-AUTH is enabled  
  --	 * Policy to control SCTP IPv4 address scoping
  --	 * 0   - Disable IPv4 address scoping
  --	 * 1   - Enable IPv4 address scoping
  --	 * 2   - Selectively allow only IPv4 private addresses
  --	 * 3   - Selectively allow only IPv4 link local address
  --	  

  -- Threshold for rwnd update SACKS.  Receive buffer shifted this many
  --	 * bits is an indicator of when to send and window update SACK.
  --	  

  -- Threshold for autoclose timeout, in seconds.  
end net_netns_sctp_h;

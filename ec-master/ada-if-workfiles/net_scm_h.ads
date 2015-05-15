pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with linux_uidgid_h;
limited with linux_fs_h;
limited with linux_pid_h;
limited with linux_socket_h;
limited with linux_net_h;
with Interfaces.C.Extensions;

package net_scm_h is

   --  unsupported macro: SCM_MAX_FD 253
  -- Well, we should have at least one descriptor open
  -- * to accept passed FDs 8)
  --  

   type scm_creds is record
      pid : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:16
      uid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:17
      gid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:18
   end record;
   pragma Convention (C_Pass_By_Copy, scm_creds);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:15

   type scm_fp_list_fp_array is array (0 .. 252) of access linux_fs_h.file;
   type scm_fp_list is record
      count : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:22
      max : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:23
      fp : aliased scm_fp_list_fp_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, scm_fp_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:21

  -- Skb credentials  
   type scm_cookie is record
      the_pid : access linux_pid_h.pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:28
      fp : access scm_fp_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:29
      creds : aliased scm_creds;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:30
      secid : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, scm_cookie);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:27

  -- Passed files		 
  -- Skb credentials	 
  -- Passed security ID 	 
   procedure scm_detach_fds (msg : access linux_socket_h.msghdr; scm : access scm_cookie);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:36
   pragma Import (CPP, scm_detach_fds, "_Z14scm_detach_fdsP6msghdrP10scm_cookie");

   procedure scm_detach_fds_compat (msg : access linux_socket_h.msghdr; scm : access scm_cookie);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:37
   pragma Import (CPP, scm_detach_fds_compat, "_Z21scm_detach_fds_compatP6msghdrP10scm_cookie");

   --  skipped func __scm_send

   --  skipped func __scm_destroy

   function scm_fp_dup (fpl : access scm_fp_list) return access scm_fp_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:40
   pragma Import (CPP, scm_fp_dup, "_Z10scm_fp_dupP11scm_fp_list");

   procedure unix_get_peersec_dgram (sock : access linux_net_h.socket; scm : access scm_cookie);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:43
   pragma Import (CPP, unix_get_peersec_dgram, "_ZL22unix_get_peersec_dgramP6socketP10scm_cookie");

   procedure scm_set_cred
     (scm : access scm_cookie;
      the_pid : access linux_pid_h.pid;
      uid : linux_uidgid_h.kuid_t;
      gid : linux_uidgid_h.kgid_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:52
   pragma Import (CPP, scm_set_cred, "_ZL12scm_set_credP10scm_cookieP3pid6kuid_t6kgid_t");

   procedure scm_destroy_cred (scm : access scm_cookie);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:61
   pragma Import (CPP, scm_destroy_cred, "_ZL16scm_destroy_credP10scm_cookie");

   procedure scm_destroy (scm : access scm_cookie);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:67
   pragma Import (CPP, scm_destroy, "_ZL11scm_destroyP10scm_cookie");

   function scm_send
     (sock : access linux_net_h.socket;
      msg : access linux_socket_h.msghdr;
      scm : access scm_cookie;
      forcecreds : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:74
   pragma Import (CPP, scm_send, "_ZL8scm_sendP6socketP6msghdrP10scm_cookieb");

   procedure scm_passec
     (sock : access linux_net_h.socket;
      msg : access linux_socket_h.msghdr;
      scm : access scm_cookie);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:89
   pragma Import (CPP, scm_passec, "_ZL10scm_passecP6socketP6msghdrP10scm_cookie");

   procedure scm_recv
     (sock : access linux_net_h.socket;
      msg : access linux_socket_h.msghdr;
      scm : access scm_cookie;
      flags : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/scm.h:109
   pragma Import (CPP, scm_recv, "_ZL8scm_recvP6socketP6msghdrP10scm_cookiei");

end net_scm_h;

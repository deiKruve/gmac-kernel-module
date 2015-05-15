pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with linux_sysctl_h;

package net_netns_netfilter_h is

   --  skipped empty struct nf_logger

   type netns_nf_nf_loggers_array is array (0 .. 12) of System.Address;
   type netns_nf is record
      proc_netfilter : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/netfilter.h:11
      nf_loggers : aliased netns_nf_nf_loggers_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/netfilter.h:13
      nf_log_dir_header : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/netfilter.h:15
   end record;
   pragma Convention (C_Pass_By_Copy, netns_nf);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/netfilter.h:9

end net_netns_netfilter_h;

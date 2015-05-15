pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sysctl_h;

package net_netns_unix_h is

  -- * Unix network namespace
  --  

   type netns_unix is record
      sysctl_max_dgram_qlen : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/unix.h:9
      ctl : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/unix.h:10
   end record;
   pragma Convention (C_Pass_By_Copy, netns_unix);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/unix.h:8

end net_netns_unix_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sysctl_h;
with System;

package net_netns_core_h is

   --  skipped empty struct prot_inuse

  -- core sysctls  
   type netns_core is record
      sysctl_hdr : access linux_sysctl_h.ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/core.h:9
      sysctl_somaxconn : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/core.h:11
      inuse : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/core.h:13
   end record;
   pragma Convention (C_Pass_By_Copy, netns_core);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/core.h:7

end net_netns_core_h;

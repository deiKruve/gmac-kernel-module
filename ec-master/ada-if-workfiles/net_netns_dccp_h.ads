pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package net_netns_dccp_h is

   type netns_dccp is record
      v4_ctl_sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/dccp.h:7
      v6_ctl_sk : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/dccp.h:8
   end record;
   pragma Convention (C_Pass_By_Copy, netns_dccp);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/dccp.h:6

end net_netns_dccp_h;

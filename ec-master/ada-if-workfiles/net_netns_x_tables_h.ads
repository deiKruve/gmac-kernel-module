pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with Interfaces.C.Extensions;
with System;

package net_netns_x_tables_h is

   --  skipped empty struct ebt_table

   type netns_xt_tables_array is array (0 .. 12) of aliased linux_types_h.list_head;
   type netns_xt is record
      tables : aliased netns_xt_tables_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/x_tables.h:10
      notrack_deprecated_warning : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/x_tables.h:11
      broute_table : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/x_tables.h:14
      frame_filter : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/x_tables.h:15
      frame_nat : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/x_tables.h:16
      ulog_warn_deprecated : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/x_tables.h:19
      ebt_ulog_warn_deprecated : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/x_tables.h:22
   end record;
   pragma Convention (C_Pass_By_Copy, netns_xt);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netns/x_tables.h:9

end net_netns_x_tables_h;

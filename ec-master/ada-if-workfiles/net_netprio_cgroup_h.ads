pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with linux_types_h;
with System;
limited with linux_sched_h;

package net_netprio_cgroup_h is

  -- * netprio_cgroup.h			Control Group Priority set
  -- *
  -- *
  -- * Authors:	Neil Horman <nhorman@tuxdriver.com>
  -- *
  -- * This program is free software; you can redistribute it and/or modify it
  -- * under the terms of the GNU General Public License as published by the Free
  -- * Software Foundation; either version 2 of the License, or (at your option)
  -- * any later version.
  -- *
  --  

   type netprio_map_priomap_array is array (0 .. -1) of aliased asm_generic_int_ll64_h.u32;
   type netprio_map is record
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netprio_cgroup.h:23
      priomap_len : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netprio_cgroup.h:24
      priomap : aliased netprio_map_priomap_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netprio_cgroup.h:25
   end record;
   pragma Convention (C_Pass_By_Copy, netprio_map);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netprio_cgroup.h:22

   procedure sock_update_netprioidx (sk : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netprio_cgroup.h:28
   pragma Import (CPP, sock_update_netprioidx, "_Z22sock_update_netprioidxP4sock");

   function task_netprioidx (p : access linux_sched_h.task_struct) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/netprio_cgroup.h:30
   pragma Import (CPP, task_netprioidx, "_ZL15task_netprioidxP11task_struct");

end net_netprio_cgroup_h;

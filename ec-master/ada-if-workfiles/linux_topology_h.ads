pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_cpumask_h;

package linux_topology_h is

   --  arg-macro: function node_has_online_mem (1
   --    return 1;
   --  arg-macro: procedure nr_cpus_node cpumask_weight(cpumask_of_node(node))
   --    cpumask_weight(cpumask_of_node(node))
   --  arg-macro: procedure for_each_node_with_cpus for_each_online_node(node) if (nr_cpus_node(node))
   --    for_each_online_node(node) if (nr_cpus_node(node))
   --  unsupported macro: LOCAL_DISTANCE 10
   --  unsupported macro: REMOTE_DISTANCE 20
   --  unsupported macro: RECLAIM_DISTANCE 30
   --  unsupported macro: PENALTY_FOR_NODE_WITH_CPUS (1)
  -- * include/linux/topology.h
  -- *
  -- * Written by: Matthew Dobson, IBM Corporation
  -- *
  -- * Copyright (C) 2002, IBM Corp.
  -- *
  -- * All rights reserved.
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License as published by
  -- * the Free Software Foundation; either version 2 of the License, or
  -- * (at your option) any later version.
  -- *
  -- * This program is distributed in the hope that it will be useful, but
  -- * WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
  -- * NON INFRINGEMENT.  See the GNU General Public License for more
  -- * details.
  -- *
  -- * You should have received a copy of the GNU General Public License
  -- * along with this program; if not, write to the Free Software
  -- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  -- *
  -- * Send feedback to <colpatch@us.ibm.com>
  --  

   function arch_update_cpu_topology return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/topology.h:49
   pragma Import (CPP, arch_update_cpu_topology, "_Z24arch_update_cpu_topologyv");

  -- Conform to ACPI 2.0 SLIT distance definitions  
  -- * If the distance between nodes in a system is larger than RECLAIM_DISTANCE
  -- * (in whatever arch specific measurement units returned by node_distance())
  -- * and zone_reclaim_mode is enabled then the VM will only call zone_reclaim()
  -- * on nodes within this distance.
  --  

   numa_node : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/topology.h:71
   pragma Import (C, numa_node, "numa_node");

  -- Returns the number of the current Node.  
   function numa_node_id return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/topology.h:75
   pragma Import (CPP, numa_node_id, "_ZL12numa_node_idv");

   function cpu_to_node (cpu : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/topology.h:82
   pragma Import (CPP, cpu_to_node, "_ZL11cpu_to_nodei");

   procedure set_numa_node (node : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/topology.h:89
   pragma Import (CPP, set_numa_node, "_ZL13set_numa_nodei");

   procedure set_cpu_numa_node (cpu : int; node : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/topology.h:96
   pragma Import (CPP, set_cpu_numa_node, "_ZL17set_cpu_numa_nodeii");

  -- Returns the number of the current Node.  
  -- * N.B., Do NOT reference the '_numa_mem_' per cpu variable directly.
  -- * It will not be defined when CONFIG_HAVE_MEMORYLESS_NODES is not defined.
  -- * Use the accessor functions set_numa_mem(), numa_mem_id() and cpu_to_mem().
  --  

  -- Returns the number of the nearest Node with memory  
  -- Returns the number of the nearest Node with memory  
   function numa_mem_id return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/topology.h:156
   pragma Import (CPP, numa_mem_id, "_ZL11numa_mem_idv");

   function cpu_to_mem (cpu : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/topology.h:163
   pragma Import (CPP, cpu_to_mem, "_ZL10cpu_to_memi");

   function cpu_smt_mask (cpu : int) return access constant linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/topology.h:185
   pragma Import (CPP, cpu_smt_mask, "_ZL12cpu_smt_maski");

   function cpu_cpu_mask (cpu : int) return access constant linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/topology.h:191
   pragma Import (CPP, cpu_cpu_mask, "_ZL12cpu_cpu_maski");

end linux_topology_h;

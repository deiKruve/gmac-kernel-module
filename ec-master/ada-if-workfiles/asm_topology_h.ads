pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_cpumask_h;
with asm_generic_int_ll64_h;
limited with linux_types_h;

package asm_topology_h is

   --  arg-macro: function parent_node (node
   --    return node;
   --  arg-macro: procedure pcibus_to_node __pcibus_to_node(bus)
   --    __pcibus_to_node(bus)
   --  arg-macro: procedure node_distance __node_distance(a, b)
   --    __node_distance(a, b)
   --  arg-macro: function topology_physical_package_id (cpu_data(cpu).phys_proc_id
   --    return cpu_data(cpu).phys_proc_id;
   --  arg-macro: function topology_core_id (cpu_data(cpu).cpu_core_id
   --    return cpu_data(cpu).cpu_core_id;
   --  arg-macro: function topology_core_cpumask (per_cpu(cpu_core_map, cpu)
   --    return per_cpu(cpu_core_map, cpu);
   --  arg-macro: function topology_thread_cpumask (per_cpu(cpu_sibling_map, cpu)
   --    return per_cpu(cpu_sibling_map, cpu);
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

  -- * to preserve the visibility of NUMA_NO_NODE definition,
  -- * moved to there from here.  May be used independent of
  -- * CONFIG_NUMA.
  --  

  -- Mappings between logical cpu number and node number  
   x86_cpu_to_node_map_early_map : aliased array (size_t) of aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:51
   pragma Import (C, x86_cpu_to_node_map_early_map, "x86_cpu_to_node_map_early_map");

   x86_cpu_to_node_map_early_ptr : access int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:51
   pragma Import (C, x86_cpu_to_node_map_early_ptr, "x86_cpu_to_node_map_early_ptr");

   x86_cpu_to_node_map : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:51
   pragma Import (C, x86_cpu_to_node_map, "x86_cpu_to_node_map");

  -- * override generic percpu implementation of cpu_to_node
  --  

  -- Same function but used if called before per_cpu areas are setup  
   function early_cpu_to_node (cpu : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:65
   pragma Import (CPP, early_cpu_to_node, "_ZL17early_cpu_to_nodei");

  -- Mappings between node number and cpus on that node.  
   node_to_cpumask_map : aliased array (0 .. 63, 0 .. 0) of aliased linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:73
   pragma Import (C, node_to_cpumask_map, "node_to_cpumask_map");

  -- Returns a pointer to the cpumask of CPUs on Node 'node'.  
   function cpumask_of_node (node : int) return access constant linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:79
   pragma Import (CPP, cpumask_of_node, "_ZL15cpumask_of_nodei");

   procedure setup_node_to_cpumask_map;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:85
   pragma Import (CPP, setup_node_to_cpumask_map, "_Z25setup_node_to_cpumask_mapv");

  -- * Returns the number of the node containing Node 'node'. This
  -- * architecture is flat, so it is a pretty simple function!
  --  

   --  skipped func __node_distance

  -- * indicate override:
  --  

   function cpu_coregroup_mask (cpu : int) return access constant linux_cpumask_h.cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:120
   pragma Import (CPP, cpu_coregroup_mask, "_Z18cpu_coregroup_maski");

   procedure arch_fix_phys_package_id (num : int; slot : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:130
   pragma Import (CPP, arch_fix_phys_package_id, "_ZL24arch_fix_phys_package_idij");

   --  skipped empty struct pci_bus

   function x86_pci_root_bus_node (bus : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:135
   pragma Import (CPP, x86_pci_root_bus_node, "_Z21x86_pci_root_bus_nodei");

   procedure x86_pci_root_bus_resources (bus : int; resources : access linux_types_h.list_head);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/topology.h:136
   pragma Import (CPP, x86_pci_root_bus_resources, "_Z26x86_pci_root_bus_resourcesiP9list_head");

end asm_topology_h;

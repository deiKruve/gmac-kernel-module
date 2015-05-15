pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_nodemask_h;
with asm_generic_int_ll64_h;
with Interfaces.C.Strings;

package asm_numa_h is

   --  unsupported macro: NR_NODE_MEMBLKS (MAX_NUMNODES*2)
   --  unsupported macro: ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
   --  unsupported macro: NODE_MIN_SIZE (4*1024*1024)
   --  unsupported macro: FAKE_NODE_MIN_SIZE ((u64)32 << 20)
   --  unsupported macro: FAKE_NODE_MIN_HASH_MASK (~(FAKE_NODE_MIN_SIZE - 1UL))
  -- * Too small node sizes may confuse the VM badly. Usually they
  -- * result from BIOS bugs. So dont recognize nodes as standalone
  -- * NUMA entities that have less than this amount of RAM listed:
  --  

   numa_off : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:21
   pragma Import (C, numa_off, "numa_off");

  -- * __apicid_to_node[] stores the raw mapping between physical apicid and
  -- * node and is used to initialize cpu_to_node mapping.
  -- *
  -- * The mapping may be overridden by apic->numa_cpu_node() on 32bit and thus
  -- * should be accessed by the accessors - set_apicid_to_node() and
  -- * numa_cpu_node().
  --  

   numa_nodes_parsed : aliased linux_nodemask_h.nodemask_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:32
   pragma Import (C, numa_nodes_parsed, "numa_nodes_parsed");

   function numa_add_memblk
     (nodeid : int;
      start : asm_generic_int_ll64_h.u64;
      c_end : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:34
   pragma Import (CPP, numa_add_memblk, "_Z15numa_add_memblkiyy");

   procedure numa_set_distance
     (from : int;
      to : int;
      distance : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:35
   pragma Import (CPP, numa_set_distance, "_Z17numa_set_distanceiii");

   procedure set_apicid_to_node (apicid : int; node : asm_generic_int_ll64_h.s16);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:37
   pragma Import (CPP, set_apicid_to_node, "_ZL18set_apicid_to_nodeis");

   function numa_cpu_node (cpu : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:42
   pragma Import (CPP, numa_cpu_node, "_Z13numa_cpu_nodei");

   procedure numa_set_node (cpu : int; node : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:60
   pragma Import (CPP, numa_set_node, "_Z13numa_set_nodeii");

   procedure numa_clear_node (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:61
   pragma Import (CPP, numa_clear_node, "_Z15numa_clear_nodei");

   procedure init_cpu_to_node;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:62
   pragma Import (CPP, init_cpu_to_node, "_Z16init_cpu_to_nodev");

   procedure numa_add_cpu (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:63
   pragma Import (CPP, numa_add_cpu, "_Z12numa_add_cpui");

   procedure numa_remove_cpu (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:64
   pragma Import (CPP, numa_remove_cpu, "_Z15numa_remove_cpui");

   procedure numa_emu_cmdline (arg1 : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/numa.h:80
   pragma Import (CPP, numa_emu_cmdline, "_Z16numa_emu_cmdlinePc");

end asm_numa_h;

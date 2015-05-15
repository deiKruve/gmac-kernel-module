pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;
with linux_rbtree_h;
with asm_pgtable_types_h;
limited with linux_mm_types_h;
with Interfaces.C.Strings;

package linux_vmalloc_h is

   --  unsupported macro: VM_IOREMAP 0x00000001
   --  unsupported macro: VM_ALLOC 0x00000002
   --  unsupported macro: VM_MAP 0x00000004
   --  unsupported macro: VM_USERMAP 0x00000008
   --  unsupported macro: VM_VPAGES 0x00000010
   --  unsupported macro: VM_UNINITIALIZED 0x00000020
   --  unsupported macro: IOREMAP_MAX_ORDER (7 + PAGE_SHIFT)
   --  unsupported macro: VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
  -- pgprot_t  
  -- vma defining user mapping in mm_types.h  
  -- bits in flags of vmalloc's vm_struct below  
  -- bits [20..32] reserved for arch specific ioremap internals  
  -- * Maximum alignment for ioremap() regions.
  -- * Can be overriden by arch-specific value.
  --  

   type vm_struct is record
      next : access vm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:30
      addr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:31
      size : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:32
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:33
      pages : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:34
      nr_pages : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:35
      phys_addr : aliased linux_types_h.phys_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:36
      caller : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, vm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:29

   type vmap_area is record
      va_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:41
      va_end : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:42
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:43
      the_rb_node : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:44
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:45
      purge_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:46
      vm : access vm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:47
      the_callback_head : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:48
   end record;
   pragma Convention (C_Pass_By_Copy, vmap_area);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:40

  -- address sorted rbtree  
  -- address sorted list  
  -- "lazy purge" list  
  -- *	Highlevel APIs for driver use
  --  

   procedure vm_unmap_ram (mem : System.Address; count : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:54
   pragma Import (CPP, vm_unmap_ram, "_Z12vm_unmap_ramPKvj");

   function vm_map_ram
     (pages : System.Address;
      count : unsigned;
      node : int;
      prot : asm_pgtable_types_h.pgprot_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:55
   pragma Import (CPP, vm_map_ram, "_Z10vm_map_ramPP4pageji6pgprot");

   procedure vm_unmap_aliases;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:57
   pragma Import (CPP, vm_unmap_aliases, "_Z16vm_unmap_aliasesv");

   procedure vmalloc_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:60
   pragma Import (CPP, vmalloc_init, "_Z12vmalloc_initv");

   function vmalloc (size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:67
   pragma Import (CPP, vmalloc, "_Z7vmallocm");

   function vzalloc (size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:68
   pragma Import (CPP, vzalloc, "_Z7vzallocm");

   function vmalloc_user (size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:69
   pragma Import (CPP, vmalloc_user, "_Z12vmalloc_userm");

   function vmalloc_node (size : unsigned_long; node : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:70
   pragma Import (CPP, vmalloc_node, "_Z12vmalloc_nodemi");

   function vzalloc_node (size : unsigned_long; node : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:71
   pragma Import (CPP, vzalloc_node, "_Z12vzalloc_nodemi");

   function vmalloc_exec (size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:72
   pragma Import (CPP, vmalloc_exec, "_Z12vmalloc_execm");

   function vmalloc_32 (size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:73
   pragma Import (CPP, vmalloc_32, "_Z10vmalloc_32m");

   function vmalloc_32_user (size : unsigned_long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:74
   pragma Import (CPP, vmalloc_32_user, "_Z15vmalloc_32_userm");

   --  skipped func __vmalloc

   --  skipped func __vmalloc_node_range

   procedure vfree (addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:79
   pragma Import (CPP, vfree, "_Z5vfreePKv");

   function vmap
     (pages : System.Address;
      count : unsigned;
      flags : unsigned_long;
      prot : asm_pgtable_types_h.pgprot_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:81
   pragma Import (CPP, vmap, "_Z4vmapPP4pagejm6pgprot");

   procedure vunmap (addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:83
   pragma Import (CPP, vunmap, "_Z6vunmapPKv");

   function remap_vmalloc_range_partial
     (vma : access linux_mm_types_h.vm_area_struct;
      uaddr : unsigned_long;
      kaddr : System.Address;
      size : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:85
   pragma Import (CPP, remap_vmalloc_range_partial, "_Z27remap_vmalloc_range_partialP14vm_area_structmPvm");

   function remap_vmalloc_range
     (vma : access linux_mm_types_h.vm_area_struct;
      addr : System.Address;
      pgoff : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:89
   pragma Import (CPP, remap_vmalloc_range, "_Z19remap_vmalloc_rangeP14vm_area_structPvm");

   procedure vmalloc_sync_all;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:91
   pragma Import (CPP, vmalloc_sync_all, "_Z16vmalloc_sync_allv");

  -- *	Lowlevel-APIs (not for driver use!)
  --  

   function get_vm_area_size (area : access constant vm_struct) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:97
   pragma Import (CPP, get_vm_area_size, "_ZL16get_vm_area_sizePK9vm_struct");

  -- return actual size without guard page  
   function get_vm_area (size : unsigned_long; flags : unsigned_long) return access vm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:103
   pragma Import (CPP, get_vm_area, "_Z11get_vm_areamm");

   function get_vm_area_caller
     (size : unsigned_long;
      flags : unsigned_long;
      caller : System.Address) return access vm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:104
   pragma Import (CPP, get_vm_area_caller, "_Z18get_vm_area_callermmPKv");

   --  skipped func __get_vm_area

   --  skipped func __get_vm_area_caller

   function remove_vm_area (addr : System.Address) return access vm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:112
   pragma Import (CPP, remove_vm_area, "_Z14remove_vm_areaPKv");

   function find_vm_area (addr : System.Address) return access vm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:113
   pragma Import (CPP, find_vm_area, "_Z12find_vm_areaPKv");

   function map_vm_area
     (area : access vm_struct;
      prot : asm_pgtable_types_h.pgprot_t;
      pages : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:115
   pragma Import (CPP, map_vm_area, "_Z11map_vm_areaP9vm_struct6pgprotPPP4page");

   function map_kernel_range_noflush
     (start : unsigned_long;
      size : unsigned_long;
      prot : asm_pgtable_types_h.pgprot_t;
      pages : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:118
   pragma Import (CPP, map_kernel_range_noflush, "_Z24map_kernel_range_noflushmm6pgprotPP4page");

   procedure unmap_kernel_range_noflush (addr : unsigned_long; size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:120
   pragma Import (CPP, unmap_kernel_range_noflush, "_Z26unmap_kernel_range_noflushmm");

   procedure unmap_kernel_range (addr : unsigned_long; size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:121
   pragma Import (CPP, unmap_kernel_range, "_Z18unmap_kernel_rangemm");

  -- Allocate/destroy a 'vmalloc' VM area.  
   function alloc_vm_area (size : linux_types_h.size_t; ptes : System.Address) return access vm_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:140
   pragma Import (CPP, alloc_vm_area, "_Z13alloc_vm_areamPP5pte_t");

   procedure free_vm_area (area : access vm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:141
   pragma Import (CPP, free_vm_area, "_Z12free_vm_areaP9vm_struct");

  -- for /dev/kmem  
   function vread
     (buf : Interfaces.C.Strings.chars_ptr;
      addr : Interfaces.C.Strings.chars_ptr;
      count : unsigned_long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:144
   pragma Import (CPP, vread, "_Z5vreadPcS_m");

   function vwrite
     (buf : Interfaces.C.Strings.chars_ptr;
      addr : Interfaces.C.Strings.chars_ptr;
      count : unsigned_long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:145
   pragma Import (CPP, vwrite, "_Z6vwritePcS_m");

  -- *	Internals.  Dont't use..
  --  

   vmap_area_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:150
   pragma Import (C, vmap_area_list, "vmap_area_list");

   procedure vm_area_add_early (vm : access vm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:151
   pragma Import (CPP, vm_area_add_early, "_Z17vm_area_add_earlyP9vm_struct");

   procedure vm_area_register_early (vm : access vm_struct; align : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:152
   pragma Import (CPP, vm_area_register_early, "_Z22vm_area_register_earlyP9vm_structm");

   function pcpu_get_vm_areas
     (offsets : access unsigned_long;
      sizes : access linux_types_h.size_t;
      nr_vms : int;
      align : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:156
   pragma Import (CPP, pcpu_get_vm_areas, "_Z17pcpu_get_vm_areasPKmS0_im");

   procedure pcpu_free_vm_areas (vms : System.Address; nr_vms : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:160
   pragma Import (CPP, pcpu_free_vm_areas, "_Z18pcpu_free_vm_areasPP9vm_structi");

   type vmalloc_info is record
      used : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:178
      largest_chunk : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:179
   end record;
   pragma Convention (C_Pass_By_Copy, vmalloc_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:177

   procedure get_vmalloc_info (vmi : access vmalloc_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmalloc.h:184
   pragma Import (CPP, get_vmalloc_info, "_Z16get_vmalloc_infoP12vmalloc_info");

end linux_vmalloc_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Linux_Types;
with Linux_Rbtree;
with asm_pgtable_types;
--  limited with linux_mm_types_h;
with Interfaces.C.Strings;

package linux_vmalloc is
   package L renames Linux_Types;

   type vm_struct is record
      next      : access vm_struct;
      addr      : System.Address;
      size      : aliased unsigned_long;
      flags     : aliased unsigned_long;
      pages     : System.Address;
      nr_pages  : aliased unsigned;
      phys_addr : aliased L.phys_addr_t;
      caller    : System.Address;
   end record;
   pragma Convention (C_Pass_By_Copy, vm_struct);

   type vmap_area is record
      va_start          : aliased unsigned_long;
      va_end            : aliased unsigned_long;
      flags             : aliased unsigned_long;
      the_rb_node       : aliased Linux_Rbtree.rb_node;
      list              : aliased L.list_head;
      purge_list        : aliased L.list_head;
      vm                : access vm_struct;
      the_callback_head : aliased L.callback_head;
   end record;
   pragma Convention (C_Pass_By_Copy, vmap_area);

   procedure vm_unmap_ram (mem : System.Address; count : unsigned);
   pragma Import (C, vm_unmap_ram, "vm_unmap_ram");

   function vm_map_ram
     (pages : System.Address;
      count : unsigned;
      node  : int;
      prot  : asm_pgtable_types.pgprot_t) return System.Address;
   pragma Import (C, vm_map_ram, "vm_map_ram");

   procedure vm_unmap_aliases;
   pragma Import (C, vm_unmap_aliases, "vm_unmap_aliases");

   procedure vmalloc_init;
   --  this seems to be used at boot only, it is an inline with no MMU
   pragma Import (C, vmalloc_init, "vmalloc_init");

   function vmalloc (size : unsigned_long) return System.Address;
   pragma Import (C, vmalloc, "vmalloc");

   function vzalloc (size : unsigned_long) return System.Address;
   pragma Import (C, vzalloc, "vzalloc");

   function vmalloc_user (size : unsigned_long) return System.Address;
   pragma Import (C, vmalloc_user, "vmalloc_user");

   function vmalloc_node
     (size : unsigned_long;
      node : int) return System.Address;
   pragma Import (C, vmalloc_node, "vmalloc_node");

   function vzalloc_node
     (size : unsigned_long;
      node : int) return System.Address;
   pragma Import (C, vzalloc_node, "vzalloc_node");

   function vmalloc_exec (size : unsigned_long) return System.Address;
   pragma Import (C, vmalloc_exec, "vmalloc_exec");

   procedure vfree (addr : System.Address);
   pragma Import (C, vfree, "vfree");

   function vmap
     (pages : System.Address;
      count : unsigned;
      flags : unsigned_long;
      prot  : asm_pgtable_types.pgprot_t) return System.Address;
   pragma Import (C, vmap, "vmap");

   procedure vunmap (addr : System.Address);
   pragma Import (C, vunmap, "vunmap");

end linux_vmalloc;

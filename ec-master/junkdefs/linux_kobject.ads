

with Interfaces.C.Strings;
with Linux_Types;
with Linux_Kernfs;

package Linux_Kobject is
   
   type kset;
   type kobj_type;
   
   type kobject is record
      name : Interfaces.C.Strings.chars_ptr;
      c_entry : aliased linux_types.list_head;
      parent : access kobject;
      the_kset : access kset;
      ktype : access kobj_type;
      sd : access linux_kernfs.kernfs_node;
      
      
end Linux_Kobject;

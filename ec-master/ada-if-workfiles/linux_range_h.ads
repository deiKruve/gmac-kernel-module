pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with linux_types_h;

package linux_range_h is

   --  unsupported macro: MAX_RESOURCE ((resource_size_t)~0)
   type c_range is record
      start : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/range.h:5
      c_end : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/range.h:6
   end record;
   pragma Convention (C_Pass_By_Copy, c_range);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/range.h:4

   function add_range
     (the_c_range : access c_range;
      az : int;
      nr_range : int;
      start : asm_generic_int_ll64_h.u64;
      c_end : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/range.h:9
   pragma Import (CPP, add_range, "_Z9add_rangeP5rangeiiyy");

   function add_range_with_merge
     (the_c_range : access c_range;
      az : int;
      nr_range : int;
      start : asm_generic_int_ll64_h.u64;
      c_end : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/range.h:13
   pragma Import (CPP, add_range_with_merge, "_Z20add_range_with_mergeP5rangeiiyy");

   procedure subtract_range
     (the_c_range : access c_range;
      az : int;
      start : asm_generic_int_ll64_h.u64;
      c_end : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/range.h:16
   pragma Import (CPP, subtract_range, "_Z14subtract_rangeP5rangeiyy");

   function clean_sort_range (the_c_range : access c_range; az : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/range.h:18
   pragma Import (CPP, clean_sort_range, "_Z16clean_sort_rangeP5rangei");

   procedure sort_range (the_c_range : access c_range; nr_range : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/range.h:20
   pragma Import (CPP, sort_range, "_Z10sort_rangeP5rangei");

   function cap_resource (val : asm_generic_int_ll64_h.u64) return linux_types_h.resource_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/range.h:23
   pragma Import (CPP, cap_resource, "_ZL12cap_resourcey");

end linux_range_h;

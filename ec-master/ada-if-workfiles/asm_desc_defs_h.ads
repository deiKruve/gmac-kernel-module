pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with Interfaces.C.Extensions;

package asm_desc_defs_h is

   --  arg-macro: procedure GDT_ENTRY_INIT { { { .a := ((limit) and 0xffff) or (((base) and 0xffff) << 16), .b := (((base) and 0xff0000) >> 16) or (((flags) and 0xf0ff) << 8) or ((limit) and 0xf0000) or ((base) and 0xff000000), } } }
   --    { { { .a := ((limit) and 0xffff) or (((base) and 0xffff) << 16), .b := (((base) and 0xff0000) >> 16) or (((flags) and 0xf0ff) << 8) or ((limit) and 0xf0000) or ((base) and 0xff000000), } } }
   --  arg-macro: function PTR_LOW ((unsigned long long)(x) and 0xFFFF
   --    return (unsigned long long)(x) and 0xFFFF;
   --  arg-macro: function PTR_MIDDLE (((unsigned long long)(x) >> 16) and 0xFFFF
   --    return ((unsigned long long)(x) >> 16) and 0xFFFF;
   --  arg-macro: function PTR_HIGH ((unsigned long long)(x) >> 32
   --    return (unsigned long long)(x) >> 32;
   --  arg-macro: function gate_offset ((g).offset_low or ((unsigned long)(g).offset_middle << 16) or ((unsigned long)(g).offset_high << 32)
   --    return (g).offset_low or ((unsigned long)(g).offset_middle << 16) or ((unsigned long)(g).offset_high << 32);
   --  arg-macro: function gate_segment ((g).segment
   --    return (g).segment;
  -- Written 2000 by Andi Kleen  
  -- * Segment descriptor structure definitions, usable from both x86_64 and i386
  -- * archs.
  --  

  -- * FIXME: Accessing the desc_struct through its fields is more elegant,
  -- * and should be the one valid thing to do. However, a lot of open code
  -- * still touches the a and b accessors, and doing this allow us to do it
  -- * incrementally. We keep the signature as a struct, rather than an union,
  -- * so we can get rid of it transparently in the future -- glommer
  --  

  -- 8 byte segment descriptor  
   type anon_8;
   type anon_9 is record
      a : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:25
      b : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, anon_9);
   type anon_10 is record
      limit0 : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:29
      base0 : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:30
      base1 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:31
      c_type : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:31
      s : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:31
      dpl : Extensions.Unsigned_2;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:31
      p : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:31
      limit : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:32
      avl : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:32
      l : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:32
      d : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:32
      g : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:32
      base2 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, anon_10);
   type anon_8 (discr : unsigned := 0) is record
      case discr is
            parent : aliased anon_9;
            field_2 : aliased anon_10;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_8);
   pragma Unchecked_Union (anon_8);
   type desc_struct is record
      parent : aliased anon_8;
   end record;
   pragma Convention (C_Pass_By_Copy, desc_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:22

  -- 16byte gate  
   type gate_struct64 is record
      offset_low : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:52
      segment : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:53
      ist : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:54
      zero0 : Extensions.Unsigned_5;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:54
      c_type : Extensions.Unsigned_5;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:54
      dpl : Extensions.Unsigned_2;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:54
      p : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:54
      offset_middle : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:55
      offset_high : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:56
      zero1 : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:57
   end record;
   pragma Convention (C_Pass_By_Copy, gate_struct64);
   pragma Pack (gate_struct64);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:51

  -- !system  
  -- LDT or TSS descriptor in the GDT. 16 bytes.  
   type ldttss_desc64 is record
      limit0 : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:72
      base0 : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:73
      base1 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:74
      c_type : Extensions.Unsigned_5;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:74
      dpl : Extensions.Unsigned_2;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:74
      p : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:74
      limit1 : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:75
      zero0 : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:75
      g : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:75
      base2 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:75
      base3 : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:76
      zero1 : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:77
   end record;
   pragma Convention (C_Pass_By_Copy, ldttss_desc64);
   pragma Pack (ldttss_desc64);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:71

   subtype gate_desc is gate_struct64;

   subtype ldt_desc is ldttss_desc64;

   subtype tss_desc is ldttss_desc64;

   type desc_ptr is record
      size : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:95
      address : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:96
   end record;
   pragma Convention (C_Pass_By_Copy, desc_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/desc_defs.h:94

end asm_desc_defs_h;

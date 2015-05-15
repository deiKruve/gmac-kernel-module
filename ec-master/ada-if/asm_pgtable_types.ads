pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_pgtable_64_types;
--limited with linux_mm_types_h;
--limited with linux_fs_h;
--limited with linux_seq_file_h;
with System;
with Linux_Types;
--with asm_generic_int_ll64_h;

package asm_pgtable_types is

   type pgprot is record
      pgprot : aliased asm_pgtable_64_types.pgprotval_t;
   end record;
   pragma Convention (C_Pass_By_Copy, pgprot);

   subtype pgprot_t is pgprot;

end asm_pgtable_types;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_pgtable_64_types is

   subtype pgprotval_t is unsigned_long;

end asm_pgtable_64_types;

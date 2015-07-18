pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
-- with x86_64_linux_gnu_bits_types_h;

package sys_types is
   
   subtype uu_mode_t is unsigned; -- in x86_64_linux_gnu_bits_types_h
   subtype mode_t is uu_mode_t; 
   
end Sys_Types;


pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package asm_generic_bitops_le_h is

   --  unsupported macro: BITOP_LE_SWIZZLE 0
   function find_next_zero_bit_le
     (addr : System.Address;
      size : unsigned_long;
      offset : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/le.h:11
   pragma Import (CPP, find_next_zero_bit_le, "_ZL21find_next_zero_bit_lePKvmm");

   function find_next_bit_le
     (addr : System.Address;
      size : unsigned_long;
      offset : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/le.h:17
   pragma Import (CPP, find_next_bit_le, "_ZL16find_next_bit_lePKvmm");

   function find_first_zero_bit_le (addr : System.Address; size : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/le.h:23
   pragma Import (CPP, find_first_zero_bit_le, "_ZL22find_first_zero_bit_lePKvm");

   function test_bit_le (nr : int; addr : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/le.h:52
   pragma Import (CPP, test_bit_le, "_ZL11test_bit_leiPKv");

   procedure set_bit_le (nr : int; addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/le.h:57
   pragma Import (CPP, set_bit_le, "_ZL10set_bit_leiPv");

   procedure clear_bit_le (nr : int; addr : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/le.h:62
   pragma Import (CPP, clear_bit_le, "_ZL12clear_bit_leiPv");

   --  skipped func __set_bit_le

   --  skipped func __clear_bit_le

   function test_and_set_bit_le (nr : int; addr : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/le.h:77
   pragma Import (CPP, test_and_set_bit_le, "_ZL19test_and_set_bit_leiPv");

   function test_and_clear_bit_le (nr : int; addr : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/le.h:82
   pragma Import (CPP, test_and_clear_bit_le, "_ZL21test_and_clear_bit_leiPv");

   --  skipped func __test_and_set_bit_le

   --  skipped func __test_and_clear_bit_le

end asm_generic_bitops_le_h;

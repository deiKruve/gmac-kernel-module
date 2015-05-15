pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_generic_bitops_find_h is

  --*
  -- * find_next_bit - find the next set bit in a memory region
  -- * @addr: The address to base the search on
  -- * @offset: The bitnumber to start searching at
  -- * @size: The bitmap size in bits
  -- *
  -- * Returns the bit number for the next set bit
  -- * If no bits are set, returns @size.
  --  

   function find_next_bit
     (addr : access unsigned_long;
      size : unsigned_long;
      offset : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/find.h:14
   pragma Import (CPP, find_next_bit, "_Z13find_next_bitPKmmm");

  --*
  -- * find_next_zero_bit - find the next cleared bit in a memory region
  -- * @addr: The address to base the search on
  -- * @offset: The bitnumber to start searching at
  -- * @size: The bitmap size in bits
  -- *
  -- * Returns the bit number of the next zero bit
  -- * If no bits are zero, returns @size.
  --  

   function find_next_zero_bit
     (addr : access unsigned_long;
      size : unsigned_long;
      offset : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/find.h:28
   pragma Import (CPP, find_next_zero_bit, "_Z18find_next_zero_bitPKmmm");

  --*
  -- * find_first_bit - find the first set bit in a memory region
  -- * @addr: The address to start the search at
  -- * @size: The maximum number of bits to search
  -- *
  -- * Returns the bit number of the first set bit.
  -- * If no bits are set, returns @size.
  --  

   function find_first_bit (addr : access unsigned_long; size : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/find.h:42
   pragma Import (CPP, find_first_bit, "_Z14find_first_bitPKmm");

  --*
  -- * find_first_zero_bit - find the first cleared bit in a memory region
  -- * @addr: The address to start the search at
  -- * @size: The maximum number of bits to search
  -- *
  -- * Returns the bit number of the first cleared bit.
  -- * If no bits are zero, returns @size.
  --  

   function find_first_zero_bit (addr : access unsigned_long; size : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/bitops/find.h:53
   pragma Import (CPP, find_first_zero_bit, "_Z19find_first_zero_bitPKmm");

end asm_generic_bitops_find_h;

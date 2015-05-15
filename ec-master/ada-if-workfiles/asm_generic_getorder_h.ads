pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_generic_getorder_h is

   --  arg-macro: function get_order ( __builtin_constant_p(n) ? ( ((n) = 0UL) ? BITS_PER_LONG - PAGE_SHIFT : (((n) < (1UL << PAGE_SHIFT)) ? 0 : ilog2((n) - 1) - PAGE_SHIFT + 1) ) : __get_order(n) 
   --    return  __builtin_constant_p(n) ? ( ((n) = 0UL) ? BITS_PER_LONG - PAGE_SHIFT : (((n) < (1UL << PAGE_SHIFT)) ? 0 : ilog2((n) - 1) - PAGE_SHIFT + 1) ) : __get_order(n) ;
  -- * Runtime evaluation of get_order()
  --  

   --  skipped func __get_order

  --*
  -- * get_order - Determine the allocation order of a memory size
  -- * @size: The size for which to get the order
  -- *
  -- * Determine the allocation order of a particular sized block of memory.  This
  -- * is on a logarithmic scale, where:
  -- *
  -- *	0 -> 2^0 * PAGE_SIZE and below
  -- *	1 -> 2^1 * PAGE_SIZE to 2^0 * PAGE_SIZE + 1
  -- *	2 -> 2^2 * PAGE_SIZE to 2^1 * PAGE_SIZE + 1
  -- *	3 -> 2^3 * PAGE_SIZE to 2^2 * PAGE_SIZE + 1
  -- *	4 -> 2^4 * PAGE_SIZE to 2^3 * PAGE_SIZE + 1
  -- *	...
  -- *
  -- * The order returned is used to find the smallest allocation granule required
  -- * to hold an object of the specified size.
  -- *
  -- * The result is undefined if the size is 0.
  -- *
  -- * This function may be used to initialise variables with compile time
  -- * evaluations of constants.
  --  

end asm_generic_getorder_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package asm_bitops_h is

   --  arg-macro: function BIT_64 (U64_C(1) << (n)
   --    return U64_C(1) << (n);
   --  arg-macro: procedure BITOP_ADDR "+m" (*(volatile long *) (x))
   --    "+m" (*(volatile long *) (x))
   --  arg-macro: function IS_IMMEDIATE (__builtin_constant_p(nr)
   --    return __builtin_constant_p(nr);
   --  arg-macro: procedure CONST_MASK_ADDR BITOP_ADDR((void *)(addr) + ((nr)>>3))
   --    BITOP_ADDR((void *)(addr) + ((nr)>>3))
   --  arg-macro: function CONST_MASK (1 << ((nr) and 7)
   --    return 1 << ((nr) and 7);
   --  arg-macro: function test_bit (__builtin_constant_p((nr)) ? constant_test_bit((nr), (addr)) : variable_test_bit((nr), (addr))
   --    return __builtin_constant_p((nr)) ? constant_test_bit((nr), (addr)) : variable_test_bit((nr), (addr));
   --  unsupported macro: ARCH_HAS_FAST_MULTIPLIER 1
  -- * Copyright 1992, Linus Torvalds.
  -- *
  -- * Note: inlines with more than a single statement should be marked
  -- * __always_inline to avoid problems with older gcc's inlining heuristics.
  --  

  -- * These have to be done with inline assembly: that way the bit-setting
  -- * is guaranteed to be atomic. All bit operations return 0 if the bit
  -- * was cleared before the operation and != 0 if it was not.
  -- *
  -- * bit 0 is the LSB of addr; bit 32 is the LSB of (addr+1).
  --  

  -- Technically wrong, but this avoids compilation errors on some gcc
  --   versions.  

  -- * We do the locked ops that don't return the old value as
  -- * a mask operation on a byte.
  --  

  --*
  -- * set_bit - Atomically set a bit in memory
  -- * @nr: the bit to set
  -- * @addr: the address to start counting from
  -- *
  -- * This function is atomic and may not be reordered.  See __set_bit()
  -- * if you do not require the atomic guarantees.
  -- *
  -- * Note: there are no guarantees that this function will not be reordered
  -- * on non x86 architectures, so if you are writing portable code,
  -- * make sure not to rely on its reordering guarantees.
  -- *
  -- * Note that @nr may be almost arbitrarily large; this function is not
  -- * restricted to acting on a single-word quantity.
  --  

   procedure set_bit (nr : long; addr : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:72
   pragma Import (CPP, set_bit, "_ZL7set_bitlPVm");

  --*
  -- * __set_bit - Set a bit in memory
  -- * @nr: the bit to set
  -- * @addr: the address to start counting from
  -- *
  -- * Unlike set_bit(), this function is non-atomic and may be reordered.
  -- * If it's called on the same region of memory simultaneously, the effect
  -- * may be that only one operation succeeds.
  --  

   --  skipped func __set_bit

  --*
  -- * clear_bit - Clears a bit in memory
  -- * @nr: Bit to clear
  -- * @addr: Address to start counting from
  -- *
  -- * clear_bit() is atomic and may not be reordered.  However, it does
  -- * not contain a memory barrier, so if it is used for locking purposes,
  -- * you should call smp_mb__before_atomic() and/or smp_mb__after_atomic()
  -- * in order to ensure changes are visible on other processors.
  --  

   procedure clear_bit (nr : long; addr : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:110
   pragma Import (CPP, clear_bit, "_ZL9clear_bitlPVm");

  -- * clear_bit_unlock - Clears a bit in memory
  -- * @nr: Bit to clear
  -- * @addr: Address to start counting from
  -- *
  -- * clear_bit() is atomic and implies release semantics before the memory
  -- * operation. It can be used for an unlock.
  --  

   procedure clear_bit_unlock (nr : long; addr : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:131
   pragma Import (CPP, clear_bit_unlock, "_ZL16clear_bit_unlocklPVm");

   --  skipped func __clear_bit

  -- * __clear_bit_unlock - Clears a bit in memory
  -- * @nr: Bit to clear
  -- * @addr: Address to start counting from
  -- *
  -- * __clear_bit() is non-atomic and implies release semantics before the memory
  -- * operation. It can be used for an unlock if no other CPUs can concurrently
  -- * modify other bits in the word.
  -- *
  -- * No memory barrier is required here, because x86 cannot reorder stores past
  -- * older loads. Same principle as spin_unlock.
  --  

   --  skipped func __clear_bit_unlock

  --*
  -- * __change_bit - Toggle a bit in memory
  -- * @nr: the bit to change
  -- * @addr: the address to start counting from
  -- *
  -- * Unlike change_bit(), this function is non-atomic and may be reordered.
  -- * If it's called on the same region of memory simultaneously, the effect
  -- * may be that only one operation succeeds.
  --  

   --  skipped func __change_bit

  --*
  -- * change_bit - Toggle a bit in memory
  -- * @nr: Bit to change
  -- * @addr: Address to start counting from
  -- *
  -- * change_bit() is atomic and may not be reordered.
  -- * Note that @nr may be almost arbitrarily large; this function is not
  -- * restricted to acting on a single-word quantity.
  --  

   procedure change_bit (nr : long; addr : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:183
   pragma Import (CPP, change_bit, "_ZL10change_bitlPVm");

  --*
  -- * test_and_set_bit - Set a bit and return its old value
  -- * @nr: Bit to set
  -- * @addr: Address to count from
  -- *
  -- * This operation is atomic and cannot be reordered.
  -- * It also implies a memory barrier.
  --  

   function test_and_set_bit (nr : long; addr : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:204
   pragma Import (CPP, test_and_set_bit, "_ZL16test_and_set_bitlPVm");

  --*
  -- * test_and_set_bit_lock - Set a bit and return its old value for lock
  -- * @nr: Bit to set
  -- * @addr: Address to count from
  -- *
  -- * This is the same as test_and_set_bit on x86.
  --  

   function test_and_set_bit_lock (nr : long; addr : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:217
   pragma Import (CPP, test_and_set_bit_lock, "_ZL21test_and_set_bit_locklPVm");

  --*
  -- * __test_and_set_bit - Set a bit and return its old value
  -- * @nr: Bit to set
  -- * @addr: Address to count from
  -- *
  -- * This operation is non-atomic and can be reordered.
  -- * If two examples of this operation race, one can appear to succeed
  -- * but actually fail.  You must protect multiple accesses with a lock.
  --  

   --  skipped func __test_and_set_bit

  --*
  -- * test_and_clear_bit - Clear a bit and return its old value
  -- * @nr: Bit to clear
  -- * @addr: Address to count from
  -- *
  -- * This operation is atomic and cannot be reordered.
  -- * It also implies a memory barrier.
  --  

   function test_and_clear_bit (nr : long; addr : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:250
   pragma Import (CPP, test_and_clear_bit, "_ZL18test_and_clear_bitlPVm");

  --*
  -- * __test_and_clear_bit - Clear a bit and return its old value
  -- * @nr: Bit to clear
  -- * @addr: Address to count from
  -- *
  -- * This operation is non-atomic and can be reordered.
  -- * If two examples of this operation race, one can appear to succeed
  -- * but actually fail.  You must protect multiple accesses with a lock.
  -- *
  -- * Note: the operation is performed atomically with respect to
  -- * the local CPU, but not other CPUs. Portable code should not
  -- * rely on this behaviour.
  -- * KVM relies on this behaviour on x86 for modifying memory that is also
  -- * accessed from a hypervisor on the same CPU if running in a VM: don't change
  -- * this without also updating arch/x86/kernel/kvm.c
  --  

   --  skipped func __test_and_clear_bit

  -- WARNING: non atomic and it can be reordered!  
   --  skipped func __test_and_change_bit

  --*
  -- * test_and_change_bit - Change a bit and return its old value
  -- * @nr: Bit to change
  -- * @addr: Address to count from
  -- *
  -- * This operation is atomic and cannot be reordered.
  -- * It also implies a memory barrier.
  --  

   function test_and_change_bit (nr : long; addr : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:303
   pragma Import (CPP, test_and_change_bit, "_ZL19test_and_change_bitlPVm");

   function constant_test_bit (nr : long; addr : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:308
   pragma Import (CPP, constant_test_bit, "_ZL17constant_test_bitlPVKm");

   function variable_test_bit (nr : long; addr : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:314
   pragma Import (CPP, variable_test_bit, "_ZL17variable_test_bitlPVKm");

  --*
  -- * test_bit - Determine whether a bit is set
  -- * @nr: bit number to test
  -- * @addr: Address to start counting from
  --  

  --*
  -- * __ffs - find first set bit in word
  -- * @word: The word to search
  -- *
  -- * Undefined if no bit exists, so code should check against 0 first.
  --  

   --  skipped func __ffs

  --*
  -- * ffz - find first zero bit in word
  -- * @word: The word to search
  -- *
  -- * Undefined if no zero exists, so code should check against ~0UL first.
  --  

   function ffz (word : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:360
   pragma Import (CPP, ffz, "_ZL3ffzm");

  -- * __fls: find last set bit in word
  -- * @word: The word to search
  -- *
  -- * Undefined if no set bit exists, so code should check against 0 first.
  --  

   --  skipped func __fls

  --*
  -- * ffs - find first set bit in word
  -- * @x: the word to search
  -- *
  -- * This is defined the same way as the libc and compiler builtin ffs
  -- * routines, therefore differs in spirit from the other bitops.
  -- *
  -- * ffs(value) returns 0 if value is 0 or the position of the first
  -- * set bit if value is nonzero. The first (least significant) bit
  -- * is at position 1.
  --  

   function ffs (x : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:396
   pragma Import (CPP, ffs, "_ZL3ffsi");

  --	 * AMD64 says BSFL won't clobber the dest reg if x==0; Intel64 says the
  --	 * dest reg is undefined if x==0, but their CPU architect says its
  --	 * value is written to set it to the same as before, except that the
  --	 * top 32 bits will be cleared.
  --	 *
  --	 * We cannot do this on 32 bits because at the very least some
  --	 * 486 CPUs did not behave this way.
  --	  

  --*
  -- * fls - find last set bit in word
  -- * @x: the word to search
  -- *
  -- * This is defined in a similar way as the libc and compiler builtin
  -- * ffs, but returns the position of the most significant set bit.
  -- *
  -- * fls(value) returns 0 if value is 0 or the position of the last
  -- * set bit if value is nonzero. The last (most significant) bit is
  -- * at position 32.
  --  

   function fls (x : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:437
   pragma Import (CPP, fls, "_ZL3flsi");

  --	 * AMD64 says BSRL won't clobber the dest reg if x==0; Intel64 says the
  --	 * dest reg is undefined if x==0, but their CPU architect says its
  --	 * value is written to set it to the same as before, except that the
  --	 * top 32 bits will be cleared.
  --	 *
  --	 * We cannot do this on 32 bits because at the very least some
  --	 * 486 CPUs did not behave this way.
  --	  

  --*
  -- * fls64 - find last set bit in a 64-bit word
  -- * @x: the word to search
  -- *
  -- * This is defined in a similar way as the libc and compiler builtin
  -- * ffsll, but returns the position of the most significant set bit.
  -- *
  -- * fls64(value) returns 0 if value is 0 or the position of the last
  -- * set bit if value is nonzero. The last (most significant) bit is
  -- * at position 64.
  --  

   function fls64 (x : uapi_asm_generic_int_ll64_h.uu_u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/bitops.h:479
   pragma Import (CPP, fls64, "_ZL5fls64y");

  --	 * AMD64 says BSRQ won't clobber the dest reg if x==0; Intel64 says the
  --	 * dest reg is undefined if x==0, but their CPU architect says its
  --	 * value is written to set it to the same as before.
  --	  

end asm_bitops_h;

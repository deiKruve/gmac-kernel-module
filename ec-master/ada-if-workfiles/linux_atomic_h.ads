pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_types_h;

package linux_atomic_h is

   --  arg-macro: procedure atomic_inc_not_zero atomic_add_unless((v), 1, 0)
   --    atomic_add_unless((v), 1, 0)
  -- Atomic operations usable in machine independent code  
  -- * Provide __deprecated wrappers for the new interface, avoid flag day changes.
  -- * We need the ugly external functions to break header recursion hell.
  --  

   procedure smp_mb_u_before_atomic_inc;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/atomic.h:11
   pragma Import (CPP, smp_mb_u_before_atomic_inc, "_ZL25smp_mb__before_atomic_incv");

   procedure smp_mb_u_after_atomic_inc;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/atomic.h:19
   pragma Import (CPP, smp_mb_u_after_atomic_inc, "_ZL24smp_mb__after_atomic_incv");

   procedure smp_mb_u_before_atomic_dec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/atomic.h:27
   pragma Import (CPP, smp_mb_u_before_atomic_dec, "_ZL25smp_mb__before_atomic_decv");

   procedure smp_mb_u_after_atomic_dec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/atomic.h:35
   pragma Import (CPP, smp_mb_u_after_atomic_dec, "_ZL24smp_mb__after_atomic_decv");

  --*
  -- * atomic_add_unless - add unless the number is already a given value
  -- * @v: pointer of type atomic_t
  -- * @a: the amount to add to v...
  -- * @u: ...unless v is equal to u.
  -- *
  -- * Atomically adds @a to @v, so long as @v was not already @u.
  -- * Returns non-zero if @v was not @u, and zero otherwise.
  --  

   function atomic_add_unless
     (v : access linux_types_h.atomic_t;
      a : int;
      u : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/atomic.h:51
   pragma Import (CPP, atomic_add_unless, "_ZL17atomic_add_unlessP8atomic_tii");

  --*
  -- * atomic_inc_not_zero - increment unless the number is zero
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically increments @v by 1, so long as @v is non-zero.
  -- * Returns non-zero if @v was non-zero, and zero otherwise.
  --  

  --*
  -- * atomic_inc_not_zero_hint - increment if not null
  -- * @v: pointer of type atomic_t
  -- * @hint: probable value of the atomic before the increment
  -- *
  -- * This version of atomic_inc_not_zero() gives a hint of probable
  -- * value of the atomic. This helps processor to not read the memory
  -- * before doing the atomic read/modify/write cycle, lowering
  -- * number of bus transactions on some arches.
  -- *
  -- * Returns: 0 if increment was not done, 1 otherwise.
  --  

   function atomic_inc_not_zero_hint (v : access linux_types_h.atomic_t; hint : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/atomic.h:80
   pragma Import (CPP, atomic_inc_not_zero_hint, "_ZL24atomic_inc_not_zero_hintP8atomic_ti");

  -- sanity test, should be removed by compiler if hint is a constant  
   function atomic_inc_unless_negative (p : access linux_types_h.atomic_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/atomic.h:100
   pragma Import (CPP, atomic_inc_unless_negative, "_ZL26atomic_inc_unless_negativeP8atomic_t");

   function atomic_dec_unless_positive (p : access linux_types_h.atomic_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/atomic.h:113
   pragma Import (CPP, atomic_dec_unless_positive, "_ZL26atomic_dec_unless_positiveP8atomic_t");

  -- * atomic_dec_if_positive - decrement by 1 if old value positive
  -- * @v: pointer of type atomic_t
  -- *
  -- * The function returns the old value of *v minus 1, even if
  -- * the atomic variable, v, was not decremented.
  --  

   function atomic_dec_if_positive (v : access linux_types_h.atomic_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/atomic.h:133
   pragma Import (CPP, atomic_dec_if_positive, "_ZL22atomic_dec_if_positiveP8atomic_t");

   procedure atomic_or (i : int; v : access linux_types_h.atomic_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/atomic.h:151
   pragma Import (CPP, atomic_or, "_ZL9atomic_oriP8atomic_t");

end linux_atomic_h;

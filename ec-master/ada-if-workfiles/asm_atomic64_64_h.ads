pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_types_h;

package asm_atomic64_64_h is

   --  arg-macro: procedure ATOMIC64_INIT { (i) }
   --    { (i) }
   --  arg-macro: function atomic64_inc_return (atomic64_add_return(1, (v))
   --    return atomic64_add_return(1, (v));
   --  arg-macro: function atomic64_dec_return (atomic64_sub_return(1, (v))
   --    return atomic64_sub_return(1, (v));
   --  arg-macro: procedure atomic64_inc_not_zero atomic64_add_unless((v), 1, 0)
   --    atomic64_add_unless((v), 1, 0)
  -- The 64-bit atomic type  
  --*
  -- * atomic64_read - read atomic64 variable
  -- * @v: pointer of type atomic64_t
  -- *
  -- * Atomically reads the value of @v.
  -- * Doesn't imply a read memory barrier.
  --  

   function atomic64_read (v : access constant linux_types_h.atomic64_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:19
   pragma Import (CPP, atomic64_read, "_ZL13atomic64_readPK10atomic64_t");

  --*
  -- * atomic64_set - set atomic64 variable
  -- * @v: pointer to type atomic64_t
  -- * @i: required value
  -- *
  -- * Atomically sets the value of @v to @i.
  --  

   procedure atomic64_set (v : access linux_types_h.atomic64_t; i : long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:31
   pragma Import (CPP, atomic64_set, "_ZL12atomic64_setP10atomic64_tl");

  --*
  -- * atomic64_add - add integer to atomic64 variable
  -- * @i: integer value to add
  -- * @v: pointer to type atomic64_t
  -- *
  -- * Atomically adds @i to @v.
  --  

   procedure atomic64_add (i : long; v : access linux_types_h.atomic64_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:43
   pragma Import (CPP, atomic64_add, "_ZL12atomic64_addlP10atomic64_t");

  --*
  -- * atomic64_sub - subtract the atomic64 variable
  -- * @i: integer value to subtract
  -- * @v: pointer to type atomic64_t
  -- *
  -- * Atomically subtracts @i from @v.
  --  

   procedure atomic64_sub (i : long; v : access linux_types_h.atomic64_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:57
   pragma Import (CPP, atomic64_sub, "_ZL12atomic64_sublP10atomic64_t");

  --*
  -- * atomic64_sub_and_test - subtract value from variable and test result
  -- * @i: integer value to subtract
  -- * @v: pointer to type atomic64_t
  -- *
  -- * Atomically subtracts @i from @v and returns
  -- * true if the result is zero, or false for all
  -- * other cases.
  --  

   function atomic64_sub_and_test (i : long; v : access linux_types_h.atomic64_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:73
   pragma Import (CPP, atomic64_sub_and_test, "_ZL21atomic64_sub_and_testlP10atomic64_t");

  --*
  -- * atomic64_inc - increment atomic64 variable
  -- * @v: pointer to type atomic64_t
  -- *
  -- * Atomically increments @v by 1.
  --  

   procedure atomic64_inc (v : access linux_types_h.atomic64_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:84
   pragma Import (CPP, atomic64_inc, "_ZL12atomic64_incP10atomic64_t");

  --*
  -- * atomic64_dec - decrement atomic64 variable
  -- * @v: pointer to type atomic64_t
  -- *
  -- * Atomically decrements @v by 1.
  --  

   procedure atomic64_dec (v : access linux_types_h.atomic64_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:97
   pragma Import (CPP, atomic64_dec, "_ZL12atomic64_decP10atomic64_t");

  --*
  -- * atomic64_dec_and_test - decrement and test
  -- * @v: pointer to type atomic64_t
  -- *
  -- * Atomically decrements @v by 1 and
  -- * returns true if the result is 0, or false for all other
  -- * cases.
  --  

   function atomic64_dec_and_test (v : access linux_types_h.atomic64_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:112
   pragma Import (CPP, atomic64_dec_and_test, "_ZL21atomic64_dec_and_testP10atomic64_t");

  --*
  -- * atomic64_inc_and_test - increment and test
  -- * @v: pointer to type atomic64_t
  -- *
  -- * Atomically increments @v by 1
  -- * and returns true if the result is zero, or false for all
  -- * other cases.
  --  

   function atomic64_inc_and_test (v : access linux_types_h.atomic64_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:125
   pragma Import (CPP, atomic64_inc_and_test, "_ZL21atomic64_inc_and_testP10atomic64_t");

  --*
  -- * atomic64_add_negative - add and test if negative
  -- * @i: integer value to add
  -- * @v: pointer to type atomic64_t
  -- *
  -- * Atomically adds @i to @v and returns true
  -- * if the result is negative, or false when
  -- * result is greater than or equal to zero.
  --  

   function atomic64_add_negative (i : long; v : access linux_types_h.atomic64_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:139
   pragma Import (CPP, atomic64_add_negative, "_ZL21atomic64_add_negativelP10atomic64_t");

  --*
  -- * atomic64_add_return - add and return
  -- * @i: integer value to add
  -- * @v: pointer to type atomic64_t
  -- *
  -- * Atomically adds @i to @v and returns @i + @v
  --  

   function atomic64_add_return (i : long; v : access linux_types_h.atomic64_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:151
   pragma Import (CPP, atomic64_add_return, "_ZL19atomic64_add_returnlP10atomic64_t");

   function atomic64_sub_return (i : long; v : access linux_types_h.atomic64_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:156
   pragma Import (CPP, atomic64_sub_return, "_ZL19atomic64_sub_returnlP10atomic64_t");

   function atomic64_cmpxchg
     (v : access linux_types_h.atomic64_t;
      old : long;
      arg3 : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:164
   pragma Import (CPP, atomic64_cmpxchg, "_ZL16atomic64_cmpxchgP10atomic64_tll");

   function atomic64_xchg (v : access linux_types_h.atomic64_t; arg2 : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:169
   pragma Import (CPP, atomic64_xchg, "_ZL13atomic64_xchgP10atomic64_tl");

  --*
  -- * atomic64_add_unless - add unless the number is a given value
  -- * @v: pointer of type atomic64_t
  -- * @a: the amount to add to v...
  -- * @u: ...unless v is equal to u.
  -- *
  -- * Atomically adds @a to @v, so long as it was not @u.
  -- * Returns the old value of @v.
  --  

   function atomic64_add_unless
     (v : access linux_types_h.atomic64_t;
      a : long;
      u : long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:183
   pragma Import (CPP, atomic64_add_unless, "_ZL19atomic64_add_unlessP10atomic64_tll");

  -- * atomic64_dec_if_positive - decrement by 1 if old value positive
  -- * @v: pointer of type atomic_t
  -- *
  -- * The function returns the old value of *v minus 1, even if
  -- * the atomic variable, v, was not decremented.
  --  

   function atomic64_dec_if_positive (v : access linux_types_h.atomic64_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic64_64.h:207
   pragma Import (CPP, atomic64_dec_if_positive, "_ZL24atomic64_dec_if_positiveP10atomic64_t");

end asm_atomic64_64_h;

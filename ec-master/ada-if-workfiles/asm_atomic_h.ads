pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_types_h;

package asm_atomic_h is

   --  arg-macro: procedure ATOMIC_INIT { (i) }
   --    { (i) }
   --  arg-macro: function atomic_inc_return (atomic_add_return(1, v)
   --    return atomic_add_return(1, v);
   --  arg-macro: function atomic_dec_return (atomic_sub_return(1, v)
   --    return atomic_sub_return(1, v);
   --  arg-macro: procedure atomic_clear_mask asm volatile(LOCK_PREFIX "andl %0,%1" : : "r" (~(mask)), "m" (*(addr)) : "memory")
   --    asm volatile(LOCK_PREFIX "andl %0,%1" : : "r" (~(mask)), "m" (*(addr)) : "memory")
   --  arg-macro: procedure atomic_set_mask asm volatile(LOCK_PREFIX "orl %0,%1" : : "r" ((unsigned)(mask)), "m" (*(addr)) : "memory")
   --    asm volatile(LOCK_PREFIX "orl %0,%1" : : "r" ((unsigned)(mask)), "m" (*(addr)) : "memory")
  -- * Atomic operations that C can't guarantee us.  Useful for
  -- * resource counting etc..
  --  

  --*
  -- * atomic_read - read atomic variable
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically reads the value of @v.
  --  

   function atomic_read (v : access constant linux_types_h.atomic_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:25
   pragma Import (CPP, atomic_read, "_ZL11atomic_readPK8atomic_t");

  --*
  -- * atomic_set - set atomic variable
  -- * @v: pointer of type atomic_t
  -- * @i: required value
  -- *
  -- * Atomically sets the value of @v to @i.
  --  

   procedure atomic_set (v : access linux_types_h.atomic_t; i : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:37
   pragma Import (CPP, atomic_set, "_ZL10atomic_setP8atomic_ti");

  --*
  -- * atomic_add - add integer to atomic variable
  -- * @i: integer value to add
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically adds @i to @v.
  --  

   procedure atomic_add (i : int; v : access linux_types_h.atomic_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:49
   pragma Import (CPP, atomic_add, "_ZL10atomic_addiP8atomic_t");

  --*
  -- * atomic_sub - subtract integer from atomic variable
  -- * @i: integer value to subtract
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically subtracts @i from @v.
  --  

   procedure atomic_sub (i : int; v : access linux_types_h.atomic_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:63
   pragma Import (CPP, atomic_sub, "_ZL10atomic_subiP8atomic_t");

  --*
  -- * atomic_sub_and_test - subtract value from variable and test result
  -- * @i: integer value to subtract
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically subtracts @i from @v and returns
  -- * true if the result is zero, or false for all
  -- * other cases.
  --  

   function atomic_sub_and_test (i : int; v : access linux_types_h.atomic_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:79
   pragma Import (CPP, atomic_sub_and_test, "_ZL19atomic_sub_and_testiP8atomic_t");

  --*
  -- * atomic_inc - increment atomic variable
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically increments @v by 1.
  --  

   procedure atomic_inc (v : access linux_types_h.atomic_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:90
   pragma Import (CPP, atomic_inc, "_ZL10atomic_incP8atomic_t");

  --*
  -- * atomic_dec - decrement atomic variable
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically decrements @v by 1.
  --  

   procedure atomic_dec (v : access linux_types_h.atomic_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:102
   pragma Import (CPP, atomic_dec, "_ZL10atomic_decP8atomic_t");

  --*
  -- * atomic_dec_and_test - decrement and test
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically decrements @v by 1 and
  -- * returns true if the result is 0, or false for all other
  -- * cases.
  --  

   function atomic_dec_and_test (v : access linux_types_h.atomic_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:116
   pragma Import (CPP, atomic_dec_and_test, "_ZL19atomic_dec_and_testP8atomic_t");

  --*
  -- * atomic_inc_and_test - increment and test
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically increments @v by 1
  -- * and returns true if the result is zero, or false for all
  -- * other cases.
  --  

   function atomic_inc_and_test (v : access linux_types_h.atomic_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:129
   pragma Import (CPP, atomic_inc_and_test, "_ZL19atomic_inc_and_testP8atomic_t");

  --*
  -- * atomic_add_negative - add and test if negative
  -- * @i: integer value to add
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically adds @i to @v and returns true
  -- * if the result is negative, or false when
  -- * result is greater than or equal to zero.
  --  

   function atomic_add_negative (i : int; v : access linux_types_h.atomic_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:143
   pragma Import (CPP, atomic_add_negative, "_ZL19atomic_add_negativeiP8atomic_t");

  --*
  -- * atomic_add_return - add integer and return
  -- * @i: integer value to add
  -- * @v: pointer of type atomic_t
  -- *
  -- * Atomically adds @i to @v and returns @i + @v
  --  

   function atomic_add_return (i : int; v : access linux_types_h.atomic_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:155
   pragma Import (CPP, atomic_add_return, "_ZL17atomic_add_returniP8atomic_t");

  --*
  -- * atomic_sub_return - subtract integer and return
  -- * @v: pointer of type atomic_t
  -- * @i: integer value to subtract
  -- *
  -- * Atomically subtracts @i from @v and returns @v - @i
  --  

   function atomic_sub_return (i : int; v : access linux_types_h.atomic_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:167
   pragma Import (CPP, atomic_sub_return, "_ZL17atomic_sub_returniP8atomic_t");

   function atomic_cmpxchg
     (v : access linux_types_h.atomic_t;
      old : int;
      arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:175
   pragma Import (CPP, atomic_cmpxchg, "_ZL14atomic_cmpxchgP8atomic_tii");

   function atomic_xchg (v : access linux_types_h.atomic_t; arg2 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:180
   pragma Import (CPP, atomic_xchg, "_ZL11atomic_xchgP8atomic_ti");

  --*
  -- * __atomic_add_unless - add unless the number is already a given value
  -- * @v: pointer of type atomic_t
  -- * @a: the amount to add to v...
  -- * @u: ...unless v is equal to u.
  -- *
  -- * Atomically adds @a to @v, so long as @v was not already @u.
  -- * Returns the old value of @v.
  --  

   --  skipped func __atomic_add_unless

  --*
  -- * atomic_inc_short - increment of a short integer
  -- * @v: pointer to type int
  -- *
  -- * Atomically adds 1 to @v
  -- * Returns the new value of @u
  --  

   function atomic_inc_short (v : access short) return short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:216
   pragma Import (CPP, atomic_inc_short, "_ZL16atomic_inc_shortPs");

  --*
  -- * atomic_or_long - OR of two long integers
  -- * @v1: pointer to type unsigned long
  -- * @v2: pointer to type unsigned long
  -- *
  -- * Atomically ORs @v1 and @v2
  -- * Returns the result of the OR
  --  

   procedure atomic_or_long (v1 : access unsigned_long; v2 : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/atomic.h:231
   pragma Import (CPP, atomic_or_long, "_ZL14atomic_or_longPmm");

  -- These are x86-specific, used by some header files  
end asm_atomic_h;

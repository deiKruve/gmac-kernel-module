pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;

package asm_generic_atomic_long_h is

   --  arg-macro: procedure ATOMIC_LONG_INIT ATOMIC64_INIT(i)
   --    ATOMIC64_INIT(i)
   --  arg-macro: procedure atomic_long_inc_not_zero atomic64_inc_not_zero((atomic64_t *)(l))
   --    atomic64_inc_not_zero((atomic64_t *)(l))
   --  arg-macro: function atomic_long_cmpxchg (atomic64_cmpxchg((atomic64_t *)(l), (old), (new))
   --    return atomic64_cmpxchg((atomic64_t *)(l), (old), (new));
   --  arg-macro: function atomic_long_xchg (atomic64_xchg((atomic64_t *)(v), (new))
   --    return atomic64_xchg((atomic64_t *)(v), (new));
  -- * Copyright (C) 2005 Silicon Graphics, Inc.
  -- *	Christoph Lameter
  -- *
  -- * Allows to provide arch independent atomic definitions without the need to
  -- * edit all arch specific atomic.h files.
  --  

  -- * Suppport for atomic_long_t
  -- *
  -- * Casts for parameters are avoided for existing atomic functions in order to
  -- * avoid issues with cast-as-lval under gcc 4.x and other limitations that the
  -- * macros of a platform may have.
  --  

   subtype atomic_long_t is linux_types_h.atomic64_t;

   function atomic_long_read (l : access atomic_long_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:27
   pragma Import (CPP, atomic_long_read, "_ZL16atomic_long_readP10atomic64_t");

   procedure atomic_long_set (l : access atomic_long_t; i : long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:34
   pragma Import (CPP, atomic_long_set, "_ZL15atomic_long_setP10atomic64_tl");

   procedure atomic_long_inc (l : access atomic_long_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:41
   pragma Import (CPP, atomic_long_inc, "_ZL15atomic_long_incP10atomic64_t");

   procedure atomic_long_dec (l : access atomic_long_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:48
   pragma Import (CPP, atomic_long_dec, "_ZL15atomic_long_decP10atomic64_t");

   procedure atomic_long_add (i : long; l : access atomic_long_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:55
   pragma Import (CPP, atomic_long_add, "_ZL15atomic_long_addlP10atomic64_t");

   procedure atomic_long_sub (i : long; l : access atomic_long_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:62
   pragma Import (CPP, atomic_long_sub, "_ZL15atomic_long_sublP10atomic64_t");

   function atomic_long_sub_and_test (i : long; l : access atomic_long_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:69
   pragma Import (CPP, atomic_long_sub_and_test, "_ZL24atomic_long_sub_and_testlP10atomic64_t");

   function atomic_long_dec_and_test (l : access atomic_long_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:76
   pragma Import (CPP, atomic_long_dec_and_test, "_ZL24atomic_long_dec_and_testP10atomic64_t");

   function atomic_long_inc_and_test (l : access atomic_long_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:83
   pragma Import (CPP, atomic_long_inc_and_test, "_ZL24atomic_long_inc_and_testP10atomic64_t");

   function atomic_long_add_negative (i : long; l : access atomic_long_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:90
   pragma Import (CPP, atomic_long_add_negative, "_ZL24atomic_long_add_negativelP10atomic64_t");

   function atomic_long_add_return (i : long; l : access atomic_long_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:97
   pragma Import (CPP, atomic_long_add_return, "_ZL22atomic_long_add_returnlP10atomic64_t");

   function atomic_long_sub_return (i : long; l : access atomic_long_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:104
   pragma Import (CPP, atomic_long_sub_return, "_ZL22atomic_long_sub_returnlP10atomic64_t");

   function atomic_long_inc_return (l : access atomic_long_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:111
   pragma Import (CPP, atomic_long_inc_return, "_ZL22atomic_long_inc_returnP10atomic64_t");

   function atomic_long_dec_return (l : access atomic_long_t) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:118
   pragma Import (CPP, atomic_long_dec_return, "_ZL22atomic_long_dec_returnP10atomic64_t");

   function atomic_long_add_unless
     (l : access atomic_long_t;
      a : long;
      u : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/atomic-long.h:125
   pragma Import (CPP, atomic_long_add_unless, "_ZL22atomic_long_add_unlessP10atomic64_tll");

end asm_generic_atomic_long_h;

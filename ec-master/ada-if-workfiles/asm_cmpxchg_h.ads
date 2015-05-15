pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_cmpxchg_h is

   --  arg-macro: procedure xchg __xchg_op((ptr), (v), xchg, "")
   --    __xchg_op((ptr), (v), xchg, "")
   --  arg-macro: procedure cmpxchg __cmpxchg(ptr, old, new, sizeof(*(ptr)))
   --    __cmpxchg(ptr, old, new, sizeof(*(ptr)))
   --  arg-macro: procedure sync_cmpxchg __sync_cmpxchg(ptr, old, new, sizeof(*(ptr)))
   --    __sync_cmpxchg(ptr, old, new, sizeof(*(ptr)))
   --  arg-macro: procedure cmpxchg_local __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
   --    __cmpxchg_local(ptr, old, new, sizeof(*(ptr)))
   --  arg-macro: procedure xadd __xadd((ptr), (inc), LOCK_PREFIX)
   --    __xadd((ptr), (inc), LOCK_PREFIX)
   --  arg-macro: procedure xadd_sync __xadd((ptr), (inc), "lock; ")
   --    __xadd((ptr), (inc), "lock; ")
   --  arg-macro: procedure xadd_local __xadd((ptr), (inc), "")
   --    __xadd((ptr), (inc), "")
   --  arg-macro: procedure add_smp __add((ptr), (inc), LOCK_PREFIX)
   --    __add((ptr), (inc), LOCK_PREFIX)
   --  arg-macro: procedure add_sync __add((ptr), (inc), "lock; ")
   --    __add((ptr), (inc), "lock; ")
   --  arg-macro: procedure cmpxchg_double __cmpxchg_double(LOCK_PREFIX, p1, p2, o1, o2, n1, n2)
   --    __cmpxchg_double(LOCK_PREFIX, p1, p2, o1, o2, n1, n2)
   --  arg-macro: procedure cmpxchg_double_local __cmpxchg_double(, p1, p2, o1, o2, n1, n2)
   --    __cmpxchg_double(, p1, p2, o1, o2, n1, n2)
  -- Provides LOCK_PREFIX  
  -- * Non-existant functions to indicate usage errors at link time
  -- * (or compile-time if the compiler implements __compiletime_error().
  --  

   --  skipped func __xchg_wrong_size

   --  skipped func __xadd_wrong_size

   --  skipped func __add_wrong_size

  -- * Constants for operation sizes. On 32-bit, the 64-bit size it set to
  -- * -1 because sizeof will never return -1, thereby making those switch
  -- * case statements guaranteeed dead code which the compiler will
  -- * eliminate, and allowing the "missing symbol in the default case" to
  -- * indicate a usage error.
  --  

  -- 
  -- * An exchange-type operation, which takes a value and a pointer, and
  -- * returns the old value.
  --  

  -- * Note: no "lock" prefix even on SMP: xchg always implies lock anyway.
  -- * Since this is generally used to protect other memory information, we
  -- * use "asm volatile" and "memory" clobbers to prevent gcc from moving
  -- * information around.
  --  

  -- * Atomic compare and exchange.  Compare OLD with MEM, if identical,
  -- * store NEW in MEM.  Return the initial value in MEM.  Success is
  -- * indicated by comparing RETURN with OLD.
  --  

  -- * xadd() adds "inc" to "*ptr" and atomically returns the previous
  -- * value of "*ptr".
  -- *
  -- * xadd() is locked when multiple CPUs are online
  -- * xadd_sync() is always locked
  -- * xadd_local() is never locked
  --  

  -- * add_*() adds "inc" to "*ptr"
  -- *
  -- * __add() takes a lock prefix
  -- * add_smp() is locked when multiple CPUs are online
  -- * add_sync() is always locked
  --  

end asm_cmpxchg_h;

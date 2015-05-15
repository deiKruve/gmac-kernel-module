pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_barrier_h is

   --  arg-macro: procedure mb asm volatile("mfence".:"memory")
   --    asm volatile("mfence".:"memory")
   --  arg-macro: procedure rmb asm volatile("lfence".:"memory")
   --    asm volatile("lfence".:"memory")
   --  arg-macro: procedure wmb asm volatile("sfence" .: "memory")
   --    asm volatile("sfence" .: "memory")
   --  arg-macro: procedure read_barrier_depends do { } while (0)
   --    do { } while (0)
   --  arg-macro: procedure smp_mb mb()
   --    mb()
   --  arg-macro: procedure smp_rmb barrier()
   --    barrier()
   --  arg-macro: procedure smp_wmb barrier()
   --    barrier()
   --  arg-macro: procedure smp_read_barrier_depends read_barrier_depends()
   --    read_barrier_depends()
   --  arg-macro: procedure set_mb do { (void)xchg(andvar, value); } while (0)
   --    do { (void)xchg(andvar, value); } while (0)
   --  arg-macro: procedure smp_store_release do { compiletime_assert_atomic_type(*p); barrier(); ACCESS_ONCE(*p) := (v); } while (0)
   --    do { compiletime_assert_atomic_type(*p); barrier(); ACCESS_ONCE(*p) := (v); } while (0)
   --  arg-macro: function smp_load_acquire ({ typeof(*p) ___p1 := ACCESS_ONCE(*p); compiletime_assert_atomic_type(*p); barrier(); ___p1; }
   --    return { typeof(*p) ___p1 := ACCESS_ONCE(*p); compiletime_assert_atomic_type(*p); barrier(); ___p1; };
   --  arg-macro: procedure smp_mb__before_atomic barrier()
   --    barrier()
   --  arg-macro: procedure smp_mb__after_atomic barrier()
   --    barrier()
  -- * Force strict CPU ordering.
  -- * And yes, this is required on UP too when we're talking
  -- * to devices.
  --  

  -- * Some non-Intel clones support out of order store. wmb() ceases to be a
  -- * nop for these.
  --  

  --*
  -- * read_barrier_depends - Flush all pending reads that subsequents reads
  -- * depend on.
  -- *
  -- * No data-dependent reads from memory-like regions are ever reordered
  -- * over this barrier.  All reads preceding this primitive are guaranteed
  -- * to access memory (but not necessarily other CPUs' caches) before any
  -- * reads following this primitive that depend on the data return by
  -- * any of the preceding reads.  This primitive is much lighter weight than
  -- * rmb() on most CPUs, and is never heavier weight than is
  -- * rmb().
  -- *
  -- * These ordering constraints are respected by both the local CPU
  -- * and the compiler.
  -- *
  -- * Ordering is not guaranteed by anything other than these primitives,
  -- * not even by data dependencies.  See the documentation for
  -- * memory_barrier() for examples and URLs to more information.
  -- *
  -- * For example, the following code would force ordering (the initial
  -- * value of "a" is zero, "b" is one, and "p" is "&a"):
  -- *
  -- * <programlisting>
  -- *	CPU 0				CPU 1
  -- *
  -- *	b = 2;
  -- *	memory_barrier();
  -- *	p = &b;				q = p;
  -- *					read_barrier_depends();
  -- *					d = *q;
  -- * </programlisting>
  -- *
  -- * because the read of "*q" depends on the read of "p" and these
  -- * two reads are separated by a read_barrier_depends().  However,
  -- * the following code, with the same initial values for "a" and "b":
  -- *
  -- * <programlisting>
  -- *	CPU 0				CPU 1
  -- *
  -- *	a = 2;
  -- *	memory_barrier();
  -- *	b = 3;				y = b;
  -- *					read_barrier_depends();
  -- *					x = a;
  -- * </programlisting>
  -- *
  -- * does not enforce ordering, since there is no data dependency between
  -- * the read of "a" and the read of "b".  Therefore, on some CPUs, such
  -- * as Alpha, "y" could be set to 3 and "x" to 0.  Use rmb()
  -- * in cases like this where there are no data dependencies.
  -- * 

  -- * For either of these options x86 doesn't have a strong TSO memory
  -- * model and we should fall back to full barriers.
  --  

  -- Atomic operations are already serializing on x86  
  -- * Stop RDTSC speculation. This is needed when you need to use RDTSC
  -- * (or get_cycles or vread that possibly accesses the TSC) in a defined
  -- * code region.
  -- *
  -- * (Could use an alternative three way for this if there was one.)
  --  

   procedure rdtsc_barrier;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/barrier.h:151
   pragma Import (CPP, rdtsc_barrier, "_ZL13rdtsc_barrierv");

end asm_barrier_h;

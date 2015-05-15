pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with linux_types_h;

package linux_cpumask_h is

   --  arg-macro: function cpumask_bits ((maskp).bits
   --    return (maskp).bits;
   --  unsupported macro: nr_cpumask_bits NR_CPUS
   --  arg-macro: procedure num_online_cpus cpumask_weight(cpu_online_mask)
   --    cpumask_weight(cpu_online_mask)
   --  arg-macro: procedure num_possible_cpus cpumask_weight(cpu_possible_mask)
   --    cpumask_weight(cpu_possible_mask)
   --  arg-macro: procedure num_present_cpus cpumask_weight(cpu_present_mask)
   --    cpumask_weight(cpu_present_mask)
   --  arg-macro: procedure num_active_cpus cpumask_weight(cpu_active_mask)
   --    cpumask_weight(cpu_active_mask)
   --  arg-macro: procedure cpu_online cpumask_test_cpu((cpu), cpu_online_mask)
   --    cpumask_test_cpu((cpu), cpu_online_mask)
   --  arg-macro: procedure cpu_possible cpumask_test_cpu((cpu), cpu_possible_mask)
   --    cpumask_test_cpu((cpu), cpu_possible_mask)
   --  arg-macro: procedure cpu_present cpumask_test_cpu((cpu), cpu_present_mask)
   --    cpumask_test_cpu((cpu), cpu_present_mask)
   --  arg-macro: procedure cpu_active cpumask_test_cpu((cpu), cpu_active_mask)
   --    cpumask_test_cpu((cpu), cpu_active_mask)
   --  arg-macro: procedure for_each_cpu for ((cpu) := -1; (cpu) := cpumask_next((cpu), (mask)), (cpu) < nr_cpu_ids;)
   --    for ((cpu) := -1; (cpu) := cpumask_next((cpu), (mask)), (cpu) < nr_cpu_ids;)
   --  arg-macro: procedure for_each_cpu_not for ((cpu) := -1; (cpu) := cpumask_next_zero((cpu), (mask)), (cpu) < nr_cpu_ids;)
   --    for ((cpu) := -1; (cpu) := cpumask_next_zero((cpu), (mask)), (cpu) < nr_cpu_ids;)
   --  arg-macro: procedure for_each_cpu_and for ((cpu) := -1; (cpu) := cpumask_next_and((cpu), (mask), (ands)), (cpu) < nr_cpu_ids;)
   --    for ((cpu) := -1; (cpu) := cpumask_next_and((cpu), (mask), (ands)), (cpu) < nr_cpu_ids;)
   --  unsupported macro: CPU_BITS_NONE { [0 ... BITS_TO_LONGS(NR_CPUS)-1] = 0UL }
   --  unsupported macro: CPU_BITS_CPU0 { [0] = 1UL }
   --  arg-macro: procedure cpumask_test_cpu test_bit(cpumask_check(cpu), cpumask_bits((cpumask)))
   --    test_bit(cpumask_check(cpu), cpumask_bits((cpumask)))
   --  arg-macro: procedure cpumask_any cpumask_first(srcp)
   --    cpumask_first(srcp)
   --  arg-macro: procedure cpumask_first_and cpumask_next_and(-1, (src1p), (src2p))
   --    cpumask_next_and(-1, (src1p), (src2p))
   --  arg-macro: procedure cpumask_any_and cpumask_first_and((mask1), (mask2))
   --    cpumask_first_and((mask1), (mask2))
   --  arg-macro: function cpumask_of (get_cpu_mask(cpu)
   --    return get_cpu_mask(cpu);
   --  unsupported macro: cpu_all_mask to_cpumask(cpu_all_bits)
   --  unsupported macro: cpu_none_mask to_cpumask(cpu_bit_bitmap[0])
   --  arg-macro: procedure for_each_possible_cpu for_each_cpu((cpu), cpu_possible_mask)
   --    for_each_cpu((cpu), cpu_possible_mask)
   --  arg-macro: procedure for_each_online_cpu for_each_cpu((cpu), cpu_online_mask)
   --    for_each_cpu((cpu), cpu_online_mask)
   --  arg-macro: procedure for_each_present_cpu for_each_cpu((cpu), cpu_present_mask)
   --    for_each_cpu((cpu), cpu_present_mask)
   --  arg-macro: function to_cpumask ((struct cpumask *)(1 ? (bitmap) : (void *)sizeof(__check_is_bitmap(bitmap)))
   --    return (struct cpumask *)(1 ? (bitmap) : (void *)sizeof(__check_is_bitmap(bitmap)));
   --  arg-macro: procedure cpu_is_offline unlikely(notcpu_online(cpu))
   --    unlikely(notcpu_online(cpu))
   --  unsupported macro: CPU_BITS_ALL { [0 ... BITS_TO_LONGS(NR_CPUS)-2] = ~0UL, [BITS_TO_LONGS(NR_CPUS)-1] = CPU_MASK_LAST_WORD }
   --  arg-macro: function cpumask_of_cpu (*get_cpu_mask(cpu)
   --    return *get_cpu_mask(cpu);
   --  unsupported macro: CPU_MASK_LAST_WORD BITMAP_LAST_WORD_MASK(NR_CPUS)
   --  unsupported macro: CPU_MASK_ALL (cpumask_t) { { [0 ... BITS_TO_LONGS(NR_CPUS)-2] = ~0UL, [BITS_TO_LONGS(NR_CPUS)-1] = CPU_MASK_LAST_WORD } }
   --  unsupported macro: CPU_MASK_NONE (cpumask_t) { { [0 ... BITS_TO_LONGS(NR_CPUS)-1] = 0UL } }
   --  unsupported macro: CPU_MASK_CPU0 (cpumask_t) { { [0] = 1UL } }
   --  arg-macro: procedure first_cpu __first_cpu(and(src))
   --    __first_cpu(and(src))
   --  arg-macro: procedure next_cpu __next_cpu((n), and(src))
   --    __next_cpu((n), and(src))
   --  arg-macro: procedure any_online_cpu cpumask_any_and(andmask, cpu_online_mask)
   --    cpumask_any_and(andmask, cpu_online_mask)
   --  arg-macro: procedure for_each_cpu_mask for ((cpu) := -1; (cpu) := next_cpu((cpu), (mask)), (cpu) < NR_CPUS; )
   --    for ((cpu) := -1; (cpu) := next_cpu((cpu), (mask)), (cpu) < NR_CPUS; )
   --  arg-macro: procedure for_each_cpu_mask_nr for ((cpu) := -1; (cpu) := __next_cpu_nr((cpu), and(mask)), (cpu) < nr_cpu_ids; )
   --    for ((cpu) := -1; (cpu) := __next_cpu_nr((cpu), and(mask)), (cpu) < nr_cpu_ids; )
   --  arg-macro: function cpus_addr ((src).bits
   --    return (src).bits;
   --  arg-macro: procedure cpu_set __cpu_set((cpu), and(dst))
   --    __cpu_set((cpu), and(dst))
   --  arg-macro: procedure cpu_clear __cpu_clear((cpu), and(dst))
   --    __cpu_clear((cpu), and(dst))
   --  arg-macro: procedure cpus_setall __cpus_setall(and(dst), NR_CPUS)
   --    __cpus_setall(and(dst), NR_CPUS)
   --  arg-macro: procedure cpus_clear __cpus_clear(and(dst), NR_CPUS)
   --    __cpus_clear(and(dst), NR_CPUS)
   --  arg-macro: procedure cpu_isset test_bit((cpu), (cpumask).bits)
   --    test_bit((cpu), (cpumask).bits)
   --  arg-macro: procedure cpu_test_and_set __cpu_test_and_set((cpu), and(cpumask))
   --    __cpu_test_and_set((cpu), and(cpumask))
   --  arg-macro: procedure cpus_and __cpus_and(and(dst), and(src1), and(src2), NR_CPUS)
   --    __cpus_and(and(dst), and(src1), and(src2), NR_CPUS)
   --  arg-macro: procedure cpus_or __cpus_or(and(dst), and(src1), and(src2), NR_CPUS)
   --    __cpus_or(and(dst), and(src1), and(src2), NR_CPUS)
   --  arg-macro: procedure cpus_xor __cpus_xor(and(dst), and(src1), and(src2), NR_CPUS)
   --    __cpus_xor(and(dst), and(src1), and(src2), NR_CPUS)
   --  arg-macro: procedure cpus_andnot __cpus_andnot(and(dst), and(src1), and(src2), NR_CPUS)
   --    __cpus_andnot(and(dst), and(src1), and(src2), NR_CPUS)
   --  arg-macro: procedure cpus_equal __cpus_equal(and(src1), and(src2), NR_CPUS)
   --    __cpus_equal(and(src1), and(src2), NR_CPUS)
   --  arg-macro: procedure cpus_intersects __cpus_intersects(and(src1), and(src2), NR_CPUS)
   --    __cpus_intersects(and(src1), and(src2), NR_CPUS)
   --  arg-macro: procedure cpus_subset __cpus_subset(and(src1), and(src2), NR_CPUS)
   --    __cpus_subset(and(src1), and(src2), NR_CPUS)
   --  arg-macro: procedure cpus_empty __cpus_empty(and(src), NR_CPUS)
   --    __cpus_empty(and(src), NR_CPUS)
   --  arg-macro: procedure cpus_weight __cpus_weight(and(cpumask), NR_CPUS)
   --    __cpus_weight(and(cpumask), NR_CPUS)
   --  arg-macro: procedure cpus_shift_left __cpus_shift_left(and(dst), and(src), (n), NR_CPUS)
   --    __cpus_shift_left(and(dst), and(src), (n), NR_CPUS)
  -- * Cpumasks provide a bitmap suitable for representing the
  -- * set of CPU's in a system, one bit position per CPU number.  In general,
  -- * only nr_cpu_ids (<= NR_CPUS) bits are valid.
  --  

   type cpumask_bits_array is array (0 .. 7) of aliased unsigned_long;
   type cpumask is record
      bits : aliased cpumask_bits_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:14
   end record;
   pragma Convention (C_Pass_By_Copy, cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:14

   subtype cpumask_t is cpumask;

  --*
  -- * cpumask_bits - get the bits in a cpumask
  -- * @maskp: the struct cpumask *
  -- *
  -- * You should only assume nr_cpu_ids bits of this mask are valid.  This is
  -- * a macro so it's const-correct.
  --  

   nr_cpu_ids : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:28
   pragma Import (C, nr_cpu_ids, "nr_cpu_ids");

  -- Assuming NR_CPUS is huge, a runtime limit is more efficient.  Also,
  -- * not all bits may be allocated.  

  -- * The following particular system cpumasks and operations manage
  -- * possible, present, active and online cpus.
  -- *
  -- *     cpu_possible_mask- has bit 'cpu' set iff cpu is populatable
  -- *     cpu_present_mask - has bit 'cpu' set iff cpu is populated
  -- *     cpu_online_mask  - has bit 'cpu' set iff cpu available to scheduler
  -- *     cpu_active_mask  - has bit 'cpu' set iff cpu available to migration
  -- *
  -- *  If !CONFIG_HOTPLUG_CPU, present == possible, and active == online.
  -- *
  -- *  The cpu_possible_mask is fixed at boot time, as the set of CPU id's
  -- *  that it is possible might ever be plugged in at anytime during the
  -- *  life of that system boot.  The cpu_present_mask is dynamic(*),
  -- *  representing which CPUs are currently plugged in.  And
  -- *  cpu_online_mask is the dynamic subset of cpu_present_mask,
  -- *  indicating those CPUs available for scheduling.
  -- *
  -- *  If HOTPLUG is enabled, then cpu_possible_mask is forced to have
  -- *  all NR_CPUS bits set, otherwise it is just the set of CPUs that
  -- *  ACPI reports present at boot.
  -- *
  -- *  If HOTPLUG is enabled, then cpu_present_mask varies dynamically,
  -- *  depending on what ACPI reports as currently plugged in, otherwise
  -- *  cpu_present_mask is just a copy of cpu_possible_mask.
  -- *
  -- *  (*) Well, cpu_present_mask is dynamic in the hotplug case.  If not
  -- *      hotplug, it's a copy of cpu_possible_mask, hence fixed at boot.
  -- *
  -- * Subtleties:
  -- * 1) UP arch's (NR_CPUS == 1, CONFIG_SMP not defined) hardcode
  -- *    assumption that their single CPU is online.  The UP
  -- *    cpu_{online,possible,present}_masks are placebos.  Changing them
  -- *    will have no useful affect on the following num_*_cpus()
  -- *    and cpu_*() macros in the UP case.  This ugliness is a UP
  -- *    optimization - don't waste any instructions or memory references
  -- *    asking if you're online or how many CPUs there are if there is
  -- *    only one CPU.
  --  

   cpu_possible_mask : access constant cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:79
   pragma Import (C, cpu_possible_mask, "cpu_possible_mask");

   cpu_online_mask : access constant cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:80
   pragma Import (C, cpu_online_mask, "cpu_online_mask");

   cpu_present_mask : access constant cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:81
   pragma Import (C, cpu_present_mask, "cpu_present_mask");

   cpu_active_mask : access constant cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:82
   pragma Import (C, cpu_active_mask, "cpu_active_mask");

  -- verify cpu argument to cpumask_* operators  
   function cpumask_check (cpu : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:105
   pragma Import (CPP, cpumask_check, "_ZL13cpumask_checkj");

  -- Uniprocessor.  Assume all masks are "1".  
  -- Valid inputs for n are -1 and 0.  
  -- cpu must be a valid cpu, ie 0, so there's no other choice.  
  --*
  -- * cpumask_first - get the first cpu in a cpumask
  -- * @srcp: the cpumask pointer
  -- *
  -- * Returns >= nr_cpu_ids if no cpus set.
  --  

   function cpumask_first (srcp : access constant cpumask) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:165
   pragma Import (CPP, cpumask_first, "_ZL13cpumask_firstPK7cpumask");

  --*
  -- * cpumask_next - get the next cpu in a cpumask
  -- * @n: the cpu prior to the place to search (ie. return will be > @n)
  -- * @srcp: the cpumask pointer
  -- *
  -- * Returns >= nr_cpu_ids if no further cpus set.
  --  

   function cpumask_next (n : int; srcp : access constant cpumask) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:177
   pragma Import (CPP, cpumask_next, "_ZL12cpumask_nextiPK7cpumask");

  -- -1 is a legal arg here.  
  --*
  -- * cpumask_next_zero - get the next unset cpu in a cpumask
  -- * @n: the cpu prior to the place to search (ie. return will be > @n)
  -- * @srcp: the cpumask pointer
  -- *
  -- * Returns >= nr_cpu_ids if no further cpus unset.
  --  

   function cpumask_next_zero (n : int; srcp : access constant cpumask) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:192
   pragma Import (CPP, cpumask_next_zero, "_ZL17cpumask_next_zeroiPK7cpumask");

  -- -1 is a legal arg here.  
   function cpumask_next_and
     (n : int;
      arg2 : access constant cpumask;
      arg3 : access constant cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:200
   pragma Import (CPP, cpumask_next_and, "_Z16cpumask_next_andiPK7cpumaskS1_");

   function cpumask_any_but (mask : access constant cpumask; cpu : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:201
   pragma Import (CPP, cpumask_any_but, "_Z15cpumask_any_butPK7cpumaskj");

   function cpumask_set_cpu_local_first
     (i : int;
      numa_node : int;
      dstp : access cpumask_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:202
   pragma Import (CPP, cpumask_set_cpu_local_first, "_Z27cpumask_set_cpu_local_firstiiP7cpumask");

  --*
  -- * for_each_cpu - iterate over every cpu in a mask
  -- * @cpu: the (optionally unsigned) integer iterator
  -- * @mask: the cpumask pointer
  -- *
  -- * After the loop, cpu is >= nr_cpu_ids.
  --  

  --*
  -- * for_each_cpu_not - iterate over every cpu in a complemented mask
  -- * @cpu: the (optionally unsigned) integer iterator
  -- * @mask: the cpumask pointer
  -- *
  -- * After the loop, cpu is >= nr_cpu_ids.
  --  

  --*
  -- * for_each_cpu_and - iterate over every cpu in both masks
  -- * @cpu: the (optionally unsigned) integer iterator
  -- * @mask: the first cpumask pointer
  -- * @and: the second cpumask pointer
  -- *
  -- * This saves a temporary CPU mask in many places.  It is equivalent to:
  -- *	struct cpumask tmp;
  -- *	cpumask_and(&tmp, &mask, &and);
  -- *	for_each_cpu(cpu, &tmp)
  -- *		...
  -- *
  -- * After the loop, cpu is >= nr_cpu_ids.
  --  

  --*
  -- * cpumask_set_cpu - set a cpu in a cpumask
  -- * @cpu: cpu number (< nr_cpu_ids)
  -- * @dstp: the cpumask pointer
  --  

   procedure cpumask_set_cpu (cpu : unsigned; dstp : access cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:263
   pragma Import (CPP, cpumask_set_cpu, "_ZL15cpumask_set_cpujP7cpumask");

  --*
  -- * cpumask_clear_cpu - clear a cpu in a cpumask
  -- * @cpu: cpu number (< nr_cpu_ids)
  -- * @dstp: the cpumask pointer
  --  

   procedure cpumask_clear_cpu (cpu : int; dstp : access cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:273
   pragma Import (CPP, cpumask_clear_cpu, "_ZL17cpumask_clear_cpuiP7cpumask");

  --*
  -- * cpumask_test_cpu - test for a cpu in a cpumask
  -- * @cpu: cpu number (< nr_cpu_ids)
  -- * @cpumask: the cpumask pointer
  -- *
  -- * Returns 1 if @cpu is set in @cpumask, else returns 0
  -- *
  -- * No static inline type checking - see Subtlety (1) above.
  --  

  --*
  -- * cpumask_test_and_set_cpu - atomically test and set a cpu in a cpumask
  -- * @cpu: cpu number (< nr_cpu_ids)
  -- * @cpumask: the cpumask pointer
  -- *
  -- * Returns 1 if @cpu is set in old bitmap of @cpumask, else returns 0
  -- *
  -- * test_and_set_bit wrapper for cpumasks.
  --  

   function cpumask_test_and_set_cpu (cpu : int; the_cpumask : access cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:299
   pragma Import (CPP, cpumask_test_and_set_cpu, "_ZL24cpumask_test_and_set_cpuiP7cpumask");

  --*
  -- * cpumask_test_and_clear_cpu - atomically test and clear a cpu in a cpumask
  -- * @cpu: cpu number (< nr_cpu_ids)
  -- * @cpumask: the cpumask pointer
  -- *
  -- * Returns 1 if @cpu is set in old bitmap of @cpumask, else returns 0
  -- *
  -- * test_and_clear_bit wrapper for cpumasks.
  --  

   function cpumask_test_and_clear_cpu (cpu : int; the_cpumask : access cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:313
   pragma Import (CPP, cpumask_test_and_clear_cpu, "_ZL26cpumask_test_and_clear_cpuiP7cpumask");

  --*
  -- * cpumask_setall - set all cpus (< nr_cpu_ids) in a cpumask
  -- * @dstp: the cpumask pointer
  --  

   procedure cpumask_setall (dstp : access cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:322
   pragma Import (CPP, cpumask_setall, "_ZL14cpumask_setallP7cpumask");

  --*
  -- * cpumask_clear - clear all cpus (< nr_cpu_ids) in a cpumask
  -- * @dstp: the cpumask pointer
  --  

   procedure cpumask_clear (dstp : access cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:331
   pragma Import (CPP, cpumask_clear, "_ZL13cpumask_clearP7cpumask");

  --*
  -- * cpumask_and - *dstp = *src1p & *src2p
  -- * @dstp: the cpumask result
  -- * @src1p: the first input
  -- * @src2p: the second input
  -- *
  -- * If *@dstp is empty, returns 0, else returns 1
  --  

   function cpumask_and
     (dstp : access cpumask;
      src1p : access constant cpumask;
      src2p : access constant cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:344
   pragma Import (CPP, cpumask_and, "_ZL11cpumask_andP7cpumaskPKS_S2_");

  --*
  -- * cpumask_or - *dstp = *src1p | *src2p
  -- * @dstp: the cpumask result
  -- * @src1p: the first input
  -- * @src2p: the second input
  --  

   procedure cpumask_or
     (dstp : access cpumask;
      src1p : access constant cpumask;
      src2p : access constant cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:358
   pragma Import (CPP, cpumask_or, "_ZL10cpumask_orP7cpumaskPKS_S2_");

  --*
  -- * cpumask_xor - *dstp = *src1p ^ *src2p
  -- * @dstp: the cpumask result
  -- * @src1p: the first input
  -- * @src2p: the second input
  --  

   procedure cpumask_xor
     (dstp : access cpumask;
      src1p : access constant cpumask;
      src2p : access constant cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:371
   pragma Import (CPP, cpumask_xor, "_ZL11cpumask_xorP7cpumaskPKS_S2_");

  --*
  -- * cpumask_andnot - *dstp = *src1p & ~*src2p
  -- * @dstp: the cpumask result
  -- * @src1p: the first input
  -- * @src2p: the second input
  -- *
  -- * If *@dstp is empty, returns 0, else returns 1
  --  

   function cpumask_andnot
     (dstp : access cpumask;
      src1p : access constant cpumask;
      src2p : access constant cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:387
   pragma Import (CPP, cpumask_andnot, "_ZL14cpumask_andnotP7cpumaskPKS_S2_");

  --*
  -- * cpumask_complement - *dstp = ~*srcp
  -- * @dstp: the cpumask result
  -- * @srcp: the input to invert
  --  

   procedure cpumask_complement (dstp : access cpumask; srcp : access constant cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:400
   pragma Import (CPP, cpumask_complement, "_ZL18cpumask_complementP7cpumaskPKS_");

  --*
  -- * cpumask_equal - *src1p == *src2p
  -- * @src1p: the first input
  -- * @src2p: the second input
  --  

   function cpumask_equal (src1p : access constant cpumask; src2p : access constant cpumask) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:412
   pragma Import (CPP, cpumask_equal, "_ZL13cpumask_equalPK7cpumaskS1_");

  --*
  -- * cpumask_intersects - (*src1p & *src2p) != 0
  -- * @src1p: the first input
  -- * @src2p: the second input
  --  

   function cpumask_intersects (src1p : access constant cpumask; src2p : access constant cpumask) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:424
   pragma Import (CPP, cpumask_intersects, "_ZL18cpumask_intersectsPK7cpumaskS1_");

  --*
  -- * cpumask_subset - (*src1p & ~*src2p) == 0
  -- * @src1p: the first input
  -- * @src2p: the second input
  -- *
  -- * Returns 1 if *@src1p is a subset of *@src2p, else returns 0
  --  

   function cpumask_subset (src1p : access constant cpumask; src2p : access constant cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:438
   pragma Import (CPP, cpumask_subset, "_ZL14cpumask_subsetPK7cpumaskS1_");

  --*
  -- * cpumask_empty - *srcp == 0
  -- * @srcp: the cpumask to that all cpus < nr_cpu_ids are clear.
  --  

   function cpumask_empty (srcp : access constant cpumask) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:449
   pragma Import (CPP, cpumask_empty, "_ZL13cpumask_emptyPK7cpumask");

  --*
  -- * cpumask_full - *srcp == 0xFFFFFFFF...
  -- * @srcp: the cpumask to that all cpus < nr_cpu_ids are set.
  --  

   function cpumask_full (srcp : access constant cpumask) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:458
   pragma Import (CPP, cpumask_full, "_ZL12cpumask_fullPK7cpumask");

  --*
  -- * cpumask_weight - Count of bits in *srcp
  -- * @srcp: the cpumask to count bits (< nr_cpu_ids) in.
  --  

   function cpumask_weight (srcp : access constant cpumask) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:467
   pragma Import (CPP, cpumask_weight, "_ZL14cpumask_weightPK7cpumask");

  --*
  -- * cpumask_shift_right - *dstp = *srcp >> n
  -- * @dstp: the cpumask result
  -- * @srcp: the input to shift
  -- * @n: the number of bits to shift by
  --  

   procedure cpumask_shift_right
     (dstp : access cpumask;
      srcp : access constant cpumask;
      n : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:478
   pragma Import (CPP, cpumask_shift_right, "_ZL19cpumask_shift_rightP7cpumaskPKS_i");

  --*
  -- * cpumask_shift_left - *dstp = *srcp << n
  -- * @dstp: the cpumask result
  -- * @srcp: the input to shift
  -- * @n: the number of bits to shift by
  --  

   procedure cpumask_shift_left
     (dstp : access cpumask;
      srcp : access constant cpumask;
      n : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:491
   pragma Import (CPP, cpumask_shift_left, "_ZL18cpumask_shift_leftP7cpumaskPKS_i");

  --*
  -- * cpumask_copy - *dstp = *srcp
  -- * @dstp: the result
  -- * @srcp: the input cpumask
  --  

   procedure cpumask_copy (dstp : access cpumask; srcp : access constant cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:503
   pragma Import (CPP, cpumask_copy, "_ZL12cpumask_copyP7cpumaskPKS_");

  --*
  -- * cpumask_any - pick a "random" cpu from *srcp
  -- * @srcp: the input cpumask
  -- *
  -- * Returns >= nr_cpu_ids if no cpus set.
  --  

  --*
  -- * cpumask_first_and - return the first cpu from *srcp1 & *srcp2
  -- * @src1p: the first input
  -- * @src2p: the second input
  -- *
  -- * Returns >= nr_cpu_ids if no cpus set in both.  See also cpumask_next_and().
  --  

  --*
  -- * cpumask_any_and - pick a "random" cpu from *mask1 & *mask2
  -- * @mask1: the first input cpumask
  -- * @mask2: the second input cpumask
  -- *
  -- * Returns >= nr_cpu_ids if no cpus set.
  --  

  --*
  -- * cpumask_of - the cpumask containing just a given cpu
  -- * @cpu: the cpu (<= nr_cpu_ids)
  --  

  --*
  -- * cpumask_scnprintf - print a cpumask into a string as comma-separated hex
  -- * @buf: the buffer to sprintf into
  -- * @len: the length of the buffer
  -- * @srcp: the cpumask to print
  -- *
  -- * If len is zero, returns zero.  Otherwise returns the length of the
  -- * (nul-terminated) @buf string.
  --  

   function cpumask_scnprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      len : int;
      srcp : access constant cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:550
   pragma Import (CPP, cpumask_scnprintf, "_ZL17cpumask_scnprintfPciPK7cpumask");

  --*
  -- * cpumask_parse_user - extract a cpumask from a user string
  -- * @buf: the buffer to extract from
  -- * @len: the length of the buffer
  -- * @dstp: the cpumask to set.
  -- *
  -- * Returns -errno, or 0 for success.
  --  

   function cpumask_parse_user
     (buf : Interfaces.C.Strings.chars_ptr;
      len : int;
      dstp : access cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:564
   pragma Import (CPP, cpumask_parse_user, "_ZL18cpumask_parse_userPKciP7cpumask");

  --*
  -- * cpumask_parselist_user - extract a cpumask from a user string
  -- * @buf: the buffer to extract from
  -- * @len: the length of the buffer
  -- * @dstp: the cpumask to set.
  -- *
  -- * Returns -errno, or 0 for success.
  --  

   function cpumask_parselist_user
     (buf : Interfaces.C.Strings.chars_ptr;
      len : int;
      dstp : access cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:578
   pragma Import (CPP, cpumask_parselist_user, "_ZL22cpumask_parselist_userPKciP7cpumask");

  --*
  -- * cpulist_scnprintf - print a cpumask into a string as comma-separated list
  -- * @buf: the buffer to sprintf into
  -- * @len: the length of the buffer
  -- * @srcp: the cpumask to print
  -- *
  -- * If len is zero, returns zero.  Otherwise returns the length of the
  -- * (nul-terminated) @buf string.
  --  

   function cpulist_scnprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      len : int;
      srcp : access constant cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:594
   pragma Import (CPP, cpulist_scnprintf, "_ZL17cpulist_scnprintfPciPK7cpumask");

  --*
  -- * cpumask_parse - extract a cpumask from from a string
  -- * @buf: the buffer to extract from
  -- * @dstp: the cpumask to set.
  -- *
  -- * Returns -errno, or 0 for success.
  --  

   function cpumask_parse (buf : Interfaces.C.Strings.chars_ptr; dstp : access cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:608
   pragma Import (CPP, cpumask_parse, "_ZL13cpumask_parsePKcP7cpumask");

  --*
  -- * cpulist_parse - extract a cpumask from a user string of ranges
  -- * @buf: the buffer to extract from
  -- * @dstp: the cpumask to set.
  -- *
  -- * Returns -errno, or 0 for success.
  --  

   function cpulist_parse (buf : Interfaces.C.Strings.chars_ptr; dstp : access cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:623
   pragma Import (CPP, cpulist_parse, "_ZL13cpulist_parsePKcP7cpumask");

  --*
  -- * cpumask_size - size to allocate for a 'struct cpumask' in bytes
  -- *
  -- * This will eventually be a runtime variable, depending on nr_cpu_ids.
  --  

   function cpumask_size return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:633
   pragma Import (CPP, cpumask_size, "_ZL12cpumask_sizev");

  -- FIXME: Once all cpumask assignments are eliminated, this
  --	 * can be nr_cpumask_bits  

  -- * cpumask_var_t: struct cpumask for stack usage.
  -- *
  -- * Oh, the wicked games we play!  In order to make kernel coding a
  -- * little more difficult, we typedef cpumask_var_t to an array or a
  -- * pointer: doing &mask on an array is a noop, so it still works.
  -- *
  -- * ie.
  -- *	cpumask_var_t tmpmask;
  -- *	if (!alloc_cpumask_var(&tmpmask, GFP_KERNEL))
  -- *		return -ENOMEM;
  -- *
  -- *	  ... use 'tmpmask' like a normal struct cpumask * ...
  -- *
  -- *	free_cpumask_var(tmpmask);
  -- *
  -- *
  -- * However, one notable exception is there. alloc_cpumask_var() allocates
  -- * only nr_cpumask_bits bits (in the other hand, real cpumask_t always has
  -- * NR_CPUS bits). Therefore you don't have to dereference cpumask_var_t.
  -- *
  -- *	cpumask_var_t tmpmask;
  -- *	if (!alloc_cpumask_var(&tmpmask, GFP_KERNEL))
  -- *		return -ENOMEM;
  -- *
  -- *	var = *tmpmask;
  -- *
  -- * This code makes NR_CPUS length memcopy and brings to a memory corruption.
  -- * cpumask_copy() provide safe copy functionality.
  --  

   type cpumask_var_t is array (0 .. 0) of aliased cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:682

   function alloc_cpumask_var (mask : access cpumask_var_t; flags : linux_types_h.gfp_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:684
   pragma Import (CPP, alloc_cpumask_var, "_ZL17alloc_cpumask_varPA1_7cpumaskj");

   function alloc_cpumask_var_node
     (mask : access cpumask_var_t;
      flags : linux_types_h.gfp_t;
      node : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:689
   pragma Import (CPP, alloc_cpumask_var_node, "_ZL22alloc_cpumask_var_nodePA1_7cpumaskji");

   function zalloc_cpumask_var (mask : access cpumask_var_t; flags : linux_types_h.gfp_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:695
   pragma Import (CPP, zalloc_cpumask_var, "_ZL18zalloc_cpumask_varPA1_7cpumaskj");

   function zalloc_cpumask_var_node
     (mask : access cpumask_var_t;
      flags : linux_types_h.gfp_t;
      node : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:701
   pragma Import (CPP, zalloc_cpumask_var_node, "_ZL23zalloc_cpumask_var_nodePA1_7cpumaskji");

   procedure alloc_bootmem_cpumask_var (mask : access cpumask_var_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:708
   pragma Import (CPP, alloc_bootmem_cpumask_var, "_ZL25alloc_bootmem_cpumask_varPA1_7cpumask");

   procedure free_cpumask_var (mask : access cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:712
   pragma Import (CPP, free_cpumask_var, "_ZL16free_cpumask_varP7cpumask");

   procedure free_bootmem_cpumask_var (mask : access cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:716
   pragma Import (CPP, free_bootmem_cpumask_var, "_ZL24free_bootmem_cpumask_varP7cpumask");

  -- It's common to want to use cpu_all_mask in struct member initializers,
  -- * so it has to refer to an address rather than a pointer.  

   cpu_all_bits : aliased array (0 .. 7) of aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:723
   pragma Import (C, cpu_all_bits, "cpu_all_bits");

  -- First bits of cpu_bit_bitmap are in fact unset.  
  -- Wrappers for arch boot code to manipulate normally-constant masks  
   procedure set_cpu_possible (cpu : unsigned; possible : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:734
   pragma Import (CPP, set_cpu_possible, "_Z16set_cpu_possiblejb");

   procedure set_cpu_present (cpu : unsigned; present : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:735
   pragma Import (CPP, set_cpu_present, "_Z15set_cpu_presentjb");

   procedure set_cpu_online (cpu : unsigned; online : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:736
   pragma Import (CPP, set_cpu_online, "_Z14set_cpu_onlinejb");

   procedure set_cpu_active (cpu : unsigned; active : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:737
   pragma Import (CPP, set_cpu_active, "_Z14set_cpu_activejb");

   procedure init_cpu_present (src : access constant cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:738
   pragma Import (CPP, init_cpu_present, "_Z16init_cpu_presentPK7cpumask");

   procedure init_cpu_possible (src : access constant cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:739
   pragma Import (CPP, init_cpu_possible, "_Z17init_cpu_possiblePK7cpumask");

   procedure init_cpu_online (src : access constant cpumask);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:740
   pragma Import (CPP, init_cpu_online, "_Z15init_cpu_onlinePK7cpumask");

  --*
  -- * to_cpumask - convert an NR_CPUS bitmap to a struct cpumask *
  -- * @bitmap: the bitmap
  -- *
  -- * There are a few places where cpumask_var_t isn't appropriate and
  -- * static cpumasks must be used (eg. very early boot), yet we don't
  -- * expose the definition of 'struct cpumask'.
  -- *
  -- * This does the conversion, and can be used as a constant initializer.
  --  

   --  skipped func __check_is_bitmap

  -- * Special-case data structure for "single bit set only" constant CPU masks.
  -- *
  -- * We pre-generate all the 64 (or 32) possible bit positions, with enough
  -- * padding to the left and the right, and return the constant pointer
  -- * appropriately offset.
  --  

   cpu_bit_bitmap : aliased array (0 .. 64, 0 .. 7) of aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:769
   pragma Import (C, cpu_bit_bitmap, "cpu_bit_bitmap");

   function get_cpu_mask (cpu : unsigned) return access constant cpumask;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cpumask.h:771
   pragma Import (CPP, get_cpu_mask, "_ZL12get_cpu_maskj");

  -- *
  -- * From here down, all obsolete.  Use cpumask_ variants!
  -- *
  --  

   --  skipped func __first_cpu

   --  skipped func __next_cpu

   --  skipped func __next_cpu_nr

   --  skipped func __cpu_set

   --  skipped func __cpu_clear

   --  skipped func __cpus_setall

   --  skipped func __cpus_clear

  -- No static inline type checking - see Subtlety (1) above.  
   --  skipped func __cpu_test_and_set

   --  skipped func __cpus_and

   --  skipped func __cpus_or

   --  skipped func __cpus_xor

   --  skipped func __cpus_andnot

   --  skipped func __cpus_equal

   --  skipped func __cpus_intersects

   --  skipped func __cpus_subset

   --  skipped func __cpus_empty

   --  skipped func __cpus_weight

   --  skipped func __cpus_shift_left

end linux_cpumask_h;

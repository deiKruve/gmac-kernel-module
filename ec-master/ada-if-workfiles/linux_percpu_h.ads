pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;

package linux_percpu_h is

   --  unsupported macro: PERCPU_MODULE_RESERVE (8 << 10)
   --  unsupported macro: PERCPU_ENOUGH_ROOM (ALIGN(__per_cpu_end - __per_cpu_start, SMP_CACHE_BYTES) + PERCPU_MODULE_RESERVE)
   --  arg-macro: function get_cpu_var (*({ preempt_disable(); this_cpu_ptr(andvar); })
   --    return *({ preempt_disable(); this_cpu_ptr(andvar); });
   --  arg-macro: procedure put_cpu_var do { (void)and(var); preempt_enable(); } while (0)
   --    do { (void)and(var); preempt_enable(); } while (0)
   --  arg-macro: function get_cpu_ptr ({ preempt_disable(); this_cpu_ptr(var); }
   --    return { preempt_disable(); this_cpu_ptr(var); };
   --  arg-macro: procedure put_cpu_ptr do { (void)(var); preempt_enable(); } while (0)
   --    do { (void)(var); preempt_enable(); } while (0)
   --  unsupported macro: PCPU_MIN_UNIT_SIZE PFN_ALIGN(32 << 10)
   --  unsupported macro: PERCPU_DYNAMIC_EARLY_SLOTS 128
   --  unsupported macro: PERCPU_DYNAMIC_EARLY_SIZE (12 << 10)
   --  unsupported macro: PERCPU_DYNAMIC_RESERVE (20 << 10)
   --  arg-macro: procedure per_cpu_ptr SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)))
   --    SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)))
   --  arg-macro: function alloc_percpu (typeof(type) __percpu *)__alloc_percpu(sizeof(type), __alignof__(type)
   --    return typeof(type) __percpu *)__alloc_percpu(sizeof(type), __alignof__(type);
   --  arg-macro: procedure this_cpu_read __pcpu_size_call_return(this_cpu_read_, (pcp))
   --    __pcpu_size_call_return(this_cpu_read_, (pcp))
   --  arg-macro: procedure this_cpu_write __pcpu_size_call(this_cpu_write_, (pcp), (val))
   --    __pcpu_size_call(this_cpu_write_, (pcp), (val))
   --  arg-macro: procedure this_cpu_add __pcpu_size_call(this_cpu_add_, (pcp), (val))
   --    __pcpu_size_call(this_cpu_add_, (pcp), (val))
   --  arg-macro: procedure this_cpu_sub this_cpu_add((pcp), -(typeof(pcp))(val))
   --    this_cpu_add((pcp), -(typeof(pcp))(val))
   --  arg-macro: procedure this_cpu_inc this_cpu_add((pcp), 1)
   --    this_cpu_add((pcp), 1)
   --  arg-macro: procedure this_cpu_dec this_cpu_sub((pcp), 1)
   --    this_cpu_sub((pcp), 1)
   --  arg-macro: procedure this_cpu_and __pcpu_size_call(this_cpu_and_, (pcp), (val))
   --    __pcpu_size_call(this_cpu_and_, (pcp), (val))
   --  arg-macro: procedure this_cpu_or __pcpu_size_call(this_cpu_or_, (pcp), (val))
   --    __pcpu_size_call(this_cpu_or_, (pcp), (val))
   --  arg-macro: procedure this_cpu_add_return __pcpu_size_call_return2(this_cpu_add_return_, pcp, val)
   --    __pcpu_size_call_return2(this_cpu_add_return_, pcp, val)
   --  arg-macro: procedure this_cpu_sub_return this_cpu_add_return(pcp, -(typeof(pcp))(val))
   --    this_cpu_add_return(pcp, -(typeof(pcp))(val))
   --  arg-macro: procedure this_cpu_inc_return this_cpu_add_return(pcp, 1)
   --    this_cpu_add_return(pcp, 1)
   --  arg-macro: procedure this_cpu_dec_return this_cpu_add_return(pcp, -1)
   --    this_cpu_add_return(pcp, -1)
   --  arg-macro: procedure this_cpu_xchg __pcpu_size_call_return2(this_cpu_xchg_, (pcp), nval)
   --    __pcpu_size_call_return2(this_cpu_xchg_, (pcp), nval)
   --  arg-macro: procedure this_cpu_cmpxchg __pcpu_size_call_return2(this_cpu_cmpxchg_, pcp, oval, nval)
   --    __pcpu_size_call_return2(this_cpu_cmpxchg_, pcp, oval, nval)
   --  arg-macro: procedure this_cpu_cmpxchg_double_1 _this_cpu_generic_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
   --    _this_cpu_generic_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
   --  arg-macro: procedure this_cpu_cmpxchg_double_2 _this_cpu_generic_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
   --    _this_cpu_generic_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
   --  arg-macro: procedure this_cpu_cmpxchg_double __pcpu_double_call_return_bool(this_cpu_cmpxchg_double_, (pcp1), (pcp2), (oval1), (oval2), (nval1), (nval2))
   --    __pcpu_double_call_return_bool(this_cpu_cmpxchg_double_, (pcp1), (pcp2), (oval1), (oval2), (nval1), (nval2))
   --  arg-macro: procedure raw_cpu_read __pcpu_size_call_return(raw_cpu_read_, (pcp))
   --    __pcpu_size_call_return(raw_cpu_read_, (pcp))
   --  arg-macro: procedure raw_cpu_generic_to_op do { *raw_cpu_ptr(and(pcp)) op val; } while (0)
   --    do { *raw_cpu_ptr(and(pcp)) op val; } while (0)
   --  arg-macro: procedure raw_cpu_write __pcpu_size_call(raw_cpu_write_, (pcp), (val))
   --    __pcpu_size_call(raw_cpu_write_, (pcp), (val))
   --  arg-macro: procedure raw_cpu_add __pcpu_size_call(raw_cpu_add_, (pcp), (val))
   --    __pcpu_size_call(raw_cpu_add_, (pcp), (val))
   --  arg-macro: procedure raw_cpu_sub raw_cpu_add((pcp), -(val))
   --    raw_cpu_add((pcp), -(val))
   --  arg-macro: procedure raw_cpu_inc raw_cpu_add((pcp), 1)
   --    raw_cpu_add((pcp), 1)
   --  arg-macro: procedure raw_cpu_dec raw_cpu_sub((pcp), 1)
   --    raw_cpu_sub((pcp), 1)
   --  arg-macro: procedure raw_cpu_and __pcpu_size_call(raw_cpu_and_, (pcp), (val))
   --    __pcpu_size_call(raw_cpu_and_, (pcp), (val))
   --  arg-macro: procedure raw_cpu_or __pcpu_size_call(raw_cpu_or_, (pcp), (val))
   --    __pcpu_size_call(raw_cpu_or_, (pcp), (val))
   --  arg-macro: function raw_cpu_generic_add_return ({ raw_cpu_add(pcp, val); raw_cpu_read(pcp); }
   --    return { raw_cpu_add(pcp, val); raw_cpu_read(pcp); };
   --  arg-macro: procedure raw_cpu_add_return __pcpu_size_call_return2(raw_cpu_add_return_, pcp, val)
   --    __pcpu_size_call_return2(raw_cpu_add_return_, pcp, val)
   --  arg-macro: procedure raw_cpu_sub_return raw_cpu_add_return(pcp, -(typeof(pcp))(val))
   --    raw_cpu_add_return(pcp, -(typeof(pcp))(val))
   --  arg-macro: procedure raw_cpu_inc_return raw_cpu_add_return(pcp, 1)
   --    raw_cpu_add_return(pcp, 1)
   --  arg-macro: procedure raw_cpu_dec_return raw_cpu_add_return(pcp, -1)
   --    raw_cpu_add_return(pcp, -1)
   --  arg-macro: function raw_cpu_generic_xchg ({ typeof(pcp) ret__; ret__ := raw_cpu_read(pcp); raw_cpu_write(pcp, nval); ret__; }
   --    return { typeof(pcp) ret__; ret__ := raw_cpu_read(pcp); raw_cpu_write(pcp, nval); ret__; };
   --  arg-macro: procedure raw_cpu_xchg __pcpu_size_call_return2(raw_cpu_xchg_, (pcp), nval)
   --    __pcpu_size_call_return2(raw_cpu_xchg_, (pcp), nval)
   --  arg-macro: function raw_cpu_generic_cmpxchg ({ typeof(pcp) ret__; ret__ := raw_cpu_read(pcp); if (ret__ = (oval)) raw_cpu_write(pcp, nval); ret__; }
   --    return { typeof(pcp) ret__; ret__ := raw_cpu_read(pcp); if (ret__ = (oval)) raw_cpu_write(pcp, nval); ret__; };
   --  arg-macro: procedure raw_cpu_cmpxchg __pcpu_size_call_return2(raw_cpu_cmpxchg_, pcp, oval, nval)
   --    __pcpu_size_call_return2(raw_cpu_cmpxchg_, pcp, oval, nval)
   --  arg-macro: function raw_cpu_generic_cmpxchg_double ({ int __ret := 0; if (raw_cpu_read(pcp1) = (oval1)  and then  raw_cpu_read(pcp2) = (oval2)) { raw_cpu_write(pcp1, (nval1)); raw_cpu_write(pcp2, (nval2)); __ret := 1; } (__ret); }
   --    return { int __ret := 0; if (raw_cpu_read(pcp1) = (oval1)  and then  raw_cpu_read(pcp2) = (oval2)) { raw_cpu_write(pcp1, (nval1)); raw_cpu_write(pcp2, (nval2)); __ret := 1; } (__ret); };
   --  arg-macro: procedure raw_cpu_cmpxchg_double_1 raw_cpu_generic_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
   --    raw_cpu_generic_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
   --  arg-macro: procedure raw_cpu_cmpxchg_double_2 raw_cpu_generic_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
   --    raw_cpu_generic_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
   --  arg-macro: procedure raw_cpu_cmpxchg_double __pcpu_double_call_return_bool(raw_cpu_cmpxchg_double_, (pcp1), (pcp2), (oval1), (oval2), (nval1), (nval2))
   --    __pcpu_double_call_return_bool(raw_cpu_cmpxchg_double_, (pcp1), (pcp2), (oval1), (oval2), (nval1), (nval2))
  -- enough to cover all DEFINE_PER_CPUs in modules  
  -- * Must be an lvalue. Since @var must be a simple identifier,
  -- * we force a syntax error here if it isn't.
  --  

  -- * The weird & is necessary because sparse considers (void)(var) to be
  -- * a direct dereference of percpu variable (var).
  --  

  -- minimum unit size, also is the maximum supported allocation size  
  -- * Percpu allocator can serve percpu allocations before slab is
  -- * initialized which allows slab to depend on the percpu allocator.
  -- * The following two parameters decide how much resource to
  -- * preallocate for this.  Keep PERCPU_DYNAMIC_RESERVE equal to or
  -- * larger than PERCPU_DYNAMIC_EARLY_SIZE.
  --  

  -- * PERCPU_DYNAMIC_RESERVE indicates the amount of free area to piggy
  -- * back on the first chunk for dynamic percpu allocation if arch is
  -- * manually allocating and mapping it for faster access (as a part of
  -- * large page mapping for example).
  -- *
  -- * The following values give between one and two pages of free space
  -- * after typical minimal boot (2-way SMP, single disk and NIC) with
  -- * both defconfig and a distro config on x86_64 and 32.  More
  -- * intelligent way to determine this would be nice.
  --  

   pcpu_base_addr : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:82
   pragma Import (C, pcpu_base_addr, "pcpu_base_addr");

   pcpu_unit_offsets : access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:83
   pragma Import (C, pcpu_unit_offsets, "pcpu_unit_offsets");

  -- aligned # of units  
   type pcpu_group_info is record
      nr_units : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:86
      base_offset : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:87
      cpu_map : access unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:88
   end record;
   pragma Convention (C_Pass_By_Copy, pcpu_group_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:85

  -- base address offset  
  -- unit->cpu map, empty
  --						 * entries contain NR_CPUS  

   type pcpu_alloc_info_groups_array is array (0 .. -1) of aliased pcpu_group_info;
   type pcpu_alloc_info is record
      static_size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:93
      reserved_size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:94
      dyn_size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:95
      unit_size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:96
      atom_size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:97
      alloc_size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:98
      uu_ai_size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:99
      nr_groups : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:100
      groups : aliased pcpu_alloc_info_groups_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:101
   end record;
   pragma Convention (C_Pass_By_Copy, pcpu_alloc_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:92

  -- internal, don't use  
  -- 0 if grouping unnecessary  
   type pcpu_fc is 
     (PCPU_FC_AUTO,
      PCPU_FC_EMBED,
      PCPU_FC_PAGE,
      PCPU_FC_NR);
   pragma Convention (C, pcpu_fc);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:104

   pcpu_fc_names : aliased array (0 .. 2) of Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:111
   pragma Import (C, pcpu_fc_names, "pcpu_fc_names");

   pcpu_chosen_fc : aliased pcpu_fc;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:113
   pragma Import (C, pcpu_chosen_fc, "pcpu_chosen_fc");

   type pcpu_fc_alloc_fn_t is access function
        (arg1 : unsigned;
         arg2 : linux_types_h.size_t;
         arg3 : linux_types_h.size_t) return System.Address;
   pragma Convention (C, pcpu_fc_alloc_fn_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:115

   type pcpu_fc_free_fn_t is access procedure (arg1 : System.Address; arg2 : linux_types_h.size_t);
   pragma Convention (C, pcpu_fc_free_fn_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:117

   type pcpu_fc_populate_pte_fn_t is access procedure (arg1 : unsigned_long);
   pragma Convention (C, pcpu_fc_populate_pte_fn_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:118

   --  skipped function type pcpu_fc_cpu_distance_fn_t

   function pcpu_alloc_alloc_info (nr_groups : int; nr_units : int) return access pcpu_alloc_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:121
   pragma Import (CPP, pcpu_alloc_alloc_info, "_Z21pcpu_alloc_alloc_infoii");

   procedure pcpu_free_alloc_info (ai : access pcpu_alloc_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:123
   pragma Import (CPP, pcpu_free_alloc_info, "_Z20pcpu_free_alloc_infoP15pcpu_alloc_info");

   function pcpu_setup_first_chunk (ai : access constant pcpu_alloc_info; base_addr : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:125
   pragma Import (CPP, pcpu_setup_first_chunk, "_Z22pcpu_setup_first_chunkPK15pcpu_alloc_infoPv");

   function pcpu_embed_first_chunk
     (reserved_size : linux_types_h.size_t;
      dyn_size : linux_types_h.size_t;
      atom_size : linux_types_h.size_t;
      cpu_distance_fn : access function (arg1 : unsigned; arg2 : unsigned) return int;
      alloc_fn : pcpu_fc_alloc_fn_t;
      free_fn : pcpu_fc_free_fn_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:129
   pragma Import (CPP, pcpu_embed_first_chunk, "_Z22pcpu_embed_first_chunkmmmPFijjEPFPvjmmEPFvS1_mE");

   function pcpu_page_first_chunk
     (reserved_size : linux_types_h.size_t;
      alloc_fn : pcpu_fc_alloc_fn_t;
      free_fn : pcpu_fc_free_fn_t;
      populate_pte_fn : pcpu_fc_populate_pte_fn_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:137
   pragma Import (CPP, pcpu_page_first_chunk, "_Z21pcpu_page_first_chunkmPFPvjmmEPFvS_mEPFvmE");

  -- * Use this to get to a cpu's version of the per-cpu object
  -- * dynamically allocated. Non-atomic access to the current CPU's
  -- * version should probably be combined with get_cpu()/put_cpu().
  --  

   --  skipped func __alloc_reserved_percpu

   function is_kernel_percpu_address (addr : unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:155
   pragma Import (CPP, is_kernel_percpu_address, "_Z24is_kernel_percpu_addressm");

   procedure percpu_init_late;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:160
   pragma Import (CPP, percpu_init_late, "_Z16percpu_init_latev");

   --  skipped func __alloc_percpu

   procedure free_percpu (uu_pdata : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:163
   pragma Import (CPP, free_percpu, "_Z11free_percpuPv");

   function per_cpu_ptr_to_phys (addr : System.Address) return linux_types_h.phys_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu.h:164
   pragma Import (CPP, per_cpu_ptr_to_phys, "_Z19per_cpu_ptr_to_physPv");

  -- * Branching function to split up a function into a set of functions that
  -- * are called for different scalar sizes of the objects handled.
  --  

   --  skipped func __bad_size_call_parameter

   --  skipped func __this_cpu_preempt_check

  -- * Special handling for cmpxchg_double.  cmpxchg_double is passed two
  -- * percpu variables.  The first has to be aligned to a double word
  -- * boundary and the second has to follow directly thereafter.
  -- * We enforce this on all architectures even if they don't support
  -- * a double cmpxchg instruction, since it's a cheap requirement, and it
  -- * avoids breaking the requirement for architectures with the instruction.
  --  

  -- * this_cpu operations (C) 2008-2013 Christoph Lameter <cl@linux.com>
  -- *
  -- * Optimized manipulation for memory allocated through the per cpu
  -- * allocator or for addresses of per cpu variables.
  -- *
  -- * These operation guarantee exclusivity of access for other operations
  -- * on the *same* processor. The assumption is that per cpu data is only
  -- * accessed by a single processor instance (the current one).
  -- *
  -- * The first group is used for accesses that must be done in a
  -- * preemption safe way since we know that the context is not preempt
  -- * safe. Interrupts may occur. If the interrupt modifies the variable
  -- * too then RMW actions will not be reliable.
  -- *
  -- * The arch code can provide optimized functions in two ways:
  -- *
  -- * 1. Override the function completely. F.e. define this_cpu_add().
  -- *    The arch must then ensure that the various scalar format passed
  -- *    are handled correctly.
  -- *
  -- * 2. Provide functions for certain scalar sizes. F.e. provide
  -- *    this_cpu_add_2() to provide per cpu atomic operations for 2 byte
  -- *    sized RMW actions. If arch code does not provide operations for
  -- *    a scalar size then the fallback in the generic code will be
  -- *    used.
  --  

  -- * cmpxchg_double replaces two adjacent scalars at once.  The first
  -- * two parameters are per cpu variables which have to be of the same
  -- * size.  A truth value is returned to indicate success or failure
  -- * (since a double register result is difficult to handle).  There is
  -- * very limited hardware support for these operations, so only certain
  -- * sizes may work.
  --  

  -- * Generic percpu operations for contexts where we do not want to do
  -- * any checks for preemptiosn.
  -- *
  -- * If there is no other protection through preempt disable and/or
  -- * disabling interupts then one of these RMW operations can show unexpected
  -- * behavior because the execution thread was rescheduled on another processor
  -- * or an interrupt occurred and the same percpu variable was modified from
  -- * the interrupt context.
  --  

  -- * Generic percpu operations for context that are safe from preemption/interrupts.
  --  

end linux_percpu_h;

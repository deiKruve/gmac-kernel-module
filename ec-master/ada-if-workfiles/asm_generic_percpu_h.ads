pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_generic_percpu_h is

   --  arg-macro: function per_cpu_offset (__per_cpu_offset(x)
   --    return __per_cpu_offset(x);
   --  unsupported macro: my_cpu_offset __my_cpu_offset
   --  arg-macro: function SHIFT_PERCPU_PTR ({ __verify_pcpu_ptr((__p)); RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset)); }
   --    return { __verify_pcpu_ptr((__p)); RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset)); };
   --  arg-macro: function per_cpu (*SHIFT_PERCPU_PTR(and(var), per_cpu_offset(cpu))
   --    return *SHIFT_PERCPU_PTR(and(var), per_cpu_offset(cpu));
   --  arg-macro: procedure this_cpu_ptr raw_cpu_ptr(ptr)
   --    raw_cpu_ptr(ptr)
   --  unsupported macro: PER_CPU_BASE_SECTION ".data..percpu"
   --  unsupported macro: PER_CPU_SHARED_ALIGNED_SECTION ""
   --  unsupported macro: PER_CPU_ALIGNED_SECTION ""
   --  unsupported macro: PER_CPU_FIRST_SECTION "..first"
  -- * per_cpu_offset() is the offset that has to be added to a
  -- * percpu variable to get to the instance for a certain processor.
  -- *
  -- * Most arches use the __per_cpu_offset array for those offsets but
  -- * some arches have their own ways of determining the offset (x86_64, s390).
  --  

  -- * Determine the offset for the currently active processor.
  -- * An arch may define __my_cpu_offset to provide a more effective
  -- * means of obtaining the offset to the per cpu variables of the
  -- * current processor.
  --  

  -- * Add a offset to a pointer but keep the pointer as is.
  -- *
  -- * Only S390 provides its own means of moving the pointer.
  --  

  -- Weird cast keeps both GCC and sparse happy.  
  -- * A percpu variable may point to a discarded regions. The following are
  -- * established ways to produce a usable pointer from the percpu variable
  -- * offset.
  --  

   procedure setup_per_cpu_areas;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/percpu.h:72
   pragma Import (CPP, setup_per_cpu_areas, "_Z19setup_per_cpu_areasv");

  -- Keep until we have removed all uses of __this_cpu_ptr  
end asm_generic_percpu_h;

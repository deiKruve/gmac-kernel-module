pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package linux_compiler_h is

   --  arg-macro: procedure likely __builtin_expect(notnot(x), 1)
   --    __builtin_expect(notnot(x), 1)
   --  arg-macro: procedure unlikely __builtin_expect(notnot(x), 0)
   --    __builtin_expect(notnot(x), 0)
   --  arg-macro: function READ_ONCE ({ typeof(x) __val; __read_once_size(andx, and__val, sizeof(__val)); __val; }
   --    return { typeof(x) __val; __read_once_size(andx, and__val, sizeof(__val)); __val; };
   --  arg-macro: function WRITE_ONCE ({ typeof(x) __val; __val := val; __write_once_size(andx, and__val, sizeof(__val)); __val; }
   --    return { typeof(x) __val; __val := val; __write_once_size(andx, and__val, sizeof(__val)); __val; };
   --  unsupported macro: noinline_for_stack noinline
   --  arg-macro: procedure compiletime_assert _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
   --    _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
   --  arg-macro: procedure compiletime_assert_atomic_type compiletime_assert(__native_word(t), "Need native word sized stores/loads for atomicity.")
   --    compiletime_assert(__native_word(t), "Need native word sized stores/loads for atomicity.")
   --  arg-macro: function ACCESS_ONCE (*__ACCESS_ONCE(x)
   --    return *__ACCESS_ONCE(x);
   --  unsupported macro: nokprobe_inline __always_inline
  -- Indirect macros required for expanded argument pasting, eg. __LINE__.  
  -- Intel compiler defines __GNUC__. So we will overwrite implementations
  -- * coming from above header files here
  --  

  -- Clang compiler defines __GNUC__. So we will overwrite implementations
  -- * coming from above header files here
  --  

  -- * Generic compiler-dependent macros required for kernel
  -- * build go below this comment. Actual compiler/compiler version
  -- * specific implementations come from the above header files
  --  

   type ftrace_branch_data_miss_hit_array is array (0 .. 1) of aliased unsigned_long;
   type anon_0;
   type anon_1 is record
      correct : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compiler.h:85
      incorrect : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compiler.h:86
   end record;
   pragma Convention (C_Pass_By_Copy, anon_1);
   type anon_2 is record
      miss : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compiler.h:89
      hit : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compiler.h:90
   end record;
   pragma Convention (C_Pass_By_Copy, anon_2);
   type anon_0 (discr : unsigned := 0) is record
      case discr is
            parent : aliased anon_1;
            field_2 : aliased anon_2;
         when others =>
            miss_hit : aliased ftrace_branch_data_miss_hit_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compiler.h:92
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_0);
   pragma Unchecked_Union (anon_0);
   type ftrace_branch_data is record
      func : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compiler.h:80
      file : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compiler.h:81
      line : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compiler.h:82
      field_4 : aliased anon_0;
   end record;
   pragma Convention (C_Pass_By_Copy, ftrace_branch_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compiler.h:79

  -- * Note: DISABLE_BRANCH_PROFILING can be used by special lowlevel code
  -- * to disable branch tracing on a per file basis.
  --  

  -- * Using __builtin_constant_p(x) to ignore cases where the return
  -- * value is always the same.  This idea is taken from a similar patch
  -- * written by Daniel Walker.
  --  

  -- * "Define 'is'", Bill Clinton
  -- * "Define 'if'", Steven Rostedt
  --  

  -- Optimization barrier  
  -- Unreachable code  
  -- Not-quite-unique ID.  
   procedure data_access_exceeds_word_size;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/compiler.h:197
   pragma Import (CPP, data_access_exceeds_word_size, "_ZL29data_access_exceeds_word_sizev");

   --  skipped func __read_once_size

   --  skipped func __write_once_size

  -- * Prevent the compiler from merging or refetching reads or writes. The
  -- * compiler is also forbidden from reordering successive instances of
  -- * READ_ONCE, WRITE_ONCE and ACCESS_ONCE (see below), but only when the
  -- * compiler is aware of some particular ordering.  One way to make the
  -- * compiler aware of ordering is to put the two invocations of READ_ONCE,
  -- * WRITE_ONCE or ACCESS_ONCE() in different C statements.
  -- *
  -- * In contrast to ACCESS_ONCE these two macros will also work on aggregate
  -- * data types like structs or unions. If the size of the accessed data
  -- * type exceeds the word size of the machine (e.g., 32 bits or 64 bits)
  -- * READ_ONCE() and WRITE_ONCE()  will fall back to memcpy and print a
  -- * compile-time warning.
  -- *
  -- * Their two major use cases are: (1) Mediating communication between
  -- * process-level code and irq/NMI handlers, all running on the same CPU,
  -- * and (2) Ensuring that the compiler does not  fold, spindle, or otherwise
  -- * mutilate accesses that either do not require ordering or that interact
  -- * with an explicit memory barrier or atomic instruction that provides the
  -- * required ordering.
  --  

  -- * Allow us to mark functions as 'deprecated' and have gcc emit a nice
  -- * warning for each use, in hopes of speeding the functions removal.
  -- * Usage is:
  -- * 		int __deprecated foo(void)
  --  

  -- * Allow us to avoid 'defined but not used' warnings on functions and data,
  -- * as well as force them to be emitted to the assembly file.
  -- *
  -- * As of gcc 3.4, static functions that are not marked with attribute((used))
  -- * may be elided from the assembly file.  As of gcc 3.4, static data not so
  -- * marked will not be elided, but this may change in a future gcc version.
  -- *
  -- * NOTE: Because distributions shipped with a backported unit-at-a-time
  -- * compiler in gcc 3.3, we must define __used to be __attribute__((used))
  -- * for gcc >=3.3 instead of 3.4.
  -- *
  -- * In prior versions of gcc, such functions and data would be emitted, but
  -- * would be warned about except with attribute((unused)).
  -- *
  -- * Mark functions that are referenced only in inline assembly as __used so
  -- * the code is emitted even though it appears to be unreferenced.
  --  

  -- * Rather then using noinline to prevent stack consumption, use
  -- * noinline_for_stack instead.  For documentation reasons.
  --  

  -- * From the GCC manual:
  -- *
  -- * Many functions do not examine any values except their arguments,
  -- * and have no effects except the return value.  Basically this is
  -- * just slightly more strict class than the `pure' attribute above,
  -- * since function is not allowed to read global memory.
  -- *
  -- * Note that a function that has pointer arguments and examines the
  -- * data pointed to must _not_ be declared `const'.  Likewise, a
  -- * function that calls a non-`const' function usually must not be
  -- * `const'.  It does not make sense for a `const' function to return
  -- * `void'.
  --  

  -- * Tell gcc if a function is cold. The compiler will assume any path
  -- * directly leading to the call is unlikely.
  --  

  -- Simple shorthand for a section definition  
  -- Are two types/vars the same type (ignoring qualifiers)?  
  -- Is this type a native word size -- useful for atomic operations  
  -- Compile time object size, -1 for unknown  
  -- * Sparse complains of variable sized arrays due to the temporary variable in
  -- * __compiletime_assert. Unfortunately we can't just expand it out to make
  -- * sparse see a constant array size without breaking compiletime_assert on old
  -- * versions of GCC (e.g. 4.2.4), so hide the array from sparse altogether.
  --  

  --*
  -- * compiletime_assert - break build and emit msg if condition is false
  -- * @condition: a compile-time constant condition to check
  -- * @msg:       a message to emit if condition is false
  -- *
  -- * In tradition of POSIX assert, this macro will break the build if the
  -- * supplied condition is *false*, emitting the supplied error message if the
  -- * compiler has support to do so.
  --  

  -- * Prevent the compiler from merging or refetching accesses.  The compiler
  -- * is also forbidden from reordering successive instances of ACCESS_ONCE(),
  -- * but only when the compiler is aware of some particular ordering.  One way
  -- * to make the compiler aware of ordering is to put the two invocations of
  -- * ACCESS_ONCE() in different C statements.
  -- *
  -- * ACCESS_ONCE will only work on scalar types. For union types, ACCESS_ONCE
  -- * on a union member will work as long as the size of the member matches the
  -- * size of the union and the size is smaller than word size.
  -- *
  -- * The major use cases of ACCESS_ONCE used to be (1) Mediating communication
  -- * between process-level code and irq/NMI handlers, all running on the same CPU,
  -- * and (2) Ensuring that the compiler does not  fold, spindle, or otherwise
  -- * mutilate accesses that either do not require ordering or that interact
  -- * with an explicit memory barrier or atomic instruction that provides the
  -- * required ordering.
  -- *
  -- * If possible use READ_ONCE/ASSIGN_ONCE instead.
  --  

  -- Ignore/forbid kprobes attach on very low level functions marked by this attribute:  
end linux_compiler_h;

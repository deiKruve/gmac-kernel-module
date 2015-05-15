pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_ptrace_h;
with System;
with Interfaces.C.Strings;

package asm_uaccess_h is

   --  unsupported macro: VERIFY_READ 0
   --  unsupported macro: VERIFY_WRITE 1
   --  arg-macro: function MAKE_MM_SEG ((mm_segment_t) { (s) }
   --    return (mm_segment_t) { (s) };
   --  unsupported macro: KERNEL_DS MAKE_MM_SEG(-1UL)
   --  unsupported macro: USER_DS MAKE_MM_SEG(TASK_SIZE_MAX)
   --  arg-macro: function get_ds (KERNEL_DS
   --    return KERNEL_DS;
   --  arg-macro: function get_fs (current_thread_info().addr_limit
   --    return current_thread_info().addr_limit;
   --  arg-macro: function set_fs (current_thread_info().addr_limit := (x)
   --    return current_thread_info().addr_limit := (x);
   --  arg-macro: function segment_eq ((a).seg = (b).seg
   --    return (a).seg = (b).seg;
   --  arg-macro: function user_addr_max (current_thread_info().addr_limit.seg
   --    return current_thread_info().addr_limit.seg;
   --  arg-macro: procedure access_ok likely(not__range_not_ok(addr, size, user_addr_max()))
   --    likely(not__range_not_ok(addr, size, user_addr_max()))
   --  arg-macro: function get_user ({ int __ret_gu; register __inttype(*(ptr)) __val_gu asm("%"_ASM_DX); __chk_user_ptr(ptr); might_fault(); asm volatile("call __get_user_%P3" : "=a" (__ret_gu), "=r" (__val_gu) : "0" (ptr), "i" (sizeof(*(ptr)))); (x) := (__typeof__(*(ptr))) __val_gu; __ret_gu; }
   --    return { int __ret_gu; register __inttype(*(ptr)) __val_gu asm("%"_ASM_DX); __chk_user_ptr(ptr); might_fault(); asm volatile("call __get_user_%P3" : "=a" (__ret_gu), "=r" (__val_gu) : "0" (ptr), "i" (sizeof(*(ptr)))); (x) := (__typeof__(*(ptr))) __val_gu; __ret_gu; };
   --  arg-macro: function put_user ({ int __ret_pu; __typeof__(*(ptr)) __pu_val; __chk_user_ptr(ptr); might_fault(); __pu_val := x; switch (sizeof(*(ptr))) { case 1: __put_user_x(1, __pu_val, ptr, __ret_pu); break; case 2: __put_user_x(2, __pu_val, ptr, __ret_pu); break; case 4: __put_user_x(4, __pu_val, ptr, __ret_pu); break; case 8: __put_user_x8(__pu_val, ptr, __ret_pu); break; default: __put_user_x(X, __pu_val, ptr, __ret_pu); break; } __ret_pu; }
   --    return { int __ret_pu; __typeof__(*(ptr)) __pu_val; __chk_user_ptr(ptr); might_fault(); __pu_val := x; switch (sizeof(*(ptr))) { case 1: __put_user_x(1, __pu_val, ptr, __ret_pu); break; case 2: __put_user_x(2, __pu_val, ptr, __ret_pu); break; case 4: __put_user_x(4, __pu_val, ptr, __ret_pu); break; case 8: __put_user_x8(__pu_val, ptr, __ret_pu); break; default: __put_user_x(X, __pu_val, ptr, __ret_pu); break; } __ret_pu; };
   --  unsupported macro: uaccess_try do { current_thread_info()->uaccess_err = 0; stac(); barrier();
   --  arg-macro: procedure uaccess_catch clac(); (err) |= (current_thread_info().uaccess_err ? -EFAULT : 0); } while (0)
   --    clac(); (err) |= (current_thread_info().uaccess_err ? -EFAULT : 0); } while (0)
   --  unsupported macro: get_user_try uaccess_try
   --  arg-macro: procedure get_user_catch uaccess_catch(err)
   --    uaccess_catch(err)
   --  arg-macro: procedure get_user_ex do { unsigned long __gue_val; __get_user_size_ex((__gue_val), (ptr), (sizeof(*(ptr)))); (x) := (__force __typeof__(*(ptr)))__gue_val; } while (0)
   --    do { unsigned long __gue_val; __get_user_size_ex((__gue_val), (ptr), (sizeof(*(ptr)))); (x) := (__force __typeof__(*(ptr)))__gue_val; } while (0)
   --  unsupported macro: put_user_try uaccess_try
   --  arg-macro: procedure put_user_catch uaccess_catch(err)
   --    uaccess_catch(err)
   --  arg-macro: procedure put_user_ex __put_user_size_ex((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
   --    __put_user_size_ex((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
   --  arg-macro: function user_atomic_cmpxchg_inatomic ({ access_ok(VERIFY_WRITE, (ptr), sizeof(*(ptr))) ? __user_atomic_cmpxchg_inatomic((uval), (ptr), (old), (new), sizeof(*(ptr))) : -EFAULT; }
   --    return { access_ok(VERIFY_WRITE, (ptr), sizeof(*(ptr))) ? __user_atomic_cmpxchg_inatomic((uval), (ptr), (old), (new), sizeof(*(ptr))) : -EFAULT; };
   --  unsupported macro: ARCH_HAS_NOCACHE_UACCESS 1
  -- * User space memory access functions
  --  

  -- * The fs value determines whether argument validity checking should be
  -- * performed or not.  If get_fs() == USER_DS, checking is performed, with
  -- * get_fs() == KERNEL_DS, checking is bypassed.
  -- *
  -- * For historical reasons, these macros are grossly misnamed.
  --  

  -- * Test whether a block of memory is a valid user space address.
  -- * Returns 0 if the range is valid, nonzero otherwise.
  --  

   --  skipped func __chk_range_not_ok

  --	 * If we have used "sizeof()" for the size,
  --	 * we know it won't overflow the limit (but
  --	 * it might overflow the 'addr', so it's
  --	 * important to subtract the size from the
  --	 * limit, not add it to the address).
  --	  

  -- Arbitrary sizes? Be careful about overflow  
  --*
  -- * access_ok: - Checks if a user space pointer is valid
  -- * @type: Type of access: %VERIFY_READ or %VERIFY_WRITE.  Note that
  -- *        %VERIFY_WRITE is a superset of %VERIFY_READ - if it is safe
  -- *        to write to a block, it is always safe to read from it.
  -- * @addr: User space pointer to start of block to check
  -- * @size: Size of block to check
  -- *
  -- * Context: User context only.  This function may sleep.
  -- *
  -- * Checks if a pointer to a block of memory in user space is valid.
  -- *
  -- * Returns true (nonzero) if the memory block may be valid, false (zero)
  -- * if it is definitely invalid.
  -- *
  -- * Note that, depending on architecture, this function probably just
  -- * checks that the pointer is in the user space range - after calling
  -- * this function, memory access functions may still return -EFAULT.
  --  

  -- * The exception table consists of pairs of addresses relative to the
  -- * exception table enty itself: the first is the address of an
  -- * instruction that is allowed to fault, and the second is the address
  -- * at which the program should continue.  No registers are modified,
  -- * so it is entirely up to the continuation code to figure out what to
  -- * do.
  -- *
  -- * All the routines below use bits of fixup code that are out of line
  -- * with the main instruction path.  This means when everything is well,
  -- * we don't even have to jump over them.  Further, they do not intrude
  -- * on our cache or tlb entries.
  --  

   type exception_table_entry is record
      insn : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:106
      fixup : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:106
   end record;
   pragma Convention (C_Pass_By_Copy, exception_table_entry);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:105

  -- This is not the generic standard exception_table_entry format  
   function fixup_exception (regs : access asm_ptrace_h.pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:112
   pragma Import (CPP, fixup_exception, "_Z15fixup_exceptionP7pt_regs");

   function early_fixup_exception (ip : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:113
   pragma Import (CPP, early_fixup_exception, "_Z21early_fixup_exceptionPm");

  -- * These are the main single-value transfer routines.  They automatically
  -- * use the right size if we just have the right pointer type.
  -- *
  -- * This gets kind of ugly. We want to return _two_ values in "get_user()"
  -- * and yet we don't want to do any pointers, because that is too much
  -- * of a performance impact. Thus we have a few rather ugly macros here,
  -- * and hide all the ugliness from the user.
  -- *
  -- * The "__xxx" versions of the user access functions are versions that
  -- * do not verify the address space, that must have been done previously
  -- * with a separate "access_ok()" call (this is used when we do multiple
  -- * accesses to the same area of user memory).
  --  

   --  skipped func __get_user_1

   --  skipped func __get_user_2

   --  skipped func __get_user_4

   --  skipped func __get_user_8

   --  skipped func __get_user_bad

  -- * This is a type: either unsigned long, if the argument fits into
  -- * that type, or otherwise unsigned long long.
  --  

  --*
  -- * get_user: - Get a simple variable from user space.
  -- * @x:   Variable to store result.
  -- * @ptr: Source address, in user space.
  -- *
  -- * Context: User context only.  This function may sleep.
  -- *
  -- * This macro copies a single simple variable from user space to kernel
  -- * space.  It supports simple types like char and int, but not larger
  -- * data types like structures or arrays.
  -- *
  -- * @ptr must have pointer-to-simple-variable type, and the result of
  -- * dereferencing @ptr must be assignable to @x without a cast.
  -- *
  -- * Returns zero on success, or -EFAULT on error.
  -- * On error, the variable @x is set to zero.
  --  

  -- * Careful: we have to cast the result to the type of the pointer
  -- * for sign reasons.
  -- *
  -- * The use of _ASM_DX as the register specifier is a bit of a
  -- * simplification, as gcc only cares about it as the starting point
  -- * and not size: for a 64-bit value it will use %ecx:%edx on 32 bits
  -- * (%ecx being the next register in gcc's x86 register sequence), and
  -- * %rdx on 64 bits.
  -- *
  -- * Clang/LLVM cares about the size of the register, but still wants
  -- * the base register for something that ends up being a pair.
  --  

   --  skipped func __put_user_bad

  -- * Strange magic calling convention: pointer in %ecx,
  -- * value in %eax(:%edx), return value in %eax. clobbers %rbx
  --  

   --  skipped func __put_user_1

   --  skipped func __put_user_2

   --  skipped func __put_user_4

   --  skipped func __put_user_8

  --*
  -- * put_user: - Write a simple value into user space.
  -- * @x:   Value to copy to user space.
  -- * @ptr: Destination address, in user space.
  -- *
  -- * Context: User context only.  This function may sleep.
  -- *
  -- * This macro copies a single simple value from kernel space to user
  -- * space.  It supports simple types like char and int, but not larger
  -- * data types like structures or arrays.
  -- *
  -- * @ptr must have pointer-to-simple-variable type, and @x must be assignable
  -- * to the result of dereferencing @ptr.
  -- *
  -- * Returns zero on success, or -EFAULT on error.
  --  

  -- FIXME: this hack is definitely wrong -AK  
   type uu_large_struct_buf_array is array (0 .. 99) of aliased unsigned_long;
   type uu_large_struct is record
      buf : aliased uu_large_struct_buf_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:414
   end record;
   pragma Convention (C_Pass_By_Copy, uu_large_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:414

  -- * Tell gcc we read from memory instead of writing: this is because
  -- * we do not write to any memory gcc knows about, so there are no
  -- * aliasing issues.
  --  

  -- * uaccess_try and catch
  --  

  --*
  -- * __get_user: - Get a simple variable from user space, with less checking.
  -- * @x:   Variable to store result.
  -- * @ptr: Source address, in user space.
  -- *
  -- * Context: User context only.  This function may sleep.
  -- *
  -- * This macro copies a single simple variable from user space to kernel
  -- * space.  It supports simple types like char and int, but not larger
  -- * data types like structures or arrays.
  -- *
  -- * @ptr must have pointer-to-simple-variable type, and the result of
  -- * dereferencing @ptr must be assignable to @x without a cast.
  -- *
  -- * Caller must check the pointer with access_ok() before calling this
  -- * function.
  -- *
  -- * Returns zero on success, or -EFAULT on error.
  -- * On error, the variable @x is set to zero.
  --  

  --*
  -- * __put_user: - Write a simple value into user space, with less checking.
  -- * @x:   Value to copy to user space.
  -- * @ptr: Destination address, in user space.
  -- *
  -- * Context: User context only.  This function may sleep.
  -- *
  -- * This macro copies a single simple value from kernel space to user
  -- * space.  It supports simple types like char and int, but not larger
  -- * data types like structures or arrays.
  -- *
  -- * @ptr must have pointer-to-simple-variable type, and @x must be assignable
  -- * to the result of dereferencing @ptr.
  -- *
  -- * Caller must check the pointer with access_ok() before calling this
  -- * function.
  -- *
  -- * Returns zero on success, or -EFAULT on error.
  --  

  -- * {get|put}_user_try and catch
  -- *
  -- * get_user_try {
  -- *	get_user_ex(...);
  -- * } get_user_catch(err)
  --  

   function copy_from_user_nmi
     (to : System.Address;
      from : System.Address;
      n : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:526
   pragma Import (CPP, copy_from_user_nmi, "_Z18copy_from_user_nmiPvPKvm");

   function strncpy_from_user
     (dst : Interfaces.C.Strings.chars_ptr;
      src : Interfaces.C.Strings.chars_ptr;
      count : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:528
   pragma Import (CPP, strncpy_from_user, "_Z17strncpy_from_userPcPKcl");

   function strlen_user (str : Interfaces.C.Strings.chars_ptr) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:530
   pragma Import (CPP, strlen_user, "_Z11strlen_userPKc");

   function strnlen_user (str : Interfaces.C.Strings.chars_ptr; n : long) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:531
   pragma Import (CPP, strnlen_user, "_Z12strnlen_userPKcl");

   function clear_user (mem : System.Address; len : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:533
   pragma Import (CPP, clear_user, "_Z10clear_userPvm");

   --  skipped func __clear_user

   --  skipped func __cmpxchg_wrong_size

  -- * movsl can be slow when source and dest are not both 8-byte aligned
  --  

   --  skipped func _copy_from_user

   --  skipped func _copy_to_user

   procedure copy_from_user_overflow;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:657
   pragma Import (CPP, copy_from_user_overflow, "_Z23copy_from_user_overflowv");

   procedure copy_to_user_overflow;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:659
   pragma Import (C, copy_to_user_overflow, "copy_from_user_overflow");

   --  skipped func __copy_from_user_overflow

   function copy_from_user
     (to : System.Address;
      from : System.Address;
      n : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:688
   pragma Import (CPP, copy_from_user, "_ZL14copy_from_userPvPKvm");

  --	 * While we would like to have the compiler do the checking for us
  --	 * even in the non-constant size case, any false positives there are
  --	 * a problem (especially when DEBUG_STRICT_USER_COPY_CHECKS, but even
  --	 * without - the [hopefully] dangerous looking nature of the warning
  --	 * would make people go look at the respecitive call sites over and
  --	 * over again just to find that there's no problem).
  --	 *
  --	 * And there are cases where it's just not realistic for the compiler
  --	 * to prove the count to be in range. For example when multiple call
  --	 * sites of a helper function - perhaps in different source files -
  --	 * all doing proper range checking, yet the helper function not doing
  --	 * so again.
  --	 *
  --	 * Therefore limit the compile time checking to the constant size
  --	 * case, and do only runtime checking for non-constant sizes.
  --	  

   function copy_to_user
     (to : System.Address;
      from : System.Address;
      n : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess.h:723
   pragma Import (CPP, copy_to_user, "_ZL12copy_to_userPvPKvm");

  -- See the comment in copy_from_user() above.  
end asm_uaccess_h;

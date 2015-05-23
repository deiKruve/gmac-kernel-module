pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with Interfaces.C.Strings;
with System;
with Interfaces.C.Extensions;
with linux_types_h;

package linux_kernel_h is

   --  unsupported macro: USHRT_MAX ((u16)(~0U))
   --  unsupported macro: SHRT_MAX ((s16)(USHRT_MAX>>1))
   --  unsupported macro: SHRT_MIN ((s16)(-SHRT_MAX - 1))
   --  unsupported macro: INT_MAX ((int)(~0U>>1))
   --  unsupported macro: INT_MIN (-INT_MAX - 1)
   --  unsupported macro: UINT_MAX (~0U)
   --  unsupported macro: LONG_MAX ((long)(~0UL>>1))
   --  unsupported macro: LONG_MIN (-LONG_MAX - 1)
   --  unsupported macro: ULONG_MAX (~0UL)
   --  unsupported macro: LLONG_MAX ((long long)(~0ULL>>1))
   --  unsupported macro: LLONG_MIN (-LLONG_MAX - 1)
   --  unsupported macro: ULLONG_MAX (~0ULL)
   --  unsupported macro: SIZE_MAX (~(size_t)0)
   --  unsupported macro: U8_MAX ((u8)~0U)
   --  unsupported macro: S8_MAX ((s8)(U8_MAX>>1))
   --  unsupported macro: S8_MIN ((s8)(-S8_MAX - 1))
   --  unsupported macro: U16_MAX ((u16)~0U)
   --  unsupported macro: S16_MAX ((s16)(U16_MAX>>1))
   --  unsupported macro: S16_MIN ((s16)(-S16_MAX - 1))
   --  unsupported macro: U32_MAX ((u32)~0U)
   --  unsupported macro: S32_MAX ((s32)(U32_MAX>>1))
   --  unsupported macro: S32_MIN ((s32)(-S32_MAX - 1))
   --  unsupported macro: U64_MAX ((u64)~0ULL)
   --  unsupported macro: S64_MAX ((s64)(U64_MAX>>1))
   --  unsupported macro: S64_MIN ((s64)(-S64_MAX - 1))
   --  unsupported macro: STACK_MAGIC 0xdeadbeef
   --  arg-macro: function REPEAT_BYTE ((~0ul / 0xff) * (x)
   --    return (~0ul / 0xff) * (x);
   --  arg-macro: procedure ALIGN __ALIGN_KERNEL((x), (a))
   --    __ALIGN_KERNEL((x), (a))
   --  arg-macro: function PTR_ALIGN ((typeof(p))ALIGN((unsigned long)(p), (a))
   --    return (typeof(p))ALIGN((unsigned long)(p), (a));
   --  arg-macro: function IS_ALIGNED (((x) and ((typeof(x))(a) - 1)) = 0
   --    return ((x) and ((typeof(x))(a) - 1)) = 0;
   --  arg-macro: function ARRAY_SIZE (sizeof(arr) / sizeof((arr)(0)) + __must_be_array(arr)
   --    return sizeof(arr) / sizeof((arr)(0)) + __must_be_array(arr);
   --  arg-macro: function round_up ((((x)-1) or __round_mask(x, y))+1
   --    return (((x)-1) or __round_mask(x, y))+1;
   --  arg-macro: function round_down ((x) and ~__round_mask(x, y)
   --    return (x) and ~__round_mask(x, y);
   --  arg-macro: function FIELD_SIZEOF (sizeof(((t*)0).f)
   --    return sizeof(((t*)0).f);
   --  arg-macro: function DIV_ROUND_UP (((n) + (d) - 1) / (d)
   --    return ((n) + (d) - 1) / (d);
   --  arg-macro: function DIV_ROUND_UP_ULL ({ unsigned long long _tmp := (ll)+(d)-1; do_div(_tmp, d); _tmp; }
   --    return { unsigned long long _tmp := (ll)+(d)-1; do_div(_tmp, d); _tmp; };
   --  arg-macro: procedure DIV_ROUND_UP_SECTOR_T DIV_ROUND_UP(ll,d)
   --    DIV_ROUND_UP(ll,d)
   --  arg-macro: function roundup ( { const typeof(y) __y := y; (((x) + (__y - 1)) / __y) * __y; } 
   --    return  { const typeof(y) __y := y; (((x) + (__y - 1)) / __y) * __y; } ;
   --  arg-macro: function rounddown ( { typeof(x) __x := (x); __x - (__x mod (y)); } 
   --    return  { typeof(x) __x := (x); __x - (__x mod (y)); } ;
   --  arg-macro: function DIV_ROUND_CLOSEST ( { typeof(x) __x := x; typeof(divisor) __d := divisor; (((typeof(x))-1) > 0  or else  ((typeof(divisor))-1) > 0  or else  (__x) > 0) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d)); } 
   --    return  { typeof(x) __x := x; typeof(divisor) __d := divisor; (((typeof(x))-1) > 0  or else  ((typeof(divisor))-1) > 0  or else  (__x) > 0) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d)); } ;
   --  arg-macro: function mult_frac ( { typeof(x) quot := (x) / (denom); typeof(x) rem := (x) mod (denom); (quot * (numer)) + ((rem * (numer)) / (denom)); } 
   --    return  { typeof(x) quot := (x) / (denom); typeof(x) rem := (x) mod (denom); (quot * (numer)) + ((rem * (numer)) / (denom)); } ;
   --  arg-macro: function sector_div ( { int _res; _res := (n) mod (b); (n) /= (b); _res; } 
   --    return  { int _res; _res := (n) mod (b); (n) /= (b); _res; } ;
   --  arg-macro: function upper_32_bits ((u32)(((n) >> 16) >> 16)
   --    return (u32)(((n) >> 16) >> 16);
   --  arg-macro: function lower_32_bits ((u32)(n)
   --    return (u32)(n);
   --  arg-macro: procedure might_resched _cond_resched()
   --    _cond_resched()
   --  arg-macro: procedure might_sleep do { might_resched(); } while (0)
   --    do { might_resched(); } while (0)
   --  arg-macro: procedure might_sleep_if do { if (cond) might_sleep(); } while (0)
   --    do { if (cond) might_sleep(); } while (0)
   --  arg-macro: function abs ({ long ret; if (sizeof(x) = sizeof(long)) { long __x := (x); ret := (__x < 0) ? -__x : __x; } else { int __x := (x); ret := (__x < 0) ? -__x : __x; } ret; }
   --    return { long ret; if (sizeof(x) = sizeof(long)) { long __x := (x); ret := (__x < 0) ? -__x : __x; } else { int __x := (x); ret := (__x < 0) ? -__x : __x; } ret; };
   --  arg-macro: function abs64 ({ s64 __x := (x); (__x < 0) ? -__x : __x; }
   --    return { s64 __x := (x); (__x < 0) ? -__x : __x; };
   --  unsupported macro: strict_strtoul kstrtoul
   --  unsupported macro: strict_strtol kstrtol
   --  unsupported macro: strict_strtoull kstrtoull
   --  unsupported macro: strict_strtoll kstrtoll
   --  unsupported macro: TAINT_PROPRIETARY_MODULE 0
   --  unsupported macro: TAINT_FORCED_MODULE 1
   --  unsupported macro: TAINT_CPU_OUT_OF_SPEC 2
   --  unsupported macro: TAINT_FORCED_RMMOD 3
   --  unsupported macro: TAINT_MACHINE_CHECK 4
   --  unsupported macro: TAINT_BAD_PAGE 5
   --  unsupported macro: TAINT_USER 6
   --  unsupported macro: TAINT_DIE 7
   --  unsupported macro: TAINT_OVERRIDDEN_ACPI_TABLE 8
   --  unsupported macro: TAINT_WARN 9
   --  unsupported macro: TAINT_CRAP 10
   --  unsupported macro: TAINT_FIRMWARE_WORKAROUND 11
   --  unsupported macro: TAINT_OOT_MODULE 12
   --  unsupported macro: TAINT_UNSIGNED_MODULE 13
   --  arg-macro: procedure hex_asc_lo hex_asc(((x) and 0x0f))
   --    hex_asc(((x) and 0x0f))
   --  arg-macro: procedure hex_asc_hi hex_asc(((x) and 0xf0) >> 4)
   --    hex_asc(((x) and 0xf0) >> 4)
   --  arg-macro: procedure hex_asc_upper_lo hex_asc_upper(((x) and 0x0f))
   --    hex_asc_upper(((x) and 0x0f))
   --  arg-macro: procedure hex_asc_upper_hi hex_asc_upper(((x) and 0xf0) >> 4)
   --    hex_asc_upper(((x) and 0xf0) >> 4)
   --  unsupported macro: trace_printk(fmt,...) do { char _______STR[] = __stringify((__VA_ARGS__)); if (sizeof(_______STR) > 3) do_trace_printk(fmt, ##__VA_ARGS__); else trace_puts(fmt); } while (0)
   --  unsupported macro: do_trace_printk(fmt,args...) do { static const char *trace_printk_fmt __attribute__((section("__trace_printk_fmt"))) = __builtin_constant_p(fmt) ? fmt : NULL; __trace_printk_check_format(fmt, ##args); if (__builtin_constant_p(fmt)) __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args); else __trace_printk(_THIS_IP_, fmt, ##args); } while (0)
   --  arg-macro: function trace_puts ({ static const char *trace_printk_fmt __attribute__((section("__trace_printk_fmt"))) := __builtin_constant_p(str) ? str : NULL; if (__builtin_constant_p(str)) __trace_bputs(_THIS_IP_, trace_printk_fmt); else __trace_puts(_THIS_IP_, str, strlen(str)); }
   --    return { static const char *trace_printk_fmt __attribute__((section("__trace_printk_fmt"))) := __builtin_constant_p(str) ? str : NULL; if (__builtin_constant_p(str)) __trace_bputs(_THIS_IP_, trace_printk_fmt); else __trace_puts(_THIS_IP_, str, strlen(str)); };
   --  arg-macro: procedure ftrace_vprintk do { if (__builtin_constant_p(fmt)) { static const char *trace_printk_fmt __attribute__((section("__trace_printk_fmt"))) := __builtin_constant_p(fmt) ? fmt : NULL; __ftrace_vbprintk(_THIS_IP_, trace_printk_fmt, vargs); } else __ftrace_vprintk(_THIS_IP_, fmt, vargs); } while (0)
   --    do { if (__builtin_constant_p(fmt)) { static const char *trace_printk_fmt __attribute__((section("__trace_printk_fmt"))) := __builtin_constant_p(fmt) ? fmt : NULL; __ftrace_vbprintk(_THIS_IP_, trace_printk_fmt, vargs); } else __ftrace_vprintk(_THIS_IP_, fmt, vargs); } while (0)
   --  arg-macro: function min ({ typeof(x) _min1 := (x); typeof(y) _min2 := (y); (void) (and_min1 = and_min2); _min1 < _min2 ? _min1 : _min2; }
   --    return { typeof(x) _min1 := (x); typeof(y) _min2 := (y); (void) (and_min1 = and_min2); _min1 < _min2 ? _min1 : _min2; };
   --  arg-macro: function max ({ typeof(x) _max1 := (x); typeof(y) _max2 := (y); (void) (and_max1 = and_max2); _max1 > _max2 ? _max1 : _max2; }
   --    return { typeof(x) _max1 := (x); typeof(y) _max2 := (y); (void) (and_max1 = and_max2); _max1 > _max2 ? _max1 : _max2; };
   --  arg-macro: function min3 ({ typeof(x) _min1 := (x); typeof(y) _min2 := (y); typeof(z) _min3 := (z); (void) (and_min1 = and_min2); (void) (and_min1 = and_min3); _min1 < _min2 ? (_min1 < _min3 ? _min1 : _min3) : (_min2 < _min3 ? _min2 : _min3); }
   --    return { typeof(x) _min1 := (x); typeof(y) _min2 := (y); typeof(z) _min3 := (z); (void) (and_min1 = and_min2); (void) (and_min1 = and_min3); _min1 < _min2 ? (_min1 < _min3 ? _min1 : _min3) : (_min2 < _min3 ? _min2 : _min3); };
   --  arg-macro: function max3 ({ typeof(x) _max1 := (x); typeof(y) _max2 := (y); typeof(z) _max3 := (z); (void) (and_max1 = and_max2); (void) (and_max1 = and_max3); _max1 > _max2 ? (_max1 > _max3 ? _max1 : _max3) : (_max2 > _max3 ? _max2 : _max3); }
   --    return { typeof(x) _max1 := (x); typeof(y) _max2 := (y); typeof(z) _max3 := (z); (void) (and_max1 = and_max2); (void) (and_max1 = and_max3); _max1 > _max2 ? (_max1 > _max3 ? _max1 : _max3) : (_max2 > _max3 ? _max2 : _max3); };
   --  arg-macro: function min_not_zero ({ typeof(x) __x := (x); typeof(y) __y := (y); __x = 0 ? __y : ((__y = 0) ? __x : min(__x, __y)); }
   --    return { typeof(x) __x := (x); typeof(y) __y := (y); __x = 0 ? __y : ((__y = 0) ? __x : min(__x, __y)); };
   --  arg-macro: function clamp ({ typeof(val) __val := (val); typeof(min) __min := (min); typeof(max) __max := (max); (void) (and__val = and__min); (void) (and__val = and__max); __val := __val < __min ? __min: __val; __val > __max ? __max: __val; }
   --    return { typeof(val) __val := (val); typeof(min) __min := (min); typeof(max) __max := (max); (void) (and__val = and__min); (void) (and__val = and__max); __val := __val < __min ? __min: __val; __val > __max ? __max: __val; };
   --  arg-macro: function min_t ({ type __min1 := (x); type __min2 := (y); __min1 < __min2 ? __min1: __min2; }
   --    return { type __min1 := (x); type __min2 := (y); __min1 < __min2 ? __min1: __min2; };
   --  arg-macro: function max_t ({ type __max1 := (x); type __max2 := (y); __max1 > __max2 ? __max1: __max2; }
   --    return { type __max1 := (x); type __max2 := (y); __max1 > __max2 ? __max1: __max2; };
   --  arg-macro: function clamp_t ({ type __val := (val); type __min := (min); type __max := (max); __val := __val < __min ? __min: __val; __val > __max ? __max: __val; }
   --    return { type __val := (val); type __min := (min); type __max := (max); __val := __val < __min ? __min: __val; __val > __max ? __max: __val; };
   --  arg-macro: function clamp_val ({ typeof(val) __val := (val); typeof(val) __min := (min); typeof(val) __max := (max); __val := __val < __min ? __min: __val; __val > __max ? __max: __val; }
   --    return { typeof(val) __val := (val); typeof(val) __min := (min); typeof(val) __max := (max); __val := __val < __min ? __min: __val; __val > __max ? __max: __val; };
   --  arg-macro: procedure swap do { typeof(a) __tmp := (a); (a) := (b); (b) := __tmp; } while (0)
   --    do { typeof(a) __tmp := (a); (a) := (b); (b) := __tmp; } while (0)
   --  arg-macro: function container_of ({ const typeof( ((type *)0).member ) *__mptr := (ptr); (type *)( (char *)__mptr - offsetof(type,member) );}
   --    return { const typeof( ((type *)0).member ) *__mptr := (ptr); (type *)( (char *)__mptr - offsetof(type,member) );};
   --  arg-macro: function VERIFY_OCTAL_PERMISSIONS (BUILD_BUG_ON_ZERO((perms) < 0) + BUILD_BUG_ON_ZERO((perms) > 0777) + BUILD_BUG_ON_ZERO(((perms) >> 6) < (((perms) >> 3) and 7)) + BUILD_BUG_ON_ZERO((((perms) >> 3) and 7) < ((perms) and 7)) + (perms)
   --    return BUILD_BUG_ON_ZERO((perms) < 0) + BUILD_BUG_ON_ZERO((perms) > 0777) + BUILD_BUG_ON_ZERO(((perms) >> 6) < (((perms) >> 3) and 7)) + BUILD_BUG_ON_ZERO((((perms) >> 3) and 7) < ((perms) and 7)) + (perms);
  -- * This looks more complex than it should be. But we need to
  -- * get the type for the ~ right in round_down (it needs to be
  -- * as wide as the result!), and we want to evaluate the macro
  -- * arguments just once each.
  --  

  -- The `const' in roundup() prevents gcc-3.3 from calling __divdi3  
  -- * Divide positive or negative dividend by positive divisor and round
  -- * to closest integer. Result is undefined for negative divisors and
  -- * for negative dividends if the divisor variable type is unsigned.
  --  

  -- * Multiplies an integer by a fraction, while avoiding unnecessary
  -- * overflow or loss of precision.
  --  

  --*
  -- * upper_32_bits - return bits 32-63 of a number
  -- * @n: the number we're accessing
  -- *
  -- * A basic shift-right of a 64- or 32-bit quantity.  Use this to suppress
  -- * the "right shift count >= width of type" warning when that quantity is
  -- * 32-bits.
  --  

  --*
  -- * lower_32_bits - return bits 0-31 of a number
  -- * @n: the number we're accessing
  --  

   --  skipped empty struct completion

   --  skipped empty struct user

   --  skipped func _cond_resched

  --*
  -- * might_sleep - annotation for functions that can sleep
  -- *
  -- * this macro will print a stack trace if it is executed in an atomic
  -- * context (spinlock, irq-handler, ...).
  -- *
  -- * This is a useful debugging help to be able to catch problems early and not
  -- * be bitten later when the calling function happens to sleep when it is not
  -- * supposed to.
  --  

   --  skipped func __might_sleep

  -- * abs() handles unsigned and signed longs, ints, shorts and chars.  For all
  -- * input types abs() returns a signed long.
  -- * abs() should not be used for 64-bit types (s64, u64, long long) - use abs64()
  -- * for those.
  --  

  --*
  -- * reciprocal_scale - "scale" a value into range [0, ep_ro)
  -- * @val: value
  -- * @ep_ro: right open interval endpoint
  -- *
  -- * Perform a "reciprocal multiplication" in order to "scale" a value into
  -- * range [0, ep_ro), where the upper interval endpoint is right-open.
  -- * This is useful, e.g. for accessing a index of an array containing
  -- * ep_ro elements, for example. Think of it as sort of modulus, only that
  -- * the result isn't that of modulo. ;) Note that if initial input is a
  -- * small value, then result will return 0.
  -- *
  -- * Return: a result based on val in interval [0, ep_ro).
  --  

   function reciprocal_scale (val : asm_generic_int_ll64_h.u32; ep_ro : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:223
   pragma Import (CPP, reciprocal_scale, "_ZL16reciprocal_scalejj");

   procedure might_fault;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:232
   pragma Import (CPP, might_fault, "_ZL11might_faultv");

   --  skipped empty struct atomic_notifier_head

   panic_notifier_list : aliased atomic_notifier_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:235
   pragma Import (C, panic_notifier_list, "panic_notifier_list");

   panic_blink : access function (arg1 : int) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:236
   pragma Import (C, panic_blink, "panic_blink");

   procedure panic (fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      );  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:238
   pragma Import (CPP, panic, "_Z5panicPKcz");

   procedure oops_enter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:240
   pragma Import (CPP, oops_enter, "_Z10oops_enterv");

   procedure oops_exit;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:241
   pragma Import (CPP, oops_exit, "_Z9oops_exitv");

   procedure print_oops_end_marker;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:242
   pragma Import (CPP, print_oops_end_marker, "_Z21print_oops_end_markerv");

   function oops_may_print return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:243
   pragma Import (CPP, oops_may_print, "_Z14oops_may_printv");

   procedure do_exit (error_code : long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:244
   pragma Import (CPP, do_exit, "_Z7do_exitl");

   procedure complete_and_exit (arg1 : System.Address; arg2 : long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:246
   pragma Import (CPP, complete_and_exit, "_Z17complete_and_exitP10completionl");

  -- Internal, do not use.  
   --  skipped func _kstrtoul

   --  skipped func _kstrtol

   function kstrtoull
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access Extensions.unsigned_long_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:253
   pragma Import (CPP, kstrtoull, "_Z9kstrtoullPKcjPy");

   function kstrtoll
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access Long_Long_Integer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:254
   pragma Import (CPP, kstrtoll, "_Z8kstrtollPKcjPx");

  --*
  -- * kstrtoul - convert a string to an unsigned long
  -- * @s: The start of the string. The string must be null-terminated, and may also
  -- *  include a single newline before its terminating null. The first character
  -- *  may also be a plus sign, but not a minus sign.
  -- * @base: The number base to use. The maximum supported base is 16. If base is
  -- *  given as 0, then the base of the string is automatically detected with the
  -- *  conventional semantics - If it begins with 0x the number will be parsed as a
  -- *  hexadecimal (case insensitive), if it otherwise begins with 0, it will be
  -- *  parsed as an octal number. Otherwise it will be parsed as a decimal.
  -- * @res: Where to write the result of the conversion on success.
  -- *
  -- * Returns 0 on success, -ERANGE on overflow and -EINVAL on parsing error.
  -- * Used as a replacement for the obsolete simple_strtoull. Return code must
  -- * be checked.
  -- 

   function kstrtoul
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:272
   pragma Import (CPP, kstrtoul, "_ZL8kstrtoulPKcjPm");

  --	 * We want to shortcut function call, but
  --	 * __builtin_types_compatible_p(unsigned long, unsigned long long) = 0.
  --	  

  --*
  -- * kstrtol - convert a string to a long
  -- * @s: The start of the string. The string must be null-terminated, and may also
  -- *  include a single newline before its terminating null. The first character
  -- *  may also be a plus sign or a minus sign.
  -- * @base: The number base to use. The maximum supported base is 16. If base is
  -- *  given as 0, then the base of the string is automatically detected with the
  -- *  conventional semantics - If it begins with 0x the number will be parsed as a
  -- *  hexadecimal (case insensitive), if it otherwise begins with 0, it will be
  -- *  parsed as an octal number. Otherwise it will be parsed as a decimal.
  -- * @res: Where to write the result of the conversion on success.
  -- *
  -- * Returns 0 on success, -ERANGE on overflow and -EINVAL on parsing error.
  -- * Used as a replacement for the obsolete simple_strtoull. Return code must
  -- * be checked.
  --  

   function kstrtol
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:301
   pragma Import (CPP, kstrtol, "_ZL7kstrtolPKcjPl");

  --	 * We want to shortcut function call, but
  --	 * __builtin_types_compatible_p(long, long long) = 0.
  --	  

   function kstrtouint
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:314
   pragma Import (CPP, kstrtouint, "_Z10kstrtouintPKcjPj");

   function kstrtoint
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:315
   pragma Import (CPP, kstrtoint, "_Z9kstrtointPKcjPi");

   function kstrtou64
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:317
   pragma Import (CPP, kstrtou64, "_ZL9kstrtou64PKcjPy");

   function kstrtos64
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access asm_generic_int_ll64_h.s64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:322
   pragma Import (CPP, kstrtos64, "_ZL9kstrtos64PKcjPx");

   function kstrtou32
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:327
   pragma Import (CPP, kstrtou32, "_ZL9kstrtou32PKcjPj");

   function kstrtos32
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access asm_generic_int_ll64_h.s32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:332
   pragma Import (CPP, kstrtos32, "_ZL9kstrtos32PKcjPi");

   function kstrtou16
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access asm_generic_int_ll64_h.u16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:337
   pragma Import (CPP, kstrtou16, "_Z9kstrtou16PKcjPt");

   function kstrtos16
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access asm_generic_int_ll64_h.s16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:338
   pragma Import (CPP, kstrtos16, "_Z9kstrtos16PKcjPs");

   function kstrtou8
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:339
   pragma Import (CPP, kstrtou8, "_Z8kstrtou8PKcjPh");

   function kstrtos8
     (s : Interfaces.C.Strings.chars_ptr;
      base : unsigned;
      res : access asm_generic_int_ll64_h.s8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:340
   pragma Import (CPP, kstrtos8, "_Z8kstrtos8PKcjPa");

   function kstrtoull_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access Extensions.unsigned_long_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:342
   pragma Import (CPP, kstrtoull_from_user, "_Z19kstrtoull_from_userPKcmjPy");

   function kstrtoll_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access Long_Long_Integer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:343
   pragma Import (CPP, kstrtoll_from_user, "_Z18kstrtoll_from_userPKcmjPx");

   function kstrtoul_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:344
   pragma Import (CPP, kstrtoul_from_user, "_Z18kstrtoul_from_userPKcmjPm");

   function kstrtol_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:345
   pragma Import (CPP, kstrtol_from_user, "_Z17kstrtol_from_userPKcmjPl");

   function kstrtouint_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:346
   pragma Import (CPP, kstrtouint_from_user, "_Z20kstrtouint_from_userPKcmjPj");

   function kstrtoint_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:347
   pragma Import (CPP, kstrtoint_from_user, "_Z19kstrtoint_from_userPKcmjPi");

   function kstrtou16_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access asm_generic_int_ll64_h.u16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:348
   pragma Import (CPP, kstrtou16_from_user, "_Z19kstrtou16_from_userPKcmjPt");

   function kstrtos16_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access asm_generic_int_ll64_h.s16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:349
   pragma Import (CPP, kstrtos16_from_user, "_Z19kstrtos16_from_userPKcmjPs");

   function kstrtou8_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:350
   pragma Import (CPP, kstrtou8_from_user, "_Z18kstrtou8_from_userPKcmjPh");

   function kstrtos8_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access asm_generic_int_ll64_h.s8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:351
   pragma Import (CPP, kstrtos8_from_user, "_Z18kstrtos8_from_userPKcmjPa");

   function kstrtou64_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:353
   pragma Import (CPP, kstrtou64_from_user, "_ZL19kstrtou64_from_userPKcmjPy");

   function kstrtos64_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access asm_generic_int_ll64_h.s64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:358
   pragma Import (CPP, kstrtos64_from_user, "_ZL19kstrtos64_from_userPKcmjPx");

   function kstrtou32_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:363
   pragma Import (CPP, kstrtou32_from_user, "_ZL19kstrtou32_from_userPKcmjPj");

   function kstrtos32_from_user
     (s : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t;
      base : unsigned;
      res : access asm_generic_int_ll64_h.s32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:368
   pragma Import (CPP, kstrtos32_from_user, "_ZL19kstrtos32_from_userPKcmjPi");

  -- Obsolete, do not use.  Use kstrto<foo> instead  
   function simple_strtoul
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:375
   pragma Import (CPP, simple_strtoul, "_Z14simple_strtoulPKcPPcj");

   function simple_strtol
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : unsigned) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:376
   pragma Import (CPP, simple_strtol, "_Z13simple_strtolPKcPPcj");

   function simple_strtoull
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : unsigned) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:377
   pragma Import (CPP, simple_strtoull, "_Z15simple_strtoullPKcPPcj");

   function simple_strtoll
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : unsigned) return Long_Long_Integer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:378
   pragma Import (CPP, simple_strtoll, "_Z14simple_strtollPKcPPcj");

   function num_to_str
     (buf : Interfaces.C.Strings.chars_ptr;
      size : int;
      num : Extensions.unsigned_long_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:384
   pragma Import (CPP, num_to_str, "_Z10num_to_strPciy");

  -- lib/printf utilities  
   function sprintf (buf : Interfaces.C.Strings.chars_ptr; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:388
   pragma Import (CPP, sprintf, "_Z7sprintfPcPKcz");

   function vsprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:389
   pragma Import (CPP, vsprintf, "_Z8vsprintfPcPKcP13__va_list_tag");

   function snprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      size : linux_types_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:391
   pragma Import (CPP, snprintf, "_Z8snprintfPcmPKcz");

   function vsnprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      size : linux_types_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr;
      args : access System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:393
   pragma Import (CPP, vsnprintf, "_Z9vsnprintfPcmPKcP13__va_list_tag");

   function scnprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      size : linux_types_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:395
   pragma Import (CPP, scnprintf, "_Z9scnprintfPcmPKcz");

   function vscnprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      size : linux_types_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr;
      args : access System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:397
   pragma Import (CPP, vscnprintf, "_Z10vscnprintfPcmPKcP13__va_list_tag");

   function kasprintf (gfp : linux_types_h.gfp_t; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:399
   pragma Import (CPP, kasprintf, "_Z9kasprintfjPKcz");

   function kvasprintf
     (gfp : linux_types_h.gfp_t;
      fmt : Interfaces.C.Strings.chars_ptr;
      args : access System.Address) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:400
   pragma Import (CPP, kvasprintf, "_Z10kvasprintfjPKcP13__va_list_tag");

   function sscanf (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:403
   pragma Import (CPP, sscanf, "_Z6sscanfPKcS0_z");

   function vsscanf
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:405
   pragma Import (CPP, vsscanf, "_Z7vsscanfPKcS0_P13__va_list_tag");

   function get_option (str : System.Address; pint : access int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:407
   pragma Import (CPP, get_option, "_Z10get_optionPPcPi");

   function get_options
     (str : Interfaces.C.Strings.chars_ptr;
      nints : int;
      ints : access int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:408
   pragma Import (CPP, get_options, "_Z11get_optionsPKciPi");

   function memparse (ptr : Interfaces.C.Strings.chars_ptr; retptr : System.Address) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:409
   pragma Import (CPP, memparse, "_Z8memparsePKcPPc");

   function core_kernel_text (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:411
   pragma Import (CPP, core_kernel_text, "_Z16core_kernel_textm");

   function core_kernel_data (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:412
   pragma Import (CPP, core_kernel_data, "_Z16core_kernel_datam");

   --  skipped func __kernel_text_address

   function kernel_text_address (addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:414
   pragma Import (CPP, kernel_text_address, "_Z19kernel_text_addressm");

   function func_ptr_is_kernel_text (ptr : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:415
   pragma Import (CPP, func_ptr_is_kernel_text, "_Z23func_ptr_is_kernel_textPv");

   --  skipped empty struct pid

   function session_of_pgrp (pgrp : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:418
   pragma Import (CPP, session_of_pgrp, "_Z15session_of_pgrpP3pid");

   function int_sqrt (arg1 : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:420
   pragma Import (CPP, int_sqrt, "_Z8int_sqrtm");

   procedure bust_spinlocks (yes : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:422
   pragma Import (CPP, bust_spinlocks, "_Z14bust_spinlocksi");

  -- If set, an oops, panic(), BUG() or die() is in progress  
   oops_in_progress : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:423
   pragma Import (C, oops_in_progress, "oops_in_progress");

   panic_timeout : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:424
   pragma Import (C, panic_timeout, "panic_timeout");

   panic_on_oops : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:425
   pragma Import (C, panic_on_oops, "panic_on_oops");

   panic_on_unrecovered_nmi : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:426
   pragma Import (C, panic_on_unrecovered_nmi, "panic_on_unrecovered_nmi");

   panic_on_io_nmi : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:427
   pragma Import (C, panic_on_io_nmi, "panic_on_io_nmi");

   sysctl_panic_on_stackoverflow : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:428
   pragma Import (C, sysctl_panic_on_stackoverflow, "sysctl_panic_on_stackoverflow");

  -- * Only to be used by arch init code. If the user over-wrote the default
  -- * CONFIG_PANIC_TIMEOUT, honor it.
  --  

   procedure set_arch_panic_timeout (timeout : int; arch_default_timeout : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:433
   pragma Import (CPP, set_arch_panic_timeout, "_ZL22set_arch_panic_timeoutii");

   function print_tainted return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:438
   pragma Import (CPP, print_tainted, "_Z13print_taintedv");

   type lockdep_ok is 
     (LOCKDEP_STILL_OK,
      LOCKDEP_NOW_UNRELIABLE);
   pragma Convention (C, lockdep_ok);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:439

   procedure add_taint (flag : unsigned; arg2 : lockdep_ok);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:443
   pragma Import (CPP, add_taint, "_Z9add_taintj10lockdep_ok");

   function test_taint (flag : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:444
   pragma Import (CPP, test_taint, "_Z10test_taintj");

   function get_taint return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:445
   pragma Import (CPP, get_taint, "_Z9get_taintv");

   root_mountflags : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:446
   pragma Import (C, root_mountflags, "root_mountflags");

   early_boot_irqs_disabled : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:448
   pragma Import (C, early_boot_irqs_disabled, "early_boot_irqs_disabled");

  -- Values used for system_state  
   type system_states is 
     (SYSTEM_BOOTING,
      SYSTEM_RUNNING,
      SYSTEM_HALT,
      SYSTEM_POWER_OFF,
      SYSTEM_RESTART);
   pragma Convention (C, system_states);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:451

   system_state : aliased system_states;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:457
   pragma Import (C, system_state, "system_state");

   hex_asc : aliased Interfaces.C.char_array (size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:474
   pragma Import (C, hex_asc, "hex_asc");

   function hex_byte_pack (buf : Interfaces.C.Strings.chars_ptr; byte : asm_generic_int_ll64_h.u8) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:478
   pragma Import (CPP, hex_byte_pack, "_ZL13hex_byte_packPch");

   hex_asc_upper : aliased Interfaces.C.char_array (size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:485
   pragma Import (C, hex_asc_upper, "hex_asc_upper");

   function hex_byte_pack_upper (buf : Interfaces.C.Strings.chars_ptr; byte : asm_generic_int_ll64_h.u8) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:489
   pragma Import (CPP, hex_byte_pack_upper, "_ZL19hex_byte_pack_upperPch");

   function pack_hex_byte (buf : Interfaces.C.Strings.chars_ptr; byte : asm_generic_int_ll64_h.u8) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:496
   pragma Import (CPP, pack_hex_byte, "_ZL13pack_hex_bytePch");

   function hex_to_bin (ch : char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:501
   pragma Import (CPP, hex_to_bin, "_Z10hex_to_binc");

   function hex2bin
     (dst : access asm_generic_int_ll64_h.u8;
      src : Interfaces.C.Strings.chars_ptr;
      count : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:502
   pragma Import (CPP, hex2bin, "_Z7hex2binPhPKcm");

   function mac_pton (s : Interfaces.C.Strings.chars_ptr; mac : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:504
   pragma Import (CPP, mac_pton, "_Z8mac_ptonPKcPh");

  -- * General tracing related utility functions - trace_printk(),
  -- * tracing_on/tracing_off and tracing_start()/tracing_stop
  -- *
  -- * Use tracing_on/tracing_off when you want to quickly turn on or off
  -- * tracing. It simply enables or disables the recording of the trace events.
  -- * This also corresponds to the user space /sys/kernel/debug/tracing/tracing_on
  -- * file, which gives a means for the kernel and userspace to interact.
  -- * Place a tracing_off() in the kernel where you want tracing to end.
  -- * From user space, examine the trace, and then echo 1 > tracing_on
  -- * to continue tracing.
  -- *
  -- * tracing_stop/tracing_start has slightly more overhead. It is used
  -- * by things like suspend to ram where disabling the recording of the
  -- * trace is not enough, but tracing must actually stop because things
  -- * like calling smp_processor_id() may crash the system.
  -- *
  -- * Most likely, you want to use tracing_on/tracing_off.
  --  

  -- trace_off_permanent stops recording with no way to bring it back  
   procedure tracing_off_permanent;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:527
   pragma Import (CPP, tracing_off_permanent, "_Z21tracing_off_permanentv");

   type ftrace_dump_mode is 
     (DUMP_NONE,
      DUMP_ALL,
      DUMP_ORIG);
   pragma Convention (C, ftrace_dump_mode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:532

   procedure tracing_on;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:539
   pragma Import (CPP, tracing_on, "_Z10tracing_onv");

   procedure tracing_off;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:540
   pragma Import (CPP, tracing_off, "_Z11tracing_offv");

   function tracing_is_on return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:541
   pragma Import (CPP, tracing_is_on, "_Z13tracing_is_onv");

   procedure tracing_snapshot;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:542
   pragma Import (CPP, tracing_snapshot, "_Z16tracing_snapshotv");

   procedure tracing_snapshot_alloc;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:543
   pragma Import (CPP, tracing_snapshot_alloc, "_Z22tracing_snapshot_allocv");

   procedure tracing_start;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:545
   pragma Import (CPP, tracing_start, "_Z13tracing_startv");

   procedure tracing_stop;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:546
   pragma Import (CPP, tracing_stop, "_Z12tracing_stopv");

   --  skipped func ____trace_printk_check_format

  --*
  -- * trace_printk - printf formatting in the ftrace buffer
  -- * @fmt: the printf format for printing
  -- *
  -- * Note: __trace_printk is an internal function for trace_printk and
  -- *       the @ip is passed in via the trace_printk macro.
  -- *
  -- * This function allows a kernel developer to debug fast path sections
  -- * that printk is not appropriate for. By scattering in various
  -- * printk like tracing in the code, a developer can quickly see
  -- * where problems are occurring.
  -- *
  -- * This is intended as a debugging tool for the developer only.
  -- * Please refrain from leaving trace_printks scattered around in
  -- * your code. (Extra memory is used for special buffers that are
  -- * allocated when trace_printk() is used)
  -- *
  -- * A little optization trick is done here. If there's only one
  -- * argument, there's no need to scan the string for printf formats.
  -- * The trace_puts() will suffice. But how can we take advantage of
  -- * using trace_puts() when trace_printk() has only one argument?
  -- * By stringifying the args and checking the size we can tell
  -- * whether or not there are args. __stringify((__VA_ARGS__)) will
  -- * turn into "()\0" with a size of 3 when there are no args, anything
  -- * else will be bigger. All we need to do is define a string to this,
  -- * and then take its size and compare to 3. If it's bigger, use
  -- * do_trace_printk() otherwise, optimize it to trace_puts(). Then just
  -- * let gcc optimize the rest.
  --  

   --  skipped func __trace_bprintk

   --  skipped func __trace_printk

  --*
  -- * trace_puts - write a string into the ftrace buffer
  -- * @str: the string to record
  -- *
  -- * Note: __trace_bputs is an internal function for trace_puts and
  -- *       the @ip is passed in via the trace_puts macro.
  -- *
  -- * This is similar to trace_printk() but is made for those really fast
  -- * paths that a developer wants the least amount of "Heisenbug" affects,
  -- * where the processing of the print format is still too much.
  -- *
  -- * This function allows a kernel developer to debug fast path sections
  -- * that printk is not appropriate for. By scattering in various
  -- * printk like tracing in the code, a developer can quickly see
  -- * where problems are occurring.
  -- *
  -- * This is intended as a debugging tool for the developer only.
  -- * Please refrain from leaving trace_puts scattered around in
  -- * your code. (Extra memory is used for special buffers that are
  -- * allocated when trace_puts() is used)
  -- *
  -- * Returns: 0 if nothing was written, positive # if string was.
  -- *  (1 when __trace_bputs is used, strlen(str) when __trace_puts is used)
  --  

   --  skipped func __trace_bputs

   --  skipped func __trace_puts

   procedure trace_dump_stack (skip : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:655
   pragma Import (CPP, trace_dump_stack, "_Z16trace_dump_stacki");

  -- * The double __builtin_constant_p is because gcc will give us an error
  -- * if we try to allocate the static variable to fmt if it is not a
  -- * constant. Even with the outer if statement.
  --  

   --  skipped func __ftrace_vbprintk

   --  skipped func __ftrace_vprintk

   procedure ftrace_dump (oops_dump_mode : ftrace_dump_mode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kernel.h:680
   pragma Import (CPP, ftrace_dump, "_Z11ftrace_dump16ftrace_dump_mode");

  -- * min()/max()/clamp() macros that also do
  -- * strict type-checking.. See the
  -- * "unnecessary" pointer comparison.
  --  

  --*
  -- * min_not_zero - return the minimum that is _not_ zero, unless both are zero
  -- * @x: value1
  -- * @y: value2
  --  

  --*
  -- * clamp - return a value clamped to a given range with strict typechecking
  -- * @val: current value
  -- * @min: minimum allowable value
  -- * @max: maximum allowable value
  -- *
  -- * This macro does strict typechecking of min/max to make sure they are of the
  -- * same type as val.  See the unnecessary pointer comparisons.
  --  

  -- * ..and if you can't take the strict
  -- * types, you can specify one yourself.
  -- *
  -- * Or not use min/max/clamp at all, of course.
  --  

  --*
  -- * clamp_t - return a value clamped to a given range using a given type
  -- * @type: the type of variable to use
  -- * @val: current value
  -- * @min: minimum allowable value
  -- * @max: maximum allowable value
  -- *
  -- * This macro does no typechecking and uses temporary variables of type
  -- * 'type' to make all the comparisons.
  --  

  --*
  -- * clamp_val - return a value clamped to a given range using val's type
  -- * @val: current value
  -- * @min: minimum allowable value
  -- * @max: maximum allowable value
  -- *
  -- * This macro does no typechecking and uses temporary variables of whatever
  -- * type the input argument 'val' is.  This is useful when val is an unsigned
  -- * type and min and max are literals that will otherwise be assigned a signed
  -- * integer type.
  --  

  -- * swap - swap value of @a and @b
  --  

  --*
  -- * container_of - cast a member of a structure out to the containing structure
  -- * @ptr:	the pointer to the member.
  -- * @type:	the type of the container struct this is embedded in.
  -- * @member:	the name of the member within the struct.
  -- *
  --  

  -- Trap pasters of __FUNCTION__ at compile-time  
  -- Rebuild everything on CONFIG_FTRACE_MCOUNT_RECORD  
  -- Permissions on a sysfs file: you didn't miss the 0 prefix did you?  
end linux_kernel_h;

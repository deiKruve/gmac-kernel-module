pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_spinlock_types_h;
with asm_generic_int_ll64_h;
with linux_types_h;

package linux_percpu_counter_h is

   --  arg-macro: function percpu_counter_init ({ static struct lock_class_key __key; __percpu_counter_init(fbc, value, and__key); }
   --    return { static struct lock_class_key __key; __percpu_counter_init(fbc, value, and__key); };
  -- * A simple "approximate counter" for use in ext2 and ext3 superblocks.
  -- *
  -- * WARNING: these things are HUGE.  4 kbytes per counter on 32-way P4.
  --  

   type percpu_counter is record
      lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:19
      count : aliased asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:20
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:22
      counters : access asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, percpu_counter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:18

  -- All percpu_counters are on a list  
   percpu_counter_batch : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:27
   pragma Import (C, percpu_counter_batch, "percpu_counter_batch");

   --  skipped func __percpu_counter_init

   procedure percpu_counter_destroy (fbc : access percpu_counter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:39
   pragma Import (CPP, percpu_counter_destroy, "_Z22percpu_counter_destroyP14percpu_counter");

   procedure percpu_counter_set (fbc : access percpu_counter; amount : asm_generic_int_ll64_h.s64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:40
   pragma Import (CPP, percpu_counter_set, "_Z18percpu_counter_setP14percpu_counterx");

   --  skipped func __percpu_counter_add

   --  skipped func __percpu_counter_sum

   function percpu_counter_compare (fbc : access percpu_counter; rhs : asm_generic_int_ll64_h.s64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:43
   pragma Import (CPP, percpu_counter_compare, "_Z22percpu_counter_compareP14percpu_counterx");

   procedure percpu_counter_add (fbc : access percpu_counter; amount : asm_generic_int_ll64_h.s64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:45
   pragma Import (CPP, percpu_counter_add, "_ZL18percpu_counter_addP14percpu_counterx");

   function percpu_counter_sum_positive (fbc : access percpu_counter) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:50
   pragma Import (CPP, percpu_counter_sum_positive, "_ZL27percpu_counter_sum_positiveP14percpu_counter");

   function percpu_counter_sum (fbc : access percpu_counter) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:56
   pragma Import (CPP, percpu_counter_sum, "_ZL18percpu_counter_sumP14percpu_counter");

   function percpu_counter_read (fbc : access percpu_counter) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:61
   pragma Import (CPP, percpu_counter_read, "_ZL19percpu_counter_readP14percpu_counter");

  -- * It is possible for the percpu_counter_read() to return a small negative
  -- * number for some counter which should never be negative.
  -- *
  --  

   function percpu_counter_read_positive (fbc : access percpu_counter) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:71
   pragma Import (CPP, percpu_counter_read_positive, "_ZL28percpu_counter_read_positiveP14percpu_counter");

  -- Prevent reloads of fbc->count  
   function percpu_counter_initialized (fbc : access percpu_counter) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:81
   pragma Import (CPP, percpu_counter_initialized, "_ZL26percpu_counter_initializedP14percpu_counter");

  -- * percpu_counter is intended to track positive numbers. In the UP case the
  -- * number should never be negative.
  --  

   procedure percpu_counter_inc (fbc : access percpu_counter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:162
   pragma Import (CPP, percpu_counter_inc, "_ZL18percpu_counter_incP14percpu_counter");

   procedure percpu_counter_dec (fbc : access percpu_counter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:167
   pragma Import (CPP, percpu_counter_dec, "_ZL18percpu_counter_decP14percpu_counter");

   procedure percpu_counter_sub (fbc : access percpu_counter; amount : asm_generic_int_ll64_h.s64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu_counter.h:172
   pragma Import (CPP, percpu_counter_sub, "_ZL18percpu_counter_subP14percpu_counterx");

end linux_percpu_counter_h;

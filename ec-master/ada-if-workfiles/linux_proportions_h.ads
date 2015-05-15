pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_percpu_counter_h;
with linux_mutex_h;
with linux_spinlock_types_h;

package linux_proportions_h is

   --  unsupported macro: PROP_MAX_SHIFT (BITS_PER_LONG/2)
   --  unsupported macro: PROP_FRAC_SHIFT (BITS_PER_LONG - PROP_MAX_SHIFT - 1)
   --  unsupported macro: PROP_FRAC_BASE (1UL << PROP_FRAC_SHIFT)
   --  arg-macro: procedure INIT_PROP_LOCAL_SINGLE { .lock := __RAW_SPIN_LOCK_UNLOCKED(name.lock), }
   --    { .lock := __RAW_SPIN_LOCK_UNLOCKED(name.lock), }
  -- * FLoating proportions
  -- *
  -- *  Copyright (C) 2007 Red Hat, Inc., Peter Zijlstra <pzijlstr@redhat.com>
  -- *
  -- * This file contains the public data structure and API definitions.
  --  

  --	 * The period over which we differentiate
  --	 *
  --	 *   period = 2^shift
  --	  

   type prop_global is record
      shift : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:22
      events : aliased linux_percpu_counter_h.percpu_counter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, prop_global);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:16

  --	 * The total event counter aka 'time'.
  --	 *
  --	 * Treated as an unsigned long; the lower 'shift - 1' bits are the
  --	 * counter bits, the remaining upper bits the period counter.
  --	  

  -- * global proportion descriptor
  -- *
  -- * this is needed to consitently flip prop_global structures.
  --  

   type prop_descriptor_pg_array is array (0 .. 1) of aliased prop_global;
   type prop_descriptor is record
      index : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:38
      pg : aliased prop_descriptor_pg_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:39
      the_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:40
   end record;
   pragma Convention (C_Pass_By_Copy, prop_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:37

  -- serialize the prop_global switch  
   function prop_descriptor_init (pd : access prop_descriptor; shift : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:43
   pragma Import (CPP, prop_descriptor_init, "_Z20prop_descriptor_initP15prop_descriptori");

   procedure prop_change_shift (pd : access prop_descriptor; new_shift : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:44
   pragma Import (CPP, prop_change_shift, "_Z17prop_change_shiftP15prop_descriptori");

  -- * ----- PERCPU ------
  --  

  --	 * the local events counter
  --	  

   type prop_local_percpu is record
      events : aliased linux_percpu_counter_h.percpu_counter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:54
      shift : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:59
      period : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:60
      lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:61
   end record;
   pragma Convention (C_Pass_By_Copy, prop_local_percpu);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:50

  --	 * snapshot of the last seen global state
  --	  

  -- protect the snapshot state  
   function prop_local_init_percpu (pl : access prop_local_percpu) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:64
   pragma Import (CPP, prop_local_init_percpu, "_Z22prop_local_init_percpuP17prop_local_percpu");

   procedure prop_local_destroy_percpu (pl : access prop_local_percpu);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:65
   pragma Import (CPP, prop_local_destroy_percpu, "_Z25prop_local_destroy_percpuP17prop_local_percpu");

   --  skipped func __prop_inc_percpu

   procedure prop_fraction_percpu
     (pd : access prop_descriptor;
      pl : access prop_local_percpu;
      numerator : access long;
      denominator : access long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:67
   pragma Import (CPP, prop_fraction_percpu, "_Z20prop_fraction_percpuP15prop_descriptorP17prop_local_percpuPlS3_");

   procedure prop_inc_percpu (pd : access prop_descriptor; pl : access prop_local_percpu);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:71
   pragma Import (CPP, prop_inc_percpu, "_ZL15prop_inc_percpuP15prop_descriptorP17prop_local_percpu");

  -- * Limit the time part in order to ensure there are some bits left for the
  -- * cycle counter and fraction multiply.
  --  

   --  skipped func __prop_inc_percpu_max

  -- * ----- SINGLE ------
  --  

  --	 * the local events counter
  --	  

   type prop_local_single is record
      events : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:105
      period : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:111
      shift : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:112
      lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:113
   end record;
   pragma Convention (C_Pass_By_Copy, prop_local_single);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:101

  --	 * snapshot of the last seen global state
  --	 * and a lock protecting this state
  --	  

  -- protect the snapshot state  
   function prop_local_init_single (pl : access prop_local_single) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:120
   pragma Import (CPP, prop_local_init_single, "_Z22prop_local_init_singleP17prop_local_single");

   procedure prop_local_destroy_single (pl : access prop_local_single);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:121
   pragma Import (CPP, prop_local_destroy_single, "_Z25prop_local_destroy_singleP17prop_local_single");

   --  skipped func __prop_inc_single

   procedure prop_fraction_single
     (pd : access prop_descriptor;
      pl : access prop_local_single;
      numerator : access long;
      denominator : access long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:123
   pragma Import (CPP, prop_fraction_single, "_Z20prop_fraction_singleP15prop_descriptorP17prop_local_singlePlS3_");

   procedure prop_inc_single (pd : access prop_descriptor; pl : access prop_local_single);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/proportions.h:127
   pragma Import (CPP, prop_inc_single, "_ZL15prop_inc_singleP15prop_descriptorP17prop_local_single");

end linux_proportions_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with asm_generic_int_ll64_h;
with uapi_asm_generic_int_ll64_h;

package linux_random_h is

  -- * include/linux/random.h
  -- *
  -- * Include file for the random number generator.
  --  

   procedure add_device_randomness (arg1 : System.Address; arg2 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:11
   pragma Import (CPP, add_device_randomness, "_Z21add_device_randomnessPKvj");

   procedure add_input_randomness
     (c_type : unsigned;
      code : unsigned;
      value : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:12
   pragma Import (CPP, add_input_randomness, "_Z20add_input_randomnessjjj");

   procedure add_interrupt_randomness (irq : int; irq_flags : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:14
   pragma Import (CPP, add_interrupt_randomness, "_Z24add_interrupt_randomnessii");

   procedure get_random_bytes (buf : System.Address; nbytes : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:16
   pragma Import (CPP, get_random_bytes, "_Z16get_random_bytesPvi");

   procedure get_random_bytes_arch (buf : System.Address; nbytes : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:17
   pragma Import (CPP, get_random_bytes_arch, "_Z21get_random_bytes_archPvi");

   procedure generate_random_uuid (uuid_out : access unsigned_char);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:18
   pragma Import (CPP, generate_random_uuid, "_Z20generate_random_uuidPh");

   function random_int_secret_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:19
   pragma Import (CPP, random_int_secret_init, "_Z22random_int_secret_initv");

   function get_random_int return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:25
   pragma Import (CPP, get_random_int, "_Z14get_random_intv");

   function randomize_range
     (start : unsigned_long;
      c_end : unsigned_long;
      len : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:26
   pragma Import (CPP, randomize_range, "_Z15randomize_rangemmm");

   function prandom_u32 return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:28
   pragma Import (CPP, prandom_u32, "_Z11prandom_u32v");

   procedure prandom_bytes (buf : System.Address; nbytes : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:29
   pragma Import (CPP, prandom_bytes, "_Z13prandom_bytesPvi");

   procedure prandom_seed (seed : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:30
   pragma Import (CPP, prandom_seed, "_Z12prandom_seedj");

   procedure prandom_reseed_late;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:31
   pragma Import (CPP, prandom_reseed_late, "_Z19prandom_reseed_latev");

   type rnd_state is record
      s1 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:34
      s2 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:34
      s3 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:34
      s4 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, rnd_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:33

   function prandom_u32_state (state : access rnd_state) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:37
   pragma Import (CPP, prandom_u32_state, "_Z17prandom_u32_stateP9rnd_state");

   procedure prandom_bytes_state
     (state : access rnd_state;
      buf : System.Address;
      nbytes : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:38
   pragma Import (CPP, prandom_bytes_state, "_Z19prandom_bytes_stateP9rnd_statePvi");

  --*
  -- * prandom_u32_max - returns a pseudo-random number in interval [0, ep_ro)
  -- * @ep_ro: right open interval endpoint
  -- *
  -- * Returns a pseudo-random number that is in interval [0, ep_ro). Note
  -- * that the result depends on PRNG being well distributed in [0, ~0U]
  -- * u32 space. Here we use maximally equidistributed combined Tausworthe
  -- * generator, that is, prandom_u32(). This is useful when requesting a
  -- * random index of an array containing ep_ro elements, for example.
  -- *
  -- * Returns: pseudo-random number in interval [0, ep_ro)
  --  

   function prandom_u32_max (ep_ro : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:52
   pragma Import (CPP, prandom_u32_max, "_ZL15prandom_u32_maxj");

  -- * Handle minimum values for seeds
  --  

   --  skipped func __seed

  --*
  -- * prandom_seed_state - set seed for prandom_u32_state().
  -- * @state: pointer to state structure to receive the seed.
  -- * @seed: arbitrary 64-bit value to use as a seed.
  --  

   procedure prandom_seed_state (state : access rnd_state; seed : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:70
   pragma Import (CPP, prandom_seed_state, "_ZL18prandom_seed_stateP9rnd_statey");

  -- Pseudo random number generator from numerical recipes.  
   function next_pseudo_random32 (seed : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/random.h:110
   pragma Import (CPP, next_pseudo_random32, "_ZL20next_pseudo_random32j");

end linux_random_h;

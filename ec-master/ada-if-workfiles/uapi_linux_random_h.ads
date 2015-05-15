pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_random_h is

   --  unsupported macro: RNDGETENTCNT _IOR( 'R', 0x00, int )
   --  unsupported macro: RNDADDTOENTCNT _IOW( 'R', 0x01, int )
   --  unsupported macro: RNDGETPOOL _IOR( 'R', 0x02, int [2] )
   --  unsupported macro: RNDADDENTROPY _IOW( 'R', 0x03, int [2] )
   --  unsupported macro: RNDZAPENTCNT _IO( 'R', 0x04 )
   --  unsupported macro: RNDCLEARPOOL _IO( 'R', 0x06 )
  -- * include/linux/random.h
  -- *
  -- * Include file for the random number generator.
  --  

  -- ioctl()'s for the random number generator  
  -- Get the entropy count.  
  -- Add to (or subtract from) the entropy count.  (Superuser only.)  
  -- Get the contents of the entropy pool.  (Superuser only.)  
  -- 
  -- * Write bytes into the entropy pool and add to the entropy count.
  -- * (Superuser only.)
  --  

  -- Clear entropy count to 0.  (Superuser only.)  
  -- Clear the entropy pool and associated counters.  (Superuser only.)  
   type rand_pool_info_buf_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type rand_pool_info is record
      entropy_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/random.h:38
      buf_size : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/random.h:39
      buf : aliased rand_pool_info_buf_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/random.h:40
   end record;
   pragma Convention (C_Pass_By_Copy, rand_pool_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/random.h:37

end uapi_linux_random_h;

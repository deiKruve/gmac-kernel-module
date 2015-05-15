pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_rwsem_h;

package asm_rwsem_h is

   --  unsupported macro: RWSEM_ACTIVE_MASK 0xffffffffL
   --  unsupported macro: RWSEM_UNLOCKED_VALUE 0x00000000L
   --  unsupported macro: RWSEM_ACTIVE_BIAS 0x00000001L
   --  unsupported macro: RWSEM_WAITING_BIAS (-RWSEM_ACTIVE_MASK-1)
   --  unsupported macro: RWSEM_ACTIVE_READ_BIAS RWSEM_ACTIVE_BIAS
   --  unsupported macro: RWSEM_ACTIVE_WRITE_BIAS (RWSEM_WAITING_BIAS + RWSEM_ACTIVE_BIAS)
  -- rwsem.h: R/W semaphores implemented using XADD/CMPXCHG for i486+
  -- *
  -- * Written by David Howells (dhowells@redhat.com).
  -- *
  -- * Derived from asm-x86/semaphore.h
  -- *
  -- *
  -- * The MSW of the count is the negated number of active writers and waiting
  -- * lockers, and the LSW is the total number of active locks
  -- *
  -- * The lock count is initialized to 0 (no active and no waiting lockers).
  -- *
  -- * When a writer subtracts WRITE_BIAS, it'll get 0xffff0001 for the case of an
  -- * uncontended lock. This can be determined because XADD returns the old value.
  -- * Readers increment by 1 and see a positive value when uncontended, negative
  -- * if there are writers (and maybe) readers waiting (in which case it goes to
  -- * sleep).
  -- *
  -- * The value of WAITING_BIAS supports up to 32766 waiting processes. This can
  -- * be extended to 65534 by manually checking the whole MSW rather than relying
  -- * on the S flag.
  -- *
  -- * The value of ACTIVE_BIAS supports up to 65535 active processes.
  -- *
  -- * This should be totally fair - if anything is waiting, a process that wants a
  -- * lock will go to the back of the queue. When the currently active lock is
  -- * released, if there's a writer at the front of the queue, then that and only
  -- * that will be woken up; if there's a bunch of consequtive readers at the
  -- * front, then they'll all be woken up, but no other readers will be.
  --  

  -- * The bias values and the counter type limits the number of
  -- * potential readers/writers to 32767 for 32 bits and 2147483647
  -- * for 64 bits.
  --  

  -- * lock for reading
  --  

   --  skipped func __down_read

  -- adds 0x00000001  
  -- * trylock for reading -- returns 1 if successful, 0 if contention
  --  

   --  skipped func __down_read_trylock

  -- * lock for writing
  --  

   --  skipped func __down_write_nested

  -- adds 0xffff0001, returns the old value  
  -- was the active mask 0 before?  
   --  skipped func __down_write

  -- * trylock for writing -- returns 1 if successful, 0 if contention
  --  

   --  skipped func __down_write_trylock

  -- was the active mask 0 before?  
  -- * unlock after reading
  --  

   --  skipped func __up_read

  -- subtracts 1, returns the old value  
  -- expects old value in %edx  
  -- * unlock after writing
  --  

   --  skipped func __up_write

  -- subtracts 0xffff0001, returns the old value  
  -- expects old value in %edx  
  -- * downgrade write lock to read lock
  --  

   --  skipped func __downgrade_write

  --		      * transitions 0xZZZZ0001 -> 0xYYYY0001 (i386)
  --		      *     0xZZZZZZZZ00000001 -> 0xYYYYYYYY00000001 (x86_64)
  --		       

  -- * implement atomic add functionality
  --  

   procedure rwsem_atomic_add (c_delta : long; sem : access linux_rwsem_h.rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/rwsem.h:209
   pragma Import (CPP, rwsem_atomic_add, "_ZL16rwsem_atomic_addlP12rw_semaphore");

  -- * implement exchange and add functionality
  --  

   function rwsem_atomic_update (c_delta : long; sem : access linux_rwsem_h.rw_semaphore) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/rwsem.h:219
   pragma Import (CPP, rwsem_atomic_update, "_ZL19rwsem_atomic_updatelP12rw_semaphore");

end asm_rwsem_h;

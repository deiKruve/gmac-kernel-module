pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;

package linux_osq_lock_h is

   --  unsupported macro: OSQ_UNLOCKED_VAL (0)
   --  unsupported macro: OSQ_LOCK_UNLOCKED { ATOMIC_INIT(OSQ_UNLOCKED_VAL) }
  -- * An MCS like lock especially tailored for optimistic spinning for sleeping
  -- * lock implementations (mutex, rwsem, etc).
  --  

  --	 * Stores an encoded value of the CPU # of the tail node in the queue.
  --	 * If the queue is empty, then it's set to OSQ_UNLOCKED_VAL.
  --	  

   type optimistic_spin_queue is record
      tail : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/osq_lock.h:16
   end record;
   pragma Convention (C_Pass_By_Copy, optimistic_spin_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/osq_lock.h:11

  -- Init macro and function.  
   procedure osq_lock_init (lock : access optimistic_spin_queue);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/osq_lock.h:22
   pragma Import (CPP, osq_lock_init, "_ZL13osq_lock_initP21optimistic_spin_queue");

end linux_osq_lock_h;

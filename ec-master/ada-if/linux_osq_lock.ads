
pragma Ada_2005;
pragma Style_Checks (Off);

-- with Interfaces.C; use Interfaces.C;
with linux_types;

package Linux_Osq_Lock is
   
   type optimistic_spin_queue is record
      --  An MCS like lock especially tailored for optimistic spinning 
      --  for sleeping lock implementations (mutex, rwsem, etc).
      --
      --  Stores an encoded value of the CPU # of the tail node in the queue.
      --  If the queue is empty, then it's set to OSQ_UNLOCKED_VAL.
      tail : aliased linux_types.atomic_t;
   end record;
   pragma Convention (C_Pass_By_Copy, optimistic_spin_queue);
   
   procedure osq_lock_init (lock : access optimistic_spin_queue);
   -- Init macro and function. and check on the macro bit.!!!!!!!!!!!!!!!
   pragma Import (C, osq_lock_init, "osq_lock_init");
   
end Linux_Osq_Lock;

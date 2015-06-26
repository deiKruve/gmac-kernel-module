pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_spinlock_types;

with System;
with Linux_Types;

package linux_semaphore is
   package L renames Linux_Types;

   type semaphore is record
      lock      : aliased linux_spinlock_types.raw_spinlock_t;
      count     : aliased unsigned;
      wait_list : aliased Linux_Types.list_head;
   end record;
   pragma Convention (C_Pass_By_Copy, semaphore);
   subtype Semaphore_Ptr is System.Address;

   -- sema_init  is inline (all done in master.c, lucky)
   procedure sema_init (sem : Semaphore_Ptr; val : int);
   pragma Import (C, sema_init, "kif_sema_init");
   
   procedure down (sem : Semaphore_Ptr);
   pragma Import (C, down, "down");

   function down_interruptible (sem : Semaphore_Ptr) return int;
   pragma Import (C, down_interruptible, "down");

   function down_killable (sem : Semaphore_Ptr) return int;
   pragma Import (C, down_killable, "down_killable");

   function down_trylock (sem : Semaphore_Ptr) return int;
   pragma Import (C, down_trylock, "down_trylock");

   function down_timeout (sem : Semaphore_Ptr; jiffies : long) return int;
   pragma Import (C, down_timeout, "down_timeout");

   procedure up (sem : Semaphore_Ptr);
   pragma Import (C, up, "up");

end linux_semaphore;

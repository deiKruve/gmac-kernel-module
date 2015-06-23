pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_spinlock_types;
with Linux_Types;

package linux_semaphore is
   package L renames Linux_Types;

   type semaphore is record
      lock      : aliased linux_spinlock_types.raw_spinlock_t;
      count     : aliased unsigned;
      wait_list : aliased Linux_Types.list_head;
   end record;
   pragma Convention (C_Pass_By_Copy, semaphore);

   -- sema_init  is inline (all done in master.c, lucky)
   procedure sema_init (sem : access semaphore; val : int);
   pragma Import (C, sema_init, "kif_sema_init");
   
   procedure down (sem : access semaphore);
   pragma Import (C, down, "down");

   function down_interruptible (sem : access semaphore) return int;
   pragma Import (C, down_interruptible, "down");

   function down_killable (sem : access semaphore) return int;
   pragma Import (C, down_killable, "down_killable");

   function down_trylock (sem : access semaphore) return int;
   pragma Import (C, down_trylock, "down_trylock");

   function down_timeout (sem : access semaphore; jiffies : long) return int;
   pragma Import (C, down_timeout, "down_timeout");

   procedure up (sem : access semaphore);
   pragma Import (C, up, "up");

end linux_semaphore;

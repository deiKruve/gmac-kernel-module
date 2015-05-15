pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_ipc_h;
with linux_types_h;
with System;
limited with linux_sched_h;

package linux_sem_h is

  -- One sem_array data structure for each set of semaphores in the system.  
  -- permissions .. see ipc.h  
   type sem_array is record
      sem_perm : aliased linux_ipc_h.kern_ipc_perm;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:14
      sem_ctime : aliased linux_types_h.time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:15
      sem_base : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:16
      pending_alter : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:17
      pending_const : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:19
      list_id : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:21
      sem_nsems : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:22
      complex_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:23
   end record;
   pragma Convention (C_Pass_By_Copy, sem_array);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:12

  -- last change time  
  -- ptr to first semaphore in array  
  -- pending operations  
  -- that alter the array  
  -- pending complex operations  
  -- that do not alter semvals  
  -- undo requests on this array  
  -- no. of semaphores in array  
  -- pending complex operations  
   type sysv_sem is record
      undo_list : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, sysv_sem);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:28

   --  skipped empty struct sem_undo_list

   function copy_semundo (clone_flags : unsigned_long; tsk : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:32
   pragma Import (CPP, copy_semundo, "_Z12copy_semundomP11task_struct");

   procedure exit_sem (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sem.h:33
   pragma Import (CPP, exit_sem, "_Z8exit_semP11task_struct");

  -- empty  
end linux_sem_h;

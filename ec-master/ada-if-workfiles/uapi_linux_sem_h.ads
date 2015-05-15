pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_ipc_h;
with uapi_asm_generic_posix_types_h;
with System;

package uapi_linux_sem_h is

   --  unsupported macro: SEM_UNDO 0x1000
   --  unsupported macro: GETPID 11
   --  unsupported macro: GETVAL 12
   --  unsupported macro: GETALL 13
   --  unsupported macro: GETNCNT 14
   --  unsupported macro: GETZCNT 15
   --  unsupported macro: SETVAL 16
   --  unsupported macro: SETALL 17
   --  unsupported macro: SEM_STAT 18
   --  unsupported macro: SEM_INFO 19
   --  unsupported macro: SEMMNI 128
   --  unsupported macro: SEMMSL 250
   --  unsupported macro: SEMMNS (SEMMNI*SEMMSL)
   --  unsupported macro: SEMOPM 32
   --  unsupported macro: SEMVMX 32767
   --  unsupported macro: SEMAEM SEMVMX
   --  unsupported macro: SEMUME SEMOPM
   --  unsupported macro: SEMMNU SEMMNS
   --  unsupported macro: SEMMAP SEMMNS
   --  unsupported macro: SEMUSZ 20
  -- semop flags  
  -- semctl Command Definitions.  
  -- ipcs ctl cmds  
  -- Obsolete, used only for backwards compatibility and libc5 compiles  
  -- permissions .. see ipc.h  
   type semid_ds is record
      sem_perm : aliased uapi_linux_ipc_h.ipc_perm;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:24
      sem_otime : aliased uapi_asm_generic_posix_types_h.uu_kernel_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:25
      sem_ctime : aliased uapi_asm_generic_posix_types_h.uu_kernel_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:26
      sem_base : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:27
      sem_pending : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:28
      sem_pending_last : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:29
      undo : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:30
      sem_nsems : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, semid_ds);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:23

  -- last semop time  
  -- last change time  
  -- ptr to first semaphore in array  
   --  skipped empty struct sem

  -- pending operations to be processed  
   --  skipped empty struct sem_queue

  -- last pending operation  
  -- undo requests on this array  
   --  skipped empty struct sem_undo

  -- no. of semaphores in array  
  -- Include the definition of semid64_ds  
  -- semop system calls takes an array of these.  
  -- semaphore index in array  
   type sembuf is record
      sem_num : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:39
      sem_op : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:40
      sem_flg : aliased short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:41
   end record;
   pragma Convention (C_Pass_By_Copy, sembuf);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:38

  -- semaphore operation  
  -- operation flags  
  -- arg for semctl system calls.  
  -- value for SETVAL  
   type seminfo;
   type semun (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            val : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:46
         when 1 =>
            buf : access semid_ds;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:47
         when 2 =>
            c_array : access unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:48
         when 3 =>
            uu_buf : access seminfo;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:49
         when others =>
            uu_pad : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:50
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, semun);
   pragma Unchecked_Union (semun);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:45

  -- buffer for IPC_STAT & IPC_SET  
  -- array for GETALL & SETALL  
  -- buffer for IPC_INFO  
   type seminfo is record
      semmap : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:54
      semmni : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:55
      semmns : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:56
      semmnu : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:57
      semmsl : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:58
      semopm : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:59
      semume : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:60
      semusz : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:61
      semvmx : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:62
      semaem : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:63
   end record;
   pragma Convention (C_Pass_By_Copy, seminfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/sem.h:53

  -- unused  
end uapi_linux_sem_h;

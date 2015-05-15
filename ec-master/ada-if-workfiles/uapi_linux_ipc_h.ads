pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_posix_types_h;
with uapi_asm_generic_posix_types_h;
with System;

package uapi_linux_ipc_h is

   --  unsupported macro: IPC_PRIVATE ((__kernel_key_t) 0)
   --  unsupported macro: IPC_CREAT 00001000
   --  unsupported macro: IPC_EXCL 00002000
   --  unsupported macro: IPC_NOWAIT 00004000
   --  unsupported macro: IPC_DIPC 00010000
   --  unsupported macro: IPC_OWN 00020000
   --  unsupported macro: IPC_RMID 0
   --  unsupported macro: IPC_SET 1
   --  unsupported macro: IPC_STAT 2
   --  unsupported macro: IPC_INFO 3
   --  unsupported macro: IPC_OLD 0
   --  unsupported macro: IPC_64 0x0100
   --  unsupported macro: SEMOP 1
   --  unsupported macro: SEMGET 2
   --  unsupported macro: SEMCTL 3
   --  unsupported macro: SEMTIMEDOP 4
   --  unsupported macro: MSGSND 11
   --  unsupported macro: MSGRCV 12
   --  unsupported macro: MSGGET 13
   --  unsupported macro: MSGCTL 14
   --  unsupported macro: SHMAT 21
   --  unsupported macro: SHMDT 22
   --  unsupported macro: SHMGET 23
   --  unsupported macro: SHMCTL 24
   --  unsupported macro: DIPC 25
   --  arg-macro: function IPCCALL ((version)<<16 or (op)
   --    return (version)<<16 or (op);
  -- Obsolete, used only for backwards compatibility and libc5 compiles  
   type ipc_perm is record
      key : aliased uapi_linux_posix_types_h.uu_kernel_key_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:11
      uid : aliased uapi_asm_generic_posix_types_h.uu_kernel_uid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:12
      gid : aliased uapi_asm_generic_posix_types_h.uu_kernel_gid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:13
      cuid : aliased uapi_asm_generic_posix_types_h.uu_kernel_uid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:14
      cgid : aliased uapi_asm_generic_posix_types_h.uu_kernel_gid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:15
      mode : aliased uapi_asm_generic_posix_types_h.uu_kernel_mode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:16
      seq : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:17
   end record;
   pragma Convention (C_Pass_By_Copy, ipc_perm);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:9

  -- Include the definition of ipc64_perm  
  -- resource get request flags  
  -- these fields are used by the DIPC package so the kernel as standard
  --   should avoid using them if possible  

  -- 
  -- * Control commands used with semctl, msgctl and shmctl 
  -- * see also specific commands in sem.h, msg.h and shm.h
  --  

  -- * Version flags for semctl, msgctl, and shmctl commands
  -- * These are passed as bitflags or-ed with the actual command
  --  

  -- * These are used to wrap system calls.
  -- *
  -- * See architecture code for ugly details..
  --  

   type ipc_kludge is record
      msgp : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:58
      msgtyp : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:59
   end record;
   pragma Convention (C_Pass_By_Copy, ipc_kludge);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/ipc.h:57

   --  skipped empty struct msgbuf

  -- Used by the DIPC package, try and avoid reusing it  
end uapi_linux_ipc_h;

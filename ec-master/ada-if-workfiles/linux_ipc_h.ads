pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_spinlock_types_h;
with Interfaces.C.Extensions;
with linux_types_h;
with linux_uidgid_h;
with System;

package linux_ipc_h is

   --  unsupported macro: IPCMNI 32768
  -- used by in-kernel data structures  
   type kern_ipc_perm is record
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:13
      deleted : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:14
      id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:15
      key : aliased linux_types_h.key_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:16
      uid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:17
      gid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:18
      cuid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:19
      cgid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:20
      mode : aliased linux_types_h.umode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:21
      seq : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:22
      security : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:23
   end record;
   pragma Convention (C_Pass_By_Copy, kern_ipc_perm);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ipc.h:11

end linux_ipc_h;

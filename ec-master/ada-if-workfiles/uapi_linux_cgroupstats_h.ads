pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_cgroupstats_h is

   --  unsupported macro: CGROUPSTATS_CMD_MAX (__CGROUPSTATS_CMD_MAX - 1)
   --  unsupported macro: CGROUPSTATS_TYPE_MAX (__CGROUPSTATS_TYPE_MAX - 1)
   --  unsupported macro: CGROUPSTATS_CMD_ATTR_MAX (__CGROUPSTATS_CMD_ATTR_MAX - 1)
  -- cgroupstats.h - exporting per-cgroup statistics
  -- *
  -- * Copyright IBM Corporation, 2007
  -- * Author Balbir Singh <balbir@linux.vnet.ibm.com>
  -- *
  -- * This program is free software; you can redistribute it and/or modify it
  -- * under the terms of version 2.1 of the GNU Lesser General Public License
  -- * as published by the Free Software Foundation.
  -- *
  -- * This program is distributed in the hope that it would be useful, but
  -- * WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  --  

  -- * Data shared between user space and kernel space on a per cgroup
  -- * basis. This data is shared using taskstats.
  -- *
  -- * Most of these states are derived by looking at the task->state value
  -- * For the nr_io_wait state, a flag in the delay accounting structure
  -- * indicates that the task is waiting on IO
  -- *
  -- * Each member is aligned to a 8 byte boundary.
  --  

  -- Number of tasks sleeping  
   type cgroupstats is record
      nr_sleeping : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/cgroupstats.h:32
      nr_running : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/cgroupstats.h:33
      nr_stopped : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/cgroupstats.h:34
      nr_uninterruptible : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/cgroupstats.h:35
      nr_io_wait : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/cgroupstats.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, cgroupstats);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/cgroupstats.h:31

  -- Number of tasks running  
  -- Number of tasks in stopped state  
  -- Number of tasks in uninterruptible  
  -- state  
  -- Number of tasks waiting on IO  
  -- * Commands sent from userspace
  -- * Not versioned. New commands should only be inserted at the enum's end
  -- * prior to __CGROUPSTATS_CMD_MAX
  --  

  -- Reserved  
  -- user->kernel request/get-response  
  -- kernel->user event  
  -- Reserved  
  -- contains name + stats  
end uapi_linux_cgroupstats_h;

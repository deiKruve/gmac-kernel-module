pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_taskstats_h is

   --  unsupported macro: TASKSTATS_VERSION 8
   --  unsupported macro: TS_COMM_LEN 32
   --  unsupported macro: TASKSTATS_CMD_MAX (__TASKSTATS_CMD_MAX - 1)
   --  unsupported macro: TASKSTATS_TYPE_MAX (__TASKSTATS_TYPE_MAX - 1)
   --  unsupported macro: TASKSTATS_CMD_ATTR_MAX (__TASKSTATS_CMD_ATTR_MAX - 1)
   --  unsupported macro: TASKSTATS_GENL_NAME "TASKSTATS"
   --  unsupported macro: TASKSTATS_GENL_VERSION 0x1
  -- taskstats.h - exporting per-task statistics
  -- *
  -- * Copyright (C) Shailabh Nagar, IBM Corp. 2006
  -- *           (C) Balbir Singh,   IBM Corp. 2006
  -- *           (C) Jay Lan,        SGI, 2006
  -- *
  -- * This program is free software; you can redistribute it and/or modify it
  -- * under the terms of version 2.1 of the GNU Lesser General Public License
  -- * as published by the Free Software Foundation.
  -- *
  -- * This program is distributed in the hope that it would be useful, but
  -- * WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  --  

  -- Format for per-task data returned to userland when
  -- *	- a task exits
  -- *	- listener requests stats for a task
  -- *
  -- * The struct is versioned. Newer versions should only add fields to
  -- * the bottom of the struct to maintain backward compatibility.
  -- *
  -- *
  -- * To add new fields
  -- *	a) bump up TASKSTATS_VERSION
  -- *	b) add comment indicating new version number at end of struct
  -- *	c) add new fields after version comment; maintain 64-bit alignment
  --  

  -- The version number of this struct. This field is always set to
  --	 * TAKSTATS_VERSION, which is defined in <linux/taskstats.h>.
  --	 * Each time the struct is changed, the value should be incremented.
  --	  

   subtype taskstats_ac_comm_array is Interfaces.C.char_array (0 .. 31);
   type taskstats_ac_pad_array is array (0 .. 2) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type taskstats is record
      version : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:46
      ac_exitcode : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:47
      ac_flag : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:52
      ac_nice : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:53
      cpu_count : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:71
      cpu_delay_total : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:72
      blkio_count : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:79
      blkio_delay_total : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:80
      swapin_count : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:83
      swapin_delay_total : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:84
      cpu_run_real_total : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:92
      cpu_run_virtual_total : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:100
      ac_comm : aliased taskstats_ac_comm_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:105
      ac_sched : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:106
      ac_pad : aliased taskstats_ac_pad_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:108
      ac_uid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:109
      ac_gid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:111
      ac_pid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:112
      ac_ppid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:113
      ac_btime : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:114
      ac_etime : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:115
      ac_utime : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:117
      ac_stime : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:118
      ac_minflt : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:119
      ac_majflt : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:120
      coremem : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:130
      virtmem : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:134
      hiwater_rss : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:139
      hiwater_vm : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:140
      read_char : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:143
      write_char : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:144
      read_syscalls : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:145
      write_syscalls : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:146
      read_bytes : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:151
      write_bytes : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:152
      cancelled_write_bytes : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:153
      nvcsw : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:155
      nivcsw : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:156
      ac_utimescaled : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:159
      ac_stimescaled : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:160
      cpu_scaled_run_real_total : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:161
      freepages_count : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:164
      freepages_delay_total : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:165
   end record;
   pragma Convention (C_Pass_By_Copy, taskstats);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/taskstats.h:40

  -- Exit status  
  -- The accounting flags of a task as defined in <linux/acct.h>
  --	 * Defined values are AFORK, ASU, ACOMPAT, ACORE, and AXSIG.
  --	  

  -- Record flags  
  -- task_nice  
  -- Delay accounting fields start
  --	 *
  --	 * All values, until comment "Delay accounting fields end" are
  --	 * available only if delay accounting is enabled, even though the last
  --	 * few fields are not delays
  --	 *
  --	 * xxx_count is the number of delay values recorded
  --	 * xxx_delay_total is the corresponding cumulative delay in nanoseconds
  --	 *
  --	 * xxx_delay_total wraps around to zero on overflow
  --	 * xxx_count incremented regardless of overflow
  --	  

  -- Delay waiting for cpu, while runnable
  --	 * count, delay_total NOT updated atomically
  --	  

  -- Following four fields atomically updated using task->delays->lock  
  -- Delay waiting for synchronous block I/O to complete
  --	 * does not account for delays in I/O submission
  --	  

  -- Delay waiting for page fault I/O (swap in only)  
  -- cpu "wall-clock" running time
  --	 * On some architectures, value will adjust for cpu time stolen
  --	 * from the kernel in involuntary waits due to virtualization.
  --	 * Value is cumulative, in nanoseconds, without a corresponding count
  --	 * and wraps around to zero silently on overflow
  --	  

  -- cpu "virtual" running time
  --	 * Uses time intervals seen by the kernel i.e. no adjustment
  --	 * for kernel's involuntary waits due to virtualization.
  --	 * Value is cumulative, in nanoseconds, without a corresponding count
  --	 * and wraps around to zero silently on overflow
  --	  

  -- Delay accounting fields end  
  -- version 1 ends here  
  -- Basic Accounting Fields start  
  -- Command name  
  -- Scheduling discipline  
  -- User ID  
  -- Group ID  
  -- Process ID  
  -- Parent process ID  
  -- Begin time [sec since 1970]  
  -- Elapsed time [usec]  
  -- User CPU time [usec]  
  -- SYstem CPU time [usec]  
  -- Minor Page Fault Count  
  -- Major Page Fault Count  
  -- Basic Accounting Fields end  
  -- Extended accounting fields start  
  -- Accumulated RSS usage in duration of a task, in MBytes-usecs.
  --	 * The current rss usage is added to this counter every time
  --	 * a tick is charged to a task's system time. So, at the end we
  --	 * will have memory usage multiplied by system time. Thus an
  --	 * average usage per system time unit can be calculated.
  --	  

  -- accumulated RSS usage in MB-usec  
  -- Accumulated virtual memory usage in duration of a task.
  --	 * Same as acct_rss_mem1 above except that we keep track of VM usage.
  --	  

  -- accumulated VM  usage in MB-usec  
  -- High watermark of RSS and virtual memory usage in duration of
  --	 * a task, in KBytes.
  --	  

  -- High-watermark of RSS usage, in KB  
  -- High-water VM usage, in KB  
  -- The following four fields are I/O statistics of a task.  
  -- bytes read  
  -- bytes written  
  -- read syscalls  
  -- write syscalls  
  -- Extended accounting fields end  
  -- Per-task storage I/O accounting starts  
  -- bytes of read I/O  
  -- bytes of write I/O  
  -- bytes of cancelled write I/O  
  -- voluntary_ctxt_switches  
  -- nonvoluntary_ctxt_switches  
  -- time accounting for SMT machines  
  -- utime scaled on frequency etc  
  -- stime scaled on frequency etc  
  -- scaled cpu_run_real_total  
  -- Delay waiting for memory reclaim  
  -- * Commands sent from userspace
  -- * Not versioned. New commands should only be inserted at the enum's end
  -- * prior to __TASKSTATS_CMD_MAX
  --  

  -- Reserved  
  -- user->kernel request/get-response  
  -- kernel->user event  
  -- Reserved  
  -- Process id  
  -- Thread group id  
  -- taskstats structure  
  -- contains pid + stats  
  -- contains tgid + stats  
  -- contains nothing  
  -- NETLINK_GENERIC related info  
end uapi_linux_taskstats_h;

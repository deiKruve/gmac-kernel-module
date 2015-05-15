pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package linux_task_io_accounting_h is

  -- * task_io_accounting: a structure which is used for recording a single task's
  -- * IO statistics.
  -- *
  -- * Don't include this header file directly - it is designed to be dragged in via
  -- * sched.h.
  -- *
  -- * Blame Andrew Morton for all this.
  --  

  -- bytes read  
   type task_io_accounting is record
      rchar : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/task_io_accounting.h:14
      wchar : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/task_io_accounting.h:16
      syscr : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/task_io_accounting.h:18
      syscw : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/task_io_accounting.h:20
      read_bytes : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/task_io_accounting.h:28
      write_bytes : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/task_io_accounting.h:34
      cancelled_write_bytes : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/task_io_accounting.h:43
   end record;
   pragma Convention (C_Pass_By_Copy, task_io_accounting);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/task_io_accounting.h:11

  --  bytes written  
  -- # of read syscalls  
  -- # of write syscalls  
  --	 * The number of bytes which this task has caused to be read from
  --	 * storage.
  --	  

  --	 * The number of bytes which this task has caused, or shall cause to be
  --	 * written to disk.
  --	  

  --	 * A task can cause "negative" IO too.  If this task truncates some
  --	 * dirty pagecache, some IO which another task has been accounted for
  --	 * (in its write_bytes) will not be happening.  We _could_ just
  --	 * subtract that from the truncating task's write_bytes, but there is
  --	 * information loss in doing that.
  --	  

end linux_task_io_accounting_h;

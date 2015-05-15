pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with linux_rwsem_h;
with linux_wait_h;

package linux_percpu_rwsem_h is

   --  unsupported macro: percpu_init_rwsem(brw) ({ static struct lock_class_key rwsem_key; __percpu_init_rwsem(brw, #brw, &rwsem_key); })
   type percpu_rw_semaphore is record
      fast_read_ctr : access unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:11
      write_ctr : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:12
      rw_sem : aliased linux_rwsem_h.rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:13
      slow_read_ctr : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:14
      write_waitq : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:15
   end record;
   pragma Convention (C_Pass_By_Copy, percpu_rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:10

   procedure percpu_down_read (arg1 : access percpu_rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:18
   pragma Import (CPP, percpu_down_read, "_Z16percpu_down_readP19percpu_rw_semaphore");

   procedure percpu_up_read (arg1 : access percpu_rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:19
   pragma Import (CPP, percpu_up_read, "_Z14percpu_up_readP19percpu_rw_semaphore");

   procedure percpu_down_write (arg1 : access percpu_rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:21
   pragma Import (CPP, percpu_down_write, "_Z17percpu_down_writeP19percpu_rw_semaphore");

   procedure percpu_up_write (arg1 : access percpu_rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:22
   pragma Import (CPP, percpu_up_write, "_Z15percpu_up_writeP19percpu_rw_semaphore");

   --  skipped func __percpu_init_rwsem

   procedure percpu_free_rwsem (arg1 : access percpu_rw_semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-rwsem.h:26
   pragma Import (CPP, percpu_free_rwsem, "_Z17percpu_free_rwsemP19percpu_rw_semaphore");

end linux_percpu_rwsem_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_spinlock_types_h;
with linux_types_h;

package linux_semaphore_h is

   --  arg-macro: procedure DEFINE_SEMAPHORE struct semaphore name := __SEMAPHORE_INITIALIZER(name, 1)
   --    struct semaphore name := __SEMAPHORE_INITIALIZER(name, 1)
  -- * Copyright (c) 2008 Intel Corporation
  -- * Author: Matthew Wilcox <willy@linux.intel.com>
  -- *
  -- * Distributed under the terms of the GNU GPL, version 2
  -- *
  -- * Please see kernel/semaphore.c for documentation of these functions
  --  

  -- Please don't access any members of this structure directly  
   type semaphore is record
      lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:17
      count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:18
      wait_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:19
   end record;
   pragma Convention (C_Pass_By_Copy, semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:16

   procedure sema_init (sem : access semaphore; val : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:32
   pragma Import (CPP, sema_init, "_ZL9sema_initP9semaphorei");

   procedure down (sem : access semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:39
   pragma Import (CPP, down, "_Z4downP9semaphore");

   function down_interruptible (sem : access semaphore) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:40
   pragma Import (CPP, down_interruptible, "_Z18down_interruptibleP9semaphore");

   function down_killable (sem : access semaphore) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:41
   pragma Import (CPP, down_killable, "_Z13down_killableP9semaphore");

   function down_trylock (sem : access semaphore) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:42
   pragma Import (CPP, down_trylock, "_Z12down_trylockP9semaphore");

   function down_timeout (sem : access semaphore; jiffies : long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:43
   pragma Import (CPP, down_timeout, "_Z12down_timeoutP9semaphorel");

   procedure up (sem : access semaphore);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/semaphore.h:44
   pragma Import (CPP, up, "_Z2upP9semaphore");

end linux_semaphore_h;

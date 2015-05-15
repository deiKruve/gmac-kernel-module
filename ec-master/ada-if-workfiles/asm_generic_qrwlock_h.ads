pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_generic_qrwlock_types_h;

package asm_generic_qrwlock_h is

   --  arg-macro: procedure arch_read_can_lock queue_read_can_lock(l)
   --    queue_read_can_lock(l)
   --  arg-macro: procedure arch_write_can_lock queue_write_can_lock(l)
   --    queue_write_can_lock(l)
   --  arg-macro: procedure arch_read_lock queue_read_lock(l)
   --    queue_read_lock(l)
   --  arg-macro: procedure arch_write_lock queue_write_lock(l)
   --    queue_write_lock(l)
   --  arg-macro: procedure arch_read_trylock queue_read_trylock(l)
   --    queue_read_trylock(l)
   --  arg-macro: procedure arch_write_trylock queue_write_trylock(l)
   --    queue_write_trylock(l)
   --  arg-macro: procedure arch_read_unlock queue_read_unlock(l)
   --    queue_read_unlock(l)
   --  arg-macro: procedure arch_write_unlock queue_write_unlock(l)
   --    queue_write_unlock(l)
  -- * Queue read/write lock
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License as published by
  -- * the Free Software Foundation; either version 2 of the License, or
  -- * (at your option) any later version.
  -- *
  -- * This program is distributed in the hope that it will be useful,
  -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- * GNU General Public License for more details.
  -- *
  -- * (C) Copyright 2013-2014 Hewlett-Packard Development Company, L.P.
  -- *
  -- * Authors: Waiman Long <waiman.long@hp.com>
  --  

  -- * Writer states & reader shift and bias
  --  

  -- * External function declarations
  --  

   procedure queue_read_lock_slowpath (lock : access asm_generic_qrwlock_types_h.qrwlock);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock.h:39
   pragma Import (CPP, queue_read_lock_slowpath, "_Z24queue_read_lock_slowpathP7qrwlock");

   procedure queue_write_lock_slowpath (lock : access asm_generic_qrwlock_types_h.qrwlock);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock.h:40
   pragma Import (CPP, queue_write_lock_slowpath, "_Z25queue_write_lock_slowpathP7qrwlock");

  --*
  -- * queue_read_can_lock- would read_trylock() succeed?
  -- * @lock: Pointer to queue rwlock structure
  --  

   function queue_read_can_lock (lock : access asm_generic_qrwlock_types_h.qrwlock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock.h:46
   pragma Import (CPP, queue_read_can_lock, "_ZL19queue_read_can_lockP7qrwlock");

  --*
  -- * queue_write_can_lock- would write_trylock() succeed?
  -- * @lock: Pointer to queue rwlock structure
  --  

   function queue_write_can_lock (lock : access asm_generic_qrwlock_types_h.qrwlock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock.h:55
   pragma Import (CPP, queue_write_can_lock, "_ZL20queue_write_can_lockP7qrwlock");

  --*
  -- * queue_read_trylock - try to acquire read lock of a queue rwlock
  -- * @lock : Pointer to queue rwlock structure
  -- * Return: 1 if lock acquired, 0 if failed
  --  

   function queue_read_trylock (lock : access asm_generic_qrwlock_types_h.qrwlock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock.h:65
   pragma Import (CPP, queue_read_trylock, "_ZL18queue_read_trylockP7qrwlock");

  --*
  -- * queue_write_trylock - try to acquire write lock of a queue rwlock
  -- * @lock : Pointer to queue rwlock structure
  -- * Return: 1 if lock acquired, 0 if failed
  --  

   function queue_write_trylock (lock : access asm_generic_qrwlock_types_h.qrwlock) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock.h:84
   pragma Import (CPP, queue_write_trylock, "_ZL19queue_write_trylockP7qrwlock");

  --*
  -- * queue_read_lock - acquire read lock of a queue rwlock
  -- * @lock: Pointer to queue rwlock structure
  --  

   procedure queue_read_lock (lock : access asm_generic_qrwlock_types_h.qrwlock);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock.h:99
   pragma Import (CPP, queue_read_lock, "_ZL15queue_read_lockP7qrwlock");

  -- The slowpath will decrement the reader count, if necessary.  
  --*
  -- * queue_write_lock - acquire write lock of a queue rwlock
  -- * @lock : Pointer to queue rwlock structure
  --  

   procedure queue_write_lock (lock : access asm_generic_qrwlock_types_h.qrwlock);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock.h:115
   pragma Import (CPP, queue_write_lock, "_ZL16queue_write_lockP7qrwlock");

  -- Optimize for the unfair lock case where the fair flag is 0.  
  --*
  -- * queue_read_unlock - release read lock of a queue rwlock
  -- * @lock : Pointer to queue rwlock structure
  --  

   procedure queue_read_unlock (lock : access asm_generic_qrwlock_types_h.qrwlock);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/qrwlock.h:128
   pragma Import (CPP, queue_read_unlock, "_ZL17queue_read_unlockP7qrwlock");

  --	 * Atomically decrement the reader count
  --	  

  --*
  -- * queue_write_unlock - release write lock of a queue rwlock
  -- * @lock : Pointer to queue rwlock structure
  --  

  --	 * If the writer field is atomic, it can be cleared directly.
  --	 * Otherwise, an atomic subtraction will be used to clear it.
  --	  

  -- * Remapping rwlock architecture specific functions to the corresponding
  -- * queue rwlock functions.
  --  

end asm_generic_qrwlock_h;

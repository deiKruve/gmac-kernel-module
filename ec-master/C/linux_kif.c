/*****************************************************************************
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                              L I N U X _ K I F                           --
--                                                                          --
--                                   B o d y                                --
--                                                                          --
--                     Copyright (C) 2015, Jan de Kruyf                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.                                               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
--          NINIEL - NIENOR  is maintained by J de Kruijf Engineers         --
--                     (email: jan.de.kruyf@hotmail.com)                    --
--                                                                          --
 *****************************************************************************/

// implementation of a fast Ethernet communication server

// Ada interface to the kernel, C part.

#include <linux/semaphore.h>
#include <linux/mutex.h>
#include <linux/slab.h>
#include <linux/sched.h>
#include <linux/kthread.h>
#include <asm/uaccess.h>
#include "linux_kif.h"

//DEFINE_MUTEX(mname1);
//DEFINE_MUTEX(mname2);

/* void init_mutexes(void) */
/* { */
/*   DEFINE_MUTEX(mname1); */
/*   mutex_init(mname1); */
/*   DEFINE_MUTEX(mname2); */
/*   mutex_init(mname2); */
/* } */

//  .
//  .
//  .
// to be constructed with awk
// so now there are 'n' mutexes available with names "mname1" ..... "mname<n>"
// and in ada we can use them by saying
// extern mname1 : linux_mutex.mutex with Import => True, Convention => C;


void kif_destroy_mutex (struct mutex *lock)
{
  mutex_destroy (lock);
}

// mutex_is_locked - is the mutex locked
// Returns 1 if the mutex is locked, 0 if unlocked.
int kif_is_mutex_locked (struct mutex *lock)
{
  return mutex_is_locked (lock);
}


/* void mutex_lock (struct mutex *lock) */
/* { */
/*   mutex_lock_nested(lock, 0); */
/* } */

/* void mutex_lock_interruptible (struct mutex *lock) */
/* { */
/*   mutex_lock_interruptible_nested(lock, 0); */
/* } */

/* void mutex_lock_killable (struct mutex *lock) */
/* { */
/*   mutex_lock_killable_nested(lock, 0); */
/* } */


void kif_sema_init(struct semaphore *sem, int val)
{
  sema_init(sem, val);
}


/*  Kernel Memory . . . . 
 */


/**
 * kmalloc - allocate memory
 * @size: how many bytes of memory are required.
 * @flags: the type of memory to allocate.
 *
 * kmalloc is the normal method of allocating memory
 * for objects smaller than page size in the kernel.
 *
 * The @flags argument may be one of:
 *
 * %GFP_USER - Allocate memory on behalf of user.  May sleep.
 *
 * %GFP_KERNEL - Allocate normal kernel ram.  May sleep.
 *
 * %GFP_ATOMIC - Allocation will not sleep.  May use emergency pools.
 *   For example, use this inside interrupt handlers.
 *
 * %GFP_HIGHUSER - Allocate pages from high memory.
 *
 * %GFP_NOIO - Do not do any I/O at all while trying to get memory.
 *
 * %GFP_NOFS - Do not make any fs calls while trying to get memory.
 *
 * %GFP_NOWAIT - Allocation will not sleep.
 *
 * %__GFP_THISNODE - Allocate node-local memory only.
 *
 * %GFP_DMA - Allocation suitable for DMA.
 *   Should only be used for kmalloc() caches. Otherwise, use a
 *   slab created with SLAB_DMA.
 *
 * Also it is possible to set different flags by OR'ing
 * in one or more of the following additional @flags:
 *
 * %__GFP_COLD - Request cache-cold pages instead of
 *   trying to return cache-warm pages.
 *
 * %__GFP_HIGH - This allocation has high priority and may use emergency pools.
 *
 * %__GFP_NOFAIL - Indicate that this allocation is in no way allowed to fail
 *   (think twice before using).
 *
 * %__GFP_NORETRY - If memory is not immediately available,
 *   then give up at once.
 *
 * %__GFP_NOWARN - If allocation fails, don't issue any warnings.
 *
 * %__GFP_REPEAT - If allocation fails initially, try once more before failing.
 *
 * There are other flags available as well, but these are not intended
 * for general use, and so are not documented here. For a full list of
 * potential flags, always refer to linux/gfp.h.
 */

void *kif_kmalloc_user (size_t size)
{
  return kmalloc(size, GFP_USER);
}

void *kif_kmalloc_kernel (size_t size)
{
  return kmalloc(size, GFP_KERNEL);
}

void *kif_kmalloc_atomic (size_t size)
{
  return kmalloc(size, GFP_ATOMIC);
}

void *kif_kmalloc_highuser (size_t size)
{
  return kmalloc(size, GFP_HIGHUSER);
}

void *kif_kmalloc_noio (size_t size)
{
  return kmalloc(size, GFP_NOIO);
}

void *kif_kmalloc_nofs (size_t size)
{
  return kmalloc(size, GFP_NOFS);
}

/* void *kif_kmalloc_nowait (size_t size) */
/* { */
/*   return kmalloc(size, NOWAIT); */
/* } */

void kif_sleepforever(void)
{
  set_current_state(TASK_INTERRUPTIBLE);
  schedule();
}

unsigned long __must_check
kif_copy_from_user(void *to, const void __user *from, unsigned long n)
{
  return copy_from_user(to, from, n);
}

unsigned long __must_check
kif_copy_to_user(void __user *to, const void *from, unsigned long n)
{
  return copy_to_user(to, from, n);
}


void *
kif_kthread_run (int (*thread_func)(void *), void *master, char *name)
{
  return kthread_run(thread_func, master, name);
}

void
printkp (char *string, void *pointer)
{
  printk (string, pointer);
}


  

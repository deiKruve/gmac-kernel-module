

#include <linux/mutex.h>
#include <linux/slab.h>
#include <linux/sched.h>
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


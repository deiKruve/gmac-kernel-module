/*****************************************************************************
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                              L I N U X _ K I F                           --
--                                                                          --
--                                   S p e c                                --
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

#ifndef LINUX_KIF_H
#define	LINUX_KIF_H

#include <linux/sched.h>

void init_mutexes(void);
void kif_destroy_mutex (struct mutex *lock);
int kif_is_mutex_locked (struct mutex *lock);

void kif_sema_init(struct semaphore *sem, int val);


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
typedef unsigned long size_t;
void *kif_kmalloc_user (size_t size);
void *kif_kmalloc_kernel (size_t size);
void *kif_kmalloc_atomic (size_t size);
void *kif_kmalloc_highuser (size_t size);
void *kif_kmalloc_noio (size_t size);
void *kif_kmalloc_nofs (size_t size);
/* void *kif_kmalloc_nowait (size_t size); */
void kif_sleepforever(void);

unsigned long
kif_copy_from_user(void *to, const void *from, unsigned long n);

unsigned long
kif_copy_to_user(void *to, const void *from, unsigned long n);

void *
  kif_kthread_run (int (*thread_func)(void *), void *master, char *name);

//struct task_struct;
extern int kthread_stop(struct task_struct  *k);
#endif // LINUX_KIF_H


void
printkp (char *string, void *pointer);
// to facilitate printing of a pointer from Ada.

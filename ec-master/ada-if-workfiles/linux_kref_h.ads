pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
limited with linux_spinlock_types_h;
limited with linux_mutex_h;

package linux_kref_h is

  -- * kref.h - library routines for handling generic reference counted objects
  -- *
  -- * Copyright (C) 2004 Greg Kroah-Hartman <greg@kroah.com>
  -- * Copyright (C) 2004 IBM Corp.
  -- *
  -- * based on kobject.h which was:
  -- * Copyright (C) 2002-2003 Patrick Mochel <mochel@osdl.org>
  -- * Copyright (C) 2002-2003 Open Source Development Labs
  -- *
  -- * This file is released under the GPLv2.
  -- *
  --  

   type kref is record
      refcount : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kref.h:25
   end record;
   pragma Convention (C_Pass_By_Copy, kref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kref.h:24

  --*
  -- * kref_init - initialize object.
  -- * @kref: object in question.
  --  

   procedure kref_init (the_kref : access kref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kref.h:32
   pragma Import (CPP, kref_init, "_ZL9kref_initP4kref");

  --*
  -- * kref_get - increment refcount for object.
  -- * @kref: object.
  --  

   procedure kref_get (the_kref : access kref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kref.h:41
   pragma Import (CPP, kref_get, "_ZL8kref_getP4kref");

  -- If refcount was 0 before incrementing then we have a race
  --	 * condition when this kref is freeing by some other thread right now.
  --	 * In this case one should use kref_get_unless_zero()
  --	  

  --*
  -- * kref_sub - subtract a number of refcounts for object.
  -- * @kref: object.
  -- * @count: Number of recounts to subtract.
  -- * @release: pointer to the function that will clean up the object when the
  -- *	     last reference to the object is released.
  -- *	     This pointer is required, and it is not acceptable to pass kfree
  -- *	     in as this function.  If the caller does pass kfree to this
  -- *	     function, you will be publicly mocked mercilessly by the kref
  -- *	     maintainer, and anyone else who happens to notice it.  You have
  -- *	     been warned.
  -- *
  -- * Subtract @count from the refcount, and if 0, call release().
  -- * Return 1 if the object was removed, otherwise return 0.  Beware, if this
  -- * function returns 0, you still can not count on the kref from remaining in
  -- * memory.  Only use the return value if you want to see if the kref is now
  -- * gone, not present.
  --  

   function kref_sub
     (the_kref : access kref;
      count : unsigned;
      release : access procedure (arg1 : access kref)) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kref.h:68
   pragma Import (CPP, kref_sub, "_ZL8kref_subP4krefjPFvS0_E");

  --*
  -- * kref_put - decrement refcount for object.
  -- * @kref: object.
  -- * @release: pointer to the function that will clean up the object when the
  -- *	     last reference to the object is released.
  -- *	     This pointer is required, and it is not acceptable to pass kfree
  -- *	     in as this function.  If the caller does pass kfree to this
  -- *	     function, you will be publicly mocked mercilessly by the kref
  -- *	     maintainer, and anyone else who happens to notice it.  You have
  -- *	     been warned.
  -- *
  -- * Decrement the refcount, and if 0, call release().
  -- * Return 1 if the object was removed, otherwise return 0.  Beware, if this
  -- * function returns 0, you still can not count on the kref from remaining in
  -- * memory.  Only use the return value if you want to see if the kref is now
  -- * gone, not present.
  --  

   function kref_put (the_kref : access kref; release : access procedure (arg1 : access kref)) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kref.h:97
   pragma Import (CPP, kref_put, "_ZL8kref_putP4krefPFvS0_E");

  --*
  -- * kref_put_spinlock_irqsave - decrement refcount for object.
  -- * @kref: object.
  -- * @release: pointer to the function that will clean up the object when the
  -- *	     last reference to the object is released.
  -- *	     This pointer is required, and it is not acceptable to pass kfree
  -- *	     in as this function.
  -- * @lock: lock to take in release case
  -- *
  -- * Behaves identical to kref_put with one exception.  If the reference count
  -- * drops to zero, the lock will be taken atomically wrt dropping the reference
  -- * count.  The release function has to call spin_unlock() without _irqrestore.
  --  

   function kref_put_spinlock_irqsave
     (the_kref : access kref;
      release : access procedure (arg1 : access kref);
      lock : access linux_spinlock_types_h.spinlock_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kref.h:115
   pragma Import (CPP, kref_put_spinlock_irqsave, "_ZL25kref_put_spinlock_irqsaveP4krefPFvS0_EP8spinlock");

   function kref_put_mutex
     (the_kref : access kref;
      release : access procedure (arg1 : access kref);
      lock : access linux_mutex_h.mutex) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kref.h:134
   pragma Import (CPP, kref_put_mutex, "_ZL14kref_put_mutexP4krefPFvS0_EP5mutex");

  --*
  -- * kref_get_unless_zero - Increment refcount for object unless it is zero.
  -- * @kref: object.
  -- *
  -- * Return non-zero if the increment succeeded. Otherwise return 0.
  -- *
  -- * This function is intended to simplify locking around refcounting for
  -- * objects that can be looked up from a lookup structure, and which are
  -- * removed from that lookup structure in the object destructor.
  -- * Operations on such objects require at least a read lock around
  -- * lookup + kref_get, and a write lock around kref_put + remove from lookup
  -- * structure. Furthermore, RCU implementations become extremely tricky.
  -- * With a lookup followed by a kref_get_unless_zero *with return value check*
  -- * locking in the kref_put path can be deferred to the actual removal from
  -- * the lookup structure and RCU lookups become trivial.
  --  

   function kref_get_unless_zero (the_kref : access kref) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kref.h:167
   pragma Import (CPP, kref_get_unless_zero, "_ZL20kref_get_unless_zeroP4kref");

end linux_kref_h;

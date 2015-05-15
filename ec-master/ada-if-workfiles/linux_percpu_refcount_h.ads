pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with System;
with Interfaces.C.Extensions;

package linux_percpu_refcount_h is

   --  unsupported macro: PCPU_STATUS_BITS 2
   --  unsupported macro: PCPU_STATUS_MASK ((1 << PCPU_STATUS_BITS) - 1)
   --  unsupported macro: PCPU_REF_PTR 0
   --  unsupported macro: PCPU_REF_DEAD 1
   --  arg-macro: function REF_STATUS (((unsigned long) count) and PCPU_STATUS_MASK
   --    return ((unsigned long) count) and PCPU_STATUS_MASK;
  -- * Percpu refcounts:
  -- * (C) 2012 Google, Inc.
  -- * Author: Kent Overstreet <koverstreet@google.com>
  -- *
  -- * This implements a refcount with similar semantics to atomic_t - atomic_inc(),
  -- * atomic_dec_and_test() - but percpu.
  -- *
  -- * There's one important difference between percpu refs and normal atomic_t
  -- * refcounts; you have to keep track of your initial refcount, and then when you
  -- * start shutting down you call percpu_ref_kill() _before_ dropping the initial
  -- * refcount.
  -- *
  -- * The refcount will have a range of 0 to ((1U << 31) - 1), i.e. one bit less
  -- * than an atomic_t - this is because of the way shutdown works, see
  -- * percpu_ref_kill()/PCPU_COUNT_BIAS.
  -- *
  -- * Before you call percpu_ref_kill(), percpu_ref_put() does not check for the
  -- * refcount hitting 0 - it can't, if it was in percpu mode. percpu_ref_kill()
  -- * puts the ref back in single atomic_t mode, collecting the per cpu refs and
  -- * issuing the appropriate barriers, and then marks the ref as shutting down so
  -- * that percpu_ref_put() will check for the ref hitting 0.  After it returns,
  -- * it's safe to drop the initial ref.
  -- *
  -- * USAGE:
  -- *
  -- * See fs/aio.c for some example usage; it's used there for struct kioctx, which
  -- * is created when userspaces calls io_setup(), and destroyed when userspace
  -- * calls io_destroy() or the process exits.
  -- *
  -- * In the aio code, kill_ioctx() is called when we wish to destroy a kioctx; it
  -- * calls percpu_ref_kill(), then hlist_del_rcu() and sychronize_rcu() to remove
  -- * the kioctx from the proccess's list of kioctxs - after that, there can't be
  -- * any new users of the kioctx (from lookup_ioctx()) and it's then safe to drop
  -- * the initial ref with percpu_ref_put().
  -- *
  -- * Code that does a two stage shutdown like this often needs some kind of
  -- * explicit synchronization to ensure the initial refcount can only be dropped
  -- * once - percpu_ref_kill() does this for you, it returns true once and false if
  -- * someone else already called it. The aio code uses it this way, but it's not
  -- * necessary if the code has some other mechanism to synchronize teardown.
  -- * around.
  --  

   --  skipped function type percpu_ref_func_t

   type percpu_ref is record
      count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:57
      pcpu_count : access unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:64
      release : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:65
      confirm_kill : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:66
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:67
   end record;
   pragma Convention (C_Pass_By_Copy, percpu_ref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:56

  --	 * The low bit of the pointer indicates whether the ref is in percpu
  --	 * mode; if set, then get/put will manipulate the atomic_t (this is a
  --	 * hack because we need to keep the pointer around for
  --	 * percpu_ref_kill_rcu())
  --	  

   function percpu_ref_init (ref : access percpu_ref; release : access procedure (arg1 : System.Address)) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:70
   pragma Import (CPP, percpu_ref_init, "_Z15percpu_ref_initP10percpu_refPFvS0_E");

   procedure percpu_ref_cancel_init (ref : access percpu_ref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:72
   pragma Import (CPP, percpu_ref_cancel_init, "_Z22percpu_ref_cancel_initP10percpu_ref");

   procedure percpu_ref_kill_and_confirm (ref : access percpu_ref; confirm_kill : access procedure (arg1 : System.Address));  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:73
   pragma Import (CPP, percpu_ref_kill_and_confirm, "_Z27percpu_ref_kill_and_confirmP10percpu_refPFvS0_E");

  --*
  -- * percpu_ref_kill - drop the initial ref
  -- * @ref: percpu_ref to kill
  -- *
  -- * Must be used to drop the initial ref on a percpu refcount; must be called
  -- * precisely once before shutdown.
  -- *
  -- * Puts @ref in non percpu mode, then does a call_rcu() before gathering up the
  -- * percpu counters and dropping the initial ref.
  --  

   procedure percpu_ref_kill (ref : access percpu_ref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:86
   pragma Import (CPP, percpu_ref_kill, "_ZL15percpu_ref_killP10percpu_ref");

  --*
  -- * percpu_ref_get - increment a percpu refcount
  -- * @ref: percpu_ref to get
  -- *
  -- * Analagous to atomic_inc().
  --   

   procedure percpu_ref_get (ref : access percpu_ref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:104
   pragma Import (CPP, percpu_ref_get, "_ZL14percpu_ref_getP10percpu_ref");

  --*
  -- * percpu_ref_tryget - try to increment a percpu refcount
  -- * @ref: percpu_ref to try-get
  -- *
  -- * Increment a percpu refcount unless its count already reached zero.
  -- * Returns %true on success; %false on failure.
  -- *
  -- * The caller is responsible for ensuring that @ref stays accessible.
  --  

   function percpu_ref_tryget (ref : access percpu_ref) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:129
   pragma Import (CPP, percpu_ref_tryget, "_ZL17percpu_ref_trygetP10percpu_ref");

  --*
  -- * percpu_ref_tryget_live - try to increment a live percpu refcount
  -- * @ref: percpu_ref to try-get
  -- *
  -- * Increment a percpu refcount unless it has already been killed.  Returns
  -- * %true on success; %false on failure.
  -- *
  -- * Completion of percpu_ref_kill() in itself doesn't guarantee that tryget
  -- * will fail.  For such guarantee, percpu_ref_kill_and_confirm() should be
  -- * used.  After the confirm_kill callback is invoked, it's guaranteed that
  -- * no new reference will be given out by percpu_ref_tryget().
  -- *
  -- * The caller is responsible for ensuring that @ref stays accessible.
  --  

   function percpu_ref_tryget_live (ref : access percpu_ref) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:164
   pragma Import (CPP, percpu_ref_tryget_live, "_ZL22percpu_ref_tryget_liveP10percpu_ref");

  --*
  -- * percpu_ref_put - decrement a percpu refcount
  -- * @ref: percpu_ref to put
  -- *
  -- * Decrement the refcount, and if 0, call the release function (which was passed
  -- * to percpu_ref_init())
  --  

   procedure percpu_ref_put (ref : access percpu_ref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/percpu-refcount.h:190
   pragma Import (CPP, percpu_ref_put, "_ZL14percpu_ref_putP10percpu_ref");

end linux_percpu_refcount_h;

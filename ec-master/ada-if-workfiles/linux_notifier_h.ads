pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_spinlock_types_h;
with linux_rwsem_h;
with linux_mutex_h;
with linux_srcu_h;

package linux_notifier_h is

   --  arg-macro: procedure ATOMIC_INIT_NOTIFIER_HEAD do { spin_lock_init(and(name).lock); (name).head := NULL; } while (0)
   --    do { spin_lock_init(and(name).lock); (name).head := NULL; } while (0)
   --  arg-macro: procedure BLOCKING_INIT_NOTIFIER_HEAD do { init_rwsem(and(name).rwsem); (name).head := NULL; } while (0)
   --    do { init_rwsem(and(name).rwsem); (name).head := NULL; } while (0)
   --  arg-macro: procedure RAW_INIT_NOTIFIER_HEAD do { (name).head := NULL; } while (0)
   --    do { (name).head := NULL; } while (0)
   --  arg-macro: procedure srcu_cleanup_notifier_head cleanup_srcu_struct(and(name).srcu);
   --    cleanup_srcu_struct(and(name).srcu);
   --  arg-macro: procedure ATOMIC_NOTIFIER_INIT { .lock := __SPIN_LOCK_UNLOCKED(name.lock), .head := NULL }
   --    { .lock := __SPIN_LOCK_UNLOCKED(name.lock), .head := NULL }
   --  arg-macro: procedure BLOCKING_NOTIFIER_INIT { .rwsem := __RWSEM_INITIALIZER((name).rwsem), .head := NULL }
   --    { .rwsem := __RWSEM_INITIALIZER((name).rwsem), .head := NULL }
   --  arg-macro: procedure RAW_NOTIFIER_INIT { .head := NULL }
   --    { .head := NULL }
   --  arg-macro: procedure ATOMIC_NOTIFIER_HEAD struct atomic_notifier_head name := ATOMIC_NOTIFIER_INIT(name)
   --    struct atomic_notifier_head name := ATOMIC_NOTIFIER_INIT(name)
   --  arg-macro: procedure BLOCKING_NOTIFIER_HEAD struct blocking_notifier_head name := BLOCKING_NOTIFIER_INIT(name)
   --    struct blocking_notifier_head name := BLOCKING_NOTIFIER_INIT(name)
   --  arg-macro: procedure RAW_NOTIFIER_HEAD struct raw_notifier_head name := RAW_NOTIFIER_INIT(name)
   --    struct raw_notifier_head name := RAW_NOTIFIER_INIT(name)
   --  unsupported macro: NOTIFY_DONE 0x0000
   --  unsupported macro: NOTIFY_OK 0x0001
   --  unsupported macro: NOTIFY_STOP_MASK 0x8000
   --  unsupported macro: NOTIFY_BAD (NOTIFY_STOP_MASK|0x0002)
   --  unsupported macro: NOTIFY_STOP (NOTIFY_OK|NOTIFY_STOP_MASK)
   --  unsupported macro: NETLINK_URELEASE 0x0001
   --  unsupported macro: KBD_KEYCODE 0x0001
   --  unsupported macro: KBD_UNBOUND_KEYCODE 0x0002
   --  unsupported macro: KBD_UNICODE 0x0003
   --  unsupported macro: KBD_KEYSYM 0x0004
   --  unsupported macro: KBD_POST_KEYSYM 0x0005
  -- *	Routines to manage notifier chains for passing status changes to any
  -- *	interested routines. We need this instead of hard coded call lists so
  -- *	that modules can poke their nose into the innards. The network devices
  -- *	needed them so here they are for the rest of you.
  -- *
  -- *				Alan Cox <Alan.Cox@linux.org>
  --  

  -- * Notifier chains are of four types:
  -- *
  -- *	Atomic notifier chains: Chain callbacks run in interrupt/atomic
  -- *		context. Callouts are not allowed to block.
  -- *	Blocking notifier chains: Chain callbacks run in process context.
  -- *		Callouts are allowed to block.
  -- *	Raw notifier chains: There are no restrictions on callbacks,
  -- *		registration, or unregistration.  All locking and protection
  -- *		must be provided by the caller.
  -- *	SRCU notifier chains: A variant of blocking notifier chains, with
  -- *		the same restrictions.
  -- *
  -- * atomic_notifier_chain_register() may be called from an atomic context,
  -- * but blocking_notifier_chain_register() and srcu_notifier_chain_register()
  -- * must be called from a process context.  Ditto for the corresponding
  -- * _unregister() routines.
  -- *
  -- * atomic_notifier_chain_unregister(), blocking_notifier_chain_unregister(),
  -- * and srcu_notifier_chain_unregister() _must not_ be called from within
  -- * the call chain.
  -- *
  -- * SRCU notifier chains are an alternative form of blocking notifier chains.
  -- * They use SRCU (Sleepable Read-Copy Update) instead of rw-semaphores for
  -- * protection of the chain links.  This means there is _very_ low overhead
  -- * in srcu_notifier_call_chain(): no cache bounces and no memory barriers.
  -- * As compensation, srcu_notifier_chain_unregister() is rather expensive.
  -- * SRCU notifier chains should be used when the chain will be called very
  -- * often but notifier_blocks will seldom be removed.  Also, SRCU notifier
  -- * chains are slightly more difficult to use because they require special
  -- * runtime initialization.
  --  

   type notifier_fn_t is access function
        (arg1 : System.Address;
         arg2 : unsigned_long;
         arg3 : System.Address) return int;
   pragma Convention (C, notifier_fn_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:50

   type notifier_block is record
      notifier_call : notifier_fn_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:54
      next : access notifier_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:55
      priority : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:56
   end record;
   pragma Convention (C_Pass_By_Copy, notifier_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:53

   type atomic_notifier_head is record
      lock : aliased linux_spinlock_types_h.spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:60
      head : access notifier_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:61
   end record;
   pragma Convention (C_Pass_By_Copy, atomic_notifier_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:59

   type blocking_notifier_head is record
      rwsem : aliased linux_rwsem_h.rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:65
      head : access notifier_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:66
   end record;
   pragma Convention (C_Pass_By_Copy, blocking_notifier_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:64

   type raw_notifier_head is record
      head : access notifier_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:70
   end record;
   pragma Convention (C_Pass_By_Copy, raw_notifier_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:69

   type srcu_notifier_head is record
      the_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:74
      srcu : aliased linux_srcu_h.srcu_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:75
      head : access notifier_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:76
   end record;
   pragma Convention (C_Pass_By_Copy, srcu_notifier_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:73

  -- srcu_notifier_heads must be initialized and cleaned up dynamically  
   procedure srcu_init_notifier_head (nh : access srcu_notifier_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:92
   pragma Import (CPP, srcu_init_notifier_head, "_Z23srcu_init_notifier_headP18srcu_notifier_head");

  -- srcu_notifier_heads cannot be initialized statically  
   function atomic_notifier_chain_register (nh : access atomic_notifier_head; nb : access notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:118
   pragma Import (CPP, atomic_notifier_chain_register, "_Z30atomic_notifier_chain_registerP20atomic_notifier_headP14notifier_block");

   function blocking_notifier_chain_register (nh : access blocking_notifier_head; nb : access notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:120
   pragma Import (CPP, blocking_notifier_chain_register, "_Z32blocking_notifier_chain_registerP22blocking_notifier_headP14notifier_block");

   function raw_notifier_chain_register (nh : access raw_notifier_head; nb : access notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:122
   pragma Import (CPP, raw_notifier_chain_register, "_Z27raw_notifier_chain_registerP17raw_notifier_headP14notifier_block");

   function srcu_notifier_chain_register (nh : access srcu_notifier_head; nb : access notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:124
   pragma Import (CPP, srcu_notifier_chain_register, "_Z28srcu_notifier_chain_registerP18srcu_notifier_headP14notifier_block");

   function blocking_notifier_chain_cond_register (nh : access blocking_notifier_head; nb : access notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:127
   pragma Import (CPP, blocking_notifier_chain_cond_register, "_Z37blocking_notifier_chain_cond_registerP22blocking_notifier_headP14notifier_block");

   function atomic_notifier_chain_unregister (nh : access atomic_notifier_head; nb : access notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:131
   pragma Import (CPP, atomic_notifier_chain_unregister, "_Z32atomic_notifier_chain_unregisterP20atomic_notifier_headP14notifier_block");

   function blocking_notifier_chain_unregister (nh : access blocking_notifier_head; nb : access notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:133
   pragma Import (CPP, blocking_notifier_chain_unregister, "_Z34blocking_notifier_chain_unregisterP22blocking_notifier_headP14notifier_block");

   function raw_notifier_chain_unregister (nh : access raw_notifier_head; nb : access notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:135
   pragma Import (CPP, raw_notifier_chain_unregister, "_Z29raw_notifier_chain_unregisterP17raw_notifier_headP14notifier_block");

   function srcu_notifier_chain_unregister (nh : access srcu_notifier_head; nb : access notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:137
   pragma Import (CPP, srcu_notifier_chain_unregister, "_Z30srcu_notifier_chain_unregisterP18srcu_notifier_headP14notifier_block");

   function atomic_notifier_call_chain
     (nh : access atomic_notifier_head;
      val : unsigned_long;
      v : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:140
   pragma Import (CPP, atomic_notifier_call_chain, "_Z26atomic_notifier_call_chainP20atomic_notifier_headmPv");

   --  skipped func __atomic_notifier_call_chain

   function blocking_notifier_call_chain
     (nh : access blocking_notifier_head;
      val : unsigned_long;
      v : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:144
   pragma Import (CPP, blocking_notifier_call_chain, "_Z28blocking_notifier_call_chainP22blocking_notifier_headmPv");

   --  skipped func __blocking_notifier_call_chain

   function raw_notifier_call_chain
     (nh : access raw_notifier_head;
      val : unsigned_long;
      v : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:148
   pragma Import (CPP, raw_notifier_call_chain, "_Z23raw_notifier_call_chainP17raw_notifier_headmPv");

   --  skipped func __raw_notifier_call_chain

   function srcu_notifier_call_chain
     (nh : access srcu_notifier_head;
      val : unsigned_long;
      v : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:152
   pragma Import (CPP, srcu_notifier_call_chain, "_Z24srcu_notifier_call_chainP18srcu_notifier_headmPv");

   --  skipped func __srcu_notifier_call_chain

  -- Bad/Veto action  
  -- * Clean way to return from the notifier and stop further calls.
  --  

  -- Encapsulate (negative) errno value (in particular, NOTIFY_BAD <=> EPERM).  
   function notifier_from_errno (err : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:168
   pragma Import (CPP, notifier_from_errno, "_ZL19notifier_from_errnoi");

  -- Restore (negative) errno value from notify return value.  
   function notifier_to_errno (ret : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:177
   pragma Import (CPP, notifier_to_errno, "_ZL17notifier_to_errnoi");

  -- *	Declared notifiers so far. I can imagine quite a few more chains
  -- *	over time (eg laptop power reset chains, reboot chain (to clean 
  -- *	device units up), device [un]mount chain, module load/unload chain,
  -- *	low memory chain, screenblank chain (for plug in modular screenblankers) 
  -- *	VC switch chains (for loadable kernel svgalib VC switch helpers) etc...
  --  

  -- CPU notfiers are defined in include/linux/cpu.h.  
  -- netdevice notifiers are defined in include/linux/netdevice.h  
  -- reboot notifiers are defined in include/linux/reboot.h.  
  -- Hibernation and suspend events are defined in include/linux/suspend.h.  
  -- Virtual Terminal events are defined in include/linux/vt.h.  
  -- Console keyboard events.
  -- * Note: KBD_KEYCODE is always sent before KBD_UNBOUND_KEYCODE, KBD_UNICODE and
  -- * KBD_KEYSYM.  

   reboot_notifier_list : aliased blocking_notifier_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/notifier.h:212
   pragma Import (C, reboot_notifier_list, "reboot_notifier_list");

end linux_notifier_h;

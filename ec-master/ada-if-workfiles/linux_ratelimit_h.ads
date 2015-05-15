pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_spinlock_types_h;

package linux_ratelimit_h is

   --  unsupported macro: DEFAULT_RATELIMIT_INTERVAL (5 * HZ)
   --  unsupported macro: DEFAULT_RATELIMIT_BURST 10
   --  arg-macro: procedure DEFINE_RATELIMIT_STATE struct ratelimit_state name := { .lock := __RAW_SPIN_LOCK_UNLOCKED(name.lock), .interval := interval_init, .burst := burst_init, }
   --    struct ratelimit_state name := { .lock := __RAW_SPIN_LOCK_UNLOCKED(name.lock), .interval := interval_init, .burst := burst_init, }
   --  arg-macro: procedure WARN_ON_RATELIMIT WARN_ON((condition)  and then  __ratelimit(state))
   --    WARN_ON((condition)  and then  __ratelimit(state))
   --  unsupported macro: WARN_RATELIMIT(condition,format,...) ({ static DEFINE_RATELIMIT_STATE(_rs, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST); int rtn = !!(condition); if (unlikely(rtn && __ratelimit(&_rs))) WARN(rtn, format, ##__VA_ARGS__); rtn; })
  -- protect the state  
   type ratelimit_state is record
      lock : aliased linux_spinlock_types_h.raw_spinlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ratelimit.h:11
      interval : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ratelimit.h:13
      burst : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ratelimit.h:14
      printed : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ratelimit.h:15
      missed : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ratelimit.h:16
      c_begin : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ratelimit.h:17
   end record;
   pragma Convention (C_Pass_By_Copy, ratelimit_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ratelimit.h:10

   procedure ratelimit_state_init
     (rs : access ratelimit_state;
      interval : int;
      burst : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ratelimit.h:28
   pragma Import (CPP, ratelimit_state_init, "_ZL20ratelimit_state_initP15ratelimit_stateii");

   printk_ratelimit_state : aliased ratelimit_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/ratelimit.h:39
   pragma Import (C, printk_ratelimit_state, "printk_ratelimit_state");

   --  skipped func ___ratelimit

end linux_ratelimit_h;

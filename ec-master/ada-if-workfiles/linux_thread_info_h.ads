pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with linux_types_h;
limited with uapi_linux_time_h;
with System;
limited with asm_thread_info_h;

package linux_thread_info_h is

   --  unsupported macro: THREADINFO_GFP (GFP_KERNEL | __GFP_NOTRACK)
   --  arg-macro: procedure set_thread_flag set_ti_thread_flag(current_thread_info(), flag)
   --    set_ti_thread_flag(current_thread_info(), flag)
   --  arg-macro: procedure clear_thread_flag clear_ti_thread_flag(current_thread_info(), flag)
   --    clear_ti_thread_flag(current_thread_info(), flag)
   --  arg-macro: procedure test_and_set_thread_flag test_and_set_ti_thread_flag(current_thread_info(), flag)
   --    test_and_set_ti_thread_flag(current_thread_info(), flag)
   --  arg-macro: procedure test_and_clear_thread_flag test_and_clear_ti_thread_flag(current_thread_info(), flag)
   --    test_and_clear_ti_thread_flag(current_thread_info(), flag)
   --  arg-macro: procedure test_thread_flag test_ti_thread_flag(current_thread_info(), flag)
   --    test_ti_thread_flag(current_thread_info(), flag)
   --  arg-macro: procedure tif_need_resched test_thread_flag(TIF_NEED_RESCHED)
   --    test_thread_flag(TIF_NEED_RESCHED)
  -- thread_info.h: common low-level thread information accessors
  -- *
  -- * Copyright (C) 2002  David Howells (dhowells@redhat.com)
  -- * - Incorporating suggestions made by Linus Torvalds
  --  

   --  skipped empty struct compat_timespec

  -- * System call restart block.
  --  

   type anon_19;
   type anon_20 is record
      uaddr : access asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:24
      val : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:25
      flags : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:26
      bitset : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:27
      time : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:28
      uaddr2 : access asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, anon_20);
   type anon_21 is record
      clockid : aliased linux_types_h.clockid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:33
      rmtp : access uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:34
      compat_rmtp : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:36
      expires : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, anon_21);
   type anon_22 is record
      ufds : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:42
      nfds : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:43
      has_timeout : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:44
      tv_sec : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:45
      tv_nsec : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:46
   end record;
   pragma Convention (C_Pass_By_Copy, anon_22);
   type anon_19 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            futex : aliased anon_20;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:30
         when 1 =>
            nanosleep : aliased anon_21;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:39
         when others =>
            poll : aliased anon_22;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:47
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_19);
   pragma Unchecked_Union (anon_19);
   type restart_block is record
      fn : access function (arg1 : access restart_block) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:20
      field_2 : aliased anon_19;
   end record;
   pragma Convention (C_Pass_By_Copy, restart_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:19

  -- For futex_wait and futex_wait_requeue_pi  
  -- For nanosleep  
  -- For poll  
   --  skipped empty struct pollfd

   function do_no_restart_syscall (parm : access restart_block) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:51
   pragma Import (CPP, do_no_restart_syscall, "_Z21do_no_restart_syscallP13restart_block");

  -- * flag set/clear/test wrappers
  -- * - pass TIF_xxxx constants to these functions
  --  

   procedure set_ti_thread_flag (ti : access asm_thread_info_h.thread_info; flag : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:69
   pragma Import (CPP, set_ti_thread_flag, "_ZL18set_ti_thread_flagP11thread_infoi");

   procedure clear_ti_thread_flag (ti : access asm_thread_info_h.thread_info; flag : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:74
   pragma Import (CPP, clear_ti_thread_flag, "_ZL20clear_ti_thread_flagP11thread_infoi");

   function test_and_set_ti_thread_flag (ti : access asm_thread_info_h.thread_info; flag : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:79
   pragma Import (CPP, test_and_set_ti_thread_flag, "_ZL27test_and_set_ti_thread_flagP11thread_infoi");

   function test_and_clear_ti_thread_flag (ti : access asm_thread_info_h.thread_info; flag : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:84
   pragma Import (CPP, test_and_clear_ti_thread_flag, "_ZL29test_and_clear_ti_thread_flagP11thread_infoi");

   function test_ti_thread_flag (ti : access asm_thread_info_h.thread_info; flag : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/thread_info.h:89
   pragma Import (CPP, test_ti_thread_flag, "_ZL19test_ti_thread_flagP11thread_infoi");

  -- * An arch can define its own version of set_restore_sigmask() to get the
  -- * job done however works, with or without TIF_RESTORE_SIGMASK.
  --  

  --*
  -- * set_restore_sigmask() - make sure saved_sigmask processing gets done
  -- *
  -- * This sets TIF_RESTORE_SIGMASK and ensures that the arch signal code
  -- * will run before returning to user mode, to process the flag.  For
  -- * all callers, TIF_SIGPENDING is already set or it's no harm to set
  -- * it.  TIF_RESTORE_SIGMASK need not be in the set of bits that the
  -- * arch code will notice on return to user mode, in case those bits
  -- * are scarce.  We set TIF_SIGPENDING here to ensure that the arch
  -- * signal code always gets run when TIF_RESTORE_SIGMASK is set.
  --  

end linux_thread_info_h;

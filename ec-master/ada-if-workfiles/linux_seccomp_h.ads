pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
limited with linux_sched_h;

package linux_seccomp_h is

   --  skipped empty struct seccomp_filter

  --*
  -- * struct seccomp - the state of a seccomp'ed process
  -- *
  -- * @mode:  indicates one of the valid values above for controlled
  -- *         system calls available to a process.
  -- * @filter: The metadata and ruleset for determining what system calls
  -- *          are allowed for a task.
  -- *
  -- *          @filter must only be accessed from the context of current as there
  -- *          is no locking.
  --  

   type seccomp is record
      mode : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seccomp.h:24
      filter : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seccomp.h:25
   end record;
   pragma Convention (C_Pass_By_Copy, seccomp);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seccomp.h:23

   --  skipped func __secure_computing

   function secure_computing (this_syscall : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seccomp.h:29
   pragma Import (CPP, secure_computing, "_ZL16secure_computingi");

  -- A wrapper for architectures supporting only SECCOMP_MODE_STRICT.  
   procedure secure_computing_strict (this_syscall : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seccomp.h:37
   pragma Import (CPP, secure_computing_strict, "_ZL23secure_computing_stricti");

   function prctl_get_seccomp return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seccomp.h:42
   pragma Import (CPP, prctl_get_seccomp, "_Z17prctl_get_seccompv");

   function prctl_set_seccomp (arg1 : unsigned_long; arg2 : Interfaces.C.Strings.chars_ptr) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seccomp.h:43
   pragma Import (CPP, prctl_set_seccomp, "_Z17prctl_set_seccompmPc");

   function seccomp_mode (s : access seccomp) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seccomp.h:45
   pragma Import (CPP, seccomp_mode, "_ZL12seccomp_modeP7seccomp");

   procedure put_seccomp_filter (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seccomp.h:77
   pragma Import (CPP, put_seccomp_filter, "_Z18put_seccomp_filterP11task_struct");

   procedure get_seccomp_filter (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seccomp.h:78
   pragma Import (CPP, get_seccomp_filter, "_Z18get_seccomp_filterP11task_struct");

end linux_seccomp_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with System;
limited with net_net_namespace_h;
limited with linux_sched_h;
limited with linux_cred_h;

package linux_nsproxy_h is

   --  skipped empty struct mnt_namespace

   --  skipped empty struct ipc_namespace

  -- * A structure to contain pointers to all per-process
  -- * namespaces - fs (mount), uts, network, sysvipc, etc.
  -- *
  -- * The pid namespace is an exception -- it's accessed using
  -- * task_active_pid_ns.  The pid namespace here is the
  -- * namespace that children will use.
  -- *
  -- * 'count' is the number of tasks holding a reference.
  -- * The count for each namespace, then, will be the number
  -- * of nsproxies pointing to it, not the number of tasks.
  -- *
  -- * The nsproxy is shared by tasks which share all namespaces.
  -- * As soon as a single namespace is cloned or unshared, the
  -- * nsproxy is copied.
  --  

   type nsproxy is record
      count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:30
      uts_ns : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:31
      ipc_ns : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:32
      mnt_ns : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:33
      pid_ns_for_children : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:34
      net_ns : access net_net_namespace_h.net;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:35
   end record;
   pragma Convention (C_Pass_By_Copy, nsproxy);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:29

   init_nsproxy : aliased nsproxy;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:37
   pragma Import (C, init_nsproxy, "init_nsproxy");

  -- * the namespaces access rules are:
  -- *
  -- *  1. only current task is allowed to change tsk->nsproxy pointer or
  -- *     any pointer on the nsproxy itself
  -- *
  -- *  2. when accessing (i.e. reading) current task's namespaces - no
  -- *     precautions should be taken - just dereference the pointers
  -- *
  -- *  3. the access to other task namespaces is performed like this
  -- *     rcu_read_lock();
  -- *     nsproxy = task_nsproxy(tsk);
  -- *     if (nsproxy != NULL) {
  -- *             / *
  -- *               * work with the namespaces here
  -- *               * e.g. get the reference on one of them
  -- *               * /
  -- *     } / *
  -- *         * NULL task_nsproxy() means that this task is
  -- *         * almost dead (zombie)
  -- *         * /
  -- *     rcu_read_unlock();
  -- *
  --  

   function task_nsproxy (tsk : access linux_sched_h.task_struct) return access nsproxy;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:64
   pragma Import (CPP, task_nsproxy, "_ZL12task_nsproxyP11task_struct");

   function copy_namespaces (flags : unsigned_long; tsk : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:69
   pragma Import (CPP, copy_namespaces, "_Z15copy_namespacesmP11task_struct");

   procedure exit_task_namespaces (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:70
   pragma Import (CPP, exit_task_namespaces, "_Z20exit_task_namespacesP11task_struct");

   procedure switch_task_namespaces (tsk : access linux_sched_h.task_struct; arg2 : access nsproxy);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:71
   pragma Import (CPP, switch_task_namespaces, "_Z22switch_task_namespacesP11task_structP7nsproxy");

   procedure free_nsproxy (ns : access nsproxy);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:72
   pragma Import (CPP, free_nsproxy, "_Z12free_nsproxyP7nsproxy");

   function unshare_nsproxy_namespaces
     (arg1 : unsigned_long;
      arg2 : System.Address;
      arg3 : access linux_cred_h.cred;
      arg4 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:73
   pragma Import (CPP, unshare_nsproxy_namespaces, "_Z26unshare_nsproxy_namespacesmPP7nsproxyP4credP9fs_struct");

   function nsproxy_cache_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:75
   pragma Import (CPP, nsproxy_cache_init, "_Z18nsproxy_cache_initv");

   procedure put_nsproxy (ns : access nsproxy);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:77
   pragma Import (CPP, put_nsproxy, "_ZL11put_nsproxyP7nsproxy");

   procedure get_nsproxy (ns : access nsproxy);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nsproxy.h:84
   pragma Import (CPP, get_nsproxy, "_ZL11get_nsproxyP7nsproxy");

end linux_nsproxy_h;

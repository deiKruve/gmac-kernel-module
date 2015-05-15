pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;
limited with linux_sched_h;
with Interfaces.C.Extensions;

package linux_pid_h is

   --  arg-macro: procedure do_each_pid_task do { if ((pid) /= NULL) hlist_for_each_entry_rcu((task), and(pid).tasks(type), pids(type).node) {
   --    do { if ((pid) /= NULL) hlist_for_each_entry_rcu((task), and(pid).tasks(type), pids(type).node) {
   --  arg-macro: procedure while_each_pid_task if (type = PIDTYPE_PID) break; } } while (0)
   --    if (type = PIDTYPE_PID) break; } } while (0)
   --  arg-macro: procedure do_each_pid_thread do_each_pid_task(pid, type, task) { struct task_struct *tg___ := task; do {
   --    do_each_pid_task(pid, type, task) { struct task_struct *tg___ := task; do {
   --  arg-macro: procedure while_each_pid_thread } while_each_thread(tg___, task); task := tg___; } while_each_pid_task(pid, type, task)
   --    } while_each_thread(tg___, task); task := tg___; } while_each_pid_task(pid, type, task)
   type pid_type is 
     (PIDTYPE_PID,
      PIDTYPE_PGID,
      PIDTYPE_SID,
      PIDTYPE_MAX);
   pragma Convention (C, pid_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:6

  -- * What is struct pid?
  -- *
  -- * A struct pid is the kernel's internal notion of a process identifier.
  -- * It refers to individual tasks, process groups, and sessions.  While
  -- * there are processes attached to it the struct pid lives in a hash
  -- * table, so it and then the processes that it refers to can be found
  -- * quickly from the numeric pid value.  The attached processes may be
  -- * quickly accessed by following pointers from struct pid.
  -- *
  -- * Storing pid_t values in the kernel and referring to them later has a
  -- * problem.  The process originally with that pid may have exited and the
  -- * pid allocator wrapped, and another process could have come along
  -- * and been assigned that pid.
  -- *
  -- * Referring to user space processes by holding a reference to struct
  -- * task_struct has a problem.  When the user space process exits
  -- * the now useless task_struct is still kept.  A task_struct plus a
  -- * stack consumes around 10K of low kernel memory.  More precisely
  -- * this is THREAD_SIZE + sizeof(struct task_struct).  By comparison
  -- * a struct pid is about 64 bytes.
  -- *
  -- * Holding a reference to struct pid solves both of these problems.
  -- * It is small so holding a reference does not consume a lot of
  -- * resources, and since a new struct pid is allocated when the numeric pid
  -- * value is reused (when pids wrap around) we don't mistakenly refer to new
  -- * processes.
  --  

  -- * struct upid is used to get the id of the struct pid, as it is
  -- * seen in particular namespace. Later the struct pid is found with
  -- * find_pid_ns() using the int nr and struct pid_namespace *ns.
  --  

  -- Try to keep pid_chain in the same cacheline as nr for find_vpid  
   type upid is record
      nr : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:52
      ns : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:53
      pid_chain : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:54
   end record;
   pragma Convention (C_Pass_By_Copy, upid);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:50

   --  skipped empty struct pid_namespace

   type pid_tasks_array is array (0 .. 2) of aliased linux_types_h.hlist_head;
   type pid_numbers_array is array (0 .. 0) of aliased upid;
   type pid is record
      count : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:59
      level : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:60
      tasks : aliased pid_tasks_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:62
      rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:63
      numbers : aliased pid_numbers_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:64
   end record;
   pragma Convention (C_Pass_By_Copy, pid);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:57

  -- lists of tasks that use this pid  
   init_struct_pid : aliased pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:67
   pragma Import (C, init_struct_pid, "init_struct_pid");

   type pid_link is record
      node : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:71
      the_pid : access pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:72
   end record;
   pragma Convention (C_Pass_By_Copy, pid_link);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:69

   function get_pid (the_pid : access pid) return access pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:75
   pragma Import (CPP, get_pid, "_ZL7get_pidP3pid");

   procedure put_pid (the_pid : access pid);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:82
   pragma Import (CPP, put_pid, "_Z7put_pidP3pid");

   function pid_task (the_pid : access pid; arg2 : pid_type) return access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:83
   pragma Import (CPP, pid_task, "_Z8pid_taskP3pid8pid_type");

   function get_pid_task (the_pid : access pid; arg2 : pid_type) return access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:84
   pragma Import (CPP, get_pid_task, "_Z12get_pid_taskP3pid8pid_type");

   function get_task_pid (c_task : access linux_sched_h.task_struct; c_type : pid_type) return access pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:86
   pragma Import (CPP, get_task_pid, "_Z12get_task_pidP11task_struct8pid_type");

  -- * these helpers must be called with the tasklist_lock write-held.
  --  

   procedure attach_pid (c_task : access linux_sched_h.task_struct; arg2 : pid_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:91
   pragma Import (CPP, attach_pid, "_Z10attach_pidP11task_struct8pid_type");

   procedure detach_pid (c_task : access linux_sched_h.task_struct; arg2 : pid_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:92
   pragma Import (CPP, detach_pid, "_Z10detach_pidP11task_struct8pid_type");

   procedure change_pid
     (c_task : access linux_sched_h.task_struct;
      arg2 : pid_type;
      the_pid : access pid);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:93
   pragma Import (CPP, change_pid, "_Z10change_pidP11task_struct8pid_typeP3pid");

   procedure transfer_pid (old : access linux_sched_h.task_struct; arg2 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:95
   pragma Import (CPP, transfer_pid, "_Z12transfer_pidP11task_structS0_");

  -- * look up a PID in the hash table. Must be called with the tasklist_lock
  -- * or rcu_read_lock() held.
  -- *
  -- * find_pid_ns() finds the pid in the namespace specified
  -- * find_vpid() finds the pid by its virtual id, i.e. in the current namespace
  -- *
  -- * see also find_task_by_vpid() set in include/linux/sched.h
  --  

   function find_pid_ns (nr : int; ns : System.Address) return access pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:110
   pragma Import (CPP, find_pid_ns, "_Z11find_pid_nsiP13pid_namespace");

   function find_vpid (nr : int) return access pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:111
   pragma Import (CPP, find_vpid, "_Z9find_vpidi");

  -- * Lookup a PID in the hash table, and return with it's count elevated.
  --  

   function find_get_pid (nr : int) return access pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:116
   pragma Import (CPP, find_get_pid, "_Z12find_get_pidi");

   function find_ge_pid (nr : int; arg2 : System.Address) return access pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:117
   pragma Import (CPP, find_ge_pid, "_Z11find_ge_pidiP13pid_namespace");

   function next_pidmap (pid_ns : System.Address; last : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:118
   pragma Import (CPP, next_pidmap, "_Z11next_pidmapP13pid_namespacej");

   function alloc_pid (ns : System.Address) return access pid;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:120
   pragma Import (CPP, alloc_pid, "_Z9alloc_pidP13pid_namespace");

   procedure free_pid (the_pid : access pid);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:121
   pragma Import (CPP, free_pid, "_Z8free_pidP3pid");

   procedure disable_pid_allocation (ns : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:122
   pragma Import (CPP, disable_pid_allocation, "_Z22disable_pid_allocationP13pid_namespace");

  -- * ns_of_pid() returns the pid namespace in which the specified pid was
  -- * allocated.
  -- *
  -- * NOTE:
  -- * 	ns_of_pid() is expected to be called for a process (task) that has
  -- * 	an attached 'struct pid' (see attach_pid(), detach_pid()) i.e @pid
  -- * 	is expected to be non-NULL. If @pid is NULL, caller should handle
  -- * 	the resulting NULL pid-ns.
  --  

   function ns_of_pid (the_pid : access pid) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:134
   pragma Import (CPP, ns_of_pid, "_ZL9ns_of_pidP3pid");

  -- * is_child_reaper returns true if the pid is the init process
  -- * of the current namespace. As this one could be checked before
  -- * pid_ns->child_reaper is assigned in copy_process, we check
  -- * with the pid number.
  --  

   function is_child_reaper (the_pid : access pid) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:148
   pragma Import (CPP, is_child_reaper, "_ZL15is_child_reaperP3pid");

  -- * the helpers to get the pid's id seen from different namespaces
  -- *
  -- * pid_nr()    : global id, i.e. the id seen from the init namespace;
  -- * pid_vnr()   : virtual id, i.e. the id seen from the pid namespace of
  -- *               current.
  -- * pid_nr_ns() : id seen from the ns specified.
  -- *
  -- * see also task_xid_nr() etc in include/linux/sched.h
  --  

   function pid_nr (the_pid : access pid) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:164
   pragma Import (CPP, pid_nr, "_ZL6pid_nrP3pid");

   function pid_nr_ns (the_pid : access pid; ns : System.Address) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:172
   pragma Import (CPP, pid_nr_ns, "_Z9pid_nr_nsP3pidP13pid_namespace");

   function pid_vnr (the_pid : access pid) return linux_types_h.pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pid.h:173
   pragma Import (CPP, pid_vnr, "_Z7pid_vnrP3pid");

  --			 * Both old and new leaders may be attached to
  --			 * the same pid in the middle of de_thread().
  --			  

end linux_pid_h;

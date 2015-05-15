pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sched_h;
limited with uapi_linux_cgroupstats_h;
limited with linux_dcache_h;
limited with linux_seq_file_h;
with System;
with linux_percpu_refcount_h;
with linux_types_h;
with asm_generic_int_ll64_h;
with linux_workqueue_h;
with Interfaces.C.Extensions;
limited with linux_kernfs_h;
with linux_mutex_h;
with linux_wait_h;
with linux_idr_h;
with Interfaces.C.Strings;

package linux_cgroup_h is

   --  unsupported macro: MAX_CGROUP_ROOT_NAMELEN 64
   --  unsupported macro: MAX_CFTYPE_NAME 64
   --  arg-macro: procedure cgroup_taskset_for_each for ((task) := cgroup_taskset_first((tset)); (task); (task) := cgroup_taskset_next((tset)))
   --    for ((task) := cgroup_taskset_first((tset)); (task); (task) := cgroup_taskset_next((tset)))
   --  unsupported macro: MAX_CGROUP_TYPE_NAMELEN 32
   --  arg-macro: procedure task_css_set_check rcu_dereference((task).cgroups)
   --    rcu_dereference((task).cgroups)
   --  arg-macro: procedure task_css_check task_css_set_check((task), (__c)).subsys((subsys_id))
   --    task_css_set_check((task), (__c)).subsys((subsys_id))
   --  arg-macro: procedure css_for_each_child for ((pos) := css_next_child(NULL, (parent)); (pos); (pos) := css_next_child((pos), (parent)))
   --    for ((pos) := css_next_child(NULL, (parent)); (pos); (pos) := css_next_child((pos), (parent)))
   --  arg-macro: procedure css_for_each_descendant_pre for ((pos) := css_next_descendant_pre(NULL, (css)); (pos); (pos) := css_next_descendant_pre((pos), (css)))
   --    for ((pos) := css_next_descendant_pre(NULL, (css)); (pos); (pos) := css_next_descendant_pre((pos), (css)))
   --  arg-macro: procedure css_for_each_descendant_post for ((pos) := css_next_descendant_post(NULL, (css)); (pos); (pos) := css_next_descendant_post((pos), (css)))
   --    for ((pos) := css_next_descendant_post(NULL, (css)); (pos); (pos) := css_next_descendant_post((pos), (css)))
  -- *  cgroup interface
  -- *
  -- *  Copyright (C) 2003 BULL SA
  -- *  Copyright (C) 2004-2006 Silicon Graphics, Inc.
  -- *
  --  

   function cgroup_init_early return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:33
   pragma Import (CPP, cgroup_init_early, "_Z17cgroup_init_earlyv");

   function cgroup_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:34
   pragma Import (CPP, cgroup_init, "_Z11cgroup_initv");

   procedure cgroup_fork (p : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:35
   pragma Import (CPP, cgroup_fork, "_Z11cgroup_forkP11task_struct");

   procedure cgroup_post_fork (p : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:36
   pragma Import (CPP, cgroup_post_fork, "_Z16cgroup_post_forkP11task_struct");

   procedure cgroup_exit (p : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:37
   pragma Import (CPP, cgroup_exit, "_Z11cgroup_exitP11task_struct");

   function cgroupstats_build (stats : access uapi_linux_cgroupstats_h.cgroupstats; the_dentry : access linux_dcache_h.dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:38
   pragma Import (CPP, cgroupstats_build, "_Z17cgroupstats_buildP11cgroupstatsP6dentry");

   function proc_cgroup_show (arg1 : access linux_seq_file_h.seq_file; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:41
   pragma Import (CPP, proc_cgroup_show, "_Z16proc_cgroup_showP8seq_filePv");

  -- define the enumeration of all cgroup subsystems  
   type cgroup_subsys_id is 
     (cpuset_cgrp_id,
      cpu_cgrp_id,
      cpuacct_cgrp_id,
      memory_cgrp_id,
      devices_cgrp_id,
      freezer_cgrp_id,
      net_cls_cgrp_id,
      blkio_cgrp_id,
      perf_event_cgrp_id,
      net_prio_cgrp_id,
      CGROUP_SUBSYS_COUNT);
   pragma Convention (C, cgroup_subsys_id);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:45

  -- * Per-subsystem/per-cgroup state maintained by the system.  This is the
  -- * fundamental structural building block that controllers deal with.
  -- *
  -- * Fields marked with "PI:" are public and immutable and may be accessed
  -- * directly without synchronization.
  --  

  -- PI: the cgroup that this css is attached to  
   type cgroup;
   type cgroup_subsys;
   type cgroup_subsys_state is record
      the_cgroup : access cgroup;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:60
      ss : access cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:63
      refcnt : aliased linux_percpu_refcount_h.percpu_ref;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:66
      parent : access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:69
      sibling : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:72
      children : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:73
      id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:79
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:81
      serial_nr : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:89
      the_callback_head : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:92
      destroy_work : aliased linux_workqueue_h.work_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:93
   end record;
   pragma Convention (C_Pass_By_Copy, cgroup_subsys_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:58

  -- PI: the cgroup subsystem that this css is attached to  
  -- reference count - access via css_[try]get() and css_put()  
  -- PI: the parent css  
  -- siblings list anchored at the parent's ->children  
  --	 * PI: Subsys-unique ID.  0 is unused and root is always 1.  The
  --	 * matching css can be looked up using css_from_id().
  --	  

  --	 * Monotonically increasing unique serial number which defines a
  --	 * uniform order among all csses.  It's guaranteed that all
  --	 * ->children lists are in the ascending order of ->serial_nr and
  --	 * used to allow interrupting and resuming iterations.
  --	  

  -- percpu_ref killing and RCU release  
  -- bits in struct cgroup_subsys_state flags field  
  -- no reference counting for this css  
  -- between ->css_online() and ->css_offline()  
  -- refcnt reached zero, released  
  --*
  -- * css_get - obtain a reference on the specified css
  -- * @css: target css
  -- *
  -- * The caller must already have a reference.
  --  

   procedure css_get (css : access cgroup_subsys_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:109
   pragma Import (CPP, css_get, "_ZL7css_getP19cgroup_subsys_state");

  --*
  -- * css_tryget - try to obtain a reference on the specified css
  -- * @css: target css
  -- *
  -- * Obtain a reference on @css unless it already has reached zero and is
  -- * being released.  This function doesn't care whether @css is on or
  -- * offline.  The caller naturally needs to ensure that @css is accessible
  -- * but doesn't have to be holding a reference on it - IOW, RCU protected
  -- * access is good enough for this function.  Returns %true if a reference
  -- * count was successfully obtained; %false otherwise.
  --  

   function css_tryget (css : access cgroup_subsys_state) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:126
   pragma Import (CPP, css_tryget, "_ZL10css_trygetP19cgroup_subsys_state");

  --*
  -- * css_tryget_online - try to obtain a reference on the specified css if online
  -- * @css: target css
  -- *
  -- * Obtain a reference on @css if it's online.  The caller naturally needs
  -- * to ensure that @css is accessible but doesn't have to be holding a
  -- * reference on it - IOW, RCU protected access is good enough for this
  -- * function.  Returns %true if a reference count was successfully obtained;
  -- * %false otherwise.
  --  

   function css_tryget_online (css : access cgroup_subsys_state) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:143
   pragma Import (CPP, css_tryget_online, "_ZL17css_tryget_onlineP19cgroup_subsys_state");

  --*
  -- * css_put - put a css reference
  -- * @css: target css
  -- *
  -- * Put a reference obtained via css_get() and css_tryget_online().
  --  

   procedure css_put (css : access cgroup_subsys_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:156
   pragma Import (CPP, css_put, "_ZL7css_putP19cgroup_subsys_state");

  -- bits in struct cgroup flags field  
  --	 * Control Group has previously had a child cgroup or a task,
  --	 * but no longer (only if CGRP_NOTIFY_ON_RELEASE is set)
  --	  

  -- Control Group requires release notifications to userspace  
  --	 * Clone the parent's configuration when creating a new child
  --	 * cpuset cgroup.  For historical reasons, this option can be
  --	 * specified at mount time and thus is implemented here.
  --	  

  -- self css with NULL ->ss, points back to this cgroup  
   type cgroup is record
      self : aliased cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:181
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:183
      id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:193
      populated_cnt : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:201
      kn : access linux_kernfs_h.kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:203
      populated_kn : access linux_kernfs_h.kernfs_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:204
      child_subsys_mask : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:207
      subsys : aliased cgroup_subsys_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:210
      root : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:212
      cset_links : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:218
      e_csets : aliased cgroup_e_csets_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:227
      release_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:234
      pidlists : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:240
      pidlist_mutex : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:241
      offline_waitq : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:244
   end record;
   pragma Convention (C_Pass_By_Copy, cgroup);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:179

  -- "unsigned long" so bitops work  
  --	 * idr allocated in-hierarchy ID.
  --	 *
  --	 * ID 0 is not used, the ID of the root cgroup is always 1, and a
  --	 * new cgroup will be assigned with a smallest available ID.
  --	 *
  --	 * Allocating/Removing ID must be protected by cgroup_mutex.
  --	  

  --	 * If this cgroup contains any tasks, it contributes one to
  --	 * populated_cnt.  All children with non-zero popuplated_cnt of
  --	 * their own contribute one.  The count is zero iff there's no task
  --	 * in this cgroup or its subtree.
  --	  

  -- cgroup kernfs entry  
  -- kn for "cgroup.subtree_populated"  
  -- the bitmask of subsystems enabled on the child cgroups  
  -- Private pointers for each registered subsystem  
  --	 * List of cgrp_cset_links pointing at css_sets with tasks in this
  --	 * cgroup.  Protected by css_set_lock.
  --	  

  --	 * On the default hierarchy, a css_set for a cgroup with some
  --	 * susbsys disabled will point to css's which are associated with
  --	 * the closest ancestor which has the subsys enabled.  The
  --	 * following lists all css_sets which point to this cgroup's css
  --	 * for the given subsystem.
  --	  

  --	 * Linked list running through all cgroups that can
  --	 * potentially be reaped by the release agent. Protected by
  --	 * release_list_lock
  --	  

  --	 * list of pidlists, up to two for each namespace (one for procs, one
  --	 * for tasks); created on demand.
  --	  

  -- used to wait for offlining of csses  
  -- cgroup_root->flags  
  --	 * Unfortunately, cgroup core and various controllers are riddled
  --	 * with idiosyncrasies and pointless options.  The following flag,
  --	 * when set, will force sane behavior - some options are forced on,
  --	 * others are disallowed, and some controllers will change their
  --	 * hierarchical or other behaviors.
  --	 *
  --	 * The set of behaviors affected by this flag are still being
  --	 * determined and developed and the mount option for this flag is
  --	 * prefixed with __DEVEL__.  The prefix will be dropped once we
  --	 * reach the point where all behaviors are compatible with the
  --	 * planned unified hierarchy, which will automatically turn on this
  --	 * flag.
  --	 *
  --	 * The followings are the behaviors currently affected this flag.
  --	 *
  --	 * - Mount options "noprefix", "xattr", "clone_children",
  --	 *   "release_agent" and "name" are disallowed.
  --	 *
  --	 * - When mounting an existing superblock, mount options should
  --	 *   match.
  --	 *
  --	 * - Remount is disallowed.
  --	 *
  --	 * - rename(2) is disallowed.
  --	 *
  --	 * - "tasks" is removed.  Everything should be at process
  --	 *   granularity.  Use "cgroup.procs" instead.
  --	 *
  --	 * - "cgroup.procs" is not sorted.  pids will be unique unless they
  --	 *   got recycled inbetween reads.
  --	 *
  --	 * - "release_agent" and "notify_on_release" are removed.
  --	 *   Replacement notification mechanism will be implemented.
  --	 *
  --	 * - "cgroup.clone_children" is removed.
  --	 *
  --	 * - "cgroup.subtree_populated" is available.  Its value is 0 if
  --	 *   the cgroup and its descendants contain no task; otherwise, 1.
  --	 *   The file also generates kernfs notification which can be
  --	 *   monitored through poll and [di]notify when the value of the
  --	 *   file changes.
  --	 *
  --	 * - If mount is requested with sane_behavior but without any
  --	 *   subsystem, the default unified hierarchy is mounted.
  --	 *
  --	 * - cpuset: tasks will be kept in empty cpusets when hotplug happens
  --	 *   and take masks of ancestors with non-empty cpus/mems, instead of
  --	 *   being moved to an ancestor.
  --	 *
  --	 * - cpuset: a task can be moved into an empty cpuset, and again it
  --	 *   takes masks of ancestors.
  --	 *
  --	 * - memcg: use_hierarchy is on by default and the cgroup file for
  --	 *   the flag is not created.
  --	 *
  --	 * - blkcg: blk-throttle becomes properly hierarchical.
  --	 *
  --	 * - debug: disallowed on the default hierarchy.
  --	  

  -- mounted subsystems have no named prefix  
  -- supports extended attributes  
  -- mount options live below bit 16  
  -- * A cgroup_root represents the root of a cgroup hierarchy, and may be
  -- * associated with a kernfs_root to form an active hierarchy.  This is
  -- * internal to cgroup core.  Don't access directly from controllers.
  --  

   subtype cgroup_root_release_agent_path_array is Interfaces.C.char_array (0 .. 4095);
   subtype cgroup_root_name_array is Interfaces.C.char_array (0 .. 63);
   type cgroup_root is record
      kf_root : access linux_kernfs_h.kernfs_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:326
      subsys_mask : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:329
      hierarchy_id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:332
      cgrp : aliased cgroup;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:335
      nr_cgrps : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:338
      root_list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:341
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:344
      cgroup_idr : aliased linux_idr_h.idr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:347
      release_agent_path : aliased cgroup_root_release_agent_path_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:350
      name : aliased cgroup_root_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:353
   end record;
   pragma Convention (C_Pass_By_Copy, cgroup_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:325

  -- The bitmask of subsystems attached to this hierarchy  
  -- Unique id for this hierarchy.  
  -- The root cgroup.  Root is destroyed on its release.  
  -- Number of cgroups in the hierarchy, used only for /proc/cgroups  
  -- A list running through the active hierarchies  
  -- Hierarchy-specific flags  
  -- IDs for cgroups in this hierarchy  
  -- The path to use for release notifications.  
  -- The name for this hierarchy - may be empty  
  -- * A css_set is a structure holding pointers to a set of
  -- * cgroup_subsys_state objects. This saves space in the task struct
  -- * object and speeds up fork()/exit(), since a single inc/dec and a
  -- * list_add()/del() can bump the reference count on the entire cgroup
  -- * set for a task.
  --  

  -- Reference count  
   type css_set_subsys_array is array (0 .. 9) of access cgroup_subsys_state;
   type css_set_e_cset_node_array is array (0 .. 9) of aliased linux_types_h.list_head;
   type css_set is record
      refcount : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:367
      hlist : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:373
      tasks : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:382
      mg_tasks : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:383
      cgrp_links : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:389
      dfl_cgrp : access cgroup;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:392
      subsys : aliased css_set_subsys_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:399
      mg_preload_node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:405
      mg_node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:406
      mg_src_cgrp : access cgroup;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:415
      mg_dst_cset : access css_set;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:416
      e_cset_node : aliased css_set_e_cset_node_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:425
      the_callback_head : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:428
   end record;
   pragma Convention (C_Pass_By_Copy, css_set);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:364

  --	 * List running through all cgroup groups in the same hash
  --	 * slot. Protected by css_set_lock
  --	  

  --	 * Lists running through all tasks using this cgroup group.
  --	 * mg_tasks lists tasks which belong to this cset but are in the
  --	 * process of being migrated out or in.  Protected by
  --	 * css_set_rwsem, but, during migration, once tasks are moved to
  --	 * mg_tasks, it can be read safely while holding cgroup_mutex.
  --	  

  --	 * List of cgrp_cset_links pointing at cgroups referenced from this
  --	 * css_set.  Protected by css_set_lock.
  --	  

  -- the default cgroup associated with this css_set  
  --	 * Set of subsystem states, one for each subsystem. This array is
  --	 * immutable after creation apart from the init_css_set during
  --	 * subsystem registration (at boot time).
  --	  

  --	 * List of csets participating in the on-going migration either as
  --	 * source or destination.  Protected by cgroup_mutex.
  --	  

  --	 * If this cset is acting as the source of migration the following
  --	 * two fields are set.  mg_src_cgrp is the source cgroup of the
  --	 * on-going migration and mg_dst_cset is the destination cset the
  --	 * target tasks on this cset should be migrated to.  Protected by
  --	 * cgroup_mutex.
  --	  

  --	 * On the default hierarhcy, ->subsys[ssid] may point to a css
  --	 * attached to an ancestor instead of the cgroup this css_set is
  --	 * associated with.  The following node is anchored at
  --	 * ->subsys[ssid]->cgroup->e_csets[ssid] and provides a way to
  --	 * iterate through all css's attached to a given cgroup.
  --	  

  -- For RCU-protected deletion  
  -- * struct cftype: handler definitions for cgroup control files
  -- *
  -- * When reading/writing to a file:
  -- *	- the cgroup to use is file->f_dentry->d_parent->d_fsdata
  -- *	- the 'cftype' of the file is file->f_dentry->d_fsdata
  --  

  -- cftype->flags  
  -- only create on root cgrp  
  -- don't create on root cgrp  
  -- don't create if sane_behavior  
  -- (DON'T USE FOR NEW FILES) no subsys prefix  
  -- only on default hierarchy  
  --	 * By convention, the name should begin with the name of the
  --	 * subsystem, followed by a period.  Zero length string indicates
  --	 * end of cftype array.
  --	  

   subtype cftype_name_array is Interfaces.C.char_array (0 .. 63);
   type cftype is record
      name : aliased cftype_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:456
      mode : aliased linux_types_h.umode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:462
      max_write_len : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:468
      flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:471
      ss : access cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:477
      node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:478
      kf_ops : access linux_kernfs_h.kernfs_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:479
      read_u64 : access function (arg1 : access cgroup_subsys_state; arg2 : access cftype) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:485
      read_s64 : access function (arg1 : access cgroup_subsys_state; arg2 : access cftype) return asm_generic_int_ll64_h.s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:489
      seq_show : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:492
      seq_start : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : access linux_types_h.loff_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:495
      seq_next : access function
           (arg1 : access linux_seq_file_h.seq_file;
            arg2 : System.Address;
            arg3 : access linux_types_h.loff_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:496
      seq_stop : access procedure (arg1 : access linux_seq_file_h.seq_file; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:497
      write_u64 : access function
           (arg1 : access cgroup_subsys_state;
            arg2 : access cftype;
            arg3 : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:505
      write_s64 : access function
           (arg1 : access cgroup_subsys_state;
            arg2 : access cftype;
            arg3 : asm_generic_int_ll64_h.s64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:510
      write : access function
           (arg1 : access linux_kernfs_h.kernfs_open_file;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : linux_types_h.size_t;
            arg4 : linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:519
   end record;
   pragma Convention (C_Pass_By_Copy, cftype);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:450

  --	 * If not 0, file mode is set to this value, otherwise it will
  --	 * be figured out automatically
  --	  

  --	 * The maximum length of string, excluding trailing nul, that can
  --	 * be passed to write.  If < PAGE_SIZE-1, PAGE_SIZE-1 is assumed.
  --	  

  -- CFTYPE_* flags  
  --	 * Fields used for internal bookkeeping.  Initialized automatically
  --	 * during registration.
  --	  

  -- NULL for cgroup core files  
  -- anchored at ss->cfts  
  --	 * read_u64() is a shortcut for the common case of returning a
  --	 * single integer. Use it in place of read()
  --	  

  --	 * read_s64() is a signed version of read_u64()
  --	  

  -- generic seq_file read interface  
  -- optional ops, implement all or none  
  --	 * write_u64() is a shortcut for the common case of accepting
  --	 * a single integer (as parsed by simple_strtoull) from
  --	 * userspace. Use in place of write(); return 0 or error.
  --	  

  --	 * write_s64() is a signed version of write_u64()
  --	  

  --	 * write() is the generic write callback which maps directly to
  --	 * kernfs write operation and overrides all other operations.
  --	 * Maximum write size is determined by ->max_write_len.  Use
  --	 * of_css/cft() to access the associated css and cft.
  --	  

   cgrp_dfl_root : aliased cgroup_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:526
   pragma Import (C, cgrp_dfl_root, "cgrp_dfl_root");

   init_css_set : aliased css_set;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:527
   pragma Import (C, init_css_set, "init_css_set");

   function cgroup_on_dfl (cgrp : access constant cgroup) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:529
   pragma Import (CPP, cgroup_on_dfl, "_ZL13cgroup_on_dflPK6cgroup");

  -- * See the comment above CGRP_ROOT_SANE_BEHAVIOR for details.  This
  -- * function can be called as long as @cgrp is accessible.
  --  

   function cgroup_sane_behavior (cgrp : access constant cgroup) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:538
   pragma Import (CPP, cgroup_sane_behavior, "_ZL20cgroup_sane_behaviorPK6cgroup");

  -- no synchronization, the result can only be used as a hint  
   function cgroup_has_tasks (cgrp : access cgroup) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:544
   pragma Import (CPP, cgroup_has_tasks, "_ZL16cgroup_has_tasksP6cgroup");

  -- returns ino associated with a cgroup, 0 indicates unmounted root  
   function cgroup_ino (cgrp : access cgroup) return linux_types_h.ino_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:550
   pragma Import (CPP, cgroup_ino, "_ZL10cgroup_inoP6cgroup");

  -- cft/css accessors for cftype->write() operation  
   function of_cft (c_of : access linux_kernfs_h.kernfs_open_file) return access cftype;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:559
   pragma Import (CPP, of_cft, "_ZL6of_cftP16kernfs_open_file");

   function of_css (c_of : access linux_kernfs_h.kernfs_open_file) return access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:564
   pragma Import (CPP, of_css, "_Z6of_cssP16kernfs_open_file");

  -- cft/css accessors for cftype->seq_*() operations  
   function seq_cft (seq : access linux_seq_file_h.seq_file) return access cftype;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:567
   pragma Import (CPP, seq_cft, "_ZL7seq_cftP8seq_file");

   function seq_css (seq : access linux_seq_file_h.seq_file) return access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:572
   pragma Import (CPP, seq_css, "_ZL7seq_cssP8seq_file");

  -- * Name / path handling functions.  All are thin wrappers around the kernfs
  -- * counterparts and can be called under any context.
  --  

   function cgroup_name
     (cgrp : access cgroup;
      buf : Interfaces.C.Strings.chars_ptr;
      buflen : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:582
   pragma Import (CPP, cgroup_name, "_ZL11cgroup_nameP6cgroupPcm");

   function cgroup_path
     (cgrp : access cgroup;
      buf : Interfaces.C.Strings.chars_ptr;
      buflen : linux_types_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:587
   pragma Import (CPP, cgroup_path, "_ZL11cgroup_pathP6cgroupPcm");

   procedure pr_cont_cgroup_name (cgrp : access cgroup);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:593
   pragma Import (CPP, pr_cont_cgroup_name, "_ZL19pr_cont_cgroup_nameP6cgroup");

   procedure pr_cont_cgroup_path (cgrp : access cgroup);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:598
   pragma Import (CPP, pr_cont_cgroup_path, "_ZL19pr_cont_cgroup_pathP6cgroup");

   function task_cgroup_path
     (c_task : access linux_sched_h.task_struct;
      buf : Interfaces.C.Strings.chars_ptr;
      buflen : linux_types_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:603
   pragma Import (CPP, task_cgroup_path, "_Z16task_cgroup_pathP11task_structPcm");

   function cgroup_add_cftypes (ss : access cgroup_subsys; cfts : access cftype) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:605
   pragma Import (CPP, cgroup_add_cftypes, "_Z18cgroup_add_cftypesP13cgroup_subsysP6cftype");

   function cgroup_rm_cftypes (cfts : access cftype) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:606
   pragma Import (CPP, cgroup_rm_cftypes, "_Z17cgroup_rm_cftypesP6cftype");

   function cgroup_is_descendant (cgrp : access cgroup; ancestor : access cgroup) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:608
   pragma Import (CPP, cgroup_is_descendant, "_Z20cgroup_is_descendantP6cgroupS0_");

  -- * Control Group taskset, used to pass around set of tasks to cgroup_subsys
  -- * methods.
  --  

   --  skipped empty struct cgroup_taskset

   function cgroup_taskset_first (tset : System.Address) return access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:615
   pragma Import (CPP, cgroup_taskset_first, "_Z20cgroup_taskset_firstP14cgroup_taskset");

   function cgroup_taskset_next (tset : System.Address) return access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:616
   pragma Import (CPP, cgroup_taskset_next, "_Z19cgroup_taskset_nextP14cgroup_taskset");

  --*
  -- * cgroup_taskset_for_each - iterate cgroup_taskset
  -- * @task: the loop cursor
  -- * @tset: taskset to iterate
  --  

  -- * Control Group subsystem type.
  -- * See Documentation/cgroups/cgroups.txt for details
  --  

   type cgroup_subsys is record
      css_alloc : access function (arg1 : access cgroup_subsys_state) return access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:633
      css_online : access function (arg1 : access cgroup_subsys_state) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:634
      css_offline : access procedure (arg1 : access cgroup_subsys_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:635
      css_free : access procedure (arg1 : access cgroup_subsys_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:636
      can_attach : access function (arg1 : access cgroup_subsys_state; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:639
      cancel_attach : access procedure (arg1 : access cgroup_subsys_state; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:641
      attach : access procedure (arg1 : access cgroup_subsys_state; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:643
      fork : access procedure (arg1 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:644
      c_exit : access procedure
           (arg1 : access cgroup_subsys_state;
            arg2 : access cgroup_subsys_state;
            arg3 : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:647
      bind : access procedure (arg1 : access cgroup_subsys_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:648
      disabled : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:650
      early_init : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:651
      broken_hierarchy : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:665
      warned_broken_hierarchy : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:666
      id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:669
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:671
      root : access cgroup_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:674
      css_idr : aliased linux_idr_h.idr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:677
      cfts : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:683
      base_cftypes : access cftype;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:686
   end record;
   pragma Convention (C_Pass_By_Copy, cgroup_subsys);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:632

  --	 * If %false, this subsystem is properly hierarchical -
  --	 * configuration, resource accounting and restriction on a parent
  --	 * cgroup cover those of its children.  If %true, hierarchy support
  --	 * is broken in some ways - some subsystems ignore hierarchy
  --	 * completely while others are only implemented half-way.
  --	 *
  --	 * It's now disallowed to create nested cgroups if the subsystem is
  --	 * broken and cgroup core will emit a warning message on such
  --	 * cases.  Eventually, all subsystems will be made properly
  --	 * hierarchical and this will go away.
  --	  

  -- the following two fields are initialized automtically during boot  
  -- link to parent, protected by cgroup_lock()  
  -- idr for css->id  
  --	 * List of cftypes.  Each entry is the first entry of an array
  --	 * terminated by zero length name.
  --	  

  -- base cftypes, automatically registered with subsys itself  
  --*
  -- * task_css_set_check - obtain a task's css_set with extra access conditions
  -- * @task: the task to obtain css_set for
  -- * @__c: extra condition expression to be passed to rcu_dereference_check()
  -- *
  -- * A task's css_set is RCU protected, initialized and exited while holding
  -- * task_lock(), and can only be modified while holding both cgroup_mutex
  -- * and task_lock() while the task is alive.  This macro verifies that the
  -- * caller is inside proper critical section and returns @task's css_set.
  -- *
  -- * The caller can also specify additional allowed conditions via @__c, such
  -- * as locks used during the cgroup_subsys::attach() methods.
  --  

  --*
  -- * task_css_check - obtain css for (task, subsys) w/ extra access conds
  -- * @task: the target task
  -- * @subsys_id: the target subsystem ID
  -- * @__c: extra condition expression to be passed to rcu_dereference_check()
  -- *
  -- * Return the cgroup_subsys_state for the (@task, @subsys_id) pair.  The
  -- * synchronization rules are the same as task_css_set_check().
  --  

  --*
  -- * task_css_set - obtain a task's css_set
  -- * @task: the task to obtain css_set for
  -- *
  -- * See task_css_set_check().
  --  

   function task_css_set (c_task : access linux_sched_h.task_struct) return access css_set;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:737
   pragma Import (CPP, task_css_set, "_ZL12task_css_setP11task_struct");

  --*
  -- * task_css - obtain css for (task, subsys)
  -- * @task: the target task
  -- * @subsys_id: the target subsystem ID
  -- *
  -- * See task_css_check().
  --  

   function task_css (c_task : access linux_sched_h.task_struct; subsys_id : int) return access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:749
   pragma Import (CPP, task_css, "_ZL8task_cssP11task_structi");

  --*
  -- * task_css_is_root - test whether a task belongs to the root css
  -- * @task: the target task
  -- * @subsys_id: the target subsystem ID
  -- *
  -- * Test whether @task belongs to the root css on the specified subsystem.
  -- * May be invoked in any context.
  --  

   function task_css_is_root (c_task : access linux_sched_h.task_struct; subsys_id : int) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:763
   pragma Import (CPP, task_css_is_root, "_ZL16task_css_is_rootP11task_structi");

   function task_cgroup (c_task : access linux_sched_h.task_struct; subsys_id : int) return access cgroup;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:769
   pragma Import (CPP, task_cgroup, "_ZL11task_cgroupP11task_structi");

   function css_next_child (pos : access cgroup_subsys_state; parent : access cgroup_subsys_state) return access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:775
   pragma Import (CPP, css_next_child, "_Z14css_next_childP19cgroup_subsys_stateS0_");

   function css_from_id (id : int; ss : access cgroup_subsys) return access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:778
   pragma Import (CPP, css_from_id, "_Z11css_from_idiP13cgroup_subsys");

  --*
  -- * css_for_each_child - iterate through children of a css
  -- * @pos: the css * to use as the loop cursor
  -- * @parent: css whose children to walk
  -- *
  -- * Walk @parent's children.  Must be called under rcu_read_lock().
  -- *
  -- * If a subsystem synchronizes ->css_online() and the start of iteration, a
  -- * css which finished ->css_online() is guaranteed to be visible in the
  -- * future iterations and will stay visible until the last reference is put.
  -- * A css which hasn't finished ->css_online() or already finished
  -- * ->css_offline() may show up during traversal.  It's each subsystem's
  -- * responsibility to synchronize against on/offlining.
  -- *
  -- * It is allowed to temporarily drop RCU read lock during iteration.  The
  -- * caller is responsible for ensuring that @pos remains accessible until
  -- * the start of the next iteration by, for example, bumping the css refcnt.
  --  

   function css_next_descendant_pre (pos : access cgroup_subsys_state; css : access cgroup_subsys_state) return access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:803
   pragma Import (CPP, css_next_descendant_pre, "_Z23css_next_descendant_preP19cgroup_subsys_stateS0_");

   function css_rightmost_descendant (pos : access cgroup_subsys_state) return access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:807
   pragma Import (CPP, css_rightmost_descendant, "_Z24css_rightmost_descendantP19cgroup_subsys_state");

  --*
  -- * css_for_each_descendant_pre - pre-order walk of a css's descendants
  -- * @pos: the css * to use as the loop cursor
  -- * @root: css whose descendants to walk
  -- *
  -- * Walk @root's descendants.  @root is included in the iteration and the
  -- * first node to be visited.  Must be called under rcu_read_lock().
  -- *
  -- * If a subsystem synchronizes ->css_online() and the start of iteration, a
  -- * css which finished ->css_online() is guaranteed to be visible in the
  -- * future iterations and will stay visible until the last reference is put.
  -- * A css which hasn't finished ->css_online() or already finished
  -- * ->css_offline() may show up during traversal.  It's each subsystem's
  -- * responsibility to synchronize against on/offlining.
  -- *
  -- * For example, the following guarantees that a descendant can't escape
  -- * state updates of its ancestors.
  -- *
  -- * my_online(@css)
  -- * {
  -- *	Lock @css's parent and @css;
  -- *	Inherit state from the parent;
  -- *	Unlock both.
  -- * }
  -- *
  -- * my_update_state(@css)
  -- * {
  -- *	css_for_each_descendant_pre(@pos, @css) {
  -- *		Lock @pos;
  -- *		if (@pos == @css)
  -- *			Update @css's state;
  -- *		else
  -- *			Verify @pos is alive and inherit state from its parent;
  -- *		Unlock @pos;
  -- *	}
  -- * }
  -- *
  -- * As long as the inheriting step, including checking the parent state, is
  -- * enclosed inside @pos locking, double-locking the parent isn't necessary
  -- * while inheriting.  The state update to the parent is guaranteed to be
  -- * visible by walking order and, as long as inheriting operations to the
  -- * same @pos are atomic to each other, multiple updates racing each other
  -- * still result in the correct state.  It's guaranateed that at least one
  -- * inheritance happens for any css after the latest update to its parent.
  -- *
  -- * If checking parent's state requires locking the parent, each inheriting
  -- * iteration should lock and unlock both @pos->parent and @pos.
  -- *
  -- * Alternatively, a subsystem may choose to use a single global lock to
  -- * synchronize ->css_online() and ->css_offline() against tree-walking
  -- * operations.
  -- *
  -- * It is allowed to temporarily drop RCU read lock during iteration.  The
  -- * caller is responsible for ensuring that @pos remains accessible until
  -- * the start of the next iteration by, for example, bumping the css refcnt.
  --  

   function css_next_descendant_post (pos : access cgroup_subsys_state; css : access cgroup_subsys_state) return access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:870
   pragma Import (CPP, css_next_descendant_post, "_Z24css_next_descendant_postP19cgroup_subsys_stateS0_");

  --*
  -- * css_for_each_descendant_post - post-order walk of a css's descendants
  -- * @pos: the css * to use as the loop cursor
  -- * @css: css whose descendants to walk
  -- *
  -- * Similar to css_for_each_descendant_pre() but performs post-order
  -- * traversal instead.  @root is included in the iteration and the last
  -- * node to be visited.
  -- *
  -- * If a subsystem synchronizes ->css_online() and the start of iteration, a
  -- * css which finished ->css_online() is guaranteed to be visible in the
  -- * future iterations and will stay visible until the last reference is put.
  -- * A css which hasn't finished ->css_online() or already finished
  -- * ->css_offline() may show up during traversal.  It's each subsystem's
  -- * responsibility to synchronize against on/offlining.
  -- *
  -- * Note that the walk visibility guarantee example described in pre-order
  -- * walk doesn't apply the same to post-order walks.
  --  

   function css_has_online_children (css : access cgroup_subsys_state) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:896
   pragma Import (CPP, css_has_online_children, "_Z23css_has_online_childrenP19cgroup_subsys_state");

  -- A css_task_iter should be treated as an opaque object  
   type css_task_iter is record
      ss : access cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:900
      cset_pos : access linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:902
      cset_head : access linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:903
      task_pos : access linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:905
      tasks_head : access linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:906
      mg_tasks_head : access linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:907
   end record;
   pragma Convention (C_Pass_By_Copy, css_task_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:899

   procedure css_task_iter_start (css : access cgroup_subsys_state; it : access css_task_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:910
   pragma Import (CPP, css_task_iter_start, "_Z19css_task_iter_startP19cgroup_subsys_stateP13css_task_iter");

   function css_task_iter_next (it : access css_task_iter) return access linux_sched_h.task_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:912
   pragma Import (CPP, css_task_iter_next, "_Z18css_task_iter_nextP13css_task_iter");

   procedure css_task_iter_end (it : access css_task_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:913
   pragma Import (CPP, css_task_iter_end, "_Z17css_task_iter_endP13css_task_iter");

   function cgroup_attach_task_all (from : access linux_sched_h.task_struct; arg2 : access linux_sched_h.task_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:915
   pragma Import (CPP, cgroup_attach_task_all, "_Z22cgroup_attach_task_allP11task_structS0_");

   function cgroup_transfer_tasks (to : access cgroup; from : access cgroup) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:916
   pragma Import (CPP, cgroup_transfer_tasks, "_Z21cgroup_transfer_tasksP6cgroupS0_");

   function css_tryget_online_from_dir (the_dentry : access linux_dcache_h.dentry; ss : access cgroup_subsys) return access cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup.h:918
   pragma Import (CPP, css_tryget_online_from_dir, "_Z26css_tryget_online_from_dirP6dentryP13cgroup_subsys");

  -- No cgroups - nothing to do  
end linux_cgroup_h;

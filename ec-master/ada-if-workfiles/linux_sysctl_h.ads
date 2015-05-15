pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_types_h;
with linux_wait_h;
with Interfaces.C.Strings;
with linux_rbtree_h;
limited with linux_completion_h;
limited with linux_nsproxy_h;

package linux_sysctl_h is

   --  arg-macro: procedure DEFINE_CTL_TABLE_POLL struct ctl_table_poll name := __CTL_TABLE_POLL_INITIALIZER(name)
   --    struct ctl_table_poll name := __CTL_TABLE_POLL_INITIALIZER(name)
  -- * sysctl.h: General linux system control interface
  -- *
  -- * Begun 24 March 1995, Stephen Tweedie
  -- *
  -- ****************************************************************
  -- ****************************************************************
  -- **
  -- **  WARNING:
  -- **  The values in this file are exported to user space via 
  -- **  the sysctl() binary interface.  Do *NOT* change the
  -- **  numbering of any existing values here, and do not change
  -- **  any numbers within any one set of values.  If you have to
  -- **  redefine an existing interface, use a new number for it.
  -- **  The kernel will then return -ENOTDIR to any application using
  -- **  the old binary interface.
  -- **
  -- ****************************************************************
  -- ****************************************************************
  --  

  -- For the /proc/sys support  
   --  skipped function type proc_handler

   function proc_dostring
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:42
   pragma Import (CPP, proc_dostring, "_Z13proc_dostringP9ctl_tableiPvPmPx");

   function proc_dointvec
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:44
   pragma Import (CPP, proc_dointvec, "_Z13proc_dointvecP9ctl_tableiPvPmPx");

   function proc_dointvec_minmax
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:46
   pragma Import (CPP, proc_dointvec_minmax, "_Z20proc_dointvec_minmaxP9ctl_tableiPvPmPx");

   function proc_dointvec_jiffies
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:48
   pragma Import (CPP, proc_dointvec_jiffies, "_Z21proc_dointvec_jiffiesP9ctl_tableiPvPmPx");

   function proc_dointvec_userhz_jiffies
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:50
   pragma Import (CPP, proc_dointvec_userhz_jiffies, "_Z28proc_dointvec_userhz_jiffiesP9ctl_tableiPvPmPx");

   function proc_dointvec_ms_jiffies
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:52
   pragma Import (CPP, proc_dointvec_ms_jiffies, "_Z24proc_dointvec_ms_jiffiesP9ctl_tableiPvPmPx");

   function proc_doulongvec_minmax
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:54
   pragma Import (CPP, proc_doulongvec_minmax, "_Z22proc_doulongvec_minmaxP9ctl_tableiPvPmPx");

   function proc_doulongvec_ms_jiffies_minmax
     (table : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:56
   pragma Import (CPP, proc_doulongvec_ms_jiffies_minmax, "_Z33proc_doulongvec_ms_jiffies_minmaxP9ctl_tableiPvPmPx");

   function proc_do_large_bitmap
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access linux_types_h.size_t;
      arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:58
   pragma Import (CPP, proc_do_large_bitmap, "_Z20proc_do_large_bitmapP9ctl_tableiPvPmPx");

  -- * Register a set of sysctl names by calling register_sysctl_table
  -- * with an initialised array of struct ctl_table's.  An entry with 
  -- * NULL procname terminates the table.  table->de will be
  -- * set up by the registration and need not be initialised in advance.
  -- *
  -- * sysctl names can be mirrored automatically under /proc/sys.  The
  -- * procname supplied controls /proc naming.
  -- *
  -- * The table's mode will be honoured both for sys_sysctl(2) and
  -- * proc-fs access.
  -- *
  -- * Leaf nodes in the sysctl tree will be represented by a single file
  -- * under /proc; non-leaf nodes will be represented by directories.  A
  -- * null procname disables /proc mirroring at this node.
  -- *
  -- * sysctl(2) can automatically manage read and write requests through
  -- * the sysctl table.  The data and maxlen fields of the ctl_table
  -- * struct enable minimal validation of the values being written to be
  -- * performed, and the mode field allows minimal authentication.
  -- * 
  -- * There must be a proc_handler routine for any terminal nodes
  -- * mirrored under /proc/sys (non-terminals are handled by a built-in
  -- * directory handler).  Several default handlers are available to
  -- * cover common cases.
  --  

  -- Support for userspace poll() to watch for changes  
   type ctl_table_poll is record
      event : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:90
      wait : aliased linux_wait_h.wait_queue_head_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:91
   end record;
   pragma Convention (C_Pass_By_Copy, ctl_table_poll);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:89

   function proc_sys_poll_event (poll : access ctl_table_poll) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:94
   pragma Import (CPP, proc_sys_poll_event, "_ZL19proc_sys_poll_eventP14ctl_table_poll");

  -- A sysctl table is an array of struct ctl_table:  
  -- Text ID for /proc/sys, or zero  
   type ctl_table is record
      procname : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:109
      data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:110
      maxlen : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:111
      mode : aliased linux_types_h.umode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:112
      child : access ctl_table;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:113
      proc_handler : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : System.Address;
            arg4 : access linux_types_h.size_t;
            arg5 : access linux_types_h.loff_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:114
      poll : access ctl_table_poll;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:115
      extra1 : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:116
      extra2 : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:117
   end record;
   pragma Convention (C_Pass_By_Copy, ctl_table);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:107

  -- Deprecated  
  -- Callback for text formatting  
   type ctl_table_header;
   type ctl_node is record
      node : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:121
      header : access ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:122
   end record;
   pragma Convention (C_Pass_By_Copy, ctl_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:120

  -- struct ctl_table_header is used to maintain dynamic lists of
  --   struct ctl_table trees.  

   type ctl_table_header is record
      parent : aliased anon_272;
      unregistering : access linux_completion_h.completion;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:138
      ctl_table_arg : access ctl_table;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:139
      root : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:140
      set : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:141
      parent : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:142
      node : access ctl_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:143
   end record;
   pragma Convention (C_Pass_By_Copy, ctl_table_header);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:127

  -- Header must be at the start of ctl_dir  
   type ctl_dir is record
      header : aliased ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:148
      root : aliased linux_rbtree_h.rb_root;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:149
   end record;
   pragma Convention (C_Pass_By_Copy, ctl_dir);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:146

   type ctl_table_set is record
      is_seen : access function (arg1 : access ctl_table_set) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:153
      dir : aliased ctl_dir;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:154
   end record;
   pragma Convention (C_Pass_By_Copy, ctl_table_set);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:152

   type ctl_table_root is record
      default_set : aliased ctl_table_set;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:158
      lookup : access function (arg1 : access ctl_table_root; arg2 : access linux_nsproxy_h.nsproxy) return access ctl_table_set;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:160
      permissions : access function (arg1 : access ctl_table_header; arg2 : access ctl_table) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:161
   end record;
   pragma Convention (C_Pass_By_Copy, ctl_table_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:157

  -- struct ctl_path describes where in the hierarchy a table is added  
   type ctl_path is record
      procname : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:166
   end record;
   pragma Convention (C_Pass_By_Copy, ctl_path);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:165

   procedure proc_sys_poll_notify (poll : access ctl_table_poll);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:171
   pragma Import (CPP, proc_sys_poll_notify, "_Z20proc_sys_poll_notifyP14ctl_table_poll");

   procedure setup_sysctl_set
     (p : access ctl_table_set;
      root : access ctl_table_root;
      is_seen : access function (arg1 : access ctl_table_set) return int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:173
   pragma Import (CPP, setup_sysctl_set, "_Z16setup_sysctl_setP13ctl_table_setP14ctl_table_rootPFiS0_E");

   procedure retire_sysctl_set (set : access ctl_table_set);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:176
   pragma Import (CPP, retire_sysctl_set, "_Z17retire_sysctl_setP13ctl_table_set");

   procedure register_sysctl_root (root : access ctl_table_root);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:178
   pragma Import (CPP, register_sysctl_root, "_Z20register_sysctl_rootP14ctl_table_root");

   --  skipped func __register_sysctl_table

   --  skipped func __register_sysctl_paths

   function register_sysctl (path : Interfaces.C.Strings.chars_ptr; table : access ctl_table) return access ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:185
   pragma Import (CPP, register_sysctl, "_Z15register_sysctlPKcP9ctl_table");

   function register_sysctl_table (table : access ctl_table) return access ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:186
   pragma Import (CPP, register_sysctl_table, "_Z21register_sysctl_tableP9ctl_table");

   function register_sysctl_paths (path : access constant ctl_path; table : access ctl_table) return access ctl_table_header;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:187
   pragma Import (CPP, register_sysctl_paths, "_Z21register_sysctl_pathsPK8ctl_pathP9ctl_table");

   procedure unregister_sysctl_table (table : access ctl_table_header);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:190
   pragma Import (CPP, unregister_sysctl_table, "_Z23unregister_sysctl_tableP16ctl_table_header");

   function sysctl_init return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/sysctl.h:192
   pragma Import (CPP, sysctl_init, "_Z11sysctl_initv");

end linux_sysctl_h;

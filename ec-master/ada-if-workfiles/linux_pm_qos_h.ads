pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_plist_h;
with linux_workqueue_h;
with linux_types_h;
with asm_generic_int_ll64_h;
limited with linux_device_h;
limited with linux_notifier_h;
with Interfaces.C.Extensions;

package linux_pm_qos_h is

   --  unsupported macro: PM_QOS_DEFAULT_VALUE -1
   --  unsupported macro: PM_QOS_CPU_DMA_LAT_DEFAULT_VALUE (2000 * USEC_PER_SEC)
   --  unsupported macro: PM_QOS_NETWORK_LAT_DEFAULT_VALUE (2000 * USEC_PER_SEC)
   --  unsupported macro: PM_QOS_NETWORK_THROUGHPUT_DEFAULT_VALUE 0
   --  unsupported macro: PM_QOS_RESUME_LATENCY_DEFAULT_VALUE 0
   --  unsupported macro: PM_QOS_LATENCY_TOLERANCE_DEFAULT_VALUE 0
   --  unsupported macro: PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT (-1)
   --  unsupported macro: PM_QOS_LATENCY_ANY ((s32)(~(__u32)0 >> 1))
   --  unsupported macro: PM_QOS_FLAG_NO_POWER_OFF (1 << 0)
   --  unsupported macro: PM_QOS_FLAG_REMOTE_WAKEUP (1 << 1)
  -- interface for the pm_qos_power infrastructure of the linux kernel.
  -- *
  -- * Mark Gross <mgross@linux.intel.com>
  --  

  -- insert new class ID  
   subtype pm_qos_flags_status is unsigned;
   PM_QOS_FLAGS_UNDEFINED : constant pm_qos_flags_status := -1;
   PM_QOS_FLAGS_NONE : constant pm_qos_flags_status := 0;
   PM_QOS_FLAGS_SOME : constant pm_qos_flags_status := 1;
   PM_QOS_FLAGS_ALL : constant pm_qos_flags_status := 2;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:23

   type pm_qos_request is record
      node : aliased linux_plist_h.plist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:44
      pm_qos_class : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:45
      work : aliased linux_workqueue_h.delayed_work;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:46
   end record;
   pragma Convention (C_Pass_By_Copy, pm_qos_request);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:43

  -- for pm_qos_update_request_timeout  
   type pm_qos_flags_request is record
      node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:50
      flags : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:51
   end record;
   pragma Convention (C_Pass_By_Copy, pm_qos_flags_request);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:49

  -- Do not change to 64 bit  
   subtype dev_pm_qos_req_type is unsigned;
   DEV_PM_QOS_RESUME_LATENCY : constant dev_pm_qos_req_type := 1;
   DEV_PM_QOS_LATENCY_TOLERANCE : constant dev_pm_qos_req_type := 2;
   DEV_PM_QOS_FLAGS : constant dev_pm_qos_req_type := 3;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:54

   type anon_143 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            pnode : aliased linux_plist_h.plist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:63
         when others =>
            flr : aliased pm_qos_flags_request;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:64
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_143);
   pragma Unchecked_Union (anon_143);
   type dev_pm_qos_request is record
      c_type : aliased dev_pm_qos_req_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:61
      data : anon_143;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:65
      dev : access linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:66
   end record;
   pragma Convention (C_Pass_By_Copy, dev_pm_qos_request);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:60

   type pm_qos_type is 
     (PM_QOS_UNITIALIZED,
      PM_QOS_MAX,
      PM_QOS_MIN);
   pragma Convention (C, pm_qos_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:69

  -- return the largest value  
  -- return the smallest value  
  -- * Note: The lockless read path depends on the CPU accessing target_value
  -- * or effective_flags atomically.  Atomic access is only guaranteed on all CPU
  -- * types linux supports for 32 bit quantites
  --  

   type pm_qos_constraints is record
      list : aliased linux_plist_h.plist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:81
      target_value : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:82
      default_value : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:83
      no_constraint_value : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:84
      c_type : aliased pm_qos_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:85
      notifiers : access linux_notifier_h.blocking_notifier_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:86
   end record;
   pragma Convention (C_Pass_By_Copy, pm_qos_constraints);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:80

  -- Do not change to 64 bit  
   type pm_qos_flags is record
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:90
      effective_flags : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:91
   end record;
   pragma Convention (C_Pass_By_Copy, pm_qos_flags);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:89

  -- Do not change to 64 bit  
   type dev_pm_qos is record
      resume_latency : aliased pm_qos_constraints;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:95
      latency_tolerance : aliased pm_qos_constraints;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:96
      flags : aliased pm_qos_flags;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:97
      resume_latency_req : access dev_pm_qos_request;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:98
      latency_tolerance_req : access dev_pm_qos_request;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:99
      flags_req : access dev_pm_qos_request;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:100
   end record;
   pragma Convention (C_Pass_By_Copy, dev_pm_qos);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:94

  -- Action requested to pm_qos_update_target  
   type pm_qos_req_action is 
     (PM_QOS_ADD_REQ,
      PM_QOS_UPDATE_REQ,
      PM_QOS_REMOVE_REQ);
   pragma Convention (C, pm_qos_req_action);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:104

  -- Add a new request  
  -- Update an existing request  
  -- Remove an existing request  
   function dev_pm_qos_request_active (req : access dev_pm_qos_request) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:110
   pragma Import (CPP, dev_pm_qos_request_active, "_ZL25dev_pm_qos_request_activeP18dev_pm_qos_request");

   function pm_qos_update_target
     (c : access pm_qos_constraints;
      node : access linux_plist_h.plist_node;
      action : pm_qos_req_action;
      value : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:115
   pragma Import (CPP, pm_qos_update_target, "_Z20pm_qos_update_targetP18pm_qos_constraintsP10plist_node17pm_qos_req_actioni");

   function pm_qos_update_flags
     (pqf : access pm_qos_flags;
      req : access pm_qos_flags_request;
      action : pm_qos_req_action;
      val : asm_generic_int_ll64_h.s32) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:117
   pragma Import (CPP, pm_qos_update_flags, "_Z19pm_qos_update_flagsP12pm_qos_flagsP20pm_qos_flags_request17pm_qos_req_actioni");

   procedure pm_qos_add_request
     (req : access pm_qos_request;
      pm_qos_class : int;
      value : asm_generic_int_ll64_h.s32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:120
   pragma Import (CPP, pm_qos_add_request, "_Z18pm_qos_add_requestP14pm_qos_requestii");

   procedure pm_qos_update_request (req : access pm_qos_request; new_value : asm_generic_int_ll64_h.s32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:122
   pragma Import (CPP, pm_qos_update_request, "_Z21pm_qos_update_requestP14pm_qos_requesti");

   procedure pm_qos_update_request_timeout
     (req : access pm_qos_request;
      new_value : asm_generic_int_ll64_h.s32;
      timeout_us : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:124
   pragma Import (CPP, pm_qos_update_request_timeout, "_Z29pm_qos_update_request_timeoutP14pm_qos_requestim");

   procedure pm_qos_remove_request (req : access pm_qos_request);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:126
   pragma Import (CPP, pm_qos_remove_request, "_Z21pm_qos_remove_requestP14pm_qos_request");

   function pm_qos_request (pm_qos_class : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:128
   pragma Import (CPP, pm_qos_request, "_Z14pm_qos_requesti");

   function pm_qos_add_notifier (pm_qos_class : int; notifier : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:129
   pragma Import (CPP, pm_qos_add_notifier, "_Z19pm_qos_add_notifieriP14notifier_block");

   function pm_qos_remove_notifier (pm_qos_class : int; notifier : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:130
   pragma Import (CPP, pm_qos_remove_notifier, "_Z22pm_qos_remove_notifieriP14notifier_block");

   function pm_qos_request_active (req : access pm_qos_request) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:131
   pragma Import (CPP, pm_qos_request_active, "_Z21pm_qos_request_activeP14pm_qos_request");

   function pm_qos_read_value (c : access pm_qos_constraints) return asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:132
   pragma Import (CPP, pm_qos_read_value, "_Z17pm_qos_read_valueP18pm_qos_constraints");

   --  skipped func __dev_pm_qos_flags

   function dev_pm_qos_flags (dev : access linux_device_h.device; mask : asm_generic_int_ll64_h.s32) return pm_qos_flags_status;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:136
   pragma Import (CPP, dev_pm_qos_flags, "_Z16dev_pm_qos_flagsP6devicei");

   --  skipped func __dev_pm_qos_read_value

   function dev_pm_qos_read_value (dev : access linux_device_h.device) return asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:138
   pragma Import (CPP, dev_pm_qos_read_value, "_Z21dev_pm_qos_read_valueP6device");

   function dev_pm_qos_add_request
     (dev : access linux_device_h.device;
      req : access dev_pm_qos_request;
      c_type : dev_pm_qos_req_type;
      value : asm_generic_int_ll64_h.s32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:139
   pragma Import (CPP, dev_pm_qos_add_request, "_Z22dev_pm_qos_add_requestP6deviceP18dev_pm_qos_request19dev_pm_qos_req_typei");

   function dev_pm_qos_update_request (req : access dev_pm_qos_request; new_value : asm_generic_int_ll64_h.s32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:141
   pragma Import (CPP, dev_pm_qos_update_request, "_Z25dev_pm_qos_update_requestP18dev_pm_qos_requesti");

   function dev_pm_qos_remove_request (req : access dev_pm_qos_request) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:142
   pragma Import (CPP, dev_pm_qos_remove_request, "_Z25dev_pm_qos_remove_requestP18dev_pm_qos_request");

   function dev_pm_qos_add_notifier (dev : access linux_device_h.device; notifier : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:143
   pragma Import (CPP, dev_pm_qos_add_notifier, "_Z23dev_pm_qos_add_notifierP6deviceP14notifier_block");

   function dev_pm_qos_remove_notifier (dev : access linux_device_h.device; notifier : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:145
   pragma Import (CPP, dev_pm_qos_remove_notifier, "_Z26dev_pm_qos_remove_notifierP6deviceP14notifier_block");

   function dev_pm_qos_add_global_notifier (notifier : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:147
   pragma Import (CPP, dev_pm_qos_add_global_notifier, "_Z30dev_pm_qos_add_global_notifierP14notifier_block");

   function dev_pm_qos_remove_global_notifier (notifier : access linux_notifier_h.notifier_block) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:148
   pragma Import (CPP, dev_pm_qos_remove_global_notifier, "_Z33dev_pm_qos_remove_global_notifierP14notifier_block");

   procedure dev_pm_qos_constraints_init (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:149
   pragma Import (CPP, dev_pm_qos_constraints_init, "_Z27dev_pm_qos_constraints_initP6device");

   procedure dev_pm_qos_constraints_destroy (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:150
   pragma Import (CPP, dev_pm_qos_constraints_destroy, "_Z30dev_pm_qos_constraints_destroyP6device");

   function dev_pm_qos_add_ancestor_request
     (dev : access linux_device_h.device;
      req : access dev_pm_qos_request;
      c_type : dev_pm_qos_req_type;
      value : asm_generic_int_ll64_h.s32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:151
   pragma Import (CPP, dev_pm_qos_add_ancestor_request, "_Z31dev_pm_qos_add_ancestor_requestP6deviceP18dev_pm_qos_request19dev_pm_qos_req_typei");

   function dev_pm_qos_expose_latency_limit (dev : access linux_device_h.device; value : asm_generic_int_ll64_h.s32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:203
   pragma Import (CPP, dev_pm_qos_expose_latency_limit, "_Z31dev_pm_qos_expose_latency_limitP6devicei");

   procedure dev_pm_qos_hide_latency_limit (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:204
   pragma Import (CPP, dev_pm_qos_hide_latency_limit, "_Z29dev_pm_qos_hide_latency_limitP6device");

   function dev_pm_qos_expose_flags (dev : access linux_device_h.device; value : asm_generic_int_ll64_h.s32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:205
   pragma Import (CPP, dev_pm_qos_expose_flags, "_Z23dev_pm_qos_expose_flagsP6devicei");

   procedure dev_pm_qos_hide_flags (dev : access linux_device_h.device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:206
   pragma Import (CPP, dev_pm_qos_hide_flags, "_Z21dev_pm_qos_hide_flagsP6device");

   function dev_pm_qos_update_flags
     (dev : access linux_device_h.device;
      mask : asm_generic_int_ll64_h.s32;
      set : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:207
   pragma Import (CPP, dev_pm_qos_update_flags, "_Z23dev_pm_qos_update_flagsP6deviceib");

   function dev_pm_qos_get_user_latency_tolerance (dev : access linux_device_h.device) return asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:208
   pragma Import (CPP, dev_pm_qos_get_user_latency_tolerance, "_Z37dev_pm_qos_get_user_latency_toleranceP6device");

   function dev_pm_qos_update_user_latency_tolerance (dev : access linux_device_h.device; val : asm_generic_int_ll64_h.s32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:209
   pragma Import (CPP, dev_pm_qos_update_user_latency_tolerance, "_Z40dev_pm_qos_update_user_latency_toleranceP6devicei");

   function dev_pm_qos_requested_resume_latency (dev : access linux_device_h.device) return asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:211
   pragma Import (CPP, dev_pm_qos_requested_resume_latency, "_ZL35dev_pm_qos_requested_resume_latencyP6device");

   function dev_pm_qos_requested_flags (dev : access linux_device_h.device) return asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pm_qos.h:216
   pragma Import (CPP, dev_pm_qos_requested_flags, "_ZL26dev_pm_qos_requested_flagsP6device");

end linux_pm_qos_h;

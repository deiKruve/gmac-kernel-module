pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_vm_event_item_h;
with asm_generic_atomic_long_h;
with linux_mmzone_h;
with linux_types_h;
limited with linux_mm_types_h;
with Interfaces.C.Strings;

package linux_vmstat_h is

   --  arg-macro: procedure count_vm_numa_event count_vm_event(x)
   --    count_vm_event(x)
   --  arg-macro: procedure count_vm_numa_events count_vm_events(x, y)
   --    count_vm_events(x, y)
   --  arg-macro: procedure count_vm_tlb_event do {} while (0)
   --    do {} while (0)
   --  arg-macro: procedure count_vm_tlb_events do { (void)(y); } while (0)
   --    do { (void)(y); } while (0)
   --  arg-macro: procedure count_vm_vmacache_event do {} while (0)
   --    do {} while (0)
   --  arg-macro: procedure add_zone_page_state mod_zone_page_state(__z, __i, __d)
   --    mod_zone_page_state(__z, __i, __d)
   --  arg-macro: procedure sub_zone_page_state mod_zone_page_state(__z, __i, -(__d))
   --    mod_zone_page_state(__z, __i, -(__d))
   sysctl_stat_interval : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:11
   pragma Import (C, sysctl_stat_interval, "sysctl_stat_interval");

  -- * Light weight per cpu counter implementation.
  -- *
  -- * Counters should only be incremented and no critical kernel component
  -- * should rely on the counter values.
  -- *
  -- * Counters are handled completely inline. On many platforms the code
  -- * generated will simply be the increment of a global address.
  --  

   type vm_event_state_event_array is array (0 .. 73) of aliased unsigned_long;
   type vm_event_state is record
      event : aliased vm_event_state_event_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:25
   end record;
   pragma Convention (C_Pass_By_Copy, vm_event_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:24

   vm_event_states : aliased vm_event_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:28
   pragma Import (C, vm_event_states, "vm_event_states");

  -- * vm counters are allowed to be racy. Use raw_cpu_ops to avoid the
  -- * local_irq_disable overhead.
  --  

   --  skipped func __count_vm_event

   procedure count_vm_event (item : linux_vm_event_item_h.vm_event_item);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:39
   pragma Import (CPP, count_vm_event, "_ZL14count_vm_event13vm_event_item");

   --  skipped func __count_vm_events

   procedure count_vm_events (item : linux_vm_event_item_h.vm_event_item; c_delta : long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:49
   pragma Import (CPP, count_vm_events, "_ZL15count_vm_events13vm_event_iteml");

   procedure all_vm_events (arg1 : access unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:54
   pragma Import (CPP, all_vm_events, "_Z13all_vm_eventsPm");

   procedure vm_events_fold_cpu (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:56
   pragma Import (CPP, vm_events_fold_cpu, "_Z18vm_events_fold_cpui");

  -- Disable counters  
  -- * Zone based page accounting with per cpu differentials.
  --  

   vm_stat : aliased array (0 .. 37) of aliased asm_generic_atomic_long_h.atomic_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:111
   pragma Import (C, vm_stat, "vm_stat");

   procedure zone_page_state_add
     (x : long;
      the_zone : access linux_mmzone_h.zone;
      item : linux_mmzone_h.zone_stat_item);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:113
   pragma Import (CPP, zone_page_state_add, "_ZL19zone_page_state_addlP4zone14zone_stat_item");

   function global_page_state (item : linux_mmzone_h.zone_stat_item) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:120
   pragma Import (CPP, global_page_state, "_ZL17global_page_state14zone_stat_item");

   function zone_page_state (the_zone : access linux_mmzone_h.zone; item : linux_mmzone_h.zone_stat_item) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:130
   pragma Import (CPP, zone_page_state, "_ZL15zone_page_stateP4zone14zone_stat_item");

  -- * More accurate version that also considers the currently pending
  -- * deltas. For that we need to loop over all cpus to find the current
  -- * deltas. There is no synchronization so the result cannot be
  -- * exactly accurate either.
  --  

   function zone_page_state_snapshot (the_zone : access linux_mmzone_h.zone; item : linux_mmzone_h.zone_stat_item) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:147
   pragma Import (CPP, zone_page_state_snapshot, "_ZL24zone_page_state_snapshotP4zone14zone_stat_item");

  -- * Determine the per node value of a stat item. This function
  -- * is called frequently in a NUMA machine, so try to be as
  -- * frugal as possible.
  --  

   function node_page_state (node : int; item : linux_mmzone_h.zone_stat_item) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:169
   pragma Import (CPP, node_page_state, "_ZL15node_page_statei14zone_stat_item");

   procedure zone_statistics
     (arg1 : access linux_mmzone_h.zone;
      arg2 : access linux_mmzone_h.zone;
      gfp : linux_types_h.gfp_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:188
   pragma Import (CPP, zone_statistics, "_Z15zone_statisticsP4zoneS0_j");

   --  skipped func __mod_zone_page_state

   --  skipped func __inc_zone_page_state

   --  skipped func __dec_zone_page_state

   procedure mod_zone_page_state
     (arg1 : access linux_mmzone_h.zone;
      arg2 : linux_mmzone_h.zone_stat_item;
      arg3 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:205
   pragma Import (CPP, mod_zone_page_state, "_Z19mod_zone_page_stateP4zone14zone_stat_itemi");

   procedure inc_zone_page_state (arg1 : access linux_mm_types_h.page; arg2 : linux_mmzone_h.zone_stat_item);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:206
   pragma Import (CPP, inc_zone_page_state, "_Z19inc_zone_page_stateP4page14zone_stat_item");

   procedure dec_zone_page_state (arg1 : access linux_mm_types_h.page; arg2 : linux_mmzone_h.zone_stat_item);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:207
   pragma Import (CPP, dec_zone_page_state, "_Z19dec_zone_page_stateP4page14zone_stat_item");

   procedure inc_zone_state (arg1 : access linux_mmzone_h.zone; arg2 : linux_mmzone_h.zone_stat_item);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:209
   pragma Import (CPP, inc_zone_state, "_Z14inc_zone_stateP4zone14zone_stat_item");

   --  skipped func __inc_zone_state

   procedure dec_zone_state (arg1 : access linux_mmzone_h.zone; arg2 : linux_mmzone_h.zone_stat_item);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:211
   pragma Import (CPP, dec_zone_state, "_Z14dec_zone_stateP4zone14zone_stat_item");

   --  skipped func __dec_zone_state

   procedure cpu_vm_stats_fold (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:214
   pragma Import (CPP, cpu_vm_stats_fold, "_Z17cpu_vm_stats_foldi");

   procedure refresh_zone_stat_thresholds;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:215
   pragma Import (CPP, refresh_zone_stat_thresholds, "_Z28refresh_zone_stat_thresholdsv");

   procedure drain_zonestat (the_zone : access linux_mmzone_h.zone; arg2 : access linux_mmzone_h.per_cpu_pageset);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:217
   pragma Import (CPP, drain_zonestat, "_Z14drain_zonestatP4zoneP15per_cpu_pageset");

   function calculate_pressure_threshold (the_zone : access linux_mmzone_h.zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:219
   pragma Import (CPP, calculate_pressure_threshold, "_Z28calculate_pressure_thresholdP4zone");

   function calculate_normal_threshold (the_zone : access linux_mmzone_h.zone) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:220
   pragma Import (CPP, calculate_normal_threshold, "_Z26calculate_normal_thresholdP4zone");

   procedure set_pgdat_percpu_threshold (pgdat : access linux_mmzone_h.pg_data_t; calculate_pressure : access function (arg1 : access linux_mmzone_h.zone) return int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:221
   pragma Import (CPP, set_pgdat_percpu_threshold, "_Z26set_pgdat_percpu_thresholdP11pglist_dataPFiP4zoneE");

  -- * We do not maintain differentials in a single processor configuration.
  -- * The functions directly modify the zone and global counters.
  --  

  -- * We only use atomic operations to update counters. So there is no need to
  -- * disable interrupts.
  --  

   --  skipped func __mod_zone_freepage_state

   vmstat_text : aliased array (size_t) of Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/vmstat.h:288
   pragma Import (C, vmstat_text, "vmstat_text");

end linux_vmstat_h;

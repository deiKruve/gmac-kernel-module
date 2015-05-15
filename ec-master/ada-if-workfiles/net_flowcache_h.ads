pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_types_h;
with asm_generic_int_ll64_h;
with linux_interrupt_h;
with linux_notifier_h;
with linux_timer_h;

package net_flowcache_h is

   type flow_cache_percpu is record
      hash_table : access linux_types_h.hlist_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:10
      hash_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:11
      hash_rnd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:12
      hash_rnd_recalc : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:13
      flush_tasklet : aliased linux_interrupt_h.tasklet_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:14
   end record;
   pragma Convention (C_Pass_By_Copy, flow_cache_percpu);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:9

   type flow_cache is record
      hash_shift : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:18
      percpu : access flow_cache_percpu;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:19
      hotcpu_notifier : aliased linux_notifier_h.notifier_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:20
      low_watermark : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:21
      high_watermark : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:22
      rnd_timer : aliased linux_timer_h.timer_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:23
   end record;
   pragma Convention (C_Pass_By_Copy, flow_cache);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flowcache.h:17

end net_flowcache_h;

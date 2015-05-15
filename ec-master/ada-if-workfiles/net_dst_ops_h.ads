pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_types_h;
with System;
with uapi_asm_generic_int_ll64_h;
with asm_generic_int_ll64_h;
limited with linux_netdevice_h;
limited with linux_skbuff_h;
limited with linux_slab_def_h;
with linux_percpu_counter_h;

package net_dst_ops_h is

   --  skipped empty struct kmem_cachep

   type dst_ops is record
      family : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:14
      protocol : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:15
      gc_thresh : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:16
      gc : access function (arg1 : access dst_ops) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:18
      check : access function (arg1 : System.Address; arg2 : uapi_asm_generic_int_ll64_h.uu_u32) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:19
      default_advmss : access function (arg1 : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:20
      mtu : access function (arg1 : System.Address) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:21
      cow_metrics : access function (arg1 : System.Address; arg2 : unsigned_long) return access asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:22
      destroy : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:23
      ifdown : access procedure
           (arg1 : System.Address;
            arg2 : access linux_netdevice_h.net_device;
            arg3 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:25
      negative_advice : access function (arg1 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:26
      link_failure : access procedure (arg1 : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:27
      update_pmtu : access procedure
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : access linux_skbuff_h.sk_buff;
            arg4 : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:29
      redirect : access procedure
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : access linux_skbuff_h.sk_buff);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:31
      local_out : access function (arg1 : access linux_skbuff_h.sk_buff) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:32
      neigh_lookup : access function
           (arg1 : System.Address;
            arg2 : access linux_skbuff_h.sk_buff;
            arg3 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:35
      kmem_cachep : access linux_slab_def_h.kmem_cache;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:37
      pcpuc_entries : aliased linux_percpu_counter_h.percpu_counter;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:39
   end record;
   pragma Convention (C_Pass_By_Copy, dst_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:13

   --  skipped empty struct neighbour

   function dst_entries_get_fast (dst : access dst_ops) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:42
   pragma Import (CPP, dst_entries_get_fast, "_ZL20dst_entries_get_fastP7dst_ops");

   function dst_entries_get_slow (dst : access dst_ops) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:47
   pragma Import (CPP, dst_entries_get_slow, "_ZL20dst_entries_get_slowP7dst_ops");

   procedure dst_entries_add (dst : access dst_ops; val : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:57
   pragma Import (CPP, dst_entries_add, "_ZL15dst_entries_addP7dst_opsi");

   function dst_entries_init (dst : access dst_ops) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:64
   pragma Import (CPP, dst_entries_init, "_ZL16dst_entries_initP7dst_ops");

   procedure dst_entries_destroy (dst : access dst_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dst_ops.h:69
   pragma Import (CPP, dst_entries_destroy, "_ZL19dst_entries_destroyP7dst_ops");

end net_dst_ops_h;

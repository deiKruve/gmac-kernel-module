pragma Ada_2005;
pragma Style_Checks (Off);

with System;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
package Linux_Types is

   -- for amd64
   
   package Strings renames Interfaces.C.Strings;

   ------------------------------
   --  asm_generic_int_ll64_h  --
   ------------------------------
   subtype s8 is signed_char;
   subtype u8 is unsigned_char;
   subtype s16 is short;
   subtype u16 is unsigned_short;
   subtype s32 is int;
   subtype u32 is unsigned;
   subtype s64 is Long_Long_Integer;
   subtype u64 is Extensions.unsigned_long_long;

   --------------------------------------
   --  uapi_asm_generic_posix_types_h  --
   --------------------------------------
   -- subtype uu_kernel_long_t is long;
   -- subtype uu_kernel_size_t is uu_kernel_ulong_t;
   -- typedef int               __kernel_clockid_t;
   -- subtype uu_kernel_time_t is uu_kernel_long_t;
   -- subtype uu_kernel_suseconds_t is uu_kernel_long_t;
   -----------------------------------
   --  uapi_asm_generic_int_ll64_h  --
   -----------------------------------
   --subtype uu_u32 is unsigned;

   --------------------------
   --  uapi_linux_types_h  --
   --------------------------

   subtype be16 is u16;

   ---------------------
   --  linux_types_h  --
   ---------------------
   --subtype uu_kernel_dev_t is uapi_asm_generic_int_ll64_h.uu_u32;
   --subtype dev_t is uu_kernel_dev_t;

   subtype dev_t is unsigned;

   --typedef __kernel_clockid_t clockid_t;

   subtype Clockid_T is long;

   subtype uu_kernel_time_t is long;
   subtype uu_kernel_suseconds_t is long;

   subtype size_t is long;

   subtype phys_addr_t is u64;

   type list_head is record
      next : access list_head;
      prev : access list_head;
   end record;
   pragma Convention (C_Pass_By_Copy, list_head);

   type atomic_t is record
      counter : aliased int;
   end record;
   pragma Convention (C_Pass_By_Copy, atomic_t);

   type callback_head is record
      next : access callback_head;
      func : access procedure (arg1 : access callback_head);
   end record;
   pragma Convention (C_Pass_By_Copy, callback_head);

   ----------------------
   --  Linux_Kernfs_H  --
   ----------------------

   --  type Kernfs_Node is record
   --     -- dummy, might needs to be fleshed out
   --     null;
   --  end record;

   -----------------------
   --  linux_kobject_h  --
   -----------------------

   --  type Kset is record
   --     -- dummy, might needs to be fleshed out
   --     null;
   --  end record;

   --  type Kobj_Type is record
   --     -- dummy, might needs to be fleshed out
   --     null;
   --  end record;

   type kref is record
      refcount : aliased atomic_t;
   end record;
   pragma Convention (C_Pass_By_Copy, kref);

   subtype Kset_Ptr is System.Address;
   subtype Kobj_Type_Ptr is System.Address;
   subtype Kernfs_Node_Ptr is System.Address;

   type kobject is record
      name                     : Strings.chars_ptr;
      c_entry                  : aliased list_head;
      parent                   : access kobject;
      the_kset                 : Kset_Ptr; -- access kset;
      ktype                    : Kobj_Type_Ptr; -- access kobj_type;
      sd                       : Kernfs_Node_Ptr; -- Access kernfs_node;
      the_kref                 : aliased kref;
      state_initialized        : Extensions.Unsigned_1;
      state_in_sysfs           : Extensions.Unsigned_1;
      state_add_uevent_sent    : Extensions.Unsigned_1;
      state_remove_uevent_sent : Extensions.Unsigned_1;
      uevent_suppress          : Extensions.Unsigned_1;
   end record;
   pragma Convention (C_Pass_By_Copy, kobject);
   pragma Pack (kobject);

   ------------------
   --  linux_fs_h  --
   ------------------

   --  type File_Operations is record
   --     -- dummy, probably needs to be fleshed out
   --     null;
   --  end record;

   subtype File_Operations_Ptr is System.Address;

   --------------------
   --  linux_cdev_h  --
   --------------------

   type cdev is record
      kobj  : aliased kobject;
      owner : System.Address;
      Ops   : File_Operations_Ptr; -- access constant file_operations;
      list  : aliased list_head;
      dev   : aliased dev_t;
      count : aliased unsigned;
   end record;
   pragma Convention (C_Pass_By_Copy, cdev);

   ----------------------
   --  linux_skbuff_h  --
   ----------------------

   --  subtype sk_buff_data_t is unsigned;

   --  type sk_buff is record
   --     next : access sk_buff;
   --     prev : access sk_buff;
   --     field_3 : aliased anon_309;-------------------------
   --     sk : System.Address;
   --     dev : access linux_netdevice_h.net_device;---------------------
   --     cb : aliased sk_buff_cb_array;--------------------------------
   --     u_skb_refdst : aliased unsigned_long;
   --     sp : System.Address;
   --     len : aliased unsigned;
   --     data_len : aliased unsigned;
   --     mac_len : aliased u16;
   --     hdr_len : aliased u16;
   --     field_13 : aliased anon_310;--------------------------------
   --     priority : aliased u32;
   --     ignore_df : Extensions.Unsigned_1;
   --     cloned : Extensions.Unsigned_1;
   --     ip_summed : Extensions.Unsigned_2;
   --     nohdr : Extensions.Unsigned_1;
   --     nfctinfo : Extensions.Unsigned_3;
   --     pkt_type : Extensions.Unsigned_3;
   --     fclone : Extensions.Unsigned_2;
   --     ipvs_property : Extensions.Unsigned_1;
   --     peeked : Extensions.Unsigned_1;
   --     nf_trace : Extensions.Unsigned_1;
   --     protocol : be16;
   --     destructor : access procedure (arg1 : access sk_buff);
   --     nfct : access nf_conntrack;-----------------------------
   --     nf_bridge : access nf_bridge_info;----------------------
   --     skb_iif : aliased int;
   --     hash : aliased u32;
   --     vlan_proto : aliased be16;
   --     vlan_tci : aliased u16;
   --     tc_index : aliased u16;
   --     tc_verd : aliased u16;
   --     queue_mapping : aliased u16;
   --     ndisc_nodetype : Extensions.Unsigned_2;
   --     pfmemalloc : Extensions.Unsigned_1;
   --     ooo_okay : Extensions.Unsigned_1;
   --     l4_hash : Extensions.Unsigned_1;
   --     wifi_acked_valid : Extensions.Unsigned_1;
   --     wifi_acked : Extensions.Unsigned_1;
   --     no_fcs : Extensions.Unsigned_1;
   --     head_frag : Extensions.Unsigned_1;
   --     encapsulation : Extensions.Unsigned_1;
   --     encap_hdr_csum : Extensions.Unsigned_1;
   --     csum_valid : Extensions.Unsigned_1;
   --     csum_complete_sw : Extensions.Unsigned_1;
   --     field_48 : aliased anon_312;----------------------
   --     secmark : aliased u32;
   --     field_50 : aliased anon_313;---------------------
   --     inner_protocol : be16;
   --     inner_transport_header : aliased L.u16;
   --     inner_network_header : aliased L.u16;
   --     inner_mac_header : aliased L.u16;
   --     transport_header : aliased L.u16;
   --     network_header : aliased L.u16;
   --     mac_header : aliased L.u16;
   --     tail : aliased sk_buff_data_t;
   --     c_end : aliased sk_buff_data_t;
   --     head : access unsigned_char;
   --     data : access unsigned_char;
   --     truesize : aliased unsigned;
   --     users : aliased atomic_t;
   --  end record;
   --  pragma Convention (C_Pass_By_Copy, sk_buff);
   --  pragma Pack (sk_buff);

end Linux_Types;

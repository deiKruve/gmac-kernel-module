pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_types_h;
with uapi_asm_generic_int_ll64_h;
with uapi_asm_generic_posix_types_h;

package uapi_linux_xfrm_h is

   --  unsupported macro: XFRM_SC_DOI_RESERVED 0
   --  unsupported macro: XFRM_SC_DOI_LSM 1
   --  unsupported macro: XFRM_SC_ALG_RESERVED 0
   --  unsupported macro: XFRM_SC_ALG_SELINUX 1
   --  unsupported macro: XFRM_INF (~(__u64)0)
   --  unsupported macro: XFRMA_REPLAY_ESN_MAX 4096
   --  unsupported macro: XFRM_MODE_TRANSPORT 0
   --  unsupported macro: XFRM_MODE_TUNNEL 1
   --  unsupported macro: XFRM_MODE_ROUTEOPTIMIZATION 2
   --  unsupported macro: XFRM_MODE_IN_TRIGGER 3
   --  unsupported macro: XFRM_MODE_BEET 4
   --  unsupported macro: XFRM_MODE_MAX 5
   --  unsupported macro: XFRM_MSG_NEWSA XFRM_MSG_NEWSA
   --  unsupported macro: XFRM_MSG_DELSA XFRM_MSG_DELSA
   --  unsupported macro: XFRM_MSG_GETSA XFRM_MSG_GETSA
   --  unsupported macro: XFRM_MSG_NEWPOLICY XFRM_MSG_NEWPOLICY
   --  unsupported macro: XFRM_MSG_DELPOLICY XFRM_MSG_DELPOLICY
   --  unsupported macro: XFRM_MSG_GETPOLICY XFRM_MSG_GETPOLICY
   --  unsupported macro: XFRM_MSG_ALLOCSPI XFRM_MSG_ALLOCSPI
   --  unsupported macro: XFRM_MSG_ACQUIRE XFRM_MSG_ACQUIRE
   --  unsupported macro: XFRM_MSG_EXPIRE XFRM_MSG_EXPIRE
   --  unsupported macro: XFRM_MSG_UPDPOLICY XFRM_MSG_UPDPOLICY
   --  unsupported macro: XFRM_MSG_UPDSA XFRM_MSG_UPDSA
   --  unsupported macro: XFRM_MSG_POLEXPIRE XFRM_MSG_POLEXPIRE
   --  unsupported macro: XFRM_MSG_FLUSHSA XFRM_MSG_FLUSHSA
   --  unsupported macro: XFRM_MSG_FLUSHPOLICY XFRM_MSG_FLUSHPOLICY
   --  unsupported macro: XFRM_MSG_NEWAE XFRM_MSG_NEWAE
   --  unsupported macro: XFRM_MSG_GETAE XFRM_MSG_GETAE
   --  unsupported macro: XFRM_MSG_REPORT XFRM_MSG_REPORT
   --  unsupported macro: XFRM_MSG_MIGRATE XFRM_MSG_MIGRATE
   --  unsupported macro: XFRM_MSG_NEWSADINFO XFRM_MSG_NEWSADINFO
   --  unsupported macro: XFRM_MSG_GETSADINFO XFRM_MSG_GETSADINFO
   --  unsupported macro: XFRM_MSG_NEWSPDINFO XFRM_MSG_NEWSPDINFO
   --  unsupported macro: XFRM_MSG_GETSPDINFO XFRM_MSG_GETSPDINFO
   --  unsupported macro: XFRM_MSG_MAPPING XFRM_MSG_MAPPING
   --  unsupported macro: XFRM_MSG_MAX (__XFRM_MSG_MAX - 1)
   --  unsupported macro: XFRM_NR_MSGTYPES (XFRM_MSG_MAX + 1 - XFRM_MSG_BASE)
   --  unsupported macro: XFRM_AE_MAX (__XFRM_AE_MAX - 1)
   --  unsupported macro: XFRMA_MAX (__XFRMA_MAX - 1)
   --  unsupported macro: XFRMA_SAD_MAX (__XFRMA_SAD_MAX - 1)
   --  unsupported macro: XFRMA_SPD_MAX (__XFRMA_SPD_MAX - 1)
   --  unsupported macro: XFRM_STATE_NOECN 1
   --  unsupported macro: XFRM_STATE_DECAP_DSCP 2
   --  unsupported macro: XFRM_STATE_NOPMTUDISC 4
   --  unsupported macro: XFRM_STATE_WILDRECV 8
   --  unsupported macro: XFRM_STATE_ICMP 16
   --  unsupported macro: XFRM_STATE_AF_UNSPEC 32
   --  unsupported macro: XFRM_STATE_ALIGN4 64
   --  unsupported macro: XFRM_STATE_ESN 128
   --  unsupported macro: XFRM_SA_XFLAG_DONT_ENCAP_DSCP 1
   --  unsupported macro: XFRM_POLICY_ALLOW 0
   --  unsupported macro: XFRM_POLICY_BLOCK 1
   --  unsupported macro: XFRM_POLICY_LOCALOK 1
   --  unsupported macro: XFRM_POLICY_ICMP 2
   --  unsupported macro: XFRMNLGRP_NONE XFRMNLGRP_NONE
   --  unsupported macro: XFRMNLGRP_ACQUIRE XFRMNLGRP_ACQUIRE
   --  unsupported macro: XFRMNLGRP_EXPIRE XFRMNLGRP_EXPIRE
   --  unsupported macro: XFRMNLGRP_SA XFRMNLGRP_SA
   --  unsupported macro: XFRMNLGRP_POLICY XFRMNLGRP_POLICY
   --  unsupported macro: XFRMNLGRP_AEVENTS XFRMNLGRP_AEVENTS
   --  unsupported macro: XFRMNLGRP_REPORT XFRMNLGRP_REPORT
   --  unsupported macro: XFRMNLGRP_MIGRATE XFRMNLGRP_MIGRATE
   --  unsupported macro: XFRMNLGRP_MAPPING XFRMNLGRP_MAPPING
   --  unsupported macro: XFRMNLGRP_MAX (__XFRMNLGRP_MAX - 1)
  -- All of the structures in this file may not change size as they are
  -- * passed into the kernel from userspace via netlink sockets.
  --  

  -- Structure to encapsulate addresses. I do not want to use
  -- * "standard" structure. My apologies.
  --  

   type xfrm_address_t_a6_array is array (0 .. 3) of aliased uapi_linux_types_h.uu_be32;
   type xfrm_address_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            a4 : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:14
         when others =>
            a6 : aliased xfrm_address_t_a6_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:15
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_address_t);
   pragma Unchecked_Union (xfrm_address_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:16

   --  skipped anonymous struct anon_330

  -- Ident of a specific xfrm_state. It is used on input to lookup
  -- * the state by (spi,daddr,ah/esp) or to store information about
  -- * spi, protocol and tunnel address on output.
  --  

   type xfrm_id is record
      daddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:23
      spi : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:24
      proto : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:25
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_id);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:22

   subtype xfrm_sec_ctx_ctx_str_array is Interfaces.C.char_array (0 .. -1);
   type xfrm_sec_ctx is record
      ctx_doi : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:29
      ctx_alg : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:30
      ctx_len : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:31
      ctx_sid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:32
      ctx_str : aliased xfrm_sec_ctx_ctx_str_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_sec_ctx);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:28

  -- Security Context Domains of Interpretation  
  -- Security Context Algorithms  
  -- Selector, used as selector both on policy rules (SPD) and SAs.  
   type xfrm_selector is record
      daddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:47
      saddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:48
      dport : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:49
      dport_mask : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:50
      sport : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:51
      sport_mask : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:52
      family : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:53
      prefixlen_d : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:54
      prefixlen_s : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:55
      proto : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:56
      ifindex : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:57
      user : aliased uapi_asm_generic_posix_types_h.uu_kernel_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:58
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_selector);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:46

   type xfrm_lifetime_cfg is record
      soft_byte_limit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:64
      hard_byte_limit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:65
      soft_packet_limit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:66
      hard_packet_limit : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:67
      soft_add_expires_seconds : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:68
      hard_add_expires_seconds : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:69
      soft_use_expires_seconds : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:70
      hard_use_expires_seconds : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:71
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_lifetime_cfg);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:63

   type xfrm_lifetime_cur is record
      bytes : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:75
      packets : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:76
      add_time : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:77
      use_time : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_lifetime_cur);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:74

   type xfrm_replay_state is record
      oseq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:82
      seq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:83
      bitmap : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:84
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_replay_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:81

   type xfrm_replay_state_esn_bmp_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type xfrm_replay_state_esn is record
      bmp_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:90
      oseq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:91
      seq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:92
      oseq_hi : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:93
      seq_hi : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:94
      replay_window : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:95
      bmp : aliased xfrm_replay_state_esn_bmp_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:96
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_replay_state_esn);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:89

   subtype xfrm_algo_alg_name_array is Interfaces.C.char_array (0 .. 63);
   subtype xfrm_algo_alg_key_array is Interfaces.C.char_array (0 .. -1);
   type xfrm_algo is record
      alg_name : aliased xfrm_algo_alg_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:100
      alg_key_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:101
      alg_key : aliased xfrm_algo_alg_key_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:102
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_algo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:99

  -- in bits  
   subtype xfrm_algo_auth_alg_name_array is Interfaces.C.char_array (0 .. 63);
   subtype xfrm_algo_auth_alg_key_array is Interfaces.C.char_array (0 .. -1);
   type xfrm_algo_auth is record
      alg_name : aliased xfrm_algo_auth_alg_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:106
      alg_key_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:107
      alg_trunc_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:108
      alg_key : aliased xfrm_algo_auth_alg_key_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:109
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_algo_auth);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:105

  -- in bits  
  -- in bits  
   subtype xfrm_algo_aead_alg_name_array is Interfaces.C.char_array (0 .. 63);
   subtype xfrm_algo_aead_alg_key_array is Interfaces.C.char_array (0 .. -1);
   type xfrm_algo_aead is record
      alg_name : aliased xfrm_algo_aead_alg_name_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:113
      alg_key_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:114
      alg_icv_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:115
      alg_key : aliased xfrm_algo_aead_alg_key_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:116
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_algo_aead);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:112

  -- in bits  
  -- in bits  
   type xfrm_stats is record
      replay_window : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:120
      replay : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:121
      integrity_failed : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:122
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_stats);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:119

  -- No limitations  
  -- For this session only  
  -- For this user only  
  -- Use once  
  -- Netlink configuration messages.   
  -- * Generic LSM security context for comunicating to user space
  -- * NOTE: Same format as sadb_x_sec_ctx
  --  

   type xfrm_user_sec_ctx is record
      len : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:226
      exttype : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:227
      ctx_alg : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:228
      ctx_doi : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:229
      ctx_len : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:230
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_user_sec_ctx);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:225

  -- LSMs: e.g., selinux == 1  
   type xfrm_user_tmpl is record
      id : aliased xfrm_id;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:234
      family : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:235
      saddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:236
      reqid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:237
      mode : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:238
      share : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:239
      optional : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:240
      aalgos : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:241
      ealgos : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:242
      calgos : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:243
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_user_tmpl);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:233

   type xfrm_encap_tmpl is record
      encap_type : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:247
      encap_sport : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:248
      encap_dport : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:249
      encap_oa : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:250
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_encap_tmpl);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:246

  -- AEVENT flags   
   subtype xfrm_ae_ftype_t is unsigned;
   XFRM_AE_UNSPEC : constant xfrm_ae_ftype_t := 0;
   XFRM_AE_RTHR : constant xfrm_ae_ftype_t := 1;
   XFRM_AE_RVAL : constant xfrm_ae_ftype_t := 2;
   XFRM_AE_LVAL : constant xfrm_ae_ftype_t := 4;
   XFRM_AE_ETHR : constant xfrm_ae_ftype_t := 8;
   XFRM_AE_CR : constant xfrm_ae_ftype_t := 16;
   XFRM_AE_CE : constant xfrm_ae_ftype_t := 32;
   XFRM_AE_CU : constant xfrm_ae_ftype_t := 64;
   uu_XFRM_AE_MAX : constant xfrm_ae_ftype_t := 65;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:254

  -- replay threshold 
  -- replay value  
  -- lifetime value  
  -- expiry timer threshold  
  -- Event cause is replay update  
  -- Event cause is timer expiry  
  -- Event cause is policy update  
   type xfrm_userpolicy_type is record
      c_type : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:269
      reserved1 : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:270
      reserved2 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:271
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_userpolicy_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:268

  -- Netlink message attributes.   
   type xfrm_attr_type_t is 
     (XFRMA_UNSPEC,
      XFRMA_ALG_AUTH,
      XFRMA_ALG_CRYPT,
      XFRMA_ALG_COMP,
      XFRMA_ENCAP,
      XFRMA_TMPL,
      XFRMA_SA,
      XFRMA_POLICY,
      XFRMA_SEC_CTX,
      XFRMA_LTIME_VAL,
      XFRMA_REPLAY_VAL,
      XFRMA_REPLAY_THRESH,
      XFRMA_ETIMER_THRESH,
      XFRMA_SRCADDR,
      XFRMA_COADDR,
      XFRMA_LASTUSED,
      XFRMA_POLICY_TYPE,
      XFRMA_MIGRATE,
      XFRMA_ALG_AEAD,
      XFRMA_KMADDRESS,
      XFRMA_ALG_AUTH_TRUNC,
      XFRMA_MARK,
      XFRMA_TFCPAD,
      XFRMA_REPLAY_ESN_VAL,
      XFRMA_SA_EXTRA_FLAGS,
      XFRMA_PROTO,
      XFRMA_ADDRESS_FILTER,
      uu_XFRMA_MAX);
   pragma Convention (C, xfrm_attr_type_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:275

  -- struct xfrm_algo  
  -- struct xfrm_algo  
  -- struct xfrm_algo  
  -- struct xfrm_algo + struct xfrm_encap_tmpl  
  -- 1 or more struct xfrm_user_tmpl  
  -- struct xfrm_usersa_info   
  --struct xfrm_userpolicy_info  
  -- struct xfrm_sec_ctx  
  -- xfrm_address_t  
  -- xfrm_address_t  
  -- unsigned long   
  -- struct xfrm_userpolicy_type  
  -- struct xfrm_algo_aead  
  -- struct xfrm_user_kmaddress  
  -- struct xfrm_algo_auth  
  -- struct xfrm_mark  
  -- __u32  
  -- struct xfrm_replay_esn  
  -- __u32  
  -- __u8  
  -- struct xfrm_address_filter  
  -- value  
   type xfrm_mark is record
      v : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:309
      m : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:310
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_mark);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:308

  -- mask  
   type xfrm_sadattr_type_t is 
     (XFRMA_SAD_UNSPEC,
      XFRMA_SAD_CNT,
      XFRMA_SAD_HINFO,
      uu_XFRMA_SAD_MAX);
   pragma Convention (C, xfrm_sadattr_type_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:313

  -- current hash bkts  
   type xfrmu_sadhinfo is record
      sadhcnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:323
      sadhmcnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:324
   end record;
   pragma Convention (C_Pass_By_Copy, xfrmu_sadhinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:322

  -- max allowed hash bkts  
   type xfrm_spdattr_type_t is 
     (XFRMA_SPD_UNSPEC,
      XFRMA_SPD_INFO,
      XFRMA_SPD_HINFO,
      uu_XFRMA_SPD_MAX);
   pragma Convention (C, xfrm_spdattr_type_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:327

   type xfrmu_spdinfo is record
      incnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:337
      outcnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:338
      fwdcnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:339
      inscnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:340
      outscnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:341
      fwdscnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:342
   end record;
   pragma Convention (C_Pass_By_Copy, xfrmu_spdinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:336

   type xfrmu_spdhinfo is record
      spdhcnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:346
      spdhmcnt : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:347
   end record;
   pragma Convention (C_Pass_By_Copy, xfrmu_spdhinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:345

   type xfrm_usersa_info is record
      sel : aliased xfrm_selector;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:351
      id : aliased xfrm_id;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:352
      saddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:353
      lft : aliased xfrm_lifetime_cfg;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:354
      curlft : aliased xfrm_lifetime_cur;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:355
      stats : aliased xfrm_stats;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:356
      seq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:357
      reqid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:358
      family : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:359
      mode : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:360
      replay_window : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:361
      flags : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:362
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_usersa_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:350

  -- XFRM_MODE_xxx  
   type xfrm_usersa_id is record
      daddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:376
      spi : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:377
      family : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:378
      proto : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:379
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_usersa_id);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:375

   type xfrm_aevent_id is record
      sa_id : aliased xfrm_usersa_id;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:383
      saddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:384
      flags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:385
      reqid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:386
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_aevent_id);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:382

   type xfrm_userspi_info is record
      info : aliased xfrm_usersa_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:390
      min : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:391
      max : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:392
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_userspi_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:389

   type xfrm_userpolicy_info is record
      sel : aliased xfrm_selector;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:396
      lft : aliased xfrm_lifetime_cfg;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:397
      curlft : aliased xfrm_lifetime_cur;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:398
      priority : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:399
      index : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:400
      dir : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:401
      action : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:402
      flags : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:405
      share : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:409
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_userpolicy_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:395

  -- Automatically expand selector to include matching ICMP payloads.  
   type xfrm_userpolicy_id is record
      sel : aliased xfrm_selector;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:413
      index : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:414
      dir : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:415
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_userpolicy_id);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:412

   type xfrm_user_acquire is record
      id : aliased xfrm_id;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:419
      saddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:420
      sel : aliased xfrm_selector;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:421
      policy : aliased xfrm_userpolicy_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:422
      aalgos : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:423
      ealgos : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:424
      calgos : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:425
      seq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:426
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_user_acquire);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:418

   type xfrm_user_expire is record
      state : aliased xfrm_usersa_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:430
      hard : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:431
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_user_expire);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:429

   type xfrm_user_polexpire is record
      pol : aliased xfrm_userpolicy_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:435
      hard : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:436
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_user_polexpire);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:434

   type xfrm_usersa_flush is record
      proto : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:440
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_usersa_flush);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:439

   type xfrm_user_report is record
      proto : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:444
      sel : aliased xfrm_selector;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:445
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_user_report);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:443

  -- Used by MIGRATE to pass addresses IKE should use to perform
  -- * SA negotiation with the peer  

   type xfrm_user_kmaddress is record
      local : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:451
      remote : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:452
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:453
      family : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:454
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_user_kmaddress);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:450

   type xfrm_user_migrate is record
      old_daddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:458
      old_saddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:459
      new_daddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:460
      new_saddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:461
      proto : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:462
      mode : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:463
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:464
      reqid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:465
      old_family : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:466
      new_family : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:467
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_user_migrate);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:457

   type xfrm_user_mapping is record
      id : aliased xfrm_usersa_id;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:471
      reqid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:472
      old_saddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:473
      new_saddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:474
      old_sport : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:475
      new_sport : aliased uapi_linux_types_h.uu_be16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:476
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_user_mapping);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:470

   type xfrm_address_filter is record
      saddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:480
      daddr : xfrm_address_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:481
      family : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:482
      splen : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:483
      dplen : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:484
   end record;
   pragma Convention (C_Pass_By_Copy, xfrm_address_filter);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:479

  -- backwards compatibility for userspace  
   type xfrm_nlgroups is 
     (XFRMNLGRP_NONE,
      XFRMNLGRP_ACQUIRE,
      XFRMNLGRP_EXPIRE,
      XFRMNLGRP_SA,
      XFRMNLGRP_POLICY,
      XFRMNLGRP_AEVENTS,
      XFRMNLGRP_REPORT,
      XFRMNLGRP_MIGRATE,
      XFRMNLGRP_MAPPING,
      uu_XFRMNLGRP_MAX);
   pragma Convention (C, xfrm_nlgroups);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/xfrm.h:496

end uapi_linux_xfrm_h;

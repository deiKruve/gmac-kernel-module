pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with System;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
with linux_rbtree_h;
with linux_assoc_array_h;
with linux_rwsem_h;
with linux_uidgid_h;
limited with linux_cred_h;
with linux_sysctl_h;
limited with linux_sched_h;

package linux_key_h is

   --  unsupported macro: KEY_POS_VIEW 0x01000000
   --  unsupported macro: KEY_POS_READ 0x02000000
   --  unsupported macro: KEY_POS_WRITE 0x04000000
   --  unsupported macro: KEY_POS_SEARCH 0x08000000
   --  unsupported macro: KEY_POS_LINK 0x10000000
   --  unsupported macro: KEY_POS_SETATTR 0x20000000
   --  unsupported macro: KEY_POS_ALL 0x3f000000
   --  unsupported macro: KEY_USR_VIEW 0x00010000
   --  unsupported macro: KEY_USR_READ 0x00020000
   --  unsupported macro: KEY_USR_WRITE 0x00040000
   --  unsupported macro: KEY_USR_SEARCH 0x00080000
   --  unsupported macro: KEY_USR_LINK 0x00100000
   --  unsupported macro: KEY_USR_SETATTR 0x00200000
   --  unsupported macro: KEY_USR_ALL 0x003f0000
   --  unsupported macro: KEY_GRP_VIEW 0x00000100
   --  unsupported macro: KEY_GRP_READ 0x00000200
   --  unsupported macro: KEY_GRP_WRITE 0x00000400
   --  unsupported macro: KEY_GRP_SEARCH 0x00000800
   --  unsupported macro: KEY_GRP_LINK 0x00001000
   --  unsupported macro: KEY_GRP_SETATTR 0x00002000
   --  unsupported macro: KEY_GRP_ALL 0x00003f00
   --  unsupported macro: KEY_OTH_VIEW 0x00000001
   --  unsupported macro: KEY_OTH_READ 0x00000002
   --  unsupported macro: KEY_OTH_WRITE 0x00000004
   --  unsupported macro: KEY_OTH_SEARCH 0x00000008
   --  unsupported macro: KEY_OTH_LINK 0x00000010
   --  unsupported macro: KEY_OTH_SETATTR 0x00000020
   --  unsupported macro: KEY_OTH_ALL 0x0000003f
   --  unsupported macro: KEY_PERM_UNDEF 0xffffffff
   --  unsupported macro: KEY_FLAG_INSTANTIATED 0
   --  unsupported macro: KEY_FLAG_DEAD 1
   --  unsupported macro: KEY_FLAG_REVOKED 2
   --  unsupported macro: KEY_FLAG_IN_QUOTA 3
   --  unsupported macro: KEY_FLAG_USER_CONSTRUCT 4
   --  unsupported macro: KEY_FLAG_NEGATIVE 5
   --  unsupported macro: KEY_FLAG_ROOT_CAN_CLEAR 6
   --  unsupported macro: KEY_FLAG_INVALIDATED 7
   --  unsupported macro: KEY_FLAG_TRUSTED 8
   --  unsupported macro: KEY_FLAG_TRUSTED_ONLY 9
   --  unsupported macro: KEY_ALLOC_IN_QUOTA 0x0000
   --  unsupported macro: KEY_ALLOC_QUOTA_OVERRUN 0x0001
   --  unsupported macro: KEY_ALLOC_NOT_IN_QUOTA 0x0002
   --  unsupported macro: KEY_ALLOC_TRUSTED 0x0004
   --  unsupported macro: KEY_NEED_VIEW 0x01
   --  unsupported macro: KEY_NEED_READ 0x02
   --  unsupported macro: KEY_NEED_WRITE 0x04
   --  unsupported macro: KEY_NEED_SEARCH 0x08
   --  unsupported macro: KEY_NEED_LINK 0x10
   --  unsupported macro: KEY_NEED_SETATTR 0x20
   --  unsupported macro: KEY_NEED_ALL 0x3f
   --  arg-macro: function rcu_dereference_key (rcu_dereference_protected((KEY).payload.rcudata, rwsem_is_locked(and((struct key *)(KEY)).sem))
   --    return rcu_dereference_protected((KEY).payload.rcudata, rwsem_is_locked(and((struct key *)(KEY)).sem));
   --  arg-macro: procedure rcu_assign_keypointer do { rcu_assign_pointer((KEY).payload.rcudata, (PAYLOAD)); } while (0)
   --    do { rcu_assign_pointer((KEY).payload.rcudata, (PAYLOAD)); } while (0)
  -- Authentication token and access key management
  -- *
  -- * Copyright (C) 2004, 2007 Red Hat, Inc. All Rights Reserved.
  -- * Written by David Howells (dhowells@redhat.com)
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public License
  -- * as published by the Free Software Foundation; either version
  -- * 2 of the License, or (at your option) any later version.
  -- *
  -- *
  -- * See Documentation/security/keys.txt for information on keys/keyrings.
  --  

  -- key handle serial number  
   subtype key_serial_t is linux_types_h.int32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:31

  -- key handle permissions mask  
   subtype key_perm_t is linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:34

   --  skipped empty struct key_type

   --  skipped empty struct key_owner

   --  skipped empty struct keyring_list

   --  skipped empty struct keyring_name

   type keyring_index_key is record
      c_type : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:87
      description : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:88
      desc_len : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:89
   end record;
   pragma Convention (C_Pass_By_Copy, keyring_index_key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:86

  --*************************************************************************** 
  -- * key reference with possession attribute handling
  -- *
  -- * NOTE! key_ref_t is a typedef'd pointer to a type that is not actually
  -- * defined. This is because we abuse the bottom bit of the reference to carry a
  -- * flag to indicate whether the calling process possesses that key in one of
  -- * its keyrings.
  -- *
  -- * the key_ref_t has been made a separate type so that the compiler can reject
  -- * attempts to dereference it without proper conversion.
  -- *
  -- * the three functions are used to assemble and disassemble references
  --  

   --  skipped empty struct uu_key_reference_with_attributes

   type key_ref_t is new System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:106

   function make_key_ref (the_key : System.Address; possession : Extensions.bool) return key_ref_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:108
   pragma Import (CPP, make_key_ref, "_ZL12make_key_refPK3keyb");

   function key_ref_to_ptr (key_ref : key_ref_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:114
   pragma Import (CPP, key_ref_to_ptr, "_ZL14key_ref_to_ptrP31__key_reference_with_attributes");

   function is_key_possessed (key_ref : key_ref_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:119
   pragma Import (CPP, is_key_possessed, "_ZL16is_key_possessedP31__key_reference_with_attributes");

  --*************************************************************************** 
  -- * authentication token / access credential / keyring
  -- * - types of key include:
  -- *   - keyrings
  -- *   - disk encryption IDs
  -- *   - Kerberos TGTs and tickets
  --  

  -- number of references  
  -- key serial number  
  -- change vs change sem  
  -- owner of this key  
   --  skipped empty struct key_user

   type anon_274 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            graveyard_link : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:136
         when others =>
            serial_node : aliased linux_rbtree_h.rb_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:137
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_274);
   pragma Unchecked_Union (anon_274);
   type anon_275 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            expiry : aliased linux_types_h.time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:143
         when others =>
            revoked_at : aliased linux_types_h.time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:144
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_275);
   pragma Unchecked_Union (anon_275);
   type anon_276;
   type anon_277 is record
      c_type : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:182
      description : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:183
   end record;
   pragma Convention (C_Pass_By_Copy, anon_277);
   type anon_276 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            index_key : aliased keyring_index_key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:180
            field_2 : aliased anon_277;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_276);
   pragma Unchecked_Union (anon_276);
   type key_x_array is array (0 .. 1) of aliased unsigned_long;
   type key_p_array is array (0 .. 1) of System.Address;
   type anon_278 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            link : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:191
         when 1 =>
            x : aliased key_x_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:192
         when 2 =>
            p : aliased key_p_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:193
         when others =>
            reject_error : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:194
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_278);
   pragma Unchecked_Union (anon_278);
   type anon_279_data2_array is array (0 .. 1) of System.Address;
   type anon_280 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            value : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:203
         when 1 =>
            rcudata : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:204
         when 2 =>
            data : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:205
         when others =>
            data2 : aliased anon_279_data2_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:206
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_280);
   pragma Unchecked_Union (anon_280);
   type anon_279 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            payload : anon_280;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:207
         when others =>
            keys : aliased linux_assoc_array_h.assoc_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:208
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_279);
   pragma Unchecked_Union (anon_279);
   type key is record
      usage : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:133
      serial : aliased key_serial_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:134
      field_3 : aliased anon_274;
      sem : aliased linux_rwsem_h.rw_semaphore;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:139
      user : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:140
      security : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:141
      field_7 : aliased anon_275;
      last_used_at : aliased linux_types_h.time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:146
      uid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:147
      gid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:148
      perm : aliased key_perm_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:149
      quotalen : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:150
      datalen : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:151
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:162
      field_15 : aliased anon_276;
      type_data : anon_278;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:195
      field_17 : aliased anon_279;
   end record;
   pragma Convention (C_Pass_By_Copy, key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:132

  -- security data for this key  
  -- time at which key expires (or 0)  
  -- time at which key was revoked  
  -- last time used for LRU keyring discard  
  -- access permissions  
  -- length added to quota  
  -- payload data length
  --						 * - may not match RCU dereferenced payload
  --						 * - payload should contain own length
  --						  

  -- status flags (change with bitops)  
  -- the key type and key description string
  --	 * - the desc is used to match a key against search criteria
  --	 * - it should be a printable string
  --	 * - eg: for krb5 AFS, this might be "afs@REDHAT.COM"
  --	  

  -- type of key  
  -- type specific data
  --	 * - this is used by the keyring type to index the name
  --	  

  -- key data
  --	 * - this is used to hold the data actually used in cryptography or
  --	 *   whatever
  --	  

   function key_alloc
     (c_type : System.Address;
      desc : Interfaces.C.Strings.chars_ptr;
      uid : linux_uidgid_h.kuid_t;
      gid : linux_uidgid_h.kgid_t;
      the_cred : access constant linux_cred_h.cred;
      perm : key_perm_t;
      flags : unsigned_long) return access key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:212
   pragma Import (CPP, key_alloc, "_Z9key_allocP8key_typePKc6kuid_t6kgid_tPK4credjm");

   procedure key_revoke (the_key : access key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:225
   pragma Import (CPP, key_revoke, "_Z10key_revokeP3key");

   procedure key_invalidate (the_key : access key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:226
   pragma Import (CPP, key_invalidate, "_Z14key_invalidateP3key");

   procedure key_put (the_key : access key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:227
   pragma Import (CPP, key_put, "_Z7key_putP3key");

   --  skipped func __key_get

   function key_get (the_key : access key) return access key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:235
   pragma Import (CPP, key_get, "_ZL7key_getP3key");

   procedure key_ref_put (key_ref : key_ref_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:240
   pragma Import (CPP, key_ref_put, "_ZL11key_ref_putP31__key_reference_with_attributes");

   function request_key
     (c_type : System.Address;
      description : Interfaces.C.Strings.chars_ptr;
      callout_info : Interfaces.C.Strings.chars_ptr) return access key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:245
   pragma Import (CPP, request_key, "_Z11request_keyP8key_typePKcS2_");

   function request_key_with_auxdata
     (c_type : System.Address;
      description : Interfaces.C.Strings.chars_ptr;
      callout_info : System.Address;
      callout_len : linux_types_h.size_t;
      aux : System.Address) return access key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:249
   pragma Import (CPP, request_key_with_auxdata, "_Z24request_key_with_auxdataP8key_typePKcPKvmPv");

   function request_key_async
     (c_type : System.Address;
      description : Interfaces.C.Strings.chars_ptr;
      callout_info : System.Address;
      callout_len : linux_types_h.size_t) return access key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:255
   pragma Import (CPP, request_key_async, "_Z17request_key_asyncP8key_typePKcPKvm");

   function request_key_async_with_auxdata
     (c_type : System.Address;
      description : Interfaces.C.Strings.chars_ptr;
      callout_info : System.Address;
      callout_len : linux_types_h.size_t;
      aux : System.Address) return access key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:260
   pragma Import (CPP, request_key_async_with_auxdata, "_Z30request_key_async_with_auxdataP8key_typePKcPKvmPv");

   function wait_for_key_construction (the_key : access key; intr : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:266
   pragma Import (CPP, wait_for_key_construction, "_Z25wait_for_key_constructionP3keyb");

   function key_validate (the_key : access constant key) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:268
   pragma Import (CPP, key_validate, "_Z12key_validatePK3key");

   function key_create_or_update
     (keyring : key_ref_t;
      c_type : Interfaces.C.Strings.chars_ptr;
      description : Interfaces.C.Strings.chars_ptr;
      payload : System.Address;
      plen : linux_types_h.size_t;
      perm : key_perm_t;
      flags : unsigned_long) return key_ref_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:270
   pragma Import (CPP, key_create_or_update, "_Z20key_create_or_updateP31__key_reference_with_attributesPKcS2_PKvmjm");

   function key_update
     (key : key_ref_t;
      payload : System.Address;
      plen : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:278
   pragma Import (CPP, key_update, "_Z10key_updateP31__key_reference_with_attributesPKvm");

   function key_link (keyring : access key; the_key : access key) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:282
   pragma Import (CPP, key_link, "_Z8key_linkP3keyS0_");

   function key_unlink (keyring : access key; the_key : access key) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:285
   pragma Import (CPP, key_unlink, "_Z10key_unlinkP3keyS0_");

   function keyring_alloc
     (description : Interfaces.C.Strings.chars_ptr;
      uid : linux_uidgid_h.kuid_t;
      gid : linux_uidgid_h.kgid_t;
      the_cred : access constant linux_cred_h.cred;
      perm : key_perm_t;
      flags : unsigned_long;
      dest : access key) return access key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:288
   pragma Import (CPP, keyring_alloc, "_Z13keyring_allocPKc6kuid_t6kgid_tPK4credjmP3key");

   function keyring_clear (keyring : access key) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:294
   pragma Import (CPP, keyring_clear, "_Z13keyring_clearP3key");

   function keyring_search
     (keyring : key_ref_t;
      c_type : System.Address;
      description : Interfaces.C.Strings.chars_ptr) return key_ref_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:296
   pragma Import (CPP, keyring_search, "_Z14keyring_searchP31__key_reference_with_attributesP8key_typePKc");

   function keyring_add_key (keyring : access key; the_key : access key) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:300
   pragma Import (CPP, keyring_add_key, "_Z15keyring_add_keyP3keyS0_");

   function key_lookup (id : key_serial_t) return access key;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:303
   pragma Import (CPP, key_lookup, "_Z10key_lookupi");

   function key_serial (the_key : access constant key) return key_serial_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:305
   pragma Import (CPP, key_serial, "_ZL10key_serialPK3key");

   procedure key_set_timeout (arg1 : access key; arg2 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:310
   pragma Import (CPP, key_set_timeout, "_Z15key_set_timeoutP3keyj");

  -- * The permissions required on a key that we're looking up.
  --  

  --*
  -- * key_is_instantiated - Determine if a key has been positively instantiated
  -- * @key: The key to check.
  -- *
  -- * Return true if the specified key has been positively instantiated, false
  -- * otherwise.
  --  

   function key_is_instantiated (the_key : access constant key) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:330
   pragma Import (CPP, key_is_instantiated, "_ZL19key_is_instantiatedPK3key");

   key_sysctls : aliased array (size_t) of aliased linux_sysctl_h.ctl_table;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:346
   pragma Import (C, key_sysctls, "key_sysctls");

  -- * the userspace interface
  --  

   function install_thread_keyring_to_cred (the_cred : access linux_cred_h.cred) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:351
   pragma Import (CPP, install_thread_keyring_to_cred, "_Z30install_thread_keyring_to_credP4cred");

   procedure key_fsuid_changed (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:352
   pragma Import (CPP, key_fsuid_changed, "_Z17key_fsuid_changedP11task_struct");

   procedure key_fsgid_changed (tsk : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:353
   pragma Import (CPP, key_fsgid_changed, "_Z17key_fsgid_changedP11task_struct");

   procedure key_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/key.h:354
   pragma Import (CPP, key_init, "_Z8key_initv");

end linux_key_h;

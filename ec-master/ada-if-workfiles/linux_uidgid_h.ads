pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with Interfaces.C.Extensions;
with System;

package linux_uidgid_h is

   --  arg-macro: procedure KUIDT_INIT (kuid_t){ value }
   --    (kuid_t){ value }
   --  arg-macro: procedure KGIDT_INIT (kgid_t){ value }
   --    (kgid_t){ value }
   --  unsupported macro: GLOBAL_ROOT_UID KUIDT_INIT(0)
   --  unsupported macro: GLOBAL_ROOT_GID KGIDT_INIT(0)
   --  unsupported macro: INVALID_UID KUIDT_INIT(-1)
   --  unsupported macro: INVALID_GID KGIDT_INIT(-1)
  -- * A set of types for the internal kernel types representing uids and gids.
  -- *
  -- * The types defined in this header allow distinguishing which uids and gids in
  -- * the kernel are values used by userspace and which uid and gid values are
  -- * the internal kernel values.  With the addition of user namespaces the values
  -- * can be different.  Using the type system makes it possible for the compiler
  -- * to detect when we overlook these differences.
  -- *
  --  

   --  skipped empty struct user_namespace

   type kuid_t is record
      val : aliased linux_types_h.uid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:21
   end record;
   pragma Convention (C_Pass_By_Copy, kuid_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:22

   --  skipped anonymous struct anon_42

   type kgid_t is record
      val : aliased linux_types_h.gid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, kgid_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:27

   --  skipped anonymous struct anon_43

   --  skipped func __kuid_val

   --  skipped func __kgid_val

   function uid_eq (left : kuid_t; right : kuid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:48
   pragma Import (CPP, uid_eq, "_ZL6uid_eq6kuid_tS_");

   function gid_eq (left : kgid_t; right : kgid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:53
   pragma Import (CPP, gid_eq, "_ZL6gid_eq6kgid_tS_");

   function uid_gt (left : kuid_t; right : kuid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:58
   pragma Import (CPP, uid_gt, "_ZL6uid_gt6kuid_tS_");

   function gid_gt (left : kgid_t; right : kgid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:63
   pragma Import (CPP, gid_gt, "_ZL6gid_gt6kgid_tS_");

   function uid_gte (left : kuid_t; right : kuid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:68
   pragma Import (CPP, uid_gte, "_ZL7uid_gte6kuid_tS_");

   function gid_gte (left : kgid_t; right : kgid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:73
   pragma Import (CPP, gid_gte, "_ZL7gid_gte6kgid_tS_");

   function uid_lt (left : kuid_t; right : kuid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:78
   pragma Import (CPP, uid_lt, "_ZL6uid_lt6kuid_tS_");

   function gid_lt (left : kgid_t; right : kgid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:83
   pragma Import (CPP, gid_lt, "_ZL6gid_lt6kgid_tS_");

   function uid_lte (left : kuid_t; right : kuid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:88
   pragma Import (CPP, uid_lte, "_ZL7uid_lte6kuid_tS_");

   function gid_lte (left : kgid_t; right : kgid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:93
   pragma Import (CPP, gid_lte, "_ZL7gid_lte6kgid_tS_");

   function uid_valid (uid : kuid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:98
   pragma Import (CPP, uid_valid, "_ZL9uid_valid6kuid_t");

   function gid_valid (gid : kgid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:103
   pragma Import (CPP, gid_valid, "_ZL9gid_valid6kgid_t");

   function make_kuid (from : System.Address; uid : linux_types_h.uid_t) return kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:110
   pragma Import (CPP, make_kuid, "_Z9make_kuidP14user_namespacej");

   function make_kgid (from : System.Address; gid : linux_types_h.gid_t) return kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:111
   pragma Import (CPP, make_kgid, "_Z9make_kgidP14user_namespacej");

   function from_kuid (to : System.Address; uid : kuid_t) return linux_types_h.uid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:113
   pragma Import (CPP, from_kuid, "_Z9from_kuidP14user_namespace6kuid_t");

   function from_kgid (to : System.Address; gid : kgid_t) return linux_types_h.gid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:114
   pragma Import (CPP, from_kgid, "_Z9from_kgidP14user_namespace6kgid_t");

   function from_kuid_munged (to : System.Address; uid : kuid_t) return linux_types_h.uid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:115
   pragma Import (CPP, from_kuid_munged, "_Z16from_kuid_mungedP14user_namespace6kuid_t");

   function from_kgid_munged (to : System.Address; gid : kgid_t) return linux_types_h.gid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:116
   pragma Import (CPP, from_kgid_munged, "_Z16from_kgid_mungedP14user_namespace6kgid_t");

   function kuid_has_mapping (ns : System.Address; uid : kuid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:118
   pragma Import (CPP, kuid_has_mapping, "_ZL16kuid_has_mappingP14user_namespace6kuid_t");

   function kgid_has_mapping (ns : System.Address; gid : kgid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uidgid.h:123
   pragma Import (CPP, kgid_has_mapping, "_ZL16kgid_has_mappingP14user_namespace6kgid_t");

end linux_uidgid_h;

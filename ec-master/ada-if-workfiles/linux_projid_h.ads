pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_posix_types_h;
with Interfaces.C.Extensions;
with System;

package linux_projid_h is

   --  arg-macro: procedure KPROJIDT_INIT (kprojid_t){ value }
   --    (kprojid_t){ value }
   --  unsupported macro: INVALID_PROJID KPROJIDT_INIT(-1)
   --  unsupported macro: OVERFLOW_PROJID 65534
  -- * A set of types for the internal kernel types representing project ids.
  -- *
  -- * The types defined in this header allow distinguishing which project ids in
  -- * the kernel are values used by userspace and which project id values are
  -- * the internal kernel values.  With the addition of user namespaces the values
  -- * can be different.  Using the type system makes it possible for the compiler
  -- * to detect when we overlook these differences.
  -- *
  --  

   subtype projid_t is uapi_asm_generic_posix_types_h.uu_kernel_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/projid.h:19

   type kprojid_t is record
      val : aliased projid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/projid.h:22
   end record;
   pragma Convention (C_Pass_By_Copy, kprojid_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/projid.h:23

   --  skipped anonymous struct anon_188

   --  skipped func __kprojid_val

   function projid_eq (left : kprojid_t; right : kprojid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/projid.h:35
   pragma Import (CPP, projid_eq, "_ZL9projid_eq9kprojid_tS_");

   function projid_lt (left : kprojid_t; right : kprojid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/projid.h:40
   pragma Import (CPP, projid_lt, "_ZL9projid_lt9kprojid_tS_");

   function projid_valid (projid : kprojid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/projid.h:45
   pragma Import (CPP, projid_valid, "_ZL12projid_valid9kprojid_t");

   function make_kprojid (from : System.Address; projid : projid_t) return kprojid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/projid.h:52
   pragma Import (CPP, make_kprojid, "_Z12make_kprojidP14user_namespacej");

   function from_kprojid (to : System.Address; projid : kprojid_t) return projid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/projid.h:54
   pragma Import (CPP, from_kprojid, "_Z12from_kprojidP14user_namespace9kprojid_t");

   function from_kprojid_munged (to : System.Address; projid : kprojid_t) return projid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/projid.h:55
   pragma Import (CPP, from_kprojid_munged, "_Z19from_kprojid_mungedP14user_namespace9kprojid_t");

   function kprojid_has_mapping (ns : System.Address; projid : kprojid_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/projid.h:57
   pragma Import (CPP, kprojid_has_mapping, "_ZL19kprojid_has_mappingP14user_namespace9kprojid_t");

end linux_projid_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Extensions;

package linux_err_h is

   --  unsupported macro: MAX_ERRNO 4095
   --  arg-macro: procedure IS_ERR_VALUE unlikely((x) >= (unsigned long)-MAX_ERRNO)
   --    unlikely((x) >= (unsigned long)-MAX_ERRNO)
   --  arg-macro: procedure PTR_RET PTR_ERR_OR_ZERO(p)
   --    PTR_ERR_OR_ZERO(p)
  -- * Kernel pointers have redundant information, so we can use a
  -- * scheme where we can return either an error code or a normal
  -- * pointer with the same return value.
  -- *
  -- * This should be a per-architecture thing, to allow different
  -- * error and pointer decisions.
  --  

   function ERR_PTR (error : long) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/err.h:23
   pragma Import (CPP, ERR_PTR, "_ZL7ERR_PTRl");

   function PTR_ERR (ptr : System.Address) return long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/err.h:28
   pragma Import (CPP, PTR_ERR, "_ZL7PTR_ERRPKv");

   function IS_ERR (ptr : System.Address) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/err.h:33
   pragma Import (CPP, IS_ERR, "_ZL6IS_ERRPKv");

   function IS_ERR_OR_NULL (ptr : System.Address) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/err.h:38
   pragma Import (CPP, IS_ERR_OR_NULL, "_ZL14IS_ERR_OR_NULLPKv");

  --*
  -- * ERR_CAST - Explicitly cast an error-valued pointer to another pointer type
  -- * @ptr: The pointer to cast.
  -- *
  -- * Explicitly cast an error-valued pointer to another pointer type in such a
  -- * way as to make it clear that's what's going on.
  --  

   function ERR_CAST (ptr : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/err.h:50
   pragma Import (CPP, ERR_CAST, "_ZL8ERR_CASTPKv");

  -- cast away the const  
   function PTR_ERR_OR_ZERO (ptr : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/err.h:56
   pragma Import (CPP, PTR_ERR_OR_ZERO, "_ZL15PTR_ERR_OR_ZEROPKv");

  -- Deprecated  
end linux_err_h;

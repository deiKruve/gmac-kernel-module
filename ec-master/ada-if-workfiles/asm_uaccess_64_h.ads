pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package asm_uaccess_64_h is

  -- * User space memory access functions
  --  

  -- * Copy To/From Userspace
  --  

  -- Handles exceptions in both to and from, but doesn't do access_ok  
   function copy_user_enhanced_fast_string
     (to : System.Address;
      from : System.Address;
      len : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess_64.h:20
   pragma Import (CPP, copy_user_enhanced_fast_string, "_Z30copy_user_enhanced_fast_stringPvPKvj");

   function copy_user_generic_string
     (to : System.Address;
      from : System.Address;
      len : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess_64.h:22
   pragma Import (CPP, copy_user_generic_string, "_Z24copy_user_generic_stringPvPKvj");

   function copy_user_generic_unrolled
     (to : System.Address;
      from : System.Address;
      len : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess_64.h:24
   pragma Import (CPP, copy_user_generic_unrolled, "_Z26copy_user_generic_unrolledPvPKvj");

   function copy_user_generic
     (to : System.Address;
      from : System.Address;
      len : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess_64.h:27
   pragma Import (CPP, copy_user_generic, "_ZL17copy_user_genericPvPKvj");

  --	 * If CPU has ERMS feature, use copy_user_enhanced_fast_string.
  --	 * Otherwise, if CPU has rep_good feature, use copy_user_generic_string.
  --	 * Otherwise, use copy_user_generic_unrolled.
  --	  

   function copy_in_user
     (to : System.Address;
      from : System.Address;
      len : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess_64.h:49
   pragma Import (CPP, copy_in_user, "_Z12copy_in_userPvPKvj");

   --  skipped func __copy_from_user_nocheck

   --  skipped func __copy_from_user

   --  skipped func __copy_to_user_nocheck

   --  skipped func __copy_to_user

   --  skipped func __copy_in_user

   --  skipped func __copy_from_user_inatomic

   --  skipped func __copy_to_user_inatomic

   --  skipped func __copy_user_nocache

   --  skipped func __copy_from_user_nocache

   --  skipped func __copy_from_user_inatomic_nocache

   function copy_user_handle_tail
     (to : Interfaces.C.Strings.chars_ptr;
      from : Interfaces.C.Strings.chars_ptr;
      len : unsigned;
      zerorest : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/uaccess_64.h:234
   pragma Import (CPP, copy_user_handle_tail, "_Z21copy_user_handle_tailPcS_jj");

end asm_uaccess_64_h;

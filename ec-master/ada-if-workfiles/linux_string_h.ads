pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with linux_types_h;
with uapi_asm_generic_posix_types_h;
with Interfaces.C.Extensions;
with asm_generic_int_ll64_h;

package linux_string_h is

  -- for inline  
  -- for size_t  
  -- for NULL  
   function strndup_user (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : long) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:11
   pragma Import (CPP, strndup_user, "_Z12strndup_userPKcl");

   function memdup_user (arg1 : System.Address; arg2 : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:12
   pragma Import (CPP, memdup_user, "_Z11memdup_userPKvm");

  -- * Include machine specific inline routines
  --  

   function strcpy (dest : Interfaces.C.Strings.chars_ptr; src : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:20
   pragma Import (CPP, strcpy, "_Z6strcpyPcPKc");

   function strncpy
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : uapi_asm_generic_posix_types_h.uu_kernel_size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:23
   pragma Import (CPP, strncpy, "_Z7strncpyPcPKcm");

   function strlcpy
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : linux_types_h.size_t) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:26
   pragma Import (CPP, strlcpy, "_Z7strlcpyPcPKcm");

   function strcat (dest : Interfaces.C.Strings.chars_ptr; src : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:29
   pragma Import (CPP, strcat, "_Z6strcatPcPKc");

   function strncat
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : uapi_asm_generic_posix_types_h.uu_kernel_size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:32
   pragma Import (CPP, strncat, "_Z7strncatPcPKcm");

   function strlcat
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : uapi_asm_generic_posix_types_h.uu_kernel_size_t) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:35
   pragma Import (CPP, strlcat, "_Z7strlcatPcPKcm");

   function strcmp (cs : Interfaces.C.Strings.chars_ptr; ct : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:38
   pragma Import (CPP, strcmp, "_Z6strcmpPKcS0_");

   function strncmp
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : uapi_asm_generic_posix_types_h.uu_kernel_size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:41
   pragma Import (CPP, strncmp, "_Z7strncmpPKcS0_m");

   function strnicmp
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : uapi_asm_generic_posix_types_h.uu_kernel_size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:44
   pragma Import (CPP, strnicmp, "_Z8strnicmpPKcS0_m");

   function strcasecmp (s1 : Interfaces.C.Strings.chars_ptr; s2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:47
   pragma Import (CPP, strcasecmp, "_Z10strcasecmpPKcS0_");

   function strncasecmp
     (s1 : Interfaces.C.Strings.chars_ptr;
      s2 : Interfaces.C.Strings.chars_ptr;
      n : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:50
   pragma Import (CPP, strncasecmp, "_Z11strncasecmpPKcS0_m");

   function strchr (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:53
   pragma Import (CPP, strchr, "_Z6strchrPKci");

   function strchrnul (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:56
   pragma Import (CPP, strchrnul, "_Z9strchrnulPKci");

   function strnchr
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : linux_types_h.size_t;
      arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:59
   pragma Import (CPP, strnchr, "_Z7strnchrPKcmi");

   function strrchr (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:62
   pragma Import (CPP, strrchr, "_Z7strrchrPKci");

   function skip_spaces (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:64
   pragma Import (CPP, skip_spaces, "_Z11skip_spacesPKc");

   function strim (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:66
   pragma Import (CPP, strim, "_Z5strimPc");

   function strstrip (str : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:68
   pragma Import (CPP, strstrip, "_ZL8strstripPc");

   function strstr (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:74
   pragma Import (CPP, strstr, "_Z6strstrPKcS0_");

   function strnstr
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : linux_types_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:77
   pragma Import (CPP, strnstr, "_Z7strnstrPKcS0_m");

   function strlen (s : Interfaces.C.Strings.chars_ptr) return uapi_asm_generic_posix_types_h.uu_kernel_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:80
   pragma Import (CPP, strlen, "_Z6strlenPKc");

   function strnlen (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : uapi_asm_generic_posix_types_h.uu_kernel_size_t) return uapi_asm_generic_posix_types_h.uu_kernel_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:83
   pragma Import (CPP, strnlen, "_Z7strnlenPKcm");

   function strpbrk (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:86
   pragma Import (CPP, strpbrk, "_Z7strpbrkPKcS0_");

   function strsep (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:89
   pragma Import (CPP, strsep, "_Z6strsepPPcPKc");

   function strspn (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return uapi_asm_generic_posix_types_h.uu_kernel_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:92
   pragma Import (CPP, strspn, "_Z6strspnPKcS0_");

   function strcspn (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return uapi_asm_generic_posix_types_h.uu_kernel_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:95
   pragma Import (CPP, strcspn, "_Z7strcspnPKcS0_");

   function memscan
     (arg1 : System.Address;
      arg2 : int;
      arg3 : uapi_asm_generic_posix_types_h.uu_kernel_size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:108
   pragma Import (CPP, memscan, "_Z7memscanPvim");

   function memcmp
     (cs : System.Address;
      ct : System.Address;
      count : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:111
   pragma Import (CPP, memcmp, "_Z6memcmpPKvS0_m");

   function memchr
     (arg1 : System.Address;
      arg2 : int;
      arg3 : uapi_asm_generic_posix_types_h.uu_kernel_size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:114
   pragma Import (CPP, memchr, "_Z6memchrPKvim");

   function memchr_inv
     (s : System.Address;
      c : int;
      n : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:116
   pragma Import (CPP, memchr_inv, "_Z10memchr_invPKvim");

   function kstrdup (s : Interfaces.C.Strings.chars_ptr; gfp : linux_types_h.gfp_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:118
   pragma Import (CPP, kstrdup, "_Z7kstrdupPKcj");

   function kstrndup
     (s : Interfaces.C.Strings.chars_ptr;
      len : linux_types_h.size_t;
      gfp : linux_types_h.gfp_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:119
   pragma Import (CPP, kstrndup, "_Z8kstrndupPKcmj");

   function kmemdup
     (src : System.Address;
      len : linux_types_h.size_t;
      gfp : linux_types_h.gfp_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:120
   pragma Import (CPP, kmemdup, "_Z7kmemdupPKvmj");

   function argv_split
     (gfp : linux_types_h.gfp_t;
      str : Interfaces.C.Strings.chars_ptr;
      argcp : access int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:122
   pragma Import (CPP, argv_split, "_Z10argv_splitjPKcPi");

   procedure argv_free (argv : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:123
   pragma Import (CPP, argv_free, "_Z9argv_freePPc");

   function sysfs_streq (s1 : Interfaces.C.Strings.chars_ptr; s2 : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:125
   pragma Import (CPP, sysfs_streq, "_Z11sysfs_streqPKcS0_");

   function strtobool (s : Interfaces.C.Strings.chars_ptr; res : access Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:126
   pragma Import (CPP, strtobool, "_Z9strtoboolPKcPb");

   function vbin_printf
     (bin_buf : access asm_generic_int_ll64_h.u32;
      size : linux_types_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr;
      args : access System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:129
   pragma Import (CPP, vbin_printf, "_Z11vbin_printfPjmPKcP13__va_list_tag");

   function bstr_printf
     (buf : Interfaces.C.Strings.chars_ptr;
      size : linux_types_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr;
      bin_buf : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:130
   pragma Import (CPP, bstr_printf, "_Z11bstr_printfPcmPKcPKj");

   function bprintf
     (bin_buf : access asm_generic_int_ll64_h.u32;
      size : linux_types_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:131
   pragma Import (CPP, bprintf, "_Z7bprintfPjmPKcz");

   function memory_read_from_buffer
     (to : System.Address;
      count : linux_types_h.size_t;
      ppos : access linux_types_h.loff_t;
      from : System.Address;
      available : linux_types_h.size_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:134
   pragma Import (CPP, memory_read_from_buffer, "_Z23memory_read_from_bufferPvmPxPKvm");

  --*
  -- * strstarts - does @str start with @prefix?
  -- * @str: string to examine
  -- * @prefix: prefix to look for.
  --  

   function strstarts (str : Interfaces.C.Strings.chars_ptr; prefix : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:142
   pragma Import (CPP, strstarts, "_ZL9strstartsPKcS0_");

   function memweight (ptr : System.Address; bytes : linux_types_h.size_t) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:147
   pragma Import (CPP, memweight, "_Z9memweightPKvm");

   procedure memzero_explicit (s : System.Address; count : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:148
   pragma Import (CPP, memzero_explicit, "_Z16memzero_explicitPvm");

  --*
  -- * kbasename - return the last part of a pathname.
  -- *
  -- * @path: path to extract the filename from.
  --  

   function kbasename (path : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/string.h:155
   pragma Import (CPP, kbasename, "_ZL9kbasenamePKc");

end linux_string_h;

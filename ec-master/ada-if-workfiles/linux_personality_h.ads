pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with asm_ptrace_h;
with Interfaces.C.Strings;

package linux_personality_h is

   --  arg-macro: function personality (pers and PER_MASK
   --    return pers and PER_MASK;
   --  arg-macro: function set_personality ((current.personality = (pers)) ? 0 : __set_personality(pers)
   --    return (current.personality = (pers)) ? 0 : __set_personality(pers);
  -- * Handling of different ABIs (personalities).
  --  

   function register_exec_domain (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:14
   pragma Import (CPP, register_exec_domain, "_Z20register_exec_domainP11exec_domain");

   function unregister_exec_domain (arg1 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:15
   pragma Import (CPP, unregister_exec_domain, "_Z22unregister_exec_domainP11exec_domain");

   --  skipped func __set_personality

  -- * Description of an execution domain.
  -- * 
  -- * The first two members are refernced from assembly source
  -- * and should stay where they are unless explicitly needed.
  --  

   type handler_t is access procedure (arg1 : int; arg2 : access asm_ptrace_h.pt_regs);
   pragma Convention (C, handler_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:25

  -- name of the execdomain  
   type exec_domain is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:28
      handler : handler_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:29
      pers_low : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:30
      pers_high : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:31
      signal_map : access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:32
      signal_invmap : access unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:33
      err_map : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:34
      socktype_map : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:35
      sockopt_map : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:36
      af_map : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:37
      the_module : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:38
      next : access exec_domain;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:39
   end record;
   pragma Convention (C_Pass_By_Copy, exec_domain);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/personality.h:27

  -- handler for syscalls  
  -- lowest personality  
  -- highest personality  
  -- signal mapping  
  -- reverse signal mapping  
  -- error mapping  
   --  skipped empty struct map_segment

  -- socket type mapping  
  -- socket option mapping  
  -- address family mapping  
  -- module context of the ed.  
  -- linked list (internal)  
  -- * Return the base personality without flags.
  --  

  -- * Change personality of the currently running process.
  --  

end linux_personality_h;

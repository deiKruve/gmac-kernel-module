
pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
--with x86_64_linux_gnu_bits_types_h;
--limited with x86_64_linux_gnu_bits_resource_h;

package Sys_Resource is
   
   subtype uu_uid_t is unsigned; -- x86_64_linux_gnu_bits_types_h
   subtype id_t is uu_uid_t;
   
   subtype uu_priority_which_t is int;
   
   

   function getpriority (uu_which : uu_priority_which_t; uu_who : id_t) 
                        return int;
   -- Return the highest priority of any process specified by WHICH and WHO
   --   (see above); if WHO is zero, the current process, process group, or user
   --   (as specified by WHO) is used.  A lower priority number means higher
   --   priority.  Priorities range from PRIO_MIN to PRIO_MAX (above).   
   pragma Import (C, getpriority, "getpriority");

  
   function setpriority
     (uu_which : uu_priority_which_t;
      uu_who : id_t;
      uu_prio : int) 
     return int;
   -- Set the priority of all processes specified by WHICH and WHO (see above)
   --   to PRIO.  Returns 0 on success, -1 on errors.   
   pragma Import (C, setpriority, "setpriority");
   
end Sys_Resource;

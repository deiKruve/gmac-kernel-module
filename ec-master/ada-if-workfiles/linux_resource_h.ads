pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sched_h;
limited with uapi_linux_resource_h;

package linux_resource_h is

   function getrusage
     (p : access linux_sched_h.task_struct;
      who : int;
      ru : access uapi_linux_resource_h.rusage) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/resource.h:9
   pragma Import (CPP, getrusage, "_Z9getrusageP11task_structiP6rusage");

   function do_prlimit
     (tsk : access linux_sched_h.task_struct;
      resource : unsigned;
      new_rlim : access uapi_linux_resource_h.rlimit;
      old_rlim : access uapi_linux_resource_h.rlimit) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/resource.h:10
   pragma Import (CPP, do_prlimit, "_Z10do_prlimitP11task_structjP6rlimitS2_");

end linux_resource_h;


with Interfaces.C; use Interfaces.C;

package Linux_Sched is
   
   -- from generated_autoconf_h
   -- #define CONFIG_HZ 250
   -- from linux_param_h
   -- # define HZ      	CONFIG_HZ	/* Internal kernel timer frequency */
   
   HZ : constant long := 250;
   
   function schedule_timeout (timeout : long) return long;
   pragma Import (C, schedule_timeout, "schedule_timeout");

   
end Linux_Sched;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sched_h;

package linux_latencytop_h is

  -- * latencytop.h: Infrastructure for displaying latency
  -- *
  -- * (C) Copyright 2008 Intel Corporation
  -- * Author: Arjan van de Ven <arjan@linux.intel.com>
  -- *
  --  

   procedure account_scheduler_latency
     (c_task : access linux_sched_h.task_struct;
      usecs : int;
      inter : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/latencytop.h:43
   pragma Import (CPP, account_scheduler_latency, "_ZL25account_scheduler_latencyP11task_structii");

   procedure clear_all_latency_tracing (p : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/latencytop.h:47
   pragma Import (CPP, clear_all_latency_tracing, "_ZL25clear_all_latency_tracingP11task_struct");

end linux_latencytop_h;

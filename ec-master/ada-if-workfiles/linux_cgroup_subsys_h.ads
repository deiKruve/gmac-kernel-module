pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_cgroup_h;

package linux_cgroup_subsys_h is

  -- * List of cgroup subsystems.
  -- *
  -- * DO NOT ADD ANY SUBSYSTEM WITHOUT EXPLICIT ACKS FROM CGROUP MAINTAINERS.
  --  

   cpuset_cgrp_subsys : aliased linux_cgroup_h.cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup_subsys.h:7
   pragma Import (C, cpuset_cgrp_subsys, "cpuset_cgrp_subsys");

   cpu_cgrp_subsys : aliased linux_cgroup_h.cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup_subsys.h:11
   pragma Import (C, cpu_cgrp_subsys, "cpu_cgrp_subsys");

   cpuacct_cgrp_subsys : aliased linux_cgroup_h.cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup_subsys.h:15
   pragma Import (C, cpuacct_cgrp_subsys, "cpuacct_cgrp_subsys");

   memory_cgrp_subsys : aliased linux_cgroup_h.cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup_subsys.h:19
   pragma Import (C, memory_cgrp_subsys, "memory_cgrp_subsys");

   devices_cgrp_subsys : aliased linux_cgroup_h.cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup_subsys.h:23
   pragma Import (C, devices_cgrp_subsys, "devices_cgrp_subsys");

   freezer_cgrp_subsys : aliased linux_cgroup_h.cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup_subsys.h:27
   pragma Import (C, freezer_cgrp_subsys, "freezer_cgrp_subsys");

   net_cls_cgrp_subsys : aliased linux_cgroup_h.cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup_subsys.h:31
   pragma Import (C, net_cls_cgrp_subsys, "net_cls_cgrp_subsys");

   blkio_cgrp_subsys : aliased linux_cgroup_h.cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup_subsys.h:35
   pragma Import (C, blkio_cgrp_subsys, "blkio_cgrp_subsys");

   perf_event_cgrp_subsys : aliased linux_cgroup_h.cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup_subsys.h:39
   pragma Import (C, perf_event_cgrp_subsys, "perf_event_cgrp_subsys");

   net_prio_cgrp_subsys : aliased linux_cgroup_h.cgroup_subsys;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/cgroup_subsys.h:43
   pragma Import (C, net_prio_cgrp_subsys, "net_prio_cgrp_subsys");

  -- * The following subsystems are not supported on the default hierarchy.
  --  

  -- * DO NOT ADD ANY SUBSYSTEM WITHOUT EXPLICIT ACKS FROM CGROUP MAINTAINERS.
  --  

end linux_cgroup_subsys_h;

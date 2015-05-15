pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_dynamic_queue_limits_h is

   --  unsupported macro: DQL_MAX_OBJECT (UINT_MAX / 16)
   --  unsupported macro: DQL_MAX_LIMIT ((UINT_MAX / 2) - DQL_MAX_OBJECT)
  -- * Dynamic queue limits (dql) - Definitions
  -- *
  -- * Copyright (c) 2011, Tom Herbert <therbert@google.com>
  -- *
  -- * This header file contains the definitions for dynamic queue limits (dql).
  -- * dql would be used in conjunction with a producer/consumer type queue
  -- * (possibly a HW queue).  Such a queue would have these general properties:
  -- *
  -- *   1) Objects are queued up to some limit specified as number of objects.
  -- *   2) Periodically a completion process executes which retires consumed
  -- *      objects.
  -- *   3) Starvation occurs when limit has been reached, all queued data has
  -- *      actually been consumed, but completion processing has not yet run
  -- *      so queuing new data is blocked.
  -- *   4) Minimizing the amount of queued data is desirable.
  -- *
  -- * The goal of dql is to calculate the limit as the minimum number of objects
  -- * needed to prevent starvation.
  -- *
  -- * The primary functions of dql are:
  -- *    dql_queued - called when objects are enqueued to record number of objects
  -- *    dql_avail - returns how many objects are available to be queued based
  -- *      on the object limit and how many objects are already enqueued
  -- *    dql_completed - called at completion time to indicate how many objects
  -- *      were retired from the queue
  -- *
  -- * The dql implementation does not implement any locking for the dql data
  -- * structures, the higher layer should provide this.  dql_queued should
  -- * be serialized to prevent concurrent execution of the function; this
  -- * is also true for  dql_completed.  However, dql_queued and dlq_completed  can
  -- * be executed concurrently (i.e. they can be protected by different locks).
  --  

  -- Fields accessed in enqueue path (dql_queued)  
  -- Total ever queued  
   type dql is record
      num_queued : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:42
      adj_limit : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:43
      last_obj_cnt : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:44
      limit : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:48
      num_completed : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:49
      prev_ovlimit : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:51
      prev_num_queued : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:52
      prev_last_obj_cnt : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:53
      lowest_slack : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:55
      slack_start_time : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:56
      max_limit : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:59
      min_limit : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:60
      slack_hold_time : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:61
   end record;
   pragma Convention (C_Pass_By_Copy, dql);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:40

  -- limit + num_completed  
  -- Count at last queuing  
  -- Fields accessed only by completion path (dql_completed)  
  -- Current limit  
  -- Total ever completed  
  -- Previous over limit  
  -- Previous queue total  
  -- Previous queuing cnt  
  -- Lowest slack found  
  -- Time slacks seen  
  -- Configuration  
  -- Max limit  
  -- Minimum limit  
  -- Time to measure slack  
  -- Set some static maximums  
  -- * Record number of objects queued. Assumes that caller has already checked
  -- * availability in the queue with dql_avail.
  --  

   procedure dql_queued (the_dql : access dql; count : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:72
   pragma Import (CPP, dql_queued, "_ZL10dql_queuedP3dqlj");

  -- Returns how many objects can be queued, < 0 indicates over limit.  
   function dql_avail (the_dql : access constant dql) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:81
   pragma Import (CPP, dql_avail, "_ZL9dql_availPK3dql");

  -- Record number of completed objects and recalculate the limit.  
   procedure dql_completed (the_dql : access dql; count : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:87
   pragma Import (CPP, dql_completed, "_Z13dql_completedP3dqlj");

  -- Reset dql state  
   procedure dql_reset (the_dql : access dql);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:90
   pragma Import (CPP, dql_reset, "_Z9dql_resetP3dql");

  -- Initialize dql state  
   function dql_init (the_dql : access dql; hold_time : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_queue_limits.h:93
   pragma Import (CPP, dql_init, "_Z8dql_initP3dqlj");

end linux_dynamic_queue_limits_h;

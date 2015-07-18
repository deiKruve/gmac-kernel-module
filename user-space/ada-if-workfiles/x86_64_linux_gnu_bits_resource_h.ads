pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_types_h;
with x86_64_linux_gnu_bits_time_h;

package x86_64_linux_gnu_bits_resource_h is

   --  unsupported macro: RLIMIT_CPU RLIMIT_CPU
   --  unsupported macro: RLIMIT_FSIZE RLIMIT_FSIZE
   --  unsupported macro: RLIMIT_DATA RLIMIT_DATA
   --  unsupported macro: RLIMIT_STACK RLIMIT_STACK
   --  unsupported macro: RLIMIT_CORE RLIMIT_CORE
   --  unsupported macro: RLIMIT_RSS __RLIMIT_RSS
   --  unsupported macro: RLIMIT_NOFILE RLIMIT_NOFILE
   --  unsupported macro: RLIMIT_OFILE __RLIMIT_OFILE
   --  unsupported macro: RLIMIT_AS RLIMIT_AS
   --  unsupported macro: RLIMIT_NPROC __RLIMIT_NPROC
   --  unsupported macro: RLIMIT_MEMLOCK __RLIMIT_MEMLOCK
   --  unsupported macro: RLIMIT_LOCKS __RLIMIT_LOCKS
   --  unsupported macro: RLIMIT_SIGPENDING __RLIMIT_SIGPENDING
   --  unsupported macro: RLIMIT_MSGQUEUE __RLIMIT_MSGQUEUE
   --  unsupported macro: RLIMIT_NICE __RLIMIT_NICE
   --  unsupported macro: RLIMIT_RTPRIO __RLIMIT_RTPRIO
   --  unsupported macro: RLIMIT_RTTIME __RLIMIT_RTTIME
   --  unsupported macro: RLIMIT_NLIMITS __RLIMIT_NLIMITS
   --  unsupported macro: RLIM_NLIMITS __RLIM_NLIMITS
   --  unsupported macro: RLIM_INFINITY ((__rlim_t) -1)
   --  unsupported macro: RLIM64_INFINITY 0xffffffffffffffffuLL
   --  unsupported macro: RLIM_SAVED_MAX RLIM_INFINITY
   --  unsupported macro: RLIM_SAVED_CUR RLIM_INFINITY
   --  unsupported macro: RUSAGE_SELF RUSAGE_SELF
   --  unsupported macro: RUSAGE_CHILDREN RUSAGE_CHILDREN
   --  unsupported macro: RUSAGE_THREAD RUSAGE_THREAD
   --  unsupported macro: RUSAGE_LWP RUSAGE_THREAD
   --  unsupported macro: PRIO_MIN -20
   --  unsupported macro: PRIO_MAX 20
   --  unsupported macro: PRIO_PROCESS PRIO_PROCESS
   --  unsupported macro: PRIO_PGRP PRIO_PGRP
   --  unsupported macro: PRIO_USER PRIO_USER
  -- Bit values & structures for resource limits.  Linux version.
  --   Copyright (C) 1994-2014 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <http://www.gnu.org/licenses/>.   

  -- Transmute defines to enumerations.  The macro re-definitions are
  --   necessary because some programs want to test for operating system
  --   features with #ifdef RUSAGE_SELF.  In ISO C the reflexive
  --   definition is a no-op.   

  -- Kinds of resource limit.   
   subtype uu_rlimit_resource is unsigned;
   RLIMIT_CPU : constant uu_rlimit_resource := 0;
   RLIMIT_FSIZE : constant uu_rlimit_resource := 1;
   RLIMIT_DATA : constant uu_rlimit_resource := 2;
   RLIMIT_STACK : constant uu_rlimit_resource := 3;
   RLIMIT_CORE : constant uu_rlimit_resource := 4;
   uu_RLIMIT_RSS : constant uu_rlimit_resource := 5;
   RLIMIT_NOFILE : constant uu_rlimit_resource := 7;
   uu_RLIMIT_OFILE : constant uu_rlimit_resource := 7;
   RLIMIT_AS : constant uu_rlimit_resource := 9;
   uu_RLIMIT_NPROC : constant uu_rlimit_resource := 6;
   uu_RLIMIT_MEMLOCK : constant uu_rlimit_resource := 8;
   uu_RLIMIT_LOCKS : constant uu_rlimit_resource := 10;
   uu_RLIMIT_SIGPENDING : constant uu_rlimit_resource := 11;
   uu_RLIMIT_MSGQUEUE : constant uu_rlimit_resource := 12;
   uu_RLIMIT_NICE : constant uu_rlimit_resource := 13;
   uu_RLIMIT_RTPRIO : constant uu_rlimit_resource := 14;
   uu_RLIMIT_RTTIME : constant uu_rlimit_resource := 15;
   uu_RLIMIT_NLIMITS : constant uu_rlimit_resource := 16;
   uu_RLIM_NLIMITS : constant uu_rlimit_resource := 16;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:31

  -- Per-process CPU limit, in seconds.   
  -- Largest file that can be created, in bytes.   
  -- Maximum size of data segment, in bytes.   
  -- Maximum size of stack segment, in bytes.   
  -- Largest core file that can be created, in bytes.   
  -- Largest resident set size, in bytes.
  --     This affects swapping; processes that are exceeding their
  --     resident set size will be more likely to have physical memory
  --     taken from them.   

  -- Number of open files.   
  -- BSD name for same.   
  -- Address space limit.   
  -- Number of processes.   
  -- Locked-in-memory address space.   
  -- Maximum number of file locks.   
  -- Maximum number of pending signals.   
  -- Maximum bytes in POSIX message queues.   
  -- Maximum nice priority allowed to raise to.
  --     Nice levels 19 .. -20 correspond to 0 .. 39
  --     values of this resource limit.   

  -- Maximum realtime priority allowed for non-priviledged
  --     processes.   

  -- Maximum CPU time in µs that a process scheduled under a real-time
  --     scheduling policy may consume without making a blocking system
  --     call before being forcibly descheduled.   

  -- Value to indicate that there is no limit.   
  -- We can represent all limits.   
  -- Type for resource quantity measurement.   
   subtype rlim_t is x86_64_linux_gnu_bits_types_h.uu_rlim_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:131

   subtype rlim64_t is x86_64_linux_gnu_bits_types_h.uu_rlim64_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:136

  -- The current (soft) limit.   
   type rlimit is record
      rlim_cur : aliased rlim_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:142
      rlim_max : aliased rlim_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:144
   end record;
   pragma Convention (C_Pass_By_Copy, rlimit);  -- /usr/include/x86_64-linux-gnu/bits/resource.h:139

  -- The hard limit.   
  -- The current (soft) limit.   
   type rlimit64 is record
      rlim_cur : aliased rlim64_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:151
      rlim_max : aliased rlim64_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:153
   end record;
   pragma Convention (C_Pass_By_Copy, rlimit64);  -- /usr/include/x86_64-linux-gnu/bits/resource.h:148

  -- The hard limit.   
  -- Whose usage statistics do you want?   
   subtype uu_rusage_who is unsigned;
   RUSAGE_SELF : constant uu_rusage_who := 0;
   RUSAGE_CHILDREN : constant uu_rusage_who := -1;
   RUSAGE_THREAD : constant uu_rusage_who := 1;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:158

  -- The calling process.   
  -- All of its terminated child processes.   
  -- The calling thread.   
  -- Name for the same functionality on Solaris.   
  -- For `struct timeval'.   
  -- Structure which says how much of each resource has been used.   
  -- The purpose of all the unions is to have the kernel-compatible layout
  --   while keeping the API type as 'long int', and among machines where
  --   __syscall_slong_t is not 'long int', this only does the right thing
  --   for little-endian ones, like x32.   

  -- Total amount of user time used.   
   type anon_1 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_maxrss : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:196
         when others =>
            uu_ru_maxrss_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:197
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_1);
   pragma Unchecked_Union (anon_1);
   type anon_2 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_ixrss : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:204
         when others =>
            uu_ru_ixrss_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:205
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_2);
   pragma Unchecked_Union (anon_2);
   type anon_3 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_idrss : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:210
         when others =>
            uu_ru_idrss_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:211
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_3);
   pragma Unchecked_Union (anon_3);
   type anon_4 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_isrss : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:216
         when others =>
            uu_ru_isrss_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:217
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_4);
   pragma Unchecked_Union (anon_4);
   type anon_5 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_minflt : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:223
         when others =>
            uu_ru_minflt_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:224
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_5);
   pragma Unchecked_Union (anon_5);
   type anon_6 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_majflt : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:229
         when others =>
            uu_ru_majflt_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:230
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_6);
   pragma Unchecked_Union (anon_6);
   type anon_7 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_nswap : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:235
         when others =>
            uu_ru_nswap_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:236
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_7);
   pragma Unchecked_Union (anon_7);
   type anon_8 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_inblock : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:242
         when others =>
            uu_ru_inblock_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:243
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_8);
   pragma Unchecked_Union (anon_8);
   type anon_9 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_oublock : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:248
         when others =>
            uu_ru_oublock_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:249
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_9);
   pragma Unchecked_Union (anon_9);
   type anon_10 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_msgsnd : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:254
         when others =>
            uu_ru_msgsnd_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:255
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_10);
   pragma Unchecked_Union (anon_10);
   type anon_11 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_msgrcv : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:260
         when others =>
            uu_ru_msgrcv_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:261
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_11);
   pragma Unchecked_Union (anon_11);
   type anon_12 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_nsignals : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:266
         when others =>
            uu_ru_nsignals_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:267
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_12);
   pragma Unchecked_Union (anon_12);
   type anon_13 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_nvcsw : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:274
         when others =>
            uu_ru_nvcsw_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:275
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_13);
   pragma Unchecked_Union (anon_13);
   type anon_14 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ru_nivcsw : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:281
         when others =>
            uu_ru_nivcsw_word : aliased x86_64_linux_gnu_bits_types_h.uu_syscall_slong_t;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:282
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_14);
   pragma Unchecked_Union (anon_14);
   type rusage is record
      ru_utime : aliased x86_64_linux_gnu_bits_time_h.timeval;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:190
      ru_stime : aliased x86_64_linux_gnu_bits_time_h.timeval;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:192
      field_3 : aliased anon_1;
      field_4 : aliased anon_2;
      field_5 : aliased anon_3;
      field_6 : aliased anon_4;
      field_7 : aliased anon_5;
      field_8 : aliased anon_6;
      field_9 : aliased anon_7;
      field_10 : aliased anon_8;
      field_11 : aliased anon_9;
      field_12 : aliased anon_10;
      field_13 : aliased anon_11;
      field_14 : aliased anon_12;
      field_15 : aliased anon_13;
      field_16 : aliased anon_14;
   end record;
   pragma Convention (C_Pass_By_Copy, rusage);  -- /usr/include/x86_64-linux-gnu/bits/resource.h:187

  -- Total amount of system time used.   
  -- Maximum resident set size (in kilobytes).   
  -- Amount of sharing of text segment memory
  --       with other processes (kilobyte-seconds).   

  -- Maximum resident set size (in kilobytes).   
  -- Amount of data segment memory used (kilobyte-seconds).   
  -- Amount of stack memory used (kilobyte-seconds).   
  -- Number of soft page faults (i.e. those serviced by reclaiming
  --       a page from the list of pages awaiting reallocation.   

  -- Number of hard page faults (i.e. those that required I/O).   
  -- Number of times a process was swapped out of physical memory.   
  -- Number of input operations via the file system.  Note: This
  --       and `ru_oublock' do not include operations with the cache.   

  -- Number of output operations via the file system.   
  -- Number of IPC messages sent.   
  -- Number of IPC messages received.   
  -- Number of signals delivered.   
  -- Number of voluntary context switches, i.e. because the process
  --       gave up the process before it had to (usually to wait for some
  --       resource to be available).   

  -- Number of involuntary context switches, i.e. a higher priority process
  --       became runnable or the current process used up its time slice.   

  -- Priority limits.   
  -- The type of the WHICH argument to `getpriority' and `setpriority',
  --   indicating what flavor of entity the WHO argument specifies.   

   type uu_priority_which is 
     (PRIO_PROCESS,
      PRIO_PGRP,
      PRIO_USER);
   pragma Convention (C, uu_priority_which);  -- /usr/include/x86_64-linux-gnu/bits/resource.h:292

  -- WHO is a process ID.   
  -- WHO is a process group ID.   
  -- WHO is a user ID.   
  -- Modify and return resource limits of a process atomically.   
   function prlimit
     (uu_pid : x86_64_linux_gnu_bits_types_h.uu_pid_t;
      uu_resource : uu_rlimit_resource;
      uu_new_limit : access constant rlimit;
      uu_old_limit : access rlimit) return int;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:308
   pragma Import (C, prlimit, "prlimit");

   function prlimit64
     (uu_pid : x86_64_linux_gnu_bits_types_h.uu_pid_t;
      uu_resource : uu_rlimit_resource;
      uu_new_limit : access constant rlimit64;
      uu_old_limit : access rlimit64) return int;  -- /usr/include/x86_64-linux-gnu/bits/resource.h:322
   pragma Import (C, prlimit64, "prlimit64");

end x86_64_linux_gnu_bits_resource_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_types_h;
limited with x86_64_linux_gnu_bits_resource_h;

package resource_h is

  -- Copyright (C) 1992-2014 Free Software Foundation, Inc.
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

  -- Get the system-dependent definitions of structures and bit values.   
   subtype id_t is x86_64_linux_gnu_bits_types_h.uu_id_t;  -- resource.h:27

  -- The X/Open standard defines that all the functions below must use
  --   `int' as the type for the first argument.  When we are compiling with
  --   GNU extensions we change this slightly to provide better error
  --   checking.   

   subtype uu_rlimit_resource_t is int;  -- resource.h:42

   subtype uu_rusage_who_t is int;  -- resource.h:43

   subtype uu_priority_which_t is int;  -- resource.h:44

  -- Put the soft and hard limits for RESOURCE in *RLIMITS.
  --   Returns 0 if successful, -1 if not (and sets errno).   

   function getrlimit (uu_resource : uu_rlimit_resource_t; uu_rlimits : access x86_64_linux_gnu_bits_resource_h.rlimit) return int;  -- resource.h:50
   pragma Import (C, getrlimit, "getrlimit");

   function getrlimit64 (uu_resource : uu_rlimit_resource_t; uu_rlimits : access x86_64_linux_gnu_bits_resource_h.rlimit64) return int;  -- resource.h:61
   pragma Import (C, getrlimit64, "getrlimit64");

  -- Set the soft and hard limits for RESOURCE to *RLIMITS.
  --   Only the super-user can increase hard limits.
  --   Return 0 if successful, -1 if not (and sets errno).   

   function setrlimit (uu_resource : uu_rlimit_resource_t; uu_rlimits : access constant x86_64_linux_gnu_bits_resource_h.rlimit) return int;  -- resource.h:69
   pragma Import (C, setrlimit, "setrlimit");

   function setrlimit64 (uu_resource : uu_rlimit_resource_t; uu_rlimits : access constant x86_64_linux_gnu_bits_resource_h.rlimit64) return int;  -- resource.h:81
   pragma Import (C, setrlimit64, "setrlimit64");

  -- Return resource usage information on process indicated by WHO
  --   and put it in *USAGE.  Returns 0 for success, -1 for failure.   

   function getrusage (uu_who : uu_rusage_who_t; uu_usage : access x86_64_linux_gnu_bits_resource_h.rusage) return int;  -- resource.h:87
   pragma Import (C, getrusage, "getrusage");

  -- Return the highest priority of any process specified by WHICH and WHO
  --   (see above); if WHO is zero, the current process, process group, or user
  --   (as specified by WHO) is used.  A lower priority number means higher
  --   priority.  Priorities range from PRIO_MIN to PRIO_MAX (above).   

   function getpriority (uu_which : uu_priority_which_t; uu_who : id_t) return int;  -- resource.h:93
   pragma Import (C, getpriority, "getpriority");

  -- Set the priority of all processes specified by WHICH and WHO (see above)
  --   to PRIO.  Returns 0 on success, -1 on errors.   

   function setpriority
     (uu_which : uu_priority_which_t;
      uu_who : id_t;
      uu_prio : int) return int;  -- resource.h:97
   pragma Import (C, setpriority, "setpriority");

end resource_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_ptrace_h;
limited with linux_mm_types_h;
with Interfaces.C.Extensions;
with asm_uprobes_h;
with linux_types_h;
with System;
limited with linux_fs_h;
limited with linux_sched_h;
limited with linux_notifier_h;

package linux_uprobes_h is

   --  unsupported macro: UPROBE_HANDLER_REMOVE 1
   --  unsupported macro: UPROBE_HANDLER_MASK 1
   --  unsupported macro: MAX_URETPROBE_DEPTH 64
  -- * User-space Probes (UProbes)
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License as published by
  -- * the Free Software Foundation; either version 2 of the License, or
  -- * (at your option) any later version.
  -- *
  -- * This program is distributed in the hope that it will be useful,
  -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- * GNU General Public License for more details.
  -- *
  -- * You should have received a copy of the GNU General Public License
  -- * along with this program; if not, write to the Free Software
  -- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
  -- *
  -- * Copyright (C) IBM Corporation, 2008-2012
  -- * Authors:
  -- *	Srikar Dronamraju
  -- *	Jim Keniston
  -- * Copyright (C) 2011-2012 Red Hat, Inc., Peter Zijlstra <pzijlstr@redhat.com>
  --  

   type uprobe_filter_ctx is 
     (UPROBE_FILTER_REGISTER,
      UPROBE_FILTER_UNREGISTER,
      UPROBE_FILTER_MMAP);
   pragma Convention (C, uprobe_filter_ctx);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:42

   type uprobe_consumer is record
      handler : access function (arg1 : access uprobe_consumer; arg2 : access asm_ptrace_h.pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:49
      ret_handler : access function
           (arg1 : access uprobe_consumer;
            arg2 : unsigned_long;
            arg3 : access asm_ptrace_h.pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:52
      filter : access function
           (arg1 : access uprobe_consumer;
            arg2 : uprobe_filter_ctx;
            arg3 : access linux_mm_types_h.mm_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:55
      next : access uprobe_consumer;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:57
   end record;
   pragma Convention (C_Pass_By_Copy, uprobe_consumer);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:48

   type uprobe_task_state is 
     (UTASK_RUNNING,
      UTASK_SSTEP,
      UTASK_SSTEP_ACK,
      UTASK_SSTEP_TRAPPED);
   pragma Convention (C, uprobe_task_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:63

  -- * uprobe_task: Metadata of a task while it singlesteps.
  --  

   type anon_150;
   type anon_151 is record
      autask : aliased asm_uprobes_h.arch_uprobe_task;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:78
      vaddr : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:79
   end record;
   pragma Convention (C_Pass_By_Copy, anon_151);
   type anon_152 is record
      dup_xol_work : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:83
      dup_xol_addr : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:84
   end record;
   pragma Convention (C_Pass_By_Copy, anon_152);
   type anon_150 (discr : unsigned := 0) is record
      case discr is
            parent : aliased anon_151;
            field_2 : aliased anon_152;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_150);
   pragma Unchecked_Union (anon_150);
   type uprobe_task is record
      state : aliased uprobe_task_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:74
      field_2 : aliased anon_150;
      active_uprobe : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:88
      xol_vaddr : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:89
      return_instances : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:91
      depth : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:92
   end record;
   pragma Convention (C_Pass_By_Copy, uprobe_task);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:73

   --  skipped empty struct uprobe

   --  skipped empty struct return_instance

   --  skipped empty struct xol_area

   type uprobes_state is record
      the_xol_area : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:98
   end record;
   pragma Convention (C_Pass_By_Copy, uprobes_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:97

   function set_swbp
     (aup : access asm_uprobes_h.arch_uprobe;
      mm : access linux_mm_types_h.mm_struct;
      vaddr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:101
   pragma Import (CPP, set_swbp, "_Z8set_swbpP11arch_uprobeP9mm_structm");

   function set_orig_insn
     (aup : access asm_uprobes_h.arch_uprobe;
      mm : access linux_mm_types_h.mm_struct;
      vaddr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:102
   pragma Import (CPP, set_orig_insn, "_Z13set_orig_insnP11arch_uprobeP9mm_structm");

   function is_swbp_insn (insn : access asm_uprobes_h.uprobe_opcode_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:103
   pragma Import (CPP, is_swbp_insn, "_Z12is_swbp_insnPh");

   function is_trap_insn (insn : access asm_uprobes_h.uprobe_opcode_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:104
   pragma Import (CPP, is_trap_insn, "_Z12is_trap_insnPh");

   function uprobe_get_swbp_addr (regs : access asm_ptrace_h.pt_regs) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:105
   pragma Import (CPP, uprobe_get_swbp_addr, "_Z20uprobe_get_swbp_addrP7pt_regs");

   function uprobe_get_trap_addr (regs : access asm_ptrace_h.pt_regs) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:106
   pragma Import (CPP, uprobe_get_trap_addr, "_Z20uprobe_get_trap_addrP7pt_regs");

   function uprobe_write_opcode
     (mm : access linux_mm_types_h.mm_struct;
      vaddr : unsigned_long;
      arg3 : asm_uprobes_h.uprobe_opcode_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:107
   pragma Import (CPP, uprobe_write_opcode, "_Z19uprobe_write_opcodeP9mm_structmh");

   function uprobe_register
     (the_inode : access linux_fs_h.inode;
      offset : linux_types_h.loff_t;
      uc : access uprobe_consumer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:108
   pragma Import (CPP, uprobe_register, "_Z15uprobe_registerP5inodexP15uprobe_consumer");

   function uprobe_apply
     (the_inode : access linux_fs_h.inode;
      offset : linux_types_h.loff_t;
      uc : access uprobe_consumer;
      arg4 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:109
   pragma Import (CPP, uprobe_apply, "_Z12uprobe_applyP5inodexP15uprobe_consumerb");

   procedure uprobe_unregister
     (the_inode : access linux_fs_h.inode;
      offset : linux_types_h.loff_t;
      uc : access uprobe_consumer);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:110
   pragma Import (CPP, uprobe_unregister, "_Z17uprobe_unregisterP5inodexP15uprobe_consumer");

   function uprobe_mmap (vma : access linux_mm_types_h.vm_area_struct) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:111
   pragma Import (CPP, uprobe_mmap, "_Z11uprobe_mmapP14vm_area_struct");

   procedure uprobe_munmap
     (vma : access linux_mm_types_h.vm_area_struct;
      start : unsigned_long;
      c_end : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:112
   pragma Import (CPP, uprobe_munmap, "_Z13uprobe_munmapP14vm_area_structmm");

   procedure uprobe_start_dup_mmap;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:113
   pragma Import (CPP, uprobe_start_dup_mmap, "_Z21uprobe_start_dup_mmapv");

   procedure uprobe_end_dup_mmap;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:114
   pragma Import (CPP, uprobe_end_dup_mmap, "_Z19uprobe_end_dup_mmapv");

   procedure uprobe_dup_mmap (oldmm : access linux_mm_types_h.mm_struct; newmm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:115
   pragma Import (CPP, uprobe_dup_mmap, "_Z15uprobe_dup_mmapP9mm_structS0_");

   procedure uprobe_free_utask (t : access linux_sched_h.task_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:116
   pragma Import (CPP, uprobe_free_utask, "_Z17uprobe_free_utaskP11task_struct");

   procedure uprobe_copy_process (t : access linux_sched_h.task_struct; flags : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:117
   pragma Import (CPP, uprobe_copy_process, "_Z19uprobe_copy_processP11task_structm");

   function uprobe_post_sstep_notifier (regs : access asm_ptrace_h.pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:118
   pragma Import (CPP, uprobe_post_sstep_notifier, "_Z26uprobe_post_sstep_notifierP7pt_regs");

   function uprobe_pre_sstep_notifier (regs : access asm_ptrace_h.pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:119
   pragma Import (CPP, uprobe_pre_sstep_notifier, "_Z25uprobe_pre_sstep_notifierP7pt_regs");

   procedure uprobe_notify_resume (regs : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:120
   pragma Import (CPP, uprobe_notify_resume, "_Z20uprobe_notify_resumeP7pt_regs");

   function uprobe_deny_signal return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:121
   pragma Import (CPP, uprobe_deny_signal, "_Z18uprobe_deny_signalv");

   function arch_uprobe_skip_sstep (aup : access asm_uprobes_h.arch_uprobe; regs : access asm_ptrace_h.pt_regs) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:122
   pragma Import (CPP, arch_uprobe_skip_sstep, "_Z22arch_uprobe_skip_sstepP11arch_uprobeP7pt_regs");

   procedure uprobe_clear_state (mm : access linux_mm_types_h.mm_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:123
   pragma Import (CPP, uprobe_clear_state, "_Z18uprobe_clear_stateP9mm_struct");

   function arch_uprobe_analyze_insn
     (aup : access asm_uprobes_h.arch_uprobe;
      mm : access linux_mm_types_h.mm_struct;
      addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:124
   pragma Import (CPP, arch_uprobe_analyze_insn, "_Z24arch_uprobe_analyze_insnP11arch_uprobeP9mm_structm");

   function arch_uprobe_pre_xol (aup : access asm_uprobes_h.arch_uprobe; regs : access asm_ptrace_h.pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:125
   pragma Import (CPP, arch_uprobe_pre_xol, "_Z19arch_uprobe_pre_xolP11arch_uprobeP7pt_regs");

   function arch_uprobe_post_xol (aup : access asm_uprobes_h.arch_uprobe; regs : access asm_ptrace_h.pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:126
   pragma Import (CPP, arch_uprobe_post_xol, "_Z20arch_uprobe_post_xolP11arch_uprobeP7pt_regs");

   function arch_uprobe_xol_was_trapped (tsk : access linux_sched_h.task_struct) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:127
   pragma Import (CPP, arch_uprobe_xol_was_trapped, "_Z27arch_uprobe_xol_was_trappedP11task_struct");

   function arch_uprobe_exception_notify
     (self : access linux_notifier_h.notifier_block;
      val : unsigned_long;
      data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:128
   pragma Import (CPP, arch_uprobe_exception_notify, "_Z28arch_uprobe_exception_notifyP14notifier_blockmPv");

   procedure arch_uprobe_abort_xol (aup : access asm_uprobes_h.arch_uprobe; regs : access asm_ptrace_h.pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:129
   pragma Import (CPP, arch_uprobe_abort_xol, "_Z21arch_uprobe_abort_xolP11arch_uprobeP7pt_regs");

   function arch_uretprobe_hijack_return_addr (trampoline_vaddr : unsigned_long; regs : access asm_ptrace_h.pt_regs) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:130
   pragma Import (CPP, arch_uretprobe_hijack_return_addr, "_Z33arch_uretprobe_hijack_return_addrmP7pt_regs");

   function arch_uprobe_ignore (aup : access asm_uprobes_h.arch_uprobe; regs : access asm_ptrace_h.pt_regs) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:131
   pragma Import (CPP, arch_uprobe_ignore, "_Z18arch_uprobe_ignoreP11arch_uprobeP7pt_regs");

   procedure arch_uprobe_copy_ixol
     (the_page : access linux_mm_types_h.page;
      vaddr : unsigned_long;
      src : System.Address;
      len : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/uprobes.h:132
   pragma Import (CPP, arch_uprobe_copy_ixol, "_Z21arch_uprobe_copy_ixolP4pagemPvm");

end linux_uprobes_h;

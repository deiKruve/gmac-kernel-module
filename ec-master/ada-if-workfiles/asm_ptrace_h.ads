pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_sched_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with System;

package asm_ptrace_h is

   --  unsupported macro: profile_pc profile_pc
   --  arg-macro: procedure current_user_stack_pointer this_cpu_read(old_rsp)
   --    this_cpu_read(old_rsp)
   --  arg-macro: function compat_user_stack_pointer (test_thread_flag(TIF_IA32) ? current_pt_regs().sp : this_cpu_read(old_rsp)
   --    return test_thread_flag(TIF_IA32) ? current_pt_regs().sp : this_cpu_read(old_rsp);
   --  arg-macro: function GET_IP ((regs).ip
   --    return (regs).ip;
   --  arg-macro: function GET_FP ((regs).bp
   --    return (regs).bp;
   --  arg-macro: function GET_USP ((regs).sp
   --    return (regs).sp;
   --  unsupported macro: MAX_REG_OFFSET (offsetof(struct pt_regs, ss))
   --  arg-macro: function arch_has_single_step (1
   --    return 1;
   --  arg-macro: function arch_has_block_step (1
   --    return 1;
   --  arg-macro: function arch_ptrace_stop_needed ({ set_thread_flag(TIF_NOTIFY_RESUME); false; }
   --    return { set_thread_flag(TIF_NOTIFY_RESUME); false; };
   type pt_regs is record
      r15 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:34
      r14 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:35
      r13 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:36
      r12 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:37
      bp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:38
      bx : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:39
      r11 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:41
      r10 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:42
      r9 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:43
      r8 : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:44
      ax : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:45
      cx : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:46
      dx : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:47
      si : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:48
      di : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:49
      orig_ax : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:50
      ip : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:53
      cs : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:54
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:55
      sp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:56
      ss : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:57
   end record;
   pragma Convention (C_Pass_By_Copy, pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:33

  -- arguments: non interrupts/non tracing syscalls only save up to here 
  -- end of arguments  
  -- cpu exception frame or undefined  
  -- top of stack page  
   function profile_pc (regs : access pt_regs) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:70
   pragma Import (CPP, profile_pc, "_Z10profile_pcP7pt_regs");

   function convert_ip_to_linear (child : access linux_sched_h.task_struct; regs : access pt_regs) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:74
   pragma Import (CPP, convert_ip_to_linear, "_Z20convert_ip_to_linearP11task_structP7pt_regs");

   procedure send_sigtrap
     (tsk : access linux_sched_h.task_struct;
      regs : access pt_regs;
      error_code : int;
      si_code : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:75
   pragma Import (CPP, send_sigtrap, "_Z12send_sigtrapP11task_structP7pt_regsii");

   function syscall_trace_enter (arg1 : access pt_regs) return long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:78
   pragma Import (CPP, syscall_trace_enter, "_Z19syscall_trace_enterP7pt_regs");

   procedure syscall_trace_leave (arg1 : access pt_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:79
   pragma Import (CPP, syscall_trace_leave, "_Z19syscall_trace_leaveP7pt_regs");

   function regs_return_value (regs : access pt_regs) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:81
   pragma Import (CPP, regs_return_value, "_ZL17regs_return_valueP7pt_regs");

  -- * user_mode_vm(regs) determines whether a register set came from user mode.
  -- * This is true if V8086 mode was enabled OR if the register set was from
  -- * protected mode with RPL-3 CS value.  This tricky test checks that with
  -- * one comparison.  Many places in the kernel can bypass this full check
  -- * if they have already ruled out V8086 mode, so user_mode(regs) can be used.
  --  

   function user_mode (regs : access pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:93
   pragma Import (CPP, user_mode, "_ZL9user_modeP7pt_regs");

   function user_mode_vm (regs : access pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:102
   pragma Import (CPP, user_mode_vm, "_ZL12user_mode_vmP7pt_regs");

   function v8086_mode (regs : access pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:112
   pragma Import (CPP, v8086_mode, "_ZL10v8086_modeP7pt_regs");

  -- No V86 mode support in long mode  
   function user_64bit_mode (regs : access pt_regs) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:122
   pragma Import (CPP, user_64bit_mode, "_ZL15user_64bit_modeP7pt_regs");

  --	 * On non-paravirt systems, this is the only long mode CPL 3
  --	 * selector.  We do not allow long mode selectors in the LDT.
  --	  

  -- Headers are too twisted for this to go in paravirt.h.  
  -- ia32 vs. x32 difference  
   function kernel_stack_pointer (regs : access pt_regs) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:147
   pragma Import (CPP, kernel_stack_pointer, "_ZL20kernel_stack_pointerP7pt_regs");

  -- Query offset/name of register from its name/offset  
   function regs_query_register_offset (name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:160
   pragma Import (CPP, regs_query_register_offset, "_Z26regs_query_register_offsetPKc");

   function regs_query_register_name (offset : unsigned) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:161
   pragma Import (CPP, regs_query_register_name, "_Z24regs_query_register_namej");

  --*
  -- * regs_get_register() - get register value from its offset
  -- * @regs:	pt_regs from which register value is gotten.
  -- * @offset:	offset number of the register.
  -- *
  -- * regs_get_register returns the value of a register. The @offset is the
  -- * offset of the register in struct pt_regs address which specified by @regs.
  -- * If @offset is bigger than MAX_REG_OFFSET, this returns 0.
  --  

   function regs_get_register (regs : access pt_regs; offset : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:173
   pragma Import (CPP, regs_get_register, "_ZL17regs_get_registerP7pt_regsj");

  --	 * Traps from the kernel do not save sp and ss.
  --	 * Use the helper function to retrieve sp.
  --	  

  --*
  -- * regs_within_kernel_stack() - check the address in the stack
  -- * @regs:	pt_regs which contains kernel stack pointer.
  -- * @addr:	address which is checked.
  -- *
  -- * regs_within_kernel_stack() checks @addr is within the kernel stack page(s).
  -- * If @addr is within the kernel stack, it returns true. If not, returns false.
  --  

   function regs_within_kernel_stack (regs : access pt_regs; addr : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:198
   pragma Import (CPP, regs_within_kernel_stack, "_ZL24regs_within_kernel_stackP7pt_regsm");

  --*
  -- * regs_get_kernel_stack_nth() - get Nth entry of the stack
  -- * @regs:	pt_regs which contains kernel stack pointer.
  -- * @n:		stack entry number.
  -- *
  -- * regs_get_kernel_stack_nth() returns @n th entry of the kernel stack which
  -- * is specified by @regs. If the @n th entry is NOT in the kernel stack,
  -- * this returns 0.
  --  

   function regs_get_kernel_stack_nth (regs : access pt_regs; n : unsigned) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:214
   pragma Import (CPP, regs_get_kernel_stack_nth, "_ZL25regs_get_kernel_stack_nthP7pt_regsj");

  -- * When hitting ptrace_stop(), we cannot return using SYSRET because
  -- * that does not restore the full CPU state, only a minimal set.  The
  -- * ptracer can change arbitrary register values, which is usually okay
  -- * because the usual ptrace stops run off the signal delivery path which
  -- * forces IRET; however, ptrace_event() stops happen in arbitrary places
  -- * in the kernel and don't force IRET path.
  -- *
  -- * So force IRET path after a ptrace stop.
  --  

   --  skipped empty struct user_desc

   function do_get_thread_area
     (p : access linux_sched_h.task_struct;
      idx : int;
      info : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:251
   pragma Import (CPP, do_get_thread_area, "_Z18do_get_thread_areaP11task_structiP9user_desc");

   function do_set_thread_area
     (p : access linux_sched_h.task_struct;
      idx : int;
      info : System.Address;
      can_allocate : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/ptrace.h:253
   pragma Import (CPP, do_set_thread_area, "_Z18do_set_thread_areaP11task_structiP9user_desci");

end asm_ptrace_h;

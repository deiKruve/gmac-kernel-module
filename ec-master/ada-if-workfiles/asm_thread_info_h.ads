pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with linux_personality_h;
with uapi_asm_generic_int_ll64_h;
with asm_processor_h;
with linux_thread_info_h;
with Interfaces.C.Extensions;

package asm_thread_info_h is

   --  arg-macro: procedure INIT_THREAD_INFO { .task := andtsk, .exec_domain := anddefault_exec_domain, .flags := 0, .cpu := 0, .saved_preempt_count := INIT_PREEMPT_COUNT, .addr_limit := KERNEL_DS, .restart_block := { .fn := do_no_restart_syscall, }, }
   --    { .task := andtsk, .exec_domain := anddefault_exec_domain, .flags := 0, .cpu := 0, .saved_preempt_count := INIT_PREEMPT_COUNT, .addr_limit := KERNEL_DS, .restart_block := { .fn := do_no_restart_syscall, }, }
   --  unsupported macro: init_thread_info (init_thread_union.thread_info)
   --  unsupported macro: init_stack (init_thread_union.stack)
   --  unsupported macro: TIF_SYSCALL_TRACE 0
   --  unsupported macro: TIF_NOTIFY_RESUME 1
   --  unsupported macro: TIF_SIGPENDING 2
   --  unsupported macro: TIF_NEED_RESCHED 3
   --  unsupported macro: TIF_SINGLESTEP 4
   --  unsupported macro: TIF_SYSCALL_EMU 6
   --  unsupported macro: TIF_SYSCALL_AUDIT 7
   --  unsupported macro: TIF_SECCOMP 8
   --  unsupported macro: TIF_MCE_NOTIFY 10
   --  unsupported macro: TIF_USER_RETURN_NOTIFY 11
   --  unsupported macro: TIF_UPROBE 12
   --  unsupported macro: TIF_NOTSC 16
   --  unsupported macro: TIF_IA32 17
   --  unsupported macro: TIF_FORK 18
   --  unsupported macro: TIF_NOHZ 19
   --  unsupported macro: TIF_MEMDIE 20
   --  unsupported macro: TIF_POLLING_NRFLAG 21
   --  unsupported macro: TIF_IO_BITMAP 22
   --  unsupported macro: TIF_FORCED_TF 24
   --  unsupported macro: TIF_BLOCKSTEP 25
   --  unsupported macro: TIF_LAZY_MMU_UPDATES 27
   --  unsupported macro: TIF_SYSCALL_TRACEPOINT 28
   --  unsupported macro: TIF_ADDR32 29
   --  unsupported macro: TIF_X32 30
   --  unsupported macro: STACK_WARN (THREAD_SIZE/8)
   --  unsupported macro: KERNEL_STACK_OFFSET (5*(BITS_PER_LONG/8))
   --  unsupported macro: TS_COMPAT 0x0002
   --  unsupported macro: TS_RESTORE_SIGMASK 0x0008
   --  unsupported macro: HAVE_SET_RESTORE_SIGMASK 1
  -- thread_info.h: low-level thread information
  -- *
  -- * Copyright (C) 2002  David Howells (dhowells@redhat.com)
  -- * - Incorporating suggestions made by Linus Torvalds and Dave Miller
  --  

  -- * low level task data that entry.S needs immediate access to
  -- * - this struct should fit entirely inside of one cache line
  -- * - this struct shares the supervisor stack pages
  --  

  -- main task structure  
   type thread_info is record
      c_task : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:27
      the_exec_domain : access linux_personality_h.exec_domain;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:28
      flags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:29
      status : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:30
      cpu : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:31
      saved_preempt_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:32
      addr_limit : aliased asm_processor_h.mm_segment_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:33
      the_restart_block : aliased linux_thread_info_h.restart_block;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:34
      sysenter_return : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:35
      sig_on_uaccess_error : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:36
      uaccess_err : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, thread_info);
   pragma Pack (thread_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:26

  -- execution domain  
  -- low level flags  
  -- thread synchronous flags  
  -- current CPU  
  -- uaccess failed  
  -- * thread information flags
  -- * - these are process state flags that various assembly files
  -- *   may need to access
  -- * - pending work-to-be-done flags are in LSW
  -- * - other flags in MSW
  -- * Warning: layout of LSW is hardcoded in entry.S
  --  

  -- work to do in syscall_trace_enter()  
  -- work to do in syscall_trace_leave()  
  -- work to do on interrupt/exception return  
  -- work to do on any return to user space  
  -- Only used for 64 bit  
  -- flags to check in __switch_to()  
  -- * macros/functions for gaining access to the thread information structure
  -- *
  -- * preempt_count needs to be 1 initially, until the scheduler is functional.
  --  

   kernel_stack : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:163
   pragma Import (C, kernel_stack, "kernel_stack");

   function current_thread_info return access thread_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:165
   pragma Import (CPP, current_thread_info, "_ZL19current_thread_infov");

  -- how to get the thread information struct from ASM  
  -- * Same if PER_CPU_VAR(kernel_stack) is, perhaps with some offset, already in
  -- * a certain register (to be used in assembler memory operands).
  --  

  -- * Thread-synchronous status.
  -- *
  -- * This is different from the flags in that nobody else
  -- * ever touches our thread-synchronous status, so we don't
  -- * have to worry about atomic accesses.
  --  

   procedure set_restore_sigmask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:200
   pragma Import (CPP, set_restore_sigmask, "_ZL19set_restore_sigmaskv");

   procedure clear_restore_sigmask;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:206
   pragma Import (CPP, clear_restore_sigmask, "_ZL21clear_restore_sigmaskv");

   function test_restore_sigmask return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:210
   pragma Import (CPP, test_restore_sigmask, "_ZL20test_restore_sigmaskv");

   function test_and_clear_restore_sigmask return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:214
   pragma Import (CPP, test_and_clear_restore_sigmask, "_ZL30test_and_clear_restore_sigmaskv");

   function is_ia32_task return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:223
   pragma Import (CPP, is_ia32_task, "_ZL12is_ia32_taskv");

   procedure arch_task_cache_init;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:237
   pragma Import (CPP, arch_task_cache_init, "_Z20arch_task_cache_initv");

   function arch_dup_task_struct (dst : System.Address; src : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:238
   pragma Import (CPP, arch_dup_task_struct, "_Z20arch_dup_task_structP11task_structS0_");

   procedure arch_release_task_struct (tsk : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/thread_info.h:239
   pragma Import (CPP, arch_release_task_struct, "_Z24arch_release_task_structP11task_struct");

end asm_thread_info_h;

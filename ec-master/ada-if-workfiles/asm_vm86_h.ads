pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_ptrace_h;
with uapi_asm_vm86_h;

package asm_vm86_h is

   --  unsupported macro: VM86_TSS_ESP0 flags
  -- * This is the (kernel) stack-layout when we have done a "SAVE_ALL" from vm86
  -- * mode - the main change is that the old segment descriptors aren't
  -- * useful any more and are forced to be zero by the kernel (and the
  -- * hardware when a trap occurs), and the real segment descriptors are
  -- * at the end of the structure. Look at ptrace.h to see the "normal"
  -- * setup. For user space layout see 'struct vm86_regs' above.
  --  

  -- * normal regs, with special meaning for the segment descriptors..
  --  

   type kernel_vm86_regs is record
      pt : aliased asm_ptrace_h.pt_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:21
      es : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:25
      uu_esh : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:25
      ds : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:26
      uu_dsh : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:26
      fs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:27
      uu_fsh : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:27
      gs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:28
      uu_gsh : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, kernel_vm86_regs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:17

  -- * these are specific to v86 mode:
  --  

   type kernel_vm86_struct is record
      regs : aliased kernel_vm86_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:32
      flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:42
      screen_bitmap : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:43
      cpu_type : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:44
      int_revectored : aliased uapi_asm_vm86_h.revectored_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:45
      int21_revectored : aliased uapi_asm_vm86_h.revectored_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:46
      vm86plus : aliased uapi_asm_vm86_h.vm86plus_info_struct;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:47
      regs32 : access asm_ptrace_h.pt_regs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:48
   end record;
   pragma Convention (C_Pass_By_Copy, kernel_vm86_struct);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:31

  -- * the below part remains on the kernel stack while we are in VM86 mode.
  -- * 'tss.esp0' then contains the address of VM86_TSS_ESP0 below, and when we
  -- * get forced back from VM86, the CPU and "SAVE_ALL" will restore the above
  -- * 'struct kernel_vm86_regs' with the then actual values.
  -- * Therefore, pt_regs in fact points to a complete 'kernel_vm86_struct'
  -- * in kernelspace, hence we need not reget the data from userspace.
  --  

  -- here we save the pointer to the old regs  
  -- * The below is not part of the structure, but the stack layout continues
  -- * this way. In front of 'return-eip' may be some data, depending on
  -- * compilation, so we don't rely on this and save the pointer to 'oldregs'
  -- * in 'regs32' above.
  -- * However, with GCC-2.7.2 and the current CFLAGS you see exactly this:
  --	long return-eip;        from call to vm86()
  --	struct pt_regs oldregs;  user space registers as saved by syscall
  --  

   function handle_vm86_trap
     (a : access kernel_vm86_regs;
      b : long;
      c : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/vm86.h:75
   pragma Import (CPP, handle_vm86_trap, "_ZL16handle_vm86_trapP16kernel_vm86_regsli");

end asm_vm86_h;

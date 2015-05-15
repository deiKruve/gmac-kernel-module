pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with Interfaces.C.Extensions;
limited with linux_cpumask_h;

package asm_msr_h is

   --  arg-macro: procedure DECLARE_ARGS unsigned low, high
   --    unsigned low, high
   --  arg-macro: function EAX_EDX_VAL ((low) or ((u64)(high) << 32)
   --    return (low) or ((u64)(high) << 32);
   --  arg-macro: procedure EAX_EDX_ARGS "a" (low), "d" (high)
   --    "a" (low), "d" (high)
   --  arg-macro: procedure EAX_EDX_RET "=a" (low), "=d" (high)
   --    "=a" (low), "=d" (high)
   --  arg-macro: procedure wrmsrl_safe wrmsr_safe((msr), (u32)(val), (u32)((val) >> 32))
   --    wrmsr_safe((msr), (u32)(val), (u32)((val) >> 32))
   --  arg-macro: procedure write_tsc wrmsr(MSR_IA32_TSC, (low), (high))
   --    wrmsr(MSR_IA32_TSC, (low), (high))
   --  arg-macro: procedure write_rdtscp_aux wrmsr(MSR_TSC_AUX, (val), 0)
   --    wrmsr(MSR_TSC_AUX, (val), 0)
   type anon_23;
   type anon_24 is record
      l : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:15
      h : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:16
   end record;
   pragma Convention (C_Pass_By_Copy, anon_24);
   type anon_23 (discr : unsigned := 0) is record
      case discr is
            parent : aliased anon_24;
         when others =>
            q : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:18
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_23);
   pragma Unchecked_Union (anon_23);
   type msr is record
      parent : aliased anon_23;
   end record;
   pragma Convention (C_Pass_By_Copy, msr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:12

   type msr_info is record
      msr_no : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:23
      reg : aliased msr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:24
      msrs : access msr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:25
      err : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, msr_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:22

   type msr_regs_info is record
      regs : access asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:30
      err : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, msr_regs_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:29

   function native_read_tscp (aux : access unsigned) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:34
   pragma Import (CPP, native_read_tscp, "_ZL16native_read_tscpPj");

  -- * both i386 and x86_64 returns 64-bit value in edx:eax, but gcc's "A"
  -- * constraint has different meanings. For i386, "A" means exactly
  -- * edx:eax, while for x86_64 it doesn't mean rdx:rax or edx:eax. Instead,
  -- * it means rax *or* rdx.
  --  

   function native_read_msr (msr : unsigned) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:60
   pragma Import (CPP, native_read_msr, "_ZL15native_read_msrj");

   function native_read_msr_safe (msr : unsigned; err : access int) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:68
   pragma Import (CPP, native_read_msr_safe, "_ZL20native_read_msr_safejPi");

   procedure native_write_msr
     (msr : unsigned;
      low : unsigned;
      high : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:84
   pragma Import (CPP, native_write_msr, "_ZL16native_write_msrjjj");

  -- Can be uninlined because referenced by paravirt  
   function native_write_msr_safe
     (msr : unsigned;
      low : unsigned;
      high : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:91
   pragma Import (CPP, native_write_msr_safe, "_ZL21native_write_msr_safejjj");

   function native_read_tsc return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:108
   pragma Import (CPP, native_read_tsc, "_Z15native_read_tscv");

   function rdmsr_safe_regs (regs : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:110
   pragma Import (CPP, rdmsr_safe_regs, "_Z15rdmsr_safe_regsPj");

   function wrmsr_safe_regs (regs : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:111
   pragma Import (CPP, wrmsr_safe_regs, "_Z15wrmsr_safe_regsPj");

   --  skipped func __native_read_tsc

   function native_read_pmc (counter : int) return Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:122
   pragma Import (CPP, native_read_pmc, "_ZL15native_read_pmci");

  -- * Access to machine-specific registers (available on 586 and better only)
  -- * Note: the rd* operations modify the parameters directly (without using
  -- * pointer indirection), this allows gcc to optimize better
  --  

  -- wrmsr with exception handling  
  -- rdmsr with exception handling  
   function msrs_alloc return access msr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:215
   pragma Import (CPP, msrs_alloc, "_Z10msrs_allocv");

   procedure msrs_free (msrs : access msr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:216
   pragma Import (CPP, msrs_free, "_Z9msrs_freeP3msr");

   function msr_set_bit (msr : asm_generic_int_ll64_h.u32; bit : asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:217
   pragma Import (CPP, msr_set_bit, "_Z11msr_set_bitjh");

   function msr_clear_bit (msr : asm_generic_int_ll64_h.u32; bit : asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:218
   pragma Import (CPP, msr_clear_bit, "_Z13msr_clear_bitjh");

   function rdmsr_on_cpu
     (cpu : unsigned;
      msr_no : asm_generic_int_ll64_h.u32;
      l : access asm_generic_int_ll64_h.u32;
      h : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:221
   pragma Import (CPP, rdmsr_on_cpu, "_Z12rdmsr_on_cpujjPjS_");

   function wrmsr_on_cpu
     (cpu : unsigned;
      msr_no : asm_generic_int_ll64_h.u32;
      l : asm_generic_int_ll64_h.u32;
      h : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:222
   pragma Import (CPP, wrmsr_on_cpu, "_Z12wrmsr_on_cpujjjj");

   function rdmsrl_on_cpu
     (cpu : unsigned;
      msr_no : asm_generic_int_ll64_h.u32;
      q : access asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:223
   pragma Import (CPP, rdmsrl_on_cpu, "_Z13rdmsrl_on_cpujjPy");

   function wrmsrl_on_cpu
     (cpu : unsigned;
      msr_no : asm_generic_int_ll64_h.u32;
      q : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:224
   pragma Import (CPP, wrmsrl_on_cpu, "_Z13wrmsrl_on_cpujjy");

   procedure rdmsr_on_cpus
     (mask : access constant linux_cpumask_h.cpumask;
      msr_no : asm_generic_int_ll64_h.u32;
      msrs : access msr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:225
   pragma Import (CPP, rdmsr_on_cpus, "_Z13rdmsr_on_cpusPK7cpumaskjP3msr");

   procedure wrmsr_on_cpus
     (mask : access constant linux_cpumask_h.cpumask;
      msr_no : asm_generic_int_ll64_h.u32;
      msrs : access msr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:226
   pragma Import (CPP, wrmsr_on_cpus, "_Z13wrmsr_on_cpusPK7cpumaskjP3msr");

   function rdmsr_safe_on_cpu
     (cpu : unsigned;
      msr_no : asm_generic_int_ll64_h.u32;
      l : access asm_generic_int_ll64_h.u32;
      h : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:227
   pragma Import (CPP, rdmsr_safe_on_cpu, "_Z17rdmsr_safe_on_cpujjPjS_");

   function wrmsr_safe_on_cpu
     (cpu : unsigned;
      msr_no : asm_generic_int_ll64_h.u32;
      l : asm_generic_int_ll64_h.u32;
      h : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:228
   pragma Import (CPP, wrmsr_safe_on_cpu, "_Z17wrmsr_safe_on_cpujjjj");

   function rdmsrl_safe_on_cpu
     (cpu : unsigned;
      msr_no : asm_generic_int_ll64_h.u32;
      q : access asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:229
   pragma Import (CPP, rdmsrl_safe_on_cpu, "_Z18rdmsrl_safe_on_cpujjPy");

   function wrmsrl_safe_on_cpu
     (cpu : unsigned;
      msr_no : asm_generic_int_ll64_h.u32;
      q : asm_generic_int_ll64_h.u64) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:230
   pragma Import (CPP, wrmsrl_safe_on_cpu, "_Z18wrmsrl_safe_on_cpujjy");

   function rdmsr_safe_regs_on_cpu (cpu : unsigned; regs : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:231
   pragma Import (CPP, rdmsr_safe_regs_on_cpu, "_Z22rdmsr_safe_regs_on_cpujPj");

   function wrmsr_safe_regs_on_cpu (cpu : unsigned; regs : access asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/msr.h:232
   pragma Import (CPP, wrmsr_safe_regs_on_cpu, "_Z22wrmsr_safe_regs_on_cpujPj");

end asm_msr_h;

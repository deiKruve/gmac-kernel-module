pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with linux_mutex_h;

package asm_mmu_h is

  -- * The x86 doesn't have a mmu context, but
  -- * we put the segment information here.
  --  

   type mm_context_t is record
      ldt : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mmu.h:12
      size : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mmu.h:13
      ia32_compat : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mmu.h:17
      lock : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mmu.h:20
      vdso : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mmu.h:21
   end record;
   pragma Convention (C_Pass_By_Copy, mm_context_t);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mmu.h:22

   --  skipped anonymous struct anon_114

  -- True if mm supports a task running in 32 bit compatibility mode.  
   procedure leave_mm (cpu : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mmu.h:25
   pragma Import (CPP, leave_mm, "_Z8leave_mmi");

end asm_mmu_h;

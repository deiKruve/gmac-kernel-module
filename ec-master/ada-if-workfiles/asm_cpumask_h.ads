pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_cpumask_h;

package asm_cpumask_h is

   cpu_callin_mask : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/cpumask.h:6
   pragma Import (C, cpu_callin_mask, "cpu_callin_mask");

   cpu_callout_mask : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/cpumask.h:7
   pragma Import (C, cpu_callout_mask, "cpu_callout_mask");

   cpu_initialized_mask : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/cpumask.h:8
   pragma Import (C, cpu_initialized_mask, "cpu_initialized_mask");

   cpu_sibling_setup_mask : aliased linux_cpumask_h.cpumask_var_t;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/cpumask.h:9
   pragma Import (C, cpu_sibling_setup_mask, "cpu_sibling_setup_mask");

   procedure setup_cpu_local_masks;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/cpumask.h:11
   pragma Import (CPP, setup_cpu_local_masks, "_Z21setup_cpu_local_masksv");

end asm_cpumask_h;

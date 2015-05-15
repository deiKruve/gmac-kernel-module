pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_mpspec_def_h;
with Interfaces.C.Strings;
limited with asm_processor_h;
limited with uapi_linux_time_h;
with asm_generic_int_ll64_h;
with Interfaces.C.Extensions;
with System;
limited with linux_irq_h;
limited with linux_cpumask_h;
limited with asm_io_apic_h;
limited with asm_hw_irq_h;

package asm_x86_init_h is

  --*
  -- * struct x86_init_mpparse - platform specific mpparse ops
  -- * @mpc_record:			platform specific mpc record accounting
  -- * @setup_ioapic_ids:		platform specific ioapic id override
  -- * @mpc_apic_id:		platform specific mpc apic id assignment
  -- * @smp_read_mpc_oem:		platform specific oem mpc table setup
  -- * @mpc_oem_pci_bus:		platform specific pci bus setup (default NULL)
  -- * @mpc_oem_bus_info:		platform specific mpc bus info
  -- * @find_smp_config:		find the smp configuration
  -- * @get_smp_config:		get the smp configuration
  --  

   type x86_init_mpparse is record
      mpc_record : access procedure (arg1 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:24
      setup_ioapic_ids : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:25
      mpc_apic_id : access function (arg1 : access asm_mpspec_def_h.mpc_cpu) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:26
      smp_read_mpc_oem : access procedure (arg1 : access asm_mpspec_def_h.mpc_table);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:27
      mpc_oem_pci_bus : access procedure (arg1 : access asm_mpspec_def_h.mpc_bus);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:28
      mpc_oem_bus_info : access procedure (arg1 : access asm_mpspec_def_h.mpc_bus; arg2 : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:29
      find_smp_config : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:30
      get_smp_config : access procedure (arg1 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, x86_init_mpparse);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:23

  --*
  -- * struct x86_init_resources - platform specific resource related ops
  -- * @probe_roms:			probe BIOS roms
  -- * @reserve_resources:		reserve the standard resources for the
  -- *				platform
  -- * @memory_setup:		platform specific memory setup
  -- *
  --  

   type x86_init_resources is record
      probe_roms : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:43
      reserve_resources : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:44
      memory_setup : access function return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:45
   end record;
   pragma Convention (C_Pass_By_Copy, x86_init_resources);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:42

  --*
  -- * struct x86_init_irqs - platform specific interrupt setup
  -- * @pre_vector_init:		init code to run before interrupt vectors
  -- *				are set up.
  -- * @intr_init:			interrupt init code
  -- * @trap_init:			platform specific trap setup
  --  

   type x86_init_irqs is record
      pre_vector_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:56
      intr_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:57
      trap_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:58
   end record;
   pragma Convention (C_Pass_By_Copy, x86_init_irqs);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:55

  --*
  -- * struct x86_init_oem - oem platform specific customizing functions
  -- * @arch_setup:			platform specific architecure setup
  -- * @banner:			print a platform specific banner
  --  

   type x86_init_oem is record
      arch_setup : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:67
      banner : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:68
   end record;
   pragma Convention (C_Pass_By_Copy, x86_init_oem);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:66

  --*
  -- * struct x86_init_paging - platform specific paging functions
  -- * @pagetable_init:	platform specific paging initialization call to setup
  -- *			the kernel pagetables and prepare accessors functions.
  -- *			Callback must call paging_init(). Called once after the
  -- *			direct mapping for phys memory is available.
  --  

   type x86_init_paging is record
      pagetable_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:79
   end record;
   pragma Convention (C_Pass_By_Copy, x86_init_paging);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:78

  --*
  -- * struct x86_init_timers - platform specific timer setup
  -- * @setup_perpcu_clockev:	set up the per cpu clock event device for the
  -- *				boot cpu
  -- * @tsc_pre_init:		platform function called before TSC init
  -- * @timer_init:			initialize the platform timer (default PIT/HPET)
  -- * @wallclock_init:		init the wallclock device
  --  

   type x86_init_timers is record
      setup_percpu_clockev : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:91
      tsc_pre_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:92
      timer_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:93
      wallclock_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:94
   end record;
   pragma Convention (C_Pass_By_Copy, x86_init_timers);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:90

  --*
  -- * struct x86_init_iommu - platform specific iommu setup
  -- * @iommu_init:			platform specific iommu setup
  --  

   type x86_init_iommu is record
      iommu_init : access function return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:102
   end record;
   pragma Convention (C_Pass_By_Copy, x86_init_iommu);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:101

  --*
  -- * struct x86_init_pci - platform specific pci init functions
  -- * @arch_init:			platform specific pci arch init call
  -- * @init:			platform specific pci subsystem init
  -- * @init_irq:			platform specific pci irq init
  -- * @fixup_irqs:			platform specific pci irq fixup
  --  

   type x86_init_pci is record
      arch_init : access function return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:113
      init : access function return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:114
      init_irq : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:115
      fixup_irqs : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:116
   end record;
   pragma Convention (C_Pass_By_Copy, x86_init_pci);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:112

  --*
  -- * struct x86_init_ops - functions for platform specific setup
  -- *
  --  

   type x86_init_ops is record
      resources : aliased x86_init_resources;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:124
      mpparse : aliased x86_init_mpparse;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:125
      irqs : aliased x86_init_irqs;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:126
      oem : aliased x86_init_oem;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:127
      paging : aliased x86_init_paging;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:128
      timers : aliased x86_init_timers;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:129
      iommu : aliased x86_init_iommu;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:130
      pci : aliased x86_init_pci;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:131
   end record;
   pragma Convention (C_Pass_By_Copy, x86_init_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:123

  --*
  -- * struct x86_cpuinit_ops - platform specific cpu hotplug setups
  -- * @setup_percpu_clockev:	set up the per cpu clock event device
  -- * @early_percpu_clock_init:	early init of the per cpu clock event device
  --  

   type x86_cpuinit_ops is record
      setup_percpu_clockev : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:140
      early_percpu_clock_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:141
      fixup_cpu_id : access procedure (arg1 : access asm_processor_h.cpuinfo_x86; arg2 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:142
   end record;
   pragma Convention (C_Pass_By_Copy, x86_cpuinit_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:139

  --*
  -- * struct x86_platform_ops - platform specific runtime functions
  -- * @calibrate_tsc:		calibrate TSC
  -- * @get_wallclock:		get time from HW clock like RTC etc.
  -- * @set_wallclock:		set time back to HW clock
  -- * @is_untracked_pat_range	exclude from PAT logic
  -- * @nmi_init			enable NMI on cpus
  -- * @i8042_detect		pre-detect if i8042 controller exists
  -- * @save_sched_clock_state:	save state for sched_clock() on suspend
  -- * @restore_sched_clock_state:	restore state for sched_clock() on resume
  -- * @apic_post_init:		adjust apic if neeeded
  --  

   type x86_platform_ops is record
      calibrate_tsc : access function return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:160
      get_wallclock : access procedure (arg1 : access uapi_linux_time_h.timespec);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:161
      set_wallclock : access function (arg1 : access constant uapi_linux_time_h.timespec) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:162
      iommu_shutdown : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:163
      is_untracked_pat_range : access function (arg1 : asm_generic_int_ll64_h.u64; arg2 : asm_generic_int_ll64_h.u64) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:164
      nmi_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:165
      get_nmi_reason : access function return unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:166
      i8042_detect : access function return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:167
      save_sched_clock_state : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:168
      restore_sched_clock_state : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:169
      apic_post_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:170
   end record;
   pragma Convention (C_Pass_By_Copy, x86_platform_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:159

   --  skipped empty struct pci_dev

   --  skipped empty struct msi_msg

   --  skipped empty struct msi_desc

   type x86_msi_ops is record
      setup_msi_irqs : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:178
      compose_msi_msg : access procedure
           (arg1 : System.Address;
            arg2 : unsigned;
            arg3 : unsigned;
            arg4 : System.Address;
            arg5 : asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:181
      teardown_msi_irq : access procedure (arg1 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:182
      teardown_msi_irqs : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:183
      restore_msi_irqs : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:184
      setup_hpet_msi : access function (arg1 : unsigned; arg2 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:185
      msi_mask_irq : access function
           (arg1 : System.Address;
            arg2 : asm_generic_int_ll64_h.u32;
            arg3 : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:186
      msix_mask_irq : access function (arg1 : System.Address; arg2 : asm_generic_int_ll64_h.u32) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:187
   end record;
   pragma Convention (C_Pass_By_Copy, x86_msi_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:177

   type x86_io_apic_ops is record
      init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:196
      read : access function (arg1 : unsigned; arg2 : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:197
      write : access procedure
           (arg1 : unsigned;
            arg2 : unsigned;
            arg3 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:198
      modify : access procedure
           (arg1 : unsigned;
            arg2 : unsigned;
            arg3 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:199
      disable : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:200
      print_entries : access procedure (arg1 : unsigned; arg2 : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:201
      set_affinity : access function
           (arg1 : access linux_irq_h.irq_data;
            arg2 : access constant linux_cpumask_h.cpumask;
            arg3 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:204
      setup_entry : access function
           (arg1 : int;
            arg2 : access asm_io_apic_h.IO_APIC_route_entry;
            arg3 : unsigned;
            arg4 : int;
            arg5 : access asm_hw_irq_h.io_apic_irq_attr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:207
      eoi_ioapic_pin : access procedure
           (arg1 : int;
            arg2 : int;
            arg3 : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:208
   end record;
   pragma Convention (C_Pass_By_Copy, x86_io_apic_ops);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:195

   x86_init : aliased x86_init_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:211
   pragma Import (C, x86_init, "x86_init");

   x86_cpuinit : aliased x86_cpuinit_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:212
   pragma Import (C, x86_cpuinit, "x86_cpuinit");

   x86_platform : aliased x86_platform_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:213
   pragma Import (C, x86_platform, "x86_platform");

   x86_msi : aliased x86_msi_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:214
   pragma Import (C, x86_msi, "x86_msi");

   x86_io_apic_ops : aliased x86_io_apic_ops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:215
   pragma Import (C, x86_io_apic_ops, "x86_io_apic_ops");

   procedure x86_init_noop;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:216
   pragma Import (CPP, x86_init_noop, "_Z13x86_init_noopv");

   procedure x86_init_uint_noop (unused : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/x86_init.h:217
   pragma Import (CPP, x86_init_uint_noop, "_Z18x86_init_uint_noopj");

end asm_x86_init_h;

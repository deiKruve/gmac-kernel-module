pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with asm_generic_int_ll64_h;
with System;
with asm_mpspec_def_h;
limited with linux_device_h;
limited with asm_hw_irq_h;
limited with linux_irq_h;
limited with linux_cpumask_h;

package asm_io_apic_h is

   --  unsupported macro: IO_APIC_REDIR_VECTOR_MASK 0x000FF
   --  unsupported macro: IO_APIC_REDIR_DEST_LOGICAL 0x00800
   --  unsupported macro: IO_APIC_REDIR_DEST_PHYSICAL 0x00000
   --  unsupported macro: IO_APIC_REDIR_SEND_PENDING (1 << 12)
   --  unsupported macro: IO_APIC_REDIR_REMOTE_IRR (1 << 14)
   --  unsupported macro: IO_APIC_REDIR_LEVEL_TRIGGER (1 << 15)
   --  unsupported macro: IO_APIC_REDIR_MASKED (1 << 16)
   --  unsupported macro: IOAPIC_AUTO -1
   --  unsupported macro: IOAPIC_EDGE 0
   --  unsupported macro: IOAPIC_LEVEL 1
   --  unsupported macro: MP_MAX_IOAPIC_PIN 127
   --  unsupported macro: io_apic_assign_pci_irqs (mp_irq_entries && !skip_ioapic_setup && io_apic_irqs)
  -- * Intel IO-APIC support for SMP and UP systems.
  -- *
  -- * Copyright (C) 1997, 1998, 1999, 2000 Ingo Molnar
  --  

  -- I/O Unit Redirection Table  
  -- * The structure of the IO-APIC:
  --  

   type IO_APIC_reg_00;
   type anon_137 is record
      uu_reserved_2 : Extensions.Unsigned_14;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:30
      LTS : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:31
      delivery_type : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:32
      uu_reserved_1 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:33
      ID : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, anon_137);
   type IO_APIC_reg_00 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            raw : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:28
         when others =>
            bits : aliased anon_137;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:35
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, IO_APIC_reg_00);
   pragma Unchecked_Union (IO_APIC_reg_00);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:27

   type IO_APIC_reg_01;
   type anon_138 is record
      version : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:41
      uu_reserved_2 : Extensions.Unsigned_7;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:42
      PRQ : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:43
      entries : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:44
      uu_reserved_1 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:45
   end record;
   pragma Convention (C_Pass_By_Copy, anon_138);
   type IO_APIC_reg_01 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            raw : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:39
         when others =>
            bits : aliased anon_138;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:46
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, IO_APIC_reg_01);
   pragma Unchecked_Union (IO_APIC_reg_01);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:38

   type IO_APIC_reg_02;
   type anon_139 is record
      uu_reserved_2 : Extensions.Unsigned_24;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:52
      arbitration : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:53
      uu_reserved_1 : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:54
   end record;
   pragma Convention (C_Pass_By_Copy, anon_139);
   type IO_APIC_reg_02 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            raw : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:50
         when others =>
            bits : aliased anon_139;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:55
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, IO_APIC_reg_02);
   pragma Unchecked_Union (IO_APIC_reg_02);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:49

   type IO_APIC_reg_03;
   type anon_140 is record
      boot_DT : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:61
      uu_reserved_1 : Extensions.Unsigned_31;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:62
   end record;
   pragma Convention (C_Pass_By_Copy, anon_140);
   type IO_APIC_reg_03 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            raw : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:59
         when others =>
            bits : aliased anon_140;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:63
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, IO_APIC_reg_03);
   pragma Unchecked_Union (IO_APIC_reg_03);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:58

   type IO_APIC_route_entry is record
      vector : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:67
      delivery_mode : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:68
      dest_mode : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:72
      delivery_status : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:73
      polarity : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:74
      irr : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:75
      trigger : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:76
      mask : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:77
      uu_reserved_2 : Extensions.Unsigned_15;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:78
      uu_reserved_3 : Extensions.Unsigned_24;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:80
      dest : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:81
   end record;
   pragma Convention (C_Pass_By_Copy, IO_APIC_route_entry);
   pragma Pack (IO_APIC_route_entry);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:66

  -- 000: FIXED
  --					 * 001: lowest prio
  --					 * 111: ExtINT
  --					  

  -- 0: physical, 1: logical  
  -- 0: edge, 1: level  
  -- 0: enabled, 1: disabled  
   type IR_IO_APIC_route_entry is record
      vector : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:85
      zero : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:86
      index2 : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:87
      delivery_status : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:88
      polarity : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:89
      irr : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:90
      trigger : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:91
      mask : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:92
      reserved : Extensions.Unsigned_31;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:93
      format : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:94
      index : Extensions.Unsigned_15;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:95
   end record;
   pragma Convention (C_Pass_By_Copy, IR_IO_APIC_route_entry);
   pragma Pack (IR_IO_APIC_route_entry);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:84

  -- * # of IO-APICs and # of IRQ routing registers
  --  

   nr_ioapics : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:107
   pragma Import (C, nr_ioapics, "nr_ioapics");

   function mpc_ioapic_id (ioapic : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:109
   pragma Import (CPP, mpc_ioapic_id, "_Z13mpc_ioapic_idi");

   function mpc_ioapic_addr (ioapic : int) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:110
   pragma Import (CPP, mpc_ioapic_addr, "_Z15mpc_ioapic_addri");

   function mp_ioapic_gsi_routing (ioapic : int) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:111
   pragma Import (CPP, mp_ioapic_gsi_routing, "_Z21mp_ioapic_gsi_routingi");

  -- # of MP IRQ source entries  
   mp_irq_entries : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:116
   pragma Import (C, mp_irq_entries, "mp_irq_entries");

  -- MP IRQ source entries  
   mp_irqs : aliased array (0 .. 1023) of aliased asm_mpspec_def_h.mpc_intsrc;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:119
   pragma Import (C, mp_irqs, "mp_irqs");

  -- non-0 if default (table-less) MP configuration  
   mpc_default_type : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:122
   pragma Import (C, mpc_default_type, "mpc_default_type");

  -- Older SiS APIC requires we rewrite the index register  
   sis_apic_bug : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:125
   pragma Import (C, sis_apic_bug, "sis_apic_bug");

  -- 1 if "noapic" boot option passed  
   skip_ioapic_setup : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:128
   pragma Import (C, skip_ioapic_setup, "skip_ioapic_setup");

  -- 1 if "noapic" boot option passed  
   noioapicquirk : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:131
   pragma Import (C, noioapicquirk, "noioapicquirk");

  -- -1 if "noapic" boot option passed  
   noioapicreroute : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:134
   pragma Import (C, noioapicreroute, "noioapicreroute");

  -- 1 if the timer IRQ uses the '8259A Virtual Wire' mode  
   timer_through_8259 : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:137
   pragma Import (C, timer_through_8259, "timer_through_8259");

  -- * If we use the IO-APIC for IRQ routing, disable automatic
  -- * assignment of PCI IRQ's.
  --  

   function io_apic_set_pci_routing
     (dev : access linux_device_h.device;
      irq : int;
      irq_attr : access asm_hw_irq_h.io_apic_irq_attr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:148
   pragma Import (CPP, io_apic_set_pci_routing, "_Z23io_apic_set_pci_routingP6deviceiP16io_apic_irq_attr");

   procedure setup_IO_APIC_irq_extra (gsi : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:150
   pragma Import (CPP, setup_IO_APIC_irq_extra, "_Z23setup_IO_APIC_irq_extraj");

   procedure ioapic_insert_resources;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:151
   pragma Import (CPP, ioapic_insert_resources, "_Z23ioapic_insert_resourcesv");

   function native_setup_ioapic_entry
     (arg1 : int;
      arg2 : access IO_APIC_route_entry;
      arg3 : unsigned;
      arg4 : int;
      arg5 : access asm_hw_irq_h.io_apic_irq_attr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:156
   pragma Import (CPP, native_setup_ioapic_entry, "_Z25native_setup_ioapic_entryiP19IO_APIC_route_entryjiP16io_apic_irq_attr");

   procedure eoi_ioapic_irq (irq : unsigned; cfg : access asm_hw_irq_h.irq_cfg);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:159
   pragma Import (CPP, eoi_ioapic_irq, "_Z14eoi_ioapic_irqjP7irq_cfg");

   procedure native_compose_msi_msg
     (pdev : System.Address;
      irq : unsigned;
      dest : unsigned;
      msg : System.Address;
      hpet_id : asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:161
   pragma Import (CPP, native_compose_msi_msg, "_Z22native_compose_msi_msgP7pci_devjjP7msi_msgh");

   procedure native_eoi_ioapic_pin
     (apic : int;
      pin : int;
      vector : int);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:164
   pragma Import (CPP, native_eoi_ioapic_pin, "_Z21native_eoi_ioapic_piniii");

   function io_apic_setup_irq_pin_once
     (irq : unsigned;
      node : int;
      attr : access asm_hw_irq_h.io_apic_irq_attr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:165
   pragma Import (CPP, io_apic_setup_irq_pin_once, "_Z26io_apic_setup_irq_pin_oncejiP16io_apic_irq_attr");

   function save_ioapic_entries return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:167
   pragma Import (CPP, save_ioapic_entries, "_Z19save_ioapic_entriesv");

   procedure mask_ioapic_entries;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:168
   pragma Import (CPP, mask_ioapic_entries, "_Z19mask_ioapic_entriesv");

   function restore_ioapic_entries return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:169
   pragma Import (CPP, restore_ioapic_entries, "_Z22restore_ioapic_entriesv");

   procedure setup_ioapic_ids_from_mpc;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:171
   pragma Import (CPP, setup_ioapic_ids_from_mpc, "_Z25setup_ioapic_ids_from_mpcv");

   procedure setup_ioapic_ids_from_mpc_nocheck;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:172
   pragma Import (CPP, setup_ioapic_ids_from_mpc_nocheck, "_Z33setup_ioapic_ids_from_mpc_nocheckv");

   type mp_ioapic_gsi is record
      gsi_base : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:175
      gsi_end : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:176
   end record;
   pragma Convention (C_Pass_By_Copy, mp_ioapic_gsi);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:174

   mp_gsi_routing : aliased array (size_t) of aliased mp_ioapic_gsi;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:178
   pragma Import (C, mp_gsi_routing, "mp_gsi_routing");

   gsi_top : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:179
   pragma Import (C, gsi_top, "gsi_top");

   function mp_find_ioapic (gsi : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:180
   pragma Import (CPP, mp_find_ioapic, "_Z14mp_find_ioapicj");

   function mp_find_ioapic_pin (ioapic : int; gsi : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:181
   pragma Import (CPP, mp_find_ioapic_pin, "_Z18mp_find_ioapic_pinij");

   procedure mp_register_ioapic
     (id : int;
      address : asm_generic_int_ll64_h.u32;
      gsi_base : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:182
   pragma Import (CPP, mp_register_ioapic, "_Z18mp_register_ioapicijj");

   procedure pre_init_apic_IRQ0;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:183
   pragma Import (CPP, pre_init_apic_IRQ0, "_Z18pre_init_apic_IRQ0v");

   procedure mp_save_irq (m : access asm_mpspec_def_h.mpc_intsrc);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:185
   pragma Import (CPP, mp_save_irq, "_Z11mp_save_irqP10mpc_intsrc");

   procedure disable_ioapic_support;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:187
   pragma Import (CPP, disable_ioapic_support, "_Z22disable_ioapic_supportv");

   procedure native_io_apic_init_mappings;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:189
   pragma Import (CPP, native_io_apic_init_mappings, "_Z28native_io_apic_init_mappingsv");

   function native_io_apic_read (apic : unsigned; reg : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:190
   pragma Import (CPP, native_io_apic_read, "_Z19native_io_apic_readjj");

   procedure native_io_apic_write
     (apic : unsigned;
      reg : unsigned;
      val : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:191
   pragma Import (CPP, native_io_apic_write, "_Z20native_io_apic_writejjj");

   procedure native_io_apic_modify
     (apic : unsigned;
      reg : unsigned;
      val : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:192
   pragma Import (CPP, native_io_apic_modify, "_Z21native_io_apic_modifyjjj");

   procedure native_disable_io_apic;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:193
   pragma Import (CPP, native_disable_io_apic, "_Z22native_disable_io_apicv");

   procedure native_io_apic_print_entries (apic : unsigned; nr_entries : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:194
   pragma Import (CPP, native_io_apic_print_entries, "_Z28native_io_apic_print_entriesjj");

   procedure intel_ir_io_apic_print_entries (apic : unsigned; nr_entries : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:195
   pragma Import (CPP, intel_ir_io_apic_print_entries, "_Z30intel_ir_io_apic_print_entriesjj");

   function native_ioapic_set_affinity
     (arg1 : access linux_irq_h.irq_data;
      arg2 : access constant linux_cpumask_h.cpumask;
      arg3 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:196
   pragma Import (CPP, native_ioapic_set_affinity, "_Z26native_ioapic_set_affinityP8irq_dataPK7cpumaskb");

   function io_apic_read (apic : unsigned; reg : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:200
   pragma Import (CPP, io_apic_read, "_ZL12io_apic_readjj");

   procedure io_apic_write
     (apic : unsigned;
      reg : unsigned;
      value : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:205
   pragma Import (CPP, io_apic_write, "_ZL13io_apic_writejjj");

   procedure io_apic_modify
     (apic : unsigned;
      reg : unsigned;
      value : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:209
   pragma Import (CPP, io_apic_modify, "_ZL14io_apic_modifyjjj");

   procedure io_apic_eoi (apic : unsigned; vector : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/io_apic.h:214
   pragma Import (CPP, io_apic_eoi, "_Z11io_apic_eoijj");

end asm_io_apic_h;

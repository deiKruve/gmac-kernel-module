pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_mpspec_def_h is

   --  unsupported macro: SMP_MAGIC_IDENT (('_'<<24) | ('P'<<16) | ('M'<<8) | '_')
   --  unsupported macro: MPC_SIGNATURE "PCMP"
   --  unsupported macro: MP_PROCESSOR 0
   --  unsupported macro: MP_BUS 1
   --  unsupported macro: MP_IOAPIC 2
   --  unsupported macro: MP_INTSRC 3
   --  unsupported macro: MP_LINTSRC 4
   --  unsupported macro: MP_TRANSLATION 192
   --  unsupported macro: CPU_ENABLED 1
   --  unsupported macro: CPU_BOOTPROCESSOR 2
   --  unsupported macro: CPU_STEPPING_MASK 0x000F
   --  unsupported macro: CPU_MODEL_MASK 0x00F0
   --  unsupported macro: CPU_FAMILY_MASK 0x0F00
   --  unsupported macro: BUSTYPE_EISA "EISA"
   --  unsupported macro: BUSTYPE_ISA "ISA"
   --  unsupported macro: BUSTYPE_INTERN "INTERN"
   --  unsupported macro: BUSTYPE_MCA "MCA"
   --  unsupported macro: BUSTYPE_VL "VL"
   --  unsupported macro: BUSTYPE_PCI "PCI"
   --  unsupported macro: BUSTYPE_PCMCIA "PCMCIA"
   --  unsupported macro: BUSTYPE_CBUS "CBUS"
   --  unsupported macro: BUSTYPE_CBUSII "CBUSII"
   --  unsupported macro: BUSTYPE_FUTURE "FUTURE"
   --  unsupported macro: BUSTYPE_MBI "MBI"
   --  unsupported macro: BUSTYPE_MBII "MBII"
   --  unsupported macro: BUSTYPE_MPI "MPI"
   --  unsupported macro: BUSTYPE_MPSA "MPSA"
   --  unsupported macro: BUSTYPE_NUBUS "NUBUS"
   --  unsupported macro: BUSTYPE_TC "TC"
   --  unsupported macro: BUSTYPE_VME "VME"
   --  unsupported macro: BUSTYPE_XPRESS "XPRESS"
   --  unsupported macro: MPC_APIC_USABLE 0x01
   --  unsupported macro: MP_IRQDIR_DEFAULT 0
   --  unsupported macro: MP_IRQDIR_HIGH 1
   --  unsupported macro: MP_IRQDIR_LOW 3
   --  unsupported macro: MP_APIC_ALL 0xFF
   --  unsupported macro: MPC_OEM_SIGNATURE "_OEM"
  -- * Structure definitions for SMP machines following the
  -- * Intel Multiprocessing Specification 1.1 and 1.4.
  --  

  -- * This tag identifies where the SMP configuration
  -- * information is.
  --  

  -- Intel MP Floating Pointer Structure  
  -- "_MP_"			 
   subtype mpf_intel_signature_array is Interfaces.C.char_array (0 .. 3);
   type mpf_intel is record
      signature : aliased mpf_intel_signature_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:22
      physptr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:23
      length : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:24
      specification : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:25
      checksum : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:26
      feature1 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:27
      feature2 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:28
      feature3 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:29
      feature4 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:30
      feature5 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, mpf_intel);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:21

  -- Configuration table address	 
  -- Our length (paragraphs)	 
  -- Specification version	 
  -- Checksum (makes sum 0)	 
  -- Standard or configuration ?	 
  -- Bit7 set for IMCR|PIC	 
  -- Unused (0)			 
  -- Unused (0)			 
  -- Unused (0)			 
   subtype mpc_table_signature_array is Interfaces.C.char_array (0 .. 3);
   subtype mpc_table_oem_array is Interfaces.C.char_array (0 .. 7);
   subtype mpc_table_productid_array is Interfaces.C.char_array (0 .. 11);
   type mpc_table is record
      signature : aliased mpc_table_signature_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:37
      length : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:38
      spec : aliased char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:39
      checksum : aliased char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:40
      oem : aliased mpc_table_oem_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:41
      productid : aliased mpc_table_productid_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:42
      oemptr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:43
      oemsize : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:44
      oemcount : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:45
      lapic : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:46
      reserved : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:47
   end record;
   pragma Convention (C_Pass_By_Copy, mpc_table);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:36

  -- Size of table  
  -- 0x01  
  -- 0 if not present  
  -- 0 if not present  
  -- APIC address  
  -- Followed by entries  
  -- Used by IBM NUMA-Q to describe node locality  
   type mpc_cpu_reserved_array is array (0 .. 1) of aliased unsigned;
   type mpc_cpu is record
      c_type : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:68
      apicid : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:69
      apicver : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:70
      cpuflag : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:71
      cpufeature : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:72
      featureflag : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:73
      reserved : aliased mpc_cpu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:74
   end record;
   pragma Convention (C_Pass_By_Copy, mpc_cpu);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:67

  -- Local APIC number  
  -- Its versions  
  -- CPUID feature value  
   type mpc_bus_bustype_array is array (0 .. 5) of aliased unsigned_char;
   type mpc_bus is record
      c_type : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:78
      busid : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:79
      bustype : aliased mpc_bus_bustype_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:80
   end record;
   pragma Convention (C_Pass_By_Copy, mpc_bus);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:77

  -- List of Bus Type string values, Intel MP Spec.  
   type mpc_ioapic is record
      c_type : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:106
      apicid : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:107
      apicver : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:108
      flags : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:109
      apicaddr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:110
   end record;
   pragma Convention (C_Pass_By_Copy, mpc_ioapic);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:105

   type mpc_intsrc is record
      c_type : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:114
      irqtype : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:115
      irqflag : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:116
      srcbus : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:117
      srcbusirq : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:118
      dstapic : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:119
      dstirq : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:120
   end record;
   pragma Convention (C_Pass_By_Copy, mpc_intsrc);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:113

   type mp_irq_source_types is 
     (mp_INT,
      mp_NMI,
      mp_SMI,
      mp_ExtINT);
   pragma Convention (C, mp_irq_source_types);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:123

   type mpc_lintsrc is record
      c_type : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:137
      irqtype : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:138
      irqflag : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:139
      srcbusid : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:140
      srcbusirq : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:141
      destapic : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:142
      destapiclint : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:143
   end record;
   pragma Convention (C_Pass_By_Copy, mpc_lintsrc);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:136

   subtype mpc_oemtable_signature_array is Interfaces.C.char_array (0 .. 3);
   subtype mpc_oemtable_mpc_array is Interfaces.C.char_array (0 .. 7);
   type mpc_oemtable is record
      signature : aliased mpc_oemtable_signature_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:149
      length : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:150
      rev : aliased char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:151
      checksum : aliased char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:152
      mpc : aliased mpc_oemtable_mpc_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:153
   end record;
   pragma Convention (C_Pass_By_Copy, mpc_oemtable);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:148

  -- Size of table  
  -- 0x01  
  -- *	Default configurations
  -- *
  -- *	1	2 CPU ISA 82489DX
  -- *	2	2 CPU EISA 82489DX neither IRQ 0 timer nor IRQ 13 DMA chaining
  -- *	3	2 CPU EISA 82489DX
  -- *	4	2 CPU MCA 82489DX
  -- *	5	2 CPU ISA+PCI
  -- *	6	2 CPU EISA+PCI
  -- *	7	2 CPU MCA+PCI
  --  

   subtype mp_bustype is unsigned;
   MP_BUS_ISA : constant mp_bustype := 1;
   MP_BUS_EISA : constant mp_bustype := 2;
   MP_BUS_PCI : constant mp_bustype := 3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mpspec_def.h:168

end asm_mpspec_def_h;

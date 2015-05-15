pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package asm_apicdef_h is

   --  unsupported macro: IO_APIC_DEFAULT_PHYS_BASE 0xfec00000
   --  unsupported macro: APIC_DEFAULT_PHYS_BASE 0xfee00000
   --  unsupported macro: IO_APIC_SLOT_SIZE 1024
   --  unsupported macro: APIC_ID 0x20
   --  unsupported macro: APIC_LVR 0x30
   --  unsupported macro: APIC_LVR_MASK 0xFF00FF
   --  unsupported macro: APIC_LVR_DIRECTED_EOI (1 << 24)
   --  arg-macro: function GET_APIC_VERSION ((x) and 0xFFu
   --    return (x) and 0xFFu;
   --  arg-macro: function GET_APIC_MAXLVT (((x) >> 16) and 0xFFu
   --    return ((x) >> 16) and 0xFFu;
   --  arg-macro: function APIC_INTEGRATED (1
   --    return 1;
   --  arg-macro: function APIC_XAPIC ((x) >= 0x14
   --    return (x) >= 0x14;
   --  arg-macro: function APIC_EXT_SPACE ((x) and 0x80000000
   --    return (x) and 0x80000000;
   --  unsupported macro: APIC_TASKPRI 0x80
   --  unsupported macro: APIC_TPRI_MASK 0xFFu
   --  unsupported macro: APIC_ARBPRI 0x90
   --  unsupported macro: APIC_ARBPRI_MASK 0xFFu
   --  unsupported macro: APIC_PROCPRI 0xA0
   --  unsupported macro: APIC_EOI 0xB0
   --  unsupported macro: APIC_EOI_ACK 0x0
   --  unsupported macro: APIC_RRR 0xC0
   --  unsupported macro: APIC_LDR 0xD0
   --  unsupported macro: APIC_LDR_MASK (0xFFu << 24)
   --  arg-macro: function GET_APIC_LOGICAL_ID (((x) >> 24) and 0xFFu
   --    return ((x) >> 24) and 0xFFu;
   --  arg-macro: function SET_APIC_LOGICAL_ID (((x) << 24)
   --    return ((x) << 24);
   --  unsupported macro: APIC_ALL_CPUS 0xFFu
   --  unsupported macro: APIC_DFR 0xE0
   --  unsupported macro: APIC_DFR_CLUSTER 0x0FFFFFFFul
   --  unsupported macro: APIC_DFR_FLAT 0xFFFFFFFFul
   --  unsupported macro: APIC_SPIV 0xF0
   --  unsupported macro: APIC_SPIV_DIRECTED_EOI (1 << 12)
   --  unsupported macro: APIC_SPIV_FOCUS_DISABLED (1 << 9)
   --  unsupported macro: APIC_SPIV_APIC_ENABLED (1 << 8)
   --  unsupported macro: APIC_ISR 0x100
   --  unsupported macro: APIC_ISR_NR 0x8
   --  unsupported macro: APIC_TMR 0x180
   --  unsupported macro: APIC_IRR 0x200
   --  unsupported macro: APIC_ESR 0x280
   --  unsupported macro: APIC_ESR_SEND_CS 0x00001
   --  unsupported macro: APIC_ESR_RECV_CS 0x00002
   --  unsupported macro: APIC_ESR_SEND_ACC 0x00004
   --  unsupported macro: APIC_ESR_RECV_ACC 0x00008
   --  unsupported macro: APIC_ESR_SENDILL 0x00020
   --  unsupported macro: APIC_ESR_RECVILL 0x00040
   --  unsupported macro: APIC_ESR_ILLREGA 0x00080
   --  unsupported macro: APIC_LVTCMCI 0x2f0
   --  unsupported macro: APIC_ICR 0x300
   --  unsupported macro: APIC_DEST_SELF 0x40000
   --  unsupported macro: APIC_DEST_ALLINC 0x80000
   --  unsupported macro: APIC_DEST_ALLBUT 0xC0000
   --  unsupported macro: APIC_ICR_RR_MASK 0x30000
   --  unsupported macro: APIC_ICR_RR_INVALID 0x00000
   --  unsupported macro: APIC_ICR_RR_INPROG 0x10000
   --  unsupported macro: APIC_ICR_RR_VALID 0x20000
   --  unsupported macro: APIC_INT_LEVELTRIG 0x08000
   --  unsupported macro: APIC_INT_ASSERT 0x04000
   --  unsupported macro: APIC_ICR_BUSY 0x01000
   --  unsupported macro: APIC_DEST_LOGICAL 0x00800
   --  unsupported macro: APIC_DEST_PHYSICAL 0x00000
   --  unsupported macro: APIC_DM_FIXED 0x00000
   --  unsupported macro: APIC_DM_FIXED_MASK 0x00700
   --  unsupported macro: APIC_DM_LOWEST 0x00100
   --  unsupported macro: APIC_DM_SMI 0x00200
   --  unsupported macro: APIC_DM_REMRD 0x00300
   --  unsupported macro: APIC_DM_NMI 0x00400
   --  unsupported macro: APIC_DM_INIT 0x00500
   --  unsupported macro: APIC_DM_STARTUP 0x00600
   --  unsupported macro: APIC_DM_EXTINT 0x00700
   --  unsupported macro: APIC_VECTOR_MASK 0x000FF
   --  unsupported macro: APIC_ICR2 0x310
   --  arg-macro: function GET_APIC_DEST_FIELD (((x) >> 24) and 0xFF
   --    return ((x) >> 24) and 0xFF;
   --  arg-macro: function SET_APIC_DEST_FIELD ((x) << 24
   --    return (x) << 24;
   --  unsupported macro: APIC_LVTT 0x320
   --  unsupported macro: APIC_LVTTHMR 0x330
   --  unsupported macro: APIC_LVTPC 0x340
   --  unsupported macro: APIC_LVT0 0x350
   --  unsupported macro: APIC_LVT_TIMER_BASE_MASK (0x3 << 18)
   --  arg-macro: function GET_APIC_TIMER_BASE (((x) >> 18) and 0x3
   --    return ((x) >> 18) and 0x3;
   --  arg-macro: function SET_APIC_TIMER_BASE (((x) << 18)
   --    return ((x) << 18);
   --  unsupported macro: APIC_TIMER_BASE_CLKIN 0x0
   --  unsupported macro: APIC_TIMER_BASE_TMBASE 0x1
   --  unsupported macro: APIC_TIMER_BASE_DIV 0x2
   --  unsupported macro: APIC_LVT_TIMER_ONESHOT (0 << 17)
   --  unsupported macro: APIC_LVT_TIMER_PERIODIC (1 << 17)
   --  unsupported macro: APIC_LVT_TIMER_TSCDEADLINE (2 << 17)
   --  unsupported macro: APIC_LVT_MASKED (1 << 16)
   --  unsupported macro: APIC_LVT_LEVEL_TRIGGER (1 << 15)
   --  unsupported macro: APIC_LVT_REMOTE_IRR (1 << 14)
   --  unsupported macro: APIC_INPUT_POLARITY (1 << 13)
   --  unsupported macro: APIC_SEND_PENDING (1 << 12)
   --  unsupported macro: APIC_MODE_MASK 0x700
   --  arg-macro: function GET_APIC_DELIVERY_MODE (((x) >> 8) and 0x7
   --    return ((x) >> 8) and 0x7;
   --  arg-macro: function SET_APIC_DELIVERY_MODE (((x) and ~0x700) or ((y) << 8)
   --    return ((x) and ~0x700) or ((y) << 8);
   --  unsupported macro: APIC_MODE_FIXED 0x0
   --  unsupported macro: APIC_MODE_NMI 0x4
   --  unsupported macro: APIC_MODE_EXTINT 0x7
   --  unsupported macro: APIC_LVT1 0x360
   --  unsupported macro: APIC_LVTERR 0x370
   --  unsupported macro: APIC_TMICT 0x380
   --  unsupported macro: APIC_TMCCT 0x390
   --  unsupported macro: APIC_TDCR 0x3E0
   --  unsupported macro: APIC_SELF_IPI 0x3F0
   --  unsupported macro: APIC_TDR_DIV_TMBASE (1 << 2)
   --  unsupported macro: APIC_TDR_DIV_1 0xB
   --  unsupported macro: APIC_TDR_DIV_2 0x0
   --  unsupported macro: APIC_TDR_DIV_4 0x1
   --  unsupported macro: APIC_TDR_DIV_8 0x2
   --  unsupported macro: APIC_TDR_DIV_16 0x3
   --  unsupported macro: APIC_TDR_DIV_32 0x8
   --  unsupported macro: APIC_TDR_DIV_64 0x9
   --  unsupported macro: APIC_TDR_DIV_128 0xA
   --  unsupported macro: APIC_EFEAT 0x400
   --  unsupported macro: APIC_ECTRL 0x410
   --  arg-macro: function APIC_EILVTn (0x500 + 0x10 * n
   --    return 0x500 + 0x10 * n;
   --  unsupported macro: APIC_EILVT_NR_AMD_K8 1
   --  unsupported macro: APIC_EILVT_NR_AMD_10H 4
   --  unsupported macro: APIC_EILVT_NR_MAX APIC_EILVT_NR_AMD_10H
   --  arg-macro: function APIC_EILVT_LVTOFF (((x) >> 4) and 0xF
   --    return ((x) >> 4) and 0xF;
   --  unsupported macro: APIC_EILVT_MSG_FIX 0x0
   --  unsupported macro: APIC_EILVT_MSG_SMI 0x2
   --  unsupported macro: APIC_EILVT_MSG_NMI 0x4
   --  unsupported macro: APIC_EILVT_MSG_EXT 0x7
   --  unsupported macro: APIC_EILVT_MASKED (1 << 16)
   --  unsupported macro: APIC_BASE (fix_to_virt(FIX_APIC_BASE))
   --  unsupported macro: APIC_BASE_MSR 0x800
   --  unsupported macro: XAPIC_ENABLE (1UL << 11)
   --  unsupported macro: X2APIC_ENABLE (1UL << 10)
   --  unsupported macro: MAX_IO_APICS 128
   --  unsupported macro: MAX_LOCAL_APIC 32768
   --  unsupported macro: XAPIC_DEST_CPUS_SHIFT 4
   --  unsupported macro: XAPIC_DEST_CPUS_MASK ((1u << XAPIC_DEST_CPUS_SHIFT) - 1)
   --  unsupported macro: XAPIC_DEST_CLUSTER_MASK (XAPIC_DEST_CPUS_MASK << XAPIC_DEST_CPUS_SHIFT)
   --  arg-macro: function APIC_CLUSTER ((apicid) and XAPIC_DEST_CLUSTER_MASK
   --    return (apicid) and XAPIC_DEST_CLUSTER_MASK;
   --  arg-macro: function APIC_CLUSTERID (APIC_CLUSTER(apicid) >> XAPIC_DEST_CPUS_SHIFT
   --    return APIC_CLUSTER(apicid) >> XAPIC_DEST_CPUS_SHIFT;
   --  arg-macro: function APIC_CPUID ((apicid) and XAPIC_DEST_CPUS_MASK
   --    return (apicid) and XAPIC_DEST_CPUS_MASK;
   --  unsupported macro: NUM_APIC_CLUSTERS ((BAD_APICID + 1) >> XAPIC_DEST_CPUS_SHIFT)
   --  unsupported macro: BAD_APICID 0xFFFFu
  -- * Constants for various Intel APICs. (local APIC, IOAPIC, etc.)
  -- *
  -- * Alan Cox <Alan.Cox@linux.org>, 1995.
  -- * Ingo Molnar <mingo@redhat.com>, 1999, 2000
  --  

  -- * This is the IO-APIC register space as specified
  -- * by Intel docs:
  --  

  -- * All x86-64 systems are xAPIC compatible.
  -- * In the following, "apicid" is a physical APIC ID.
  --  

  -- * the local APIC register structure, memory mapped. Not terribly well
  -- * tested, but we might eventually use this one in the future - the
  -- * problem why we cannot use it right now is the P5 APIC, it has an
  -- * errata which cannot take 8-bit reads and writes, only 32-bit ones ...
  --  

  --000 
   type local_apic_isr_array is array (0 .. 7) of aliased anon_84;
   type local_apic_tmr_array is array (0 .. 7) of aliased anon_85;
   type local_apic_irr_array is array (0 .. 7) of aliased anon_86;
   type local_apic;
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_68 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:180
   end record;
   pragma Convention (C_Pass_By_Copy, anon_68);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_69 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:182
   end record;
   pragma Convention (C_Pass_By_Copy, anon_69);
   type local_apic_uu_reserved_array is array (0 .. 2) of aliased unsigned;
   type anon_70 is record
      uu_reserved_1 : Extensions.Unsigned_24;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:185
      phys_apic_id : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:186
      uu_reserved_2 : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:187
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:188
   end record;
   pragma Convention (C_Pass_By_Copy, anon_70);
   type local_apic_uu_reserved_array is array (0 .. 2) of aliased unsigned;
   type anon_71 is record
      version : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:193
      uu_reserved_1 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:194
      max_lvt : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:195
      uu_reserved_2 : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:196
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:197
   end record;
   pragma Convention (C_Pass_By_Copy, anon_71);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_72 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:200
   end record;
   pragma Convention (C_Pass_By_Copy, anon_72);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_73 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:202
   end record;
   pragma Convention (C_Pass_By_Copy, anon_73);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_74 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:204
   end record;
   pragma Convention (C_Pass_By_Copy, anon_74);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_75 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:206
   end record;
   pragma Convention (C_Pass_By_Copy, anon_75);
   type local_apic_uu_reserved_2_array is array (0 .. 2) of aliased unsigned;
   type anon_76 is record
      priority : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:209
      uu_reserved_1 : Extensions.Unsigned_24;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:210
      uu_reserved_2 : aliased local_apic_uu_reserved_2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:211
   end record;
   pragma Convention (C_Pass_By_Copy, anon_76);
   type local_apic_uu_reserved_2_array is array (0 .. 2) of aliased unsigned;
   type anon_77 is record
      priority : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:216
      uu_reserved_1 : Extensions.Unsigned_24;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:217
      uu_reserved_2 : aliased local_apic_uu_reserved_2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:218
   end record;
   pragma Convention (C_Pass_By_Copy, anon_77);
   type local_apic_uu_reserved_2_array is array (0 .. 2) of aliased unsigned;
   type anon_78 is record
      priority : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:223
      uu_reserved_1 : Extensions.Unsigned_24;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:224
      uu_reserved_2 : aliased local_apic_uu_reserved_2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:225
   end record;
   pragma Convention (C_Pass_By_Copy, anon_78);
   type local_apic_uu_reserved_array is array (0 .. 2) of aliased unsigned;
   type anon_79 is record
      eoi : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:229
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:230
   end record;
   pragma Convention (C_Pass_By_Copy, anon_79);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_80 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:233
   end record;
   pragma Convention (C_Pass_By_Copy, anon_80);
   type local_apic_uu_reserved_2_array is array (0 .. 2) of aliased unsigned;
   type anon_81 is record
      uu_reserved_1 : Extensions.Unsigned_24;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:236
      logical_dest : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:237
      uu_reserved_2 : aliased local_apic_uu_reserved_2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:238
   end record;
   pragma Convention (C_Pass_By_Copy, anon_81);
   type local_apic_uu_reserved_2_array is array (0 .. 2) of aliased unsigned;
   type anon_82 is record
      uu_reserved_1 : Extensions.Unsigned_28;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:242
      model : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:243
      uu_reserved_2 : aliased local_apic_uu_reserved_2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:244
   end record;
   pragma Convention (C_Pass_By_Copy, anon_82);
   type local_apic_uu_reserved_3_array is array (0 .. 2) of aliased unsigned;
   type anon_83 is record
      spurious_vector : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:248
      apic_enabled : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:249
      focus_cpu : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:250
      uu_reserved_2 : Extensions.Unsigned_22;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:251
      uu_reserved_3 : aliased local_apic_uu_reserved_3_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:252
   end record;
   pragma Convention (C_Pass_By_Copy, anon_83);
   type local_apic_uu_reserved_array is array (0 .. 2) of aliased unsigned;
   type anon_84 is record
      bitfield : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:256
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:257
   end record;
   pragma Convention (C_Pass_By_Copy, anon_84);
   type local_apic_uu_reserved_array is array (0 .. 2) of aliased unsigned;
   type anon_85 is record
      bitfield : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:261
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:262
   end record;
   pragma Convention (C_Pass_By_Copy, anon_85);
   type local_apic_uu_reserved_array is array (0 .. 2) of aliased unsigned;
   type anon_86 is record
      bitfield : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:266
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:267
   end record;
   pragma Convention (C_Pass_By_Copy, anon_86);
   type anon_87;
   type anon_87_uu_reserved_3_array is array (0 .. 2) of aliased unsigned;
   type anon_88 is record
      send_cs_error : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:272
      receive_cs_error : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:273
      send_accept_error : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:274
      receive_accept_error : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:275
      uu_reserved_1 : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:276
      send_illegal_vector : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:277
      receive_illegal_vector : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:278
      illegal_register_address : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:279
      uu_reserved_2 : Extensions.Unsigned_24;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:280
      uu_reserved_3 : aliased anon_87_uu_reserved_3_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:281
   end record;
   pragma Convention (C_Pass_By_Copy, anon_88);
   type anon_87_uu_reserved_3_array is array (0 .. 2) of aliased unsigned;
   type anon_89 is record
      errors : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:284
      uu_reserved_3 : aliased anon_87_uu_reserved_3_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:285
   end record;
   pragma Convention (C_Pass_By_Copy, anon_89);
   type anon_87 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            error_bits : aliased anon_88;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:282
         when others =>
            all_errors : aliased anon_89;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:286
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_87);
   pragma Unchecked_Union (anon_87);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_90 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:289
   end record;
   pragma Convention (C_Pass_By_Copy, anon_90);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_91 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:291
   end record;
   pragma Convention (C_Pass_By_Copy, anon_91);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_92 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:293
   end record;
   pragma Convention (C_Pass_By_Copy, anon_92);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_93 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:295
   end record;
   pragma Convention (C_Pass_By_Copy, anon_93);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_94 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:297
   end record;
   pragma Convention (C_Pass_By_Copy, anon_94);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_95 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:299
   end record;
   pragma Convention (C_Pass_By_Copy, anon_95);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_96 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:301
   end record;
   pragma Convention (C_Pass_By_Copy, anon_96);
   type local_apic_uu_reserved_4_array is array (0 .. 2) of aliased unsigned;
   type anon_97 is record
      vector : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:304
      delivery_mode : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:305
      destination_mode : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:306
      delivery_status : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:307
      uu_reserved_1 : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:308
      level : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:309
      trigger : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:310
      uu_reserved_2 : Extensions.Unsigned_2;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:311
      shorthand : Extensions.Unsigned_2;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:312
      uu_reserved_3 : Extensions.Unsigned_12;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:313
      uu_reserved_4 : aliased local_apic_uu_reserved_4_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:314
   end record;
   pragma Convention (C_Pass_By_Copy, anon_97);
   type local_apic_uu_reserved_4_array is array (0 .. 2) of aliased unsigned;
   type anon_99 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_reserved_1 : Extensions.Unsigned_24;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:319
         when 1 =>
            phys_dest : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:320
         when 2 =>
            uu_reserved_2 : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:321
         when 3 =>
            uu_reserved_3 : Extensions.Unsigned_24;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:322
         when others =>
            logical_dest : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:323
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_99);
   pragma Unchecked_Union (anon_99);
   type anon_98 is record
      dest : anon_99;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:324
      uu_reserved_4 : aliased local_apic_uu_reserved_4_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:325
   end record;
   pragma Convention (C_Pass_By_Copy, anon_98);
   type local_apic_uu_reserved_4_array is array (0 .. 2) of aliased unsigned;
   type anon_100 is record
      vector : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:329
      uu_reserved_1 : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:330
      delivery_status : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:331
      uu_reserved_2 : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:332
      mask : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:333
      timer_mode : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:334
      uu_reserved_3 : Extensions.Unsigned_14;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:335
      uu_reserved_4 : aliased local_apic_uu_reserved_4_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:336
   end record;
   pragma Convention (C_Pass_By_Copy, anon_100);
   type local_apic_uu_reserved_4_array is array (0 .. 2) of aliased unsigned;
   type anon_101 is record
      vector : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:340
      delivery_mode : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:341
      uu_reserved_1 : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:342
      delivery_status : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:343
      uu_reserved_2 : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:344
      mask : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:345
      uu_reserved_3 : Extensions.Unsigned_15;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:346
      uu_reserved_4 : aliased local_apic_uu_reserved_4_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:347
   end record;
   pragma Convention (C_Pass_By_Copy, anon_101);
   type local_apic_uu_reserved_4_array is array (0 .. 2) of aliased unsigned;
   type anon_102 is record
      vector : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:351
      delivery_mode : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:352
      uu_reserved_1 : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:353
      delivery_status : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:354
      uu_reserved_2 : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:355
      mask : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:356
      uu_reserved_3 : Extensions.Unsigned_15;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:357
      uu_reserved_4 : aliased local_apic_uu_reserved_4_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:358
   end record;
   pragma Convention (C_Pass_By_Copy, anon_102);
   type local_apic_uu_reserved_3_array is array (0 .. 2) of aliased unsigned;
   type anon_103 is record
      vector : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:362
      delivery_mode : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:363
      uu_reserved_1 : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:364
      delivery_status : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:365
      polarity : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:366
      remote_irr : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:367
      trigger : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:368
      mask : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:369
      uu_reserved_2 : Extensions.Unsigned_15;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:370
      uu_reserved_3 : aliased local_apic_uu_reserved_3_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:371
   end record;
   pragma Convention (C_Pass_By_Copy, anon_103);
   type local_apic_uu_reserved_3_array is array (0 .. 2) of aliased unsigned;
   type anon_104 is record
      vector : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:375
      delivery_mode : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:376
      uu_reserved_1 : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:377
      delivery_status : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:378
      polarity : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:379
      remote_irr : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:380
      trigger : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:381
      mask : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:382
      uu_reserved_2 : Extensions.Unsigned_15;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:383
      uu_reserved_3 : aliased local_apic_uu_reserved_3_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:384
   end record;
   pragma Convention (C_Pass_By_Copy, anon_104);
   type local_apic_uu_reserved_4_array is array (0 .. 2) of aliased unsigned;
   type anon_105 is record
      vector : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:388
      uu_reserved_1 : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:389
      delivery_status : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:390
      uu_reserved_2 : Extensions.Unsigned_3;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:391
      mask : Extensions.Unsigned_1;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:392
      uu_reserved_3 : Extensions.Unsigned_15;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:393
      uu_reserved_4 : aliased local_apic_uu_reserved_4_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:394
   end record;
   pragma Convention (C_Pass_By_Copy, anon_105);
   type local_apic_uu_reserved_2_array is array (0 .. 2) of aliased unsigned;
   type anon_106 is record
      initial_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:398
      uu_reserved_2 : aliased local_apic_uu_reserved_2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:399
   end record;
   pragma Convention (C_Pass_By_Copy, anon_106);
   type local_apic_uu_reserved_2_array is array (0 .. 2) of aliased unsigned;
   type anon_107 is record
      curr_count : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:404
      uu_reserved_2 : aliased local_apic_uu_reserved_2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:405
   end record;
   pragma Convention (C_Pass_By_Copy, anon_107);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_108 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:408
   end record;
   pragma Convention (C_Pass_By_Copy, anon_108);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_109 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:410
   end record;
   pragma Convention (C_Pass_By_Copy, anon_109);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_110 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:412
   end record;
   pragma Convention (C_Pass_By_Copy, anon_110);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_111 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:414
   end record;
   pragma Convention (C_Pass_By_Copy, anon_111);
   type local_apic_uu_reserved_2_array is array (0 .. 2) of aliased unsigned;
   type anon_112 is record
      divisor : Extensions.Unsigned_4;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:417
      uu_reserved_1 : Extensions.Unsigned_28;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:418
      uu_reserved_2 : aliased local_apic_uu_reserved_2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:419
   end record;
   pragma Convention (C_Pass_By_Copy, anon_112);
   type local_apic_uu_reserved_array is array (0 .. 3) of aliased unsigned;
   type anon_113 is record
      uu_reserved : aliased local_apic_uu_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:422
   end record;
   pragma Convention (C_Pass_By_Copy, anon_113);
   package Class_local_apic is
      type local_apic is limited record
         uu_reserved_01 : aliased anon_68;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:180
         uu_reserved_02 : aliased anon_69;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:182
         id : aliased anon_70;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:189
         version : aliased anon_71;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:198
         uu_reserved_03 : aliased anon_72;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:200
         uu_reserved_04 : aliased anon_73;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:202
         uu_reserved_05 : aliased anon_74;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:204
         uu_reserved_06 : aliased anon_75;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:206
         tpr : aliased anon_76;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:212
         apr : aliased anon_77;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:219
         ppr : aliased anon_78;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:226
         eoi : aliased anon_79;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:231
         uu_reserved_07 : aliased anon_80;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:233
         ldr : aliased anon_81;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:239
         dfr : aliased anon_82;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:245
         svr : aliased anon_83;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:253
         isr : aliased local_apic_isr_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:258
         tmr : aliased local_apic_tmr_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:263
         irr : aliased local_apic_irr_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:268
         esr : anon_87;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:287
         uu_reserved_08 : aliased anon_90;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:289
         uu_reserved_09 : aliased anon_91;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:291
         uu_reserved_10 : aliased anon_92;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:293
         uu_reserved_11 : aliased anon_93;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:295
         uu_reserved_12 : aliased anon_94;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:297
         uu_reserved_13 : aliased anon_95;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:299
         uu_reserved_14 : aliased anon_96;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:301
         icr1 : aliased anon_97;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:315
         icr2 : aliased anon_98;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:326
         lvt_timer : aliased anon_100;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:337
         lvt_thermal : aliased anon_101;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:348
         lvt_pc : aliased anon_102;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:359
         lvt_lint0 : aliased anon_103;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:372
         lvt_lint1 : aliased anon_104;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:385
         lvt_error : aliased anon_105;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:395
         timer_icr : aliased anon_106;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:400
         timer_ccr : aliased anon_107;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:406
         uu_reserved_16 : aliased anon_108;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:408
         uu_reserved_17 : aliased anon_109;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:410
         uu_reserved_18 : aliased anon_110;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:412
         uu_reserved_19 : aliased anon_111;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:414
         timer_dcr : aliased anon_112;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:420
         uu_reserved_20 : aliased anon_113;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:422
      end record;
      pragma Import (CPP, local_apic);
   end;
   use Class_local_apic;
  --010 
  --020 
  -- APIC ID Register  
  --030 
  -- APIC Version Register  
  --040 
  --050 
  --060 
  --070 
  --080 
  -- Task Priority Register  
  --090 
  -- Arbitration Priority Register  
  --0A0 
  -- Processor Priority Register  
  --0B0 
  -- End Of Interrupt Register  
  --0C0 
  --0D0 
  -- Logical Destination Register  
  --0E0 
  -- Destination Format Register  
  --0F0 
  -- Spurious Interrupt Vector Register  
  --100 
  -- In Service Register  
  --170 
  --180 
  -- Trigger Mode Register  
  --1F0 
  --200 
  -- Interrupt Request Register  
  --270 
  --280 
  -- Error Status Register  
  --290 
  --2A0 
  --2B0 
  --2C0 
  --2D0 
  --2E0 
  --2F0 
  --300 
  -- Interrupt Command Register 1  
  --310 
  -- Interrupt Command Register 2  
  --320 
  -- LVT - Timer  
  --330 
  -- LVT - Thermal Sensor  
  --340 
  -- LVT - Performance Counter  
  --350 
  -- LVT - LINT0  
  --360 
  -- LVT - LINT1  
  --370 
  -- LVT - Error  
  --380 
  -- Timer Initial Count Register  
  --390 
  -- Timer Current Count Register  
  --3A0 
  --3B0 
  --3C0 
  --3D0 
  --3E0 
  -- Timer Divide Configuration Register  
  --3F0 
   type ioapic_irq_destination_types is 
     (dest_Fixed,
      dest_LowestPrio,
      dest_SMI,
      dest_u_reserved_1,
      dest_NMI,
      dest_INIT,
      dest_u_reserved_2,
      dest_ExtINT);
   pragma Convention (C, ioapic_irq_destination_types);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/apicdef.h:434

end asm_apicdef_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_segment_h is

   --  arg-macro: function GDT_ENTRY ((((base) and _AC(0xff000000,ULL)) << (56-24)) or (((flags) and _AC(0x0000f0ff,ULL)) << 40) or (((limit) and _AC(0x000f0000,ULL)) << (48-16)) or (((base) and _AC(0x00ffffff,ULL)) << 16) or (((limit) and _AC(0x0000ffff,ULL)))
   --    return (((base) and _AC(0xff000000,ULL)) << (56-24)) or (((flags) and _AC(0x0000f0ff,ULL)) << 40) or (((limit) and _AC(0x000f0000,ULL)) << (48-16)) or (((base) and _AC(0x00ffffff,ULL)) << 16) or (((limit) and _AC(0x0000ffff,ULL)));
   --  unsupported macro: GDT_ENTRY_BOOT_CS 2
   --  unsupported macro: GDT_ENTRY_BOOT_DS (GDT_ENTRY_BOOT_CS + 1)
   --  unsupported macro: GDT_ENTRY_BOOT_TSS (GDT_ENTRY_BOOT_CS + 2)
   --  unsupported macro: GDT_ENTRY_KERNEL32_CS 1
   --  unsupported macro: GDT_ENTRY_KERNEL_CS 2
   --  unsupported macro: GDT_ENTRY_KERNEL_DS 3
   --  unsupported macro: GDT_ENTRY_DEFAULT_USER32_CS 4
   --  unsupported macro: GDT_ENTRY_DEFAULT_USER_DS 5
   --  unsupported macro: GDT_ENTRY_DEFAULT_USER_CS 6
   --  unsupported macro: GDT_ENTRY_TSS 8
   --  unsupported macro: GDT_ENTRY_LDT 10
   --  unsupported macro: GDT_ENTRY_TLS_MIN 12
   --  unsupported macro: GDT_ENTRY_TLS_MAX 14
   --  unsupported macro: GDT_ENTRY_PER_CPU 15
   --  unsupported macro: FS_TLS 0
   --  unsupported macro: GS_TLS 1
   --  unsupported macro: GS_TLS_SEL ((GDT_ENTRY_TLS_MIN+GS_TLS)*8 + 3)
   --  unsupported macro: FS_TLS_SEL ((GDT_ENTRY_TLS_MIN+FS_TLS)*8 + 3)
   --  unsupported macro: GDT_ENTRIES 16
   --  unsupported macro: USER_RPL 0x3
   --  unsupported macro: SEGMENT_LDT 0x4
   --  unsupported macro: SEGMENT_GDT 0x0
   --  unsupported macro: SEGMENT_RPL_MASK 0x3
   --  unsupported macro: SEGMENT_TI_MASK 0x4
   --  unsupported macro: IDT_ENTRIES 256
   --  unsupported macro: NUM_EXCEPTION_VECTORS 32
   --  unsupported macro: EXCEPTION_ERRCODE_MASK 0x00027d00
   --  unsupported macro: GDT_SIZE (GDT_ENTRIES * 8)
   --  unsupported macro: GDT_ENTRY_TLS_ENTRIES 3
   --  unsupported macro: TLS_SIZE (GDT_ENTRY_TLS_ENTRIES * 8)
   --  unsupported macro: trace_early_idt_handlers early_idt_handlers
   --  unsupported macro: loadsegment(seg,value) do { unsigned short __val = (value); asm volatile("						\n" "1:	movl %k0,%%" #seg "		\n" ".section .fixup,\"ax\"			\n" "2:	xorl %k0,%k0			\n" "		jmp 1b				\n" ".previous					\n" _ASM_EXTABLE(1b, 2b) : "+r" (__val) : : "memory"); } while (0)
   --  unsupported macro: savesegment(seg,value) asm("mov %%" #seg ",%0":"=r" (value) : : "memory")
  -- Constructor for a conventional segment GDT (or LDT) entry  
  -- This is a macro so it can be used in initializers  
  -- Simple and small GDT entries for booting only  
  -- * The layout of the per-CPU GDT under Linux:
  -- *
  -- *   0 - null
  -- *   1 - reserved
  -- *   2 - reserved
  -- *   3 - reserved
  -- *
  -- *   4 - unused			<==== new cacheline
  -- *   5 - unused
  -- *
  -- *  ------- start of TLS (Thread-Local Storage) segments:
  -- *
  -- *   6 - TLS segment #1			[ glibc's TLS segment ]
  -- *   7 - TLS segment #2			[ Wine's %fs Win32 segment ]
  -- *   8 - TLS segment #3
  -- *   9 - reserved
  -- *  10 - reserved
  -- *  11 - reserved
  -- *
  -- *  ------- start of kernel segments:
  -- *
  -- *  12 - kernel code segment		<==== new cacheline
  -- *  13 - kernel data segment
  -- *  14 - default user CS
  -- *  15 - default user DS
  -- *  16 - TSS
  -- *  17 - LDT
  -- *  18 - PNPBIOS support (16->32 gate)
  -- *  19 - PNPBIOS support
  -- *  20 - PNPBIOS support
  -- *  21 - PNPBIOS support
  -- *  22 - PNPBIOS support
  -- *  23 - APM BIOS support
  -- *  24 - APM BIOS support
  -- *  25 - APM BIOS support
  -- *
  -- *  26 - ESPFIX small SS
  -- *  27 - per-cpu			[ offset to per-cpu data area ]
  -- *  28 - stack_canary-20		[ for stack protector ]
  -- *  29 - unused
  -- *  30 - unused
  -- *  31 - TSS for double fault handler
  --  

  -- * The GDT has 32 entries
  --  

  -- The PnP BIOS entries in the GDT  
  -- The PnP BIOS selectors  
  -- Bottom two bits of selector give the ring privilege level  
  -- Bit 2 is table indicator (LDT/GDT)  
  -- User mode is privilege level 3  
  -- LDT segment has TI set, GDT has it cleared  
  -- * Matching rules for certain types of segments.
  --  

  -- Matches PNP_CS32 and PNP_CS16 (they must be consecutive)  
  -- * we cannot use the same code segment descriptor for user and kernel
  -- * -- not even in the long flat mode, because of different DPL /kkeil
  -- * The segment offset needs to contain a RPL. Grr. -AK
  -- * GDT layout to get 64bit syscall right (sysret hardcodes gdt offsets)
  --  

  -- TLS indexes for 64bit - hardcoded in arch_prctl  
  -- User mode is privilege level 3  
  -- LDT segment has TI set, GDT has it cleared  
  -- Bottom two bits of selector give the ring privilege level  
  -- Bit 2 is table indicator (LDT/GDT)  
  -- Bitmask of exception vectors which push an error code on the stack  
   early_idt_handlers : aliased array (0 .. 31, 0 .. 8) of aliased char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/segment.h:216
   pragma Import (C, early_idt_handlers, "early_idt_handlers");

  -- * Load a segment. Fall back on loading the zero
  -- * segment if something goes wrong..
  --  

  -- * Save a segment register away
  --  

  -- * x86_32 user gs accessors.
  --  

   function get_limit (segment : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/segment.h:267
   pragma Import (CPP, get_limit, "_ZL9get_limitm");

end asm_segment_h;

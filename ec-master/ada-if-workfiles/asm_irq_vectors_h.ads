pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_irq_vectors_h is

   --  unsupported macro: NMI_VECTOR 0x02
   --  unsupported macro: MCE_VECTOR 0x12
   --  unsupported macro: FIRST_EXTERNAL_VECTOR 0x20
   --  unsupported macro: VECTOR_OFFSET_START 1
   --  unsupported macro: IRQ_MOVE_CLEANUP_VECTOR FIRST_EXTERNAL_VECTOR
   --  unsupported macro: IA32_SYSCALL_VECTOR 0x80
   --  unsupported macro: IRQ0_VECTOR ((FIRST_EXTERNAL_VECTOR + 16) & ~15)
   --  unsupported macro: IRQ1_VECTOR (IRQ0_VECTOR + 1)
   --  unsupported macro: IRQ2_VECTOR (IRQ0_VECTOR + 2)
   --  unsupported macro: IRQ3_VECTOR (IRQ0_VECTOR + 3)
   --  unsupported macro: IRQ4_VECTOR (IRQ0_VECTOR + 4)
   --  unsupported macro: IRQ5_VECTOR (IRQ0_VECTOR + 5)
   --  unsupported macro: IRQ6_VECTOR (IRQ0_VECTOR + 6)
   --  unsupported macro: IRQ7_VECTOR (IRQ0_VECTOR + 7)
   --  unsupported macro: IRQ8_VECTOR (IRQ0_VECTOR + 8)
   --  unsupported macro: IRQ9_VECTOR (IRQ0_VECTOR + 9)
   --  unsupported macro: IRQ10_VECTOR (IRQ0_VECTOR + 10)
   --  unsupported macro: IRQ11_VECTOR (IRQ0_VECTOR + 11)
   --  unsupported macro: IRQ12_VECTOR (IRQ0_VECTOR + 12)
   --  unsupported macro: IRQ13_VECTOR (IRQ0_VECTOR + 13)
   --  unsupported macro: IRQ14_VECTOR (IRQ0_VECTOR + 14)
   --  unsupported macro: IRQ15_VECTOR (IRQ0_VECTOR + 15)
   --  unsupported macro: SPURIOUS_APIC_VECTOR 0xff
   --  unsupported macro: ERROR_APIC_VECTOR 0xfe
   --  unsupported macro: RESCHEDULE_VECTOR 0xfd
   --  unsupported macro: CALL_FUNCTION_VECTOR 0xfc
   --  unsupported macro: CALL_FUNCTION_SINGLE_VECTOR 0xfb
   --  unsupported macro: THERMAL_APIC_VECTOR 0xfa
   --  unsupported macro: THRESHOLD_APIC_VECTOR 0xf9
   --  unsupported macro: REBOOT_VECTOR 0xf8
   --  unsupported macro: X86_PLATFORM_IPI_VECTOR 0xf7
   --  unsupported macro: POSTED_INTR_VECTOR 0xf2
   --  unsupported macro: IRQ_WORK_VECTOR 0xf6
   --  unsupported macro: UV_BAU_MESSAGE 0xf5
   --  unsupported macro: HYPERVISOR_CALLBACK_VECTOR 0xf3
   --  unsupported macro: LOCAL_TIMER_VECTOR 0xef
   --  unsupported macro: NR_VECTORS 256
   --  unsupported macro: FPU_IRQ 13
   --  unsupported macro: FIRST_VM86_IRQ 3
   --  unsupported macro: LAST_VM86_IRQ 15
   --  unsupported macro: NR_IRQS_LEGACY 16
   --  unsupported macro: IO_APIC_VECTOR_LIMIT ( 32 * MAX_IO_APICS )
   --  unsupported macro: CPU_VECTOR_LIMIT (64 * NR_CPUS)
   --  unsupported macro: NR_IRQS (CPU_VECTOR_LIMIT > IO_APIC_VECTOR_LIMIT ? (NR_VECTORS + CPU_VECTOR_LIMIT) : (NR_VECTORS + IO_APIC_VECTOR_LIMIT))
  -- * Linux IRQ vector layout.
  -- *
  -- * There are 256 IDT entries (per CPU - each entry is 8 bytes) which can
  -- * be defined by Linux. They are used as a jump table by the CPU when a
  -- * given vector is triggered - by a CPU-external, CPU-internal or
  -- * software-triggered event.
  -- *
  -- * Linux sets the kernel code address each entry jumps to early during
  -- * bootup, and never changes them. This is the general layout of the
  -- * IDT entries:
  -- *
  -- *  Vectors   0 ...  31 : system traps and exceptions - hardcoded events
  -- *  Vectors  32 ... 127 : device interrupts
  -- *  Vector  128         : legacy int80 syscall interface
  -- *  Vectors 129 ... INVALIDATE_TLB_VECTOR_START-1 except 204 : device interrupts
  -- *  Vectors INVALIDATE_TLB_VECTOR_START ... 255 : special interrupts
  -- *
  -- * 64-bit x86 has per CPU IDT tables, 32-bit has one shared IDT table.
  -- *
  -- * This file enumerates the exact layout of them:
  --  

  -- * IDT vectors usable for external interrupt sources start at 0x20.
  -- * (0x80 is the syscall vector, 0x30-0x3f are for ISA)
  --  

  -- * We start allocating at 0x21 to spread out vectors evenly between
  -- * priority levels. (0x80 is the syscall vector)
  --  

  -- * Reserve the lowest usable vector (and hence lowest priority)  0x20 for
  -- * triggering cleanup after irq migration. 0x21-0x2f will still be used
  -- * for device interrupts.
  --  

  -- * Vectors 0x30-0x3f are used for ISA interrupts.
  -- *   round up to the next 16-vector boundary
  --  

  -- * Special IRQ vectors used by the SMP architecture, 0xf0-0xff
  -- *
  -- *  some of the following vectors are 'rare', they are merged
  -- *  into a single vector (CALL_FUNCTION_VECTOR) to save vector space.
  -- *  TLB, reschedule and local APIC vectors are performance-critical.
  --  

  -- * Sanity check
  --  

  -- * Generic system vector for platform specific use
  --  

  -- Vector for KVM to deliver posted interrupt IPI  
  -- * IRQ work vector:
  --  

  -- Vector on which hypervisor callbacks will be delivered  
  -- * Local APIC timer IRQ vector is on a different priority level,
  -- * to work around the 'lost local interrupt if more than 2 IRQ
  -- * sources per level' errata.
  --  

   function invalid_vm86_irq (irq : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/irq_vectors.h:135
   pragma Import (CPP, invalid_vm86_irq, "_ZL16invalid_vm86_irqi");

  -- * Size the maximum number of interrupts.
  -- *
  -- * If the irq_desc[] array has a sparse layout, we can size things
  -- * generously - it scales up linearly with the maximum number of CPUs,
  -- * and the maximum number of IO-APICs, whichever is higher.
  -- *
  -- * In other cases we size more conservatively, to not create too large
  -- * static arrays.
  --  

end asm_irq_vectors_h;

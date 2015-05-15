pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package asm_nops_h is

   --  unsupported macro: NOP_DS_PREFIX 0x3e
   --  unsupported macro: GENERIC_NOP1 0x90
   --  unsupported macro: GENERIC_NOP2 0x89,0xf6
   --  unsupported macro: GENERIC_NOP3 0x8d,0x76,0x00
   --  unsupported macro: GENERIC_NOP4 0x8d,0x74,0x26,0x00
   --  unsupported macro: GENERIC_NOP5 GENERIC_NOP1,GENERIC_NOP4
   --  unsupported macro: GENERIC_NOP6 0x8d,0xb6,0x00,0x00,0x00,0x00
   --  unsupported macro: GENERIC_NOP7 0x8d,0xb4,0x26,0x00,0x00,0x00,0x00
   --  unsupported macro: GENERIC_NOP8 GENERIC_NOP1,GENERIC_NOP7
   --  unsupported macro: GENERIC_NOP5_ATOMIC NOP_DS_PREFIX,GENERIC_NOP4
   --  unsupported macro: K8_NOP1 GENERIC_NOP1
   --  unsupported macro: K8_NOP2 0x66,K8_NOP1
   --  unsupported macro: K8_NOP3 0x66,K8_NOP2
   --  unsupported macro: K8_NOP4 0x66,K8_NOP3
   --  unsupported macro: K8_NOP5 K8_NOP3,K8_NOP2
   --  unsupported macro: K8_NOP6 K8_NOP3,K8_NOP3
   --  unsupported macro: K8_NOP7 K8_NOP4,K8_NOP3
   --  unsupported macro: K8_NOP8 K8_NOP4,K8_NOP4
   --  unsupported macro: K8_NOP5_ATOMIC 0x66,K8_NOP4
   --  unsupported macro: K7_NOP1 GENERIC_NOP1
   --  unsupported macro: K7_NOP2 0x8b,0xc0
   --  unsupported macro: K7_NOP3 0x8d,0x04,0x20
   --  unsupported macro: K7_NOP4 0x8d,0x44,0x20,0x00
   --  unsupported macro: K7_NOP5 K7_NOP4,K7_NOP1
   --  unsupported macro: K7_NOP6 0x8d,0x80,0,0,0,0
   --  unsupported macro: K7_NOP7 0x8D,0x04,0x05,0,0,0,0
   --  unsupported macro: K7_NOP8 K7_NOP7,K7_NOP1
   --  unsupported macro: K7_NOP5_ATOMIC NOP_DS_PREFIX,K7_NOP4
   --  unsupported macro: P6_NOP1 GENERIC_NOP1
   --  unsupported macro: P6_NOP2 0x66,0x90
   --  unsupported macro: P6_NOP3 0x0f,0x1f,0x00
   --  unsupported macro: P6_NOP4 0x0f,0x1f,0x40,0
   --  unsupported macro: P6_NOP5 0x0f,0x1f,0x44,0x00,0
   --  unsupported macro: P6_NOP6 0x66,0x0f,0x1f,0x44,0x00,0
   --  unsupported macro: P6_NOP7 0x0f,0x1f,0x80,0,0,0,0
   --  unsupported macro: P6_NOP8 0x0f,0x1f,0x84,0x00,0,0,0,0
   --  unsupported macro: P6_NOP5_ATOMIC P6_NOP5
   --  unsupported macro: ASM_NOP1 _ASM_MK_NOP(K8_NOP1)
   --  unsupported macro: ASM_NOP2 _ASM_MK_NOP(K8_NOP2)
   --  unsupported macro: ASM_NOP3 _ASM_MK_NOP(K8_NOP3)
   --  unsupported macro: ASM_NOP4 _ASM_MK_NOP(K8_NOP4)
   --  unsupported macro: ASM_NOP5 _ASM_MK_NOP(K8_NOP5)
   --  unsupported macro: ASM_NOP6 _ASM_MK_NOP(K8_NOP6)
   --  unsupported macro: ASM_NOP7 _ASM_MK_NOP(K8_NOP7)
   --  unsupported macro: ASM_NOP8 _ASM_MK_NOP(K8_NOP8)
   --  unsupported macro: ASM_NOP5_ATOMIC _ASM_MK_NOP(K8_NOP5_ATOMIC)
   --  unsupported macro: ASM_NOP_MAX 8
   --  unsupported macro: NOP_ATOMIC5 (ASM_NOP_MAX+1)
  -- * Define nops for use with alternative() and for tracing.
  -- *
  -- * *_NOP5_ATOMIC must be a single instruction.
  --  

  -- generic versions from gas
  --   1: nop
  --   the following instructions are NOT nops in 64-bit mode,
  --   for 64-bit mode use K8 or P6 nops instead
  --   2: movl %esi,%esi
  --   3: leal 0x00(%esi),%esi
  --   4: leal 0x00(,%esi,1),%esi
  --   6: leal 0x00000000(%esi),%esi
  --   7: leal 0x00000000(,%esi,1),%esi
  -- 

  -- Opteron 64bit nops
  --   1: nop
  --   2: osp nop
  --   3: osp osp nop
  --   4: osp osp osp nop
  -- 

  -- K7 nops
  --   uses eax dependencies (arbitrary choice)
  --   1: nop
  --   2: movl %eax,%eax
  --   3: leal (,%eax,1),%eax
  --   4: leal 0x00(,%eax,1),%eax
  --   6: leal 0x00000000(%eax),%eax
  --   7: leal 0x00000000(,%eax,1),%eax
  -- 

  -- P6 nops
  --   uses eax dependencies (Intel-recommended choice)
  --   1: nop
  --   2: osp nop
  --   3: nopl (%eax)
  --   4: nopl 0x00(%eax)
  --   5: nopl 0x00(%eax,%eax,1)
  --   6: osp nopl 0x00(%eax,%eax,1)
  --   7: nopl 0x00000000(%eax)
  --   8: nopl 0x00000000(%eax,%eax,1)
  --   Note: All the above are assumed to be a single instruction.
  --	There is kernel code that depends on this.
  -- 

   ideal_nops : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/nops.h:142
   pragma Import (C, ideal_nops, "ideal_nops");

   procedure arch_init_ideal_nops;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/nops.h:143
   pragma Import (CPP, arch_init_ideal_nops, "_Z20arch_init_ideal_nopsv");

end asm_nops_h;

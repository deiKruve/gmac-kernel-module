pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
limited with asm_processor_h;

package asm_archrandom_h is

   --  unsupported macro: RDRAND_RETRY_LOOPS 10
   --  unsupported macro: RDRAND_INT ".byte 0x0f,0xc7,0xf0"
   --  unsupported macro: RDSEED_INT ".byte 0x0f,0xc7,0xf8"
   --  unsupported macro: RDRAND_LONG ".byte 0x48,0x0f,0xc7,0xf0"
   --  unsupported macro: RDSEED_LONG ".byte 0x48,0x0f,0xc7,0xf8"
   --  arg-macro: procedure GET_RANDOM static inline int name(type *v) { int ok; alternative_io("movl $0, %0\n\t" nop, "\n1: " rdrand "\n\t" "jc 2f\n\t" "decl %0\n\t" "jnz 1b\n\t" "2:", X86_FEATURE_RDRAND, ASM_OUTPUT2("=r" (ok), "=a" (*v)), "0" (RDRAND_RETRY_LOOPS)); return ok; }
   --    static inline int name(type *v) { int ok; alternative_io("movl $0, %0\n\t" nop, "\n1: " rdrand "\n\t" "jc 2f\n\t" "decl %0\n\t" "jnz 1b\n\t" "2:", X86_FEATURE_RDRAND, ASM_OUTPUT2("=r" (ok), "=a" (*v)), "0" (RDRAND_RETRY_LOOPS)); return ok; }
   --  arg-macro: procedure GET_SEED static inline int name(type *v) { unsigned char ok; alternative_io("movb $0, %0\n\t" nop, rdseed "\n\t" "setc %0", X86_FEATURE_RDSEED, ASM_OUTPUT2("=q" (ok), "=a" (*v))); return ok; }
   --    static inline int name(type *v) { unsigned char ok; alternative_io("movb $0, %0\n\t" nop, rdseed "\n\t" "setc %0", X86_FEATURE_RDSEED, ASM_OUTPUT2("=q" (ok), "=a" (*v))); return ok; }
   --  arg-macro: procedure arch_has_random static_cpu_has(X86_FEATURE_RDRAND)
   --    static_cpu_has(X86_FEATURE_RDRAND)
   --  arg-macro: procedure arch_has_random_seed static_cpu_has(X86_FEATURE_RDSEED)
   --    static_cpu_has(X86_FEATURE_RDSEED)
  -- * This file is part of the Linux kernel.
  -- *
  -- * Copyright (c) 2011-2014, Intel Corporation
  -- * Authors: Fenghua Yu <fenghua.yu@intel.com>,
  -- *          H. Peter Anvin <hpa@linux.intel.com>
  -- *
  -- * This program is free software; you can redistribute it and/or modify it
  -- * under the terms and conditions of the GNU General Public License,
  -- * version 2, as published by the Free Software Foundation.
  -- *
  -- * This program is distributed in the hope it will be useful, but WITHOUT
  -- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  -- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  -- * more details.
  -- *
  -- * You should have received a copy of the GNU General Public License along with
  -- * this program; if not, write to the Free Software Foundation, Inc.,
  -- * 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
  -- *
  --  

  -- Instead of arch_get_random_long() when alternatives haven't run.  
   function rdrand_long (v : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/archrandom.h:46
   pragma Import (CPP, rdrand_long, "_ZL11rdrand_longPm");

  -- A single attempt at RDSEED  
   function rdseed_long (v : access unsigned_long) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/archrandom.h:60
   pragma Import (CPP, rdseed_long, "_ZL11rdseed_longPm");

   function arch_get_random_long (v : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/archrandom.h:101
   pragma Import (CPP, arch_get_random_long, "_ZL20arch_get_random_longPm");

   function arch_get_random_int (v : access unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/archrandom.h:102
   pragma Import (CPP, arch_get_random_int, "_ZL19arch_get_random_intPj");

   function arch_get_random_seed_long (v : access unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/archrandom.h:104
   pragma Import (CPP, arch_get_random_seed_long, "_ZL25arch_get_random_seed_longPm");

   function arch_get_random_seed_int (v : access unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/archrandom.h:105
   pragma Import (CPP, arch_get_random_seed_int, "_ZL24arch_get_random_seed_intPj");

   procedure x86_init_rdrand (c : access asm_processor_h.cpuinfo_x86);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/archrandom.h:134
   pragma Import (CPP, x86_init_rdrand, "_Z15x86_init_rdrandP11cpuinfo_x86");

end asm_archrandom_h;

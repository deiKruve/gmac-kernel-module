pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package asm_arch_hweight_h is

   --  unsupported macro: POPCNT32 ".byte 0xf3,0x40,0x0f,0xb8,0xc7"
   --  unsupported macro: POPCNT64 ".byte 0xf3,0x48,0x0f,0xb8,0xc7"
   --  unsupported macro: REG_IN "D"
   --  unsupported macro: REG_OUT "a"
  -- popcnt %edi, %eax -- redundant REX prefix for alignment  
  -- popcnt %rdi, %rax  
  -- popcnt %eax, %eax  
  -- * __sw_hweightXX are called from within the alternatives below
  -- * and callee-clobbered registers need to be taken care of. See
  -- * ARCH_HWEIGHT_CFLAGS in <arch/x86/Kconfig> for the respective
  -- * compiler switches.
  --  

   --  skipped func __arch_hweight32

   --  skipped func __arch_hweight16

   --  skipped func __arch_hweight8

   --  skipped func __arch_hweight64

end asm_arch_hweight_h;

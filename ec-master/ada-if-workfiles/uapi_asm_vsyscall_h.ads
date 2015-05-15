pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uapi_asm_vsyscall_h is

   --  unsupported macro: VSYSCALL_ADDR (-10UL << 20)
   type vsyscall_num is 
     (uu_NR_vgettimeofday,
      uu_NR_vtime,
      uu_NR_vgetcpu);
   pragma Convention (C, vsyscall_num);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/vsyscall.h:4

end uapi_asm_vsyscall_h;

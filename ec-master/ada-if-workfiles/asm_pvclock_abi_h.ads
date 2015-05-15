pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package asm_pvclock_abi_h is

   --  unsupported macro: PVCLOCK_TSC_STABLE_BIT (1 << 0)
   --  unsupported macro: PVCLOCK_GUEST_STOPPED (1 << 1)
  -- * These structs MUST NOT be changed.
  -- * They are the ABI between hypervisor and guest OS.
  -- * Both Xen and KVM are using this.
  -- *
  -- * pvclock_vcpu_time_info holds the system time and the tsc timestamp
  -- * of the last update. So the guest can use the tsc delta to get a
  -- * more precise system time.  There is one per virtual cpu.
  -- *
  -- * pvclock_wall_clock references the point in time when the system
  -- * time was zero (usually boot time), thus the guest calculates the
  -- * current wall clock by adding the system time.
  -- *
  -- * Protocol for the "version" fields is: hypervisor raises it (making
  -- * it uneven) before it starts updating the fields and raises it again
  -- * (making it even) when it is done.  Thus the guest can make sure the
  -- * time values it got are consistent by checking the version before
  -- * and after reading them.
  --  

   type pvclock_vcpu_time_info_pad_array is array (0 .. 1) of aliased asm_generic_int_ll64_h.u8;
   type pvclock_vcpu_time_info is record
      version : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:26
      pad0 : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:27
      tsc_timestamp : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:28
      system_time : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:29
      tsc_to_system_mul : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:30
      tsc_shift : aliased asm_generic_int_ll64_h.s8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:31
      flags : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:32
      pad : aliased pvclock_vcpu_time_info_pad_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, pvclock_vcpu_time_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:25

  -- 32 bytes  
   type pvclock_wall_clock is record
      version : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:37
      sec : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:38
      nsec : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:39
   end record;
   pragma Convention (C_Pass_By_Copy, pvclock_wall_clock);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/pvclock-abi.h:36

end asm_pvclock_abi_h;

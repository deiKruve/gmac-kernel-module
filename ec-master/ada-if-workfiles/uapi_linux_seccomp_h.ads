pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_seccomp_h is

   --  unsupported macro: SECCOMP_MODE_DISABLED 0
   --  unsupported macro: SECCOMP_MODE_STRICT 1
   --  unsupported macro: SECCOMP_MODE_FILTER 2
   --  unsupported macro: SECCOMP_RET_KILL 0x00000000U
   --  unsupported macro: SECCOMP_RET_TRAP 0x00030000U
   --  unsupported macro: SECCOMP_RET_ERRNO 0x00050000U
   --  unsupported macro: SECCOMP_RET_TRACE 0x7ff00000U
   --  unsupported macro: SECCOMP_RET_ALLOW 0x7fff0000U
   --  unsupported macro: SECCOMP_RET_ACTION 0x7fff0000U
   --  unsupported macro: SECCOMP_RET_DATA 0x0000ffffU
  -- Valid values for seccomp.mode and prctl(PR_SET_SECCOMP, <mode>)  
  -- * All BPF programs must return a 32-bit value.
  -- * The bottom 16-bits are for optional return data.
  -- * The upper 16-bits are ordered from least permissive values to most.
  -- *
  -- * The ordering ensures that a min_t() over composed return values always
  -- * selects the least permissive choice.
  --  

  -- Masks for the return value sections.  
  --*
  -- * struct seccomp_data - the format the BPF program executes over.
  -- * @nr: the system call number
  -- * @arch: indicates system call convention as an AUDIT_ARCH_* value
  -- *        as defined in <linux/audit.h>.
  -- * @instruction_pointer: at the time of the system call.
  -- * @args: up to 6 system call arguments always stored as 64-bit values
  -- *        regardless of the architecture.
  --  

   type seccomp_data_args_array is array (0 .. 5) of aliased uapi_asm_generic_int_ll64_h.uu_u64;
   type seccomp_data is record
      nr : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/seccomp.h:41
      arch : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/seccomp.h:42
      instruction_pointer : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/seccomp.h:43
      args : aliased seccomp_data_args_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/seccomp.h:44
   end record;
   pragma Convention (C_Pass_By_Copy, seccomp_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/seccomp.h:40

end uapi_linux_seccomp_h;

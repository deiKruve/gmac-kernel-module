pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_posix_types_h;
with uapi_asm_generic_posix_types_h;

package uapi_asm_generic_ipcbuf_h is

  -- * The generic ipc64_perm structure:
  -- * Note extra padding because this structure is passed back and forth
  -- * between kernel and user space.
  -- *
  -- * ipc64_perm was originally meant to be architecture specific, but
  -- * everyone just ended up making identical copies without specific
  -- * optimizations, so we may just as well all use the same one.
  -- *
  -- * Pad space is left for:
  -- * - 32-bit mode_t on architectures that only had 16 bit
  -- * - 32-bit seq
  -- * - 2 miscellaneous 32-bit values
  --  

   type ipc64_perm_uu_pad1_array is array (0 .. -1) of aliased unsigned_char;
   type ipc64_perm is record
      key : aliased uapi_linux_posix_types_h.uu_kernel_key_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:20
      uid : aliased uapi_asm_generic_posix_types_h.uu_kernel_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:21
      gid : aliased uapi_asm_generic_posix_types_h.uu_kernel_gid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:22
      cuid : aliased uapi_asm_generic_posix_types_h.uu_kernel_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:23
      cgid : aliased uapi_asm_generic_posix_types_h.uu_kernel_gid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:24
      mode : aliased uapi_asm_generic_posix_types_h.uu_kernel_mode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:25
      uu_pad1 : aliased ipc64_perm_uu_pad1_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:27
      seq : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:28
      uu_pad2 : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:29
      uu_unused1 : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:30
      uu_unused2 : aliased uapi_asm_generic_posix_types_h.uu_kernel_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, ipc64_perm);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/ipcbuf.h:19

  -- pad if mode_t is u16:  
end uapi_asm_generic_ipcbuf_h;

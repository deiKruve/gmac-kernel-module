pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_asm_sigcontext_h is

   --  unsupported macro: FP_XSTATE_MAGIC1 0x46505853U
   --  unsupported macro: FP_XSTATE_MAGIC2 0x46505845U
   --  unsupported macro: FP_XSTATE_MAGIC2_SIZE sizeof(FP_XSTATE_MAGIC2)
  -- * bytes 464..511 in the current 512byte layout of fxsave/fxrstor frame
  -- * are reserved for SW usage. On cpu's supporting xsave/xrstor, these bytes
  -- * are used to extended the fpstate pointer in the sigcontext, which now
  -- * includes the extended state information along with fpstate information.
  -- *
  -- * Presence of FP_XSTATE_MAGIC1 at the beginning of this SW reserved
  -- * area and FP_XSTATE_MAGIC2 at the end of memory layout
  -- * (extended_size - FP_XSTATE_MAGIC2_SIZE) indicates the presence of the
  -- * extended state information in the memory layout pointed by the fpstate
  -- * pointer in sigcontext.
  --  

  -- FP_XSTATE_MAGIC1  
   type u_fpx_sw_bytes_padding_array is array (0 .. 6) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type u_fpx_sw_bytes is record
      magic1 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:24
      extended_size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:25
      xstate_bv : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:28
      xstate_size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:33
      padding : aliased u_fpx_sw_bytes_padding_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, u_fpx_sw_bytes);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:23

  -- total size of the layout referred by
  --				 * fpstate pointer in the sigcontext.
  --				  

  -- feature bit mask (including fp/sse/extended
  --				 * state) that is present in the memory
  --				 * layout.
  --				  

  -- actual xsave state size, based on the
  --				 * features saved in the layout.
  --				 * 'extended_size' will be greater than
  --				 * 'xstate_size'.
  --				  

  --  for future use.  
  -- * As documented in the iBCS2 standard..
  -- *
  -- * The first part of "struct _fpstate" is just the normal i387
  -- * hardware setup, the extra "status" word is used to save the
  -- * coprocessor status word before entering the handler.
  -- *
  -- * Pentium III FXSR, SSE support
  -- *	Gareth Hughes <gareth@valinux.com>, May 2000
  -- *
  -- * The FPU state data structure has had to grow to accommodate the
  -- * extended FPU state required by the Streaming SIMD Extensions.
  -- * There is no documented standard to accomplish this at the moment.
  --  

  -- Regular FPU environment  
  -- 0xffff = regular FPU data only  
  -- FXSR FPU environment  
  -- FXSR FPU env is ignored  
  -- FXSR FPU reg data is ignored  
  -- represents the extended
  --						   * state info  

  -- * User-space might still rely on the old definition:
  --  

  -- FXSAVE frame  
  -- Note: reserved1/2 may someday contain valuable data. Always save/restore
  --   them when you change signal frames.  

   type u_fpstate_st_space_array is array (0 .. 31) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type u_fpstate_xmm_space_array is array (0 .. 63) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type u_fpstate_reserved2_array is array (0 .. 11) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type u_fpstate_reserved3_array is array (0 .. 11) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type anon_24 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            reserved3 : aliased u_fpstate_reserved3_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:150
         when others =>
            sw_reserved : aliased u_fpx_sw_bytes;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:151
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_24);
   pragma Unchecked_Union (anon_24);
   type u_fpstate is record
      cwd : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:137
      swd : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:138
      twd : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:139
      fop : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:141
      rip : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:142
      rdp : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:143
      mxcsr : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:144
      mxcsr_mask : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:145
      st_space : aliased u_fpstate_st_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:146
      xmm_space : aliased u_fpstate_xmm_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:147
      reserved2 : aliased u_fpstate_reserved2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:148
      field_12 : aliased anon_24;
   end record;
   pragma Convention (C_Pass_By_Copy, u_fpstate);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:136

  -- Note this is not the same as the
  --				   32bit/x87/FSAVE twd  

  -- 8*16 bytes for each FP-reg  
  -- 16*16 bytes for each XMM-reg   
  -- represents the extended
  --						   * state information  

  -- * User-space might still rely on the old definition:
  --  

  -- RFLAGS  
  -- zero when no FPU context  
   type u_xsave_hdr_reserved1_array is array (0 .. 1) of aliased uapi_asm_generic_int_ll64_h.uu_u64;
   type u_xsave_hdr_reserved2_array is array (0 .. 4) of aliased uapi_asm_generic_int_ll64_h.uu_u64;
   type u_xsave_hdr is record
      xstate_bv : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:198
      reserved1 : aliased u_xsave_hdr_reserved1_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:199
      reserved2 : aliased u_xsave_hdr_reserved2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:200
   end record;
   pragma Convention (C_Pass_By_Copy, u_xsave_hdr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:197

  -- 16 * 16 bytes for each YMMH-reg  
   type u_ymmh_state_ymmh_space_array is array (0 .. 63) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type u_ymmh_state is record
      ymmh_space : aliased u_ymmh_state_ymmh_space_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:205
   end record;
   pragma Convention (C_Pass_By_Copy, u_ymmh_state);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:203

  -- * Extended state pointed by the fpstate pointer in the sigcontext.
  -- * In addition to the fpstate, information encoded in the xstate_hdr
  -- * indicates the presence of other extended state information
  -- * supported by the processor and OS.
  --  

   type u_xstate is record
      fpstate : aliased u_fpstate;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:215
      xstate_hdr : aliased u_xsave_hdr;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:216
      ymmh : aliased u_ymmh_state;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:217
   end record;
   pragma Convention (C_Pass_By_Copy, u_xstate);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/sigcontext.h:214

  -- new processor state extensions go here  
end uapi_asm_sigcontext_h;

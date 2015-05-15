pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package asm_realmode_h is

  -- This must match data at realmode.S  
   type real_mode_header is record
      text_start : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:9
      ro_end : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:10
      trampoline_start : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:12
      trampoline_status : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:13
      trampoline_header : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:14
      trampoline_pgd : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:16
      wakeup_start : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:20
      wakeup_header : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:21
      machine_real_restart_asm : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:24
      machine_real_restart_seg : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, real_mode_header);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:8

  -- SMP trampoline  
  -- ACPI S3 wakeup  
  -- APM/BIOS reboot  
  -- This must match data at trampoline_32/64.S  
   type trampoline_header is record
      start : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:38
      efer : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:39
      cr4 : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:40
   end record;
   pragma Convention (C_Pass_By_Copy, trampoline_header);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:31

   real_mode_header : access real_mode_header;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:44
   pragma Import (C, real_mode_header, "real_mode_header");

   real_mode_blob_end : aliased array (size_t) of aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:45
   pragma Import (C, real_mode_blob_end, "real_mode_blob_end");

   init_rsp : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:47
   pragma Import (C, init_rsp, "init_rsp");

   initial_code : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:48
   pragma Import (C, initial_code, "initial_code");

   initial_gs : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:49
   pragma Import (C, initial_gs, "initial_gs");

   real_mode_blob : aliased array (size_t) of aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:51
   pragma Import (C, real_mode_blob, "real_mode_blob");

   real_mode_relocs : aliased array (size_t) of aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:52
   pragma Import (C, real_mode_relocs, "real_mode_relocs");

   secondary_startup_64 : aliased array (size_t) of aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:58
   pragma Import (C, secondary_startup_64, "secondary_startup_64");

   procedure reserve_real_mode;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:61
   pragma Import (CPP, reserve_real_mode, "_Z17reserve_real_modev");

   procedure setup_real_mode;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/realmode.h:62
   pragma Import (CPP, setup_real_mode, "_Z15setup_real_modev");

end asm_realmode_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;
with uapi_asm_e820_h;
with uapi_linux_edd_h;
with uapi_linux_screen_info_h;
with uapi_linux_apm_bios_h;
with uapi_asm_ist_h;
with uapi_video_edid_h;

package uapi_asm_bootparam_h is

   --  unsupported macro: SETUP_NONE 0
   --  unsupported macro: SETUP_E820_EXT 1
   --  unsupported macro: SETUP_DTB 2
   --  unsupported macro: SETUP_PCI 3
   --  unsupported macro: SETUP_EFI 4
   --  unsupported macro: RAMDISK_IMAGE_START_MASK 0x07FF
   --  unsupported macro: RAMDISK_PROMPT_FLAG 0x8000
   --  unsupported macro: RAMDISK_LOAD_FLAG 0x4000
   --  unsupported macro: LOADED_HIGH (1<<0)
   --  unsupported macro: QUIET_FLAG (1<<5)
   --  unsupported macro: KEEP_SEGMENTS (1<<6)
   --  unsupported macro: CAN_USE_HEAP (1<<7)
   --  unsupported macro: XLF_KERNEL_64 (1<<0)
   --  unsupported macro: XLF_CAN_BE_LOADED_ABOVE_4G (1<<1)
   --  unsupported macro: XLF_EFI_HANDOVER_32 (1<<2)
   --  unsupported macro: XLF_EFI_HANDOVER_64 (1<<3)
   --  unsupported macro: XLF_EFI_KEXEC (1<<4)
  -- setup_data types  
  -- ram_size flags  
  -- loadflags  
  -- xloadflags  
  -- extensible setup data list node  
   type setup_data_data_array is array (0 .. -1) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type setup_data is record
      next : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:41
      c_type : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:42
      len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:43
      data : aliased setup_data_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:44
   end record;
   pragma Convention (C_Pass_By_Copy, setup_data);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:40

   type setup_header is record
      setup_sects : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:48
      root_flags : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:49
      syssize : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:50
      ram_size : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:51
      vid_mode : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:52
      root_dev : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:53
      boot_flag : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:54
      jump : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:55
      header : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:56
      version : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:57
      realmode_swtch : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:58
      start_sys : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:59
      kernel_version : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:60
      type_of_loader : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:61
      loadflags : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:62
      setup_move_size : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:63
      code32_start : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:64
      ramdisk_image : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:65
      ramdisk_size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:66
      bootsect_kludge : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:67
      heap_end_ptr : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:68
      ext_loader_ver : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:69
      ext_loader_type : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:70
      cmd_line_ptr : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:71
      initrd_addr_max : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:72
      kernel_alignment : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:73
      relocatable_kernel : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:74
      min_alignment : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:75
      xloadflags : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:76
      cmdline_size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:77
      hardware_subarch : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:78
      hardware_subarch_data : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:79
      payload_offset : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:80
      payload_length : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:81
      setup_data : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:82
      pref_address : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:83
      init_size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:84
      handover_offset : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:85
   end record;
   pragma Convention (C_Pass_By_Copy, setup_header);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:47

   type sys_desc_table_table_array is array (0 .. 13) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type sys_desc_table is record
      length : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:89
      table : aliased sys_desc_table_table_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:90
   end record;
   pragma Convention (C_Pass_By_Copy, sys_desc_table);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:88

  -- Gleaned from OFW's set-parameters in cpu/x86/pc/linux.fth  
  -- OFW signature  
   type olpc_ofw_header is record
      ofw_magic : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:95
      ofw_version : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:96
      cif_handler : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:97
      irq_desc_table : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:98
   end record;
   pragma Convention (C_Pass_By_Copy, olpc_ofw_header);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:94

  -- callback into OFW  
   type efi_info is record
      efi_loader_signature : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:102
      efi_systab : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:103
      efi_memdesc_size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:104
      efi_memdesc_version : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:105
      efi_memmap : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:106
      efi_memmap_size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:107
      efi_systab_hi : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:108
      efi_memmap_hi : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:109
   end record;
   pragma Convention (C_Pass_By_Copy, efi_info);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:101

  -- The so-called "zeropage"  
  -- 0x000  
   type boot_params_u_pad2_array is array (0 .. 3) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type boot_params_u_pad3_array is array (0 .. 15) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type boot_params_hd0_info_array is array (0 .. 15) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type boot_params_hd1_info_array is array (0 .. 15) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type boot_params_u_pad4_array is array (0 .. 115) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type boot_params_u_pad5_array is array (0 .. 2) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type boot_params_u_pad6_array is array (0 .. 0) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type boot_params_u_pad7_array is array (0 .. 39) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type boot_params_edd_mbr_sig_buffer_array is array (0 .. 15) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type boot_params_e820_map_array is array (0 .. 127) of aliased uapi_asm_e820_h.e820entry;
   type boot_params_u_pad8_array is array (0 .. 47) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type boot_params_eddbuf_array is array (0 .. 5) of aliased uapi_linux_edd_h.edd_info;
   type boot_params_u_pad9_array is array (0 .. 275) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type boot_params is record
      the_screen_info : aliased uapi_linux_screen_info_h.screen_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:114
      the_apm_bios_info : aliased uapi_linux_apm_bios_h.apm_bios_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:115
      u_pad2 : aliased boot_params_u_pad2_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:116
      tboot_addr : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:117
      the_ist_info : aliased uapi_asm_ist_h.ist_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:118
      u_pad3 : aliased boot_params_u_pad3_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:119
      hd0_info : aliased boot_params_hd0_info_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:120
      hd1_info : aliased boot_params_hd1_info_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:121
      the_sys_desc_table : aliased sys_desc_table;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:122
      the_olpc_ofw_header : aliased olpc_ofw_header;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:123
      ext_ramdisk_image : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:124
      ext_ramdisk_size : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:125
      ext_cmd_line_ptr : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:126
      u_pad4 : aliased boot_params_u_pad4_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:127
      the_edid_info : aliased uapi_video_edid_h.edid_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:128
      the_efi_info : aliased efi_info;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:129
      alt_mem_k : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:130
      scratch : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:131
      e820_entries : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:132
      eddbuf_entries : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:133
      edd_mbr_sig_buf_entries : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:134
      kbd_status : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:135
      u_pad5 : aliased boot_params_u_pad5_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:136
      sentinel : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:148
      u_pad6 : aliased boot_params_u_pad6_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:149
      hdr : aliased setup_header;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:150
      u_pad7 : aliased boot_params_u_pad7_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:151
      edd_mbr_sig_buffer : aliased boot_params_edd_mbr_sig_buffer_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:152
      e820_map : aliased boot_params_e820_map_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:153
      u_pad8 : aliased boot_params_u_pad8_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:154
      eddbuf : aliased boot_params_eddbuf_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:155
      u_pad9 : aliased boot_params_u_pad9_array;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:156
   end record;
   pragma Convention (C_Pass_By_Copy, boot_params);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/uapi/asm/bootparam.h:113

  -- 0x040  
  -- 0x054  
  -- 0x058  
  -- 0x060  
  -- 0x070  
  -- obsolete!  
  -- 0x080  
  -- obsolete!  
  -- 0x090  
  -- 0x0a0  
  -- 0x0b0  
  -- 0x0c0  
  -- 0x0c4  
  -- 0x0c8  
  -- 0x0cc  
  -- 0x140  
  -- 0x1c0  
  -- 0x1e0  
  -- Scratch field!  
  -- 0x1e4  
  -- 0x1e8  
  -- 0x1e9  
  -- 0x1ea  
  -- 0x1eb  
  -- 0x1ec  
  --	 * The sentinel is set to a nonzero value (0xff) in header.S.
  --	 *
  --	 * A bootloader is supposed to only take setup_header and put
  --	 * it into a clean boot_params buffer. If it turns out that
  --	 * it is clumsy or too generous with the buffer, it most
  --	 * probably will pick up the sentinel variable too. The fact
  --	 * that this variable then is still 0xff will let kernel
  --	 * know that some variables in boot_params are invalid and
  --	 * kernel should zero out certain portions of boot_params.
  --	  

  -- 0x1ef  
  -- 0x1f0  
  -- setup header  
  -- 0x1f1  
  -- 0x290  
  -- 0x2d0  
  -- 0xcd0  
  -- 0xd00  
  -- 0xeec  
end uapi_asm_bootparam_h;

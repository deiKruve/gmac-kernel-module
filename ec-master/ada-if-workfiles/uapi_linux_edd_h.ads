pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_edd_h is

   --  unsupported macro: EDDNR 0x1e9
   --  unsupported macro: EDDBUF 0xd00
   --  unsupported macro: EDDMAXNR 6
   --  unsupported macro: EDDEXTSIZE 8
   --  unsupported macro: EDDPARMSIZE 74
   --  unsupported macro: CHECKEXTENSIONSPRESENT 0x41
   --  unsupported macro: GETDEVICEPARAMETERS 0x48
   --  unsupported macro: LEGACYGETDEVICEPARAMETERS 0x08
   --  unsupported macro: EDDMAGIC1 0x55AA
   --  unsupported macro: EDDMAGIC2 0xAA55
   --  unsupported macro: READ_SECTORS 0x02
   --  unsupported macro: EDD_MBR_SIG_OFFSET 0x1B8
   --  unsupported macro: EDD_MBR_SIG_BUF 0x290
   --  unsupported macro: EDD_MBR_SIG_MAX 16
   --  unsupported macro: EDD_MBR_SIG_NR_BUF 0x1ea
   --  unsupported macro: EDD_EXT_FIXED_DISK_ACCESS (1 << 0)
   --  unsupported macro: EDD_EXT_DEVICE_LOCKING_AND_EJECTING (1 << 1)
   --  unsupported macro: EDD_EXT_ENHANCED_DISK_DRIVE_SUPPORT (1 << 2)
   --  unsupported macro: EDD_EXT_64BIT_EXTENSIONS (1 << 3)
   --  unsupported macro: EDD_INFO_DMA_BOUNDARY_ERROR_TRANSPARENT (1 << 0)
   --  unsupported macro: EDD_INFO_GEOMETRY_VALID (1 << 1)
   --  unsupported macro: EDD_INFO_REMOVABLE (1 << 2)
   --  unsupported macro: EDD_INFO_WRITE_VERIFY (1 << 3)
   --  unsupported macro: EDD_INFO_MEDIA_CHANGE_NOTIFICATION (1 << 4)
   --  unsupported macro: EDD_INFO_LOCKABLE (1 << 5)
   --  unsupported macro: EDD_INFO_NO_MEDIA_PRESENT (1 << 6)
   --  unsupported macro: EDD_INFO_USE_INT13_FN50 (1 << 7)
  -- * linux/include/linux/edd.h
  -- *  Copyright (C) 2002, 2003, 2004 Dell Inc.
  -- *  by Matt Domsch <Matt_Domsch@dell.com>
  -- *
  -- * structures and definitions for the int 13h, ax={41,48}h
  -- * BIOS Enhanced Disk Drive Services
  -- * This is based on the T13 group document D1572 Revision 0 (August 14 2002)
  -- * available at http://www.t13.org/docs2002/d1572r0.pdf.  It is
  -- * very similar to D1484 Revision 3 http://www.t13.org/docs2002/d1484r3.pdf
  -- *
  -- * In a nutshell, arch/{i386,x86_64}/boot/setup.S populates a scratch
  -- * table in the boot_params that contains a list of BIOS-enumerated
  -- * boot devices.
  -- * In arch/{i386,x86_64}/kernel/setup.c, this information is
  -- * transferred into the edd structure, and in drivers/firmware/edd.c, that
  -- * information is used to identify BIOS boot disk.  The code in setup.S
  -- * is very sensitive to the size of these structures.
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License v2.0 as published by
  -- * the Free Software Foundation
  -- *
  -- * This program is distributed in the hope that it will be useful,
  -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  -- * GNU General Public License for more details.
  -- *
  --  

   type edd_device_params_host_bus_type_array is array (0 .. 3) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type edd_device_params_interface_type_array is array (0 .. 7) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type anon_49;
   type anon_50 is record
      base_address : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:88
      reserved1 : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:89
      reserved2 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:90
   end record;
   pragma Convention (C_Pass_By_Copy, anon_50);
   type anon_51 is record
      bus : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:93
      slot : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:94
      c_function : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:95
      channel : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:96
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:97
   end record;
   pragma Convention (C_Pass_By_Copy, anon_51);
   type anon_52 is record
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:101
   end record;
   pragma Convention (C_Pass_By_Copy, anon_52);
   type anon_53 is record
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:104
   end record;
   pragma Convention (C_Pass_By_Copy, anon_53);
   type anon_54 is record
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:107
   end record;
   pragma Convention (C_Pass_By_Copy, anon_54);
   type anon_55 is record
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:110
   end record;
   pragma Convention (C_Pass_By_Copy, anon_55);
   type anon_49 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            isa : aliased anon_50;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:91
         when 1 =>
            pci : aliased anon_51;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:98
         when 2 =>
            ibnd : aliased anon_52;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:102
         when 3 =>
            xprs : aliased anon_53;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:105
         when 4 =>
            htpt : aliased anon_54;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:108
         when others =>
            unknown : aliased anon_55;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:111
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_49);
   pragma Unchecked_Union (anon_49);
   type anon_56;
   type anon_57 is record
      device : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:115
      reserved1 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:116
      reserved2 : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:117
      reserved3 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:118
      reserved4 : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:119
   end record;
   pragma Convention (C_Pass_By_Copy, anon_57);
   type anon_58 is record
      device : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:122
      lun : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:123
      reserved1 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:124
      reserved2 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:125
      reserved3 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:126
      reserved4 : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:127
   end record;
   pragma Convention (C_Pass_By_Copy, anon_58);
   type anon_59 is record
      id : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:130
      lun : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:131
      reserved1 : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:132
      reserved2 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:133
   end record;
   pragma Convention (C_Pass_By_Copy, anon_59);
   type anon_60 is record
      serial_number : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:136
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:137
   end record;
   pragma Convention (C_Pass_By_Copy, anon_60);
   type anon_61 is record
      eui : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:140
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:141
   end record;
   pragma Convention (C_Pass_By_Copy, anon_61);
   type anon_62 is record
      wwid : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:144
      lun : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:145
   end record;
   pragma Convention (C_Pass_By_Copy, anon_62);
   type anon_63 is record
      identity_tag : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:148
      reserved : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:149
   end record;
   pragma Convention (C_Pass_By_Copy, anon_63);
   type anon_64 is record
      array_number : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:152
      reserved1 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:153
      reserved2 : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:154
   end record;
   pragma Convention (C_Pass_By_Copy, anon_64);
   type anon_65 is record
      device : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:157
      reserved1 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:158
      reserved2 : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:159
      reserved3 : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:160
      reserved4 : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:161
   end record;
   pragma Convention (C_Pass_By_Copy, anon_65);
   type anon_66 is record
      reserved1 : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:164
      reserved2 : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:165
   end record;
   pragma Convention (C_Pass_By_Copy, anon_66);
   type anon_56 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ata : aliased anon_57;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:120
         when 1 =>
            atapi : aliased anon_58;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:128
         when 2 =>
            scsi : aliased anon_59;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:134
         when 3 =>
            usb : aliased anon_60;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:138
         when 4 =>
            i1394 : aliased anon_61;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:142
         when 5 =>
            fibre : aliased anon_62;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:146
         when 6 =>
            i2o : aliased anon_63;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:150
         when 7 =>
            raid : aliased anon_64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:155
         when 8 =>
            sata : aliased anon_65;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:162
         when others =>
            unknown : aliased anon_66;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:166
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_56);
   pragma Unchecked_Union (anon_56);
   type edd_device_params is record
      length : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:72
      info_flags : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:73
      num_default_cylinders : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:74
      num_default_heads : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:75
      sectors_per_track : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:76
      number_of_sectors : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:77
      bytes_per_sector : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:78
      dpte_ptr : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:79
      key : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:80
      device_path_info_length : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:81
      reserved2 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:82
      reserved3 : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:83
      host_bus_type : aliased edd_device_params_host_bus_type_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:84
      interface_type : aliased edd_device_params_interface_type_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:85
      interface_path : anon_49;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:112
      device_path : anon_56;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:167
      reserved4 : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:168
      checksum : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:169
   end record;
   pragma Convention (C_Pass_By_Copy, edd_device_params);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:71

  -- 0xFFFFFFFF for our purposes  
  -- = 0xBEDD  
  -- = 44  
  -- pcix is same as pci  
   type edd_info is record
      device : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:173
      version : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:174
      interface_support : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:175
      legacy_max_cylinder : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:176
      legacy_max_head : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:177
      legacy_sectors_per_track : aliased uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:178
      params : aliased edd_device_params;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:179
   end record;
   pragma Convention (C_Pass_By_Copy, edd_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:172

   type edd_mbr_signature_array is array (0 .. 15) of aliased unsigned;
   type edd_edd_info_array is array (0 .. 5) of aliased edd_info;
   type edd is record
      mbr_signature : aliased edd_mbr_signature_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:183
      edd_info : aliased edd_edd_info_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:184
      mbr_signature_nr : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:185
      edd_info_nr : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:186
   end record;
   pragma Convention (C_Pass_By_Copy, edd);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/edd.h:182

end uapi_linux_edd_h;

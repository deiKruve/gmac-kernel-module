pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uapi_linux_hdlc_ioctl_h is

   --  unsupported macro: GENERIC_HDLC_VERSION 4
   --  unsupported macro: CLOCK_DEFAULT 0
   --  unsupported macro: CLOCK_EXT 1
   --  unsupported macro: CLOCK_INT 2
   --  unsupported macro: CLOCK_TXINT 3
   --  unsupported macro: CLOCK_TXFROMRX 4
   --  unsupported macro: ENCODING_DEFAULT 0
   --  unsupported macro: ENCODING_NRZ 1
   --  unsupported macro: ENCODING_NRZI 2
   --  unsupported macro: ENCODING_FM_MARK 3
   --  unsupported macro: ENCODING_FM_SPACE 4
   --  unsupported macro: ENCODING_MANCHESTER 5
   --  unsupported macro: PARITY_DEFAULT 0
   --  unsupported macro: PARITY_NONE 1
   --  unsupported macro: PARITY_CRC16_PR0 2
   --  unsupported macro: PARITY_CRC16_PR1 3
   --  unsupported macro: PARITY_CRC16_PR0_CCITT 4
   --  unsupported macro: PARITY_CRC16_PR1_CCITT 5
   --  unsupported macro: PARITY_CRC32_PR0_CCITT 6
   --  unsupported macro: PARITY_CRC32_PR1_CCITT 7
   --  unsupported macro: LMI_DEFAULT 0
   --  unsupported macro: LMI_NONE 1
   --  unsupported macro: LMI_ANSI 2
   --  unsupported macro: LMI_CCITT 3
   --  unsupported macro: LMI_CISCO 4
  -- bits per second  
   type sync_serial_settings is record
      clock_rate : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:40
      clock_type : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:41
      loopback : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:42
   end record;
   pragma Convention (C_Pass_By_Copy, sync_serial_settings);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:43

   --  skipped anonymous struct anon_167

  -- internal, external, TX-internal etc.  
  -- V.35, V.24, X.21  
  -- bits per second  
   type te1_settings is record
      clock_rate : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:46
      clock_type : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:47
      loopback : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:48
      slot_map : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:49
   end record;
   pragma Convention (C_Pass_By_Copy, te1_settings);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:50

   --  skipped anonymous struct anon_168

  -- internal, external, TX-internal etc.  
  -- T1, E1  
   type raw_hdlc_proto is record
      encoding : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:53
      parity : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:54
   end record;
   pragma Convention (C_Pass_By_Copy, raw_hdlc_proto);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:55

   --  skipped anonymous struct anon_169

   type fr_proto is record
      t391 : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:58
      t392 : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:59
      n391 : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:60
      n392 : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:61
      n393 : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:62
      lmi : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:63
      dce : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:64
   end record;
   pragma Convention (C_Pass_By_Copy, fr_proto);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:65

   --  skipped anonymous struct anon_170

  -- 1 for DCE (network side) operation  
   type fr_proto_pvc is record
      dlci : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:68
   end record;
   pragma Convention (C_Pass_By_Copy, fr_proto_pvc);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:69

   --  skipped anonymous struct anon_171

  -- for creating/deleting FR PVCs  
   subtype fr_proto_pvc_info_master_array is Interfaces.C.char_array (0 .. 15);
   type fr_proto_pvc_info is record
      dlci : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:72
      master : aliased fr_proto_pvc_info_master_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:73
   end record;
   pragma Convention (C_Pass_By_Copy, fr_proto_pvc_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:74

   --  skipped anonymous struct anon_172

  -- Name of master FRAD device  
  -- for returning PVC information only  
   type cisco_proto is record
      interval : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:77
      timeout : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, cisco_proto);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/hdlc/ioctl.h:79

   --  skipped anonymous struct anon_173

  -- PPP doesn't need any info now - supply length = 0 to ioctl  
end uapi_linux_hdlc_ioctl_h;

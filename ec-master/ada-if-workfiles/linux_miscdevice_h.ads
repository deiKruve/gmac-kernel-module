pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with linux_fs_h;
with linux_types_h;
limited with linux_device_h;

package linux_miscdevice_h is

   --  unsupported macro: PSMOUSE_MINOR 1
   --  unsupported macro: MS_BUSMOUSE_MINOR 2
   --  unsupported macro: ATIXL_BUSMOUSE_MINOR 3
   --  unsupported macro: ATARIMOUSE_MINOR 5
   --  unsupported macro: SUN_MOUSE_MINOR 6
   --  unsupported macro: APOLLO_MOUSE_MINOR 7
   --  unsupported macro: PC110PAD_MINOR 9
   --  unsupported macro: WATCHDOG_MINOR 130
   --  unsupported macro: TEMP_MINOR 131
   --  unsupported macro: RTC_MINOR 135
   --  unsupported macro: EFI_RTC_MINOR 136
   --  unsupported macro: VHCI_MINOR 137
   --  unsupported macro: SUN_OPENPROM_MINOR 139
   --  unsupported macro: DMAPI_MINOR 140
   --  unsupported macro: NVRAM_MINOR 144
   --  unsupported macro: SGI_MMTIMER 153
   --  unsupported macro: STORE_QUEUE_MINOR 155
   --  unsupported macro: I2O_MINOR 166
   --  unsupported macro: MICROCODE_MINOR 184
   --  unsupported macro: VFIO_MINOR 196
   --  unsupported macro: TUN_MINOR 200
   --  unsupported macro: CUSE_MINOR 203
   --  unsupported macro: MWAVE_MINOR 219
   --  unsupported macro: MPT_MINOR 220
   --  unsupported macro: MPT2SAS_MINOR 221
   --  unsupported macro: MPT3SAS_MINOR 222
   --  unsupported macro: UINPUT_MINOR 223
   --  unsupported macro: MISC_MCELOG_MINOR 227
   --  unsupported macro: HPET_MINOR 228
   --  unsupported macro: FUSE_MINOR 229
   --  unsupported macro: KVM_MINOR 232
   --  unsupported macro: BTRFS_MINOR 234
   --  unsupported macro: AUTOFS_MINOR 235
   --  unsupported macro: MAPPER_CTRL_MINOR 236
   --  unsupported macro: LOOP_CTRL_MINOR 237
   --  unsupported macro: VHOST_NET_MINOR 238
   --  unsupported macro: UHID_MINOR 239
   --  unsupported macro: MISC_DYNAMIC_MINOR 255
   --  arg-macro: procedure MODULE_ALIAS_MISCDEV MODULE_ALIAS("char-major-" __stringify(MISC_MAJOR) "-" __stringify(minor))
   --    MODULE_ALIAS("char-major-" __stringify(MISC_MAJOR) "-" __stringify(minor))
  -- *	These allocations are managed by device@lanana.org. If you use an
  -- *	entry that is not in assigned your entry may well be moved and
  -- *	reassigned, or set dynamic if a fixed value is not justified.
  --  

  --#define AMIGAMOUSE_MINOR	4	FIXME OBSOLETE  
  --#define ADB_MOUSE_MINOR	10	FIXME OBSOLETE  
   type miscdevice is record
      minor : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:57
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:58
      fops : access constant linux_fs_h.file_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:59
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:60
      parent : access linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:61
      this_device : access linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:62
      nodename : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:63
      mode : aliased linux_types_h.umode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:64
   end record;
   pragma Convention (C_Pass_By_Copy, miscdevice);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:56

   function misc_register (misc : access miscdevice) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:67
   pragma Import (CPP, misc_register, "_Z13misc_registerP10miscdevice");

   function misc_deregister (misc : access miscdevice) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/miscdevice.h:68
   pragma Import (CPP, misc_deregister, "_Z15misc_deregisterP10miscdevice");

end linux_miscdevice_h;

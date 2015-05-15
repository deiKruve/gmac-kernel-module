pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_apm_bios_h;

package linux_apm_bios_h is

   --  unsupported macro: APM_CS (GDT_ENTRY_APMBIOS_BASE * 8)
   --  unsupported macro: APM_CS_16 (APM_CS + 8)
   --  unsupported macro: APM_DS (APM_CS_16 + 8)
   --  unsupported macro: APM_16_BIT_SUPPORT 0x0001
   --  unsupported macro: APM_32_BIT_SUPPORT 0x0002
   --  unsupported macro: APM_IDLE_SLOWS_CLOCK 0x0004
   --  unsupported macro: APM_BIOS_DISABLED 0x0008
   --  unsupported macro: APM_BIOS_DISENGAGED 0x0010
   --  unsupported macro: APM_FUNC_INST_CHECK 0x5300
   --  unsupported macro: APM_FUNC_REAL_CONN 0x5301
   --  unsupported macro: APM_FUNC_16BIT_CONN 0x5302
   --  unsupported macro: APM_FUNC_32BIT_CONN 0x5303
   --  unsupported macro: APM_FUNC_DISCONN 0x5304
   --  unsupported macro: APM_FUNC_IDLE 0x5305
   --  unsupported macro: APM_FUNC_BUSY 0x5306
   --  unsupported macro: APM_FUNC_SET_STATE 0x5307
   --  unsupported macro: APM_FUNC_ENABLE_PM 0x5308
   --  unsupported macro: APM_FUNC_RESTORE_BIOS 0x5309
   --  unsupported macro: APM_FUNC_GET_STATUS 0x530a
   --  unsupported macro: APM_FUNC_GET_EVENT 0x530b
   --  unsupported macro: APM_FUNC_GET_STATE 0x530c
   --  unsupported macro: APM_FUNC_ENABLE_DEV_PM 0x530d
   --  unsupported macro: APM_FUNC_VERSION 0x530e
   --  unsupported macro: APM_FUNC_ENGAGE_PM 0x530f
   --  unsupported macro: APM_FUNC_GET_CAP 0x5310
   --  unsupported macro: APM_FUNC_RESUME_TIMER 0x5311
   --  unsupported macro: APM_FUNC_RESUME_ON_RING 0x5312
   --  unsupported macro: APM_FUNC_TIMER 0x5313
   --  unsupported macro: APM_FUNC_DISABLE_TIMER 0
   --  unsupported macro: APM_FUNC_GET_TIMER 1
   --  unsupported macro: APM_FUNC_SET_TIMER 2
   --  unsupported macro: APM_FUNC_DISABLE_RING 0
   --  unsupported macro: APM_FUNC_ENABLE_RING 1
   --  unsupported macro: APM_FUNC_GET_RING 2
   --  unsupported macro: APM_FUNC_TIMER_DISABLE 0
   --  unsupported macro: APM_FUNC_TIMER_ENABLE 1
   --  unsupported macro: APM_FUNC_TIMER_GET 2
   --  unsupported macro: APM_DEVICE_BALL ((apm_info.connection_version > 0x0100) ? APM_DEVICE_ALL : APM_DEVICE_OLD_ALL)
  -- * Include file for the interface to an APM BIOS
  -- * Copyright 1994-2001 Stephen Rothwell (sfr@canb.auug.org.au)
  -- *
  -- * This program is free software; you can redistribute it and/or modify it
  -- * under the terms of the GNU General Public License as published by the
  -- * Free Software Foundation; either version 2, or (at your option) any
  -- * later version.
  -- *
  -- * This program is distributed in the hope that it will be useful, but
  -- * WITHOUT ANY WARRANTY; without even the implied warranty of
  -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  -- * General Public License for more details.
  --  

  -- Results of APM Installation Check  
  -- * Data for APM that is persistent across module unload/load
  --  

   type apm_info is record
      bios : aliased uapi_linux_apm_bios_h.apm_bios_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/apm_bios.h:36
      connection_version : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/apm_bios.h:37
      get_power_status_broken : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/apm_bios.h:38
      get_power_status_swabinminutes : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/apm_bios.h:39
      allow_ints : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/apm_bios.h:40
      forbid_idle : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/apm_bios.h:41
      realmode_power_off : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/apm_bios.h:42
      disabled : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/apm_bios.h:43
   end record;
   pragma Convention (C_Pass_By_Copy, apm_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/apm_bios.h:35

  -- * The APM function codes
  --  

  -- * Function code for APM_FUNC_RESUME_TIMER
  --  

  -- * Function code for APM_FUNC_RESUME_ON_RING
  --  

  -- * Function code for APM_FUNC_TIMER_STATUS
  --  

  -- * in arch/i386/kernel/setup.c
  --  

   apm_info : aliased apm_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/apm_bios.h:94
   pragma Import (C, apm_info, "apm_info");

  -- * This is the "All Devices" ID communicated to the BIOS
  --  

end linux_apm_bios_h;

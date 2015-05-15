pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with linux_device_h;

package linux_pinctrl_devinfo_h is

  -- * Per-device information from the pin control system.
  -- * This is the stuff that get included into the device
  -- * core.
  -- *
  -- * Copyright (C) 2012 ST-Ericsson SA
  -- * Written on behalf of Linaro for ST-Ericsson
  -- * This interface is used in the core to keep track of pins.
  -- *
  -- * Author: Linus Walleij <linus.walleij@linaro.org>
  -- *
  -- * License terms: GNU General Public License (GPL) version 2
  --  

  -- The device core acts as a consumer toward pinctrl  
  --*
  -- * struct dev_pin_info - pin state container for devices
  -- * @p: pinctrl handle for the containing device
  -- * @default_state: the default state for the handle, if found
  --  

   type dev_pin_info is record
      p : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/devinfo.h:29
      default_state : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/devinfo.h:30
      sleep_state : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/devinfo.h:32
      idle_state : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/devinfo.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, dev_pin_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/devinfo.h:28

   function pinctrl_bind_pins (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/devinfo.h:37
   pragma Import (CPP, pinctrl_bind_pins, "_Z17pinctrl_bind_pinsP6device");

  -- Stubs if we're not using pinctrl  
end linux_pinctrl_devinfo_h;

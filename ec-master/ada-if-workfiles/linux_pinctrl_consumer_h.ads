pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_device_h;
with System;
with Interfaces.C.Strings;

package linux_pinctrl_consumer_h is

  -- * Consumer interface the pin control subsystem
  -- *
  -- * Copyright (C) 2012 ST-Ericsson SA
  -- * Written on behalf of Linaro for ST-Ericsson
  -- * Based on bits of regulator core, gpio core and clk core
  -- *
  -- * Author: Linus Walleij <linus.walleij@linaro.org>
  -- *
  -- * License terms: GNU General Public License (GPL) version 2
  --  

  -- This struct is private to the core and should be regarded as a cookie  
   --  skipped empty struct pinctrl

   --  skipped empty struct pinctrl_state

  -- External interface to pin control  
   function pinctrl_request_gpio (gpio : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:28
   pragma Import (CPP, pinctrl_request_gpio, "_Z20pinctrl_request_gpioj");

   procedure pinctrl_free_gpio (gpio : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:29
   pragma Import (CPP, pinctrl_free_gpio, "_Z17pinctrl_free_gpioj");

   function pinctrl_gpio_direction_input (gpio : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:30
   pragma Import (CPP, pinctrl_gpio_direction_input, "_Z28pinctrl_gpio_direction_inputj");

   function pinctrl_gpio_direction_output (gpio : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:31
   pragma Import (CPP, pinctrl_gpio_direction_output, "_Z29pinctrl_gpio_direction_outputj");

   function pinctrl_get (dev : access linux_device_h.device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:33
   pragma Import (CPP, pinctrl_get, "_Z11pinctrl_getP6device");

   procedure pinctrl_put (p : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:34
   pragma Import (CPP, pinctrl_put, "_Z11pinctrl_putP7pinctrl");

   function pinctrl_lookup_state (p : System.Address; name : Interfaces.C.Strings.chars_ptr) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:35
   pragma Import (CPP, pinctrl_lookup_state, "_Z20pinctrl_lookup_stateP7pinctrlPKc");

   function pinctrl_select_state (p : System.Address; s : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:38
   pragma Import (CPP, pinctrl_select_state, "_Z20pinctrl_select_stateP7pinctrlP13pinctrl_state");

   function devm_pinctrl_get (dev : access linux_device_h.device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:40
   pragma Import (CPP, devm_pinctrl_get, "_Z16devm_pinctrl_getP6device");

   procedure devm_pinctrl_put (p : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:41
   pragma Import (CPP, devm_pinctrl_put, "_Z16devm_pinctrl_putP7pinctrl");

   function pinctrl_pm_select_default_state (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:44
   pragma Import (CPP, pinctrl_pm_select_default_state, "_Z31pinctrl_pm_select_default_stateP6device");

   function pinctrl_pm_select_sleep_state (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:45
   pragma Import (CPP, pinctrl_pm_select_sleep_state, "_Z29pinctrl_pm_select_sleep_stateP6device");

   function pinctrl_pm_select_idle_state (dev : access linux_device_h.device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:46
   pragma Import (CPP, pinctrl_pm_select_idle_state, "_Z28pinctrl_pm_select_idle_stateP6device");

   function pinctrl_get_select (dev : access linux_device_h.device; name : Interfaces.C.Strings.chars_ptr) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:131
   pragma Import (CPP, pinctrl_get_select, "_ZL18pinctrl_get_selectP6devicePKc");

   function pinctrl_get_select_default (dev : access linux_device_h.device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:157
   pragma Import (CPP, pinctrl_get_select_default, "_ZL26pinctrl_get_select_defaultP6device");

   function devm_pinctrl_get_select (dev : access linux_device_h.device; name : Interfaces.C.Strings.chars_ptr) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:163
   pragma Import (CPP, devm_pinctrl_get_select, "_ZL23devm_pinctrl_get_selectP6devicePKc");

   function devm_pinctrl_get_select_default (dev : access linux_device_h.device) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/pinctrl/consumer.h:189
   pragma Import (CPP, devm_pinctrl_get_select_default, "_ZL31devm_pinctrl_get_select_defaultP6device");

end linux_pinctrl_consumer_h;

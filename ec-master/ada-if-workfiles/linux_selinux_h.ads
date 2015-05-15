pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package linux_selinux_h is

  -- * SELinux services exported to the rest of the kernel.
  -- *
  -- * Author: James Morris <jmorris@redhat.com>
  -- *
  -- * Copyright (C) 2005 Red Hat, Inc., James Morris <jmorris@redhat.com>
  -- * Copyright (C) 2006 Trusted Computer Solutions, Inc. <dgoeddel@trustedcs.com>
  -- * Copyright (C) 2006 IBM Corporation, Timothy R. Chavez <tinytim@us.ibm.com>
  -- *
  -- * This program is free software; you can redistribute it and/or modify
  -- * it under the terms of the GNU General Public License version 2,
  -- * as published by the Free Software Foundation.
  --  

   --  skipped empty struct selinux_audit_rule

   --  skipped empty struct audit_context

  --*
  -- * selinux_is_enabled - is SELinux enabled?
  --  

   function selinux_is_enabled return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/selinux.h:26
   pragma Import (CPP, selinux_is_enabled, "_Z18selinux_is_enabledv");

end linux_selinux_h;

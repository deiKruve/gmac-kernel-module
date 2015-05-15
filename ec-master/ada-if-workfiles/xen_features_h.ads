pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;

package xen_features_h is

  --*****************************************************************************
  -- * features.h
  -- *
  -- * Query the features reported by Xen.
  -- *
  -- * Copyright (c) 2006, Ian Campbell
  --  

   procedure xen_setup_features;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/features.h:14
   pragma Import (CPP, xen_setup_features, "_Z18xen_setup_featuresv");

   xen_features : aliased array (0 .. 31) of aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/features.h:16
   pragma Import (C, xen_features, "xen_features");

   function xen_feature (flag : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/features.h:18
   pragma Import (CPP, xen_feature, "_ZL11xen_featurei");

end xen_features_h;

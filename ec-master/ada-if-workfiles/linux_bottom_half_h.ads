pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_bottom_half_h is

   --  skipped func __local_bh_disable_ip

   procedure local_bh_disable;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bottom_half.h:17
   pragma Import (CPP, local_bh_disable, "_ZL16local_bh_disablev");

   --  skipped func _local_bh_enable

   --  skipped func __local_bh_enable_ip

   procedure local_bh_enable_ip (ip : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bottom_half.h:25
   pragma Import (CPP, local_bh_enable_ip, "_ZL18local_bh_enable_ipm");

   procedure local_bh_enable;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/bottom_half.h:30
   pragma Import (CPP, local_bh_enable, "_ZL15local_bh_enablev");

end linux_bottom_half_h;

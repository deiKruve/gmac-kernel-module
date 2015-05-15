pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package linux_if_link_h is

  -- We don't want this structure exposed to user space  
   type ifla_vf_info_mac_array is array (0 .. 31) of aliased uapi_asm_generic_int_ll64_h.uu_u8;
   type ifla_vf_info is record
      vf : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_link.h:9
      mac : aliased ifla_vf_info_mac_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_link.h:10
      vlan : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_link.h:11
      qos : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_link.h:12
      spoofchk : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_link.h:13
      linkstate : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_link.h:14
      min_tx_rate : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_link.h:15
      max_tx_rate : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_link.h:16
   end record;
   pragma Convention (C_Pass_By_Copy, ifla_vf_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/if_link.h:8

end linux_if_link_h;

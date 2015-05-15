pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_types_h;
with asm_generic_int_ll64_h;
limited with linux_skbuff_h;
with Interfaces.C.Extensions;

package net_flow_keys_h is

  -- (src,dst) must be grouped, in the same way than in IP header  
   type flow_keys_port16_array is array (0 .. 1) of aliased uapi_linux_types_h.uu_be16;
   type anon_302 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ports : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow_keys.h:9
         when others =>
            port16 : aliased flow_keys_port16_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow_keys.h:10
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_302);
   pragma Unchecked_Union (anon_302);
   type flow_keys is record
      src : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow_keys.h:6
      dst : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow_keys.h:7
      field_3 : aliased anon_302;
      thoff : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow_keys.h:12
      ip_proto : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow_keys.h:13
   end record;
   pragma Convention (C_Pass_By_Copy, flow_keys);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow_keys.h:4

   function skb_flow_dissect (skb : access constant linux_skbuff_h.sk_buff; flow : access flow_keys) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow_keys.h:16
   pragma Import (CPP, skb_flow_dissect, "_Z16skb_flow_dissectPK7sk_buffP9flow_keys");

   function skb_flow_get_ports
     (skb : access constant linux_skbuff_h.sk_buff;
      thoff : int;
      ip_proto : asm_generic_int_ll64_h.u8) return uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/flow_keys.h:17
   pragma Import (CPP, skb_flow_get_ports, "_Z18skb_flow_get_portsPK7sk_buffih");

end net_flow_keys_h;

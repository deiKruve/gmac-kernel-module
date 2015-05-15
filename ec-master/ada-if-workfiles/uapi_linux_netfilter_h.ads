pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;
with uapi_linux_types_h;
with uapi_linux_in_h;
with uapi_linux_in6_h;

package uapi_linux_netfilter_h is

   --  unsupported macro: NF_DROP 0
   --  unsupported macro: NF_ACCEPT 1
   --  unsupported macro: NF_STOLEN 2
   --  unsupported macro: NF_QUEUE 3
   --  unsupported macro: NF_REPEAT 4
   --  unsupported macro: NF_STOP 5
   --  unsupported macro: NF_MAX_VERDICT NF_STOP
   --  unsupported macro: NF_VERDICT_MASK 0x000000ff
   --  unsupported macro: NF_VERDICT_FLAG_QUEUE_BYPASS 0x00008000
   --  unsupported macro: NF_VERDICT_QMASK 0xffff0000
   --  unsupported macro: NF_VERDICT_QBITS 16
   --  arg-macro: function NF_QUEUE_NR ((((x) << 16) and NF_VERDICT_QMASK) or NF_QUEUE
   --    return (((x) << 16) and NF_VERDICT_QMASK) or NF_QUEUE;
   --  arg-macro: function NF_DROP_ERR (((-x) << 16) or NF_DROP
   --    return ((-x) << 16) or NF_DROP;
  -- Responses from hook functions.  
  -- we overload the higher bits for encoding auxiliary data such as the queue
  -- * number or errno values. Not nice, but better than additional function
  -- * arguments.  

  -- extra verdict flags have mask 0x0000ff00  
  -- queue number (NF_QUEUE) or errno (NF_DROP)  
  -- only for userspace compatibility  
  -- Generic cache responses from hook functions.
  --   <= 0x2000 is used for protocol-flags.  

  -- NF_VERDICT_BITS should be 8 now, but userspace might break if this changes  
   type nf_inet_hooks is 
     (NF_INET_PRE_ROUTING,
      NF_INET_LOCAL_IN,
      NF_INET_FORWARD,
      NF_INET_LOCAL_OUT,
      NF_INET_POST_ROUTING,
      NF_INET_NUMHOOKS);
   pragma Convention (C, nf_inet_hooks);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter.h:45

   type nf_inet_addr_c_all_array is array (0 .. 3) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type nf_inet_addr_ip6_array is array (0 .. 3) of aliased uapi_linux_types_h.uu_be32;
   type nf_inet_addr (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            c_all : aliased nf_inet_addr_c_all_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter.h:66
         when 1 =>
            ip : aliased uapi_linux_types_h.uu_be32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter.h:67
         when 2 =>
            ip6 : aliased nf_inet_addr_ip6_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter.h:68
         when 3 =>
            c_in : aliased uapi_linux_in_h.in_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter.h:69
         when others =>
            in6 : aliased uapi_linux_in6_h.in6_addr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter.h:70
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, nf_inet_addr);
   pragma Unchecked_Union (nf_inet_addr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netfilter.h:65

end uapi_linux_netfilter_h;

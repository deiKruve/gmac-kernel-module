pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with asm_generic_int_ll64_h;
with linux_u64_stats_sync_h;
with asm_generic_atomic_long_h;

package net_snmp_h is

   --  arg-macro: procedure SNMP_MIB_ITEM { .name := _name, .entry := _entry, }
   --    { .name := _name, .entry := _entry, }
   --  unsupported macro: SNMP_MIB_SENTINEL { .name = NULL, .entry = 0, }
   --  unsupported macro: IPSTATS_MIB_MAX __IPSTATS_MIB_MAX
   --  unsupported macro: ICMP_MIB_MAX __ICMP_MIB_MAX
   --  unsupported macro: ICMPMSG_MIB_MAX __ICMPMSG_MIB_MAX
   --  unsupported macro: ICMP6_MIB_MAX __ICMP6_MIB_MAX
   --  unsupported macro: ICMP6MSG_MIB_MAX __ICMP6MSG_MIB_MAX
   --  unsupported macro: TCP_MIB_MAX __TCP_MIB_MAX
   --  unsupported macro: UDP_MIB_MAX __UDP_MIB_MAX
   --  unsupported macro: LINUX_MIB_MAX __LINUX_MIB_MAX
   --  unsupported macro: LINUX_MIB_XFRMMAX __LINUX_MIB_XFRMMAX
   --  arg-macro: procedure DEFINE_SNMP_STAT __typeof__(type) __percpu *name
   --    __typeof__(type) __percpu *name
   --  arg-macro: procedure DEFINE_SNMP_STAT_ATOMIC __typeof__(type) *name
   --    __typeof__(type) *name
   --  arg-macro: procedure DECLARE_SNMP_STAT extern __typeof__(type) __percpu *name
   --    extern __typeof__(type) __percpu *name
   --  arg-macro: procedure SNMP_INC_STATS_BH __this_cpu_inc(mib.mibs(field))
   --    __this_cpu_inc(mib.mibs(field))
   --  arg-macro: procedure SNMP_INC_STATS_USER this_cpu_inc(mib.mibs(field))
   --    this_cpu_inc(mib.mibs(field))
   --  arg-macro: procedure SNMP_INC_STATS_ATOMIC_LONG atomic_long_inc(andmib.mibs(field))
   --    atomic_long_inc(andmib.mibs(field))
   --  arg-macro: procedure SNMP_INC_STATS this_cpu_inc(mib.mibs(field))
   --    this_cpu_inc(mib.mibs(field))
   --  arg-macro: procedure SNMP_DEC_STATS this_cpu_dec(mib.mibs(field))
   --    this_cpu_dec(mib.mibs(field))
   --  arg-macro: procedure SNMP_ADD_STATS_BH __this_cpu_add(mib.mibs(field), addend)
   --    __this_cpu_add(mib.mibs(field), addend)
   --  arg-macro: procedure SNMP_ADD_STATS_USER this_cpu_add(mib.mibs(field), addend)
   --    this_cpu_add(mib.mibs(field), addend)
   --  arg-macro: procedure SNMP_ADD_STATS this_cpu_add(mib.mibs(field), addend)
   --    this_cpu_add(mib.mibs(field), addend)
   --  unsupported macro: SNMP_UPD_PO_STATS(mib,basefield,addend) do { __typeof__(*mib->mibs) *ptr = mib->mibs; this_cpu_inc(ptr[basefield ##PKTS]); this_cpu_add(ptr[basefield ##OCTETS], addend); } while (0)
   --  unsupported macro: SNMP_UPD_PO_STATS_BH(mib,basefield,addend) do { __typeof__(*mib->mibs) *ptr = mib->mibs; __this_cpu_inc(ptr[basefield ##PKTS]); __this_cpu_add(ptr[basefield ##OCTETS], addend); } while (0)
   --  arg-macro: procedure SNMP_INC_STATS64_BH SNMP_INC_STATS_BH(mib, field)
   --    SNMP_INC_STATS_BH(mib, field)
   --  arg-macro: procedure SNMP_INC_STATS64_USER SNMP_INC_STATS_USER(mib, field)
   --    SNMP_INC_STATS_USER(mib, field)
   --  arg-macro: procedure SNMP_INC_STATS64 SNMP_INC_STATS(mib, field)
   --    SNMP_INC_STATS(mib, field)
   --  arg-macro: procedure SNMP_DEC_STATS64 SNMP_DEC_STATS(mib, field)
   --    SNMP_DEC_STATS(mib, field)
   --  arg-macro: procedure SNMP_ADD_STATS64_BH SNMP_ADD_STATS_BH(mib, field, addend)
   --    SNMP_ADD_STATS_BH(mib, field, addend)
   --  arg-macro: procedure SNMP_ADD_STATS64_USER SNMP_ADD_STATS_USER(mib, field, addend)
   --    SNMP_ADD_STATS_USER(mib, field, addend)
   --  arg-macro: procedure SNMP_ADD_STATS64 SNMP_ADD_STATS(mib, field, addend)
   --    SNMP_ADD_STATS(mib, field, addend)
   --  arg-macro: procedure SNMP_UPD_PO_STATS64 SNMP_UPD_PO_STATS(mib, basefield, addend)
   --    SNMP_UPD_PO_STATS(mib, basefield, addend)
   --  arg-macro: procedure SNMP_UPD_PO_STATS64_BH SNMP_UPD_PO_STATS_BH(mib, basefield, addend)
   --    SNMP_UPD_PO_STATS_BH(mib, basefield, addend)
  -- *
  -- *		SNMP MIB entries for the IP subsystem.
  -- *		
  -- *		Alan Cox <gw4pts@gw4pts.ampr.org>
  -- *
  -- *		We don't chose to implement SNMP in the kernel (this would
  -- *		be silly as SNMP is a pain in the backside in places). We do
  -- *		however need to collect the MIB statistics and export them
  -- *		out of /proc (eventually)
  -- *
  -- *		This program is free software; you can redistribute it and/or
  -- *		modify it under the terms of the GNU General Public License
  -- *		as published by the Free Software Foundation; either version
  -- *		2 of the License, or (at your option) any later version.
  -- *
  --  

  -- * Mibs are stored in array of unsigned long.
  --  

  -- * struct snmp_mib{}
  -- *  - list of entries for particular API (such as /proc/net/snmp)
  -- *  - name of entries.
  --  

   type snmp_mib is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:35
      c_entry : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, snmp_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:34

  -- * We use unsigned longs for most mibs but u64 for ipstats.
  --  

  -- IPstats  
  -- mibs[] must be first field of struct ipstats_mib  
   type ipstats_mib_mibs_array is array (0 .. 35) of aliased asm_generic_int_ll64_h.u64;
   type ipstats_mib is record
      mibs : aliased ipstats_mib_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:58
      syncp : aliased linux_u64_stats_sync_h.u64_stats_sync;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:59
   end record;
   pragma Convention (C_Pass_By_Copy, ipstats_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:56

  -- ICMP  
   type icmp_mib_mibs_array is array (0 .. 27) of aliased unsigned_long;
   type icmp_mib is record
      mibs : aliased icmp_mib_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:65
   end record;
   pragma Convention (C_Pass_By_Copy, icmp_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:64

   type icmpmsg_mib_mibs_array is array (0 .. 511) of aliased asm_generic_atomic_long_h.atomic_long_t;
   type icmpmsg_mib is record
      mibs : aliased icmpmsg_mib_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:70
   end record;
   pragma Convention (C_Pass_By_Copy, icmpmsg_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:69

  -- ICMP6 (IPv6-ICMP)  
  -- per network ns counters  
   type icmpv6_mib_mibs_array is array (0 .. 5) of aliased unsigned_long;
   type icmpv6_mib is record
      mibs : aliased icmpv6_mib_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:77
   end record;
   pragma Convention (C_Pass_By_Copy, icmpv6_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:76

  -- per device counters, (shared on all cpus)  
   type icmpv6_mib_device_mibs_array is array (0 .. 5) of aliased asm_generic_atomic_long_h.atomic_long_t;
   type icmpv6_mib_device is record
      mibs : aliased icmpv6_mib_device_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:81
   end record;
   pragma Convention (C_Pass_By_Copy, icmpv6_mib_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:80

  -- per network ns counters  
   type icmpv6msg_mib_mibs_array is array (0 .. 511) of aliased asm_generic_atomic_long_h.atomic_long_t;
   type icmpv6msg_mib is record
      mibs : aliased icmpv6msg_mib_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:87
   end record;
   pragma Convention (C_Pass_By_Copy, icmpv6msg_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:86

  -- per device counters, (shared on all cpus)  
   type icmpv6msg_mib_device_mibs_array is array (0 .. 511) of aliased asm_generic_atomic_long_h.atomic_long_t;
   type icmpv6msg_mib_device is record
      mibs : aliased icmpv6msg_mib_device_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:91
   end record;
   pragma Convention (C_Pass_By_Copy, icmpv6msg_mib_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:90

  -- TCP  
   type tcp_mib_mibs_array is array (0 .. 15) of aliased unsigned_long;
   type tcp_mib is record
      mibs : aliased tcp_mib_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:98
   end record;
   pragma Convention (C_Pass_By_Copy, tcp_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:97

  -- UDP  
   type udp_mib_mibs_array is array (0 .. 7) of aliased unsigned_long;
   type udp_mib is record
      mibs : aliased udp_mib_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:104
   end record;
   pragma Convention (C_Pass_By_Copy, udp_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:103

  -- Linux  
   type linux_mib_mibs_array is array (0 .. 102) of aliased unsigned_long;
   type linux_mib is record
      mibs : aliased linux_mib_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:110
   end record;
   pragma Convention (C_Pass_By_Copy, linux_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:109

  -- Linux Xfrm  
   type linux_xfrm_mib_mibs_array is array (0 .. 28) of aliased unsigned_long;
   type linux_xfrm_mib is record
      mibs : aliased linux_xfrm_mib_mibs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:116
   end record;
   pragma Convention (C_Pass_By_Copy, linux_xfrm_mib);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/snmp.h:115

  -- * Use "__typeof__(*mib) *ptr" instead of "__typeof__(mib) ptr"
  -- * to make @ptr a non-percpu pointer.
  --  

end net_snmp_h;

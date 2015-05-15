pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_mmzone_h;

package asm_mmzone_64_h is

   --  arg-macro: function NODE_DATA (node_data(nid)
   --    return node_data(nid);
  -- K8 NUMA support  
  -- Copyright 2002,2003 by Andi Kleen, SuSE Labs  
  -- 2.5 Version loosely based on the NUMAQ Code by Pat Gaughen.  
   node_data : aliased array (size_t) of access linux_mmzone_h.pglist_data;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/mmzone_64.h:12
   pragma Import (C, node_data, "node_data");

end asm_mmzone_64_h;

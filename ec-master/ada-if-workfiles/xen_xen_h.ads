pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package xen_xen_h is

   --  arg-macro: function xen_domain (xen_domain_type /= XEN_NATIVE
   --    return xen_domain_type /= XEN_NATIVE;
   --  arg-macro: function xen_pv_domain (xen_domain()  and then  xen_domain_type = XEN_PV_DOMAIN
   --    return xen_domain()  and then  xen_domain_type = XEN_PV_DOMAIN;
   --  arg-macro: function xen_hvm_domain (xen_domain()  and then  xen_domain_type = XEN_HVM_DOMAIN
   --    return xen_domain()  and then  xen_domain_type = XEN_HVM_DOMAIN;
   --  arg-macro: function xen_initial_domain (xen_domain()  and then  xen_start_info  and then  xen_start_info.flags and SIF_INITDOMAIN
   --    return xen_domain()  and then  xen_start_info  and then  xen_start_info.flags and SIF_INITDOMAIN;
   --  arg-macro: function xen_pvh_domain (xen_pv_domain()  and then  xen_feature(XENFEAT_auto_translated_physmap)  and then  xen_have_vector_callback
   --    return xen_pv_domain()  and then  xen_feature(XENFEAT_auto_translated_physmap)  and then  xen_have_vector_callback;
   type xen_domain_type is 
     (XEN_NATIVE,
      XEN_PV_DOMAIN,
      XEN_HVM_DOMAIN);
   pragma Convention (C, xen_domain_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/xen.h:4

  -- running on bare hardware     
  -- running in a PV domain       
  -- running in a Xen hvm domain  
   xen_domain_type : aliased xen_domain_type;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/xen.h:11
   pragma Import (C, xen_domain_type, "xen_domain_type");

  -- This functionality exists only for x86. The XEN_PVHVM support exists
  -- * only in x86 world - hence on ARM it will be always disabled.
  -- * N.B. ARM guests are neither PV nor HVM nor PVHVM.
  -- * It's a bit like PVH but is different also (it's further towards the H
  -- * end of the spectrum than even PVH).
  --  

end xen_xen_h;

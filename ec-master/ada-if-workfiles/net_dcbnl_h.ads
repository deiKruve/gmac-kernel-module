pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_dcbnl_h;
with linux_types_h;
with asm_generic_int_ll64_h;
limited with linux_netdevice_h;

package net_dcbnl_h is

  -- * Copyright (c) 2008, Intel Corporation.
  -- *
  -- * This program is free software; you can redistribute it and/or modify it
  -- * under the terms and conditions of the GNU General Public License,
  -- * version 2, as published by the Free Software Foundation.
  -- *
  -- * This program is distributed in the hope it will be useful, but WITHOUT
  -- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  -- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  -- * more details.
  -- *
  -- * You should have received a copy of the GNU General Public License along with
  -- * this program; if not, see <http://www.gnu.org/licenses/>.
  -- *
  -- * Author: Lucy Liu <lucy.liu@intel.com>
  --  

   type dcb_app_type is record
      ifindex : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:25
      app : aliased uapi_linux_dcbnl_h.dcb_app;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:26
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:27
      dcbx : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, dcb_app_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:24

   function dcb_setapp (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.dcb_app) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:31
   pragma Import (CPP, dcb_setapp, "_Z10dcb_setappP10net_deviceP7dcb_app");

   function dcb_getapp (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.dcb_app) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:32
   pragma Import (CPP, dcb_getapp, "_Z10dcb_getappP10net_deviceP7dcb_app");

   function dcb_ieee_setapp (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.dcb_app) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:33
   pragma Import (CPP, dcb_ieee_setapp, "_Z15dcb_ieee_setappP10net_deviceP7dcb_app");

   function dcb_ieee_delapp (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.dcb_app) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:34
   pragma Import (CPP, dcb_ieee_delapp, "_Z15dcb_ieee_delappP10net_deviceP7dcb_app");

   function dcb_ieee_getapp_mask (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.dcb_app) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:35
   pragma Import (CPP, dcb_ieee_getapp_mask, "_Z20dcb_ieee_getapp_maskP10net_deviceP7dcb_app");

   function dcbnl_ieee_notify
     (dev : access linux_netdevice_h.net_device;
      event : int;
      cmd : int;
      seq : asm_generic_int_ll64_h.u32;
      pid : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:37
   pragma Import (CPP, dcbnl_ieee_notify, "_Z17dcbnl_ieee_notifyP10net_deviceiijj");

   function dcbnl_cee_notify
     (dev : access linux_netdevice_h.net_device;
      event : int;
      cmd : int;
      seq : asm_generic_int_ll64_h.u32;
      pid : asm_generic_int_ll64_h.u32) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:39
   pragma Import (CPP, dcbnl_cee_notify, "_Z16dcbnl_cee_notifyP10net_deviceiijj");

  -- * Ops struct for the netlink callbacks.  Used by DCB-enabled drivers through
  -- * the netdevice struct.
  --  

  -- IEEE 802.1Qaz std  
   type dcbnl_rtnl_ops is record
      ieee_getets : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.ieee_ets) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:48
      ieee_setets : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.ieee_ets) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:49
      ieee_getmaxrate : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.ieee_maxrate) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:50
      ieee_setmaxrate : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.ieee_maxrate) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:51
      ieee_getpfc : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.ieee_pfc) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:52
      ieee_setpfc : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.ieee_pfc) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:53
      ieee_getapp : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.dcb_app) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:54
      ieee_setapp : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.dcb_app) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:55
      ieee_delapp : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.dcb_app) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:56
      ieee_peer_getets : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.ieee_ets) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:57
      ieee_peer_getpfc : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.ieee_pfc) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:58
      getstate : access function (arg1 : access linux_netdevice_h.net_device) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:61
      setstate : access function (arg1 : access linux_netdevice_h.net_device; arg2 : asm_generic_int_ll64_h.u8) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:62
      getpermhwaddr : access procedure (arg1 : access linux_netdevice_h.net_device; arg2 : access asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:63
      setpgtccfgtx : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : asm_generic_int_ll64_h.u8;
            arg4 : asm_generic_int_ll64_h.u8;
            arg5 : asm_generic_int_ll64_h.u8;
            arg6 : asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:64
      setpgbwgcfgtx : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:65
      setpgtccfgrx : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : asm_generic_int_ll64_h.u8;
            arg4 : asm_generic_int_ll64_h.u8;
            arg5 : asm_generic_int_ll64_h.u8;
            arg6 : asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:66
      setpgbwgcfgrx : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:67
      getpgtccfgtx : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u8;
            arg4 : access asm_generic_int_ll64_h.u8;
            arg5 : access asm_generic_int_ll64_h.u8;
            arg6 : access asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:68
      getpgbwgcfgtx : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:69
      getpgtccfgrx : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u8;
            arg4 : access asm_generic_int_ll64_h.u8;
            arg5 : access asm_generic_int_ll64_h.u8;
            arg6 : access asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:70
      getpgbwgcfgrx : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:71
      setpfccfg : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:72
      getpfccfg : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:73
      setall : access function (arg1 : access linux_netdevice_h.net_device) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:74
      getcap : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u8) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:75
      getnumtcs : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:76
      setnumtcs : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : asm_generic_int_ll64_h.u8) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:77
      getpfcstate : access function (arg1 : access linux_netdevice_h.net_device) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:78
      setpfcstate : access procedure (arg1 : access linux_netdevice_h.net_device; arg2 : asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:79
      getbcncfg : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:80
      setbcncfg : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:81
      getbcnrp : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:82
      setbcnrp : access procedure
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : asm_generic_int_ll64_h.u8);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:83
      setapp : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : asm_generic_int_ll64_h.u8;
            arg3 : asm_generic_int_ll64_h.u16;
            arg4 : asm_generic_int_ll64_h.u8) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:84
      getapp : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : asm_generic_int_ll64_h.u8;
            arg3 : asm_generic_int_ll64_h.u16) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:85
      getfeatcfg : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : access asm_generic_int_ll64_h.u8) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:86
      setfeatcfg : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : int;
            arg3 : asm_generic_int_ll64_h.u8) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:87
      getdcbx : access function (arg1 : access linux_netdevice_h.net_device) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:90
      setdcbx : access function (arg1 : access linux_netdevice_h.net_device; arg2 : asm_generic_int_ll64_h.u8) return asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:91
      peer_getappinfo : access function
           (arg1 : access linux_netdevice_h.net_device;
            arg2 : access uapi_linux_dcbnl_h.dcb_peer_app_info;
            arg3 : access asm_generic_int_ll64_h.u16) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:95
      peer_getapptable : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.dcb_app) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:96
      cee_peer_getpg : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.cee_pg) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:99
      cee_peer_getpfc : access function (arg1 : access linux_netdevice_h.net_device; arg2 : access uapi_linux_dcbnl_h.cee_pfc) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:100
   end record;
   pragma Convention (C_Pass_By_Copy, dcbnl_rtnl_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/net/dcbnl.h:46

  -- CEE std  
  -- DCBX configuration  
  -- peer apps  
  -- CEE peer  
end net_dcbnl_h;

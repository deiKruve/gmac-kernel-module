pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_socket_h;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_netlink_h is

   --  unsupported macro: NETLINK_ROUTE 0
   --  unsupported macro: NETLINK_UNUSED 1
   --  unsupported macro: NETLINK_USERSOCK 2
   --  unsupported macro: NETLINK_FIREWALL 3
   --  unsupported macro: NETLINK_SOCK_DIAG 4
   --  unsupported macro: NETLINK_NFLOG 5
   --  unsupported macro: NETLINK_XFRM 6
   --  unsupported macro: NETLINK_SELINUX 7
   --  unsupported macro: NETLINK_ISCSI 8
   --  unsupported macro: NETLINK_AUDIT 9
   --  unsupported macro: NETLINK_FIB_LOOKUP 10
   --  unsupported macro: NETLINK_CONNECTOR 11
   --  unsupported macro: NETLINK_NETFILTER 12
   --  unsupported macro: NETLINK_IP6_FW 13
   --  unsupported macro: NETLINK_DNRTMSG 14
   --  unsupported macro: NETLINK_KOBJECT_UEVENT 15
   --  unsupported macro: NETLINK_GENERIC 16
   --  unsupported macro: NETLINK_SCSITRANSPORT 18
   --  unsupported macro: NETLINK_ECRYPTFS 19
   --  unsupported macro: NETLINK_RDMA 20
   --  unsupported macro: NETLINK_CRYPTO 21
   --  unsupported macro: NETLINK_INET_DIAG NETLINK_SOCK_DIAG
   --  unsupported macro: MAX_LINKS 32
   --  unsupported macro: NLM_F_REQUEST 1
   --  unsupported macro: NLM_F_MULTI 2
   --  unsupported macro: NLM_F_ACK 4
   --  unsupported macro: NLM_F_ECHO 8
   --  unsupported macro: NLM_F_DUMP_INTR 16
   --  unsupported macro: NLM_F_ROOT 0x100
   --  unsupported macro: NLM_F_MATCH 0x200
   --  unsupported macro: NLM_F_ATOMIC 0x400
   --  unsupported macro: NLM_F_DUMP (NLM_F_ROOT|NLM_F_MATCH)
   --  unsupported macro: NLM_F_REPLACE 0x100
   --  unsupported macro: NLM_F_EXCL 0x200
   --  unsupported macro: NLM_F_CREATE 0x400
   --  unsupported macro: NLM_F_APPEND 0x800
   --  unsupported macro: NLMSG_ALIGNTO 4U
   --  arg-macro: function NLMSG_ALIGN ( ((len)+NLMSG_ALIGNTO-1) and ~(NLMSG_ALIGNTO-1) 
   --    return  ((len)+NLMSG_ALIGNTO-1) and ~(NLMSG_ALIGNTO-1) ;
   --  unsupported macro: NLMSG_HDRLEN ((int) NLMSG_ALIGN(sizeof(struct nlmsghdr)))
   --  arg-macro: function NLMSG_LENGTH ((len) + NLMSG_HDRLEN
   --    return (len) + NLMSG_HDRLEN;
   --  arg-macro: procedure NLMSG_SPACE NLMSG_ALIGN(NLMSG_LENGTH(len))
   --    NLMSG_ALIGN(NLMSG_LENGTH(len))
   --  arg-macro: function NLMSG_DATA ((void*)(((char*)nlh) + NLMSG_LENGTH(0))
   --    return (void*)(((char*)nlh) + NLMSG_LENGTH(0));
   --  arg-macro: function NLMSG_NEXT ((len) -= NLMSG_ALIGN((nlh).nlmsg_len), (struct nlmsghdr*)(((char*)(nlh)) + NLMSG_ALIGN((nlh).nlmsg_len))
   --    return (len) -= NLMSG_ALIGN((nlh).nlmsg_len), (struct nlmsghdr*)(((char*)(nlh)) + NLMSG_ALIGN((nlh).nlmsg_len));
   --  arg-macro: function NLMSG_OK ((len) >= (int)sizeof(struct nlmsghdr)  and then  (nlh).nlmsg_len >= sizeof(struct nlmsghdr)  and then  (nlh).nlmsg_len <= (len)
   --    return (len) >= (int)sizeof(struct nlmsghdr)  and then  (nlh).nlmsg_len >= sizeof(struct nlmsghdr)  and then  (nlh).nlmsg_len <= (len);
   --  arg-macro: function NLMSG_PAYLOAD ((nlh).nlmsg_len - NLMSG_SPACE((len))
   --    return (nlh).nlmsg_len - NLMSG_SPACE((len));
   --  unsupported macro: NLMSG_NOOP 0x1
   --  unsupported macro: NLMSG_ERROR 0x2
   --  unsupported macro: NLMSG_DONE 0x3
   --  unsupported macro: NLMSG_OVERRUN 0x4
   --  unsupported macro: NLMSG_MIN_TYPE 0x10
   --  unsupported macro: NETLINK_ADD_MEMBERSHIP 1
   --  unsupported macro: NETLINK_DROP_MEMBERSHIP 2
   --  unsupported macro: NETLINK_PKTINFO 3
   --  unsupported macro: NETLINK_BROADCAST_ERROR 4
   --  unsupported macro: NETLINK_NO_ENOBUFS 5
   --  unsupported macro: NETLINK_RX_RING 6
   --  unsupported macro: NETLINK_TX_RING 7
   --  unsupported macro: NL_MMAP_MSG_ALIGNMENT NLMSG_ALIGNTO
   --  arg-macro: procedure NL_MMAP_MSG_ALIGN __ALIGN_KERNEL(sz, NL_MMAP_MSG_ALIGNMENT)
   --    __ALIGN_KERNEL(sz, NL_MMAP_MSG_ALIGNMENT)
   --  unsupported macro: NL_MMAP_HDRLEN NL_MMAP_MSG_ALIGN(sizeof(struct nl_mmap_hdr))
   --  unsupported macro: NET_MAJOR 36
   --  unsupported macro: NLA_F_NESTED (1 << 15)
   --  unsupported macro: NLA_F_NET_BYTEORDER (1 << 14)
   --  unsupported macro: NLA_TYPE_MASK ~(NLA_F_NESTED | NLA_F_NET_BYTEORDER)
   --  unsupported macro: NLA_ALIGNTO 4
   --  arg-macro: function NLA_ALIGN (((len) + NLA_ALIGNTO - 1) and ~(NLA_ALIGNTO - 1)
   --    return ((len) + NLA_ALIGNTO - 1) and ~(NLA_ALIGNTO - 1);
   --  unsupported macro: NLA_HDRLEN ((int) NLA_ALIGN(sizeof(struct nlattr)))
  -- for __kernel_sa_family_t  
  -- leave room for NETLINK_DM (DM Events)  
  -- AF_NETLINK	 
   type sockaddr_nl is record
      nl_family : aliased uapi_linux_socket_h.uu_kernel_sa_family_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:36
      nl_pad : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:37
      nl_pid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:38
      nl_groups : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:39
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr_nl);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:35

  -- zero		 
  -- port ID	 
  -- multicast groups mask  
  -- Length of message including header  
   type nlmsghdr is record
      nlmsg_len : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:43
      nlmsg_type : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:44
      nlmsg_flags : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:45
      nlmsg_seq : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:46
      nlmsg_pid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:47
   end record;
   pragma Convention (C_Pass_By_Copy, nlmsghdr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:42

  -- Message content  
  -- Additional flags  
  -- Sequence number  
  -- Sending process port ID  
  -- Flags values  
  -- Modifiers to GET request  
  -- Modifiers to NEW request  
  --   4.4BSD ADD		NLM_F_CREATE|NLM_F_EXCL
  --   4.4BSD CHANGE	NLM_F_REPLACE
  --   True CHANGE		NLM_F_CREATE|NLM_F_REPLACE
  --   Append		NLM_F_CREATE
  --   Check		NLM_F_EXCL
  --  

   type nlmsgerr is record
      error : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:100
      msg : aliased nlmsghdr;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:101
   end record;
   pragma Convention (C_Pass_By_Copy, nlmsgerr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:99

   type nl_pktinfo is record
      group : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:113
   end record;
   pragma Convention (C_Pass_By_Copy, nl_pktinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:112

   type nl_mmap_req is record
      nm_block_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:117
      nm_block_nr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:118
      nm_frame_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:119
      nm_frame_nr : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:120
   end record;
   pragma Convention (C_Pass_By_Copy, nl_mmap_req);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:116

   type nl_mmap_hdr is record
      nm_status : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:124
      nm_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:125
      nm_group : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:126
      nm_pid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:128
      nm_uid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:129
      nm_gid : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:130
   end record;
   pragma Convention (C_Pass_By_Copy, nl_mmap_hdr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:123

  -- credentials  
   type nl_mmap_status is 
     (NL_MMAP_STATUS_UNUSED,
      NL_MMAP_STATUS_RESERVED,
      NL_MMAP_STATUS_VALID,
      NL_MMAP_STATUS_COPY,
      NL_MMAP_STATUS_SKIP);
   pragma Convention (C, nl_mmap_status);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:133

  -- *  <------- NLA_HDRLEN ------> <-- NLA_ALIGN(payload)-->
  -- * +---------------------+- - -+- - - - - - - - - -+- - -+
  -- * |        Header       | Pad |     Payload       | Pad |
  -- * |   (struct nlattr)   | ing |                   | ing |
  -- * +---------------------+- - -+- - - - - - - - - -+- - -+
  -- *  <-------------- nlattr->nla_len -------------->
  --  

   type nlattr is record
      nla_len : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:162
      nla_type : aliased uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:163
   end record;
   pragma Convention (C_Pass_By_Copy, nlattr);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/netlink.h:161

  -- * nla_type (16 bits)
  -- * +---+---+-------------------------------+
  -- * | N | O | Attribute Type                |
  -- * +---+---+-------------------------------+
  -- * N := Carries nested attributes
  -- * O := Payload stored in network byte order
  -- *
  -- * Note: The N and O flag are mutually exclusive.
  --  

end uapi_linux_netlink_h;

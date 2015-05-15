pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;
with uapi_linux_types_h;

package uapi_linux_capability_h is

   --  unsupported macro: VFS_CAP_REVISION_MASK 0xFF000000
   --  unsupported macro: VFS_CAP_REVISION_SHIFT 24
   --  unsupported macro: VFS_CAP_FLAGS_MASK ~VFS_CAP_REVISION_MASK
   --  unsupported macro: VFS_CAP_FLAGS_EFFECTIVE 0x000001
   --  unsupported macro: VFS_CAP_REVISION_1 0x01000000
   --  unsupported macro: VFS_CAP_U32_1 1
   --  unsupported macro: XATTR_CAPS_SZ_1 (sizeof(__le32)*(1 + 2*VFS_CAP_U32_1))
   --  unsupported macro: VFS_CAP_REVISION_2 0x02000000
   --  unsupported macro: VFS_CAP_U32_2 2
   --  unsupported macro: XATTR_CAPS_SZ_2 (sizeof(__le32)*(1 + 2*VFS_CAP_U32_2))
   --  unsupported macro: XATTR_CAPS_SZ XATTR_CAPS_SZ_2
   --  unsupported macro: VFS_CAP_U32 VFS_CAP_U32_2
   --  unsupported macro: VFS_CAP_REVISION VFS_CAP_REVISION_2
   --  unsupported macro: CAP_CHOWN 0
   --  unsupported macro: CAP_DAC_OVERRIDE 1
   --  unsupported macro: CAP_DAC_READ_SEARCH 2
   --  unsupported macro: CAP_FOWNER 3
   --  unsupported macro: CAP_FSETID 4
   --  unsupported macro: CAP_KILL 5
   --  unsupported macro: CAP_SETGID 6
   --  unsupported macro: CAP_SETUID 7
   --  unsupported macro: CAP_SETPCAP 8
   --  unsupported macro: CAP_LINUX_IMMUTABLE 9
   --  unsupported macro: CAP_NET_BIND_SERVICE 10
   --  unsupported macro: CAP_NET_BROADCAST 11
   --  unsupported macro: CAP_NET_ADMIN 12
   --  unsupported macro: CAP_NET_RAW 13
   --  unsupported macro: CAP_IPC_LOCK 14
   --  unsupported macro: CAP_IPC_OWNER 15
   --  unsupported macro: CAP_SYS_MODULE 16
   --  unsupported macro: CAP_SYS_RAWIO 17
   --  unsupported macro: CAP_SYS_CHROOT 18
   --  unsupported macro: CAP_SYS_PTRACE 19
   --  unsupported macro: CAP_SYS_PACCT 20
   --  unsupported macro: CAP_SYS_ADMIN 21
   --  unsupported macro: CAP_SYS_BOOT 22
   --  unsupported macro: CAP_SYS_NICE 23
   --  unsupported macro: CAP_SYS_RESOURCE 24
   --  unsupported macro: CAP_SYS_TIME 25
   --  unsupported macro: CAP_SYS_TTY_CONFIG 26
   --  unsupported macro: CAP_MKNOD 27
   --  unsupported macro: CAP_LEASE 28
   --  unsupported macro: CAP_AUDIT_WRITE 29
   --  unsupported macro: CAP_AUDIT_CONTROL 30
   --  unsupported macro: CAP_SETFCAP 31
   --  unsupported macro: CAP_MAC_OVERRIDE 32
   --  unsupported macro: CAP_MAC_ADMIN 33
   --  unsupported macro: CAP_SYSLOG 34
   --  unsupported macro: CAP_WAKE_ALARM 35
   --  unsupported macro: CAP_BLOCK_SUSPEND 36
   --  unsupported macro: CAP_AUDIT_READ 37
   --  unsupported macro: CAP_LAST_CAP CAP_AUDIT_READ
   --  arg-macro: function cap_valid ((x) >= 0  and then  (x) <= CAP_LAST_CAP
   --    return (x) >= 0  and then  (x) <= CAP_LAST_CAP;
   --  arg-macro: function CAP_TO_INDEX ((x) >> 5
   --    return (x) >> 5;
   --  arg-macro: function CAP_TO_MASK (1 << ((x) and 31)
   --    return 1 << ((x) and 31);
  -- * This is <linux/capability.h>
  -- *
  -- * Andrew G. Morgan <morgan@kernel.org>
  -- * Alexander Kjeldaas <astor@guardian.no>
  -- * with help from Aleph1, Roland Buresund and Andrew Main.
  -- *
  -- * See here for the libcap library ("POSIX draft" compliance):
  -- *
  -- * ftp://www.kernel.org/pub/linux/libs/security/linux-privs/kernel-2.6/
  --  

  -- User-level do most of the mapping between kernel and user
  --   capabilities based on the version tag given by the kernel. The
  --   kernel might be somewhat backwards compatible, but don't bet on
  --   it.  

  -- Note, cap_t, is defined by POSIX (draft) to be an "opaque" pointer to
  --   a set of three capability sets.  The transposition of 3*the
  --   following structure to such a composite is better handled in a user
  --   library since the draft standard requires the use of malloc/free
  --   etc..  

   type uu_user_cap_header_struct is record
      version : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:41
      pid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:42
   end record;
   pragma Convention (C_Pass_By_Copy, uu_user_cap_header_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:40

   type cap_user_header_t is access all uu_user_cap_header_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:43

   type uu_user_cap_data_struct is record
      effective : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:46
      permitted : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:47
      inheritable : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:48
   end record;
   pragma Convention (C_Pass_By_Copy, uu_user_cap_data_struct);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:45

   type cap_user_data_t is access all uu_user_cap_data_struct;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:49

  -- Little endian  
   type vfs_cap_data_data_array is array (0 .. 1) of aliased anon_187;
   type vfs_cap_data;
   type anon_187 is record
      permitted : aliased uapi_linux_types_h.uu_le32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:72
      inheritable : aliased uapi_linux_types_h.uu_le32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:73
   end record;
   pragma Convention (C_Pass_By_Copy, anon_187);
   type vfs_cap_data is record
      magic_etc : aliased uapi_linux_types_h.uu_le32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:70
      data : aliased vfs_cap_data_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:74
   end record;
   pragma Convention (C_Pass_By_Copy, vfs_cap_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/capability.h:69

  -- Little endian  
  -- Little endian  
  -- * Backwardly compatible definition for source code - trapped in a
  -- * 32-bit world. If you find you need this, please consider using
  -- * libcap to untrap yourself...
  --  

  --*
  -- ** POSIX-draft defined capabilities.
  -- * 

  -- In a system with the [_POSIX_CHOWN_RESTRICTED] option defined, this
  --   overrides the restriction of changing file ownership and group
  --   ownership.  

  -- Override all DAC access, including ACL execute access if
  --   [_POSIX_ACL] is defined. Excluding DAC access covered by
  --   CAP_LINUX_IMMUTABLE.  

  -- Overrides all DAC restrictions regarding read and search on files
  --   and directories, including ACL restrictions if [_POSIX_ACL] is
  --   defined. Excluding DAC access covered by CAP_LINUX_IMMUTABLE.  

  -- Overrides all restrictions about allowed operations on files, where
  --   file owner ID must be equal to the user ID, except where CAP_FSETID
  --   is applicable. It doesn't override MAC and DAC restrictions.  

  -- Overrides the following restrictions that the effective user ID
  --   shall match the file owner ID when setting the S_ISUID and S_ISGID
  --   bits on that file; that the effective group ID (or one of the
  --   supplementary group IDs) shall match the file owner ID when setting
  --   the S_ISGID bit on that file; that the S_ISUID and S_ISGID bits are
  --   cleared on successful return from chown(2) (not implemented).  

  -- Overrides the restriction that the real or effective user ID of a
  --   process sending a signal must match the real or effective user ID
  --   of the process receiving the signal.  

  -- Allows setgid(2) manipulation  
  -- Allows setgroups(2)  
  -- Allows forged gids on socket credentials passing.  
  -- Allows set*uid(2) manipulation (including fsuid).  
  -- Allows forged pids on socket credentials passing.  
  --*
  -- ** Linux-specific capabilities
  -- * 

  -- Without VFS support for capabilities:
  -- *   Transfer any capability in your permitted set to any pid,
  -- *   remove any capability in your permitted set from any pid
  -- * With VFS support for capabilities (neither of above, but)
  -- *   Add any capability from current's capability bounding set
  -- *       to the current process' inheritable set
  -- *   Allow taking bits out of capability bounding set
  -- *   Allow modification of the securebits for a process
  --  

  -- Allow modification of S_IMMUTABLE and S_APPEND file attributes  
  -- Allows binding to TCP/UDP sockets below 1024  
  -- Allows binding to ATM VCIs below 32  
  -- Allow broadcasting, listen to multicast  
  -- Allow interface configuration  
  -- Allow administration of IP firewall, masquerading and accounting  
  -- Allow setting debug option on sockets  
  -- Allow modification of routing tables  
  -- Allow setting arbitrary process / process group ownership on
  --   sockets  

  -- Allow binding to any address for transparent proxying (also via NET_RAW)  
  -- Allow setting TOS (type of service)  
  -- Allow setting promiscuous mode  
  -- Allow clearing driver statistics  
  -- Allow multicasting  
  -- Allow read/write of device-specific registers  
  -- Allow activation of ATM control sockets  
  -- Allow use of RAW sockets  
  -- Allow use of PACKET sockets  
  -- Allow binding to any address for transparent proxying (also via NET_ADMIN)  
  -- Allow locking of shared memory segments  
  -- Allow mlock and mlockall (which doesn't really have anything to do
  --   with IPC)  

  -- Override IPC ownership checks  
  -- Insert and remove kernel modules - modify kernel without limit  
  -- Allow ioperm/iopl access  
  -- Allow sending USB messages to any device via /proc/bus/usb  
  -- Allow use of chroot()  
  -- Allow ptrace() of any process  
  -- Allow configuration of process accounting  
  -- Allow configuration of the secure attention key  
  -- Allow administration of the random device  
  -- Allow examination and configuration of disk quotas  
  -- Allow setting the domainname  
  -- Allow setting the hostname  
  -- Allow calling bdflush()  
  -- Allow mount() and umount(), setting up new smb connection  
  -- Allow some autofs root ioctls  
  -- Allow nfsservctl  
  -- Allow VM86_REQUEST_IRQ  
  -- Allow to read/write pci config on alpha  
  -- Allow irix_prctl on mips (setstacksize)  
  -- Allow flushing all cache on m68k (sys_cacheflush)  
  -- Allow removing semaphores  
  -- Used instead of CAP_CHOWN to "chown" IPC message queues, semaphores
  --   and shared memory  

  -- Allow locking/unlocking of shared memory segment  
  -- Allow turning swap on/off  
  -- Allow forged pids on socket credentials passing  
  -- Allow setting readahead and flushing buffers on block devices  
  -- Allow setting geometry in floppy driver  
  -- Allow turning DMA on/off in xd driver  
  -- Allow administration of md devices (mostly the above, but some
  --   extra ioctls)  

  -- Allow tuning the ide driver  
  -- Allow access to the nvram device  
  -- Allow administration of apm_bios, serial and bttv (TV) device  
  -- Allow manufacturer commands in isdn CAPI support driver  
  -- Allow reading non-standardized portions of pci configuration space  
  -- Allow DDI debug ioctl on sbpcd driver  
  -- Allow setting up serial ports  
  -- Allow sending raw qic-117 commands  
  -- Allow enabling/disabling tagged queuing on SCSI controllers and sending
  --   arbitrary SCSI commands  

  -- Allow setting encryption key on loopback filesystem  
  -- Allow setting zone reclaim policy  
  -- Allow use of reboot()  
  -- Allow raising priority and setting priority on other (different
  --   UID) processes  

  -- Allow use of FIFO and round-robin (realtime) scheduling on own
  --   processes and setting the scheduling algorithm used by another
  --   process.  

  -- Allow setting cpu affinity on other processes  
  -- Override resource limits. Set resource limits.  
  -- Override quota limits.  
  -- Override reserved space on ext2 filesystem  
  -- Modify data journaling mode on ext3 filesystem (uses journaling
  --   resources)  

  -- NOTE: ext2 honors fsuid when checking for resource overrides, so
  --   you can override using fsuid too  

  -- Override size restrictions on IPC message queues  
  -- Allow more than 64hz interrupts from the real-time clock  
  -- Override max number of consoles on console allocation  
  -- Override max number of keymaps  
  -- Allow manipulation of system clock  
  -- Allow irix_stime on mips  
  -- Allow setting the real-time clock  
  -- Allow configuration of tty devices  
  -- Allow vhangup() of tty  
  -- Allow the privileged aspects of mknod()  
  -- Allow taking of leases on files  
  -- Allow writing the audit log via unicast netlink socket  
  -- Allow configuration of audit via unicast netlink socket  
  -- Override MAC access.
  --   The base kernel enforces no MAC policy.
  --   An LSM may enforce a MAC policy, and if it does and it chooses
  --   to implement capability based overrides of that policy, this is
  --   the capability it should use to do so.  

  -- Allow MAC configuration or state changes.
  --   The base kernel requires no MAC configuration.
  --   An LSM may enforce a MAC policy, and if it does and it chooses
  --   to implement capability based checks on modifications to that
  --   policy or the data required to maintain it, this is the
  --   capability it should use to do so.  

  -- Allow configuring the kernel's syslog (printk behaviour)  
  -- Allow triggering something that will wake the system  
  -- Allow preventing system suspends  
  -- Allow reading the audit log via multicast netlink socket  
  -- * Bit location of each capability (used by user-space library and kernel)
  --  

end uapi_linux_capability_h;

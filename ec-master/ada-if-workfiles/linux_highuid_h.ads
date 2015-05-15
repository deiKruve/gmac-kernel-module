pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_highuid_h is

   --  unsupported macro: DEFAULT_OVERFLOWUID 65534
   --  unsupported macro: DEFAULT_OVERFLOWGID 65534
   --  arg-macro: function high2lowuid ((uid) and ~0xFFFF ? (old_uid_t)overflowuid : (old_uid_t)(uid)
   --    return (uid) and ~0xFFFF ? (old_uid_t)overflowuid : (old_uid_t)(uid);
   --  arg-macro: function high2lowgid ((gid) and ~0xFFFF ? (old_gid_t)overflowgid : (old_gid_t)(gid)
   --    return (gid) and ~0xFFFF ? (old_gid_t)overflowgid : (old_gid_t)(gid);
   --  arg-macro: function low2highuid ((uid) = (old_uid_t)-1 ? (uid_t)-1 : (uid_t)(uid)
   --    return (uid) = (old_uid_t)-1 ? (uid_t)-1 : (uid_t)(uid);
   --  arg-macro: function low2highgid ((gid) = (old_gid_t)-1 ? (gid_t)-1 : (gid_t)(gid)
   --    return (gid) = (old_gid_t)-1 ? (gid_t)-1 : (gid_t)(gid);
   --  arg-macro: procedure SET_UID do { (var) := __convert_uid(sizeof(var), (uid)); } while (0)
   --    do { (var) := __convert_uid(sizeof(var), (uid)); } while (0)
   --  arg-macro: procedure SET_GID do { (var) := __convert_gid(sizeof(var), (gid)); } while (0)
   --    do { (var) := __convert_gid(sizeof(var), (gid)); } while (0)
   --  unsupported macro: DEFAULT_FS_OVERFLOWUID 65534
   --  unsupported macro: DEFAULT_FS_OVERFLOWGID 65534
   --  arg-macro: function fs_high2lowuid ((uid) and ~0xFFFF ? (uid16_t)fs_overflowuid : (uid16_t)(uid)
   --    return (uid) and ~0xFFFF ? (uid16_t)fs_overflowuid : (uid16_t)(uid);
   --  arg-macro: function fs_high2lowgid ((gid) and ~0xFFFF ? (gid16_t)fs_overflowgid : (gid16_t)(gid)
   --    return (gid) and ~0xFFFF ? (gid16_t)fs_overflowgid : (gid16_t)(gid);
   --  arg-macro: function low_16_bits ((x) and 0xFFFF
   --    return (x) and 0xFFFF;
   --  arg-macro: function high_16_bits (((x) and 0xFFFF0000) >> 16
   --    return ((x) and 0xFFFF0000) >> 16;
  -- * general notes:
  -- *
  -- * CONFIG_UID16 is defined if the given architecture needs to
  -- * support backwards compatibility for old system calls.
  -- *
  -- * kernel code should use uid_t and gid_t at all times when dealing with
  -- * kernel-private data.
  -- *
  -- * old_uid_t and old_gid_t should only be different if CONFIG_UID16 is
  -- * defined, else the platform should provide dummy typedefs for them
  -- * such that they are equivalent to __kernel_{u,g}id_t.
  -- *
  -- * uid16_t and gid16_t are used on all architectures. (when dealing
  -- * with structures hard coded to 16 bits, such as in filesystems)
  --  

  -- * This is the "overflow" UID and GID. They are used to signify uid/gid
  -- * overflow to old programs when they request uid/gid information but are
  -- * using the old 16 bit interfaces.
  -- * When you run a libc5 program, it will think that all highuid files or
  -- * processes are owned by this uid/gid.
  -- * The idea is that it's better to do so than possibly return 0 in lieu of
  -- * 65536, etc.
  --  

   overflowuid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/highuid.h:34
   pragma Import (C, overflowuid, "overflowuid");

   overflowgid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/highuid.h:35
   pragma Import (C, overflowgid, "overflowgid");

   --  skipped func __bad_uid

   --  skipped func __bad_gid

  -- prevent uid mod 65536 effect by returning a default value for high UIDs  
  -- * -1 is different in 16 bits than it is in 32 bits
  -- * these macros are used by chown(), setreuid(), ...,
  --  

  -- uid/gid input should be always 32bit uid_t  
  -- * Everything below this line is needed on all architectures, to deal with
  -- * filesystems that only store 16 bits of the UID/GID, etc.
  --  

  -- * This is the UID and GID that will get written to disk if a filesystem
  -- * only supports 16-bit UIDs and the kernel has a high UID/GID to write
  --  

   fs_overflowuid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/highuid.h:81
   pragma Import (C, fs_overflowuid, "fs_overflowuid");

   fs_overflowgid : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/highuid.h:82
   pragma Import (C, fs_overflowgid, "fs_overflowgid");

  -- * Since these macros are used in architectures that only need limited
  -- * 16-bit UID back compatibility, we won't use old_uid_t and old_gid_t
  --  

end linux_highuid_h;

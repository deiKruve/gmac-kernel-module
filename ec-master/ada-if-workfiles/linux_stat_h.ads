pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with linux_types_h;
with linux_uidgid_h;
with uapi_linux_time_h;
with Interfaces.C.Extensions;

package linux_stat_h is

   --  unsupported macro: S_IRWXUGO (S_IRWXU|S_IRWXG|S_IRWXO)
   --  unsupported macro: S_IALLUGO (S_ISUID|S_ISGID|S_ISVTX|S_IRWXUGO)
   --  unsupported macro: S_IRUGO (S_IRUSR|S_IRGRP|S_IROTH)
   --  unsupported macro: S_IWUGO (S_IWUSR|S_IWGRP|S_IWOTH)
   --  unsupported macro: S_IXUGO (S_IXUSR|S_IXGRP|S_IXOTH)
   --  unsupported macro: UTIME_NOW ((1l << 30) - 1l)
   --  unsupported macro: UTIME_OMIT ((1l << 30) - 2l)
   type kstat is record
      ino : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:22
      dev : aliased linux_types_h.dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:23
      mode : aliased linux_types_h.umode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:24
      nlink : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:25
      uid : aliased linux_uidgid_h.kuid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:26
      gid : aliased linux_uidgid_h.kgid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:27
      rdev : aliased linux_types_h.dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:28
      size : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:29
      atime : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:30
      mtime : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:31
      ctime : aliased uapi_linux_time_h.timespec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:32
      blksize : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:33
      blocks : aliased Extensions.unsigned_long_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, kstat);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/stat.h:21

end linux_stat_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;
with uapi_linux_posix_types_h;
with uapi_asm_generic_posix_types_h;
with uapi_asm_posix_types_64_h;
with asm_generic_int_ll64_h;
with System;

package linux_types_h is

   --  arg-macro: procedure DECLARE_BITMAP unsigned long name(BITS_TO_LONGS(bits))
   --    unsigned long name(BITS_TO_LONGS(bits))
   --  unsupported macro: aligned_u64 __u64 __attribute__((aligned(8)))
   --  unsupported macro: aligned_be64 __be64 __attribute__((aligned(8)))
   --  unsupported macro: aligned_le64 __le64 __attribute__((aligned(8)))
   --  unsupported macro: pgoff_t unsigned long
   --  unsupported macro: rcu_head callback_head
   subtype uu_kernel_dev_t is uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:12

   subtype fd_set is uapi_linux_posix_types_h.uu_kernel_fd_set;

   subtype dev_t is uu_kernel_dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:15

   subtype ino_t is uapi_asm_generic_posix_types_h.uu_kernel_ino_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:16

   subtype mode_t is uapi_asm_generic_posix_types_h.uu_kernel_mode_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:17

   subtype umode_t is unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:18

   subtype nlink_t is uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:19

   subtype off_t is uapi_asm_generic_posix_types_h.uu_kernel_off_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:20

   subtype pid_t is uapi_asm_generic_posix_types_h.uu_kernel_pid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:21

   subtype daddr_t is uapi_asm_generic_posix_types_h.uu_kernel_daddr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:22

   subtype key_t is uapi_linux_posix_types_h.uu_kernel_key_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:23

   subtype suseconds_t is uapi_asm_generic_posix_types_h.uu_kernel_suseconds_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:24

   subtype timer_t is uapi_asm_generic_posix_types_h.uu_kernel_timer_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:25

   subtype clockid_t is uapi_asm_generic_posix_types_h.uu_kernel_clockid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:26

   subtype mqd_t is uapi_linux_posix_types_h.uu_kernel_mqd_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:27

   subtype uid_t is uapi_asm_generic_posix_types_h.uu_kernel_uid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:31

   subtype gid_t is uapi_asm_generic_posix_types_h.uu_kernel_gid32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:32

   subtype uid16_t is uapi_asm_generic_posix_types_h.uu_kernel_uid16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:33

   subtype gid16_t is uapi_asm_generic_posix_types_h.uu_kernel_gid16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:34

   subtype uintptr_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:36

  -- This is defined by include/asm-{arch}/posix_types.h  
   subtype old_uid_t is uapi_asm_posix_types_64_h.uu_kernel_old_uid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:40

   subtype old_gid_t is uapi_asm_posix_types_64_h.uu_kernel_old_gid_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:41

   subtype loff_t is uapi_asm_generic_posix_types_h.uu_kernel_loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:45

  -- * The following typedefs are also protected by individual ifdefs for
  -- * historical reasons:
  --  

   subtype size_t is uapi_asm_generic_posix_types_h.uu_kernel_size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:54

   subtype ssize_t is uapi_asm_generic_posix_types_h.uu_kernel_ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:59

   subtype ptrdiff_t is uapi_asm_generic_posix_types_h.uu_kernel_ptrdiff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:64

   subtype time_t is uapi_asm_generic_posix_types_h.uu_kernel_time_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:69

   subtype clock_t is uapi_asm_generic_posix_types_h.uu_kernel_clock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:74

   subtype caddr_t is uapi_asm_generic_posix_types_h.uu_kernel_caddr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:79

  -- bsd  
   subtype u_char is unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:83

   subtype u_short is unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:84

   subtype u_int is unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:85

   subtype u_long is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:86

  -- sysv  
   subtype unchar is unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:89

   subtype ushort is unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:90

   subtype uint is unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:91

   subtype ulong is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:92

   subtype u_int8_t is uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:97

   subtype int8_t is uapi_asm_generic_int_ll64_h.uu_s8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:98

   subtype u_int16_t is uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:99

   subtype int16_t is uapi_asm_generic_int_ll64_h.uu_s16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:100

   subtype u_int32_t is uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:101

   subtype int32_t is uapi_asm_generic_int_ll64_h.uu_s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:102

   subtype uint8_t is uapi_asm_generic_int_ll64_h.uu_u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:106

   subtype uint16_t is uapi_asm_generic_int_ll64_h.uu_u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:107

   subtype uint32_t is uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:108

   subtype uint64_t is uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:111

   subtype u_int64_t is uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:112

   subtype int64_t is uapi_asm_generic_int_ll64_h.uu_s64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:113

  -- this is a special 64bit data type that is 8-byte aligned  
  --*
  -- * The type used for indexing onto a disc or disc partition.
  -- *
  -- * Linux always considers sectors to be 512 bytes long independently
  -- * of the devices real block size.
  -- *
  -- * blkcnt_t is the type of the inode's block count.
  --  

   subtype sector_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:133

   subtype blkcnt_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:134

  -- * The type of an index into the pagecache.  Use a #define so asm/types.h
  -- * can override it.
  --  

  -- A dma_addr_t can hold any valid DMA or bus address for the platform  
   subtype dma_addr_t is asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:147

   subtype gfp_t is unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:158

   subtype fmode_t is unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:159

   subtype oom_flags_t is unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:160

   subtype phys_addr_t is asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:163

   subtype resource_size_t is phys_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:168

  -- * This type is the placeholder for a hardware interrupt number. It has to be
  -- * big enough to enclose whatever representation is used by a given platform.
  --  

   subtype irq_hw_number_t is unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:174

   type atomic_t is record
      counter : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:177
   end record;
   pragma Convention (C_Pass_By_Copy, atomic_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:178

   --  skipped anonymous struct anon_6

   type atomic64_t is record
      counter : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:182
   end record;
   pragma Convention (C_Pass_By_Copy, atomic64_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:183

   --  skipped anonymous struct anon_7

   type list_head is record
      next : access list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:187
      prev : access list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:187
   end record;
   pragma Convention (C_Pass_By_Copy, list_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:186

   type hlist_node;
   type hlist_head is record
      first : access hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:191
   end record;
   pragma Convention (C_Pass_By_Copy, hlist_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:190

   type hlist_node is record
      next : access hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:195
      pprev : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:195
   end record;
   pragma Convention (C_Pass_By_Copy, hlist_node);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:194

   subtype ustat_f_fname_array is Interfaces.C.char_array (0 .. 5);
   subtype ustat_f_fpack_array is Interfaces.C.char_array (0 .. 5);
   type ustat is record
      f_tfree : aliased uapi_asm_generic_posix_types_h.uu_kernel_daddr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:199
      f_tinode : aliased uapi_asm_generic_posix_types_h.uu_kernel_ino_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:200
      f_fname : aliased ustat_f_fname_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:201
      f_fpack : aliased ustat_f_fpack_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:202
   end record;
   pragma Convention (C_Pass_By_Copy, ustat);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:198

  --*
  -- * struct callback_head - callback structure for use with RCU and task_work
  -- * @next: next update requests in a list
  -- * @func: actual update function to call after the grace period.
  --  

   type callback_head is record
      next : access callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:211
      func : access procedure (arg1 : access callback_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:212
   end record;
   pragma Convention (C_Pass_By_Copy, callback_head);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/types.h:210

end linux_types_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with linux_types_h;
with asm_generic_int_ll64_h;
with linux_mutex_h;
with System;
limited with linux_fs_h;
limited with linux_path_h;
limited with linux_dcache_h;
limited with linux_cpumask_h;
limited with linux_nodemask_h;
with Interfaces.C.Extensions;

package linux_seq_file_h is

   --  unsupported macro: SEQ_SKIP 1
   --  unsupported macro: SEQ_START_TOKEN ((void *)1)
   type seq_operations;
   type seq_file is record
      buf : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:19
      size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:20
      from : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:21
      count : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:22
      pad_until : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:23
      index : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:24
      read_pos : aliased linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:25
      version : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:26
      lock : aliased linux_mutex_h.mutex;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:27
      op : access constant seq_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:28
      poll_event : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:29
      user_ns : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, seq_file);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:18

   type seq_operations is record
      start : access function (arg1 : access seq_file; arg2 : access linux_types_h.loff_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:37
      stop : access procedure (arg1 : access seq_file; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:38
      next : access function
           (arg1 : access seq_file;
            arg2 : System.Address;
            arg3 : access linux_types_h.loff_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:39
      show : access function (arg1 : access seq_file; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:40
   end record;
   pragma Convention (C_Pass_By_Copy, seq_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:36

  --*
  -- * seq_get_buf - get buffer to write arbitrary data to
  -- * @m: the seq_file handle
  -- * @bufp: the beginning of the buffer is stored here
  -- *
  -- * Return the number of bytes available in the buffer, or zero if
  -- * there's no space.
  --  

   function seq_get_buf (m : access seq_file; bufp : System.Address) return linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:53
   pragma Import (CPP, seq_get_buf, "_ZL11seq_get_bufP8seq_filePPc");

  --*
  -- * seq_commit - commit data to the buffer
  -- * @m: the seq_file handle
  -- * @num: the number of bytes to commit
  -- *
  -- * Commit @num bytes of data written to a buffer previously acquired
  -- * by seq_buf_get.  To signal an error condition, or that the data
  -- * didn't fit in the available space, pass a negative @num value.
  --  

   procedure seq_commit (m : access seq_file; num : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:73
   pragma Import (CPP, seq_commit, "_ZL10seq_commitP8seq_filei");

  --*
  -- * seq_setwidth - set padding width
  -- * @m: the seq_file handle
  -- * @size: the max number of bytes to pad.
  -- *
  -- * Call seq_setwidth() for setting max width, then call seq_printf() etc. and
  -- * finally call seq_pad() to pad the remaining bytes.
  --  

   procedure seq_setwidth (m : access seq_file; size : linux_types_h.size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:91
   pragma Import (CPP, seq_setwidth, "_ZL12seq_setwidthP8seq_filem");

   procedure seq_pad (m : access seq_file; c : char);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:95
   pragma Import (CPP, seq_pad, "_Z7seq_padP8seq_filec");

   function mangle_path
     (s : Interfaces.C.Strings.chars_ptr;
      p : Interfaces.C.Strings.chars_ptr;
      esc : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:97
   pragma Import (CPP, mangle_path, "_Z11mangle_pathPcPKcS1_");

   function seq_open (arg1 : access linux_fs_h.file; arg2 : access constant seq_operations) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:98
   pragma Import (CPP, seq_open, "_Z8seq_openP4filePK14seq_operations");

   function seq_read
     (arg1 : access linux_fs_h.file;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : linux_types_h.size_t;
      arg4 : access linux_types_h.loff_t) return linux_types_h.ssize_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:99
   pragma Import (CPP, seq_read, "_Z8seq_readP4filePcmPx");

   function seq_lseek
     (arg1 : access linux_fs_h.file;
      arg2 : linux_types_h.loff_t;
      arg3 : int) return linux_types_h.loff_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:100
   pragma Import (CPP, seq_lseek, "_Z9seq_lseekP4filexi");

   function seq_release (arg1 : access linux_fs_h.inode; arg2 : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:101
   pragma Import (CPP, seq_release, "_Z11seq_releaseP5inodeP4file");

   function seq_escape
     (arg1 : access seq_file;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:102
   pragma Import (CPP, seq_escape, "_Z10seq_escapeP8seq_filePKcS2_");

   function seq_putc (m : access seq_file; c : char) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:103
   pragma Import (CPP, seq_putc, "_Z8seq_putcP8seq_filec");

   function seq_puts (m : access seq_file; s : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:104
   pragma Import (CPP, seq_puts, "_Z8seq_putsP8seq_filePKc");

   function seq_write
     (seq : access seq_file;
      data : System.Address;
      len : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:105
   pragma Import (CPP, seq_write, "_Z9seq_writeP8seq_filePKvm");

   function seq_printf (arg1 : access seq_file; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:107
   pragma Import (CPP, seq_printf, "_Z10seq_printfP8seq_filePKcz");

   function seq_vprintf
     (arg1 : access seq_file;
      arg2 : Interfaces.C.Strings.chars_ptr;
      args : access System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:108
   pragma Import (CPP, seq_vprintf, "_Z11seq_vprintfP8seq_filePKcP13__va_list_tag");

   function seq_path
     (arg1 : access seq_file;
      arg2 : access constant linux_path_h.path;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:110
   pragma Import (CPP, seq_path, "_Z8seq_pathP8seq_filePK4pathPKc");

   function seq_dentry
     (arg1 : access seq_file;
      arg2 : access linux_dcache_h.dentry;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:111
   pragma Import (CPP, seq_dentry, "_Z10seq_dentryP8seq_fileP6dentryPKc");

   function seq_path_root
     (m : access seq_file;
      the_path : access constant linux_path_h.path;
      root : access constant linux_path_h.path;
      esc : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:112
   pragma Import (CPP, seq_path_root, "_Z13seq_path_rootP8seq_filePK4pathS3_PKc");

   function seq_bitmap
     (m : access seq_file;
      bits : access unsigned_long;
      nr_bits : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:114
   pragma Import (CPP, seq_bitmap, "_Z10seq_bitmapP8seq_filePKmj");

   function seq_cpumask (m : access seq_file; mask : access constant linux_cpumask_h.cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:116
   pragma Import (CPP, seq_cpumask, "_ZL11seq_cpumaskP8seq_filePK7cpumask");

   function seq_nodemask (m : access seq_file; mask : access linux_nodemask_h.nodemask_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:121
   pragma Import (CPP, seq_nodemask, "_ZL12seq_nodemaskP8seq_fileP10nodemask_t");

   function seq_bitmap_list
     (m : access seq_file;
      bits : access unsigned_long;
      nr_bits : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:126
   pragma Import (CPP, seq_bitmap_list, "_Z15seq_bitmap_listP8seq_filePKmj");

   function seq_cpumask_list (m : access seq_file; mask : access constant linux_cpumask_h.cpumask) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:129
   pragma Import (CPP, seq_cpumask_list, "_ZL16seq_cpumask_listP8seq_filePK7cpumask");

   function seq_nodemask_list (m : access seq_file; mask : access linux_nodemask_h.nodemask_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:135
   pragma Import (CPP, seq_nodemask_list, "_ZL17seq_nodemask_listP8seq_fileP10nodemask_t");

   function single_open
     (arg1 : access linux_fs_h.file;
      arg2 : access function (arg1 : access seq_file; arg2 : System.Address) return int;
      arg3 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:140
   pragma Import (CPP, single_open, "_Z11single_openP4filePFiP8seq_filePvES3_");

   function single_open_size
     (arg1 : access linux_fs_h.file;
      arg2 : access function (arg1 : access seq_file; arg2 : System.Address) return int;
      arg3 : System.Address;
      arg4 : linux_types_h.size_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:141
   pragma Import (CPP, single_open_size, "_Z16single_open_sizeP4filePFiP8seq_filePvES3_m");

   function single_release (arg1 : access linux_fs_h.inode; arg2 : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:142
   pragma Import (CPP, single_release, "_Z14single_releaseP5inodeP4file");

   --  skipped func __seq_open_private

   function seq_open_private
     (arg1 : access linux_fs_h.file;
      arg2 : access constant seq_operations;
      arg3 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:144
   pragma Import (CPP, seq_open_private, "_Z16seq_open_privateP4filePK14seq_operationsi");

   function seq_release_private (arg1 : access linux_fs_h.inode; arg2 : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:145
   pragma Import (CPP, seq_release_private, "_Z19seq_release_privateP5inodeP4file");

   function seq_put_decimal_ull
     (m : access seq_file;
      delimiter : char;
      num : Extensions.unsigned_long_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:146
   pragma Import (CPP, seq_put_decimal_ull, "_Z19seq_put_decimal_ullP8seq_filecy");

   function seq_put_decimal_ll
     (m : access seq_file;
      delimiter : char;
      num : Long_Long_Integer) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:148
   pragma Import (CPP, seq_put_decimal_ll, "_Z18seq_put_decimal_llP8seq_filecx");

   function seq_user_ns (seq : access seq_file) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:151
   pragma Import (CPP, seq_user_ns, "_ZL11seq_user_nsP8seq_file");

  -- * Helpers for iteration over list_head-s in seq_files
  --  

   function seq_list_start (head : access linux_types_h.list_head; pos : linux_types_h.loff_t) return access linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:166
   pragma Import (CPP, seq_list_start, "_Z14seq_list_startP9list_headx");

   function seq_list_start_head (head : access linux_types_h.list_head; pos : linux_types_h.loff_t) return access linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:168
   pragma Import (CPP, seq_list_start_head, "_Z19seq_list_start_headP9list_headx");

   function seq_list_next
     (v : System.Address;
      head : access linux_types_h.list_head;
      ppos : access linux_types_h.loff_t) return access linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:170
   pragma Import (CPP, seq_list_next, "_Z13seq_list_nextPvP9list_headPx");

  -- * Helpers for iteration over hlist_head-s in seq_files
  --  

   function seq_hlist_start (head : access linux_types_h.hlist_head; pos : linux_types_h.loff_t) return access linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:177
   pragma Import (CPP, seq_hlist_start, "_Z15seq_hlist_startP10hlist_headx");

   function seq_hlist_start_head (head : access linux_types_h.hlist_head; pos : linux_types_h.loff_t) return access linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:179
   pragma Import (CPP, seq_hlist_start_head, "_Z20seq_hlist_start_headP10hlist_headx");

   function seq_hlist_next
     (v : System.Address;
      head : access linux_types_h.hlist_head;
      ppos : access linux_types_h.loff_t) return access linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:181
   pragma Import (CPP, seq_hlist_next, "_Z14seq_hlist_nextPvP10hlist_headPx");

   function seq_hlist_start_rcu (head : access linux_types_h.hlist_head; pos : linux_types_h.loff_t) return access linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:184
   pragma Import (CPP, seq_hlist_start_rcu, "_Z19seq_hlist_start_rcuP10hlist_headx");

   function seq_hlist_start_head_rcu (head : access linux_types_h.hlist_head; pos : linux_types_h.loff_t) return access linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:186
   pragma Import (CPP, seq_hlist_start_head_rcu, "_Z24seq_hlist_start_head_rcuP10hlist_headx");

   function seq_hlist_next_rcu
     (v : System.Address;
      head : access linux_types_h.hlist_head;
      ppos : access linux_types_h.loff_t) return access linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:188
   pragma Import (CPP, seq_hlist_next_rcu, "_Z18seq_hlist_next_rcuPvP10hlist_headPx");

  -- Helpers for iterating over per-cpu hlist_head-s in seq_files  
   function seq_hlist_start_percpu
     (head : access linux_types_h.hlist_head;
      cpu : access int;
      pos : linux_types_h.loff_t) return access linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:193
   pragma Import (CPP, seq_hlist_start_percpu, "_Z22seq_hlist_start_percpuP10hlist_headPix");

   function seq_hlist_next_percpu
     (v : System.Address;
      head : access linux_types_h.hlist_head;
      cpu : access int;
      pos : access linux_types_h.loff_t) return access linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file.h:195
   pragma Import (CPP, seq_hlist_next_percpu, "_Z21seq_hlist_next_percpuPvP10hlist_headPiPx");

end linux_seq_file_h;

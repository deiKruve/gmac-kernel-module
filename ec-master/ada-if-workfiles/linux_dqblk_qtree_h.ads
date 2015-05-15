pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with linux_quota_h;
limited with linux_fs_h;
with Interfaces.C.Strings;

package linux_dqblk_qtree_h is

   --  unsupported macro: QTREE_INIT_ALLOC 4
   --  unsupported macro: QTREE_INIT_REWRITE 2
   --  unsupported macro: QTREE_DEL_ALLOC 0
   --  unsupported macro: QTREE_DEL_REWRITE 6
  -- *	Definitions of structures and functions for quota formats using trie
  --  

  -- Numbers of blocks needed for updates - we count with the smallest
  -- * possible block size (1024)  

  -- Operations  
  -- Convert given entry from in memory format to disk one  
   type qtree_fmt_operations is record
      mem2disk_dqblk : access procedure (arg1 : System.Address; arg2 : access linux_quota_h.dquot);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:21
      disk2mem_dqblk : access procedure (arg1 : access linux_quota_h.dquot; arg2 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:22
      is_id : access function (arg1 : System.Address; arg2 : access linux_quota_h.dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:23
   end record;
   pragma Convention (C_Pass_By_Copy, qtree_fmt_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:20

  -- Convert given entry from disk format to in memory one  
  -- Is this structure for given id?  
  -- Inmemory copy of version specific information  
  -- Sb quota is on  
   type qtree_mem_dqinfo is record
      dqi_sb : access linux_fs_h.super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:28
      dqi_type : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:29
      dqi_blocks : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:30
      dqi_free_blk : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:31
      dqi_free_entry : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:32
      dqi_blocksize_bits : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:33
      dqi_entry_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:34
      dqi_usable_bs : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:35
      dqi_qtree_depth : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:36
      dqi_ops : access qtree_fmt_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, qtree_mem_dqinfo);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:27

  -- Quota type  
  -- # of blocks in quota file  
  -- First block in list of free blocks  
  -- First block with free entry  
  -- Block size of quota file  
  -- Size of quota entry in quota file  
  -- Space usable in block for quota data  
  -- Precomputed depth of quota tree  
  -- Operations for entry manipulation  
   function qtree_write_dquot (info : access qtree_mem_dqinfo; the_dquot : access linux_quota_h.dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:40
   pragma Import (CPP, qtree_write_dquot, "_Z17qtree_write_dquotP16qtree_mem_dqinfoP5dquot");

   function qtree_read_dquot (info : access qtree_mem_dqinfo; the_dquot : access linux_quota_h.dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:41
   pragma Import (CPP, qtree_read_dquot, "_Z16qtree_read_dquotP16qtree_mem_dqinfoP5dquot");

   function qtree_delete_dquot (info : access qtree_mem_dqinfo; the_dquot : access linux_quota_h.dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:42
   pragma Import (CPP, qtree_delete_dquot, "_Z18qtree_delete_dquotP16qtree_mem_dqinfoP5dquot");

   function qtree_release_dquot (info : access qtree_mem_dqinfo; the_dquot : access linux_quota_h.dquot) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:43
   pragma Import (CPP, qtree_release_dquot, "_Z19qtree_release_dquotP16qtree_mem_dqinfoP5dquot");

   function qtree_entry_unused (info : access qtree_mem_dqinfo; disk : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:44
   pragma Import (CPP, qtree_entry_unused, "_Z18qtree_entry_unusedP16qtree_mem_dqinfoPc");

   function qtree_depth (info : access qtree_mem_dqinfo) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dqblk_qtree.h:45
   pragma Import (CPP, qtree_depth, "_ZL11qtree_depthP16qtree_mem_dqinfo");

end linux_dqblk_qtree_h;

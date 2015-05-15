pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with linux_types_h;
with linux_seqlock_h;
with linux_list_bl_h;
limited with linux_fs_h;
with linux_lockref_h;
with System;
with Interfaces.C.Strings;
limited with linux_path_h;
with Interfaces.C.Extensions;

package linux_dcache_h is

   --  arg-macro: function IS_ROOT ((x) = (x).d_parent
   --    return (x) = (x).d_parent;
   --  unsupported macro: HASH_LEN_DECLARE u32 hash; u32 len;
   --  arg-macro: function bytemask_from_count (~(~0ul << (cnt)*8)
   --    return ~(~0ul << (cnt)*8);
   --  arg-macro: procedure QSTR_INIT { { { .len := l } }, .name := n }
   --    { { { .len := l } }, .name := n }
   --  arg-macro: function hashlen_hash ((u32) (hashlen)
   --    return (u32) (hashlen);
   --  arg-macro: function hashlen_len ((u32)((hashlen) >> 32)
   --    return (u32)((hashlen) >> 32);
   --  arg-macro: procedure init_name_hash 0
   --    0
   --  unsupported macro: DNAME_INLINE_LEN 32
   --  unsupported macro: d_lock d_lockref.lock
   --  unsupported macro: DCACHE_OP_HASH 0x00000001
   --  unsupported macro: DCACHE_OP_COMPARE 0x00000002
   --  unsupported macro: DCACHE_OP_REVALIDATE 0x00000004
   --  unsupported macro: DCACHE_OP_DELETE 0x00000008
   --  unsupported macro: DCACHE_OP_PRUNE 0x00000010
   --  unsupported macro: DCACHE_DISCONNECTED 0x00000020
   --  unsupported macro: DCACHE_REFERENCED 0x00000040
   --  unsupported macro: DCACHE_RCUACCESS 0x00000080
   --  unsupported macro: DCACHE_CANT_MOUNT 0x00000100
   --  unsupported macro: DCACHE_GENOCIDE 0x00000200
   --  unsupported macro: DCACHE_SHRINK_LIST 0x00000400
   --  unsupported macro: DCACHE_OP_WEAK_REVALIDATE 0x00000800
   --  unsupported macro: DCACHE_NFSFS_RENAMED 0x00001000
   --  unsupported macro: DCACHE_COOKIE 0x00002000
   --  unsupported macro: DCACHE_FSNOTIFY_PARENT_WATCHED 0x00004000
   --  unsupported macro: DCACHE_DENTRY_KILLED 0x00008000
   --  unsupported macro: DCACHE_MOUNTED 0x00010000
   --  unsupported macro: DCACHE_NEED_AUTOMOUNT 0x00020000
   --  unsupported macro: DCACHE_MANAGE_TRANSIT 0x00040000
   --  unsupported macro: DCACHE_MANAGED_DENTRY (DCACHE_MOUNTED|DCACHE_NEED_AUTOMOUNT|DCACHE_MANAGE_TRANSIT)
   --  unsupported macro: DCACHE_LRU_LIST 0x00080000
   --  unsupported macro: DCACHE_ENTRY_TYPE 0x00700000
   --  unsupported macro: DCACHE_MISS_TYPE 0x00000000
   --  unsupported macro: DCACHE_DIRECTORY_TYPE 0x00100000
   --  unsupported macro: DCACHE_AUTODIR_TYPE 0x00200000
   --  unsupported macro: DCACHE_SYMLINK_TYPE 0x00300000
   --  unsupported macro: DCACHE_FILE_TYPE 0x00400000
   --  unsupported macro: DCACHE_MAY_FREE 0x00800000
   --  skipped empty struct nameidata

   --  skipped empty struct vfsmount

  -- * linux/include/linux/dcache.h
  -- *
  -- * Dirent cache data structures
  -- *
  -- * (C) Copyright 1997 Thomas Schoebel-Theuer,
  -- * with heavy changes by Linus Torvalds
  --  

  -- The hash is always the low bits of hash_len  
  -- * "quick string" -- eases parameter passing, but more importantly
  -- * saves "metadata" about the string (ie length and the hash).
  -- *
  -- * hash comes first so it snuggles against d_parent in the
  -- * dentry.
  --  

   type anon_182;
   type anon_183 is record
      hash : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:48
      len : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:48
   end record;
   pragma Convention (C_Pass_By_Copy, anon_183);
   type anon_182 (discr : unsigned := 0) is record
      case discr is
            parent : aliased anon_183;
         when others =>
            hash_len : aliased asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:50
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_182);
   pragma Unchecked_Union (anon_182);
   type qstr is record
      parent : aliased anon_182;
      name : access unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:52
   end record;
   pragma Convention (C_Pass_By_Copy, qstr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:45

   type dentry_stat_t_dummy_array is array (0 .. 1) of aliased long;
   type dentry_stat_t is record
      nr_dentry : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:60
      nr_unused : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:61
      age_limit : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:62
      want_pages : aliased long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:63
      dummy : aliased dentry_stat_t_dummy_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:64
   end record;
   pragma Convention (C_Pass_By_Copy, dentry_stat_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:59

  -- age in seconds  
  -- pages requested by system  
   dentry_stat : aliased dentry_stat_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:66
   pragma Import (C, dentry_stat, "dentry_stat");

  -- Name hashing routines. Initial hash value  
  -- Hash courtesy of the R5 hash in reiserfs modulo sign bits  
  -- partial hash update function. Assume roughly 4 bits per character  
   function partial_name_hash (c : unsigned_long; prevhash : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:74
   pragma Import (CPP, partial_name_hash, "_ZL17partial_name_hashmm");

  -- * Finally: cut down the number of bits to a int value (and try to avoid
  -- * losing bits)
  --  

   function end_name_hash (hash : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:83
   pragma Import (CPP, end_name_hash, "_ZL13end_name_hashm");

  -- Compute the hash for a name string.  
   function full_name_hash (arg1 : access unsigned_char; arg2 : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:89
   pragma Import (CPP, full_name_hash, "_Z14full_name_hashPKhj");

  -- * Try to keep struct dentry aligned on 64 byte cachelines (this will
  -- * give reasonable cacheline footprint with larger lines without the
  -- * large memory footprint increase).
  --  

  -- RCU lookup touched fields  
  -- protected by d_lock  
   type dentry_d_iname_array is array (0 .. 31) of aliased unsigned_char;
   type dentry_operations;
   type anon_184 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            d_alias : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:147
         when others =>
            d_rcu : aliased linux_types_h.callback_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:149
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_184);
   pragma Unchecked_Union (anon_184);
   type dentry is record
      d_flags : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:110
      d_seq : aliased linux_seqlock_h.seqcount_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:111
      d_hash : aliased linux_list_bl_h.hlist_bl_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:112
      d_parent : access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:113
      d_name : aliased qstr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:114
      d_inode : access linux_fs_h.inode;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:115
      d_iname : aliased dentry_d_iname_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:117
      d_lockref : aliased linux_lockref_h.lockref;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:120
      d_op : access constant dentry_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:121
      d_sb : access linux_fs_h.super_block;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:122
      d_time : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:123
      d_fsdata : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:124
      d_lru : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:126
      d_child : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:135
      d_subdirs : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:140
      d_u : anon_184;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:150
   end record;
   pragma Convention (C_Pass_By_Copy, dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:108

  -- per dentry seqlock  
  -- lookup hash list  
  -- parent directory  
  -- Where the name belongs to - NULL is
  --					 * negative  

  -- small names  
  -- Ref lookup also touches following  
  -- per-dentry lock and refcount  
  -- The root of the dentry tree  
  -- used by d_revalidate  
  -- fs-specific data  
  -- LRU list  
  --	 * bwh: The union changes here don't move anything other than
  --	 * d_rcu (which modules definitely should not touch).  This is
  --	 * checked by dcache_abi_check().
  --	  

  -- child of parent list  
  -- our children  
  --	 * d_alias and d_rcu can share memory
  --	  

  -- inode alias list  
  -- * dentry->d_lock spinlock nesting subclasses:
  -- *
  -- * 0: normal
  -- * 1: nested
  --  

   type dentry_d_lock_class is 
     (DENTRY_D_LOCK_NORMAL,
      DENTRY_D_LOCK_NESTED);
   pragma Convention (C, dentry_d_lock_class);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:160

  -- implicitly used by plain spin_lock() APIs.  
   type dentry_operations is record
      d_revalidate : access function (arg1 : access dentry; arg2 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:167
      d_weak_revalidate : access function (arg1 : access dentry; arg2 : unsigned) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:168
      d_hash : access function (arg1 : access constant dentry; arg2 : access qstr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:169
      d_compare : access function
           (arg1 : access constant dentry;
            arg2 : access constant dentry;
            arg3 : unsigned;
            arg4 : Interfaces.C.Strings.chars_ptr;
            arg5 : access constant qstr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:171
      d_delete : access function (arg1 : access constant dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:172
      d_release : access procedure (arg1 : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:173
      d_prune : access procedure (arg1 : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:174
      d_iput : access procedure (arg1 : access dentry; arg2 : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:175
      d_dname : access function
           (arg1 : access dentry;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:176
      d_automount : access function (arg1 : access linux_path_h.path) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:177
      d_manage : access function (arg1 : access dentry; arg2 : Extensions.bool) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:178
   end record;
   pragma Convention (C_Pass_By_Copy, dentry_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:166

  -- * Locking rules for dentry_operations callbacks are to be found in
  -- * Documentation/filesystems/Locking. Keep it updated!
  -- *
  -- * FUrther descriptions are found in Documentation/filesystems/vfs.txt.
  -- * Keep it updated too!
  --  

  -- d_flags entries  
  -- This dentry is possibly not currently connected to the dcache tree, in
  --      * which case its parent will either be itself, or will have this flag as
  --      * well.  nfsd will not use a dentry with this bit set, but will first
  --      * endeavour to clear the bit either by discovering that it is connected,
  --      * or by performing lookup operations.   Any filesystem which supports
  --      * nfsd_operations MUST have a lookup function which, if it finds a
  --      * directory inode with a DCACHE_DISCONNECTED dentry, will d_move that
  --      * dentry into place and return that dentry rather than the passed one,
  --      * typically using d_splice_alias.  

  -- this dentry has been "silly renamed" and has to be deleted on the last
  --      * dput()  

  -- Parent inode is watched by some fsnotify listener  
   rename_lock : aliased linux_seqlock_h.seqlock_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:242
   pragma Import (C, rename_lock, "rename_lock");

   function dname_external (the_dentry : access constant dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:244
   pragma Import (CPP, dname_external, "_ZL14dname_externalPK6dentry");

  -- * These are the low-level FS interfaces to the dcache..
  --  

   procedure d_instantiate (arg1 : access dentry; arg2 : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:252
   pragma Import (CPP, d_instantiate, "_Z13d_instantiateP6dentryP5inode");

   function d_instantiate_unique (arg1 : access dentry; arg2 : access linux_fs_h.inode) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:253
   pragma Import (CPP, d_instantiate_unique, "_Z20d_instantiate_uniqueP6dentryP5inode");

   function d_materialise_unique (arg1 : access dentry; arg2 : access linux_fs_h.inode) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:254
   pragma Import (CPP, d_materialise_unique, "_Z20d_materialise_uniqueP6dentryP5inode");

   function d_instantiate_no_diralias (arg1 : access dentry; arg2 : access linux_fs_h.inode) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:255
   pragma Import (CPP, d_instantiate_no_diralias, "_Z25d_instantiate_no_diraliasP6dentryP5inode");

   --  skipped func __d_drop

   procedure d_drop (the_dentry : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:257
   pragma Import (CPP, d_drop, "_Z6d_dropP6dentry");

   procedure d_delete (arg1 : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:258
   pragma Import (CPP, d_delete, "_Z8d_deleteP6dentry");

   procedure d_set_d_op (the_dentry : access dentry; op : access constant dentry_operations);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:259
   pragma Import (CPP, d_set_d_op, "_Z10d_set_d_opP6dentryPK17dentry_operations");

  -- allocate/de-allocate  
   function d_alloc (arg1 : access dentry; arg2 : access constant qstr) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:262
   pragma Import (CPP, d_alloc, "_Z7d_allocP6dentryPK4qstr");

   function d_alloc_pseudo (arg1 : access linux_fs_h.super_block; arg2 : access constant qstr) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:263
   pragma Import (CPP, d_alloc_pseudo, "_Z14d_alloc_pseudoP11super_blockPK4qstr");

   function d_splice_alias (arg1 : access linux_fs_h.inode; arg2 : access dentry) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:264
   pragma Import (CPP, d_splice_alias, "_Z14d_splice_aliasP5inodeP6dentry");

   function d_add_ci
     (arg1 : access dentry;
      arg2 : access linux_fs_h.inode;
      arg3 : access qstr) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:265
   pragma Import (CPP, d_add_ci, "_Z8d_add_ciP6dentryP5inodeP4qstr");

   function d_find_any_alias (the_inode : access linux_fs_h.inode) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:266
   pragma Import (CPP, d_find_any_alias, "_Z16d_find_any_aliasP5inode");

   function d_obtain_alias (arg1 : access linux_fs_h.inode) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:267
   pragma Import (CPP, d_obtain_alias, "_Z14d_obtain_aliasP5inode");

   procedure shrink_dcache_sb (arg1 : access linux_fs_h.super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:268
   pragma Import (CPP, shrink_dcache_sb, "_Z16shrink_dcache_sbP11super_block");

   procedure shrink_dcache_parent (arg1 : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:269
   pragma Import (CPP, shrink_dcache_parent, "_Z20shrink_dcache_parentP6dentry");

   procedure shrink_dcache_for_umount (arg1 : access linux_fs_h.super_block);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:270
   pragma Import (CPP, shrink_dcache_for_umount, "_Z24shrink_dcache_for_umountP11super_block");

   function d_invalidate (arg1 : access dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:271
   pragma Import (CPP, d_invalidate, "_Z12d_invalidateP6dentry");

  -- only used at mount-time  
   function d_make_root (arg1 : access linux_fs_h.inode) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:274
   pragma Import (CPP, d_make_root, "_Z11d_make_rootP5inode");

  -- <clickety>-<click> the ramfs-type tree  
   procedure d_genocide (arg1 : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:277
   pragma Import (CPP, d_genocide, "_Z10d_genocideP6dentry");

   procedure d_tmpfile (arg1 : access dentry; arg2 : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:279
   pragma Import (CPP, d_tmpfile, "_Z9d_tmpfileP6dentryP5inode");

   function d_find_alias (arg1 : access linux_fs_h.inode) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:281
   pragma Import (CPP, d_find_alias, "_Z12d_find_aliasP5inode");

   procedure d_prune_aliases (arg1 : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:282
   pragma Import (CPP, d_prune_aliases, "_Z15d_prune_aliasesP5inode");

  -- test whether we have any submounts in a subdir tree  
   function have_submounts (arg1 : access dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:285
   pragma Import (CPP, have_submounts, "_Z14have_submountsP6dentry");

   function check_submounts_and_drop (arg1 : access dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:286
   pragma Import (CPP, check_submounts_and_drop, "_Z24check_submounts_and_dropP6dentry");

  -- * This adds the entry to the hash queues.
  --  

   procedure d_rehash (arg1 : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:291
   pragma Import (CPP, d_rehash, "_Z8d_rehashP6dentry");

  --*
  -- * d_add - add dentry to hash queues
  -- * @entry: dentry to add
  -- * @inode: The inode to attach to this dentry
  -- *
  -- * This adds the entry to the hash queues and initializes @inode.
  -- * The entry was actually filled in earlier during d_alloc().
  --  

   procedure d_add (c_entry : access dentry; the_inode : access linux_fs_h.inode);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:302
   pragma Import (CPP, d_add, "_ZL5d_addP6dentryP5inode");

  --*
  -- * d_add_unique - add dentry to hash queues without aliasing
  -- * @entry: dentry to add
  -- * @inode: The inode to attach to this dentry
  -- *
  -- * This adds the entry to the hash queues and initializes @inode.
  -- * The entry was actually filled in earlier during d_alloc().
  --  

   function d_add_unique (c_entry : access dentry; the_inode : access linux_fs_h.inode) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:316
   pragma Import (CPP, d_add_unique, "_ZL12d_add_uniqueP6dentryP5inode");

   procedure dentry_update_name_case (arg1 : access dentry; arg2 : access qstr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:325
   pragma Import (CPP, dentry_update_name_case, "_Z23dentry_update_name_caseP6dentryP4qstr");

  -- used for rename() and baskets  
   procedure d_move (arg1 : access dentry; arg2 : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:328
   pragma Import (CPP, d_move, "_Z6d_moveP6dentryS0_");

   procedure d_exchange (arg1 : access dentry; arg2 : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:329
   pragma Import (CPP, d_exchange, "_Z10d_exchangeP6dentryS0_");

   function d_ancestor (arg1 : access dentry; arg2 : access dentry) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:330
   pragma Import (CPP, d_ancestor, "_Z10d_ancestorP6dentryS0_");

  -- appendix may either be NULL or be used for transname suffixes  
   function d_lookup (arg1 : access constant dentry; arg2 : access constant qstr) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:333
   pragma Import (CPP, d_lookup, "_Z8d_lookupPK6dentryPK4qstr");

   function d_hash_and_lookup (arg1 : access dentry; arg2 : access qstr) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:334
   pragma Import (CPP, d_hash_and_lookup, "_Z17d_hash_and_lookupP6dentryP4qstr");

   --  skipped func __d_lookup

   --  skipped func __d_lookup_rcu

   function d_count (the_dentry : access constant dentry) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:339
   pragma Import (CPP, d_count, "_ZL7d_countPK6dentry");

  -- validate "insecure" dentry pointer  
   function d_validate (arg1 : access dentry; arg2 : access dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:345
   pragma Import (CPP, d_validate, "_Z10d_validateP6dentryS0_");

  -- * helper function for dentry_operations.d_dname() members
  --  

   function dynamic_dname
     (arg1 : access dentry;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:350
   pragma Import (CPP, dynamic_dname, "_Z13dynamic_dnameP6dentryPciPKcz");

   function simple_dname
     (arg1 : access dentry;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:351
   pragma Import (CPP, simple_dname, "_Z12simple_dnameP6dentryPci");

   --  skipped func __d_path

   function d_absolute_path
     (arg1 : access constant linux_path_h.path;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:354
   pragma Import (CPP, d_absolute_path, "_Z15d_absolute_pathPK4pathPci");

   function d_path
     (arg1 : access constant linux_path_h.path;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:355
   pragma Import (CPP, d_path, "_Z6d_pathPK4pathPci");

   function dentry_path_raw
     (arg1 : access dentry;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:356
   pragma Import (CPP, dentry_path_raw, "_Z15dentry_path_rawP6dentryPci");

   function dentry_path
     (arg1 : access dentry;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:357
   pragma Import (CPP, dentry_path, "_Z11dentry_pathP6dentryPci");

  -- Allocation counts..  
  --*
  -- *	dget, dget_dlock -	get a reference to a dentry
  -- *	@dentry: dentry to get a reference to
  -- *
  -- *	Given a dentry or %NULL pointer increment the reference count
  -- *	if appropriate and return the dentry. A dentry will not be 
  -- *	destroyed when it has references.
  --  

   function dget_dlock (the_dentry : access dentry) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:369
   pragma Import (CPP, dget_dlock, "_ZL10dget_dlockP6dentry");

   function dget (the_dentry : access dentry) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:376
   pragma Import (CPP, dget, "_ZL4dgetP6dentry");

   function dget_parent (the_dentry : access dentry) return access dentry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:383
   pragma Import (CPP, dget_parent, "_Z11dget_parentP6dentry");

  --*
  -- *	d_unhashed -	is dentry hashed
  -- *	@dentry: entry to check
  -- *
  -- *	Returns true if the dentry passed is not currently hashed.
  --  

   function d_unhashed (the_dentry : access constant dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:392
   pragma Import (CPP, d_unhashed, "_ZL10d_unhashedPK6dentry");

   function d_unlinked (the_dentry : access constant dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:397
   pragma Import (CPP, d_unlinked, "_ZL10d_unlinkedPK6dentry");

   function cant_mount (the_dentry : access constant dentry) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:402
   pragma Import (CPP, cant_mount, "_ZL10cant_mountPK6dentry");

   procedure dont_mount (the_dentry : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:407
   pragma Import (CPP, dont_mount, "_ZL10dont_mountP6dentry");

   procedure dput (arg1 : access dentry);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:414
   pragma Import (CPP, dput, "_Z4dputP6dentry");

   function d_managed (the_dentry : access constant dentry) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:416
   pragma Import (CPP, d_managed, "_ZL9d_managedPK6dentry");

   function d_mountpoint (the_dentry : access constant dentry) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:421
   pragma Import (CPP, d_mountpoint, "_ZL12d_mountpointPK6dentry");

  -- * Directory cache entry type accessor functions.
  --  

   --  skipped func __d_set_type

   --  skipped func __d_clear_type

   procedure d_set_type (the_dentry : access dentry; c_type : unsigned);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:439
   pragma Import (CPP, d_set_type, "_ZL10d_set_typeP6dentryj");

   --  skipped func __d_entry_type

   function d_can_lookup (the_dentry : access constant dentry) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:451
   pragma Import (CPP, d_can_lookup, "_ZL12d_can_lookupPK6dentry");

   function d_is_autodir (the_dentry : access constant dentry) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:456
   pragma Import (CPP, d_is_autodir, "_ZL12d_is_autodirPK6dentry");

   function d_is_dir (the_dentry : access constant dentry) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:461
   pragma Import (CPP, d_is_dir, "_ZL8d_is_dirPK6dentry");

   function d_is_symlink (the_dentry : access constant dentry) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:466
   pragma Import (CPP, d_is_symlink, "_ZL12d_is_symlinkPK6dentry");

   function d_is_file (the_dentry : access constant dentry) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:471
   pragma Import (CPP, d_is_file, "_ZL9d_is_filePK6dentry");

   function d_is_negative (the_dentry : access constant dentry) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:476
   pragma Import (CPP, d_is_negative, "_ZL13d_is_negativePK6dentry");

   function d_is_positive (the_dentry : access constant dentry) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:481
   pragma Import (CPP, d_is_positive, "_ZL13d_is_positivePK6dentry");

   sysctl_vfs_cache_pressure : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:486
   pragma Import (C, sysctl_vfs_cache_pressure, "sysctl_vfs_cache_pressure");

   function vfs_pressure_ratio (val : unsigned_long) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dcache.h:488
   pragma Import (CPP, vfs_pressure_ratio, "_ZL18vfs_pressure_ratiom");

end linux_dcache_h;

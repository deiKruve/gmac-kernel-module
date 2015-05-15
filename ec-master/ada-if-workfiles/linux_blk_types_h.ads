pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with linux_mm_types_h;
with linux_types_h;
limited with linux_fs_h;
with System;
limited with linux_cgroup_h;

package linux_blk_types_h is

   --  unsupported macro: BIO_RESET_BYTES offsetof(struct bio, bi_max_vecs)
   --  unsupported macro: BIO_UPTODATE 0
   --  unsupported macro: BIO_RW_BLOCK 1
   --  unsupported macro: BIO_EOF 2
   --  unsupported macro: BIO_SEG_VALID 3
   --  unsupported macro: BIO_CLONED 4
   --  unsupported macro: BIO_BOUNCED 5
   --  unsupported macro: BIO_USER_MAPPED 6
   --  unsupported macro: BIO_EOPNOTSUPP 7
   --  unsupported macro: BIO_NULL_MAPPED 8
   --  unsupported macro: BIO_FS_INTEGRITY 9
   --  unsupported macro: BIO_QUIET 10
   --  unsupported macro: BIO_MAPPED_INTEGRITY 11
   --  unsupported macro: BIO_SNAP_STABLE 12
   --  unsupported macro: BIO_RESET_BITS 13
   --  unsupported macro: BIO_OWNS_VEC 13
   --  arg-macro: function bio_flagged ((bio).bi_flags and (1 << (flag))
   --    return (bio).bi_flags and (1 << (flag));
   --  unsupported macro: BIO_POOL_BITS (4)
   --  unsupported macro: BIO_POOL_NONE ((1UL << BIO_POOL_BITS) - 1)
   --  unsupported macro: BIO_POOL_OFFSET (BITS_PER_LONG - BIO_POOL_BITS)
   --  unsupported macro: BIO_POOL_MASK (1UL << BIO_POOL_OFFSET)
   --  arg-macro: function BIO_POOL_IDX ((bio).bi_flags >> BIO_POOL_OFFSET
   --    return (bio).bi_flags >> BIO_POOL_OFFSET;
   --  unsupported macro: REQ_WRITE (1ULL << __REQ_WRITE)
   --  unsupported macro: REQ_FAILFAST_DEV (1ULL << __REQ_FAILFAST_DEV)
   --  unsupported macro: REQ_FAILFAST_TRANSPORT (1ULL << __REQ_FAILFAST_TRANSPORT)
   --  unsupported macro: REQ_FAILFAST_DRIVER (1ULL << __REQ_FAILFAST_DRIVER)
   --  unsupported macro: REQ_SYNC (1ULL << __REQ_SYNC)
   --  unsupported macro: REQ_META (1ULL << __REQ_META)
   --  unsupported macro: REQ_PRIO (1ULL << __REQ_PRIO)
   --  unsupported macro: REQ_DISCARD (1ULL << __REQ_DISCARD)
   --  unsupported macro: REQ_WRITE_SAME (1ULL << __REQ_WRITE_SAME)
   --  unsupported macro: REQ_NOIDLE (1ULL << __REQ_NOIDLE)
   --  unsupported macro: REQ_FAILFAST_MASK (REQ_FAILFAST_DEV | REQ_FAILFAST_TRANSPORT | REQ_FAILFAST_DRIVER)
   --  unsupported macro: REQ_COMMON_MASK (REQ_WRITE | REQ_FAILFAST_MASK | REQ_SYNC | REQ_META | REQ_PRIO | REQ_DISCARD | REQ_WRITE_SAME | REQ_NOIDLE | REQ_FLUSH | REQ_FUA | REQ_SECURE)
   --  unsupported macro: REQ_CLONE_MASK REQ_COMMON_MASK
   --  unsupported macro: BIO_NO_ADVANCE_ITER_MASK (REQ_DISCARD|REQ_WRITE_SAME)
   --  unsupported macro: REQ_NOMERGE_FLAGS (REQ_NOMERGE | REQ_STARTED | REQ_SOFTBARRIER | REQ_FLUSH | REQ_FUA)
   --  unsupported macro: REQ_RAHEAD (1ULL << __REQ_RAHEAD)
   --  unsupported macro: REQ_THROTTLED (1ULL << __REQ_THROTTLED)
   --  unsupported macro: REQ_SORTED (1ULL << __REQ_SORTED)
   --  unsupported macro: REQ_SOFTBARRIER (1ULL << __REQ_SOFTBARRIER)
   --  unsupported macro: REQ_FUA (1ULL << __REQ_FUA)
   --  unsupported macro: REQ_NOMERGE (1ULL << __REQ_NOMERGE)
   --  unsupported macro: REQ_STARTED (1ULL << __REQ_STARTED)
   --  unsupported macro: REQ_DONTPREP (1ULL << __REQ_DONTPREP)
   --  unsupported macro: REQ_QUEUED (1ULL << __REQ_QUEUED)
   --  unsupported macro: REQ_ELVPRIV (1ULL << __REQ_ELVPRIV)
   --  unsupported macro: REQ_FAILED (1ULL << __REQ_FAILED)
   --  unsupported macro: REQ_QUIET (1ULL << __REQ_QUIET)
   --  unsupported macro: REQ_PREEMPT (1ULL << __REQ_PREEMPT)
   --  unsupported macro: REQ_ALLOCED (1ULL << __REQ_ALLOCED)
   --  unsupported macro: REQ_COPY_USER (1ULL << __REQ_COPY_USER)
   --  unsupported macro: REQ_FLUSH (1ULL << __REQ_FLUSH)
   --  unsupported macro: REQ_FLUSH_SEQ (1ULL << __REQ_FLUSH_SEQ)
   --  unsupported macro: REQ_IO_STAT (1ULL << __REQ_IO_STAT)
   --  unsupported macro: REQ_MIXED_MERGE (1ULL << __REQ_MIXED_MERGE)
   --  unsupported macro: REQ_SECURE (1ULL << __REQ_SECURE)
   --  unsupported macro: REQ_KERNEL (1ULL << __REQ_KERNEL)
   --  unsupported macro: REQ_PM (1ULL << __REQ_PM)
   --  unsupported macro: REQ_END (1ULL << __REQ_END)
   --  unsupported macro: REQ_HASHED (1ULL << __REQ_HASHED)
   --  unsupported macro: REQ_MQ_INFLIGHT (1ULL << __REQ_MQ_INFLIGHT)
  -- * Block data types and constants.  Directly include this file only to
  -- * break include dependency loop.
  --  

   --  skipped empty struct bio_set

   --  skipped empty struct bio_integrity_payload

   --  skipped empty struct io_context

   --  skipped function type bio_end_io_t

   --  skipped function type bio_destructor_t

  -- * was unsigned short, but we might as well be ready for > 64kB I/O pages
  --  

   type bio_vec is record
      bv_page : access linux_mm_types_h.page;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:24
      bv_len : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:25
      bv_offset : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, bio_vec);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:23

  -- device address in 512 byte
  --						   sectors  

   type bvec_iter is record
      bi_sector : aliased linux_types_h.sector_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:32
      bi_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:34
      bi_idx : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:36
      bi_bvec_done : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, bvec_iter);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:31

  -- residual I/O count  
  -- current index into bvl_vec  
  -- number of bytes completed in
  --						   current bvec  

  -- * main unit of I/O for the block layer and lower layers (ie drivers and
  -- * stacking drivers)
  --  

  -- request queue link  
   type bio_bi_inline_vecs_array is array (0 .. -1) of aliased bio_vec;
   type bio is record
      bi_next : access bio;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:47
      bi_bdev : access linux_fs_h.block_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:48
      bi_flags : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:49
      bi_rw : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:50
      bi_iter : aliased bvec_iter;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:54
      bi_phys_segments : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:59
      bi_seg_front_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:65
      bi_seg_back_size : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:66
      bi_remaining : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:68
      bi_end_io : access procedure (arg1 : System.Address; arg2 : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:70
      bi_private : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:72
      bi_ioc : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:78
      bi_css : access linux_cgroup_h.cgroup_subsys_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:79
      bi_integrity : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:82
      bi_vcnt : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:85
      bi_max_vecs : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:91
      bi_cnt : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:93
      bi_io_vec : access bio_vec;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:95
      bi_pool : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:97
      bi_inline_vecs : aliased bio_bi_inline_vecs_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:104
   end record;
   pragma Convention (C_Pass_By_Copy, bio);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:46

  -- status, command, etc  
  -- bottom bits READ/WRITE,
  --						 * top bits priority
  --						  

  -- Number of segments in this BIO after
  --	 * physical address coalescing is performed.
  --	  

  --	 * To keep track of the max segment size, we account for the
  --	 * sizes of the first and last mergeable segments in this bio.
  --	  

  --	 * Optional ioc and css associated with this bio.  Put on bio
  --	 * release.  Read comment on top of bio_associate_current().
  --	  

  -- data integrity  
  -- how many bio_vec's  
  --	 * Everything starting with bi_max_vecs will be preserved by bio_reset()
  --	  

  -- max bvl_vecs we can hold  
  -- pin count  
  -- the actual vec list  
  --	 * We can inline a number of vecs at the end of the bio, to avoid
  --	 * double allocations for a small number of bio_vecs. This member
  --	 * MUST obviously be kept at the very end of the bio.
  --	  

  -- * bio flags
  --  

  -- * Flags starting here get preserved by bio_reset() - this includes
  -- * BIO_POOL_IDX()
  --  

  -- * top 4 bits of bio flags indicate the pool this bio came from
  --  

  -- * Request flags.  For use in the cmd_flags field of struct request, and in
  -- * bi_rw of struct bio.  Note that some flags are only valid in either one.
  --  

   type rq_flag_bits is 
     (uu_REQ_WRITE,
      uu_REQ_FAILFAST_DEV,
      uu_REQ_FAILFAST_TRANSPORT,
      uu_REQ_FAILFAST_DRIVER,
      uu_REQ_SYNC,
      uu_REQ_META,
      uu_REQ_PRIO,
      uu_REQ_DISCARD,
      uu_REQ_SECURE,
      uu_REQ_WRITE_SAME,
      uu_REQ_NOIDLE,
      uu_REQ_FUA,
      uu_REQ_FLUSH,
      uu_REQ_RAHEAD,
      uu_REQ_THROTTLED,
      uu_REQ_SORTED,
      uu_REQ_SOFTBARRIER,
      uu_REQ_NOMERGE,
      uu_REQ_STARTED,
      uu_REQ_DONTPREP,
      uu_REQ_QUEUED,
      uu_REQ_ELVPRIV,
      uu_REQ_FAILED,
      uu_REQ_QUIET,
      uu_REQ_PREEMPT,
      uu_REQ_ALLOCED,
      uu_REQ_COPY_USER,
      uu_REQ_FLUSH_SEQ,
      uu_REQ_IO_STAT,
      uu_REQ_MIXED_MERGE,
      uu_REQ_KERNEL,
      uu_REQ_PM,
      uu_REQ_END,
      uu_REQ_HASHED,
      uu_REQ_MQ_INFLIGHT,
      uu_REQ_NR_BITS);
   pragma Convention (C, rq_flag_bits);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/blk_types.h:150

  -- common flags  
  -- not set, read. set, write  
  -- no driver retries of device errors  
  -- no driver retries of transport errors  
  -- no driver retries of driver errors  
  -- request is sync (sync write or read)  
  -- metadata io request  
  -- boost priority in cfq  
  -- request to discard sectors  
  -- secure discard (used with __REQ_DISCARD)  
  -- write same block many times  
  -- don't anticipate more IO after this one  
  -- forced unit access  
  -- request for cache flush  
  -- bio only flags  
  -- read ahead, can fail anytime  
  -- This bio has already been subjected to
  --				 * throttling rules. Don't do it again.  

  -- request only flags  
  -- elevator knows about this request  
  -- may not be passed by ioscheduler  
  -- don't touch this for merging  
  -- drive already may have started this one  
  -- don't call prep for this one  
  -- uses queueing  
  -- elevator private data attached  
  -- set if the request failed  
  -- don't worry about errors  
  -- set for "ide_preempt" requests  
  -- request came from our alloc pool  
  -- contains copies of user pages  
  -- request for flush sequence  
  -- account I/O stat  
  -- merge of different types, fail separately  
  -- direct IO to kernel pages  
  -- runtime pm request  
  -- last of chain of requests  
  -- on IO scheduler merge hash  
  -- track inflight for MQ  
  -- stops here  
  -- This mask is used for both bio and request merge checking  
end linux_blk_types_h;

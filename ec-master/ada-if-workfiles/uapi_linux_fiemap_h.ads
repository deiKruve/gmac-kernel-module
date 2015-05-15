pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_asm_generic_int_ll64_h;

package uapi_linux_fiemap_h is

   --  unsupported macro: FIEMAP_MAX_OFFSET (~0ULL)
   --  unsupported macro: FIEMAP_FLAG_SYNC 0x00000001
   --  unsupported macro: FIEMAP_FLAG_XATTR 0x00000002
   --  unsupported macro: FIEMAP_FLAG_CACHE 0x00000004
   --  unsupported macro: FIEMAP_FLAGS_COMPAT (FIEMAP_FLAG_SYNC | FIEMAP_FLAG_XATTR)
   --  unsupported macro: FIEMAP_EXTENT_LAST 0x00000001
   --  unsupported macro: FIEMAP_EXTENT_UNKNOWN 0x00000002
   --  unsupported macro: FIEMAP_EXTENT_DELALLOC 0x00000004
   --  unsupported macro: FIEMAP_EXTENT_ENCODED 0x00000008
   --  unsupported macro: FIEMAP_EXTENT_DATA_ENCRYPTED 0x00000080
   --  unsupported macro: FIEMAP_EXTENT_NOT_ALIGNED 0x00000100
   --  unsupported macro: FIEMAP_EXTENT_DATA_INLINE 0x00000200
   --  unsupported macro: FIEMAP_EXTENT_DATA_TAIL 0x00000400
   --  unsupported macro: FIEMAP_EXTENT_UNWRITTEN 0x00000800
   --  unsupported macro: FIEMAP_EXTENT_MERGED 0x00001000
   --  unsupported macro: FIEMAP_EXTENT_SHARED 0x00002000
  -- * FS_IOC_FIEMAP ioctl infrastructure.
  -- *
  -- * Some portions copyright (C) 2007 Cluster File Systems, Inc
  -- *
  -- * Authors: Mark Fasheh <mfasheh@suse.com>
  -- *          Kalpak Shah <kalpak.shah@sun.com>
  -- *          Andreas Dilger <adilger@sun.com>
  --  

  -- logical offset in bytes for the start of
  --			    * the extent from the beginning of the file  

   type fiemap_extent_fe_reserved64_array is array (0 .. 1) of aliased uapi_asm_generic_int_ll64_h.uu_u64;
   type fiemap_extent_fe_reserved_array is array (0 .. 2) of aliased uapi_asm_generic_int_ll64_h.uu_u32;
   type fiemap_extent is record
      fe_logical : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:17
      fe_physical : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:19
      fe_length : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:21
      fe_reserved64 : aliased fiemap_extent_fe_reserved64_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:22
      fe_flags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:23
      fe_reserved : aliased fiemap_extent_fe_reserved_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, fiemap_extent);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:16

  -- physical offset in bytes for the start
  --			    * of the extent from the beginning of the disk  

  -- length in bytes for this extent  
  -- FIEMAP_EXTENT_* flags for this extent  
  -- logical offset (inclusive) at
  --				 * which to start mapping (in)  

   type fiemap_fm_extents_array is array (0 .. -1) of aliased fiemap_extent;
   type fiemap is record
      fm_start : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:28
      fm_length : aliased uapi_asm_generic_int_ll64_h.uu_u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:30
      fm_flags : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:32
      fm_mapped_extents : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:33
      fm_extent_count : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:34
      fm_reserved : aliased uapi_asm_generic_int_ll64_h.uu_u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:35
      fm_extents : aliased fiemap_fm_extents_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, fiemap);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/fiemap.h:27

  -- logical length of mapping which
  --				 * userspace wants (in)  

  -- FIEMAP_FLAG_* flags for request (in/out)  
  -- number of extents that were mapped (out)  
  -- size of fm_extents array (in)  
  -- array of mapped extents (out)  
end uapi_linux_fiemap_h;

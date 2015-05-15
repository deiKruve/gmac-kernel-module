pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with System;
with linux_types_h;

package linux_nfs_fs_i_h is

   --  skipped empty struct nlm_lockowner

  -- * NFS lock info
  --  

   type nfs_lock_info is record
      state : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nfs_fs_i.h:10
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nfs_fs_i.h:11
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nfs_fs_i.h:12
   end record;
   pragma Convention (C_Pass_By_Copy, nfs_lock_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nfs_fs_i.h:9

   --  skipped empty struct nfs4_lock_state

   type nfs4_lock_info is record
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nfs_fs_i.h:17
   end record;
   pragma Convention (C_Pass_By_Copy, nfs4_lock_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nfs_fs_i.h:16

end linux_nfs_fs_i_h;

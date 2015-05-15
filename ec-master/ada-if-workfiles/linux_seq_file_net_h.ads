pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with net_net_namespace_h;
limited with linux_fs_h;
limited with linux_seq_file_h;
with System;

package linux_seq_file_net_h is

   type seq_net_private is record
      the_net : access net_net_namespace_h.net;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file_net.h:11
   end record;
   pragma Convention (C_Pass_By_Copy, seq_net_private);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file_net.h:9

   function seq_open_net
     (arg1 : access linux_fs_h.inode;
      arg2 : access linux_fs_h.file;
      arg3 : access constant linux_seq_file_h.seq_operations;
      arg4 : int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file_net.h:15
   pragma Import (CPP, seq_open_net, "_Z12seq_open_netP5inodeP4filePK14seq_operationsi");

   function single_open_net
     (arg1 : access linux_fs_h.inode;
      the_file : access linux_fs_h.file;
      show : access function (arg1 : access linux_seq_file_h.seq_file; arg2 : System.Address) return int) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file_net.h:17
   pragma Import (CPP, single_open_net, "_Z15single_open_netP5inodeP4filePFiP8seq_filePvE");

   function seq_release_net (arg1 : access linux_fs_h.inode; arg2 : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file_net.h:19
   pragma Import (CPP, seq_release_net, "_Z15seq_release_netP5inodeP4file");

   function single_release_net (arg1 : access linux_fs_h.inode; arg2 : access linux_fs_h.file) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file_net.h:20
   pragma Import (CPP, single_release_net, "_Z18single_release_netP5inodeP4file");

   function seq_file_net (seq : access linux_seq_file_h.seq_file) return access net_net_namespace_h.net;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/seq_file_net.h:21
   pragma Import (CPP, seq_file_net, "_ZL12seq_file_netP8seq_file");

end linux_seq_file_net_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package errno_base_h is


   EPERM : constant := 1;  --  errno_base.h:4
   ENOENT : constant := 2;  --  errno_base.h:5
   ESRCH : constant := 3;  --  errno_base.h:6
   EINTR : constant := 4;  --  errno_base.h:7
   EIO : constant := 5;  --  errno_base.h:8
   ENXIO : constant := 6;  --  errno_base.h:9
   E2BIG : constant := 7;  --  errno_base.h:10
   ENOEXEC : constant := 8;  --  errno_base.h:11
   EBADF : constant := 9;  --  errno_base.h:12
   ECHILD : constant := 10;  --  errno_base.h:13
   EAGAIN : constant := 11;  --  errno_base.h:14
   ENOMEM : constant := 12;  --  errno_base.h:15
   EACCES : constant := 13;  --  errno_base.h:16
   EFAULT : constant := 14;  --  errno_base.h:17
   ENOTBLK : constant := 15;  --  errno_base.h:18
   EBUSY : constant := 16;  --  errno_base.h:19
   EEXIST : constant := 17;  --  errno_base.h:20
   EXDEV : constant := 18;  --  errno_base.h:21
   ENODEV : constant := 19;  --  errno_base.h:22
   ENOTDIR : constant := 20;  --  errno_base.h:23
   EISDIR : constant := 21;  --  errno_base.h:24
   EINVAL : constant := 22;  --  errno_base.h:25
   ENFILE : constant := 23;  --  errno_base.h:26
   EMFILE : constant := 24;  --  errno_base.h:27
   ENOTTY : constant := 25;  --  errno_base.h:28
   ETXTBSY : constant := 26;  --  errno_base.h:29
   EFBIG : constant := 27;  --  errno_base.h:30
   ENOSPC : constant := 28;  --  errno_base.h:31
   ESPIPE : constant := 29;  --  errno_base.h:32
   EROFS : constant := 30;  --  errno_base.h:33
   EMLINK : constant := 31;  --  errno_base.h:34
   EPIPE : constant := 32;  --  errno_base.h:35
   EDOM : constant := 33;  --  errno_base.h:36
   ERANGE : constant := 34;  --  errno_base.h:37

end errno_base_h;

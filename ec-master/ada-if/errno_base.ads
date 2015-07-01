pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package errno_base is

   EPERM   : constant := 1;
   ENOENT  : constant := 2;
   ESRCH   : constant := 3;
   EINTR   : constant := 4;
   EIO     : constant := 5;
   ENXIO   : constant := 6;
   E2BIG   : constant := 7;
   ENOEXEC : constant := 8;
   EBADF   : constant := 9;
   ECHILD  : constant := 10;
   EAGAIN  : constant := 11;
   ENOMEM  : constant := 12;
   EACCES  : constant := 13;
   EFAULT  : constant := 14;
   ENOTBLK : constant := 15;
   EBUSY   : constant := 16;
   EEXIST  : constant := 17;
   EXDEV   : constant := 18;
   ENODEV  : constant := 19;
   ENOTDIR : constant := 20;
   EISDIR  : constant := 21;
   EINVAL  : constant := 22;
   ENFILE  : constant := 23;
   EMFILE  : constant := 24;
   ENOTTY  : constant := 25;
   ETXTBSY : constant := 26;
   EFBIG   : constant := 27;
   ENOSPC  : constant := 28;
   ESPIPE  : constant := 29;
   EROFS   : constant := 30;
   EMLINK  : constant := 31;
   EPIPE   : constant := 32;
   EDOM    : constant := 33;
   ERANGE  : constant := 34;

end errno_base;

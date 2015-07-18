pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with sys_types;

package fcntl is
   
   -- /* open/fcntl.  */
   -- #define O_ACCMODE	   0003
   O_ACCMODE   : constant Unsigned := 16#0003#;
   
   -- #define O_RDONLY	     00
   O_RDONLY    : constant Unsigned := 16#00#;
   
   -- #define O_WRONLY	     01
   O_WRONLY    : constant Unsigned := 16#01#;
   
   -- #define O_RDWR		     02
   O_RDWR      : constant Unsigned := 16#02#;
   
   -- # define O_CREAT	   0100	/* Not fcntl.  */
   O_CREAT     : constant Unsigned := 16#0100#;

   -- # define O_EXCL		   0200	/* Not fcntl.  */
   O_EXCL      : constant Unsigned := 16#0200#;

   -- # define O_NOCTTY	   0400	/* Not fcntl.  */
   O_NOCTTY    : constant Unsigned := 16#0400#;

   -- # define O_TRUNC	  01000	/* Not fcntl.  */
   O_TRUNC     : constant Unsigned := 16#01000#;

   -- # define O_APPEND	  02000
   O_APPEND    : constant Unsigned := 16#02000#;

   -- # define O_NONBLOCK	  04000
   O_NONBLOCK  : constant Unsigned := 16#04000#;

   -- # define O_NDELAY	O_NONBLOCK
   O_NDELAY    : constant Unsigned := O_NONBLOCK;

   -- # define O_SYNC	       04010000
   O_SYNC      : constant Unsigned := 16#04010000#;

   -- #define O_FSYNC		O_SYNC
   O_FSYNC     : constant Unsigned := O_SYNC;

   --# define O_ASYNC	 020000
   O_ASYNC     : constant Unsigned := 16#020000#;

   -- # define __O_LARGEFILE	0100000
   O_LARGEFILE : constant Unsigned := 16#0100000#;

   -- # define __O_DIRECTORY  0200000
   O_DIRECTORY : constant Unsigned := 16#0200000#;

   -- # define __O_NOFOLLOW	0400000
   O_NOFOLLOW  : constant Unsigned := 16#0400000#;

   -- # define __O_CLOEXEC   02000000
   O_CLOEXEC   : constant Unsigned := 16#02000000#;

   -- # define __O_DIRECT	 040000
   O_DIRECT    : constant Unsigned := 16#040000#;
  
   -- # define __O_NOATIME   01000000
   O_NOATIME   : constant Unsigned := 16#01000000#;

  -- # define __O_PATH     010000000
   O_PATH      : constant Unsigned := 16#010000000#;

   -- # define __O_DSYNC	 010000
   O_DSYNC     : constant Unsigned := 16#010000#;

   -- # define __O_TMPFILE   020200000
   O_TMPFILE   : constant Unsigned := 16#020200000#;
   
   
   
   function open (uu_file : Interfaces.C.Strings.chars_ptr; 
                  uu_oflag : int  -- , ...
                 ) return int;
   -- Open FILE and return a new file descriptor for it, or -1 on error.
   --   OFLAG determines the type of access used.  If O_CREAT is on OFLAG,
   --   the third argument is taken as a `mode_t', the mode of the created file.
   --   This function is a cancellation point and therefore not marked with
   --   __THROW.
   pragma Import (C, open, "open");
   
   
   function creat (uu_file : Interfaces.C.Strings.chars_ptr; 
                   uu_mode : sys_types.mode_t) 
                  return int;
   -- Create and open FILE, with mode MODE.  This takes an `int' MODE
   --   argument because that is what `mode_t' will be widened to.
   --   This function is a cancellation point and therefore not marked with
   --   __THROW. 
   pragma Import (C, creat, "creat");
   
end Fcntl;


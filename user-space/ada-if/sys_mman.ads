

pragma Ada_2005;
pragma Style_Checks (Off);

with System;
with Linux_Stddef;
with Interfaces.C; use Interfaces.C;

package Sys_Mman is
   subtype uu_off_t is long; -- x86_64_linux_gnu_bits_types_h
   subtype uu_mode_t is unsigned; -- x86_64_linux_gnu_bits_types_h
   
   subtype off_t is uu_off_t;
   subtype mode_t is uu_mode_t;
   
   -- from asm-generic-mmam-h
   MCL_CURRENT : constant Int := 1; -- lock all current mappings
   MCL_FUTURE  : constant Int := 2; -- lock all future mappings
       
   function mmap
     (uu_addr : System.Address;
      uu_len : Linux_Stddef.size_t;
      uu_prot : int;
      uu_flags : int;
      uu_fd : int;
      uu_offset : off_t) 
     return System.Address;
   -- Return value of `mmap' in case of an error.   
   -- Map addresses starting near ADDR and extending for LEN bytes.  from
   --   OFFSET into the file FD describes according to PROT and FLAGS.  If ADDR
   --   is nonzero, it is the desired mapping address.  If the MAP_FIXED bit is
   --   set in FLAGS, the mapping will be at ADDR exactly (which must be
   --   page-aligned); otherwise the system chooses a convenient nearby address.
   --   The return value is the actual mapping address chosen or MAP_FAILED
   --   for errors (in which case `errno' is set).  A successful `mmap' call
   --   deallocates any previous mapping for the affected region.
   pragma Import (C, mmap, "mmap");
   
   function munmap (uu_addr : System.Address; uu_len : Linux_stddef.size_t) 
                   return int;
   -- Deallocate any mapping for the region starting at ADDR and extending LEN
   --   bytes.  Returns 0 if successful, -1 for errors (and sets errno).
   pragma Import (C, munmap, "munmap");
   
   
   function mlock (uu_addr : System.Address; uu_len : Linux_Stddef.size_t) 
                  return int;
   -- Guarantee all whole pages mapped by the range [ADDR,ADDR+LEN) to
   --   be memory resident. 
   pragma Import (C, mlock, "mlock");

   
   function munlock (uu_addr : System.Address; uu_len : Linux_Stddef.size_t) 
                    return int;
   -- Unlock whole pages previously mapped by the range [ADDR,ADDR+LEN).   
   pragma Import (C, munlock, "munlock");
   

   function mlockall (uu_flags : int) return int;
   -- Cause all currently mapped pages of the process to be memory resident
   --   until unlocked by a call to the `munlockall', until the process exits,
   --   or until the process calls `execve'.   
   pragma Import (C, mlockall, "mlockall");


   function munlockall return int;
   -- All currently mapped pages of the process' address space become
   --   unlocked.   
   pragma Import (C, munlockall, "munlockall");

   
end Sys_Mman;

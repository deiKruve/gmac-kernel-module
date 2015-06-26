
with Interfaces.C.Extensions;

package Asm_Ioctl is
   
   package Ice renames Interfaces.C.Extensions;
   
--  /* ioctl command encoding: 32 bits total, command in lower 16 bits,
--   * size of the parameter structure in the lower 14 bits of the
--   * upper 16 bits.
--   * Encoding the size of the parameter structure in the ioctl request
--   * is useful for catching programs compiled with old versions
--   * and to avoid overwriting user space outside the user buffer area.
--   * The highest 2 bits are reserved for indicating the ``access mode''.
--   * NOTE: This limits the max parameter size to 16kB -1 !
--   */

--  /*
--   * The following is for compatibility across the various Linux
--   * platforms.  The generic ioctl numbering scheme doesn't really enforce
--   * a type field.  De facto, however, the top 8 bits of the lower 16
--   * bits are indeed used as a type field, so we might just as well make
--   * this explicit here.  Please be sure to use the decoding macros
--   * below from now on.
--   */
--  #define _IOC_NRBITS	8
--  #define _IOC_TYPEBITS	8

--  /*
--   * Let any architecture override either of the following before
--   * including this file.
--   */

--  #ifndef _IOC_SIZEBITS
--  # define _IOC_SIZEBITS	14
--  #endif

--  #ifndef _IOC_DIRBITS
--  # define _IOC_DIRBITS	2
--  #endif
   
   
   
   -- direction constants for Ioctl_Cmd  --
   
   IOC_NONE  : constant Ice.Unsigned_2 := 0;
   IOC_WRITE : constant Ice.Unsigned_2 := 1;
   IOC_READ  : constant Ice.Unsigned_2 := 2;
   IOC_RW    : constant Ice.Unsigned_2 := 3;
   
   -- IOCTL word defined as a record
   -- it will pass to the linux kernel interface as a 32 bit unsigned word.
   
   type Ioctl_Cmd is record
     --Cmd : U16;
     Nr   : Ice.Unsigned_8;  -- number of the ioctl call.
     Typ  : Ice.Unsigned_8;  -- ioctl type (per application).
     Size : Ice.Unsigned_14; -- size of the data area.
     Dir  : Ice.Unsigned_2;  -- read, write or rw.
   end record;
   
   for Ioctl_Cmd use record
      Nr   at 0 range 0 .. 7;
      Typ  at 0 range 8 .. 15;
      Size at 0 range 16 .. 29;
      Dir  at 0 range 30 .. 31;
   end record;
   -- hopefully this will copy to the kernel interface as a 32 bit unsigned
   for Ioctl_Cmd'Size use 32;
   -- for Ioctl_Cmd'Alignment use 4;
   pragma Convention (C_Pass_By_Copy, Ioctl_Cmd);
   
end Asm_Ioctl;

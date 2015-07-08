
with System;
with Interfaces.C.Extensions;
with Hw_Types;
with Linux_Types;

package Niniel is
   package L   renames Linux_Types;
   package Ice renames Interfaces.C.Extensions;
   package Hwt renames Hw_Types;
   
   EC_RATE_COUNT : constant Integer := 2;
   EC_FRAME_HEADER_SIZE : constant L.Size_T := 14;
   
   procedure Init;
   pragma Export (C, Init, "niniel_init");
   --  initializes the ada part of the kernel module
 
   procedure N_Exit;
   pragma Export (C, N_Exit, "niniel_exit");
   --  cleans up the ada part of the kernel module
   --  at module unloading time.
   
   
   ------------------------------------
   --  frame details.                --
   --  its a copy of finrod-net.ads  --
   ------------------------------------
   Mac_Xmas   : constant Hwt.Bits_48 := 16#ff_ff_ff_ff_ff_ff#;
   Mac_Null   : constant Hwt.Bits_48 := 16#00_00_00_00_00_00#;
   --Typ_Disco  : constant Hwt.Bits_16 := 16#ff_ff#;
   --Typ_Pdo    : constant Hwt.Bits_16 := 16#ff_fe#;
   -- the types are in the individual packages.
   Stamp      : Hwt.Bits_32 := 0;
   
   ------------------------------------------------------
   --   type Frame should be a tagged record           -- 
   -- the root of all ethernet frames                  -- 
   -- but since we dont have tagged records            -- 
   -- we need to repeat this record for every child.   --
   -- make sure they stay in sync in case of changes.  --
   ------------------------------------------------------
      subtype Frame_Length_Type is Hwt.Bits_16;
   -- cause thats the length of the proto-word.
   
   type Frame_Type is record
      Dest         : Hwt.Bits_48;       -- destination mac address
      Srce         : Hwt.Bits_48;       -- sender i/f mac address
      Proto        : Frame_Length_Type; -- packet length
      Typ          : Hwt.Bits_16;       -- packet type
      Stamp        : Hwt.Bits_32;       -- sequence stamp
      Return_To    : Hwt.Bits_48;       -- original sender's mac address
   end record;
   
   for Frame_Type use record
      Dest         at  0 range 0 .. 47;
      Srce         at  6 range 0 .. 47;
      Proto        at 12 range 0 .. 15;
      Typ          at 14 range 0 .. 15;
      Stamp        at 16 range 0 .. 31;
      Return_To    at 20 range 0 .. 47;
      -- upto here we have  48 + 48 + 16 + 16 + + 32 + 48 = 208 bits = 26 octets
      -- a frame should have 60 octets = 480 bits
      -- so we need min 480 - 208 = 272 bits to fill the frame
      -- this is  60 - 26 = 34 bytes 
   end record;
   for Frame_Type'Size use (48 + 48 + 16 + 16 + 32 + 48);
   for Frame_Type'Bit_Order use System.High_Order_First;
   for Frame_Type'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   type Frame_A_Type is access all Frame_Type;
   
   
   subtype Frame_Address_Type is System.Address; 
   -- used in the children of 'Frame' and a few other places.
   -- note that frame addresses must skip the first 4 bytes of a 'Frame' record
   -- since it is a tagged record.
   
end Niniel;

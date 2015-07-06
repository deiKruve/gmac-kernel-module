
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
   Data_Start : constant Hwt.Bits_16 := 16#ff_ff#;
   
   --   type Frame is tagged record   -- the root of all ethernet frames
   --     null;
   --  end record;
   --  for Frame'Bit_Order use System.High_Order_First;
   --  pragma Warnings (Off, "*no component clause");
   --  for Frame'Scalar_Storage_Order use System.High_Order_First;
   --  pragma Warnings (On);
   --  -- its Big Endian
   
   subtype Frame_Address_Type is System.Address; 
   -- used in the children of 'Frame' and a few other places.
   -- note that frame addresses must skip the first 4 bytes of a 'Frame' record
   -- since it is a tagged record.
   
   subtype Frame_Length_Type is Hwt.Bits_16;
   -- cause thats the length of the proto-word.

end Niniel;

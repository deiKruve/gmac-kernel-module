
-- this pakage serves to do the field probe at start up
-- it send a discovery packet around on the ethernet. when it comes back 
-- it will indicate that all field nodes re present and have started up 
-- with out problem.
-- the master may progress to preparing for full operation.

--with System.Storage_Elements;

with Hw_Types;
with Hw_Definition.Main;

package Niniel.Discover is
   
   --package Sse renames System.Storage_Elements;
   package Hwt renames Hw_Types;
   package Hwd renames Hw_Definition.Main;
   
private
   --type Disco_Packet is new Frame with record
   type Disco_Packet is record
      Spare   : Hwt.Bits_32;
      Dest    : Hwt.Bits_48   := Mac_xmas; -- destination mac address
      Srce    : Hwt.Bits_48   := Mac_null; -- sender i/f mac address
      Proto   : Frame_Length_Type := 16#0806#; -- packet length
      Typ     : Hwt.Bits_16   := Data_Start; -- make it a Novell IPX frame
      Mac_Addr_Ary : Hwd.Mac_Addr_Ary_Type;
   end record;
   
   
   for Disco_Packet use record             -- note the start address at byte 4
      Spare  at 0 range 0 .. 31;
      Dest   at  4 range  0 .. 47;       -- this is to skip the tag.
      Srce   at 10 range  0 .. 47;       -- I am sure this is not portable
      Proto  at 16 range  0 .. 15;
      Typ    at 18 range  0 .. 15;
      Mac_Addr_Ary at 20 range 0 .. 143;
   end record;
   for Disco_Packet'Size use (32 + 48 + 48 + 16 + 16 + (Hwd.Nodes * 48));
   for Disco_Packet'Bit_Order use System.High_Order_First;
   for Disco_Packet'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   
end Niniel.Discover;

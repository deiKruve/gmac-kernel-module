
-- this pakage serves to do the field probe at start up
-- it send a discovery packet around on the ethernet. when it comes back 
-- it will indicate that all field nodes re present and have started up 
-- with out problem.
-- the master may progress to preparing for full operation.

--with System.Storage_Elements;

with Hw_Types;
with Hw_Definition.Main;

with Device;
with Niniel.Master;

package Niniel.Discover is
   
   --package Sse renames System.Storage_Elements;
   package Hwt renames Hw_Types;
   package Hwd renames Hw_Definition.Main;
   
   procedure Send_Discovery (Master_a : access Master.Ec_Master);
   
   function Handle_Recd (Master_a : access Master.Ec_Master;
                         Device_A : access Device.Ec_Device)
                        return Boolean;
   
private
   --type Disco_Packet is new Frame with record
   type Disco_Packet_Type is record
      -- Spare        : Hwt.Bits_32;
      Dest         : Hwt.Bits_48   := Mac_xmas; -- destination mac address
      Srce         : Hwt.Bits_48   := Mac_null; -- sender i/f mac address
      Proto        : Frame_Length_Type := 16#0806#; -- packet length
      Typ          : Hwt.Bits_16   := Data_Start; -- make it a Novell IPX frame
      Return_To    : Hwt.Bits_48;
      Mac_Addr_Ary : Hwd.Mac_Addr_Ary_Type;
   end record;
   
   
   for Disco_Packet_Type use record     -- note the start address at byte 4
      --Spare        at  0 range 0 .. 31;
      Dest         at  0 range 0 .. 47; -- this is to skip the tag.
      Srce         at  6 range 0 .. 47; -- I am sure this is not portable
      Proto        at 12 range 0 .. 15;
      Typ          at 14 range 0 .. 15;
      Return_To    at 16 range 0 .. 47;     
      -- upto here we have  48 + 48 + 16 + 16 + 48 = 176 bits = 22 bytes
      -- a frame should have 480 bits
      -- so we need min 480 - 176 = 304 bits to fill the frame
      -- this is  60 - 22 = 38 bytes 
      Mac_Addr_Ary at 22 range 0 .. Hwd.Addr_Array_Size - 1;
   end record;
   for Disco_Packet_Type'Size use 
     (48 + 48 + 16 + 16 + 48 + Hwd.Addr_Array_Size);
   for Disco_Packet_Type'Bit_Order use System.High_Order_First;
   for Disco_Packet_Type'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   type Disco_Packet_A_Type is access all Disco_Packet_Type;
end Niniel.Discover;

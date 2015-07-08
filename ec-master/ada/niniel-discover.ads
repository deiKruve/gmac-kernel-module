
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
   --package Hwd  renames Hw_Definition;
   package Hwdm renames Hw_Definition.Main;
   
   -- the frame type for a disco packet
   Frame_Typ : constant Hwt.Bits_16 := 16#ff_ff#;
   
   
   
   procedure Send_Discovery (Master_a : access Master.Ec_Master);
   --  send a discovery packet  --
   
   
   procedure Handle_Recd (Master_a     : access Master.Ec_Master;
                          Device_A     : access Device.Ec_Device;
                          Frame_Date_P : System.Address;
                          Size         : L.size_t);
   --  handle returned disco packets  --
   
private
   --type Disco_Packet is new Frame with record
   type Disco_Packet_Type is record
      Dest         : Hwt.Bits_48   := Mac_xmas;  -- destination mac address
      Srce         : Hwt.Bits_48   := Mac_null;  -- sender i/f mac address
      Proto        : Frame_Length_Type := 0;     -- packet length
      Typ          : Hwt.Bits_16   := Frame_Typ; -- packet type
      Stamp        : Hwt.Bits_32;                -- sequence stamp
      Return_To    : Hwt.Bits_48;              -- original sender's mac address
      Mac_Addr_Ary : Hwdm.Mac_Addr_Ary_Type; -- node addresses record
   end record;
   
   
   for Disco_Packet_Type use record
      Dest         at  0 range 0 .. 47;
      Srce         at  6 range 0 .. 47;
      Proto        at 12 range 0 .. 15;
      Typ          at 14 range 0 .. 15;
      Stamp        at 16 range 0 .. 31;
      Return_To    at 20 range 0 .. 47;     
      Mac_Addr_Ary at 26 range 0 .. Hwdm.Addr_Array_Size - 1;
   end record;
   for Disco_Packet_Type'Size use 
     (48 + 48 + 16 + 16 + 32 + 48 + Hwdm.Addr_Array_Size);
   for Disco_Packet_Type'Bit_Order use System.High_Order_First;
   for Disco_Packet_Type'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   type Disco_Packet_A_Type is access all Disco_Packet_Type;
   
   
   
    type Disco_Stat_Packet_Type is record
      Dest         : Hwt.Bits_48   := Mac_xmas; -- destination mac address
      Srce         : Hwt.Bits_48   := Mac_null; -- sender i/f mac address
      Proto        : Frame_Length_Type := 16#0806#; -- packet length
      Typ          : Hwt.Bits_16   := Frame_Typ; -- make it a Novell IPX frame
      Stamp        : Hwt.Bits_32;                -- sequence stamp
      Return_To    : Hwt.Bits_48;
      Field_Status : Hwdm.Field_Status_Image_Type;
      -- replaces Mac_Addr_Ary : Hwdm.Mac_Addr_Ary_Type;
   end record;
   
   
   for Disco_Stat_Packet_Type use record
      Dest         at  0 range 0 .. 47;
      Srce         at  6 range 0 .. 47;
      Proto        at 12 range 0 .. 15;
      Typ          at 14 range 0 .. 15;
      Stamp        at 16 range 0 .. 31;
      Return_To    at 20 range 0 .. 47;     
      Field_Status at 26 range 0 .. Hwdm.Addr_Array_Size - 1;
   end record;
   for Disco_Stat_Packet_Type'Size use 
     (48 + 48 + 16 + 16 + 32 + 48 + Hwdm.Addr_Array_Size);
   for Disco_Stat_Packet_Type'Bit_Order use System.High_Order_First;
   for Disco_Stat_Packet_Type'Scalar_Storage_Order use System.High_Order_First;
   -- its Big Endian
   
   type Disco_Stat_Packet_A_Type is access all Disco_Stat_Packet_Type;
   
   
   
   
end Niniel.Discover;

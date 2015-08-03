------------------------------------------------------------------------------
--                                                                          --
--                          NINIEL - NIENOR COMPONENTS                      --
--                                                                          --
--                         N I N I E L . D i s c o v e r                    --
--                                                                          --
--                                   B o d y                                --
--                                                                          --
--                     Copyright (C) 2015, Jan de Kruyf                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.                                               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
--          NINIEL - NIENOR  is maintained by J de Kruijf Engineers         --
--                     (email: jan.de.kruyf@hotmail.com)                    --
--                                                                          --
------------------------------------------------------------------------------

-- this pakage serves to do the field probe at start up
-- it send a discovery packet around on the ethernet. when it comes back 
-- it will indicate that all field nodes are present and have started up 
-- without problem.
-- the master may progress to preparing for full operation.
--

with System.Storage_Elements;
with Ada.Unchecked_Conversion;
with Linux_Types;

with Interfaces.C;

package body Niniel.Discover is
   
   package L   renames Linux_Types;

   
   -------------------------------
   --  send a discovery packet  --
   -------------------------------
   procedure Send_Discovery (Master_a : access Master.Ec_Master)
   is
      use type Hwt.Bits_16;
      use type Hwt.Bits_32;
      function Toma is 
         new Ada.Unchecked_Conversion (Source => System.Address,
                                       Target => Master.Mac_Addr_A_Type);
      function Topa is 
         new Ada.Unchecked_Conversion (Source => System.Address,
                                       Target => Disco_Packet_A_Type);
      
      Frame_Data      : constant System.Address      := 
        Device.ec_device_tx_data (Master_a.Devices'address);
      Disco_Packet    : constant Disco_Packet_A_Type := Topa (Frame_Data);
      First_Addressee : Hwt.Bits_48;
      for First_Addressee'Address use Disco_Packet.Mac_Addr_Ary'Address;
   begin
      
      Disco_Packet.Dest      := First_Addressee;
      Disco_Packet.Srce      := Toma (Master_a.Macs (Master_a.Macs'First)).all;
      Disco_Packet.Return_To := Toma (Master_a.Macs (Master_a.Macs'First)).all;
      Disco_Packet.Proto     := Disco_Packet_Type'Size / 8;
      
      Stamp := Stamp + 1;
      Disco_Packet.Stamp     := Stamp;
      
      Device.ec_device_send (Master_a.Devices'address, L.Size_T (Disco_Packet.Proto));
   end Send_Discovery;
   
   
   -------------------------------------
   --  handle returned disco packets  --
   -------------------------------------
   procedure Handle_Recd (Master_a     : access Master.Ec_Master;
                         Device_A     : access Device.Ec_Device;
                         Frame_Date_P : System.Address;
                         Size         : L.size_t)
   is
      pragma Unreferenced (Device_A);
      use System.Storage_Elements;
      use type L.Size_T;
      use type Interfaces.C.Unsigned;
      use type Interfaces.C.Int;
      use type Hwt.Bits_32;
      function Topa is 
         new Ada.Unchecked_Conversion (Source => System.Address,
                                       Target => Disco_Stat_Packet_A_Type);
      function Tona is
         new Ada.Unchecked_Conversion (Source => System.Address,
                                       Target => Hwd.Node_Status_A_Type);
      Frame_A   : constant Disco_Stat_Packet_A_Type := Topa (Frame_Date_P);
      --Node_Stat : Hwd.Node_Status_Type;
      --Node_Ptr  : System.Address;
      --Node      : Hwd.Node_Status_A_Type;
   begin
      if size /= Disco_Packet_Type'Size / 8 then
         Master.Niniel_Debug 
           (Master_A, 0, "discover: corrupted frame, size not right");
         Master_A.Stats.Corrupted := Master_A.Stats.Corrupted + 1;
         Master_A.Reserved := Master_A.Reserved + 1;         
         Lsm.Down (Master_A.Master_Sem'address);
         -- this will take care of the retry needed, if no good packet arrives
         Master.Master_Fsm_State := Master.Wait_Return;
         Lsm.Up (Master_A.Master_Sem'address);
         
      elsif Frame_A.Stamp /= Stamp then
         Master.Niniel_Debug 
           (Master_A, 0, "discover: rec'd frame out of sequence");
         Master_A.Stats.Corrupted := Master_A.Stats.Corrupted + 1;
         Master_A.Reserved := Master_A.Reserved + 1;         
         Lsm.Down (Master_A.Master_Sem'address);
         -- this will take care of the retry needed, if no good packet arrives
         Master.Master_Fsm_State := Master.Wait_Return;
         Lsm.Up (Master_A.Master_Sem'address);
         
      else -- valid frame
         if (Lsm.Down_Interruptible(Disc_Sem'address) /= 0) then
            Master.Niniel_Debug 
           (Master_A, 0, "discover: interrupted disc_sem semaphore");
         end if;
         -- Lsm.Down (Disc_Sem'address);
         Field_Status := Frame_A.Field_Status;
         Lsm.Up (Disc_Sem'address);
         declare
            use type Hwt.Bits_1;
            Node_Ptr : System.Address         := Frame_A.Field_Status'Address;
            Node     : Hwd.Node_Status_A_Type := Tona (Node_Ptr);
            N                 : Natural := Hwdm.Nodes;
            Nodes_Operational : Natural := 0;
            Nodes_Pre_Op      : Natural := 0;
            Nodes_Orphaned    : Natural := 0;
            Nodes_Soft_Error  : Natural := 0;
         begin
            while N > 0 loop
               if Node.Node_Operational = 1 then 
                  Nodes_Operational := Nodes_Operational + 1;
               end if;
               if Node.Node_Pre_Op = 1 then
                  Nodes_Pre_Op := Nodes_Pre_Op + 1;
               end if;
               if Node.Node_Orphaned = 1 then
                  Nodes_Orphaned := Nodes_Orphaned + 1;
               end if;
               if Node.Node_Soft_Error = 1 then
                  Nodes_Soft_Error := Nodes_Soft_Error + 1;
               end if;
               
               Node_Ptr := Node_Ptr + 6;
               Node := Tona (Node_Ptr);
               N := N -1;
            end loop;
            
            if Nodes_Pre_Op = Hwdm.Nodes then -- all are in pre-op
               Lsm.Down (Master_A.Master_Sem'address);
               Master.Master_Fsm_State := Master.Pre_Operational;
               Lsm.Up (Master_A.Master_Sem'address);
               
            else
               Lsm.Down (Master_A.Master_Sem'address);
               Master.Master_Fsm_State := Master.Send_Discovery;
               Master_A.Reserved := Master_A.Reserved + 1;
               Lsm.Up (Master_A.Master_Sem'address);
            end if;
            -- send the packet here to userspace:
            -- there will only be a packet every 100 msec or so
            -- and normally after 2 or 3 tries the system is up
            -- when not, also the max tries are limited in the kernel.
         end;
         null;
      end if;
   end Handle_Recd;
   
                        
begin
   Lsm.Sema_Init (Disc_Sem'Address, 1);
end Niniel.Discover;

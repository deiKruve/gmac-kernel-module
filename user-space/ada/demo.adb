 
--with Ada.Unchecked_Deallocation;
with Ada.Text_Io;

with Nienor.Master;

procedure Demo
is
   package Tio renames Ada.Text_Io;
   package Nm  renames Nienor.Master;
   
   use type Nm.Ec_Master_A;
   M : Nienor.Master.Ec_Master_A;
begin
   -- tests
   M := Nm.Ecrt_Request_Master (0);
   if M = null then
      Tio.Put_Line ("no master found");
   end if;
   
   null;
   Nienor.Master.Ecrt_Release_Master (M);
end Demo;

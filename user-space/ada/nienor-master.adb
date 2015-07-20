
with Interfaces.C; use Interfaces.C;
--with System.Img_Uns;
with GNATCOLL.Traces;
with Text_Io;

with Unistd;

with N_Ioctl;
with Sys_Ioctl;
with Sys_Mman;
with Fcntl;
with Errno;

with Hw_Definition.Main;

package body Nienor.Master is
   
   --package Iuns renames System.Img_Uns;
   package Tio  renames Text_Io;
   package Gct  renames GNATCOLL.Traces;
   package Nioc renames N_Ioctl;
   package Sioc renames Sys_Ioctl;
   package Mm   renames Sys_Mman;
   package Hwd  renames Hw_Definition.Main;
   
   -- logging
   Stream1 : constant Gct.Trace_Handle := Gct.Create ("NIENOR");
   Stream2 : constant Gct.Trace_Handle := 
     Gct.Create ("NIENOR.EXCEPTIONS");
   Debug_Str : constant Gct.Trace_Handle := Gct.Create ("NIENOR.DEBUG");
   
   
   -------------------
   -- handle errors --
   -------------------
   Error_Reported : Boolean := False;
   
   procedure Err_Msg (Err_Str : String);
   is
   begin
      Tio.Put_Line (Err_Str)
      -- M_Report_Error (Err_Str);
      Gct.Trace (Stream1, Err_Str);
      Error_Reported := True;
   end Err_Msg;
   
   
   ----------------------
   --  local routines  --
   ----------------------
   
   procedure Ec_Master_Clear_Config (Master_A : Ec_Master_A)
   is
   begin
      null; -- probably junk
   end Ec_Master_Clear_Config;
   
   
   procedure Ec_Master_Clear (Master_A : Ec_Master_A)
   is
      --  procedure Free is
      --     new Ada.Unchecked_Deallocation (Ec_Master, Ec_Master_A);
      Ret : Int;
   begin
      if Master_A.Process_Data_Size /= 0 then
         --Free (Master_A);
         Mm.Unmap (Master_A.Process_Data_Ptr, 
                   Master_A.Process_Data_Size);
         Master_A.Process_Data_Size := 0;
         Master_A.Process_Data_Ptr := System.Null_Address;
         -- Ec_Master_Clear_Config (Master_A);
         
         if (Master_A.Fd /= -1) then
            Ret := Unistd.Close (Master_A.Fd);
         end if;
      end if;
   end Ec_Master_Clear;
   
   
   
   
   -----------------
   --  interface  --
   -----------------
   
   -- int ecrt_master_activate(ec_master_t *master)
   
   function Ecrt_Master_Activate (Master_A : Ec_Master_A) return Int
   is
      hw_Status   : Hwd.Field_Status_Image_Type;
      Ret         : Int;
   begin
      Ret := Sioc.Ioctl
        (Master_A.Fd, Nioc.NINR_DISCOVERY_REQUEST, System.Null_Address);
      if Ret < 0 then
         Err_Msg ("Failed to start discovery cycle -- " & 
                    Errno.Error_Str (Errno.Errno));
         return -Errno.Errno;
         
      else
         loop
            Ret := Sioc.Ioctl
              (Master_A.Fd, Nioc.NINR_DISCOVERY_POLL, System.Null_Address);
            
            if Ret = 0 then
               exit;
               
            elsif Ret = -E.DISCO_HUNG then
               Ret := Sioc.Ioctl (Master_A.Fd, 
                                  Nioc.NINR_DISCOVERY_STAT_REQUEST, 
                                  Hw_Status'Address);
               Hwd.Print_Field_Status_Image (Hw_Status);
               Ret := -E.DISCO_HUNG;
               exit;
               
            elsif Ret = E.DISCO_WORKING then
               delay 0.1;
            end if;
         end loop;
         
         return Ret;
      end if;
   end Ecrt_Master_Activate;
   
                                    
   
   function Ecrt_Open_Master (Master_Idx : Unsigned) return Ec_Master_A
   is
      procedure Free is
         new Ada.Unchecked_Deallocation (Ec_Master, Ec_Master_A);
      Master      : Ec_Master_A := new Ec_Master;
      Path        : String      := "/dev/nienor1";
      Module_Data : Ec_Ioctl_Module;
      Ret         : Int;
   begin
      Master.fd = Fcntl.Open (Path, Fcntl.O_RDWR);
      if Master.Fd < 0 then
         Err_Msg ("Failed to open " & Path & " -- " & 
                    Errno.Error_Str (Errno.Errno));
         goto Out_Clear;
      end if;
      
      Ret := Sioc.Ioctl
        (Master_A.Fd, Nioc.EC_IOCTL_MODULE, Module_Data'Address);
      if Ret < 0 then
         Err_Msg ("Failed to get module information from " & Path & " -- " & 
                    Errno.Error_Str (Errno.Errno));
         goto Out_Clear;
      end if;
      
      if (Module_Data.Ioctl_Version_Magic /= EC_IOCTL_VERSION_MAGIC) then
         Err_Msg 
           ("ioctl() version magic is differing: " & 
              Path & ": " & Unsigned'Image (module_data.Ioctl_Version_Magic) &
              " niniel: " & Unsigned'Image (Nioc.NINR_IOCTL_VERSION_MAGIC));
         goto Out_Clear;
      end if;
      
      return Master;

     <<Out_Clear>>
         Ec_Master_Clear (Master);
         Free (Master);
         return null;
   end Ecrt_Open_Master;
   
   
   function Ecrt_Master_Reserve (Master_A : Ec_Master_A) return Int
   is
      Ret : Int;
   begin
      Ret := Sioc.Ioctl
        (Master_A.Fd, Nioc.EC_IOCTL_REQUEST, System.Null_Address);
      
      if Ret /= 0 then 
         Err_Msg ("Failed to reserve master -- " & 
                    Errno.Error_Str (Errno.Errno));
         return -Errno.Errno;
      end if;
      
      return 0;
   end Ecrt_Master_Reserve;
   
   
   function Ecrt_Request_Master (Master_Idx : Unsigned) return Ec_Master_A
   is
      procedure Free is
         new Ada.Unchecked_Deallocation (Ec_Master, Ec_Master_A);
      Master_A : Ec_Master_A := Ecrt_Open_Master (Master_Idx);
   begin
      if Master_A /= null then
         if Ecrt_Master_Reserve (Master_A) < 0 then
            Ec_Master_Clear (Master_A);
            Free (Master_A);
            Master_A := null;
         end if;
      end if;
      return Master_A;
   end Ecrt_Request_Master;
   
   

   
end Nienor.Master;

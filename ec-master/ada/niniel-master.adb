
with Linux_Kernel;
with Linux_Sched;
with Linux_Kif;

--  with Jan.Img_Uns;
with Jan.Img_Int;
--with System.Address_To_Access_Conversions;
with Ada.Unchecked_Conversion;
with Interfaces.C.Extensions;

package body Niniel.Master is
   package Ic  renames Interfaces.C;
   package Ice renames Interfaces.C.Extensions;
   package Lk  renames Linux_Kernel;
   package Lkf renames Linux_Kif;
   package Ls  renames Linux_Sched;
   
   --package Iu  renames jan.Img_Uns;
   package Ii  renames Jan.Img_Int;
  -- package Toa renames Address_To_Access_Conversions;
   
   -------------------------
   --  internal routines  --
   -------------------------
   
   procedure Copy (I : in String; O : out String)
   is
   begin
      if O'Length > I'Length then
         O := (O'Range => ' ');
         O (O'First .. O'First + I'Length - 1) := I;
      else
         O := I (I'First .. I'First + O'Length - 1);
      end if;
   end Copy;
         
   
   procedure Idle_Send_Cb (Arg1 : System.Address)
   is
   begin
      null;
   end Idle_Send_Cb;
   
   
   procedure Idle_Receive_Cb (Arg1 : System.Address)
   is
   begin
      null;
   end Idle_Receive_Cb;
   
   
   ----------------------------------------------
   --  after start-up when the master is idle  --
   --  this state machine is run               --
   ----------------------------------------------
   type Idle_Fsm_State_Type is (Idle,
                                Send_Discovery,
                                Wait_Return,
                                Recv_Return,
                                Done);
   Idle_Fsm_State : Idle_Fsm_State_Type;
   
   function Idle_Fsm return int
   is
   begin
      loop
         case Idle_Fsm_State is
            when Idle  =>
               null;
            when Send_Discovery =>
               null;
            when Wait_Return =>
               null;
            when Recv_Return =>
               null;
            when Done =>
               null;
         end case;
      end loop;
   end Idle_Fsm;
   
   
   ----------------------------------------
   --  run the master in its own thread  --
   ----------------------------------------
   function Ec_Master_Thread_Start (Master    : access Ec_Master;
                                    Thrd_Func : access function return Int;
                                    Name      : String)
                                   return Int
   is
      function Toi is new Ada.Unchecked_Conversion (Source => System.Address,
                                                    Target => Ic.Int);
      function Tou is new Ada.Unchecked_Conversion (Source => System.Address,
                                                    Target => Ice.Unsigned_64);
      use type Ice.Unsigned_64;
      function Kthread_Start (Tf : System.Address; 
                              M  : System.Address; 
                              N  : String) 
                             return System.Address;
      pragma Import (C, Kthread_Start, "kif_kthread_run");
      Max_Errno : constant Long_Long_Integer := -4095;
      Addr      : System.Address := System.Null_Address;
   begin
      Lk.Printk (Lk.KERN_INFO & "Starting thread " & Name & 
                   ASCII.LF & ASCII.NUL);
      
      Addr := Kthread_Start (Tf => Thrd_Func'Address, 
                             M  => Master'Address, 
                             N  => Name & ASCII.NUL);
      
      if Tou (Addr) >= Ice.Unsigned_64'Mod (Max_Errno) then -- error
         declare
            Err : constant Integer := Integer (Toi (Addr));
            P   : Natural := 1;
            S   : String (1 .. 32);        
         begin
            Ii.Image_Integer (Err, S, P);
            P := P + 1;
            S (P) := ASCII.LF;
            P := P + 1;
            S (P) := ASCII.NUL;
            Lk.Printk (Lk.KERN_ERR & "Failed to start master thread | error " & 
                      S (1 .. P + 1));
         end;
         Addr := System.Null_Address;
         
      else
         Copy (Name, Master.Name);
      end if;
      
      Master.Thread := Addr;
      return Toi (Addr);
   end Ec_Master_Thread_Start;
   
   
   --------------------------------------
   --  stop the present master thread  --
   --------------------------------------
   procedure Ec_Master_Thread_Stop (Master    : access Ec_Master)
   is
      use type System.Address;
      Sleep_Jiffies : Ic.Long;
   begin
      if Master.Thread = System.Null_Address then
         Lk.Printk (Lk.KERN_WARNING & Master.Name & " thread stopped already." &
                      ASCII.LF & ASCII.NUL);
         return;
      end if;
      
      Lk.Printk (Lk.KERN_DEBUG & Master.Name & " stopping thread." &
                   ASCII.LF & ASCII.NUL);
      declare
         Dummy : Ic.Int := Lkf.Kthread_Stop (Master.Thread'Address);
      begin null; end;
      Master.Thread := System.Null_Address;
      Lk.Printk (Lk.KERN_INFO & Master.Name & " thread exited." &
                   ASCII.LF & ASCII.NUL);
      
      -- wait for the datagram to return
      sleep_jiffies := Ls.HZ / 100; -- 10 ms, but at least 1 jiffy
      --  if Sleep_Jiffies < 1 then Sleep_Jiffies := 1; end if;
      declare 
         Dummy : Ic.Long := Ls.Schedule_Timeout (sleep_jiffies);
      begin null; end;
   end Ec_Master_Thread_Stop;
   
   
   -----------------
   --  interface  --
   -----------------
   
   procedure Start_Discovery
   is
   begin
      if Idle_Fsm_State = Idle then
         Idle_Fsm_State := Send_Discovery;
      end if;
   end  Start_Discovery;
   
   
   procedure ec_master_output_stats (arg1 : access Ec_Master)
   is
   begin
      null;
   end Ec_Master_Output_Stats;
   
   
   procedure ec_master_clear_device_stats (arg1 : access Ec_Master)
   is
   begin
      null;
   end Ec_Master_Clear_Device_Stats;
   
   
   procedure ec_master_update_device_stats (arg1 : access Ec_Master)
   is
   begin
      null;
   end Ec_Master_Update_Device_Stats;
   
   
   procedure Ec_Master_Init_Static
   is
   begin
      null;
   end Ec_Master_Init_Static;
   
   
   function ec_master_init return Int
   is
   begin
      return 0;
   end ec_master_init;
   
   
   procedure ec_master_clear (arg1 : Ec_Master_T_Ptr)
   is
   begin
      null;
   end Ec_Master_Clear;
   
   
   function ec_master_enter_idle_phase (Master : access Ec_Master) return Int---
   is
   begin
      Lk.Printk (Lk.KERN_DEBUG & "ORPHANED -> IDLE." &
                   ASCII.LF & ASCII.NUL);
      
      --  Master.Send_Cb    := Idle_Send_Cb'Access;  -- prob not needed
      --  Master.Receive_Cb := Idle_Receive_Cb'Access;  -- prob not needed
      --  Master.Cb_Data    := Master'Address;  -- prob not needed
      
      Master.Phase := EC_IDLE;
      
      ret = Ec_Master_Thread_Start (master, Idle_Fsm'access, "EtherCAT-IDLE");
      return 0;
   end Ec_Master_Enter_Idle_Phase;
   
   
   procedure ec_master_leave_idle_phase (Master : access Ec_Master)---
   is
   begin
      null;
   end Ec_Master_Leave_Idle_Phase;
   
   
   function ec_master_enter_operation_phase
     (arg1 : Ec_Master_T_Ptr) 
     return Int
   is
   begin
      return 0;
   end Ec_Master_Enter_Operation_Phase;
   
   
   procedure ec_master_leave_operation_phase (arg1 : Ec_Master_T_Ptr)
   is
   begin
      null;
   end Ec_Master_Leave_Operation_Phase;
   
   
   procedure Ec_Master_Receive_Datagrams
     (arg1 : Ec_Master_T_Ptr;
      arg2 : Ec_Device_T_Ptr;
      arg3 : access L.u8;
      arg4 : L.size_t)
   is
   begin
      null;
   end Ec_Master_Receive_Datagrams;
   
   
   procedure ec_master_set_send_interval
     (arg1 : Ec_Master_T_Ptr;
      arg2 : unsigned)
   is
   begin
      null;
   end Ec_Master_Set_Send_Interval;
   
   --------------------------------------------
   -- set debug level
   -- 
   --  Master : master access
   --  Level  : debug level. May be 0, 1 or 2.
   --  return 0 on succcess
   --         -EINVAL Invalid debug level.
   --------------------------------------------
   function ec_master_debug_level
     (Master : access Ec_Master;
      Level  : unsigned) return Int
   is
   begin
      if Level > 2 then
         Lk.Printk (Lk.KERN_ERR & "niniel.master : invalid debug level");
         return -22;  -- -EINVAL
         
      elsif Level /= Master.Debug_Level then
         Master.Debug_Level := Level;
         Lk.Printk (Lk.KERN_INFO & 
                      "niniel.master : Master debug level set to ");
         return 0;
         
      else return 0;
      end if;
   end Ec_Master_Debug_Level;
   
   
end Niniel.Master;

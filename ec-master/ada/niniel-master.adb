
with Errno_Base;
with Linux_Kernel;
with Linux_Sched;
with Linux_Jiffies;
with Linux_Kif;

--  with Jan.Img_Uns;
with Jan.Img_Int;--with System.Address_To_Access_Conversions;
with Ada.Unchecked_Conversion;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;

package body Niniel.Master is
   
   package E   renames Errno_Base;
   package Ic  renames Interfaces.C;
   package Ice renames Interfaces.C.Extensions;
   package Ics renames Interfaces.C.Strings;
   -- package L   renames Linux_Types;
   package Lk  renames Linux_Kernel;
   package Lkf renames Linux_Kif;
   package Ls  renames Linux_Sched;
   package Lsm renames Linux_Semaphore;
   package Lj  renames Linux_Jiffies;
   --package Ld  renames Linux_Device;
   
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
   
   procedure Copy (I : in Ics.Chars_Ptr; O : out String)
   is
   begin
      --  if O'Length > I'Length then
      --     O := (O'Range => ' ');
      --     O (O'First .. O'First + I'Length - 1) := I;
      --  else
      --     O := I (I'First .. I'First + O'Length - 1);
      --  end if;
      null;
   end Copy;
   
   
   -------------------------------------------------------------------------
   -- handle kernels IS_ERROR macro --
   --
   -- input : 
   --         Addr is the return of a function that would normally be 
   --         tested by the IS_ERROR macro
   --         Err_S is the string to be printed by Kprintf 
   --                                        (the errno will be added)
   -- returns the input adress when no error. System.null_address on error.
   -------------------------------------------------------------------------
   
   function Is_Error (Addr : System.Address; 
                      Err_S : String) 
                     return System.Address
   is
      function Toi is new Ada.Unchecked_Conversion (Source => System.Address,
                                                    Target => Ic.Int);
      function Tou is new Ada.Unchecked_Conversion (Source => System.Address,
                                                    Target => Ice.Unsigned_64);
      use type Interfaces.C.Extensions.Unsigned_64;
      Max_Errno : constant Long_Long_Integer := -4095;
   begin
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
            Lk.Printk (Lk.KERN_ERR & Err_S & S (1 .. P + 1));
         end;
         return System.Null_Address;
      else 
         return Addr;
      end if;
   end Is_Error;
      
   
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
   
   
   --------------------------------------------------
   --  after start-up when the master is orphaned  --
   --  this state machine is run                   --
   --------------------------------------------------
   type Master_Fsm_State_Type is (Orphaned,
                                  Idle,
                                  Send_Discovery,
                                  Wait_Return,
                                  Recv_Return,
                                  Done);
   Master_Fsm_State : Master_Fsm_State_Type;
   
   function Master_Fsm (Arg1 : System.Address) return int
   is
   begin
      loop
         case Master_Fsm_State is
            when Orphaned       =>
               null;
            when Idle           =>
               null;
            when Send_Discovery =>
               null;
            when Wait_Return    =>
               null;
            when Recv_Return    =>
               null;
            when Done           =>
               null;
         end case;
      end loop;
      return 0; --- make error returns
   end Master_Fsm;
   
  -- type Tf_Type : not null access function return Int;
   
   
   ----------------------------------------
   --  run the master in its own thread  --
   ----------------------------------------
   function Ec_Master_Thread_Start
     (Master    : not null access Ec_Master;
      Thrd_Func : access function (arg1 : System.Address) return Int;
      Name : Ics.Chars_Ptr)
     return Int
   is
      function Toi is new Ada.Unchecked_Conversion (Source => System.Address,
                                                    Target => Ic.Int);
      use type System.Address;
      Addr   : System.Address   := System.Null_Address;
      --Namest : 
   begin
      
      --Lk.Printk (Lk.KERN_INFO & "Starting thread " & "junk" & 
      --             ASCII.LF & ASCII.NUL);
      
      Addr := Lkf.Kthread_Run (thread_func => Thrd_Func, 
                               Master      => Master.all'address, 
                               Name        => Name);
      
      if Is_Error (Addr, "Failed to start master thread | error ")
                   = System.Null_Address then
         return -1;
         
      else
         --Copy (Name, Master.Name);
         Master.Thread := Addr;
         return Toi (Addr);
      end if;
   end Ec_Master_Thread_Start;
   
   
   --------------------------------------
   --  stop the present master thread  --
   --------------------------------------
   procedure Ec_Master_Thread_Stop (Master : not null access Ec_Master)
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
   
   procedure Start_Discovery  -- in response to an ioctl pulse
   is
   begin
      if Master_Fsm_State = Idle then
         Master_Fsm_State := Send_Discovery;
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
   
   
   procedure Ec_Master_Update_Device_Stats (Master : access Ec_Master)
   is
      use type Ice.Unsigned_Long_Long;
      S      : constant access Ec_Device_Stats_T := Master.Device_Stats'access;
      tx_frame_rate, 
      rx_frame_rate, 
      tx_byte_rate,
      rx_byte_rate, 
      Loss_Rate,
      N             : L.S32;
      Loss          : L.U64;
   begin
      
      if Ic.Long (Lj.jiffies - S.Jiffies) < Ls.HZ then
         return;
      end if;
      
      tx_frame_rate := L.S32 (S.tx_count - S.last_tx_count) * 1000;
      rx_frame_rate := L.S32 (S.rx_count - S.last_rx_count) * 1000;
      tx_byte_rate  := L.S32 (S.tx_bytes - S.Last_Tx_Bytes);
      rx_byte_rate  := L.S32 (S.rx_bytes - S.Last_Rx_Bytes);
      loss          := S.tx_count - S.rx_count;
      loss_rate     := L.S32 (loss - S.last_loss) * 1000;
      --
      --        Low-pass filter:
      --        Y_n = y_(n - 1) + T / tau * (x - y_(n - 1))   | T = 1
      --     -> Y_n += (x - y_(n - 1)) / tau
      --
      for I in 0 .. EC_RATE_COUNT loop
         n := L.S32 (Rate_Intervals (I));
         s.tx_frame_rates (i) := 
           s.tx_frame_rates (i) + (tx_frame_rate - s.tx_frame_rates (i)) / n;
         s.rx_frame_rates (i) := 
           s.rx_frame_rates (i) + (rx_frame_rate - s.rx_frame_rates (i)) / n;
         s.tx_byte_rates (i)  := 
           s.tx_byte_rates (i) + (tx_byte_rate - s.tx_byte_rates (i)) / n;
         s.rx_byte_rates (i)  := 
           s.rx_byte_rates (i) + (rx_byte_rate - s.rx_byte_rates (i)) / n;
         s.loss_rates (i)     := 
           s.loss_rates (i) + (loss_rate - s.loss_rates (i)) / n;
      end loop;
      
      s.last_tx_count := s.tx_count;
      s.last_rx_count := s.rx_count;
      s.last_tx_bytes := s.tx_bytes;
      s.last_rx_bytes := s.rx_bytes;
      s.last_loss     := loss;
      
      Device.Ec_Device_Update_Stats (Master.Devices);
      
      S.jiffies := Lj.jiffies;
      
   end Ec_Master_Update_Device_Stats;
   
   
   procedure Ec_Master_Init_Static
   is
   begin
      null;
   end Ec_Master_Init_Static;
   
   
   function ec_master_init (Master_P      : Master.Ec_Master_T_Ptr;
                            Index         : Ic.Unsigned;
                            Main_Mac      : Mac_Addr_Ptr;
                            Backup_Mac    : Mac_Addr_Ptr;
                            Device_Number : L.Dev_T;
                            Class         : Ld.Class_Ptr;
                            Debug_Level   : Ic.Unsigned)
                           return Int
   is
      function Mk_Dev (Major : Unsigned; Minor : Unsigned) 
                      return Unsigned with Inline 
      is
         Ret : constant Unsigned := (Major and not Ld.Minor_Mask) or 
           (Minor and Ld.Minor_Mask);
      begin
         return Ret;
      end Mk_Dev;
      
      function Toa is new Ada.Unchecked_Conversion (Source => System.Address,
                                                    Target => Ec_Master_A_Type);
      use type System.Address;
      Ret       : Int;
      Addr      : System.Address   := System.Null_Address;
      Master    : access Ec_Master := Toa (Master_P);
      
   begin
      --  Master := Toa (Master_P);
      Master.Index := Index;
      Master.Reserved := 0;
      
      Lsm.Sema_Init (Master.Master_Sem'Address, 1);
      
      Master.Macs (Master.Macs'First) := Main_Mac;
      Ec_Master_Clear_Device_Stats (Master); -------------------implement!!
      
      --  sema_init(&master->device_sem, 1); -- do we need this ?????????
      
      Master.phase := EC_ORPHANED;
      
      Master.active := 0;
      --  Master.config_changed := 0; -- do we need this ?????????
      --  master->injection_seq_fsm = 0;
      --  master->injection_seq_rt = 0;
      --  master->slaves = NULL;
      --  master->slave_count = 0;
      --  INIT_LIST_HEAD(&master->fsm_exec_list);
      --  master->fsm_exec_count = 0U;
      
      Master.debug_level := debug_level;
      master.stats.timeouts := 0;
      master.stats.corrupted := 0;
      master.stats.unmatched := 0;
      master.stats.output_jiffies := 0;
      
      master.thread := System.Null_Address;
      
      -- sema_init(&master.io_sem, 1);
      master.send_cb := Null;
      master.receive_cb := Null;
      master.cb_data := System.Null_Address;
      master.app_send_cb := Null;
      master.app_receive_cb := Null;
      master.app_cb_data := System.Null_Address;
      
      -- INIT_LIST_HEAD(&master->sii_requests);
      -- INIT_LIST_HEAD(&master->emerg_reg_requests);
      -- init_waitqueue_head(&master->request_queue);
      
      
      -- init devices
      --ret = ec_device_init(&master->devices[dev_idx], master);
      Ret := Device.Ec_Device_Init (Master.Devices, Master_P);
      if Ret < 0 then
         Lk.Printk (Lk.KERN_ERR & "niniel.master : device did not initialize.");
         goto Out_Clear_Devices;
      end if;
      
      -- // init state machine datagram
      -- // create state machine object
      -- // alloc external datagram ring
      -- // init reference sync datagram
      -- // init sync datagram
      -- // init sync monitor datagram
      
      -- init character device
      Ret := Cdev.Ec_Cdev_Init (Master.Chdev'Access, Master_P, Device_Number);
      if Ret < 0 then
         goto Out_Clear_devices;
      end if;
      
      Master.Class_Device := System.Null_Address;
      Addr := Ld.Device_Create (Class, System.Null_address, 
                                     Mk_Dev 
                                       (Device_Number, Master.Index),
                                     System.Null_Address,
                                     "ninielMASTER1");
      if Is_Error (Addr, "Failed to create class device! | error ") 
        = System.Null_Address then
         Ret := -1;
         goto out_clear_cdev;
      else
         Master.Class_Device := Addr;
      end if;
      return 0;
      
  <<Out_Clear_Cdev>>
      Cdev.Ec_Cdev_Clear (Master.Chdev'Access);
      
  <<out_clear_devices>>
      Device.Ec_Device_Clear (Master.Devices);
      
      return Ret;
   end ec_master_init;
   
   
   procedure ec_master_clear (arg1 : Ec_Master_T_Ptr)
   is
   begin
      null;
   end Ec_Master_Clear;
   
   
   
   function ec_master_enter_idle_phase (Master_P : Ec_Master_T_Ptr) return Int
   is
      function Toa is new Ada.Unchecked_Conversion (Source => Ec_Master_T_Ptr,
                                                    Target => Ec_Master_A_Type);
      function Tocp is new Ada.Unchecked_Conversion (Source => System.Address,
                                                    Target => Ics.Chars_Ptr);
      Ret    : Ic.Int           := 0;
      Master : constant access Ec_Master := Toa (Master_P);
      ss     : constant String (1 .. 11) := "Niniel-IDLE";
      S      : constant String (1 .. 12) := Ss & Ascii.nul;
   begin
      Lk.Printk (Lk.KERN_DEBUG & "ORPHANED -> IDLE." &
                   ASCII.LF & ASCII.NUL);
      
      --  Master.Send_Cb    := Idle_Send_Cb'Access;  -- prob not needed
      --  Master.Receive_Cb := Idle_Receive_Cb'Access;  -- prob not needed
      --  Master.Cb_Data    := Master'Address;  -- prob not needed
      
      Master.Phase := EC_IDLE;
      
      -- in the original:
      --  reset number of responding slaves to trigger scanning
      
      Master_Fsm_State := Idle;
      Lk.Printk (Lk.KERN_INFO & "Starting thread " & Ss & 
                   ASCII.LF & ASCII.NUL);
      ret := Ec_Master_Thread_Start (master, Master_Fsm'Access, 
                                     Tocp (S (S'First)'address));
      if Ret /= 0 then 
         Master.Phase := EC_ORPHANED;
      else
         Copy (S, Master.Name);
         null;
      end if;
      
      return ret;
   end Ec_Master_Enter_Idle_Phase;
   
   
   procedure ec_master_leave_idle_phase (Master_P : Ec_Master_T_Ptr)---
   is
      function Toa is new Ada.Unchecked_Conversion (Source => Ec_Master_T_Ptr,
                                                    Target => Ec_Master_A_Type);
      Master : constant access Ec_Master := Toa (Master_P);
   begin
      Lk.Printk (Lk.KERN_DEBUG & "IDLE -> ORPHANED." &
                   ASCII.LF & ASCII.NUL);
      
      Master.phase := EC_ORPHANED;
      Ec_Master_Thread_Stop (Master);
      
      -- in original: clear slaves
      
      
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
         return -E.EINVAL;
         
      elsif Level /= Master.Debug_Level then
         Master.Debug_Level := Level;
         Lk.Printk (Lk.KERN_INFO & 
                      "niniel.master : Master debug level set to ");
         return 0;
         
      else return 0;
      end if;
   end Ec_Master_Debug_Level;
   
   
end Niniel.Master;

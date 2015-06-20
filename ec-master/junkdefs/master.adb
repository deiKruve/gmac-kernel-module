
with Linux_Kernel;
with System.Img_Uns;
with System.Img_Int;

package body Niniel.Master is
   package Lk  renames Linux_Kernel;
   package Iu  renames System.Img_Uns;
   package Ii  renames System.Img_Int;
   
   -------------------------
   --  internal routines  --
   -------------------------
   
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
   
   
   type Idle_Fsm_State is (Idle;
                           Send_Discovery,
                           Wait_Return,
                           Recv_Return,
                           Done);
   
   procedure Idle_Fsm
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
   
   
   function Ec_Master_Thread_Start (Master    : access Ec_Master;
                                    Thrd_Func : access function return Int;
                                    Name      : String)
                                   return Int
   is
      function Kthread_Start (Tf : System.Address; 
                              M  : System.Address; 
                              N  : String) 
                             return System.Address;
      pragma Import (Kthread_Start, "kif_kthread_run");
      -- (int (*thread_func)(void *), void *master, char *name);
      Max_Errno : constant := 4095;
      Addr      : System.Address := null;
   begin
      Addr := Kthread_Start (Toa (Thrd_Func), Toa (Master), Name & ASCII.NUL);
      if Addr >= System.Address'Mod (Max_Errno) then
         declare
            Err : Integer := Integer (System.Address);
            P   : Natural := 1;
            S   : String (1 .. 32);        
         begin
            Ii.Image_Integer (Err, S, P);
            P := P + 1;
            S (P) := ASCII.LF;
            P := P + 1;
            S (P) := ASCII.NUL;
            Printk (KERN_ERR & "Failed to start master thread | error " & 
                      S (1 .. P + 1));
         end;
         Addr := null;
      end if;
      Master.Thread := Addr;
      return Integer (System.Address);
   end Ec_Master_Thread_Start;
   
   
   
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
   
   
   function ec_master_enter_idle_phase (arg1 : access Ec_Master) return Int---
   is
   begin
      Master.Send_Cb    := Idle_Send_Cb'Access;  -- prob not needed
      Master.Receive_Cb := Idle_Receive_Cb'Access;  -- prob not needed
      Master.Cb_Data    := Master'Address;  -- prob not needed
      
      return 0;
   end Ec_Master_Enter_Idle_Phase;
   
   
   procedure ec_master_leave_idle_phase (arg1 : access Ec_Master)---
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

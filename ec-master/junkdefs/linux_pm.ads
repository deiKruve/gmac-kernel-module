



package linux_pm is
   
    type dev_pm_info is record
       power_state : aliased pm_message_t;
       can_wakeup : Extensions.Unsigned_1;
       async_suspend : Extensions.Unsigned_1;
       is_prepared : aliased Extensions.bool;
       is_suspended : aliased Extensions.bool;
       is_noirq_suspended : aliased Extensions.bool;
       
   
   
end Linux_Pm;

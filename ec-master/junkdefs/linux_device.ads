
with Interfaces.C.Strings; use Interfaces.C;

--with Linux_Kobject;
with Linux_Types;
with Linux_Mutex;
with Linux_Spinlock_Types;
with Linux_Pm;
with Linux_Pinctrl_Devinfo;
with Linux_Klist;
with Asm_Device;


package Linux_Device is
   
   
   type device is record
      parent : access device;
      p : System.Address;
      kobj : aliased Linux_Types.Kobject; --linux_kobject.kobject;
      init_name : Interfaces.C.Strings.chars_ptr;
      c_type : access constant device_type;
      the_mutex : aliased linux_mutex.mutex;
      bus : access bus_type; --
      driver : access device_driver; --
      platform_data : System.Address;
      driver_data : System.Address;
      power : aliased linux_pm.dev_pm_info;
      pm_domain : access linux_pm.dev_pm_domain;
      pins : access linux_pinctrl_devinfo.dev_pin_info;
      numa_node : aliased int;
      dma_mask : access Linux_Types.U64;
      coherent_dma_mask : aliased Linux_Types.U64;
      dma_pfn_offset : aliased unsigned_long;
      dma_parms : access device_dma_parameters;
      dma_pools : aliased linux_types.list_head;
      dma_mem : System.Address;
      archdata : aliased asm_device.dev_archdata;
      of_node : System.Address;
      acpi_node : aliased acpi_dev_node;
      devt : aliased linux_types.dev_t; 
      id : aliased linux_types.u32;
      devres_lock : aliased linux_spinlock_types.spinlock_t;
      devres_head : aliased linux_types.list_head;
      knode_class : aliased linux_klist.klist_node;
      groups : System.Address;
      release : access procedure (arg1 : access device);
      the_iommu_group : System.Address;
      offline_disabled : aliased Extensions.bool;
      offline : aliased Extensions.bool;
   end record;
   pragma Convention (C_Pass_By_Copy, device);
      
end Linux_Device;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_irqreturn_h is

   --  arg-macro: function IRQ_RETVAL ((x) ? IRQ_HANDLED : IRQ_NONE
   --    return (x) ? IRQ_HANDLED : IRQ_NONE;
  --*
  -- * enum irqreturn
  -- * @IRQ_NONE		interrupt was not from this device
  -- * @IRQ_HANDLED		interrupt was handled by this device
  -- * @IRQ_WAKE_THREAD	handler requests to wake the handler thread
  --  

   type irqreturn is 
     (IRQ_NONE,
      IRQ_HANDLED,
      IRQ_WAKE_THREAD);
   pragma Convention (C, irqreturn);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/irqreturn.h:10

   subtype irqreturn_t is irqreturn;

end linux_irqreturn_h;

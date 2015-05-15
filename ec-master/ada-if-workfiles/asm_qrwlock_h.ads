pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_generic_qrwlock_types_h;

package asm_qrwlock_h is

   --  unsupported macro: queue_write_unlock queue_write_unlock
   procedure queue_write_unlock (lock : access asm_generic_qrwlock_types_h.qrwlock);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/qrwlock.h:8
   pragma Import (CPP, queue_write_unlock, "_ZL18queue_write_unlockP7qrwlock");

end asm_qrwlock_h;

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uapi_asm_generic_signal_defs_h is

   --  unsupported macro: SIG_BLOCK 0
   --  unsupported macro: SIG_UNBLOCK 1
   --  unsupported macro: SIG_SETMASK 2
   --  unsupported macro: SIG_DFL ((__force __sighandler_t)0)
   --  unsupported macro: SIG_IGN ((__force __sighandler_t)1)
   --  unsupported macro: SIG_ERR ((__force __sighandler_t)-1)
   --  skipped function type uu_signalfn_t

   type uu_sighandler_t is access procedure (arg1 : int);
   pragma Convention (C, uu_sighandler_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/signal-defs.h:18

   --  skipped function type uu_restorefn_t

   type uu_sigrestore_t is access procedure;
   pragma Convention (C, uu_sigrestore_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/asm-generic/signal-defs.h:21

end uapi_asm_generic_signal_defs_h;

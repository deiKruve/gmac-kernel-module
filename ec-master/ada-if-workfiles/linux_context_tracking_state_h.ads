pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package linux_context_tracking_state_h is

  --	 * When active is false, probes are unset in order
  --	 * to minimize overhead: TIF flags are cleared
  --	 * and calls to user_enter/exit are ignored. This
  --	 * may be further optimized using static keys.
  --	  

   type context_tracking is record
      active : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/context_tracking_state.h:14
      state : aliased ctx_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/context_tracking_state.h:18
   end record;
   pragma Convention (C_Pass_By_Copy, context_tracking);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/context_tracking_state.h:7

   function context_tracking_in_user return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/context_tracking_state.h:40
   pragma Import (CPP, context_tracking_in_user, "_ZL24context_tracking_in_userv");

   function context_tracking_active return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/context_tracking_state.h:41
   pragma Import (CPP, context_tracking_active, "_ZL23context_tracking_activev");

end linux_context_tracking_state_h;

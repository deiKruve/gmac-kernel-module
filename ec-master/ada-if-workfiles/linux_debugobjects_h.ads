pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with System;
with Interfaces.C.Strings;

package linux_debugobjects_h is

   type debug_obj_state is 
     (ODEBUG_STATE_NONE,
      ODEBUG_STATE_INIT,
      ODEBUG_STATE_INACTIVE,
      ODEBUG_STATE_ACTIVE,
      ODEBUG_STATE_DESTROYED,
      ODEBUG_STATE_NOTAVAILABLE,
      ODEBUG_STATE_MAX);
   pragma Convention (C, debug_obj_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:7

  --*
  -- * struct debug_obj - representaion of an tracked object
  -- * @node:	hlist node to link the object into the tracker list
  -- * @state:	tracked object state
  -- * @astate:	current active state
  -- * @object:	pointer to the real object
  -- * @descr:	pointer to an object type specific debug description structure
  --  

   type debug_obj_descr;
   type debug_obj is record
      node : aliased linux_types_h.hlist_node;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:28
      state : aliased debug_obj_state;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:29
      astate : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:30
      object : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:31
      descr : access debug_obj_descr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, debug_obj);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:27

  --*
  -- * struct debug_obj_descr - object type specific debug description structure
  -- *
  -- * @name:		name of the object typee
  -- * @debug_hint:		function returning address, which have associated
  -- *			kernel symbol, to allow identify the object
  -- * @fixup_init:		fixup function, which is called when the init check
  -- *			fails
  -- * @fixup_activate:	fixup function, which is called when the activate check
  -- *			fails
  -- * @fixup_destroy:	fixup function, which is called when the destroy check
  -- *			fails
  -- * @fixup_free:		fixup function, which is called when the free check
  -- *			fails
  -- * @fixup_assert_init:  fixup function, which is called when the assert_init
  -- *			check fails
  --  

   type debug_obj_descr is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:53
      debug_hint : access function (arg1 : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:54
      fixup_init : access function (arg1 : System.Address; arg2 : debug_obj_state) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:55
      fixup_activate : access function (arg1 : System.Address; arg2 : debug_obj_state) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:56
      fixup_destroy : access function (arg1 : System.Address; arg2 : debug_obj_state) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:57
      fixup_free : access function (arg1 : System.Address; arg2 : debug_obj_state) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:58
      fixup_assert_init : access function (arg1 : System.Address; arg2 : debug_obj_state) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:59
   end record;
   pragma Convention (C_Pass_By_Copy, debug_obj_descr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:52

  -- * Active state:
  -- * - Set at 0 upon initialization.
  -- * - Must return to 0 before deactivation.
  --  

   procedure debug_object_init (addr : System.Address; descr : access debug_obj_descr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:85
   pragma Import (CPP, debug_object_init, "_ZL17debug_object_initPvP15debug_obj_descr");

   procedure debug_object_init_on_stack (addr : System.Address; descr : access debug_obj_descr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:87
   pragma Import (CPP, debug_object_init_on_stack, "_ZL26debug_object_init_on_stackPvP15debug_obj_descr");

   function debug_object_activate (addr : System.Address; descr : access debug_obj_descr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:89
   pragma Import (CPP, debug_object_activate, "_ZL21debug_object_activatePvP15debug_obj_descr");

   procedure debug_object_deactivate (addr : System.Address; descr : access debug_obj_descr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:91
   pragma Import (CPP, debug_object_deactivate, "_ZL23debug_object_deactivatePvP15debug_obj_descr");

   procedure debug_object_destroy (addr : System.Address; descr : access debug_obj_descr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:93
   pragma Import (CPP, debug_object_destroy, "_ZL20debug_object_destroyPvP15debug_obj_descr");

   procedure debug_object_free (addr : System.Address; descr : access debug_obj_descr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:95
   pragma Import (CPP, debug_object_free, "_ZL17debug_object_freePvP15debug_obj_descr");

   procedure debug_object_assert_init (addr : System.Address; descr : access debug_obj_descr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:97
   pragma Import (CPP, debug_object_assert_init, "_ZL24debug_object_assert_initPvP15debug_obj_descr");

   procedure debug_objects_early_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:99
   pragma Import (CPP, debug_objects_early_init, "_ZL24debug_objects_early_initv");

   procedure debug_objects_mem_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:100
   pragma Import (CPP, debug_objects_mem_init, "_ZL22debug_objects_mem_initv");

   procedure debug_check_no_obj_freed (address : System.Address; size : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/debugobjects.h:107
   pragma Import (CPP, debug_check_no_obj_freed, "_ZL24debug_check_no_obj_freedPKvm");

end linux_debugobjects_h;

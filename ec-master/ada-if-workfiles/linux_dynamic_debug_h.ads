pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;

package linux_dynamic_debug_h is

   --  arg-macro: procedure DEFINE_DYNAMIC_DEBUG_METADATA static struct _ddebug __aligned(8) __attribute__((section("__verbose"))) name := { .modname := KBUILD_MODNAME, .function := __func__, .filename := __FILE__, .format := (fmt), .lineno := __LINE__, .flags := _DPRINTK_FLAGS_DEFAULT, }
   --    static struct _ddebug __aligned(8) __attribute__((section("__verbose"))) name := { .modname := KBUILD_MODNAME, .function := __func__, .filename := __FILE__, .format := (fmt), .lineno := __LINE__, .flags := _DPRINTK_FLAGS_DEFAULT, }
   --  unsupported macro: dynamic_pr_debug(fmt,...) do { DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt); if (unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT)) __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__); } while (0)
   --  unsupported macro: dynamic_dev_dbg(dev,fmt,...) do { DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt); if (unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT)) __dynamic_dev_dbg(&descriptor, dev, fmt, ##__VA_ARGS__); } while (0)
   --  unsupported macro: dynamic_netdev_dbg(dev,fmt,...) do { DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt); if (unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT)) __dynamic_netdev_dbg(&descriptor, dev, fmt, ##__VA_ARGS__); } while (0)
   --  arg-macro: procedure dynamic_hex_dump do { DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, __builtin_constant_p(prefix_str) ? prefix_str : "hexdump"); if (unlikely(descriptor.flags and _DPRINTK_FLAGS_PRINT)) print_hex_dump(KERN_DEBUG, prefix_str, prefix_type, rowsize, groupsize, buf, len, ascii); } while (0)
   --    do { DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, __builtin_constant_p(prefix_str) ? prefix_str : "hexdump"); if (unlikely(descriptor.flags and _DPRINTK_FLAGS_PRINT)) print_hex_dump(KERN_DEBUG, prefix_str, prefix_type, rowsize, groupsize, buf, len, ascii); } while (0)
  -- * An instance of this structure is created in a special
  -- * ELF section at every dynamic debug callsite.  At runtime,
  -- * the special section is treated as an array of these.
  --  

  --	 * These fields are used to drive the user interface
  --	 * for selecting and displaying debug callsites.
  --	  

   type u_ddebug is record
      modname : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_debug.h:14
      c_function : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_debug.h:15
      filename : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_debug.h:16
      format : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_debug.h:17
      lineno : Extensions.Unsigned_18;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_debug.h:18
      flags : aliased unsigned_char;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_debug.h:35
   end record;
   pragma Convention (C_Pass_By_Copy, u_ddebug);
   pragma Pack (u_ddebug);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_debug.h:9

  --	 * The flags field controls the behaviour at the callsite.
  --	 * The bits here are changed dynamically when the user
  --	 * writes commands to <debugfs>/dynamic_debug/control
  --	  

   function ddebug_add_module
     (tab : access u_ddebug;
      n : unsigned;
      modname : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_debug.h:39
   pragma Import (CPP, ddebug_add_module, "_Z17ddebug_add_moduleP7_ddebugjPKc");

   function ddebug_remove_module (mod_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_debug.h:43
   pragma Import (CPP, ddebug_remove_module, "_Z20ddebug_remove_modulePKc");

   --  skipped func __dynamic_pr_debug

   function ddebug_dyndbg_module_param_cb
     (param : Interfaces.C.Strings.chars_ptr;
      val : Interfaces.C.Strings.chars_ptr;
      modname : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dynamic_debug.h:47
   pragma Import (CPP, ddebug_dyndbg_module_param_cb, "_Z29ddebug_dyndbg_module_param_cbPcS_PKc");

   --  skipped func __dynamic_dev_dbg

   --  skipped func __dynamic_netdev_dbg

  -- avoid pr_warn(), which wants pr_fmt() fully defined  
  -- allow and ignore  
end linux_dynamic_debug_h;

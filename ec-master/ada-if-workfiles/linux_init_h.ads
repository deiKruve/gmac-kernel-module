pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with Interfaces.C.Extensions;

package linux_init_h is

   --  arg-macro: procedure early_initcall module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure core_initcall module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure core_initcall_sync module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure postcore_initcall module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure postcore_initcall_sync module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure arch_initcall module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure subsys_initcall module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure subsys_initcall_sync module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure fs_initcall module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure fs_initcall_sync module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure rootfs_initcall module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure device_initcall module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure device_initcall_sync module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure late_initcall module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure late_initcall_sync module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure console_initcall module_init(fn)
   --    module_init(fn)
   --  arg-macro: procedure security_initcall module_init(fn)
   --    module_init(fn)
   --  unsupported macro: module_init(initfn) static inline initcall_t __inittest(void) { return initfn; } int init_module(void) __attribute__((alias(#initfn)));
   --  unsupported macro: module_exit(exitfn) static inline exitcall_t __exittest(void) { return exitfn; } void cleanup_module(void) __attribute__((alias(#exitfn)));
  -- These macros are used to mark some functions or 
  -- * initialized data (doesn't apply to uninitialized data)
  -- * as `initialization' functions. The kernel can take this
  -- * as hint that the function is used only during the initialization
  -- * phase and free up used memory resources after
  -- *
  -- * Usage:
  -- * For functions:
  -- * 
  -- * You should add __init immediately before the function name, like:
  -- *
  -- * static void __init initme(int x, int y)
  -- * {
  -- *    extern int z; z = x * y;
  -- * }
  -- *
  -- * If the function has a prototype somewhere, you can also add
  -- * __init between closing brace of the prototype and semicolon:
  -- *
  -- * extern int initialize_foobar_device(int, int, int) __init;
  -- *
  -- * For initialized data:
  -- * You should insert __initdata or __initconst between the variable name
  -- * and equal sign followed by value, e.g.:
  -- *
  -- * static int init_variable __initdata = 0;
  -- * static const char linux_logo[] __initconst = { 0x32, 0x36, ... };
  -- *
  -- * Don't forget to initialize data not at file scope, i.e. within a function,
  -- * as gcc otherwise puts the data into the bss section and not into the init
  -- * section.
  --  

  -- These are for everybody (although not all archs will actually
  --   discard it in modules)  

  -- * Some architecture have tool chains which do not handle rodata attributes
  -- * correctly. For those disable special sections for const, so that other
  -- * architectures can annotate correctly.
  --  

  -- * modpost check for section mismatches during the kernel build.
  -- * A section mismatch happens when there are references from a
  -- * code or data section to an init section (both code or data).
  -- * The init sections are (for most archs) discarded by the kernel
  -- * when early init has completed so all such references are potential bugs.
  -- * For exit sections the same issue exists.
  -- *
  -- * The following markers are used for the cases where the reference to
  -- * the *init / *exit section (code or data) is valid and will teach
  -- * modpost not to issue a warning.  Intended semantics is that a code or
  -- * data tagged __ref* can reference code or data from init section without
  -- * producing a warning (of course, no warning does not mean code is
  -- * correct, so optimally document why the __ref is needed and why it's OK).
  -- *
  -- * The markers follow same syntax rules as __init / __initdata.
  --  

  -- compatibility defines  
  -- temporary, until all users are removed  
  -- Used for MEMORY_HOTPLUG  
  -- For assembly routines  
  -- temporary, until all users are removed  
  -- silence warnings when references are OK  
  -- * Used for initialization calls..
  --  

   type initcall_t is access function return int;
   pragma Convention (C, initcall_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:135

   type exitcall_t is access procedure;
   pragma Convention (C, exitcall_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:136

  -- Used for contructor calls.  
   type ctor_fn_t is access procedure;
   pragma Convention (C, ctor_fn_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:142

  -- Defined in init/main.c  
   function do_one_initcall (fn : initcall_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:145
   pragma Import (CPP, do_one_initcall, "_Z15do_one_initcallPFivE");

   boot_command_line : aliased Interfaces.C.char_array (size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:146
   pragma Import (C, boot_command_line, "boot_command_line");

   saved_command_line : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:147
   pragma Import (C, saved_command_line, "saved_command_line");

   reset_devices : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:148
   pragma Import (C, reset_devices, "reset_devices");

  -- used by init/main.c  
   procedure setup_arch (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:151
   pragma Import (CPP, setup_arch, "_Z10setup_archPPc");

   procedure prepare_namespace;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:152
   pragma Import (CPP, prepare_namespace, "_Z17prepare_namespacev");

   procedure load_default_modules;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:153
   pragma Import (CPP, load_default_modules, "_Z20load_default_modulesv");

   function init_rootfs return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:154
   pragma Import (CPP, init_rootfs, "_Z11init_rootfsv");

   late_time_init : access procedure;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:156
   pragma Import (C, late_time_init, "late_time_init");

   initcall_debug : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/init.h:158
   pragma Import (C, initcall_debug, "initcall_debug");

  -- Work around a LTO gcc problem: when there is no reference to a variable
  -- * in a module it will be moved to the end of the program. This causes
  -- * reordering of initcalls which the kernel does not like.
  -- * Add a dummy reference function to avoid this. The function is
  -- * deleted by the linker.
  --  

  -- initcalls are now grouped by functionality into separate 
  -- * subsections. Ordering inside the subsections is determined
  -- * by link order. 
  -- * For backwards compatibility, initcall() puts the call in 
  -- * the device init subsection.
  -- *
  -- * The `id' arg to __define_initcall() is needed so that multiple initcalls
  -- * can point at the same handler without causing duplicate-symbol build errors.
  --  

  -- * Early initcalls run before initializing SMP.
  -- *
  -- * Only for built-in code, not modules.
  --  

  -- * A "pure" initcall has no dependencies on anything else, and purely
  -- * initializes variables that couldn't be statically initialized.
  -- *
  -- * This only exists for built-in code, not for modules.
  -- * Keep main.c:initcall_level_names[] in sync.
  --  

  -- * Only for really core code.  See moduleparam.h for the normal way.
  -- *
  -- * Force the alignment so the compiler doesn't space elements of the
  -- * obs_kernel_param "array" too far apart in .init.setup.
  --  

  -- NOTE: fn is as per module_param, not __setup!  Emits warning if fn
  -- * returns non-zero.  

  -- Relies on boot_command_line being set  
  --*
  -- * module_init() - driver initialization entry point
  -- * @x: function to be run at kernel boot time or module insertion
  -- * 
  -- * module_init() will either be called during do_initcalls() (if
  -- * builtin) or at module insertion time (if a module).  There can only
  -- * be one per module.
  --  

  --*
  -- * module_exit() - driver exit entry point
  -- * @x: function to be run when driver is removed
  -- * 
  -- * module_exit() will wrap the driver clean-up code
  -- * with cleanup_module() when used with rmmod when
  -- * the driver is a module.  If the driver is statically
  -- * compiled into the kernel, module_exit() has no effect.
  -- * There can only be one per module.
  --  

  -- * In most cases loadable modules do not need custom
  -- * initcall levels. There are still some valid cases where
  -- * a driver may be needed early if built in, and does not
  -- * matter when built as a loadable module. Like bus
  -- * snooping debug drivers.
  --  

  -- Each module must use one module_init().  
  -- This is only required if you want to be unloadable.  
  -- Data marked not to be saved by software suspend  
  -- This means "can be init if no module support, otherwise module load
  --   may call it."  

end linux_init_h;

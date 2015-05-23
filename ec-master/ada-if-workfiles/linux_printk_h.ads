pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with stdarg_h;
with System;
with linux_types_h;
with Interfaces.C.Extensions;

package linux_printk_h is

   --  unsupported macro: DEFAULT_MESSAGE_LOGLEVEL CONFIG_DEFAULT_MESSAGE_LOGLEVEL
   --  unsupported macro: CONSOLE_LOGLEVEL_SILENT 0
   --  unsupported macro: CONSOLE_LOGLEVEL_MIN 1
   --  unsupported macro: CONSOLE_LOGLEVEL_QUIET 4
   --  unsupported macro: CONSOLE_LOGLEVEL_DEFAULT 7
   --  unsupported macro: CONSOLE_LOGLEVEL_DEBUG 10
   --  unsupported macro: CONSOLE_LOGLEVEL_MOTORMOUTH 15
   --  unsupported macro: console_loglevel (console_printk[0])
   --  unsupported macro: default_message_loglevel (console_printk[1])
   --  unsupported macro: minimum_console_loglevel (console_printk[2])
   --  unsupported macro: default_console_loglevel (console_printk[3])
   --  unsupported macro: FW_BUG "[Firmware Bug]: "
   --  unsupported macro: FW_WARN "[Firmware Warn]: "
   --  unsupported macro: FW_INFO "[Firmware Info]: "
   --  unsupported macro: HW_ERR "[Hardware Error]: "
   --  unsupported macro: DEPRECATED "[Deprecated]: "
   --  arg-macro: procedure printk_ratelimit __printk_ratelimit(__func__)
   --    __printk_ratelimit(__func__)
   --  arg-macro: procedure pr_fmt fmt
   --    fmt
   --  unsupported macro: pr_emerg(fmt,...) printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_alert(fmt,...) printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_crit(fmt,...) printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_err(fmt,...) printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_warning(fmt,...) printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_warn pr_warning
   --  unsupported macro: pr_notice(fmt,...) printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_info(fmt,...) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_cont(fmt,...) printk(KERN_CONT fmt, ##__VA_ARGS__)
   --  unsupported macro: pr_devel(fmt,...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_debug(fmt,...) dynamic_pr_debug(fmt, ##__VA_ARGS__)
   --  unsupported macro: printk_once(fmt,...) ({ static bool __print_once __read_mostly; if (!__print_once) { __print_once = true; printk(fmt, ##__VA_ARGS__); } })
   --  unsupported macro: printk_deferred_once(fmt,...) ({ static bool __print_once __read_mostly; if (!__print_once) { __print_once = true; printk_deferred(fmt, ##__VA_ARGS__); } })
   --  unsupported macro: pr_emerg_once(fmt,...) printk_once(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_alert_once(fmt,...) printk_once(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_crit_once(fmt,...) printk_once(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_err_once(fmt,...) printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_warn_once(fmt,...) printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_notice_once(fmt,...) printk_once(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_info_once(fmt,...) printk_once(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_cont_once(fmt,...) printk_once(KERN_CONT pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_devel_once(fmt,...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_debug_once(fmt,...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: printk_ratelimited(fmt,...) ({ static DEFINE_RATELIMIT_STATE(_rs, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST); if (__ratelimit(&_rs)) printk(fmt, ##__VA_ARGS__); })
   --  unsupported macro: pr_emerg_ratelimited(fmt,...) printk_ratelimited(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_alert_ratelimited(fmt,...) printk_ratelimited(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_crit_ratelimited(fmt,...) printk_ratelimited(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_err_ratelimited(fmt,...) printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_warn_ratelimited(fmt,...) printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_notice_ratelimited(fmt,...) printk_ratelimited(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_info_ratelimited(fmt,...) printk_ratelimited(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_devel_ratelimited(fmt,...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
   --  unsupported macro: pr_debug_ratelimited(fmt,...) do { static DEFINE_RATELIMIT_STATE(_rs, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST); DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt); if (unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT) && __ratelimit(&_rs)) __dynamic_pr_debug(&descriptor, fmt, ##__VA_ARGS__); } while (0)
   --  arg-macro: procedure print_hex_dump_bytes dynamic_hex_dump(prefix_str, prefix_type, 16, 1, buf, len, true)
   --    dynamic_hex_dump(prefix_str, prefix_type, 16, 1, buf, len, true)
   --  arg-macro: procedure print_hex_dump_debug dynamic_hex_dump(prefix_str, prefix_type, rowsize, groupsize, buf, len, ascii)
   --    dynamic_hex_dump(prefix_str, prefix_type, rowsize, groupsize, buf, len, ascii)
   linux_banner : aliased Interfaces.C.char_array (size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:10
   pragma Import (C, linux_banner, "linux_banner");

   linux_proc_banner : aliased Interfaces.C.char_array (size_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:11
   pragma Import (C, linux_proc_banner, "linux_proc_banner");

   function printk_get_level (buffer : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:13
   pragma Import (CPP, printk_get_level, "_ZL16printk_get_levelPKc");

  -- KERN_DEFAULT  
   function printk_skip_level (buffer : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:25
   pragma Import (CPP, printk_skip_level, "_ZL17printk_skip_levelPKc");

  -- printk's without a loglevel use this..  
  -- We show everything that is MORE important than this..  
   console_printk : aliased array (size_t) of aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:44
   pragma Import (C, console_printk, "console_printk");

   procedure console_silent;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:51
   pragma Import (CPP, console_silent, "_ZL14console_silentv");

   procedure console_verbose;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:56
   pragma Import (CPP, console_verbose, "_ZL15console_verbosev");

   type va_format is record
      fmt : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:63
      va : access stdarg_h.va_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:64
   end record;
   pragma Convention (C_Pass_By_Copy, va_format);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:62

  -- * FW_BUG
  -- * Add this to a message where you are sure the firmware is buggy or behaves
  -- * really stupid or out of spec. Be aware that the responsible BIOS developer
  -- * should be able to fix this issue or at least get a concrete idea of the
  -- * problem by reading your message without the need of looking at the kernel
  -- * code.
  -- *
  -- * Use it for definite and high priority BIOS bugs.
  -- *
  -- * FW_WARN
  -- * Use it for not that clear (e.g. could the kernel messed up things already?)
  -- * and medium priority BIOS bugs.
  -- *
  -- * FW_INFO
  -- * Use this one if you want to tell the user or vendor about something
  -- * suspicious, but generally harmless related to the firmware.
  -- *
  -- * Use it for information or very low priority BIOS bugs.
  --  

  -- * HW_ERR
  -- * Add this to a message for hardware errors, so that user can report
  -- * it to hardware vendor instead of LKML or software vendor.
  --  

  -- * DEPRECATED
  -- * Add this to a message whenever you want to warn user space about the use
  -- * of a deprecated aspect of an API so they can stop using it
  --  

  -- * Dummy printk for disabled debugging statements to use whilst maintaining
  -- * gcc's format and side-effect checking.
  --  

   function no_printk (fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:110
   pragma Import (CPP, no_printk, "_ZL9no_printkPKcz");

   procedure early_vprintk (fmt : Interfaces.C.Strings.chars_ptr; ap : access System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:118
   pragma Import (CPP, early_vprintk, "_Z13early_vprintkPKcP13__va_list_tag");

   function vprintk_emit
     (facility : int;
      level : int;
      dict : Interfaces.C.Strings.chars_ptr;
      dictlen : linux_types_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr;
      args : access System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:126
   pragma Import (C, vprintk_emit, "vprintk_emit");

   function vprintk (fmt : Interfaces.C.Strings.chars_ptr; args : access System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:131
   pragma Import (C, vprintk, "vprintk");

   function printk_emit
     (facility : int;
      level : int;
      dict : Interfaces.C.Strings.chars_ptr;
      dictlen : linux_types_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:134
   pragma Import (C, printk_emit, "printk_emit");

   function printk (fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:139
   pragma Import (C, printk, "printk");

  -- * Special printk facility for scheduler/timekeeping use only, _DO_NOT_USE_ !
  --  

   function printk_deferred (fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:144
   pragma Import (CPP, printk_deferred, "_Z15printk_deferredPKcz");

  -- * Please don't use printk_ratelimit(), because it shares ratelimiting state
  -- * with all other unrelated printk_ratelimit() callsites.  Instead use
  -- * printk_ratelimited() or plain old __ratelimit().
  --  

   --  skipped func __printk_ratelimit

   function printk_timed_ratelimit (caller_jiffies : access unsigned_long; interval_msec : unsigned) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:153
   pragma Import (CPP, printk_timed_ratelimit, "_Z22printk_timed_ratelimitPmj");

   printk_delay_msec : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:156
   pragma Import (C, printk_delay_msec, "printk_delay_msec");

   dmesg_restrict : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:157
   pragma Import (C, dmesg_restrict, "dmesg_restrict");

   kptr_restrict : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:158
   pragma Import (C, kptr_restrict, "kptr_restrict");

   procedure wake_up_klogd;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:160
   pragma Import (CPP, wake_up_klogd, "_Z13wake_up_klogdv");

   procedure log_buf_kexec_setup;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:162
   pragma Import (CPP, log_buf_kexec_setup, "_Z19log_buf_kexec_setupv");

   procedure setup_log_buf (early : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:163
   pragma Import (CPP, setup_log_buf, "_Z13setup_log_bufi");

   procedure dump_stack_set_arch_desc (fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      );  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:164
   pragma Import (CPP, dump_stack_set_arch_desc, "_Z24dump_stack_set_arch_descPKcz");

   procedure dump_stack_print_info (log_lvl : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:165
   pragma Import (CPP, dump_stack_print_info, "_Z21dump_stack_print_infoPKc");

   procedure show_regs_print_info (log_lvl : Interfaces.C.Strings.chars_ptr);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:166
   pragma Import (CPP, show_regs_print_info, "_Z20show_regs_print_infoPKc");

  -- * These can be used to print at the various log levels.
  -- * All of these will print unconditionally, although note that pr_debug()
  -- * and other debug macros are compiled out unless either DEBUG is defined
  -- * or CONFIG_DYNAMIC_DEBUG is set.
  --  

  -- pr_devel() should produce zero code unless DEBUG is defined  
  -- If you are writing a driver, please use dev_dbg instead  
  -- dynamic_pr_debug() uses pr_fmt() internally so we don't need it here  
  -- * Print a one-time message (analogous to WARN_ONCE() et al):
  --  

  -- If you are writing a driver, please use dev_dbg instead  
  -- * ratelimited messages with local ratelimit_state,
  -- * no local ratelimit_state used in the !PRINTK case
  --  

  -- no pr_cont_ratelimited, don't do that...  
  -- If you are writing a driver, please use dev_dbg instead  
  -- descriptor check is first to prevent flooding with "callbacks suppressed"  
   --  skipped empty struct file_operations

   kmsg_fops : aliased file_operations;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:400
   pragma Import (C, kmsg_fops, "kmsg_fops");

   procedure hex_dump_to_buffer
     (buf : System.Address;
      len : linux_types_h.size_t;
      rowsize : int;
      groupsize : int;
      linebuf : Interfaces.C.Strings.chars_ptr;
      linebuflen : linux_types_h.size_t;
      ascii : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:407
   pragma Import (CPP, hex_dump_to_buffer, "_Z18hex_dump_to_bufferPKvmiiPcmb");

   procedure print_hex_dump
     (level : Interfaces.C.Strings.chars_ptr;
      prefix_str : Interfaces.C.Strings.chars_ptr;
      prefix_type : int;
      rowsize : int;
      groupsize : int;
      buf : System.Address;
      len : linux_types_h.size_t;
      ascii : Extensions.bool);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/printk.h:411
   pragma Import (CPP, print_hex_dump, "_Z14print_hex_dumpPKcS0_iiiPKvmb");

end linux_printk_h;

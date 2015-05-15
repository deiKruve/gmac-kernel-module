pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with linux_types_h;
with asm_generic_int_ll64_h;

package linux_kdev_t_h is

   --  unsupported macro: MINORBITS 20
   --  unsupported macro: MINORMASK ((1U << MINORBITS) - 1)
   --  arg-macro: function MAJOR ((unsigned int) ((dev) >> MINORBITS)
   --    return (unsigned int) ((dev) >> MINORBITS);
   --  arg-macro: function MINOR ((unsigned int) ((dev) and MINORMASK)
   --    return (unsigned int) ((dev) and MINORMASK);
   --  arg-macro: function MKDEV (((ma) << MINORBITS) or (mi)
   --    return ((ma) << MINORBITS) or (mi);
   --  arg-macro: procedure print_dev_t sprintf((buffer), "%u:%u\n", MAJOR(dev), MINOR(dev))
   --    sprintf((buffer), "%u:%u\n", MAJOR(dev), MINOR(dev))
   --  arg-macro: function format_dev_t ({ sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev)); buffer; }
   --    return { sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev)); buffer; };
  -- acceptable for old filesystems  
   function old_valid_dev (dev : linux_types_h.dev_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:23
   pragma Import (CPP, old_valid_dev, "_ZL13old_valid_devj");

   function old_encode_dev (dev : linux_types_h.dev_t) return asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:28
   pragma Import (CPP, old_encode_dev, "_ZL14old_encode_devj");

   function old_decode_dev (val : asm_generic_int_ll64_h.u16) return linux_types_h.dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:33
   pragma Import (CPP, old_decode_dev, "_ZL14old_decode_devt");

   function new_valid_dev (dev : linux_types_h.dev_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:38
   pragma Import (CPP, new_valid_dev, "_ZL13new_valid_devj");

   function new_encode_dev (dev : linux_types_h.dev_t) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:43
   pragma Import (CPP, new_encode_dev, "_ZL14new_encode_devj");

   function new_decode_dev (dev : asm_generic_int_ll64_h.u32) return linux_types_h.dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:50
   pragma Import (CPP, new_decode_dev, "_ZL14new_decode_devj");

   function huge_valid_dev (dev : linux_types_h.dev_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:57
   pragma Import (CPP, huge_valid_dev, "_ZL14huge_valid_devj");

   function huge_encode_dev (dev : linux_types_h.dev_t) return asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:62
   pragma Import (CPP, huge_encode_dev, "_ZL15huge_encode_devj");

   function huge_decode_dev (dev : asm_generic_int_ll64_h.u64) return linux_types_h.dev_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:67
   pragma Import (CPP, huge_decode_dev, "_ZL15huge_decode_devy");

   function sysv_valid_dev (dev : linux_types_h.dev_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:72
   pragma Import (CPP, sysv_valid_dev, "_ZL14sysv_valid_devj");

   function sysv_encode_dev (dev : linux_types_h.dev_t) return asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:77
   pragma Import (CPP, sysv_encode_dev, "_ZL15sysv_encode_devj");

   function sysv_major (dev : asm_generic_int_ll64_h.u32) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:82
   pragma Import (CPP, sysv_major, "_ZL10sysv_majorj");

   function sysv_minor (dev : asm_generic_int_ll64_h.u32) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/kdev_t.h:87
   pragma Import (CPP, sysv_minor, "_ZL10sysv_minorj");

end linux_kdev_t_h;

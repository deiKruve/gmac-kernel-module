pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with linux_types_h;
limited with asm_jump_label_h;
with System;

package linux_jump_label_h is

   --  arg-macro: procedure STATIC_KEY_CHECK_USE WARN(notstatic_key_initialized, "%s used before call to jump_label_init", __func__)
   --    WARN(notstatic_key_initialized, "%s used before call to jump_label_init", __func__)
   --  unsupported macro: JUMP_LABEL_TYPE_FALSE_BRANCH 0UL
   --  unsupported macro: JUMP_LABEL_TYPE_TRUE_BRANCH 1UL
   --  unsupported macro: JUMP_LABEL_TYPE_MASK 1UL
   --  unsupported macro: STATIC_KEY_INIT_TRUE ((struct static_key) { .enabled = ATOMIC_INIT(1), .entries = (void *)JUMP_LABEL_TYPE_TRUE_BRANCH })
   --  unsupported macro: STATIC_KEY_INIT_FALSE ((struct static_key) { .enabled = ATOMIC_INIT(0), .entries = (void *)JUMP_LABEL_TYPE_FALSE_BRANCH })
   --  unsupported macro: STATIC_KEY_INIT STATIC_KEY_INIT_FALSE
   --  unsupported macro: jump_label_enabled static_key_enabled
  -- * Jump label support
  -- *
  -- * Copyright (C) 2009-2012 Jason Baron <jbaron@redhat.com>
  -- * Copyright (C) 2011-2012 Peter Zijlstra <pzijlstr@redhat.com>
  -- *
  -- * Jump labels provide an interface to generate dynamic branches using
  -- * self-modifying code. Assuming toolchain and architecture support the result
  -- * of a "if (static_key_false(&key))" statement is a unconditional branch (which
  -- * defaults to false - and the true block is placed out of line).
  -- *
  -- * However at runtime we can change the branch target using
  -- * static_key_slow_{inc,dec}(). These function as a 'reference' count on the key
  -- * object and for as long as there are references all branches referring to
  -- * that particular key will point to the (out of line) true block.
  -- *
  -- * Since this relies on modifying code the static_key_slow_{inc,dec}() functions
  -- * must be considered absolute slow paths (machine wide synchronization etc.).
  -- * OTOH, since the affected branches are unconditional their runtime overhead
  -- * will be absolutely minimal, esp. in the default (off) case where the total
  -- * effect is a single NOP of appropriate size. The on case will patch in a jump
  -- * to the out-of-line block.
  -- *
  -- * When the control is directly exposed to userspace it is prudent to delay the
  -- * decrement to avoid high frequency code modifications which can (and do)
  -- * cause significant performance degradation. Struct static_key_deferred and
  -- * static_key_slow_dec_deferred() provide for this.
  -- *
  -- * Lacking toolchain and or architecture support, it falls back to a simple
  -- * conditional branch.
  -- *
  -- * struct static_key my_key = STATIC_KEY_INIT_TRUE;
  -- *
  -- *   if (static_key_true(&my_key)) {
  -- *   }
  -- *
  -- * will result in the true case being in-line and starts the key with a single
  -- * reference. Mixing static_key_true() and static_key_false() on the same key is not
  -- * allowed.
  -- *
  -- * Not initializing the key (static data is initialized to 0s anyway) is the
  -- * same as using STATIC_KEY_INIT_FALSE.
  -- *
  -- 

   static_key_initialized : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:53
   pragma Import (C, static_key_initialized, "static_key_initialized");

   type static_key is record
      enabled : aliased linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:62
      entries : access asm_jump_label_h.jump_entry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:64
      next : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:66
   end record;
   pragma Convention (C_Pass_By_Copy, static_key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:61

  -- Set lsb bit to 1 if branch is default true, 0 ot  
   --  skipped empty struct static_key_mod

   type jump_label_type is 
     (JUMP_LABEL_DISABLE,
      JUMP_LABEL_ENABLE);
   pragma Convention (C, jump_label_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:78

   function static_key_count (key : access static_key) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:87
   pragma Import (CPP, static_key_count, "_ZL16static_key_countP10static_key");

   function jump_label_get_entries (key : access static_key) return access asm_jump_label_h.jump_entry;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:99
   pragma Import (CPP, jump_label_get_entries, "_ZL22jump_label_get_entriesP10static_key");

   function jump_label_get_branch_default (key : access static_key) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:105
   pragma Import (CPP, jump_label_get_branch_default, "_ZL29jump_label_get_branch_defaultP10static_key");

   function static_key_false (key : access static_key) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:113
   pragma Import (CPP, static_key_false, "_ZL16static_key_falseP10static_key");

   function static_key_true (key : access static_key) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:118
   pragma Import (CPP, static_key_true, "_ZL15static_key_trueP10static_key");

   procedure jump_label_init;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:126
   pragma Import (CPP, jump_label_init, "_Z15jump_label_initv");

   procedure jump_label_lock;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:127
   pragma Import (CPP, jump_label_lock, "_Z15jump_label_lockv");

   procedure jump_label_unlock;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:128
   pragma Import (CPP, jump_label_unlock, "_Z17jump_label_unlockv");

   procedure arch_jump_label_transform (c_entry : access asm_jump_label_h.jump_entry; c_type : jump_label_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:129
   pragma Import (CPP, arch_jump_label_transform, "_Z25arch_jump_label_transformP10jump_entry15jump_label_type");

   procedure arch_jump_label_transform_static (c_entry : access asm_jump_label_h.jump_entry; c_type : jump_label_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:131
   pragma Import (CPP, arch_jump_label_transform_static, "_Z32arch_jump_label_transform_staticP10jump_entry15jump_label_type");

   function jump_label_text_reserved (start : System.Address; c_end : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:133
   pragma Import (CPP, jump_label_text_reserved, "_Z24jump_label_text_reservedPvS_");

   procedure static_key_slow_inc (key : access static_key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:134
   pragma Import (CPP, static_key_slow_inc, "_Z19static_key_slow_incP10static_key");

   procedure static_key_slow_dec (key : access static_key);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:135
   pragma Import (CPP, static_key_slow_dec, "_Z19static_key_slow_decP10static_key");

   procedure jump_label_apply_nops (c_mod : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:136
   pragma Import (CPP, jump_label_apply_nops, "_Z21jump_label_apply_nopsP6module");

   function static_key_enabled (key : access static_key) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/jump_label.h:201
   pragma Import (CPP, static_key_enabled, "_ZL18static_key_enabledP10static_key");

end linux_jump_label_h;

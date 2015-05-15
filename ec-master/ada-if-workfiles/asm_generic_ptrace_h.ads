pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with asm_ptrace_h;

package asm_generic_ptrace_h is

   --  arg-macro: function SET_IP (GET_IP(regs) := (val)
   --    return GET_IP(regs) := (val);
   --  arg-macro: function SET_USP (GET_USP(regs) := (val)
   --    return GET_USP(regs) := (val);
   --  arg-macro: function SET_FP (GET_FP(regs) := (val)
   --    return GET_FP(regs) := (val);
  -- * Common low level (register) ptrace helpers
  -- *
  -- * Copyright 2004-2011 Analog Devices Inc.
  -- *
  -- * Licensed under the GPL-2 or later.
  --  

  -- Helpers for working with the instruction pointer  
   function instruction_pointer (regs : access asm_ptrace_h.pt_regs) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/ptrace.h:22
   pragma Import (CPP, instruction_pointer, "_ZL19instruction_pointerP7pt_regs");

   procedure instruction_pointer_set (regs : access asm_ptrace_h.pt_regs; val : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/ptrace.h:26
   pragma Import (CPP, instruction_pointer_set, "_ZL23instruction_pointer_setP7pt_regsm");

  -- Helpers for working with the user stack pointer  
   function user_stack_pointer (regs : access asm_ptrace_h.pt_regs) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/ptrace.h:44
   pragma Import (CPP, user_stack_pointer, "_ZL18user_stack_pointerP7pt_regs");

   procedure user_stack_pointer_set (regs : access asm_ptrace_h.pt_regs; val : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/ptrace.h:48
   pragma Import (CPP, user_stack_pointer_set, "_ZL22user_stack_pointer_setP7pt_regsm");

  -- Helpers for working with the frame pointer  
   function frame_pointer (regs : access asm_ptrace_h.pt_regs) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/ptrace.h:62
   pragma Import (CPP, frame_pointer, "_ZL13frame_pointerP7pt_regs");

   procedure frame_pointer_set (regs : access asm_ptrace_h.pt_regs; val : unsigned_long);  -- /usr/src/linux-headers-3.16.0-4-common/include/asm-generic/ptrace.h:66
   pragma Import (CPP, frame_pointer_set, "_ZL17frame_pointer_setP7pt_regsm");

end asm_generic_ptrace_h;

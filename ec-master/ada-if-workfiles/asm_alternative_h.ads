pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with System;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
limited with asm_paravirt_types_h;
with linux_types_h;
limited with asm_ptrace_h;

package asm_alternative_h is

   --  unsupported macro: LOCK_PREFIX_HERE ".pushsection .smp_locks,\"a\"\n" ".balign 4\n" ".long 671f - .\n" ".popsection\n" "671:"
   --  unsupported macro: LOCK_PREFIX LOCK_PREFIX_HERE "\n\tlock; "
   --  arg-macro: procedure OLDINSTR "661:\n\t" oldinstr "\n662:\n"
   --    "661:\n\t" oldinstr "\n662:\n"
   --  unsupported macro: b_replacement(number) "663"#number
   --  unsupported macro: e_replacement(number) "664"#number
   --  unsupported macro: alt_slen "662b-661b"
   --  arg-macro: procedure alt_rlen e_replacement(number)"f-"b_replacement(number)"f"
   --    e_replacement(number)"f-"b_replacement(number)"f"
   --  arg-macro: procedure ALTINSTR_ENTRY " .long 661b - .\n" " .long " b_replacement(number)"f - .\n" " .word " __stringify(feature) "\n" " .byte " alt_slen "\n" " .byte " alt_rlen(number) "\n"
   --    " .long 661b - .\n" " .long " b_replacement(number)"f - .\n" " .word " __stringify(feature) "\n" " .byte " alt_slen "\n" " .byte " alt_rlen(number) "\n"
   --  arg-macro: procedure DISCARD_ENTRY " .byte 0xff + (" alt_rlen(number) ") - (" alt_slen ")\n"
   --    " .byte 0xff + (" alt_rlen(number) ") - (" alt_slen ")\n"
   --  arg-macro: procedure ALTINSTR_REPLACEMENT b_replacement(number)":\n\t" newinstr "\n" e_replacement(number) ":\n\t"
   --    b_replacement(number)":\n\t" newinstr "\n" e_replacement(number) ":\n\t"
   --  arg-macro: procedure ALTERNATIVE OLDINSTR(oldinstr) ".pushsection .altinstructions,\"a\"\n" ALTINSTR_ENTRY(feature, 1) ".popsection\n" ".pushsection .discard,\"aw\",@progbits\n" DISCARD_ENTRY(1) ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" ALTINSTR_REPLACEMENT(newinstr, feature, 1) ".popsection"
   --    OLDINSTR(oldinstr) ".pushsection .altinstructions,\"a\"\n" ALTINSTR_ENTRY(feature, 1) ".popsection\n" ".pushsection .discard,\"aw\",@progbits\n" DISCARD_ENTRY(1) ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" ALTINSTR_REPLACEMENT(newinstr, feature, 1) ".popsection"
   --  arg-macro: procedure ALTERNATIVE_2 OLDINSTR(oldinstr) ".pushsection .altinstructions,\"a\"\n" ALTINSTR_ENTRY(feature1, 1) ALTINSTR_ENTRY(feature2, 2) ".popsection\n" ".pushsection .discard,\"aw\",@progbits\n" DISCARD_ENTRY(1) DISCARD_ENTRY(2) ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" ALTINSTR_REPLACEMENT(newinstr1, feature1, 1) ALTINSTR_REPLACEMENT(newinstr2, feature2, 2) ".popsection"
   --    OLDINSTR(oldinstr) ".pushsection .altinstructions,\"a\"\n" ALTINSTR_ENTRY(feature1, 1) ALTINSTR_ENTRY(feature2, 2) ".popsection\n" ".pushsection .discard,\"aw\",@progbits\n" DISCARD_ENTRY(1) DISCARD_ENTRY(2) ".popsection\n" ".pushsection .altinstr_replacement, \"ax\"\n" ALTINSTR_REPLACEMENT(newinstr1, feature1, 1) ALTINSTR_REPLACEMENT(newinstr2, feature2, 2) ".popsection"
   --  arg-macro: procedure alternative asm volatile (ALTERNATIVE(oldinstr, newinstr, feature) : : : "memory")
   --    asm volatile (ALTERNATIVE(oldinstr, newinstr, feature) : : : "memory")
   --  unsupported macro: alternative_input(oldinstr,newinstr,feature,input...) asm volatile (ALTERNATIVE(oldinstr, newinstr, feature) : : "i" (0), ## input)
   --  unsupported macro: alternative_io(oldinstr,newinstr,feature,output,input...) asm volatile (ALTERNATIVE(oldinstr, newinstr, feature) : output : "i" (0), ## input)
   --  unsupported macro: alternative_call(oldfunc,newfunc,feature,output,input...) asm volatile (ALTERNATIVE("call %P[old]", "call %P[new]", feature) : output : [old] "i" (oldfunc), [new] "i" (newfunc), ## input)
   --  unsupported macro: alternative_call_2(oldfunc,newfunc1,feature1,newfunc2,feature2,output,input...) asm volatile (ALTERNATIVE_2("call %P[old]", "call %P[new1]", feature1, "call %P[new2]", feature2) : output : [old] "i" (oldfunc), [new1] "i" (newfunc1), [new2] "i" (newfunc2), ## input)
   --  unsupported macro: ASM_OUTPUT2(a...) a
   --  unsupported macro: ASM_NO_INPUT_CLOBBER(clbr...) "i" (0) : clbr
  -- * Alternative inline assembly for SMP.
  -- *
  -- * The LOCK_PREFIX macro defined here replaces the LOCK and
  -- * LOCK_PREFIX macros used everywhere in the source tree.
  -- *
  -- * SMP alternatives use the same data structures as the other
  -- * alternatives and the X86_FEATURE_UP flag to indicate the case of a
  -- * UP system running a SMP kernel.  The existing apply_alternatives()
  -- * works fine for patching a SMP kernel for UP.
  -- *
  -- * The SMP alternative tables can be kept after boot and contain both
  -- * UP and SMP versions of the instructions to allow switching back to
  -- * SMP at runtime, when hotplugging in a new CPU, which is especially
  -- * useful in virtualized environments.
  -- *
  -- * The very common lock prefix is handled as special case in a
  -- * separate table which is a pure address list without replacement ptr
  -- * and size information.  That keeps the table sizes small.
  --  

  -- original instruction  
   type alt_instr is record
      instr_offset : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:47
      repl_offset : aliased asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:48
      cpuid : aliased asm_generic_int_ll64_h.u16;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:49
      instrlen : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:50
      replacementlen : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:51
   end record;
   pragma Convention (C_Pass_By_Copy, alt_instr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:46

  -- offset to replacement instruction  
  -- cpuid bit set for replacement  
  -- length of original instruction  
  -- length of new instruction, <= instrlen  
   procedure alternative_instructions;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:54
   pragma Import (CPP, alternative_instructions, "_Z24alternative_instructionsv");

   procedure apply_alternatives (start : access alt_instr; c_end : access alt_instr);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:55
   pragma Import (CPP, apply_alternatives, "_Z18apply_alternativesP9alt_instrS0_");

   procedure alternatives_smp_module_add
     (c_mod : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      locks : System.Address;
      locks_end : System.Address;
      text : System.Address;
      text_end : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:60
   pragma Import (CPP, alternatives_smp_module_add, "_Z27alternatives_smp_module_addP6modulePcPvS2_S2_S2_");

   procedure alternatives_smp_module_del (c_mod : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:63
   pragma Import (CPP, alternatives_smp_module_del, "_Z27alternatives_smp_module_delP6module");

   procedure alternatives_enable_smp;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:64
   pragma Import (CPP, alternatives_enable_smp, "_Z23alternatives_enable_smpv");

   function alternatives_text_reserved (start : System.Address; c_end : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:65
   pragma Import (CPP, alternatives_text_reserved, "_Z26alternatives_text_reservedPvS_");

   skip_smp_alternatives : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:66
   pragma Import (C, skip_smp_alternatives, "skip_smp_alternatives");

  -- alternative assembly primitive:  
  -- * This must be included *after* the definition of ALTERNATIVE due to
  -- * <asm/arch_hweight.h>
  --  

  -- * Alternative instructions for different CPU types or capabilities.
  -- *
  -- * This allows to use optimized instructions even on generic binary
  -- * kernels.
  -- *
  -- * length of oldinstr must be longer or equal the length of newinstr
  -- * It can be padded with nops as needed.
  -- *
  -- * For non barrier like inlines please define new variants
  -- * without volatile and memory clobber.
  --  

  -- * Alternative inline assembly with input.
  -- *
  -- * Pecularities:
  -- * No memory clobber here.
  -- * Argument numbers start with 1.
  -- * Best is to use constraints that are fixed size (like (%1) ... "r")
  -- * If you use variable sized constraints like "m" or "g" in the
  -- * replacement make sure to pad to the worst case length.
  -- * Leaving an unused argument 0 to keep API compatibility.
  --  

  -- Like alternative_input, but with a single output argument  
  -- Like alternative_io, but for replacing a direct call with another one.  
  -- * Like alternative_call, but there are two features and respective functions.
  -- * If CPU has feature2, function2 is used.
  -- * Otherwise, if CPU has feature1, function1 is used.
  -- * Otherwise, old function is used.
  --  

  -- * use this macro(s) if you need more than one output parameter
  -- * in alternative_io
  --  

  -- * use this macro if you need clobbers but no inputs in
  -- * alternative_{input,io,call}()
  --  

   procedure apply_paravirt (start : access asm_paravirt_types_h.paravirt_patch_site; c_end : access asm_paravirt_types_h.paravirt_patch_site);  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:201
   pragma Import (CPP, apply_paravirt, "_Z14apply_paravirtP19paravirt_patch_siteS0_");

   function text_poke_early
     (addr : System.Address;
      opcode : System.Address;
      len : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:211
   pragma Import (CPP, text_poke_early, "_Z15text_poke_earlyPvPKvm");

  -- * Clear and restore the kernel write-protection flag on the local CPU.
  -- * Allows the kernel to edit read-only pages.
  -- * Side-effect: any interrupt handler running between save and restore will have
  -- * the ability to write to read-only pages.
  -- *
  -- * Warning:
  -- * Code patching in the UP case is safe if NMIs and MCE handlers are stopped and
  -- * no thread can be preempted in the instructions being modified (no iret to an
  -- * invalid instruction possible) or if the instructions are changed from a
  -- * consistent state to another consistent state atomically.
  -- * On the local CPU you need to be protected again NMI or MCE handlers seeing an
  -- * inconsistent instruction while you patch.
  --  

   function text_poke
     (addr : System.Address;
      opcode : System.Address;
      len : linux_types_h.size_t) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:227
   pragma Import (CPP, text_poke, "_Z9text_pokePvPKvm");

   function poke_int3_handler (regs : access asm_ptrace_h.pt_regs) return int;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:228
   pragma Import (CPP, poke_int3_handler, "_Z17poke_int3_handlerP7pt_regs");

   function text_poke_bp
     (addr : System.Address;
      opcode : System.Address;
      len : linux_types_h.size_t;
      handler : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/arch/x86/include/asm/alternative.h:229
   pragma Import (CPP, text_poke_bp, "_Z12text_poke_bpPvPKvmS_");

end asm_alternative_h;

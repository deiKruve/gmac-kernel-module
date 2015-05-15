pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_xen_interface_h;
with System;
with linux_types_h;
with asm_xen_interface_64_h;
with asm_pvclock_abi_h;
with asm_generic_int_ll64_h;

package xen_interface_xen_h is

   --  unsupported macro: VIRQ_TIMER 0
   --  unsupported macro: VIRQ_DEBUG 1
   --  unsupported macro: VIRQ_CONSOLE 2
   --  unsupported macro: VIRQ_DOM_EXC 3
   --  unsupported macro: VIRQ_DEBUGGER 6
   --  unsupported macro: VIRQ_PCPU_STATE 9
   --  unsupported macro: VIRQ_ARCH_0 16
   --  unsupported macro: VIRQ_ARCH_1 17
   --  unsupported macro: VIRQ_ARCH_2 18
   --  unsupported macro: VIRQ_ARCH_3 19
   --  unsupported macro: VIRQ_ARCH_4 20
   --  unsupported macro: VIRQ_ARCH_5 21
   --  unsupported macro: VIRQ_ARCH_6 22
   --  unsupported macro: VIRQ_ARCH_7 23
   --  unsupported macro: NR_VIRQS 24
   --  unsupported macro: MMU_NORMAL_PT_UPDATE 0
   --  unsupported macro: MMU_MACHPHYS_UPDATE 1
   --  unsupported macro: MMU_PT_UPDATE_PRESERVE_AD 2
   --  unsupported macro: MMUEXT_PIN_L1_TABLE 0
   --  unsupported macro: MMUEXT_PIN_L2_TABLE 1
   --  unsupported macro: MMUEXT_PIN_L3_TABLE 2
   --  unsupported macro: MMUEXT_PIN_L4_TABLE 3
   --  unsupported macro: MMUEXT_UNPIN_TABLE 4
   --  unsupported macro: MMUEXT_NEW_BASEPTR 5
   --  unsupported macro: MMUEXT_TLB_FLUSH_LOCAL 6
   --  unsupported macro: MMUEXT_INVLPG_LOCAL 7
   --  unsupported macro: MMUEXT_TLB_FLUSH_MULTI 8
   --  unsupported macro: MMUEXT_INVLPG_MULTI 9
   --  unsupported macro: MMUEXT_TLB_FLUSH_ALL 10
   --  unsupported macro: MMUEXT_INVLPG_ALL 11
   --  unsupported macro: MMUEXT_FLUSH_CACHE 12
   --  unsupported macro: MMUEXT_SET_LDT 13
   --  unsupported macro: MMUEXT_NEW_USER_BASEPTR 15
   --  unsupported macro: UVMF_NONE (0UL<<0)
   --  unsupported macro: UVMF_TLB_FLUSH (1UL<<0)
   --  unsupported macro: UVMF_INVLPG (2UL<<0)
   --  unsupported macro: UVMF_FLUSHTYPE_MASK (3UL<<0)
   --  unsupported macro: UVMF_MULTI (0UL<<2)
   --  unsupported macro: UVMF_LOCAL (0UL<<2)
   --  unsupported macro: UVMF_ALL (1UL<<2)
   --  unsupported macro: CONSOLEIO_write 0
   --  unsupported macro: CONSOLEIO_read 1
   --  unsupported macro: VMASST_CMD_enable 0
   --  unsupported macro: VMASST_CMD_disable 1
   --  unsupported macro: VMASST_TYPE_4gb_segments 0
   --  unsupported macro: VMASST_TYPE_4gb_segments_notify 1
   --  unsupported macro: VMASST_TYPE_writable_pagetables 2
   --  unsupported macro: VMASST_TYPE_pae_extended_cr3 3
   --  unsupported macro: MAX_VMASST_TYPE 3
   --  unsupported macro: DOMID_FIRST_RESERVED (0x7FF0U)
   --  unsupported macro: DOMID_SELF (0x7FF0U)
   --  unsupported macro: DOMID_IO (0x7FF1U)
   --  unsupported macro: DOMID_XEN (0x7FF2U)
   --  unsupported macro: MAX_GUEST_CMDLINE 1024
   --  unsupported macro: XEN_VGATYPE_TEXT_MODE_3 0x03
   --  unsupported macro: XEN_VGATYPE_VESA_LFB 0x23
   --  unsupported macro: XEN_VGATYPE_EFI_LFB 0x70
   --  unsupported macro: SIF_PRIVILEGED (1<<0)
   --  unsupported macro: SIF_INITDOMAIN (1<<1)
   --  unsupported macro: SIF_PM_MASK (0xFF<<8)
   --  arg-macro: procedure mk_unsigned_long __mk_unsigned_long(x)
   --    __mk_unsigned_long(x)
   --  unsupported macro: TMEM_SPEC_VERSION 1
  --*****************************************************************************
  -- * xen.h
  -- *
  -- * Guest OS interface to Xen.
  -- *
  -- * Copyright (c) 2004, K A Fraser
  --  

  -- * XEN "SYSTEM CALLS" (a.k.a. HYPERCALLS).
  --  

  -- * x86_32: EAX = vector; EBX, ECX, EDX, ESI, EDI = args 1, 2, 3, 4, 5.
  -- *         EAX = return value
  -- *         (argument registers may be clobbered on return)
  -- * x86_64: RAX = vector; RDI, RSI, RDX, R10, R8, R9 = args 1, 2, 3, 4, 5, 6.
  -- *         RAX = return value
  -- *         (argument registers not clobbered on return; RCX, R11 are)
  --  

  -- Architecture-specific hypercall definitions.  
  -- * VIRTUAL INTERRUPTS
  -- *
  -- * Virtual interrupts that a guest OS may receive from Xen.
  --  

  -- Architecture-specific VIRQ definitions.  
  -- * MMU-UPDATE REQUESTS
  -- *
  -- * HYPERVISOR_mmu_update() accepts a list of (ptr, val) pairs.
  -- * A foreigndom (FD) can be specified (or DOMID_SELF for none).
  -- * Where the FD has some effect, it is described below.
  -- * ptr[1:0] specifies the appropriate MMU_* command.
  -- *
  -- * ptr[1:0] == MMU_NORMAL_PT_UPDATE:
  -- * Updates an entry in a page table. If updating an L1 table, and the new
  -- * table entry is valid/present, the mapped frame must belong to the FD, if
  -- * an FD has been specified. If attempting to map an I/O page then the
  -- * caller assumes the privilege of the FD.
  -- * FD == DOMID_IO: Permit /only/ I/O mappings, at the priv level of the caller.
  -- * FD == DOMID_XEN: Map restricted areas of Xen's heap space.
  -- * ptr[:2]  -- Machine address of the page-table entry to modify.
  -- * val      -- Value to write.
  -- *
  -- * ptr[1:0] == MMU_MACHPHYS_UPDATE:
  -- * Updates an entry in the machine->pseudo-physical mapping table.
  -- * ptr[:2]  -- Machine address within the frame whose mapping to modify.
  -- *             The frame must belong to the FD, if one is specified.
  -- * val      -- Value to write into the mapping entry.
  -- *
  -- * ptr[1:0] == MMU_PT_UPDATE_PRESERVE_AD:
  -- * As MMU_NORMAL_PT_UPDATE above, but A/D bits currently in the PTE are ORed
  -- * with those in @val.
  --  

  -- * MMU EXTENDED OPERATIONS
  -- *
  -- * HYPERVISOR_mmuext_op() accepts a list of mmuext_op structures.
  -- * A foreigndom (FD) can be specified (or DOMID_SELF for none).
  -- * Where the FD has some effect, it is described below.
  -- *
  -- * cmd: MMUEXT_(UN)PIN_*_TABLE
  -- * mfn: Machine frame number to be (un)pinned as a p.t. page.
  -- *      The frame must belong to the FD, if one is specified.
  -- *
  -- * cmd: MMUEXT_NEW_BASEPTR
  -- * mfn: Machine frame number of new page-table base to install in MMU.
  -- *
  -- * cmd: MMUEXT_NEW_USER_BASEPTR [x86/64 only]
  -- * mfn: Machine frame number of new page-table base to install in MMU
  -- *      when in user space.
  -- *
  -- * cmd: MMUEXT_TLB_FLUSH_LOCAL
  -- * No additional arguments. Flushes local TLB.
  -- *
  -- * cmd: MMUEXT_INVLPG_LOCAL
  -- * linear_addr: Linear address to be flushed from the local TLB.
  -- *
  -- * cmd: MMUEXT_TLB_FLUSH_MULTI
  -- * vcpumask: Pointer to bitmap of VCPUs to be flushed.
  -- *
  -- * cmd: MMUEXT_INVLPG_MULTI
  -- * linear_addr: Linear address to be flushed.
  -- * vcpumask: Pointer to bitmap of VCPUs to be flushed.
  -- *
  -- * cmd: MMUEXT_TLB_FLUSH_ALL
  -- * No additional arguments. Flushes all VCPUs' TLBs.
  -- *
  -- * cmd: MMUEXT_INVLPG_ALL
  -- * linear_addr: Linear address to be flushed from all VCPUs' TLBs.
  -- *
  -- * cmd: MMUEXT_FLUSH_CACHE
  -- * No additional arguments. Writes back and flushes cache contents.
  -- *
  -- * cmd: MMUEXT_SET_LDT
  -- * linear_addr: Linear address of LDT base (NB. must be page-aligned).
  -- * nr_ents: Number of entries in LDT.
  --  

   type anon_126 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            mfn : aliased asm_xen_interface_h.xen_pfn_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:192
         when others =>
            linear_addr : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:194
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_126);
   pragma Unchecked_Union (anon_126);
   type anon_127 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            nr_ents : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:198
         when others =>
            vcpumask : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:200
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_127);
   pragma Unchecked_Union (anon_127);
   type mmuext_op is record
      cmd : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:189
      arg1 : anon_126;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:195
      arg2 : anon_127;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:201
   end record;
   pragma Convention (C_Pass_By_Copy, mmuext_op);  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:188

  -- [UN]PIN_TABLE, NEW_BASEPTR, NEW_USER_BASEPTR  
  -- INVLPG_LOCAL, INVLPG_ALL, SET_LDT  
  -- SET_LDT  
  -- TLB_FLUSH_MULTI, INVLPG_MULTI  
   type uu_guest_handle_mmuext_op is access all mmuext_op;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:203

  -- These are passed as 'flags' to update_va_mapping. They can be ORed.  
  -- When specifying UVMF_MULTI, also OR in a pointer to a CPU bitmap.    
  -- UVMF_LOCAL is merely UVMF_MULTI with a NULL bitmap pointer.          
  -- * Commands to HYPERVISOR_console_io().
  --  

  -- * Commands to HYPERVISOR_vm_assist().
  --  

   subtype domid_t is linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:236

  -- Domain ids >= DOMID_FIRST_RESERVED cannot be used for ordinary domains.  
  -- DOMID_SELF is used in certain contexts to refer to oneself.  
  -- * DOMID_IO is used to restrict page-table updates to mapping I/O memory.
  -- * Although no Foreign Domain need be specified to map I/O pages, DOMID_IO
  -- * is useful to ensure that no mappings to the OS's own heap are accidentally
  -- * installed. (e.g., in Linux this could cause havoc as reference counts
  -- * aren't adjusted on the I/O-mapping code path).
  -- * This only makes sense in MMUEXT_SET_FOREIGNDOM, but in that context can
  -- * be specified by any calling domain.
  --  

  -- * DOMID_XEN is used to allow privileged domains to map restricted parts of
  -- * Xen's heap space (e.g., the machine_to_phys table).
  -- * This only makes sense in MMUEXT_SET_FOREIGNDOM, and is only permitted if
  -- * the caller is privileged.
  --  

  -- * Send an array of these to HYPERVISOR_mmu_update().
  -- * NB. The fields are natural pointer/address size for this architecture.
  --  

  -- Machine address of PTE.  
   type mmu_update is record
      ptr : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:268
      val : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:269
   end record;
   pragma Convention (C_Pass_By_Copy, mmu_update);  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:267

  -- New contents of PTE.     
   type uu_guest_handle_mmu_update is access all mmu_update;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:271

  -- * Send an array of these to HYPERVISOR_multicall().
  -- * NB. The fields are natural register size for this architecture.
  --  

   type multicall_entry_args_array is array (0 .. 5) of aliased asm_xen_interface_h.xen_ulong_t;
   type multicall_entry is record
      op : aliased asm_xen_interface_h.xen_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:278
      result : aliased asm_xen_interface_h.xen_long_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:279
      args : aliased multicall_entry_args_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:280
   end record;
   pragma Convention (C_Pass_By_Copy, multicall_entry);  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:277

   type uu_guest_handle_multicall_entry is access all multicall_entry;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:282

  --	 * Updates to the following values are preceded and followed
  --	 * by an increment of 'version'. The guest can therefore
  --	 * detect updates by looking for changes to 'version'. If the
  --	 * least-significant bit of the version number is set then an
  --	 * update is in progress and the guest must wait to read a
  --	 * consistent set of values.  The correct way to interact with
  --	 * the version number is similar to Linux's seqlock: see the
  --	 * implementations of read_seqbegin/read_seqretry.
  --	  

   type vcpu_time_info_pad1_array is array (0 .. 2) of aliased linux_types_h.int8_t;
   type vcpu_time_info is record
      version : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:295
      pad0 : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:296
      tsc_timestamp : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:297
      system_time : aliased linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:298
      tsc_to_system_mul : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:305
      tsc_shift : aliased linux_types_h.int8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:306
      pad1 : aliased vcpu_time_info_pad1_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:307
   end record;
   pragma Convention (C_Pass_By_Copy, vcpu_time_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:284

  -- TSC at last update of time vals.   
  -- Time, in nanosecs, since boot.     
  --	 * Current system time:
  --	 *   system_time + ((tsc - tsc_timestamp) << tsc_shift) * tsc_to_system_mul
  --	 * CPU frequency (Hz):
  --	 *   ((10^9 << 32) / tsc_to_system_mul) >> tsc_shift
  --	  

  -- 32 bytes  
  --	 * 'evtchn_upcall_pending' is written non-zero by Xen to indicate
  --	 * a pending notification for a particular VCPU. It is then cleared
  --	 * by the guest OS /before/ checking for pending work, thus avoiding
  --	 * a set-and-check race. Note that the mask is only accessed by Xen
  --	 * on the CPU that is currently hosting the VCPU. This means that the
  --	 * pending and mask flags can be updated by the guest without special
  --	 * synchronisation (i.e., no need for the x86 LOCK prefix).
  --	 * This may seem suboptimal because if the pending flag is set by
  --	 * a different CPU then an IPI may be scheduled even when the mask
  --	 * is set. However, note:
  --	 *  1. The task of 'interrupt holdoff' is covered by the per-event-
  --	 *     channel mask bits. A 'noisy' event that is continually being
  --	 *     triggered can be masked at source at this very precise
  --	 *     granularity.
  --	 *  2. The main purpose of the per-VCPU mask is therefore to restrict
  --	 *     reentrant execution: whether for concurrency control, or to
  --	 *     prevent unbounded stack usage. Whatever the purpose, we expect
  --	 *     that the mask will be asserted only for short periods at a time,
  --	 *     and so the likelihood of a 'spurious' IPI is suitably small.
  --	 * The mask is read before making an event upcall to the guest: a
  --	 * non-zero mask therefore guarantees that the VCPU will not receive
  --	 * an upcall activation. The mask is cleared when the VCPU requests
  --	 * to block: this avoids wakeup-waiting races.
  --	  

   type vcpu_info is record
      evtchn_upcall_pending : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:336
      evtchn_upcall_mask : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:337
      evtchn_pending_sel : aliased asm_xen_interface_h.xen_ulong_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:338
      arch : aliased asm_xen_interface_64_h.arch_vcpu_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:339
      time : aliased asm_pvclock_abi_h.pvclock_vcpu_time_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:340
   end record;
   pragma Convention (C_Pass_By_Copy, vcpu_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:310

  -- 64 bytes (x86)  
  -- * Xen/kernel shared data -- pointer provided in start_info.
  -- * NB. We expect that this struct is smaller than a page.
  --  

   type shared_info_vcpu_info_array is array (0 .. 31) of aliased vcpu_info;
   type shared_info_evtchn_pending_array is array (0 .. 63) of aliased asm_xen_interface_h.xen_ulong_t;
   type shared_info_evtchn_mask_array is array (0 .. 63) of aliased asm_xen_interface_h.xen_ulong_t;
   type shared_info is record
      vcpu_info : aliased shared_info_vcpu_info_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:348
      evtchn_pending : aliased shared_info_evtchn_pending_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:381
      evtchn_mask : aliased shared_info_evtchn_mask_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:382
      wc : aliased asm_pvclock_abi_h.pvclock_wall_clock;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:388
      arch : aliased asm_xen_interface_h.arch_shared_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:390
   end record;
   pragma Convention (C_Pass_By_Copy, shared_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:347

  --	 * A domain can create "event channels" on which it can send and receive
  --	 * asynchronous event notifications. There are three classes of event that
  --	 * are delivered by this mechanism:
  --	 *  1. Bi-directional inter- and intra-domain connections. Domains must
  --	 *     arrange out-of-band to set up a connection (usually by allocating
  --	 *     an unbound 'listener' port and avertising that via a storage service
  --	 *     such as xenstore).
  --	 *  2. Physical interrupts. A domain with suitable hardware-access
  --	 *     privileges can bind an event-channel port to a physical interrupt
  --	 *     source.
  --	 *  3. Virtual interrupts ('events'). A domain can bind an event-channel
  --	 *     port to a virtual interrupt source, such as the virtual-timer
  --	 *     device or the emergency console.
  --	 *
  --	 * Event channels are addressed by a "port index". Each channel is
  --	 * associated with two bits of information:
  --	 *  1. PENDING -- notifies the domain that there is a pending notification
  --	 *     to be processed. This bit is cleared by the guest.
  --	 *  2. MASK -- if this bit is clear then a 0->1 transition of PENDING
  --	 *     will cause an asynchronous upcall to be scheduled. This bit is only
  --	 *     updated by the guest. It is read-only within Xen. If a channel
  --	 *     becomes pending while the channel is masked then the 'edge' is lost
  --	 *     (i.e., when the channel is unmasked, the guest must manually handle
  --	 *     pending notifications as no upcall will be scheduled by Xen).
  --	 *
  --	 * To expedite scanning of pending notifications, any 0->1 pending
  --	 * transition on an unmasked channel causes a corresponding bit in a
  --	 * per-vcpu selector word to be set. Each bit in the selector covers a
  --	 * 'C long' in the PENDING bitfield array.
  --	  

  --	 * Wallclock time: updated only by control software. Guests should base
  --	 * their gettimeofday() syscall on this wallclock-base value.
  --	  

  -- * Start-of-day memory layout for the initial domain (DOM0):
  -- *  1. The domain is started within contiguous virtual-memory region.
  -- *  2. The contiguous region begins and ends on an aligned 4MB boundary.
  -- *  3. The region start corresponds to the load address of the OS image.
  -- *     If the load address is not 4MB aligned then the address is rounded down.
  -- *  4. This the order of bootstrap elements in the initial virtual region:
  -- *      a. relocated kernel image
  -- *      b. initial ram disk              [mod_start, mod_len]
  -- *      c. list of allocated page frames [mfn_list, nr_pages]
  -- *      d. start_info_t structure        [register ESI (x86)]
  -- *      e. bootstrap page tables         [pt_base, CR3 (x86)]
  -- *      f. bootstrap stack               [register ESP (x86)]
  -- *  5. Bootstrap elements are packed together, but each is 4kB-aligned.
  -- *  6. The initial ram disk may be omitted.
  -- *  7. The list of page frames forms a contiguous 'pseudo-physical' memory
  -- *     layout for the domain. In particular, the bootstrap virtual-memory
  -- *     region is a 1:1 mapping to the first section of the pseudo-physical map.
  -- *  8. All bootstrap elements are mapped read-writable for the guest OS. The
  -- *     only exception is the bootstrap page table, which is mapped read-only.
  -- *  9. There is guaranteed to be at least 512kB padding after the final
  -- *     bootstrap element. If necessary, the bootstrap virtual region is
  -- *     extended by an extra 4MB to ensure this.
  --  

  -- THE FOLLOWING ARE FILLED IN BOTH ON INITIAL BOOT AND ON RESUME.     
  -- "xen-<version>-<platform>".             
   subtype start_info_magic_array is Interfaces.C.char_array (0 .. 31);
   type start_info_cmd_line_array is array (0 .. 1023) of aliased linux_types_h.int8_t;
   type anon_128;
   type anon_129 is record
      mfn : aliased asm_xen_interface_h.xen_pfn_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:430
      evtchn : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:431
   end record;
   pragma Convention (C_Pass_By_Copy, anon_129);
   type anon_130 is record
      info_off : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:434
      info_size : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:435
   end record;
   pragma Convention (C_Pass_By_Copy, anon_130);
   type anon_128 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            domU : aliased anon_129;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:432
         when others =>
            dom0 : aliased anon_130;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:436
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_128);
   pragma Unchecked_Union (anon_128);
   type start_info is record
      magic : aliased start_info_magic_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:422
      nr_pages : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:423
      shared_info : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:424
      flags : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:425
      store_mfn : aliased asm_xen_interface_h.xen_pfn_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:426
      store_evtchn : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:427
      console : anon_128;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:437
      pt_base : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:439
      nr_pt_frames : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:440
      mfn_list : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:441
      mod_start : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:442
      mod_len : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:443
      cmd_line : aliased start_info_cmd_line_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:444
   end record;
   pragma Convention (C_Pass_By_Copy, start_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:420

  -- Total pages allocated to this domain.   
  -- MACHINE address of shared info struct.  
  -- SIF_xxx flags.                          
  -- MACHINE page number of shared page.     
  -- Event channel for store communication.  
  -- MACHINE page number of console page.    
  -- Event channel for console page.         
  -- Offset of console_info struct.          
  -- Size of console_info struct from start. 
  -- THE FOLLOWING ARE ONLY FILLED IN ON INITIAL BOOT (NOT RESUME).      
  -- VIRTUAL address of page directory.      
  -- Number of bootstrap p.t. frames.        
  -- VIRTUAL address of page-frame list.     
  -- VIRTUAL address of pre-loaded module.   
  -- Size (bytes) of pre-loaded module.      
   type anon_131;
   type anon_132 is record
      font_height : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:456
      cursor_x : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:458
      cursor_y : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:458
      rows : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:460
      columns : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:460
   end record;
   pragma Convention (C_Pass_By_Copy, anon_132);
   type anon_133 is record
      width : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:465
      height : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:465
      bytes_per_line : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:467
      bits_per_pixel : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:469
      lfb_base : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:471
      lfb_size : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:472
      red_pos : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:474
      red_size : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:474
      green_pos : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:475
      green_size : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:475
      blue_pos : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:476
      blue_size : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:476
      rsvd_pos : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:477
      rsvd_size : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:477
      gbl_caps : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:480
      mode_attrs : aliased linux_types_h.uint16_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:482
   end record;
   pragma Convention (C_Pass_By_Copy, anon_133);
   type anon_131 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            text_mode_3 : aliased anon_132;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:461
         when others =>
            vesa_lfb : aliased anon_133;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:483
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_131);
   pragma Unchecked_Union (anon_131);
   type dom0_vga_console_info is record
      video_type : aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:448
      u : anon_131;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:484
   end record;
   pragma Convention (C_Pass_By_Copy, dom0_vga_console_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:447

  -- Font height, in pixels.  
  -- Cursor location (column, row).  
  -- Number of rows and columns (dimensions in characters).  
  -- Width and height, in pixels.  
  -- Bytes per scan line.  
  -- Bits per pixel.  
  -- LFB physical address, and size (in units of 64kB).  
  -- RGB mask offsets and sizes, as defined by VBE 1.2+  
  -- VESA capabilities (offset 0xa, VESA command 0x4f00).  
  -- Mode attributes (offset 0x0, VESA command 0x4f01).  
  -- These flags are passed in the 'flags' field of start_info_t.  
   subtype cpumap_t is linux_types_h.uint64_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:492

   type xen_domain_handle_t is array (0 .. 15) of aliased linux_types_h.uint8_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:494

  -- Turn a plain number into a C unsigned long constant.  
   type anon_134;
   type anon_134_uuid_array is array (0 .. 1) of aliased linux_types_h.uint64_t;
   type anon_135 is record
      uuid : aliased anon_134_uuid_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:507
      flags : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:508
   end record;
   pragma Convention (C_Pass_By_Copy, anon_135);
   type anon_134_oid_array is array (0 .. 2) of aliased linux_types_h.uint64_t;
   type anon_136 is record
      oid : aliased anon_134_oid_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:511
      index : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:512
      tmem_offset : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:513
      pfn_offset : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:514
      len : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:515
      gmfn : asm_xen_interface_h.uu_guest_handle_void;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:516
   end record;
   pragma Convention (C_Pass_By_Copy, anon_136);
   type anon_134 (discr : unsigned := 0) is record
      case discr is
            parent : aliased anon_135;
         when others =>
            gen : aliased anon_136;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:517
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_134);
   pragma Unchecked_Union (anon_134);
   type tmem_op is record
      cmd : aliased linux_types_h.uint32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:503
      pool_id : aliased linux_types_h.int32_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:504
      u : anon_134;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:518
   end record;
   pragma Convention (C_Pass_By_Copy, tmem_op);  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:502

  -- for cmd == TMEM_NEW_POOL  
  -- guest machine page frame  
   type uu_guest_handle_u64 is access all asm_generic_int_ll64_h.u64;  -- /usr/src/linux-headers-3.16.0-4-common/include/xen/interface/xen.h:521

  -- In assembly code we cannot use C numeric constant suffixes.  
end xen_interface_xen_h;

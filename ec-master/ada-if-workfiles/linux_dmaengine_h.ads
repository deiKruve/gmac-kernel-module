pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with linux_types_h;
with Interfaces.C.Extensions;
with linux_device_h;
with Interfaces.C.Strings;
with linux_kref_h;
with System;
limited with asm_generic_scatterlist_h;
limited with linux_mm_types_h;
limited with uapi_linux_uio_h;

package linux_dmaengine_h is

   --  unsupported macro: DMA_MIN_COOKIE 1
   --  unsupported macro: DMA_MAX_COOKIE INT_MAX
   --  unsupported macro: DMA_HAS_PQ_CONTINUE (1 << 15)
   --  arg-macro: procedure async_dmaengine_get dmaengine_get()
   --    dmaengine_get()
   --  arg-macro: procedure async_dmaengine_put dmaengine_put()
   --    dmaengine_put()
   --  arg-macro: procedure async_dma_find_channel dma_find_channel(DMA_ASYNC_TX)
   --    dma_find_channel(DMA_ASYNC_TX)
   --  arg-macro: procedure dma_cap_set __dma_cap_set((tx), and(mask))
   --    __dma_cap_set((tx), and(mask))
   --  arg-macro: procedure dma_cap_clear __dma_cap_clear((tx), and(mask))
   --    __dma_cap_clear((tx), and(mask))
   --  arg-macro: procedure dma_cap_zero __dma_cap_zero(and(mask))
   --    __dma_cap_zero(and(mask))
   --  arg-macro: procedure dma_has_cap __dma_has_cap((tx), and(mask))
   --    __dma_has_cap((tx), and(mask))
   --  arg-macro: procedure for_each_dma_cap_mask for_each_set_bit(cap, mask.bits, DMA_TX_TYPE_END)
   --    for_each_set_bit(cap, mask.bits, DMA_TX_TYPE_END)
   --  arg-macro: procedure dma_request_channel __dma_request_channel(and(mask), x, y)
   --    __dma_request_channel(and(mask), x, y)
   --  arg-macro: procedure dma_request_slave_channel_compat __dma_request_slave_channel_compat(and(mask), x, y, dev, name)
   --    __dma_request_slave_channel_compat(and(mask), x, y, dev, name)
  -- * Copyright(c) 2004 - 2006 Intel Corporation. All rights reserved.
  -- *
  -- * This program is free software; you can redistribute it and/or modify it
  -- * under the terms of the GNU General Public License as published by the Free
  -- * Software Foundation; either version 2 of the License, or (at your option)
  -- * any later version.
  -- *
  -- * This program is distributed in the hope that it will be useful, but WITHOUT
  -- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  -- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  -- * more details.
  -- *
  -- * You should have received a copy of the GNU General Public License along with
  -- * this program; if not, write to the Free Software Foundation, Inc., 59
  -- * Temple Place - Suite 330, Boston, MA  02111-1307, USA.
  -- *
  -- * The full GNU General Public License is included in this distribution in the
  -- * file called COPYING.
  --  

  --*
  -- * typedef dma_cookie_t - an opaque DMA cookie
  -- *
  -- * if dma_cookie_t is >0 it's a DMA request cookie, <0 it's an error code
  --  

   subtype dma_cookie_t is asm_generic_int_ll64_h.s32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:38

   function dma_submit_error (cookie : dma_cookie_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:42
   pragma Import (CPP, dma_submit_error, "_ZL16dma_submit_errori");

  --*
  -- * enum dma_status - DMA transaction status
  -- * @DMA_COMPLETE: transaction completed
  -- * @DMA_IN_PROGRESS: transaction not yet processed
  -- * @DMA_PAUSED: transaction is paused
  -- * @DMA_ERROR: transaction failed
  --  

   type dma_status is 
     (DMA_COMPLETE,
      DMA_IN_PROGRESS,
      DMA_PAUSED,
      DMA_ERROR);
   pragma Convention (C, dma_status);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:54

  --*
  -- * enum dma_transaction_type - DMA transaction types/indexes
  -- *
  -- * Note: The DMA_ASYNC_TX capability is not to be set by drivers.  It is
  -- * automatically set as dma devices are registered.
  --  

   type dma_transaction_type is 
     (DMA_MEMCPY,
      DMA_XOR,
      DMA_PQ,
      DMA_XOR_VAL,
      DMA_PQ_VAL,
      DMA_INTERRUPT,
      DMA_SG,
      DMA_PRIVATE,
      DMA_ASYNC_TX,
      DMA_SLAVE,
      DMA_CYCLIC,
      DMA_INTERLEAVE,
      DMA_TX_TYPE_END);
   pragma Convention (C, dma_transaction_type);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:67

  -- last transaction type for creation of the capabilities mask  
  --*
  -- * enum dma_transfer_direction - dma transfer mode and direction indicator
  -- * @DMA_MEM_TO_MEM: Async/Memcpy mode
  -- * @DMA_MEM_TO_DEV: Slave mode & From Memory to Device
  -- * @DMA_DEV_TO_MEM: Slave mode & From Device to Memory
  -- * @DMA_DEV_TO_DEV: Slave mode & From Device to Device
  --  

   type dma_transfer_direction is 
     (DMA_MEM_TO_MEM,
      DMA_MEM_TO_DEV,
      DMA_DEV_TO_MEM,
      DMA_DEV_TO_DEV,
      DMA_TRANS_NONE);
   pragma Convention (C, dma_transfer_direction);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:91

  --*
  -- * Interleaved Transfer Request
  -- * ----------------------------
  -- * A chunk is collection of contiguous bytes to be transfered.
  -- * The gap(in bytes) between two chunks is called inter-chunk-gap(ICG).
  -- * ICGs may or maynot change between chunks.
  -- * A FRAME is the smallest series of contiguous {chunk,icg} pairs,
  -- *  that when repeated an integral number of times, specifies the transfer.
  -- * A transfer template is specification of a Frame, the number of times
  -- *  it is to be repeated and other per-transfer attributes.
  -- *
  -- * Practically, a client driver would have ready a template for each
  -- *  type of transfer it is going to need during its lifetime and
  -- *  set only 'src_start' and 'dst_start' before submitting the requests.
  -- *
  -- *
  -- *  |      Frame-1        |       Frame-2       | ~ |       Frame-'numf'  |
  -- *  |====....==.===...=...|====....==.===...=...| ~ |====....==.===...=...|
  -- *
  -- *    ==  Chunk size
  -- *    ... ICG
  --  

  --*
  -- * struct data_chunk - Element of scatter-gather list that makes a frame.
  -- * @size: Number of bytes to read from source.
  -- *	  size_dst := fn(op, size_src), so doesn't mean much for destination.
  -- * @icg: Number of bytes to jump after last src/dst address of this
  -- *	 chunk and before first src/dst address for next chunk.
  -- *	 Ignored for dst(assumed 0), if dst_inc is true and dst_sgl is false.
  -- *	 Ignored for src(assumed 0), if src_inc is true and src_sgl is false.
  --  

   type data_chunk is record
      size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:132
      icg : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:133
   end record;
   pragma Convention (C_Pass_By_Copy, data_chunk);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:131

  --*
  -- * struct dma_interleaved_template - Template to convey DMAC the transfer pattern
  -- *	 and attributes.
  -- * @src_start: Bus address of source for the first chunk.
  -- * @dst_start: Bus address of destination for the first chunk.
  -- * @dir: Specifies the type of Source and Destination.
  -- * @src_inc: If the source address increments after reading from it.
  -- * @dst_inc: If the destination address increments after writing to it.
  -- * @src_sgl: If the 'icg' of sgl[] applies to Source (scattered read).
  -- *		Otherwise, source is read contiguously (icg ignored).
  -- *		Ignored if src_inc is false.
  -- * @dst_sgl: If the 'icg' of sgl[] applies to Destination (scattered write).
  -- *		Otherwise, destination is filled contiguously (icg ignored).
  -- *		Ignored if dst_inc is false.
  -- * @numf: Number of frames in this template.
  -- * @frame_size: Number of chunks in a frame i.e, size of sgl[].
  -- * @sgl: Array of {chunk,icg} pairs that make up a frame.
  --  

   type dma_interleaved_template_sgl_array is array (0 .. -1) of aliased data_chunk;
   type dma_interleaved_template is record
      src_start : aliased linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:155
      dst_start : aliased linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:156
      dir : aliased dma_transfer_direction;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:157
      src_inc : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:158
      dst_inc : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:159
      src_sgl : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:160
      dst_sgl : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:161
      numf : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:162
      frame_size : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:163
      sgl : aliased dma_interleaved_template_sgl_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:164
   end record;
   pragma Convention (C_Pass_By_Copy, dma_interleaved_template);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:154

  --*
  -- * enum dma_ctrl_flags - DMA flags to augment operation preparation,
  -- *  control completion, and communicate status.
  -- * @DMA_PREP_INTERRUPT - trigger an interrupt (callback) upon completion of
  -- *  this transaction
  -- * @DMA_CTRL_ACK - if clear, the descriptor cannot be reused until the client
  -- *  acknowledges receipt, i.e. has has a chance to establish any dependency
  -- *  chains
  -- * @DMA_PREP_PQ_DISABLE_P - prevent generation of P while generating Q
  -- * @DMA_PREP_PQ_DISABLE_Q - prevent generation of Q while generating P
  -- * @DMA_PREP_CONTINUE - indicate to a driver that it is reusing buffers as
  -- *  sources that were the result of a previous operation, in the case of a PQ
  -- *  operation it continues the calculation with new sources
  -- * @DMA_PREP_FENCE - tell the driver that subsequent operations depend
  -- *  on the result of this operation
  --  

   subtype dma_ctrl_flags is unsigned;
   DMA_PREP_INTERRUPT : constant dma_ctrl_flags := 1;
   DMA_CTRL_ACK : constant dma_ctrl_flags := 2;
   DMA_PREP_PQ_DISABLE_P : constant dma_ctrl_flags := 4;
   DMA_PREP_PQ_DISABLE_Q : constant dma_ctrl_flags := 8;
   DMA_PREP_CONTINUE : constant dma_ctrl_flags := 16;
   DMA_PREP_FENCE : constant dma_ctrl_flags := 32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:183

  --*
  -- * enum dma_ctrl_cmd - DMA operations that can optionally be exercised
  -- * on a running channel.
  -- * @DMA_TERMINATE_ALL: terminate all ongoing transfers
  -- * @DMA_PAUSE: pause ongoing transfers
  -- * @DMA_RESUME: resume paused transfer
  -- * @DMA_SLAVE_CONFIG: this command is only implemented by DMA controllers
  -- * that need to runtime reconfigure the slave channels (as opposed to passing
  -- * configuration data in statically from the platform). An additional
  -- * argument of struct dma_slave_config must be passed in with this
  -- * command.
  -- * @FSLDMA_EXTERNAL_START: this command will put the Freescale DMA controller
  -- * into external start mode.
  --  

   type dma_ctrl_cmd is 
     (DMA_TERMINATE_ALL,
      DMA_PAUSE,
      DMA_RESUME,
      DMA_SLAVE_CONFIG,
      FSLDMA_EXTERNAL_START);
   pragma Convention (C, dma_ctrl_cmd);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:206

  --*
  -- * enum sum_check_bits - bit position of pq_check_flags
  --  

   type sum_check_bits is 
     (SUM_CHECK_P,
      SUM_CHECK_Q);
   pragma Convention (C, sum_check_bits);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:217

  --*
  -- * enum pq_check_flags - result of async_{xor,pq}_zero_sum operations
  -- * @SUM_CHECK_P_RESULT - 1 if xor zero sum error, 0 otherwise
  -- * @SUM_CHECK_Q_RESULT - 1 if reed-solomon zero sum error, 0 otherwise
  --  

   subtype sum_check_flags is unsigned;
   SUM_CHECK_P_RESULT : constant sum_check_flags := 1;
   SUM_CHECK_Q_RESULT : constant sum_check_flags := 2;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:227

  --*
  -- * dma_cap_mask_t - capabilities bitmap modeled after cpumask_t.
  -- * See linux/cpumask.h
  --  

   type dma_cap_mask_t_bits_array is array (0 .. 0) of aliased unsigned_long;
   type dma_cap_mask_t is record
      bits : aliased dma_cap_mask_t_bits_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:237
   end record;
   pragma Convention (C_Pass_By_Copy, dma_cap_mask_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:237

   --  skipped anonymous struct anon_166

  --*
  -- * struct dma_chan_percpu - the per-CPU part of struct dma_chan
  -- * @memcpy_count: transaction counter
  -- * @bytes_transferred: byte counter
  --  

  -- stats  
   type dma_chan_percpu is record
      memcpy_count : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:247
      bytes_transferred : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:248
   end record;
   pragma Convention (C_Pass_By_Copy, dma_chan_percpu);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:245

  --*
  -- * struct dma_chan - devices supply DMA channels, clients use them
  -- * @device: ptr to the dma device who supplies this channel, always !%NULL
  -- * @cookie: last cookie value returned to client
  -- * @completed_cookie: last completed cookie for this channel
  -- * @chan_id: channel ID for sysfs
  -- * @dev: class device for sysfs
  -- * @device_node: used to add this to the device chan list
  -- * @local: per-cpu pointer to a struct dma_chan_percpu
  -- * @client_count: how many clients are using this channel
  -- * @table_count: number of appearances in the mem-to-mem allocation table
  -- * @private: private data for certain client-channel associations
  --  

   type dma_device;
   type dma_chan_dev;
   type dma_chan is record
      device : access dma_device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:265
      cookie : aliased dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:266
      completed_cookie : aliased dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:267
      chan_id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:270
      dev : access dma_chan_dev;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:271
      device_node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:273
      local : access dma_chan_percpu;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:274
      client_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:275
      table_count : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:276
   end record;
   pragma Convention (C_Pass_By_Copy, dma_chan);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:264

  -- sysfs  
  --*
  -- * struct dma_chan_dev - relate sysfs device node to backing channel device
  -- * @chan: driver channel device
  -- * @device: sysfs device
  -- * @dev_id: parent dma_device dev_id
  -- * @idr_ref: reference count to gate release of dma_device dev_id
  --  

   type dma_chan_dev is record
      chan : access dma_chan;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:288
      the_device : aliased linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:289
      dev_id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:290
      idr_ref : access linux_types_h.atomic_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:291
   end record;
   pragma Convention (C_Pass_By_Copy, dma_chan_dev);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:287

  --*
  -- * enum dma_slave_buswidth - defines bus width of the DMA slave
  -- * device, source or target buses
  --  

   subtype dma_slave_buswidth is unsigned;
   DMA_SLAVE_BUSWIDTH_UNDEFINED : constant dma_slave_buswidth := 0;
   DMA_SLAVE_BUSWIDTH_1_BYTE : constant dma_slave_buswidth := 1;
   DMA_SLAVE_BUSWIDTH_2_BYTES : constant dma_slave_buswidth := 2;
   DMA_SLAVE_BUSWIDTH_4_BYTES : constant dma_slave_buswidth := 4;
   DMA_SLAVE_BUSWIDTH_8_BYTES : constant dma_slave_buswidth := 8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:298

  --*
  -- * struct dma_slave_config - dma slave channel runtime config
  -- * @direction: whether the data shall go in or out on this slave
  -- * channel, right now. DMA_MEM_TO_DEV and DMA_DEV_TO_MEM are
  -- * legal values.
  -- * @src_addr: this is the physical address where DMA slave data
  -- * should be read (RX), if the source is memory this argument is
  -- * ignored.
  -- * @dst_addr: this is the physical address where DMA slave data
  -- * should be written (TX), if the source is memory this argument
  -- * is ignored.
  -- * @src_addr_width: this is the width in bytes of the source (RX)
  -- * register where DMA data shall be read. If the source
  -- * is memory this may be ignored depending on architecture.
  -- * Legal values: 1, 2, 4, 8.
  -- * @dst_addr_width: same as src_addr_width but for destination
  -- * target (TX) mutatis mutandis.
  -- * @src_maxburst: the maximum number of words (note: words, as in
  -- * units of the src_addr_width member, not bytes) that can be sent
  -- * in one burst to the device. Typically something like half the
  -- * FIFO depth on I/O peripherals so you don't overflow it. This
  -- * may or may not be applicable on memory sources.
  -- * @dst_maxburst: same as src_maxburst but for destination target
  -- * mutatis mutandis.
  -- * @device_fc: Flow Controller Settings. Only valid for slave channels. Fill
  -- * with 'true' if peripheral should be flow controller. Direction will be
  -- * selected at Runtime.
  -- * @slave_id: Slave requester id. Only valid for slave channels. The dma
  -- * slave peripheral will have unique id as dma requester which need to be
  -- * pass as slave config.
  -- *
  -- * This struct is passed in as configuration data to a DMA engine
  -- * in order to set up a certain channel for DMA transport at runtime.
  -- * The DMA device/engine has to provide support for an additional
  -- * command in the channel config interface, DMA_SLAVE_CONFIG
  -- * and this struct will then be passed in as an argument to the
  -- * DMA engine device_control() function.
  -- *
  -- * The rationale for adding configuration information to this struct is as
  -- * follows: if it is likely that more than one DMA slave controllers in
  -- * the world will support the configuration option, then make it generic.
  -- * If not: if it is fixed so that it be sent in static from the platform
  -- * data, then prefer to do that.
  --  

   type dma_slave_config is record
      direction : aliased dma_transfer_direction;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:351
      src_addr : aliased linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:352
      dst_addr : aliased linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:353
      src_addr_width : aliased dma_slave_buswidth;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:354
      dst_addr_width : aliased dma_slave_buswidth;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:355
      src_maxburst : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:356
      dst_maxburst : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:357
      device_fc : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:358
      slave_id : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:359
   end record;
   pragma Convention (C_Pass_By_Copy, dma_slave_config);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:350

  --*
  -- * enum dma_residue_granularity - Granularity of the reported transfer residue
  -- * @DMA_RESIDUE_GRANULARITY_DESCRIPTOR: Residue reporting is not support. The
  -- *  DMA channel is only able to tell whether a descriptor has been completed or
  -- *  not, which means residue reporting is not supported by this channel. The
  -- *  residue field of the dma_tx_state field will always be 0.
  -- * @DMA_RESIDUE_GRANULARITY_SEGMENT: Residue is updated after each successfully
  -- *  completed segment of the transfer (For cyclic transfers this is after each
  -- *  period). This is typically implemented by having the hardware generate an
  -- *  interrupt after each transferred segment and then the drivers updates the
  -- *  outstanding residue by the size of the segment. Another possibility is if
  -- *  the hardware supports scatter-gather and the segment descriptor has a field
  -- *  which gets set after the segment has been completed. The driver then counts
  -- *  the number of segments without the flag set to compute the residue.
  -- * @DMA_RESIDUE_GRANULARITY_BURST: Residue is updated after each transferred
  -- *  burst. This is typically only supported if the hardware has a progress
  -- *  register of some sort (E.g. a register with the current read/write address
  -- *  or a register with the amount of bursts/beats/bytes that have been
  -- *  transferred or still need to be transferred).
  --  

   type dma_residue_granularity is 
     (DMA_RESIDUE_GRANULARITY_DESCRIPTOR,
      DMA_RESIDUE_GRANULARITY_SEGMENT,
      DMA_RESIDUE_GRANULARITY_BURST);
   pragma Convention (C, dma_residue_granularity);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:382

  -- struct dma_slave_caps - expose capabilities of a slave channel only
  -- *
  -- * @src_addr_widths: bit mask of src addr widths the channel supports
  -- * @dstn_addr_widths: bit mask of dstn addr widths the channel supports
  -- * @directions: bit mask of slave direction the channel supported
  -- * 	since the enum dma_transfer_direction is not defined as bits for each
  -- * 	type of direction, the dma controller should fill (1 << <TYPE>) and same
  -- * 	should be checked by controller as well
  -- * @cmd_pause: true, if pause and thereby resume is supported
  -- * @cmd_terminate: true, if terminate cmd is supported
  -- * @residue_granularity: granularity of the reported transfer residue
  --  

   type dma_slave_caps is record
      src_addr_widths : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:401
      dstn_addr_widths : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:402
      directions : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:403
      cmd_pause : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:404
      cmd_terminate : aliased Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:405
      residue_granularity : aliased dma_residue_granularity;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:406
   end record;
   pragma Convention (C_Pass_By_Copy, dma_slave_caps);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:400

   function dma_chan_name (chan : access dma_chan) return Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:409
   pragma Import (CPP, dma_chan_name, "_ZL13dma_chan_nameP8dma_chan");

   procedure dma_chan_cleanup (the_kref : access linux_kref_h.kref);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:414
   pragma Import (CPP, dma_chan_cleanup, "_Z16dma_chan_cleanupP4kref");

  --*
  -- * typedef dma_filter_fn - callback filter for dma_request_channel
  -- * @chan: channel to be reviewed
  -- * @filter_param: opaque parameter passed through dma_request_channel
  -- *
  -- * When this optional parameter is specified in a call to dma_request_channel a
  -- * suitable channel is passed to this routine for further dispositioning before
  -- * being returned.  Where 'suitable' indicates a non-busy channel that
  -- * satisfies the given capability mask.  It returns 'true' to indicate that the
  -- * channel is suitable.
  --  

   type dma_filter_fn is access function (arg1 : access dma_chan; arg2 : System.Address) return Extensions.bool;
   pragma Convention (C, dma_filter_fn);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:427

   type dma_async_tx_callback is access procedure (arg1 : System.Address);
   pragma Convention (C, dma_async_tx_callback);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:429

   type dmaengine_unmap_data_addr_array is array (0 .. -1) of aliased linux_types_h.dma_addr_t;
   type dmaengine_unmap_data is record
      map_cnt : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:432
      to_cnt : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:433
      from_cnt : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:434
      bidi_cnt : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:435
      dev : access linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:436
      the_kref : aliased linux_kref_h.kref;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:437
      len : aliased linux_types_h.size_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:438
      addr : aliased dmaengine_unmap_data_addr_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:439
   end record;
   pragma Convention (C_Pass_By_Copy, dmaengine_unmap_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:431

  --*
  -- * struct dma_async_tx_descriptor - async transaction descriptor
  -- * ---dma generic offload fields---
  -- * @cookie: tracking cookie for this transaction, set to -EBUSY if
  -- *	this tx is sitting on a dependency list
  -- * @flags: flags to augment operation preparation, control completion, and
  -- * 	communicate status
  -- * @phys: physical address of the descriptor
  -- * @chan: target channel for this operation
  -- * @tx_submit: set the prepared descriptor(s) to be executed by the engine
  -- * @callback: routine to call after this operation is complete
  -- * @callback_param: general parameter to pass to the callback routine
  -- * ---async_tx api specific fields---
  -- * @next: at completion submit this descriptor
  -- * @parent: pointer to the next level up in the dependency chain
  -- * @lock: protect the parent and next pointers
  --  

   type dma_async_tx_descriptor is record
      cookie : aliased dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:460
      flags : aliased dma_ctrl_flags;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:461
      phys : aliased linux_types_h.dma_addr_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:462
      chan : access dma_chan;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:463
      tx_submit : access function (arg1 : access dma_async_tx_descriptor) return dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:464
      callback : dma_async_tx_callback;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:465
      callback_param : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:466
      unmap : access dmaengine_unmap_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:467
   end record;
   pragma Convention (C_Pass_By_Copy, dma_async_tx_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:459

  -- not a 'long' to pack with cookie  
   procedure dma_set_unmap (tx : access dma_async_tx_descriptor; unmap : access dmaengine_unmap_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:476
   pragma Import (CPP, dma_set_unmap, "_ZL13dma_set_unmapP23dma_async_tx_descriptorP20dmaengine_unmap_data");

   function dmaengine_get_unmap_data
     (dev : access linux_device_h.device;
      nr : int;
      flags : linux_types_h.gfp_t) return access dmaengine_unmap_data;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:484
   pragma Import (CPP, dmaengine_get_unmap_data, "_Z24dmaengine_get_unmap_dataP6deviceij");

   procedure dmaengine_unmap_put (unmap : access dmaengine_unmap_data);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:485
   pragma Import (CPP, dmaengine_unmap_put, "_Z19dmaengine_unmap_putP20dmaengine_unmap_data");

   procedure dma_descriptor_unmap (tx : access dma_async_tx_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:501
   pragma Import (CPP, dma_descriptor_unmap, "_ZL20dma_descriptor_unmapP23dma_async_tx_descriptor");

   procedure txd_lock (txd : access dma_async_tx_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:510
   pragma Import (CPP, txd_lock, "_ZL8txd_lockP23dma_async_tx_descriptor");

   procedure txd_unlock (txd : access dma_async_tx_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:513
   pragma Import (CPP, txd_unlock, "_ZL10txd_unlockP23dma_async_tx_descriptor");

   procedure txd_chain (txd : access dma_async_tx_descriptor; next : access dma_async_tx_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:516
   pragma Import (CPP, txd_chain, "_ZL9txd_chainP23dma_async_tx_descriptorS0_");

   procedure txd_clear_parent (txd : access dma_async_tx_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:520
   pragma Import (CPP, txd_clear_parent, "_ZL16txd_clear_parentP23dma_async_tx_descriptor");

   procedure txd_clear_next (txd : access dma_async_tx_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:523
   pragma Import (CPP, txd_clear_next, "_ZL14txd_clear_nextP23dma_async_tx_descriptor");

   function txd_next (txd : access dma_async_tx_descriptor) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:526
   pragma Import (CPP, txd_next, "_ZL8txd_nextP23dma_async_tx_descriptor");

   function txd_parent (txd : access dma_async_tx_descriptor) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:530
   pragma Import (CPP, txd_parent, "_ZL10txd_parentP23dma_async_tx_descriptor");

  --*
  -- * struct dma_tx_state - filled in to report the status of
  -- * a transfer.
  -- * @last: last completed DMA cookie
  -- * @used: last issued DMA cookie (i.e. the one in progress)
  -- * @residue: the remaining number of bytes left to transmit
  -- *	on the selected transfer for states DMA_IN_PROGRESS and
  -- *	DMA_PAUSED if this is implemented in the driver, else 0
  --  

   type dma_tx_state is record
      last : aliased dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:577
      used : aliased dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:578
      residue : aliased asm_generic_int_ll64_h.u32;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:579
   end record;
   pragma Convention (C_Pass_By_Copy, dma_tx_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:576

  --*
  -- * struct dma_device - info on the entity supplying DMA services
  -- * @chancnt: how many DMA channels are supported
  -- * @privatecnt: how many DMA channels are requested by dma_request_channel
  -- * @channels: the list of struct dma_chan
  -- * @global_node: list_head for global dma_device_list
  -- * @cap_mask: one or more dma_capability flags
  -- * @max_xor: maximum number of xor sources, 0 if no capability
  -- * @max_pq: maximum number of PQ sources and PQ-continue capability
  -- * @copy_align: alignment shift for memcpy operations
  -- * @xor_align: alignment shift for xor operations
  -- * @pq_align: alignment shift for pq operations
  -- * @fill_align: alignment shift for memset operations
  -- * @dev_id: unique device ID
  -- * @dev: struct device reference for dma mapping api
  -- * @device_alloc_chan_resources: allocate resources and return the
  -- *	number of allocated descriptors
  -- * @device_free_chan_resources: release DMA channel's resources
  -- * @device_prep_dma_memcpy: prepares a memcpy operation
  -- * @device_prep_dma_xor: prepares a xor operation
  -- * @device_prep_dma_xor_val: prepares a xor validation operation
  -- * @device_prep_dma_pq: prepares a pq operation
  -- * @device_prep_dma_pq_val: prepares a pqzero_sum operation
  -- * @device_prep_dma_interrupt: prepares an end of chain interrupt operation
  -- * @device_prep_slave_sg: prepares a slave dma operation
  -- * @device_prep_dma_cyclic: prepare a cyclic dma operation suitable for audio.
  -- *	The function takes a buffer of size buf_len. The callback function will
  -- *	be called after period_len bytes have been transferred.
  -- * @device_prep_interleaved_dma: Transfer expression in a generic way.
  -- * @device_control: manipulate all pending operations on a channel, returns
  -- *	zero or error code
  -- * @device_tx_status: poll for transaction completion, the optional
  -- *	txstate parameter can be supplied with a pointer to get a
  -- *	struct with auxiliary transfer status information, otherwise the call
  -- *	will just return a simple status code
  -- * @device_issue_pending: push pending transactions to hardware
  -- * @device_slave_caps: return the slave channel capabilities
  --  

   type dma_device is record
      chancnt : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:622
      privatecnt : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:623
      channels : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:624
      global_node : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:625
      cap_mask : aliased dma_cap_mask_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:626
      max_xor : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:627
      max_pq : aliased unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:628
      copy_align : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:629
      xor_align : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:630
      pq_align : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:631
      fill_align : aliased asm_generic_int_ll64_h.u8;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:632
      dev_id : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:635
      dev : access linux_device_h.device;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:636
      device_alloc_chan_resources : access function (arg1 : access dma_chan) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:638
      device_free_chan_resources : access procedure (arg1 : access dma_chan);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:639
      device_prep_dma_memcpy : access function
           (arg1 : access dma_chan;
            arg2 : linux_types_h.dma_addr_t;
            arg3 : linux_types_h.dma_addr_t;
            arg4 : linux_types_h.size_t;
            arg5 : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:643
      device_prep_dma_xor : access function
           (arg1 : access dma_chan;
            arg2 : linux_types_h.dma_addr_t;
            arg3 : access linux_types_h.dma_addr_t;
            arg4 : unsigned;
            arg5 : linux_types_h.size_t;
            arg6 : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:646
      device_prep_dma_xor_val : access function
           (arg1 : access dma_chan;
            arg2 : access linux_types_h.dma_addr_t;
            arg3 : unsigned;
            arg4 : linux_types_h.size_t;
            arg5 : access sum_check_flags;
            arg6 : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:649
      device_prep_dma_pq : access function
           (arg1 : access dma_chan;
            arg2 : access linux_types_h.dma_addr_t;
            arg3 : access linux_types_h.dma_addr_t;
            arg4 : unsigned;
            arg5 : access unsigned_char;
            arg6 : linux_types_h.size_t;
            arg7 : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:653
      device_prep_dma_pq_val : access function
           (arg1 : access dma_chan;
            arg2 : access linux_types_h.dma_addr_t;
            arg3 : access linux_types_h.dma_addr_t;
            arg4 : unsigned;
            arg5 : access unsigned_char;
            arg6 : linux_types_h.size_t;
            arg7 : access sum_check_flags;
            arg8 : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:657
      device_prep_dma_interrupt : access function (arg1 : access dma_chan; arg2 : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:659
      device_prep_dma_sg : access function
           (arg1 : access dma_chan;
            arg2 : access asm_generic_scatterlist_h.scatterlist;
            arg3 : unsigned;
            arg4 : access asm_generic_scatterlist_h.scatterlist;
            arg5 : unsigned;
            arg6 : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:664
      device_prep_slave_sg : access function
           (arg1 : access dma_chan;
            arg2 : access asm_generic_scatterlist_h.scatterlist;
            arg3 : unsigned;
            arg4 : dma_transfer_direction;
            arg5 : unsigned_long;
            arg6 : System.Address) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:669
      device_prep_dma_cyclic : access function
           (arg1 : access dma_chan;
            arg2 : linux_types_h.dma_addr_t;
            arg3 : linux_types_h.size_t;
            arg4 : linux_types_h.size_t;
            arg5 : dma_transfer_direction;
            arg6 : unsigned_long;
            arg7 : System.Address) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:673
      device_prep_interleaved_dma : access function
           (arg1 : access dma_chan;
            arg2 : access dma_interleaved_template;
            arg3 : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:676
      device_control : access function
           (arg1 : access dma_chan;
            arg2 : dma_ctrl_cmd;
            arg3 : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:678
      device_tx_status : access function
           (arg1 : access dma_chan;
            arg2 : dma_cookie_t;
            arg3 : access dma_tx_state) return dma_status;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:682
      device_issue_pending : access procedure (arg1 : access dma_chan);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:683
      device_slave_caps : access function (arg1 : access dma_chan; arg2 : access dma_slave_caps) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:684
   end record;
   pragma Convention (C_Pass_By_Copy, dma_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:620

   function dmaengine_device_control
     (chan : access dma_chan;
      cmd : dma_ctrl_cmd;
      arg : unsigned_long) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:687
   pragma Import (CPP, dmaengine_device_control, "_ZL24dmaengine_device_controlP8dma_chan12dma_ctrl_cmdm");

   function dmaengine_slave_config (chan : access dma_chan; config : access dma_slave_config) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:697
   pragma Import (CPP, dmaengine_slave_config, "_ZL22dmaengine_slave_configP8dma_chanP16dma_slave_config");

   function is_slave_direction (direction : dma_transfer_direction) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:704
   pragma Import (CPP, is_slave_direction, "_ZL18is_slave_direction22dma_transfer_direction");

   function dmaengine_prep_slave_single
     (chan : access dma_chan;
      buf : linux_types_h.dma_addr_t;
      len : linux_types_h.size_t;
      dir : dma_transfer_direction;
      flags : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:709
   pragma Import (CPP, dmaengine_prep_slave_single, "_ZL27dmaengine_prep_slave_singleP8dma_chanym22dma_transfer_directionm");

   function dmaengine_prep_slave_sg
     (chan : access dma_chan;
      sgl : access asm_generic_scatterlist_h.scatterlist;
      sg_len : unsigned;
      dir : dma_transfer_direction;
      flags : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:722
   pragma Import (CPP, dmaengine_prep_slave_sg, "_ZL23dmaengine_prep_slave_sgP8dma_chanP11scatterlistj22dma_transfer_directionm");

   function dmaengine_prep_dma_cyclic
     (chan : access dma_chan;
      buf_addr : linux_types_h.dma_addr_t;
      buf_len : linux_types_h.size_t;
      period_len : linux_types_h.size_t;
      dir : dma_transfer_direction;
      flags : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:742
   pragma Import (CPP, dmaengine_prep_dma_cyclic, "_ZL25dmaengine_prep_dma_cyclicP8dma_chanymm22dma_transfer_directionm");

   function dmaengine_prep_interleaved_dma
     (chan : access dma_chan;
      xt : access dma_interleaved_template;
      flags : unsigned_long) return access dma_async_tx_descriptor;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:751
   pragma Import (CPP, dmaengine_prep_interleaved_dma, "_ZL30dmaengine_prep_interleaved_dmaP8dma_chanP24dma_interleaved_templatem");

   function dma_get_slave_caps (chan : access dma_chan; caps : access dma_slave_caps) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:758
   pragma Import (CPP, dma_get_slave_caps, "_ZL18dma_get_slave_capsP8dma_chanP14dma_slave_caps");

  -- check if the channel supports slave transactions  
   function dmaengine_terminate_all (chan : access dma_chan) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:773
   pragma Import (CPP, dmaengine_terminate_all, "_ZL23dmaengine_terminate_allP8dma_chan");

   function dmaengine_pause (chan : access dma_chan) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:778
   pragma Import (CPP, dmaengine_pause, "_ZL15dmaengine_pauseP8dma_chan");

   function dmaengine_resume (chan : access dma_chan) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:783
   pragma Import (CPP, dmaengine_resume, "_ZL16dmaengine_resumeP8dma_chan");

   function dmaengine_tx_status
     (chan : access dma_chan;
      cookie : dma_cookie_t;
      state : access dma_tx_state) return dma_status;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:788
   pragma Import (CPP, dmaengine_tx_status, "_ZL19dmaengine_tx_statusP8dma_chaniP12dma_tx_state");

   function dmaengine_submit (desc : access dma_async_tx_descriptor) return dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:794
   pragma Import (CPP, dmaengine_submit, "_ZL16dmaengine_submitP23dma_async_tx_descriptor");

   function dmaengine_check_align
     (align : asm_generic_int_ll64_h.u8;
      off1 : linux_types_h.size_t;
      off2 : linux_types_h.size_t;
      len : linux_types_h.size_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:799
   pragma Import (CPP, dmaengine_check_align, "_ZL21dmaengine_check_alignhmmm");

   function is_dma_copy_aligned
     (dev : access dma_device;
      off1 : linux_types_h.size_t;
      off2 : linux_types_h.size_t;
      len : linux_types_h.size_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:811
   pragma Import (CPP, is_dma_copy_aligned, "_ZL19is_dma_copy_alignedP10dma_devicemmm");

   function is_dma_xor_aligned
     (dev : access dma_device;
      off1 : linux_types_h.size_t;
      off2 : linux_types_h.size_t;
      len : linux_types_h.size_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:817
   pragma Import (CPP, is_dma_xor_aligned, "_ZL18is_dma_xor_alignedP10dma_devicemmm");

   function is_dma_pq_aligned
     (dev : access dma_device;
      off1 : linux_types_h.size_t;
      off2 : linux_types_h.size_t;
      len : linux_types_h.size_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:823
   pragma Import (CPP, is_dma_pq_aligned, "_ZL17is_dma_pq_alignedP10dma_devicemmm");

   function is_dma_fill_aligned
     (dev : access dma_device;
      off1 : linux_types_h.size_t;
      off2 : linux_types_h.size_t;
      len : linux_types_h.size_t) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:829
   pragma Import (CPP, is_dma_fill_aligned, "_ZL19is_dma_fill_alignedP10dma_devicemmm");

   procedure dma_set_maxpq
     (dma : access dma_device;
      maxpq : int;
      has_pq_continue : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:836
   pragma Import (CPP, dma_set_maxpq, "_ZL13dma_set_maxpqP10dma_deviceii");

   function dmaf_continue (flags : dma_ctrl_flags) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:843
   pragma Import (CPP, dmaf_continue, "_ZL13dmaf_continue14dma_ctrl_flags");

   function dmaf_p_disabled_continue (flags : dma_ctrl_flags) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:848
   pragma Import (CPP, dmaf_p_disabled_continue, "_ZL24dmaf_p_disabled_continue14dma_ctrl_flags");

   function dma_dev_has_pq_continue (dma : access dma_device) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:855
   pragma Import (CPP, dma_dev_has_pq_continue, "_ZL23dma_dev_has_pq_continueP10dma_device");

   function dma_dev_to_maxpq (dma : access dma_device) return unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:860
   pragma Import (CPP, dma_dev_to_maxpq, "_ZL16dma_dev_to_maxpqP10dma_device");

  -- dma_maxpq - reduce maxpq in the face of continued operations
  -- * @dma - dma device with PQ capability
  -- * @flags - to check if DMA_PREP_CONTINUE and DMA_PREP_PQ_DISABLE_P are set
  -- *
  -- * When an engine does not support native continuation we need 3 extra
  -- * source slots to reuse P and Q with the following coefficients:
  -- * 1/ {00} * P : remove P from Q', but use it as a source for P'
  -- * 2/ {01} * Q : use Q to continue Q' calculation
  -- * 3/ {00} * Q : subtract Q from P' to cancel (2)
  -- *
  -- * In the case where P is disabled we only need 1 extra source:
  -- * 1/ {01} * Q : use Q to continue Q' calculation
  --  

   function dma_maxpq (dma : access dma_device; flags : dma_ctrl_flags) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:878
   pragma Import (CPP, dma_maxpq, "_ZL9dma_maxpqP10dma_device14dma_ctrl_flags");

  -- --- public DMA engine API ---  
   procedure dmaengine_get;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:892
   pragma Import (CPP, dmaengine_get, "_Z13dmaengine_getv");

   procedure dmaengine_put;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:893
   pragma Import (CPP, dmaengine_put, "_Z13dmaengine_putv");

   procedure net_dmaengine_get;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:907
   pragma Import (CPP, net_dmaengine_get, "_ZL17net_dmaengine_getv");

   procedure net_dmaengine_put;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:910
   pragma Import (CPP, net_dmaengine_put, "_ZL17net_dmaengine_putv");

   function dma_async_memcpy_buf_to_buf
     (chan : access dma_chan;
      dest : System.Address;
      src : System.Address;
      len : linux_types_h.size_t) return dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:937
   pragma Import (CPP, dma_async_memcpy_buf_to_buf, "_Z27dma_async_memcpy_buf_to_bufP8dma_chanPvS1_m");

   function dma_async_memcpy_buf_to_pg
     (chan : access dma_chan;
      the_page : access linux_mm_types_h.page;
      offset : unsigned;
      kdata : System.Address;
      len : linux_types_h.size_t) return dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:939
   pragma Import (CPP, dma_async_memcpy_buf_to_pg, "_Z26dma_async_memcpy_buf_to_pgP8dma_chanP4pagejPvm");

   function dma_async_memcpy_pg_to_pg
     (chan : access dma_chan;
      dest_pg : access linux_mm_types_h.page;
      dest_off : unsigned;
      src_pg : access linux_mm_types_h.page;
      src_off : unsigned;
      len : linux_types_h.size_t) return dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:941
   pragma Import (CPP, dma_async_memcpy_pg_to_pg, "_Z25dma_async_memcpy_pg_to_pgP8dma_chanP4pagejS2_jm");

   procedure dma_async_tx_descriptor_init (tx : access dma_async_tx_descriptor; chan : access dma_chan);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:944
   pragma Import (CPP, dma_async_tx_descriptor_init, "_Z28dma_async_tx_descriptor_initP23dma_async_tx_descriptorP8dma_chan");

   procedure async_tx_ack (tx : access dma_async_tx_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:947
   pragma Import (CPP, async_tx_ack, "_ZL12async_tx_ackP23dma_async_tx_descriptor");

   procedure async_tx_clear_ack (tx : access dma_async_tx_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:952
   pragma Import (CPP, async_tx_clear_ack, "_ZL18async_tx_clear_ackP23dma_async_tx_descriptor");

   function async_tx_test_ack (tx : access dma_async_tx_descriptor) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:957
   pragma Import (CPP, async_tx_test_ack, "_ZL17async_tx_test_ackP23dma_async_tx_descriptor");

   --  skipped func __dma_cap_set

   --  skipped func __dma_cap_clear

   --  skipped func __dma_cap_zero

   --  skipped func __dma_has_cap

  --*
  -- * dma_async_issue_pending - flush pending transactions to HW
  -- * @chan: target DMA channel
  -- *
  -- * This allows drivers to push copies to HW in batches,
  -- * reducing MMIO writes where possible.
  --  

   procedure dma_async_issue_pending (chan : access dma_chan);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:999
   pragma Import (CPP, dma_async_issue_pending, "_ZL23dma_async_issue_pendingP8dma_chan");

  --*
  -- * dma_async_is_tx_complete - poll for transaction completion
  -- * @chan: DMA channel
  -- * @cookie: transaction identifier to check status of
  -- * @last: returns last completed cookie, can be NULL
  -- * @used: returns last issued cookie, can be NULL
  -- *
  -- * If @last and @used are passed in, upon return they reflect the driver
  -- * internal state and can be used with dma_async_is_complete() to check
  -- * the status of multiple cookies without re-checking hardware state.
  --  

   function dma_async_is_tx_complete
     (chan : access dma_chan;
      cookie : dma_cookie_t;
      last : access dma_cookie_t;
      used : access dma_cookie_t) return dma_status;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1015
   pragma Import (CPP, dma_async_is_tx_complete, "_ZL24dma_async_is_tx_completeP8dma_chaniPiS1_");

  --*
  -- * dma_async_is_complete - test a cookie against chan state
  -- * @cookie: transaction identifier to test status of
  -- * @last_complete: last know completed transaction
  -- * @last_used: last cookie value handed out
  -- *
  -- * dma_async_is_complete() is used in dma_async_is_tx_complete()
  -- * the test logic is separated for lightweight testing of multiple cookies
  --  

   function dma_async_is_complete
     (cookie : dma_cookie_t;
      last_complete : dma_cookie_t;
      last_used : dma_cookie_t) return dma_status;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1038
   pragma Import (CPP, dma_async_is_complete, "_ZL21dma_async_is_completeiii");

   procedure dma_set_tx_state
     (st : access dma_tx_state;
      last : dma_cookie_t;
      used : dma_cookie_t;
      residue : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1052
   pragma Import (CPP, dma_set_tx_state, "_ZL16dma_set_tx_stateP12dma_tx_stateiij");

   function dma_find_channel (tx_type : dma_transaction_type) return access dma_chan;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1062
   pragma Import (CPP, dma_find_channel, "_Z16dma_find_channel20dma_transaction_type");

   function dma_sync_wait (chan : access dma_chan; cookie : dma_cookie_t) return dma_status;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1063
   pragma Import (CPP, dma_sync_wait, "_Z13dma_sync_waitP8dma_chani");

   function dma_wait_for_async_tx (tx : access dma_async_tx_descriptor) return dma_status;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1064
   pragma Import (CPP, dma_wait_for_async_tx, "_Z21dma_wait_for_async_txP23dma_async_tx_descriptor");

   procedure dma_issue_pending_all;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1065
   pragma Import (CPP, dma_issue_pending_all, "_Z21dma_issue_pending_allv");

   --  skipped func __dma_request_channel

   function dma_request_slave_channel_reason (dev : access linux_device_h.device; name : Interfaces.C.Strings.chars_ptr) return access dma_chan;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1068
   pragma Import (CPP, dma_request_slave_channel_reason, "_Z32dma_request_slave_channel_reasonP6devicePKc");

   function dma_request_slave_channel (dev : access linux_device_h.device; name : Interfaces.C.Strings.chars_ptr) return access dma_chan;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1070
   pragma Import (CPP, dma_request_slave_channel, "_Z25dma_request_slave_channelP6devicePKc");

   procedure dma_release_channel (chan : access dma_chan);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1071
   pragma Import (CPP, dma_release_channel, "_Z19dma_release_channelP8dma_chan");

  -- --- DMA device ---  
   function dma_async_device_register (device : access dma_device) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1110
   pragma Import (CPP, dma_async_device_register, "_Z25dma_async_device_registerP10dma_device");

   procedure dma_async_device_unregister (device : access dma_device);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1111
   pragma Import (CPP, dma_async_device_unregister, "_Z27dma_async_device_unregisterP10dma_device");

   procedure dma_run_dependencies (tx : access dma_async_tx_descriptor);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1112
   pragma Import (CPP, dma_run_dependencies, "_Z20dma_run_dependenciesP23dma_async_tx_descriptor");

   function dma_get_slave_channel (chan : access dma_chan) return access dma_chan;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1113
   pragma Import (CPP, dma_get_slave_channel, "_Z21dma_get_slave_channelP8dma_chan");

   function dma_get_any_slave_channel (device : access dma_device) return access dma_chan;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1114
   pragma Import (CPP, dma_get_any_slave_channel, "_Z25dma_get_any_slave_channelP10dma_device");

   function net_dma_find_channel return access dma_chan;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1115
   pragma Import (CPP, net_dma_find_channel, "_Z20net_dma_find_channelv");

   --  skipped func __dma_request_slave_channel_compat

  -- --- Helper iov-locking functions ---  
   type dma_page_list is record
      base_address : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1137
      nr_pages : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1138
      pages : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1139
   end record;
   pragma Convention (C_Pass_By_Copy, dma_page_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1136

   type dma_pinned_list_page_list_array is array (0 .. -1) of aliased dma_page_list;
   type dma_pinned_list is record
      nr_iovecs : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1143
      page_list : aliased dma_pinned_list_page_list_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1144
   end record;
   pragma Convention (C_Pass_By_Copy, dma_pinned_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1142

   function dma_pin_iovec_pages (iov : access uapi_linux_uio_h.iovec; len : linux_types_h.size_t) return access dma_pinned_list;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1147
   pragma Import (CPP, dma_pin_iovec_pages, "_Z19dma_pin_iovec_pagesP5iovecm");

   procedure dma_unpin_iovec_pages (pinned_list : access dma_pinned_list);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1148
   pragma Import (CPP, dma_unpin_iovec_pages, "_Z21dma_unpin_iovec_pagesP15dma_pinned_list");

   function dma_memcpy_to_iovec
     (chan : access dma_chan;
      iov : access uapi_linux_uio_h.iovec;
      pinned_list : access dma_pinned_list;
      kdata : access unsigned_char;
      len : linux_types_h.size_t) return dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1150
   pragma Import (CPP, dma_memcpy_to_iovec, "_Z19dma_memcpy_to_iovecP8dma_chanP5iovecP15dma_pinned_listPhm");

   function dma_memcpy_pg_to_iovec
     (chan : access dma_chan;
      iov : access uapi_linux_uio_h.iovec;
      pinned_list : access dma_pinned_list;
      the_page : access linux_mm_types_h.page;
      offset : unsigned;
      len : linux_types_h.size_t) return dma_cookie_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/dmaengine.h:1152
   pragma Import (CPP, dma_memcpy_pg_to_iovec, "_Z22dma_memcpy_pg_to_iovecP8dma_chanP5iovecP15dma_pinned_listP4pagejm");

end linux_dmaengine_h;

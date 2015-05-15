pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package linux_nodemask_h is

   --  arg-macro: procedure node_set __node_set((node), and(dst))
   --    __node_set((node), and(dst))
   --  arg-macro: procedure node_clear __node_clear((node), and(dst))
   --    __node_clear((node), and(dst))
   --  arg-macro: procedure nodes_setall __nodes_setall(and(dst), MAX_NUMNODES)
   --    __nodes_setall(and(dst), MAX_NUMNODES)
   --  arg-macro: procedure nodes_clear __nodes_clear(and(dst), MAX_NUMNODES)
   --    __nodes_clear(and(dst), MAX_NUMNODES)
   --  arg-macro: procedure node_isset test_bit((node), (nodemask).bits)
   --    test_bit((node), (nodemask).bits)
   --  arg-macro: procedure node_test_and_set __node_test_and_set((node), and(nodemask))
   --    __node_test_and_set((node), and(nodemask))
   --  arg-macro: procedure nodes_and __nodes_and(and(dst), and(src1), and(src2), MAX_NUMNODES)
   --    __nodes_and(and(dst), and(src1), and(src2), MAX_NUMNODES)
   --  arg-macro: procedure nodes_or __nodes_or(and(dst), and(src1), and(src2), MAX_NUMNODES)
   --    __nodes_or(and(dst), and(src1), and(src2), MAX_NUMNODES)
   --  arg-macro: procedure nodes_xor __nodes_xor(and(dst), and(src1), and(src2), MAX_NUMNODES)
   --    __nodes_xor(and(dst), and(src1), and(src2), MAX_NUMNODES)
   --  arg-macro: procedure nodes_andnot __nodes_andnot(and(dst), and(src1), and(src2), MAX_NUMNODES)
   --    __nodes_andnot(and(dst), and(src1), and(src2), MAX_NUMNODES)
   --  arg-macro: procedure nodes_complement __nodes_complement(and(dst), and(src), MAX_NUMNODES)
   --    __nodes_complement(and(dst), and(src), MAX_NUMNODES)
   --  arg-macro: procedure nodes_equal __nodes_equal(and(src1), and(src2), MAX_NUMNODES)
   --    __nodes_equal(and(src1), and(src2), MAX_NUMNODES)
   --  arg-macro: procedure nodes_intersects __nodes_intersects(and(src1), and(src2), MAX_NUMNODES)
   --    __nodes_intersects(and(src1), and(src2), MAX_NUMNODES)
   --  arg-macro: procedure nodes_subset __nodes_subset(and(src1), and(src2), MAX_NUMNODES)
   --    __nodes_subset(and(src1), and(src2), MAX_NUMNODES)
   --  arg-macro: procedure nodes_empty __nodes_empty(and(src), MAX_NUMNODES)
   --    __nodes_empty(and(src), MAX_NUMNODES)
   --  arg-macro: procedure nodes_full __nodes_full(and(nodemask), MAX_NUMNODES)
   --    __nodes_full(and(nodemask), MAX_NUMNODES)
   --  arg-macro: procedure nodes_weight __nodes_weight(and(nodemask), MAX_NUMNODES)
   --    __nodes_weight(and(nodemask), MAX_NUMNODES)
   --  arg-macro: procedure nodes_shift_right __nodes_shift_right(and(dst), and(src), (n), MAX_NUMNODES)
   --    __nodes_shift_right(and(dst), and(src), (n), MAX_NUMNODES)
   --  arg-macro: procedure nodes_shift_left __nodes_shift_left(and(dst), and(src), (n), MAX_NUMNODES)
   --    __nodes_shift_left(and(dst), and(src), (n), MAX_NUMNODES)
   --  arg-macro: procedure first_node __first_node(and(src))
   --    __first_node(and(src))
   --  arg-macro: procedure next_node __next_node((n), and(src))
   --    __next_node((n), and(src))
   --  arg-macro: function nodemask_of_node ({ typeof(_unused_nodemask_arg_) m; if (sizeof(m) = sizeof(unsigned long)) { m.bits(0) := 1UL << (node); } else { init_nodemask_of_node(andm, (node)); } m; }
   --    return { typeof(_unused_nodemask_arg_) m; if (sizeof(m) = sizeof(unsigned long)) { m.bits(0) := 1UL << (node); } else { init_nodemask_of_node(andm, (node)); } m; };
   --  arg-macro: procedure first_unset_node __first_unset_node(and(mask))
   --    __first_unset_node(and(mask))
   --  unsupported macro: NODE_MASK_LAST_WORD BITMAP_LAST_WORD_MASK(MAX_NUMNODES)
   --  unsupported macro: NODE_MASK_ALL ((nodemask_t) { { [BITS_TO_LONGS(MAX_NUMNODES)-1] = NODE_MASK_LAST_WORD } })
   --  unsupported macro: NODE_MASK_NONE ((nodemask_t) { { [0 ... BITS_TO_LONGS(MAX_NUMNODES)-1] = 0UL } })
   --  arg-macro: function nodes_addr ((src).bits
   --    return (src).bits;
   --  arg-macro: procedure nodemask_scnprintf __nodemask_scnprintf((buf), (len), and(src), MAX_NUMNODES)
   --    __nodemask_scnprintf((buf), (len), and(src), MAX_NUMNODES)
   --  arg-macro: procedure nodemask_parse_user __nodemask_parse_user((ubuf), (ulen), and(dst), MAX_NUMNODES)
   --    __nodemask_parse_user((ubuf), (ulen), and(dst), MAX_NUMNODES)
   --  arg-macro: procedure nodelist_scnprintf __nodelist_scnprintf((buf), (len), and(src), MAX_NUMNODES)
   --    __nodelist_scnprintf((buf), (len), and(src), MAX_NUMNODES)
   --  arg-macro: procedure nodelist_parse __nodelist_parse((buf), and(dst), MAX_NUMNODES)
   --    __nodelist_parse((buf), and(dst), MAX_NUMNODES)
   --  arg-macro: procedure node_remap __node_remap((oldbit), and(old), and(new), MAX_NUMNODES)
   --    __node_remap((oldbit), and(old), and(new), MAX_NUMNODES)
   --  arg-macro: procedure nodes_remap __nodes_remap(and(dst), and(src), and(old), and(new), MAX_NUMNODES)
   --    __nodes_remap(and(dst), and(src), and(old), and(new), MAX_NUMNODES)
   --  arg-macro: procedure nodes_onto __nodes_onto(and(dst), and(orig), and(relmap), MAX_NUMNODES)
   --    __nodes_onto(and(dst), and(orig), and(relmap), MAX_NUMNODES)
   --  arg-macro: procedure nodes_fold __nodes_fold(and(dst), and(orig), sz, MAX_NUMNODES)
   --    __nodes_fold(and(dst), and(orig), sz, MAX_NUMNODES)
   --  arg-macro: procedure for_each_node_mask for ((node) := first_node(mask); (node) < MAX_NUMNODES; (node) := next_node((node), (mask)))
   --    for ((node) := first_node(mask); (node) < MAX_NUMNODES; (node) := next_node((node), (mask)))
   --  arg-macro: procedure for_each_node_state for_each_node_mask((__node), node_states(__state))
   --    for_each_node_mask((__node), node_states(__state))
   --  unsupported macro: first_online_node first_node(node_states[N_ONLINE])
   --  arg-macro: procedure next_online_node next_node((nid), node_states(N_ONLINE))
   --    next_node((nid), node_states(N_ONLINE))
   --  unsupported macro: node_online_map node_states[N_ONLINE]
   --  unsupported macro: node_possible_map node_states[N_POSSIBLE]
   --  arg-macro: procedure num_online_nodes num_node_state(N_ONLINE)
   --    num_node_state(N_ONLINE)
   --  arg-macro: procedure num_possible_nodes num_node_state(N_POSSIBLE)
   --    num_node_state(N_POSSIBLE)
   --  arg-macro: procedure node_online node_state((node), N_ONLINE)
   --    node_state((node), N_ONLINE)
   --  arg-macro: procedure node_possible node_state((node), N_POSSIBLE)
   --    node_state((node), N_POSSIBLE)
   --  arg-macro: procedure for_each_node for_each_node_state(node, N_POSSIBLE)
   --    for_each_node_state(node, N_POSSIBLE)
   --  arg-macro: procedure for_each_online_node for_each_node_state(node, N_ONLINE)
   --    for_each_node_state(node, N_ONLINE)
   --  unsupported macro: NODEMASK_ALLOC(type,name,gfp_flags) type _ ##name, *name = &_ ##name
   --  arg-macro: procedure NODEMASK_FREE do {} while (0)
   --    do {} while (0)
   --  arg-macro: procedure NODEMASK_SCRATCH NODEMASK_ALLOC(struct nodemask_scratch, x, GFP_KERNEL or __GFP_NORETRY)
   --    NODEMASK_ALLOC(struct nodemask_scratch, x, GFP_KERNEL or __GFP_NORETRY)
   --  arg-macro: procedure NODEMASK_SCRATCH_FREE NODEMASK_FREE(x)
   --    NODEMASK_FREE(x)
  -- * Nodemasks provide a bitmap suitable for representing the
  -- * set of Node's in a system, one bit position per Node number.
  -- *
  -- * See detailed comments in the file linux/bitmap.h describing the
  -- * data type on which these nodemasks are based.
  -- *
  -- * For details of nodemask_scnprintf() and nodemask_parse_user(),
  -- * see bitmap_scnprintf() and bitmap_parse_user() in lib/bitmap.c.
  -- * For details of nodelist_scnprintf() and nodelist_parse(), see
  -- * bitmap_scnlistprintf() and bitmap_parselist(), also in bitmap.c.
  -- * For details of node_remap(), see bitmap_bitremap in lib/bitmap.c.
  -- * For details of nodes_remap(), see bitmap_remap in lib/bitmap.c.
  -- * For details of nodes_onto(), see bitmap_onto in lib/bitmap.c.
  -- * For details of nodes_fold(), see bitmap_fold in lib/bitmap.c.
  -- *
  -- * The available nodemask operations are:
  -- *
  -- * void node_set(node, mask)		turn on bit 'node' in mask
  -- * void node_clear(node, mask)		turn off bit 'node' in mask
  -- * void nodes_setall(mask)		set all bits
  -- * void nodes_clear(mask)		clear all bits
  -- * int node_isset(node, mask)		true iff bit 'node' set in mask
  -- * int node_test_and_set(node, mask)	test and set bit 'node' in mask
  -- *
  -- * void nodes_and(dst, src1, src2)	dst = src1 & src2  [intersection]
  -- * void nodes_or(dst, src1, src2)	dst = src1 | src2  [union]
  -- * void nodes_xor(dst, src1, src2)	dst = src1 ^ src2
  -- * void nodes_andnot(dst, src1, src2)	dst = src1 & ~src2
  -- * void nodes_complement(dst, src)	dst = ~src
  -- *
  -- * int nodes_equal(mask1, mask2)	Does mask1 == mask2?
  -- * int nodes_intersects(mask1, mask2)	Do mask1 and mask2 intersect?
  -- * int nodes_subset(mask1, mask2)	Is mask1 a subset of mask2?
  -- * int nodes_empty(mask)		Is mask empty (no bits sets)?
  -- * int nodes_full(mask)			Is mask full (all bits sets)?
  -- * int nodes_weight(mask)		Hamming weight - number of set bits
  -- *
  -- * void nodes_shift_right(dst, src, n)	Shift right
  -- * void nodes_shift_left(dst, src, n)	Shift left
  -- *
  -- * int first_node(mask)			Number lowest set bit, or MAX_NUMNODES
  -- * int next_node(node, mask)		Next node past 'node', or MAX_NUMNODES
  -- * int first_unset_node(mask)		First node not set in mask, or 
  -- *					MAX_NUMNODES.
  -- *
  -- * nodemask_t nodemask_of_node(node)	Return nodemask with bit 'node' set
  -- * NODE_MASK_ALL			Initializer - all bits set
  -- * NODE_MASK_NONE			Initializer - no bits set
  -- * unsigned long *nodes_addr(mask)	Array of unsigned long's in mask
  -- *
  -- * int nodemask_scnprintf(buf, len, mask) Format nodemask for printing
  -- * int nodemask_parse_user(ubuf, ulen, mask)	Parse ascii string as nodemask
  -- * int nodelist_scnprintf(buf, len, mask) Format nodemask as list for printing
  -- * int nodelist_parse(buf, map)		Parse ascii string as nodelist
  -- * int node_remap(oldbit, old, new)	newbit = map(old, new)(oldbit)
  -- * void nodes_remap(dst, src, old, new)	*dst = map(old, new)(src)
  -- * void nodes_onto(dst, orig, relmap)	*dst = orig relative to relmap
  -- * void nodes_fold(dst, orig, sz)	dst bits = orig bits mod sz
  -- *
  -- * for_each_node_mask(node, mask)	for-loop node over mask
  -- *
  -- * int num_online_nodes()		Number of online Nodes
  -- * int num_possible_nodes()		Number of all possible Nodes
  -- *
  -- * int node_random(mask)		Random node with set bit in mask
  -- *
  -- * int node_online(node)		Is some node online?
  -- * int node_possible(node)		Is some node possible?
  -- *
  -- * node_set_online(node)		set bit 'node' in node_online_map
  -- * node_set_offline(node)		clear bit 'node' in node_online_map
  -- *
  -- * for_each_node(node)			for-loop node over node_possible_map
  -- * for_each_online_node(node)		for-loop node over node_online_map
  -- *
  -- * Subtlety:
  -- * 1) The 'type-checked' form of node_isset() causes gcc (3.3.2, anyway)
  -- *    to generate slightly worse code.  So use a simple one-line #define
  -- *    for node_isset(), instead of wrapping an inline inside a macro, the
  -- *    way we do the other calls.
  -- *
  -- * NODEMASK_SCRATCH
  -- * When doing above logical AND, OR, XOR, Remap operations the callers tend to
  -- * need temporary nodemask_t's on the stack. But if NODES_SHIFT is large,
  -- * nodemask_t's consume too much stack space.  NODEMASK_SCRATCH is a helper
  -- * for such situations. See below and CPUMASK_ALLOC also.
  --  

   type nodemask_t_bits_array is array (0 .. 0) of aliased unsigned_long;
   type nodemask_t is record
      bits : aliased nodemask_t_bits_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:98
   end record;
   pragma Convention (C_Pass_By_Copy, nodemask_t);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:98

   --  skipped anonymous struct anon_44

  -- * The inline keyword gives the compiler room to decide to inline, or
  -- * not inline a function as it sees best.  However, as these functions
  -- * are called in both __init and non-__init functions, if they are not
  -- * inlined we will end up with a section mis-match error (of the type of
  -- * freeable items not being freed).  So we must use __always_inline here
  -- * to fix the problem.  If other functions in the future also end up in
  -- * this situation they will also need to be annotated as __always_inline
  --  

   --  skipped func __node_set

   --  skipped func __node_clear

   --  skipped func __nodes_setall

   --  skipped func __nodes_clear

  -- No static inline type checking - see Subtlety (1) above.  
   --  skipped func __node_test_and_set

   --  skipped func __nodes_and

   --  skipped func __nodes_or

   --  skipped func __nodes_xor

   --  skipped func __nodes_andnot

   --  skipped func __nodes_complement

   --  skipped func __nodes_equal

   --  skipped func __nodes_intersects

   --  skipped func __nodes_subset

   --  skipped func __nodes_empty

   --  skipped func __nodes_full

   --  skipped func __nodes_weight

   --  skipped func __nodes_shift_right

   --  skipped func __nodes_shift_left

  -- FIXME: better would be to fix all architectures to never return
  --          > MAX_NUMNODES, then the silly min_ts could be dropped.  

   --  skipped func __first_node

   --  skipped func __next_node

   procedure init_nodemask_of_node (mask : access nodemask_t; node : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:257
   pragma Import (CPP, init_nodemask_of_node, "_ZL21init_nodemask_of_nodeP10nodemask_ti");

   --  skipped func __first_unset_node

   --  skipped func __nodemask_scnprintf

   --  skipped func __nodemask_parse_user

   --  skipped func __nodelist_scnprintf

   --  skipped func __nodelist_parse

   --  skipped func __node_remap

   --  skipped func __nodes_remap

   --  skipped func __nodes_onto

   --  skipped func __nodes_fold

  -- * Bitmasks that are kept for all the nodes.
  --  

   subtype node_states is unsigned;
   N_POSSIBLE : constant node_states := 0;
   N_ONLINE : constant node_states := 1;
   N_NORMAL_MEMORY : constant node_states := 2;
   N_HIGH_MEMORY : constant node_states := 2;
   N_MEMORY : constant node_states := 2;
   N_CPU : constant node_states := 3;
   NR_NODE_STATES : constant node_states := 4;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:383

  -- The node could become online at some point  
  -- The node is online  
  -- The node has regular memory  
  -- The node has regular or high memory  
  -- The node has memory(regular, high, movable)  
  -- The node has one or more cpus  
  -- * The following particular system nodemasks and operations
  -- * on them manage all possible and online nodes.
  --  

   node_states : aliased array (0 .. 3) of aliased nodemask_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:406
   pragma Import (C, node_states, "node_states");

   function node_state (node : int; state : node_states) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:409
   pragma Import (CPP, node_state, "_ZL10node_statei11node_states");

   procedure node_set_state (node : int; state : node_states);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:414
   pragma Import (CPP, node_set_state, "_ZL14node_set_statei11node_states");

   procedure node_clear_state (node : int; state : node_states);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:419
   pragma Import (CPP, node_clear_state, "_ZL16node_clear_statei11node_states");

   function num_node_state (state : node_states) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:424
   pragma Import (CPP, num_node_state, "_ZL14num_node_state11node_states");

   nr_node_ids : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:435
   pragma Import (C, nr_node_ids, "nr_node_ids");

   nr_online_nodes : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:436
   pragma Import (C, nr_online_nodes, "nr_online_nodes");

   procedure node_set_online (nid : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:438
   pragma Import (CPP, node_set_online, "_ZL15node_set_onlinei");

   procedure node_set_offline (nid : int);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:444
   pragma Import (CPP, node_set_offline, "_ZL16node_set_offlinei");

   function node_random (maskp : access constant nodemask_t) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:484
   pragma Import (CPP, node_random, "_Z11node_randomPK10nodemask_t");

  -- * For nodemask scrach area.
  -- * NODEMASK_ALLOC(type, name) allocates an object with a specified type and
  -- * name.
  --  

  -- A example struture for using NODEMASK_ALLOC, used in mempolicy.  
   type nodemask_scratch is record
      mask1 : aliased nodemask_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:519
      mask2 : aliased nodemask_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:520
   end record;
   pragma Convention (C_Pass_By_Copy, nodemask_scratch);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/nodemask.h:518

end linux_nodemask_h;

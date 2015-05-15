pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with linux_types_h;

package linux_textsearch_h is

   --  unsupported macro: TS_AUTOLOAD 1
   --  unsupported macro: TS_IGNORECASE 2
   --  unsupported macro: TS_PRIV_ALIGNTO 8
   --  arg-macro: function TS_PRIV_ALIGN (((len) + TS_PRIV_ALIGNTO-1) and ~(TS_PRIV_ALIGNTO-1)
   --    return ((len) + TS_PRIV_ALIGNTO-1) and ~(TS_PRIV_ALIGNTO-1);
  --*
  -- * struct ts_state - search state
  -- * @offset: offset for next match
  -- * @cb: control buffer, for persistent variables of get_next_block()
  --  

   subtype ts_state_cb_array is Interfaces.C.char_array (0 .. 39);
   type ts_state is record
      offset : aliased unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:24
      cb : aliased ts_state_cb_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:25
   end record;
   pragma Convention (C_Pass_By_Copy, ts_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:22

  --*
  -- * struct ts_ops - search module operations
  -- * @name: name of search algorithm
  -- * @init: initialization function to prepare a search
  -- * @find: find the next occurrence of the pattern
  -- * @destroy: destroy algorithm specific parts of a search configuration
  -- * @get_pattern: return head of pattern
  -- * @get_pattern_len: return length of pattern
  -- * @owner: module reference to algorithm
  --  

   type ts_config;
   type ts_ops is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:40
      init : access function
           (arg1 : System.Address;
            arg2 : unsigned;
            arg3 : linux_types_h.gfp_t;
            arg4 : int) return access ts_config;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:41
      find : access function (arg1 : access ts_config; arg2 : access ts_state) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:43
      destroy : access procedure (arg1 : access ts_config);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:44
      get_pattern : access function (arg1 : access ts_config) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:45
      get_pattern_len : access function (arg1 : access ts_config) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:46
      owner : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:47
      list : aliased linux_types_h.list_head;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:48
   end record;
   pragma Convention (C_Pass_By_Copy, ts_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:38

  --*
  -- * struct ts_config - search configuration
  -- * @ops: operations of chosen algorithm
  -- * @flags: flags
  -- * @get_next_block: callback to fetch the next block to search in
  -- * @finish: callback to finalize a search
  --  

   type ts_config is record
      ops : access ts_ops;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:60
      flags : aliased int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:61
      get_next_block : access function
           (arg1 : unsigned;
            arg2 : System.Address;
            arg3 : access ts_config;
            arg4 : access ts_state) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:78
      finish : access procedure (arg1 : access ts_config; arg2 : access ts_state);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:89
   end record;
   pragma Convention (C_Pass_By_Copy, ts_config);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:58

  --*
  --	 * get_next_block - fetch next block of data
  --	 * @consumed: number of bytes consumed by the caller
  --	 * @dst: destination buffer
  --	 * @conf: search configuration
  --	 * @state: search state
  --	 *
  --	 * Called repeatedly until 0 is returned. Must assign the
  --	 * head of the next block of data to &*dst and return the length
  --	 * of the block or 0 if at the end. consumed == 0 indicates
  --	 * a new search. May store/read persistent values in state->cb.
  --	  

  --*
  --	 * finish - finalize/clean a series of get_next_block() calls
  --	 * @conf: search configuration
  --	 * @state: search state
  --	 *
  --	 * Called after the last use of get_next_block(), may be used
  --	 * to cleanup any leftovers.
  --	  

  --*
  -- * textsearch_next - continue searching for a pattern
  -- * @conf: search configuration
  -- * @state: search state
  -- *
  -- * Continues a search looking for more occurrences of the pattern.
  -- * textsearch_find() must be called to find the first occurrence
  -- * in order to reset the state.
  -- *
  -- * Returns the position of the next occurrence of the pattern or
  -- * UINT_MAX if not match was found.
  --  

   function textsearch_next (conf : access ts_config; state : access ts_state) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:104
   pragma Import (CPP, textsearch_next, "_ZL15textsearch_nextP9ts_configP8ts_state");

  --*
  -- * textsearch_find - start searching for a pattern
  -- * @conf: search configuration
  -- * @state: search state
  -- *
  -- * Returns the position of first occurrence of the pattern or
  -- * UINT_MAX if no match was found.
  --  

   function textsearch_find (conf : access ts_config; state : access ts_state) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:123
   pragma Import (CPP, textsearch_find, "_ZL15textsearch_findP9ts_configP8ts_state");

  --*
  -- * textsearch_get_pattern - return head of the pattern
  -- * @conf: search configuration
  --  

   function textsearch_get_pattern (conf : access ts_config) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:134
   pragma Import (CPP, textsearch_get_pattern, "_ZL22textsearch_get_patternP9ts_config");

  --*
  -- * textsearch_get_pattern_len - return length of the pattern
  -- * @conf: search configuration
  --  

   function textsearch_get_pattern_len (conf : access ts_config) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:143
   pragma Import (CPP, textsearch_get_pattern_len, "_ZL26textsearch_get_pattern_lenP9ts_config");

   function textsearch_register (arg1 : access ts_ops) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:148
   pragma Import (CPP, textsearch_register, "_Z19textsearch_registerP6ts_ops");

   function textsearch_unregister (arg1 : access ts_ops) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:149
   pragma Import (CPP, textsearch_unregister, "_Z21textsearch_unregisterP6ts_ops");

   function textsearch_prepare
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : unsigned;
      arg4 : linux_types_h.gfp_t;
      arg5 : int) return access ts_config;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:150
   pragma Import (CPP, textsearch_prepare, "_Z18textsearch_preparePKcPKvjji");

   procedure textsearch_destroy (conf : access ts_config);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:152
   pragma Import (CPP, textsearch_destroy, "_Z18textsearch_destroyP9ts_config");

   function textsearch_find_continuous
     (arg1 : access ts_config;
      arg2 : access ts_state;
      arg3 : System.Address;
      arg4 : unsigned) return unsigned;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:153
   pragma Import (CPP, textsearch_find_continuous, "_Z26textsearch_find_continuousP9ts_configP8ts_statePKvj");

   function alloc_ts_config (payload : linux_types_h.size_t; gfp_mask : linux_types_h.gfp_t) return access ts_config;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:161
   pragma Import (CPP, alloc_ts_config, "_ZL15alloc_ts_configmj");

   function ts_config_priv (conf : access ts_config) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/textsearch.h:173
   pragma Import (CPP, ts_config_priv, "_ZL14ts_config_privP9ts_config");

end linux_textsearch_h;

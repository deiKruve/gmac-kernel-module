pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Extensions;

package linux_assoc_array_h is

   --  unsupported macro: ASSOC_ARRAY_KEY_CHUNK_SIZE BITS_PER_LONG
  -- Generic associative array implementation.
  -- *
  -- * See Documentation/assoc_array.txt for information.
  -- *
  -- * Copyright (C) 2013 Red Hat, Inc. All Rights Reserved.
  -- * Written by David Howells (dhowells@redhat.com)
  -- *
  -- * This program is free software; you can redistribute it and/or
  -- * modify it under the terms of the GNU General Public Licence
  -- * as published by the Free Software Foundation; either version
  -- * 2 of the Licence, or (at your option) any later version.
  --  

  -- * Generic associative array.
  --  

  -- The node at the root of the tree  
   type assoc_array is record
      root : System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:27
      nr_leaves_on_tree : aliased unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, assoc_array);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:26

   --  skipped empty struct assoc_array_ptr

  -- * Operations on objects and index keys for use by array manipulation routines.
  --  

  -- Method to get a chunk of an index key from caller-supplied data  
   type assoc_array_ops is record
      get_key_chunk : access function (arg1 : System.Address; arg2 : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:36
      get_object_key_chunk : access function (arg1 : System.Address; arg2 : int) return unsigned_long;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:39
      compare_object : access function (arg1 : System.Address; arg2 : System.Address) return Extensions.bool;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:42
      diff_objects : access function (arg1 : System.Address; arg2 : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:47
      free_object : access procedure (arg1 : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:50
   end record;
   pragma Convention (C_Pass_By_Copy, assoc_array_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:34

  -- Method to get a piece of an object's index key  
  -- Is this the object we're looking for?  
  -- How different is an object from an index key, to a bit position in
  --	 * their keys? (or -1 if they're the same)
  --	  

  -- Method to free an object.  
  -- * Access and manipulation functions.
  --  

   --  skipped empty struct assoc_array_edit

   procedure assoc_array_init (c_array : access assoc_array);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:58
   pragma Import (CPP, assoc_array_init, "_ZL16assoc_array_initP11assoc_array");

   function assoc_array_iterate
     (c_array : access constant assoc_array;
      iterator : access function (arg1 : System.Address; arg2 : System.Address) return int;
      iterator_data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:64
   pragma Import (CPP, assoc_array_iterate, "_Z19assoc_array_iteratePK11assoc_arrayPFiPKvPvES4_");

   function assoc_array_find
     (c_array : access constant assoc_array;
      ops : access constant assoc_array_ops;
      index_key : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:68
   pragma Import (CPP, assoc_array_find, "_Z16assoc_array_findPK11assoc_arrayPK15assoc_array_opsPKv");

   procedure assoc_array_destroy (c_array : access assoc_array; ops : access constant assoc_array_ops);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:71
   pragma Import (CPP, assoc_array_destroy, "_Z19assoc_array_destroyP11assoc_arrayPK15assoc_array_ops");

   function assoc_array_insert
     (c_array : access assoc_array;
      ops : access constant assoc_array_ops;
      index_key : System.Address;
      object : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:73
   pragma Import (CPP, assoc_array_insert, "_Z18assoc_array_insertP11assoc_arrayPK15assoc_array_opsPKvPv");

   procedure assoc_array_insert_set_object (edit : System.Address; object : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:77
   pragma Import (CPP, assoc_array_insert_set_object, "_Z29assoc_array_insert_set_objectP16assoc_array_editPv");

   function assoc_array_delete
     (c_array : access assoc_array;
      ops : access constant assoc_array_ops;
      index_key : System.Address) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:79
   pragma Import (CPP, assoc_array_delete, "_Z18assoc_array_deleteP11assoc_arrayPK15assoc_array_opsPKv");

   function assoc_array_clear (c_array : access assoc_array; ops : access constant assoc_array_ops) return System.Address;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:82
   pragma Import (CPP, assoc_array_clear, "_Z17assoc_array_clearP11assoc_arrayPK15assoc_array_ops");

   procedure assoc_array_apply_edit (edit : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:84
   pragma Import (CPP, assoc_array_apply_edit, "_Z22assoc_array_apply_editP16assoc_array_edit");

   procedure assoc_array_cancel_edit (edit : System.Address);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:85
   pragma Import (CPP, assoc_array_cancel_edit, "_Z23assoc_array_cancel_editP16assoc_array_edit");

   function assoc_array_gc
     (c_array : access assoc_array;
      ops : access constant assoc_array_ops;
      iterator : access function (arg1 : System.Address; arg2 : System.Address) return Extensions.bool;
      iterator_data : System.Address) return int;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/assoc_array.h:86
   pragma Import (CPP, assoc_array_gc, "_Z14assoc_array_gcP11assoc_arrayPK15assoc_array_opsPFbPvS4_ES4_");

end linux_assoc_array_h;

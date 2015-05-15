pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uapi_linux_personality_h is

   --  unsupported macro: PER_CLEAR_ON_SETID (READ_IMPLIES_EXEC | ADDR_NO_RANDOMIZE | ADDR_COMPAT_LAYOUT | MMAP_PAGE_ZERO)
  -- * Flags for bug emulation.
  -- *
  -- * These occupy the top three bytes.
  --  

  -- disable randomization of VA space  
  -- userspace function ptrs point to descriptors
  --						 * (signal handling)
  --						  

  -- * Security-relevant compatibility flags that must be
  -- * cleared upon setuid or setgid exec:
  --  

  -- * Personality types.
  -- *
  -- * These go in the low byte.  Avoid using the top bit, it will
  -- * conflict with error returns.
  --  

  -- IRIX5 32-bit  
  -- IRIX6 new 32-bit  
  -- IRIX6 64-bit  
  -- OSF/1 v4  
end uapi_linux_personality_h;

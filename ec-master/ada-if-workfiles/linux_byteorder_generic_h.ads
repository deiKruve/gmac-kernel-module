pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_types_h;
with asm_generic_int_ll64_h;

package linux_byteorder_generic_h is

   --  unsupported macro: cpu_to_le64 __cpu_to_le64
   --  unsupported macro: le64_to_cpu __le64_to_cpu
   --  unsupported macro: cpu_to_le32 __cpu_to_le32
   --  unsupported macro: le32_to_cpu __le32_to_cpu
   --  unsupported macro: cpu_to_le16 __cpu_to_le16
   --  unsupported macro: le16_to_cpu __le16_to_cpu
   --  unsupported macro: cpu_to_be64 __cpu_to_be64
   --  unsupported macro: be64_to_cpu __be64_to_cpu
   --  unsupported macro: cpu_to_be32 __cpu_to_be32
   --  unsupported macro: be32_to_cpu __be32_to_cpu
   --  unsupported macro: cpu_to_be16 __cpu_to_be16
   --  unsupported macro: be16_to_cpu __be16_to_cpu
   --  unsupported macro: cpu_to_le64p __cpu_to_le64p
   --  unsupported macro: le64_to_cpup __le64_to_cpup
   --  unsupported macro: cpu_to_le32p __cpu_to_le32p
   --  unsupported macro: le32_to_cpup __le32_to_cpup
   --  unsupported macro: cpu_to_le16p __cpu_to_le16p
   --  unsupported macro: le16_to_cpup __le16_to_cpup
   --  unsupported macro: cpu_to_be64p __cpu_to_be64p
   --  unsupported macro: be64_to_cpup __be64_to_cpup
   --  unsupported macro: cpu_to_be32p __cpu_to_be32p
   --  unsupported macro: be32_to_cpup __be32_to_cpup
   --  unsupported macro: cpu_to_be16p __cpu_to_be16p
   --  unsupported macro: be16_to_cpup __be16_to_cpup
   --  unsupported macro: cpu_to_le64s __cpu_to_le64s
   --  unsupported macro: le64_to_cpus __le64_to_cpus
   --  unsupported macro: cpu_to_le32s __cpu_to_le32s
   --  unsupported macro: le32_to_cpus __le32_to_cpus
   --  unsupported macro: cpu_to_le16s __cpu_to_le16s
   --  unsupported macro: le16_to_cpus __le16_to_cpus
   --  unsupported macro: cpu_to_be64s __cpu_to_be64s
   --  unsupported macro: be64_to_cpus __be64_to_cpus
   --  unsupported macro: cpu_to_be32s __cpu_to_be32s
   --  unsupported macro: be32_to_cpus __be32_to_cpus
   --  unsupported macro: cpu_to_be16s __cpu_to_be16s
   --  unsupported macro: be16_to_cpus __be16_to_cpus
   --  arg-macro: procedure htonl ___htonl(x)
   --    ___htonl(x)
   --  arg-macro: procedure ntohl ___ntohl(x)
   --    ___ntohl(x)
   --  arg-macro: procedure htons ___htons(x)
   --    ___htons(x)
   --  arg-macro: procedure ntohs ___ntohs(x)
   --    ___ntohs(x)
  -- * linux/byteorder_generic.h
  -- * Generic Byte-reordering support
  -- *
  -- * The "... p" macros, like le64_to_cpup, can be used with pointers
  -- * to unaligned data, but there will be a performance penalty on 
  -- * some architectures.  Use get_unaligned for unaligned data.
  -- *
  -- * Francois-Rene Rideau <fare@tunes.org> 19970707
  -- *    gathered all the good ideas from all asm-foo/byteorder.h into one file,
  -- *    cleaned them up.
  -- *    I hope it is compliant with non-GCC compilers.
  -- *    I decided to put __BYTEORDER_HAS_U64__ in byteorder.h,
  -- *    because I wasn't sure it would be ok to put it in types.h
  -- *    Upgraded it to 2.1.43
  -- * Francois-Rene Rideau <fare@tunes.org> 19971012
  -- *    Upgraded it to 2.1.57
  -- *    to please Linus T., replaced huge #ifdef's between little/big endian
  -- *    by nestedly #include'd files.
  -- * Francois-Rene Rideau <fare@tunes.org> 19971205
  -- *    Made it to 2.1.71; now a facelift:
  -- *    Put files under include/linux/byteorder/
  -- *    Split swab from generic support.
  -- *
  -- * TODO:
  -- *   = Regular kernel maintainers could also replace all these manual
  -- *    byteswap macros that remain, disseminated among drivers,
  -- *    after some grep or the sources...
  -- *   = Linus might want to rename all these macros and files to fit his taste,
  -- *    to fit his personal naming scheme.
  -- *   = it seems that a few drivers would also appreciate
  -- *    nybble swapping support...
  -- *   = every architecture could add their byteswap macro in asm/byteorder.h
  -- *    see how some architectures already do (i386, alpha, ppc, etc)
  -- *   = cpu_to_beXX and beXX_to_cpu might some day need to be well
  -- *    distinguished throughout the kernel. This is not the case currently,
  -- *    since little endian, big endian, and pdp endian machines needn't it.
  -- *    But this might be the case for, say, a port of Linux to 20/21 bit
  -- *    architectures (and F21 Linux addict around?).
  --  

  -- * The following macros are to be defined by <asm/byteorder.h>:
  -- *
  -- * Conversion of long and short int between network and host format
  -- *	ntohl(__u32 x)
  -- *	ntohs(__u16 x)
  -- *	htonl(__u32 x)
  -- *	htons(__u16 x)
  -- * It seems that some programs (which? where? or perhaps a standard? POSIX?)
  -- * might like the above to be functions, not macros (why?).
  -- * if that's true, then detect them, and take measures.
  -- * Anyway, the measure is: define only ___ntohl as a macro instead,
  -- * and in a separate file, have
  -- * unsigned long inline ntohl(x){return ___ntohl(x);}
  -- *
  -- * The same for constant arguments
  -- *	__constant_ntohl(__u32 x)
  -- *	__constant_ntohs(__u16 x)
  -- *	__constant_htonl(__u32 x)
  -- *	__constant_htons(__u16 x)
  -- *
  -- * Conversion of XX-bit integers (16- 32- or 64-)
  -- * between native CPU format and little/big endian format
  -- * 64-bit stuff only defined for proper architectures
  -- *	cpu_to_[bl]eXX(__uXX x)
  -- *	[bl]eXX_to_cpu(__uXX x)
  -- *
  -- * The same, but takes a pointer to the value to convert
  -- *	cpu_to_[bl]eXXp(__uXX x)
  -- *	[bl]eXX_to_cpup(__uXX x)
  -- *
  -- * The same, but change in situ
  -- *	cpu_to_[bl]eXXs(__uXX x)
  -- *	[bl]eXX_to_cpus(__uXX x)
  -- *
  -- * See asm-foo/byteorder.h for examples of how to provide
  -- * architecture-optimized versions
  -- *
  --  

  -- * They have to be macros in order to do the constant folding
  -- * correctly - if the argument passed into a inline function
  -- * it is no longer constant according to gcc..
  --  

   procedure le16_add_cpu (var : access uapi_linux_types_h.uu_le16; val : asm_generic_int_ll64_h.u16);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/byteorder/generic.h:143
   pragma Import (CPP, le16_add_cpu, "_ZL12le16_add_cpuPtt");

   procedure le32_add_cpu (var : access uapi_linux_types_h.uu_le32; val : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/byteorder/generic.h:148
   pragma Import (CPP, le32_add_cpu, "_ZL12le32_add_cpuPjj");

   procedure le64_add_cpu (var : access uapi_linux_types_h.uu_le64; val : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/byteorder/generic.h:153
   pragma Import (CPP, le64_add_cpu, "_ZL12le64_add_cpuPyy");

   procedure be16_add_cpu (var : access uapi_linux_types_h.uu_be16; val : asm_generic_int_ll64_h.u16);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/byteorder/generic.h:158
   pragma Import (CPP, be16_add_cpu, "_ZL12be16_add_cpuPtt");

   procedure be32_add_cpu (var : access uapi_linux_types_h.uu_be32; val : asm_generic_int_ll64_h.u32);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/byteorder/generic.h:163
   pragma Import (CPP, be32_add_cpu, "_ZL12be32_add_cpuPjj");

   procedure be64_add_cpu (var : access uapi_linux_types_h.uu_be64; val : asm_generic_int_ll64_h.u64);  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/byteorder/generic.h:168
   pragma Import (CPP, be64_add_cpu, "_ZL12be64_add_cpuPyy");

end linux_byteorder_generic_h;

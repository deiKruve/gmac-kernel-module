pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uapi_linux_socket_h is

  -- * Desired design of maximum size and alignment (see RFC2553)
  --  

  -- Implementation specific desired alignment  
   subtype uu_kernel_sa_family_t is unsigned_short;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/socket.h:11

  -- address family  
   subtype uu_kernel_sockaddr_storage_uu_data_array is Interfaces.C.char_array (0 .. 125);
   type uu_kernel_sockaddr_storage is record
      ss_family : aliased uu_kernel_sa_family_t;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/socket.h:14
      uu_data : aliased uu_kernel_sockaddr_storage_uu_data_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/socket.h:16
   end record;
   pragma Convention (C_Pass_By_Copy, uu_kernel_sockaddr_storage);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/linux/socket.h:13

  -- Following field(s) are implementation specific  
  -- space to achieve desired size,  
  -- _SS_MAXSIZE value minus size of ss_family  
  -- force desired alignment  
end uapi_linux_socket_h;

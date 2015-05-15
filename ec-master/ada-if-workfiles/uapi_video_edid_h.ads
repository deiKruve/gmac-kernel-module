pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package uapi_video_edid_h is

   type edid_info_dummy_array is array (0 .. 127) of aliased unsigned_char;
   type edid_info is record
      dummy : aliased edid_info_dummy_array;  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/video/edid.h:5
   end record;
   pragma Convention (C_Pass_By_Copy, edid_info);  -- /usr/src/linux-headers-3.16.0-4-common/include/uapi/video/edid.h:4

end uapi_video_edid_h;

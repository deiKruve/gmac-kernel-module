pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_video_edid_h;

package video_edid_h is

   edid_info : aliased uapi_video_edid_h.edid_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/video/edid.h:7
   pragma Import (C, edid_info, "edid_info");

end video_edid_h;

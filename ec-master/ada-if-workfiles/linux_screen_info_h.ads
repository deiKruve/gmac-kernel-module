pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with uapi_linux_screen_info_h;

package linux_screen_info_h is

   --  unsupported macro: ORIG_X (screen_info.orig_x)
   --  unsupported macro: ORIG_Y (screen_info.orig_y)
   --  unsupported macro: ORIG_VIDEO_MODE (screen_info.orig_video_mode)
   --  unsupported macro: ORIG_VIDEO_COLS (screen_info.orig_video_cols)
   --  unsupported macro: ORIG_VIDEO_EGA_BX (screen_info.orig_video_ega_bx)
   --  unsupported macro: ORIG_VIDEO_LINES (screen_info.orig_video_lines)
   --  unsupported macro: ORIG_VIDEO_ISVGA (screen_info.orig_video_isVGA)
   --  unsupported macro: ORIG_VIDEO_POINTS (screen_info.orig_video_points)
   screen_info : aliased uapi_linux_screen_info_h.screen_info;  -- /usr/src/linux-headers-3.16.0-4-common/include/linux/screen_info.h:6
   pragma Import (C, screen_info, "screen_info");

end linux_screen_info_h;

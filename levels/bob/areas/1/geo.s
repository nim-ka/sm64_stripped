glabel bob_geo_000488 # 0x0E000488
   geo_node_screen_area 10, 160, 120, 160, 120
   geo_open_node
      geo_zbuffer 0
      geo_open_node
         geo_todo_09 100
         geo_open_node
            geo_background BACKGROUND_OCEAN_SKY, geo_skybox_main
         geo_close_node
      geo_close_node
      geo_zbuffer 1
      geo_open_node
         geo_camera_frustum 45, 100, 30000, Geo0A_8029AA3C
         geo_open_node
            geo_todo_0F 1, 0, 2000, 6000, 3072, 0, -4608, Geo0F_80287D30
            geo_open_node
               geo_display_list LAYER_OPAQUE, bob_seg7_dl_07004390
               geo_display_list LAYER_OPAQUE, bob_seg7_dl_07009D80
               geo_display_list LAYER_TRANSPARENT_DECAL, bob_seg7_dl_0700A470
               geo_display_list LAYER_ALPHA, bob_seg7_dl_0700A920
               geo_display_list LAYER_OPAQUE, bob_seg7_dl_0700DD18
               geo_display_list LAYER_OPAQUE, bob_seg7_dl_0700E338
               geo_render_obj
               geo_asm 0, geo_exec_level
            geo_close_node
         geo_close_node
      geo_close_node
      geo_zbuffer 0
      geo_open_node
         geo_asm 0, Geo18_802CD1E8
      geo_close_node
   geo_close_node
   geo_end
glabel red_flame_shadow_geo # 0x16000B10
   geo_shadow SHADOW_CIRCLE_UNK1, 0x50, 20
   geo_open_node
      geo_branch_and_link red_flame_geo
   geo_close_node
   geo_end

glabel red_flame_geo # 0x16000B2C
   geo_node_start
   geo_open_node
      geo_switch_case 8, GeoSwitchCase8029DB48
      geo_open_node
         geo_display_list 0x05, flame_seg3_dl_0301B3B0
         geo_display_list 0x05, flame_seg3_dl_0301B3C8
         geo_display_list 0x05, flame_seg3_dl_0301B3E0
         geo_display_list 0x05, flame_seg3_dl_0301B3F8
         geo_display_list 0x05, flame_seg3_dl_0301B410
         geo_display_list 0x05, flame_seg3_dl_0301B428
         geo_display_list 0x05, flame_seg3_dl_0301B440
         geo_display_list 0x05, flame_seg3_dl_0301B458
      geo_close_node
   geo_close_node
   geo_end

glabel blue_flame_geo # 0x16000B8C
   geo_node_start
   geo_open_node
      geo_switch_case 8, GeoSwitchCase8029DB48
      geo_open_node
         geo_display_list 0x05, flame_seg3_dl_0301B500
         geo_display_list 0x05, flame_seg3_dl_0301B518
         geo_display_list 0x05, flame_seg3_dl_0301B530
         geo_display_list 0x05, flame_seg3_dl_0301B548
         geo_display_list 0x05, flame_seg3_dl_0301B560
         geo_display_list 0x05, flame_seg3_dl_0301B578
         geo_display_list 0x05, flame_seg3_dl_0301B590
         geo_display_list 0x05, flame_seg3_dl_0301B5A8
      geo_close_node
   geo_close_node
   geo_end
.include "macros.inc"
.include "geo_commands.inc"

.section .geo, "a"

glabel boo_X_geo_000000 # 0x0C000000
   geo_shadow SHADOW_CIRCLE_UNK1, 0x96, 100
      geo_open_node
         geo_scale 0x00, 16384
         geo_open_node
            geo_dl_translated 0x01, 0, 0, 0
            geo_open_node
               geo_dl_translated 0x01, 0, 0, 0
               geo_open_node
                  geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_05001F98
                  geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_05001B20
                  geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_05002140
               geo_close_node
            geo_close_node
            geo_dl_translated 0x01, 0, 0, 0
            geo_open_node
               geo_dl_translated 0x01, 0, 0, 0
               geo_open_node
                  geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_05001D68
                  geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_05001978
                  geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_050022E0
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
geo_end

glabel boo_X_geo_0000C0 # 0x0C0000C0
   geo_start_distance 300
      geo_open_node
         geo_display_list 0x01, boo_X_seg5_dl_05002FB0
      geo_close_node
   geo_end

glabel boo_X_geo_0000D8 # 0x0C0000D8
   geo_shadow SHADOW_CIRCLE_UNK1, 0x96, 100
      geo_open_node
         geo_scale 0x00, 16384
         geo_open_node
            geo_dl_translated 0x01, 0, 0, 0
            geo_open_node
               geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_05005190
               geo_open_node
                  geo_dl_translated 0x01, -7, -9, 0
                  geo_open_node
                     geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_05005680
                  geo_close_node
                  geo_dl_translated 0x01, 156, -9, 0
                  geo_open_node
                     geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_05005408
                  geo_close_node
                  geo_dl_translated 0x01, -3, 17, 0
                  geo_open_node
                     geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_05004EE8
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
geo_end

glabel boo_X_geo_000188 # 0x0C000188
   geo_shadow SHADOW_CIRCLE_UNK1, 0x96, 80
      geo_open_node
         geo_scale 0x00, 16384
         geo_open_node
            geo_display_list 0x01, boo_X_seg5_dl_05006A68
         geo_close_node
      geo_close_node
   geo_end

glabel boo_X_geo_0001B4 # 0x0C0001B4
   geo_shadow SHADOW_CIRCLE_UNK1, 0x96, 100
      geo_open_node
         geo_scale 0x00, 16384
         geo_open_node
            geo_dl_translated 0x01, 0, 0, 0
            geo_open_node
               geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_050098E8
               geo_open_node
                  geo_dl_translated 0x01, -141, -546, 218
                  geo_open_node
                     geo_dl_translated 0x01, 0, 0, 0, boo_X_seg5_dl_05008CB0
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
geo_end

glabel boo_X_geo_000224 # 0x0C000224
   geo_shadow SHADOW_CIRCLE_UNK1, 0x96, 70
      geo_open_node
         geo_scale 0x00, 26214
         geo_open_node
            geo_asm 0, Geo18_8029D924
            geo_switch_case 2, GeoSwitchCase8029DB48
            geo_open_node
               geo_display_list 0x01, boo_X_seg5_dl_0500C1B0
               geo_display_list 0x05, boo_X_seg5_dl_0500C1B0
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
geo_end

glabel boo_X_geo_000274 # 0x0C000274
   geo_start_distance 300
      geo_open_node
         geo_shadow SHADOW_CIRCLE_UNK0, 0x96, 100
            geo_open_node
               geo_display_list 0x01, boo_X_seg5_dl_0500F7D8
               geo_display_list 0x01, boo_X_seg5_dl_0500FC28
               geo_display_list 0x04, boo_X_seg5_dl_05010100
            geo_close_node
         geo_close_node
      geo_end

.word 0x0
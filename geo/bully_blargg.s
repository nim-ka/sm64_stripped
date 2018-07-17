.include "macros.inc"
.include "geo_commands.inc"

.section .geo, "a"

glabel bully_X_geo_000000 # 0x0C000000
   geo_shadow SHADOW_CIRCLE_UNK1, 0xC8, 70
      geo_open_node
         geo_scale 0x00, 24576
         geo_open_node
            geo_dl_translated 0x01, 0, 0, 0
            geo_open_node
               geo_dl_translated 0x01, 0, 0, 0
               geo_open_node
                  geo_dl_translated 0x01, 0, 0, 75
                  geo_open_node
                     geo_dl_translated 0x01, 0, 0, 0
                     geo_open_node
                        geo_dl_translated 0x01, 146, 0, 0
                        geo_open_node
                           geo_dl_translated 0x01, 0, 0, 0, bully_X_seg5_dl_05003708
                        geo_close_node
                     geo_close_node
                  geo_close_node
                  geo_dl_translated 0x01, 0, 0, -75
                  geo_open_node
                     geo_dl_translated 0x01, 0, 0, 0
                     geo_open_node
                        geo_dl_translated 0x01, 146, 0, 0
                        geo_open_node
                           geo_dl_translated 0x01, 0, 0, 0, bully_X_seg5_dl_050037A0
                        geo_close_node
                     geo_close_node
                  geo_close_node
                  geo_dl_translated 0x01, 0, 0, 0
                  geo_open_node
                     geo_billboard
                     geo_open_node
                        geo_display_list 0x04, bully_X_seg5_dl_05003D40
                     geo_close_node
                  geo_close_node
                  geo_dl_translated 0x01, 0, 0, 0, bully_X_seg5_dl_05000398
                  geo_dl_translated 0x04, 0, 0, 0, bully_X_seg5_dl_05003FC8
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_end

glabel bully_X_geo_000120 # 0x0C000120
   geo_shadow SHADOW_CIRCLE_UNK1, 0xC8, 210
      geo_open_node
         geo_scale 0x00, 49152
         geo_open_node
            geo_dl_translated 0x01, 0, 0, 0
            geo_open_node
               geo_dl_translated 0x01, 0, 0, 0
               geo_open_node
                  geo_dl_translated 0x01, 0, 0, 75
                  geo_open_node
                     geo_dl_translated 0x01, 0, 0, 0
                     geo_open_node
                        geo_dl_translated 0x01, 146, 0, 0
                        geo_open_node
                           geo_dl_translated 0x01, 0, 0, 0, bully_X_seg5_dl_05003708
                        geo_close_node
                     geo_close_node
                  geo_close_node
                  geo_dl_translated 0x01, 0, 0, -75
                  geo_open_node
                     geo_dl_translated 0x01, 0, 0, 0
                     geo_open_node
                        geo_dl_translated 0x01, 146, 0, 0
                        geo_open_node
                           geo_dl_translated 0x01, 0, 0, 0, bully_X_seg5_dl_050037A0
                        geo_close_node
                     geo_close_node
                  geo_close_node
                  geo_dl_translated 0x01, 0, 0, 0
                  geo_open_node
                     geo_billboard
                     geo_open_node
                        geo_display_list 0x04, bully_X_seg5_dl_05003EA8
                     geo_close_node
                  geo_close_node
                  geo_dl_translated 0x01, 0, 0, 0, bully_X_seg5_dl_05000398
                  geo_dl_translated 0x04, 0, 0, 0, bully_X_seg5_dl_05003FC8
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_end

# TODO: this seems broken
glabel bully_X_geo_000240 # 0x0C000240
   geo_scale 0x00, 16384
   geo_open_node
      geo_dl_translated 0x01, 0, 0, 0
      geo_open_node
         geo_dl_translated 0x01, 0, 0, 0, bully_X_seg5_dl_05005D00
         geo_open_node
            geo_dl_translated 0x01, 306, 0, 0, bully_X_seg5_dl_05005A60
            geo_open_node
               geo_dl_translated 0x01, 6, 3, 0
               geo_open_node
                  geo_dl_translated 0x01, 0, 0, 0, bully_X_seg5_dl_050058D0
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
geo_end
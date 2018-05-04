# level script ccm_level from 394230-3948D0



.global ccm_level
.align 4, 0
ccm_level:
.word 0x24181F36, 0x0213EEB2, 0x191A0000, 0x00000000, 0x07120000, beh_platform_on_tracks
.word 0x07040000
.word 0x24181F57, 0x0A5AF169, 0x0F820000, 0x00000000, 0x00010000, beh_small_penguin
.word 0x24181F57, 0xFDD50D8E, 0xFC180000, 0x00000000, 0x00000000, beh_small_penguin
.word 0x24181F56, 0xF6B8F9CB, 0x10A00000, 0x00FC0000, 0x00010000, beh_mr_blizzard
.word 0x24181F56, 0xFE76F9CB, 0x130E0000, 0x004A0000, 0x00010000, beh_mr_blizzard
.word 0x241810D2, 0x0A000A66, 0xFB9E0000, 0x00000000, 0x00000000, beh_snowmans_bottom
.word 0x07040000
.word 0x24183F00, 0x0A69EE01, 0x11AD0000, 0x00000000, 0x00000000, beh_ccm_touched_star_spawn
.word 0x24183F57, 0x0D7AEDA4, 0x11C60000, 0x00000000, 0x01000000, beh_tuxies_mother
.word 0x24183F00, 0x1068FC61, 0x01900000, 0x00000000, 0x03000000, beh_hidden_red_coin_star
.word 0x24183F37, 0xEF7AFB6F, 0x07150000, 0x010E0000, 0x04000000, beh_snowmans_head
.word 0x24183F7A, 0xF830F768, 0xF4480000, 0x00000000, 0x05000000, beh_collect_star
.word 0x07040000
.word 0x24183E57, 0xECA81A00, 0xE8450000, 0x010E0000, 0x02000000, beh_racing_penguin
.word 0x24181F00, 0xE69CE934, 0xE7000000, 0x00000000, 0x00000000, beh_finish_line_check
.word 0x24181F00, 0xE707FD34, 0x1D4F0000, 0x00000000, 0x00000000, beh_shortcut_check
.word 0x07040000
.word 0x1B040000
.word 0x180C0007, ccm_segment7, ccm_segment7_end
.word 0x1A0C0009, ccm_textures, ccm_textures_end
.word 0x180C000B, flower_textures, flower_textures_end
.word 0x180C000A, ccm_skybox, ccm_skybox_end
.word 0x180C0005, spindrift_penguin_snowman, spindrift_penguin_snowman_end
.word 0x170C000C, spindrift_penguin_blizzard, spindrift_penguin_blizzard_end
.word 0x180C0006, chillychief_moneybag, chillychief_moneybag_end
.word 0x170C000D, moneybag, moneybag_end
.word 0x180C0008, chuckya_shyguy_goomba, chuckya_shyguy_goomba_end
.word 0x170C000F, cannon_box_switch_enemies, cannon_box_switch_enemies_end
.word 0x1D040000
.word 0x250C0001, 0x00000001, beh_mario
.word 0x06080000, 0x15000660
.word 0x06080000, 0x1500080C
.word 0x06080000, 0x150009C0
.word 0x22080003, 0x0E00042C
.word 0x22080004, 0x0E00045C
.word 0x22080005, 0x0E000494
.word 0x22080006, 0x0E0004BC
.word 0x22080007, 0x0E0004E4
.word 0x22080027, 0x1600043C
.word 0x22080019, 0x16001018
.word 0x22080036, 0x0E0003D0
.word 0x220800D2, 0x0E0003F0
.word 0x22080037, 0x0E00040C
.word 0x1F080100, 0x0E00051C
.word 0x24181F00, 0xFA180DE8, 0xF6FF0000, 0x008C0000, 0x000A0000, beh_warps_74
.word 0x24181F00, 0xFF4B0B66, 0xFA320000, 0x00000000, 0x0F1E0000, beh_warp
.word 0x24181F00, 0xF8C90AFF, 0xFEBF0000, 0xFF620000, 0x001F0000, beh_fading_warp
.word 0x24181F00, 0x0D15EDAA, 0xFF490000, 0xFFDE0000, 0x00200000, beh_fading_warp
.word 0x26080A05, 0x010A0000
.word 0x26081405, 0x02140000
.word 0x26081E05, 0x020A0000
.word 0x26081F05, 0x01200000
.word 0x26082005, 0x011F0000
.word 0x2608F006, 0x01330000
.word 0x2608F106, 0x01650000
.word 0x06080000, 0x0E000000
.word 0x06080000, 0x0E00001C
.word 0x06080000, 0x0E000098
.word 0x2E080000, 0x070138E8
.word 0x39080000, 0x07016284
.word 0x30040030
.word 0x36080000, 0x00080000
.word 0x31040002
.word 0x20040000
.word 0x1F080200, 0x0E0005E8
.word 0x24181F00, 0xE9341D29, 0xE8010000, 0x005A0000, 0x000A0000, beh_warps_64
.word 0x26081405, 0x01140000
.word 0x26080A05, 0x020A0000
.word 0x2608F006, 0x01330000
.word 0x2608F106, 0x01650000
.word 0x06080000, 0x0E000114
.word 0x2E080000, 0x07020880
.word 0x39080000, 0x07023468
.word 0x36080001, 0x00090000
.word 0x31040006
.word 0x20040000
.word 0x1E040000
.word 0x2B0C0100, 0x008CFA18, 0x0A00F6FF
.word 0x11080000, lvl_init_or_update # 8024BB38
.word 0x12080001, lvl_init_or_update # 8024BB38
.word 0x1C040000
.word 0x04040001
.word 0x02040000
# begin ccm_level alignment 0x3945F4
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
# begin ccm_level geo 0x394600
# 03D0
.word 0x200001F4
.word 0x04000000
.word   0x15040000, 0x07010F28
.word   0x15010000, 0x070118B0
.word 0x05000000
.word 0x01000000
# 03F0
.word 0x16000001, 0x00C80190
.word 0x04000000
.word   0x15010000, 0x07012BD8
.word 0x05000000
.word 0x01000000
# 040C
.word 0x2000012C
.word 0x04000000
.word   0x15010000, 0x070136D0
.word   0x15040000, 0x07013870
.word 0x05000000
.word 0x01000000
# 042C
.word 0x20000320
.word 0x04000000
.word   0x0D000000, 0xFC180FA0
.word   0x04000000
.word     0x15010000, 0x0700E708
.word     0x15040000, 0x0700E970
.word   0x05000000
.word 0x05000000
.word 0x01000000
# 045C
.word 0x20000384
.word 0x04000000
.word   0x0D000000, 0xFC181B58
.word   0x04000000
.word     0x15010000, 0x0700F440
.word     0x15040000, 0x0700F650
.word     0x15050000, 0x0700F780
.word   0x05000000
.word 0x05000000
.word 0x01000000
# 0494
.word 0x20000190
.word 0x04000000
.word   0x0D000000, 0xFE0C1B58
.word   0x04000000
.word     0x15010000, 0x0700FB00
.word   0x05000000
.word 0x05000000
.word 0x01000000
# 04BC
.word 0x20000320
.word 0x04000000
.word   0x0D000000, 0xFC181B58
.word   0x04000000
.word     0x15050000, 0x0700FD08
.word   0x05000000
.word 0x05000000
.word 0x01000000
# 04E4
.word 0x20000DAC
.word 0x04000000
.word   0x0D000000, 0xF4481770
.word   0x04000000
.word     0x15010000, 0x07010660
.word     0x15040000, 0x070109D0
.word     0x15050000, 0x07010B50
.word   0x05000000
.word 0x05000000
.word 0x01000000
.word 0x0800000A, 0x00A00078, 0x00A00078
.word 0x04000000
.word   0x0C000000
.word   0x04000000
.word     0x09000064
.word     0x04000000
.word       0x19000004, Geo19_802763D4
.word     0x05000000
.word   0x05000000
.word   0x0C010000
.word   0x04000000
.word     0x0A01002D, 0x00643200, Geo0A_8029AA3C
.word     0x04000000
.word       0x0F000001, 0x000007D0, 0x17700000, 0x00000000, Geo0F_80287D30
.word       0x04000000
.word         0x15010000, 0x0700B090
.word         0x15010000, 0x0700B1D8
.word         0x15010000, 0x0700C380
.word         0x15040000, 0x0700D578
.word         0x15060000, 0x0700DDF0
.word         0x18000000, Geo18_802D01E0
.word         0x18000501, Geo18_802D104C
.word         0x17000000
.word         0x18000001, Geo18_802761D0
.word       0x05000000
.word     0x05000000
.word   0x05000000
.word   0x0C000000
.word   0x04000000
.word     0x18000000, Geo18_802CD1E8
.word   0x05000000
.word 0x05000000
.word 0x01000000
.word 0x0800000A, 0x00A00078, 0x00A00078
.word 0x04000000
.word   0x0C000000
.word   0x04000000
.word     0x09000064
.word     0x04000000
.word       0x19000001, 0x00000000
.word     0x05000000
.word   0x05000000
.word   0x0C010000
.word   0x04000000
.word     0x0A01002D, 0x00643200, Geo0A_8029AA3C
.word     0x04000000
.word       0x0F000009, 0x000007D0, 0x17700000, 0x00000000, Geo0F_80287D30
.word       0x04000000
.word         0x15010000, 0x0701CE30
.word         0x15010000, 0x0701E558
.word         0x15020000, 0x0701E6B0
.word         0x15040000, 0x0701FC78
.word         0x15040000, 0x0701FD78
.word         0x15050000, 0x0701FE60
.word         0x15050000, 0x070207F0
.word         0x17000000
.word         0x18000000, Geo18_802761D0
.word       0x05000000
.word     0x05000000
.word   0x05000000
.word 0x05000000
.word 0x01000000
ccm_level_end:

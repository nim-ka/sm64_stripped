# level script ttc_level from 435460-4358D0



.global ttc_level
.align 4, 0
ttc_level:
.word 0x24181F00, 0xFBC8FCB8, 0x06250000, 0x00000000, 0x00560000, beh_pole_grabbing
.word 0x24181F58, 0x077F182F, 0x077F0000, 0x00E10000, 0x00000000, beh_thwomp_2
.word 0x07040000
.word 0x24183F7A, 0xFA56FB96, 0xFBE60000, 0x00000000, 0x00000000, beh_collect_star
.word 0x24183F7A, 0xF8C6012C, 0xFC4A0000, 0x00000000, 0x01000000, beh_collect_star
.word 0x24183F7A, 0xFAECF736, 0xFAEC0000, 0x00000000, 0x02000000, beh_collect_star
.word 0x24183F7A, 0x08981C84, 0x08A20000, 0x00000000, 0x03000000, beh_collect_star
.word 0x24183F7A, 0xFBE60960, 0xFCEA0000, 0x00000000, 0x04000000, beh_collect_star
.word 0x24183F00, 0x0717F380, 0x03200000, 0x00000000, 0x05000000, beh_hidden_red_coin_star
.word 0x07040000
.word 0x1B040000
.word 0x180C0007, ttc_segment7, ttc_segment7_end
.word 0x1A0C0009, ttc_textures, ttc_textures_end
.word 0x180C0005, yoshiegg_owl_thwomp, yoshiegg_owl_thwomp_end
.word 0x170C000C, owl_thwomp_bullet_heave, owl_thwomp_bullet_heave_end
.word 0x180C0008, chuckya_shyguy_goomba, chuckya_shyguy_goomba_end
.word 0x170C000F, cannon_box_switch_enemies, cannon_box_switch_enemies_end
.word 0x1D040000
.word 0x250C0001, 0x00000001, beh_mario
.word 0x06080000, 0x15000660
.word 0x06080000, 0x1500071C
.word 0x22080036, 0x0E000240
.word 0x22080037, 0x0E000258
.word 0x22080038, 0x0E000270
.word 0x22080039, 0x0E000288
.word 0x2208003A, 0x0E0002A8
.word 0x2208003B, 0x0E0002C8
.word 0x2208003C, 0x0E0002E0
.word 0x2208003D, 0x0E0002F8
.word 0x2208003E, 0x0E000310
.word 0x2208003F, 0x0E000328
.word 0x22080040, 0x0E000340
.word 0x22080041, 0x0E000358
.word 0x22080042, 0x0E000370
.word 0x22080043, 0x0E000388
.word 0x22080044, 0x0E0003A0
.word 0x1F080100, 0x0E0003B8
.word 0x24181F00, 0x0589F112, 0xFDDC0000, 0x013C0000, 0x000A0000, beh_warps_74
.word 0x26080A0E, 0x010A0000
.word 0x2608F006, 0x02350000
.word 0x2608F106, 0x02670000
.word 0x06080000, 0x0E000000
.word 0x06080000, 0x0E000034
.word 0x2E080000, 0x07012330
.word 0x39080000, 0x07015B24
.word 0x36080001, 0x00090000
.word 0x31040001
.word 0x20040000
.word 0x1E040000
.word 0x2B0C0100, 0x013C0589, 0xED2AFDDC
.word 0x11080000, lvl_init_or_update # 8024BB38
.word 0x12080001, lvl_init_or_update # 8024BB38
.word 0x1C040000
.word 0x04040001
.word 0x02040000
# begin ttc_level geo 0x4356A0
# 0240
.word 0x2000019A
.word 0x04000000
.word   0x15010000, 0x0700ECB8
.word 0x05000000
.word 0x01000000
# 0258
.word 0x2000019A
.word 0x04000000
.word   0x15010000, 0x0700EFE0
.word 0x05000000
.word 0x01000000
# 0270
.word 0x2000044C
.word 0x04000000
.word   0x15010000, 0x0700F760
.word 0x05000000
.word 0x01000000
# 0288
.word 0x200002D0
.word 0x04000000
.word   0x15010000, 0x0700FBB8
.word   0x18001400, Geo18_802D1E48
.word 0x05000000
.word 0x01000000
# 02A8
.word 0x20000208
.word 0x04000000
.word   0x15010000, 0x0700FFE8
.word   0x18001401, Geo18_802D1E48
.word 0x05000000
.word 0x01000000
# 02C8
.word 0x200001F4
.word 0x04000000
.word   0x15010000, 0x070102B8
.word 0x05000000
.word 0x01000000
# 02E0
.word 0x20000190
.word 0x04000000
.word   0x15010000, 0x07010868
.word 0x05000000
.word 0x01000000
# 02F8
.word 0x20000208
.word 0x04000000
.word   0x15010000, 0x07010D38
.word 0x05000000
.word 0x01000000
# 0310
.word 0x200000FA
.word 0x04000000
.word   0x15010000, 0x07011040
.word 0x05000000
.word 0x01000000
# 0328
.word 0x200000FA
.word 0x04000000
.word   0x15010000, 0x07011360
.word 0x05000000
.word 0x01000000
# 0340
.word 0x2000017C
.word 0x04000000
.word   0x15010000, 0x070116A8
.word 0x05000000
.word 0x01000000
# 0358
.word 0x200006A4
.word 0x04000000
.word   0x15010000, 0x07011B38
.word 0x05000000
.word 0x01000000
# 0370
.word 0x200001F4
.word 0x04000000
.word   0x15010000, 0x07012028
.word 0x05000000
.word 0x01000000
# 0388
.word 0x200000C8
.word 0x04000000
.word   0x15040000, 0x07012148
.word 0x05000000
.word 0x01000000
# 03A0
.word 0x2000012C
.word 0x04000000
.word   0x15040000, 0x07012278
.word 0x05000000
.word 0x01000000
.word 0x0800000A, 0x00A00078, 0x00A00078
.word 0x04000000
.word   0x0C000000
.word   0x04000000
.word     0x09000064
.word     0x04000000
.word       0x1900C7FF, 0x00000000
.word     0x05000000
.word   0x05000000
.word   0x0C010000
.word   0x04000000
.word     0x0A01002D, 0x00643200, Geo0A_8029AA3C
.word     0x04000000
.word       0x0F000002, 0x000007D0, 0x17700000, 0x00000000, Geo0F_80287D30
.word       0x04000000
.word         0x18000000, Geo18_802D01E0
.word         0x18001400, Geo18_802D2108
.word         0x18001401, Geo18_802D2108
.word         0x15010000, 0x0700AD38
.word         0x15050000, 0x0700B1D8
.word         0x15040000, 0x0700E878
.word         0x17000000
.word         0x18000000, Geo18_802761D0
.word       0x05000000
.word     0x05000000
.word   0x05000000
.word 0x05000000
.word 0x01000000
.word 0x00000000
.word 0x00000000
ttc_level_end:

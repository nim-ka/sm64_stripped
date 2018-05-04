# level script bits_platform_level from 4CF490-4CF8B0



.global bits_platform_level
.align 4, 0
bits_platform_level:
.word 0x24181F36, 0x00000000, 0x00000000, 0x00000000, 0x00010000, beh_falling_bowser_platform
.word 0x24181F37, 0x00000000, 0x00000000, 0x00000000, 0x00020000, beh_falling_bowser_platform
.word 0x24181F38, 0x00000000, 0x00000000, 0x00000000, 0x00030000, beh_falling_bowser_platform
.word 0x24181F39, 0x00000000, 0x00000000, 0x00000000, 0x00040000, beh_falling_bowser_platform
.word 0x24181F3A, 0x00000000, 0x00000000, 0x00000000, 0x00050000, beh_falling_bowser_platform
.word 0x24181F3B, 0x00000000, 0x00000000, 0x00000000, 0x00060000, beh_falling_bowser_platform
.word 0x24181F3C, 0x00000000, 0x00000000, 0x00000000, 0x00070000, beh_falling_bowser_platform
.word 0x24181F3D, 0x00000000, 0x00000000, 0x00000000, 0x00080000, beh_falling_bowser_platform
.word 0x24181F3E, 0x00000000, 0x00000000, 0x00000000, 0x00090000, beh_falling_bowser_platform
.word 0x24181F3F, 0x00000000, 0x00000000, 0x00000000, 0x000A0000, beh_falling_bowser_platform
.word 0x24181FB3, 0xF7B60200, 0xF4A00000, 0x00000000, 0x00000000, beh_bowser_bomb
.word 0x24181FB3, 0xF2DE0200, 0x04610000, 0x00000000, 0x00000000, beh_bowser_bomb
.word 0x24181FB3, 0x00000200, 0x0E000000, 0x00000000, 0x00000000, beh_bowser_bomb
.word 0x24181FB3, 0x0D230200, 0x04610000, 0x00000000, 0x00000000, beh_bowser_bomb
.word 0x24181FB3, 0x084B0200, 0xF4A00000, 0x00000000, 0x00000000, beh_bowser_bomb
.word 0x07040000
.word 0x1B040000
.word 0x180C0007, bits_platform_segment7, bits_platform_segment7_end
.word 0x180C0006, bowser, bowser_end
.word 0x170C000D, bowser_flames_bomb, bowser_flames_bomb_end
.word 0x180C000A, bits_skybox, bits_skybox_end
.word 0x1D040000
.word 0x250C0001, 0x00000001, beh_mario
.word 0x06080000, 0x150008D8
.word 0x22080036, 0x0E000290
.word 0x22080037, 0x0E0002A8
.word 0x22080038, 0x0E0002C0
.word 0x22080039, 0x0E0002D8
.word 0x2208003A, 0x0E0002F0
.word 0x2208003B, 0x0E000308
.word 0x2208003C, 0x0E000320
.word 0x2208003D, 0x0E000338
.word 0x2208003E, 0x0E000350
.word 0x2208003F, 0x0E000368
.word 0x22080003, 0x0E000380
.word 0x1F080100, 0x0E000398
.word 0x24181F00, 0x0000051B, 0x00000000, 0x00B70000, 0x000A0000, beh_warps_6C
.word 0x26080A22, 0x010A0000
.word 0x06080000, 0x0E000000
.word 0x2608F115, 0x010C0000
.word 0x2E080000, 0x070049C8
.word 0x36080002, 0x00190000
.word 0x31040001
.word 0x20040000
.word 0x1E040000
.word 0x2B0C0100, 0x00B70000, 0x01330000
.word 0x11080000, lvl_init_or_update # 8024BB38
.word 0x12080001, lvl_init_or_update # 8024BB38
.word 0x1C040000
.word 0x04040001
.word 0x02040000
# begin bits_platform_level alignment 0x4CF71C
.byte 0x00, 0x00, 0x00, 0x00
# begin bits_platform_level geo 0x4CF720
# 0290
.word 0x20001388
.word 0x04000000
.word   0x15010000, 0x070022A8
.word 0x05000000
.word 0x01000000
# 02A8
.word 0x20001388
.word 0x04000000
.word   0x15010000, 0x070025E0
.word 0x05000000
.word 0x01000000
# 02C0
.word 0x20001388
.word 0x04000000
.word   0x15010000, 0x07002918
.word 0x05000000
.word 0x01000000
# 02D8
.word 0x20001388
.word 0x04000000
.word   0x15010000, 0x07002C50
.word 0x05000000
.word 0x01000000
# 02F0
.word 0x20001388
.word 0x04000000
.word   0x15010000, 0x07002F88
.word 0x05000000
.word 0x01000000
# 0308
.word 0x20001388
.word 0x04000000
.word   0x15010000, 0x070032C0
.word 0x05000000
.word 0x01000000
# 0320
.word 0x20001388
.word 0x04000000
.word   0x15010000, 0x070035F8
.word 0x05000000
.word 0x01000000
# 0338
.word 0x20001388
.word 0x04000000
.word   0x15010000, 0x07003930
.word 0x05000000
.word 0x01000000
# 0350
.word 0x20001388
.word 0x04000000
.word   0x15010000, 0x07003C68
.word 0x05000000
.word 0x01000000
# 0368
.word 0x20001388
.word 0x04000000
.word   0x15010000, 0x07003FA0
.word 0x05000000
.word 0x01000000
# 0380
.word 0x200002BC
.word 0x04000000
.word   0x15010000, 0x07004958
.word 0x05000000
.word 0x01000000
.word 0x0800000A, 0x00A00078, 0x00A00078
.word 0x04000000
.word   0x0C000000
.word   0x04000000
.word     0x09000064
.word     0x04000000
.word       0x19000009, Geo19_802763D4
.word     0x05000000
.word   0x05000000
.word   0x0C010000
.word   0x04000000
.word     0x0A01002D, 0x00643200, Geo0A_8029AA3C
.word     0x04000000
.word       0x0F00000B, 0x000007D0, 0x17700000, 0x00000000, Geo0F_80287D30
.word       0x04000000
.word         0x15010000, 0x070046B0
.word         0x17000000
.word         0x18000000, Geo18_802761D0
.word       0x05000000
.word     0x05000000
.word   0x05000000
.word 0x05000000
.word 0x01000000
bits_platform_level_end:

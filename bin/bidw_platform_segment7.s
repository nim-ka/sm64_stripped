# generated by n64split
.section .rodata

.include "macros.inc"

texture_07000000: # 0x07000000
.incbin "build/bin/bidw_platform_segment7/bidw_platform_segment7.00000.rgba16"

texture_07001000: # 0x07001000
.incbin "build/bin/bidw_platform_segment7/bidw_platform_segment7.01000.rgba16"

texture_07001800: # 0x07001800
.incbin "build/bin/bidw_platform_segment7/bidw_platform_segment7.01800.rgba16"

light_07002000: # 0x07002000
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00
light_07002008: # 0x07002008
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

vertex_07002018: # 0x07002018
vertex  -1535,    307,      0,   3034,    990, 0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,      0,   1502,  -2712, 0x00, 0x7F, 0x00, 0xFF
vertex  -1085,    307,  -1085,      0,    990, 0x00, 0x7F, 0x00, 0xFF
vertex   1086,    307,  -1085,      0,    990, 0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,  -1535,   3034,    990, 0x00, 0x7F, 0x00, 0xFF
vertex  -1085,    307,   1086,   3034,    990, 0x00, 0x7F, 0x00, 0xFF
vertex  -1535,    307,      0,      0,    990, 0x00, 0x7F, 0x00, 0xFF
vertex   1086,    307,  -1085,   3034,    990, 0x00, 0x7F, 0x00, 0xFF
vertex   1536,    307,      0,      0,    990, 0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,  -1535,      0,    990, 0x00, 0x7F, 0x00, 0xFF
vertex  -1085,    307,  -1085,   3034,    990, 0x00, 0x7F, 0x00, 0xFF
vertex   1086,    307,   1086,   3034,    990, 0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,   1536,      0,    990, 0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,   1536,   3034,    990, 0x00, 0x7F, 0x00, 0xFF
vertex  -1085,    307,   1086,      0,    990, 0x00, 0x7F, 0x00, 0xFF

vertex_07002108: # 0x07002108
vertex   1536,    307,      0,   3034,    990, 0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,      0,   1502,  -2712, 0x00, 0x7F, 0x00, 0xFF
vertex   1086,    307,   1086,      0,    990, 0x00, 0x7F, 0x00, 0xFF

vertex_07002138: # 0x07002138
vertex   1086,    307,  -1085,    990,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex   2172,    307,  -2171,      0,    990, 0x3E, 0x49, 0xAE, 0xFF
vertex      0,    307,  -3071,   4056,    990, 0xF5, 0x5C, 0xAB, 0xFF
vertex  -3071,    307,      0,   4056,    990, 0xB8, 0x68, 0x09, 0xFF
vertex  -1535,    307,      0,   3034,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex  -1085,    307,  -1085,    990,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex  -2171,    307,  -2171,      0,    990, 0xBB, 0x5C, 0xCC, 0xFF
vertex  -3071,    307,      0,      0,    990, 0xB8, 0x68, 0x09, 0xFF
vertex  -1085,    307,   1086,   3034,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex  -1535,    307,      0,    990,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex  -2171,    307,   2172,   4056,    990, 0xCC, 0x5C, 0x45, 0xFF
vertex      0,    307,  -1535,    990,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex  -2171,    307,  -2171,   4056,    990, 0xBB, 0x5C, 0xCC, 0xFF
vertex  -1085,    307,  -1085,   3034,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,  -3071,      0,    990, 0xF5, 0x5C, 0xAB, 0xFF

vertex_07002228: # 0x07002228
vertex   2172,    307,   2172,      0,    990, 0x45, 0x5C, 0x34, 0xFF
vertex   3072,    307,      0,   4056,    990, 0x55, 0x5C, 0xF5, 0xFF
vertex   1536,    307,      0,   3034,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex   1086,    307,  -1085,    990,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,  -3071,   4056,    990, 0xF5, 0x5C, 0xAB, 0xFF
vertex      0,    307,  -1535,   3034,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex  -2171,    307,   2172,      0,    990, 0xCC, 0x5C, 0x45, 0xFF
vertex      0,    307,   3072,   4056,    990, 0x0B, 0x5C, 0x55, 0xFF
vertex      0,    307,   1536,   3034,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex  -1085,    307,   1086,    990,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,   3072,      0,    990, 0x0B, 0x5C, 0x55, 0xFF
vertex   1086,    307,   1086,   3034,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,   1536,    990,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex   2172,    307,   2172,   4056,    990, 0x45, 0x5C, 0x34, 0xFF
vertex   1086,    307,   1086,    990,  -1478, 0x00, 0x7F, 0x00, 0xFF

vertex_07002318: # 0x07002318
vertex   3072,    307,      0,      0,    990, 0x55, 0x5C, 0xF5, 0xFF
vertex   1086,    307,  -1085,   3034,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex   1536,    307,      0,    990,  -1478, 0x00, 0x7F, 0x00, 0xFF
vertex   2172,    307,  -2171,   4056,    990, 0x3E, 0x49, 0xAE, 0xFF

vertex_07002358: # 0x07002358
vertex      0,  -2047,   3072,    990,   1996, 0xEF, 0x00, 0x7D, 0xFF
vertex      0,    307,   3072,    990,     -4, 0x0B, 0x5C, 0x55, 0xFF
vertex  -2171,    307,   2172,      0,     -8, 0xCC, 0x5C, 0x45, 0xFF
vertex   2172,  -2047,  -2171,    990,   1984, 0x65, 0x00, 0xB4, 0xFF
vertex   3072,    307,      0,      0,    -12, 0x55, 0x5C, 0xF5, 0xFF
vertex   3072,  -2047,      0,      0,   1988, 0x7D, 0x00, 0x11, 0xFF
vertex   2172,    307,  -2171,    990,    -16, 0x3E, 0x49, 0xAE, 0xFF
vertex   3072,  -2047,      0,    990,   1984, 0x7D, 0x00, 0x11, 0xFF
vertex   2172,    307,   2172,      0,    -20, 0x45, 0x5C, 0x34, 0xFF
vertex   2172,  -2047,   2172,      0,   1980, 0x4C, 0x00, 0x65, 0xFF
vertex   3072,    307,      0,    990,    -16, 0x55, 0x5C, 0xF5, 0xFF
vertex   2172,  -2047,   2172,    990,   1988, 0x4C, 0x00, 0x65, 0xFF
vertex      0,    307,   3072,      0,    -16, 0x0B, 0x5C, 0x55, 0xFF
vertex      0,  -2047,   3072,      0,   1984, 0xEF, 0x00, 0x7D, 0xFF
vertex   2172,    307,   2172,    990,    -16, 0x45, 0x5C, 0x34, 0xFF

vertex_07002448: # 0x07002448
vertex  -2171,  -2047,   2172,    990,   1992, 0x9B, 0x00, 0x4C, 0xFF
vertex  -2171,    307,   2172,    990,    -12, 0xCC, 0x5C, 0x45, 0xFF
vertex  -3071,    307,      0,      0,    -16, 0xB8, 0x68, 0x09, 0xFF
vertex      0,  -2047,   3072,    990,   1996, 0xEF, 0x00, 0x7D, 0xFF
vertex  -2171,    307,   2172,      0,     -8, 0xCC, 0x5C, 0x45, 0xFF
vertex  -2171,  -2047,   2172,      0,   1992, 0x9B, 0x00, 0x4C, 0xFF
vertex      0,  -2047,  -3071,    990,   1992, 0x11, 0x00, 0x83, 0xFF
vertex      0,    307,  -3071,    990,    -16, 0xF5, 0x5C, 0xAB, 0xFF
vertex   2172,    307,  -2171,      0,    -20, 0x3E, 0x49, 0xAE, 0xFF
vertex   2172,  -2047,  -2171,      0,   1988, 0x65, 0x00, 0xB4, 0xFF
vertex  -2171,  -2047,  -2171,    990,   1996, 0xB4, 0x00, 0x9B, 0xFF
vertex  -2171,    307,  -2171,    990,    -12, 0xBB, 0x5C, 0xCC, 0xFF
vertex      0,    307,  -3071,      0,    -16, 0xF5, 0x5C, 0xAB, 0xFF
vertex      0,  -2047,  -3071,      0,   1996, 0x11, 0x00, 0x83, 0xFF
vertex  -3071,  -2047,      0,      0,   1988, 0x83, 0x00, 0xEF, 0xFF

vertex_07002538: # 0x07002538
vertex  -3071,  -2047,      0,    990,   1996, 0x83, 0x00, 0xEF, 0xFF
vertex  -2171,    307,  -2171,      0,    -16, 0xBB, 0x5C, 0xCC, 0xFF
vertex  -2171,  -2047,  -2171,      0,   1988, 0xB4, 0x00, 0x9B, 0xFF
vertex  -3071,    307,      0,    990,     -8, 0xB8, 0x68, 0x09, 0xFF

bidw_platform_f3d_07002578: # 0x07002578
.word 0xFD100000, texture_07001800
.word 0xE6000000, 0x00000000
.word 0xF3000000, 0x073FF100
.word 0x03860010, light_07002008
.word 0x03880010, light_07002000
.word 0x04E000F0, vertex_07002018
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x000A1E28
.word 0xBF000000, 0x00320A3C
.word 0xBF000000, 0x00460A50
.word 0xBF000000, 0x000A5A64
.word 0xBF000000, 0x006E0A78
.word 0xBF000000, 0x00820A8C
.word 0x04200030, vertex_07002108
.word 0xBF000000, 0x00000A14
.word 0xB8000000, 0x00000000

bidw_platform_f3d_070025F8: # 0x070025F8
.word 0xFD100000, texture_07001000
.word 0xE6000000, 0x00000000
.word 0xF3000000, 0x073FF100
.word 0x04E000F0, vertex_07002138
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E2832
.word 0xBF000000, 0x001E323C
.word 0xBF000000, 0x0046505A
.word 0xBF000000, 0x00466450
.word 0xBF000000, 0x006E7882
.word 0xBF000000, 0x006E8C78
.word 0x04E000F0, vertex_07002228
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E2832
.word 0xBF000000, 0x003C4650
.word 0xBF000000, 0x003C505A
.word 0xBF000000, 0x00646E78
.word 0xBF000000, 0x0064826E
.word 0xBF000000, 0x0000148C
.word 0x04300040, vertex_07002318
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x00001E0A
.word 0xB8000000, 0x00000000

bidw_platform_f3d_070026B0: # 0x070026B0
.word 0xFD100000, texture_07000000
.word 0xE6000000, 0x00000000
.word 0xF3000000, 0x077FF100
.word 0x04E000F0, vertex_07002358
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E2832
.word 0xBF000000, 0x001E3C28
.word 0xBF000000, 0x0046505A
.word 0xBF000000, 0x00466450
.word 0xBF000000, 0x006E7882
.word 0xBF000000, 0x006E8C78
.word 0x04E000F0, vertex_07002448
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E2832
.word 0xBF000000, 0x003C4650
.word 0xBF000000, 0x003C505A
.word 0xBF000000, 0x00646E78
.word 0xBF000000, 0x00647882
.word 0xBF000000, 0x0000148C
.word 0x04300040, vertex_07002538
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x00001E0A
.word 0xB8000000, 0x00000000

glabel bidw_platform_f3d_07002768 # 0x07002768
.word 0xE7000000, 0x00000000
.word 0xBA001402, 0x00100000
.word 0xB900031D, 0xC8112078
.word 0xB9000201, 0x00000000
.word 0xF8000000, 0x0A1E14FF
.word 0xBC000008, 0x10AAF056
.word 0xB7000000, 0x00010000
.word 0xFC127FFF, 0xFFFFF838
.word 0xF5100000, 0x07000000
.word 0xBB000001, 0xFFFFFFFF
.word 0xE8000000, 0x00000000
.word 0xF5101000, 0x00014050
.word 0xF2000000, 0x0007C07C
.word 0x06000000, bidw_platform_f3d_07002578
.word 0x06000000, bidw_platform_f3d_070025F8
.word 0xE8000000, 0x00000000
.word 0xF5101000, 0x00098050
.word 0xF2000000, 0x0007C0FC
.word 0x06000000, bidw_platform_f3d_070026B0
.word 0xBB000000, 0xFFFFFFFF
.word 0xE7000000, 0x00000000
.word 0xBA001402, 0x00000000
.word 0xB900031D, 0x00442078
.word 0xB6000000, 0x00010000
.word 0xFCFFFFFF, 0xFFFE793C
.word 0xB8000000, 0x00000000

glabel bidw_platform_collision # 0x07002838
.incbin "bin/bidw_platform_segment7/bidw_platform_segment7.02838.collision"
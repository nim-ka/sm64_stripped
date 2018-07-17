.section .rodata

# TODO: cross-link between segments
.equ lll_texture_09003000, 0x09003000
.equ lll_texture_09005000, 0x09005000
.equ lll_texture_09005800, 0x09005800
.equ lll_texture_09009800, 0x09009800

.include "macros.inc"

bowser_2_seg7_texture_07000000: # 0x07000000
.incbin "build/bin/bifs_platform_segment7/bifs_platform_segment7.00000.rgba16"

bowser_2_seg7_vertices_07000800: # 0x07000800
vertex   1176,    784,  -2837,   6612,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2838,   1229,  -1175,   7634,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2838,    784,  -1175,   7634,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1176,    784,   2838,   1502,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1176,   1229,   2838,   1502,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1175,   1229,   2838,   2524,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2838,    784,   1176,    480,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1175,    784,   2838,   2524,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2838,   1229,   1176,    480,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2837,   1229,   1176,   3546,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2837,    784,   1176,   3546,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2838,   1229,   1176,   8656,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2838,    784,   1176,   8656,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -306,      0,   1502,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1175,    784,   2838,   1246,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2837,    784,   1176,   1756,    812,  0xFF, 0xFF, 0xFF, 0xFF

bowser_2_seg7_vertices_07000900: # 0x07000900
vertex   1176,    784,  -2837,   6612,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1176,   1229,  -2837,   6612,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2838,   1229,  -1175,   7634,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1175,    784,  -2837,   5590,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1175,   1229,  -2837,   5590,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2837,    784,  -1175,   4568,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2837,   1229,  -1175,   4568,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2837,    784,   1176,   3546,    678,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2837,   1229,   1176,   3546,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2837,    784,   1176,   1756,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2837,    784,  -1175,   2268,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -306,      0,   2012,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1175,    784,  -2837,   2778,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -306,      0,   2524,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1176,    784,  -2837,   3290,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -306,      0,   3034,    552,  0xFF, 0xFF, 0xFF, 0xFF

bowser_2_seg7_vertices_07000A00: # 0x07000A00
vertex   1176,    784,  -2837,   3290,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2838,    784,  -1175,   3800,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -306,      0,   3546,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2838,    784,   1176,   4312,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -306,      0,   4056,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2838,    784,   1176,    224,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1176,    784,   2838,    734,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -306,      0,    480,    552,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1175,    784,   2838,   1246,    812,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -306,      0,    990,    552,  0xFF, 0xFF, 0xFF, 0xFF

bowser_2_seg7_vertices_07000AA0: # 0x07000AA0
vertex   2838,   1229,  -1175,   5298,  -4574,  0xAD, 0x10, 0x16, 0xFF
vertex   1703,   1229,    705,   3210,  -1892,  0xAD, 0x10, 0x16, 0xFF
vertex   2838,   1229,   1176,   4460,  -1222,  0xAD, 0x10, 0x16, 0xFF
vertex  -2837,   1229,  -1175,  -1782,  -4574,  0xAD, 0x10, 0x16, 0xFF
vertex   -704,   1229,  -1702,   1064,  -5326,  0xAD, 0x10, 0x16, 0xFF
vertex  -1175,   1229,  -2837,    882,  -6944,  0xAD, 0x10, 0x16, 0xFF
vertex  -2837,   1229,   1176,  -2620,  -1222,  0xAD, 0x10, 0x16, 0xFF
vertex  -1702,   1229,   -704,   -534,  -3904,  0xAD, 0x10, 0x16, 0xFF
vertex  -1702,   1229,    705,  -1036,  -1892,  0xAD, 0x10, 0x16, 0xFF
vertex    705,   1229,  -1702,   2824,  -5326,  0xAD, 0x10, 0x16, 0xFF
vertex   1176,   1229,  -2837,   3816,  -6944,  0xAD, 0x10, 0x16, 0xFF
vertex  -1175,   1229,   2838,  -1138,   1146,  0xAD, 0x10, 0x16, 0xFF
vertex   -704,   1229,   1703,   -148,   -470,  0xAD, 0x10, 0x16, 0xFF
vertex   1176,   1229,   2838,   1792,   1146,  0xAD, 0x10, 0x16, 0xFF
vertex    705,   1229,   1703,   1610,   -470,  0xAD, 0x10, 0x16, 0xFF
vertex   1703,   1229,   -704,   3714,  -3904,  0xAD, 0x10, 0x16, 0xFF

bowser_2_seg7_vertices_07000BA0: # 0x07000BA0
vertex  -1418,   1229,    588,   3034,  -2076,  0xFD, 0x42, 0x34, 0xFF
vertex   -587,   1229,   1419,   5202,  -1178,  0xFD, 0x42, 0x34, 0xFF
vertex      0,   1229,      0,   3034,    990,  0xFD, 0x42, 0x34, 0xFF
vertex    588,   1229,   1419,   6100,    990,  0xFD, 0x42, 0x34, 0xFF
vertex   1419,   1229,    588,   5202,   3156,  0xFD, 0x42, 0x34, 0xFF
vertex  -1418,   1229,   -587,    866,  -1178,  0xFD, 0x42, 0x34, 0xFF
vertex   1419,   1229,   -587,   3034,   4054,  0xFD, 0x42, 0x34, 0xFF
vertex    588,   1229,  -1418,    866,   3156,  0xFD, 0x42, 0x34, 0xFF
vertex   -587,   1229,  -1418,      0,    990,  0xFD, 0x42, 0x34, 0xFF

bowser_2_seg7_vertices_07000C30: # 0x07000C30
vertex   -704,   1229,   1703,      0,    850,  0xFD, 0x42, 0x34, 0xFF
vertex    705,   1229,   1703,   4568,  -1054,  0xFD, 0x42, 0x34, 0xFF
vertex    588,   1229,   1419,   3800,  -1820,  0xFD, 0x42, 0x34, 0xFF
vertex  -1702,   1229,    705,  -4630,  -1054,  0xFD, 0x42, 0x34, 0xFF
vertex  -1418,   1229,   -587,  -5450,  -5654,  0xFD, 0x42, 0x34, 0xFF
vertex  -1702,   1229,   -704,  -6534,  -5654,  0xFD, 0x42, 0x34, 0xFF
vertex   -587,   1229,  -1418,  -3862,  -9486,  0xFD, 0x42, 0x34, 0xFF
vertex   -704,   1229,  -1702,  -4628, -10252,  0xFD, 0x42, 0x34, 0xFF
vertex  -1418,   1229,    588,  -3862,  -1820,  0xFD, 0x42, 0x34, 0xFF
vertex    588,   1229,  -1418,      0, -11072,  0xFD, 0x42, 0x34, 0xFF
vertex    705,   1229,  -1702,      0, -12156,  0xFD, 0x42, 0x34, 0xFF
vertex   -587,   1229,   1419,      0,   -234,  0xFD, 0x42, 0x34, 0xFF
vertex   1703,   1229,    705,   6472,  -5652,  0xFD, 0x42, 0x34, 0xFF
vertex   1419,   1229,    588,   5388,  -5652,  0xFD, 0x42, 0x34, 0xFF
vertex   1703,   1229,   -704,   4568, -10252,  0xFD, 0x42, 0x34, 0xFF
vertex   1419,   1229,   -587,   3800,  -9486,  0xFD, 0x42, 0x34, 0xFF

glabel bowser_2_seg7_dl_07000D30 # 0x07000D30
.word 0xFD100000, lll_texture_09009800
.word 0xE6000000, 0x00000000
.word 0xF3000000, 0x073FF100
.word 0x04F00100, bowser_2_seg7_vertices_07000800
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E2832
.word 0xBF000000, 0x003C281E
.word 0xBF000000, 0x001E3246
.word 0xBF000000, 0x003C5028
.word 0xBF000000, 0x0046325A
.word 0xBF000000, 0x00465A64
.word 0xBF000000, 0x00146E78
.word 0xBF000000, 0x00140A6E
.word 0xBF000000, 0x00828C96
.word 0x04F00100, bowser_2_seg7_vertices_07000900
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E0A00
.word 0xBF000000, 0x001E280A
.word 0xBF000000, 0x0032281E
.word 0xBF000000, 0x00323C28
.word 0xBF000000, 0x00463C32
.word 0xBF000000, 0x0046503C
.word 0xBF000000, 0x005A646E
.word 0xBF000000, 0x00647882
.word 0xBF000000, 0x00788C96
.word 0x049000A0, bowser_2_seg7_vertices_07000A00
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x000A1E28
.word 0xBF000000, 0x00323C46
.word 0xBF000000, 0x003C505A
.word 0xB8000000, 0x00000000

bowser_2_seg7_dl_07000E28: # 0x07000E28
.word 0xFD100000, lll_texture_09003000
.word 0xE6000000, 0x00000000
.word 0xF3000000, 0x073FF100
.word 0x04F00100, bowser_2_seg7_vertices_07000AA0
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E2832
.word 0xBF000000, 0x003C461E
.word 0xBF000000, 0x001E4628
.word 0xBF000000, 0x003C5046
.word 0xBF000000, 0x0032285A
.word 0xBF000000, 0x00325A64
.word 0xBF000000, 0x006E503C
.word 0xBF000000, 0x006E7850
.word 0xBF000000, 0x006E828C
.word 0xBF000000, 0x006E8C78
.word 0xBF000000, 0x00645A96
.word 0xBF000000, 0x00140A8C
.word 0xBF000000, 0x0000960A
.word 0xBF000000, 0x00148C82
.word 0xBF000000, 0x00649600
.word 0xB8000000, 0x00000000

bowser_2_seg7_dl_07000ED0: # 0x07000ED0
.word 0xFD100000, lll_texture_09005800
.word 0xE6000000, 0x00000000
.word 0xF3000000, 0x073FF100
.word 0x04800090, bowser_2_seg7_vertices_07000BA0
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x000A1E14
.word 0xBF000000, 0x001E2814
.word 0xBF000000, 0x00320014
.word 0xBF000000, 0x003C4614
.word 0xBF000000, 0x00283C14
.word 0xBF000000, 0x00503214
.word 0xBF000000, 0x00465014
.word 0xB8000000, 0x00000000

bowser_2_seg7_dl_07000F38: # 0x07000F38
.word 0xFD100000, lll_texture_09005000
.word 0xE6000000, 0x00000000
.word 0xF3000000, 0x073FF100
.word 0x04F00100, bowser_2_seg7_vertices_07000C30
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E2832
.word 0xBF000000, 0x0032283C
.word 0xBF000000, 0x00323C46
.word 0xBF000000, 0x001E5028
.word 0xBF000000, 0x00463C5A
.word 0xBF000000, 0x00465A64
.word 0xBF000000, 0x0000501E
.word 0xBF000000, 0x00006E50
.word 0xBF000000, 0x00788214
.word 0xBF000000, 0x008C8278
.word 0xBF000000, 0x0078140A
.word 0xBF000000, 0x0000146E
.word 0xBF000000, 0x00645A96
.word 0xBF000000, 0x008C9682
.word 0xBF000000, 0x0064968C
.word 0xB8000000, 0x00000000

glabel bowser_2_seg7_dl_07000FE0 # 0x07000FE0
.word 0xE7000000, 0x00000000
.word 0xBA001402, 0x00100000
.word 0xB900031D, 0xC8112078
.word 0xB9000201, 0x00000000
.word 0xF8000000, 0xC83200FF
.word 0xBC000008, 0x0C80F480
.word 0xB7000000, 0x00010000
.word 0xFC127FFF, 0xFFFFF838
.word 0xB6000000, 0x00020000
.word 0xF5100000, 0x07000000
.word 0xBB000001, 0xFFFFFFFF
.word 0xE8000000, 0x00000000
.word 0xF5101000, 0x00014050
.word 0xF2000000, 0x0007C07C
.word 0x06000000, bowser_2_seg7_dl_07000D30
.word 0x06000000, bowser_2_seg7_dl_07000E28
.word 0x06000000, bowser_2_seg7_dl_07000ED0
.word 0x06000000, bowser_2_seg7_dl_07000F38
.word 0xBB000000, 0xFFFFFFFF
.word 0xE7000000, 0x00000000
.word 0xBA001402, 0x00000000
.word 0xB900031D, 0x00442078
.word 0xB6000000, 0x00010000
.word 0xFCFFFFFF, 0xFFFE793C
.word 0xB7000000, 0x00020000
.word 0xB8000000, 0x00000000

bowser_2_seg7_vertices_070010B0: # 0x070010B0
vertex   6546,   -511,   2618,   4910,    248,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6480,  -3071,  -2776,   8112,    772,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6480,   -511,  -2776,   8100,    232,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6545,   -511,  -2617,  17484,    232,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6545,  -3071,  -2617,  17472,    772,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6479,  -3071,   2777,  20664,    790,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6479,   -511,   2777,  20676,    248,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2776,   -511,  -6479,  14348,    220,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2617,  -3071,   6546,  23924,    800,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2617,   -511,   6546,  23930,    260,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2776,  -3071,  -6479,  14342,    762,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2618,   -511,  -6545,  11236,    220,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2618,  -3071,  -6545,  11240,    762,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2776,   -511,  -6479,    782,   1298,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2777,   -511,   6480,  -1526,  -4090,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6546,   -511,   2618,  -3092,  -2484,  0xFF, 0xFF, 0xFF, 0xFF

bowser_2_seg7_vertices_070011B0: # 0x070011B0
vertex   6546,   -511,   2618,   4910,    248,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6546,  -3071,   2618,   4924,    788,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6480,  -3071,  -2776,   8112,    772,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2777,   -511,   6480,   1658,    260,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2777,  -3071,   6480,   1664,    800,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2617,   -511,   6546,  23930,    260,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2617,  -3071,   6546,  23924,    800,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2777,  -3071,   6480,  27214,    800,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2777,   -511,   6480,  27208,    260,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2776,   -511,  -6479,    782,   1298,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6545,   -511,  -2617,   2350,   -306,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6479,   -511,   2777,   2322,  -2550,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2617,   -511,   6546,    716,  -4116,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2777,   -511,   6480,  -1526,  -4090,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6546,   -511,   2618,  -3092,  -2484,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6480,   -511,  -2776,  -3066,   -240,  0xFF, 0xFF, 0xFF, 0xFF

bowser_2_seg7_vertices_070012B0: # 0x070012B0
vertex  -2776,   -511,  -6479,    782,   1298,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6480,   -511,  -2776,  -3066,   -240,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2618,   -511,  -6545,  -1460,   1326,  0xFF, 0xFF, 0xFF, 0xFF

bowser_2_seg7_vertices_070012E0: # 0x070012E0
vertex  -3512,   -511,   -889,   -356,    984,  0xFD, 0x42, 0x34, 0xFF
vertex  -3159,   -511,   -886,   -360,    440,  0xFD, 0x42, 0x34, 0xFF
vertex  -3323,    399,  -1105,    -26,    692,  0xFD, 0x42, 0x34, 0xFF
vertex   1240,   -511,  -5279,   -356,    984,  0xFD, 0x42, 0x34, 0xFF
vertex   1593,   -511,  -5276,   -360,    440,  0xFD, 0x42, 0x34, 0xFF
vertex   1429,    399,  -5496,    -26,    692,  0xFD, 0x42, 0x34, 0xFF
vertex   1152,   -511,  -5616,    160,   1116,  0xFD, 0x42, 0x34, 0xFF
vertex   1732,   -511,  -5615,    158,    228,  0xFD, 0x42, 0x34, 0xFF
vertex   1344,   -511,  -5811,    458,    824,  0xFD, 0x42, 0x34, 0xFF
vertex  -3407,   -511,   3474,    458,    824,  0xFD, 0x42, 0x34, 0xFF
vertex  -3600,   -511,   3669,    160,   1116,  0xFD, 0x42, 0x34, 0xFF
vertex  -3322,    399,   3790,    -26,    692,  0xFD, 0x42, 0x34, 0xFF
vertex  -3511,   -511,   4006,   -356,    984,  0xFD, 0x42, 0x34, 0xFF
vertex  -3158,   -511,   4009,   -360,    440,  0xFD, 0x42, 0x34, 0xFF
vertex  -3019,   -511,   3670,    158,    228,  0xFD, 0x42, 0x34, 0xFF
vertex  -3021,   -511,  -1224,    158,    228,  0xFD, 0x42, 0x34, 0xFF

bowser_2_seg7_vertices_070013E0: # 0x070013E0
vertex  -3021,   -511,  -1224,    158,    228,  0xFD, 0x42, 0x34, 0xFF
vertex  -3408,   -511,  -1420,    458,    824,  0xFD, 0x42, 0x34, 0xFF
vertex  -3323,    399,  -1105,    -26,    692,  0xFD, 0x42, 0x34, 0xFF
vertex  -3601,   -511,  -1226,    160,   1116,  0xFD, 0x42, 0x34, 0xFF
vertex  -3512,   -511,   -889,   -356,    984,  0xFD, 0x42, 0x34, 0xFF
vertex   4200,   -511,   -835,    160,   1116,  0xFD, 0x42, 0x34, 0xFF
vertex   4288,   -511,   -498,   -356,    984,  0xFD, 0x42, 0x34, 0xFF
vertex   4478,    399,   -715,    -26,    692,  0xFD, 0x42, 0x34, 0xFF
vertex   4392,   -511,  -1030,    458,    824,  0xFD, 0x42, 0x34, 0xFF
vertex   4642,   -511,   -495,   -360,    440,  0xFD, 0x42, 0x34, 0xFF
vertex   4780,   -511,   -834,    158,    228,  0xFD, 0x42, 0x34, 0xFF
vertex   2820,   -511,   2679,    160,   1116,  0xFD, 0x42, 0x34, 0xFF
vertex   2909,   -511,   3016,   -356,    984,  0xFD, 0x42, 0x34, 0xFF
vertex   3098,    399,   2799,    -26,    692,  0xFD, 0x42, 0x34, 0xFF
vertex   3262,   -511,   3019,   -360,    440,  0xFD, 0x42, 0x34, 0xFF
vertex   3400,   -511,   2680,    158,    228,  0xFD, 0x42, 0x34, 0xFF

bowser_2_seg7_vertices_070014E0: # 0x070014E0
vertex   3013,   -511,   2484,    458,    824,  0xFD, 0x42, 0x34, 0xFF
vertex   2820,   -511,   2679,    160,   1116,  0xFD, 0x42, 0x34, 0xFF
vertex   3098,    399,   2799,    -26,    692,  0xFD, 0x42, 0x34, 0xFF
vertex   3400,   -511,   2680,    158,    228,  0xFD, 0x42, 0x34, 0xFF
vertex   -130,   -511,  -4068,    762,    860,  0xFD, 0x42, 0x34, 0xFF
vertex   -426,   -511,  -3769,    464,    564,  0xFD, 0x42, 0x34, 0xFF
vertex      0,   1229,  -3583,    278,    990,  0xFD, 0x42, 0x34, 0xFF
vertex   -290,   -511,  -3250,    -52,    700,  0xFD, 0x42, 0x34, 0xFF
vertex    253,   -511,  -3245,    -56,   1242,  0xFD, 0x42, 0x34, 0xFF
vertex    465,   -511,  -3767,    462,   1454,  0xFD, 0x42, 0x34, 0xFF
vertex   -126,   -511,   3113,    324,    450,  0xFD, 0x42, 0x34, 0xFF
vertex   -422,   -511,   3412,    326,    748,  0xFD, 0x42, 0x34, 0xFF
vertex      4,   1229,   3598,    632,    628,  0xFD, 0x42, 0x34, 0xFF
vertex   -286,   -511,   3931,    652,    938,  0xFD, 0x42, 0x34, 0xFF
vertex    256,   -511,   3936,    926,    670,  0xFD, 0x42, 0x34, 0xFF
vertex    469,   -511,   3415,    772,    304,  0xFD, 0x42, 0x34, 0xFF

bowser_2_seg7_vertices_070015E0: # 0x070015E0
vertex   3453,   -511,   -484,    458,    824,  0xFD, 0x42, 0x34, 0xFF
vertex   3157,   -511,   -185,    160,   1116,  0xFD, 0x42, 0x34, 0xFF
vertex   3584,   1229,      0,    -26,    692,  0xFD, 0x42, 0x34, 0xFF
vertex   3293,   -511,    333,   -356,    984,  0xFD, 0x42, 0x34, 0xFF
vertex   3837,   -511,    338,   -360,    440,  0xFD, 0x42, 0x34, 0xFF
vertex   4049,   -511,   -183,    158,    228,  0xFD, 0x42, 0x34, 0xFF
vertex  -3714,   -511,   -484,   -516,    396,  0xFD, 0x42, 0x34, 0xFF
vertex  -4010,   -511,   -185,   -218,    692,  0xFD, 0x42, 0x34, 0xFF
vertex  -3583,   1229,      0,      0,    266,  0xFD, 0x42, 0x34, 0xFF
vertex  -3874,   -511,    333,    298,    556,  0xFD, 0x42, 0x34, 0xFF
vertex  -3118,   -511,   -183,   -216,   -198,  0xFD, 0x42, 0x34, 0xFF
vertex  -3330,   -511,    338,    302,     14,  0xFD, 0x42, 0x34, 0xFF

bowser_2_seg7_dl_070016A0: # 0x070016A0
.word 0xFD100000, bowser_2_seg7_texture_07000000
.word 0xE6000000, 0x00000000
.word 0xF3000000, 0x073FF100
.word 0x04F00100, bowser_2_seg7_vertices_070010B0
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E2832
.word 0xBF000000, 0x001E323C
.word 0xBF000000, 0x0046281E
.word 0xBF000000, 0x003C3250
.word 0xBF000000, 0x003C505A
.word 0xBF000000, 0x00466428
.word 0xBF000000, 0x006E6446
.word 0xBF000000, 0x006E7864
.word 0xBF000000, 0x0014786E
.word 0xBF000000, 0x00140A78
.word 0xBF000000, 0x00828C96
.word 0x04F00100, bowser_2_seg7_vertices_070011B0
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E0A00
.word 0xBF000000, 0x001E280A
.word 0xBF000000, 0x00323C46
.word 0xBF000000, 0x00324650
.word 0xBF000000, 0x005A646E
.word 0xBF000000, 0x005A6E78
.word 0xBF000000, 0x005A7882
.word 0xBF000000, 0x005A8C96
.word 0x04200030, bowser_2_seg7_vertices_070012B0
.word 0xBF000000, 0x00000A14
.word 0xB8000000, 0x00000000

bowser_2_seg7_dl_07001788: # 0x07001788
.word 0xFD100000, lll_texture_09005800
.word 0xE6000000, 0x00000000
.word 0xF3000000, 0x073FF100
.word 0x04F00100, bowser_2_seg7_vertices_070012E0
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E2832
.word 0xBF000000, 0x003C1E32
.word 0xBF000000, 0x00284632
.word 0xBF000000, 0x00465032
.word 0xBF000000, 0x00503C32
.word 0xBF000000, 0x005A646E
.word 0xBF000000, 0x0064786E
.word 0xBF000000, 0x0078826E
.word 0xBF000000, 0x008C5A6E
.word 0xBF000000, 0x00828C6E
.word 0xBF000000, 0x000A9614
.word 0x04F00100, bowser_2_seg7_vertices_070013E0
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x000A1E14
.word 0xBF000000, 0x001E2814
.word 0xBF000000, 0x00323C46
.word 0xBF000000, 0x00503246
.word 0xBF000000, 0x003C5A46
.word 0xBF000000, 0x005A6446
.word 0xBF000000, 0x00645046
.word 0xBF000000, 0x006E7882
.word 0xBF000000, 0x00788C82
.word 0xBF000000, 0x008C9682
.word 0x04F00100, bowser_2_seg7_vertices_070014E0
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x001E0014
.word 0xBF000000, 0x0028323C
.word 0xBF000000, 0x0032463C
.word 0xBF000000, 0x0046503C
.word 0xBF000000, 0x00505A3C
.word 0xBF000000, 0x005A283C
.word 0xBF000000, 0x00646E78
.word 0xBF000000, 0x006E8278
.word 0xBF000000, 0x00828C78
.word 0xBF000000, 0x00966478
.word 0xBF000000, 0x008C9678
.word 0x04B000C0, bowser_2_seg7_vertices_070015E0
.word 0xBF000000, 0x00000A14
.word 0xBF000000, 0x000A1E14
.word 0xBF000000, 0x001E2814
.word 0xBF000000, 0x00283214
.word 0xBF000000, 0x00320014
.word 0xBF000000, 0x003C4650
.word 0xBF000000, 0x00465A50
.word 0xBF000000, 0x00643C50
.word 0xBF000000, 0x006E6450
.word 0xBF000000, 0x005A6E50
.word 0xB8000000, 0x00000000

glabel bowser_2_seg7_dl_07001930 # 0x07001930
.word 0xE7000000, 0x00000000
.word 0xBA001402, 0x00100000
.word 0xB900031D, 0xC8112078
.word 0xB9000201, 0x00000000
.word 0xF8000000, 0xC83200FF
.word 0xBC000008, 0x0C80F480
.word 0xB7000000, 0x00010000
.word 0xFC127FFF, 0xFFFFF838
.word 0xB6000000, 0x00020000
.word 0xF5100000, 0x07000000
.word 0xBB000001, 0xFFFFFFFF
.word 0xE8000000, 0x00000000
.word 0xF5101000, 0x00014050
.word 0xF2000000, 0x0007C07C
.word 0x06000000, bowser_2_seg7_dl_070016A0
.word 0x06000000, bowser_2_seg7_dl_07001788
.word 0xBB000000, 0xFFFFFFFF
.word 0xE7000000, 0x00000000
.word 0xBA001402, 0x00000000
.word 0xB900031D, 0x00442078
.word 0xB6000000, 0x00010000
.word 0xFCFFFFFF, 0xFFFE793C
.word 0xB7000000, 0x00020000
.word 0xB8000000, 0x00000000

glabel bowser_2_seg7_collision # 0x070019F0
.incbin "bin/bifs_platform_segment7/bifs_platform_segment7.019F0.collision"

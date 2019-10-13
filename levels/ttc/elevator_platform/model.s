ttc_seg7_light_07011428: # 0x07011428 - 0x07011430
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttc_seg7_light_07011430: # 0x07011430 - 0x07011440
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttc_seg7_vertex_07011440: # 0x07011440 - 0x07011530
vertex    256,   -153,   -127,   3034,    990,  0x54, 0xD6, 0xAC, 0xFF
vertex    256,      0,    128,  -2074,      0,  0x54, 0x2A, 0x54, 0xFF
vertex    256,   -153,    128,  -2074,    990,  0x33, 0x99, 0x33, 0xFF
vertex    256,   -153,    128,      0,    990,  0x33, 0x99, 0x33, 0xFF
vertex   -255,   -153,    128,      0,    990,  0xAC, 0xD6, 0x54, 0xFF
vertex   -255,   -153,   -127,   4056,    990,  0xCD, 0x99, 0xCD, 0xFF
vertex    256,   -153,   -127,   4056,    990,  0x54, 0xD6, 0xAC, 0xFF
vertex    256,      0,    128,   6100,      0,  0x54, 0x2A, 0x54, 0xFF
vertex   -255,   -153,    128,  -4118,    990,  0xAC, 0xD6, 0x54, 0xFF
vertex    256,   -153,    128,   6100,    990,  0x33, 0x99, 0x33, 0xFF
vertex   -255,      0,    128,  -4118,      0,  0xCD, 0x67, 0x33, 0xFF
vertex    256,   -153,   -127,  -5140,    990,  0x54, 0xD6, 0xAC, 0xFF
vertex   -255,   -153,   -127,   5078,    990,  0xCD, 0x99, 0xCD, 0xFF
vertex   -255,      0,   -127,   5078,      0,  0xAC, 0x2A, 0xAC, 0xFF
vertex    256,      0,   -127,  -5140,      0,  0x33, 0x67, 0xCD, 0xFF

ttc_seg7_vertex_07011530: # 0x07011530 - 0x070115A0
vertex   -255,   -153,    128,   3034,    990,  0xAC, 0xD6, 0x54, 0xFF
vertex   -255,      0,    128,   3034,      0,  0xCD, 0x67, 0x33, 0xFF
vertex   -255,      0,   -127,  -2074,      0,  0xAC, 0x2A, 0xAC, 0xFF
vertex    256,   -153,   -127,   3034,    990,  0x54, 0xD6, 0xAC, 0xFF
vertex    256,      0,   -127,   3034,      0,  0x33, 0x67, 0xCD, 0xFF
vertex    256,      0,    128,  -2074,      0,  0x54, 0x2A, 0x54, 0xFF
vertex   -255,   -153,   -127,  -2074,    990,  0xCD, 0x99, 0xCD, 0xFF

ttc_seg7_vertex_070115A0: # 0x070115A0 - 0x070115E0
vertex    256,      0,   -127,    990,      0,  0x33, 0x67, 0xCD, 0xFF
vertex   -255,      0,    128,      0,    990,  0xCD, 0x67, 0x33, 0xFF
vertex    256,      0,    128,    990,    990,  0x54, 0x2A, 0x54, 0xFF
vertex   -255,      0,   -127,      0,      0,  0xAC, 0x2A, 0xAC, 0xFF

ttc_seg7_dl_070115E0: # 0x070115E0 - 0x07011670
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttc_seg7_light_07011430, 1
gsSPLight ttc_seg7_light_07011428, 2
gsSPVertex ttc_seg7_vertex_07011440, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex ttc_seg7_vertex_07011530, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  2,  6, 0x0
gsSPEndDisplayList

ttc_seg7_dl_07011670: # 0x07011670 - 0x070116A8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ttc_seg7_vertex_070115A0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel ttc_seg7_dl_070116A8 # 0x070116A8 - 0x07011758
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 200, 255, 255, 255
gsSPFogPosition 900, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture 0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC
gsSPDisplayList ttc_seg7_dl_070115E0
gsSPDisplayList ttc_seg7_dl_07011670
gsSPTexture 0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

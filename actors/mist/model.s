# Mist

mist_seg3_vertex_03000000: # 0x03000000
vertex    -25,    -25,      0,      0,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex     25,    -25,      0,    992,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex     25,     25,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,     25,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

mist_seg3_vertex_03000040: # 0x03000040
vertex    -25,    -25,      0,      0,    992,  0x22, 0x1A, 0x1C, 0xFF
vertex     25,    -25,      0,    992,    992,  0x22, 0x1A, 0x1C, 0xFF
vertex     25,     25,      0,    992,      0,  0x22, 0x1A, 0x1C, 0xFF
vertex    -25,     25,      0,      0,      0,  0x22, 0x1A, 0x1C, 0xFF

mist_seg3_texture_03000080: # 0x03000080
.incbin "actors/mist/mist.ia16"

glabel mist_seg3_dl_03000880 # 0x03000880 - 0x03000920
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPLoadTextureBlock mist_seg3_texture_03000080, G_IM_FMT_IA, G_IM_SIZ_16b, 32, 32, 0, G_TX_CLAMP, G_TX_CLAMP, 5, 5, G_TX_NOLOD, G_TX_NOLOD
gsSPTexture 0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON
gsSPVertex mist_seg3_vertex_03000000, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture 0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList

glabel mist_seg3_dl_03000920 # 0x03000920 - 0x030009C0
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPLoadTextureBlock mist_seg3_texture_03000080, G_IM_FMT_IA, G_IM_SIZ_16b, 32, 32, 0, G_TX_CLAMP, G_TX_CLAMP, 5, 5, G_TX_NOLOD, G_TX_NOLOD
gsSPTexture 0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON
gsSPVertex mist_seg3_vertex_03000040, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture 0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList

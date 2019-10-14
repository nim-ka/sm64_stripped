// Impact Ring

// 0x0601C9D0
static const Vtx impact_ring_seg6_vertex_0601C9D0[] = {
    {{{     0,      0,     -5}, 0, {   992,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{    -5,      0,      5}, 0, {     0,   2016}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,      0,      5}, 0, {   992,   2016}, {0xff, 0xff, 0xff, 0xff}}},
    {{{    -5,      0,     -5}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
};

// 0x0601CA10
static const Vtx impact_ring_seg6_vertex_0601CA10[] = {
    {{{     5,      0,     -5}, 0, {   992,      0}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,      0,      5}, 0, {     0,   2016}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     5,      0,      5}, 0, {   992,   2016}, {0xff, 0xff, 0xff, 0xff}}},
    {{{     0,      0,     -5}, 0, {     0,      0}, {0xff, 0xff, 0xff, 0xff}}},
};

// 0x0601CA50
static const u8 impact_ring_seg6_texture_0601CA50[] = {
#include "actors/impact_ring/impact_ring_left_side.ia16.inc.c"
};

// 0x0601DA50
static const u8 impact_ring_seg6_texture_0601DA50[] = {
#include "actors/impact_ring/impact_ring_right_side.ia16.inc.c"
};

// 0x0601EA50 - 0x0601EA88
const Gfx impact_ring_seg6_dl_0601EA50[] = {
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_ring_seg6_texture_0601CA50),
    gsDPLoadSync(),
    gsDPLoadBlock(7, 0, 0, 0x7FF, 0x100),
    gsSPVertex(impact_ring_seg6_vertex_0601C9D0, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPEndDisplayList(),
};

// 0x0601EA88 - 0x0601EAC0
const Gfx impact_ring_seg6_dl_0601EA88[] = {
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_ring_seg6_texture_0601DA50),
    gsDPLoadSync(),
    gsDPLoadBlock(7, 0, 0, 0x7FF, 0x100),
    gsSPVertex(impact_ring_seg6_vertex_0601CA10, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPEndDisplayList(),
};

// 0x0601EAC0 - 0x0601EB40
const Gfx impact_ring_seg6_dl_0601EAC0[] = {
    gsDPPipeSync(),
    gsDPSetCombineLERP1Cycle(TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(impact_ring_seg6_dl_0601EA50),
    gsSPDisplayList(impact_ring_seg6_dl_0601EA88),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineLERP1Cycle(0, 0, 0, SHADE, 0, 0, 0, SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsSPEndDisplayList(),
};


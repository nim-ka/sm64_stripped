// Blue Coin Switch

// 0x08000000
static const Ambient blue_coin_switch_seg8_light_08000000 = {
    {{0x7f, 0x7f, 0x7f}, 0, {0x7f, 0x7f, 0x7f}, 0}
};

// 0x08000008
static const Light blue_coin_switch_seg8_light_08000008 = {
    {{0xff, 0xff, 0xff}, 0, {0xff, 0xff, 0xff}, 0, {0x28, 0x28, 0x28}, 0}
};

// 0x08000018
static const u8 blue_coin_switch_seg8_texture_08000018[] = {
#include "actors/blue_coin_switch/blue_coin_switch_side.rgba16.inc.c"
};

// 0x08000418
static const u8 blue_coin_switch_seg8_texture_08000418[] = {
#include "actors/blue_coin_switch/blue_coin_switch_top.rgba16.inc.c"
};

// 0x08000C18
static const Vtx blue_coin_switch_seg8_vertex_08000C18[] = {
    {{{    26,      0,     26}, 0, {   990,    479}, {0x00, 0x00, 0x7f, 0xff}}},
    {{{    26,     26,     26}, 0, {   990,      0}, {0x00, 0x00, 0x7f, 0xff}}},
    {{{   -25,     26,     26}, 0, {     0,      0}, {0x00, 0x00, 0x7f, 0xff}}},
    {{{   -25,      0,     26}, 0, {     0,    479}, {0x00, 0x00, 0x7f, 0xff}}},
    {{{   -25,      0,    -25}, 0, {   990,    479}, {0x00, 0x00, 0x81, 0xff}}},
    {{{    26,     26,    -25}, 0, {     0,      0}, {0x00, 0x00, 0x81, 0xff}}},
    {{{    26,      0,    -25}, 0, {     0,    479}, {0x00, 0x00, 0x81, 0xff}}},
    {{{   -25,     26,    -25}, 0, {   990,      0}, {0x00, 0x00, 0x81, 0xff}}},
    {{{   -25,      0,     26}, 0, {   990,    479}, {0x81, 0x00, 0x00, 0xff}}},
    {{{   -25,     26,    -25}, 0, {     0,      0}, {0x81, 0x00, 0x00, 0xff}}},
    {{{   -25,      0,    -25}, 0, {     0,    479}, {0x81, 0x00, 0x00, 0xff}}},
    {{{   -25,     26,     26}, 0, {   990,      0}, {0x81, 0x00, 0x00, 0xff}}},
    {{{    26,      0,    -25}, 0, {   990,    479}, {0x7f, 0x00, 0x00, 0xff}}},
    {{{    26,     26,    -25}, 0, {   990,      0}, {0x7f, 0x00, 0x00, 0xff}}},
    {{{    26,     26,     26}, 0, {     0,      0}, {0x7f, 0x00, 0x00, 0xff}}},
    {{{    26,      0,     26}, 0, {     0,    479}, {0x7f, 0x00, 0x00, 0xff}}},
};

// 0x08000D18
static const Vtx blue_coin_switch_seg8_vertex_08000D18[] = {
    {{{    26,     26,    -25}, 0, {   990,      0}, {0x00, 0x7f, 0x00, 0xff}}},
    {{{   -25,     26,     26}, 0, {     0,    990}, {0x00, 0x7f, 0x00, 0xff}}},
    {{{    26,     26,     26}, 0, {   990,    990}, {0x00, 0x7f, 0x00, 0xff}}},
    {{{   -25,     26,    -25}, 0, {     0,      0}, {0x00, 0x7f, 0x00, 0xff}}},
};

// 0x08000D58 - 0x08000DD0
const Gfx blue_coin_switch_seg8_dl_08000D58[] = {
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, blue_coin_switch_seg8_texture_08000018),
    gsDPLoadSync(),
    gsDPLoadBlock(7, 0, 0, 0x1FF, 0x100),
    gsSPLight(&blue_coin_switch_seg8_light_08000008, 1),
    gsSPLight(&blue_coin_switch_seg8_light_08000000, 2),
    gsSPVertex(blue_coin_switch_seg8_vertex_08000C18, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPEndDisplayList(),
};

// 0x08000DD0 - 0x08000E08
const Gfx blue_coin_switch_seg8_dl_08000DD0[] = {
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, blue_coin_switch_seg8_texture_08000418),
    gsDPLoadSync(),
    gsDPLoadBlock(7, 0, 0, 0x3FF, 0x100),
    gsSPVertex(blue_coin_switch_seg8_vertex_08000D18, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPEndDisplayList(),
};

// 0x08000E08 - 0x08000E98
const Gfx blue_coin_switch_seg8_dl_08000E08[] = {
    gsDPPipeSync(),
    gsDPSetCombineLERP1Cycle(TEXEL0, 0, SHADE, 0, 0, 0, 0, SHADE),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 4, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (16 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(blue_coin_switch_seg8_dl_08000D58),
    gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(blue_coin_switch_seg8_dl_08000DD0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineLERP1Cycle(0, 0, 0, SHADE, 0, 0, 0, SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
};


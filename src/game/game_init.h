#ifndef GAME_INIT_H
#define GAME_INIT_H

#include <PR/ultratypes.h>
#include <PR/gbi.h>
#include <PR/os_cont.h>
#include <PR/os_message.h>

#include "types.h"

#define GFX_POOL_SIZE 6400

struct GfxPool {
    Gfx buffer[GFX_POOL_SIZE];
    struct SPTask spTask;
};

extern struct Controller gControllers[3];
extern OSContStatus gControllerStatuses[4];
extern OSContPad gControllerPads[4];
extern OSMesgQueue gGameVblankQueue;
extern OSMesgQueue D_80339CB8;
extern OSMesg D_80339CD0;
extern OSMesg D_80339CD4;
extern struct VblankHandler gGameVblankHandler;
extern uintptr_t gPhysicalFrameBuffers[3];
extern uintptr_t gPhysicalZBuffer;
extern void *D_80339CF0;
extern void *D_80339CF4;
extern struct SPTask *gGfxSPTask;
extern Gfx *gDisplayListHead;
extern u8 *gGfxPoolEnd;
extern struct GfxPool *gGfxPool;
extern u8 gControllerBits;
extern s8 gEepromProbe;

extern void (*D_8032C6A0)(void);
extern struct Controller *gPlayer1Controller;
extern struct Controller *gPlayer2Controller;
extern struct Controller *gPlayer3Controller;

extern u16 frameBufferIndex;
extern u32 gGlobalTimer;

void setup_game_memory(void);
void thread5_game_loop(UNUSED void *arg);
void clear_frame_buffer(s32 color);
void clear_viewport(Vp *viewport, s32 color);
void make_viewport_clip_rect(Vp *viewport);
void init_render_image(void);
void end_master_display_list(void);
void rendering_init(void);
void config_gfx_pool(void);
void display_and_vsync(void);

#endif // GAME_INIT_H

#ifndef BUFFERS_H
#define BUFFERS_H

#include <PR/ultratypes.h>

#include "game/game_init.h"

extern u8 gDecompressionHeap[];

extern u8 gAudioHeap[];

extern u8 gAudioSPTaskYieldBuffer[];

extern u8 gIdleThreadStack[];
extern u8 gThread3Stack[];
extern u8 gThread4Stack[];
extern u8 gThread5Stack[];

extern u8 gGfxSPTaskYieldBuffer[];

extern u8 gGfxSPTaskStack[];

extern struct GfxPool gGfxPools[2];

#endif // BUFFERS_H

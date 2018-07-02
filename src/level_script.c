#include <ultra64.h>

#include "sm64.h"
#include "audio_interface_2.h"
#include "display.h"
#include "game.h"
#include "geo_layout.h"
#include "level_script.h"
#include "mario.h"
#include "math_util.h"
#include "memory.h"
#include "object_helpers.h"
#include "object_list_processor.h"
#include "area.h"
#include "save_file.h"
#include "sound_init.h"
#include "surface_collision.h"
#include "surface_load.h"
#include "press_start_head_6.h"
#include "profiler.h"


#define CMD_GET(type, offset) (*(type *) (offset + (u8 *) sCurrentCmd))

// These are equal
#define CMD_NEXT ((struct LevelCommand *) ((u8 *) sCurrentCmd + sCurrentCmd->size))
#define NEXT_CMD ((struct LevelCommand *) (sCurrentCmd->size + (u8 *) sCurrentCmd))


struct LevelCommand
{
    /*00*/ u8 type;
    /*01*/ u8 size;
    /*02*/ // variable sized argument data
};

enum ScriptStatus
{
    SCRIPT_RUNNING = 1,
    SCRIPT_PAUSED = 0,
    SCRIPT_PAUSED2 = -1
};


static u32 sStack[32];

static struct AllocOnlyPool *sLevelPool = NULL;

static u16 sDelayFrames = 0;
static u16 sDelayFrames2 = 0;

static s16 sCurrAreaIndex = -1;

static u32 *sStackTop = sStack;
static u32 *sStackBase = NULL;

static s16 sScriptStatus;
static s32 sRegister;
static struct LevelCommand *sCurrentCmd;


static s32 eval_script_op(s8 op, s32 arg)
{
    s32 result = 0;

    switch (op)
    {
    case 0: result = sRegister & arg; break;
    case 1: result = !(sRegister & arg); break;
    case 2: result = sRegister == arg; break;
    case 3: result = sRegister != arg; break;
    case 4: result = sRegister < arg; break;
    case 5: result = sRegister <= arg; break;
    case 6: result = sRegister > arg; break;
    case 7: result = sRegister >= arg; break;
    }

    return result;
}

static void level_cmd_load_and_execute(void)
{
    main_pool_push_state();
    load_segment(CMD_GET(s16, 2), CMD_GET(void *, 4), CMD_GET(void *, 8), MEMORY_POOL_LEFT);

    *sStackTop++ = (u32) NEXT_CMD;
    *sStackTop++ = (u32) sStackBase;
    sStackBase = sStackTop;

    sCurrentCmd = segmented_to_virtual(CMD_GET(void *, 12));
}

static void level_cmd_exit_and_execute(void)
{
    void *targetAddr = CMD_GET(void *, 12);

    main_pool_pop_state();
    main_pool_push_state();

    load_segment(CMD_GET(s16, 2), CMD_GET(void *, 4), CMD_GET(void *, 8), MEMORY_POOL_LEFT);

    sStackTop = sStackBase;
    sCurrentCmd = (struct LevelCommand *) segmented_to_virtual(targetAddr);
}

static void level_cmd_exit(void)
{
    main_pool_pop_state();

    sStackTop = sStackBase;
    sStackBase = (u32 *) *(--sStackTop);
    sCurrentCmd = (struct LevelCommand *) *(--sStackTop);
}

static void level_cmd_sleep(void)
{
    sScriptStatus = SCRIPT_PAUSED;

    if (sDelayFrames == 0)
    {
        sDelayFrames = CMD_GET(s16, 2);
    }
    else if (--sDelayFrames == 0)
    {
        sCurrentCmd = CMD_NEXT;
        sScriptStatus = SCRIPT_RUNNING;
    }
}

static void level_cmd_sleep2(void)
{
    sScriptStatus = SCRIPT_PAUSED2;

    if (sDelayFrames2 == 0)
    {
        sDelayFrames2 = CMD_GET(s16, 2);
    }
    else if (--sDelayFrames2 == 0)
    {
        sCurrentCmd = CMD_NEXT;
        sScriptStatus = SCRIPT_RUNNING;
    }
}

static void level_cmd_jump(void)
{
    sCurrentCmd = (struct LevelCommand *) segmented_to_virtual(CMD_GET(void *, 4));
}

static void level_cmd_jump_and_link(void)
{
    *sStackTop++ = (u32) NEXT_CMD;
    sCurrentCmd = (struct LevelCommand *) segmented_to_virtual(CMD_GET(void *, 4));
}

static void level_cmd_return(void)
{
    sCurrentCmd = (struct LevelCommand *) *(--sStackTop);
}

static void level_cmd_jump_and_link_push_arg(void)
{
    *sStackTop++ = (u32) NEXT_CMD;
    *sStackTop++ = CMD_GET(s16, 2);
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_jump_repeat(void)
{
    s32 val = *(sStackTop - 1);

    if (val == 0)
    {
        sCurrentCmd = (struct LevelCommand *) *(sStackTop - 2);
    }
    else if (--val != 0)
    {
        *(sStackTop - 1) = val;
        sCurrentCmd = (struct LevelCommand *) *(sStackTop - 2);
    }
    else
    {
        sCurrentCmd = CMD_NEXT;
        sStackTop -= 2;
    }
}

static void level_cmd_loop_begin(void)
{
    *sStackTop++ = (u32) NEXT_CMD;
    *sStackTop++ = 0;
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_loop_until(void)
{
    if (eval_script_op(CMD_GET(u8, 2), CMD_GET(s32, 4)) != 0)
    {
        sCurrentCmd = CMD_NEXT;
        sStackTop -= 2;
    }
    else
    {
        sCurrentCmd = (struct LevelCommand *) *(sStackTop - 2);
    }
}

static void level_cmd_jump_if(void)
{
    if (eval_script_op(CMD_GET(u8, 2), CMD_GET(s32, 4)) != 0)
    {
        sCurrentCmd = (struct LevelCommand *) segmented_to_virtual(CMD_GET(void *, 8));
    }
    else
    {
        sCurrentCmd = CMD_NEXT;
    }
}

static void level_cmd_jump_and_link_if(void)
{
    if (eval_script_op(CMD_GET(u8, 2), CMD_GET(s32, 4)) != 0)
    {
        *sStackTop++ = (u32) NEXT_CMD;
        sCurrentCmd = (struct LevelCommand *) segmented_to_virtual(CMD_GET(void *, 8));
    }
    else
    {
        sCurrentCmd = CMD_NEXT;
    }
}

static void level_cmd_skip_if(void)
{
    if (eval_script_op(CMD_GET(u8, 2), CMD_GET(s32, 4)) == 0)
    {
        do
        {
            sCurrentCmd = CMD_NEXT;
        }
        while (sCurrentCmd->type == 0x0F || sCurrentCmd->type == 0x10);
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_skip(void)
{
    do
    {
        sCurrentCmd = CMD_NEXT;
    }
    while (sCurrentCmd->type == 0x10);

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_skippable_nop(void)
{
    sCurrentCmd = CMD_NEXT;
}

// Converting data pointer to function pointer
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"

static void level_cmd_call(void)
{
    s32 (*func)(s16, s32) = CMD_GET(void *, 4);
    sRegister = func(CMD_GET(s16, 2), sRegister);
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_call_loop(void)
{
    s32 (*func)(s16, s32) = CMD_GET(void *, 4);
    sRegister = func(CMD_GET(s16, 2), sRegister);

    if (sRegister == 0)
    {
        sScriptStatus = SCRIPT_PAUSED;
    }
    else
    {
        sScriptStatus = SCRIPT_RUNNING;
        sCurrentCmd = CMD_NEXT;
    }
}

#pragma GCC diagnostic pop

static void level_cmd_set_register(void)
{
    sRegister = CMD_GET(s16, 2);
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_push_pool_state(void)
{
    main_pool_push_state();
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_pop_pool_state(void)
{
    main_pool_pop_state();
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_load_to_fixed_address(void)
{
    load_to_fixed_pool_addr(CMD_GET(void *, 4), CMD_GET(void *, 8), CMD_GET(void *, 12));
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_load_segment(void)
{
    load_segment(CMD_GET(s16, 2), CMD_GET(void *, 4), CMD_GET(void *, 8), MEMORY_POOL_LEFT);
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_load_compressed_segment(void)
{
    load_segment_decompress(CMD_GET(s16, 2), CMD_GET(void *, 4), CMD_GET(void *, 8));
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_19(void)
{
    // TODO: Fix these hardcoded sizes
    void *addr = main_pool_alloc(0xE1000, MEMORY_POOL_LEFT);
    if (addr != NULL)
    {
        gdm_init(addr, 0xE1000);
        func_8019C2D8(D_80000400, 0x25800);
        func_8019C2D8(gFrameBuffer0, 0x70800);
        gdm_setup();
        gdm_maketestdl(CMD_GET(s16, 2));
    }
    else
    {
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_1A(void)
{
    func_80278304(CMD_GET(s16, 2), CMD_GET(void *, 4), CMD_GET(void *, 8));
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_init_level(void)
{
    init_graph_node_start(NULL, (struct GraphNodeStart *) &D_8038BD88);
    func_8029CA60();
    clear_areas();
    main_pool_push_state();

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_clear_level(void)
{
    func_8029CA60();
    func_8027A7C4();
    clear_areas();
    main_pool_pop_state();

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_alloc_level_pool(void)
{
    if (sLevelPool == NULL)
    {
        sLevelPool = alloc_only_pool_init(
            main_pool_available() - sizeof(struct AllocOnlyPool), MEMORY_POOL_LEFT);
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_free_level_pool(void)
{
    s32 i;

    alloc_only_pool_resize(sLevelPool, sLevelPool->usedSpace);
    sLevelPool = NULL;

    for (i = 0; i < 8; i++)
    {
        if (gAreaData[i].terrainData != NULL)
        {
            alloc_surface_pools();
            break;
        }
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_begin_area(void)
{
    u8 areaIndex = CMD_GET(u8, 2);
    void *geoLayoutAddr = CMD_GET(void *, 4);

    if (areaIndex < 8)
    {
        struct GraphNodeScreenArea *screenArea =
            (struct GraphNodeScreenArea *) process_geo_layout(sLevelPool, geoLayoutAddr);
        struct GraphNode114 *node = (struct GraphNode114 *) *screenArea->unk20;

        sCurrAreaIndex = areaIndex;
        screenArea->unk14 = areaIndex;
        gAreas[areaIndex].unk04 = (struct GraphNode *) screenArea;

        if (node != NULL)
            gAreas[areaIndex].unk24 = (struct Struct80280550 *) node->unk18;
        else
            gAreas[areaIndex].unk24 = NULL;
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_end_area(void)
{
    sCurrAreaIndex = -1;
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_21(void)
{
    s16 val1 = CMD_GET(s16, 2) & 0x0FFF;
    s16 val2 = CMD_GET(u16, 2) >> 12;
    void *val3 = CMD_GET(void *, 4);

    if (val1 < 256)
        gLoadedGraphNodes[val1] = (struct GraphNode *)init_graph_node_display_list(sLevelPool, 0, val2, val3);

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_22(void)
{
    s16 arg0 = CMD_GET(s16, 2);
    void *arg1 = CMD_GET(void *, 4);

    if (arg0 < 256)
        gLoadedGraphNodes[arg0] = process_geo_layout(sLevelPool, arg1);

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_23(void)
{
    union
    {
        s32 i;
        f32 f;
    } arg2;

    s16 arg0L = CMD_GET(s16, 2) & 0x0FFF;
    s16 arg0H = CMD_GET(u16, 2) >> 12;
    void *arg1 = CMD_GET(void *, 4);
    arg2.i = CMD_GET(s32, 8);

    if (arg0L < 256)
        // GraphNodeScaleOptionalDisplayList has a GraphNode at the top. This
        // is being stored to the array, so cast the pointer.
        gLoadedGraphNodes[arg0L] = (struct GraphNode *)init_graph_node_scale_optional_display_list(sLevelPool, 0, arg0H, arg1, arg2.f);

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_init_mario(void)
{
    vec3s_set(gMarioSpawnInfo->startPos, 0, 0, 0);
    vec3s_set(gMarioSpawnInfo->startAngle, 0, 0, 0);

    gMarioSpawnInfo->unk0D = -1;
    gMarioSpawnInfo->areaIndex = 0;
    gMarioSpawnInfo->behaviorArg = CMD_GET(u32, 4);
    gMarioSpawnInfo->behaviorScript = CMD_GET(void *, 8);
    gMarioSpawnInfo->unk18 = gLoadedGraphNodes[CMD_GET(u8, 3)];
    gMarioSpawnInfo->next = NULL;

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_place_object(void)
{
    u8 val7 = 1 << (D_8033A758 + 31);
    u16 val4;
    struct SpawnInfo *spawnInfo;

    if (sCurrAreaIndex != -1 && ((CMD_GET(u8, 2) & val7) || CMD_GET(u8, 2) == 0x1F))
    {
        val4 = CMD_GET(u8, 3);
        spawnInfo = alloc_only_pool_alloc(sLevelPool, sizeof(struct SpawnInfo));
        
        spawnInfo->startPos[0] = CMD_GET(s16, 4);
        spawnInfo->startPos[1] = CMD_GET(s16, 6);
        spawnInfo->startPos[2] = CMD_GET(s16, 8);
        
        spawnInfo->startAngle[0] = CMD_GET(s16, 10) * 0x8000 / 180;
        spawnInfo->startAngle[1] = CMD_GET(s16, 12) * 0x8000 / 180;
        spawnInfo->startAngle[2] = CMD_GET(s16, 14) * 0x8000 / 180;

        spawnInfo->areaIndex = sCurrAreaIndex;
        spawnInfo->unk0D = sCurrAreaIndex;

        spawnInfo->behaviorArg = CMD_GET(u32, 16);
        spawnInfo->behaviorScript = CMD_GET(void *, 20);
        spawnInfo->unk18 = gLoadedGraphNodes[val4];
        spawnInfo->next = gAreas[sCurrAreaIndex].objectSpawnInfos;
        
        gAreas[sCurrAreaIndex].objectSpawnInfos = spawnInfo;
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_create_warp_node(void)
{
    if (sCurrAreaIndex != -1)
    {
        struct ObjectWarpNode *warpNode = alloc_only_pool_alloc(sLevelPool, sizeof(struct ObjectWarpNode));
        
        warpNode->node.id = CMD_GET(u8, 2);
        warpNode->node.destLevel = CMD_GET(u8, 3) + CMD_GET(u8, 6);
        warpNode->node.destArea = CMD_GET(u8, 4);
        warpNode->node.destNode = CMD_GET(u8, 5);
        
        warpNode->object = NULL;

        warpNode->next = gAreas[sCurrAreaIndex].warpNodes;
        gAreas[sCurrAreaIndex].warpNodes = warpNode;
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_create_instant_warp(void)
{
    s32 i;
    struct InstantWarp *warp;

    if (sCurrAreaIndex != -1)
    {
        if (gAreas[sCurrAreaIndex].instantWarps == NULL)
        {
            gAreas[sCurrAreaIndex].instantWarps = alloc_only_pool_alloc(sLevelPool, 4 * sizeof(struct InstantWarp));
            
            for (i = 0; i < 4; i++)
                gAreas[sCurrAreaIndex].instantWarps[i].unk00 = 0;
        }

        warp = gAreas[sCurrAreaIndex].instantWarps + CMD_GET(u8, 2);
        
        warp[0].unk00 = 1;
        warp[0].area = CMD_GET(u8, 3);

        warp[0].displacement[0] = CMD_GET(s16, 4);
        warp[0].displacement[1] = CMD_GET(s16, 6);
        warp[0].displacement[2] = CMD_GET(s16, 8);
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_set_terrain_type(void)
{
    if (sCurrAreaIndex != -1)
        gAreas[sCurrAreaIndex].unk02 |= CMD_GET(s16, 2);

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_create_painting_warp_node(void)
{
    s32 i;
    struct WarpNode *node;

    if (sCurrAreaIndex != -1)
    {
        if (gAreas[sCurrAreaIndex].paintingWarpNodes == NULL)
        {
            gAreas[sCurrAreaIndex].paintingWarpNodes =
                alloc_only_pool_alloc(sLevelPool, 45 * sizeof(struct WarpNode));
            
            for (i = 0; i < 45; i++)
                gAreas[sCurrAreaIndex].paintingWarpNodes[i].id = 0;
        }

        node = &gAreas[sCurrAreaIndex].paintingWarpNodes[CMD_GET(u8, 2)];

        node->id = 1;
        node->destLevel = CMD_GET(u8, 3) + CMD_GET(u8, 6);
        node->destArea = CMD_GET(u8, 4);
        node->destNode = CMD_GET(u8, 5);
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_3A(void)
{
    struct UnknownArea28 *val4;

    if (sCurrAreaIndex != -1)
    {
        if ((val4 = gAreas[sCurrAreaIndex].unk28) == NULL)
            val4 = gAreas[sCurrAreaIndex].unk28 =
                alloc_only_pool_alloc(sLevelPool, sizeof(struct UnknownArea28));
        
        val4->unk00 = CMD_GET(s16, 2);
        val4->unk02 = CMD_GET(s16, 4);
        val4->unk04 = CMD_GET(s16, 6);
        val4->unk06 = CMD_GET(s16, 8);
        val4->unk08 = CMD_GET(s16, 10);
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_create_whirlpool(void)
{
    struct Whirlpool *whirlpool;
    s32 index = CMD_GET(u8, 2);
    s32 beatBowser2 = (save_file_get_flags() & (SAVE_FLAG_HAVE_KEY_2 | SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR)) != 0;
    
    if (CMD_GET(u8, 3) == 0 ||
        (CMD_GET(u8, 3) == 1 && !beatBowser2) ||
        (CMD_GET(u8, 3) == 2 && beatBowser2) ||
        (CMD_GET(u8, 3) == 3 && D_8033A758 >= 2))
    {
        if (sCurrAreaIndex != -1 && index < 2)
        {
            if ((whirlpool = gAreas[sCurrAreaIndex].whirlpools[index]) == NULL)
            {
                whirlpool = alloc_only_pool_alloc(sLevelPool, sizeof(struct Whirlpool));
                gAreas[sCurrAreaIndex].whirlpools[index] = whirlpool;
            }

            vec3s_set(whirlpool->pos, CMD_GET(s16, 4), CMD_GET(s16, 6), CMD_GET(s16, 8));
            whirlpool->strength = CMD_GET(s16, 10);
        }
    }

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_set_blackout(void)
{
    osViBlack(CMD_GET(u8, 2));
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_set_gamma(void)
{
    osViSetSpecialFeatures(CMD_GET(u8, 2) == 0 ? OS_VI_GAMMA_OFF : OS_VI_GAMMA_ON);
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_set_terrain_data(void)
{
    if (sCurrAreaIndex != -1)
        gAreas[sCurrAreaIndex].terrainData = segmented_to_virtual(CMD_GET(void *, 4));
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_set_rooms(void)
{
    if (sCurrAreaIndex != -1)
        gAreas[sCurrAreaIndex].surfaceRooms = segmented_to_virtual(CMD_GET(void *, 4));
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_39(void)
{
    if (sCurrAreaIndex != -1)
        gAreas[sCurrAreaIndex].unk10 = segmented_to_virtual(CMD_GET(void *, 4));
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_load_area(void)
{
    s16 areaIndex = CMD_GET(u8, 2);
    UNUSED void *unused = (u8 *) sCurrentCmd + 4;

    func_80320890();
    load_area(areaIndex);

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_2A(void)
{
    func_8027A998();
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_set_mario_start_pos(void)
{
    gMarioSpawnInfo->areaIndex = CMD_GET(u8, 2);

    vec3s_copy(gMarioSpawnInfo->startPos, CMD_GET(Vec3s, 6));
    vec3s_set(gMarioSpawnInfo->startAngle, 0, CMD_GET(s16, 4) * 0x8000 / 180, 0);

    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_2C(void)
{
    func_8027AA88();
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_2D(void)
{
    area_update_objects();
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_set_transition(void)
{
    if (gCurrentArea != NULL)
        func_8027ABF0(CMD_GET(u8, 2), CMD_GET(u8, 3), CMD_GET(u8, 4), CMD_GET(u8, 5), CMD_GET(u8, 6));
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_nop(void)
{
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_30(void)
{
    if (sCurrAreaIndex != -1)
    {
        if (CMD_GET(u8, 2) < 2)
            gAreas[sCurrAreaIndex].unk34[CMD_GET(u8, 2)] = CMD_GET(u8, 3);
    }
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_set_music(void)
{
    if (sCurrAreaIndex != -1)
    {
        gAreas[sCurrAreaIndex].unk36 = CMD_GET(s16, 2);
        gAreas[sCurrAreaIndex].unk38 = CMD_GET(s16, 4);
    }
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_set_menu_music(void)
{
    func_80249148(0, CMD_GET(s16, 2), 0);
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_38(void)
{
    func_802491FC(CMD_GET(s16, 2));
    sCurrentCmd = CMD_NEXT;
}

static void level_cmd_get_or_set_var(void)
{
    if (CMD_GET(u8, 2) == 0)
    {
        switch (CMD_GET(u8, 3))
        {
        case 0: gCurrSaveFileNum = sRegister; break;
        case 1: gCurrCourseNum   = sRegister; break;
        case 2: D_8033A758       = sRegister; break;
        case 3: gCurrLevelNum    = sRegister; break;
        case 4: gCurrAreaIndex   = sRegister; break;
        }
    }
    else
    {
        switch (CMD_GET(u8, 3))
        {
        case 0: sRegister = gCurrSaveFileNum; break;
        case 1: sRegister = gCurrCourseNum;   break;
        case 2: sRegister = D_8033A758;       break;
        case 3: sRegister = gCurrLevelNum;    break;
        case 4: sRegister = gCurrAreaIndex;   break;
        }
    }

    sCurrentCmd = CMD_NEXT;
}

static void (*LevelScriptJumpTable[])(void) =
{
    /*00*/ level_cmd_load_and_execute,
    /*01*/ level_cmd_exit_and_execute,
    /*02*/ level_cmd_exit,
    /*03*/ level_cmd_sleep,
    /*04*/ level_cmd_sleep2,
    /*05*/ level_cmd_jump,
    /*06*/ level_cmd_jump_and_link,
    /*07*/ level_cmd_return,
    /*08*/ level_cmd_jump_and_link_push_arg,
    /*09*/ level_cmd_jump_repeat,
    /*0A*/ level_cmd_loop_begin,
    /*0B*/ level_cmd_loop_until,
    /*0C*/ level_cmd_jump_if,
    /*0D*/ level_cmd_jump_and_link_if,
    /*0E*/ level_cmd_skip_if,
    /*0F*/ level_cmd_skip,
    /*10*/ level_cmd_skippable_nop,
    /*11*/ level_cmd_call,
    /*12*/ level_cmd_call_loop,
    /*13*/ level_cmd_set_register,
    /*14*/ level_cmd_push_pool_state,
    /*15*/ level_cmd_pop_pool_state,
    /*16*/ level_cmd_load_to_fixed_address,
    /*17*/ level_cmd_load_segment,
    /*18*/ level_cmd_load_compressed_segment,
    /*19*/ level_cmd_19,
    /*1A*/ level_cmd_1A,
    /*1B*/ level_cmd_init_level,
    /*1C*/ level_cmd_clear_level,
    /*1D*/ level_cmd_alloc_level_pool,
    /*1E*/ level_cmd_free_level_pool,
    /*1F*/ level_cmd_begin_area,
    /*20*/ level_cmd_end_area,
    /*21*/ level_cmd_21,
    /*22*/ level_cmd_22,
    /*23*/ level_cmd_23,
    /*24*/ level_cmd_place_object,
    /*25*/ level_cmd_init_mario,
    /*26*/ level_cmd_create_warp_node,
    /*27*/ level_cmd_create_painting_warp_node,
    /*28*/ level_cmd_create_instant_warp,
    /*29*/ level_cmd_load_area,
    /*2A*/ level_cmd_2A,
    /*2B*/ level_cmd_set_mario_start_pos,
    /*2C*/ level_cmd_2C,
    /*2D*/ level_cmd_2D,
    /*2E*/ level_cmd_set_terrain_data,
    /*2F*/ level_cmd_set_rooms,
    /*30*/ level_cmd_30,
    /*31*/ level_cmd_set_terrain_type,
    /*32*/ level_cmd_nop,
    /*33*/ level_cmd_set_transition,
    /*34*/ level_cmd_set_blackout,
    /*35*/ level_cmd_set_gamma,
    /*36*/ level_cmd_set_music,
    /*37*/ level_cmd_set_menu_music,
    /*38*/ level_cmd_38,
    /*39*/ level_cmd_39,
    /*3A*/ level_cmd_3A,
    /*3B*/ level_cmd_create_whirlpool,
    /*3C*/ level_cmd_get_or_set_var,
};

struct LevelCommand *level_script_execute(struct LevelCommand *cmd)
{
    sScriptStatus = SCRIPT_RUNNING;
    sCurrentCmd = cmd;

    while (sScriptStatus == SCRIPT_RUNNING)
        LevelScriptJumpTable[sCurrentCmd->type]();

    profiler_log_thread5_time(LEVEL_SCRIPT_EXECUTE);
    func_80247C9C();
    render_game();
    CleanupDisplayList();
    alloc_display_list(0);

    return sCurrentCmd;
}

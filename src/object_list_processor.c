#include <ultra64.h>
#include "libultra.h"

#include "sm64.h"
#include "behavior_data.h"
#include "behavior_script.h"
#include "camera.h"
#include "graph_node.h"
#include "interaction.h"
#include "mario.h"
#include "map_info.h"
#include "memory.h"
#include "level_functions.h"
#include "level_update.h"
#include "object_collision.h"
#include "object_list_processor.h"
#include "platform_displacement.h"
#include "resource_meter.h"
#include "spawn_object.h"
#include "surface_collision.h"

struct ParticleType
{
    u32 flag;
    u32 unk4;
    u8 unk8;
    u8 unk9;
    u16 unkA;
    void *unkC;
};

extern struct Object D_8033C18C[];
extern s8 D_8035FE68[][2];

extern struct GfxNode D_8033B870;
extern struct GfxNode *gObjectLists;

static s8 sObjectListUpdateOrder[] = { 11, 9, 10, 0, 5, 4, 2, 6, 8, 12, -1 };

static struct ParticleType sParticleTypes[] = {
    { PARTICLE_DUST,     0x00000001, 0x8E, 0x00, 0x0000, beh_mario_dust_generator              },
    { PARTICLE_1,        0x00040000, 0x00, 0x00, 0x0000, beh_wall_tiny_star_particle_spawn     },
    { PARTICLE_4,        0x00000010, 0x00, 0x00, 0x0000, beh_pound_tiny_star_particle_spawn    },
    { PARTICLE_SPARKLES, 0x00000008, 0x95, 0x00, 0x0000, beh_special_triple_jump_sparkles      },
    { PARTICLE_5,        0x00000020, 0xA8, 0x00, 0x0000, beh_bubble_mario                      },
    { PARTICLE_6,        0x00000040, 0xA7, 0x00, 0x0000, beh_water_splash                      },
    { PARTICLE_7,        0x00000080, 0xA6, 0x00, 0x0000, beh_surface_waves                     },
    { PARTICLE_9,        0x00000200, 0xA4, 0x00, 0x0000, beh_water_waves                       },
    { PARTICLE_10,       0x00000400, 0xA3, 0x00, 0x0000, beh_wave_trail_on_surface             },
    { PARTICLE_11,       0x00000800, 0x90, 0x00, 0x0000, beh_flame_mario                       },
    { PARTICLE_8,        0x00000100, 0x00, 0x00, 0x0000, beh_waves_generator                   },
    { PARTICLE_12,       0x00001000, 0x00, 0x00, 0x0000, beh_surface_wave_shrinking            },
    { PARTICLE_LEAVES,   0x00002000, 0x00, 0x00, 0x0000, beh_snow_leaf_particle_spawn          },
    { PARTICLE_14,       0x00010000, 0x00, 0x00, 0x0000, beh_ground_snow                       },
    { PARTICLE_17,       0x00020000, 0x00, 0x00, 0x0000, beh_water_mist_spawn                  },
    { PARTICLE_15,       0x00004000, 0x00, 0x00, 0x0000, beh_ground_sand                       },
    { PARTICLE_16,       0x00008000, 0x00, 0x00, 0x0000, beh_pound_white_puffs                 },
    { PARTICLE_18,       0x00080000, 0x00, 0x00, 0x0000, beh_punch_tiny_triangle_spawn         },
    { 0,                 0x00000000, 0x00, 0x00, 0x0000, NULL                                  },
};

void nop_change_course()
{
}

static void copy_mario_state_to_object(void)
{
    s32 i = 0;
    // L is real
    if (gCurrentObject != gMarioObject)
        i += 1;

    gCurrentObject->vel[0] = gMarioStates[i].vel[0];
    gCurrentObject->vel[1] = gMarioStates[i].vel[1];
    gCurrentObject->vel[2] = gMarioStates[i].vel[2];

    gCurrentObject->pos[0] = gMarioStates[i].pos[0];
    gCurrentObject->pos[1] = gMarioStates[i].pos[1];
    gCurrentObject->pos[2] = gMarioStates[i].pos[2];

    gCurrentObject->angle[0] = gCurrentObject->gfx.unk1A[0];
    gCurrentObject->angle[1] = gCurrentObject->gfx.unk1A[1];
    gCurrentObject->angle[2] = gCurrentObject->gfx.unk1A[2];

    gCurrentObject->faceAngle[0] = gCurrentObject->gfx.unk1A[0];
    gCurrentObject->faceAngle[1] = gCurrentObject->gfx.unk1A[1];
    gCurrentObject->faceAngle[2] = gCurrentObject->gfx.unk1A[2];

    gCurrentObject->platformRotation[0] = gMarioStates[i].angleVel[0];
    gCurrentObject->platformRotation[1] = gMarioStates[i].angleVel[1];
    gCurrentObject->platformRotation[2] = gMarioStates[i].angleVel[2];
}

static void spawn_particle(u32 flags, s16 seg, void *script)
{
    if (!(gCurrentObject->unkE0 & flags))
    {
        struct Object *particle;
        gCurrentObject->unkE0 |= flags;
        particle = func_8029E5A4(gCurrentObject, 0, seg, script);
        CopyObjParams(particle, gCurrentObject);
    }
}

void BehMarioLoop2(void)
{
    u32 particleFlags = 0; 
    s32 i;

    particleFlags = func_80254604(gCurrentObject);
    gCurrentObject->unkF4 = particleFlags;
    copy_mario_state_to_object();

    i = 0;
    while (sParticleTypes[i].flag != 0)
    {
        if (particleFlags & sParticleTypes[i].flag)
            spawn_particle(sParticleTypes[i].unk4, sParticleTypes[i].unk8, sParticleTypes[i].unkC);

        i++;
    }
}

static s32 update_objects_starting_at(struct GfxNode *listHead, struct GfxNode *firstObj)
{
    s32 count = 0;
    
    while (listHead != firstObj)
    {
        gCurrentObject = (struct Object *) firstObj;

        gCurrentObject->gfx.graphFlags |= 0x0020;
        cur_object_exec_behavior();

        firstObj = firstObj->next;
        count += 1;
    }

    return count;
}

static s32 update_objects_during_time_stop(struct GfxNode *listHead, struct GfxNode *firstObj)
{
    s32 count = 0;
    s32 unfrozen;

    while (listHead != firstObj)
    {
        gCurrentObject = (struct Object *) firstObj;

        unfrozen = FALSE;
        if (!(gTimeStopState & TIME_STOP_ALL_OBJECTS))
        { 
            if (gCurrentObject == gMarioObject &&
                !(gTimeStopState & TIME_STOP_MARIO_AND_DOORS))
            {
                unfrozen = TRUE;
            }
            
            if ((gCurrentObject->interactType & (INTERACT_DOOR | INTERACT_WARP_DOOR)) &&
                !(gTimeStopState & TIME_STOP_MARIO_AND_DOORS))
            {
                unfrozen = TRUE;
            }

            if (gCurrentObject->active & 0x30)
                unfrozen = TRUE;
        }

        if (unfrozen)
        {
            gCurrentObject->gfx.graphFlags |= 0x20;
            cur_object_exec_behavior();
        }
        else
        {
            gCurrentObject->gfx.graphFlags &= ~0x20;
        }

        firstObj = firstObj->next;
        count++;
    }

    return count;
}

static s32 update_objects_in_list(struct GfxNode *objList)
{
    s32 count;
    struct GfxNode *firstObj = objList->next;

    if (!(gTimeStopState & TIME_STOP_ACTIVE))
        count = update_objects_starting_at(objList, firstObj);
    else
        count = update_objects_during_time_stop(objList, firstObj);

    return count;
}

static s32 func_8029C618(struct GfxNode *objList)
{
    struct GfxNode *obj = objList->next;

    while (objList != obj)
    {
        gCurrentObject = (struct Object *) obj;
        
        obj = obj->next;

        if ((gCurrentObject->active & 0x01) != 1)
        {
            if ((gCurrentObject->objFlags & 0x4000) == 0)
                func_8029C6D8(gCurrentObject, 0xFF);

            func_802C9088(gCurrentObject);
        }
    }

    return 0;
}

void func_8029C6D8(struct Object *a0, u8 a1)
{  
    s32 *spC;
    u16 *sp8;

    switch(a0->unk1F6)
    {
    case 1:
        spC = a0->unk25C;
        *spC |= a1 << 8; 
        break;
    
    case 2:
        sp8 = a0->unk25C;
        *sp8 |= a1 << 8; 
        break;
    }
}

void func_8029C75C(UNUSED s32 sp28, s32 sp2C)
{
    struct GfxNode *sp24, *sp20, *sp1C;
    s32 sp18;
    gObjectLists = &D_8033B870;
    
    for (sp18 = 0; sp18 < 13; sp18++)
    {
        sp1C = gObjectLists + sp18;
        sp20 = sp1C->next;

        while (sp20 != sp1C)
        {
            sp24 = sp20;
            sp20 = sp20->next;
            if (sp24->unk19 == sp2C)
                func_802C9088((struct Object *) sp24);
        }
    }
}

void spawn_objects_from_info(UNUSED s32 unusedArg, struct SpawnInfo *spawnInfo)
{
    gObjectLists = &D_8033B870;
    gTimeStopState = 0;

    D_8035FEF2 = 0;
    D_8035FEF4 = 0;

    if (D_8033A75A == 2) 
        D_8035FEEC |= 1;

    while (spawnInfo != NULL)
    {
        struct Object *object;
        UNUSED s32 unused;
        void *script;
        UNUSED s16 arg16;

        arg16 = (s16)(spawnInfo->behaviorArg & 0xFFFF);
        script = segmented_to_virtual(spawnInfo->behaviorScript);

        if ((spawnInfo->behaviorArg & 0xFF00) != 0xFF00)
        {
            object = func_802C9424(script);
 
            object->unk188 = spawnInfo->behaviorArg;
            object->behParam = ((spawnInfo->behaviorArg) >> 16) & 0xff;
            object->behavior = script;
            object->unk1C8 = 0;
            object->unk1F6 = 1;
            object->unk25C = &spawnInfo->behaviorArg; 

            if (spawnInfo->behaviorArg & 0x01)
            {
                gMarioObject = object;
                func_8037C138((struct GraphNode *) object);
            }

            func_8037C51C((struct GraphNode018 *) object, spawnInfo);
            
            object->pos[0] = spawnInfo->startPos[0];
            object->pos[1] = spawnInfo->startPos[1];
            object->pos[2] = spawnInfo->startPos[2];

            object->faceAngle[0] = spawnInfo->startAngle[0];
            object->faceAngle[1] = spawnInfo->startAngle[1];
            object->faceAngle[2] = spawnInfo->startAngle[2];
            
            object->angle[0] = spawnInfo->startAngle[0];
            object->angle[1] = spawnInfo->startAngle[1];
            object->angle[2] = spawnInfo->startAngle[2];

        }
        
        spawnInfo = spawnInfo->next;
    }
}

static void func_8029CA50()
{
}

void func_8029CA60(void)
{ 
    s32 i;

    D_8035FEE6 = 0;
    gTimeStopState = 0;
    gMarioObject = NULL;
    D_8035FEE0 = 0;

    for (i = 0; i < 60; i++)
    {
        D_8035FE68[i][0] = 0;
        D_8035FE68[i][1] = 0;
    }

    func_802CA0CC();
    func_802C8ED8();
    func_802C8F5C(&D_8033B870);
    func_80385BF0();
    func_8029CA50();

    for (i = 0; i < 240; i++)
    {
        D_8033C18C[i].gfx.unk00 = 0;
        func_8037C3D0((struct GraphNode018 *) &gObjectPool[i]);
    }

    D_8035FE0C = func_802785E8(0x800, 0);
    gObjectLists = &D_8033B870; 
    func_803835A4();
}

static void update_terrain_objects(void)
{
    gUpdatedObjectCount = update_objects_in_list(&gObjectLists[11]);
    //! This was meant to be +=
    gUpdatedObjectCount = update_objects_in_list(&gObjectLists[9]);
} 


static void update_non_terrain_objects(void)
{
    UNUSED s32 unused; 
    s32 listIndex;

    s32 i = 2;
    while ((listIndex = sObjectListUpdateOrder[i]) != -1)
    {
        gUpdatedObjectCount += update_objects_in_list(&gObjectLists[listIndex]);
        i += 1;
    }
}

static void func_8029CCA0(void)
{
    UNUSED s32 unused; 
    s32 listIndex;

    s32 i = 0;
    while ((listIndex = sObjectListUpdateOrder[i]) != -1)
    {
        func_8029C618(&gObjectLists[listIndex]);
        i += 1;
    }

    gTimeStopState &= ~TIME_STOP_UNKNOWN_0;
}

static u16 unused_get_elapsed_time(u64 *cycleCounts, s32 index)
{
    u16 time;
    f64 cycles;

    cycles = cycleCounts[index] - cycleCounts[index - 1];
    if (cycles < 0)
        cycles = 0;

    time = (u16) (((u64) cycles * 1000000 / osClockRate) / 16667.0 * 1000.0);
    if (time > 999)
        time = 999;
    
    return time;
}

void update_objects(UNUSED s32 sp108)
{
    s64 cycleCounts[30];

    cycleCounts[0] = func_802C98D0();

    gTimeStopState &= ~TIME_STOP_UNKNOWN_5;

    D_8035FEEE = 0;
    D_8035FEF0 = 0;
    D_8035FE10 = 0;

    func_802CA140();
    func_802CA5D0();
    
    gObjectLists = &D_8033B870;
    
    cycleCounts[1] = func_802C9900(cycleCounts[0]);
    func_803835A4();

    cycleCounts[2] = func_802C9900(cycleCounts[0]);
    update_terrain_objects();
    
    apply_mario_platform_displacement();
    
    cycleCounts[3] = func_802C9900(cycleCounts[0]);
    func_802C8C44();
    
    cycleCounts[4] = func_802C9900(cycleCounts[0]);
    update_non_terrain_objects();
    
    cycleCounts[5] = func_802C9900(cycleCounts[0]);
    func_8029CCA0();
    
    cycleCounts[6] = func_802C9900(cycleCounts[0]);
    update_mario_platform();
    
    cycleCounts[7] = func_802C9900(cycleCounts[0]);  

    cycleCounts[0] = 0;
    func_802CA5E0();

    if (gTimeStopState & TIME_STOP_ENABLED)
        gTimeStopState |= TIME_STOP_ACTIVE;
    else 
        gTimeStopState &= ~TIME_STOP_ACTIVE;
    
    D_8035FDF8 = gUpdatedObjectCount;
}
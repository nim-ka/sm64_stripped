#include <ultra64.h>

#include "sm64.h"
#include "behavior_data.h"
#include "mario_actions_automatic.h"
#include "audio_interface_2.h"
#include "area.h"
#include "mario.h"
#include "mario_step.h"
#include "math_util.h"
#include "memory.h"
#include "sound_init.h"
#include "save_file.h"
#include "surface_collision.h"


#define POLE_NONE          0
#define POLE_TOUCHED_FLOOR 1
#define POLE_FELL_OFF      2

#define HANG_NONE            0
#define HANG_HIT_CEIL_OR_OOB 1
#define HANG_LEFT_CEIL       2


static void add_tree_leaf_particles(struct MarioState *m)
{
    f32 leafHeight;

    if (m->usedObj->behavior == segmented_to_virtual(beh_tree))
    {
        // make leaf effect spawn higher on the Shifting Sand Land palm tree
        if (gCurrLevelNum == LEVEL_SSL)
            leafHeight = 250.0f;
        else
            leafHeight = 100.0f;
        if (m->pos[1] - m->floorHeight > leafHeight)
            m->particleFlags |= PARTICLE_LEAVES;
    }
}

static void play_climbing_sounds(struct MarioState *m, s32 b)
{
    s32 isOnTree = (m->usedObj->behavior == segmented_to_virtual(beh_tree));

    if (b == 1)
    {
        if (func_80250B68(m, 1) != 0)
            SetSound(isOnTree ? 0x043A8081 : 0x04418081, &m->marioObj->gfx.unk54);
    }
    else
    {
        SetSound(isOnTree ? 0x14128001 : 0x14110001, &m->marioObj->gfx.unk54);
    }
}

static s32 set_pole_position(struct MarioState *m, f32 offsetY)
{
    UNUSED s32 unused1;
    UNUSED s32 unused2;
    UNUSED s32 unused3;
    struct Surface *floor;
    struct Surface *ceil;
    f32 floorHeight;
    f32 ceilHeight;
    s32 collided;
    s32 result = POLE_NONE;
    f32 poleTop = m->usedObj->hitboxHeight - 100.0f;
    struct Object *marioObj = m->marioObj;

    if (*(f32 *)&marioObj->unk110 > poleTop)
        *(f32 *)&marioObj->unk110 = poleTop;

    m->pos[0] = m->usedObj->pos[0];
    m->pos[2] = m->usedObj->pos[2];
    m->pos[1] = m->usedObj->pos[1] + *(f32 *)&marioObj->unk110 + offsetY;

    collided  = resolve_wall_collisions(&m->pos[0], &m->pos[1], &m->pos[2], 60.0f, 50.0f);
    collided |= resolve_wall_collisions(&m->pos[0], &m->pos[1], &m->pos[2], 30.0f, 24.0f);

    ceilHeight = func_802518D0(m->pos, m->pos[1], &ceil);
    if (m->pos[1] > ceilHeight - 160.0f)
    {
        m->pos[1] = ceilHeight - 160.0f;
        *(f32 *)&marioObj->unk110 = m->pos[1] - m->usedObj->pos[1];
    }

    floorHeight = find_floor(m->pos[0], m->pos[1], m->pos[2], &floor);
    if (m->pos[1] < floorHeight)
    {
        m->pos[1] = floorHeight;
        set_mario_action(m, ACT_IDLE, 0);
        result = POLE_TOUCHED_FLOOR;
    }
    else if (*(f32 *)&marioObj->unk110 < -m->usedObj->unk208)
    {
        m->pos[1] = m->usedObj->pos[1] - m->usedObj->unk208;
        set_mario_action(m, ACT_FREEFALL, 0);
        result = POLE_FELL_OFF;
    }
    else if (collided)
    {
        if (m->pos[1] > floorHeight + 20.0f)
        {
            m->forwardVel = -2.0f;
            set_mario_action(m, ACT_SOFT_BONK, 0);
            result = POLE_FELL_OFF;
        }
        else
        {
            set_mario_action(m, ACT_IDLE, 0);
            result = POLE_TOUCHED_FLOOR;
        }
    }

    vec3f_copy(m->marioObj->gfx.unk20, m->pos);
    vec3s_set(m->marioObj->gfx.unk1A, m->usedObj->angle[0], m->faceAngle[1], m->usedObj->angle[2]);

    return result;
}

static s32 act_holding_pole(struct MarioState *m)
{
    struct Object *marioObj = m->marioObj;

#if VERSION_US
    if ((m->input & INPUT_Z_PRESSED) || m->health < 0x100)
    {
        add_tree_leaf_particles(m);
        m->forwardVel = -2.0f;
        return set_mario_action(m, ACT_SOFT_BONK, 0);
    }

    if (m->input & INPUT_A_PRESSED)
    {
        add_tree_leaf_particles(m);
        m->faceAngle[1] += 0x8000;
        return set_mario_action(m, ACT_WALL_KICK_AIR, 0);
    }
#else
    if (m->input & INPUT_A_PRESSED)
    {
        add_tree_leaf_particles(m);
        m->faceAngle[1] += 0x8000;
        return set_mario_action(m, ACT_WALL_KICK_AIR, 0);
    }

    if (m->input & INPUT_Z_PRESSED)
    {
        add_tree_leaf_particles(m);
        m->forwardVel = -2.0f;
        return set_mario_action(m, ACT_SOFT_BONK, 0);
    }
#endif

    if (m->controller->stickY > 16.0f)
    {
        f32 poleTop = m->usedObj->hitboxHeight - 100.0f;
        void *poleBehavior = virtual_to_segmented(0x13, m->usedObj->behavior);

        if (*(f32 *)&marioObj->unk110 < poleTop - 0.4f)
            return set_mario_action(m, ACT_CLIMBING_POLE, 0);

        if (poleBehavior != beh_giant_pole && m->controller->stickY > 50.0f)
            return set_mario_action(m, ACT_TOP_OF_POLE_TRANSITION, 0);
    }

    if (m->controller->stickY < -16.0f)
    {
        marioObj->unk10C -= m->controller->stickY * 2.0f;
        if (marioObj->unk10C > 0x1000)
            marioObj->unk10C = 0x1000;

        m->faceAngle[1] += marioObj->unk10C;
        *(f32 *)&marioObj->unk110 -= marioObj->unk10C / 0x100;

        if (m->usedObj->behavior == segmented_to_virtual(beh_tree))
        {
            //! The Shifting Sand Land palm tree check is done climbing up in
            // add_tree_leaf_particles, but not here, when climbing down.
            if (m->pos[1] - m->floorHeight > 100.0f)
                m->particleFlags |= PARTICLE_LEAVES;
        }
        play_climbing_sounds(m, 2);
        func_80320A4C(1, marioObj->unk10C / 0x100 * 2);
    }
    else
    {
        marioObj->unk10C = 0;
        m->faceAngle[1] -= m->controller->stickX * 16.0f;
    }

    if (set_pole_position(m, 0.0f) == POLE_NONE)
        func_802507E8(m, 0x000D);

    return FALSE;
}

static s32 act_climbing_pole(struct MarioState *m)
{
    s32 sp24;
    struct Object *marioObj = m->marioObj;
    s16 cameraAngle = m->area->unk24->unk2;

#if VERSION_US
    if (m->health < 0x100)
    {
        add_tree_leaf_particles(m);
        m->forwardVel = -2.0f;
        return set_mario_action(m, ACT_SOFT_BONK, 0);
    }
#endif

    if (m->input & INPUT_A_PRESSED)
    {
        add_tree_leaf_particles(m);
        m->faceAngle[1] += 0x8000;
        return set_mario_action(m, ACT_WALL_KICK_AIR, 0);
    }

    if (m->controller->stickY < 8.0f)
        return set_mario_action(m, ACT_HOLDING_POLE, 0);

    *(f32 *)&marioObj->unk110 += m->controller->stickY / 8.0f;
    marioObj->unk10C = 0;
    m->faceAngle[1] = cameraAngle - approach_s32((s16)(cameraAngle - m->faceAngle[1]), 0, 0x400, 0x400);
    
    if (set_pole_position(m, 0.0f) == POLE_NONE)
    {
        sp24 = m->controller->stickY / 4.0f * 0x10000;
        func_80250934(m, 5, sp24);
        add_tree_leaf_particles(m);
        play_climbing_sounds(m, 1);
    }

    return FALSE;
}

static s32 act_grab_pole_slow(struct MarioState *m)
{
    func_80250F50(m, 0x2408C081, MARIO_UNKNOWN_17);

    if (set_pole_position(m, 0.0f) == POLE_NONE)
    {
        func_802507E8(m, 0x0006);
        if (func_80250770(m))
            set_mario_action(m, ACT_HOLDING_POLE, 0);
        add_tree_leaf_particles(m);
    }
    
    return FALSE;
}

static s32 act_grab_pole_fast(struct MarioState *m)
{
    struct Object *marioObj = m->marioObj;

    func_80250F50(m, 0x2408C081, MARIO_UNKNOWN_17);
    m->faceAngle[1] += marioObj->unk10C;
    marioObj->unk10C = marioObj->unk10C * 8 / 10;

    if (set_pole_position(m, 0.0f) == POLE_NONE)
    {
        if (marioObj->unk10C > 0x800)
        {
            func_802507E8(m, 7);
        }
        else
        {
            func_802507E8(m, 8);
            if (func_80250770(m) != 0)
            {
                marioObj->unk10C = 0;
                set_mario_action(m, ACT_HOLDING_POLE, 0);
            }
        }
        add_tree_leaf_particles(m);
    }

    return FALSE;
}

static s32 act_top_of_pole_transition(struct MarioState *m)
{
    struct Object *marioObj = m->marioObj;

    marioObj->unk10C = 0;
    if (m->actionArg == 0)
    {
        func_802507E8(m, 0x000B);
        if (func_80250770(m))
            return set_mario_action(m, ACT_TOP_OF_POLE, 0);
    }
    else
    {
        func_802507E8(m, 0x000C);
        if (m->marioObj->gfx.unk40 == 0)
            return set_mario_action(m, ACT_HOLDING_POLE, 0);
    }

    set_pole_position(m, func_80250F0C(m));
    return FALSE;
}

static s32 act_top_of_pole(struct MarioState *m)
{
    UNUSED struct Object *marioObj = m->marioObj;

    if (m->input & INPUT_A_PRESSED)
        return set_mario_action(m, ACT_TOP_OF_POLE_JUMP, 0);
    if (m->controller->stickY < -16.0f)
        return set_mario_action(m, ACT_TOP_OF_POLE_TRANSITION, 1);

    m->faceAngle[1] -= m->controller->stickX * 16.0f;

    func_802507E8(m, 0x0009);
    set_pole_position(m, func_80250F0C(m));
    return FALSE;
}

static s32 perform_hanging_step(struct MarioState *m, Vec3f nextPos)
{
    UNUSED s32 unused;
    struct Surface *ceil;
    struct Surface *floor;
    f32 ceilHeight;
    f32 floorHeight;
    f32 ceilOffset;

    m->wall = func_8025181C(nextPos, 50.0f, 50.0f);
    floorHeight = find_floor(nextPos[0], nextPos[1], nextPos[2], &floor);
    ceilHeight = func_802518D0(nextPos, floorHeight, &ceil);

    if (floor == NULL)
        return HANG_HIT_CEIL_OR_OOB;
    if (ceil == NULL)
        return HANG_LEFT_CEIL;
    if (ceilHeight - floorHeight <= 160.0f)
        return HANG_HIT_CEIL_OR_OOB;
    if (ceil->type != SURFACE_HANGABLE)
        return HANG_LEFT_CEIL;
    
    ceilOffset = ceilHeight - (nextPos[1] + 160.0f);
    if (ceilOffset < -30.0f)
        return HANG_HIT_CEIL_OR_OOB;
    if (ceilOffset > 30.0f)
        return HANG_LEFT_CEIL;
    
    nextPos[1] = m->ceilHeight - 160.0f;
    vec3f_copy(m->pos, nextPos);

    m->floor = floor;
    m->floorHeight = floorHeight;
    m->ceil = ceil;
    m->ceilHeight = ceilHeight;

    return HANG_NONE;
}

static s32 update_hang_moving(struct MarioState *m)
{
    s32 stepResult;
    Vec3f nextPos;
    f32 maxSpeed = 4.0f;

    m->forwardVel += 1.0f;
    if (m->forwardVel > maxSpeed)
        m->forwardVel = maxSpeed;

    m->faceAngle[1] = m->intendedYaw - approach_s32((s16)(m->intendedYaw - m->faceAngle[1]), 0, 0x800, 0x800);

    m->slideYaw = m->faceAngle[1];
    m->slideVelX = m->forwardVel * sins(m->faceAngle[1]);
    m->slideVelZ = m->forwardVel * coss(m->faceAngle[1]);

    m->vel[0] = m->slideVelX;
    m->vel[1] = 0.0f;
    m->vel[2] = m->slideVelZ;

    nextPos[0] = m->pos[0] - m->ceil->normal[1] * m->vel[0];
    nextPos[2] = m->pos[2] - m->ceil->normal[1] * m->vel[2];
    nextPos[1] = m->pos[1];

    stepResult = perform_hanging_step(m, nextPos);

    vec3f_copy(m->marioObj->gfx.unk20, m->pos);
    vec3s_set(m->marioObj->gfx.unk1A, 0, m->faceAngle[1], 0);
    return stepResult;
}

static void update_hang_stationary(struct MarioState *m)
{
    m->forwardVel = 0.0f;
    m->slideVelX = 0.0f;
    m->slideVelZ = 0.0f;

    m->pos[1] = m->ceilHeight - 160.0f;
    
    vec3f_copy(m->vel, D_80385FD0);
    vec3f_copy(m->marioObj->gfx.unk20, m->pos);
}

static s32 act_start_hanging(struct MarioState *m)
{
    m->actionTimer++;

    if ((m->input & INPUT_NONZERO_ANALOG) && m->actionTimer >= 31)
        return set_mario_action(m, ACT_HANGING, 0);

    if (!(m->input & INPUT_A_DOWN))
        return set_mario_action(m, ACT_FREEFALL, 0);

    if (m->input & INPUT_Z_PRESSED)
        return set_mario_action(m, ACT_GROUND_POUND, 0);

    //! Crash if mario's referenced ceiling is NULL (same for other hanging actions)
    if (m->ceil->type != SURFACE_HANGABLE)
        return set_mario_action(m, ACT_FREEFALL, 0);

    func_802507E8(m, 0x0035);
    func_80250F50(m, 0x042DA081, MARIO_UNKNOWN_16);
    update_hang_stationary(m);

    if (func_80250770(m))
        set_mario_action(m, ACT_HANGING, 0);

    return FALSE;
}

static s32 act_hanging(struct MarioState *m)
{
    if (m->input & INPUT_NONZERO_ANALOG)
        return set_mario_action(m, ACT_HANG_MOVING, m->actionArg);

    if (!(m->input & INPUT_A_DOWN))
        return set_mario_action(m, ACT_FREEFALL, 0);

    if (m->input & INPUT_Z_PRESSED)
        return set_mario_action(m, ACT_GROUND_POUND, 0);

    if (m->ceil->type != SURFACE_HANGABLE)
        return set_mario_action(m, ACT_FREEFALL, 0);

    if (m->actionArg & 1)
        func_802507E8(m, 0x00C6);
    else
        func_802507E8(m, 0x00C7);

    update_hang_stationary(m);

    return FALSE;
}

static s32 act_hang_moving(struct MarioState *m)
{
    if (!(m->input & INPUT_A_DOWN))
        return set_mario_action(m, ACT_FREEFALL, 0);

    if (m->input & INPUT_Z_PRESSED)
        return set_mario_action(m, ACT_GROUND_POUND, 0);

    if (m->ceil->type != SURFACE_HANGABLE)
        return set_mario_action(m, ACT_FREEFALL, 0);

    if (m->actionArg & 1)
        func_802507E8(m, 0x005C);
    else
        func_802507E8(m, 0x005D);

    if (m->marioObj->gfx.unk40 == 12)
        SetSound(0x042DA081, &m->marioObj->gfx.unk54);

    if (func_802507AC(m))
    {
        m->actionArg ^= 1;
        if (m->input & INPUT_UNKNOWN_5)
            return set_mario_action(m, ACT_HANGING, m->actionArg);
    }

    if (update_hang_moving(m) == HANG_LEFT_CEIL)
        set_mario_action(m, ACT_FREEFALL, 0);

    return FALSE;
}

static s32 let_go_of_ledge(struct MarioState *m)
{
    f32 floorHeight;
    struct Surface *floor;

    m->vel[1] = 0.0f;
    m->forwardVel = -8.0f;
    m->pos[0] -= 60.0f * sins(m->faceAngle[1]);
    m->pos[2] -= 60.0f * coss(m->faceAngle[1]);

    floorHeight = find_floor(m->pos[0], m->pos[1], m->pos[2], &floor);
    if (floorHeight < m->pos[1] - 100.0f)
        m->pos[1] -= 100.0f;
    else
        m->pos[1] = floorHeight;

    return set_mario_action(m, ACT_SOFT_BONK, 0);
}

static void func_8025F0DC(struct MarioState *m)
{
    func_802507E8(m, 0x00C3);
    m->pos[0] += 14.0f * sins(m->faceAngle[1]);
    m->pos[2] += 14.0f * coss(m->faceAngle[1]);
    vec3f_copy(m->marioObj->gfx.unk20, m->pos);
}

static void func_8025F188(struct MarioState *m)
{
    f32 sp4;

    if (m->actionTimer < 14)
        sp4 = m->actionTimer;
    else
        sp4 = 14.0f;
    m->unk94->unk04[0] = m->pos[0] + sp4 * sins(m->faceAngle[1]);
    m->unk94->unk04[2] = m->pos[2] + sp4 * coss(m->faceAngle[1]);
    m->unk94->unk04[1] = m->pos[1];
    m->actionTimer++;
    m->flags |= MARIO_UNKNOWN_25;
}

static void update_ledge_climb(struct MarioState *m, s32 animation, u32 endAction)
{
    stop_and_set_height_to_floor(m);

    func_802507E8(m, animation);
    if (func_80250770(m))
    {
        set_mario_action(m, endAction, 0);
        if (endAction == ACT_IDLE)
            func_8025F0DC(m);
    }
}

static s32 act_ledge_grab(struct MarioState *m)
{
    f32 heightAboveFloor;
    s16 intendedDYaw = m->intendedYaw - m->faceAngle[1];
    s32 hasSpaceForMario = (m->ceilHeight - m->floorHeight >= 160.0f);

    if (m->actionTimer < 10)
        m->actionTimer++;

    if (m->floor->normal[1] < 0.9063078f)
        return let_go_of_ledge(m);

    if (m->input & (INPUT_Z_PRESSED | INPUT_OFF_FLOOR))
        return let_go_of_ledge(m);

    if ((m->input & INPUT_A_PRESSED) && hasSpaceForMario)
        return set_mario_action(m, ACT_LEDGE_CLIMB_FAST, 0);

    if (m->input & INPUT_UNKNOWN_10)
    {
        if (m->marioObj->interactStatus & 0x00000002)
            m->hurtCounter += (m->flags & MARIO_CAP_ON_HEAD) ? 12 : 18;
        return let_go_of_ledge(m);
    }

    if (m->actionTimer == 10 && (m->input & INPUT_NONZERO_ANALOG))
    {
        if (intendedDYaw >= -0x4000 && intendedDYaw <= 0x4000)
        {
            if (hasSpaceForMario)
                return set_mario_action(m, ACT_LEDGE_CLIMB_SLOW_1, 0);
        }
        else
        {
            return let_go_of_ledge(m);
        }
    }

    heightAboveFloor = m->pos[1] - func_80251CF8(m, -0x8000, 30.0f);
    if (hasSpaceForMario && heightAboveFloor < 100.0f)
        return set_mario_action(m, ACT_LEDGE_CLIMB_FAST, 0);

    if (m->actionArg == 0)
        func_80250F50(m, 0x2408C081, MARIO_UNKNOWN_17);

    stop_and_set_height_to_floor(m);
    func_802507E8(m, 0x0033);

    return FALSE;
}

static s32 act_ledge_climb_slow(struct MarioState *m)
{
    if (m->input & INPUT_OFF_FLOOR)
        return let_go_of_ledge(m);

    if (m->actionTimer >= 28 &&
        (m->input & (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE)))
    {
        func_8025F0DC(m);
        return func_80252FEC(m);
    }

    if (m->actionTimer == 10)
        func_80250F50(m, 0x24098081, MARIO_UNKNOWN_17);

    update_ledge_climb(m, 0, ACT_IDLE);

    func_8025F188(m);
    if (m->marioObj->gfx.unk40 == 17)
        m->action = ACT_LEDGE_CLIMB_SLOW_2;

    return FALSE;
}

static s32 act_ledge_climb_down(struct MarioState *m)
{
    if (m->input & INPUT_OFF_FLOOR)
        return let_go_of_ledge(m);

    func_80250F50(m, 0x2408C081, MARIO_UNKNOWN_17);

    update_ledge_climb(m, 0x001C, ACT_LEDGE_GRAB);
    m->actionArg = 1;

    return FALSE;
}

static s32 act_ledge_climb_fast(struct MarioState *m)
{
    if (m->input & INPUT_OFF_FLOOR)
        return let_go_of_ledge(m);

    func_80250F50(m, 0x2413D081, MARIO_UNKNOWN_17);

    update_ledge_climb(m, 0x0034, ACT_IDLE);
    
    if (m->marioObj->gfx.unk40 == 8)
        func_80251280(m, 0x04088081);
    func_8025F188(m);

    return FALSE;
}

static s32 act_grabbed(struct MarioState *m)
{
    if (m->marioObj->interactStatus & 0x00000004)
    {
        s32 thrown = (m->marioObj->interactStatus & 0x00000040) == 0;
        
        m->faceAngle[1] = m->usedObj->angle[1];
        vec3f_copy(m->pos, m->marioObj->gfx.unk20);

        return set_mario_action(
            m, (m->forwardVel >= 0.0f) ? ACT_THROWN_FORWARD : ACT_THROWN_BACKWARD, thrown);
    }

    func_802507E8(m, 0x0058);
    return FALSE;
}

static s32 act_in_cannon(struct MarioState *m)
{
    struct Object *marioObj = m->marioObj;
    s16 startFacePitch = m->faceAngle[0];
    s16 startFaceYaw = m->faceAngle[1];

    switch (m->actionState)
    {
    case 0:
        m->marioObj->gfx.graphFlags &= ~0x0001;
        m->usedObj->interactStatus = 0x00008000;

        m->unk94->unk1E = 1;
        m->unk94->unk20 = m->usedObj;
        
        vec3f_set(m->vel, 0.0f, 0.0f, 0.0f);
        
        m->pos[0] = m->usedObj->pos[0];
        m->pos[1] = m->usedObj->pos[1] + 350.0f;
        m->pos[2] = m->usedObj->pos[2];
        
        m->forwardVel = 0.0f;
        
        m->actionState = 1;
        break;

    case 1:
        if (m->usedObj->action == 1)
        {
            m->faceAngle[0] = m->usedObj->angle[0];
            m->faceAngle[1] = m->usedObj->angle[1];

            marioObj->unk10C = m->usedObj->angle[1];
            marioObj->unk110 = 0;
            
            m->actionState = 2;
        }
        break;

    case 2:
        m->faceAngle[0] -= (s16)(m->controller->stickY * 10.0f);
        marioObj->unk110 -= (s16)(m->controller->stickX * 10.0f);

        if (m->faceAngle[0] > 0x38E3)
            m->faceAngle[0] = 0x38E3;
        if (m->faceAngle[0] < 0)
            m->faceAngle[0] = 0;

        if (marioObj->unk110 > 0x4000)
            marioObj->unk110 = 0x4000;
        if (marioObj->unk110 < -0x4000)
            marioObj->unk110 = -0x4000;

        m->faceAngle[1] = marioObj->unk110 + marioObj->unk10C;
        if (m->input & INPUT_A_PRESSED)
        {
            m->forwardVel = 100.0f * coss(m->faceAngle[0]);

            m->vel[1] = 100.0f * sins(m->faceAngle[0]);
            
            m->pos[0] += 120.0f * coss(m->faceAngle[0]) * sins(m->faceAngle[1]);
            m->pos[1] += 120.0f * sins(m->faceAngle[0]);
            m->pos[2] += 120.0f * coss(m->faceAngle[0]) * coss(m->faceAngle[1]);
            
            SetSound(0x04568081, &m->marioObj->gfx.unk54);
            SetSound(0x501A5081, &m->marioObj->gfx.unk54);
            
            m->marioObj->gfx.graphFlags |= 0x0001;
            
            set_mario_action(m, ACT_SHOT_FROM_CANNON, 0);
            m->usedObj->action = 2;
            return FALSE;
        }
        else
        {
            if (m->faceAngle[0] != startFacePitch || m->faceAngle[1] != startFaceYaw)
                SetSound(0x1D192001, &m->marioObj->gfx.unk54);
        }
    }

    vec3f_copy(m->marioObj->gfx.unk20, m->pos);
    vec3s_set(m->marioObj->gfx.unk1A, 0, m->faceAngle[1], 0);
    func_802507E8(m, 0x0088);

    return FALSE;
}

static s32 act_tornado_twirling(struct MarioState *m)
{
    struct Surface *floor;
    Vec3f nextPos;
    f32 sinAngleVel;
    f32 cosAngleVel;
    f32 floorHeight;
    struct Object *marioObj = m->marioObj;
    struct Object *usedObj = m->usedObj;
    s16 prevTwirlYaw = m->twirlYaw;

    f32 dx = (m->pos[0] - usedObj->pos[0]) * 0.95f;
    f32 dz = (m->pos[2] - usedObj->pos[2]) * 0.95f;

    if (m->vel[1] < 60.0f)
        m->vel[1] += 1.0f;

    if ((*(f32 *)&marioObj->unk110 += m->vel[1]) < 0.0f)
        *(f32 *)&marioObj->unk110 = 0.0f;
    if (*(f32 *)&marioObj->unk110 > usedObj->hitboxHeight)
    {
        if (m->vel[1] < 20.0f)
            m->vel[1] = 20.0f;
        return set_mario_action(m, ACT_TWIRLING, 1);
    }
    
    if (m->angleVel[1] < 0x3000)
        m->angleVel[1] += 0x100;
    
    if (marioObj->unk10C < 0x1000)
        marioObj->unk10C += 0x100;

    m->twirlYaw += m->angleVel[1];
    
    sinAngleVel = sins(marioObj->unk10C);
    cosAngleVel = coss(marioObj->unk10C);
    
    nextPos[0] = usedObj->pos[0] + dx * cosAngleVel + dz * sinAngleVel;
    nextPos[2] = usedObj->pos[2] - dx * sinAngleVel + dz * cosAngleVel;
    nextPos[1] = usedObj->pos[1] + *(f32 *)&marioObj->unk110;
    
    resolve_wall_collisions(&nextPos[0], &nextPos[1], &nextPos[2], 60.0f, 50.0f);
    
    floorHeight = find_floor(nextPos[0], nextPos[1], nextPos[2], &floor);
    if (floor != NULL)
    {
        m->floor = floor;
        m->floorHeight = floorHeight;
        vec3f_copy(m->pos, nextPos);
    }
    else
    {
        if (nextPos[1] >= m->floorHeight)
            m->pos[1] = nextPos[1];
        else
            m->pos[1] = m->floorHeight;
    }
    
    m->actionTimer++;
    
    func_802507E8(m, (m->actionArg == 0) ? 0x0095 : 0x0094);
    
    if (func_802507AC(m))
        m->actionArg = 1;

    // Play sound on angle overflow
    if (prevTwirlYaw > m->twirlYaw)
        SetSound(0x04388081, &m->marioObj->gfx.unk54);
    
    vec3f_copy(m->marioObj->gfx.unk20, m->pos);
    vec3s_set(m->marioObj->gfx.unk1A, 0, m->faceAngle[1] + m->twirlYaw, 0);

    return FALSE;
}

static s32 check_common_automatic_cancels(struct MarioState *m)
{
    if (m->pos[1] < m->waterLevel - 100)
        return func_8025325C(m);

    return FALSE;
}

s32 execute_automatic_action(struct MarioState *m)
{
    s32 cancel;

    if (check_common_automatic_cancels(m))
        return TRUE;

    m->quicksandDepth = 0.0f;

    switch (m->action)
    {
    case ACT_HOLDING_POLE:           cancel = act_holding_pole(m);           break;
    case ACT_GRAB_POLE_SLOW:         cancel = act_grab_pole_slow(m);         break;
    case ACT_GRAB_POLE_FAST:         cancel = act_grab_pole_fast(m);         break;
    case ACT_CLIMBING_POLE:          cancel = act_climbing_pole(m);          break;
    case ACT_TOP_OF_POLE_TRANSITION: cancel = act_top_of_pole_transition(m); break;
    case ACT_TOP_OF_POLE:            cancel = act_top_of_pole(m);            break;
    case ACT_START_HANGING:          cancel = act_start_hanging(m);          break;
    case ACT_HANGING:                cancel = act_hanging(m);                break;
    case ACT_HANG_MOVING:            cancel = act_hang_moving(m);            break;
    case ACT_LEDGE_GRAB:             cancel = act_ledge_grab(m);             break;
    case ACT_LEDGE_CLIMB_SLOW_1:     cancel = act_ledge_climb_slow(m);       break;
    case ACT_LEDGE_CLIMB_SLOW_2:     cancel = act_ledge_climb_slow(m);       break;
    case ACT_LEDGE_CLIMB_DOWN:       cancel = act_ledge_climb_down(m);       break;
    case ACT_LEDGE_CLIMB_FAST:       cancel = act_ledge_climb_fast(m);       break;
    case ACT_GRABBED:                cancel = act_grabbed(m);                break;
    case ACT_IN_CANNON:              cancel = act_in_cannon(m);              break;
    case ACT_TORNADO_TWIRLING:       cancel = act_tornado_twirling(m);       break;
    }

    return cancel;
}

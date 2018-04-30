#include <ultra64.h>

#include "sm64.h"
#include "math_util.h"
#include "save_file.h"

#define INT_GROUND_POUND_OR_TWIRL (1 << 0) // 0x00000001
#define INT_PUNCH                 (1 << 1) // 0x00000002
#define INT_KICK                  (1 << 2) // 0x00000004
#define INT_TRIP                  (1 << 3) // 0x00000008
#define INT_SLIDE_KICK            (1 << 4) // 0x00000010
#define INT_FAST_ATTACK_OR_SHELL  (1 << 5) // 0x00000020
#define INT_HIT_FROM_ABOVE        (1 << 6) // 0x00000040
#define INT_HIT_FROM_BELOW        (1 << 7) // 0x00000080

#define INT_ATTACK_NOT_FROM_BELOW (\
    INT_GROUND_POUND_OR_TWIRL |\
    INT_PUNCH |\
    INT_KICK |\
    INT_TRIP |\
    INT_SLIDE_KICK |\
    INT_FAST_ATTACK_OR_SHELL |\
    INT_HIT_FROM_ABOVE)

#define INT_ANY_ATTACK (\
    INT_GROUND_POUND_OR_TWIRL |\
    INT_PUNCH |\
    INT_KICK |\
    INT_TRIP |\
    INT_SLIDE_KICK |\
    INT_FAST_ATTACK_OR_SHELL |\
    INT_HIT_FROM_ABOVE |\
    INT_HIT_FROM_BELOW)

#define INT_ATTACK_MASK_UNKNOWN_8F (\
    INT_GROUND_POUND_OR_TWIRL |\
    INT_PUNCH |\
    INT_KICK |\
    INT_TRIP |\
    INT_HIT_FROM_BELOW)

static u32 interact_coin(struct MarioState *, u32, struct Object *);
static u32 interact_water_ring(struct MarioState *, u32, struct Object *);
static u32 interact_star_or_key(struct MarioState *, u32, struct Object *);
static u32 interact_bbh_entrance(struct MarioState *, u32, struct Object *);
static u32 interact_warp(struct MarioState *, u32, struct Object *);
static u32 interact_warp_door(struct MarioState *, u32, struct Object *);
static u32 interact_door(struct MarioState *, u32, struct Object *);
static u32 interact_cannon_base(struct MarioState *, u32, struct Object *);
static u32 interact_igloo_barrier(struct MarioState *, u32, struct Object *);
static u32 interact_tornado(struct MarioState *, u32, struct Object *);
static u32 interact_whirlpool(struct MarioState *, u32, struct Object *);
static u32 interact_wind(struct MarioState *, u32, struct Object *);
static u32 interact_flame(struct MarioState *, u32, struct Object *);
static u32 interact_snufit_bullet(struct MarioState *, u32, struct Object *);
static u32 interact_clam_or_bubba(struct MarioState *, u32, struct Object *);
static u32 interact_bully(struct MarioState *, u32, struct Object *);
static u32 interact_shock(struct MarioState *, u32, struct Object *);
static u32 interact_mr_blizzard(struct MarioState *, u32, struct Object *);
static u32 interact_hit_from_below(struct MarioState *, u32, struct Object *);
static u32 interact_bounce_top(struct MarioState *, u32, struct Object *);
static u32 interact_unknown_08(struct MarioState *, u32, struct Object *);
static u32 interact_damage(struct MarioState *, u32, struct Object *);
static u32 interact_breakable(struct MarioState *, u32, struct Object *);
static u32 interact_koopa_shell(struct MarioState *, u32, struct Object *);
static u32 interact_pole(struct MarioState *, u32, struct Object *);
static u32 interact_hoot(struct MarioState *, u32, struct Object *);
static u32 interact_cap(struct MarioState *, u32, struct Object *);
static u32 interact_grabbable(struct MarioState *, u32, struct Object *);
static u32 interact_text(struct MarioState *, u32, struct Object *);

struct InteractionHandler
{
    u32 interactType;
    u32 (*handler)(struct MarioState *, u32, struct Object *);
};

static struct InteractionHandler sInteractionHandlers[] =
    {
        { INTERACT_COIN,           interact_coin            },
        { INTERACT_WATER_RING,     interact_water_ring      },
        { INTERACT_STAR_OR_KEY,    interact_star_or_key     },
        { INTERACT_BBH_ENTRANCE,   interact_bbh_entrance    },
        { INTERACT_WARP,           interact_warp            },
        { INTERACT_WARP_DOOR,      interact_warp_door       },
        { INTERACT_DOOR,           interact_door            },
        { INTERACT_CANNON_BASE,    interact_cannon_base     },
        { INTERACT_IGLOO_BARRIER,  interact_igloo_barrier   },
        { INTERACT_TORNADO,        interact_tornado         },
        { INTERACT_WHIRLPOOL,      interact_whirlpool       },
        { INTERACT_WIND,           interact_wind            },
        { INTERACT_FLAME,          interact_flame           },
        { INTERACT_SNUFIT_BULLET,  interact_snufit_bullet   },
        { INTERACT_CLAM_OR_BUBBA,  interact_clam_or_bubba   },
        { INTERACT_BULLY,          interact_bully           },
        { INTERACT_SHOCK,          interact_shock           },
        { INTERACT_UNKNOWN_20,     interact_bounce_top      },
        { INTERACT_MR_BLIZZARD,    interact_mr_blizzard     },
        { INTERACT_HIT_FROM_BELOW, interact_hit_from_below  },
        { INTERACT_BOUNCE_TOP,     interact_bounce_top      },
        { INTERACT_DAMAGE,         interact_damage          },
        { INTERACT_POLE,           interact_pole            },
        { INTERACT_HOOT,           interact_hoot            },
        { INTERACT_BREAKABLE,      interact_breakable       },
        { INTERACT_KOOPA,          interact_bounce_top      },
        { INTERACT_KOOPA_SHELL,    interact_koopa_shell     },
        { INTERACT_UNKNOWN_08,     interact_unknown_08      },
        { INTERACT_CAP,            interact_cap             },
        { INTERACT_GRABBABLE,      interact_grabbable       },
        { INTERACT_TEXT,           interact_text            },
    };

static u32 sForwardKnockbackActions[][3] =
{
    { ACT_UNKNOWN_065, ACT_UNKNOWN_063, ACT_UNKNOWN_061 },
    { ACT_FORWARD_AIR_KB, ACT_FORWARD_AIR_KB, ACT_HARD_FORWARD_AIR_KB },
    { ACT_UNKNOWN_0C6, ACT_UNKNOWN_0C6, ACT_UNKNOWN_0C6 },
};

static u32 sBackwardKnockbackActions[][3] =
{
    { ACT_UNKNOWN_064, ACT_UNKNOWN_062, ACT_UNKNOWN_060 },
    { ACT_BACKWARD_AIR_KB, ACT_BACKWARD_AIR_KB, ACT_HARD_BACKWARD_AIR_KB },
    { ACT_UNKNOWN_0C5, ACT_UNKNOWN_0C5, ACT_UNKNOWN_0C5 },
};

static u8 sDisplayingDoorText = FALSE;
static u8 sJustWarped = FALSE;
static u8 sPssSlideStarted = FALSE;

static u32 get_mario_cap_flag(struct Object *capObject)
{
    void *script = virtual_to_segmented(0x13, capObject->unk20C);

    if (script == D_13003DD8)
        return MARIO_UNKNOWN_00;
    else if (script == D_13003DB8)
        return MARIO_METAL_CAP;
    else if (script == D_13003D98)
        return MARIO_WING_CAP;
    else if (script == D_13003DFC)
        return MARIO_VANISH_CAP;

    return 0;
}

static u32 object_facing_mario(struct MarioState *m, struct Object *o, s16 angleRange)
{
    f32 dx = m->pos[0] - o->pos[0];
    f32 dz = m->pos[2] - o->pos[2];

    s16 angleToMario = func_8037A9A8(dz, dx);
    s16 dAngle = angleToMario - o->angle[1];

    if (-angleRange <= dAngle && dAngle <= angleRange)
        return TRUE;
    
    return FALSE;
}

s16 mario_angle_to_object(struct MarioState *m, struct Object *o)
{
    f32 dx = o->pos[0] - m->pos[0];
    f32 dz = o->pos[2] - m->pos[2];

    return func_8037A9A8(dz, dx);
}

static u32 determine_interaction(struct MarioState *m, struct Object *o)
{
    u32 interaction = 0;
    u32 action = m->action;

    if (action & ACT_FLAG_ATTACKING)
    {
        if (action == ACT_PUNCHING || action == ACT_MOVE_PUNCHING || action == ACT_JUMP_KICK)
        {
            s16 dYawToObject = mario_angle_to_object(m, o) - m->faceAngle[1];

            if (m->flags & MARIO_UNKNOWN_20)
            {
                if (-0x2AAA <= dYawToObject && dYawToObject <= 0x2AAA)
                    interaction = INT_PUNCH;
            }
            if (m->flags & MARIO_UNKNOWN_21)
            {
                if (-0x2AAA <= dYawToObject && dYawToObject <= 0x2AAA)
                    interaction = INT_KICK;
            }
            if (m->flags & MARIO_UNKNOWN_22)
            {
                if (-0x4000 <= dYawToObject && dYawToObject <= 0x4000)
                    interaction = INT_TRIP;
            }
        }
        else if (action == ACT_GROUND_POUND || action == ACT_TWIRLING)
        {
            if (m->vel[1] < 0.0f)
                interaction = INT_GROUND_POUND_OR_TWIRL;
        }
        else if (action == ACT_GROUND_POUND_LAND || action == ACT_TWIRL_LAND)
        {
            if (m->vel[1] < 0.0f && m->actionState == 0)
                interaction = INT_GROUND_POUND_OR_TWIRL;
        }
        else if (action == ACT_SLIDE_KICK || action == ACT_SLIDE_KICK_SLIDE)
        {
            interaction = INT_SLIDE_KICK;
        }
        else if (action & ACT_FLAG_RIDING_SHELL)
        {
            interaction = INT_FAST_ATTACK_OR_SHELL;
        }
        else if (m->forwardVel <= -26.0f || 26.0f <= m->forwardVel)
        {
            interaction = INT_FAST_ATTACK_OR_SHELL;
        }
    }

    if (interaction == 0 && (action & ACT_FLAG_AIR))
    {
        if (m->vel[1] < 0.0f)
        {
            if (m->pos[1] > o->pos[1])
                interaction = INT_HIT_FROM_ABOVE;
        }
        else
        {
            if (m->pos[1] < o->pos[1])
                interaction = INT_HIT_FROM_BELOW;
        }
    }

    return interaction;
}

static u32 func_8024C37C(struct Object *o, s32 interaction)
{
    u32 result = 0;
    
    switch (interaction)
    {
    case INT_GROUND_POUND_OR_TWIRL: result = 4; break;
    case INT_PUNCH:                 result = 1; break;
    case INT_KICK:
    case INT_TRIP:                  result = 2; break;
    case INT_SLIDE_KICK:
    case INT_FAST_ATTACK_OR_SHELL:  result = 5; break;
    case INT_HIT_FROM_ABOVE:        result = 3; break;
    case INT_HIT_FROM_BELOW:        result = 6; break;
    }

    o->interactStatus = result + 0xC000;
    return result;
}

void mario_stop_riding_object(struct MarioState *m)
{
    if (m->riddenObj != NULL)
    {
        m->riddenObj->interactStatus = 0x00400000;
        func_8024931C();
        m->riddenObj = NULL;
    }
}

void mario_grab_used_object(struct MarioState *m)
{
    if (m->heldObj == NULL)
    {
        m->heldObj = m->usedObj;
        func_8029DA34(m->heldObj, D_13003444);
    }
}

void mario_drop_held_object(struct MarioState *m)
{
    if (m->heldObj != NULL)
    {
        if (m->heldObj->unk20C == segmented_to_virtual(D_13000708))
            func_8024931C();

        func_8029DA34(m->heldObj, D_1300344C);

        m->heldObj->pos[0] = m->unk98->unk18[0];
        m->heldObj->pos[1] = m->pos[1];
        m->heldObj->pos[2] = m->unk98->unk18[2];

        m->heldObj->angle[1] = m->faceAngle[1];

        m->heldObj = NULL;
    }
}

void mario_throw_held_object(struct MarioState *m)
{
    if (m->heldObj != NULL)
    {
        if (m->heldObj->unk20C == segmented_to_virtual(D_13000708))
            func_8024931C();

        func_8029DA34(m->heldObj, D_13003454);

        m->heldObj->pos[0] = m->unk98->unk18[0] + 32.0f * sins(m->faceAngle[1]);
        m->heldObj->pos[1] = m->unk98->unk18[1];
        m->heldObj->pos[2] = m->unk98->unk18[2] + 32.0f * coss(m->faceAngle[1]);

        m->heldObj->angle[1] = m->faceAngle[1];

        m->heldObj = NULL;
    }
}

void mario_stop_riding_and_holding(struct MarioState *m)
{
    mario_drop_held_object(m);
    mario_stop_riding_object(m);

    if (m->action == ACT_RIDING_HOOT)
    {
        m->usedObj->interactStatus = 0;
        m->usedObj->unk110 = D_8032C694;
    }
}

u32 func_8024C75C(struct MarioState *m)
{
    return (m->flags & MARIO_CAP_FLAGS) == (MARIO_UNKNOWN_00 | MARIO_CAP_ON_HEAD);
}

void mario_blow_off_cap(struct MarioState *m, f32 capSpeed)
{
    struct Object *capObject;

    if (func_8024C75C(m))
    {
        save_file_set_cap_pos(m->pos[0], m->pos[1], m->pos[2]);

        m->flags &= ~(MARIO_UNKNOWN_00 | MARIO_CAP_ON_HEAD);

        capObject = SpawnObj(m->marioObj, 136, D_13003DD8);

        capObject->pos[1] += (m->action & ACT_FLAG_SHORT_HITBOX) ? 120.0f : 180.0f;
        capObject->forwardVel = capSpeed;
        capObject->angle[1] = (s16) (m->faceAngle[1] + 0x400);

        if (m->forwardVel < 0.0f)
            capObject->angle[1] = (s16) (capObject->angle[1] + 0x8000);
    }
}

u32 mario_lose_cap_to_enemy(u32 arg)
{
    u32 wasWearingCap = FALSE;

    if (func_8024C75C(gMarioState))
    {
        save_file_set_flags(arg == 1 ? SAVE_FLAG_CAP_ON_KLEPTO : SAVE_FLAG_CAP_ON_UKIKI);
        gMarioState->flags &= ~(MARIO_UNKNOWN_00 | MARIO_CAP_ON_HEAD);
        wasWearingCap = TRUE;
    }
    
    return wasWearingCap;
}

void mario_retrieve_cap(void)
{
    mario_drop_held_object(gMarioState);
    save_file_clear_flags(SAVE_FLAG_CAP_ON_KLEPTO | SAVE_FLAG_CAP_ON_UKIKI);
    gMarioState->flags &= ~MARIO_CAP_ON_HEAD;
    gMarioState->flags |= MARIO_UNKNOWN_00 | MARIO_CAP_IN_HAND;
}

static u32 able_to_grab_object(struct MarioState *m, UNUSED struct Object *o)
{
    u32 action = m->action;

    if (action == ACT_DIVE_SLIDE || action == ACT_DIVE)
    {
        if (!(o->unk190 & 0x00000004))
            return TRUE;
    }
    else if (action == ACT_PUNCHING || action == ACT_MOVE_PUNCHING)
    {
        if (m->actionArg < 2)
            return TRUE;
    }

    return FALSE;
}

struct Object *mario_get_collided_object(struct MarioState *m, u32 interactType)
{
    s32 i;
    struct Object *object;

    for (i = 0; i < m->marioObj->numCollidedObjs; i++)
    {
        object = m->marioObj->collidedObjs[i];

        if (object->interactType == interactType)
            return object;
    }

    return NULL;
}

u32 mario_check_object_grab(struct MarioState *m)
{
    u32 result = FALSE;
    void *script;

    if (m->input & INPUT_INTERACT_OBJ_GRABBABLE)
    {
        script = virtual_to_segmented(0x13, m->interactObj->unk20C);

        if (script == D_13001850)
        {
            s16 facingDYaw = m->faceAngle[1] - m->interactObj->angle[1];
            if (facingDYaw >= -0x5555 && facingDYaw <= 0x5555)
            {
                m->faceAngle[1] = m->interactObj->angle[1];
                m->usedObj = m->interactObj;
                result = set_mario_action(m, ACT_UNKNOWN_190, 0);
            }
        }
        else
        {
            s16 facingDYaw = mario_angle_to_object(m, m->interactObj) - m->faceAngle[1];
            if (facingDYaw >= -0x2AAA && facingDYaw <= 0x2AAA)
            {
                m->usedObj = m->interactObj;

                if (!(m->action & ACT_FLAG_AIR))
                {
                    set_mario_action(
                        m,
                        (m->action & ACT_FLAG_UNKNOWN_19) ? ACT_UNKNOWN_185 : ACT_UNKNOWN_183,
                        0);
                }
    
                result = TRUE;
            }
        }
    }

    return result;
}

static u32 bully_knock_back_mario(struct MarioState *mario)
{
    struct BullyCollisionData marioData;
    struct BullyCollisionData bullyData;
    s16 newMarioYaw;
    s16 newBullyYaw;
    s16 marioDYaw;
    UNUSED s16 bullyDYaw;

    u32 bonkAction = 0;

    struct Object *bully = mario->interactObj;

    //! Conversion ratios multiply to more than 1 (could allow unbounded speed
    // with bonk cancel - but this isn't important for regular bully battery)
    f32 bullyToMarioRatio = bully->hitboxRadius * 3.0f / 53.0f;
    f32 marioToBullyRatio = 53.0f / bully->hitboxRadius;

    init_bully_collision_data(
        &marioData,
        mario->pos[0],
        mario->pos[2],
        mario->forwardVel,
        mario->faceAngle[1],
        bullyToMarioRatio,
        52.0f);

    init_bully_collision_data(
        &bullyData,
        bully->pos[0],
        bully->pos[2],
        bully->forwardVel,
        bully->angle[1],
        marioToBullyRatio,
        bully->hitboxRadius + 2.0f);

    if (mario->forwardVel != 0.0f)
        transfer_bully_speed(&marioData, &bullyData);
    else
        transfer_bully_speed(&bullyData, &marioData);

    newMarioYaw = func_8037A9A8(marioData.velZ, marioData.velX);
    newBullyYaw = func_8037A9A8(bullyData.velZ, bullyData.velX);

    marioDYaw = newMarioYaw - mario->faceAngle[1];
    bullyDYaw = newBullyYaw - bully->angle[1];

    mario->faceAngle[1] = newMarioYaw;
    mario->forwardVel =
        sqrtf(marioData.velX * marioData.velX + marioData.velZ * marioData.velZ);
    mario->pos[0] = marioData.posX;
    mario->pos[2] = marioData.posZ;

    bully->angle[1] = newBullyYaw;
    bully->forwardVel =
        sqrtf(bullyData.velX * bullyData.velX + bullyData.velZ * bullyData.velZ);
    bully->pos[0] = bullyData.posX;
    bully->pos[2] = bullyData.posZ;

    if (marioDYaw < -0x4000 || marioDYaw > 0x4000)
    {
        mario->faceAngle[1] += 0x8000;
        mario->forwardVel *= -1.0f;

        if (mario->action & ACT_FLAG_AIR)
            bonkAction = ACT_BACKWARD_AIR_KB;
        else
            bonkAction = ACT_UNKNOWN_064;
    }
    else
    {
        if (mario->action & ACT_FLAG_AIR)
            bonkAction = ACT_FORWARD_AIR_KB;
        else
            bonkAction = ACT_UNKNOWN_065;
    }

    return bonkAction;
}

static void bounce_off_object(struct MarioState *m, struct Object *o, f32 velY)
{
    m->pos[1] = o->pos[1] + o->hitboxHeight;
    m->vel[1] = velY;

    m->flags &= ~MARIO_UNKNOWN_08;

    SetSound(0x0459B081, &m->marioObj->gfx.unk54);
}

static void hit_object_from_below(struct MarioState *m, UNUSED struct Object *o)
{
    m->vel[1] = 0.0f;
    func_8027EFE0(8);
}

static u32 unused_determine_knockback_action(struct MarioState *m)
{
    u32 bonkAction;
    s16 angleToObject = mario_angle_to_object(m, m->interactObj);
    s16 facingDYaw = angleToObject - m->faceAngle[1];

    if (m->forwardVel < 16.0f)
        m->forwardVel = 16.0f;

    m->faceAngle[1] = angleToObject;

    if (facingDYaw >= -0x4000 && facingDYaw <= 0x4000)
    {
        m->forwardVel *= -1.0f;
        if (m->action & (ACT_FLAG_AIR | ACT_FLAG_ON_POLE | ACT_FLAG_HANGING))
            bonkAction = ACT_BACKWARD_AIR_KB;
        else
            bonkAction = ACT_UNKNOWN_064;
    }
    else
    {
        m->faceAngle[1] += 0x8000;
        if (m->action & (ACT_FLAG_AIR | ACT_FLAG_ON_POLE | ACT_FLAG_HANGING))
            bonkAction = ACT_FORWARD_AIR_KB;
        else
            bonkAction = ACT_UNKNOWN_065;
    }

    return bonkAction;
}

static u32 determine_knockback_action(struct MarioState *m, UNUSED s32 arg)
{
    u32 bonkAction;

    s16 terrainIndex = 0; // 1 = air, 2 = water, 0 = default
    s16 strengthIndex = 0;
    
    s16 angleToObject = mario_angle_to_object(m, m->interactObj);
    s16 facingDYaw = angleToObject - m->faceAngle[1];
    s16 remainingHealth = m->health - 0x40 * m->hurtCounter;

    if (m->action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER))
        terrainIndex = 2;
    else if (m->action & (ACT_FLAG_AIR | ACT_FLAG_ON_POLE | ACT_FLAG_HANGING))
        terrainIndex = 1;

    if (remainingHealth < 0x100)
        strengthIndex = 2;
    else if (m->interactObj->unk180 >= 4)
        strengthIndex = 2;
    else if (m->interactObj->unk180 >= 2)
        strengthIndex = 1;

    m->faceAngle[1] = angleToObject;

    if (terrainIndex == 2)
    {
        if (m->forwardVel < 28.0f)
            func_802514DC(m, 28.0f);

        if (m->pos[1] >= m->interactObj->pos[1])
        {
            if (m->vel[1] < 20.0f)
                m->vel[1] = 20.0f;
        }
        else
        {
            if (m->vel[1] > 0.0f)
                m->vel[1] = 0.0f;
        }
    }
    else
    {
        if (m->forwardVel < 16.0f)
            func_802514DC(m, 16.0f);
    }

    if (-0x4000 <= facingDYaw && facingDYaw <= 0x4000)
    {
        m->forwardVel *= -1.0f;
        bonkAction = sBackwardKnockbackActions[terrainIndex][strengthIndex];
    }
    else
    {
        m->faceAngle[1] += 0x8000;
        bonkAction = sForwardKnockbackActions[terrainIndex][strengthIndex];
    }

    return bonkAction;
}

static void push_mario_out_of_object(struct MarioState *m, struct Object *o, f32 padding)
{
    f32 minDistance = o->hitboxRadius + m->marioObj->hitboxRadius + padding;

    f32 offsetX = m->pos[0] - o->pos[0];
    f32 offsetZ = m->pos[2] - o->pos[2];
    f32 distance = sqrtf(offsetX * offsetX + offsetZ * offsetZ);

    if (distance < minDistance)
    {
        struct Surface *floor;
        s16 pushAngle;
        f32 newMarioX;
        f32 newMarioZ;

        if (distance == 0.0f)
            pushAngle = m->faceAngle[1];
        else
            pushAngle = func_8037A9A8(offsetZ, offsetX);

        newMarioX = o->pos[0] + minDistance * sins(pushAngle);
        newMarioZ = o->pos[2] + minDistance * coss(pushAngle);

        func_80380DE8(&newMarioX, &m->pos[1], &newMarioZ, 60.0f, 50.0f);

        func_80381900(newMarioX, m->pos[1], newMarioZ, &floor);
        if (floor != NULL)
        {
            //! Doesn't update mario's referenced floor (allows oob death when
            // an object pushes you into a steep slope while in a ground action)
            m->pos[0] = newMarioX;
            m->pos[2] = newMarioZ;
        }
    }
}

static void bounce_back_from_attack(struct MarioState *m, u32 interaction)
{
    if (interaction & (INT_PUNCH | INT_KICK | INT_TRIP))
    {
        if (m->action == ACT_PUNCHING)
            m->action = ACT_MOVE_PUNCHING;

        if (m->action & ACT_FLAG_AIR)
            func_802514DC(m, -16.0f);
        else
            func_802514DC(m, -48.0f);

        func_8027EFE0(1);
        m->unk08 |= 0x00040000;
    }

    if (interaction & (INT_PUNCH | INT_KICK | INT_TRIP | INT_FAST_ATTACK_OR_SHELL))
        SetSound(0x0444B081, &m->marioObj->gfx.unk54);
}

static u32 func_8024D664(struct MarioState *m, struct Object *o)
{
    f32 dx = o->pos[0] - m->pos[0];
    f32 dz = o->pos[2] - m->pos[2];

    s16 dYaw = o->angle[1] - func_8037A9A8(dz, dx);

    return (dYaw >= -0x4000 && dYaw <= 0x4000) ? 0x00000001 : 0x00000002;
}

static u32 take_damage_from_interact_object(struct MarioState *m)
{
    s32 val4;
    s32 damage = m->interactObj->unk180;

    if (damage >= 4)
        val4 = 5;
    else if (damage >= 2)
        val4 = 4;
    else
        val4 = 3;

    if (!(m->flags & MARIO_CAP_ON_HEAD))
        damage += (damage + 1) / 2;

    if (m->flags & MARIO_METAL_CAP)
        damage = 0;

    m->hurtCounter += 4 * damage;

    func_8027EFE0(val4);
    return damage;
}

static u32 take_damage_and_knock_back(struct MarioState *m, struct Object *o)
{
    u32 damage;

    if (D_80339F02 == 0 && !(m->flags & MARIO_VANISH_CAP) && !(o->unk190 & 0x00000002))
    {
        o->interactStatus = 0x0000A000;
        m->interactObj = o;

        damage = take_damage_from_interact_object(m);

        if (o->unk190 & 0x00000008)
            m->forwardVel = 40.0f;

        if (o->unk180 > 0)
            SetSound(0x240AFF81, &m->marioObj->gfx.unk54);

        func_80251F74(m);
        return drop_and_set_mario_action(m, determine_knockback_action(m, o->unk180), damage);
    }

    return FALSE;
}

static void reset_mario_pitch(struct MarioState *m)
{
    if (m->action == ACT_WATER_JUMP || m->action == ACT_SHOT_FROM_CANNON ||
        m->action == ACT_FLYING)
    {
        func_80285BD8(m->area->unk24, m->area->unk24[1], 1);
        m->faceAngle[0] = 0;
    }
}

static u32 interact_coin(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    m->numCoins += o->unk180;
    m->healCounter += 4 * o->unk180;

    o->interactStatus = 0x00008000;

    if (gCurrCourseNum >= 1 && gCurrCourseNum <= 15 &&
        m->numCoins - o->unk180 < 100 && m->numCoins >= 100)
    {
        func_802AACE4(6);
    }

    return FALSE;
}

static u32 interact_water_ring(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    m->healCounter += 4 * o->unk180;
    o->interactStatus = 0x00008000;
    return FALSE;
}

static u32 interact_star_or_key(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    u32 starIndex;
    u32 starGrabAction = ACT_STAR_DANCE_EXIT;
    u32 noExit = (o->unk190 & 0x00000400) != 0;
    u32 grandStar = (o->unk190 & 0x00000800) != 0;

    if (m->health >= 0x100)
    {
        mario_stop_riding_and_holding(m);

        if (!noExit)
        {
            m->hurtCounter = 0;
            m->healCounter = 0;
            if (m->capTimer > 1)
                m->capTimer = 1;
        }

        if (noExit)
            starGrabAction = ACT_STAR_DANCE_NO_EXIT;
        
        if (m->action & ACT_FLAG_SWIMMING)
            starGrabAction = ACT_STAR_DANCE_WATER;
        
        if (m->action & ACT_FLAG_METAL_WATER)
            starGrabAction = ACT_STAR_DANCE_WATER;

        if (m->action & ACT_FLAG_AIR)
            starGrabAction = ACT_FALL_AFTER_STAR_GRAB;

        SpawnObj(o, 0, D_13003890);

        o->interactStatus = 0x00008000;
        m->interactObj = o;
        m->usedObj = o;

        starIndex = (o->unk188 >> 24) & 0x1F;
        save_file_collect_star_or_key(m->numCoins, starIndex);
        m->numStars = save_file_get_total_star_count(gCurrSaveFileNum - 1, 0, 24);

        if (!noExit)
        {
            func_80320E74();
            func_8024924C(0x7E);
        }

        SetSound(0x701EFF81, &m->marioObj->gfx.unk54);

        if (grandStar)
            return set_mario_action(m, ACT_GRABBED_GRAND_STAR, 0);
        
        return set_mario_action(m, starGrabAction, noExit + 2*grandStar);
    }

    return FALSE;
}

static u32 interact_bbh_entrance(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    if (m->action != ACT_BBH_ENTER_SPIN && m->action != ACT_BBH_ENTER_JUMP)
    {
        mario_stop_riding_and_holding(m);

        o->interactStatus = 0x00008000;
        m->interactObj = o;
        m->usedObj = o;

        if (m->action & ACT_FLAG_AIR)
            return set_mario_action(m, ACT_BBH_ENTER_SPIN, 0);
        
        return set_mario_action(m, ACT_BBH_ENTER_JUMP, 0);
    }

    return FALSE;
}

static u32 interact_warp(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    u32 action;

    if (o->unk190 & 0x00000001)
    {
        action = m->action;

        if (action == ACT_WARP_FADE_IN)
            sJustWarped = TRUE;

        else if (!sJustWarped)
        {
            if (action == ACT_IDLE || action == ACT_PANTING ||
                action == ACT_STANDING_AGAINST_WALL || action == ACT_CROUCHING)
            {
                m->interactObj = o;
                m->usedObj = o;

                sJustWarped = TRUE;
                return set_mario_action(m, ACT_WARP_FADE_OUT, 0);
            }
        }
    }
    else
    {
        if (m->action != ACT_EMERGE_FROM_PIPE)
        {
            o->interactStatus = 0x00008000;
            m->interactObj = o;
            m->usedObj = o;

            SetSound(
                o->collisionData == segmented_to_virtual(D_03009AC8)
                    ? 0x7016A081
                    : 0x71198081,
                &m->marioObj->gfx.unk54);

            mario_stop_riding_object(m);
            return set_mario_action(m, ACT_DISAPPEARED, 0x00040002);
        }
    }

    return FALSE;
}

static u32 interact_warp_door(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    u32 doorAction = 0;
    u32 saveFlags = save_file_get_flags();
    s16 warpDoorId = o->unk188 >> 24;
    u32 actionArg;

    if (m->action == ACT_WALKING || m->action == ACT_DECELERATING)
    {
        if (warpDoorId == 1 && !(saveFlags & SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR))
        {
            if (!(saveFlags & SAVE_FLAG_HAVE_KEY_2))
            {
                if (!sDisplayingDoorText)
                    set_mario_action(m, ACT_UNKNOWN_105, (saveFlags & SAVE_FLAG_HAVE_KEY_1) ? 0x17 : 0x16);
                sDisplayingDoorText = TRUE;

                return FALSE;
            }

            doorAction = ACT_UNLOCKING_KEY_DOOR;
        }

        if (warpDoorId == 2 && !(saveFlags & SAVE_FLAG_UNLOCKED_BASEMENT_DOOR))
        {
            if (!(saveFlags & SAVE_FLAG_HAVE_KEY_1))
            {
                if (!sDisplayingDoorText)
                    // Moat door skip was intended confirmed
                    set_mario_action(m, ACT_UNKNOWN_105, (saveFlags & SAVE_FLAG_HAVE_KEY_2) ? 0x17 : 0x16);
                sDisplayingDoorText = TRUE;

                return FALSE;
            }

            doorAction = ACT_UNLOCKING_KEY_DOOR;
        }

        if (m->action == ACT_WALKING || m->action == ACT_DECELERATING)
        {
            actionArg = func_8024D664(m, o) + 0x00000004;

            if (doorAction == 0)
            {
                if (actionArg & 0x00000001)
                    doorAction = ACT_PULLING_DOOR;
                else
                    doorAction = ACT_PUSHING_DOOR;
            }

            m->interactObj = o;
            m->usedObj = o;
            return set_mario_action(m, doorAction, actionArg);
        }
    }

    return FALSE;
}

u32 get_door_save_file_flag(struct Object *door)
{
    u32 saveFileFlag = 0;
    s16 requiredNumStars = door->unk188 >> 24;
    
    s16 isCcmDoor = door->pos[0] < 0.0f;
    s16 isPssDoor = door->pos[1] > 500.0f;

    switch (requiredNumStars)
    {
    case 1:
        if (isPssDoor)
            saveFileFlag = SAVE_FLAG_UNLOCKED_PSS_DOOR;
        else
            saveFileFlag = SAVE_FLAG_UNLOCKED_WF_DOOR;
        break;

    case 3:
        if (isCcmDoor)
            saveFileFlag = SAVE_FLAG_UNLOCKED_CCM_DOOR;
        else 
            saveFileFlag = SAVE_FLAG_UNLOCKED_JRB_DOOR;
        break;

    case 8:
        saveFileFlag = SAVE_FLAG_UNLOCKED_BITDW_DOOR;
        break;

    case 30:
        saveFileFlag = SAVE_FLAG_UNLOCKED_BITFS_DOOR;
        break;

    case 50:
        saveFileFlag = SAVE_FLAG_UNLOCKED_50_STAR_DOOR;
        break;
    }
 
    return saveFileFlag;
}

static u32 interact_door(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    s16 requiredNumStars = o->unk188 >> 24;
    s16 numStars = save_file_get_total_star_count(gCurrSaveFileNum - 1, 0, 24);

    if (m->action == ACT_WALKING || m->action == ACT_DECELERATING)
    {
        if (numStars >= requiredNumStars)
        {
            u32 actionArg = func_8024D664(m, o);
            u32 enterDoorAction;
            u32 doorSaveFileFlag;

            if (actionArg & 0x00000001)
                enterDoorAction = ACT_PULLING_DOOR;
            else
                enterDoorAction = ACT_PUSHING_DOOR;

            doorSaveFileFlag = get_door_save_file_flag(o);
            m->interactObj = o;
            m->usedObj = o;

            if (o->unk190 & 0x00000020)
                enterDoorAction = ACT_ENTERING_STAR_DOOR;

            if (doorSaveFileFlag != 0 && !(save_file_get_flags() & doorSaveFileFlag))
                enterDoorAction = ACT_UNKNOWN_12F;

            return set_mario_action(m, enterDoorAction, actionArg);
        }
        else if (!sDisplayingDoorText)
        {
            u32 text = 0x00160000;

            switch (requiredNumStars)
            {
            case  1: text = 0x00180000; break;
            case  3: text = 0x00190000; break;
            case  8: text = 0x001A0000; break;
            case 30: text = 0x001B0000; break;
            case 50: text = 0x001C0000; break;
            case 70: text = 0x001D0000; break;
            }

            text += requiredNumStars - numStars;

            sDisplayingDoorText = TRUE;
            return set_mario_action(m, ACT_UNKNOWN_105, text);
        }
    }
    else if (m->action == ACT_IDLE && sDisplayingDoorText == TRUE && requiredNumStars == 70)
    {
        m->interactObj = o;
        m->usedObj = o;
        return set_mario_action(m, ACT_ENTERING_STAR_DOOR, func_8024D664(m, o));
    }

    return FALSE;
}

static u32 interact_cannon_base(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    if (m->action != ACT_IN_CANNON)
    {
        mario_stop_riding_and_holding(m);
        o->interactStatus = 0x00008000;
        m->interactObj = o;
        m->usedObj = o;
        return set_mario_action(m, ACT_IN_CANNON, 0);
    }

    return FALSE;
}

static u32 interact_igloo_barrier(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    //! Sets used object without changing action (LOTS of interesting glitches,
    // but unfortunately the igloo barrier is the only object with this interaction
    // type)
    m->interactObj = o;
    m->usedObj = o;
    push_mario_out_of_object(m, o, 5.0f);
    return FALSE;
}

static u32 interact_tornado(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    struct Object *marioObj = m->marioObj;

    if (m->action != ACT_TORNADO_TWIRLING && m->action != ACT_SQUISHED)
    {
        mario_stop_riding_and_holding(m);
        func_802514DC(m, 0.0f);
        func_80251F74(m);

        o->interactStatus = 0x00008000;
        m->interactObj = o;
        m->usedObj = o;

        marioObj->unk10C = 0x00000400;
        // TODO: Hack until we figure out how to best handle object data
        *(f32 *) &marioObj->unk110 = m->pos[1] - o->pos[1];

        SetSound(0x2410C081, &m->marioObj->gfx.unk54);
        return set_mario_action(m, ACT_TORNADO_TWIRLING, m->action == ACT_TWIRLING);
    }

    return FALSE;
}

static u32 interact_whirlpool(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    struct Object *marioObj = m->marioObj;

    if (m->action != ACT_CAUGHT_IN_WHIRLPOOL)
    {
        mario_stop_riding_and_holding(m);
        o->interactStatus = 0x00008000;
        m->interactObj = o;
        m->usedObj = o;

        m->forwardVel = 0.0f;
        
        // TODO: Hack
        *(f32 *) &marioObj->unk110 = m->pos[1] - o->pos[1];

        SetSound(0x2410C081, &m->marioObj->gfx.unk54);
        return set_mario_action(m, ACT_CAUGHT_IN_WHIRLPOOL, 0);
    }

    return FALSE;
}

static u32 interact_wind(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    UNUSED struct Object *marioObj = m->marioObj;

    if (m->action != ACT_GETTING_BLOWN)
    {
        mario_stop_riding_and_holding(m);
        o->interactStatus = 0x00008000;
        m->interactObj = o;
        m->usedObj = o;

        m->faceAngle[1] = o->angle[1] + 0x8000;
        m->unkC4 = 0.4f;
        m->forwardVel = -24.0f;
        m->vel[1] = 12.0f;

        SetSound(0x2410C081, &m->marioObj->gfx.unk54);
        func_80251F74(m);
        return set_mario_action(m, ACT_GETTING_BLOWN, 0);
    }

    return FALSE;
}

static u32 interact_flame(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    u32 burningAction = ACT_BURNING_JUMP;

    if (D_80339F02 == 0 &&
        !(m->flags & MARIO_METAL_CAP) &&
        !(m->flags & MARIO_VANISH_CAP) &&
        !(o->unk190 & 0x00000002))
    {
        o->interactStatus = 0x00008000;
        m->interactObj = o;

        if ((m->action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)) ||
            m->waterLevel - m->pos[1] > 50.0f)
        {
            SetSound(0x30038081, &m->marioObj->gfx.unk54);
        }
        else
        {
            m->marioObj->unk110 = 0;
            func_80251F74(m);
            SetSound(0x2414A081, &m->marioObj->gfx.unk54);

            if ((m->action & ACT_FLAG_AIR) && m->vel[1] <= 0.0f)
                burningAction = ACT_BURNING_FALL;

            return drop_and_set_mario_action(m, burningAction, 1);
        }
    }

    return FALSE;
}

static u32 interact_snufit_bullet(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    if (D_80339F02 == 0 && !(m->flags & MARIO_VANISH_CAP))
    {
        if (m->flags & MARIO_METAL_CAP)
        {
            o->interactStatus = 0x0000C000;
            SetSound(0x0458A081, &m->marioObj->gfx.unk54);
        }
        else
        {
            o->interactStatus = 0x0000A000;
            m->interactObj = o;
            take_damage_from_interact_object(m);

            SetSound(0x240AFF81, &m->marioObj->gfx.unk54);
            func_80251F74(m);

            return drop_and_set_mario_action(m, determine_knockback_action(m, o->unk180), o->unk180);
        }
    }

    if (!(o->unk190 & 0x00000002))
        D_80339F00 = TRUE;

    return FALSE;
}

static u32 interact_clam_or_bubba(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    if (o->unk190 & 0x00002000)
    {
        o->interactStatus = 0x00008000;
        m->interactObj = o;
        return set_mario_action(m, ACT_EATEN_BY_BUBBA, 0);
    }
    else if (take_damage_and_knock_back(m, o))
    {
        return TRUE;
    }
    
    if (!(o->unk190 & 0x00000002))
        D_80339F00 = TRUE;
    return TRUE;

}

static u32 interact_bully(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    UNUSED u32 unused;

    u32 interaction;
    if (m->flags & MARIO_METAL_CAP)
        interaction = INT_FAST_ATTACK_OR_SHELL;
    else
        interaction = determine_interaction(m, o);

    m->interactObj = o;

    if (interaction & INT_ATTACK_NOT_FROM_BELOW)
    {
        push_mario_out_of_object(m, o, 5.0f);

        m->forwardVel = -16.0f;
        o->angle[1] = m->faceAngle[1];
        o->forwardVel = 3392.0f / o->hitboxRadius;

        func_8024C37C(o, interaction);
        bounce_back_from_attack(m, interaction);
        return TRUE;
    }

    else if (!D_80339F02 && !(m->flags & MARIO_VANISH_CAP) && !(o->unk190 & 0x00000002))
    {
        o->interactStatus = 0x00008000;
        m->invincTimer = 2;

        func_80251F74(m);
        SetSound(0x24098081, &m->marioObj->gfx.unk54);
        SetSound(0x50178081, &m->marioObj->gfx.unk54);

        push_mario_out_of_object(m, o, 5.0f);
        drop_and_set_mario_action(m, bully_knock_back_mario(m), 0);
        return TRUE;
    }

    return FALSE;
}

static u32 interact_shock(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    if (!D_80339F02 && !(m->flags & MARIO_VANISH_CAP) && !(o->unk190 & 0x00000002))
    {
        u32 actionArg = (m->action & (ACT_FLAG_AIR | ACT_FLAG_ON_POLE | ACT_FLAG_HANGING)) == 0;

        o->interactStatus = 0x0000A000;
        m->interactObj = o;

        take_damage_from_interact_object(m);
        SetSound(0x240AFF81, &m->marioObj->gfx.unk54);

        if (m->action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER))
        {
            return drop_and_set_mario_action(m, ACT_WATER_SHOCKED, 0);
        }
        else
        {
            func_80251F74(m);
            return drop_and_set_mario_action(m, ACT_SHOCKED, actionArg);
        }
    }

    if (!(o->unk190 & 0x00000002))
        D_80339F00 = TRUE;
    return FALSE;
}

static u32 func_8024EF8C(UNUSED struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    if (!(o->unk190 & 0x00000002))
        D_80339F00 = TRUE;
    return FALSE;
}

static u32 interact_mr_blizzard(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    if (take_damage_and_knock_back(m, o))
        return TRUE;

    if (!(o->unk190 & 0x00000002))
        D_80339F00 = TRUE;

    return FALSE;
}

static u32 interact_hit_from_below(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    UNUSED u32 unused;

    u32 interaction;
    if (m->flags & MARIO_METAL_CAP)
        interaction = INT_FAST_ATTACK_OR_SHELL;
    else
        interaction = determine_interaction(m, o);

    if (interaction & INT_ANY_ATTACK)
    {
        func_8024C37C(o, interaction);
        bounce_back_from_attack(m, interaction);

        if (interaction & INT_HIT_FROM_BELOW)
            hit_object_from_below(m, o);

        if (interaction & INT_HIT_FROM_ABOVE)
        {
            if (o->unk190 & 0x00000080)
            {
                bounce_off_object(m, o, 80.0f);
                reset_mario_pitch(m);
                return drop_and_set_mario_action(m, ACT_TWIRLING, 0);
            }
            else
            {
                bounce_off_object(m, o, 30.0f);
            }
        }
    }
    else if (take_damage_and_knock_back(m, o))
    {
        return TRUE;
    }

    if (!(o->unk190 & 0x00000002))
        D_80339F00 = TRUE;
    return FALSE;
}

static u32 interact_bounce_top(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    u32 interaction;
    if (m->flags & MARIO_METAL_CAP)
        interaction = INT_FAST_ATTACK_OR_SHELL;
    else
        interaction = determine_interaction(m, o);

    if (interaction & INT_ATTACK_NOT_FROM_BELOW)
    {
        func_8024C37C(o, interaction);
        bounce_back_from_attack(m, interaction);

        if (interaction & INT_HIT_FROM_ABOVE)
        {
            if (o->unk190 & 0x00000080)
            {
                bounce_off_object(m, o, 80.0f);
                reset_mario_pitch(m);
                return drop_and_set_mario_action(m, ACT_TWIRLING, 0);
            }
            else
            {
                bounce_off_object(m, o, 30.0f);
            }
        }
    }
    else if (take_damage_and_knock_back(m, o))
    {
        return TRUE;
    }

    if (!(o->unk190 & 0x00000002))
        D_80339F00 = TRUE;
    return FALSE;
}

static u32 interact_unknown_08(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    u32 interaction = determine_interaction(m, o);

    if (interaction & INT_PUNCH)
    {
        o->interactStatus = 0x0000C001;
        bounce_back_from_attack(m, interaction);
    }
    else if (take_damage_and_knock_back(m, o))
    {
        return TRUE;
    }

    if (!(o->unk190 & 0x00000002))
        D_80339F00 = TRUE;
    return FALSE;
}

static u32 interact_damage(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    if (take_damage_and_knock_back(m, o))
        return TRUE;

    if (!(o->unk190 & 0x00000002))
        D_80339F00 = TRUE;
    return FALSE;
}

static u32 interact_breakable(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    u32 interaction = determine_interaction(m, o);
    
    if (interaction & INT_ATTACK_MASK_UNKNOWN_8F)
    {
        func_8024C37C(o, interaction);
        bounce_back_from_attack(m, interaction);

        m->interactObj = o;

        switch (interaction)
        {
        case INT_HIT_FROM_ABOVE:
            bounce_off_object(m, o, 30.0f); //! Not in the 0x8F mask
            break;
        
        case INT_HIT_FROM_BELOW:
            hit_object_from_below(m, o);
            break;
        }

        return TRUE;
    }

    return FALSE;
}

static u32 interact_koopa_shell(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    if (!(m->action & ACT_FLAG_RIDING_SHELL))
    {
        u32 interaction = determine_interaction(m, o);

        if (interaction == INT_HIT_FROM_ABOVE ||
            m->action == ACT_WALKING ||
            m->action == ACT_UNKNOWN_042)
        {
            m->interactObj = o;
            m->usedObj = o;
            m->riddenObj = o;

            func_8024C37C(o, interaction);
            func_80251F74(m);
            func_802492E0();
            mario_drop_held_object(m);

            //! Puts mario in ground action even when in air, making it easy to
            // escape air actions into crouch slide (shell cancel)
            return set_mario_action(m, ACT_RIDING_SHELL_GROUND, 0);
        }
        
        push_mario_out_of_object(m, o, 2.0f);
    }

    return FALSE;
}

static u32 check_object_grab_mario(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    if ((!(m->action & (ACT_FLAG_AIR | ACT_FLAG_UNKNOWN_17 | ACT_FLAG_ATTACKING)) ||
            !D_80339F02) &&
        (o->unk190 & 0x00000004))
    {
        if (object_facing_mario(m, o, 0x2AAA))
        {
            mario_stop_riding_and_holding(m);
            o->interactStatus = 0x00008800;

            m->faceAngle[1] = o->angle[1];
            m->interactObj = o;
            m->usedObj = o;

            func_80251F74(m);
            SetSound(0x240B8081, &m->marioObj->gfx.unk54);
            return set_mario_action(m, ACT_UNKNOWN_170, 0);
        }
    }

    push_mario_out_of_object(m, o, -5.0f);
    return FALSE;
}

static u32 interact_pole(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    s32 actionId = m->action & ACT_ID_MASK;
    if (actionId >= 0x080 && actionId < 0x0A0)
    {
        if (!(m->prevAction & ACT_FLAG_ON_POLE) || m->usedObj != o)
        {
            u32 lowSpeed = m->forwardVel <= 10.0f;
            struct Object *marioObj = m->marioObj;

            mario_stop_riding_and_holding(m);

            m->interactObj = o;
            m->usedObj = o;
            m->vel[1] = 0.0f;
            m->forwardVel = 0.0f;

            // TODO: Hack
            *(s32 *) &marioObj->unk108 = 0;
            marioObj->unk10C = 0;
            *(f32 *) &marioObj->unk110 = m->pos[1] - o->pos[1];

            if (lowSpeed)
                return set_mario_action(m, ACT_GRAB_POLE_SLOW, 0);

            marioObj->unk10C = (s32) (m->forwardVel * 0x100 + 0x1000);
            reset_mario_pitch(m);
            return set_mario_action(m, ACT_GRAB_POLE_FAST, 0);
        }
    }

    return FALSE;
}

static u32 interact_hoot(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    s32 actionId = m->action & ACT_ID_MASK;
    if (actionId >= 0x080 && actionId < 0x098 && (D_8032C694 - m->usedObj->unk110 > 30))
    {
        mario_stop_riding_and_holding(m);
        o->interactStatus = 0x00000001;
        m->interactObj = o;
        m->usedObj = o;

        func_80251F74(m);
        return set_mario_action(m, ACT_RIDING_HOOT, 0);
    }

    return FALSE;
}

static u32 interact_cap(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    u32 capFlag = get_mario_cap_flag(o);
    u16 capMusic = 0;
    u16 capTime = 0;

    if (m->action != ACT_GETTING_BLOWN && capFlag != 0)
    {
        m->interactObj = o;
        o->interactStatus = 0x00008000;

        m->flags &= ~MARIO_CAP_ON_HEAD & ~MARIO_CAP_IN_HAND;
        m->flags |= capFlag;

        switch (capFlag)
        {
        case MARIO_VANISH_CAP:
            capTime = 600;
            capMusic = 0x040E;
            break;

        case MARIO_METAL_CAP:
            capTime = 600;
            capMusic = 0x040F;
            break;

        case MARIO_WING_CAP:
            capTime = 1800;
            capMusic = 0x040E;
            break;
        }

        if (capTime > m->capTimer)
            m->capTimer = capTime;

        if ((m->action & ACT_FLAG_UNKNOWN_22) || m->action == ACT_WALKING)
        {
            m->flags |= MARIO_CAP_IN_HAND;
            set_mario_action(m, ACT_PUTTING_ON_CAP, 0);
        }
        else
        {
            m->flags |= MARIO_CAP_ON_HEAD;
        }

        SetSound(0x701EFF81, &m->marioObj->gfx.unk54);
        SetSound(0x240C8081, &m->marioObj->gfx.unk54);

        if (capMusic != 0)
            func_80249368(capMusic);

        return TRUE;
    }

    return FALSE;
}

static u32 interact_grabbable(struct MarioState *m, u32 interactType, struct Object *o)
{
    void *script = virtual_to_segmented(0x13, o->unk20C);

    if (o->unk190 & 0x00000100)
    {
        u32 interaction = determine_interaction(m, o);
        if (interaction & (INT_KICK | INT_TRIP))
        {
            func_8024C37C(o, interaction);
            bounce_back_from_attack(m, interaction);
            return FALSE;
        }
    }

    if ((o->unk190 & 0x00000004))
        if (check_object_grab_mario(m, interactType, o))
            return TRUE;

    if (able_to_grab_object(m, o))
    {
        if (!(o->unk190 & 0x00000200))
        {
            m->interactObj = o;
            m->input |= INPUT_INTERACT_OBJ_GRABBABLE;
            return TRUE;
        }
    }

    if (script != D_13001850)
        push_mario_out_of_object(m, o, -5.0f);
    return FALSE;
}

static u32 func_8024FC94(struct MarioState *m, u32 arg)
{
    s16 val6;

    if ((m->action & 0x00400000) != 0x00000000)
        return TRUE;

    if (m->action == ACT_WALKING)
    {
        if (arg)
            return TRUE;

        val6 = m->marioObj->gfx.unk38;

        if (val6 == 0x0080 || val6 == 0x007F || val6 == 0x006C)
            return TRUE;
    }

    return FALSE;
}

static u32 func_8024FD2C(struct MarioState *m, struct Object *o)
{
    if ((m->input & INPUT_B_PRESSED) && func_8024FC94(m, 0) && object_facing_mario(m, o, 0x38E3))
    {
        s16 facingDYaw = (s16) (o->angle[1] + 0x8000) - m->faceAngle[1];
        if (facingDYaw >= -0x38E3 && facingDYaw <= 0x38E3)
        {
            f32 val8 = o->pos[0] + 105.0f * sins(o->angle[1]);
            f32 val4 = o->pos[2] + 105.0f * coss(o->angle[1]);

            // TODO: Hack
            *(s32 *) &m->marioObj->unk108 = facingDYaw;
            *(f32 *) &m->marioObj->unk10C = val8 - m->pos[0];
            *(f32 *) &m->marioObj->unk110 = val4 - m->pos[2];

            m->interactObj = o;
            m->usedObj = o;
            return set_mario_action(m, ACT_READING_SIGN, 0);
        }
    }

    return FALSE;
}

static u32 func_8024FEC0(struct MarioState *m, struct Object *o)
{
    if ((m->input & INPUT_B_PRESSED) && func_8024FC94(m, 1))
    {
        s16 facingDYaw = mario_angle_to_object(m, o) - m->faceAngle[1];
        if (facingDYaw >= -0x4000 && facingDYaw <= 0x4000)
        {
            o->interactStatus = 0x00008000;

            m->interactObj = o;
            m->usedObj = o;

            push_mario_out_of_object(m, o, -10.0f);
            return set_mario_action(m, ACT_UNKNOWN_10A, 0);
        }
    }

    push_mario_out_of_object(m, o, -10.0f);
    return FALSE;
}

static u32 interact_text(struct MarioState *m, UNUSED u32 interactType, struct Object *o)
{
    u32 interact = FALSE;

    if (o->unk190 & 0x00001000)
        interact = func_8024FD2C(m, o);
    else if (o->unk190 & 0x00004000)
        interact = func_8024FEC0(m, o);
    else
        push_mario_out_of_object(m, o, 2.0f);

    return interact;
}

static void check_kick_or_punch_wall(struct MarioState *m)
{
    if (m->flags & (MARIO_UNKNOWN_20 | MARIO_UNKNOWN_21 | MARIO_UNKNOWN_22))
    {
        Vec3f detector;
        detector[0] = m->pos[0] + 50.0f * sins(m->faceAngle[1]);
        detector[2] = m->pos[2] + 50.0f * coss(m->faceAngle[1]);
        detector[1] = m->pos[1];

        if (func_8025181C(detector, 80.0f, 5.0f) != NULL)
        {
            if (m->action != ACT_MOVE_PUNCHING || m->forwardVel >= 0.0f)
            {
                if (m->action == ACT_PUNCHING)
                    m->action = ACT_MOVE_PUNCHING;

                func_802514DC(m, -48.0f);
                SetSound(0x0444B081, &m->marioObj->gfx.unk54);
                m->unk08 |= 0x00040000;
            }
            else if (m->action & ACT_FLAG_AIR)
            {
                func_802514DC(m, -16.0f);
                SetSound(0x0444B081, &m->marioObj->gfx.unk54);
                m->unk08 |= 0x00040000;
            }

        }
    }
}

void mario_process_interactions(struct MarioState *m)
{
    D_80339F00 = FALSE;
    D_80339F02 = (m->action & ACT_FLAG_UNKNOWN_17) || m->invincTimer != 0;

    if (!(m->action & ACT_FLAG_INTANGIBLE) && m->collidedObjInteractTypes != 0)
    {
        s32 i;
        for (i = 0; i < 31; i++)
        {
            u32 interactType = sInteractionHandlers[i].interactType;
            if (m->collidedObjInteractTypes & interactType)
            {
                struct Object *object = mario_get_collided_object(m, interactType);

                m->collidedObjInteractTypes &= ~interactType;

                if (!(object->interactStatus & 0x00008000))
                {
                    if (sInteractionHandlers[i].handler(m, interactType, object))
                        break;
                }
            }
        }
    }

    if (m->invincTimer > 0 && !D_80339F00)
        m->invincTimer -= 1;

    //! If the kick/punch flags are set and an object collision changes mario's
    // action, he will get the kick/punch wall speed anyway.
    check_kick_or_punch_wall(m);
    m->flags &= ~MARIO_UNKNOWN_20 & ~MARIO_UNKNOWN_21 & ~MARIO_UNKNOWN_22;

    if (!(m->marioObj->collidedObjInteractTypes & (INTERACT_WARP_DOOR | INTERACT_DOOR)))
        sDisplayingDoorText = FALSE;
    if (!(m->marioObj->collidedObjInteractTypes & INTERACT_WARP))
        sJustWarped = FALSE;
}

static void check_death_barrier(struct MarioState *m)
{
    if (m->pos[1] < m->floorHeight + 2048.0f)
    {
        if (func_8024A860(m, 0x13) == 0x14 && !(m->flags & MARIO_UNKNOWN_18))
        {
            SetSound(0x2410C081, &m->marioObj->gfx.unk54);
        }
    }
}

static void check_lava_boost(struct MarioState *m)
{
    if (!(m->action & ACT_FLAG_RIDING_SHELL) && m->pos[1] < m->floorHeight + 10.0f)
    {
        if (!(m->flags & MARIO_METAL_CAP))
            m->hurtCounter += (m->flags & MARIO_CAP_ON_HEAD) ? 12 : 18;

        func_80251F74(m);
        drop_and_set_mario_action(m, ACT_LAVA_BOOST, 0);
    }
}

static void pss_begin_slide(UNUSED struct MarioState *m)
{
    if (!(D_80339EFA & 0x0040))
    {
        func_802495B0(TIMER_CONTROL_SHOW);
        func_802495B0(TIMER_CONTROL_START);
        sPssSlideStarted = TRUE;
    }
}

static void pss_end_slide(struct MarioState *m)
{
    //! This flag isn't set on death or level entry, allowing double star spawn
    if (sPssSlideStarted)
    {
        u16 slideTime = func_802495B0(TIMER_CONTROL_STOP);
        if (slideTime < 630)
        {
            m->marioObj->unk188 = 0x01000000;
            CreateStar(-6358.0f, -4300.0f, 4700.0f);
        }
        sPssSlideStarted = FALSE;
    }
}

void mario_handle_special_floors(struct MarioState *m)
{
    if ((m->action & ACT_GROUP_MASK) == ACT_GROUP_CUTSCENE)
        return;

    if (m->floor != NULL)
    {
        s32 floorType = m->floor->type;
        
        switch (floorType)
        {
        case SURFACE_000A:
        case SURFACE_0038:
            check_death_barrier(m);
            break;

        case SURFACE_0032:
            func_8024A860(m, 0x13);
            break;
        
        case SURFACE_0033:
            pss_begin_slide(m);
            break;
        
        case SURFACE_0034:
            pss_end_slide(m);
            break;
        }

        if (!(m->action & ACT_FLAG_AIR) && !(m->action & ACT_FLAG_SWIMMING))
        {
            switch (floorType)
            {
            case SURFACE_LAVA:
                check_lava_boost(m);
                break;
            }
               
        }
    }
}
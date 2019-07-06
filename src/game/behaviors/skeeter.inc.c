struct ObjectHitbox sSkeeterHitbox =
{
    /* interactType:      */ INTERACT_BOUNCE_TOP,
    /* downOffset:        */ 20,
    /* damageOrCoinValue: */ 2,
    /* health:            */ 0,
    /* numLootCoins:      */ 3,
    /* radius:            */ 180,
    /* height:            */ 100,
    /* hurtboxRadius:     */ 150,
    /* hurtboxHeight:     */ 90,
};

struct Struct80331C38 D_80331C38[] =
{
    { 0xFF7E, 0xFF42 },
    { 0x0082, 0xFF42 },
    { 0xFF4C, 0x0082 },
    { 0x00B4, 0x0082 },
};

static void skeeter_spawn_waves(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        spawn_object_relative_with_scale(0, D_80331C38[i].unk00, 0, D_80331C38[i].unk02, 0.8f, o, MODEL_WATER_WAVES_SURF, bhvSkeeterWave);
    }
}

static void skeeter_act_idle(void)
{
    if (o->oMoveFlags & 0x00000003)
    {
        func_8029ED38(3);
        o->oForwardVel = 0.0f;

        if (o->oTimer > o->oSkeeterWaitTime && func_8029F788())
        {
            o->oAction = SKEETER_ACT_WALK;
        }
    }
    else
    {
        func_8029ED38(1);

        if (o->oMoveFlags & 0x00000010)
        {
            skeeter_spawn_waves();
            if (o->oTimer > 60 &&
                obj_smooth_turn(&o->oSkeeterUnk1AC, &o->oMoveAngleYaw, o->oSkeeterTargetAngle, 0.02f, 5, 50, 200))
            {
                if (o->oSkeeterWaitTime != 0)
                {
                    o->oSkeeterWaitTime -= 1;
                }
                else if (func_8029F788())
                {
                    PlaySound2(SOUND_OBJECT_WALKINGWATER);
                    o->oAction = SKEETER_ACT_LUNGE;
                    o->oForwardVel = 80.0f;
                    o->oSkeeterUnk1AC = 0;
                }
            }
        }
    }
}

static void skeeter_act_lunge(void)
{
    if (!(o->oMoveFlags & 0x00000010))
    {
        o->oAction = SKEETER_ACT_IDLE;
    }
    else
    {
        skeeter_spawn_waves();
        func_8029ED38(0);

        if (o->oMoveFlags & 0x00000200)
        {
            o->oMoveAngleYaw = obj_reflect_move_angle_off_wall();
            o->oForwardVel *= 0.3f;
            o->oFlags &= ~0x00000008;
        }

        if (obj_forward_vel_approach(0.0f, 0.8f) && func_8029F828())
        {
            o->oMoveAngleYaw = o->oFaceAngleYaw;

            if (o->oDistanceToMario >= 25000.0f)
            {
                o->oSkeeterTargetAngle = o->oAngleToMario;
            }
            else
            {
                o->oSkeeterTargetAngle = obj_random_fixed_turn(RandomU16() % 0x2000);
            }

            o->oAction = SKEETER_ACT_IDLE;
            o->oSkeeterWaitTime = random_linear_offset(0, 30);
            o->oFlags |= 0x00000008;
        }
    }
}

static void skeeter_act_walk(void)
{
    f32 sp24;

    if (!(o->oMoveFlags & 0x00000003))
    {
        o->oAction = SKEETER_ACT_IDLE;
    }
    else
    {
        obj_forward_vel_approach(o->oSkeeterUnkFC, 0.4f);
        sp24 = 0.12f * o->oForwardVel;

        func_8029ED98(2, sp24);
        func_802F9378(3, 13, SOUND_OBJECT_SKEETERWALK);

        if (o->oSkeeterUnkF8 != 0)
        {
            o->oSkeeterUnkF8 = obj_resolve_collisions_and_turn(o->oSkeeterTargetAngle, 0x400);
        }
        else
        {
            if (o->oDistanceToMario >= 25000.0f)
            {
                o->oSkeeterTargetAngle = o->oAngleToMario;
                o->oSkeeterWaitTime = random_linear_offset(20, 30);
            }

            if ((o->oSkeeterUnkF8 = obj_bounce_off_walls_edges_objects(&o->oSkeeterTargetAngle)) == 0)
            {
                if (o->oDistanceToMario < 500.0f)
                {
                    o->oSkeeterTargetAngle = o->oAngleToMario;
                    o->oSkeeterUnkFC = 20.0f;
                }
                else
                {
                    o->oSkeeterUnkFC = 10.0f;
                    if (o->oSkeeterWaitTime != 0)
                    {
                        o->oSkeeterWaitTime -= 1;
                    }
                    else if (func_8029F788() != 0)
                    {
                        if (RandomU16() & 0x0003)
                        {
                            o->oSkeeterTargetAngle = obj_random_fixed_turn(0x2000);
                            o->oSkeeterWaitTime = random_linear_offset(100, 100);
                        }
                        else
                        {
                            o->oAction = SKEETER_ACT_IDLE;
                            o->oSkeeterWaitTime = random_linear_offset(100, 100);
                        }
                    }
                }
            }
        }

        obj_rotate_yaw_toward(o->oSkeeterTargetAngle, 0x400);
    }
}

void bhv_skeeter_update(void)
{
    o->oDeathSound = SOUND_OBJECT_SNUFITDEATH;
    treat_far_home_as_mario(1000.0f);

    obj_update_floor_and_walls();

    switch (o->oAction)
    {
    case SKEETER_ACT_IDLE:  skeeter_act_idle();  break;
    case SKEETER_ACT_LUNGE: skeeter_act_lunge(); break;
    case SKEETER_ACT_WALK:  skeeter_act_walk();  break;
    }

    obj_check_attacks(&sSkeeterHitbox, o->oAction);
    obj_move_standard(-78);
}

void bhv_skeeter_wave_update(void)
{
    if (approach_f32_ptr(&o->header.gfx.scale[0], 0.0f, 0.3f))
    {
        mark_object_for_deletion(o);
    }

    obj_scale(o->header.gfx.scale[0]);
    o->oAnimState = gGlobalTimer / 6;
}

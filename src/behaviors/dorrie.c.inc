
static void dorrie_raise_head(void)
{
    s16 startAngle;
    f32 xzDisp;
    f32 yDisp;

    startAngle = o->oDorrieNeckAngle;

    o->oDorrieNeckAngle -= (s16)func_802A2E8C(370.0f * sins(o->oDorrieHeadRaiseSpeed));

    xzDisp = 440.0f * (coss(o->oDorrieNeckAngle) - coss(startAngle));
    yDisp = 440.0f * (sins(o->oDorrieNeckAngle) - sins(startAngle));

    set_mario_pos(
        gMarioObject->oPosX + xzDisp * sins(o->oAngleYaw),
        gMarioObject->oPosY - yDisp,
        gMarioObject->oPosZ + xzDisp * coss(o->oAngleYaw));
}

static void dorrie_act_move(void)
{
    s16 startYaw;
    s16 targetYaw;
    s16 targetSpeed;
    s16 circularTurn;

    startYaw = o->oAngleYaw;
    o->oDorrieNeckAngle = -0x26F4;
    func_8029ED38(1);

    if (o->oDorrieForwardDistToMario < 320.0f && o->oDorrieGroundPounded)
    {
        PlaySound2(0x50376081);
        o->collisionData = segmented_to_virtual(dorrie_seg6_collision_0600FBB8);
        o->oAction = DORRIE_ACT_LOWER_HEAD;
        o->oForwardVel = 0.0f;
        o->oDorrieYawVel = 0;
    }
    else
    {
        if (gMarioObject->platform == o)
        {
            targetYaw = gMarioObject->oFaceAngleYaw;
            targetSpeed = 10;
        }
        else
        {
            circularTurn = 0x4000 - atan2s(2000.0f, o->oDorrieDistToHome - 2000.0f);
            if ((s16)(o->oAngleYaw - o->oDorrieAngleToHome) < 0)
            {
                circularTurn = -circularTurn;
            }

            targetYaw = o->oDorrieAngleToHome + circularTurn;
            targetSpeed = 5;
        }

        forward_vel_approach(targetSpeed, 0.5f);
        o->oDorrieYawVel = approach_target_angle(o->oDorrieYawVel, (s16)(targetYaw - o->oAngleYaw) / 50, 5);
        o->oAngleYaw += o->oDorrieYawVel;
    }

    o->oAngleVelYaw = o->oAngleYaw - startYaw;
}

static void dorrie_begin_head_raise(s32 liftingMario)
{
    o->oDorrieLiftingMario = liftingMario;
    o->oAction = DORRIE_ACT_RAISE_HEAD;
    o->oDorrieHeadRaiseSpeed = 0;
}

static void dorrie_act_lower_head(void)
{
    if (func_802F92EC(2, 35))
    {
        func_8029F6F0();

#ifdef VERSION_JP
        if (o->oTimer > 150)
        {
            dorrie_begin_head_raise(FALSE);
        }
        else if (gMarioObject->platform == o)
        {
            if (o->oDorrieForwardDistToMario > 830.0f && func_802573C8(2) == 1)
            {
                dorrie_begin_head_raise(TRUE);
            }
            else if (o->oDorrieForwardDistToMario > 320.0f)
            {
                o->oTimer = 0;
            }
        }
#else
        if (gMarioObject->platform == o)
        {
            if (o->oDorrieOffsetY == -17.0f && o->oDorrieForwardDistToMario > 780.0f && func_802573C8(2) == 1)
            {
                dorrie_begin_head_raise(TRUE);
            }
            else if (o->oDorrieForwardDistToMario > 320.0f)
            {
                o->oTimer = 0;
            }
        }
        else if (o->oTimer > 150)
        {
            dorrie_begin_head_raise(FALSE);
        }
#endif

    }
    else
    {
        o->oDorrieNeckAngle += 0x115;
    }
}

static void dorrie_act_raise_head(void)
{
    o->collisionData = segmented_to_virtual(dorrie_seg6_collision_0600F644);
    if (func_8029F788())
    {
        o->oAction = DORRIE_ACT_MOVE;
    }
    else if (o->oDorrieLiftingMario && o->header.gfx.unk38.animFrame < 74)
    {
        if (func_802573C8(2) == 2)
        {
            o->oDorrieHeadRaiseSpeed += 0x1CC;
            if (check_anim_frame(73))
            {
                func_802573C8(0);
            }
            dorrie_raise_head();
        }
        else
        {
            func_8029F6F0();
        }
    }
}

void bhv_dorrie_update(void)
{
    f32 boundsShift;
    UNUSED s32 unused1;
    UNUSED s32 unused2;
    f32 maxOffsetY;

    if (!(o->active & 0x0008))
    {
        o->oDorrieForwardDistToMario = o->oDistanceToMario * coss(o->oAngleToMario - o->oAngleYaw);
        
        func_802F8854(0);
        MoveObj2();

        o->oDorrieAngleToHome = obj_angle_to_home();
        o->oDorrieDistToHome = obj_lateral_dist_to_home();

        // Shift dorrie's bounds to account for her neck
        boundsShift = 440.0f * coss(o->oDorrieNeckAngle) * coss(o->oAngleYaw - o->oDorrieAngleToHome);

        if (cap_f32(&o->oDorrieDistToHome, 1650.0f + boundsShift, 2300.0f + boundsShift))
        {
            o->oPosX = o->oHomeX - o->oDorrieDistToHome * sins(o->oDorrieAngleToHome);
            o->oPosZ = o->oHomeZ - o->oDorrieDistToHome * coss(o->oDorrieAngleToHome);
        }

        o->oDorrieGroundPounded = IsMarioGroundPounding();

        if (gMarioObject->platform == o)
        {
            maxOffsetY = -17.0f;
            if (o->oDorrieOffsetY >= 0.0f)
            {
                if (o->oDorrieGroundPounded)
                {
                    o->oDorrieVelY = -15.0f;
                }
                else
                {
                    o->oDorrieVelY = -6.0f;
                }
            }
        }
        else
        {
            maxOffsetY = 0.0f;
        }

        o->oDorrieOffsetY += o->oDorrieVelY;
        approach_f32_2(&o->oDorrieVelY, 3.0f, 1.0f);
        if (o->oDorrieVelY > 0.0f && o->oDorrieOffsetY > maxOffsetY)
        {
            o->oDorrieOffsetY = maxOffsetY;
        }

        o->oPosY = o->oHomeY + o->oDorrieOffsetY;

        switch (o->oAction)
        {
        case DORRIE_ACT_MOVE:       dorrie_act_move();       break;
        case DORRIE_ACT_LOWER_HEAD: dorrie_act_lower_head(); break;
        case DORRIE_ACT_RAISE_HEAD: dorrie_act_raise_head(); break;
        }

        func_802F8854(1);
    }
}
// water_pillar.c.inc

void func_802B95A4(void)
{
    struct Object* sp1C;
    switch(o->oAction)
    {
    case 0:
        if(obj_is_mario_ground_pounding_platform())
        {
            o->oAction++;
            func_802A3004();
        }
        break;
    case 1:
        if(o->oTimer < 4)
            o->oPosY -= 20.0f;
        else
            o->oAction++;
        break;
    case 2:
        sp1C = obj_nearest_object_with_behavior(beh_water_level_pillar);
        if(sp1C != NULL)
        {
            if(sp1C->oAction < 2)
                o->oAction++;
        }
        break;
    case 3:
        sp1C = obj_nearest_object_with_behavior(beh_water_level_pillar);
        if(sp1C != NULL)
        {
            if(sp1C->oAction > 1)
            {
                o->oAction++;
                save_file_set_flags(512);
                func_80321228();
            }
        }
        break;
    case 4:
        PlaySound(0x41160001);
        if(o->oTimer < 300)
        {
            gWaterLevels[2] = (s32)approach_f32_symmetric(gWaterLevels[2],-2450.0f,5.0f);
            gWaterLevels[0] = (s32)approach_f32_symmetric(gWaterLevels[0],-2450.0f,5.0f);
        }
        else
            o->oAction++;
        break;
    case 5:
        break;
    }
}

void func_802B97E4(void)
{
    if(o->oTimer == 0)
    {
        o->oPosY -= 80.0f;
        gWaterLevels[2] = -2450;
        gWaterLevels[0] = -2450;
    }
}

void BehWaterLevelPillarInit(void)
{
    if(save_file_get_flags() & SAVE_FLAG_MOAT_DRAINED)
        o->oWaterLevelPillarUnkF8 = 1;
}

void BehWaterLevelPillarLoop(void)
{
    if(o->oWaterLevelPillarUnkF8)
        func_802B97E4();
    else
        func_802B95A4();
    gWaterRegions[18] = gWaterLevels[2];
    gWaterRegions[6]    = gWaterLevels[0];
}
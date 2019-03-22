// grill_door.c.inc

void BehBobHmcCageDoorLoop(void)
{
    if(gCurrentObject->oAction == 0)
    {
        if(gCurrentObject->parentObj->oUnk88 != 0)
            gCurrentObject->oAction++;
    }
    else if(gCurrentObject->oAction == 1)
    {
        if(gCurrentObject->oTimer < 64)
            gCurrentObject->oMoveAngleYaw -= gCurrentObject->oBehParams2ndByte * 0x100;
        else
            gCurrentObject->oAction++;
    }
}

void BehOpenableGrillLoop(void)
{
    struct Object* sp3C;
    s32 sp38;
    switch(o->oAction)
    {
    case 0:
        sp38 = o->oBehParams2ndByte;
        sp3C = spawn_object_relative(-1,D_8032FCE8[sp38].unk0,0,0,o,D_8032FCE8[sp38].unk1,beh_bob_hmc_cage_door);
        sp3C->oMoveAngleYaw += 0x8000;
        set_object_collision_data(sp3C,D_8032FCE8[sp38].unk2);
        sp3C = spawn_object_relative(1,-D_8032FCE8[sp38].unk0,0,0,o,D_8032FCE8[sp38].unk1,beh_bob_hmc_cage_door);
        set_object_collision_data(sp3C,D_8032FCE8[sp38].unk2);
        o->oAction++;
        break;
    case 1:
        if((o->oOpenableGrillUnkF4 = obj_nearest_object_with_behavior(&beh_floor_switch_grills)) != NULL)
            o->oAction++;
        break;
    case 2:
        sp3C = o->oOpenableGrillUnkF4;
        if(sp3C->oAction == 2)
        {
            o->oUnk88 = 2;
            PlaySound2(0x303FA081);
            o->oAction++;
            if(o->oBehParams2ndByte != 0)
                func_80321228();
        }
        break;
    case 3:
        break;
    }
}
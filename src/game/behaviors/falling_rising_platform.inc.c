// falling_rising_platform.c.inc

void BehSquishablePlatformLoop(void)
{
    o->header.gfx.scale[1] = (sins(o->oPlatformTimer) + 1.0) * 0.3 + 0.4;
    o->oPlatformTimer += 0x80;
}

void BehBitfsSinkingPlatformLoop(void)
{
    o->oPosY -= sins(o->oPlatformTimer) * 0.58; //! float double conversion error accumulates on Wii VC causing the platform to rise up
    o->oPlatformTimer += 0x100;
}

// TODO: Named incorrectly. fix
void BehDddMovingPoleLoop(void)
{
    copy_object_pos_and_angle(o,o->parentObj);
}

void BehBitfsSinkingCagePlatformLoop(void)
{
    if(o->oBehParams2ndByte != 0)
    {
        if(o->oTimer == 0)
            o->oPosY -= 300.0f;
        o->oPosY += sins(o->oPlatformTimer) * 7.0f;
    }
    else
        o->oPosY -= sins(o->oPlatformTimer) * 3.0f;
    o->oPlatformTimer += 0x100;
}

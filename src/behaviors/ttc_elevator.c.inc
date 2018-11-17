
void bhv_ttc_elevator_init(void)
{
    f32 peakOffset;

    peakOffset = ((o->oBehParams >> 16) & 0xFFFF) != 0
        ? 100.0f * ((o->oBehParams >> 16) & 0xFFFF)
        : 500.0f;

    o->oTTCElevatorPeakY = o->oPosY + peakOffset;
}

void bhv_ttc_elevator_update(void)
{
    o->oVelY = sTTCElevatorSpeeds[gTTCSpeedSetting] * o->oTTCElevatorDir;
    if (gTTCSpeedSetting == 2)
    {
        if (o->oTimer > o->oTTCElevatorMoveTime)
        {
            o->oTTCElevatorDir = RandomSign();
            o->oTTCElevatorMoveTime = random_mod_offset(30, 30, 6);
            o->oTimer = 0;
        }
        else if (o->oTimer < 5)
        {
            o->oVelY = 0.0f;
        }
    }

    MoveObj2();

    if (cap_f32(&o->oPosY, o->oHomeY, o->oTTCElevatorPeakY))
    {
        o->oTTCElevatorDir = -o->oTTCElevatorDir;
    }
}
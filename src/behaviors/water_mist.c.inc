// water_mist.c.inc
// TODO: there is confusion with the earlier mist file. Clarify?

void BehWaterMist2Loop(void)
{
    o->oPosY = find_water_level(o->oHomeX,o->oHomeZ) + 20.0f;
    o->oPosX = o->oHomeX + random_f32_around_zero(150.0f);
    o->oPosZ = o->oHomeZ + random_f32_around_zero(150.0f);
    o->oOpacity = RandomFloat() * 50.0f + 200.0f;
}
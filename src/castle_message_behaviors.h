#ifndef _CASTLE_MESSAGE_BEHAVIORS_H
#define _CASTLE_MESSAGE_BEHAVIORS_H

#include "types.h"

struct Struct8033B328
{
    Vec3f unk0[6];
    float unk48;
    s16 unk4C;
    s16 unk4E;
    u8 filler50[2];
    Vec3s unk52;
    u8 filler58[8];
    Vec3f unk60;
    Vec3s unk6C;
    u8 filler72[8];
    u8 unk7A[0x80-0x7A];  // unknown type
    Vec3f unk80;
    Vec3f unk8C;
    u8 filler98[0xA4-0x98];
    u8 unkA4[4];  // unknown type
    u8 unkA8[4];  // unknown type
    u8 unkAC[4];  // unknown type
    u8 unkB0[4];  // unknown type
};

extern struct Struct8033B328 D_8033B328;
// extern ? D_8032CE0C;
// extern ? D_80385FE4;
extern float D_80387000[];
// extern ? D_80339FE0;
// extern ? D_80339FF4;
// extern ? D_80339FF8;
// extern ? D_8033A040;

// extern ? Geo18_802761D0(?);
// extern ? Geo19_802763D4(?);
// extern ? Geo18_802764B0(?);
// extern ? func_80275FCC(?);
// extern ? func_8027604C(?);
// extern ? func_80276104(?);
// extern ? func_80276208(?);
// extern ? func_80276254(?);
// extern ? BehToadMessageLoop(?);
// extern ? BehToadMessageInit(?);
// extern ? func_802764F0(?);
// extern ? BehSealedDoorStarInit(?);
// extern ? BehSealedDoorStarLoop(?);
// extern ? func_802769E0(?);
// extern ? Geo18_802770A4(?);
// extern ? GeoSwitchCase80277150(?);
// extern ? GeoSwitchCase802771BC(?);
// extern ? Geo18_80277294(?);
// extern ? Geo18_802773A4(?);
// extern ? GeoSwitchCase802774F4(?);
// extern ? Geo18_802775CC(?);
// extern ? GeoSwitchCase802776D8(?);
// extern ? GeoSwitchCase80277740(?);
// extern ? Geo18_80277824(?);
// extern ? Geo1C_8027795C(?);
// extern ? Geo18_80277B14(?);
// extern ? Geo18_80277D6C(?);

#endif /* _CASTLE_MESSAGE_BEHAVIOR_H */
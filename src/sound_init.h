#ifndef _SOUND_INIT_H
#define _SOUND_INIT_H

#include "types.h"

extern u8 D_8032C6C0;
extern s16 D_8032C6E8[];
extern u32 D_8032C6F0[];
extern u8 D_8032C6D4;
extern u16 D_8032C6C8;
extern u16 D_8032C6CC;
extern u16 D_8032C6D0;
extern Vec3f D_80339DC0;
extern Vec3f D_80385FD0;
extern OSMesgQueue gSoundMesgQueue;
extern OSMesg gSoundMesgBuf[1];

extern void func_80248C10(void);
extern void func_80248CB8(s32);
extern void func_80248C28(s32);
// extern ? func_80248D48(?);
extern void func_80248D90(void);
extern void func_80248DD8(u16);
// extern ? func_80248E24(?);
extern void func_80248FBC(void);
// extern ? func_80249040(?);
extern void func_80249148(u16, u16, s16);
extern void func_802491FC(s16);
extern void func_8024924C(s16);
// extern ? func_802492A0(?);
extern void func_802492E0(void);
extern void func_8024931C(void);
extern void func_80249368(u16);
// extern ? func_802493D4(?);
// extern ? func_80249418(?);
extern void func_80249464(int, void *);
extern void func_802494A8(void);
extern void thread4_sound(void *);

#endif /* _SOUND_INIT_H */
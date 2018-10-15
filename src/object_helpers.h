#ifndef OBJECT_HELPERS_H
#define OBJECT_HELPERS_H

#include "types.h"

struct struct8029E388 {
    s16 unk00;
    s16 unk02;
    void *unk04;
    s16 unk08;
    s16 unk0A;
    f32 unk0C;
    f32 unk10;
    f32 unk14;
    f32 unk18;
    f32 unk1C;
    f32 unk20;
};

#define TIME_STOP_UNKNOWN_0       (1 << 0)
#define TIME_STOP_ENABLED         (1 << 1)
#define TIME_STOP_UNKNOWN_2       (1 << 2)
#define TIME_STOP_MARIO_AND_DOORS (1 << 3)
#define TIME_STOP_ALL_OBJECTS     (1 << 4)
#define TIME_STOP_UNKNOWN_5       (1 << 5)
#define TIME_STOP_ACTIVE          (1 << 6)

extern s16 D_8035FEF2;
extern s16 D_8035FEF4;
extern s16 D_8035FEEC;
extern s16 D_8035FEE6;
extern s16 D_8035FEE0;

extern struct MemoryPool *D_8035FE0C;
extern u32 gUpdatedObjectCount;
extern s16 D_8035FEEE;
extern s16 D_8035FEF0;
extern s16 gPostUpdateObjCount;
// extern ? D_80336610;
extern struct GraphNode **gLoadedGraphNodes;
// extern ? D_8032F0B4;
// extern ? D_8035FF00;
// extern ? TableMrIParticleActions;
// extern ? D_8032F124;
// extern ? TableMrIActions;
// extern ? D_8032F134;
// extern ? TableCapSwitchActions;
// extern ? D_803366B0;
// extern ? TableKingBobombActions;
// extern ? TableKingBobombSoundStates;
// extern ? D_8035FEEA;
// extern ? TableOpenedCannonActions;
// extern ? D_803366B4;
// extern ? D_803366BC;
// extern ? D_803366C4;
// extern ? TableChuckyaActions;
// extern ? D_803366C8;
// extern ? D_8032F260;
// extern ? D_8032F273;
// extern ? D_8032F271;
// extern ? D_8032F270;
// extern ? D_8032F284;
// extern ? D_8032F294;
// extern ? TableCoinInsideBooActions;
// extern ? D_8035FEE4;
// extern ? TableGrindelThwompActions;
// extern ? D_8032F34C;
// extern ? TableTumblingBridgeActions;
// extern ? TableElevatorActions;
// extern ? D_8032F3CC;
// extern ? D_8032F3E0;
// extern ? D_8032F3F4;
// extern ? D_8032F3FC;
// extern ? TableLittleCageActions;
// extern ? D_8032F420;
// extern ? D_8032F430;
// extern ? D_8032F440;
// extern ? D_8032F450;
// extern ? wdw_seg7_collision_07018528;
// extern ? TableHeaveHoActions;
// extern ? D_8032F498;
// extern ? TableJumpingBoxActions;
// extern ? D_8032F4B0;
// extern ? D_8035FF10;
// extern ? TableBetaBooKeyInsideActions;
// extern ? D_8032F4CC;
// extern ? TableBulletBillActions;
// extern ? TableBowserTailAnchorActions;
// extern ? D_060576FC;
// extern ? D_8032F50C;
// extern ? D_8032F510;
// extern ? D_803366D0;
// extern ? D_8032F514;
// extern ? TableBowserActions;
// extern ? D_8032F5B8;
// extern ? TableFallingBowserPlatformActions;
// extern ? D_8032F738;
// extern ? D_8032F728;
// extern ? D_8032F754;
// extern ? D_8035FFAC;
extern s32 gWaterLevels[20];
// extern ? D_8035FEE8;
// extern ? D_8032F77C;
// extern ? TableUkikiOpenCageActions;
// extern ? D_8032F7D8;
// extern ? D_803366D8;
// extern ? D_803366E4;
// extern ? D_803366F0;
// extern ? TableRotatingCwFireBarsActions;
// extern ? D_8032F8E0;
// extern ? TableToxBoxActions;
// extern ? D_8032F998;
// extern ? TablePiranhaPlantActions;
// extern ? D_8032FB4C;
// extern ? TableBowserPuzzlePieceActions;
// extern ? TableTuxiesMotherActions;
// extern ? TableSmallPenguinActions;
// extern ? D_0301C2B0;
// extern ? D_0600E264;
// extern ? TableFishActions;
// extern ? TableFishGroupActions;
// extern ? TableBirdChirpChirpActions;
// extern ? TableCheepCheepActions;
// extern ? D_8032FC30;
// extern ? D_8032FC40;
// extern ? TableExclamationBoxActions;
// extern ? D_8032FCD8;
// extern ? D_8032FCE8;
// extern ? D_803366FC;
// extern ? D_8032FCF8;
// extern ? TableTweesterActions;
// extern ? D_8032FD24;
// extern ? TableBooActions;
// extern ? D_8032FD14;
// extern ? TableBooGivingStarActions;
// extern ? TableBooWithCageActions;
// extern ? D_8032FD74;
// extern ? TableWhompActions;
// extern ? D_8032FDAC;
// extern ? D_8032FDF4;
// extern ? D_8032FE3C;
// extern ? D_8032FE4C;
// extern ? D_80336704;
// extern ? D_8033670C;

// extern ? Geo18_8029D890(?);
// extern ? Geo18_8029D924(?);
// extern ? GeoSwitchCase8029DB48(?);
// extern ? GeoSwitchCaseBlinking(?);
extern void func_8029D558(Mat4, struct Object *);
void func_8029D62C(struct Object *, Mat4, Mat4);
// extern ? func_8029D704(?);
void func_8029DA34(struct Object *, void *);
// extern ? DistanceFromObject(?);
extern f32 objects_calc_distance(struct Object *, struct Object *);
// extern ? func_8029DC1C(?);
// extern ? func_8029DC6C(?);
// extern ? func_8029DD18(?);
extern s16 approach_target_angle(s16 arg0, s16 arg1, s16 arg2);
// extern ? func_8029DE70(?);
extern s16 func_8029DF18(struct Object *, struct Object *);
extern s16 UnknownMove(struct Object *, struct Object *, s16, s16);
// extern ? func_8029E140(?);
// extern ? func_8029E198(?);
// extern ? func_8029E1F0(?);
extern struct Object *func_8029E230(struct Object *, s16, u32, void *, s16, s16, s16, s16, s16, s16);
extern struct Object *func_8029E2A8(struct Object *sp20, u32 sp24, void *sp28, s16 sp2E, s16 sp32, s16 sp36, s16 sp3A, s16 sp3E, s16 sp42);
// extern ? Unknown8029E330(?);
extern struct Object *func_8029E388(struct Object *, struct struct8029E388 *);
extern struct Object *func_8029E5A4(struct Object *, u32, u32, void *);
extern struct Object *SpawnObj(struct Object *, s32, void *);
// extern ? func_8029E6A8(?);
// extern ? func_8029E73C(?);
// extern ? func_8029E7A4(?);
extern struct Object* spawn_obj_adv(s16, s16, s16, s16, struct Object *, s32, void *);
// extern ? func_8029E880(?);
// extern ? Unknown8029E8F4(?);
// extern ? func_8029E94C(?);
extern void CopyObjParams(struct Object *, struct Object *);
// extern ? CopyObjPosition(?);
// extern ? CopyObjRotation(?);
// extern ? func_8029EA0C(?);
// extern ? Unknown8029EA34(?);
extern void func_8029EA84(f32 [4][4], Vec3f, Vec3f);
extern void func_8029EAF8(f32 [4][4], Vec3f, Vec3f);
// extern ? func_8029EB70(?);
// extern ? CopyObjScaling(?);
extern void ScaleXYZ(struct Object* obj, f32 xScale, f32 yScale, f32 zScale);
extern void func_8029EC88(struct Object *, float);
extern void ScaleObject(float);
extern void SetObjAnimation(s32 arg0);
// extern ? func_8029ED38(?);
// extern ? func_8029ED98(?);
// extern ? func_8029EE20(?);
// extern ? Unknown8029EE84(?);
extern void HideObject(void);
// extern ? Unknown8029EEC8(?);
extern void func_8029EEF0(void);
// extern ? func_8029EF18(?);
extern void UnHideObject(void);
extern void func_8029EF64(struct Object *MarioObj, f32, f32, f32);
// extern ? func_8029F05C(?);
extern void func_8029F0A4(void);
// extern ? Unknown8029F0CC(?);
extern void func_8029F170(struct Object *);
// extern ? func_8029F198(?);
extern struct Object* func_8029F1E0(void *);
// extern ? func_8029F21C(?);
// extern ? func_8029F270(?);
extern struct Object *get_next_unimportant_obj(void);
// extern ? Unknown8029F3EC(?);
// extern ? func_8029F460(?);
// extern ? func_8029F520(?);
// extern ? func_8029F610(?);
// extern ? func_8029F638(?);
// extern ? func_8029F684(?);
// extern ? func_8029F6F0(?);
// extern ? func_8029F728(?);
extern s32 func_8029F788(void);
// extern ? func_8029F828(?);
extern int check_anim_frame(int);
// extern ? func_8029F8D4(?);
// extern ? Unknown8029F930(?);
// extern ? func_8029F998(?);
// extern ? func_8029F9D8(?);
// extern ? func_8029FA1C(?);
// extern ? func_8029FA5C(?);
// extern ? func_8029FAB8(?);
// extern ? func_8029FC04(?);
extern void func_8029FCF8(void);
// extern ? SetModel(?);
// extern ? Unknown8029FD74(?);
// extern ? func_8029FD98(?);
extern void DeactivateObject(struct Object *);
// extern ? func_8029FE00(?);
extern void func_8029FE38(void);
extern void func_8029FE58(void);
// extern ? func_8029FE74(?);
// extern ? func_8029FE88(?);
// extern ? func_8029FED0(?);
// extern ? func_8029FF20(?);
// extern ? func_802A0020(?);
// extern ? func_802A006C(?);
// extern ? func_802A0334(?);
// extern ? func_802A0460(?);
// extern ? func_802A0608(?);
// extern ? func_802A06EC(?);
// extern ? func_802A0974(?);
// extern ? Unknown802A09C0(?);
// extern ? func_802A0A2C(?);
extern void func_802A0A90(void);
extern void func_802A0B28(void);
// extern ? PreMoveObj(?);
// extern ? func_802A0BF4(?);
extern s32 func_802A0CA8(struct Object *obj, struct Object *marioObj);
// extern ? func_802A0D10(?);
// extern ? SetObjBehavior(?);
extern s32 CheckObjBehavior(u32 *);
// extern ? CheckObjBehavior2(?);
// extern ? func_802A0E30(?);
// extern ? func_802A0EB8(?);
// extern ? Unknown802A0F30(?);
// extern ? Unknown802A0FF8(?);
// extern ? func_802A10D0(?);
// extern ? func_802A1110(?);
// extern ? func_802A1160(?);
// extern ? func_802A11B4(?);
// extern ? Unknown802A11E4(?);
// extern ? func_802A1230(?);
// extern ? func_802A124C(?);
// extern ? func_802A1274(?);
// extern ? func_802A129C(?);
// extern ? func_802A13B8(?);
// extern ? func_802A1410(?);
// extern ? func_802A1460(?);
// extern ? Unknown802A14EC(?);
// extern ? Unknown802A1548(?);
// extern ? func_802A1600(?);
// extern ? func_802A17C0(?);
// extern ? func_802A1978(?);
// extern ? func_802A1A2C(?);
// extern ? MoveRelated(?);
// extern ? MoveObj(?);
// extern ? func_802A1D28(?);
// extern ? func_802A1E0C(?);
// extern ? MoveObj2(?);
// extern ? Unknown802A1ECC(?);
// extern ? func_802A1FA0(?);
// extern ? func_802A2008(?);
// extern ? func_802A205C(?);
extern void func_802A2188(struct Object *, s16, s16);
extern void func_802A2270(struct Object *);
extern void func_802A22DC(struct Object *);
// extern ? Unknown802A2380(?);
// extern ? Unknown802A23C4(?);
// extern ? BehBreakBoxTriangleLoop(?);
// extern ? Unknown802A2474(?);
extern s32 func_802A24B4(UNUSED s32);
// extern ? func_802A272C(?);
extern f32 func_802A276C(f32);
// extern ? func_802A27B4(?);
extern void func_802A2818(struct Object *, f32);
extern void func_802A28E4(struct Object *, f32);
// extern ? func_802A297C(?);
// extern ? func_802A2A38(?);
// extern ? func_802A2AC0(?);
// extern ? func_802A2B04(?);


#endif /* OBJECT_HELPERS_H */

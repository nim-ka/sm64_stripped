#ifndef _OBJ_BEHAVIORS_H
#define _OBJ_BEHAVIORS_H

#include "types.h"
#include "object_helpers2.h"

struct Struct802E2F58
{
    s32 unk0[2];
    s32 unk8[2];
    u8 filler10[0x8];
};

/*

struct UnknownWhirpoolData
{
    s8 filler[2];
    Vec3s unk2;

    Vec3s unk8;

    s16 unkE;
    s16 unk10;
    s16 unk12;
};

*/

extern struct Surface *D_803600E0;

extern s8 D_80331500;
extern s16 D_80331504;
extern s8 D_80331508;
extern s8 D_8033150C;
extern s8 D_80331510;
extern struct ObjectHitbox D_80331514;
extern struct ObjectHitbox D_80331524;
extern struct ObjectHitbox D_80331534;
extern struct ObjectHitbox D_80331544;
extern struct ObjectHitbox D_80331554;
extern struct ObjectHitbox D_80331564;
extern struct ObjectHitbox D_80331574;
extern struct ObjectHitbox D_80331584;
extern struct ObjectHitbox D_80331594;
extern struct ObjectHitbox D_803315A4;
extern s16 D_803315B4[];
extern s16 D_80331608[];
extern struct ObjectHitbox D_80331654;
extern struct ObjectHitbox D_80331664;
extern struct ObjectHitbox D_80331674;
extern struct ObjectHitbox D_80331684;
extern s8 D_80331694;
extern struct ObjectHitbox D_80331698;
extern s16 D_803316A8[];
extern struct ObjectHitbox D_803316EC;
extern struct ObjectHitbox D_803316FC;
extern struct ObjectHitbox D_8033170C;
extern s16 D_8033171C[];

extern u8 bob_seg7_metal_ball_path0[];
extern u8 ttm_seg7_trajectory_070170A0[];
extern u8 bob_seg7_metal_ball_path1[];
// extern ? D_80331654;
// extern ? D_80331664;
// extern ? D_80331674;
// extern ? D_80331684;
// extern ? D_80331694;
// extern ? D_80331698;
// extern ? D_803316EC;
// extern ? D_803316A8;
// extern ? D_803316FC;
// extern ? D_8033170C;
// extern ? D_8033171C;

void func_802E2F40(void);
struct Struct802E2F58 *func_802E2F58(s32 arg0, struct Object *arg1, UNUSED s32 arg2); /* unused */
f32 absf_2(f32 f);
void TurnObjAwayFromSurface(f32 objVelX, f32 objVelZ, f32 nX, UNUSED f32 nY, f32 nZ, f32 *objYawX, f32 *objYawZ);
s32 ObjFindWall(f32 objNewX, f32 objY, f32 objNewZ, f32 objVelX, f32 objVelZ);
s32 TurnObjAwayFromAwkwardFloor(struct Surface *objFloor, f32 floorY, f32 objVelX, f32 objVelZ);
void ObjOrientGraph(struct Object *obj, f32 normalX, f32 normalY, f32 normalZ);
void CalcObjFriction(f32 *objFriction, f32 floor_nY);
void CalcNewObjVelAndPosY(struct Surface* objFloor, f32 objFloorY, f32 objVelX, f32 arg3);
void CalcNewObjVelAndPosYUnderwater(struct Surface* objFloor, f32 floorY, f32 objVelX, f32 objVelZ, f32 waterY);
void ObjUpdatePosVelXZ(void);
void ObjSplash(s32 waterY, s32 objY);
s16 ObjectStep(void);
s16 func_802E4204(void);
void func_802E4250(struct Object* obj);
s32 IsPointCloseToMario(f32 x, f32 y, f32 z, s32 dist);
s32 IsPointCloseToObject(struct Object* obj, f32 x, f32 y, f32 z, s32 dist);
void SetObjectVisibility(struct Object* obj, s32 arg1);
s32 ObjLeaveIfMarioIsNearHome(struct Object* obj, f32 arg1, f32 arg2, f32 arg3, s32 arg4);
void ObjDisplaceHome(struct Object* obj, f32 homeX, UNUSED f32 homeY, f32 homeZ, s32 baseDisp);
s32 func_802E46C0(u32 arg0, u32 arg1, s16 arg2);
s32 func_802E478C(Vec3f dist, f32 x, f32 y, f32 z, f32 arg4);
void ObjSpawnYellowCoins(struct Object *obj, s32 nCoins);
s32 ObjFlickerAndDisappear(struct Object *obj, s16 arg1);
s8 func_802E49A4(s16 arg0);
s16 func_802E4A38(s32 *arg0, s16 arg1, f32 arg2, s32 arg3);
void ObjCheckFloorDeath(s16 collisionFlags, struct Surface *floor);
s32 ObjLavaDeath(void);
void SpawnOrangeNumber(s8 arg0, s16 arg1, s16 arg2, s16 arg3);
s32 Unknown802E4DF4(s16 *arg0); /* unused */
s32 CoinStep(s16 *collisionFlagsPtr);
void MovingCoinFlickerLoop(void);
void CoinCollected(void);
void BehMovingYellowCoinInit(void);
void BehMovingYellowCoinLoop(void);
void BehMovingBlueCoinInit(void);
void BehMovingBlueCoinLoop(void);
void BehBlueCoinSlidingJumpingInit(void);
void func_802E540C(void); /* likely unused */
void func_802E54DC(void); /* likely unused */
void BehBlueCoinSlidingLoop(void); /* likely unused */
void BehBlueCoinJumpingLoop(void); /* likely unused */
void BehSeaweedInit(void);
void BehSeaweedBundleInit(void);
void BehBobombInit(void);
void func_802E5B7C(void);
void BobombExplodeLoop(void);
void CheckBobombInteractions(void);
void BobombPatrolLoop(void);
void BobombChaseMarioLoop(void);
void BobombLaunchedLoop(void);
void GenericBobombFreeLoop(void);
void StationaryBobombFreeLoop(void);
void BobombFreeLoop(void);
void BobombHeldLoop(void);
void BobombDroppedLoop(void);
void BobombThrownLoop(void);
void ObjRandomBlink(s32 *blinkTimer);
void BehBobombLoop(void);
void BehBobombFuseSmokeInit(void);
void BehBobombBuddyInit(void);
void BobombBuddyIdleLoop(void);
void BobombBuddyCannonLoop(s16 arg0, s16 arg1);
void BobombBuddyTalkLoop(void);
void BobombBuddyTurnToTalkLoop(void);
void BobombBuddyActionLoop(void);
void BehBobombBuddyLoop(void);
void BehCannonClosedInit(void);
void CannonTrapDoorOpeningLoop(void);
void BehCannonClosedLoop(void);
void BehWhirlpoolInit(void);
void func_802E70A8(void);
void WhirlpoolOrientGraph(void);
void BehWhirlpoolLoop(void);
void BehJetStreamLoop(void);
void BehAmpHomingInit(void);
void CheckAmpAttack(void);
void AmpHomingAppearLoop(void);
void AmpHomingChaseLoop(void);
void AmpHomingGiveUpLoop(void);
void AmpAttackCooldownLoop(void);
void BehAmpHomingLoop(void);
void BehAmpInit(void);
void FixedAmpIdleLoop(void);
void AmpIdleLoop(void);
void BehAmpLoop(void);
void BehButterflyInit(void);
void ButterflyStep(s32 speed);
void CalculateButterflyAngle(void);
void ButterflyRestingLoop(void);
void ButterflyFollowMarioLoop(void);
void ButterflyReturnHomeLoop(void);
void BehButterflyLoop(void);
void BehHootInit(void);
f32 HootFindNextFloor(f32 **arg0, f32 arg1);
void HootFloorBounce(void);
void HootFreeStep(s16 arg0, s32 arg1);
void PlayerSetHootYaw(void);
void HootCarryStep(s32 arg0, UNUSED f32 arg1, UNUSED f32 arg2);
void HootSurfaceCollision(f32 arg0, UNUSED f32 arg1, f32 arg2);
void HootAscentLoop(f32 arg0, f32 arg1);
void HootActionLoop(void);
void HootTurnToHome(void);
void HootAwakeLoop(void);
void BehHootLoop(void);
void BehBetaGreenShellInit(void); /* unused */
void BetaGreenShellDropped(void); /* unused */
void BetaGreenShellThrown(void); /* unused */
void BehBetaGreenShellLoop(void); /* unused */
void BehObjectBubbleInit(void);
void BehObjectBubbleLoop(void);
void BehObjectWaterWaveInit(void);
void BehObjectWaterWaveLoop(void);
void BehExplosionInit(void);
void BehExplosionLoop(void);
void BehBobombBullyDeathSmokeInit(void);
void BehBobombExplosionBubbleInit(void);
void BehBobombExplosionBubbleLoop(void);
void BehBobombCorkBoxRespawnerLoop(void);
void RespawnBobombOrCorkbox(s32 arg0, void *behToSpawn, s32 minSpawnDist);
void BehSmallBullyInit(void);
void BehBigBullyInit(void);
void BullyCheckMarioCollision(void);
void BullyChaseMarioLoop(void);
void BullyKnockbackLoop(void);
void BullyBackUpLoop(void);
void BullyBackUpCheck(s16 arg0);
void PlayBullyStompingSound(void);
void BullyStep(void);
void BullySpawnCoin(void);
void BullyLavaDeath(void);
void BehBullyLoop(void);
void BigBullySpawnMinion(s32 arg0, s32 arg1, s32 arg2, s16 arg3);
void BehBigBullyWithMinionsInit(void);
void BigBullyWithMinionsLavaDeath(void);
void BehBigBullyWithMinionsLoop(void);
f32 WaterRingCalcMarioDistInFront(void);
void WaterRingInit(void);
void BehJetStreamWaterRingInit(void);
void CheckWaterRingCollection(f32 avgScale, struct Object* ringManager);
void SetWaterRingScale(f32 avgScale);
void WaterRingCollectedLoop(void);
void JetStreamWaterRingNotCollectedLoop(void);
void BehJetStreamWaterRingLoop(void);
void Unknown802EB8A4(void); /* unused */
void JetStreamRingSpawnerActiveLoop(void);
void BehJetStreamRingSpawnerLoop(void);
void BehMantaRayWaterRingInit(void);
void MantaRayWaterRingNotCollectedLoop(void);
void BehMantaRayWaterRingLoop(void);
void BehBowserBombLoop(void);
void BehBowserBombExplosionLoop(void);
void BehBowserBombSmokeLoop(void);
void BehCelebrationStarInit(void);
void CelebrationStarSpinAroundMarioLoop(void);
void CelebrationStarFaceCameraLoop(void);
void BehCelebrationStarLoop(void);
void BehCelebrationStarSparkleLoop(void);
void BehStarKeyCollectionPuffSpawnerLoop(void);
void BehLLLDrawbridgeSpawnerLoop(void);
void BehLLLDrawbridgeLoop(void);
void BehSmallBompInit(void);
void BehSmallBompLoop(void);
void BehLargeBompInit(void);
void BehLargeBompLoop(void);
void BehWFSlidingPlatformInit(void);
void BehWFSlidingPlatformLoop(void);
void BehMoneybagInit(void);
void MoneybagCheckMarioCollision(void);
void MoneybagJump(s8 collisionFlags);
void MoneybagMoveAroundLoop(void);
void MoneybagReturnHomeLoop(void);
void MoneybagDisappearLoop(void);
void MoneybagDeathLoop(void);
void BehMoneybagLoop(void);
void BehMoneybagHiddenLoop(void);
void BehBowlingBallInit(void);
void func_802EDA14(void);
void func_802EDA6C(void);
void BehBowlingBallRollLoop(void);
void BehBowlingBallInitializeLoop(void);
void BehBowlingBallLoop(void);
void BehGenericBowlingBallSpawnerInit(void);
void BehGenericBowlingBallSpawnerLoop(void);
void BehTHIBowlingBallSpawnerLoop(void);
void BehBOBPitBowlingBallInit(void);
void BehBOBPitBowlingBallLoop(void);
void BehFreeBowlingBallInit(void); /* likely unused */
void BehFreeBowlingBallRollLoop(void); /* likely unused */
void BehFreeBowlingBallLoop(void); /* likely unused */
void BehRRCruiserWingInit(void);
void BehRRCruiserWingLoop(void);
// extern ? BehSpindelInit(?);
// extern ? BehSpindelLoop(?);
// extern ? BehSSLMovingPyramidWallInit(?);
// extern ? BehSSLMovingPyramidWallLoop(?);
// extern ? BehPyramidElevatorInit(?);
// extern ? BehPyramidElevatorLoop(?);
// extern ? BehPyramidElevatorMetalBallsLoop(?);
// extern ? BehPyramidTopInit(?);
// extern ? func_802EF238(?);
// extern ? func_802EF450(?);
// extern ? BehPyramidTopLoop(?);
// extern ? BehPyramidTopExplosionInit(?);
// extern ? BehPyramidTopExplosionLoop(?);
// extern ? BehCollisionBoxSubBehaviorLoop(?);
// extern ? BehWaterfallSoundLoop(?);
// extern ? BehVolcanoSoundLoop(?);
// extern ? BehCastleFlagWavingInit(?);
// extern ? BehBirdsSoundLoop(?);
// extern ? BehAmbiantSoundsInit(?);
// extern ? BehSandSoundLoop(?);
// extern ? BehHiddenAt120StarsInit(?);
// extern ? BehSnowmansBottomInit(?);
// extern ? func_802EFB2C(?);
// extern ? func_802EFB84(?);
// extern ? func_802EFC44(?);
// extern ? func_802EFDA0(?);
// extern ? func_802EFF58(?);
// extern ? BehSnowmansBottomLoop(?);
// extern ? BehSnowmansHeadInit(?);
// extern ? BehSnowmansHeadLoop(?);
// extern ? BehSnowmansBodyCheckpointLoop(?);
// extern ? BehBigBoulderInit(?);
// extern ? func_802F05DC(?);
// extern ? BehBigBoulderLoop(?);
// extern ? BehBigBoulderGeneratorLoop(?);
// extern ? func_802F0904(?);
// extern ? func_802F0978(?);
// extern ? func_802F09C0(?);
// extern ? func_802F0B68(?);
// extern ? BehWingCapInit(?);
// extern ? func_802F0D70(?);
// extern ? func_802F0E0C(?);
// extern ? BehWingVanishCapLoop(?);
// extern ? BehMetalCapInit(?);
// extern ? func_802F0FE0(?);
// extern ? BehMetalCapLoop(?);
// extern ? BehNormalCapInit(?);
// extern ? func_802F1190(?);
// extern ? func_802F1234(?);
// extern ? BehNormalCapLoop(?);
// extern ? BehVanishCapInit(?);
// extern ? BehCollectStarInit(?);
// extern ? BehCollectStarLoop(?);
// extern ? BehStarSpawnInit(?);
// extern ? BehStarSpawnLoop(?);
// extern ? func_802F1A50(?);
extern void CreateStar(f32, f32, f32);
// extern ? func_802F1B84(?);
// extern ? func_802F1BD4(?);
// extern ? BehHiddenRedCoinStarInit(?);
// extern ? BehHiddenRedCoinStarLoop(?);
// extern ? BehRedCoinInit(?);
// extern ? BehRedCoinLoop(?);
// extern ? BehHiddenStarInit(?);
// extern ? BehHiddenStarLoop(?);
// extern ? BehHiddenStarTriggerLoop(?);
// extern ? BehBowserCourseRedCoinStarLoop(?);
// extern ? BehTTMRollingLogInit(?);
// extern ? func_802F238C(?);
// extern ? BehRollingLogLoop(?);
// extern ? func_802F2820(?);
// extern ? func_802F2924(?);
// extern ? BehLLLVolcanoFallingTrap(?);
// extern ? BehLLLRollingLogInit(?);
// extern ? Beh1UpInteract(?);
// extern ? Beh1UpCommonInit(?);
// extern ? Beh1UpInit(?);
// extern ? func_802F2D40(?);
// extern ? func_802F2E18(?);
// extern ? func_802F2F8C(?);
// extern ? Beh1UpWalkingLoop(?);
// extern ? Beh1UpRunningAwayLoop(?);
// extern ? func_802F3328(?);
// extern ? Beh1UpSlidingLoop(?);
// extern ? Beh1UpLoop(?);
// extern ? Beh1UpJumpOnApproachLoop(?);
// extern ? Beh1UpHiddenLoop(?);
// extern ? Beh1UpHiddenTriggerLoop(?);
// extern ? Beh1UpHiddenInPoleLoop(?);
// extern ? Beh1UpHiddenInPoleTriggerLoop(?);
// extern ? Beh1UpHiddenInPoleSpawnerLoop(?);
// extern ? func_802F3BD8(?);
// extern ? func_802F3C50(?);
// extern ? BehControllablePlatformSubLoop(?);
// extern ? BehControllablePlatformInit(?);
// extern ? func_802F3F80(?);
// extern ? func_802F3FD8(?);
// extern ? func_802F4230(?);
// extern ? func_802F43EC(?);
// extern ? BehControllablePlatformLoop(?);
// extern ? BehBreakableBoxSmallInit(?);
// extern ? func_802F4CE8(?);
// extern ? func_802F4DB4(?);
// extern ? func_802F4EB8(?);
// extern ? func_802F4F84(?);
// extern ? func_802F5048(?);
// extern ? func_802F50C0(?);
// extern ? BehBreakableBoxSmallLoop(?);
// extern ? BehSlidingSnowMoundLoop(?);
// extern ? BehSnowMoundSpawnLoop(?);
// extern ? func_802F54F8(?);
// extern ? func_802F55CC(?);
// extern ? BehFloatingPlatformLoop(?);
// extern ? func_802F59B4(?);
// extern ? func_802F5A9C(?);
// extern ? BehArrowLiftLoop(?);
// extern ? BehOrangeNumberInit(?);
// extern ? BehOrangeNumberLoop(?);
// extern ? BehMantaRayInit(?);
// extern ? func_802F5E20(?);
// extern ? func_802F5FD8(?);
// extern ? BehMantaRayLoop(?);
// extern ? BehFallingPillarInit(?);
// extern ? func_802F6308(?);
// extern ? func_802F6388(?);
// extern ? BehFallingPillarLoop(?);
// extern ? BehSomeSubobjectFallingPillarLoop(?);
// extern ? BehJrbFloatingBoxLoop(?);
// extern ? BehOscillatingPendulumInit(?);
// extern ? BehOscillatingPendulumLoop(?);
// extern ? BehTreasureChestTopLoop(?);
// extern ? BehTreasureChestBottomInit(?);
// extern ? BehTreasureChestBottomLoop(?);
// extern ? func_802F6E8C(?);
// extern ? BehTreasureChestShipInit(?);
// extern ? BehTreasureChestShipLoop(?);
// extern ? BehTreasureChestJrbInit(?);
// extern ? BehTreasureChestJrbLoop(?);
// extern ? BehTreasureChestInit(?);
// extern ? BehTreasureChestLoop(?);
// extern ? BehMipsInit(?);
// extern ? func_802F7528(?);
// extern ? func_802F76A8(?);
// extern ? func_802F7750(?);
// extern ? func_802F788C(?);
// extern ? func_802F78D8(?);
// extern ? func_802F7984(?);
// extern ? func_802F7A04(?);
// extern ? func_802F7AA4(?);
// extern ? func_802F7BC4(?);
// extern ? func_802F7C48(?);
// extern ? BehMipsLoop(?);
// extern ? BehYoshiInit(?);
// extern ? func_802F7E58(?);
// extern ? func_802F7FA4(?);
// extern ? func_802F818C(?);
// extern ? func_802F82F8(?);
// extern ? func_802F8450(?);
// extern ? func_802F84FC(?);
// extern ? BehYoshiLoop(?);

#endif /* _OBJ_BEHAVIORS_H */

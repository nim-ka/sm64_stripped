#ifndef _GD_TYPES_H
#define _GD_TYPES_H

#include "types.h"
/* Vector Types */
struct GdPlaneF {
    struct MyVec3f vec0;
    struct MyVec3f vec1;
};

struct GdTriangleF {
    struct MyVec3f vec0;
    struct MyVec3f vec1;
    struct MyVec3f vec2;
};

/* Goddard Code Object Structs */
/* Object Type Flags */
enum ObjTypeFlag {
    OBJ_TYPE_GROUPS    = 0x00000001,
    OBJ_TYPE_BONES     = 0x00000002,
    OBJ_TYPE_JOINTS    = 0x00000004,
    OBJ_TYPE_PARTICLES = 0x00000008,
    OBJ_TYPE_SHAPES    = 0x00000010,
    OBJ_TYPE_NETS      = 0x00000020,
    OBJ_TYPE_PLANES    = 0x00000040,
    OBJ_TYPE_FACES     = 0x00000080,
    OBJ_TYPE_VERTICES  = 0x00000100,
    OBJ_TYPE_CAMERAS   = 0x00000200,
    // 0x400 was not used
    OBJ_TYPE_MATERIALS = 0x00000800,
    OBJ_TYPE_WEIGHTS   = 0x00001000,
    OBJ_TYPE_GADGETS   = 0x00002000,
    OBJ_TYPE_VIEWS     = 0x00004000,
    OBJ_TYPE_LABELS    = 0x00008000,
    OBJ_TYPE_ANIMATORS = 0x00010000,
    OBJ_TYPE_VALPTRS   = 0x00020000,
    // 0x40000 was not used
    OBJ_TYPE_LIGHTS    = 0x00080000,
    OBJ_TYPE_ZONES     = 0x00100000,
    OBJ_TYPE_UNK200000 = 0x00200000
};

/* This is a header sub-struct that is embeded into the other object structs
 * It can be used as a "generic object" to cast into the other object types  */
struct ObjHeader {
    /* 0x00 */ struct ObjHeader* prev;
    /* 0x04 */ struct ObjHeader* next;
    /* 0x08 */ void (*objDrawFn)(void *);
    /* 0x0C */ enum ObjTypeFlag type;
    /* 0x10 */ s16 number;
    /* 0x12 */ u16 unk12;   /* flag? */
    /* 0x14 Specific object data starts here  */
};

struct Links {
    /* 0x00 */ struct Links* prev;
    /* 0x04 */ struct Links* next;
    /* 0x08 */ struct ObjHeader* obj;
};

struct ObjGroup {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ struct ObjGroup* prev;
    /* 0x18 */ struct ObjGroup* next;
    /* 0x1C */ struct Links* link1C;
    /* 0x20 */ struct Links* link20;
    /* 0x24 */ s32 groupObjTypes;   // OR'd collection of type flags for all objects in this group?
    /* 0x28 */ s32 objCount;
    /* 0x2C */ u8  pad2C[0x4];
    /* 0x30 */ s32 unk30;
    /* 0x34 */ u8  pad34[0x40];
    /* 0x74 */ s32 id;
}; /* sizeof = 0x78 */

struct ObjBone {
    /* 0x000 */ struct ObjHeader header;
    /* 0x014 */ u8  pad14[0x70-0x14];
    /* 0x070 */ Mat4 unk70;
    /* 0x0B0 */ u8  padB0[0x108-0xb0];
    /* 0x108 */ s32 id;
    /* 0x10C */ struct ObjGroup* unk10C;
    /* 0x110 */ u8  pad110[0x14];
}; /* sizeof = 0x124 */

struct ObjJoint {
    /* 0x000 */ struct ObjHeader header;
    /* 0x014 */ u8  pad14[0x60];
    /* 0x074 */ struct MyVec3f unk74;
    /* 0x080 */ struct MyVec3f unk80;
    /* 0x08C */ u8  pad8C[0x18];
    /* 0x0A4 */ struct MyVec3f unkA4;   // possible, only in func_8017E9EC
    /* 0x0B0 */ struct MyVec3f unkB0;
    /* 0x0BC */ u8  padBC[0x2C];
    /* 0x0E8 */ Mat4 matE8;     //matrix4x4
    /* 0x128 */ Mat4 mat128;    // "r matrix"
    /* 0x168 */ Mat4 mat168;    // "i matrix"
    /* 0x1A8 */ u8  pad1a8[0x1b4-0x1a8];
    /* 0x1B4 */ s32 id;
    /* 0x1B8 */ u8  pad1B8[0xC];
    /* 0x1C4 */ struct ObjGroup* unk1C4;
    /* 0x1C8 */ u8  pad1C8[0x64];
}; /* sizeof = 0x22C */

struct ObjParticle {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ u8  pad14[0x3C];
    /* 0x50 */ s32 id;
    /* 0x54 */ u8  pad54[0x6C];
}; /* sizeof = 0xC0 */

struct ObjShape {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ struct GdPlaneF unk14;
    /* 0x2C */ u8  pad2C[0x9c-0x2C];
}; /* sizeof = 0x9C */

struct ObjNet {
    /* 0x000 */ struct ObjHeader header;
    /* 0x014 */ u8  pad14[0xbc-0x14];
    /* 0x0BC */ struct GdPlaneF unkBC;
    /* 0x0D4 */ u8  padD4[0xe8-0xd4];
    /* 0x0E8 */ Mat4 matE8;
    /* 0x128 */ Mat4 mat128;
    /* 0x168 */ Mat4 mat168;    // "r matrix"
    /* 0x1a8 */ u8  pad168[0x220-0x1a8];
}; /* sizeof = 0x220 */

struct ObjCamera {
    /* 0x000 */ struct ObjHeader header;
    /* 0x014 */ struct MyVec3f unk14;
    /* 0x020 */ struct ObjCamera* prev;
    /* 0x024 */ struct ObjCamera* next;
    /* 0x028 */ s32 id;
    /* 0x02C */ s32 unk2C;   // flag of some sort
    /* 0x030 */ struct ObjHeader* unk30;   // pointer to some type of object
    /* 0x034 */ struct MyVec3f unk34;
    /* 0x040 */ struct MyVec3f unk40;
    /* 0x04C */ struct MyVec3f unk4C;
    /* 0x058 */ f32 unk58;      // MyVec3f ?
    /* 0x05C */ u8  pad5C[0x4];
    /* 0x060 */ f32 unk60;
    /* 0x064 */ Mat4 unk64;    //matrix4x4
    /* 0x0A4 */ f32 unkA4;
    /* 0x0A8 */ Mat4 unkA8;    //matrix4x4
    /* 0x0E8 */ Mat4 unkE8;
    /* 0x128 */ struct MyVec3f unk128;  //possibly
    /* 0x134 */ struct MyVec3f unk134;
    /* 0x140 */ struct MyVec3f unk140;
    /* 0x14C */ u8  pad14C[0x170 - 0x14C];
    /* 0x170 */ s32 unk170;
    /* 0x174 */ s32 unk174;
    /* 0x178 */ f32 unk178;
    /* 0x17C */ f32 unk17C;
    /* 0x180 */ struct MyVec3f unk180;
    /* 0x18C */ u8  pad18C[0x4];
}; /* sizeof = 0x190 */

struct ObjMaterial {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ u8  pad[8];
    /* 0x1C */ s32 unk1C;
    /* 0x20 */ char name[8];
    /* 0x28 */ s32 unk28;
    /* 0x2C */ u8  pad2[0x30];
    /* 0x5C */ s32 unk5C;
}; /* sizeof = 0x60 */

struct ObjWeight {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ u8  pad14[0x8];
    /* 0x1C */ s32 unk1C;
    /* 0x20 */ u8  pad20[0x18];
    /* 0x38 */ f32 unk38;
    /* 0x3C */ s32 unk3C;
}; /* sizeof = 0x40 */

struct ObjGadget {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ u8  pad14[0x60-0x14];
}; /* sizeof = 0x60 */

struct ObjView {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ u8  pad14[0x8];
    /* 0x1C */ s32 unk1C;
    /* 0x20 */ s32 unk20;
    /* 0x24 */ void* unk24;     //whatever's UnkGameOverStruct7
    /* 0x28 */ struct ObjGroup* unk28;
    /* 0x2C */ struct ObjGroup* unk2C;
    /* 0x30 */ u8  pad30[0x4];
    /* 0x34 */ s32 unk34;
    /* 0x38 */ s32 unk38;
    /* 0x3C */ f32 unk3C;
    /* 0x40 */ f32 unk40;
    /* 0x44 */ u8  pad44[0x4];
    /* 0x48 */ f32 unk48;
    /* 0x4C */ f32 unk4C;
    /* 0x50 */ u8  pad50[0x4];
    /* 0x54 */ f32 unk54;
    /* 0x58 */ f32 unk58;
    /* 0x5C */ u8  pad5C[0x4];
    /* 0x60 */ struct MyVec3f unk60;
    /* 0x6C */ s32 unk6C;
    /* 0x70 */ u8  pad70[0x8];
    /* 0x78 */ s32 unk78;
    /* 0x7C */ struct MyVec3f unk7C;
    /* 0x88 */ u8  pad88[0x10];
    /* 0x98 */ s32 unk98;
    /* 0x9C */ s32 unk9C;
}; /* sizeof = 0xA0 */

struct ObjAnimator {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ struct ObjGroup* unk14;
    /* 0x18 */ struct SubAnim1* unk18;  //animation data?
    /* 0x1C */ u8  pad1C[0x4];
    /* 0x20 */ s32 unk20;
    /* 0x24 */ f32 unk24;
    /* 0x28 */ f32 unk28;
    /* 0x2C */ u8  pad2C[0x18];
    /* 0x44 */ struct ObjAnimator* unk44;   //maybe
    /* 0x48 */ void (*fn48) (struct ObjAnimator*);
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ u8  pad50[0x8];
}; /* sizeof = 0x58 */

struct SubAnim1 {
    /* 0x00 */ u8 pad[0x1C];
    /* 0x1C */ struct SubAnim2* unk1C;
};

struct SubAnim2 {
    s32 unk00;  //prev??
    s32 unk04;  //next??
    struct SubAnim3* unk08; //ptr to array of data structs
};

struct SubAnim3 {
    s32 unk00;
    s32 type;   // types are "sort of" listed in "move_animator"
    void* data; // probably multiple of these structs, based on the data packet
};

struct ObjValPtrs {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ void* unk14;
    /* 0x18 */ void* unk18;
    /* 0x1C */ void* unk1C;
    /* 0x20 */ void* unk20;
}; /* sizeof = 0x24 */


struct ObjPlane {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ u32 id;
    /* 0x18 */ void* unk18;     // maybe?
    /* 0x1C */ f32 unk1C;
    /* 0x20 */ s32 unk20;
    /* 0x24 */ s32 unk24;
    /* 0x28 */ struct GdPlaneF plane28;
    /* 0x40 */ struct ObjPlaneSub* unk40;
}; /* sizeof = 0x44*/

struct ObjPlaneSub {
    /* 0x00 */ u8  pad[0x24];
    /* 0x24 */ struct MyVec3f myVec3f24;
    /* 0x30 */ s32 unk30;
    /* 0x34 */ f32* unk34;
};

struct ObjLight {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ u8  pad0[0x8];
    /* 0x1C */ s32 unk1C;
    /* 0x20 */ char name[8];
    /* 0x28 */ u8  pad1[0x4];
    /* 0x2C */ s32 unk2C;
    /* 0x30 */ f32 unk30;
    /* 0x34 */ u8  pad34[0x3c-0x34];
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ u8  pad3[0x8];
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ u8  pad4[0x18];
    /* 0x68 */ struct MyVec3f unk68;
    /* 0x74 */ struct MyVec3f unk74;
    /* 0x80 */ struct MyVec3f unk80;
    /* 0x8C */ struct MyVec3f unk8C;
    /* 0x98 */ s32 unk98;
    /* 0x9C */ u8  pad9C[0xa0-0x9c];
}; /* sizeof = 0xA0 */

struct ObjZone {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ struct GdPlaneF unk14;
    /* 0x2C */ s32 unk2C;
    /* 0x30 */ s32 unk30;
    /* 0x34 */ u8  pad[4];
}; /* sizeof = 0x38*/

struct ObjUnk200000 {
    /* 0x00 */ struct ObjHeader header;
    /* 0x14 */ u8  pad[0x1C];
    /* 0x30 */ s32 unk30;
    /* 0x34 */ s32 unk34;
}; /* sizeof = 0x38*/

#endif /* _GD_TYPES_H */
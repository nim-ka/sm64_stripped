#include <ultra64.h>

#include "sm64.h"
#include "math_util.h"
#include "area.h"
#include "geo_layout.h"
#include "graph_node.h"
#include "object_helpers.h"
#include "behavior_script.h"
#include "surface_collision.h"
#include "audio_interface_2.h"
#include "level_update.h"
#include "spawn_object.h"

struct LinkedList
{
    struct LinkedList *prev;
    struct LinkedList *next;
};

void Unknown802C8CF0(struct LinkedList *a, struct LinkedList **head, struct LinkedList *c, int size, int count)
{
    int i;
    struct LinkedList *addr = c;

    a->prev = a;
    a->next = a;
    *head = c;

    for (i = 0; i < count - 1; i++)
    {
        addr = (struct LinkedList *)((u8 *)addr + size);
        c->prev = addr;
        c = addr;
    }
    c->prev = NULL;
}

struct LinkedList *Unknown802C8D60(struct LinkedList *a, struct LinkedList *b)
{
    struct LinkedList *sp4 = b->prev;

    if (sp4 != NULL)
    {
        b->prev = sp4->prev;
        sp4->next = a->next;
        sp4->prev = a;
        a->next->prev = sp4;
        a->next = sp4;
    }
    return sp4;
}

struct Object *func_802C8DC4(struct ObjectNode *a, struct ObjectNode *b)
{
    struct ObjectNode *sp1C;

    if ((sp1C = b->next) != NULL)
    {
        b->next = sp1C->next;
        sp1C->prev = a->prev;
        sp1C->next = a;
        a->prev->next = sp1C;
        a->prev = sp1C;
    }
    else
        return NULL;

    // FIXME: What types do these functions actually take?
    func_8037C0BC((struct GraphNode *)sp1C);
    func_8037C044(&D_8038BD88, (struct GraphNode *)sp1C);
    return (struct Object *)sp1C;
}

void Unknown802C8E70(struct LinkedList *a, struct LinkedList *b)
{
    b->prev->next = b->next;
    b->next->prev = b->prev;
    b->prev = a->prev;
    a->prev = b;
}

void func_802C8EA4(struct ObjectNode *a, struct ObjectNode *b)
{
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = a->next;
    a->next = b;
}

void func_802C8ED8(void)
{
    int spC;
    int sp8 = 240;
    struct Object *sp4 = &gObjectPool[0];

    D_8035FDE0 = sp4;
    for (spC = 0; spC < sp8 - 1; spC++)
    {
        sp4->header.next = &sp4[1].header;
        sp4++;
    }
    sp4->header.next = NULL;
}

void func_802C8F5C(struct ObjectNode *a)
{
    int sp4;

    for (sp4 = 0; sp4 < 13; sp4++)
    {
        a[sp4].next = &a[sp4];
        a[sp4].prev = &a[sp4];
    }
}

void UnknownRecursive802C8FF8(struct Object *a)
{
    struct Object *sp24;
    struct Object *sp20;
    struct Object *sp1C = a;

    if ((sp24 = (struct Object *)a->header.gfx.node.children) != NULL)
        UnknownRecursive802C8FF8(sp24);
    else
        hide_object(a);

    while ((sp20 = (struct Object *)a->header.gfx.node.next) == sp1C)
    {
        UnknownRecursive802C8FF8(sp20);
        a = (struct Object *)sp20->header.gfx.node.next;
    }
}

void func_802C9088(struct Object *a)
{
    a->active = 0;
    a->prevObj = 0;
    a->header.gfx.throwMatrix = NULL;
    func_803206F8(&a->header.gfx.unk54);
    func_8037C0BC((struct GraphNode *)a);
    func_8037C044(&D_8038BD88, (struct GraphNode *) a);
    a->header.gfx.node.flags &= ~4;
    a->header.gfx.node.flags &= ~1;
    func_802C8EA4(&D_8035FD80, &a->header);
}

struct Object *func_802C9120(struct ObjectNode *a)
{
    int i;
    struct Object *sp20 = func_802C8DC4(a, &D_8035FD80);
    struct Object *sp1C;

    if (sp20 == NULL)
    {
        sp1C = func_8029F3A0();

        if (sp1C == NULL)
        {
            // Endless loop?
            while (1)
                ;
        }
        else
        {
            func_802C9088(sp1C);
            sp20 = func_802C8DC4(a, &D_8035FD80);
            if (gCurrentObject == sp20)
            {
            }
        }
    }

    sp20->active = 257;
    sp20->nextObj = sp20;
    sp20->prevObj = NULL;
    sp20->collidedObjInteractTypes = 0;
    sp20->numCollidedObjs = 0;

    for (i = 0; i < 0x50; i++)
        sp20->rawData.asU32[i] = 0;

    sp20->unk1C8 = 0;
    sp20->stackIndex = 0;
    sp20->unk1F4 = 0;
    sp20->hitboxRadius = 50.0f;
    sp20->hitboxHeight = 100.0f;
    sp20->unk200 = 0.0f;
    sp20->unk204 = 0.0f;
    sp20->unk208 = 0.0f;
    sp20->unk210 = 0;
    sp20->platform = NULL;
    sp20->collisionData = NULL;
    sp20->oCollectable = -1;
    sp20->oUnk180 = 0;
    sp20->oUnk184 = 2048;
    sp20->oCollisionDistance = 1000.0f;
    if (gCurrLevelNum == 14)
        sp20->oDrawingDistance = 2000.0f;
    else
        sp20->oDrawingDistance = 4000.0f;
    mtxf_identity(sp20->unk21C);
    sp20->unk1F6 = 0;
    sp20->unk25C = 0;
    sp20->oDistanceToMario = 19000.0f;
    sp20->oUnk1A0 = -1;

    sp20->header.gfx.node.flags &= ~0x10;
    sp20->header.gfx.pos[0] = -10000.0f;
    sp20->header.gfx.pos[1] = -10000.0f;
    sp20->header.gfx.pos[2] = -10000.0f;
    sp20->header.gfx.throwMatrix = NULL;

    return sp20;
}

void func_802C937C(struct Object *a)
{
    struct Surface *surface;

    a->oUnkE8 = find_floor(a->oPosX, a->oPosY, a->oPosZ, &surface);
    if (a->oUnkE8 + 2.0f > a->oPosY && a->oPosY > a->oUnkE8 - 10.0f)
    {
        a->oPosY = a->oUnkE8;
        a->oUnkEC |= 2;
    }
}

struct Object *func_802C9424(u32 *a)
{
    int sp34;
    struct Object *sp30;
    struct ObjectNode *sp2C;
    u32 *sp28 = a;

    if ((*a >> 24) == 0)
        sp34 = (*a >> 16) & 0xFFFF;
    else
        sp34 = 8;

    sp2C = &gObjectLists[sp34];
    sp30 = func_802C9120(sp2C);
    sp30->behScript = a;
    sp30->behavior = sp28;
    if (sp34 == 12)
        sp30->active |= 0x10;
    switch (sp34)
    {
    case 4:
    case 5:
    case 10:
        func_802C937C(sp30);
        break;
    default:
        break;
    }
    return sp30;
}

void hide_object(struct Object *obj)
{
    obj->active = 0;
}

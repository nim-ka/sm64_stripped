#ifndef _SPAWN_OBJECT_H
#define _SPAWN_OBJECT_H

#include "types.h"

extern struct ObjectNode *gObjectLists;
extern struct ObjectNode D_8035FD80;

// extern ? Unknown802C8CF0(?);
// extern ? Unknown802C8D60(?);
// extern ? func_802C8DC4(?);
// extern ? Unknown802C8E70(?);
// extern ? func_802C8EA4(?);
extern void func_802C8ED8(void);
extern void func_802C8F5C(struct ObjectNode *);
// extern ? UnknownRecursive802C8FF8(?);
extern void func_802C9088(struct Object *);
// extern ? func_802C9120(?);
// extern ? func_802C937C(?);
extern struct Object *func_802C9424(u32 *a);
extern void hide_object(struct Object *);

#endif /* _SPAWN_OBJECT_H */

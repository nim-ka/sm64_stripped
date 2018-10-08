#include <ultra64.h>

#include "sm64.h"
#include "game.h"
#include "memory.h"
#include "area.h"
#include "save_file.h"
#include "object_helpers.h"
#include "behavior_script.h"
#include "ingame_menu.h"
#include "text_strings.h"
#include "audio_interface_2.h"
#include "level_update.h"
#include "segment2.h"
#include "segment7.h"
#include "star_select.h"

static struct Object *sStarSelectIcons[8];
static s8 D_801B9910;

// Number of obtained stars, excluding the coin star.
static u8 sObtainedStars;
static s8 sVisibleStars;
static u8 D_801B9913;

extern u8 beh_star_in_act_selector[];

static s8 sSelectedStar = 0;
static s8 D_801A8014 = 0;
static s32 D_801A8018 = 0;

void BehStarActSelectorLoop(void)
{
    switch (gCurrentObject->oStarSelectorUnkF4)
    {
    case 0:
        gCurrentObject->oStarSelectorSize -= 0.1;
        if (gCurrentObject->oStarSelectorSize < 1.0)
            gCurrentObject->oStarSelectorSize = 1.0;
        gCurrentObject->oFaceAngleYaw = 0;
        break;
    case 1:
        gCurrentObject->oStarSelectorSize += 0.1;
        if (gCurrentObject->oStarSelectorSize > 1.3)
            gCurrentObject->oStarSelectorSize = 1.3;
        gCurrentObject->oFaceAngleYaw += 0x800;
        break;
    case 2:
        gCurrentObject->oFaceAngleYaw += 0x800;
        break;
    }

    ScaleObject(gCurrentObject->oStarSelectorSize);
    gCurrentObject->oStarSelectorUnkF8++;
}

void func_80176934(u8 stars)
{
    if (stars & (1 << 6))
    {
        sStarSelectIcons[6] = func_8029E230(gCurrentObject, 0, 122, beh_star_in_act_selector, 370, 24, -300, 0, 0, 0);
        sStarSelectIcons[6]->oStarSelectIconUnk108 = 0.8;
        sStarSelectIcons[6]->oStarSelectIconUnkF4 = 2;
    }
}

void BehActSelectorInit(void)
{
    s16 i = 0;
    int sp34[10];
    u8 stars = save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum -1);

    sVisibleStars = 0;
    while (i != sObtainedStars)
    {
        if (stars & (1 << sVisibleStars))
        {
            sp34[sVisibleStars] = 122;
            i++;
        }
        else
        {
            sp34[sVisibleStars] = 121;
            if (D_801B9913 == 0)
            {
                D_801B9913 = sVisibleStars + 1;
                D_801A8014 = sVisibleStars;
            }
        }
        sVisibleStars++;
    }

    if (sVisibleStars == sObtainedStars && sVisibleStars != 6)
    {
        sp34[sVisibleStars] = 121;
        D_801B9913 = sVisibleStars + 1;
        D_801A8014 = sVisibleStars;
        sVisibleStars++;
    }

    if (sObtainedStars == 6)
        D_801B9913 = sVisibleStars;
    if (sObtainedStars == 0)
        D_801B9913 = 1;

    for (i = 0; i < sVisibleStars; i++)
    {
        sStarSelectIcons[i] = func_8029E230(gCurrentObject, 0, sp34[i], beh_star_in_act_selector, 75 + sVisibleStars * -75 + i * 152, 248, -300, 0, 0, 0);
        sStarSelectIcons[i]->oStarSelectIconUnk108 = 1.0f;
    }

    func_80176934(stars);
}

void BehActSelectorLoop(void)
{
    s8 i;
    u8 sp1E;
    u8 stars = save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum -1);

    if (sObtainedStars != 6)
    {
        sSelectedStar = 0;
        func_802D7924(2, &D_801A8014, 0, sObtainedStars);
        sp1E = D_801A8014;
        for (i = 0; i < sVisibleStars; i++)
        {
            if ((stars & (1 << i)) || i + 1 == D_801B9913)
            {
                if (sp1E == 0)
                {
                    sSelectedStar = i;
                    break;
                }
                sp1E--;
            }
        }
    }
    else
    {
        func_802D7924(2, &D_801A8014, 0, sVisibleStars - 1);
        sSelectedStar = D_801A8014;
    }

    for (i = 0; i < sVisibleStars; i++)
    {
        if (sSelectedStar == i)
            sStarSelectIcons[i]->oStarSelectIconUnkF4 = 1;
        else
            sStarSelectIcons[i]->oStarSelectIconUnkF4 = 0;
    }
}

void ShowSomeNum(void)
{
    u8 buffer[4];

    dl_add_new_translation_matrix(1, 158.0f, 81.0f, 0.0f);

    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700F228);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
    gSPDisplayList(gDisplayListHead++, seg2_dl_0200ED00);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);

    Int2Str(gCurrCourseNum, buffer);
    if (gCurrCourseNum < 10)
        PutString(2, 152, 158, buffer);
    else
        PutString(2, 143, 158, buffer);

    gSPDisplayList(gDisplayListHead++, seg2_dl_0200ED68);
}

void func_80177004(void)
{
    unsigned char sp60[] = {TEXT_MYSCORE};
    unsigned char sp5C[] = {TEXT_0};
    u32 *sp58 = (u32 *)segmented_to_virtual(seg2_level_name_table);
    u8 *sp54 = (u8 *) segmented_to_virtual((void *) sp58[gCurrCourseNum - 1]);
    u32 *sp50 = (u32 *)segmented_to_virtual(seg2_act_name_table);
    u8 *sp4C;
    s16 x;
    s16 x2;
    s8 sp47;

    dl_add_new_ortho_matrix();

    gSPDisplayList(gDisplayListHead++, seg2_dl_0200ED00);
    gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 255);

    ShowCoins(1, gCurrSaveFileNum - 1, gCurrCourseNum - 1, 155, 106);

    gSPDisplayList(gDisplayListHead++, seg2_dl_0200ED68);
    gSPDisplayList(gDisplayListHead++, seg2_dl_0200EE68);
    gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 255);

    if (save_file_get_course_coin_score(gCurrSaveFileNum - 1, gCurrCourseNum - 1) != 0)
        PrintGenericText(102, 118, sp60);

	// add 3 to skip the number and spacing to get to the actual string to center.
    x = get_str_x_pos_from_center(160, sp54 + 3, 10.0f);
    PrintGenericText(x, 33, sp54 + 3);

    gSPDisplayList(gDisplayListHead++, seg2_dl_0200EEF0);

    ShowSomeNum();

    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D108);
    gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 255);

    if (sVisibleStars != 0)
    {
        sp4C = (u8 *) segmented_to_virtual((void *) (sp50[(gCurrCourseNum - 1) * 6 + sSelectedStar]));
        x2 = get_str_x_pos_from_center(158, sp4C, 8.0f);
        PrintRegularText(x2, 81, sp4C);
    }

    for (sp47 = 1; sp47 <= sVisibleStars; sp47++)
    {
        sp5C[0] = sp47;
        PrintRegularText(sp47 * 34 - sVisibleStars * 17 + 0x8B, 38, sp5C);
    }

    gSPDisplayList(gDisplayListHead++, main_menu_seg7_dl_0700D160);
}

int Geo18_80177518(s16 a, UNUSED int b)
{
    if (a == 1)
        func_80177004();
    return 0;
}

void LevelProc_80177560(UNUSED int a, UNUSED int b)
{
    u8 stars = save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum - 1);

    D_801B9910 = 0;
    D_801B9913 = 0;
    sVisibleStars = 0;
    D_801A8018 = 0;
    sObtainedStars = save_file_get_course_star_count(gCurrSaveFileNum - 1, gCurrCourseNum - 1);

    if (stars & 0x40)
        sObtainedStars--;
}

int LevelProc_80177610(UNUSED int a, UNUSED int b)
{
    if (D_801A8018 >= 11)
    {
        if ((gPlayer3Controller->buttonPressed & A_BUTTON)
         || (gPlayer3Controller->buttonPressed & START_BUTTON)
         || (gPlayer3Controller->buttonPressed & B_BUTTON))
        {
            SetSound(SOUND_MENU_STARSOUND, D_803320E0);
            if (D_801B9913 > sSelectedStar)
                D_801B9910 = sSelectedStar + 1;
            else
                D_801B9910 = D_801B9913;
            D_80330534 = sSelectedStar + 1;
        }
    }
    area_update_objects();
    D_801A8018++;
    return D_801B9910;
}

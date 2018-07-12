.include "macros.inc"
.include "level_commands.inc"

.section .seg07, "a"
.align 4
.incbin "build/mio0/main_menu_segment7.mio0"
.align 4

.section .level, "a"

glabel level_main_menu_entry_1
    init_level
    fixed_load /*loadAddr*/ _goddardSegmentStart, /*romStart*/ _goddardSegmentRomStart, /*romEnd*/ _goddardSegmentRomEnd
    load_mio0 /*seg*/ 0x07, /*romStart*/ _level_main_menu_segment_7SegmentRomStart, /*romEnd*/ _level_main_menu_segment_7SegmentRomEnd
    load_raw /*seg*/ 0x13, /*romStart*/ _behaviorSegmentRomStart, /*romEnd*/ _behaviorSegmentRomEnd
    alloc_level_pool
    cmd22 /*unk2*/ 0x0003, /*unk4*/ 0x140001D0
    cmd22 /*unk2*/ 0x0004, /*unk4*/ 0x14000290
    cmd22 /*unk2*/ 0x0005, /*unk4*/ 0x140002B8
    cmd22 /*unk2*/ 0x0006, /*unk4*/ 0x140002E0
    cmd22 /*unk2*/ 0x0007, /*unk4*/ 0x14000308
    cmd22 /*unk2*/ 0x0008, /*unk4*/ 0x14000200
    cmd22 /*unk2*/ 0x0009, /*unk4*/ 0x14000230
    cmd22 /*unk2*/ 0x000A, /*unk4*/ 0x14000260
    cmd22 /*unk2*/ 0x000B, /*unk4*/ 0x14000330
    cmd22 /*unk2*/ 0x000C, /*unk4*/ 0x14000358

    area /*index*/ 1, /*geo*/ 0x14000380
        object /*unk2*/ 0x1F, /*unk3*/ 0x00, /*pos*/ 0, 0, -19000, /*angle*/ 0, 0, 0, /*behArg*/ 0x04000000, /*beh*/ beh_gray_button
        object /*unk2*/ 0x1F, /*unk3*/ 0x06, /*pos*/ 0, 0, -19000, /*angle*/ 0, 0, 0, /*behArg*/ 0x04000000, /*beh*/ beh_yellow_background_in_menu
        terrain /*terrainData*/ 0x0700F2F8
    end_area

    free_level_pool
    load_area /*area*/ 1
    set_menu_music /*seq*/ 0x0021
    transition /*unk2*/ 0, /*unk3*/ 16, /*color*/ -1, -1, -1
    call /*arg*/ 0, /*func*/ LevelProc_801766DC
    call_loop /*arg*/ 0, /*func*/ LevelProc_801768A0
    get_or_set /*op*/ OP_SET, /*var*/ VAR_CURR_SAVE_FILE_NUM
    cmd38 /*unk2*/ 0x00BE
    transition /*unk2*/ 1, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    clear_level
    sleep_before_exit /*frames*/ 1
    set_reg /*value*/ 16
    exit_and_execute /*seg*/ 0x15, /*script*/ _level_main_scriptsSegmentRomStart, /*scriptEnd*/ _level_main_scriptsSegmentRomEnd, /*entry*/ level_main_scripts_entry

glabel level_main_menu_entry_2
    call /*arg*/ 0, /*func*/ lvl_set_current_level
    jump_if /*op*/ OP_EQ, /*arg*/ 0, /*target*/ L1
    init_level
    fixed_load /*loadAddr*/ _goddardSegmentStart, /*romStart*/ _goddardSegmentRomStart, /*romEnd*/ _goddardSegmentRomEnd
    load_mio0 /*seg*/ 0x07, /*romStart*/ _level_main_menu_segment_7SegmentRomStart, /*romEnd*/ _level_main_menu_segment_7SegmentRomEnd
    alloc_level_pool

    area /*index*/ 2, /*geo*/ 0x14000408
        object /*unk2*/ 0x1F, /*unk3*/ 0x00, /*pos*/ 0, -100, 0, /*angle*/ 0, 0, 0, /*behArg*/ 0x04000000, /*beh*/ beh_act_selector
        terrain /*terrainData*/ 0x0700F2F8
    end_area

    free_level_pool
    load_area /*area*/ 2
    transition /*unk2*/ 0, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    set_menu_music /*seq*/ 0x000D
    call /*arg*/ 0, /*func*/ LevelProc_80177560
    call_loop /*arg*/ 0, /*func*/ LevelProc_80177610
    get_or_set /*op*/ OP_SET, /*var*/ VAR_D_8033A758
    cmd38 /*unk2*/ 0x00BE
    transition /*unk2*/ 1, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    clear_level
    sleep_before_exit /*frames*/ 1
L1:
    exit

.align 4
.include "levels/geo/level_main_menu.s"
.align 4

# level script bbh_level from 380E60-381EF0



.global bbh_level
.align 4, 0
bbh_level:
.word 0x24181F90, 0x08290533, 0xFB9B0000, 0x010E0000, 0x00000000, beh_burning
.word 0x24181F90, 0x05330433, 0xFACE0000, 0x005A0000, 0x00000000, beh_burning
.word 0x24181F90, 0x08290533, 0xFE010000, 0x010E0000, 0x00000000, beh_burning
.word 0x24181F90, 0xFE010166, 0xFACE0000, 0x005A0000, 0x00000000, beh_burning
.word 0x24181F90, 0x04660166, 0x08A40000, 0x00000000, 0x00000000, beh_burning
.word 0x24181F90, 0x00CD0166, 0x08A40000, 0x00000000, 0x00000000, beh_burning
.word 0x07040000
.word 0x24181F36, 0x0B320334, 0x07690000, 0x00000000, 0x00000000, beh_bbh_tilt_floor_platforms
.word 0x24181F37, 0x0B910000, 0xFD000000, 0x00000000, 0x00000000, beh_bbh_tumbling_platform_group
.word 0x24181F39, 0xF8360333, 0x00D50000, 0x00000000, 0x00000000, beh_tumbling_bookshelf
.word 0x24181F3A, 0xF457FF33, 0x15180000, 0xFFD30000, 0x00000000, beh_mesh_elevator
.word 0x24181F3B, 0xFF33F600, 0x00CD0000, 0x00000000, 0x00000000, beh_rotating_merry_go_round
.word 0x24181F00, 0x08980333, 0xFCE00000, 0x00000000, 0x00000000, beh_haunted_room_check
.word 0x07040000
.word 0x24180154, 0x03E80032, 0x03E80000, 0x00000000, 0x00000000, beh_boo_giving_star
.word 0x24180154, 0x00140064, 0xFC740000, 0x00000000, 0x00000000, beh_boo_2
.word 0x24180154, 0x0C4E0064, 0x018E0000, 0x00000000, 0x00000000, beh_boo_2
.word 0x24180154, 0xF8300096, 0xFCE00000, 0x00000000, 0x00000000, beh_boo_2
.word 0x24180154, 0x0B230064, 0x08F10000, 0x00000000, 0x00000000, beh_boo_2
.word 0x24180154, 0xF9F10064, 0xFC060000, 0x00000000, 0x00000000, beh_boo_2
.word 0x24183E35, 0x03CD0000, 0x02050000, 0x00000000, 0x00000000, beh_hidden_staircase_step
.word 0x24183E35, 0x03CDFF32, 0x02CD0000, 0x00000000, 0x00000000, beh_hidden_staircase_step
.word 0x24183E35, 0x03CDFE64, 0x03950000, 0x00000000, 0x00000000, beh_hidden_staircase_step
.word 0x24183E54, 0x00140064, 0xFC740000, 0x00000000, 0x00000000, beh_boo_3
.word 0x24183E54, 0x0C4E0064, 0x018E0000, 0x00000000, 0x00000000, beh_boo_3
.word 0x24183E54, 0xF8300096, 0xFCE00000, 0x00000000, 0x00000000, beh_boo_3
.word 0x24183E54, 0x0B230064, 0x08F10000, 0x00000000, 0x00000000, beh_boo_3
.word 0x24183E54, 0xF9F10064, 0xFC060000, 0x00000000, 0x00000000, beh_boo_3
.word 0x24183E00, 0x03DEF79E, 0xFC740000, 0xFFD30000, 0x00030000, beh_flamethrower
.word 0x24183E00, 0xFBB4F6BC, 0x044C0000, 0x00870000, 0x01000000, beh_spawn_big_boo
.word 0x24183F54, 0x04060782, 0x09F20000, 0xFFA60000, 0x04000000, beh_patrolling_boo
.word 0x24183F54, 0x0245073A, 0xFF320000, 0xFFA60000, 0x00000000, beh_boo_3
.word 0x24181F57, 0xFAEC0000, 0x09060000, 0x00F30000, 0x00000000, beh_mad_piano
.word 0x24181F56, 0xFA060000, 0x08980000, 0x00420000, 0x00000000, beh_haunted_chair
.word 0x24181F00, 0xFACE037A, 0x00C80000, 0x005A0000, 0x00000000, beh_bookend_spawn
.word 0x24181F00, 0xFCCE037A, 0xFF380000, 0x010E0000, 0x00000000, beh_bookend_spawn
.word 0x24181F00, 0xFACE037A, 0xFD920000, 0x005A0000, 0x00000000, beh_bookend_spawn
.word 0x24181F00, 0xFCCE037A, 0xFD520000, 0x010E0000, 0x00000000, beh_bookend_spawn
.word 0x24181F00, 0xF8620370, 0x00080000, 0x00B40000, 0x00000000, beh_bookshelf_thing
.word 0x24181F59, 0x0A780415, 0x036C0000, 0x00A60000, 0x00000000, beh_flying_bookend
.word 0x24181F59, 0x0C030415, 0x03E30000, 0x00A60000, 0x00000000, beh_flying_bookend
.word 0x24181F59, 0xFA7D00DA, 0x039A0000, 0x00B40000, 0x00000000, beh_flying_bookend
.word 0x07040000
.word 0x24183F7A, 0xF8120546, 0x07940000, 0x00000000, 0x02000000, beh_collect_star
.word 0x24183F00, 0xFF34044C, 0x06280000, 0x00000000, 0x03000000, beh_hidden_red_coin_star
.word 0x24183F00, 0x039B06CD, 0xFEB40000, 0x00120000, 0x05010000, beh_mr_i
.word 0x07040000
.word 0x1B040000
.word 0x180C0007, bbh_segment7, bbh_segment7_end
.word 0x180C000A, bbh_skybox, bbh_skybox_end
.word 0x1A0C0009, bbh_textures, bbh_textures_end
.word 0x180C0005, piano_books, piano_books_end
.word 0x170C000C, bookend_chair_piano_boo, bookend_chair_piano_boo_end
.word 0x180C0006, mri_swoop, mri_swoop_end
.word 0x170C000D, mri_swoop_snufit_dorrie_scuttlebug, mri_swoop_snufit_dorrie_scuttlebug_end
.word 0x180C0008, chuckya_shyguy_goomba, chuckya_shyguy_goomba_end
.word 0x170C000F, cannon_box_switch_enemies, cannon_box_switch_enemies_end
.word 0x1D040000
.word 0x250C0001, 0x00000001, beh_mario
.word 0x06080000, 0x15000660
.word 0x06080000, 0x1500084C
.word 0x06080000, 0x150009DC
.word 0x2208001D, 0x16000720
.word 0x22080035, 0x0E0005B0
.word 0x22080036, 0x0E0005C8
.word 0x22080037, 0x0E0005E0
.word 0x22080038, 0x0E0005F8
.word 0x22080039, 0x0E000610
.word 0x2208003A, 0x0E000628
.word 0x2208003B, 0x0E000640
.word 0x2208003C, 0x0E000658
.word 0x1F080100, 0x0E000F00
.word 0x06080000, 0x0E000000
.word 0x06080000, 0x0E000094
.word 0x06080000, 0x0E000128
.word 0x06080000, 0x0E0003CC
.word 0x24181F00, 0x029A031C, 0x14E60000, 0x00B40000, 0x000A0000, beh_warps_74
.word 0x26080A04, 0x010A0000
.word 0x2608F01A, 0x010A0000
.word 0x2608F11A, 0x010B0000
.word 0x2E080000, 0x070207A0
.word 0x39080000, 0x070268C4
.word 0x2F080000, 0x0702605C
.word 0x30040062
.word 0x36080006, 0x000A0000
.word 0x31040004
.word 0x20040000
.word 0x1E040000
.word 0x2B0C0100, 0x00B4029A, 0xFF3414E6
.word 0x11080000, LevelProc_8024BCD8 # 8024BB38
.word 0x12080001, LevelProc_8024BCD8 # 8024BB38
.word 0x1C040000
.word 0x04040001
.word 0x02040000
# begin bbh_level alignment 0x381408
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
# begin bbh_level geo 0x381410
# 05B0
.word 0x200002BC
.word 0x04000000
.word   0x15010000, 0x0701F2E8
.word 0x05000000
.word 0x01000000
# 05C8
.word 0x20000258
.word 0x04000000
.word   0x15010000, 0x0701F5F8
.word 0x05000000
.word 0x01000000
# 05E0
.word 0x2000028A
.word 0x04000000
.word   0x15010000, 0x0701F7E8
.word 0x05000000
.word 0x01000000
# 05F8
.word 0x2000012C
.word 0x04000000
.word   0x15010000, 0x0701FAB0
.word 0x05000000
.word 0x01000000
# 0610
.word 0x200003E8
.word 0x04000000
.word   0x15010000, 0x0701FD28
.word 0x05000000
.word 0x01000000
# 0628
.word 0x20000258
.word 0x04000000
.word   0x15040000, 0x0701FFE8
.word 0x05000000
.word 0x01000000
# 0640
.word 0x200008FC
.word 0x04000000
.word   0x15010000, 0x070202F0
.word 0x05000000
.word 0x01000000
# 0658
.word 0x20000320
.word 0x04000000
.word   0x15010000, 0x070206F0
.word 0x05000000
.word 0x01000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x070075A8
.word   0x15040000, 0x07007940
.word   0x15010000, 0x07007B90
.word   0x15050000, 0x07007FD0
.word   0x15010000, 0x07008B58
.word   0x15050000, 0x07008EA8
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0700AFF0
.word   0x15010000, 0x0700B1C8
.word   0x15050000, 0x0700B418
.word   0x15010000, 0x0700B9E0
.word   0x15050000, 0x0700BBF8
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0700D080
.word   0x15040000, 0x0700D2E0
.word   0x15010000, 0x0700D490
.word   0x15050000, 0x0700D7E0
.word   0x15010000, 0x07012220
.word   0x15010000, 0x07012510
.word   0x15050000, 0x070126E8
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0700F510
.word   0x15040000, 0x0700F848
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x07011120
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0700D080
.word   0x15040000, 0x0700D2E0
.word   0x15010000, 0x0700D490
.word   0x15050000, 0x0700D7E0
.word   0x15010000, 0x07012220
.word   0x15010000, 0x07012510
.word   0x15050000, 0x070126E8
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x070139A8
.word   0x15050000, 0x07013BE8
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x07014FD8
.word   0x15040000, 0x07015398
.word   0x15050000, 0x070156E0
.word   0x15010000, 0x07015A20
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x07017378
.word   0x15010000, 0x07017570
.word   0x15050000, 0x07017788
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x07019EF8
.word   0x15040000, 0x0701A080
.word   0x18000000, Geo18_802D01E0
.word   0x18000400, Geo18_802D104C
.word   0x18000401, Geo18_802D104C
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0701A850
.word   0x18000000, Geo18_802D01E0
.word   0x18000400, Geo18_802D104C
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0701B6D0
.word   0x18000000, Geo18_802D01E0
.word   0x18000400, Geo18_802D104C
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0701E4E0
.word   0x15040000, 0x0701E8D8
.word   0x15010000, 0x0701ED18
.word   0x15050000, 0x0701EEC8
.word   0x15010000, 0x0701F070
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x070075A8
.word   0x15040000, 0x07007940
.word   0x15010000, 0x07007B90
.word   0x15050000, 0x07007FD0
.word   0x15010000, 0x07008B58
.word   0x15050000, 0x07008EA8
.word   0x15010000, 0x0700AFF0
.word   0x15010000, 0x0700B1C8
.word   0x15050000, 0x0700B418
.word   0x15010000, 0x0700B9E0
.word   0x15050000, 0x0700BBF8
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x070075A8
.word   0x15040000, 0x07007940
.word   0x15010000, 0x07007B90
.word   0x15050000, 0x07007FD0
.word   0x15010000, 0x07008B58
.word   0x15050000, 0x07008EA8
.word   0x15010000, 0x0700D080
.word   0x15040000, 0x0700D2E0
.word   0x15010000, 0x0700D490
.word   0x15050000, 0x0700D7E0
.word   0x15010000, 0x07012220
.word   0x15010000, 0x07012510
.word   0x15050000, 0x070126E8
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x070075A8
.word   0x15040000, 0x07007940
.word   0x15010000, 0x07007B90
.word   0x15050000, 0x07007FD0
.word   0x15010000, 0x07008B58
.word   0x15050000, 0x07008EA8
.word   0x15010000, 0x0700F510
.word   0x15040000, 0x0700F848
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x070075A8
.word   0x15040000, 0x07007940
.word   0x15010000, 0x07007B90
.word   0x15050000, 0x07007FD0
.word   0x15010000, 0x07008B58
.word   0x15050000, 0x07008EA8
.word   0x15010000, 0x07011120
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x070075A8
.word   0x15040000, 0x07007940
.word   0x15010000, 0x07007B90
.word   0x15050000, 0x07007FD0
.word   0x15010000, 0x07008B58
.word   0x15050000, 0x07008EA8
.word   0x15010000, 0x0700D080
.word   0x15040000, 0x0700D2E0
.word   0x15010000, 0x0700D490
.word   0x15050000, 0x0700D7E0
.word   0x15010000, 0x07012220
.word   0x15010000, 0x07012510
.word   0x15050000, 0x070126E8
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x070075A8
.word   0x15040000, 0x07007940
.word   0x15010000, 0x07007B90
.word   0x15050000, 0x07007FD0
.word   0x15010000, 0x07008B58
.word   0x15050000, 0x07008EA8
.word   0x15010000, 0x070139A8
.word   0x15050000, 0x07013BE8
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x070075A8
.word   0x15040000, 0x07007940
.word   0x15010000, 0x07007B90
.word   0x15050000, 0x07007FD0
.word   0x15010000, 0x07008B58
.word   0x15050000, 0x07008EA8
.word   0x15010000, 0x07014FD8
.word   0x15040000, 0x07015398
.word   0x15050000, 0x070156E0
.word   0x15010000, 0x07015A20
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x070075A8
.word   0x15040000, 0x07007940
.word   0x15010000, 0x07007B90
.word   0x15050000, 0x07007FD0
.word   0x15010000, 0x07008B58
.word   0x15050000, 0x07008EA8
.word   0x15010000, 0x0701E4E0
.word   0x15040000, 0x0701E8D8
.word   0x15010000, 0x0701ED18
.word   0x15050000, 0x0701EEC8
.word   0x15010000, 0x0701F070
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0700AFF0
.word   0x15010000, 0x0700B1C8
.word   0x15050000, 0x0700B418
.word   0x15010000, 0x0700B9E0
.word   0x15050000, 0x0700BBF8
.word   0x15010000, 0x0700F510
.word   0x15040000, 0x0700F848
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0700AFF0
.word   0x15010000, 0x0700B1C8
.word   0x15050000, 0x0700B418
.word   0x15010000, 0x0700B9E0
.word   0x15050000, 0x0700BBF8
.word   0x15010000, 0x07017378
.word   0x15010000, 0x07017570
.word   0x15050000, 0x07017788
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0700AFF0
.word   0x15010000, 0x0700B1C8
.word   0x15050000, 0x0700B418
.word   0x15010000, 0x0700B9E0
.word   0x15050000, 0x0700BBF8
.word   0x15010000, 0x07019EF8
.word   0x15040000, 0x0701A080
.word   0x18000000, Geo18_802D01E0
.word   0x18000400, Geo18_802D104C
.word   0x18000401, Geo18_802D104C
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0700D080
.word   0x15040000, 0x0700D2E0
.word   0x15010000, 0x0700D490
.word   0x15050000, 0x0700D7E0
.word   0x15010000, 0x07011120
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0700D080
.word   0x15040000, 0x0700D2E0
.word   0x15010000, 0x0700D490
.word   0x15050000, 0x0700D7E0
.word   0x15010000, 0x07012220
.word   0x15010000, 0x07012510
.word   0x15050000, 0x070126E8
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0700F510
.word   0x15040000, 0x0700F848
.word   0x15010000, 0x07019EF8
.word   0x15040000, 0x0701A080
.word   0x18000000, Geo18_802D01E0
.word   0x18000400, Geo18_802D104C
.word   0x18000401, Geo18_802D104C
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x07011120
.word   0x15010000, 0x0701E4E0
.word   0x15040000, 0x0701E8D8
.word   0x15010000, 0x0701ED18
.word   0x15050000, 0x0701EEC8
.word   0x15010000, 0x0701F070
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x07017378
.word   0x15010000, 0x07017570
.word   0x15050000, 0x07017788
.word   0x15010000, 0x0701E4E0
.word   0x15040000, 0x0701E8D8
.word   0x15010000, 0x0701ED18
.word   0x15050000, 0x0701EEC8
.word   0x15010000, 0x0701F070
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x07019EF8
.word   0x15040000, 0x0701A080
.word   0x15010000, 0x0701A850
.word   0x18000000, Geo18_802D01E0
.word   0x18000400, Geo18_802D104C
.word   0x18000401, Geo18_802D104C
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0701A850
.word   0x15010000, 0x0701B6D0
.word   0x18000000, Geo18_802D01E0
.word   0x18000400, Geo18_802D104C
.word 0x05000000
.word 0x03000000
.word 0x0B000000
.word 0x04000000
.word   0x15010000, 0x0701B6D0
.word   0x15010000, 0x0701E4E0
.word   0x15040000, 0x0701E8D8
.word   0x15010000, 0x0701ED18
.word   0x15050000, 0x0701EEC8
.word   0x15010000, 0x0701F070
.word   0x18000000, Geo18_802D01E0
.word   0x18000400, Geo18_802D104C
.word 0x05000000
.word 0x03000000
.word 0x0800000A, 0x00A00078, 0x00A00078
.word 0x04000000
.word   0x0C000000
.word   0x04000000
.word     0x09000064
.word     0x04000000
.word       0x19000006, Geo19_802763D4
.word     0x05000000
.word   0x05000000
.word   0x0C010000
.word   0x04000000
.word     0x0A01002D, 0x00322710, Geo0A_8029AA3C
.word     0x04000000
.word       0x0F000004, 0x000007D0, 0x17700000, 0x00000000, Geo0F_80287D30
.word       0x04000000
.word         0x0E000020, GeoSwitchCaseBlinking
.word         0x04000000
.word           0x02010000, 0x0E000670
.word           0x02010000, 0x0E0006B0
.word           0x02010000, 0x0E0006E8
.word           0x02010000, 0x0E000730
.word           0x02010000, 0x0E000750
.word           0x02010000, 0x0E000768
.word           0x02010000, 0x0E0007B0
.word           0x02010000, 0x0E0007D0
.word           0x02010000, 0x0E000800
.word           0x02010000, 0x0E000828
.word           0x02010000, 0x0E000860
.word           0x02010000, 0x0E000888
.word           0x02010000, 0x0E0008B0
.word           0x02010000, 0x0E0008E8
.word           0x02010000, 0x0E000950
.word           0x02010000, 0x0E0009C8
.word           0x02010000, 0x0E000A18
.word           0x02010000, 0x0E000A60
.word           0x02010000, 0x0E000AD8
.word           0x02010000, 0x0E000B28
.word           0x02010000, 0x0E000B88
.word           0x02010000, 0x0E000BF0
.word           0x02010000, 0x0E000C38
.word           0x02010000, 0x0E000C88
.word           0x02010000, 0x0E000CE8
.word           0x02010000, 0x0E000D20
.word           0x02010000, 0x0E000D68
.word           0x02010000, 0x0E000DB0
.word           0x02010000, 0x0E000DF0
.word           0x02010000, 0x0E000E40
.word           0x02010000, 0x0E000E80
.word           0x02010000, 0x0E000EB0
.word         0x05000000
.word         0x17000000
.word         0x18000000, Geo18_802761D0
.word       0x05000000
.word     0x05000000
.word   0x05000000
.word 0x05000000
.word 0x01000000
bbh_level_end:

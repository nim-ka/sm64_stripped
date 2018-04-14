# Super Mario 64 (J) disassembly and split file
# generated by n64split v0.4a - N64 ROM splitter

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "macros.inc"
.include "globals.inc"

.section .text, "ax" 

glabel func_802CEAD0
/* 089AD0 802CEAD0 27BDFFF0 */  addiu $sp, $sp, -0x10
/* 089AD4 802CEAD4 00042600 */  sll   $a0, $a0, 0x18
/* 089AD8 802CEAD8 00042603 */  sra   $a0, $a0, 0x18
/* 089ADC 802CEADC AFA50014 */  sw    $a1, 0x14($sp)
/* 089AE0 802CEAE0 00047100 */  sll   $t6, $a0, 4
/* 089AE4 802CEAE4 3C0F8036 */  li    $t7, 0x80360000 # 0.000000
/* 089AE8 802CEAE8 01EE7821 */  addu  $t7, $t7, $t6
/* 089AEC 802CEAEC 95EFFF50 */  lhu   $t7, -0xb0($t7)
/* 089AF0 802CEAF0 448F2000 */  mtc1  $t7, $f4
/* 089AF4 802CEAF4 05E10005 */  bgez  $t7, .L802CEB0C
/* 089AF8 802CEAF8 468021A0 */   cvt.s.w $f6, $f4
/* 089AFC 802CEAFC 3C014F80 */  li    $at, 0x4F800000 # 0.000000
/* 089B00 802CEB00 44814000 */  mtc1  $at, $f8
/* 089B04 802CEB04 00000000 */  nop   
/* 089B08 802CEB08 46083180 */  add.s $f6, $f6, $f8
.L802CEB0C:
/* 089B0C 802CEB0C E7A6000C */  swc1  $f6, 0xc($sp)
/* 089B10 802CEB10 C7AA000C */  lwc1  $f10, 0xc($sp)
/* 089B14 802CEB14 3C018033 */  li    $at, 0x80330000 # 0.000000
/* 089B18 802CEB18 D4326FA0 */  ldc1  $f18, 0x6fa0($at)
/* 089B1C 802CEB1C C7A80014 */  lwc1  $f8, 0x14($sp)
/* 089B20 802CEB20 46005421 */  cvt.d.s $f16, $f10
/* 089B24 802CEB24 3C0140F0 */  li    $at, 0x40F00000 # 0.000000
/* 089B28 802CEB28 46328102 */  mul.d $f4, $f16, $f18
/* 089B2C 802CEB2C 44815800 */  mtc1  $at, $f11
/* 089B30 802CEB30 44805000 */  mtc1  $zero, $f10
/* 089B34 802CEB34 460041A1 */  cvt.d.s $f6, $f8
/* 089B38 802CEB38 462A3402 */  mul.d $f16, $f6, $f10
/* 089B3C 802CEB3C 46302483 */  div.d $f18, $f4, $f16
/* 089B40 802CEB40 46209220 */  cvt.s.d $f8, $f18
/* 089B44 802CEB44 E7A80008 */  swc1  $f8, 8($sp)
/* 089B48 802CEB48 C7A60008 */  lwc1  $f6, 8($sp)
/* 089B4C 802CEB4C 3C013FE0 */  li    $at, 0x3FE00000 # 0.000000
/* 089B50 802CEB50 44812800 */  mtc1  $at, $f5
/* 089B54 802CEB54 44802000 */  mtc1  $zero, $f4
/* 089B58 802CEB58 460032A1 */  cvt.d.s $f10, $f6
/* 089B5C 802CEB5C 46245400 */  add.d $f16, $f10, $f4
/* 089B60 802CEB60 4620848D */  trunc.w.d $f18, $f16
/* 089B64 802CEB64 E7B20004 */  swc1  $f18, 4($sp)
/* 089B68 802CEB68 8FB90004 */  lw    $t9, 4($sp)
/* 089B6C 802CEB6C 2B210501 */  slti  $at, $t9, 0x501
/* 089B70 802CEB70 1420000A */  bnez  $at, .L802CEB9C
/* 089B74 802CEB74 00000000 */   nop   
/* 089B78 802CEB78 8FA80004 */  lw    $t0, 4($sp)
/* 089B7C 802CEB7C 24010500 */  li    $at, 1280
/* 089B80 802CEB80 0101001A */  div   $zero, $t0, $at
/* 089B84 802CEB84 00004812 */  mflo  $t1
/* 089B88 802CEB88 00095080 */  sll   $t2, $t1, 2
/* 089B8C 802CEB8C 01495021 */  addu  $t2, $t2, $t1
/* 089B90 802CEB90 000A5200 */  sll   $t2, $t2, 8
/* 089B94 802CEB94 010A5823 */  subu  $t3, $t0, $t2
/* 089B98 802CEB98 AFAB0004 */  sw    $t3, 4($sp)
.L802CEB9C:
/* 089B9C 802CEB9C 8FAC0004 */  lw    $t4, 4($sp)
/* 089BA0 802CEBA0 240D0500 */  li    $t5, 1280
/* 089BA4 802CEBA4 10000003 */  b     .L802CEBB4
/* 089BA8 802CEBA8 01AC1023 */   subu  $v0, $t5, $t4
/* 089BAC 802CEBAC 10000001 */  b     .L802CEBB4
/* 089BB0 802CEBB0 00000000 */   nop   
.L802CEBB4:
/* 089BB4 802CEBB4 03E00008 */  jr    $ra
/* 089BB8 802CEBB8 27BD0010 */   addiu $sp, $sp, 0x10

glabel func_802CEBBC
/* 089BBC 802CEBBC 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 089BC0 802CEBC0 AFBF0014 */  sw    $ra, 0x14($sp)
/* 089BC4 802CEBC4 AFA40028 */  sw    $a0, 0x28($sp)
/* 089BC8 802CEBC8 AFA5002C */  sw    $a1, 0x2c($sp)
/* 089BCC 802CEBCC 83AE002B */  lb    $t6, 0x2b($sp)
/* 089BD0 802CEBD0 3C188036 */  lui   $t8, 0x8036
/* 089BD4 802CEBD4 3C018033 */  lui   $at, 0x8033
/* 089BD8 802CEBD8 000E7900 */  sll   $t7, $t6, 4
/* 089BDC 802CEBDC 030FC021 */  addu  $t8, $t8, $t7
/* 089BE0 802CEBE0 8718FF52 */  lh    $t8, -0xae($t8)
/* 089BE4 802CEBE4 D42A6FA8 */  ldc1  $f10, 0x6fa8($at)
/* 089BE8 802CEBE8 3C018033 */  li    $at, 0x80330000 # 0.000000
/* 089BEC 802CEBEC 44982000 */  mtc1  $t8, $f4
/* 089BF0 802CEBF0 D4326FB0 */  ldc1  $f18, 0x6fb0($at)
/* 089BF4 802CEBF4 468021A0 */  cvt.s.w $f6, $f4
/* 089BF8 802CEBF8 46003221 */  cvt.d.s $f8, $f6
/* 089BFC 802CEBFC 462A4402 */  mul.d $f16, $f8, $f10
/* 089C00 802CEC00 46328103 */  div.d $f4, $f16, $f18
/* 089C04 802CEC04 462021A0 */  cvt.s.d $f6, $f4
/* 089C08 802CEC08 E7A60024 */  swc1  $f6, 0x24($sp)
/* 089C0C 802CEC0C 3C0143B4 */  li    $at, 0x43B40000 # 0.000000
/* 089C10 802CEC10 44814000 */  mtc1  $at, $f8
/* 089C14 802CEC14 C7AA0024 */  lwc1  $f10, 0x24($sp)
/* 089C18 802CEC18 3C018033 */  lui   $at, 0x8033
/* 089C1C 802CEC1C D4246FB8 */  ldc1  $f4, 0x6fb8($at)
/* 089C20 802CEC20 460A4402 */  mul.s $f16, $f8, $f10
/* 089C24 802CEC24 460084A1 */  cvt.d.s $f18, $f16
/* 089C28 802CEC28 46249183 */  div.d $f6, $f18, $f4
/* 089C2C 802CEC2C 46203220 */  cvt.s.d $f8, $f6
/* 089C30 802CEC30 E7A80020 */  swc1  $f8, 0x20($sp)
/* 089C34 802CEC34 0C0B45F9 */  jal   func_802D17E4
/* 089C38 802CEC38 C7AC0020 */   lwc1  $f12, 0x20($sp)
/* 089C3C 802CEC3C AFA2001C */  sw    $v0, 0x1c($sp)
/* 089C40 802CEC40 8FB9001C */  lw    $t9, 0x1c($sp)
/* 089C44 802CEC44 27280258 */  addiu $t0, $t9, 0x258
/* 089C48 802CEC48 AFA80018 */  sw    $t0, 0x18($sp)
/* 089C4C 802CEC4C 8FA90018 */  lw    $t1, 0x18($sp)
/* 089C50 802CEC50 292103C1 */  slti  $at, $t1, 0x3c1
/* 089C54 802CEC54 14200003 */  bnez  $at, .L802CEC64
/* 089C58 802CEC58 00000000 */   nop   
/* 089C5C 802CEC5C 240A03C0 */  li    $t2, 960
/* 089C60 802CEC60 AFAA0018 */  sw    $t2, 0x18($sp)
.L802CEC64:
/* 089C64 802CEC64 8FAB0018 */  lw    $t3, 0x18($sp)
/* 089C68 802CEC68 296100F0 */  slti  $at, $t3, 0xf0
/* 089C6C 802CEC6C 10200003 */  beqz  $at, .L802CEC7C
/* 089C70 802CEC70 00000000 */   nop   
/* 089C74 802CEC74 240C00F0 */  li    $t4, 240
/* 089C78 802CEC78 AFAC0018 */  sw    $t4, 0x18($sp)
.L802CEC7C:
/* 089C7C 802CEC7C 10000003 */  b     .L802CEC8C
/* 089C80 802CEC80 8FA20018 */   lw    $v0, 0x18($sp)
/* 089C84 802CEC84 10000001 */  b     .L802CEC8C
/* 089C88 802CEC88 00000000 */   nop   
.L802CEC8C:
/* 089C8C 802CEC8C 8FBF0014 */  lw    $ra, 0x14($sp)
/* 089C90 802CEC90 27BD0028 */  addiu $sp, $sp, 0x28
/* 089C94 802CEC94 03E00008 */  jr    $ra
/* 089C98 802CEC98 00000000 */   nop   

glabel func_802CEC9C
/* 089C9C 802CEC9C 00042600 */  sll   $a0, $a0, 0x18
/* 089CA0 802CECA0 00042603 */  sra   $a0, $a0, 0x18
/* 089CA4 802CECA4 27BDFFF8 */  addiu $sp, $sp, -8
/* 089CA8 802CECA8 00047100 */  sll   $t6, $a0, 4
/* 089CAC 802CECAC 3C0F8036 */  lui   $t7, 0x8036
/* 089CB0 802CECB0 01EE7821 */  addu  $t7, $t7, $t6
/* 089CB4 802CECB4 8DEFFF54 */  lw    $t7, -0xac($t7)
/* 089CB8 802CECB8 240100A0 */  li    $at, 160
/* 089CBC 802CECBC 01E1001A */  div   $zero, $t7, $at
/* 089CC0 802CECC0 0000C012 */  mflo  $t8
/* 089CC4 802CECC4 AFB80004 */  sw    $t8, 4($sp)
/* 089CC8 802CECC8 00000000 */  nop   
/* 089CCC 802CECCC 0004C900 */  sll   $t9, $a0, 4
/* 089CD0 802CECD0 3C088036 */  lui   $t0, 0x8036
/* 089CD4 802CECD4 01194021 */  addu  $t0, $t0, $t9
/* 089CD8 802CECD8 8D08FF58 */  lw    $t0, -0xa8($t0)
/* 089CDC 802CECDC 240903C0 */  li    $t1, 960
/* 089CE0 802CECE0 24010078 */  li    $at, 120
/* 089CE4 802CECE4 01285023 */  subu  $t2, $t1, $t0
/* 089CE8 802CECE8 0141001A */  div   $zero, $t2, $at
/* 089CEC 802CECEC 00005812 */  mflo  $t3
/* 089CF0 802CECF0 AFAB0000 */  sw    $t3, ($sp)
/* 089CF4 802CECF4 00000000 */  nop   
/* 089CF8 802CECF8 8FAC0000 */  lw    $t4, ($sp)
/* 089CFC 802CECFC 8FAE0004 */  lw    $t6, 4($sp)
/* 089D00 802CED00 000C6880 */  sll   $t5, $t4, 2
/* 089D04 802CED04 01AC6821 */  addu  $t5, $t5, $t4
/* 089D08 802CED08 000D6840 */  sll   $t5, $t5, 1
/* 089D0C 802CED0C 10000003 */  b     .L802CED1C
/* 089D10 802CED10 01AE1021 */   addu  $v0, $t5, $t6
/* 089D14 802CED14 10000001 */  b     .L802CED1C
/* 089D18 802CED18 00000000 */   nop   
.L802CED1C:
/* 089D1C 802CED1C 03E00008 */  jr    $ra
/* 089D20 802CED20 27BD0008 */   addiu $sp, $sp, 8

glabel func_802CED24
/* 089D24 802CED24 27BDFFC0 */  addiu $sp, $sp, -0x40
/* 089D28 802CED28 AFBF0034 */  sw    $ra, 0x34($sp)
/* 089D2C 802CED2C AFA40040 */  sw    $a0, 0x40($sp)
/* 089D30 802CED30 AFA50044 */  sw    $a1, 0x44($sp)
/* 089D34 802CED34 0C09E25F */  jal   func_8027897C
/* 089D38 802CED38 24040040 */   li    $a0, 64
/* 089D3C 802CED3C AFA2003C */  sw    $v0, 0x3c($sp)
/* 089D40 802CED40 8FAE0040 */  lw    $t6, 0x40($sp)
/* 089D44 802CED44 2401000A */  li    $at, 10
/* 089D48 802CED48 01C1001A */  div   $zero, $t6, $at
/* 089D4C 802CED4C 00007810 */  mfhi  $t7
/* 089D50 802CED50 000FC080 */  sll   $t8, $t7, 2
/* 089D54 802CED54 030FC021 */  addu  $t8, $t8, $t7
/* 089D58 802CED58 0018C140 */  sll   $t8, $t8, 5
/* 089D5C 802CED5C A7B8003A */  sh    $t8, 0x3a($sp)
/* 089D60 802CED60 8FB90040 */  lw    $t9, 0x40($sp)
/* 089D64 802CED64 2401000A */  li    $at, 10
/* 089D68 802CED68 240A03C0 */  li    $t2, 960
/* 089D6C 802CED6C 0321001A */  div   $zero, $t9, $at
/* 089D70 802CED70 00004012 */  mflo  $t0
/* 089D74 802CED74 00084900 */  sll   $t1, $t0, 4
/* 089D78 802CED78 01284823 */  subu  $t1, $t1, $t0
/* 089D7C 802CED7C 000948C0 */  sll   $t1, $t1, 3
/* 089D80 802CED80 01495823 */  subu  $t3, $t2, $t1
/* 089D84 802CED84 A7AB0038 */  sh    $t3, 0x38($sp)
/* 089D88 802CED88 8FAC003C */  lw    $t4, 0x3c($sp)
/* 089D8C 802CED8C 11800067 */  beqz  $t4, .L802CEF2C
/* 089D90 802CED90 00000000 */   nop   
/* 089D94 802CED94 83AE0047 */  lb    $t6, 0x47($sp)
/* 089D98 802CED98 3C188033 */  lui   $t8, %hi(D_8032FFC8) # $t8, 0x8033
/* 089D9C 802CED9C 2718FFC8 */  addiu $t8, %lo(D_8032FFC8) # addiu $t8, $t8, -0x38
/* 089DA0 802CEDA0 000E7880 */  sll   $t7, $t6, 2
/* 089DA4 802CEDA4 240DFFFF */  li    $t5, -1
/* 089DA8 802CEDA8 01EE7823 */  subu  $t7, $t7, $t6
/* 089DAC 802CEDAC 01F8C821 */  addu  $t9, $t7, $t8
/* 089DB0 802CEDB0 AFAD0010 */  sw    $t5, 0x10($sp)
/* 089DB4 802CEDB4 AFA00014 */  sw    $zero, 0x14($sp)
/* 089DB8 802CEDB8 AFA00018 */  sw    $zero, 0x18($sp)
/* 089DBC 802CEDBC 93280000 */  lbu   $t0, ($t9)
/* 089DC0 802CEDC0 240B00FF */  li    $t3, 255
/* 089DC4 802CEDC4 8FA4003C */  lw    $a0, 0x3c($sp)
/* 089DC8 802CEDC8 AFA8001C */  sw    $t0, 0x1c($sp)
/* 089DCC 802CEDCC 932A0001 */  lbu   $t2, 1($t9)
/* 089DD0 802CEDD0 00002825 */  move  $a1, $zero
/* 089DD4 802CEDD4 87A6003A */  lh    $a2, 0x3a($sp)
/* 089DD8 802CEDD8 AFAA0020 */  sw    $t2, 0x20($sp)
/* 089DDC 802CEDDC 93290002 */  lbu   $t1, 2($t9)
/* 089DE0 802CEDE0 AFAB0028 */  sw    $t3, 0x28($sp)
/* 089DE4 802CEDE4 87A70038 */  lh    $a3, 0x38($sp)
/* 089DE8 802CEDE8 0C0B45CC */  jal   func_802D1730
/* 089DEC 802CEDEC AFA90024 */   sw    $t1, 0x24($sp)
/* 089DF0 802CEDF0 83AE0047 */  lb    $t6, 0x47($sp)
/* 089DF4 802CEDF4 3C188033 */  lui   $t8, %hi(D_8032FFC8) # $t8, 0x8033
/* 089DF8 802CEDF8 2718FFC8 */  addiu $t8, %lo(D_8032FFC8) # addiu $t8, $t8, -0x38
/* 089DFC 802CEDFC 000E7880 */  sll   $t7, $t6, 2
/* 089E00 802CEE00 240CFFFF */  li    $t4, -1
/* 089E04 802CEE04 240D03E0 */  li    $t5, 992
/* 089E08 802CEE08 01EE7823 */  subu  $t7, $t7, $t6
/* 089E0C 802CEE0C 01F84021 */  addu  $t0, $t7, $t8
/* 089E10 802CEE10 AFAD0018 */  sw    $t5, 0x18($sp)
/* 089E14 802CEE14 AFAC0010 */  sw    $t4, 0x10($sp)
/* 089E18 802CEE18 AFA00014 */  sw    $zero, 0x14($sp)
/* 089E1C 802CEE1C 910A0000 */  lbu   $t2, ($t0)
/* 089E20 802CEE20 87A70038 */  lh    $a3, 0x38($sp)
/* 089E24 802CEE24 240B00FF */  li    $t3, 255
/* 089E28 802CEE28 AFAA001C */  sw    $t2, 0x1c($sp)
/* 089E2C 802CEE2C 91190001 */  lbu   $t9, 1($t0)
/* 089E30 802CEE30 8FA4003C */  lw    $a0, 0x3c($sp)
/* 089E34 802CEE34 24050001 */  li    $a1, 1
/* 089E38 802CEE38 AFB90020 */  sw    $t9, 0x20($sp)
/* 089E3C 802CEE3C 91090002 */  lbu   $t1, 2($t0)
/* 089E40 802CEE40 AFAB0028 */  sw    $t3, 0x28($sp)
/* 089E44 802CEE44 87A6003A */  lh    $a2, 0x3a($sp)
/* 089E48 802CEE48 24E7FF88 */  addiu $a3, $a3, -0x78
/* 089E4C 802CEE4C 0C0B45CC */  jal   func_802D1730
/* 089E50 802CEE50 AFA90024 */   sw    $t1, 0x24($sp)
/* 089E54 802CEE54 83AF0047 */  lb    $t7, 0x47($sp)
/* 089E58 802CEE58 3C0A8033 */  lui   $t2, %hi(D_8032FFC8) # $t2, 0x8033
/* 089E5C 802CEE5C 254AFFC8 */  addiu $t2, %lo(D_8032FFC8) # addiu $t2, $t2, -0x38
/* 089E60 802CEE60 000FC080 */  sll   $t8, $t7, 2
/* 089E64 802CEE64 240CFFFF */  li    $t4, -1
/* 089E68 802CEE68 240D03E0 */  li    $t5, 992
/* 089E6C 802CEE6C 240E03E0 */  li    $t6, 992
/* 089E70 802CEE70 030FC023 */  subu  $t8, $t8, $t7
/* 089E74 802CEE74 030AC821 */  addu  $t9, $t8, $t2
/* 089E78 802CEE78 AFAE0018 */  sw    $t6, 0x18($sp)
/* 089E7C 802CEE7C AFAD0014 */  sw    $t5, 0x14($sp)
/* 089E80 802CEE80 AFAC0010 */  sw    $t4, 0x10($sp)
/* 089E84 802CEE84 93280000 */  lbu   $t0, ($t9)
/* 089E88 802CEE88 87A6003A */  lh    $a2, 0x3a($sp)
/* 089E8C 802CEE8C 87A70038 */  lh    $a3, 0x38($sp)
/* 089E90 802CEE90 AFA8001C */  sw    $t0, 0x1c($sp)
/* 089E94 802CEE94 93290001 */  lbu   $t1, 1($t9)
/* 089E98 802CEE98 240C00FF */  li    $t4, 255
/* 089E9C 802CEE9C 8FA4003C */  lw    $a0, 0x3c($sp)
/* 089EA0 802CEEA0 AFA90020 */  sw    $t1, 0x20($sp)
/* 089EA4 802CEEA4 932B0002 */  lbu   $t3, 2($t9)
/* 089EA8 802CEEA8 AFAC0028 */  sw    $t4, 0x28($sp)
/* 089EAC 802CEEAC 24050002 */  li    $a1, 2
/* 089EB0 802CEEB0 24C600A0 */  addiu $a2, $a2, 0xa0
/* 089EB4 802CEEB4 24E7FF88 */  addiu $a3, $a3, -0x78
/* 089EB8 802CEEB8 0C0B45CC */  jal   func_802D1730
/* 089EBC 802CEEBC AFAB0024 */   sw    $t3, 0x24($sp)
/* 089EC0 802CEEC0 83AF0047 */  lb    $t7, 0x47($sp)
/* 089EC4 802CEEC4 3C0A8033 */  lui   $t2, %hi(D_8032FFC8) # $t2, 0x8033
/* 089EC8 802CEEC8 254AFFC8 */  addiu $t2, %lo(D_8032FFC8) # addiu $t2, $t2, -0x38
/* 089ECC 802CEECC 000FC080 */  sll   $t8, $t7, 2
/* 089ED0 802CEED0 240DFFFF */  li    $t5, -1
/* 089ED4 802CEED4 240E03E0 */  li    $t6, 992
/* 089ED8 802CEED8 030FC023 */  subu  $t8, $t8, $t7
/* 089EDC 802CEEDC 030A4021 */  addu  $t0, $t8, $t2
/* 089EE0 802CEEE0 AFAE0014 */  sw    $t6, 0x14($sp)
/* 089EE4 802CEEE4 AFAD0010 */  sw    $t5, 0x10($sp)
/* 089EE8 802CEEE8 AFA00018 */  sw    $zero, 0x18($sp)
/* 089EEC 802CEEEC 91090000 */  lbu   $t1, ($t0)
/* 089EF0 802CEEF0 87A6003A */  lh    $a2, 0x3a($sp)
/* 089EF4 802CEEF4 240C00FF */  li    $t4, 255
/* 089EF8 802CEEF8 AFA9001C */  sw    $t1, 0x1c($sp)
/* 089EFC 802CEEFC 91190001 */  lbu   $t9, 1($t0)
/* 089F00 802CEF00 8FA4003C */  lw    $a0, 0x3c($sp)
/* 089F04 802CEF04 24050003 */  li    $a1, 3
/* 089F08 802CEF08 AFB90020 */  sw    $t9, 0x20($sp)
/* 089F0C 802CEF0C 910B0002 */  lbu   $t3, 2($t0)
/* 089F10 802CEF10 AFAC0028 */  sw    $t4, 0x28($sp)
/* 089F14 802CEF14 87A70038 */  lh    $a3, 0x38($sp)
/* 089F18 802CEF18 24C600A0 */  addiu $a2, $a2, 0xa0
/* 089F1C 802CEF1C 0C0B45CC */  jal   func_802D1730
/* 089F20 802CEF20 AFAB0024 */   sw    $t3, 0x24($sp)
/* 089F24 802CEF24 10000001 */  b     .L802CEF2C
/* 089F28 802CEF28 00000000 */   nop   
.L802CEF2C:
/* 089F2C 802CEF2C 10000003 */  b     .L802CEF3C
/* 089F30 802CEF30 8FA2003C */   lw    $v0, 0x3c($sp)
/* 089F34 802CEF34 10000001 */  b     .L802CEF3C
/* 089F38 802CEF38 00000000 */   nop   
.L802CEF3C:
/* 089F3C 802CEF3C 8FBF0034 */  lw    $ra, 0x34($sp)
/* 089F40 802CEF40 27BD0040 */  addiu $sp, $sp, 0x40
/* 089F44 802CEF44 03E00008 */  jr    $ra
/* 089F48 802CEF48 00000000 */   nop   

glabel func_802CEF4C
/* 089F4C 802CEF4C 27BDFFA8 */  addiu $sp, $sp, -0x58
/* 089F50 802CEF50 AFBF001C */  sw    $ra, 0x1c($sp)
/* 089F54 802CEF54 AFA40058 */  sw    $a0, 0x58($sp)
/* 089F58 802CEF58 AFA5005C */  sw    $a1, 0x5c($sp)
/* 089F5C 802CEF5C AFA60060 */  sw    $a2, 0x60($sp)
/* 089F60 802CEF60 AFA70064 */  sw    $a3, 0x64($sp)
/* 089F64 802CEF64 AFB00018 */  sw    $s0, 0x18($sp)
/* 089F68 802CEF68 AFA00054 */  sw    $zero, 0x54($sp)
.L802CEF6C:
/* 089F6C 802CEF6C AFA00050 */  sw    $zero, 0x50($sp)
.L802CEF70:
/* 089F70 802CEF70 83AE0063 */  lb    $t6, 0x63($sp)
/* 089F74 802CEF74 8FB90054 */  lw    $t9, 0x54($sp)
/* 089F78 802CEF78 3C188036 */  lui   $t8, 0x8036
/* 089F7C 802CEF7C 000E7900 */  sll   $t7, $t6, 4
/* 089F80 802CEF80 030FC021 */  addu  $t8, $t8, $t7
/* 089F84 802CEF84 8F18FF5C */  lw    $t8, -0xa4($t8)
/* 089F88 802CEF88 00194080 */  sll   $t0, $t9, 2
/* 089F8C 802CEF8C 8FAA0050 */  lw    $t2, 0x50($sp)
/* 089F90 802CEF90 01194021 */  addu  $t0, $t0, $t9
/* 089F94 802CEF94 00084040 */  sll   $t0, $t0, 1
/* 089F98 802CEF98 03084821 */  addu  $t1, $t8, $t0
/* 089F9C 802CEF9C 012A5821 */  addu  $t3, $t1, $t2
/* 089FA0 802CEFA0 AFAB004C */  sw    $t3, 0x4c($sp)
/* 089FA4 802CEFA4 83AC005F */  lb    $t4, 0x5f($sp)
/* 089FA8 802CEFA8 3C048033 */  lui   $a0, 0x8033
/* 089FAC 802CEFAC 000C6880 */  sll   $t5, $t4, 2
/* 089FB0 802CEFB0 008D2021 */  addu  $a0, $a0, $t5
/* 089FB4 802CEFB4 0C09DE68 */  jal   SegmentedToVirtual
/* 089FB8 802CEFB8 8C84FFA0 */   lw    $a0, -0x60($a0)
/* 089FBC 802CEFBC 8FAE004C */  lw    $t6, 0x4c($sp)
/* 089FC0 802CEFC0 00408025 */  move  $s0, $v0
/* 089FC4 802CEFC4 000E7880 */  sll   $t7, $t6, 2
/* 089FC8 802CEFC8 020FC821 */  addu  $t9, $s0, $t7
/* 089FCC 802CEFCC 8F380000 */  lw    $t8, ($t9)
/* 089FD0 802CEFD0 AFB80048 */  sw    $t8, 0x48($sp)
/* 089FD4 802CEFD4 8FA4004C */  lw    $a0, 0x4c($sp)
/* 089FD8 802CEFD8 0C0B3B49 */  jal   func_802CED24
/* 089FDC 802CEFDC 83A50067 */   lb    $a1, 0x67($sp)
/* 089FE0 802CEFE0 AFA20044 */  sw    $v0, 0x44($sp)
/* 089FE4 802CEFE4 8FA80058 */  lw    $t0, 0x58($sp)
/* 089FE8 802CEFE8 8D090000 */  lw    $t1, ($t0)
/* 089FEC 802CEFEC AFA90040 */  sw    $t1, 0x40($sp)
/* 089FF0 802CEFF0 8D0A0000 */  lw    $t2, ($t0)
/* 089FF4 802CEFF4 254B0008 */  addiu $t3, $t2, 8
/* 089FF8 802CEFF8 AD0B0000 */  sw    $t3, ($t0)
/* 089FFC 802CEFFC 8FAD0040 */  lw    $t5, 0x40($sp)
/* 08A000 802CF000 3C0CFD10 */  lui   $t4, 0xfd10
/* 08A004 802CF004 ADAC0000 */  sw    $t4, ($t5)
/* 08A008 802CF008 8FAE0048 */  lw    $t6, 0x48($sp)
/* 08A00C 802CF00C 8FAF0040 */  lw    $t7, 0x40($sp)
/* 08A010 802CF010 ADEE0004 */  sw    $t6, 4($t7)
/* 08A014 802CF014 8FB90058 */  lw    $t9, 0x58($sp)
/* 08A018 802CF018 8F380000 */  lw    $t8, ($t9)
/* 08A01C 802CF01C AFB8003C */  sw    $t8, 0x3c($sp)
/* 08A020 802CF020 8F290000 */  lw    $t1, ($t9)
/* 08A024 802CF024 252A0008 */  addiu $t2, $t1, 8
/* 08A028 802CF028 AF2A0000 */  sw    $t2, ($t9)
/* 08A02C 802CF02C 8FA8003C */  lw    $t0, 0x3c($sp)
/* 08A030 802CF030 3C0BE800 */  lui   $t3, 0xe800
/* 08A034 802CF034 AD0B0000 */  sw    $t3, ($t0)
/* 08A038 802CF038 8FAC003C */  lw    $t4, 0x3c($sp)
/* 08A03C 802CF03C AD800004 */  sw    $zero, 4($t4)
/* 08A040 802CF040 8FAD0058 */  lw    $t5, 0x58($sp)
/* 08A044 802CF044 8DAE0000 */  lw    $t6, ($t5)
/* 08A048 802CF048 AFAE0038 */  sw    $t6, 0x38($sp)
/* 08A04C 802CF04C 8DAF0000 */  lw    $t7, ($t5)
/* 08A050 802CF050 25F80008 */  addiu $t8, $t7, 8
/* 08A054 802CF054 ADB80000 */  sw    $t8, ($t5)
/* 08A058 802CF058 8FAA0038 */  lw    $t2, 0x38($sp)
/* 08A05C 802CF05C 3C09F510 */  lui   $t1, 0xf510
/* 08A060 802CF060 AD490000 */  sw    $t1, ($t2)
/* 08A064 802CF064 8FAB0038 */  lw    $t3, 0x38($sp)
/* 08A068 802CF068 3C190700 */  lui   $t9, 0x700
/* 08A06C 802CF06C AD790004 */  sw    $t9, 4($t3)
/* 08A070 802CF070 8FA80058 */  lw    $t0, 0x58($sp)
/* 08A074 802CF074 8D0C0000 */  lw    $t4, ($t0)
/* 08A078 802CF078 AFAC0034 */  sw    $t4, 0x34($sp)
/* 08A07C 802CF07C 8D0E0000 */  lw    $t6, ($t0)
/* 08A080 802CF080 25CF0008 */  addiu $t7, $t6, 8
/* 08A084 802CF084 AD0F0000 */  sw    $t7, ($t0)
/* 08A088 802CF088 8FAD0034 */  lw    $t5, 0x34($sp)
/* 08A08C 802CF08C 3C18E600 */  lui   $t8, 0xe600
/* 08A090 802CF090 ADB80000 */  sw    $t8, ($t5)
/* 08A094 802CF094 8FA90034 */  lw    $t1, 0x34($sp)
/* 08A098 802CF098 AD200004 */  sw    $zero, 4($t1)
/* 08A09C 802CF09C 8FAA0058 */  lw    $t2, 0x58($sp)
/* 08A0A0 802CF0A0 8D590000 */  lw    $t9, ($t2)
/* 08A0A4 802CF0A4 AFB90030 */  sw    $t9, 0x30($sp)
/* 08A0A8 802CF0A8 8D4B0000 */  lw    $t3, ($t2)
/* 08A0AC 802CF0AC 256C0008 */  addiu $t4, $t3, 8
/* 08A0B0 802CF0B0 AD4C0000 */  sw    $t4, ($t2)
/* 08A0B4 802CF0B4 8FAF0030 */  lw    $t7, 0x30($sp)
/* 08A0B8 802CF0B8 3C0EF300 */  lui   $t6, 0xf300
/* 08A0BC 802CF0BC ADEE0000 */  sw    $t6, ($t7)
/* 08A0C0 802CF0C0 8FB80030 */  lw    $t8, 0x30($sp)
/* 08A0C4 802CF0C4 3C08073F */  lui   $t0, (0x073FF100 >> 16) # lui $t0, 0x73f
/* 08A0C8 802CF0C8 3508F100 */  ori   $t0, (0x073FF100 & 0xFFFF) # ori $t0, $t0, 0xf100
/* 08A0CC 802CF0CC AF080004 */  sw    $t0, 4($t8)
/* 08A0D0 802CF0D0 8FAD0058 */  lw    $t5, 0x58($sp)
/* 08A0D4 802CF0D4 8DA90000 */  lw    $t1, ($t5)
/* 08A0D8 802CF0D8 AFA9002C */  sw    $t1, 0x2c($sp)
/* 08A0DC 802CF0DC 8DB90000 */  lw    $t9, ($t5)
/* 08A0E0 802CF0E0 272B0008 */  addiu $t3, $t9, 8
/* 08A0E4 802CF0E4 ADAB0000 */  sw    $t3, ($t5)
/* 08A0E8 802CF0E8 8FAA002C */  lw    $t2, 0x2c($sp)
/* 08A0EC 802CF0EC 3C0C0430 */  lui   $t4, (0x04300040 >> 16) # lui $t4, 0x430
/* 08A0F0 802CF0F0 358C0040 */  ori   $t4, (0x04300040 & 0xFFFF) # ori $t4, $t4, 0x40
/* 08A0F4 802CF0F4 AD4C0000 */  sw    $t4, ($t2)
/* 08A0F8 802CF0F8 8FAE0044 */  lw    $t6, 0x44($sp)
/* 08A0FC 802CF0FC 8FA8002C */  lw    $t0, 0x2c($sp)
/* 08A100 802CF100 3C011FFF */  lui   $at, (0x1FFFFFFF >> 16) # lui $at, 0x1fff
/* 08A104 802CF104 3421FFFF */  ori   $at, (0x1FFFFFFF & 0xFFFF) # ori $at, $at, 0xffff
/* 08A108 802CF108 01C17824 */  and   $t7, $t6, $at
/* 08A10C 802CF10C AD0F0004 */  sw    $t7, 4($t0)
/* 08A110 802CF110 8FB80058 */  lw    $t8, 0x58($sp)
/* 08A114 802CF114 8F090000 */  lw    $t1, ($t8)
/* 08A118 802CF118 AFA90028 */  sw    $t1, 0x28($sp)
/* 08A11C 802CF11C 8F190000 */  lw    $t9, ($t8)
/* 08A120 802CF120 272B0008 */  addiu $t3, $t9, 8
/* 08A124 802CF124 AF0B0000 */  sw    $t3, ($t8)
/* 08A128 802CF128 8FAC0028 */  lw    $t4, 0x28($sp)
/* 08A12C 802CF12C 3C0D0600 */  lui   $t5, 0x600
/* 08A130 802CF130 AD8D0000 */  sw    $t5, ($t4)
/* 08A134 802CF134 8FAE0028 */  lw    $t6, 0x28($sp)
/* 08A138 802CF138 3C0A0201 */  lui   $t2, %hi(D_020144F0) # $t2, 0x201
/* 08A13C 802CF13C 254A44F0 */  addiu $t2, %lo(D_020144F0) # addiu $t2, $t2, 0x44f0
/* 08A140 802CF140 ADCA0004 */  sw    $t2, 4($t6)
/* 08A144 802CF144 8FAF0050 */  lw    $t7, 0x50($sp)
/* 08A148 802CF148 25E80001 */  addiu $t0, $t7, 1
/* 08A14C 802CF14C 29010003 */  slti  $at, $t0, 3
/* 08A150 802CF150 1420FF87 */  bnez  $at, .L802CEF70
/* 08A154 802CF154 AFA80050 */   sw    $t0, 0x50($sp)
/* 08A158 802CF158 8FA90054 */  lw    $t1, 0x54($sp)
/* 08A15C 802CF15C 25390001 */  addiu $t9, $t1, 1
/* 08A160 802CF160 2B210003 */  slti  $at, $t9, 3
/* 08A164 802CF164 1420FF81 */  bnez  $at, .L802CEF6C
/* 08A168 802CF168 AFB90054 */   sw    $t9, 0x54($sp)
/* 08A16C 802CF16C 10000001 */  b     .L802CF174
/* 08A170 802CF170 00000000 */   nop   
.L802CF174:
/* 08A174 802CF174 8FBF001C */  lw    $ra, 0x1c($sp)
/* 08A178 802CF178 8FB00018 */  lw    $s0, 0x18($sp)
/* 08A17C 802CF17C 27BD0058 */  addiu $sp, $sp, 0x58
/* 08A180 802CF180 03E00008 */  jr    $ra
/* 08A184 802CF184 00000000 */   nop   

glabel func_802CF188
/* 08A188 802CF188 27BDFFC0 */  addiu $sp, $sp, -0x40
/* 08A18C 802CF18C AFBF0024 */  sw    $ra, 0x24($sp)
/* 08A190 802CF190 AFA40040 */  sw    $a0, 0x40($sp)
/* 08A194 802CF194 83AE0043 */  lb    $t6, 0x43($sp)
/* 08A198 802CF198 3C188036 */  lui   $t8, 0x8036
/* 08A19C 802CF19C 000E7900 */  sll   $t7, $t6, 4
/* 08A1A0 802CF1A0 030FC021 */  addu  $t8, $t8, $t7
/* 08A1A4 802CF1A4 8F18FF54 */  lw    $t8, -0xac($t8)
/* 08A1A8 802CF1A8 44982000 */  mtc1  $t8, $f4
/* 08A1AC 802CF1AC 00000000 */  nop   
/* 08A1B0 802CF1B0 468021A0 */  cvt.s.w $f6, $f4
/* 08A1B4 802CF1B4 E7A6003C */  swc1  $f6, 0x3c($sp)
/* 08A1B8 802CF1B8 83B90043 */  lb    $t9, 0x43($sp)
/* 08A1BC 802CF1BC 3C098036 */  lui   $t1, 0x8036
/* 08A1C0 802CF1C0 00194100 */  sll   $t0, $t9, 4
/* 08A1C4 802CF1C4 01284821 */  addu  $t1, $t1, $t0
/* 08A1C8 802CF1C8 8D29FF54 */  lw    $t1, -0xac($t1)
/* 08A1CC 802CF1CC 252A0140 */  addiu $t2, $t1, 0x140
/* 08A1D0 802CF1D0 448A4000 */  mtc1  $t2, $f8
/* 08A1D4 802CF1D4 00000000 */  nop   
/* 08A1D8 802CF1D8 468042A0 */  cvt.s.w $f10, $f8
/* 08A1DC 802CF1DC E7AA0038 */  swc1  $f10, 0x38($sp)
/* 08A1E0 802CF1E0 83AB0043 */  lb    $t3, 0x43($sp)
/* 08A1E4 802CF1E4 3C0D8036 */  lui   $t5, 0x8036
/* 08A1E8 802CF1E8 000B6100 */  sll   $t4, $t3, 4
/* 08A1EC 802CF1EC 01AC6821 */  addu  $t5, $t5, $t4
/* 08A1F0 802CF1F0 8DADFF58 */  lw    $t5, -0xa8($t5)
/* 08A1F4 802CF1F4 25AEFF10 */  addiu $t6, $t5, -0xf0
/* 08A1F8 802CF1F8 448E8000 */  mtc1  $t6, $f16
/* 08A1FC 802CF1FC 00000000 */  nop   
/* 08A200 802CF200 468084A0 */  cvt.s.w $f18, $f16
/* 08A204 802CF204 E7B20034 */  swc1  $f18, 0x34($sp)
/* 08A208 802CF208 83AF0043 */  lb    $t7, 0x43($sp)
/* 08A20C 802CF20C 3C198036 */  li    $t9, 0x80360000 # 0.000000
/* 08A210 802CF210 000FC100 */  sll   $t8, $t7, 4
/* 08A214 802CF214 0338C821 */  addu  $t9, $t9, $t8
/* 08A218 802CF218 8F39FF58 */  lw    $t9, -0xa8($t9)
/* 08A21C 802CF21C 44992000 */  mtc1  $t9, $f4
/* 08A220 802CF220 00000000 */  nop   
/* 08A224 802CF224 468021A0 */  cvt.s.w $f6, $f4
/* 08A228 802CF228 E7A60030 */  swc1  $f6, 0x30($sp)
/* 08A22C 802CF22C 0C09E25F */  jal   func_8027897C
/* 08A230 802CF230 24040040 */   li    $a0, 64
/* 08A234 802CF234 AFA2002C */  sw    $v0, 0x2c($sp)
/* 08A238 802CF238 8FA8002C */  lw    $t0, 0x2c($sp)
/* 08A23C 802CF23C 11000012 */  beqz  $t0, .L802CF288
/* 08A240 802CF240 00000000 */   nop   
/* 08A244 802CF244 3C014040 */  li    $at, 0x40400000 # 0.000000
/* 08A248 802CF248 44818000 */  mtc1  $at, $f16
/* 08A24C 802CF24C 3C013F80 */  li    $at, 0x3F800000 # 0.000000
/* 08A250 802CF250 44819000 */  mtc1  $at, $f18
/* 08A254 802CF254 C7A80030 */  lwc1  $f8, 0x30($sp)
/* 08A258 802CF258 44805000 */  mtc1  $zero, $f10
/* 08A25C 802CF25C 8FA4002C */  lw    $a0, 0x2c($sp)
/* 08A260 802CF260 8FA5003C */  lw    $a1, 0x3c($sp)
/* 08A264 802CF264 8FA60038 */  lw    $a2, 0x38($sp)
/* 08A268 802CF268 8FA70034 */  lw    $a3, 0x34($sp)
/* 08A26C 802CF26C E7B00018 */  swc1  $f16, 0x18($sp)
/* 08A270 802CF270 E7A80010 */  swc1  $f8, 0x10($sp)
/* 08A274 802CF274 E7B2001C */  swc1  $f18, 0x1c($sp)
/* 08A278 802CF278 0C0C8F91 */  jal   guFrustum
/* 08A27C 802CF27C E7AA0014 */   swc1  $f10, 0x14($sp)
/* 08A280 802CF280 10000001 */  b     .L802CF288
/* 08A284 802CF284 00000000 */   nop   
.L802CF288:
/* 08A288 802CF288 10000003 */  b     .L802CF298
/* 08A28C 802CF28C 8FA2002C */   lw    $v0, 0x2c($sp)
/* 08A290 802CF290 10000001 */  b     .L802CF298
/* 08A294 802CF294 00000000 */   nop   
.L802CF298:
/* 08A298 802CF298 8FBF0024 */  lw    $ra, 0x24($sp)
/* 08A29C 802CF29C 27BD0040 */  addiu $sp, $sp, 0x40
/* 08A2A0 802CF2A0 03E00008 */  jr    $ra
/* 08A2A4 802CF2A4 00000000 */   nop   

glabel func_802CF2A8
/* 08A2A8 802CF2A8 27BDFFC0 */  addiu $sp, $sp, -0x40
/* 08A2AC 802CF2AC AFBF0014 */  sw    $ra, 0x14($sp)
/* 08A2B0 802CF2B0 AFA40040 */  sw    $a0, 0x40($sp)
/* 08A2B4 802CF2B4 AFA50044 */  sw    $a1, 0x44($sp)
/* 08A2B8 802CF2B8 AFA60048 */  sw    $a2, 0x48($sp)
/* 08A2BC 802CF2BC 240E0044 */  li    $t6, 68
/* 08A2C0 802CF2C0 AFAE003C */  sw    $t6, 0x3c($sp)
/* 08A2C4 802CF2C4 8FA4003C */  lw    $a0, 0x3c($sp)
/* 08A2C8 802CF2C8 000478C0 */  sll   $t7, $a0, 3
/* 08A2CC 802CF2CC 0C09E25F */  jal   func_8027897C
/* 08A2D0 802CF2D0 01E02025 */   move  $a0, $t7
/* 08A2D4 802CF2D4 AFA20038 */  sw    $v0, 0x38($sp)
/* 08A2D8 802CF2D8 8FB80038 */  lw    $t8, 0x38($sp)
/* 08A2DC 802CF2DC AFB80034 */  sw    $t8, 0x34($sp)
/* 08A2E0 802CF2E0 8FB90038 */  lw    $t9, 0x38($sp)
/* 08A2E4 802CF2E4 17200005 */  bnez  $t9, .L802CF2FC
/* 08A2E8 802CF2E8 00000000 */   nop   
/* 08A2EC 802CF2EC 10000045 */  b     .L802CF404
/* 08A2F0 802CF2F0 00001025 */   move  $v0, $zero
/* 08A2F4 802CF2F4 1000003F */  b     .L802CF3F4
/* 08A2F8 802CF2F8 00000000 */   nop   
.L802CF2FC:
/* 08A2FC 802CF2FC 0C0B3C62 */  jal   func_802CF188
/* 08A300 802CF300 83A40043 */   lb    $a0, 0x43($sp)
/* 08A304 802CF304 AFA20030 */  sw    $v0, 0x30($sp)
/* 08A308 802CF308 8FA80034 */  lw    $t0, 0x34($sp)
/* 08A30C 802CF30C 25090008 */  addiu $t1, $t0, 8
/* 08A310 802CF310 AFA90034 */  sw    $t1, 0x34($sp)
/* 08A314 802CF314 AFA8002C */  sw    $t0, 0x2c($sp)
/* 08A318 802CF318 8FAB002C */  lw    $t3, 0x2c($sp)
/* 08A31C 802CF31C 3C0A0600 */  lui   $t2, 0x600
/* 08A320 802CF320 AD6A0000 */  sw    $t2, ($t3)
/* 08A324 802CF324 8FAD002C */  lw    $t5, 0x2c($sp)
/* 08A328 802CF328 3C0C0201 */  lui   $t4, %hi(D_02014708) # $t4, 0x201
/* 08A32C 802CF32C 258C4708 */  addiu $t4, %lo(D_02014708) # addiu $t4, $t4, 0x4708
/* 08A330 802CF330 ADAC0004 */  sw    $t4, 4($t5)
/* 08A334 802CF334 8FAE0034 */  lw    $t6, 0x34($sp)
/* 08A338 802CF338 25CF0008 */  addiu $t7, $t6, 8
/* 08A33C 802CF33C AFAF0034 */  sw    $t7, 0x34($sp)
/* 08A340 802CF340 AFAE0028 */  sw    $t6, 0x28($sp)
/* 08A344 802CF344 8FB90028 */  lw    $t9, 0x28($sp)
/* 08A348 802CF348 3C180101 */  lui   $t8, (0x01010040 >> 16) # lui $t8, 0x101
/* 08A34C 802CF34C 37180040 */  ori   $t8, (0x01010040 & 0xFFFF) # ori $t8, $t8, 0x40
/* 08A350 802CF350 AF380000 */  sw    $t8, ($t9)
/* 08A354 802CF354 8FA80030 */  lw    $t0, 0x30($sp)
/* 08A358 802CF358 8FAA0028 */  lw    $t2, 0x28($sp)
/* 08A35C 802CF35C 3C011FFF */  lui   $at, (0x1FFFFFFF >> 16) # lui $at, 0x1fff
/* 08A360 802CF360 3421FFFF */  ori   $at, (0x1FFFFFFF & 0xFFFF) # ori $at, $at, 0xffff
/* 08A364 802CF364 01014824 */  and   $t1, $t0, $at
/* 08A368 802CF368 AD490004 */  sw    $t1, 4($t2)
/* 08A36C 802CF36C 8FAB0034 */  lw    $t3, 0x34($sp)
/* 08A370 802CF370 256C0008 */  addiu $t4, $t3, 8
/* 08A374 802CF374 AFAC0034 */  sw    $t4, 0x34($sp)
/* 08A378 802CF378 AFAB0024 */  sw    $t3, 0x24($sp)
/* 08A37C 802CF37C 8FAE0024 */  lw    $t6, 0x24($sp)
/* 08A380 802CF380 3C0D0600 */  lui   $t5, 0x600
/* 08A384 802CF384 ADCD0000 */  sw    $t5, ($t6)
/* 08A388 802CF388 8FB80024 */  lw    $t8, 0x24($sp)
/* 08A38C 802CF38C 3C0F0201 */  lui   $t7, %hi(D_02014738) # $t7, 0x201
/* 08A390 802CF390 25EF4738 */  addiu $t7, %lo(D_02014738) # addiu $t7, $t7, 0x4738
/* 08A394 802CF394 AF0F0004 */  sw    $t7, 4($t8)
/* 08A398 802CF398 27A40034 */  addiu $a0, $sp, 0x34
/* 08A39C 802CF39C 83A50047 */  lb    $a1, 0x47($sp)
/* 08A3A0 802CF3A0 83A60043 */  lb    $a2, 0x43($sp)
/* 08A3A4 802CF3A4 0C0B3BD3 */  jal   func_802CEF4C
/* 08A3A8 802CF3A8 83A7004B */   lb    $a3, 0x4b($sp)
/* 08A3AC 802CF3AC 8FB90034 */  lw    $t9, 0x34($sp)
/* 08A3B0 802CF3B0 27280008 */  addiu $t0, $t9, 8
/* 08A3B4 802CF3B4 AFA80034 */  sw    $t0, 0x34($sp)
/* 08A3B8 802CF3B8 AFB90020 */  sw    $t9, 0x20($sp)
/* 08A3BC 802CF3BC 8FAA0020 */  lw    $t2, 0x20($sp)
/* 08A3C0 802CF3C0 3C090600 */  lui   $t1, 0x600
/* 08A3C4 802CF3C4 AD490000 */  sw    $t1, ($t2)
/* 08A3C8 802CF3C8 8FAC0020 */  lw    $t4, 0x20($sp)
/* 08A3CC 802CF3CC 3C0B0201 */  lui   $t3, %hi(D_02014768) # $t3, 0x201
/* 08A3D0 802CF3D0 256B4768 */  addiu $t3, %lo(D_02014768) # addiu $t3, $t3, 0x4768
/* 08A3D4 802CF3D4 AD8B0004 */  sw    $t3, 4($t4)
/* 08A3D8 802CF3D8 8FAD0034 */  lw    $t5, 0x34($sp)
/* 08A3DC 802CF3DC AFAD001C */  sw    $t5, 0x1c($sp)
/* 08A3E0 802CF3E0 8FAF001C */  lw    $t7, 0x1c($sp)
/* 08A3E4 802CF3E4 3C0EB800 */  lui   $t6, 0xb800
/* 08A3E8 802CF3E8 ADEE0000 */  sw    $t6, ($t7)
/* 08A3EC 802CF3EC 8FB8001C */  lw    $t8, 0x1c($sp)
/* 08A3F0 802CF3F0 AF000004 */  sw    $zero, 4($t8)
.L802CF3F4:
/* 08A3F4 802CF3F4 10000003 */  b     .L802CF404
/* 08A3F8 802CF3F8 8FA20038 */   lw    $v0, 0x38($sp)
/* 08A3FC 802CF3FC 10000001 */  b     .L802CF404
/* 08A400 802CF400 00000000 */   nop   
.L802CF404:
/* 08A404 802CF404 8FBF0014 */  lw    $ra, 0x14($sp)
/* 08A408 802CF408 27BD0040 */  addiu $sp, $sp, 0x40
/* 08A40C 802CF40C 03E00008 */  jr    $ra
/* 08A410 802CF410 00000000 */   nop   

glabel func_802CF414
/* 08A414 802CF414 27BDFFC8 */  addiu $sp, $sp, -0x38
/* 08A418 802CF418 AFBF001C */  sw    $ra, 0x1c($sp)
/* 08A41C 802CF41C AFA40038 */  sw    $a0, 0x38($sp)
/* 08A420 802CF420 AFA5003C */  sw    $a1, 0x3c($sp)
/* 08A424 802CF424 AFA60040 */  sw    $a2, 0x40($sp)
/* 08A428 802CF428 AFA70044 */  sw    $a3, 0x44($sp)
/* 08A42C 802CF42C F7B40010 */  sdc1  $f20, 0x10($sp)
/* 08A430 802CF430 C7A40050 */  lwc1  $f4, 0x50($sp)
/* 08A434 802CF434 C7A60044 */  lwc1  $f6, 0x44($sp)
/* 08A438 802CF438 46062201 */  sub.s $f8, $f4, $f6
/* 08A43C 802CF43C E7A80034 */  swc1  $f8, 0x34($sp)
/* 08A440 802CF440 C7AA0054 */  lwc1  $f10, 0x54($sp)
/* 08A444 802CF444 C7B00048 */  lwc1  $f16, 0x48($sp)
/* 08A448 802CF448 46105481 */  sub.s $f18, $f10, $f16
/* 08A44C 802CF44C E7B20030 */  swc1  $f18, 0x30($sp)
/* 08A450 802CF450 C7A40058 */  lwc1  $f4, 0x58($sp)
/* 08A454 802CF454 C7A6004C */  lwc1  $f6, 0x4c($sp)
/* 08A458 802CF458 46062201 */  sub.s $f8, $f4, $f6
/* 08A45C 802CF45C E7A8002C */  swc1  $f8, 0x2c($sp)
/* 08A460 802CF460 240E0001 */  li    $t6, 1
/* 08A464 802CF464 A3AE002B */  sb    $t6, 0x2b($sp)
/* 08A468 802CF468 83AF003F */  lb    $t7, 0x3f($sp)
/* 08A46C 802CF46C 24010008 */  li    $at, 8
/* 08A470 802CF470 15E1000A */  bne   $t7, $at, .L802CF49C
/* 08A474 802CF474 00000000 */   nop   
/* 08A478 802CF478 3C048033 */  lui   $a0, %hi(D_8032FFFF) # $a0, 0x8033
/* 08A47C 802CF47C 8484CE94 */  lh    $a0, %lo(D_8032CE94)($a0)
/* 08A480 802CF480 24050002 */  li    $a1, 2
/* 08A484 802CF484 0C09E706 */  jal   get_game_data
/* 08A488 802CF488 2484FFFF */   addiu $a0, %lo(D_8032FFFF) # addiu $a0, $a0, -1
/* 08A48C 802CF48C 30580001 */  andi  $t8, $v0, 1
/* 08A490 802CF490 17000002 */  bnez  $t8, .L802CF49C
/* 08A494 802CF494 00000000 */   nop   
/* 08A498 802CF498 A3A0002B */  sb    $zero, 0x2b($sp)
.L802CF49C:
/* 08A49C 802CF49C 3C0142B4 */  li    $at, 0x42B40000 # 0.000000
/* 08A4A0 802CF4A0 44815000 */  mtc1  $at, $f10
/* 08A4A4 802CF4A4 00000000 */  nop   
/* 08A4A8 802CF4A8 E7AA0040 */  swc1  $f10, 0x40($sp)
/* 08A4AC 802CF4AC C7AC002C */  lwc1  $f12, 0x2c($sp)
/* 08A4B0 802CF4B0 0C0DEA6A */  jal   func_8037A9A8
/* 08A4B4 802CF4B4 C7AE0034 */   lwc1  $f14, 0x34($sp)
/* 08A4B8 802CF4B8 83B9003B */  lb    $t9, 0x3b($sp)
/* 08A4BC 802CF4BC 3C018036 */  lui   $at, 0x8036
/* 08A4C0 802CF4C0 00194100 */  sll   $t0, $t9, 4
/* 08A4C4 802CF4C4 00280821 */  addu  $at, $at, $t0
/* 08A4C8 802CF4C8 A422FF50 */  sh    $v0, -0xb0($at)
/* 08A4CC 802CF4CC C7B00034 */  lwc1  $f16, 0x34($sp)
/* 08A4D0 802CF4D0 C7A4002C */  lwc1  $f4, 0x2c($sp)
/* 08A4D4 802CF4D4 46108482 */  mul.s $f18, $f16, $f16
/* 08A4D8 802CF4D8 00000000 */  nop   
/* 08A4DC 802CF4DC 46042182 */  mul.s $f6, $f4, $f4
/* 08A4E0 802CF4E0 0C0C8AC8 */  jal   sqrtf
/* 08A4E4 802CF4E4 46069300 */   add.s $f12, $f18, $f6
/* 08A4E8 802CF4E8 46000506 */  mov.s $f20, $f0
/* 08A4EC 802CF4EC 4600A306 */  mov.s $f12, $f20
/* 08A4F0 802CF4F0 0C0DEA6A */  jal   func_8037A9A8
/* 08A4F4 802CF4F4 C7AE0030 */   lwc1  $f14, 0x30($sp)
/* 08A4F8 802CF4F8 83A9003B */  lb    $t1, 0x3b($sp)
/* 08A4FC 802CF4FC 3C018036 */  lui   $at, 0x8036
/* 08A500 802CF500 00095100 */  sll   $t2, $t1, 4
/* 08A504 802CF504 002A0821 */  addu  $at, $at, $t2
/* 08A508 802CF508 A422FF52 */  sh    $v0, -0xae($at)
/* 08A50C 802CF50C 83A4003B */  lb    $a0, 0x3b($sp)
/* 08A510 802CF510 0C0B3AB4 */  jal   func_802CEAD0
/* 08A514 802CF514 8FA50040 */   lw    $a1, 0x40($sp)
/* 08A518 802CF518 83AB003B */  lb    $t3, 0x3b($sp)
/* 08A51C 802CF51C 3C018036 */  lui   $at, 0x8036
/* 08A520 802CF520 000B6100 */  sll   $t4, $t3, 4
/* 08A524 802CF524 002C0821 */  addu  $at, $at, $t4
/* 08A528 802CF528 AC22FF54 */  sw    $v0, -0xac($at)
/* 08A52C 802CF52C 83A4003B */  lb    $a0, 0x3b($sp)
/* 08A530 802CF530 0C0B3AEF */  jal   func_802CEBBC
/* 08A534 802CF534 8FA50040 */   lw    $a1, 0x40($sp)
/* 08A538 802CF538 83AD003B */  lb    $t5, 0x3b($sp)
/* 08A53C 802CF53C 3C018036 */  lui   $at, 0x8036
/* 08A540 802CF540 000D7100 */  sll   $t6, $t5, 4
/* 08A544 802CF544 002E0821 */  addu  $at, $at, $t6
/* 08A548 802CF548 AC22FF58 */  sw    $v0, -0xa8($at)
/* 08A54C 802CF54C 0C0B3B27 */  jal   func_802CEC9C
/* 08A550 802CF550 83A4003B */   lb    $a0, 0x3b($sp)
/* 08A554 802CF554 83AF003B */  lb    $t7, 0x3b($sp)
/* 08A558 802CF558 3C018036 */  lui   $at, 0x8036
/* 08A55C 802CF55C 000FC100 */  sll   $t8, $t7, 4
/* 08A560 802CF560 00380821 */  addu  $at, $at, $t8
/* 08A564 802CF564 AC22FF5C */  sw    $v0, -0xa4($at)
/* 08A568 802CF568 83A4003B */  lb    $a0, 0x3b($sp)
/* 08A56C 802CF56C 83A5003F */  lb    $a1, 0x3f($sp)
/* 08A570 802CF570 0C0B3CAA */  jal   func_802CF2A8
/* 08A574 802CF574 83A6002B */   lb    $a2, 0x2b($sp)
/* 08A578 802CF578 10000003 */  b     .L802CF588
/* 08A57C 802CF57C 00000000 */   nop   
/* 08A580 802CF580 10000001 */  b     .L802CF588
/* 08A584 802CF584 00000000 */   nop   
.L802CF588:
/* 08A588 802CF588 8FBF001C */  lw    $ra, 0x1c($sp)
/* 08A58C 802CF58C D7B40010 */  ldc1  $f20, 0x10($sp)
/* 08A590 802CF590 27BD0038 */  addiu $sp, $sp, 0x38
/* 08A594 802CF594 03E00008 */  jr    $ra
/* 08A598 802CF598 00000000 */   nop   

/* 08A59C 802CF59C 00000000 */  nop   

# Super Mario 64 (J) disassembly and split file
# generated by n64split v0.4a - N64 ROM splitter

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "macros.inc"
.include "globals.inc"

.section .text, "ax"

glabel func_802C7F20
/* 082F20 802C7F20 27BDFFC0 */  addiu $sp, $sp, -0x40
/* 082F24 802C7F24 AFBF001C */  sw    $ra, 0x1c($sp)
/* 082F28 802C7F28 AFB00018 */  sw    $s0, 0x18($sp)
/* 082F2C 802C7F2C 3C0E8036 */  lui   $t6, %hi(D_8035FDE8) # $t6, 0x8036
/* 082F30 802C7F30 8DCEFDE8 */  lw    $t6, %lo(D_8035FDE8)($t6)
/* 082F34 802C7F34 15C00003 */  bnez  $t6, .L802C7F44
/* 082F38 802C7F38 00000000 */   nop   
/* 082F3C 802C7F3C 1000004A */  b     .L802C8068
/* 082F40 802C7F40 00000000 */   nop   
.L802C7F44:
/* 082F44 802C7F44 3C0F8036 */  lui   $t7, %hi(D_8035FDE8) # $t7, 0x8036
/* 082F48 802C7F48 8DEFFDE8 */  lw    $t7, %lo(D_8035FDE8)($t7)
/* 082F4C 802C7F4C C5E400A0 */  lwc1  $f4, 0xa0($t7)
/* 082F50 802C7F50 E7A40034 */  swc1  $f4, 0x34($sp)
/* 082F54 802C7F54 3C188036 */  lui   $t8, %hi(D_8035FDE8) # $t8, 0x8036
/* 082F58 802C7F58 8F18FDE8 */  lw    $t8, %lo(D_8035FDE8)($t8)
/* 082F5C 802C7F5C C70600A4 */  lwc1  $f6, 0xa4($t8)
/* 082F60 802C7F60 E7A60030 */  swc1  $f6, 0x30($sp)
/* 082F64 802C7F64 3C198036 */  lui   $t9, %hi(D_8035FDE8) # $t9, 0x8036
/* 082F68 802C7F68 8F39FDE8 */  lw    $t9, %lo(D_8035FDE8)($t9)
/* 082F6C 802C7F6C C72800A8 */  lwc1  $f8, 0xa8($t9)
/* 082F70 802C7F70 E7A8002C */  swc1  $f8, 0x2c($sp)
/* 082F74 802C7F74 C7AC0034 */  lwc1  $f12, 0x34($sp)
/* 082F78 802C7F78 C7AE0030 */  lwc1  $f14, 0x30($sp)
/* 082F7C 802C7F7C 8FA6002C */  lw    $a2, 0x2c($sp)
/* 082F80 802C7F80 0C0E0640 */  jal   func_80381900
/* 082F84 802C7F84 27A7003C */   addiu $a3, $sp, 0x3c
/* 082F88 802C7F88 E7A00028 */  swc1  $f0, 0x28($sp)
/* 082F8C 802C7F8C C7AA0030 */  lwc1  $f10, 0x30($sp)
/* 082F90 802C7F90 C7B00028 */  lwc1  $f16, 0x28($sp)
/* 082F94 802C7F94 0C0A8BA3 */  jal   func_802A2E8C
/* 082F98 802C7F98 46105301 */   sub.s $f12, $f10, $f16
/* 082F9C 802C7F9C 3C014080 */  li    $at, 0x40800000 # 0.000000
/* 082FA0 802C7FA0 44819000 */  mtc1  $at, $f18
/* 082FA4 802C7FA4 00000000 */  nop   
/* 082FA8 802C7FA8 4612003C */  c.lt.s $f0, $f18
/* 082FAC 802C7FAC 00000000 */  nop   
/* 082FB0 802C7FB0 45000003 */  bc1f  .L802C7FC0
/* 082FB4 802C7FB4 00000000 */   nop   
/* 082FB8 802C7FB8 10000003 */  b     .L802C7FC8
/* 082FBC 802C7FBC AFA00024 */   sw    $zero, 0x24($sp)
.L802C7FC0:
/* 082FC0 802C7FC0 24080001 */  li    $t0, 1
/* 082FC4 802C7FC4 AFA80024 */  sw    $t0, 0x24($sp)
.L802C7FC8:
/* 082FC8 802C7FC8 8FB00024 */  lw    $s0, 0x24($sp)
/* 082FCC 802C7FCC 1200000D */  beqz  $s0, .L802C8004
/* 082FD0 802C7FD0 00000000 */   nop   
/* 082FD4 802C7FD4 24010001 */  li    $at, 1
/* 082FD8 802C7FD8 12010003 */  beq   $s0, $at, .L802C7FE8
/* 082FDC 802C7FDC 00000000 */   nop   
/* 082FE0 802C7FE0 1000001F */  b     .L802C8060
/* 082FE4 802C7FE4 00000000 */   nop   
.L802C7FE8:
/* 082FE8 802C7FE8 3C018033 */  lui   $at, %hi(D_8032FED4) # $at, 0x8033
/* 082FEC 802C7FEC AC20FED4 */  sw    $zero, %lo(D_8032FED4)($at)
/* 082FF0 802C7FF0 3C098036 */  lui   $t1, %hi(D_8035FDE8) # $t1, 0x8036
/* 082FF4 802C7FF4 8D29FDE8 */  lw    $t1, %lo(D_8035FDE8)($t1)
/* 082FF8 802C7FF8 AD200214 */  sw    $zero, 0x214($t1)
/* 082FFC 802C7FFC 10000018 */  b     .L802C8060
/* 083000 802C8000 00000000 */   nop   
.L802C8004:
/* 083004 802C8004 8FAA003C */  lw    $t2, 0x3c($sp)
/* 083008 802C8008 1140000E */  beqz  $t2, .L802C8044
/* 08300C 802C800C 00000000 */   nop   
/* 083010 802C8010 8D4B002C */  lw    $t3, 0x2c($t2)
/* 083014 802C8014 1160000B */  beqz  $t3, .L802C8044
/* 083018 802C8018 00000000 */   nop   
/* 08301C 802C801C 8FAC003C */  lw    $t4, 0x3c($sp)
/* 083020 802C8020 3C018033 */  lui   $at, %hi(D_8032FED4) # $at, 0x8033
/* 083024 802C8024 8D8D002C */  lw    $t5, 0x2c($t4)
/* 083028 802C8028 AC2DFED4 */  sw    $t5, %lo(D_8032FED4)($at)
/* 08302C 802C802C 8FAE003C */  lw    $t6, 0x3c($sp)
/* 083030 802C8030 3C188036 */  lui   $t8, %hi(D_8035FDE8) # $t8, 0x8036
/* 083034 802C8034 8F18FDE8 */  lw    $t8, %lo(D_8035FDE8)($t8)
/* 083038 802C8038 8DCF002C */  lw    $t7, 0x2c($t6)
/* 08303C 802C803C 10000006 */  b     .L802C8058
/* 083040 802C8040 AF0F0214 */   sw    $t7, 0x214($t8)
.L802C8044:
/* 083044 802C8044 3C018033 */  lui   $at, %hi(D_8032FED4) # $at, 0x8033
/* 083048 802C8048 AC20FED4 */  sw    $zero, %lo(D_8032FED4)($at)
/* 08304C 802C804C 3C198036 */  lui   $t9, %hi(D_8035FDE8) # $t9, 0x8036
/* 083050 802C8050 8F39FDE8 */  lw    $t9, %lo(D_8035FDE8)($t9)
/* 083054 802C8054 AF200214 */  sw    $zero, 0x214($t9)
.L802C8058:
/* 083058 802C8058 10000001 */  b     .L802C8060
/* 08305C 802C805C 00000000 */   nop   
.L802C8060:
/* 083060 802C8060 10000001 */  b     .L802C8068
/* 083064 802C8064 00000000 */   nop   
.L802C8068:
/* 083068 802C8068 8FBF001C */  lw    $ra, 0x1c($sp)
/* 08306C 802C806C 8FB00018 */  lw    $s0, 0x18($sp)
/* 083070 802C8070 27BD0040 */  addiu $sp, $sp, 0x40
/* 083074 802C8074 03E00008 */  jr    $ra
/* 083078 802C8078 00000000 */   nop   

glabel func_802C807C
/* 08307C 802C807C 3C0E8034 */  lui   $t6, %hi(D_80339E00) # $t6, 0x8034
/* 083080 802C8080 25CE9E00 */  addiu $t6, %lo(D_80339E00) # addiu $t6, $t6, -0x6200
/* 083084 802C8084 C5C4003C */  lwc1  $f4, 0x3c($t6)
/* 083088 802C8088 E4840000 */  swc1  $f4, ($a0)
/* 08308C 802C808C 3C0F8034 */  lui   $t7, %hi(D_80339E00) # $t7, 0x8034
/* 083090 802C8090 25EF9E00 */  addiu $t7, %lo(D_80339E00) # addiu $t7, $t7, -0x6200
/* 083094 802C8094 C5E60040 */  lwc1  $f6, 0x40($t7)
/* 083098 802C8098 E4A60000 */  swc1  $f6, ($a1)
/* 08309C 802C809C 3C188034 */  lui   $t8, %hi(D_80339E00) # $t8, 0x8034
/* 0830A0 802C80A0 27189E00 */  addiu $t8, %lo(D_80339E00) # addiu $t8, $t8, -0x6200
/* 0830A4 802C80A4 C7080044 */  lwc1  $f8, 0x44($t8)
/* 0830A8 802C80A8 E4C80000 */  swc1  $f8, ($a2)
/* 0830AC 802C80AC 03E00008 */  jr    $ra
/* 0830B0 802C80B0 00000000 */   nop   

/* 0830B4 802C80B4 03E00008 */  jr    $ra
/* 0830B8 802C80B8 00000000 */   nop   

glabel func_802C80BC
/* 0830BC 802C80BC AFA60008 */  sw    $a2, 8($sp)
/* 0830C0 802C80C0 3C0E8034 */  lui   $t6, %hi(D_80339E00) # $t6, 0x8034
/* 0830C4 802C80C4 25CE9E00 */  addiu $t6, %lo(D_80339E00) # addiu $t6, $t6, -0x6200
/* 0830C8 802C80C8 E5CC003C */  swc1  $f12, 0x3c($t6)
/* 0830CC 802C80CC 3C0F8034 */  lui   $t7, %hi(D_80339E00) # $t7, 0x8034
/* 0830D0 802C80D0 25EF9E00 */  addiu $t7, %lo(D_80339E00) # addiu $t7, $t7, -0x6200
/* 0830D4 802C80D4 E5EE0040 */  swc1  $f14, 0x40($t7)
/* 0830D8 802C80D8 C7A40008 */  lwc1  $f4, 8($sp)
/* 0830DC 802C80DC 3C188034 */  lui   $t8, %hi(D_80339E00) # $t8, 0x8034
/* 0830E0 802C80E0 27189E00 */  addiu $t8, %lo(D_80339E00) # addiu $t8, $t8, -0x6200
/* 0830E4 802C80E4 E7040044 */  swc1  $f4, 0x44($t8)
/* 0830E8 802C80E8 10000001 */  b     .L802C80F0
/* 0830EC 802C80EC 00000000 */   nop   
.L802C80F0:
/* 0830F0 802C80F0 03E00008 */  jr    $ra
/* 0830F4 802C80F4 00000000 */   nop   

glabel func_802C80F8
/* 0830F8 802C80F8 27BDFF58 */  addiu $sp, $sp, -0xa8
/* 0830FC 802C80FC AFBF0014 */  sw    $ra, 0x14($sp)
/* 083100 802C8100 AFA400A8 */  sw    $a0, 0xa8($sp)
/* 083104 802C8104 AFA500AC */  sw    $a1, 0xac($sp)
/* 083108 802C8108 8FAE00AC */  lw    $t6, 0xac($sp)
/* 08310C 802C810C 27B80064 */  addiu $t8, $sp, 0x64
/* 083110 802C8110 8DCF0114 */  lw    $t7, 0x114($t6)
/* 083114 802C8114 A70F0000 */  sh    $t7, ($t8)
/* 083118 802C8118 8FB900AC */  lw    $t9, 0xac($sp)
/* 08311C 802C811C 27A90064 */  addiu $t1, $sp, 0x64
/* 083120 802C8120 8F280118 */  lw    $t0, 0x118($t9)
/* 083124 802C8124 A5280002 */  sh    $t0, 2($t1)
/* 083128 802C8128 8FAA00AC */  lw    $t2, 0xac($sp)
/* 08312C 802C812C 27AC0064 */  addiu $t4, $sp, 0x64
/* 083130 802C8130 8D4B011C */  lw    $t3, 0x11c($t2)
/* 083134 802C8134 A58B0004 */  sh    $t3, 4($t4)
/* 083138 802C8138 8FAD00A8 */  lw    $t5, 0xa8($sp)
/* 08313C 802C813C 11A00009 */  beqz  $t5, .L802C8164
/* 083140 802C8140 00000000 */   nop   
/* 083144 802C8144 3C018033 */  lui   $at, %hi(D_8032FEC0) # $at, 0x8033
/* 083148 802C8148 A420FEC0 */  sh    $zero, %lo(D_8032FEC0)($at)
/* 08314C 802C814C 27A400A4 */  addiu $a0, $sp, 0xa4
/* 083150 802C8150 27A500A0 */  addiu $a1, $sp, 0xa0
/* 083154 802C8154 0C0B201F */  jal   func_802C807C
/* 083158 802C8158 27A6009C */   addiu $a2, $sp, 0x9c
/* 08315C 802C815C 1000000D */  b     .L802C8194
/* 083160 802C8160 00000000 */   nop   
.L802C8164:
/* 083164 802C8164 3C0E8036 */  lui   $t6, %hi(D_8035FDF0) # $t6, 0x8036
/* 083168 802C8168 8DCEFDF0 */  lw    $t6, %lo(D_8035FDF0)($t6)
/* 08316C 802C816C C5C400A0 */  lwc1  $f4, 0xa0($t6)
/* 083170 802C8170 E7A400A4 */  swc1  $f4, 0xa4($sp)
/* 083174 802C8174 3C0F8036 */  lui   $t7, %hi(D_8035FDF0) # $t7, 0x8036
/* 083178 802C8178 8DEFFDF0 */  lw    $t7, %lo(D_8035FDF0)($t7)
/* 08317C 802C817C C5E600A4 */  lwc1  $f6, 0xa4($t7)
/* 083180 802C8180 E7A600A0 */  swc1  $f6, 0xa0($sp)
/* 083184 802C8184 3C188036 */  lui   $t8, %hi(D_8035FDF0) # $t8, 0x8036
/* 083188 802C8188 8F18FDF0 */  lw    $t8, %lo(D_8035FDF0)($t8)
/* 08318C 802C818C C70800A8 */  lwc1  $f8, 0xa8($t8)
/* 083190 802C8190 E7A8009C */  swc1  $f8, 0x9c($sp)
.L802C8194:
/* 083194 802C8194 8FB900AC */  lw    $t9, 0xac($sp)
/* 083198 802C8198 C7AA00A4 */  lwc1  $f10, 0xa4($sp)
/* 08319C 802C819C C73000AC */  lwc1  $f16, 0xac($t9)
/* 0831A0 802C81A0 46105480 */  add.s $f18, $f10, $f16
/* 0831A4 802C81A4 E7B200A4 */  swc1  $f18, 0xa4($sp)
/* 0831A8 802C81A8 8FA800AC */  lw    $t0, 0xac($sp)
/* 0831AC 802C81AC C7A4009C */  lwc1  $f4, 0x9c($sp)
/* 0831B0 802C81B0 C50600B4 */  lwc1  $f6, 0xb4($t0)
/* 0831B4 802C81B4 46062200 */  add.s $f8, $f4, $f6
/* 0831B8 802C81B8 E7A8009C */  swc1  $f8, 0x9c($sp)
/* 0831BC 802C81BC 27A90064 */  addiu $t1, $sp, 0x64
/* 0831C0 802C81C0 852A0000 */  lh    $t2, ($t1)
/* 0831C4 802C81C4 15400007 */  bnez  $t2, .L802C81E4
/* 0831C8 802C81C8 00000000 */   nop   
/* 0831CC 802C81CC 852B0002 */  lh    $t3, 2($t1)
/* 0831D0 802C81D0 15600004 */  bnez  $t3, .L802C81E4
/* 0831D4 802C81D4 00000000 */   nop   
/* 0831D8 802C81D8 852C0004 */  lh    $t4, 4($t1)
/* 0831DC 802C81DC 11800069 */  beqz  $t4, .L802C8384
/* 0831E0 802C81E0 00000000 */   nop   
.L802C81E4:
/* 0831E4 802C81E4 27AD0064 */  addiu $t5, $sp, 0x64
/* 0831E8 802C81E8 85AE0000 */  lh    $t6, ($t5)
/* 0831EC 802C81EC A7AE0062 */  sh    $t6, 0x62($sp)
/* 0831F0 802C81F0 27AF0064 */  addiu $t7, $sp, 0x64
/* 0831F4 802C81F4 85F80004 */  lh    $t8, 4($t7)
/* 0831F8 802C81F8 A7B80060 */  sh    $t8, 0x60($sp)
/* 0831FC 802C81FC 8FB900AC */  lw    $t9, 0xac($sp)
/* 083200 802C8200 8F2800D4 */  lw    $t0, 0xd4($t9)
/* 083204 802C8204 A7A8005E */  sh    $t0, 0x5e($sp)
/* 083208 802C8208 8FAA00A8 */  lw    $t2, 0xa8($sp)
/* 08320C 802C820C 11400008 */  beqz  $t2, .L802C8230
/* 083210 802C8210 00000000 */   nop   
/* 083214 802C8214 3C0B8034 */  lui   $t3, %hi(D_80339E00) # $t3, 0x8034
/* 083218 802C8218 256B9E00 */  addiu $t3, %lo(D_80339E00) # addiu $t3, $t3, -0x6200
/* 08321C 802C821C 27AC0064 */  addiu $t4, $sp, 0x64
/* 083220 802C8220 858D0002 */  lh    $t5, 2($t4)
/* 083224 802C8224 8569002E */  lh    $t1, 0x2e($t3)
/* 083228 802C8228 012D7021 */  addu  $t6, $t1, $t5
/* 08322C 802C822C A56E002E */  sh    $t6, 0x2e($t3)
.L802C8230:
/* 083230 802C8230 8FAF00AC */  lw    $t7, 0xac($sp)
/* 083234 802C8234 C5EA00A0 */  lwc1  $f10, 0xa0($t7)
/* 083238 802C8238 E7AA0098 */  swc1  $f10, 0x98($sp)
/* 08323C 802C823C 8FB800AC */  lw    $t8, 0xac($sp)
/* 083240 802C8240 C71000A4 */  lwc1  $f16, 0xa4($t8)
/* 083244 802C8244 E7B00094 */  swc1  $f16, 0x94($sp)
/* 083248 802C8248 8FB900AC */  lw    $t9, 0xac($sp)
/* 08324C 802C824C C73200A8 */  lwc1  $f18, 0xa8($t9)
/* 083250 802C8250 E7B20090 */  swc1  $f18, 0x90($sp)
/* 083254 802C8254 C7A400A4 */  lwc1  $f4, 0xa4($sp)
/* 083258 802C8258 C7A60098 */  lwc1  $f6, 0x98($sp)
/* 08325C 802C825C 27A80084 */  addiu $t0, $sp, 0x84
/* 083260 802C8260 46062201 */  sub.s $f8, $f4, $f6
/* 083264 802C8264 E5080000 */  swc1  $f8, ($t0)
/* 083268 802C8268 C7AA00A0 */  lwc1  $f10, 0xa0($sp)
/* 08326C 802C826C C7B00094 */  lwc1  $f16, 0x94($sp)
/* 083270 802C8270 27AA0084 */  addiu $t2, $sp, 0x84
/* 083274 802C8274 46105481 */  sub.s $f18, $f10, $f16
/* 083278 802C8278 E5520004 */  swc1  $f18, 4($t2)
/* 08327C 802C827C C7A4009C */  lwc1  $f4, 0x9c($sp)
/* 083280 802C8280 C7A60090 */  lwc1  $f6, 0x90($sp)
/* 083284 802C8284 27AC0084 */  addiu $t4, $sp, 0x84
/* 083288 802C8288 46062201 */  sub.s $f8, $f4, $f6
/* 08328C 802C828C E5880008 */  swc1  $f8, 8($t4)
/* 083290 802C8290 8FA900AC */  lw    $t1, 0xac($sp)
/* 083294 802C8294 27AF0064 */  addiu $t7, $sp, 0x64
/* 083298 802C8298 8D2D00D0 */  lw    $t5, 0xd0($t1)
/* 08329C 802C829C 8D2E0114 */  lw    $t6, 0x114($t1)
/* 0832A0 802C82A0 01AE5823 */  subu  $t3, $t5, $t6
/* 0832A4 802C82A4 A5EB0000 */  sh    $t3, ($t7)
/* 0832A8 802C82A8 8FB800AC */  lw    $t8, 0xac($sp)
/* 0832AC 802C82AC 27AC0064 */  addiu $t4, $sp, 0x64
/* 0832B0 802C82B0 8F1900D4 */  lw    $t9, 0xd4($t8)
/* 0832B4 802C82B4 8F080118 */  lw    $t0, 0x118($t8)
/* 0832B8 802C82B8 03285023 */  subu  $t2, $t9, $t0
/* 0832BC 802C82BC A58A0002 */  sh    $t2, 2($t4)
/* 0832C0 802C82C0 8FA900AC */  lw    $t1, 0xac($sp)
/* 0832C4 802C82C4 27AF0064 */  addiu $t7, $sp, 0x64
/* 0832C8 802C82C8 8D2D00D8 */  lw    $t5, 0xd8($t1)
/* 0832CC 802C82CC 8D2E011C */  lw    $t6, 0x11c($t1)
/* 0832D0 802C82D0 01AE5823 */  subu  $t3, $t5, $t6
/* 0832D4 802C82D4 A5EB0004 */  sh    $t3, 4($t7)
/* 0832D8 802C82D8 27A4001C */  addiu $a0, $sp, 0x1c
/* 0832DC 802C82DC 27A50084 */  addiu $a1, $sp, 0x84
/* 0832E0 802C82E0 0C0DE510 */  jal   func_80379440
/* 0832E4 802C82E4 27A60064 */   addiu $a2, $sp, 0x64
/* 0832E8 802C82E8 27A4001C */  addiu $a0, $sp, 0x1c
/* 0832EC 802C82EC 27A50078 */  addiu $a1, $sp, 0x78
/* 0832F0 802C82F0 0C0A7ABE */  jal   func_8029EAF8
/* 0832F4 802C82F4 27A60084 */   addiu $a2, $sp, 0x84
/* 0832F8 802C82F8 8FB800AC */  lw    $t8, 0xac($sp)
/* 0832FC 802C82FC 27A80064 */  addiu $t0, $sp, 0x64
/* 083300 802C8300 8F1900D0 */  lw    $t9, 0xd0($t8)
/* 083304 802C8304 A5190000 */  sh    $t9, ($t0)
/* 083308 802C8308 8FAA00AC */  lw    $t2, 0xac($sp)
/* 08330C 802C830C 27A90064 */  addiu $t1, $sp, 0x64
/* 083310 802C8310 8D4C00D4 */  lw    $t4, 0xd4($t2)
/* 083314 802C8314 A52C0002 */  sh    $t4, 2($t1)
/* 083318 802C8318 8FAD00AC */  lw    $t5, 0xac($sp)
/* 08331C 802C831C 27AB0064 */  addiu $t3, $sp, 0x64
/* 083320 802C8320 8DAE00D8 */  lw    $t6, 0xd8($t5)
/* 083324 802C8324 A56E0004 */  sh    $t6, 4($t3)
/* 083328 802C8328 27A4001C */  addiu $a0, $sp, 0x1c
/* 08332C 802C832C 27A50084 */  addiu $a1, $sp, 0x84
/* 083330 802C8330 0C0DE510 */  jal   func_80379440
/* 083334 802C8334 27A60064 */   addiu $a2, $sp, 0x64
/* 083338 802C8338 27A4001C */  addiu $a0, $sp, 0x1c
/* 08333C 802C833C 27A5006C */  addiu $a1, $sp, 0x6c
/* 083340 802C8340 0C0A7AA1 */  jal   func_8029EA84
/* 083344 802C8344 27A60078 */   addiu $a2, $sp, 0x78
/* 083348 802C8348 27AF006C */  addiu $t7, $sp, 0x6c
/* 08334C 802C834C C5EA0000 */  lwc1  $f10, ($t7)
/* 083350 802C8350 C7B00098 */  lwc1  $f16, 0x98($sp)
/* 083354 802C8354 46105480 */  add.s $f18, $f10, $f16
/* 083358 802C8358 E7B200A4 */  swc1  $f18, 0xa4($sp)
/* 08335C 802C835C 27B8006C */  addiu $t8, $sp, 0x6c
/* 083360 802C8360 C7040004 */  lwc1  $f4, 4($t8)
/* 083364 802C8364 C7A60094 */  lwc1  $f6, 0x94($sp)
/* 083368 802C8368 46062200 */  add.s $f8, $f4, $f6
/* 08336C 802C836C E7A800A0 */  swc1  $f8, 0xa0($sp)
/* 083370 802C8370 27B9006C */  addiu $t9, $sp, 0x6c
/* 083374 802C8374 C72A0008 */  lwc1  $f10, 8($t9)
/* 083378 802C8378 C7B00090 */  lwc1  $f16, 0x90($sp)
/* 08337C 802C837C 46105480 */  add.s $f18, $f10, $f16
/* 083380 802C8380 E7B2009C */  swc1  $f18, 0x9c($sp)
.L802C8384:
/* 083384 802C8384 8FA800A8 */  lw    $t0, 0xa8($sp)
/* 083388 802C8388 11000007 */  beqz  $t0, .L802C83A8
/* 08338C 802C838C 00000000 */   nop   
/* 083390 802C8390 C7AC00A4 */  lwc1  $f12, 0xa4($sp)
/* 083394 802C8394 C7AE00A0 */  lwc1  $f14, 0xa0($sp)
/* 083398 802C8398 0C0B202F */  jal   func_802C80BC
/* 08339C 802C839C 8FA6009C */   lw    $a2, 0x9c($sp)
/* 0833A0 802C83A0 1000000D */  b     .L802C83D8
/* 0833A4 802C83A4 00000000 */   nop   
.L802C83A8:
/* 0833A8 802C83A8 3C0A8036 */  lui   $t2, %hi(D_8035FDF0) # $t2, 0x8036
/* 0833AC 802C83AC 8D4AFDF0 */  lw    $t2, %lo(D_8035FDF0)($t2)
/* 0833B0 802C83B0 C7A400A4 */  lwc1  $f4, 0xa4($sp)
/* 0833B4 802C83B4 E54400A0 */  swc1  $f4, 0xa0($t2)
/* 0833B8 802C83B8 3C0C8036 */  lui   $t4, %hi(D_8035FDF0) # $t4, 0x8036
/* 0833BC 802C83BC 8D8CFDF0 */  lw    $t4, %lo(D_8035FDF0)($t4)
/* 0833C0 802C83C0 C7A600A0 */  lwc1  $f6, 0xa0($sp)
/* 0833C4 802C83C4 E58600A4 */  swc1  $f6, 0xa4($t4)
/* 0833C8 802C83C8 3C098036 */  lui   $t1, %hi(D_8035FDF0) # $t1, 0x8036
/* 0833CC 802C83CC 8D29FDF0 */  lw    $t1, %lo(D_8035FDF0)($t1)
/* 0833D0 802C83D0 C7A8009C */  lwc1  $f8, 0x9c($sp)
/* 0833D4 802C83D4 E52800A8 */  swc1  $f8, 0xa8($t1)
.L802C83D8:
/* 0833D8 802C83D8 10000001 */  b     .L802C83E0
/* 0833DC 802C83DC 00000000 */   nop   
.L802C83E0:
/* 0833E0 802C83E0 8FBF0014 */  lw    $ra, 0x14($sp)
/* 0833E4 802C83E4 27BD00A8 */  addiu $sp, $sp, 0xa8
/* 0833E8 802C83E8 03E00008 */  jr    $ra
/* 0833EC 802C83EC 00000000 */   nop   

glabel func_802C83F0
/* 0833F0 802C83F0 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 0833F4 802C83F4 AFBF0014 */  sw    $ra, 0x14($sp)
/* 0833F8 802C83F8 3C0E8033 */  lui   $t6, %hi(D_8032FED4) # $t6, 0x8033
/* 0833FC 802C83FC 8DCEFED4 */  lw    $t6, %lo(D_8032FED4)($t6)
/* 083400 802C8400 AFAE001C */  sw    $t6, 0x1c($sp)
/* 083404 802C8404 3C0F8034 */  lui   $t7, %hi(D_8033C110) # $t7, 0x8034
/* 083408 802C8408 8DEFC110 */  lw    $t7, %lo(D_8033C110)($t7)
/* 08340C 802C840C 31F80040 */  andi  $t8, $t7, 0x40
/* 083410 802C8410 1700000B */  bnez  $t8, .L802C8440
/* 083414 802C8414 00000000 */   nop   
/* 083418 802C8418 3C198036 */  lui   $t9, %hi(D_8035FDE8) # $t9, 0x8036
/* 08341C 802C841C 8F39FDE8 */  lw    $t9, %lo(D_8035FDE8)($t9)
/* 083420 802C8420 13200007 */  beqz  $t9, .L802C8440
/* 083424 802C8424 00000000 */   nop   
/* 083428 802C8428 8FA8001C */  lw    $t0, 0x1c($sp)
/* 08342C 802C842C 11000004 */  beqz  $t0, .L802C8440
/* 083430 802C8430 00000000 */   nop   
/* 083434 802C8434 24040001 */  li    $a0, 1
/* 083438 802C8438 0C0B203E */  jal   func_802C80F8
/* 08343C 802C843C 8FA5001C */   lw    $a1, 0x1c($sp)
.L802C8440:
/* 083440 802C8440 10000001 */  b     .L802C8448
/* 083444 802C8444 00000000 */   nop   
.L802C8448:
/* 083448 802C8448 8FBF0014 */  lw    $ra, 0x14($sp)
/* 08344C 802C844C 27BD0020 */  addiu $sp, $sp, 0x20
/* 083450 802C8450 03E00008 */  jr    $ra
/* 083454 802C8454 00000000 */   nop   

/* 083458 802C8458 00000000 */  nop   
/* 08345C 802C845C 00000000 */  nop   

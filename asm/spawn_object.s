# Super Mario 64 (J) disassembly and split file
# generated by n64split v0.4a - N64 ROM splitter

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "macros.inc"
.include "globals.inc"

.section .text, "ax" 

glabel Unknown802C8CF0
/* 083CF0 802C8CF0 27BDFFF8 */  addiu $sp, $sp, -8
/* 083CF4 802C8CF4 AFA60000 */  sw    $a2, ($sp)
/* 083CF8 802C8CF8 AC840000 */  sw    $a0, ($a0)
/* 083CFC 802C8CFC AC840004 */  sw    $a0, 4($a0)
/* 083D00 802C8D00 ACA60000 */  sw    $a2, ($a1)
/* 083D04 802C8D04 8FAE0018 */  lw    $t6, 0x18($sp)
/* 083D08 802C8D08 AFA00004 */  sw    $zero, 4($sp)
/* 083D0C 802C8D0C 25CFFFFF */  addiu $t7, $t6, -1
/* 083D10 802C8D10 19E0000E */  blez  $t7, .L802C8D4C
/* 083D14 802C8D14 00000000 */   nop   
.L802C8D18:
/* 083D18 802C8D18 8FB80000 */  lw    $t8, ($sp)
/* 083D1C 802C8D1C 0307C821 */  addu  $t9, $t8, $a3
/* 083D20 802C8D20 AFB90000 */  sw    $t9, ($sp)
/* 083D24 802C8D24 8FA80000 */  lw    $t0, ($sp)
/* 083D28 802C8D28 ACC80000 */  sw    $t0, ($a2)
/* 083D2C 802C8D2C 8FA60000 */  lw    $a2, ($sp)
/* 083D30 802C8D30 8FA90004 */  lw    $t1, 4($sp)
/* 083D34 802C8D34 8FAB0018 */  lw    $t3, 0x18($sp)
/* 083D38 802C8D38 252A0001 */  addiu $t2, $t1, 1
/* 083D3C 802C8D3C 256CFFFF */  addiu $t4, $t3, -1
/* 083D40 802C8D40 014C082A */  slt   $at, $t2, $t4
/* 083D44 802C8D44 1420FFF4 */  bnez  $at, .L802C8D18
/* 083D48 802C8D48 AFAA0004 */   sw    $t2, 4($sp)
.L802C8D4C:
/* 083D4C 802C8D4C ACC00000 */  sw    $zero, ($a2)
/* 083D50 802C8D50 10000001 */  b     .L802C8D58
/* 083D54 802C8D54 00000000 */   nop   
.L802C8D58:
/* 083D58 802C8D58 03E00008 */  jr    $ra
/* 083D5C 802C8D5C 27BD0008 */   addiu $sp, $sp, 8

glabel Unknown802C8D60
/* 083D60 802C8D60 27BDFFF8 */  addiu $sp, $sp, -8
/* 083D64 802C8D64 8CAE0000 */  lw    $t6, ($a1)
/* 083D68 802C8D68 AFAE0004 */  sw    $t6, 4($sp)
/* 083D6C 802C8D6C 8FAF0004 */  lw    $t7, 4($sp)
/* 083D70 802C8D70 11E0000E */  beqz  $t7, .L802C8DAC
/* 083D74 802C8D74 00000000 */   nop   
/* 083D78 802C8D78 8FB80004 */  lw    $t8, 4($sp)
/* 083D7C 802C8D7C 8F190000 */  lw    $t9, ($t8)
/* 083D80 802C8D80 ACB90000 */  sw    $t9, ($a1)
/* 083D84 802C8D84 8C880004 */  lw    $t0, 4($a0)
/* 083D88 802C8D88 8FA90004 */  lw    $t1, 4($sp)
/* 083D8C 802C8D8C AD280004 */  sw    $t0, 4($t1)
/* 083D90 802C8D90 8FAA0004 */  lw    $t2, 4($sp)
/* 083D94 802C8D94 AD440000 */  sw    $a0, ($t2)
/* 083D98 802C8D98 8FAB0004 */  lw    $t3, 4($sp)
/* 083D9C 802C8D9C 8C8C0004 */  lw    $t4, 4($a0)
/* 083DA0 802C8DA0 AD8B0000 */  sw    $t3, ($t4)
/* 083DA4 802C8DA4 8FAD0004 */  lw    $t5, 4($sp)
/* 083DA8 802C8DA8 AC8D0004 */  sw    $t5, 4($a0)
.L802C8DAC:
/* 083DAC 802C8DAC 10000003 */  b     .L802C8DBC
/* 083DB0 802C8DB0 8FA20004 */   lw    $v0, 4($sp)
/* 083DB4 802C8DB4 10000001 */  b     .L802C8DBC
/* 083DB8 802C8DB8 00000000 */   nop   
.L802C8DBC:
/* 083DBC 802C8DBC 03E00008 */  jr    $ra
/* 083DC0 802C8DC0 27BD0008 */   addiu $sp, $sp, 8

glabel func_802C8DC4
/* 083DC4 802C8DC4 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 083DC8 802C8DC8 AFBF0014 */  sw    $ra, 0x14($sp)
/* 083DCC 802C8DCC AFA40020 */  sw    $a0, 0x20($sp)
/* 083DD0 802C8DD0 AFA50024 */  sw    $a1, 0x24($sp)
/* 083DD4 802C8DD4 8FAE0024 */  lw    $t6, 0x24($sp)
/* 083DD8 802C8DD8 8DCF0060 */  lw    $t7, 0x60($t6)
/* 083DDC 802C8DDC 11E00014 */  beqz  $t7, .L802C8E30
/* 083DE0 802C8DE0 AFAF001C */   sw    $t7, 0x1c($sp)
/* 083DE4 802C8DE4 8FB8001C */  lw    $t8, 0x1c($sp)
/* 083DE8 802C8DE8 8FA80024 */  lw    $t0, 0x24($sp)
/* 083DEC 802C8DEC 8F190060 */  lw    $t9, 0x60($t8)
/* 083DF0 802C8DF0 AD190060 */  sw    $t9, 0x60($t0)
/* 083DF4 802C8DF4 8FA90020 */  lw    $t1, 0x20($sp)
/* 083DF8 802C8DF8 8FAB001C */  lw    $t3, 0x1c($sp)
/* 083DFC 802C8DFC 8D2A0064 */  lw    $t2, 0x64($t1)
/* 083E00 802C8E00 AD6A0064 */  sw    $t2, 0x64($t3)
/* 083E04 802C8E04 8FAC0020 */  lw    $t4, 0x20($sp)
/* 083E08 802C8E08 8FAD001C */  lw    $t5, 0x1c($sp)
/* 083E0C 802C8E0C ADAC0060 */  sw    $t4, 0x60($t5)
/* 083E10 802C8E10 8FAF0020 */  lw    $t7, 0x20($sp)
/* 083E14 802C8E14 8FAE001C */  lw    $t6, 0x1c($sp)
/* 083E18 802C8E18 8DF80064 */  lw    $t8, 0x64($t7)
/* 083E1C 802C8E1C AF0E0060 */  sw    $t6, 0x60($t8)
/* 083E20 802C8E20 8FB9001C */  lw    $t9, 0x1c($sp)
/* 083E24 802C8E24 8FA80020 */  lw    $t0, 0x20($sp)
/* 083E28 802C8E28 10000003 */  b     .L802C8E38
/* 083E2C 802C8E2C AD190064 */   sw    $t9, 0x64($t0)
.L802C8E30:
/* 083E30 802C8E30 1000000B */  b     .L802C8E60
/* 083E34 802C8E34 00001025 */   move  $v0, $zero
.L802C8E38:
/* 083E38 802C8E38 0C0DF02F */  jal   func_8037C0BC
/* 083E3C 802C8E3C 8FA4001C */   lw    $a0, 0x1c($sp)
/* 083E40 802C8E40 3C048039 */  lui   $a0, %hi(D_8038BD88) # $a0, 0x8039
/* 083E44 802C8E44 2484BD88 */  addiu $a0, %lo(D_8038BD88) # addiu $a0, $a0, -0x4278
/* 083E48 802C8E48 0C0DF011 */  jal   func_8037C044
/* 083E4C 802C8E4C 8FA5001C */   lw    $a1, 0x1c($sp)
/* 083E50 802C8E50 10000003 */  b     .L802C8E60
/* 083E54 802C8E54 8FA2001C */   lw    $v0, 0x1c($sp)
/* 083E58 802C8E58 10000001 */  b     .L802C8E60
/* 083E5C 802C8E5C 00000000 */   nop   
.L802C8E60:
/* 083E60 802C8E60 8FBF0014 */  lw    $ra, 0x14($sp)
/* 083E64 802C8E64 27BD0020 */  addiu $sp, $sp, 0x20
/* 083E68 802C8E68 03E00008 */  jr    $ra
/* 083E6C 802C8E6C 00000000 */   nop   

glabel Unknown802C8E70
/* 083E70 802C8E70 8CAE0004 */  lw    $t6, 4($a1)
/* 083E74 802C8E74 8CAF0000 */  lw    $t7, ($a1)
/* 083E78 802C8E78 ADEE0004 */  sw    $t6, 4($t7)
/* 083E7C 802C8E7C 8CB80000 */  lw    $t8, ($a1)
/* 083E80 802C8E80 8CB90004 */  lw    $t9, 4($a1)
/* 083E84 802C8E84 AF380000 */  sw    $t8, ($t9)
/* 083E88 802C8E88 8C880000 */  lw    $t0, ($a0)
/* 083E8C 802C8E8C ACA80000 */  sw    $t0, ($a1)
/* 083E90 802C8E90 AC850000 */  sw    $a1, ($a0)
/* 083E94 802C8E94 03E00008 */  jr    $ra
/* 083E98 802C8E98 00000000 */   nop   

/* 083E9C 802C8E9C 03E00008 */  jr    $ra
/* 083EA0 802C8EA0 00000000 */   nop   

glabel func_802C8EA4
/* 083EA4 802C8EA4 8CAE0064 */  lw    $t6, 0x64($a1)
/* 083EA8 802C8EA8 8CAF0060 */  lw    $t7, 0x60($a1)
/* 083EAC 802C8EAC ADEE0064 */  sw    $t6, 0x64($t7)
/* 083EB0 802C8EB0 8CB80060 */  lw    $t8, 0x60($a1)
/* 083EB4 802C8EB4 8CB90064 */  lw    $t9, 0x64($a1)
/* 083EB8 802C8EB8 AF380060 */  sw    $t8, 0x60($t9)
/* 083EBC 802C8EBC 8C880060 */  lw    $t0, 0x60($a0)
/* 083EC0 802C8EC0 ACA80060 */  sw    $t0, 0x60($a1)
/* 083EC4 802C8EC4 AC850060 */  sw    $a1, 0x60($a0)
/* 083EC8 802C8EC8 03E00008 */  jr    $ra
/* 083ECC 802C8ECC 00000000 */   nop   

/* 083ED0 802C8ED0 03E00008 */  jr    $ra
/* 083ED4 802C8ED4 00000000 */   nop   

glabel func_802C8ED8
/* 083ED8 802C8ED8 27BDFFF0 */  addiu $sp, $sp, -0x10
/* 083EDC 802C8EDC 240E00F0 */  li    $t6, 240
/* 083EE0 802C8EE0 AFAE0008 */  sw    $t6, 8($sp)
/* 083EE4 802C8EE4 3C0F8034 */  lui   $t7, %hi(D_8033C118) # $t7, 0x8034
/* 083EE8 802C8EE8 25EFC118 */  addiu $t7, %lo(D_8033C118) # addiu $t7, $t7, -0x3ee8
/* 083EEC 802C8EEC AFAF0004 */  sw    $t7, 4($sp)
/* 083EF0 802C8EF0 8FB80004 */  lw    $t8, 4($sp)
/* 083EF4 802C8EF4 3C018036 */  lui   $at, %hi(D_8035FDE0) # $at, 0x8036
/* 083EF8 802C8EF8 AC38FDE0 */  sw    $t8, %lo(D_8035FDE0)($at)
/* 083EFC 802C8EFC 8FB90008 */  lw    $t9, 8($sp)
/* 083F00 802C8F00 AFA0000C */  sw    $zero, 0xc($sp)
/* 083F04 802C8F04 2728FFFF */  addiu $t0, $t9, -1
/* 083F08 802C8F08 1900000E */  blez  $t0, .L802C8F44
/* 083F0C 802C8F0C 00000000 */   nop   
.L802C8F10:
/* 083F10 802C8F10 8FA90004 */  lw    $t1, 4($sp)
/* 083F14 802C8F14 252A0260 */  addiu $t2, $t1, 0x260
/* 083F18 802C8F18 AD2A0060 */  sw    $t2, 0x60($t1)
/* 083F1C 802C8F1C 8FAB0004 */  lw    $t3, 4($sp)
/* 083F20 802C8F20 256C0260 */  addiu $t4, $t3, 0x260
/* 083F24 802C8F24 AFAC0004 */  sw    $t4, 4($sp)
/* 083F28 802C8F28 8FAD000C */  lw    $t5, 0xc($sp)
/* 083F2C 802C8F2C 8FAF0008 */  lw    $t7, 8($sp)
/* 083F30 802C8F30 25AE0001 */  addiu $t6, $t5, 1
/* 083F34 802C8F34 25F8FFFF */  addiu $t8, $t7, -1
/* 083F38 802C8F38 01D8082A */  slt   $at, $t6, $t8
/* 083F3C 802C8F3C 1420FFF4 */  bnez  $at, .L802C8F10
/* 083F40 802C8F40 AFAE000C */   sw    $t6, 0xc($sp)
.L802C8F44:
/* 083F44 802C8F44 8FB90004 */  lw    $t9, 4($sp)
/* 083F48 802C8F48 AF200060 */  sw    $zero, 0x60($t9)
/* 083F4C 802C8F4C 10000001 */  b     .L802C8F54
/* 083F50 802C8F50 00000000 */   nop   
.L802C8F54:
/* 083F54 802C8F54 03E00008 */  jr    $ra
/* 083F58 802C8F58 27BD0010 */   addiu $sp, $sp, 0x10

glabel func_802C8F5C
/* 083F5C 802C8F5C 27BDFFF8 */  addiu $sp, $sp, -8
/* 083F60 802C8F60 AFA00004 */  sw    $zero, 4($sp)
.L802C8F64:
/* 083F64 802C8F64 8FAE0004 */  lw    $t6, 4($sp)
/* 083F68 802C8F68 000E7880 */  sll   $t7, $t6, 2
/* 083F6C 802C8F6C 000EC880 */  sll   $t9, $t6, 2
/* 083F70 802C8F70 032EC823 */  subu  $t9, $t9, $t6
/* 083F74 802C8F74 01EE7823 */  subu  $t7, $t7, $t6
/* 083F78 802C8F78 000F7880 */  sll   $t7, $t7, 2
/* 083F7C 802C8F7C 0019C880 */  sll   $t9, $t9, 2
/* 083F80 802C8F80 032EC821 */  addu  $t9, $t9, $t6
/* 083F84 802C8F84 01EE7821 */  addu  $t7, $t7, $t6
/* 083F88 802C8F88 000F78C0 */  sll   $t7, $t7, 3
/* 083F8C 802C8F8C 0019C8C0 */  sll   $t9, $t9, 3
/* 083F90 802C8F90 00994021 */  addu  $t0, $a0, $t9
/* 083F94 802C8F94 01E4C021 */  addu  $t8, $t7, $a0
/* 083F98 802C8F98 AD180060 */  sw    $t8, 0x60($t0)
/* 083F9C 802C8F9C 8FA90004 */  lw    $t1, 4($sp)
/* 083FA0 802C8FA0 00095080 */  sll   $t2, $t1, 2
/* 083FA4 802C8FA4 00096080 */  sll   $t4, $t1, 2
/* 083FA8 802C8FA8 01896023 */  subu  $t4, $t4, $t1
/* 083FAC 802C8FAC 01495023 */  subu  $t2, $t2, $t1
/* 083FB0 802C8FB0 000A5080 */  sll   $t2, $t2, 2
/* 083FB4 802C8FB4 000C6080 */  sll   $t4, $t4, 2
/* 083FB8 802C8FB8 01896021 */  addu  $t4, $t4, $t1
/* 083FBC 802C8FBC 01495021 */  addu  $t2, $t2, $t1
/* 083FC0 802C8FC0 000A50C0 */  sll   $t2, $t2, 3
/* 083FC4 802C8FC4 000C60C0 */  sll   $t4, $t4, 3
/* 083FC8 802C8FC8 008C6821 */  addu  $t5, $a0, $t4
/* 083FCC 802C8FCC 01445821 */  addu  $t3, $t2, $a0
/* 083FD0 802C8FD0 ADAB0064 */  sw    $t3, 0x64($t5)
/* 083FD4 802C8FD4 8FAF0004 */  lw    $t7, 4($sp)
/* 083FD8 802C8FD8 25EE0001 */  addiu $t6, $t7, 1
/* 083FDC 802C8FDC 29C1000D */  slti  $at, $t6, 0xd
/* 083FE0 802C8FE0 1420FFE0 */  bnez  $at, .L802C8F64
/* 083FE4 802C8FE4 AFAE0004 */   sw    $t6, 4($sp)
/* 083FE8 802C8FE8 10000001 */  b     .L802C8FF0
/* 083FEC 802C8FEC 00000000 */   nop   
.L802C8FF0:
/* 083FF0 802C8FF0 03E00008 */  jr    $ra
/* 083FF4 802C8FF4 27BD0008 */   addiu $sp, $sp, 8

glabel UnknownRecursive802C8FF8
/* 083FF8 802C8FF8 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 083FFC 802C8FFC AFBF0014 */  sw    $ra, 0x14($sp)
/* 084000 802C9000 AFA40028 */  sw    $a0, 0x28($sp)
/* 084004 802C9004 8FAE0028 */  lw    $t6, 0x28($sp)
/* 084008 802C9008 AFAE001C */  sw    $t6, 0x1c($sp)
/* 08400C 802C900C 8FAF0028 */  lw    $t7, 0x28($sp)
/* 084010 802C9010 8DF80010 */  lw    $t8, 0x10($t7)
/* 084014 802C9014 13000005 */  beqz  $t8, .L802C902C
/* 084018 802C9018 AFB80024 */   sw    $t8, 0x24($sp)
/* 08401C 802C901C 0C0B23FE */  jal   UnknownRecursive802C8FF8
/* 084020 802C9020 8FA40024 */   lw    $a0, 0x24($sp)
/* 084024 802C9024 10000003 */  b     .L802C9034
/* 084028 802C9028 00000000 */   nop   
.L802C902C:
/* 08402C 802C902C 0C0B2552 */  jal   func_802C9548
/* 084030 802C9030 8FA40028 */   lw    $a0, 0x28($sp)
.L802C9034:
/* 084034 802C9034 8FB90028 */  lw    $t9, 0x28($sp)
/* 084038 802C9038 8FA9001C */  lw    $t1, 0x1c($sp)
/* 08403C 802C903C 8F280008 */  lw    $t0, 8($t9)
/* 084040 802C9040 1509000B */  bne   $t0, $t1, .L802C9070
/* 084044 802C9044 AFA80020 */   sw    $t0, 0x20($sp)
.L802C9048:
/* 084048 802C9048 0C0B23FE */  jal   UnknownRecursive802C8FF8
/* 08404C 802C904C 8FA40020 */   lw    $a0, 0x20($sp)
/* 084050 802C9050 8FAA0020 */  lw    $t2, 0x20($sp)
/* 084054 802C9054 8D4B0008 */  lw    $t3, 8($t2)
/* 084058 802C9058 AFAB0028 */  sw    $t3, 0x28($sp)
/* 08405C 802C905C 8FAC0028 */  lw    $t4, 0x28($sp)
/* 084060 802C9060 8FAE001C */  lw    $t6, 0x1c($sp)
/* 084064 802C9064 8D8D0008 */  lw    $t5, 8($t4)
/* 084068 802C9068 11AEFFF7 */  beq   $t5, $t6, .L802C9048
/* 08406C 802C906C AFAD0020 */   sw    $t5, 0x20($sp)
.L802C9070:
/* 084070 802C9070 10000001 */  b     .L802C9078
/* 084074 802C9074 00000000 */   nop   
.L802C9078:
/* 084078 802C9078 8FBF0014 */  lw    $ra, 0x14($sp)
/* 08407C 802C907C 27BD0028 */  addiu $sp, $sp, 0x28
/* 084080 802C9080 03E00008 */  jr    $ra
/* 084084 802C9084 00000000 */   nop   

glabel func_802C9088
/* 084088 802C9088 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 08408C 802C908C AFBF0014 */  sw    $ra, 0x14($sp)
/* 084090 802C9090 AFA40018 */  sw    $a0, 0x18($sp)
/* 084094 802C9094 8FAE0018 */  lw    $t6, 0x18($sp)
/* 084098 802C9098 A5C00074 */  sh    $zero, 0x74($t6)
/* 08409C 802C909C 8FAF0018 */  lw    $t7, 0x18($sp)
/* 0840A0 802C90A0 ADE0006C */  sw    $zero, 0x6c($t7)
/* 0840A4 802C90A4 8FB80018 */  lw    $t8, 0x18($sp)
/* 0840A8 802C90A8 AF000050 */  sw    $zero, 0x50($t8)
/* 0840AC 802C90AC 8FA40018 */  lw    $a0, 0x18($sp)
/* 0840B0 802C90B0 0C0C81BE */  jal   func_803206F8
/* 0840B4 802C90B4 24840054 */   addiu $a0, $a0, 0x54
/* 0840B8 802C90B8 0C0DF02F */  jal   func_8037C0BC
/* 0840BC 802C90BC 8FA40018 */   lw    $a0, 0x18($sp)
/* 0840C0 802C90C0 3C048039 */  lui   $a0, %hi(D_8038BD88) # $a0, 0x8039
/* 0840C4 802C90C4 2484BD88 */  addiu $a0, %lo(D_8038BD88) # addiu $a0, $a0, -0x4278
/* 0840C8 802C90C8 0C0DF011 */  jal   func_8037C044
/* 0840CC 802C90CC 8FA50018 */   lw    $a1, 0x18($sp)
/* 0840D0 802C90D0 8FB90018 */  lw    $t9, 0x18($sp)
/* 0840D4 802C90D4 2401FFFB */  li    $at, -5
/* 0840D8 802C90D8 87280002 */  lh    $t0, 2($t9)
/* 0840DC 802C90DC 01014824 */  and   $t1, $t0, $at
/* 0840E0 802C90E0 A7290002 */  sh    $t1, 2($t9)
/* 0840E4 802C90E4 8FAA0018 */  lw    $t2, 0x18($sp)
/* 0840E8 802C90E8 2401FFFE */  li    $at, -2
/* 0840EC 802C90EC 854B0002 */  lh    $t3, 2($t2)
/* 0840F0 802C90F0 01616024 */  and   $t4, $t3, $at
/* 0840F4 802C90F4 A54C0002 */  sh    $t4, 2($t2)
/* 0840F8 802C90F8 3C048036 */  lui   $a0, %hi(D_8035FD80) # $a0, 0x8036
/* 0840FC 802C90FC 2484FD80 */  addiu $a0, %lo(D_8035FD80) # addiu $a0, $a0, -0x280
/* 084100 802C9100 0C0B23A9 */  jal   func_802C8EA4
/* 084104 802C9104 8FA50018 */   lw    $a1, 0x18($sp)
/* 084108 802C9108 10000001 */  b     .L802C9110
/* 08410C 802C910C 00000000 */   nop   
.L802C9110:
/* 084110 802C9110 8FBF0014 */  lw    $ra, 0x14($sp)
/* 084114 802C9114 27BD0018 */  addiu $sp, $sp, 0x18
/* 084118 802C9118 03E00008 */  jr    $ra
/* 08411C 802C911C 00000000 */   nop   

glabel func_802C9120
/* 084120 802C9120 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 084124 802C9124 AFBF0014 */  sw    $ra, 0x14($sp)
/* 084128 802C9128 AFA40028 */  sw    $a0, 0x28($sp)
/* 08412C 802C912C 3C058036 */  li    $a1, 0x80360000 # 0.000000
/* 084130 802C9130 24A5FD80 */  addiu $a1, %lo(D_8035FD80) # addiu $a1, $a1, -0x280
/* 084134 802C9134 0C0B2371 */  jal   func_802C8DC4
/* 084138 802C9138 8FA40028 */   lw    $a0, 0x28($sp)
/* 08413C 802C913C AFA20020 */  sw    $v0, 0x20($sp)
/* 084140 802C9140 8FAE0020 */  lw    $t6, 0x20($sp)
/* 084144 802C9144 15C00017 */  bnez  $t6, .L802C91A4
/* 084148 802C9148 00000000 */   nop   
/* 08414C 802C914C 0C0A7CE8 */  jal   func_8029F3A0
/* 084150 802C9150 00000000 */   nop   
/* 084154 802C9154 AFA2001C */  sw    $v0, 0x1c($sp)
/* 084158 802C9158 8FAF001C */  lw    $t7, 0x1c($sp)
/* 08415C 802C915C 15E00005 */  bnez  $t7, .L802C9174
/* 084160 802C9160 00000000 */   nop   
.L802C9164:
/* 084164 802C9164 1000FFFF */  b     .L802C9164
/* 084168 802C9168 00000000 */   nop   
/* 08416C 802C916C 1000000D */  b     .L802C91A4
/* 084170 802C9170 00000000 */   nop   
.L802C9174:
/* 084174 802C9174 0C0B2422 */  jal   func_802C9088
/* 084178 802C9178 8FA4001C */   lw    $a0, 0x1c($sp)
/* 08417C 802C917C 3C058036 */  li    $a1, 0x80360000 # 0.000000
/* 084180 802C9180 24A5FD80 */  addiu $a1, %lo(D_8035FD80) # addiu $a1, $a1, -0x280
/* 084184 802C9184 0C0B2371 */  jal   func_802C8DC4
/* 084188 802C9188 8FA40028 */   lw    $a0, 0x28($sp)
/* 08418C 802C918C AFA20020 */  sw    $v0, 0x20($sp)
/* 084190 802C9190 3C188036 */  li    $t8, 0x80360000 # 0.000000
/* 084194 802C9194 8F18FDF0 */  lw    $t8, %lo(D_8035FDF0)($t8)
/* 084198 802C9198 8FB90020 */  lw    $t9, 0x20($sp)
/* 08419C 802C919C 17190001 */  bne   $t8, $t9, .L802C91A4
/* 0841A0 802C91A0 00000000 */   nop   
.L802C91A4:
/* 0841A4 802C91A4 8FA90020 */  lw    $t1, 0x20($sp)
/* 0841A8 802C91A8 24080101 */  li    $t0, 257
/* 0841AC 802C91AC A5280074 */  sh    $t0, 0x74($t1)
/* 0841B0 802C91B0 8FAA0020 */  lw    $t2, 0x20($sp)
/* 0841B4 802C91B4 AD4A0068 */  sw    $t2, 0x68($t2)
/* 0841B8 802C91B8 8FAB0020 */  lw    $t3, 0x20($sp)
/* 0841BC 802C91BC AD60006C */  sw    $zero, 0x6c($t3)
/* 0841C0 802C91C0 8FAC0020 */  lw    $t4, 0x20($sp)
/* 0841C4 802C91C4 AD800070 */  sw    $zero, 0x70($t4)
/* 0841C8 802C91C8 8FAD0020 */  lw    $t5, 0x20($sp)
/* 0841CC 802C91CC A5A00076 */  sh    $zero, 0x76($t5)
/* 0841D0 802C91D0 AFA00024 */  sw    $zero, 0x24($sp)
.L802C91D4:
/* 0841D4 802C91D4 8FAF0024 */  lw    $t7, 0x24($sp)
/* 0841D8 802C91D8 8FAE0020 */  lw    $t6, 0x20($sp)
/* 0841DC 802C91DC 000FC080 */  sll   $t8, $t7, 2
/* 0841E0 802C91E0 01D8C821 */  addu  $t9, $t6, $t8
/* 0841E4 802C91E4 AF200088 */  sw    $zero, 0x88($t9)
/* 0841E8 802C91E8 8FA80024 */  lw    $t0, 0x24($sp)
/* 0841EC 802C91EC 25090001 */  addiu $t1, $t0, 1
/* 0841F0 802C91F0 29210050 */  slti  $at, $t1, 0x50
/* 0841F4 802C91F4 1420FFF7 */  bnez  $at, .L802C91D4
/* 0841F8 802C91F8 AFA90024 */   sw    $t1, 0x24($sp)
/* 0841FC 802C91FC 8FAA0020 */  lw    $t2, 0x20($sp)
/* 084200 802C9200 AD4001C8 */  sw    $zero, 0x1c8($t2)
/* 084204 802C9204 8FAB0020 */  lw    $t3, 0x20($sp)
/* 084208 802C9208 AD6001D0 */  sw    $zero, 0x1d0($t3)
/* 08420C 802C920C 8FAC0020 */  lw    $t4, 0x20($sp)
/* 084210 802C9210 A58001F4 */  sh    $zero, 0x1f4($t4)
/* 084214 802C9214 3C014248 */  li    $at, 0x42480000 # 50.000000
/* 084218 802C9218 44812000 */  mtc1  $at, $f4
/* 08421C 802C921C 8FAD0020 */  lw    $t5, 0x20($sp)
/* 084220 802C9220 E5A401F8 */  swc1  $f4, 0x1f8($t5)
/* 084224 802C9224 3C0142C8 */  li    $at, 0x42C80000 # 100.000000
/* 084228 802C9228 44813000 */  mtc1  $at, $f6
/* 08422C 802C922C 8FAF0020 */  lw    $t7, 0x20($sp)
/* 084230 802C9230 E5E601FC */  swc1  $f6, 0x1fc($t7)
/* 084234 802C9234 44804000 */  mtc1  $zero, $f8
/* 084238 802C9238 8FAE0020 */  lw    $t6, 0x20($sp)
/* 08423C 802C923C E5C80200 */  swc1  $f8, 0x200($t6)
/* 084240 802C9240 44805000 */  mtc1  $zero, $f10
/* 084244 802C9244 8FB80020 */  lw    $t8, 0x20($sp)
/* 084248 802C9248 E70A0204 */  swc1  $f10, 0x204($t8)
/* 08424C 802C924C 44808000 */  mtc1  $zero, $f16
/* 084250 802C9250 8FB90020 */  lw    $t9, 0x20($sp)
/* 084254 802C9254 E7300208 */  swc1  $f16, 0x208($t9)
/* 084258 802C9258 8FA80020 */  lw    $t0, 0x20($sp)
/* 08425C 802C925C AD000210 */  sw    $zero, 0x210($t0)
/* 084260 802C9260 8FA90020 */  lw    $t1, 0x20($sp)
/* 084264 802C9264 AD200214 */  sw    $zero, 0x214($t1)
/* 084268 802C9268 8FAA0020 */  lw    $t2, 0x20($sp)
/* 08426C 802C926C AD400218 */  sw    $zero, 0x218($t2)
/* 084270 802C9270 8FAC0020 */  lw    $t4, 0x20($sp)
/* 084274 802C9274 240BFFFF */  li    $t3, -1
/* 084278 802C9278 AD8B009C */  sw    $t3, 0x9c($t4)
/* 08427C 802C927C 8FAD0020 */  lw    $t5, 0x20($sp)
/* 084280 802C9280 ADA00180 */  sw    $zero, 0x180($t5)
/* 084284 802C9284 8FAE0020 */  lw    $t6, 0x20($sp)
/* 084288 802C9288 240F0800 */  li    $t7, 2048
/* 08428C 802C928C ADCF0184 */  sw    $t7, 0x184($t6)
/* 084290 802C9290 3C01447A */  li    $at, 0x447A0000 # 1000.000000
/* 084294 802C9294 44819000 */  mtc1  $at, $f18
/* 084298 802C9298 8FB80020 */  lw    $t8, 0x20($sp)
/* 08429C 802C929C E7120194 */  swc1  $f18, 0x194($t8)
/* 0842A0 802C92A0 3C198033 */  lui   $t9, %hi(D_8032CE98) # $t9, 0x8033
/* 0842A4 802C92A4 8739CE98 */  lh    $t9, %lo(D_8032CE98)($t9)
/* 0842A8 802C92A8 2401000E */  li    $at, 14
/* 0842AC 802C92AC 17210006 */  bne   $t9, $at, .L802C92C8
/* 0842B0 802C92B0 00000000 */   nop   
/* 0842B4 802C92B4 3C0144FA */  li    $at, 0x44FA0000 # 2000.000000
/* 0842B8 802C92B8 44812000 */  mtc1  $at, $f4
/* 0842BC 802C92BC 8FA80020 */  lw    $t0, 0x20($sp)
/* 0842C0 802C92C0 10000005 */  b     .L802C92D8
/* 0842C4 802C92C4 E504019C */   swc1  $f4, 0x19c($t0)
.L802C92C8:
/* 0842C8 802C92C8 3C01457A */  li    $at, 0x457A0000 # 4000.000000
/* 0842CC 802C92CC 44813000 */  mtc1  $at, $f6
/* 0842D0 802C92D0 8FA90020 */  lw    $t1, 0x20($sp)
/* 0842D4 802C92D4 E526019C */  swc1  $f6, 0x19c($t1)
.L802C92D8:
/* 0842D8 802C92D8 8FA40020 */  lw    $a0, 0x20($sp)
/* 0842DC 802C92DC 0C0DE3AD */  jal   Mtx_Identity
/* 0842E0 802C92E0 2484021C */   addiu $a0, $a0, 0x21c
/* 0842E4 802C92E4 8FAA0020 */  lw    $t2, 0x20($sp)
/* 0842E8 802C92E8 A54001F6 */  sh    $zero, 0x1f6($t2)
/* 0842EC 802C92EC 8FAB0020 */  lw    $t3, 0x20($sp)
/* 0842F0 802C92F0 AD60025C */  sw    $zero, 0x25c($t3)
/* 0842F4 802C92F4 3C018033 */  lui   $at, 0x8033
/* 0842F8 802C92F8 C4286C60 */  lwc1  $f8, 0x6c60($at)
/* 0842FC 802C92FC 8FAC0020 */  lw    $t4, 0x20($sp)
/* 084300 802C9300 E588015C */  swc1  $f8, 0x15c($t4)
/* 084304 802C9304 8FAF0020 */  lw    $t7, 0x20($sp)
/* 084308 802C9308 240DFFFF */  li    $t5, -1
/* 08430C 802C930C ADED01A0 */  sw    $t5, 0x1a0($t7)
/* 084310 802C9310 8FAE0020 */  lw    $t6, 0x20($sp)
/* 084314 802C9314 2401FFEF */  li    $at, -17
/* 084318 802C9318 85D80002 */  lh    $t8, 2($t6)
/* 08431C 802C931C 0301C824 */  and   $t9, $t8, $at
/* 084320 802C9320 A5D90002 */  sh    $t9, 2($t6)
/* 084324 802C9324 3C018033 */  lui   $at, 0x8033
/* 084328 802C9328 C42A6C64 */  lwc1  $f10, 0x6c64($at)
/* 08432C 802C932C 8FA80020 */  lw    $t0, 0x20($sp)
/* 084330 802C9330 E50A0020 */  swc1  $f10, 0x20($t0)
/* 084334 802C9334 3C018033 */  lui   $at, 0x8033
/* 084338 802C9338 C4306C68 */  lwc1  $f16, 0x6c68($at)
/* 08433C 802C933C 8FA90020 */  lw    $t1, 0x20($sp)
/* 084340 802C9340 E5300024 */  swc1  $f16, 0x24($t1)
/* 084344 802C9344 3C018033 */  lui   $at, 0x8033
/* 084348 802C9348 C4326C6C */  lwc1  $f18, 0x6c6c($at)
/* 08434C 802C934C 8FAA0020 */  lw    $t2, 0x20($sp)
/* 084350 802C9350 E5520028 */  swc1  $f18, 0x28($t2)
/* 084354 802C9354 8FAB0020 */  lw    $t3, 0x20($sp)
/* 084358 802C9358 AD600050 */  sw    $zero, 0x50($t3)
/* 08435C 802C935C 10000003 */  b     .L802C936C
/* 084360 802C9360 8FA20020 */   lw    $v0, 0x20($sp)
/* 084364 802C9364 10000001 */  b     .L802C936C
/* 084368 802C9368 00000000 */   nop   
.L802C936C:
/* 08436C 802C936C 8FBF0014 */  lw    $ra, 0x14($sp)
/* 084370 802C9370 27BD0028 */  addiu $sp, $sp, 0x28
/* 084374 802C9374 03E00008 */  jr    $ra
/* 084378 802C9378 00000000 */   nop   

glabel func_802C937C
/* 08437C 802C937C 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 084380 802C9380 AFBF0014 */  sw    $ra, 0x14($sp)
/* 084384 802C9384 AFA40020 */  sw    $a0, 0x20($sp)
/* 084388 802C9388 8FAE0020 */  lw    $t6, 0x20($sp)
/* 08438C 802C938C 27A7001C */  addiu $a3, $sp, 0x1c
/* 084390 802C9390 C5CC00A0 */  lwc1  $f12, 0xa0($t6)
/* 084394 802C9394 C5CE00A4 */  lwc1  $f14, 0xa4($t6)
/* 084398 802C9398 0C0E0640 */  jal   func_80381900
/* 08439C 802C939C 8DC600A8 */   lw    $a2, 0xa8($t6)
/* 0843A0 802C93A0 8FAF0020 */  lw    $t7, 0x20($sp)
/* 0843A4 802C93A4 E5E000E8 */  swc1  $f0, 0xe8($t7)
/* 0843A8 802C93A8 8FB80020 */  lw    $t8, 0x20($sp)
/* 0843AC 802C93AC 3C014000 */  li    $at, 0x40000000 # 2.000000
/* 0843B0 802C93B0 44813000 */  mtc1  $at, $f6
/* 0843B4 802C93B4 C70400E8 */  lwc1  $f4, 0xe8($t8)
/* 0843B8 802C93B8 C70A00A4 */  lwc1  $f10, 0xa4($t8)
/* 0843BC 802C93BC 46062200 */  add.s $f8, $f4, $f6
/* 0843C0 802C93C0 4608503C */  c.lt.s $f10, $f8
/* 0843C4 802C93C4 00000000 */  nop   
/* 0843C8 802C93C8 45000010 */  bc1f  .L802C940C
/* 0843CC 802C93CC 00000000 */   nop   
/* 0843D0 802C93D0 3C014120 */  li    $at, 0x41200000 # 10.000000
/* 0843D4 802C93D4 44818000 */  mtc1  $at, $f16
/* 0843D8 802C93D8 00000000 */  nop   
/* 0843DC 802C93DC 46102481 */  sub.s $f18, $f4, $f16
/* 0843E0 802C93E0 460A903C */  c.lt.s $f18, $f10
/* 0843E4 802C93E4 00000000 */  nop   
/* 0843E8 802C93E8 45000008 */  bc1f  .L802C940C
/* 0843EC 802C93EC 00000000 */   nop   
/* 0843F0 802C93F0 8FB90020 */  lw    $t9, 0x20($sp)
/* 0843F4 802C93F4 C72600E8 */  lwc1  $f6, 0xe8($t9)
/* 0843F8 802C93F8 E72600A4 */  swc1  $f6, 0xa4($t9)
/* 0843FC 802C93FC 8FA80020 */  lw    $t0, 0x20($sp)
/* 084400 802C9400 8D0900EC */  lw    $t1, 0xec($t0)
/* 084404 802C9404 352A0002 */  ori   $t2, $t1, 2
/* 084408 802C9408 AD0A00EC */  sw    $t2, 0xec($t0)
.L802C940C:
/* 08440C 802C940C 10000001 */  b     .L802C9414
/* 084410 802C9410 00000000 */   nop   
.L802C9414:
/* 084414 802C9414 8FBF0014 */  lw    $ra, 0x14($sp)
/* 084418 802C9418 27BD0020 */  addiu $sp, $sp, 0x20
/* 08441C 802C941C 03E00008 */  jr    $ra
/* 084420 802C9420 00000000 */   nop   

glabel func_802C9424
/* 084424 802C9424 27BDFFC8 */  addiu $sp, $sp, -0x38
/* 084428 802C9428 AFBF001C */  sw    $ra, 0x1c($sp)
/* 08442C 802C942C AFA40038 */  sw    $a0, 0x38($sp)
/* 084430 802C9430 AFB00018 */  sw    $s0, 0x18($sp)
/* 084434 802C9434 8FAE0038 */  lw    $t6, 0x38($sp)
/* 084438 802C9438 AFAE0028 */  sw    $t6, 0x28($sp)
/* 08443C 802C943C 8FAF0038 */  lw    $t7, 0x38($sp)
/* 084440 802C9440 8DF80000 */  lw    $t8, ($t7)
/* 084444 802C9444 0018CE02 */  srl   $t9, $t8, 0x18
/* 084448 802C9448 17200007 */  bnez  $t9, .L802C9468
/* 08444C 802C944C 00000000 */   nop   
/* 084450 802C9450 8FA80038 */  lw    $t0, 0x38($sp)
/* 084454 802C9454 8D090000 */  lw    $t1, ($t0)
/* 084458 802C9458 00095402 */  srl   $t2, $t1, 0x10
/* 08445C 802C945C 314BFFFF */  andi  $t3, $t2, 0xffff
/* 084460 802C9460 10000003 */  b     .L802C9470
/* 084464 802C9464 AFAB0034 */   sw    $t3, 0x34($sp)
.L802C9468:
/* 084468 802C9468 240C0008 */  li    $t4, 8
/* 08446C 802C946C AFAC0034 */  sw    $t4, 0x34($sp)
.L802C9470:
/* 084470 802C9470 8FAD0034 */  lw    $t5, 0x34($sp)
/* 084474 802C9474 3C0F8036 */  lui   $t7, %hi(D_8035FD78) # $t7, 0x8036
/* 084478 802C9478 8DEFFD78 */  lw    $t7, %lo(D_8035FD78)($t7)
/* 08447C 802C947C 000D7080 */  sll   $t6, $t5, 2
/* 084480 802C9480 01CD7023 */  subu  $t6, $t6, $t5
/* 084484 802C9484 000E7080 */  sll   $t6, $t6, 2
/* 084488 802C9488 01CD7021 */  addu  $t6, $t6, $t5
/* 08448C 802C948C 000E70C0 */  sll   $t6, $t6, 3
/* 084490 802C9490 01CFC021 */  addu  $t8, $t6, $t7
/* 084494 802C9494 AFB8002C */  sw    $t8, 0x2c($sp)
/* 084498 802C9498 0C0B2448 */  jal   func_802C9120
/* 08449C 802C949C 8FA4002C */   lw    $a0, 0x2c($sp)
/* 0844A0 802C94A0 AFA20030 */  sw    $v0, 0x30($sp)
/* 0844A4 802C94A4 8FB90038 */  lw    $t9, 0x38($sp)
/* 0844A8 802C94A8 8FA80030 */  lw    $t0, 0x30($sp)
/* 0844AC 802C94AC AD1901CC */  sw    $t9, 0x1cc($t0)
/* 0844B0 802C94B0 8FA90028 */  lw    $t1, 0x28($sp)
/* 0844B4 802C94B4 8FAA0030 */  lw    $t2, 0x30($sp)
/* 0844B8 802C94B8 AD49020C */  sw    $t1, 0x20c($t2)
/* 0844BC 802C94BC 8FAB0034 */  lw    $t3, 0x34($sp)
/* 0844C0 802C94C0 2401000C */  li    $at, 12
/* 0844C4 802C94C4 15610005 */  bne   $t3, $at, .L802C94DC
/* 0844C8 802C94C8 00000000 */   nop   
/* 0844CC 802C94CC 8FAC0030 */  lw    $t4, 0x30($sp)
/* 0844D0 802C94D0 858D0074 */  lh    $t5, 0x74($t4)
/* 0844D4 802C94D4 35AE0010 */  ori   $t6, $t5, 0x10
/* 0844D8 802C94D8 A58E0074 */  sh    $t6, 0x74($t4)
.L802C94DC:
/* 0844DC 802C94DC 8FB00034 */  lw    $s0, 0x34($sp)
/* 0844E0 802C94E0 24010004 */  li    $at, 4
/* 0844E4 802C94E4 12010009 */  beq   $s0, $at, .L802C950C
/* 0844E8 802C94E8 00000000 */   nop   
/* 0844EC 802C94EC 24010005 */  li    $at, 5
/* 0844F0 802C94F0 12010006 */  beq   $s0, $at, .L802C950C
/* 0844F4 802C94F4 00000000 */   nop   
/* 0844F8 802C94F8 2401000A */  li    $at, 10
/* 0844FC 802C94FC 12010003 */  beq   $s0, $at, .L802C950C
/* 084500 802C9500 00000000 */   nop   
/* 084504 802C9504 10000005 */  b     .L802C951C
/* 084508 802C9508 00000000 */   nop   
.L802C950C:
/* 08450C 802C950C 0C0B24DF */  jal   func_802C937C
/* 084510 802C9510 8FA40030 */   lw    $a0, 0x30($sp)
/* 084514 802C9514 10000003 */  b     .L802C9524
/* 084518 802C9518 00000000 */   nop   
.L802C951C:
/* 08451C 802C951C 10000001 */  b     .L802C9524
/* 084520 802C9520 00000000 */   nop   
.L802C9524:
/* 084524 802C9524 10000003 */  b     .L802C9534
/* 084528 802C9528 8FA20030 */   lw    $v0, 0x30($sp)
/* 08452C 802C952C 10000001 */  b     .L802C9534
/* 084530 802C9530 00000000 */   nop   
.L802C9534:
/* 084534 802C9534 8FBF001C */  lw    $ra, 0x1c($sp)
/* 084538 802C9538 8FB00018 */  lw    $s0, 0x18($sp)
/* 08453C 802C953C 27BD0038 */  addiu $sp, $sp, 0x38
/* 084540 802C9540 03E00008 */  jr    $ra
/* 084544 802C9544 00000000 */   nop   

glabel func_802C9548
/* 084548 802C9548 A4800074 */  sh    $zero, 0x74($a0)
/* 08454C 802C954C 03E00008 */  jr    $ra
/* 084550 802C9550 00000000 */   nop   

/* 084554 802C9554 03E00008 */  jr    $ra
/* 084558 802C9558 00000000 */   nop   

/* 08455C 802C955C 00000000 */  nop   

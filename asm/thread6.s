# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "macros.inc"


.section .text, "ax"

glabel func_sh_8024C4A0
/* 0044A0 8024C4A0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0044A4 8024C4A4 AFBF0014 */  sw    $ra, 0x14($sp)
/* 0044A8 8024C4A8 3C048032 */  lui   $a0, %hi(D_SH_8031D960) # $a0, 0x8032
/* 0044AC 8024C4AC 3C058032 */  lui   $a1, %hi(D_SH_8031D958) # $a1, 0x8032
/* 0044B0 8024C4B0 24A5D958 */  addiu $a1, %lo(D_SH_8031D958) # addiu $a1, $a1, -0x26a8
/* 0044B4 8024C4B4 2484D960 */  addiu $a0, %lo(D_SH_8031D960) # addiu $a0, $a0, -0x26a0
/* 0044B8 8024C4B8 0C0C05A8 */  jal   osCreateMesgQueue
/* 0044BC 8024C4BC 24060001 */   li    $a2, 1
/* 0044C0 8024C4C0 3C048032 */  lui   $a0, %hi(D_SH_8031D960) # $a0, 0x8032
/* 0044C4 8024C4C4 2484D960 */  addiu $a0, %lo(D_SH_8031D960) # addiu $a0, $a0, -0x26a0
/* 0044C8 8024C4C8 00002825 */  move  $a1, $zero
/* 0044CC 8024C4CC 0C0C07A0 */  jal   osSendMesg
/* 0044D0 8024C4D0 00003025 */   move  $a2, $zero
/* 0044D4 8024C4D4 8FBF0014 */  lw    $ra, 0x14($sp)
/* 0044D8 8024C4D8 27BD0018 */  addiu $sp, $sp, 0x18
/* 0044DC 8024C4DC 03E00008 */  jr    $ra
/* 0044E0 8024C4E0 00000000 */   nop   

glabel func_sh_8024C4E4
/* 0044E4 8024C4E4 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 0044E8 8024C4E8 AFBF0014 */  sw    $ra, 0x14($sp)
/* 0044EC 8024C4EC 3C048032 */  lui   $a0, %hi(D_SH_8031D960) # $a0, 0x8032
/* 0044F0 8024C4F0 2484D960 */  addiu $a0, %lo(D_SH_8031D960) # addiu $a0, $a0, -0x26a0
/* 0044F4 8024C4F4 27A5001C */  addiu $a1, $sp, 0x1c
/* 0044F8 8024C4F8 0C0C0540 */  jal   osRecvMesg
/* 0044FC 8024C4FC 24060001 */   li    $a2, 1
/* 004500 8024C500 8FBF0014 */  lw    $ra, 0x14($sp)
/* 004504 8024C504 27BD0020 */  addiu $sp, $sp, 0x20
/* 004508 8024C508 03E00008 */  jr    $ra
/* 00450C 8024C50C 00000000 */   nop   

glabel func_sh_8024C510
/* 004510 8024C510 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 004514 8024C514 AFBF0014 */  sw    $ra, 0x14($sp)
/* 004518 8024C518 3C048032 */  lui   $a0, %hi(D_SH_8031D960) # $a0, 0x8032
/* 00451C 8024C51C 2484D960 */  addiu $a0, %lo(D_SH_8031D960) # addiu $a0, $a0, -0x26a0
/* 004520 8024C520 00002825 */  move  $a1, $zero
/* 004524 8024C524 0C0C07A0 */  jal   osSendMesg
/* 004528 8024C528 00003025 */   move  $a2, $zero
/* 00452C 8024C52C 8FBF0014 */  lw    $ra, 0x14($sp)
/* 004530 8024C530 27BD0018 */  addiu $sp, $sp, 0x18
/* 004534 8024C534 03E00008 */  jr    $ra
/* 004538 8024C538 00000000 */   nop   

glabel func_sh_8024C53C
/* 00453C 8024C53C 3C0E8031 */  lui   $t6, %hi(D_SH_8030CE04) # $t6, 0x8031
/* 004540 8024C540 8DCECE04 */  lw    $t6, %lo(D_SH_8030CE04)($t6)
/* 004544 8024C544 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 004548 8024C548 AFBF0014 */  sw    $ra, 0x14($sp)
/* 00454C 8024C54C 51C00013 */  beql  $t6, $zero, .L8024C59C
/* 004550 8024C550 8FBF0014 */   lw    $ra, 0x14($sp)
/* 004554 8024C554 0C093139 */  jal   func_sh_8024C4E4
/* 004558 8024C558 00000000 */   nop   
/* 00455C 8024C55C 3C048032 */  lui   $a0, %hi(D_SH_8031D8F0) # $a0, 0x8032
/* 004560 8024C560 0C0C0C24 */  jal   func_sh_80303090
/* 004564 8024C564 2484D8F0 */   addiu $a0, %lo(D_SH_8031D8F0) # addiu $a0, $a0, -0x2710
/* 004568 8024C568 14400004 */  bnez  $v0, .L8024C57C
/* 00456C 8024C56C 3C028031 */   lui   $v0, %hi(D_SH_8030CE08) # $v0, 0x8031
/* 004570 8024C570 2442CE08 */  addiu $v0, %lo(D_SH_8030CE08) # addiu $v0, $v0, -0x31f8
/* 004574 8024C574 10000006 */  b     .L8024C590
/* 004578 8024C578 AC400000 */   sw    $zero, ($v0)
.L8024C57C:
/* 00457C 8024C57C 3C028031 */  lui   $v0, %hi(D_SH_8030CE08) # $v0, 0x8031
/* 004580 8024C580 2442CE08 */  addiu $v0, %lo(D_SH_8030CE08) # addiu $v0, $v0, -0x31f8
/* 004584 8024C584 8C4F0000 */  lw    $t7, ($v0)
/* 004588 8024C588 25F80001 */  addiu $t8, $t7, 1
/* 00458C 8024C58C AC580000 */  sw    $t8, ($v0)
.L8024C590:
/* 004590 8024C590 0C093144 */  jal   func_sh_8024C510
/* 004594 8024C594 00000000 */   nop   
/* 004598 8024C598 8FBF0014 */  lw    $ra, 0x14($sp)
.L8024C59C:
/* 00459C 8024C59C 27BD0018 */  addiu $sp, $sp, 0x18
/* 0045A0 8024C5A0 03E00008 */  jr    $ra
/* 0045A4 8024C5A4 00000000 */   nop   

glabel func_sh_8024C5A8
/* 0045A8 8024C5A8 3C0E8031 */  lui   $t6, %hi(D_SH_8030CE04) # $t6, 0x8031
/* 0045AC 8024C5AC 8DCECE04 */  lw    $t6, %lo(D_SH_8030CE04)($t6)
/* 0045B0 8024C5B0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0045B4 8024C5B4 AFBF0014 */  sw    $ra, 0x14($sp)
/* 0045B8 8024C5B8 51C00013 */  beql  $t6, $zero, .L8024C608
/* 0045BC 8024C5BC 8FBF0014 */   lw    $ra, 0x14($sp)
/* 0045C0 8024C5C0 0C093139 */  jal   func_sh_8024C4E4
/* 0045C4 8024C5C4 00000000 */   nop   
/* 0045C8 8024C5C8 3C048032 */  lui   $a0, %hi(D_SH_8031D8F0) # $a0, 0x8032
/* 0045CC 8024C5CC 0C0C0BBC */  jal   func_sh_80302EF0
/* 0045D0 8024C5D0 2484D8F0 */   addiu $a0, %lo(D_SH_8031D8F0) # addiu $a0, $a0, -0x2710
/* 0045D4 8024C5D4 14400004 */  bnez  $v0, .L8024C5E8
/* 0045D8 8024C5D8 3C028031 */   lui   $v0, %hi(D_SH_8030CE08) # $v0, 0x8031
/* 0045DC 8024C5DC 2442CE08 */  addiu $v0, %lo(D_SH_8030CE08) # addiu $v0, $v0, -0x31f8
/* 0045E0 8024C5E0 10000006 */  b     .L8024C5FC
/* 0045E4 8024C5E4 AC400000 */   sw    $zero, ($v0)
.L8024C5E8:
/* 0045E8 8024C5E8 3C028031 */  lui   $v0, %hi(D_SH_8030CE08) # $v0, 0x8031
/* 0045EC 8024C5EC 2442CE08 */  addiu $v0, %lo(D_SH_8030CE08) # addiu $v0, $v0, -0x31f8
/* 0045F0 8024C5F0 8C4F0000 */  lw    $t7, ($v0)
/* 0045F4 8024C5F4 25F80001 */  addiu $t8, $t7, 1
/* 0045F8 8024C5F8 AC580000 */  sw    $t8, ($v0)
.L8024C5FC:
/* 0045FC 8024C5FC 0C093144 */  jal   func_sh_8024C510
/* 004600 8024C600 00000000 */   nop   
/* 004604 8024C604 8FBF0014 */  lw    $ra, 0x14($sp)
.L8024C608:
/* 004608 8024C608 27BD0018 */  addiu $sp, $sp, 0x18
/* 00460C 8024C60C 03E00008 */  jr    $ra
/* 004610 8024C610 00000000 */   nop   

glabel func_sh_8024C614
/* 004614 8024C614 3C0E8031 */  lui   $t6, %hi(D_SH_8030CCB4) # $t6, 0x8031
/* 004618 8024C618 81CECCB4 */  lb    $t6, %lo(D_SH_8030CCB4)($t6)
/* 00461C 8024C61C 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 004620 8024C620 AFBF001C */  sw    $ra, 0x1c($sp)
/* 004624 8024C624 19C00005 */  blez  $t6, .L8024C63C
/* 004628 8024C628 AFB00018 */   sw    $s0, 0x18($sp)
/* 00462C 8024C62C 0C09316A */  jal   func_sh_8024C5A8
/* 004630 8024C630 00000000 */   nop   
/* 004634 8024C634 10000059 */  b     .L8024C79C
/* 004638 8024C638 8FBF001C */   lw    $ra, 0x1c($sp)
.L8024C63C:
/* 00463C 8024C63C 3C108032 */  lui   $s0, %hi(D_SH_8031D9B0) # $s0, 0x8032
/* 004640 8024C640 2610D9B0 */  addiu $s0, %lo(D_SH_8031D9B0) # addiu $s0, $s0, -0x2650
/* 004644 8024C644 86020008 */  lh    $v0, 8($s0)
/* 004648 8024C648 58400007 */  blezl $v0, .L8024C668
/* 00464C 8024C64C 86020004 */   lh    $v0, 4($s0)
/* 004650 8024C650 244FFFFF */  addiu $t7, $v0, -1
/* 004654 8024C654 0C09314F */  jal   func_sh_8024C53C
/* 004658 8024C658 A60F0008 */   sh    $t7, 8($s0)
/* 00465C 8024C65C 1000004B */  b     .L8024C78C
/* 004660 8024C660 8602000A */   lh    $v0, 0xa($s0)
/* 004664 8024C664 86020004 */  lh    $v0, 4($s0)
.L8024C668:
/* 004668 8024C668 5840002D */  blezl $v0, .L8024C720
/* 00466C 8024C66C 8602000A */   lh    $v0, 0xa($s0)
/* 004670 8024C670 86190002 */  lh    $t9, 2($s0)
/* 004674 8024C674 8608000E */  lh    $t0, 0xe($s0)
/* 004678 8024C678 2458FFFF */  addiu $t8, $v0, -1
/* 00467C 8024C67C A6180004 */  sh    $t8, 4($s0)
/* 004680 8024C680 03284823 */  subu  $t1, $t9, $t0
/* 004684 8024C684 A6090002 */  sh    $t1, 2($s0)
/* 004688 8024C688 860A0002 */  lh    $t2, 2($s0)
/* 00468C 8024C68C 05430003 */  bgezl $t2, .L8024C69C
/* 004690 8024C690 860B0000 */   lh    $t3, ($s0)
/* 004694 8024C694 A6000002 */  sh    $zero, 2($s0)
/* 004698 8024C698 860B0000 */  lh    $t3, ($s0)
.L8024C69C:
/* 00469C 8024C69C 24010001 */  li    $at, 1
/* 0046A0 8024C6A0 55610006 */  bnel  $t3, $at, .L8024C6BC
/* 0046A4 8024C6A4 86030006 */   lh    $v1, 6($s0)
/* 0046A8 8024C6A8 0C09314F */  jal   func_sh_8024C53C
/* 0046AC 8024C6AC 00000000 */   nop   
/* 0046B0 8024C6B0 10000036 */  b     .L8024C78C
/* 0046B4 8024C6B4 8602000A */   lh    $v0, 0xa($s0)
/* 0046B8 8024C6B8 86030006 */  lh    $v1, 6($s0)
.L8024C6BC:
/* 0046BC 8024C6BC 28610100 */  slti  $at, $v1, 0x100
/* 0046C0 8024C6C0 14200005 */  bnez  $at, .L8024C6D8
/* 0046C4 8024C6C4 246CFF00 */   addiu $t4, $v1, -0x100
/* 0046C8 8024C6C8 0C09314F */  jal   func_sh_8024C53C
/* 0046CC 8024C6CC A60C0006 */   sh    $t4, 6($s0)
/* 0046D0 8024C6D0 1000002E */  b     .L8024C78C
/* 0046D4 8024C6D4 8602000A */   lh    $v0, 0xa($s0)
.L8024C6D8:
/* 0046D8 8024C6D8 86020002 */  lh    $v0, 2($s0)
/* 0046DC 8024C6DC 00420019 */  multu $v0, $v0
/* 0046E0 8024C6E0 00006812 */  mflo  $t5
/* 0046E4 8024C6E4 00000000 */  nop   
/* 0046E8 8024C6E8 00000000 */  nop   
/* 0046EC 8024C6EC 01A20019 */  multu $t5, $v0
/* 0046F0 8024C6F0 00007012 */  mflo  $t6
/* 0046F4 8024C6F4 05C10003 */  bgez  $t6, .L8024C704
/* 0046F8 8024C6F8 000E7A43 */   sra   $t7, $t6, 9
/* 0046FC 8024C6FC 25C101FF */  addiu $at, $t6, 0x1ff
/* 004700 8024C700 00017A43 */  sra   $t7, $at, 9
.L8024C704:
/* 004704 8024C704 006FC021 */  addu  $t8, $v1, $t7
/* 004708 8024C708 27190004 */  addiu $t9, $t8, 4
/* 00470C 8024C70C 0C09316A */  jal   func_sh_8024C5A8
/* 004710 8024C710 A6190006 */   sh    $t9, 6($s0)
/* 004714 8024C714 1000001D */  b     .L8024C78C
/* 004718 8024C718 8602000A */   lh    $v0, 0xa($s0)
/* 00471C 8024C71C 8602000A */  lh    $v0, 0xa($s0)
.L8024C720:
/* 004720 8024C720 A6000004 */  sh    $zero, 4($s0)
/* 004724 8024C724 28410005 */  slti  $at, $v0, 5
/* 004728 8024C728 54200006 */  bnel  $at, $zero, .L8024C744
/* 00472C 8024C72C 28410002 */   slti  $at, $v0, 2
/* 004730 8024C730 0C09314F */  jal   func_sh_8024C53C
/* 004734 8024C734 00000000 */   nop   
/* 004738 8024C738 10000014 */  b     .L8024C78C
/* 00473C 8024C73C 8602000A */   lh    $v0, 0xa($s0)
/* 004740 8024C740 28410002 */  slti  $at, $v0, 2
.L8024C744:
/* 004744 8024C744 1420000E */  bnez  $at, .L8024C780
/* 004748 8024C748 3C088031 */   lui   $t0, %hi(D_SH_8030CCB0) # $t0, 0x8031
/* 00474C 8024C74C 8D08CCB0 */  lw    $t0, %lo(D_SH_8030CCB0)($t0)
/* 004750 8024C750 8609000C */  lh    $t1, 0xc($s0)
/* 004754 8024C754 0109001B */  divu  $zero, $t0, $t1
/* 004758 8024C758 00005010 */  mfhi  $t2
/* 00475C 8024C75C 15200002 */  bnez  $t1, .L8024C768
/* 004760 8024C760 00000000 */   nop   
/* 004764 8024C764 0007000D */  break 7
.L8024C768:
/* 004768 8024C768 15400005 */  bnez  $t2, .L8024C780
/* 00476C 8024C76C 00000000 */   nop   
/* 004770 8024C770 0C09314F */  jal   func_sh_8024C53C
/* 004774 8024C774 00000000 */   nop   
/* 004778 8024C778 10000004 */  b     .L8024C78C
/* 00477C 8024C77C 8602000A */   lh    $v0, 0xa($s0)
.L8024C780:
/* 004780 8024C780 0C09316A */  jal   func_sh_8024C5A8
/* 004784 8024C784 00000000 */   nop   
/* 004788 8024C788 8602000A */  lh    $v0, 0xa($s0)
.L8024C78C:
/* 00478C 8024C78C 18400002 */  blez  $v0, .L8024C798
/* 004790 8024C790 244BFFFF */   addiu $t3, $v0, -1
/* 004794 8024C794 A60B000A */  sh    $t3, 0xa($s0)
.L8024C798:
/* 004798 8024C798 8FBF001C */  lw    $ra, 0x1c($sp)
.L8024C79C:
/* 00479C 8024C79C 8FB00018 */  lw    $s0, 0x18($sp)
/* 0047A0 8024C7A0 27BD0020 */  addiu $sp, $sp, 0x20
/* 0047A4 8024C7A4 03E00008 */  jr    $ra
/* 0047A8 8024C7A8 00000000 */   nop   

glabel func_sh_8024C7AC
/* 0047AC 8024C7AC 3C038032 */  lui   $v1, %hi(D_SH_8031D998) # $v1, 0x8032
/* 0047B0 8024C7B0 2463D998 */  addiu $v1, %lo(D_SH_8031D998) # addiu $v1, $v1, -0x2668
/* 0047B4 8024C7B4 90620000 */  lbu   $v0, ($v1)
/* 0047B8 8024C7B8 3C048032 */  lui   $a0, %hi(D_SH_8031D9B0) # $a0, 0x8032
/* 0047BC 8024C7BC 2484D9B0 */  addiu $a0, %lo(D_SH_8031D9B0) # addiu $a0, $a0, -0x2650
/* 0047C0 8024C7C0 1040000A */  beqz  $v0, .L8024C7EC
/* 0047C4 8024C7C4 240E0004 */   li    $t6, 4
/* 0047C8 8024C7C8 846F0002 */  lh    $t7, 2($v1)
/* 0047CC 8024C7CC 90780001 */  lbu   $t8, 1($v1)
/* 0047D0 8024C7D0 84790004 */  lh    $t9, 4($v1)
/* 0047D4 8024C7D4 A4800006 */  sh    $zero, 6($a0)
/* 0047D8 8024C7D8 A48E0008 */  sh    $t6, 8($a0)
/* 0047DC 8024C7DC A4820000 */  sh    $v0, ($a0)
/* 0047E0 8024C7E0 A48F0004 */  sh    $t7, 4($a0)
/* 0047E4 8024C7E4 A4980002 */  sh    $t8, 2($a0)
/* 0047E8 8024C7E8 A499000E */  sh    $t9, 0xe($a0)
.L8024C7EC:
/* 0047EC 8024C7EC 3C028032 */  lui   $v0, %hi(D_SH_8031D99E) # $v0, 0x8032
/* 0047F0 8024C7F0 2442D99E */  addiu $v0, %lo(D_SH_8031D99E) # addiu $v0, $v0, -0x2662
/* 0047F4 8024C7F4 88410000 */  lwl   $at, ($v0)
/* 0047F8 8024C7F8 98410003 */  lwr   $at, 3($v0)
/* 0047FC 8024C7FC 3C0A8032 */  lui   $t2, %hi(D_SH_8031D9A4) # $t2, 0x8032
/* 004800 8024C800 254AD9A4 */  addiu $t2, %lo(D_SH_8031D9A4) # addiu $t2, $t2, -0x265c
/* 004804 8024C804 A8610000 */  swl   $at, ($v1)
/* 004808 8024C808 B8610003 */  swr   $at, 3($v1)
/* 00480C 8024C80C 94410004 */  lhu   $at, 4($v0)
/* 004810 8024C810 A4610004 */  sh    $at, 4($v1)
/* 004814 8024C814 89410000 */  lwl   $at, ($t2)
/* 004818 8024C818 99410003 */  lwr   $at, 3($t2)
/* 00481C 8024C81C A8410000 */  swl   $at, ($v0)
/* 004820 8024C820 B8410003 */  swr   $at, 3($v0)
/* 004824 8024C824 95410004 */  lhu   $at, 4($t2)
/* 004828 8024C828 A4410004 */  sh    $at, 4($v0)
/* 00482C 8024C82C 03E00008 */  jr    $ra
/* 004830 8024C830 A060000C */   sb    $zero, 0xc($v1)

glabel func_sh_8024C834
/* 004834 8024C834 3C088031 */  lui   $t0, %hi(D_SH_8030CD20) # $t0, 0x8031
/* 004838 8024C838 8D08CD20 */  lw    $t0, %lo(D_SH_8030CD20)($t0)
/* 00483C 8024C83C 0005C400 */  sll   $t8, $a1, 0x10
/* 004840 8024C840 0018CC03 */  sra   $t9, $t8, 0x10
/* 004844 8024C844 AFA40000 */  sw    $a0, ($sp)
/* 004848 8024C848 00047400 */  sll   $t6, $a0, 0x10
/* 00484C 8024C84C AFA50004 */  sw    $a1, 4($sp)
/* 004850 8024C850 03202825 */  move  $a1, $t9
/* 004854 8024C854 1500000F */  bnez  $t0, .L8024C894
/* 004858 8024C858 000E2403 */   sra   $a0, $t6, 0x10
/* 00485C 8024C85C 2B210047 */  slti  $at, $t9, 0x47
/* 004860 8024C860 14200006 */  bnez  $at, .L8024C87C
/* 004864 8024C864 3C028032 */   lui   $v0, 0x8032
/* 004868 8024C868 3C028032 */  lui   $v0, %hi(D_SH_8031D998) # $v0, 0x8032
/* 00486C 8024C86C 2442D998 */  addiu $v0, %lo(D_SH_8031D998) # addiu $v0, $v0, -0x2668
/* 004870 8024C870 24090001 */  li    $t1, 1
/* 004874 8024C874 10000004 */  b     .L8024C888
/* 004878 8024C878 A049000C */   sb    $t1, 0xc($v0)
.L8024C87C:
/* 00487C 8024C87C 2442D998 */  addiu $v0, $v0, -0x2668
/* 004880 8024C880 240A0002 */  li    $t2, 2
/* 004884 8024C884 A04A000C */  sb    $t2, 0xc($v0)
.L8024C888:
/* 004888 8024C888 A045000D */  sb    $a1, 0xd($v0)
/* 00488C 8024C88C A444000E */  sh    $a0, 0xe($v0)
/* 004890 8024C890 A4400010 */  sh    $zero, 0x10($v0)
.L8024C894:
/* 004894 8024C894 03E00008 */  jr    $ra
/* 004898 8024C898 00000000 */   nop   

glabel func_sh_8024C89C
/* 00489C 8024C89C 3C018032 */  lui   $at, 0x8032
/* 0048A0 8024C8A0 AFA40000 */  sw    $a0, ($sp)
/* 0048A4 8024C8A4 03E00008 */  jr    $ra
/* 0048A8 8024C8A8 A424D9A8 */   sh    $a0, -0x2658($at)

glabel func_sh_8024C8AC
/* 0048AC 8024C8AC 3C028032 */  lui   $v0, %hi(D_SH_8031D9B0) # $v0, 0x8032
/* 0048B0 8024C8B0 2442D9B0 */  addiu $v0, %lo(D_SH_8031D9B0) # addiu $v0, $v0, -0x2650
/* 0048B4 8024C8B4 844E0008 */  lh    $t6, 8($v0)
/* 0048B8 8024C8B8 844F0004 */  lh    $t7, 4($v0)
/* 0048BC 8024C8BC 3C028032 */  lui   $v0, %hi(D_SH_8031D998) # $v0, 0x8032
/* 0048C0 8024C8C0 2442D998 */  addiu $v0, %lo(D_SH_8031D998) # addiu $v0, $v0, -0x2668
/* 0048C4 8024C8C4 01CFC021 */  addu  $t8, $t6, $t7
/* 0048C8 8024C8C8 2B010004 */  slti  $at, $t8, 4
/* 0048CC 8024C8CC 54200004 */  bnel  $at, $zero, .L8024C8E0
/* 0048D0 8024C8D0 90590000 */   lbu   $t9, ($v0)
/* 0048D4 8024C8D4 03E00008 */  jr    $ra
/* 0048D8 8024C8D8 00001025 */   move  $v0, $zero

/* 0048DC 8024C8DC 90590000 */  lbu   $t9, ($v0)
.L8024C8E0:
/* 0048E0 8024C8E0 53200004 */  beql  $t9, $zero, .L8024C8F4
/* 0048E4 8024C8E4 90480006 */   lbu   $t0, 6($v0)
/* 0048E8 8024C8E8 03E00008 */  jr    $ra
/* 0048EC 8024C8EC 00001025 */   move  $v0, $zero

/* 0048F0 8024C8F0 90480006 */  lbu   $t0, 6($v0)
.L8024C8F4:
/* 0048F4 8024C8F4 51000004 */  beql  $t0, $zero, .L8024C908
/* 0048F8 8024C8F8 9049000C */   lbu   $t1, 0xc($v0)
/* 0048FC 8024C8FC 03E00008 */  jr    $ra
/* 004900 8024C900 00001025 */   move  $v0, $zero

/* 004904 8024C904 9049000C */  lbu   $t1, 0xc($v0)
.L8024C908:
/* 004908 8024C908 24020001 */  li    $v0, 1
/* 00490C 8024C90C 11200003 */  beqz  $t1, .L8024C91C
/* 004910 8024C910 00000000 */   nop   
/* 004914 8024C914 03E00008 */  jr    $ra
/* 004918 8024C918 00001025 */   move  $v0, $zero

.L8024C91C:
/* 00491C 8024C91C 03E00008 */  jr    $ra
/* 004920 8024C920 00000000 */   nop   

glabel func_sh_8024C924
/* 004924 8024C924 3C0E8031 */  lui   $t6, %hi(D_SH_8030CD20) # $t6, 0x8031
/* 004928 8024C928 8DCECD20 */  lw    $t6, %lo(D_SH_8030CD20)($t6)
/* 00492C 8024C92C 3C038032 */  lui   $v1, %hi(D_SH_8031D9B0) # $v1, 0x8032
/* 004930 8024C930 2463D9B0 */  addiu $v1, %lo(D_SH_8031D9B0) # addiu $v1, $v1, -0x2650
/* 004934 8024C934 15C0000D */  bnez  $t6, .L8024C96C
/* 004938 8024C938 24190007 */   li    $t9, 7
/* 00493C 8024C93C 8462000A */  lh    $v0, 0xa($v1)
/* 004940 8024C940 240F0007 */  li    $t7, 7
/* 004944 8024C944 24180004 */  li    $t8, 4
/* 004948 8024C948 54400004 */  bnel  $v0, $zero, .L8024C95C
/* 00494C 8024C94C 28410004 */   slti  $at, $v0, 4
/* 004950 8024C950 A46F000A */  sh    $t7, 0xa($v1)
/* 004954 8024C954 8462000A */  lh    $v0, 0xa($v1)
/* 004958 8024C958 28410004 */  slti  $at, $v0, 4
.L8024C95C:
/* 00495C 8024C95C 50200003 */  beql  $at, $zero, .L8024C96C
/* 004960 8024C960 A479000C */   sh    $t9, 0xc($v1)
/* 004964 8024C964 A478000A */  sh    $t8, 0xa($v1)
/* 004968 8024C968 A479000C */  sh    $t9, 0xc($v1)
.L8024C96C:
/* 00496C 8024C96C 03E00008 */  jr    $ra
/* 004970 8024C970 00000000 */   nop   

glabel func_sh_8024C974
/* 004974 8024C974 3C0E8031 */  lui   $t6, %hi(D_SH_8030CD20) # $t6, 0x8031
/* 004978 8024C978 8DCECD20 */  lw    $t6, %lo(D_SH_8030CD20)($t6)
/* 00497C 8024C97C 3C038032 */  lui   $v1, %hi(D_SH_8031D9B0) # $v1, 0x8032
/* 004980 8024C980 2463D9B0 */  addiu $v1, %lo(D_SH_8031D9B0) # addiu $v1, $v1, -0x2650
/* 004984 8024C984 15C0001D */  bnez  $t6, .L8024C9FC
/* 004988 8024C988 24050003 */   li    $a1, 3
/* 00498C 8024C98C 8462000A */  lh    $v0, 0xa($v1)
/* 004990 8024C990 240F0007 */  li    $t7, 7
/* 004994 8024C994 24180001 */  li    $t8, 1
/* 004998 8024C998 14400003 */  bnez  $v0, .L8024C9A8
/* 00499C 8024C99C 24190002 */   li    $t9, 2
/* 0049A0 8024C9A0 A46F000A */  sh    $t7, 0xa($v1)
/* 0049A4 8024C9A4 8462000A */  lh    $v0, 0xa($v1)
.L8024C9A8:
/* 0049A8 8024C9A8 28410004 */  slti  $at, $v0, 4
/* 0049AC 8024C9AC 10200002 */  beqz  $at, .L8024C9B8
/* 0049B0 8024C9B0 24020004 */   li    $v0, 4
/* 0049B4 8024C9B4 A462000A */  sh    $v0, 0xa($v1)
.L8024C9B8:
/* 0049B8 8024C9B8 24020004 */  li    $v0, 4
/* 0049BC 8024C9BC 14820002 */  bne   $a0, $v0, .L8024C9C8
/* 0049C0 8024C9C0 24010002 */   li    $at, 2
/* 0049C4 8024C9C4 A478000C */  sh    $t8, 0xc($v1)
.L8024C9C8:
/* 0049C8 8024C9C8 14850002 */  bne   $a0, $a1, .L8024C9D4
/* 0049CC 8024C9CC 24080005 */   li    $t0, 5
/* 0049D0 8024C9D0 A479000C */  sh    $t9, 0xc($v1)
.L8024C9D4:
/* 0049D4 8024C9D4 54810003 */  bnel  $a0, $at, .L8024C9E4
/* 0049D8 8024C9D8 24010001 */   li    $at, 1
/* 0049DC 8024C9DC A465000C */  sh    $a1, 0xc($v1)
/* 0049E0 8024C9E0 24010001 */  li    $at, 1
.L8024C9E4:
/* 0049E4 8024C9E4 14810002 */  bne   $a0, $at, .L8024C9F0
/* 0049E8 8024C9E8 00000000 */   nop   
/* 0049EC 8024C9EC A462000C */  sh    $v0, 0xc($v1)
.L8024C9F0:
/* 0049F0 8024C9F0 14800002 */  bnez  $a0, .L8024C9FC
/* 0049F4 8024C9F4 00000000 */   nop   
/* 0049F8 8024C9F8 A468000C */  sh    $t0, 0xc($v1)
.L8024C9FC:
/* 0049FC 8024C9FC 03E00008 */  jr    $ra
/* 004A00 8024CA00 00000000 */   nop   

glabel func_sh_8024CA04
/* 004A04 8024CA04 3C0E8031 */  lui   $t6, %hi(D_SH_8030CD20) # $t6, 0x8031
/* 004A08 8024CA08 8DCECD20 */  lw    $t6, %lo(D_SH_8030CD20)($t6)
/* 004A0C 8024CA0C 3C028032 */  lui   $v0, %hi(D_SH_8031D9B0) # $v0, 0x8032
/* 004A10 8024CA10 2442D9B0 */  addiu $v0, %lo(D_SH_8031D9B0) # addiu $v0, $v0, -0x2650
/* 004A14 8024CA14 15C00003 */  bnez  $t6, .L8024CA24
/* 004A18 8024CA18 24030004 */   li    $v1, 4
/* 004A1C 8024CA1C A443000A */  sh    $v1, 0xa($v0)
/* 004A20 8024CA20 A443000C */  sh    $v1, 0xc($v0)
.L8024CA24:
/* 004A24 8024CA24 03E00008 */  jr    $ra
/* 004A28 8024CA28 00000000 */   nop   

glabel Thread6
/* 004A2C 8024CA2C 27BDFFB8 */  addiu $sp, $sp, -0x48
/* 004A30 8024CA30 AFBF003C */  sw    $ra, 0x3c($sp)
/* 004A34 8024CA34 AFBE0038 */  sw    $fp, 0x38($sp)
/* 004A38 8024CA38 AFB70034 */  sw    $s7, 0x34($sp)
/* 004A3C 8024CA3C AFB60030 */  sw    $s6, 0x30($sp)
/* 004A40 8024CA40 AFB5002C */  sw    $s5, 0x2c($sp)
/* 004A44 8024CA44 AFB40028 */  sw    $s4, 0x28($sp)
/* 004A48 8024CA48 AFB30024 */  sw    $s3, 0x24($sp)
/* 004A4C 8024CA4C AFB20020 */  sw    $s2, 0x20($sp)
/* 004A50 8024CA50 AFB1001C */  sw    $s1, 0x1c($sp)
/* 004A54 8024CA54 AFB00018 */  sw    $s0, 0x18($sp)
/* 004A58 8024CA58 0C0932E4 */  jal   func_sh_8024CB90
/* 004A5C 8024CA5C AFA40048 */   sw    $a0, 0x48($sp)
/* 004A60 8024CA60 240E0001 */  li    $t6, 1
/* 004A64 8024CA64 3C018031 */  lui   $at, %hi(D_SH_8030CE00) # $at, 0x8031
/* 004A68 8024CA68 3C1E8032 */  lui   $fp, %hi(D_SH_8031D8F0) # $fp, 0x8032
/* 004A6C 8024CA6C 3C178032 */  lui   $s7, %hi(D_SH_8031D3D8) # $s7, 0x8032
/* 004A70 8024CA70 3C158031 */  lui   $s5, %hi(D_SH_8030CCB0) # $s5, 0x8031
/* 004A74 8024CA74 3C138032 */  lui   $s3, %hi(D_SH_8031D980) # $s3, 0x8032
/* 004A78 8024CA78 3C128031 */  lui   $s2, %hi(D_SH_8030CE0C) # $s2, 0x8031
/* 004A7C 8024CA7C 3C118031 */  lui   $s1, %hi(D_SH_8030CE08) # $s1, 0x8031
/* 004A80 8024CA80 3C108031 */  lui   $s0, %hi(D_SH_8030CE04) # $s0, 0x8031
/* 004A84 8024CA84 AC2ECE00 */  sw    $t6, %lo(D_SH_8030CE00)($at)
/* 004A88 8024CA88 2610CE04 */  addiu $s0, %lo(D_SH_8030CE04) # addiu $s0, $s0, -0x31fc
/* 004A8C 8024CA8C 2631CE08 */  addiu $s1, %lo(D_SH_8030CE08) # addiu $s1, $s1, -0x31f8
/* 004A90 8024CA90 2652CE0C */  addiu $s2, %lo(D_SH_8030CE0C) # addiu $s2, $s2, -0x31f4
/* 004A94 8024CA94 2673D980 */  addiu $s3, %lo(D_SH_8031D980) # addiu $s3, $s3, -0x2680
/* 004A98 8024CA98 26B5CCB0 */  addiu $s5, %lo(D_SH_8030CCB0) # addiu $s5, $s5, -0x3350
/* 004A9C 8024CA9C 26F7D3D8 */  addiu $s7, %lo(D_SH_8031D3D8) # addiu $s7, $s7, -0x2c28
/* 004AA0 8024CAA0 27DED8F0 */  addiu $fp, %lo(D_SH_8031D8F0) # addiu $fp, $fp, -0x2710
/* 004AA4 8024CAA4 2416003C */  li    $s6, 60
/* 004AA8 8024CAA8 27B40044 */  addiu $s4, $sp, 0x44
.L8024CAAC:
/* 004AAC 8024CAAC 02602025 */  move  $a0, $s3
.L8024CAB0:
/* 004AB0 8024CAB0 02802825 */  move  $a1, $s4
/* 004AB4 8024CAB4 0C0C0540 */  jal   osRecvMesg
/* 004AB8 8024CAB8 24060001 */   li    $a2, 1
/* 004ABC 8024CABC 0C0931EB */  jal   func_sh_8024C7AC
/* 004AC0 8024CAC0 00000000 */   nop   
/* 004AC4 8024CAC4 0C093185 */  jal   func_sh_8024C614
/* 004AC8 8024CAC8 00000000 */   nop   
/* 004ACC 8024CACC 8E0F0000 */  lw    $t7, ($s0)
/* 004AD0 8024CAD0 51E00008 */  beql  $t7, $zero, .L8024CAF4
/* 004AD4 8024CAD4 8EB90000 */   lw    $t9, ($s5)
/* 004AD8 8024CAD8 8E380000 */  lw    $t8, ($s1)
/* 004ADC 8024CADC 2B01001E */  slti  $at, $t8, 0x1e
/* 004AE0 8024CAE0 54200015 */  bnel  $at, $zero, .L8024CB38
/* 004AE4 8024CAE4 8E420000 */   lw    $v0, ($s2)
/* 004AE8 8024CAE8 10000012 */  b     .L8024CB34
/* 004AEC 8024CAEC AE000000 */   sw    $zero, ($s0)
/* 004AF0 8024CAF0 8EB90000 */  lw    $t9, ($s5)
.L8024CAF4:
/* 004AF4 8024CAF4 02E02025 */  move  $a0, $s7
/* 004AF8 8024CAF8 3C098031 */  lui   $t1, %hi(D_SH_8030CD14) # $t1, 0x8031
/* 004AFC 8024CAFC 0336001B */  divu  $zero, $t9, $s6
/* 004B00 8024CB00 00004010 */  mfhi  $t0
/* 004B04 8024CB04 16C00002 */  bnez  $s6, .L8024CB10
/* 004B08 8024CB08 00000000 */   nop   
/* 004B0C 8024CB0C 0007000D */  break 7
.L8024CB10:
/* 004B10 8024CB10 55000009 */  bnel  $t0, $zero, .L8024CB38
/* 004B14 8024CB14 8E420000 */   lw    $v0, ($s2)
/* 004B18 8024CB18 8D29CD14 */  lw    $t1, %lo(D_SH_8030CD14)($t1)
/* 004B1C 8024CB1C 03C02825 */  move  $a1, $fp
/* 004B20 8024CB20 0C0C0CEB */  jal   func_sh_803033AC
/* 004B24 8024CB24 8D26001C */   lw    $a2, 0x1c($t1)
/* 004B28 8024CB28 2C4A0001 */  sltiu $t2, $v0, 1
/* 004B2C 8024CB2C AE0A0000 */  sw    $t2, ($s0)
/* 004B30 8024CB30 AE200000 */  sw    $zero, ($s1)
.L8024CB34:
/* 004B34 8024CB34 8E420000 */  lw    $v0, ($s2)
.L8024CB38:
/* 004B38 8024CB38 5840FFDD */  blezl $v0, .L8024CAB0
/* 004B3C 8024CB3C 02602025 */   move  $a0, $s3
/* 004B40 8024CB40 244BFFFF */  addiu $t3, $v0, -1
/* 004B44 8024CB44 1000FFD9 */  b     .L8024CAAC
/* 004B48 8024CB48 AE4B0000 */   sw    $t3, ($s2)
/* 004B4C 8024CB4C 00000000 */  nop   
/* 004B50 8024CB50 00000000 */  nop   
/* 004B54 8024CB54 00000000 */  nop   
/* 004B58 8024CB58 00000000 */  nop   
/* 004B5C 8024CB5C 00000000 */  nop   
/* 004B60 8024CB60 8FBF003C */  lw    $ra, 0x3c($sp)
/* 004B64 8024CB64 8FB00018 */  lw    $s0, 0x18($sp)
/* 004B68 8024CB68 8FB1001C */  lw    $s1, 0x1c($sp)
/* 004B6C 8024CB6C 8FB20020 */  lw    $s2, 0x20($sp)
/* 004B70 8024CB70 8FB30024 */  lw    $s3, 0x24($sp)
/* 004B74 8024CB74 8FB40028 */  lw    $s4, 0x28($sp)
/* 004B78 8024CB78 8FB5002C */  lw    $s5, 0x2c($sp)
/* 004B7C 8024CB7C 8FB60030 */  lw    $s6, 0x30($sp)
/* 004B80 8024CB80 8FB70034 */  lw    $s7, 0x34($sp)
/* 004B84 8024CB84 8FBE0038 */  lw    $fp, 0x38($sp)
/* 004B88 8024CB88 03E00008 */  jr    $ra
/* 004B8C 8024CB8C 27BD0048 */   addiu $sp, $sp, 0x48

glabel func_sh_8024CB90
/* 004B90 8024CB90 3C0E8031 */  lui   $t6, %hi(D_SH_8030CD14) # $t6, 0x8031
/* 004B94 8024CB94 8DCECD14 */  lw    $t6, %lo(D_SH_8030CD14)($t6)
/* 004B98 8024CB98 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 004B9C 8024CB9C AFBF0014 */  sw    $ra, 0x14($sp)
/* 004BA0 8024CBA0 3C048032 */  lui   $a0, %hi(D_SH_8031D3D8) # $a0, 0x8032
/* 004BA4 8024CBA4 3C058032 */  lui   $a1, %hi(D_SH_8031D8F0) # $a1, 0x8032
/* 004BA8 8024CBA8 24A5D8F0 */  addiu $a1, %lo(D_SH_8031D8F0) # addiu $a1, $a1, -0x2710
/* 004BAC 8024CBAC 2484D3D8 */  addiu $a0, %lo(D_SH_8031D3D8) # addiu $a0, $a0, -0x2c28
/* 004BB0 8024CBB0 0C0C0CEB */  jal   func_sh_803033AC
/* 004BB4 8024CBB4 8DC6001C */   lw    $a2, 0x1c($t6)
/* 004BB8 8024CBB8 3C038031 */  lui   $v1, %hi(D_SH_8030CE04) # $v1, 0x8031
/* 004BBC 8024CBBC 2463CE04 */  addiu $v1, %lo(D_SH_8030CE04) # addiu $v1, $v1, -0x31fc
/* 004BC0 8024CBC0 2C4F0001 */  sltiu $t7, $v0, 1
/* 004BC4 8024CBC4 11E00004 */  beqz  $t7, .L8024CBD8
/* 004BC8 8024CBC8 AC6F0000 */   sw    $t7, ($v1)
/* 004BCC 8024CBCC 3C048032 */  lui   $a0, %hi(D_SH_8031D8F0) # $a0, 0x8032
/* 004BD0 8024CBD0 0C0C0BBC */  jal   func_sh_80302EF0
/* 004BD4 8024CBD4 2484D8F0 */   addiu $a0, %lo(D_SH_8031D8F0) # addiu $a0, $a0, -0x2710
.L8024CBD8:
/* 004BD8 8024CBD8 3C028032 */  lui   $v0, %hi(D_SH_8031D998) # $v0, 0x8032
/* 004BDC 8024CBDC 2442D998 */  addiu $v0, %lo(D_SH_8031D998) # addiu $v0, $v0, -0x2668
/* 004BE0 8024CBE0 3C038032 */  lui   $v1, %hi(D_SH_8031D9B0) # $v1, 0x8032
/* 004BE4 8024CBE4 8FBF0014 */  lw    $ra, 0x14($sp)
/* 004BE8 8024CBE8 2463D9B0 */  addiu $v1, %lo(D_SH_8031D9B0) # addiu $v1, $v1, -0x2650
/* 004BEC 8024CBEC A0400000 */  sb    $zero, ($v0)
/* 004BF0 8024CBF0 A0400006 */  sb    $zero, 6($v0)
/* 004BF4 8024CBF4 A040000C */  sb    $zero, 0xc($v0)
/* 004BF8 8024CBF8 A4600004 */  sh    $zero, 4($v1)
/* 004BFC 8024CBFC A460000A */  sh    $zero, 0xa($v1)
/* 004C00 8024CC00 3C018031 */  lui   $at, %hi(D_SH_8030CE0C) # $at, 0x8031
/* 004C04 8024CC04 AC20CE0C */  sw    $zero, %lo(D_SH_8030CE0C)($at)
/* 004C08 8024CC08 03E00008 */  jr    $ra
/* 004C0C 8024CC0C 27BD0018 */   addiu $sp, $sp, 0x18

glabel create_thread_6
/* 004C10 8024CC10 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 004C14 8024CC14 AFBF001C */  sw    $ra, 0x1c($sp)
/* 004C18 8024CC18 3C048032 */  lui   $a0, %hi(D_SH_8031D980) # $a0, 0x8032
/* 004C1C 8024CC1C 3C058032 */  lui   $a1, %hi(D_SH_8031D978) # $a1, 0x8032
/* 004C20 8024CC20 24A5D978 */  addiu $a1, %lo(D_SH_8031D978) # addiu $a1, $a1, -0x2688
/* 004C24 8024CC24 2484D980 */  addiu $a0, %lo(D_SH_8031D980) # addiu $a0, $a0, -0x2680
/* 004C28 8024CC28 0C0C05A8 */  jal   osCreateMesgQueue
/* 004C2C 8024CC2C 24060001 */   li    $a2, 1
/* 004C30 8024CC30 3C0E8020 */  lui   $t6, %hi(D_SH_80203200) # $t6, 0x8020
/* 004C34 8024CC34 25CE3200 */  addiu $t6, %lo(D_SH_80203200) # addiu $t6, $t6, 0x3200
/* 004C38 8024CC38 3C048032 */  lui   $a0, %hi(D_SH_8031D740) # $a0, 0x8032
/* 004C3C 8024CC3C 3C068025 */  lui   $a2, %hi(Thread6) # $a2, 0x8025
/* 004C40 8024CC40 240F001E */  li    $t7, 30
/* 004C44 8024CC44 AFAF0014 */  sw    $t7, 0x14($sp)
/* 004C48 8024CC48 24C6CA2C */  addiu $a2, %lo(Thread6) # addiu $a2, $a2, -0x35d4
/* 004C4C 8024CC4C 2484D740 */  addiu $a0, %lo(D_SH_8031D740) # addiu $a0, $a0, -0x28c0
/* 004C50 8024CC50 AFAE0010 */  sw    $t6, 0x10($sp)
/* 004C54 8024CC54 24050006 */  li    $a1, 6
/* 004C58 8024CC58 0C0C05B4 */  jal   osCreateThread
/* 004C5C 8024CC5C 00003825 */   move  $a3, $zero
/* 004C60 8024CC60 3C048032 */  lui   $a0, %hi(D_SH_8031D740) # $a0, 0x8032
/* 004C64 8024CC64 0C0C0608 */  jal   osStartThread
/* 004C68 8024CC68 2484D740 */   addiu $a0, %lo(D_SH_8031D740) # addiu $a0, $a0, -0x28c0
/* 004C6C 8024CC6C 8FBF001C */  lw    $ra, 0x1c($sp)
/* 004C70 8024CC70 27BD0020 */  addiu $sp, $sp, 0x20
/* 004C74 8024CC74 03E00008 */  jr    $ra
/* 004C78 8024CC78 00000000 */   nop   

glabel func_sh_8024CC7C
/* 004C7C 8024CC7C 3C0E8031 */  lui   $t6, %hi(D_SH_8030CE00) # $t6, 0x8031
/* 004C80 8024CC80 8DCECE00 */  lw    $t6, %lo(D_SH_8030CE00)($t6)
/* 004C84 8024CC84 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 004C88 8024CC88 AFBF0014 */  sw    $ra, 0x14($sp)
/* 004C8C 8024CC8C 11C00006 */  beqz  $t6, .L8024CCA8
/* 004C90 8024CC90 3C048032 */   lui   $a0, %hi(D_SH_8031D980) # $a0, 0x8032
/* 004C94 8024CC94 3C055652 */  lui   $a1, (0x56525443 >> 16) # lui $a1, 0x5652
/* 004C98 8024CC98 34A55443 */  ori   $a1, (0x56525443 & 0xFFFF) # ori $a1, $a1, 0x5443
/* 004C9C 8024CC9C 2484D980 */  addiu $a0, %lo(D_SH_8031D980) # addiu $a0, $a0, -0x2680
/* 004CA0 8024CCA0 0C0C07A0 */  jal   osSendMesg
/* 004CA4 8024CCA4 00003025 */   move  $a2, $zero
.L8024CCA8:
/* 004CA8 8024CCA8 8FBF0014 */  lw    $ra, 0x14($sp)
/* 004CAC 8024CCAC 27BD0018 */  addiu $sp, $sp, 0x18
/* 004CB0 8024CCB0 03E00008 */  jr    $ra
/* 004CB4 8024CCB4 00000000 */   nop   

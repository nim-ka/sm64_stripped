# Super Mario 64 (J) disassembly and split file
# generated by n64split v0.4a - N64 ROM splitter

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "macros.inc"


.section .text, "ax"

# TODO: replace 2CEE0 with __bss1size

glabel EntryPoint
/* 001000 80246000 3C088034 */  lui   $t0, %hi(D_80339210) # $t0, 0x8034
/* 001004 80246004 3C090002 */  lui   $t1, (0x0002CEE0 >> 16) # lui $t1, 2
/* 001008 80246008 25089210 */  addiu $t0, %lo(D_80339210) # addiu $t0, $t0, -0x6df0
/* 00100C 8024600C 3529CEE0 */  ori   $t1, (0x0002CEE0 & 0xFFFF) # ori $t1, $t1, 0xcee0
.L80246010:
/* 001010 80246010 2129FFF8 */  addi  $t1, $t1, -8
/* 001014 80246014 AD000000 */  sw    $zero, ($t0)
/* 001018 80246018 AD000004 */  sw    $zero, 4($t0)
/* 00101C 8024601C 1520FFFC */  bnez  $t1, .L80246010
/* 001020 80246020 21080008 */   addi  $t0, $t0, 8
/* 001024 80246024 3C0A8024 */  lui   $t2, %hi(Main) # $t2, 0x8024
/* 001028 80246028 3C1D8020 */  lui   $sp, %hi(D_80200A00) # $sp, 0x8020
/* 00102C 8024602C 254A6DC4 */  addiu $t2, %lo(Main) # addiu $t2, $t2, 0x6dc4
/* 001030 80246030 01400008 */  jr    $t2
/* 001034 80246034 27BD0A00 */   addiu $sp, %lo(D_80200A00) # addiu $sp, $sp, 0xa00
/* 001038 80246038 00000000 */  nop   
/* 00103C 8024603C 00000000 */  nop   
/* 001040 80246040 00000000 */  nop   
/* 001044 80246044 00000000 */  nop   
/* 001048 80246048 00000000 */  nop   
/* 00104C 8024604C 00000000 */  nop 

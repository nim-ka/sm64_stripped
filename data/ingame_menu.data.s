.include "macros.inc"
.include "globals.inc"

.section .data

#ingame menu
glabel D_80330410
	.incbin "bin/sm64.j.0EADAC.bin", 0x664, 0xC

glabel D_8033041C
	.incbin "bin/sm64.j.0EADAC.bin", 0x670, 0x4

glabel D_80330420
	.incbin "bin/sm64.j.0EADAC.bin", 0x674, 0x4

glabel D_80330424
	.incbin "bin/sm64.j.0EADAC.bin", 0x678, 0x4

glabel D_80330428
	.incbin "bin/sm64.j.0EADAC.bin", 0x67C, 0x4

glabel D_8033042C
	.incbin "bin/sm64.j.0EADAC.bin", 0x680, 0x4

glabel D_80330430
	.incbin "bin/sm64.j.0EADAC.bin", 0x684, 0x4

glabel D_80330434
	.incbin "bin/sm64.j.0EADAC.bin", 0x688, 0x4

glabel D_80330438
	.incbin "bin/sm64.j.0EADAC.bin", 0x68C, 0x4

glabel D_8033043C
	.incbin "bin/sm64.j.0EADAC.bin", 0x690, 0x4

glabel D_80330440
	.incbin "bin/sm64.j.0EADAC.bin", 0x694, 0x4

glabel D_80330444
	.incbin "bin/sm64.j.0EADAC.bin", 0x698, 0x4

glabel D_80330448
	.incbin "bin/sm64.j.0EADAC.bin", 0x69C, 0x4

glabel D_8033044C
	.incbin "bin/sm64.j.0EADAC.bin", 0x6A0, 0x4

glabel D_80330450
	.incbin "bin/sm64.j.0EADAC.bin", 0x6A4, 0x4

glabel D_80330454
	.incbin "bin/sm64.j.0EADAC.bin", 0x6A8, 0xC

glabel D_80330460
	.incbin "bin/sm64.j.0EADAC.bin", 0x6B4, 0x8

glabel D_80330468
	.incbin "bin/sm64.j.0EADAC.bin", 0x6BC, 0xC

glabel D_80330474
	.incbin "bin/sm64.j.0EADAC.bin", 0x6C8, 0x8

glabel D_8033047C
	.incbin "bin/sm64.j.0EADAC.bin", 0x6D0, 0xA4

glabel D_80330520
	.incbin "bin/sm64.j.0EADAC.bin", 0x774, 0x4

glabel D_80330524
	.incbin "bin/sm64.j.0EADAC.bin", 0x778, 0x4

glabel D_80330528
	.incbin "bin/sm64.j.0EADAC.bin", 0x77C, 0x4

glabel D_8033052C
	.incbin "bin/sm64.j.0EADAC.bin", 0x780, 0x4

glabel D_80330530
	.incbin "bin/sm64.j.0EADAC.bin", 0x784, 0x4

glabel D_80330534
	.incbin "bin/sm64.j.0EADAC.bin", 0x788, 0x4

glabel D_80330538
	.incbin "bin/sm64.j.0EADAC.bin", 0x78C, 0x4

glabel D_8033053C
	.incbin "bin/sm64.j.0EADAC.bin", 0x790, 0x8

glabel D_80330544
	.incbin "bin/sm64.j.0EADAC.bin", 0x798, 0x4

glabel D_80330548
	.incbin "bin/sm64.j.0EADAC.bin", 0x79C, 0x4

glabel D_8033054C
	.incbin "bin/sm64.j.0EADAC.bin", 0x7A0, 0xC

glabel D_80330558
	.incbin "bin/sm64.j.0EADAC.bin", 0x7AC, 0x10

glabel D_80330568
	.incbin "bin/sm64.j.0EADAC.bin", 0x7BC, 0xC

glabel D_80330574
	.incbin "bin/sm64.j.0EADAC.bin", 0x7C8, 0xC

glabel D_80330580
	.incbin "bin/sm64.j.0EADAC.bin", 0x7D4, 0x10

glabel D_80330590
	.incbin "bin/sm64.j.0EADAC.bin", 0x7E4, 0xC

glabel D_8033059C
	.incbin "bin/sm64.j.0EADAC.bin", 0x7F0, 0x10

glabel D_803305AC
	.incbin "bin/sm64.j.0EADAC.bin", 0x800, 0x8

glabel D_803305B4
	.incbin "bin/sm64.j.0EADAC.bin", 0x808, 0x4

glabel D_803305B8
	.incbin "bin/sm64.j.0EADAC.bin", 0x80C, 0x4

glabel D_803305BC
	.incbin "bin/sm64.j.0EADAC.bin", 0x810, 0x4

glabel D_803305C0
	.incbin "bin/sm64.j.0EADAC.bin", 0x814, 0x4

glabel D_803305C4
	.incbin "bin/sm64.j.0EADAC.bin", 0x818, 0x4

glabel D_803305C8
	.incbin "bin/sm64.j.0EADAC.bin", 0x81C, 0x4

glabel D_803305CC
	.incbin "bin/sm64.j.0EADAC.bin", 0x820, 0x4

glabel D_803305D0
	.incbin "bin/sm64.j.0EADAC.bin", 0x824, 0x8

glabel D_803305D8
	.incbin "bin/sm64.j.0EADAC.bin", 0x82C, 0x10

glabel D_803305E8
	.incbin "bin/sm64.j.0EADAC.bin", 0x83C, 0x4

glabel D_803305EC
	.incbin "bin/sm64.j.0EADAC.bin", 0x840, 0x4

glabel D_803305F0
	.incbin "bin/sm64.j.0EADAC.bin", 0x844, 0x4

glabel D_803305F4
	.incbin "bin/sm64.j.0EADAC.bin", 0x848, 0x4

glabel D_803305F8
	.incbin "bin/sm64.j.0EADAC.bin", 0x84C, 0x8

glabel D_80330600
	.incbin "bin/sm64.j.0EADAC.bin", 0x854, 0x8

glabel D_80330608
	.incbin "bin/sm64.j.0EADAC.bin", 0x85C, 0x10

glabel D_80330618
	.incbin "bin/sm64.j.0EADAC.bin", 0x86C, 0xC

glabel D_80330624
	.incbin "bin/sm64.j.0EADAC.bin", 0x878, 0x1C

glabel D_80330640
	.incbin "bin/sm64.j.0EADAC.bin", 0x894, 0x8

glabel D_80330648
	.incbin "bin/sm64.j.0EADAC.bin", 0x89C, 0x30

glabel D_80330678
	.incbin "bin/sm64.j.0EADAC.bin", 0x8CC, 0x8

glabel D_80330680
	.incbin "bin/sm64.j.0EADAC.bin", 0x8D4, 0x8

glabel D_80330688
	.incbin "bin/sm64.j.0EADAC.bin", 0x8DC, 0x10

glabel D_80330698
	.incbin "bin/sm64.j.0EADAC.bin", 0x8EC, 0xBA8
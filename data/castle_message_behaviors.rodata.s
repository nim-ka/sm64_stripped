.include "macros.inc"


.section .rodata

#castle message behaviors
glabel jtbl_80335DA0
	.word L802762F8
	.word L80276308
	.word L80276318
	.word L80276328
	.word L80276338

glabel D_80335DB4
	.incbin "bin/rodata.bin", 0x1344, 0x4

glabel D_80335DB8
	.incbin "bin/rodata.bin", 0x1348, 0x8

glabel D_80335DC0
	.incbin "bin/rodata.bin", 0x1350, 0x8

glabel D_80335DC8
	.incbin "bin/rodata.bin", 0x1358, 0x8

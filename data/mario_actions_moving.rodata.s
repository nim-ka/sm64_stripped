.include "macros.inc"
.include "globals.inc"

.section .rodata

#mario actions moving
glabel D_803358E0
	.incbin "bin/rodata.bin", 0xE70, 0x4

glabel D_803358E4
	.incbin "bin/rodata.bin", 0xE74, 0x4

glabel D_803358E8
	.incbin "bin/rodata.bin", 0xE78, 0x4

glabel D_803358EC
	.incbin "bin/rodata.bin", 0xE7C, 0x4

glabel D_803358F0
	.incbin "bin/rodata.bin", 0xE80, 0x4

glabel D_803358F4
	.incbin "bin/rodata.bin", 0xE84, 0x4

glabel D_803358F8
	.incbin "bin/rodata.bin", 0xE88, 0x4

glabel D_803358FC
	.incbin "bin/rodata.bin", 0xE8C, 0xC

glabel D_80335908
	.incbin "bin/rodata.bin", 0xE98, 0x4

glabel D_8033590C
	.incbin "bin/rodata.bin", 0xE9C, 0x8

glabel D_80335914
	.incbin "bin/rodata.bin", 0xEA4, 0x4

glabel D_80335918
	.incbin "bin/rodata.bin", 0xEA8, 0x4

glabel D_8033591C
	.incbin "bin/rodata.bin", 0xEAC, 0xC

glabel D_80335928
	.incbin "bin/rodata.bin", 0xEB8, 0x4

glabel D_8033592C
	.incbin "bin/rodata.bin", 0xEBC, 0x4

glabel D_80335930
	.incbin "bin/rodata.bin", 0xEC0, 0x4

glabel D_80335934
	.incbin "bin/rodata.bin", 0xEC4, 0x4

glabel D_80335938
	.incbin "bin/rodata.bin", 0xEC8, 0x4

glabel D_8033593C
	.incbin "bin/rodata.bin", 0xECC, 0x4

glabel D_80335940
	.incbin "bin/rodata.bin", 0xED0, 0x4

glabel D_80335944
	.incbin "bin/rodata.bin", 0xED4, 0x4

glabel D_80335948
	.incbin "bin/rodata.bin", 0xED8, 0x4

glabel D_8033594C
	.incbin "bin/rodata.bin", 0xEDC, 0x4

glabel D_80335950
	.incbin "bin/rodata.bin", 0xEE0, 0x10

glabel D_80335960
	.incbin "bin/rodata.bin", 0xEF0, 0x4

glabel D_80335964
	.incbin "bin/rodata.bin", 0xEF4, 0x4

glabel D_80335968
	.incbin "bin/rodata.bin", 0xEF8, 0x4

glabel jtbl_8033596C
	.incbin "bin/rodata.bin", 0xEFC, 0x2C

glabel jtbl_80335998
	.incbin "bin/rodata.bin", 0xF28, 0x7C

glabel jtbl_80335A14
	.incbin "bin/rodata.bin", 0xFA4, 0x18

glabel jtbl_80335A2C
	.incbin "bin/rodata.bin", 0xFBC, 0x34
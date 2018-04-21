.include "macros.inc"
.include "globals.inc"

.section .data

    .incbin "bin/sm64.j.0E8090.bin", 0x20, 0x8

glabel D_8032D0B8
	.incbin "bin/sm64.j.0E8090.bin", 0x28, 0x38

glabel D_8032D0F0
	.incbin "bin/sm64.j.0E8090.bin", 0x60, 0x48

glabel TableCameraSL
.word 0x01000000, CameraSL00, 0x045F0E00, 0x04650499, 0x01660166, 0xE2D90000
.word 0x01000000, CameraSL01, 0x045F0E00, 0x04651000, 0x10001000, 0xE2D90000
.word 0x00000000, NULL, 0x00000000, 0x00000000, 0x00000000, 0x00000000

glabel TableCameraTHI
.word 0x01000000, CameraTHI00, 0xEDFFF467, 0x19300064, 0x012C012C, 0x00000000
.word 0x01000000, CameraTHI01, 0xED37F467, 0x19300064, 0x012C012C, 0x00000000
.word 0x00000000, NULL, 0x00000000, 0x00000000, 0x00000000, 0x00000000

glabel TableCameraHMC
.word 0x01000000, CameraHMC00, 0x07CC0066, 0x000000CD, 0x006400CD, 0x00000000
.word 0x01000000, CameraHMC01, 0x0D16EDAF, 0x12C00258, 0x00320258, 0x00000000
.word 0x01000000, CameraHMC02, 0xF33204D4, 0x05630166, 0x00C80166, 0x00000000
.word 0x01000000, CameraHMC03, 0xF5000807, 0xF6000166, 0x00C80166, 0x00000000
.word 0x01000000, CameraHMC04, 0xF2340607, 0xE4800166, 0x00C80166, 0x00000000
.word 0x01000000, CameraHMC05, 0xFC340607, 0xE34D0166, 0x00C80166, 0x00000000
.word 0x00000000, NULL, 0x00000000, 0x00000000, 0x00000000, 0x00000000

glabel TableCameraSSL
.word 0x01000000, CameraSSL00, 0xF8000438, 0xFC000096, 0x00960096, 0x00000000
.word 0x02000000, CameraSSL0102, 0x0000FF98, 0xFF9804E0, 0x06000B86, 0x00000000
.word 0x02000000, CameraSSL0102, 0x000009C4, 0x01000203, 0x13880203, 0x00000000
.word 0x03000000, CameraSSL03, 0x0000FA02, 0xF80803E8, 0x032003E8, 0x00000000
.word 0x00000000, NULL, 0x00000000, 0x00000000, 0x00000000, 0x00000000

glabel TableCameraRR
.word 0x01000000, CameraRR00, 0xEF9B0EEB, 0xF3F106E9, 0x05D20156, 0x00000000
.word 0x01000000, CameraRR01, 0xEF9B0EEB, 0xF1450301, 0x01EA0156, 0x00000000
.word 0x01000000, CameraRR02, 0xEA1D12E2, 0xEBA7012C, 0x0258024F, 0x00000000
.word 0x01000000, CameraRR0305, 0xF5CF0E92, 0xEAA9012C, 0x028A0241, 0x00000000
.word 0x01000000, CameraRR04, 0xEF9C1CAF, 0xEBDD1194, 0x03E81194, 0x00000000
.word 0x01000000, CameraRR0305, 0xEF9C179B, 0xEBDD01F4, 0x012C01F4, 0x00000000
.word 0x00000000, NULL, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x01000000, CameraRR07, 0x09A40AA0, 0xEE000CBF, 0x06A00C00, 0x00000000
.word 0xFF000000, CameraRR08, 0x00000000, 0x00000000, 0x00000000, 0x00000000
.word 0x00000000, NULL, 0x00000000, 0x00000000, 0x00000000, 0x00000000

glabel TableCameraMetal
.word 0x01000000, CameraMetal00, 0x000005DC, 0x0DAC0226, 0x271005DC, 0x00000000
.word 0x00000000, NULL, 0x00000000, 0x00000000, 0x00000000, 0x00000000

glabel TableCameraCCM
.word 0x02000000, CameraCCM00, 0xED12080D, 0x001B04CD, 0x053E018C, 0x00000000
.word 0x02000000, CameraCCM01, 0xE6F4F0B3, 0xE79A0133, 0x00B90084, 0x00000000
.word 0x00000000, NULL, 0x00000000, 0x00000000, 0x00000000, 0x00000000

glabel TableCameraInside
.word 0x01000000, CameraInside00, 0xFBB40291, 0xFABE012C, 0x0096012C, 0x00000000
.word 0x01000000, CameraInside01, 0xFBB50291, 0xFCDD012C, 0x0096012C, 0x00000000
.word 0x01000000, CameraInside00, 0xF700FEF8, 0xF018008C, 0x0096008C, 0x00000000
.word 0x01000000, CameraInside00, 0xF7000091, 0xFAC0008C, 0x0096008C, 0x00000000
.word 0x01000000, CameraInside01, 0xF7000091, 0xFCDE008C, 0x0096008C, 0x00000000
.word 0x01000000, CameraInside00, 0x0B0004B0, 0xFF000064, 0x00640064, 0x00000000
.word 0x01000000, CameraInside00, 0x0100FF5F, 0xEF7E008C, 0x0096008C, 0x00000000
.word 0x01000000, CameraInside00, 0x01000091, 0xFAC0008C, 0x0096008C, 0x00000000
.word 0x01000000, CameraInside01, 0x01000091, 0xFCDE008C, 0x0096008C, 0x00000000
.word 0x01000000, CameraInside00, 0xFC01002C, 0xECFA008C, 0x0096008C, 0x00000000
.word 0x01000000, CameraInside00, 0xFE350091, 0xFC04008C, 0x0096008C, 0x60000000
.word 0x01000000, CameraInside01, 0xFFAB0091, 0xFD8D008C, 0x0096008C, 0x00000000
.word 0x01000000, CameraInside00, 0xF9CB0091, 0xFC04008C, 0x0096008C, 0xA0000000
.word 0x01000000, CameraInside01, 0xF8550091, 0xFD8D008C, 0x0096008C, 0x00000000
.word 0x01000000, CameraInside0E, 0xF4EA0291, 0xF98500C8, 0x00960096, 0x20000000
.word 0x01000000, CameraInside0F, 0xF6F10200, 0xFB0E012C, 0x0096012C, 0x20000000
.word 0x01000000, CameraInside00, 0x034C02F7, 0xF9870028, 0x00960028, 0xE0000000
.word 0x01000000, CameraInside01, 0x01BA02F7, 0xFAF4008C, 0x0096008C, 0xE0000000
.word 0x02000000, CameraInside1213, 0xFC180291, 0x06CC00C8, 0x012C00C8, 0x00000000
.word 0x02000000, CameraInside1213, 0xFC1C0544, 0x071600C8, 0x012C00C8, 0x00000000
.word 0x02000000, CameraInside00, 0xFC4E0291, 0x0AA10032, 0x00960032, 0x00000000
.word 0x02000000, CameraInside00, 0xFC1C0544, 0x038B0032, 0x00960032, 0x00000000
.word 0x02000000, CameraInside00, 0xFC1B0544, 0x05AA008C, 0x0096008C, 0x00000000
.word 0x01000000, CameraInside00, 0xECB201C4, 0xFE33008C, 0x0096008C, 0x40000000
.word 0x01000000, CameraInside00, 0xF2BF015E, 0xFCE7008C, 0x0096008C, 0x40000000
.word 0x01000000, CameraInside01, 0xF4DD015E, 0xFCE8008C, 0x0096008C, 0x40000000
.word 0x01000000, CameraInside01, 0x0323015E, 0xFF1C008C, 0x0096008C, 0xC0000000
.word 0x01000000, CameraInside01, 0x0323015E, 0xFF1C008C, 0x0096008C, 0xC0000000
.word 0x01000000, CameraInside00, 0x0541015E, 0xFF1B008C, 0x0096008C, 0x40000000
.word 0x01000000, CameraInside00, 0xFC4EFC5F, 0x026E012C, 0x0096012C, 0x00000000
.word 0x02000000, CameraInside1E, 0xFF3305B0, 0x09CC00D2, 0x03A002CE, 0x00000000
.word 0x01000000, CameraInside1F, 0xFBFDFDB5, 0xFD32013E, 0x01E60241, 0x00000000
.word 0x01000000, CameraInside20, 0xFC010178, 0x0726012C, 0x0190012C, 0x00000000
.word 0x03000000, CameraHMC01, 0x09B5F967, 0xF59D0258, 0x00320258, 0x00000000
.word 0x00000000, NULL, 0x00000000, 0x00000000, 0x00000000, 0x00000000

glabel TableCameraBBH
.word 0x01000000, CameraBBH00, 0x02E60000, 0x094100C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH01, 0x02E50000, 0x072300C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0x00DE0000, 0x05B200C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0x00DE0000, 0x027F00C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0x01B30000, 0x00DE00C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0x064D0000, 0x00DE00C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0x07230000, 0x05B300C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0xFE110333, 0x057F00C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0xFE110333, 0x028000FA, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0x00B30333, 0x00DE00C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0x064D0333, 0x00DE00C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0x07230333, 0x01E600C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0x07230333, 0x071A00C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH0D_OF, 0x09410000, 0x05B300C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH0D_OF, 0x0D1A0000, 0x054300C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH0D_OF, 0x0B330202, 0x07330200, 0x00660199, 0x00000000
.word 0x01000000, CameraBBH10_11, 0x0D1A0000, 0x032400C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH10_11, 0x064D0000, 0xFEC000C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH12, 0x01B30000, 0xFEC000C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH1314, 0xF81B0000, 0x032300C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH1314, 0xFEC00000, 0x028000C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH15, 0xFA000166, 0xFF0202CC, 0x016B0066, 0x00000000
.word 0x01000000, CameraBBH16, 0xFA000166, 0xFE3502CC, 0x016B0066, 0x00000000
.word 0x01000000, CameraBBH17, 0xF9E80000, 0xFADE00C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH18, 0xFEC00000, 0x05B300C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH18, 0xF81B0000, 0x054100C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH1A1B, 0x09410333, 0x01E600C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH1A1B, 0x094106CD, 0x01E600C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH1C, 0x0B3304CC, 0x049602CC, 0x019E0066, 0x00000000
.word 0x01000000, CameraBBH1D, 0x0B3304CC, 0x056202CC, 0x019E0066, 0x00000000
.word 0x01000000, CameraBBH1E, 0x09410333, 0x071A00C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH1F20, 0x072506CD, 0x01E600C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH1F20, 0x02E506CD, 0x063300C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH21, 0x00660800, 0xFF410064, 0x01360133, 0x00000000
.word 0x01000000, CameraBBH22, 0x01990800, 0xFF410064, 0x01360133, 0x00000000
.word 0x01000000, CameraBBH23, 0x02E60782, 0x087400C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH24, 0x024B052A, 0x0A7503E8, 0x01900258, 0x00000000
.word 0x01000000, CameraBBH18, 0xFBF30333, 0x058000C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH18, 0xF84E0400, 0x054100C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH12, 0x00B30333, 0xFEC000C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH28, 0x064D0333, 0xFEC000C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH29, 0x083304CC, 0xFCCD0066, 0x019E02CC, 0x00000000
.word 0x01000000, CameraBBH2A, 0x090004CC, 0xFCCD0066, 0x019E02CC, 0x00000000
.word 0x01000000, CameraBBH2B2C, 0xFBF30333, 0x028000C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH2B2C, 0xF84E0400, 0x032300C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH02_0C, 0x07230333, 0x071A00C8, 0x00C800C8, 0x00000000
.word 0x01000000, CameraBBH2E2F, 0x0933FBA8, 0xFF3F04CC, 0x01F4053F, 0x00000000
.word 0x01000000, CameraBBH2E2F, 0x0933F941, 0x058204CC, 0x01F402C1, 0x00000000
.word 0x01000000, CameraBBH30_33, 0x0000F667, 0x072300FA, 0x00C800FA, 0x00000000
.word 0x01000000, CameraBBH30_33, 0x0000F667, 0x094100FA, 0x00C800FA, 0x00000000
.word 0x01000000, CameraBBH30_33, 0x0000F667, 0x134100FA, 0x00C800FA, 0x00000000
.word 0x01000000, CameraBBH30_33, 0x0000F667, 0x112300FA, 0x00C800FA, 0x00000000
.word 0x01000000, CameraBBH34, 0x075FF667, 0x00CC00FA, 0x00C800FA, 0x00000000
.word 0x01000000, CameraBBH3536, 0x04F8F667, 0x00CC00FA, 0x00C800FA, 0x00000000
.word 0x01000000, CameraBBH3536, 0xF96FF667, 0x00CC00FA, 0x00C800FA, 0x00000000
.word 0x01000000, CameraBBH34, 0xF708F667, 0x00CC00FA, 0x00C800FA, 0x00000000
.word 0x01000000, CameraBBH38, 0xF485FDA3, 0x14F70320, 0x00640320, 0x00000000
.word 0x01000000, CameraBBH393A, 0xF485FF33, 0x14F7012C, 0x0064012C, 0x00000000
.word 0x01000000, CameraBBH393A, 0xF6E4FF34, 0x126A00FA, 0x00C800FA, 0x60000000
.word 0x01000000, CameraBBH34, 0xF86DFF34, 0x10F400FA, 0x00C800FA, 0x60000000
.word 0x00000000, NULL, 0x00000000, 0x00000000, 0x00000000, 0x00000000

glabel TableLevelCinematicCamera
.word NULL
.word NULL
.word NULL
.word NULL
.word TableCameraBBH
.word TableCameraCCM
.word TableCameraInside
.word TableCameraHMC
.word TableCameraSSL
.word NULL
.word TableCameraSL
.word NULL
.word NULL
.word TableCameraTHI
.word NULL
.word TableCameraRR
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word TableCameraMetal
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL
.word NULL

# Unknown region 0E8DF0-0E9574 [784]
glabel D_8032DDF0
	.incbin "bin/sm64.j.0E8DF0.bin", 0x0, 0xB8

glabel D_8032DEA8
	.incbin "bin/sm64.j.0E8DF0.bin", 0xB8, 0xB8

glabel D_8032DF60
	.incbin "bin/sm64.j.0E8DF0.bin", 0x170, 0x70

glabel D_8032DFD0
	.incbin "bin/sm64.j.0E8DF0.bin", 0x1E0, 0x70

glabel D_8032E040
	.incbin "bin/sm64.j.0E8DF0.bin", 0x250, 0x50

glabel D_8032E090
	.incbin "bin/sm64.j.0E8DF0.bin", 0x2A0, 0x58

glabel D_8032E0E8
	.incbin "bin/sm64.j.0E8DF0.bin", 0x2F8, 0xA0

glabel D_8032E188
	.incbin "bin/sm64.j.0E8DF0.bin", 0x398, 0x48

glabel D_8032E1D0
	.incbin "bin/sm64.j.0E8DF0.bin", 0x3E0, 0x48

glabel D_8032E218
	.incbin "bin/sm64.j.0E8DF0.bin", 0x428, 0x40

glabel D_8032E258
	.incbin "bin/sm64.j.0E8DF0.bin", 0x468, 0x38

glabel D_8032E290
	.incbin "bin/sm64.j.0E8DF0.bin", 0x4A0, 0xC

glabel D_8032E29C
	.incbin "bin/sm64.j.0E8DF0.bin", 0x4AC, 0xC

glabel D_8032E2A8
	.incbin "bin/sm64.j.0E8DF0.bin", 0x4B8, 0xC

glabel D_8032E2B4
	.incbin "bin/sm64.j.0E8DF0.bin", 0x4C4, 0x118

glabel D_8032E3CC
	.incbin "bin/sm64.j.0E8DF0.bin", 0x5DC, 0x118

glabel D_8032E4E4
	.incbin "bin/sm64.j.0E8DF0.bin", 0x6F4, 0x48

glabel D_8032E52C
	.incbin "bin/sm64.j.0E8DF0.bin", 0x73C, 0x48

glabel TableCutScenePeachEnd
.word CutScenePeachEnd0, 0x00AA0000
.word CutScenePeachEnd1, 0x00460000
.word CutScenePeachEnd2, 0x004B0000
.word CutScenePeachEnd3, 0x01820000
.word CutScenePeachEnd4, 0x008B0000
.word CutScenePeachEnd5, 0x024E0000
.word CutScenePeachEnd6, 0x005F0000
.word CutScenePeachEnd7, 0x01A90000
.word CutScenePeachEnd8, 0x00EC0000
.word CutScenePeachEnd9, 0x00F50000
.word CutScenePeachEndA, 0x7FFF0000
.word CutScenePeachEndB, 0x00000000

glabel TableCutSceneGrandStar
.word CutSceneGrandStar0, 0x01680000
.word CutSceneGrandStar1, 0x7FFF0000

glabel TableCutScene0FTodo
.word CutScene0FTodo_0, 0x00010000
.word CutScene0FTodo_1, 0x7FFF0000

glabel TableCutSceneDoorWarp
.word CutSceneDoor0, 0x00010000
.word CutSceneDoorWarp1, 0x7FFF0000

glabel TableCutSceneEndWaving
.word CutSceneEndWaving, 0x7FFF0000

glabel TableCutSceneEndCredits
.word CutSceneCredits, 0x7FFF0000

glabel TableCutSceneDoor00
.word CutSceneDoor0, 0x00010000
.word CutSceneDoor1, 0x001E0000
.word CutSceneDoor2, 0x00010000
.word CutSceneDoor3, 0x00320000
.word CutSceneDoor4, 0x00000000

glabel TableCutSceneDoor01
.word CutSceneDoor0, 0x00010000
.word CutSceneDoor1, 0x00140000
.word CutSceneDoor2, 0x00010000
.word CutSceneDoor3, 0x00320000
.word CutSceneDoor4, 0x00000000

glabel TableCutSceneDoor0A
.word CutSceneDoor0, 0x00010000
.word CutSceneDoor1, 0x001E0000
.word CutSceneDoorAB_2, 0x7FFF0000

glabel TableCutSceneDoor0B
.word CutSceneDoor0, 0x00010000
.word CutSceneDoor1, 0x00140000
.word CutSceneDoorAB_2, 0x7FFF0000

glabel TableCutSceneEnterCannon
.word CutSceneEnterCannon0, 0x00010000
.word CutSceneEnterCannon1, 0x00790000
.word CutSceneEnterCannon2, 0x00000000

glabel TableCutSceneStarSpawn
.word CutSceneStarSpawn0, 0x7FFF0000
.word CutSceneStarSpawn1, 0x000F0000
.word CutSceneStarSpawn2, 0x00000000

glabel TableCutSceneSpecialStarSpawn
.word CutSceneSpecialStarSpawn0, 0x7FFF0000
.word CutSceneSpecialStarSpawn1, 0x00000000

glabel TableCutSceneEnterPainting
.word CutSceneEnterPainting, 0x7FFF0000

glabel TableCutSceneExitPaintingDeath
.word CutSceneExitPainting0, 0x00760000
.word CutSceneExitPainting1, 0x00000000

glabel TableCutSceneExitPaintingSuccess
.word CutSceneExitPainting0, 0x00B40000
.word CutSceneExitPainting1, 0x00000000

glabel TableCutScene11Todo
.word CutScene11Todo_0, 0x00010000
.word CutScene11Todo_1, 0x003C0000
.word CutSceneExitPainting1, 0x00000000

glabel TableCutSceneIntroPeach
.word CutSceneIntroPeach0, 0x7FFF0000
.word CutSceneIntroPeach1, 0x00230000
.word CutSceneIntroPeach2, 0x03340000
.word CutSceneIntroPeach3, 0x010E0000
.word CutSceneIntroPeach4, 0x7FFF0000

glabel TableCutScenePrepareCannon
.word CutScenePrepareCannon0, 0x00AA0000
.word CutScenePrepareCannon1, 0x00000000

glabel TableCutSceneExitWaterfall
.word CutSceneExitWaterfall0, 0x00340000
.word CutSceneFallCommon, 0x00000000

glabel TableCutSceneFallToCastleGrounds
.word CutSceneFallToCastleGrounds0, 0x00490000
.word CutSceneFallCommon, 0x00000000

glabel TableCutSceneEnterPyramidTop
.word CutSceneEnterPyramidTop0, 0x005A0000
.word CutSceneFallCommon, 0x00000000

glabel TableCutScene26Todo
.word CutScene26Todo_0, 0x7FFF0000
.word CutScene26Todo_1, 0x00960000
.word CutScene26Todo_2, 0x00000000

glabel TableCutSceneDeath1
.word CutSceneDeath1, 0x7FFF0000

glabel TableCutSceneEnterPool
.word CutSceneEnterPool0, 0x00640000
.word CutSceneFallCommon, 0x00000000

glabel TableCutSceneDeath2
.word CutSceneDeath2, 0x7FFF0000

glabel TableCutSceneBBHDeath
.word CutSceneBBHDeath, 0x7FFF0000

glabel TableCutSceneQuicksandDeath
.word CutSceneQuicksandDeath0, 0x7FFF0000
.word CutSceneQuicksandDeath0, 0x7FFF0000

glabel TableCutScene1ATodo
.word CutScene1ATodo, 0x7FFF0000

glabel TableCutSceneEnterBowserPlatform
.word CutSceneEnterBowserPlatform0, 0x00B40000
.word CutSceneEnterBowserPlatform1, 0x7FFF0000
.word CutSceneEnterBowserPlatform2, 0x00000000

glabel TableCutSceneStarDance1
.word CutSceneStarDance1, 0x7FFF0000

glabel TableCutSceneStarDance2
.word CutSceneStarDance2, 0x7FFF0000

glabel TableCutSceneStarDance3
.word CutSceneStarDance3, 0x7FFF0000

glabel TableCutSceneKeyDance
.word CutSceneKeyDance, 0x7FFF0000

glabel TableCutSceneCapSwitchPress
.word CutSceneCapSwitchPress, 0x7FFF0000

glabel TableCutSceneSlidingDoorOpen
.word CutSceneSlidingDoorsOpen0, 0x00320000
.word CutSceneSlidingDoubleDoorsOpen1, 0x00000000

glabel TableCutSceneUnlockKeyDoor
.word CutSceneUnlockKeyDoor0, 0x00C80000
.word CutSceneSlidingDoubleDoorsOpen1, 0x00000000

glabel TableCutSceneExitBowserSuccess
.word CutSceneExitBowserSuccess0, 0x00BE0000
.word CutSceneExitNonPainting1, 0x00000000

glabel TableCutScene1CTodo
.word CutScene1CTodo_0, 0x00780000
.word CutSceneExitNonPainting1, 0x00000000

glabel TableCutSceneBBHExitSuccess
.word CutSceneBBHExitSuccess0, 0x00A30000
.word CutSceneExitNonPainting1, 0x00000000

glabel TableCutSceneNonPaintingDeath
.word CutSceneNonPaintingDeath0, 0x00780000
.word CutSceneExitNonPainting1, 0x00000000

glabel TableCutSceneDialog
.word CutSceneDialog0, 0x7FFF0000
.word CutSceneDialog1, 0x000C0000
.word CutSceneDialog2, 0x00000000

glabel TableCutSceneReadMessage
.word CutSceneReadMessage0, 0x7FFF0000
.word CutSceneReadMessage1, 0x000F0000
.word CutSceneReadMessage2, 0x00000000

# Unknown region 0E98A4-0EA10C [868]
glabel D_8032E8A4
	.incbin "bin/sm64.j.0E98A4.bin", 0x0, 0x6C

glabel D_8032E910
	.incbin "bin/sm64.j.0E98A4.bin", 0x6C, 0x14

glabel D_8032E924
	.incbin "bin/sm64.j.0E98A4.bin", 0x80, 0x28

glabel D_8032E94C
	.incbin "bin/sm64.j.0E98A4.bin", 0xA8, 0x28

glabel D_8032E974
	.incbin "bin/sm64.j.0E98A4.bin", 0xD0, 0x28

glabel D_8032E99C
	.incbin "bin/sm64.j.0E98A4.bin", 0xF8, 0x28

glabel D_8032E9C4
	.incbin "bin/sm64.j.0E98A4.bin", 0x120, 0x28

glabel D_8032E9EC
	.incbin "bin/sm64.j.0E98A4.bin", 0x148, 0x28

glabel D_8032EA14
	.incbin "bin/sm64.j.0E98A4.bin", 0x170, 0x28

glabel D_8032EA3C
	.incbin "bin/sm64.j.0E98A4.bin", 0x198, 0x28

glabel D_8032EA64
	.incbin "bin/sm64.j.0E98A4.bin", 0x1C0, 0x20

glabel D_8032EA84
	.incbin "bin/sm64.j.0E98A4.bin", 0x1E0, 0x20

glabel D_8032EAA4
	.incbin "bin/sm64.j.0E98A4.bin", 0x200, 0x28

glabel D_8032EACC
	.incbin "bin/sm64.j.0E98A4.bin", 0x228, 0x28

glabel D_8032EAF4
	.incbin "bin/sm64.j.0E98A4.bin", 0x250, 0x18

glabel D_8032EB0C
	.incbin "bin/sm64.j.0E98A4.bin", 0x268, 0x18

glabel D_8032EB24
	.incbin "bin/sm64.j.0E98A4.bin", 0x280, 0x30

glabel D_8032EB54
	.incbin "bin/sm64.j.0E98A4.bin", 0x2B0, 0x30

glabel D_8032EB84
	.incbin "bin/sm64.j.0E98A4.bin", 0x2E0, 0x30

glabel D_8032EBB4
	.incbin "bin/sm64.j.0E98A4.bin", 0x310, 0x30

glabel D_8032EBE4
	.incbin "bin/sm64.j.0E98A4.bin", 0x340, 0x38

glabel D_8032EC1C
	.incbin "bin/sm64.j.0E98A4.bin", 0x378, 0x38

glabel D_8032EC54
	.incbin "bin/sm64.j.0E98A4.bin", 0x3B0, 0x20

glabel D_8032EC74
	.incbin "bin/sm64.j.0E98A4.bin", 0x3D0, 0x20

glabel D_8032EC94
	.incbin "bin/sm64.j.0E98A4.bin", 0x3F0, 0x20

glabel D_8032ECB4
	.incbin "bin/sm64.j.0E98A4.bin", 0x410, 0x20

glabel D_8032ECD4
	.incbin "bin/sm64.j.0E98A4.bin", 0x430, 0x30

glabel D_8032ED04
	.incbin "bin/sm64.j.0E98A4.bin", 0x460, 0x30

glabel D_8032ED34
	.incbin "bin/sm64.j.0E98A4.bin", 0x490, 0x38

glabel D_8032ED6C
	.incbin "bin/sm64.j.0E98A4.bin", 0x4C8, 0x38

glabel D_8032EDA4
	.incbin "bin/sm64.j.0E98A4.bin", 0x500, 0x20

glabel D_8032EDC4
	.incbin "bin/sm64.j.0E98A4.bin", 0x520, 0x20

glabel D_8032EDE4
	.incbin "bin/sm64.j.0E98A4.bin", 0x540, 0x20

glabel D_8032EE04
	.incbin "bin/sm64.j.0E98A4.bin", 0x560, 0x20

glabel D_8032EE24
	.incbin "bin/sm64.j.0E98A4.bin", 0x580, 0x28

glabel D_8032EE4C
	.incbin "bin/sm64.j.0E98A4.bin", 0x5A8, 0x28

glabel D_8032EE74
	.incbin "bin/sm64.j.0E98A4.bin", 0x5D0, 0x28

glabel D_8032EE9C
	.incbin "bin/sm64.j.0E98A4.bin", 0x5F8, 0x28

glabel D_8032EEC4
	.incbin "bin/sm64.j.0E98A4.bin", 0x620, 0x28

glabel D_8032EEEC
	.incbin "bin/sm64.j.0E98A4.bin", 0x648, 0x28

glabel D_8032EF14
	.incbin "bin/sm64.j.0E98A4.bin", 0x670, 0x20

glabel D_8032EF34
	.incbin "bin/sm64.j.0E98A4.bin", 0x690, 0x2C

#object list processor
glabel D_8032EF60
	.incbin "bin/sm64.j.0E98A4.bin", 0x6BC, 0xC

glabel D_8032EF6C
	.incbin "bin/sm64.j.0E98A4.bin", 0x6C8, 0x148

glabel D_8032F0B4
	.incbin "bin/sm64.j.0E98A4.bin", 0x810, 0x58

glabel TableMrIParticleActions
.word ActionMrIParticle0
.word ActionMrIParticle1

glabel TableMrIActions
.word ActionMrI0
.word ActionMrI1
.word ActionMrI2
.word ActionMrI3

glabel D_8032F124
# Unknown region 0EA124-0EA14C [28]
.byte 0x00, 0x00, 0x00, 0x08, 0x00, 0x02, 0x02, 0x05, 0x00, 0x50, 0x00, 0x96, 0x00, 0x00, 0x00, 0x00
.byte 0x00, 0x1E, 0xA4, 0x00, 0x28, 0x00, 0x14, 0x28, 0xFC, 0x1E, 0x00, 0x00, 0x41, 0xA0, 0x00, 0x00
.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0x0C, 0x00

glabel TableCapSwitchActions
.word ActionActivateCapSwitch0
.word ActionActivateCapSwitch1
.word ActionActivateCapSwitch2
.word ActionActivateCapSwitch3

glabel TableKingBobombActions
.word ActionKingBobomb0
.word ActionKingBobomb1
.word ActionKingBobomb2
.word ActionKingBobomb3
.word ActionKingBobomb4
.word ActionKingBobomb5
.word ActionKingBobomb6
.word ActionKingBobomb7
.word ActionKingBobomb8

glabel D_8032F180
# Unknown region 0EA180-0EA1E0 [60]
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x14, 0x50, 0x15, 0x80, 0x81
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.byte 0x00, 0x01, 0x0F, 0xFF, 0x50, 0x15, 0x80, 0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x21, 0xFF, 0x50, 0x15, 0x80, 0x81
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x0F, 0x50, 0x15, 0x80, 0x81

glabel TableOpenedCannonActions
.word ActionOpenedCannon0
.word ActionOpenedCannon1
.word ActionOpenedCannon2
.word ActionOpenedCannon3
.word ActionOpenedCannon4
.word ActionOpenedCannon5
.word ActionOpenedCannon6

# Unknown region 0EA1FC-0EA238 [3C]
.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x80, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
.byte 0x41, 0x20, 0x00, 0x00, 0x3F, 0x80, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x41, 0xA0, 0x00, 0x00
.byte 0x3F, 0x80, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x41, 0xA0, 0x00, 0x00, 0x3F, 0x80, 0x00, 0x00
.byte 0x08, 0x00, 0x00, 0x00, 0x41, 0x20, 0x00, 0x00, 0x3F, 0x80, 0x00, 0x00

glabel TableChuckyaActions
.word ActionChuckya0
.word ActionChuckya1
.word ActionChuckya2
.word ActionChuckya3

# Unknown region 0EA248-0EA2C4 [7C]
.byte 0x00, 0x00, 0x00, 0x64, 0x07, 0x00, 0xFD, 0x30, 0x07, 0xD0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x96
.byte 0x07, 0x01, 0x86, 0xB4, 0x03, 0xE8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x00
.byte 0x00, 0x50, 0x00, 0x32, 0x00, 0x00, 0x00, 0x00, 0x02, 0x14, 0x8E, 0x00, 0x28, 0x05, 0x1E, 0x14
.byte 0xFC, 0x1E, 0x00, 0x00, 0x43, 0xA5, 0x00, 0x00, 0x41, 0x20, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10
.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x64, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x6A
.byte 0x00, 0x00, 0xFF, 0xCE, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x96, 0xFF, 0xCE, 0x00, 0x64
.byte 0xFF, 0x9C, 0x00, 0x32, 0x00, 0x32, 0x00, 0x64, 0x00, 0x64, 0x00, 0x32

glabel TableCoinInsideBooActions
.word ActionCoinInsideBoo0
.word ActionCoinInsideBoo1

# Unknown region 0EA2CC-0EA338 [6C]
.byte 0xD0, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0xDE, 0x67, 0x21, 0x99, 0x21, 0x99, 0x21, 0x99
.byte 0xDE, 0x67, 0xDE, 0x67, 0x21, 0x99, 0xDE, 0x67, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.byte 0x20, 0x00, 0x00, 0x00, 0xE9, 0x9A, 0x16, 0x66, 0x16, 0x66, 0x16, 0x66, 0xE9, 0x9A, 0xE9, 0x9A
.byte 0x16, 0x66, 0xE9, 0x9A, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x08, 0x00, 0x00
.byte 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00
.byte 0x00, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x30, 0x04, 0xC0, 0x81
.byte 0x30, 0x06, 0xC0, 0x81, 0x30, 0x05, 0xC0, 0x81, 0x30, 0x07, 0xC0, 0x81

glabel TableGrindelThwompActions
.word ActionGrindelThwomp0
.word ActionGrindelThwomp1
.word ActionGrindelThwomp2
.word ActionGrindelThwomp3
.word ActionGrindelThwomp4

glabel D_8032F34C
# Unknown region 0EA34C-0EA37C [30]
.byte 0x00, 0x09, 0xFE, 0x00, 0x00, 0x80, 0x00, 0xB0, 0x07, 0x00, 0xFA, 0xEC, 0x00, 0x09, 0xFE, 0x64
.byte 0x00, 0x67, 0x00, 0x38, 0x07, 0x02, 0x6B, 0x1C, 0x00, 0x09, 0xFE, 0x00, 0x00, 0x80, 0x00, 0x3C
.byte 0x07, 0x01, 0xD2, 0x1C, 0x00, 0x09, 0xFE, 0x00, 0x00, 0x80, 0x00, 0x40, 0x07, 0x01, 0x52, 0x88

glabel TableTumblingBridgeActions
.word ActionTumblingBridge0
.word ActionTumblingBridge1
.word ActionTumblingBridge2
.word ActionTumblingBridge3

# Unknown region 0EA38C-0EA3B8 [2C]
.byte 0xFF, 0xCD, 0x00, 0x00, 0x00, 0x00, 0xFE, 0x33, 0x00, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0xF5, 0xCD, 0x00, 0x00, 0x00, 0x00, 0xF6, 0xC8, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD6
.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xCE, 0x07, 0x99, 0x00, 0x01, 0x00, 0x00

glabel TableElevatorActions
.word ActionElevator0
.word ActionElevator1
.word ActionElevator2
.word ActionElevator3
.word ActionElevator4

glabel D_8032F3CC
# Unknown region 0EA3CC-0EA410 [44]
.byte 0x03, 0x14, 0x8E, 0x14, 0x0A, 0x05, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x41, 0xF0, 0x00, 0x00
.byte 0x3F, 0xC0, 0x00, 0x00, 0x00, 0x05, 0x9F, 0x00, 0x00, 0x14, 0x14, 0x00, 0xFC, 0x1E, 0x00, 0x00
.byte 0x40, 0xA0, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x02, 0xFF, 0xF8, 0x00, 0x01, 0x00, 0x04
.byte 0x00, 0x05, 0x9E, 0x00, 0x00, 0x14, 0x14, 0x00, 0xFC, 0x1E, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
.byte 0x40, 0x00, 0x00, 0x00

glabel TableLittleCageActions
.word ActionLittleCage0
.word ActionLittleCage1
.word ActionLittleCage2
.word ActionLittleCage3

glabel D_8032F420
# Unknown region 0EA420-0EA488 [68]
.byte 0x3F, 0xF3, 0x33, 0x33, 0x40, 0x19, 0x99, 0x9A, 0x40, 0x80, 0x00, 0x00, 0x40, 0x99, 0x99, 0x9A
.byte 0x00, 0x00, 0x80, 0x00, 0x00, 0x02, 0x01, 0x03, 0x00, 0x5A, 0x00, 0x50, 0x00, 0x50, 0x00, 0x46
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0xDC, 0x01, 0x2C, 0x00, 0xDC, 0x01, 0x2C
.byte 0x00, 0x00, 0x02, 0x00, 0x14, 0x00, 0x01, 0x00, 0x00, 0x96, 0x00, 0xC8, 0x00, 0x96, 0x00, 0xC8
.byte 0x00, 0x1E, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x01, 0x00, 0x34, 0x00, 0x00, 0x00, 0x40, 0x00, 0x01
.byte 0x00, 0x4A, 0x00, 0x00, 0x00, 0x56, 0x00, 0x01, 0x00, 0x60, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x01
.byte 0x00, 0x76, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00

glabel TableHeaveHoActions
.word ActionHeaveHo0
.word ActionHeaveHo1
.word ActionHeaveHo2
.word ActionHeaveHo3

glabel D_8032F498
# Unknown region 0EA498-0EA4A8 [10]
.byte 0x00, 0x00, 0x00, 0x02, 0x14, 0x00, 0x01, 0x05, 0x00, 0x96, 0x00, 0xFA, 0x00, 0x96, 0x00, 0xFA

glabel TableJumpingBoxActions
.word ActionJumpingBox0
.word ActionJumpingBox1

glabel D_8032F4B0
# Unknown region 0EA4B0-0EA4C0 [10]
.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x01, 0x2C, 0x00, 0x00, 0x00, 0x00

glabel TableBetaBooKeyInsideActions
.word ActionBetaBooKeyInside0
.word ActionBetaBooKeyInside1
.word ActionBetaBooKeyInside2

glabel D_8032F4CC
# Unknown region 0EA4CC-0EA4DC [10]
.byte 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x64, 0x00, 0xA0, 0x00, 0x64

glabel TableBulletBillActions
.word ActionBulletBill0
.word ActionBulletBill1
.word ActionBulletBill2
.word ActionBulletBill3
.word ActionBulletBill4

glabel TableBowserTailAnchorActions
.word ActionBowserTailAnchor0
.word ActionBowserTailAnchor1
.word ActionBowserTailAnchor2

# Unknown region 0EA4FC-0EA568 [6C]
.byte 0x07, 0x08, 0x09, 0x0C, 0x0D, 0x0E, 0x0F, 0x04, 0x03, 0x10, 0x11, 0x13, 0x03, 0x03, 0x03, 0x03
.byte 0x00, 0x3C, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x18, 0x2A, 0x3C, 0xFF, 0x00, 0x77, 0x00, 0x78
.byte 0x00, 0x79, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0A, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4A
.byte 0xFF, 0xFF, 0xFF, 0xF6, 0x00, 0x72, 0x00, 0x01, 0xFF, 0xEC, 0x00, 0x86, 0xFF, 0xFF, 0x00, 0x14
.byte 0x00, 0x9A, 0x00, 0x01, 0x00, 0x28, 0x00, 0xA4, 0xFF, 0xFF, 0xFF, 0xD8, 0x00, 0xAE, 0x00, 0x01
.byte 0xFF, 0xB0, 0x00, 0xB3, 0xFF, 0xFF, 0x00, 0x50, 0x00, 0xB8, 0x00, 0x01, 0x00, 0xA0, 0x00, 0xBA
.byte 0xFF, 0xFF, 0xFF, 0x60, 0x00, 0xBA, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00

glabel TableBowserActions
.word ActionBowser0
.word ActionBowser1
.word ActionBowser2
.word ActionBowser3
.word ActionBowser4
.word ActionBowser5
.word ActionBowser6
.word ActionBowser7
.word ActionBowser8
.word ActionBowser9
.word ActionBowser10
.word ActionBowser11
.word ActionBowser12
.word ActionBowser13
.word ActionBowser14
.word ActionBowser15
.word ActionBowser16
.word ActionBowser17
.word ActionBowser18
.word ActionBowser19

# Unknown region 0EA5B8-0EA71C [164]
glabel D_8032F5B8
    .incbin "bin/sm64.j.0EA5B8.bin"

glabel TableFallingBowserPlatformActions
.word ActionFallingBowserPlatform0
.word ActionFallingBowserPlatform1
.word ActionFallingBowserPlatform2

# Unknown region 0EA728-0EA840 [118]
glabel D_8032F728
	.incbin "bin/sm64.j.0EA728.bin", 0x0, 0x10

glabel D_8032F738
	.incbin "bin/sm64.j.0EA728.bin", 0x10, 0x1C

glabel D_8032F754
	.incbin "bin/sm64.j.0EA728.bin", 0x2C, 0x28

glabel D_8032F77C
	.incbin "bin/sm64.j.0EA728.bin", 0x54, 0x5C

glabel D_8032F7D8
	.incbin "bin/sm64.j.0EA728.bin", 0xB0, 0x68

glabel TableUkikiOpenCageActions
.word ActionUkikiOpenCage0
.word ActionUkikiOpenCage1
.word ActionUkikiOpenCage2
.word ActionUkikiOpenCage3
.word ActionUkikiOpenCage4
.word ActionUkikiOpenCage5
.word ActionUkikiOpenCage6
.word ActionUkikiOpenCage7

# Unknown region 0EA860-0EA8D0 [70]
.byte 0x00, 0x02, 0x00, 0x1E, 0x40, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0xDC, 0x03, 0x84, 0x00, 0x1E
.byte 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0xFF, 0xE2, 0x00, 0x02, 0x00, 0x1E, 0xC0, 0x00, 0x00, 0x00
.byte 0x00, 0x01, 0x00, 0xDC, 0x03, 0x84, 0x00, 0x1E, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0xFF, 0xE2
.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0xDB
.byte 0x03, 0x84, 0x00, 0x1E, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0xFF, 0xE2, 0x00, 0x02, 0x00, 0x1E
.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0xDB, 0x03, 0x84, 0x00, 0x1E, 0x00, 0x01, 0x00, 0x1E
.byte 0x00, 0x00, 0xFF, 0xE2, 0x00, 0x03, 0x00, 0x00, 0x80, 0x32, 0xF8, 0x60, 0x80, 0x32, 0xF8, 0x94

glabel TableRotatingCwFireBarsActions
.word ActionRotatingCwFireBars0
.word ActionRotatingCwFireBars1
.word ActionRotatingCwFireBars2
.word ActionRotatingCwFireBars3

# Unknown region 0EA8E0-0EA978 [98]
glabel D_8032F8E0
    .incbin "bin/sm64.j.0EA8E0.bin"

glabel TableToxBoxActions
.word ActionToxBox0
.word ActionToxBox1
.word ActionToxBox2
.word ActionToxBox3
.word ActionToxBox4
.word ActionToxBox5
.word ActionToxBox6
.word ActionToxBox7

glabel D_8032F998
# Unknown region 0EA998-0EA9A0 [8]
.byte 0x0C, 0x1C, 0x32, 0x40, 0xFF, 0x00, 0x00, 0x00

glabel TablePiranhaPlantActions
.word ActionPiranhaPlant20
.word ActionPiranhaPlant21
.word ActionPiranhaPlant22
.word ActionPiranhaPlant23
.word ActionPiranhaPlant24
.word ActionPiranhaPlant25
.word ActionPiranhaPlant26
.word ActionPiranhaPlant27
.word ActionPiranhaPlant28

# Unknown region 0EA9C4-0EABBC [1F8]
	.incbin "bin/sm64.j.0EA9C4.bin", 0x0, 0x188

glabel D_8032FB4C
	.incbin "bin/sm64.j.0EA9C4.bin", 0x188, 0x70

glabel TableBowserPuzzlePieceActions
.word ActionBowserPuzzlePiece0
.word ActionBowserPuzzlePiece1
.word ActionBowserPuzzlePiece2
.word ActionBowserPuzzlePiece3
.word ActionBowserPuzzlePiece4
.word ActionBowserPuzzlePiece5
.word ActionBowserPuzzlePiece6

glabel TableTuxiesMotherActions
.word ActionTuxiesMother0
.word ActionTuxiesMother1
.word ActionTuxiesMother2

glabel TableSmallPenguinActions
.word ActionSmallPenguin0
.word ActionSmallPenguin1
.word ActionSmallPenguin2
.word ActionSmallPenguin3
.word ActionSmallPenguin4
.word ActionSmallPenguin5

glabel TableFishActions
.word ActionFish0
.word ActionFish1
.word ActionFish2

glabel TableFishGroupActions
.word ActionFishGroup0
.word ActionFishGroup1
.word ActionFishGroup2

glabel TableBirdChirpChirpActions
.word ActionBirdChirpChirp0
.word ActionBirdChirpChirp1
.word ActionBirdChirpChirp2
.word ActionBirdChirpChirp3

glabel TableCheepCheepActions
.word ActionCheepCheep0
.word ActionCheepCheep1
.word ActionCheepCheep2

# Unknown region 0EAC30-0EACC0 [90]
glabel D_8032FC30
	.incbin "bin/sm64.j.0EAC30.bin", 0x0, 0x10

glabel D_8032FC40
	.incbin "bin/sm64.j.0EAC30.bin", 0x10, 0x80

glabel TableExclamationBoxActions
.word ActionExclamationBox0
.word ActionExclamationBox1
.word ActionExclamationBox2
.word ActionExclamationBox3
.word ActionExclamationBox4
.word ActionExclamationBox5

glabel D_8032FCD8
# Unknown region 0EACD8-0EAD08 [30]
.byte 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x01, 0x00, 0x00, 0x82, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00
.byte 0x01, 0x40, 0x00, 0x38, 0x07, 0x01, 0x14, 0x74, 0x01, 0x9A, 0x00, 0x3C, 0x07, 0x02, 0xB6, 0x5C
.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0xDC, 0x0F, 0xA0, 0x00, 0x00, 0x00, 0x00

glabel TableTweesterActions
.word ActionTweester0
.word ActionTweester1
.word ActionTweester2

glabel D_8032FD14
# Unknown region 0EAD14-0EAD38 [24]
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x00, 0x00, 0x8C, 0x00, 0x50, 0x00, 0x28, 0x00, 0x3C
.byte 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x6E, 0x00, 0xD2, 0xFF, 0x2E, 0x00, 0x46
.byte 0xFF, 0x2E, 0x00, 0x00

glabel TableBooActions
.word ActionBoo0
.word ActionBoo1
.word ActionBoo2
.word ActionBoo3
.word ActionBoo4
.word ActionBoo5

glabel TableBooGivingStarActions
.word ActionBooGivingStar0
.word ActionBooGivingStar1
.word ActionBooGivingStar2
.word ActionBooGivingStar3
.word ActionBooGivingStar4

glabel TableBooWithCageActions
.word ActionBooWithCage0
.word ActionBooWithCage1
.word ActionBooWithCage2
.word ActionBooWithCage3

glabel D_8032FD74
# Unknown region 0EAD74-0EAD84 [10]
.byte 0x00, 0x00, 0x80, 0x00, 0x00, 0x01, 0x01, 0x03, 0x00, 0x82, 0x00, 0x46, 0x00, 0x5A, 0x00, 0x3C

glabel TableWhompActions
.word ActionWhomp0
.word ActionWhomp1
.word ActionWhomp2
.word ActionWhomp3
.word ActionWhomp4
.word ActionWhomp5
.word ActionWhomp6
.word ActionWhomp7
.word ActionWhomp8
.word ActionWhomp9

# Unknown region 0EADAC-0EFA50 [4CA4]
glabel D_8032FDAC
	.incbin "bin/sm64.j.0EADAC.bin", 0x0, 0x48

glabel D_8032FDF4
	.incbin "bin/sm64.j.0EADAC.bin", 0x48, 0x48

glabel D_8032FE3C
	.incbin "bin/sm64.j.0EADAC.bin", 0x90, 0x10

glabel D_8032FE4C
	.incbin "bin/sm64.j.0EADAC.bin", 0xA0, 0x74

glabel D_8032FEC0
	.incbin "bin/sm64.j.0EADAC.bin", 0x114, 0x14

glabel gMarioPlatform
	.incbin "bin/sm64.j.0EADAC.bin", 0x128, 0xC